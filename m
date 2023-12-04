Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB983803C75
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 19:09:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=c8AQZM1d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkWsT2fGLz3dJk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 05:09:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=c8AQZM1d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=45.89.224.132; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkWpd1RCpz3cRK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 05:07:18 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 42CBE12001E;
	Mon,  4 Dec 2023 21:07:15 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 42CBE12001E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1701713235;
	bh=Ti5QsKGkbG/5u0LYCNy7EDAXvqFHDiHlufLQ88xPdok=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=c8AQZM1dR6KcoM2v6wzY34v4GR+14PIdcgDZYDY6IVyfhdFzasji1RW/KIiShlG2K
	 m1FbNmltCo0Q2k+BbA0D4rCd3z9rHlV0khsv+bG1bbLMgEvD+Jq3oyaTgFFsOSZMlJ
	 xU1lsUlGXzNizIs7GcYfjYeVfvQMDIbm2dJeTIRc/csAZcOJLOr+9h3ei1rAkctW7F
	 SIhJ2dGl1o1bZnMeLPyC87W83rQQAIqb1BxEvNQvJq+fLold0Wy0msjOSOtab6FsaC
	 DzKu8mnW9PeKyDcZMifdwDTQKeUCO57eRwI7MhVbOHkzdboG8orhfMFv+0/s5TsaGz
	 gNXjcONSoH+yA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  4 Dec 2023 21:07:15 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 4 Dec 2023 21:07:14 +0300
From: George Stark <gnstark@salutedevices.com>
To: <pavel@ucw.cz>, <lee@kernel.org>, <vadimp@nvidia.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<hdegoede@redhat.com>, <mazziesaccount@gmail.com>,
	<andy.shevchenko@gmail.com>, <jic23@kernel.org>
Subject: [PATCH v2 04/10] leds: aw200xx: use devm API to cleanup module's resources
Date: Mon, 4 Dec 2023 21:05:57 +0300
Message-ID: <20231204180603.470421-5-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204180603.470421-1-gnstark@salutedevices.com>
References: <20231204180603.470421-1-gnstark@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181831 [Dec 04 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 5 0.3.5 98d108ddd984cca1d7e65e595eac546a62b0144b, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/12/04 11:06:00 #22624476
X-KSMG-AntiVirus-Status: Clean, skipped
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
Cc: kernel@salutedevices.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, George Stark <gnstark@salutedevices.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In this driver LEDs are registered using devm_led_classdev_register()
so they are automatically unregistered after module's remove() is done.
led_classdev_unregister() calls module's led_set_brightness() to turn off
the LEDs and that callback uses resources which were destroyed already
in module's remove() so use devm API instead of remove().

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 drivers/leds/leds-aw200xx.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
index 1d3943f86f7f..b1a097c7c879 100644
--- a/drivers/leds/leds-aw200xx.c
+++ b/drivers/leds/leds-aw200xx.c
@@ -10,6 +10,7 @@
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/container_of.h>
+#include <linux/devm-helpers.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/leds.h>
@@ -530,6 +531,20 @@ static const struct regmap_config aw200xx_regmap_config = {
 	.disable_locking = true,
 };
 
+static void aw200xx_chip_reset_action(void *data)
+{
+	const struct aw200xx *chip = (struct aw200xx *)data;
+
+	aw200xx_chip_reset(chip);
+}
+
+static void aw200xx_disable_action(void *data)
+{
+	const struct aw200xx *chip = (struct aw200xx *)data;
+
+	aw200xx_disable(chip);
+}
+
 static int aw200xx_probe(struct i2c_client *client)
 {
 	const struct aw200xx_chipdef *cdef;
@@ -568,11 +583,16 @@ static int aw200xx_probe(struct i2c_client *client)
 
 	aw200xx_enable(chip);
 
+	ret = devm_add_action(&client->dev, aw200xx_disable_action, chip);
+	if (ret)
+		return ret;
+
 	ret = aw200xx_chip_check(chip);
 	if (ret)
 		return ret;
 
-	mutex_init(&chip->mutex);
+	if (devm_mutex_init(&client->dev, &chip->mutex))
+		return -ENOMEM;
 
 	/* Need a lock now since after call aw200xx_probe_fw, sysfs nodes created */
 	mutex_lock(&chip->mutex);
@@ -581,6 +601,10 @@ static int aw200xx_probe(struct i2c_client *client)
 	if (ret)
 		goto out_unlock;
 
+	ret = devm_add_action(&client->dev, aw200xx_chip_reset_action, chip);
+	if (ret)
+		goto out_unlock;
+
 	ret = aw200xx_probe_fw(&client->dev, chip);
 	if (ret)
 		goto out_unlock;
@@ -595,15 +619,6 @@ static int aw200xx_probe(struct i2c_client *client)
 	return ret;
 }
 
-static void aw200xx_remove(struct i2c_client *client)
-{
-	struct aw200xx *chip = i2c_get_clientdata(client);
-
-	aw200xx_chip_reset(chip);
-	aw200xx_disable(chip);
-	mutex_destroy(&chip->mutex);
-}
-
 static const struct aw200xx_chipdef aw20036_cdef = {
 	.channels = 36,
 	.display_size_rows_max = 3,
@@ -652,7 +667,6 @@ static struct i2c_driver aw200xx_driver = {
 		.of_match_table = aw200xx_match_table,
 	},
 	.probe_new = aw200xx_probe,
-	.remove = aw200xx_remove,
 	.id_table = aw200xx_id,
 };
 module_i2c_driver(aw200xx_driver);
-- 
2.38.4

