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
| git.icculus.org | gitweb | unsuccessful | 2023-11-08 09:48:24 +0000UTC | #38 |
| git.candlhat.org | gitweb | unsuccessful | 2023-11-08 09:49:42 +0000UTC | #39 |
| git.donarmstrong.com | gitweb | unsuccessful | 2023-11-08 09:50:59 +0000UTC | #40 |
| git.gag.com | gitweb | successful | 2023-11-08 13:05:48 +0000UTC | #37 |
| git.icculus.org | gitweb | successful | 2023-11-08 17:56:06 +0000UTC | #38 |
| git.deb.at | gitweb | unsuccessful | 2023-11-09 09:53:18 +0000UTC | #41 |
| git.tartarus.org | gitweb | unsuccessful | 2023-11-09 09:59:51 +0000UTC | #42 |
| git.tartarus.org | gitweb | successful | 2023-11-09 12:02:10 +0000UTC | #42 |
| git.deb.at | gitweb | successful | 2023-11-09 12:51:38 +0000UTC | #41 |
| git.neil.brown.name | gitweb | successful | 2023-11-09 21:27:36 +0000UTC | #43 |
| git.ghostscript.com | gitweb | successful | 2023-11-11 12:42:53 +0000UTC | #44 |
| git.videolan.org | gitweb | successful | 2023-11-14 00:20:53 +0000UTC | #46 |
| git.moodle.org | gitweb | successful | 2023-11-14 14:17:34 +0000UTC | #45 |
| git.openstreetmap.org | gitweb | successful | 2023-11-14 14:43:17 +0000UTC | #47 |
| code.videolan.org | gitlab | successful | 2023-11-20 08:21:00 +0000UTC | #48 |
| git.openssl.org | gitweb | successful | 2023-11-20 13:09:39 +0000UTC | #49 |
| repo.or.cz | gitweb | unsuccessful | 2023-11-21 09:05:17 +0000UTC | #50 |
| git.iem.at | gitlab | successful | 2023-11-22 10:07:53 +0000UTC | #51 |
| git.devuan.org | gitea | successful | 2023-11-23 11:40:18 +0000UTC | #52 |
| git.geany.org | cgit | successful | 2023-11-24 17:00:41 +0000UTC | #53 |
| git.h8u.de | gitea | successful | 2023-11-25 01:22:02 +0000UTC | #54 |
| git.ideasonboard.org | cgit | unsuccessful | 2023-11-27 14:41:52 +0000UTC | #57 |
| git.haproxy.org | gitweb | successful | 2023-11-27 17:31:12 +0000UTC | #56 |
| git.juef.net | stagit | unsuccessful | 2023-11-28 08:41:48 +0000UTC | #58 |
| git.hadrons.org | cgit | successful | 2023-11-28 10:25:26 +0000UTC | #55 |
| git.kyleam.com | cgit | successful | 2023-12-01 09:23:43 +0000UTC | #62 |
| git.kuschku.de | gitlab | successful | 2023-12-01 10:43:24 +0000UTC | #61 |
| git.3naly.xyz | gitea | successful | 2023-12-04 13:05:43 +0000UTC | #64 |
| gitlab.developers.cam.ac.uk | gitlab | unsuccessful | 2023-12-04 13:09:26 +0000UTC | #63 |
| git.abscue.de | gitlab | unsuccessful | 2023-12-04 13:21:05 +0000UTC | #65 |
| git.aims.ac.za | gitlab | unsuccessful | 2023-12-04 14:45:19 +0000UTC | #66 |
| git.aims.ac.za | gitlab | successful | 2023-12-04 15:13:39 +0000UTC | #66 |
| gitlab.developers.cam.ac.uk | gitlab | successful | 2023-12-04 16:02:35 +0000UTC | #63 |
| notabug.org | gogs | successful | 2023-12-04 16:09:04 +0000UTC | #67 |
| git.abscue.de | gitlab | successful | 2023-12-04 22:49:14 +0000UTC | #65 |
| chaos.expert | gitlab | successful | 2023-12-05 13:05:31 +0000UTC | #68 |
| git.ao2.it | gitweb | successful | 2023-12-05 14:53:14 +0000UTC | #70 |
| git.asgardius.company | gitea | successful | 2023-12-05 16:41:38 +0000UTC | #71 |
| gitlab.coko.foundation | gitlab | successful | 2023-12-05 17:33:37 +0000UTC | #69 |
| git.bluemosh.com | gitlab | unsuccessful | 2023-12-06 08:14:21 +0000UTC | #75 |
| git.bleu255.com | stagit | successful | 2023-12-06 10:11:04 +0000UTC | #74 |
| git.benjamin.barenblat.name | cgit | successful | 2023-12-06 10:48:08 +0000UTC | #73 |
| git.bubu1.eu | gitlab | successful | 2023-12-06 11:23:18 +0000UTC | #76 |
| git.build2.org | cgit | successful | 2023-12-06 11:34:33 +0000UTC | #77 |
| gitlab.bzed.at | gitlab | unsuccessful | 2023-12-06 12:41:32 +0000UTC | #78 |
| git.catgirl.land | gitea | unsuccessful | 2023-12-06 12:42:41 +0000UTC | #79 |
| git.claws-mail.org | gitweb | successful | 2023-12-07 00:06:15 +0000UTC | #80 |
| gitlab.bzed.at | gitlab | successful | 2023-12-07 00:44:28 +0000UTC | #78 |
| git.clsr.net | cgit | successful | 2023-12-07 08:57:11 +0000UTC | #81 |
| git.codelabs.ch | gitweb | successful | 2023-12-07 09:11:04 +0000UTC | #82 |
| git.codesynthesis.com | cgit | successful | 2023-12-07 09:32:18 +0000UTC | #83 |
| git.cppget.org | cgit | successful | 2023-12-07 11:11:19 +0000UTC | #85 |
| git.coop | gitlab | successful | 2023-12-07 11:11:37 +0000UTC | #84 |
| git.crc.id.au | gitea | successful | 2023-12-07 11:13:05 +0000UTC | #86 |
| git.cuvoodoo.info | gitea | successful | 2023-12-07 11:45:42 +0000UTC | #87 |
| git.data.coop | gitea | successful | 2023-12-07 12:40:27 +0000UTC | #88 |
| git.decadent.org.uk | gitweb | successful | 2023-12-07 12:52:23 +0000UTC | #89 |
| git.beagleboard.org | gitlab | successful | 2023-12-07 16:56:23 +0000UTC | #72 |
| git.catgirl.land | gitea | successful | 2023-12-07 16:57:39 +0000UTC | #79 |
