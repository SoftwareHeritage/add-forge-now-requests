set -euo pipefail

EOL=$'\r\n'

check_network_ports () {
    mapfile -t SCHEDULER_URLS < <(awk '/^[[:space:]]*url:/{print $2}' /etc/swh/scheduler-*.yml)
    for url in "$STAGING_AMQP_URL" "$PRODUCTION_AMQP_URL"
    do
        domain_name=$(awk -F '/' '{split($3,a,":");print a[1]}' <<< "$url")
        echo -e "\n# $domain_name 5672 #"
        nc -zv "$domain_name" 5672
    done
    for url in "$STAGING_AMQP_URL" "$PRODUCTION_AMQP_URL" \
        "$WEBAPP_URL" "$OIDC_URL" "${SCHEDULER_URLS[@]}"
    do
        echo -e "\n# $url #"
        curl -fsSI --retry 5 --connect-timeout 5 "$url" | \
        grep '^HTTP/\(1\.1\|2\)[[:space:]]*\(2..\|3..\)'
    done
}

gitlab_create_issue () {
    if [ -z "${REQUEST_ID+unset}" ]; then
        local -x DESCRIPTION="No add-forge-now request associated with this pipeline.  ${EOL}"
    else
        local -x DESCRIPTION="Request: #[${REQUEST_ID}](${WEBAPP_URL}/admin/add-forge/request/${REQUEST_ID}/)  ${EOL}"
    fi
    DESCRIPTION+="Type: ${LISTER_TYPE}  ${EOL}"
    DESCRIPTION+="URL: ${FORGE_URL}  ${EOL}"
    DESCRIPTION+="Pipeline: #[${CI_PIPELINE_ID}](${CI_PIPELINE_URL})  ${EOL}"
    if [ -z "${ISSUE_ID+unset}" ]; then
        local -x TITLE="[Add Forge Now] process ${INSTANCE_NAME}"
        local -x LABELS="AddForgeNow"
        local URL="${GITLAB_URL}/api/v4/projects/${PROJECT_ID}/issues"
        URL+='?title={{TITLE:url}}'
        URL+='&labels={{LABELS:url}}'
        URL+='&description={{DESCRIPTION:url}}'
        URL+='&milestone_id={{MILESTONE_ID:url}}'
        local RESPONSE=gitlab-create-issue-response.json
        curl -s -X POST -H "PRIVATE-TOKEN: ${ADD_FORGE_NOW_ISSUE_TOKEN}" \
        --variable %TITLE --variable %LABELS --variable %DESCRIPTION --variable %MILESTONE_ID \
        --expand-url "$URL" |
        tee "$RESPONSE" |
        jq
        ISSUE_ID="$(jq --raw-output '.iid' < "$RESPONSE")"
        ISSUE_URL="$(jq --raw-output '.web_url' < "$RESPONSE")"
        rm -f "$RESPONSE"
    else
        local URL="${GITLAB_URL}/api/v4/projects/${PROJECT_ID}/issues/${ISSUE_ID}"
        local RESPONSE=gitlab-update-issue-response.json
        curl -s -X POST -H "PRIVATE-TOKEN: ${ADD_FORGE_NOW_ISSUE_TOKEN}" "$URL" \
        tee "$RESPONSE" |
        jq
        ISSUE_URL="$(jq --raw-output '.web_url' < "$RESPONSE")"
        rm -f "$RESPONSE"
        local -x COMMENT="[Add Forge Now] reprocess ${INSTANCE_NAME}  ${EOL}"
        COMMENT+="$DESCRIPTION"
        COMMENT+="/reopen${EOL}" # Ensure issue is open
        curl -s -X POST -H "PRIVATE-TOKEN: ${ADD_FORGE_NOW_ISSUE_TOKEN}" \
        --variable %COMMENT --expand-url \
        "${GITLAB_URL}/api/v4/projects/${PROJECT_ID}/issues/${ISSUE_ID}/notes?body={{COMMENT:url}}" |
        jq
    fi
    export ISSUE_ID ISSUE_URL
}

gitlab_update_issue () {
    local STATUS="$CI_JOB_STATUS"
    local LABELS=()
    local MID_MSG=" in the ${ENV} environment.  ${EOL}"
    local END_MSG="See the [pipeline](${CI_PIPELINE_URL}) for details.  ${EOL}"
    local CI_JOB="[${CI_JOB_STAGE} ${CI_JOB_NAME} job](${CI_JOB_URL})"
    local CI_JOB_TXT="${CI_JOB_STAGE} ${CI_JOB_NAME} job ${CI_JOB_URL}"
    local SUCCESS_MSG="Request successfully processed"
    local FAILED_MSG="Request failed in ${CI_JOB}.  ${EOL}"
    local CANCELLED_MSG="Request cancelled in ${CI_JOB}.  ${EOL}"
    # TODO: show significant errors from the job
    [ "$STATUS" = "success" ] && local -x COMMENT="${SUCCESS_MSG}${MID_MSG}"
    [ "$STATUS" = "failure" ] && local -x COMMENT="${FAILED_MSG}"
    [ "$STATUS" = "cancelled" ] && local -x COMMENT="${CANCELLED_MSG}"
    # Keep the issue open by default
    local CLOSE_ISSUE=0
    # Change the comment if success in production was not total
    if [ "$ENV" = "production" ] && [ "$STATUS" = "success" ] ; then

        # Gather status of ingested origins again
        scheduler_check_ingested_origins &> log

        # Extract counts for all visit status types
        < log \
        sed \
            -n \
            -E '/^Forge .* scheduler\.$/,${/:/p}' \
        > counts

        # Extract the success and total counts
        SUCCESS="$(sed -n 's/^successful *: *//p' counts)"
        TOTAL="$(sed -n 's/^total *: *//p' counts)"

        # Check if some origin visits were not successful
        if [ "$SUCCESS" -ne "$TOTAL" ] ; then
            # Replace success comment because some were not successful
            COMMENT="Request partially successfully processed${MID_MSG}"
            COMMENT+=${EOL}

            # Transform the status counts into a table
            COMMENT+="The origin visit status counts:  ${EOL}"
            COMMENT+="$(< counts sed 's/^./\u&/;s/_/ /g;s/^/ /;s/ *:.*/ /' | tr '\n' '|' | sed 's/^/|/')${EOL}"
            COMMENT+="$(< counts sed 's/.*:.*/ - /' | tr '\n' '|' | sed 's/^/|/')${EOL}"
            COMMENT+="$(< counts sed 's/.*: */ /;s/$/ /' | tr '\n' '|' | sed 's/^/|/')${EOL}"
            COMMENT+=${EOL}

            # Extract table of origin visits that were not successful
            # and also transform it into Markdown format.
            < log \
            sed -n -E '
                /^url /,${
                    /^Forge .* scheduler\.$/,$b
                    s/^/| /
                    s/$/ |/
                    s/-  -/- | -/g
                    s/  ([^ ])/ | \1/g
                    s/url/URL/
                    s/last_visit_status/Status/
                    s/last_visit/Visit/
                    s/  +/ /g
                    s/ -+ / - /g
                    s/\.[0-9]+\+00:00//
                    / successful /d
                    p
                }
            ' \
            > table

            # Include the first few origins only
            HEADER=2
            MAX=10
            FIRST=$((HEADER+1))
            ROWS=$((HEADER+MAX))
            tail -n +$FIRST < table > origins
            COMMENT+="These origin visits were not successful:  ${EOL}"
            COMMENT+="$(head -n $ROWS table)${EOL}"
            BAD="$(wc -l < origins)"
            HIDDEN=$((BAD-MAX))
            if [ "$BAD" -gt $MAX ] ; then
                COMMENT+="| [${HIDDEN} more hidden](${CI_JOB_URL}). |${EOL}"
            fi
            COMMENT+=${EOL}

            LABELS+=(PartialSuccess)
        else
            LABELS+=(CompleteSuccess)
            # There was total success so close the issue
            CLOSE_ISSUE=1
        fi
    elif [ "$STATUS" = "failure" ] ; then
        case "${CI_JOB_NAME}" in
            02_check_ports_and_token)
                LABELS+=(InfraFailure)
            ;;
            03_comment_request)
                LABELS+=(WebFailure)
            ;;
            1*_register_lister|2*_check_listed_origins)
                LABELS+=(ListerFailure)
            ;;
            3*_schedule_first_visits|4*_check_ingested_origins)
                LABELS+=(LoaderFailure)
            ;;
            *)
                LABELS+=(UnknownFailure)
            ;;
        esac
    fi
    COMMENT+="${END_MSG}"
    if [ ${#LABELS[@]} -gt 0 ]; then
        COMMENT+="/label ${LABELS[*]}${EOL}"
    fi
    if [ "$CLOSE_ISSUE" -eq 1 ] ; then
        COMMENT+="/close${EOL}"
    fi
    if [ -z "${ISSUE_ID+unset}" ]; then
        echo "No GitLab issue set, request status is ${STATUS} in ${CI_JOB_TXT}"
    else
        curl -s -X POST -H "PRIVATE-TOKEN: ${ADD_FORGE_NOW_ISSUE_TOKEN}" \
        --variable %COMMENT --expand-url \
        "${GITLAB_URL}/api/v4/projects/${PROJECT_ID}/issues/${ISSUE_ID}/notes?body={{COMMENT:url}}" |
        jq
    fi
}

gitlab_update_var () {
    local VAR_NAME=$1
    local VAR_VALUE=$2
    curl -s -X PUT -H "PRIVATE-TOKEN: $ADD_FORGE_NOW_ISSUE_TOKEN" \
    -F "value=$VAR_VALUE" \
    "${GITLAB_URL}/api/v4/projects/${PROJECT_ID}/variables/${VAR_NAME}" > /dev/null
}

curlrc () {
    export CURL_HOME="$CI_PROJECT_DIR"
    {
        printf 'user-agent = "Software Heritage Add Forge Now pipeline for %s"' "$LISTER_TYPE"
    } > "$CURL_HOME/.curlrc"
}

print_status () {
    printf "Job %s %s status is now %s at %s\n" "$CI_JOB_STAGE" "$CI_JOB_NAME" "$CI_JOB_STATUS" "$(date "+%F %T %z%Z")"
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
            LISTER_URL="${FORGE_URL%/}/api/v1/"
        ;;
        phabricator | phorge)
            LISTER_URL="${FORGE_URL%/}/api/diffusion.repository.search"
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
        echo "ISSUE_URL=$ISSUE_URL"
        # FIXME: remove once listers accept forge URLs instead of API URLs
        echo "LISTER_URL=$LISTER_URL"
        if [ -n "${!SWH_CONFIG_FILENAME+set}" ] ; then
            echo "SWH_CONFIG_FILENAME=${!SWH_CONFIG_FILENAME}"
        fi
    } > build.env
}

scheduler () {
    swh scheduler --config-file "$SWH_CONFIG_FILENAME" "$@"
}

scheduler_list_task_runs () {
    scheduler task list \
    --after "$CI_PIPELINE_CREATED_AT" \
    --before "$(date --utc --iso-8601=seconds)" \
    --list-runs-metadata
}

scheduler_check_ingested_origins () {
    ARGS=(-l -w)
    [[ "$ENV" == "staging" ]] && ARGS+=( --watch-period '10m')
    ARGS+=( --minimum-success "$INGESTION_SUCCESS_LIMIT" )
    local ret=0
    scheduler origin check-ingested-origins "${ARGS[@]}" \
    "$LISTER_TYPE" "$INSTANCE_NAME" || ret=$?
    scheduler_list_task_runs || true
    return "$ret"
}

scheduler_check_listed_origins () {
    local ret=0
    scheduler origin check-listed-origins -l \
    "$LISTER_TYPE" "$INSTANCE_NAME" || ret=$?
    scheduler_list_task_runs || true
    return "$ret"
}

scheduler_register_lister () {
    local LISTER_TASK_ID
    LISTER_TASK_ID=$(scheduler add-forge-now --preset "$ENV" \
        register-lister "$LISTER_TYPE" \
        url="$LISTER_URL" \
        instance="$INSTANCE_NAME" | grep Task | head -1 | sed -r 's/Task ([0-9]+)/\1/g')
    export -f scheduler
    timeout "$LISTING_DELAY" bash -c \
        "until scheduler task list --task-id $LISTER_TASK_ID \
        --list-runs-metadata | grep -E \"ended: [0-9]+\"; do sleep 1; done" || true
}

#scheduler_register_lister () {
#    ARGS=( url="$LISTER_URL" )
#    ARGS+=( instance="$INSTANCE_NAME" )
#    [ "$ENV" == 'staging' ] && ARGS+=( max_pages=1 )
#    scheduler add-forge-now --preset "$ENV" \
#    register-lister "$LISTER_TYPE" \
#    "${ARGS[@]}"
#    sleep "$LISTING_DELAY"
#}

scheduler_schedule_first_visits () {
    scheduler add-forge-now --preset "$ENV" \
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
        local -x COMMENT="For details, see ${ISSUE_URL}."
        if [ "$ENV" = 'pre' ] && [ "$CI_JOB_NAME" = '03_comment_request' ] && [ "$CI_JOB_STATUS" = 'running' ] ; then
            echo "Adding AFN#${REQUEST_ID} request comment with no status change."
        elif [ "$ENV" = 'staging' ] && [ "$CI_JOB_NAME" = '4s_check_ingested_origins' ] && [ "$CI_JOB_STATUS" = 'success' ] ; then
            local -x STATUS='SCHEDULED'
            echo "Adding AFN#${REQUEST_ID} request comment with new status ${STATUS}."
        elif [ "$ENV" = 'production' ] && [ "$CI_JOB_NAME" = '4p_check_ingested_origins' ] && [ "$CI_JOB_STATUS" = 'success' ] ; then
            local -x STATUS='FIRST_ORIGIN_LOADED'
            echo "Adding AFN#${REQUEST_ID} request comment with new status ${STATUS}."
        else
            echo "No AFN#${REQUEST_ID} request comment/update for $ENV $CI_JOB_NAME $CI_JOB_STATUS"
            return
        fi
        local JSON ; JSON=$(jq -n '.text = env.COMMENT | .issue_id = env.ISSUE_ID | if env.STATUS then .new_status = env.STATUS end')
        curl -s --json "$JSON" \
        -H "Authorization: Bearer $WEBAPP_TOKEN" \
        "${WEBAPP_URL}/api/1/add-forge/request/${REQUEST_ID}/update/" |
        # copy of swh-web AddForgeNowRequestPublicSerializer.Meta.fields
        jq '{id, forge_url, forge_type, status, submission_date, issue_id}'
    fi
}
