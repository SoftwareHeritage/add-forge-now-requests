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

> [Requests processing history 2023](.notes/Requests_processing_2023.md)

| Instance Name    | Lister Type       | Last Visit Status | Visit Date     | Issue ID     |
|------------------|-------------------|-------------------|----------------|--------------|
| gitlab.dkrz.de | gitlab | successful | 2024-01-01 00:38:51 +0000UTC | #146 |
| gitlab.dragonflyaerospace.com | gitlab | successful | 2024-01-01 14:03:44 +0000UTC | #149 |
| gitlab.cecs.anu.edu.au | gitlab | successful | 2024-01-01 14:12:56 +0000UTC | #147 |
| gitlab.dune-project.org | gitlab | successful | 2024-01-01 18:04:08 +0000UTC | #150 |
| gitlab.ebi.ac.uk | gitlab | successful | 2024-01-02 12:55:18 +0000UTC | #151 |
| gitlab.esrf.fr | gitlab | successful | 2024-01-02 17:50:56 +0000UTC | #152 |
| gitlab.eif.urjc.es | gitlab | successful | 2024-01-02 18:34:05 +0000UTC | #153 |
| gitlab.fi.muni.cz | gitlab | successful | 2024-01-03 05:39:19 +0000UTC | #154 |
| gitlab.ub.uni-bielefeld.de | gitlab | successful | 2024-01-03 08:26:37 +0000UTC | #148 |
| gitlab.fuss.bz.it | gitlab | successful | 2024-01-03 09:06:44 +0000UTC | #155 |
| salsa.debian.org | gitlab | successful | 2024-01-03 11:22:13 +0000UTC | #156 |
| gitlab.linux.community | gitlab | successful | 2024-01-03 11:26:07 +0000UTC | #157 |
| gitlab.lisn.upsaclay.fr | gitlab | successful | 2024-01-03 12:17:55 +0000UTC | #158 |
| gitlab.pyicu.org | gitlab | successful | 2024-01-04 22:46:22 +0000UTC | #162 |
