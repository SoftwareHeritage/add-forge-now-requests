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
| git.taler.net | cgit | successful | 2024-01-04 23:05:28 +0000UTC | #160 |
| git.ralph.or.at | gitlab | successful | 2024-01-04 23:06:29 +0000UTC | #163 |
| gitlab.onelab.info | gitlab | successful | 2024-01-05 00:35:39 +0000UTC | #161 |
| git.cgsecurity.org | cgit | successful | 2024-01-06 13:06:57 +0000UTC | #165 |
| gitlab.kitware.com | gitlab | successful | 2024-01-06 14:40:01 +0000UTC | #159 |
| git.dawidpotocki.com | cgit | successful | 2024-01-06 15:49:57 +0000UTC | #166 |
| gitea.va.reichard.io | gitea | successful | 2024-01-06 15:50:11 +0000UTC | #167 |
| git.laquadrature.net | gitlab | successful | 2024-01-06 16:10:04 +0000UTC | #168 |
| git.2li.ch | gitea | successful | 2024-01-06 16:25:04 +0000UTC | #170 |
| git.cryptech.is | cgit | successful | 2024-01-06 17:48:30 +0000UTC | #172 |
| git.datacontroller.io | gitea | successful | 2024-01-08 15:14:49 +0000UTC | #174 |
| git.alexwennerberg.com | stagit | successful | 2024-01-08 15:21:31 +0000UTC | #173 |
| git.distrust.co | gitea | successful | 2024-01-08 16:49:57 +0000UTC | #176 |
| gitlab.fsinf.at | gitlab | successful | 2024-02-06 10:22:10 +0000UTC | #179 |
| gitlab.eurecom.fr | gitlab | successful | 2024-02-06 14:30:29 +0000UTC | #177 |
| gitlab.hrz.tu-chemnitz.de | gitlab | unsuccessful | 2024-02-06 15:55:59 +0000UTC | #183 |
| gitlab.fusiondirectory.org | gitlab | successful | 2024-02-06 17:42:40 +0000UTC | #180 |
| gitlab.futo.org | gitlab | successful | 2024-02-06 18:53:00 +0000UTC | #181 |
| gitlab.ics.muni.cz | gitlab | unsuccessful | 2024-02-06 19:30:25 +0000UTC | #184 |
| gitlab.exherbo.org | gitlab | successful | 2024-02-06 20:32:23 +0000UTC | #178 |
| gitlab.hrz.tu-chemnitz.de | gitlab | successful | 2024-02-06 23:44:29 +0000UTC | #183 |
| gitlab.ics.muni.cz | gitlab | successful | 2024-02-07 08:14:12 +0000UTC | #184 |
| gitlab.libresilicon.com | gitlab | unsuccessful | 2024-02-07 09:39:54 +0000UTC | #188 |
| gitlab.kwant-project.org | gitlab | successful | 2024-02-07 17:26:00 +0000UTC | #187 |
| gitlab.linphone.org | gitlab | successful | 2024-02-07 18:23:18 +0000UTC | #189 |
| gitlab.haskell.org | gitlab | unsuccessful | 2024-02-07 19:38:42 +0000UTC | #182 |
| gitlab.iqrf.org | gitlab | unsuccessful | 2024-02-07 19:38:43 +0000UTC | #186 |
| gitlab.lis-lab.fr | gitlab | unsuccessful | 2024-02-07 19:38:44 +0000UTC | #190 |
| gitlab.incom.co | gitlab | successful | 2024-02-07 19:38:46 +0000UTC | #185 |
| gitlab.haskell.org | gitlab | successful | 2024-02-08 08:00:38 +0000UTC | #182 |
| gitlab.iqrf.org | gitlab | successful | 2024-02-08 08:06:03 +0000UTC | #186 |
| gitlab.lms.tf.fau.de | gitlab | successful | 2024-02-08 10:06:42 +0000UTC | #191 |
| gitlab.met.fu-berlin.de | gitlab | successful | 2024-02-08 14:36:34 +0000UTC | #195 |
| gitlab.metager.de | gitlab | successful | 2024-02-08 15:25:14 +0000UTC | #194 |
| gitlab.lis-lab.fr | gitlab | successful | 2024-02-08 15:48:28 +0000UTC | #190 |
