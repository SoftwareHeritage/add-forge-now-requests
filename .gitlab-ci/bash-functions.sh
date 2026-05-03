set -euo pipefail

EOL=$'\r\n'

check_network_ports () {
    SCHEDULER_URLS=$(awk '/^[[:space:]]*url:/{print $2}' /etc/swh/scheduler-*.yml)
    for url in "$STAGING_AMQP_URL" "$PRODUCTION_AMQP_URL"
    do
        domain_name=$(awk -F '/' '{split($3,a,":");print a[1]}' <<< "$url")
        echo -e "\n# $domain_name 5672 #"
        nc -zv "$domain_name" 5672
    done
    for url in "$STAGING_AMQP_URL" "$PRODUCTION_AMQP_URL" \
        "$WEBAPP_URL" "$OIDC_URL" "$FORGE_URL" $SCHEDULER_URLS
    do
        echo -e "\n# $url #"
        curl -fsSI --connect-timeout 5 "$url" | \
        grep '^HTTP/\(1\.1\|2\)[[:space:]]*\(2..\|3..\)'
    done
}

gitlab_close_issue () {
    curl -s -X PUT -H "PRIVATE-TOKEN: ${ADD_FORGE_NOW_ISSUE_TOKEN}" \
    "${GITLAB_URL}/api/v4/projects/${PROJECT_ID}/issues/${ISSUE_ID}?state_event=close" |
    jq
}

gitlab_commit_readme_history () {
    trap "rm README.new" EXIT
    local STATUS=$1
    local VISIT_DATE ; VISIT_DATE=$(date "+%F %T %z%Z")
    curl -s -H "PRIVATE_TOKEN: ${ADD_FORGE_NOW_ISSUE_TOKEN}" \
    "${GITLAB_URL}/api/v4/projects/${PROJECT_ID}/repository/files/README.md?ref=main" | \
    jq -r .content | base64 -d > README.new
    echo "| ${INSTANCE_NAME} | ${LISTER_TYPE} | ${STATUS} | ${VISIT_DATE} | #${ISSUE_ID} |" >> README.new
    curl -s -X POST \
     -F "branch=main" \
     -F "commit_message=🤖 process ${STATUS}ly ${INSTANCE_NAME}" \
     -F "actions[][action]=update" \
     -F "actions[][file_path]=README.md" \
     -F "actions[][content]=<README.new" \
     -H "PRIVATE-TOKEN: ${ADD_FORGE_NOW_ISSUE_TOKEN}" \
    "${GITLAB_URL}/api/v4/projects/${PROJECT_ID}/repository/commits" |
    jq
}

gitlab_create_issue () {
    if [ -z "${REQUEST_ID+unset}" ]; then
        local -x DESCRIPTION="No add-forge-now request associated with this pipeline."
    else
        local -x DESCRIPTION="${WEBAPP_URL}/admin/add-forge/request/${REQUEST_ID}/"
    fi
    local -x TITLE="[Add Forge Now] process https://${INSTANCE_NAME}"
    local -x LABELS="AddForgeNow"
    DESCRIPTION+="  ${EOL}Type: ${LISTER_TYPE}"
    local URL="${GITLAB_URL}/api/v4/projects/${PROJECT_ID}/issues"
    URL+='?title={{TITLE:url}}'
    URL+='&labels={{LABELS:url}}'
    URL+='&description={{DESCRIPTION:url}}'
    URL+='&milestone_id={{MILESTONE_ID:url}}'
    ISSUE_ID=$(curl -s -X POST -H "PRIVATE-TOKEN: ${ADD_FORGE_NOW_ISSUE_TOKEN}" \
    --variable %TITLE --variable %LABEL --variable %DESCRIPTION --variable %MILESTONE_ID \
    --expand-url "$URL" \
    | jq '.iid')
    export ISSUE_ID=$ISSUE_ID
}

gitlab_update_issue () {
    local STATUS=$1
    local MID_MSG=" in ${ENV} environment.  ${EOL}"
    local END_MSG="For the pipeline details, see:  ${EOL}${CI_PIPELINE_URL}."
    local SUCCESS_MSG="Request successfully processed"
    local FAILED_MSG="Request completly messed up"
    [ "$STATUS" = "success" ] && local -x COMMENT="${SUCCESS_MSG}${MID_MSG}${END_MSG}"
    [ "$STATUS" = "failure" ] && local -x COMMENT="${FAILED_MSG}${MID_MSG}${END_MSG}"
    curl -s -X POST -H "PRIVATE-TOKEN: ${ADD_FORGE_NOW_ISSUE_TOKEN}" \
    --variable %COMMENT --expand-url \
    "${GITLAB_URL}/api/v4/projects/${PROJECT_ID}/issues/${ISSUE_ID}/notes?body={{COMMENT:url}}" |
    jq
}

gitlab_update_var () {
    local VAR_NAME=$1
    local VAR_VALUE=$2
    curl -s -X PUT -H "PRIVATE-TOKEN: $ADD_FORGE_NOW_ISSUE_TOKEN" \
    -F "value=$VAR_VALUE" \
    "${GITLAB_URL}/api/v4/projects/${PROJECT_ID}/variables/${VAR_NAME}" > /dev/null
}

print_date () {
    local STATUS=$1
    printf "%s at: %s\n" "$STATUS" "$(date "+%F %T %z%Z")"
}

# FIXME: remove once listers accept forge URLs instead of API URLs
workaround_listers () {
    case "$LISTER_TYPE" in
        gitlab | heptapod)
            LISTER_URL="${FORGE_URL%/}/api/v4"
        ;;
        gogs | gitea | forgejo)
            LISTER_URL="${FORGE_URL%/}/api/v1"
        ;;
        *)
            LISTER_URL="${FORGE_URL}"
        ;;
    esac
    export LISTER_URL
}

register_vars () {
    local ENV=$1
    local SWH_CONFIG_FILENAME=${ENV^^}_CONFIG_FILENAME
    {
        echo "ENV=$ENV"
        echo "ISSUE_ID=$ISSUE_ID"
        # FIXME: remove once listers accept forge URLs instead of API URLs
        echo "LISTER_URL=$LISTER_URL"
        echo "SWH_CONFIG_FILENAME=${!SWH_CONFIG_FILENAME}"
    } > build.env
}

register_this_job_as_last_job () {
    {
        echo "CI_LAST_JOB_NAME=$CI_JOB_NAME"
        echo "CI_LAST_JOB_STAGE=$CI_JOB_STAGE"
        echo "CI_LAST_JOB_URL=$CI_JOB_URL"
    } > last_job.env
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
    url="$LISTER_URL" \
    instance="$INSTANCE_NAME"
    sleep "$LISTING_DELAY"
}

#scheduler_register_lister () {
#    ARGS=( url="$LISTER_URL" )
#    ARGS+=( instance="$INSTANCE_NAME" )
#    [ "$ENV" == 'staging' ] && ARGS+=( max_pages=1 )
#    swh scheduler --config-file "$SWH_CONFIG_FILENAME" \
#    add-forge-now --preset "$ENV" \
#    register-lister "$LISTER_TYPE" \
#    "${ARGS[@]}"
#    sleep "$LISTING_DELAY"
#}

scheduler_schedule_first_visits () {
    swh scheduler --config-file "$SWH_CONFIG_FILENAME" \
    add-forge-now --preset "$ENV" \
    schedule-first-visits \
    --type-name git \
    --lister-name "$LISTER_TYPE" \
    --lister-instance-name "$INSTANCE_NAME"
}

webapp_check_token () {
    if [ -z "${REQUEST_ID+unset}" ]; then
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
    if [ -z "${REQUEST_ID+unset}" ]; then
        echo "No AFN request so no comment."
    else
        local -x COMMENT="For details, see ${GITLAB_URL}/swh/infra/${PROJECT_NAME}/-/issues/${ISSUE_ID}."
        if [ "$#" -eq 1 ]; then
            local -x STATUS="$1"
        fi
        local JSON ; JSON=$(jq -n '.text = env.COMMENT | if env.STATUS then .new_status = env.STATUS end')
        curl -s --json "$JSON" \
        -H "Authorization: Bearer $WEBAPP_TOKEN" \
        "${WEBAPP_URL}/api/1/add-forge/request/${REQUEST_ID}/update/" |
        # copy of swh-web AddForgeNowRequestPublicSerializer.Meta.fields
        jq '{id, forge_url, forge_type, status, submission_date}'
    fi
}
