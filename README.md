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
| git.woz.blue | cgit | unsuccessful | 2025-03-18 03:04:28 +0000UTC | #963 |
| gitlab.uni-osnabrueck.de | gitlab | unsuccessful | 2025-03-18 03:07:13 +0000UTC | #964 |
| s3gitlab.paluno.uni-due.de | gitlab | unsuccessful | 2025-03-18 03:27:44 +0000UTC | #965 |
| git.woz.blue | cgit | successful | 2025-03-18 09:37:05 +0000UTC | #963 |
| gitlab.uni-osnabrueck.de | gitlab | successful | 2025-03-18 09:38:08 +0000UTC | #964 |
| s3gitlab.paluno.uni-due.de | gitlab | successful | 2025-03-18 09:39:41 +0000UTC | #965 |
| gitlab.diz.uni-marburg.de | gitlab | successful | 2025-03-18 12:32:38 +0000UTC | #966 |
| gitlab.uni-marburg.de | gitlab | successful | 2025-03-18 16:01:09 +0000UTC | #967 |
| git-ps.informatik.uni-kiel.de | gitlab | successful | 2025-03-19 10:08:32 +0000UTC | #969 |
| git.zs.informatik.uni-kiel.de | gitlab | successful | 2025-03-19 10:39:59 +0000UTC | #970 |
| gitlab.rz.uni-bamberg.de | gitlab | successful | 2025-03-19 10:40:38 +0000UTC | #971 |
| git.informatik.uni-kiel.de | gitlab | successful | 2025-03-19 11:07:29 +0000UTC | #968 |
| sme.uni-bamberg.de | gitlab | successful | 2025-03-19 12:47:40 +0000UTC | #972 |
| gitlab.cs.uni-duesseldorf.de | gitlab | successful | 2025-03-19 12:48:25 +0000UTC | #973 |
| dgit.cs.uni-saarland.de | gitlab | successful | 2025-03-19 13:10:11 +0000UTC | #975 |
| mgit.cs.uni-saarland.de | gitlab | successful | 2025-03-19 14:58:45 +0000UTC | #976 |
| ccb-gitlab.cs.uni-saarland.de | gitlab | successful | 2025-03-19 14:59:50 +0000UTC | #977 |
| projects.cispa.saarland | gitlab | successful | 2025-03-19 16:08:38 +0000UTC | #978 |
| gitlab-lehre.informatik.uni-halle.de | gitlab | successful | 2025-03-19 18:51:46 +0000UTC | #980 |
| git.itm.uni-luebeck.de | gitlab | successful | 2025-03-19 19:23:35 +0000UTC | #982 |
| gitlab.informatik.uni-halle.de | gitlab | successful | 2025-03-19 19:51:49 +0000UTC | #979 |
| git.uni-wuppertal.de | gitlab | successful | 2025-03-19 19:52:42 +0000UTC | #981 |
| gitlab.cs.uni-saarland.de | gitlab | successful | 2025-03-20 10:49:05 +0000UTC | #974 |
| gitlab.rob.uni-luebeck.de | gitlab | successful | 2025-03-20 10:53:27 +0000UTC | #983 |
| git.ime.uni-luebeck.de | gitlab | successful | 2025-03-20 10:54:33 +0000UTC | #984 |
| gitlab.iti.uni-luebeck.de | gitlab | successful | 2025-03-21 11:09:57 +0000UTC | #985 |
| git-crypto.elen.ucl.ac.be | gitlab | successful | 2025-03-21 12:43:19 +0000UTC | #987 |
| git.hexanyn.fr | gitlab | successful | 2025-03-21 12:46:28 +0000UTC | #991 |
| git.iiens.net | gitlab | successful | 2025-03-21 13:26:45 +0000UTC | #990 |
| git.esiee.fr | gitlab | successful | 2025-03-21 13:40:47 +0000UTC | #986 |
| git.oecd-nea.org | gitlab | successful | 2025-03-21 14:14:02 +0000UTC | #988 |
| git.s2.rpn.ch | gitlab | successful | 2025-03-21 15:48:52 +0000UTC | #995 |
| git.startinblox.com | gitlab | successful | 2025-03-21 16:41:32 +0000UTC | #997 |
| git.esi-bru.be | gitlab | successful | 2025-03-21 17:20:09 +0000UTC | #996 |
| code.ill.fr | gitlab | successful | 2025-03-21 18:47:43 +0000UTC | #994 |
| git.inp.nsk.su | gitlab | successful | 2025-03-22 05:28:21 +0000UTC | #998 |
| git.ifro.edu.br | gitlab | successful | 2025-03-22 05:39:06 +0000UTC | #1000 |
| git.cs.ou.nl | gitlab | successful | 2025-03-22 05:47:48 +0000UTC | #992 |
| gitlab.ingeniarius.pt | gitlab | successful | 2025-03-22 06:38:29 +0000UTC | #999 |
| source.puri.sm | gitlab | successful | 2025-03-22 10:27:23 +0000UTC | #993 |
| gitlab.shaohang.xin | gitlab | successful | 2025-03-24 21:50:59 +0000UTC | #1005 |
| git.softtodo.tn | gitlab | successful | 2025-03-24 21:52:22 +0000UTC | #1006 |
| gitlab.abutech.uz | gitlab | successful | 2025-03-24 21:58:25 +0000UTC | #1004 |
| git.gem.ec-nantes.fr | gitlab | successful | 2025-03-24 22:26:08 +0000UTC | #1001 |
| git.code.tecnalia.com | gitlab | successful | 2025-03-24 22:37:39 +0000UTC | #1003 |
| git.unistra.fr | gitlab | successful | 2025-03-24 22:39:01 +0000UTC | #1002 |
| gitlab.eecs.wsu.edu | gitlab | successful | 2025-03-25 01:55:21 +0000UTC | #1008 |
| code.officialstatistics.org | gitlab | successful | 2025-03-26 14:45:27 +0000UTC | #1012 |
| datascience.aeolus.wsu.edu | gitlab | successful | 2025-03-26 15:00:42 +0000UTC | #1010 |
| gitlab.pinteam.eu | gitlab | successful | 2025-03-26 15:06:42 +0000UTC | #1013 |
| git.uclalemur.com | gitlab | successful | 2025-03-26 15:34:13 +0000UTC | #1011 |
| gitlab.encs.vancouver.wsu.edu | gitlab | successful | 2025-03-26 15:58:14 +0000UTC | #1009 |
| git.h.hackclub.app | gitea | successful | 2025-03-26 16:00:35 +0000UTC | #1015 |
| git.mthie.com | gitea | successful | 2025-03-26 16:01:26 +0000UTC | #1016 |
| git.osmarks.net | gitea | successful | 2025-03-26 16:57:55 +0000UTC | #1014 |
| git.uha4point0.fr | gitlab | successful | 2025-03-27 10:36:50 +0000UTC | #1018 |
| git.muerell.de | gitea | successful | 2025-03-27 10:53:00 +0000UTC | #1017 |
| gitea.typename.fr | gitea | successful | 2025-03-27 10:59:06 +0000UTC | #1020 |
| gitlab.extra.irsn.fr | gitlab | successful | 2025-03-27 12:30:48 +0000UTC | #1022 |
| gitlab.esiea.fr | gitlab | successful | 2025-03-27 13:00:01 +0000UTC | #1021 |
| git.pix-n-chill.fr | gitea | successful | 2025-03-28 03:56:11 +0000UTC | #1023 |
| dci-gitlab.cines.fr | gitlab | successful | 2025-03-28 11:54:09 +0000UTC | #1027 |
| gitlab.labos.polytechnique.fr | gitlab | successful | 2025-03-28 13:10:46 +0000UTC | #1024 |
| gitub.u-bordeaux.fr | gitlab | successful | 2025-03-28 13:11:43 +0000UTC | #1025 |
| cameleon.univ-lyon1.fr | gitlab | successful | 2025-03-28 13:13:16 +0000UTC | #1026 |
| forge.april.org | gitea | successful | 2025-03-28 14:35:51 +0000UTC | #1029 |
| forge.iut-larochelle.fr | gitlab | successful | 2025-03-28 15:13:16 +0000UTC | #1031 |
| forge.oasu.u-bordeaux.fr | gitlab | successful | 2025-03-28 15:14:01 +0000UTC | #1032 |
| forge.chapril.org | gitea | successful | 2025-03-28 15:45:29 +0000UTC | #1028 |
| forge.ird.fr | gitlab | successful | 2025-03-28 16:42:35 +0000UTC | #1030 |
| lily-is.land | gitlab | successful | 2025-03-29 05:24:30 +0000UTC | #1033 |
| forge.ti-nuage.fr | gitea | successful | 2025-03-31 10:23:52 +0000UTC | #1034 |
| git.labolyon.fr | gitea | successful | 2025-03-31 11:25:13 +0000UTC | #1035 |
| git.univ-cotedazur.fr | gitlab | successful | 2025-03-31 11:46:34 +0000UTC | #1037 |
| gitlab-preprod.in2p3.fr | gitlab | successful | 2025-03-31 15:49:11 +0000UTC | #1038 |
| gitlab-sml.din.developpement-durable.gouv.fr | gitlab | successful | 2025-03-31 15:50:11 +0000UTC | #1039 |
| gogs.am-networks.fr | gogs | successful | 2025-03-31 16:21:51 +0000UTC | #1042 |
| gogs.caricand.fr | gogs | successful | 2025-03-31 16:22:50 +0000UTC | #1043 |
| gogs.sincrone.fr | gitea | successful | 2025-03-31 16:24:57 +0000UTC | #1047 |
| gitlab.rd.nic.fr | gitlab | successful | 2025-03-31 16:30:39 +0000UTC | #1041 |
| gogs.elic.ucl.ac.be | gogs | successful | 2025-03-31 16:51:04 +0000UTC | #1044 |
| gogs.prunetwork.fr | gitea | successful | 2025-03-31 16:52:24 +0000UTC | #1046 |
| gitlab.ec-lyon.fr | gitlab | successful | 2025-03-31 17:50:29 +0000UTC | #1040 |
| gitlab.di.ens.fr | gitlab | unsuccessful | 2025-04-05 04:45:42 +0000UTC | #1049 |
| git.art-software.fr | gitea | successful | 2025-04-05 06:12:25 +0000UTC | #1050 |
| git.wut.ee | gitea | successful | 2025-04-05 06:16:30 +0000UTC | #1051 |
| voparis-gitlab.obspm.fr | gitlab | successful | 2025-04-07 05:22:45 +0000UTC | #1052 |
| git.lacontrevoie.fr | gitea | successful | 2025-04-07 05:51:52 +0000UTC | #1054 |
| git.cyberjinh.fr | gitea | successful | 2025-04-07 05:53:16 +0000UTC | #1056 |
| git.k-space.ee | gitea | successful | 2025-04-07 06:11:08 +0000UTC | #1055 |
| gitlab.di.ens.fr | gitlab | successful | 2025-04-07 08:53:35 +0000UTC | #1049 |
| code.groupe-genes.fr | gitea | successful | 2025-04-10 04:16:19 +0000UTC | #1058 |
| git.rockylinux.org | gitlab | successful | 2025-04-10 07:14:32 +0000UTC | #1057 |
| git.resel.fr | gitlab | successful | 2025-04-10 08:22:23 +0000UTC | #1059 |
| git.pa1ch.fr | cgit | successful | 2025-04-15 05:09:33 +0000UTC | #1061 |
| gl.mathhub.info | gitlab | successful | 2025-04-17 11:43:50 +0000UTC | #1060 |
| gitlab.ub.uni-giessen.de | gitlab | unsuccessful | 2025-04-20 01:48:17 +0000UTC | #1062 |
| gitlab.ub.uni-giessen.de | gitlab | successful | 2025-04-21 18:14:22 +0000UTC | #1062 |
| git-lium.univ-lemans.fr | gitlab | unsuccessful | 2025-05-11 16:06:08 +0000UTC | #1064 |
| git-lium.univ-lemans.fr | gitlab | successful | 2025-05-19 09:15:01 +0000UTC | #1064 |
| scm.dersco.re | cgit | successful | 2025-05-20 06:03:00 +0000UTC | #1065 |
| code.inno3.eu | gitlab | successful | 2025-05-21 09:31:20 +0000UTC | #1068 |
| edu-git.ac-versailles.fr | gitlab | successful | 2025-05-21 09:34:12 +0000UTC | #1069 |
| git.biohpc.swmed.edu | gitlab | successful | 2025-05-21 09:35:11 +0000UTC | #1070 |
| git.oeru.org | gitlab | successful | 2025-05-21 09:37:21 +0000UTC | #1072 |
| gitlab-mshe.univ-fcomte.fr | gitlab | successful | 2025-05-21 11:13:18 +0000UTC | #1074 |
| gitlab.univ-rouen.fr | gitlab | successful | 2025-05-21 11:13:51 +0000UTC | #1075 |
| git.fpfis.tech.ec.europa.eu | gitlab | successful | 2025-05-21 13:36:26 +0000UTC | #1071 |
| llrgit.in2p3.fr | gitlab | successful | 2025-05-22 09:31:01 +0000UTC | #1078 |
| gitlab.adorsaz.ch | gitlab | successful | 2025-05-22 09:31:46 +0000UTC | #1079 |
| gitlab.sealedair.io | gitlab | successful | 2025-05-22 09:35:55 +0000UTC | #1081 |
| lab.unif.app | gitlab | successful | 2025-05-22 09:37:31 +0000UTC | #1084 |
