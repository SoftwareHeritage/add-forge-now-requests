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
| git.lubuntu.me | gitea | successful | 2025-01-20 10:06:05 +0000UTC | #889 |
| git.redrise.ru | gitea | successful | 2025-01-20 17:57:17 +0000UTC | #890 |
| git.talhaamir.xyz | cgit | successful | 2025-01-21 10:14:48 +0000UTC | #891 |
| git.azuminha.com | cgit | successful | 2025-01-21 11:52:43 +0000UTC | #893 |
| git.omeckman.net | cgit | successful | 2025-01-21 12:11:46 +0000UTC | #892 |
| git.nihil.ws | cgit | successful | 2025-01-21 12:36:44 +0000UTC | #895 |
| git.alpaga.dev | gitea | successful | 2025-01-21 15:52:19 +0000UTC | #896 |
| git.tstarr.us | gitea | successful | 2025-01-21 16:23:07 +0000UTC | #897 |
| code.m3tam3re.com | gitea | successful | 2025-01-21 18:32:36 +0000UTC | #898 |
| gitea.ycharbi.fr | gitea | successful | 2025-01-23 09:43:46 +0000UTC | #900 |
| git.yourcmc.ru | gitea | successful | 2025-01-23 13:58:54 +0000UTC | #899 |
