# Add Forge Now Requests

[![pipeline status](https://gitlab.softwareheritage.org/swh/infra/add-forge-now-requests/badges/main/pipeline.svg)](https://gitlab.softwareheritage.org/swh/infra/add-forge-now-requests/-/commits/main)
[![SWH](https://archive.softwareheritage.org/badge/origin/https://gitlab.softwareheritage.org/swh/infra/add-forge-now-requests/)](https://archive.softwareheritage.org/browse/origin/?origin_url=https://gitlab.softwareheritage.org/swh/infra/add-forge-now-requests)

## Trigger pipeline manually

```bash
ᐅ TOKEN=xxxxxxxx
ᐅ REF_NAME=main
ᐅ LISTER_TYPE=gitlab
ᐅ INSTANCE_NAME="git.bluemosh.com"
ᐅ REQUEST_ID=14
ᐅ GITLAB_URL=https://gitlab.softwareheritage.org
ᐅ PROJECT_ID=474
ᐅ curl -X POST \
     --fail \
     -F "token=$TOKEN" \
     -F "ref=$REF_NAME" \
     -F "variables[LISTER_TYPE]=$LISTER_TYPE" \
     -F "variables[INSTANCE_NAME]=$INSTANCE_NAME" \
     -F "variables[REQUEST_ID]=$REQUEST_ID" \
"$GITLAB_URL/api/v4/projects/$PROJECT_ID/trigger/pipeline"
```

> You can omit the `REQUEST_ID` variable if there is no associated request on the web archive.

## Requests processing history

> [Requests processing history 2023](.notes/Requests_processing_2023.md)  
> [Requests processing history 2024](.notes/Requests_processing_2024.md)

| Instance Name    | Lister Type       | Last Visit Status | Visit Date     | Issue ID     |
|------------------|-------------------|-------------------|----------------|--------------|