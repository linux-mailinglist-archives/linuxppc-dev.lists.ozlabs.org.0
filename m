Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78118177669
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 13:53:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Wxkg3D0fzDqST
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 23:52:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 48WxhL5JCZzDqSp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 23:50:56 +1100 (AEDT)
Received: from localhost (p54B3308A.dip0.t-ipconnect.de [84.179.48.138])
 by pokefinder.org (Postfix) with ESMTPSA id 734872C0872;
 Tue,  3 Mar 2020 13:50:53 +0100 (CET)
From: Wolfram Sang <wsa@the-dreams.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] macintosh: windfarm: fix MODINFO regression
Date: Tue,  3 Mar 2020 13:50:46 +0100
Message-Id: <20200303125046.5157-1-wsa@the-dreams.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, Wolfram Sang <wsa@the-dreams.de>,
 Mathieu Malaterre <malat@debian.org>, debian-powerpc@lists.debian.org,
 linux-i2c@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit af503716ac14 made sure OF devices get an OF style modalias with
I2C events. It assumed all in-tree users were converted, yet it missed
some Macintosh drivers.

Add an OF module device table for all windfarm drivers to make them
automatically load again.

Fixes: af503716ac14 ("i2c: core: report OF style module alias for devices registered via OF")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=199471
Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Tested-by: Erhard Furtner <erhard_f@mailbox.org>
Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---

This should also help with this: https://lists.debian.org/debian-powerpc/2020/01/msg00062.html
Some more testing would be appreciated because lm75 also has some code
changes I can't test myself obviusly.

By grepping, I found some more potential candidates (using a "MAC,"
prefix but not defining a OF MODULE DEVICE TABLE). Does someone know
about bugreports filed for those? I don't want to change them for no
reason:

drivers/macintosh/ams/ams-i2c.c
drivers/macintosh/therm_adt746x.c
sound/aoa/codecs/onyx.c
sound/aoa/codecs/tas.c
sound/ppc/keywest.c

Happy hacking,

   Wolfram

 drivers/macintosh/windfarm_ad7417_sensor.c  |  7 +++++++
 drivers/macintosh/windfarm_fcu_controls.c   |  7 +++++++
 drivers/macintosh/windfarm_lm75_sensor.c    | 16 +++++++++++++++-
 drivers/macintosh/windfarm_lm87_sensor.c    |  7 +++++++
 drivers/macintosh/windfarm_max6690_sensor.c |  7 +++++++
 drivers/macintosh/windfarm_smu_sat.c        |  7 +++++++
 6 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/macintosh/windfarm_ad7417_sensor.c b/drivers/macintosh/windfarm_ad7417_sensor.c
index 125605987b44..e7dec328c7cf 100644
--- a/drivers/macintosh/windfarm_ad7417_sensor.c
+++ b/drivers/macintosh/windfarm_ad7417_sensor.c
@@ -312,9 +312,16 @@ static const struct i2c_device_id wf_ad7417_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, wf_ad7417_id);
 
+static const struct of_device_id wf_ad7417_of_id[] = {
+	{ .compatible = "ad7417", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, wf_ad7417_of_id);
+
 static struct i2c_driver wf_ad7417_driver = {
 	.driver = {
 		.name	= "wf_ad7417",
+		.of_match_table = wf_ad7417_of_id,
 	},
 	.probe		= wf_ad7417_probe,
 	.remove		= wf_ad7417_remove,
diff --git a/drivers/macintosh/windfarm_fcu_controls.c b/drivers/macintosh/windfarm_fcu_controls.c
index 67daeec94b44..2470e5a725c8 100644
--- a/drivers/macintosh/windfarm_fcu_controls.c
+++ b/drivers/macintosh/windfarm_fcu_controls.c
@@ -580,9 +580,16 @@ static const struct i2c_device_id wf_fcu_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, wf_fcu_id);
 
+static const struct of_device_id wf_fcu_of_id[] = {
+	{ .compatible = "fcu", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, wf_fcu_of_id);
+
 static struct i2c_driver wf_fcu_driver = {
 	.driver = {
 		.name	= "wf_fcu",
+		.of_match_table = wf_fcu_of_id,
 	},
 	.probe		= wf_fcu_probe,
 	.remove		= wf_fcu_remove,
diff --git a/drivers/macintosh/windfarm_lm75_sensor.c b/drivers/macintosh/windfarm_lm75_sensor.c
index 282c28a17ea1..1e5fa09845e7 100644
--- a/drivers/macintosh/windfarm_lm75_sensor.c
+++ b/drivers/macintosh/windfarm_lm75_sensor.c
@@ -14,6 +14,7 @@
 #include <linux/init.h>
 #include <linux/wait.h>
 #include <linux/i2c.h>
+#include <linux/of_device.h>
 #include <asm/prom.h>
 #include <asm/machdep.h>
 #include <asm/io.h>
@@ -91,9 +92,14 @@ static int wf_lm75_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {	
 	struct wf_lm75_sensor *lm;
-	int rc, ds1775 = id->driver_data;
+	int rc, ds1775;
 	const char *name, *loc;
 
+	if (id)
+		ds1775 = id->driver_data;
+	else
+		ds1775 = !!of_device_get_match_data(&client->dev);
+
 	DBG("wf_lm75: creating  %s device at address 0x%02x\n",
 	    ds1775 ? "ds1775" : "lm75", client->addr);
 
@@ -164,9 +170,17 @@ static const struct i2c_device_id wf_lm75_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, wf_lm75_id);
 
+static const struct of_device_id wf_lm75_of_id[] = {
+	{ .compatible = "lm75", .data = (void *)0},
+	{ .compatible = "ds1775", .data = (void *)1 },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, wf_lm75_of_id);
+
 static struct i2c_driver wf_lm75_driver = {
 	.driver = {
 		.name	= "wf_lm75",
+		.of_match_table = wf_lm75_of_id,
 	},
 	.probe		= wf_lm75_probe,
 	.remove		= wf_lm75_remove,
diff --git a/drivers/macintosh/windfarm_lm87_sensor.c b/drivers/macintosh/windfarm_lm87_sensor.c
index b03a33b803b7..d011899c0a8a 100644
--- a/drivers/macintosh/windfarm_lm87_sensor.c
+++ b/drivers/macintosh/windfarm_lm87_sensor.c
@@ -166,9 +166,16 @@ static const struct i2c_device_id wf_lm87_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, wf_lm87_id);
 
+static const struct of_device_id wf_lm87_of_id[] = {
+	{ .compatible = "lm87cimt", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, wf_lm87_of_id);
+
 static struct i2c_driver wf_lm87_driver = {
 	.driver = {
 		.name	= "wf_lm87",
+		.of_match_table = wf_lm87_of_id,
 	},
 	.probe		= wf_lm87_probe,
 	.remove		= wf_lm87_remove,
diff --git a/drivers/macintosh/windfarm_max6690_sensor.c b/drivers/macintosh/windfarm_max6690_sensor.c
index e666cc020683..1e7b03d44ad9 100644
--- a/drivers/macintosh/windfarm_max6690_sensor.c
+++ b/drivers/macintosh/windfarm_max6690_sensor.c
@@ -120,9 +120,16 @@ static const struct i2c_device_id wf_max6690_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, wf_max6690_id);
 
+static const struct of_device_id wf_max6690_of_id[] = {
+	{ .compatible = "max6690", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, wf_max6690_of_id);
+
 static struct i2c_driver wf_max6690_driver = {
 	.driver = {
 		.name		= "wf_max6690",
+		.of_match_table = wf_max6690_of_id,
 	},
 	.probe		= wf_max6690_probe,
 	.remove		= wf_max6690_remove,
diff --git a/drivers/macintosh/windfarm_smu_sat.c b/drivers/macintosh/windfarm_smu_sat.c
index c84ec49c3741..cb75dc035616 100644
--- a/drivers/macintosh/windfarm_smu_sat.c
+++ b/drivers/macintosh/windfarm_smu_sat.c
@@ -341,9 +341,16 @@ static const struct i2c_device_id wf_sat_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, wf_sat_id);
 
+static const struct of_device_id wf_sat_of_id[] = {
+	{ .compatible = "smu-sat", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, wf_sat_of_id);
+
 static struct i2c_driver wf_sat_driver = {
 	.driver = {
 		.name		= "wf_smu_sat",
+		.of_match_table = wf_sat_of_id,
 	},
 	.probe		= wf_sat_probe,
 	.remove		= wf_sat_remove,
-- 
2.20.1

