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
| git.eyrie.org | gitweb | successful | 2023-10-25 08:18:15 +0000UTC | #16 |
| git.freesoftwareextremist.com | cgit | successful | 2023-10-26 08:31:27 +0000UTC | #17 |
| git.gnunet.org | cgit | successful | 2023-10-27 12:42:36 +0000UTC | #18 |
| git.congatec.com | gitlab | successful | 2023-10-30 08:59:42 +0000UTC | #19 |
| git.elektrollart.org | gitea | successful | 2023-10-30 09:31:50 +0000UTC | #20 |
| gitlab.e.foundation | gitlab | unsuccessful | 2023-10-30 11:13:27 +0000UTC | #22 |
| gitlab.raptorengineering.com | gitlab | unsuccessful | 2023-10-30 11:17:28 +0000UTC | #21 |
| gitlab.raptorengineering.com | gitlab | successful | 2023-10-31 20:39:58 +0000UTC | #21 |
| gitlab.xiph.org | gitlab | successful | 2023-11-02 08:57:59 +0000UTC | #23 |
| git.subdivi.de | cgit | successful | 2023-11-02 09:06:57 +0000UTC | #24 |
| g.blicky.net | cgit | unsuccessful | 2023-11-02 10:11:09 +0000UTC | #25 |
| code.blicky.net | gitea | unsuccessful | 2023-11-02 11:48:28 +0000UTC | #26 |
| gitlab.e.foundation | gitlab | successful | 2023-11-02 15:51:57 +0000UTC | #22 |
| git.spwhitton.name | cgit | unsuccessful | 2023-11-03 03:39:40 +0000UTC | #27 |
| gitlab.xfce.org | gitlab | successful | 2023-11-03 18:28:19 +0000UTC | #29 |
| source.denx.de | gitlab | unsuccessful | 2023-11-03 21:07:54 +0000UTC | #28 |
| gitlab.tails.boum.org | gitlab | successful | 2023-11-04 04:42:50 +0000UTC | #30 |
| git.0x90.space | gitea | successful | 2023-11-06 09:26:38 +0000UTC | #31 |
| git.rjp.is | gitea | successful | 2023-11-06 11:19:20 +0000UTC | #33 |
| git.enlightenment.org | gitea | successful | 2023-11-06 11:37:30 +0000UTC | #32 |
| git.glasklar.is | gitlab | successful | 2023-11-06 12:44:44 +0000UTC | #34 |
| git.kaliko.me | gitweb | successful | 2023-11-06 17:33:23 +0000UTC | #35 |
| git.stderr.nl | gitweb | successful | 2023-11-06 18:04:03 +0000UTC | #36 |
| git.gag.com | gitweb | unsuccessful | 2023-11-08 09:47:51 +0000UTC | #37 |
