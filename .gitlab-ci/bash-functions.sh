set -euo pipefail

check_network_ports () {
    SCHEDULER_URLS=$(awk '/^[[:space:]]*url:/{print $2}' /etc/swh/scheduler-*.yml)
    for url in "$STAGING_AMQP_URL" "$PRODUCTION_AMQP_URL"
    do
        domain_name=$(awk -F '/' '{split($3,a,":");print a[1]}' <<< "$url")
        echo -e "\n# $domain_name 5672 #"
        nc -zv "$domain_name" 5672
    done
    for url in "$STAGING_AMQP_URL" "$PRODUCTION_AMQP_URL" \
        "$WEBAPP_URL" "$OIDC_URL" "https://${INSTANCE_NAME}" $SCHEDULER_URLS
    do
        echo -e "\n# $url #"
        curl -sI --connect-timeout 5 "$url" | \
        grep '^HTTP/\(1\.1\|2\)[[:space:]]*\(2..\|3..\)'
    done
}

gitlab_close_issue () {
    curl -s -X PUT -H "PRIVATE-TOKEN: ${ADD_FORGE_NOW_ISSUE_TOKEN}" \
    "${GITLAB_URL}/api/v4/projects/${PROJECT_ID}/issues/${ISSUE_ID}?state_event=close"
}

gitlab_commit_readme_history () {
    trap "rm README.new" EXIT
    local STATUS=$1
    local VISIT_DATE=$(date "+%F %T %z%Z")
    curl -s -H "PRIVATE_TOKEN: ${ADD_FORGE_NOW_ISSUE_TOKEN}" \
    "${GITLAB_URL}/api/v4/projects/${PROJECT_ID}/repository/files/README.md?ref=main" | \
    jq -r .content | base64 -d > README.new
    echo "| ${INSTANCE_NAME} | ${LISTER_TYPE} | ${STATUS} | ${VISIT_DATE} | #${ISSUE_ID} |" >> README.new
    curl -s -X POST \
     -F "branch=main" \
     -F "commit_message=afnr: 🤖 process ${STATUS}ly ${INSTANCE_NAME}" \
     -F "actions[][action]=update" \
     -F "actions[][file_path]=README.md" \
     -F "actions[][content]=<README.new" \
     -H "PRIVATE-TOKEN: ${ADD_FORGE_NOW_ISSUE_TOKEN}" \
    "${GITLAB_URL}/api/v4/projects/${PROJECT_ID}/repository/commits"
}

gitlab_create_issue () {
if [ -z ${REQUEST_ID+x} ]; then
    local DESCRIPTION="No%20add-forge-now%20request%20associated%20with%20this%20pipeline%2E"
else
    local DESCRIPTION="${WEBAPP_URL}/admin/add-forge/request/${REQUEST_ID}/"
fi
ISSUE_ID=$(curl -s -X POST -H "PRIVATE-TOKEN: ${ADD_FORGE_NOW_ISSUE_TOKEN}" \
"${GITLAB_URL}/api/v4/projects/${PROJECT_ID}/issues?\
title=%5BAdd%20Forge%20Now%5D%20process%20https%3A%2F%2F${INSTANCE_NAME}&\
labels=AddForgeNow&description=${DESCRIPTION}\
%20%20%0D%0AType%3A%20${LISTER_TYPE}&\
milestone_id=${MILESTONE_ID}" \
| jq '.iid')
export ISSUE_ID=$ISSUE_ID
}

gitlab_update_issue () {
    local STATUS=$1
    local MID_MSG="%20in%20${ENV}%20environment%2E%20%20%0D%0A"
    local END_MSG="For%20the%20pipeline%20details%2C%20see%3A%20%20%0D%0A${CI_PIPELINE_URL}%2E"
    local SUCCESS_MSG="Request%20successfully%20processed"
    local FAILED_MSG="Request%20completly%20messed%20up"
    [ "$STATUS" = "success" ] && local COMMENT="${SUCCESS_MSG}${MID_MSG}${END_MSG}"
    [ "$STATUS" = "failure" ] && local COMMENT="${FAILED_MSG}${MID_MSG}${END_MSG}"
    curl -s -X POST -H "PRIVATE-TOKEN: ${ADD_FORGE_NOW_ISSUE_TOKEN}" \
    "${GITLAB_URL}/api/v4/projects/${PROJECT_ID}/issues/${ISSUE_ID}/notes?body=${COMMENT}"
}

gitlab_update_var () {
    local VAR_NAME=$1
    local VAR_VALUE=$2
    curl -s -X PUT -H "PRIVATE-TOKEN: $ADD_FORGE_NOW_ISSUE_TOKEN" \
    -F "value=$VAR_VALUE" \
    "${GITLAB_URL}/api/v4/projects/${PROJECT_ID}/variables/${VAR_NAME}" > /dev/null
}

register_vars () {
    local ENV=$1
    local SWH_CONFIG_FILENAME=${ENV^^}_CONFIG_FILENAME
    echo "ENV=$ENV" > build.env
    echo "ISSUE_ID=$ISSUE_ID" >> build.env
    echo "SWH_CONFIG_FILENAME=${!SWH_CONFIG_FILENAME}" >> build.env
}

scheduler_check_ingested_origins () {
    ARGS=(-l -w)
    [[ "$ENV" == "staging" ]] && ARGS+=( --watch-period '10m')
    swh scheduler --config-file "$SWH_CONFIG_FILENAME" \
    origin check-ingested-origins "${ARGS[@]}" \
    "$LISTER_TYPE" "$INSTANCE_NAME"
}

scheduler_check_listed_origins () {
    swh scheduler --config-file "$SWH_CONFIG_FILENAME" \
    origin check-listed-origins -l \
    "$LISTER_TYPE" "$INSTANCE_NAME"
}

scheduler_check_success_rate () {
    success_rate=$(swh scheduler --config-file "$SWH_CONFIG_FILENAME" \
    origin check-ingested-origins \
    "$LISTER_TYPE" "$INSTANCE_NAME" | \
    awk '/success rate:/{split($3,a,".");print a[1]}')
    if [ "$success_rate" -lt "$INGESTION_SUCCESS_LIMIT" ]; then
        echo "There are too many ingestion failures."
        exit 1
    fi
}

scheduler_register_lister () {
    swh scheduler --config-file "$SWH_CONFIG_FILENAME" \
    add-forge-now --preset "$ENV" \
    register-lister "$LISTER_TYPE" \
    instance="$INSTANCE_NAME"
    sleep "$LISTING_DELAY"
}

#scheduler_register_lister () {
#  ARGS=( instance="$INSTANCE_NAME" )
#  [ "$ENV" == 'staging' ] && ARGS+=( max_pages=1 )
#  swh scheduler --config-file "$SWH_CONFIG_FILENAME" \
#  add-forge-now --preset "$ENV" \
#  register-lister "$LISTER_TYPE" \
#  "${ARGS[@]}"
#  sleep "$LISTING_DELAY"
#  }

scheduler_schedule_first_visits () {
    swh scheduler --config-file "$SWH_CONFIG_FILENAME" \
    add-forge-now --preset "$ENV" \
    schedule-first-visits \
    --type-name git \
    --lister-name "$LISTER_TYPE" \
    --lister-instance-name "$INSTANCE_NAME"
}

webapp_check_token () {
    if [ -z ${REQUEST_ID+x} ]; then
        echo "No AFN request so need to check token."
    else
        if curl -s -H 'Content-Type: application/json' \
        -H "Authorization: Bearer $WEBAPP_TOKEN" \
        "${WEBAPP_URL}/api/1/add-forge/request/${REQUEST_ID}/get/" | \
        grep -q "AuthenticationFailed"
        then
            NEW_WEBAPP_TOKEN=$(swh auth \
            --oidc-server-url "$OIDC_URL" \
            --realm-name "$OIDC_REALM" \
            generate-token "$WEBAPP_USER" \
            --password "$WEBAPP_PASSWORD")
            gitlab_update_var WEBAPP_TOKEN "$NEW_WEBAPP_TOKEN" && \
            echo "Webapp token has been regenerated."
        else
            echo "Webapp token is valid."
        fi
    fi
}

webapp_comment_and_status () {
    if [ -z ${REQUEST_ID+x} ]; then
        echo "No AFN request so no comment."
    else
        local COMMENT="For details, see ${GITLAB_URL}/swh/infra/${PROJECT_NAME}/-/issues/${ISSUE_ID}."
        if [ "$#" -eq 0 ]; then
            local TEXT="${COMMENT}"
        elif [ "$#" -eq 1 ]; then
            local TEXT="${COMMENT}\",\"new_status\":\"${1}"
        fi
        curl -s -H 'Content-Type: application/json' \
        -H "Authorization: Bearer $WEBAPP_TOKEN" \
        -d "{\"text\":\"${TEXT}\"}" \
        "${WEBAPP_URL}/api/1/add-forge/request/${REQUEST_ID}/update/"
    fi
}
