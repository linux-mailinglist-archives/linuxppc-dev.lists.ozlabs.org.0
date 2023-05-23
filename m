Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F9170E607
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 21:52:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQlN94nrsz3fG1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 05:52:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQlMg4WHNz3cdD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 05:52:12 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q1Y2K-00054B-FN; Tue, 23 May 2023 21:51:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q1Y27-002K5q-B4; Tue, 23 May 2023 21:50:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q1Y26-007Kca-BR; Tue, 23 May 2023 21:50:58 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH] macintosh: Switch i2c drivers back to use .probe()
Date: Tue, 23 May 2023 21:50:53 +0200
Message-Id: <20230523195053.464138-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6031; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=MkSeGIEaggqWnEnWCpI4zjlvQGnJdVc9TK+pdBIuWc8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkbRkaC822JhWha8Ujg9DF3aGRdsplSuMpKZxdG 0SBlm9lMj2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZG0ZGgAKCRCPgPtYfRL+ TnmpB/0eCPzIMsfUb2hOWOtvrmtRJw6v9cT0CVi8ebunK8mGsPLaMm+zUU3QJmUqc3dAn98BFl1 7HMO0AmrDVucgytxEqLdqHg/8C+0NPaLOR338RAJ68yivfzqkZCe2i2vcT2qk37ND3XFKuCZEHe 7fjphUl3D+aRpoia2imOkxbKRKmrDWkFexOidCdBtK1VjX1e1aX7gSazbjoN7Qv0yFzQ4awN8HL HatK0H4Rdbe0bgcx2hNYMurwa9Gw0XVsxHpOIH1EDPqfsebU2OMy/va2tXhvdyVuTuqeKhgVLRM mSsNd+RTfAGpDsQMdF4VARUPSfvbHQnSABMlcxXTs/gltV+M
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Ajay Gupta <ajayg@nvidia.com>, Peter Senna Tschudin <peter.senna@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Liang He <windhl@126.com>, Jean Delvare <jdelvare@suse.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, Adrien Grassein <adrien.grassein@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Colin Leroy <colin@colino.net>, =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Petr Machata <petrm@nvidia.com>, Maximilian Luz <luzmaximilian@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wolfram Sang <wsa@kernel.org>, kernel@pengutronix.de, Hans Verkuil <hverkuil-cisco@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, Peter Rosin <peda@axentia.se>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
back to (the new) .probe() to be able to eventually drop .probe_new() from
struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

this patch was generated using coccinelle, but I aligned the result to
the per-file indention.

I chose to convert all drivers below drivers/macintosh in a single
patch, but if you prefer I can split by driver.

v6.4-rc1 was taken as a base, as there are no commits in next touching
drivers/macintosh I don't expect problems when applying this patch. If
conflicts arise until this is applied, feel free to just drop the files
with conflicts from this patch. I'll care about the fallout later then.

Also note there is no coordination necessary with the i2c tree. Dropping
.probe_new() will happen only when all (or most) drivers are converted,
which will happen after v6.5-rc1 for sure.

Best regards
Uwe

 drivers/macintosh/ams/ams-i2c.c             | 2 +-
 drivers/macintosh/therm_adt746x.c           | 2 +-
 drivers/macintosh/therm_windtunnel.c        | 2 +-
 drivers/macintosh/windfarm_ad7417_sensor.c  | 2 +-
 drivers/macintosh/windfarm_fcu_controls.c   | 2 +-
 drivers/macintosh/windfarm_lm75_sensor.c    | 2 +-
 drivers/macintosh/windfarm_lm87_sensor.c    | 2 +-
 drivers/macintosh/windfarm_max6690_sensor.c | 2 +-
 drivers/macintosh/windfarm_smu_sat.c        | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/macintosh/ams/ams-i2c.c b/drivers/macintosh/ams/ams-i2c.c
index a4a1035eb412..f9bfe84b1c73 100644
--- a/drivers/macintosh/ams/ams-i2c.c
+++ b/drivers/macintosh/ams/ams-i2c.c
@@ -69,7 +69,7 @@ static struct i2c_driver ams_i2c_driver = {
 	.driver = {
 		.name   = "ams",
 	},
-	.probe_new      = ams_i2c_probe,
+	.probe          = ams_i2c_probe,
 	.remove         = ams_i2c_remove,
 	.id_table       = ams_id,
 };
diff --git a/drivers/macintosh/therm_adt746x.c b/drivers/macintosh/therm_adt746x.c
index 384b87d661e1..53ea56b286f9 100644
--- a/drivers/macintosh/therm_adt746x.c
+++ b/drivers/macintosh/therm_adt746x.c
@@ -598,7 +598,7 @@ static struct i2c_driver thermostat_driver = {
 	.driver = {
 		.name	= "therm_adt746x",
 	},
-	.probe_new = probe_thermostat,
+	.probe = probe_thermostat,
 	.remove = remove_thermostat,
 	.id_table = therm_adt746x_id,
 };
diff --git a/drivers/macintosh/therm_windtunnel.c b/drivers/macintosh/therm_windtunnel.c
index 22b15efcc025..18a982454321 100644
--- a/drivers/macintosh/therm_windtunnel.c
+++ b/drivers/macintosh/therm_windtunnel.c
@@ -442,7 +442,7 @@ static struct i2c_driver g4fan_driver = {
 	.driver = {
 		.name	= "therm_windtunnel",
 	},
-	.probe_new	= do_probe,
+	.probe		= do_probe,
 	.remove		= do_remove,
 	.id_table	= therm_windtunnel_id,
 };
diff --git a/drivers/macintosh/windfarm_ad7417_sensor.c b/drivers/macintosh/windfarm_ad7417_sensor.c
index 33b4723d235e..49ce37fde930 100644
--- a/drivers/macintosh/windfarm_ad7417_sensor.c
+++ b/drivers/macintosh/windfarm_ad7417_sensor.c
@@ -320,7 +320,7 @@ static struct i2c_driver wf_ad7417_driver = {
 		.name	= "wf_ad7417",
 		.of_match_table = wf_ad7417_of_id,
 	},
-	.probe_new	= wf_ad7417_probe,
+	.probe		= wf_ad7417_probe,
 	.remove		= wf_ad7417_remove,
 	.id_table	= wf_ad7417_id,
 };
diff --git a/drivers/macintosh/windfarm_fcu_controls.c b/drivers/macintosh/windfarm_fcu_controls.c
index e027d889d7e8..603ef6c600ba 100644
--- a/drivers/macintosh/windfarm_fcu_controls.c
+++ b/drivers/macintosh/windfarm_fcu_controls.c
@@ -589,7 +589,7 @@ static struct i2c_driver wf_fcu_driver = {
 		.name	= "wf_fcu",
 		.of_match_table = wf_fcu_of_id,
 	},
-	.probe_new	= wf_fcu_probe,
+	.probe		= wf_fcu_probe,
 	.remove		= wf_fcu_remove,
 	.id_table	= wf_fcu_id,
 };
diff --git a/drivers/macintosh/windfarm_lm75_sensor.c b/drivers/macintosh/windfarm_lm75_sensor.c
index 9c6febce2376..48dbdb2bda15 100644
--- a/drivers/macintosh/windfarm_lm75_sensor.c
+++ b/drivers/macintosh/windfarm_lm75_sensor.c
@@ -177,7 +177,7 @@ static struct i2c_driver wf_lm75_driver = {
 		.name	= "wf_lm75",
 		.of_match_table = wf_lm75_of_id,
 	},
-	.probe_new	= wf_lm75_probe,
+	.probe		= wf_lm75_probe,
 	.remove		= wf_lm75_remove,
 	.id_table	= wf_lm75_id,
 };
diff --git a/drivers/macintosh/windfarm_lm87_sensor.c b/drivers/macintosh/windfarm_lm87_sensor.c
index f37a32c2070c..975361c23a93 100644
--- a/drivers/macintosh/windfarm_lm87_sensor.c
+++ b/drivers/macintosh/windfarm_lm87_sensor.c
@@ -172,7 +172,7 @@ static struct i2c_driver wf_lm87_driver = {
 		.name	= "wf_lm87",
 		.of_match_table = wf_lm87_of_id,
 	},
-	.probe_new	= wf_lm87_probe,
+	.probe		= wf_lm87_probe,
 	.remove		= wf_lm87_remove,
 	.id_table	= wf_lm87_id,
 };
diff --git a/drivers/macintosh/windfarm_max6690_sensor.c b/drivers/macintosh/windfarm_max6690_sensor.c
index 6c5ab657b6b3..02856d1f0313 100644
--- a/drivers/macintosh/windfarm_max6690_sensor.c
+++ b/drivers/macintosh/windfarm_max6690_sensor.c
@@ -128,7 +128,7 @@ static struct i2c_driver wf_max6690_driver = {
 		.name		= "wf_max6690",
 		.of_match_table = wf_max6690_of_id,
 	},
-	.probe_new	= wf_max6690_probe,
+	.probe		= wf_max6690_probe,
 	.remove		= wf_max6690_remove,
 	.id_table	= wf_max6690_id,
 };
diff --git a/drivers/macintosh/windfarm_smu_sat.c b/drivers/macintosh/windfarm_smu_sat.c
index 089f2743a070..50baa062c9df 100644
--- a/drivers/macintosh/windfarm_smu_sat.c
+++ b/drivers/macintosh/windfarm_smu_sat.c
@@ -349,7 +349,7 @@ static struct i2c_driver wf_sat_driver = {
 		.name		= "wf_smu_sat",
 		.of_match_table = wf_sat_of_id,
 	},
-	.probe_new	= wf_sat_probe,
+	.probe		= wf_sat_probe,
 	.remove		= wf_sat_remove,
 	.id_table	= wf_sat_id,
 };

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

