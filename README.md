# Add Forge Now Requests

[![pipeline status](https://gitlab.softwareheritage.org/swh/infra/add-forge-now-requests/badges/main/pipeline.svg)](https://gitlab.softwareheritage.org/swh/infra/add-forge-now-requests/-/commits/main)

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
     -F "variables[REQUEST_ID]=$REQUEST_ID"
"$GITLAB_URL/api/v4/projects/$PROJECT_ID/trigger/pipeline"
```

## Requests processing history

| Instance Name    | Lister Type       | Last Visit Status | Visit Date     | Issue ID     |
|------------------|-------------------|-------------------|----------------|--------------|
| git.bluemosh.com | gitlab | unsuccessful | 2023-10-18 08:44:44 +0000UTC | #3 |
| gitea.angry.im | gitea | unsuccessful | 2023-10-18 09:59:50 +0000UTC | #4 |
| gitea.angry.im | gitea | unsuccessful | 2023-10-18 13:32:30 +0000UTC | #5 |
| gitea.angry.im | gitea | unsuccessful | 2023-10-18 13:50:09 +0000UTC | #6 |
| gitea.angry.im | gitea | unsuccessful | 2023-10-20 15:06:23 +0000UTC | #8 |
| gitea.moe | gitea | unsuccessful | 2023-10-20 15:30:11 +0000UTC | #9 |
| git.armaanb.net | gitweb | successful | 2023-10-23 09:31:10 +0000UTC | #10 |
| git.dotslashplay.it | cgit | unsuccessful | 2023-10-23 10:12:29 +0000UTC | #11 |
| gitea.elara.ws | gitea | successful | 2023-10-23 13:33:42 +0000UTC | #13 |
| git.einval.com | gitweb | successful | 2023-10-23 17:38:33 +0000UTC | #15 |
| git.dynare.org | gitlab | successful | 2023-10-24 07:28:49 +0000UTC | #14 |
