Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFD7711838
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 22:37:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QS0H861L2z3fFv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 06:37:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QS0Gf4nlhz3f7D
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 06:37:12 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q2HhZ-0005wd-86; Thu, 25 May 2023 22:36:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q2HhS-002nnC-NR; Thu, 25 May 2023 22:36:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q2HhS-007xX3-1m; Thu, 25 May 2023 22:36:42 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] sound: Switch i2c drivers back to use .probe()
Date: Thu, 25 May 2023 22:36:40 +0200
Message-Id: <20230525203640.677826-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=XFldES2aPMwZZSw7UdtRfyJxjA5nYzer9ZVAMlZDwlo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkb8bWfkjQ/JugH4K3qwzdQT+0sIkKIUX1sVLv4 PCm7XWM5HiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZG/G1gAKCRCPgPtYfRL+ ThbxB/9kjwfTH5ux2APCpTMvB6ywkqXnkK/4PjlUX105jgWLthKoXF67qaJw1VdjeLrK3wibmSy 0hS/fU/6LogdKr+CMQrcRTBQg/npOJ97yETh5+ost6naqaJhl3Aa8+NEWEyU03MEmx3aC+TW+4/ 7bDzOa6RDaWCDl5seImwUsrPOLdDXN6z9td6XeeoXqmi5M3SJ8eYU/g6YEL2A0ibM/bq34s5aGD gjgjQPSLrwPnHgsRKiKMXwj0spyFeVaoKpVGX1wquWWcj0KDYnhPWHrEGHI5h4N6IlSD18Z6nIY bYdTkZfOOVv2+OZnIeAIDxUYLis7AYydX5Kh0Qpimn+QbyJ+
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
Cc: alsa-devel@alsa-project.org, Corey Minyard <cminyard@mvista.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Vladimir Oltean <olteanv@gmail.com>, Lucas Tanure <tanureal@opensource.cirrus.com>, Peter Senna Tschudin <peter.senna@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Rhodes <david.rhodes@cirrus.com>, Wolfram Sang <wsa@kernel.org>, linuxppc-dev@lists.ozlabs.org, Richard Fitzgerald <rf@opensource.cirrus.com>, =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, Adrien Grassein <adrien.grassein@gmail.com>, kernel@pengutronix.de, patches@opensource.cirrus.com, Johannes Berg <johannes@sipsolutions.net>, James Schulman <james.schulman@cirrus.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
back to (the new) .probe() to be able to eventually drop .probe_new() from
struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/aoa/codecs/onyx.c         | 2 +-
 sound/aoa/codecs/tas.c          | 2 +-
 sound/pci/hda/cs35l41_hda_i2c.c | 2 +-
 sound/ppc/keywest.c             | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/aoa/codecs/onyx.c b/sound/aoa/codecs/onyx.c
index 4c75381f5ab8..a8a59d71dcec 100644
--- a/sound/aoa/codecs/onyx.c
+++ b/sound/aoa/codecs/onyx.c
@@ -1048,7 +1048,7 @@ static struct i2c_driver onyx_driver = {
 	.driver = {
 		.name = "aoa_codec_onyx",
 	},
-	.probe_new = onyx_i2c_probe,
+	.probe = onyx_i2c_probe,
 	.remove = onyx_i2c_remove,
 	.id_table = onyx_i2c_id,
 };
diff --git a/sound/aoa/codecs/tas.c b/sound/aoa/codecs/tas.c
index f906e9aaddcf..ab1472390061 100644
--- a/sound/aoa/codecs/tas.c
+++ b/sound/aoa/codecs/tas.c
@@ -936,7 +936,7 @@ static struct i2c_driver tas_driver = {
 	.driver = {
 		.name = "aoa_codec_tas",
 	},
-	.probe_new = tas_i2c_probe,
+	.probe = tas_i2c_probe,
 	.remove = tas_i2c_remove,
 	.id_table = tas_i2c_id,
 };
diff --git a/sound/pci/hda/cs35l41_hda_i2c.c b/sound/pci/hda/cs35l41_hda_i2c.c
index 7826b1a12d7d..b44536fbba17 100644
--- a/sound/pci/hda/cs35l41_hda_i2c.c
+++ b/sound/pci/hda/cs35l41_hda_i2c.c
@@ -58,7 +58,7 @@ static struct i2c_driver cs35l41_i2c_driver = {
 		.pm		= &cs35l41_hda_pm_ops,
 	},
 	.id_table	= cs35l41_hda_i2c_id,
-	.probe_new	= cs35l41_hda_i2c_probe,
+	.probe		= cs35l41_hda_i2c_probe,
 	.remove		= cs35l41_hda_i2c_remove,
 };
 module_i2c_driver(cs35l41_i2c_driver);
diff --git a/sound/ppc/keywest.c b/sound/ppc/keywest.c
index 0c4f43963c75..dfc1fc9b701d 100644
--- a/sound/ppc/keywest.c
+++ b/sound/ppc/keywest.c
@@ -90,7 +90,7 @@ static struct i2c_driver keywest_driver = {
 	.driver = {
 		.name = "PMac Keywest Audio",
 	},
-	.probe_new = keywest_probe,
+	.probe = keywest_probe,
 	.remove = keywest_remove,
 	.id_table = keywest_i2c_id,
 };

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

