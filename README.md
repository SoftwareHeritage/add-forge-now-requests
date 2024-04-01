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
| gitlab.matrix.org | gitlab | successful | 2024-02-08 15:52:21 +0000UTC | #193 |
| gitlab.lrz.de | gitlab | successful | 2024-02-08 16:20:29 +0000UTC | #192 |
| gitlab.obspm.fr | gitlab | successful | 2024-02-08 23:45:55 +0000UTC | #199 |
| gitlab.nic.cz | gitlab | successful | 2024-02-09 00:39:41 +0000UTC | #197 |
| gitlab.mpi-sws.org | gitlab | successful | 2024-02-09 01:08:13 +0000UTC | #196 |
| gitlab.orfeo-toolbox.org | gitlab | successful | 2024-02-09 11:27:11 +0000UTC | #201 |
| gitlab.physik.lmu.de | gitlab | successful | 2024-02-09 12:03:34 +0000UTC | #202 |
| gitlab.oit.duke.edu | gitlab | successful | 2024-02-09 12:20:35 +0000UTC | #200 |
| gitlab-research.centralesupelec.fr | gitlab | successful | 2024-02-09 13:05:24 +0000UTC | #204 |
| gitlab.riscosopen.org | gitlab | successful | 2024-02-09 15:37:10 +0000UTC | #206 |
| gitlab.nuiton.org | gitlab | successful | 2024-02-09 15:45:44 +0000UTC | #198 |
| gitlab.science.mcgill.ca | gitlab | successful | 2024-02-09 15:55:35 +0000UTC | #208 |
| gitlab.rrze.fau.de | gitlab | successful | 2024-02-09 16:12:53 +0000UTC | #207 |
| gitlab-student.centralesupelec.fr | gitlab | successful | 2024-02-09 17:32:03 +0000UTC | #205 |
| gitlab.software.imdea.org | gitlab | successful | 2024-02-09 17:58:10 +0000UTC | #210 |
| gitlab.shinice.net | gitlab | successful | 2024-02-09 18:05:04 +0000UTC | #209 |
| gitlab.spline.de | gitlab | successful | 2024-02-09 20:33:26 +0000UTC | #211 |
| git.alsa-project.org | gitweb | successful | 2024-02-09 20:35:23 +0000UTC | #215 |
| gitlab.redox-os.org | gitlab | successful | 2024-02-10 00:15:52 +0000UTC | #203 |
| gitlab.steamos.cloud | gitlab | successful | 2024-02-10 10:21:17 +0000UTC | #212 |
| git.abfelbaum.dev | gitlab | successful | 2024-02-10 13:36:33 +0000UTC | #214 |
| git.0x0.st | gitea | successful | 2024-02-10 13:55:38 +0000UTC | #213 |
| git.calcurse.org | cgit | successful | 2024-02-10 14:52:56 +0000UTC | #218 |
| gitcdr.univ-ubs.fr | gitea | successful | 2024-02-10 15:13:36 +0000UTC | #219 |
| git.corrupt.link | gitea | successful | 2024-02-10 15:41:20 +0000UTC | #221 |
| git.cryptomilk.org | cgit | successful | 2024-02-10 15:42:13 +0000UTC | #220 |
| git.dhvlab.org | gitlab | successful | 2024-02-10 15:49:19 +0000UTC | #222 |
| gitext.faps.fau.de | gitlab | successful | 2024-02-10 17:54:20 +0000UTC | #224 |
| git.dst.etit.tu-chemnitz.de | gitlab | successful | 2024-02-10 18:03:33 +0000UTC | #223 |
| git.froth.zone | gitea | successful | 2024-02-10 18:24:47 +0000UTC | #225 |
| gitlab.stums.techfak.fau.de | gitlab | successful | 2024-02-10 18:25:23 +0000UTC | #226 |
| gitlab.synchrotron-soleil.fr | gitlab | successful | 2024-02-10 19:15:06 +0000UTC | #227 |
| git.astron.nl | gitlab | successful | 2024-02-11 16:21:57 +0000UTC | #216 |
| gitlab.tic-ac.org | gitlab | successful | 2024-02-11 20:07:26 +0000UTC | #229 |
| git.cworth.org | gitweb | successful | 2024-02-11 20:17:59 +0000UTC | #232 |
| gitlab.telecom-paris.fr | gitlab | successful | 2024-02-11 21:16:26 +0000UTC | #228 |
| gitlab.trisquel.org | gitlab | successful | 2024-02-11 22:37:32 +0000UTC | #230 |
| git.dec05eba.com | cgit | successful | 2024-02-12 16:06:50 +0000UTC | #233 |
| gitea.lyrion.ch | gitea | successful | 2024-02-12 16:07:44 +0000UTC | #234 |
| gitlab.eng.unimelb.edu.au | gitlab | successful | 2024-02-12 18:21:24 +0000UTC | #235 |
| swen20003.eng.unimelb.edu.au | gitlab | successful | 2024-02-12 18:22:39 +0000UTC | #236 |
| git.fs.lmu.de | gitlab | successful | 2024-02-12 20:25:37 +0000UTC | #239 |
| git.ameliorated.info | gitea | successful | 2024-02-12 20:41:02 +0000UTC | #240 |
| git.exeter.ac.uk | gitlab | successful | 2024-02-12 22:24:26 +0000UTC | #238 |
| git.asonix.dog | gitea | successful | 2024-02-13 10:13:17 +0000UTC | #242 |
| git.aweirdimagination.net | gitea | successful | 2024-02-13 10:14:13 +0000UTC | #243 |
| git.bitmycode.com | gitlab | successful | 2024-02-13 10:26:29 +0000UTC | #244 |
| git.blazebone.com | cgit | successful | 2024-02-13 10:28:19 +0000UTC | #245 |
| gitlab.unimelb.edu.au | gitlab | successful | 2024-02-13 11:13:51 +0000UTC | #237 |
| git.ardour.org | gitea | successful | 2024-02-13 11:31:43 +0000UTC | #241 |
| git.botox.bz | gitea | successful | 2024-02-13 12:09:40 +0000UTC | #246 |
| git.0pointer.net | cgit | successful | 2024-02-13 12:27:56 +0000UTC | #248 |
| git.captnemo.in | gitea | successful | 2024-02-13 13:01:15 +0000UTC | #247 |
| git.alex-design.fr | gitea | successful | 2024-02-13 13:40:02 +0000UTC | #254 |
| git.adbjesus.com | cgit | successful | 2024-02-13 14:36:27 +0000UTC | #252 |
| git.adriansopar.hu | cgit | successful | 2024-02-13 14:37:42 +0000UTC | #253 |
| git.adammathes.com | cgit | successful | 2024-02-13 14:45:14 +0000UTC | #251 |
| git.toradex.com | cgit | successful | 2024-02-15 12:55:55 +0000UTC | #250 |
| git.average.name | gitea | successful | 2024-02-23 02:54:02 +0000UTC | #255 |
| git.fdn.fr | gitlab | successful | 2024-02-27 00:38:11 +0000UTC | #256 |
| git.benkard.de | cgit | successful | 2024-02-27 02:27:16 +0000UTC | #257 |
| git.fps.ee | cgit | successful | 2024-02-29 10:20:44 +0000UTC | #260 |
| gitea.nouspiro.space | gitea | successful | 2024-03-01 02:14:42 +0000UTC | #262 |
| git.des.dev | gitea | successful | 2024-03-01 07:05:04 +0000UTC | #261 |
| git.harmonicflow.org | cgit | successful | 2024-03-02 05:23:24 +0000UTC | #263 |
| git.drk.sc | gitlab | successful | 2024-03-02 08:34:33 +0000UTC | #264 |
| kolaente.dev | gitea | successful | 2024-03-05 10:56:15 +0000UTC | #266 |
| gitlab.ifi.lmu.de | gitlab | successful | 2024-03-07 08:26:57 +0000UTC | #268 |
| git1.toradex.com | cgit | successful | 2024-03-07 09:26:13 +0000UTC | #274 |
| git.informatik.uni-leipzig.de | gitlab | successful | 2024-03-08 09:24:11 +0000UTC | #276 |
| git.anonymousmessenger.ly | gogs | successful | 2024-03-09 00:40:21 +0000UTC | #271 |
| git.blakerain.com | gitea | successful | 2024-03-09 00:59:27 +0000UTC | #278 |
| git.askiiart.net | gitea | successful | 2024-03-09 03:02:36 +0000UTC | #273 |
| git.andrewyu.org | cgit | successful | 2024-03-10 04:24:14 +0000UTC | #279 |
| git.automotivelinux.org | cgit | successful | 2024-03-10 07:16:44 +0000UTC | #280 |
| git.bnfr.net | cgit | successful | 2024-03-10 09:01:27 +0000UTC | #281 |
| www.8cubes.com | gitea | successful | 2024-03-11 22:15:50 +0000UTC | #285 |
| gitlab.denx.de | gitlab | successful | 2024-03-11 22:43:34 +0000UTC | #284 |
| code.umd.edu | gitlab | successful | 2024-03-12 10:17:55 +0000UTC | #287 |
| git.ipfire.org | gitweb | successful | 2024-03-12 15:00:09 +0000UTC | #286 |
| git.brodokk.space | cgit | successful | 2024-03-13 02:05:50 +0000UTC | #288 |
| git.calculate-linux.org | gitea | successful | 2024-03-13 18:46:22 +0000UTC | #289 |
| git.sciprog.center | gitea | successful | 2024-03-15 03:49:04 +0000UTC | #290 |
| git.adyxax.org | cgit | successful | 2024-03-16 04:35:54 +0000UTC | #291 |
| git.chylex.com | gitea | successful | 2024-03-16 05:40:19 +0000UTC | #296 |
| cgit.freebsd.org | cgit | successful | 2024-03-16 15:15:31 +0000UTC | #283 |
| git.comnets.net | gitlab | unsuccessful | 2024-03-19 02:17:17 +0000UTC | #299 |
| git.concertos.live | gitea | unsuccessful | 2024-03-19 07:05:13 +0000UTC | #304 |
| git.datenwolf.net | cgit | successful | 2024-03-19 13:16:10 +0000UTC | #301 |
| git.danieljon.es | cgit | successful | 2024-03-19 13:18:16 +0000UTC | #300 |
| git.comnets.net | gitlab | successful | 2024-03-19 13:19:13 +0000UTC | #299 |
| git.concertos.live | gitea | successful | 2024-03-19 13:20:40 +0000UTC | #304 |
| browse.dgit.debian.org | cgit | unsuccessful | 2024-03-20 03:54:55 +0000UTC | #307 |
| git.compilenix.org | gitlab | successful | 2024-03-20 04:26:33 +0000UTC | #306 |
| git.ivysaur.me | gitea | successful | 2024-03-20 05:00:56 +0000UTC | #308 |
| git.jakstys.lt | gitea | successful | 2024-03-20 05:14:34 +0000UTC | #309 |
| gitlab.echothree.com | gitlab | successful | 2024-03-20 08:53:20 +0000UTC | #305 |
| git.acid.vegas | stagit | successful | 2024-03-20 13:38:28 +0000UTC | #310 |
| browse.dgit.debian.org | cgit | successful | 2024-03-20 13:44:25 +0000UTC | #307 |
| git.sisudoc.org | cgit | successful | 2024-03-21 23:14:03 +0000UTC | #311 |
| git.ee.ethz.ch | gitlab | unsuccessful | 2024-03-21 23:45:50 +0000UTC | #312 |
| git.ee.ethz.ch | gitlab | successful | 2024-03-22 09:00:12 +0000UTC | #312 |
| gitlab.inf.ethz.ch | gitlab | successful | 2024-03-23 05:38:46 +0000UTC | #315 |
| git.archive.org | gitlab | successful | 2024-03-23 12:04:50 +0000UTC | #314 |
| gitlab.crans.org | gitlab | successful | 2024-03-23 13:15:21 +0000UTC | #313 |
| git.com.de | gitea | successful | 2024-03-23 14:35:44 +0000UTC | #298 |
| git.diapason.digital | gitea | successful | 2024-04-01 03:46:12 +0000UTC | #317 |
| git.deprecated.org | cgit | successful | 2024-04-01 04:37:15 +0000UTC | #316 |
