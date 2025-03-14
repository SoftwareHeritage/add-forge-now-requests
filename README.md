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
| forge.le-florida.org | gitea | successful | 2025-02-18 09:34:54 +0000UTC | #907 |
| gitea.ykn.fr | gitea | successful | 2025-02-18 10:32:11 +0000UTC | #904 |
| git.poivron-robotique.fr | gitea | successful | 2025-02-18 10:34:20 +0000UTC | #906 |
| grond.iut-fbleau.fr | gitea | successful | 2025-02-18 10:35:23 +0000UTC | #908 |
| dev.lovelyhq.com | gitea | successful | 2025-02-18 11:56:25 +0000UTC | #909 |
| git.hadoly.fr | gitea | successful | 2025-02-18 11:57:22 +0000UTC | #910 |
| git.itsonus.fr | gitea | successful | 2025-02-18 11:58:10 +0000UTC | #911 |
| git.noise.rocks | gitea | successful | 2025-02-18 12:02:14 +0000UTC | #912 |
| git.tcharles.fr | gitea | successful | 2025-02-18 12:30:09 +0000UTC | #913 |
| git.sans.pub | gitea | successful | 2025-02-18 12:31:09 +0000UTC | #914 |
| git.chenpt.cn | gitea | successful | 2025-02-18 12:41:46 +0000UTC | #915 |
| git.math98.fr | gitea | successful | 2025-02-18 14:16:10 +0000UTC | #916 |
| git.vermeulen.pro | gitea | successful | 2025-02-18 14:43:28 +0000UTC | #905 |
| git.ashitaxi.com | gitea | successful | 2025-02-18 14:43:45 +0000UTC | #920 |
| git.tilera.org | gitea | successful | 2025-02-18 14:57:29 +0000UTC | #918 |
| git.abbiamoundominio.org | gitea | successful | 2025-02-18 14:57:53 +0000UTC | #922 |
| git.resf.org | gitea | successful | 2025-02-18 15:08:28 +0000UTC | #919 |
| git.marvid.fr | gitea | successful | 2025-02-18 15:45:19 +0000UTC | #921 |
| gitea.fhgr.ch | gitea | successful | 2025-02-18 16:04:38 +0000UTC | #924 |
| gitlab.hhi.fraunhofer.de | gitlab | unsuccessful | 2025-02-18 16:22:55 +0000UTC | #929 |
| gitlab.fit.fraunhofer.de | gitlab | successful | 2025-02-18 23:41:45 +0000UTC | #926 |
| gitlab.fokus.fraunhofer.de | gitlab | successful | 2025-02-19 00:02:44 +0000UTC | #927 |
| gitlab-extern.ivi.fraunhofer.de | gitlab | successful | 2025-02-19 00:22:09 +0000UTC | #928 |
| gitlab.hhi.fraunhofer.de | gitlab | successful | 2025-02-19 00:32:24 +0000UTC | #929 |
| git.nhenry.fr | gitea | successful | 2025-02-19 01:06:49 +0000UTC | #917 |
| vcgit.hhi.fraunhofer.de | gitlab | successful | 2025-02-19 02:22:51 +0000UTC | #930 |
| gitlab.scai.fraunhofer.de | gitlab | successful | 2025-02-19 02:26:21 +0000UTC | #933 |
| gitlab-ext.iosb.fraunhofer.de | gitlab | successful | 2025-02-19 02:56:08 +0000UTC | #932 |
| git.delaage.fr | gitea | successful | 2025-02-19 09:10:30 +0000UTC | #936 |
| gitlab.cc-asp.fraunhofer.de | gitlab | successful | 2025-02-19 09:52:10 +0000UTC | #925 |
| neemgit.informatik.uni-bremen.de | gitlab | successful | 2025-02-19 11:15:24 +0000UTC | #938 |
| gitlab.csl.uni-bremen.de | gitlab | successful | 2025-02-19 12:45:03 +0000UTC | #937 |
| cls-gitlab.phil.uni-wuerzburg.de | gitlab | successful | 2025-02-19 13:37:16 +0000UTC | #941 |
| core-gitlfs.tpi.uni-jena.de | gitlab | successful | 2025-02-19 13:56:30 +0000UTC | #944 |
| git.physik.uni-wuerzburg.de | gitlab | successful | 2025-02-19 14:16:33 +0000UTC | #940 |
| gitlab.informatik.uni-bremen.de | gitlab | successful | 2025-02-19 14:27:56 +0000UTC | #934 |
| git.tpi.uni-jena.de | gitlab | successful | 2025-02-19 15:08:20 +0000UTC | #942 |
| gitlab.igg.uni-bonn.de | gitlab | successful | 2025-02-19 15:23:19 +0000UTC | #946 |
| git.uni-jena.de | gitlab | successful | 2025-02-19 15:28:50 +0000UTC | #943 |
| git.ais.uni-bonn.de | gitlab | successful | 2025-02-19 15:42:19 +0000UTC | #947 |
| gl.kwarc.info | gitlab | successful | 2025-02-19 15:47:48 +0000UTC | #945 |
| ascgitlab.helmholtz-munich.de | gitlab | successful | 2025-02-19 16:08:52 +0000UTC | #948 |
| gitlab2.informatik.uni-wuerzburg.de | gitlab | successful | 2025-02-19 16:35:47 +0000UTC | #939 |
| git.uni-due.de | gitlab | successful | 2025-02-19 21:50:08 +0000UTC | #949 |
| git.n07070.xyz | gitea | successful | 2025-02-20 04:58:45 +0000UTC | #951 |
| gitlab.iscpif.fr | gitlab | successful | 2025-02-20 14:38:18 +0000UTC | #952 |
| git.sualokin.xyz | cgit | successful | 2025-02-25 03:30:05 +0000UTC | #955 |
| gitlab.univ-nantes.fr | gitlab | successful | 2025-03-06 03:20:41 +0000UTC | #957 |
| code.lm7.fr | gitea | successful | 2025-03-07 06:35:03 +0000UTC | #958 |
| git.octree.ch | gitlab | successful | 2025-03-13 07:06:05 +0000UTC | #960 |
| gitlab.sidnlabs.nl | gitlab | successful | 2025-03-13 07:09:36 +0000UTC | #961 |
| git.paulk.fr | cgit | successful | 2025-03-13 07:29:51 +0000UTC | #959 |
| git.roflcopter.fr | gitea | successful | 2025-03-14 10:32:14 +0000UTC | #962 |
