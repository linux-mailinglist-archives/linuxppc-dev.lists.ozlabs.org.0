Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD74812A71
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 09:32:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=ljq/CCEV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrQZS2f2wz3cT0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 19:32:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=ljq/CCEV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=45.89.224.132; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrQWl4Y9Nz3c3n
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 19:29:54 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 87FC112004A;
	Thu, 14 Dec 2023 11:29:48 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 87FC112004A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1702542588;
	bh=2AuAiO3OInmf7JfFcpOZ0isTbjfNOkeR9WOJsIXMUT4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ljq/CCEVuNjhV7bgoZQGMQ4PMbvPTMeiSJYgJC/dm9Wk9QLHXlyBd7qvuhHbiFrQd
	 DLs44yN9pBRG4VXDmfHNZ+SABRlchRc4Wto1XhbjvM1wbH+1f+A1xecDErATgNsH8Q
	 eqS1061mPOhwf2RkfW7bPWv5i1ldIJwErrihHvTwSkyG1/uWnq+uzJ6TSmytAKmusv
	 nVYlGC2ZXBglFXIRg/u/6Yzx3SRO3ezkbF3oHuUWGlMmmsKmufdg/YYAh6mNGzG6vD
	 hGjw1DIRWHV7XnO33DR3wFZk0O9ei8sQxJWLXXkYEGHAHSNXPav2nhEqtRsQtL8DXq
	 cu2I7XT5KhQ+g==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 14 Dec 2023 11:29:48 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 14 Dec 2023 11:29:48 +0300
From: George Stark <gnstark@salutedevices.com>
To: <andy.shevchenko@gmail.com>, <pavel@ucw.cz>, <lee@kernel.org>,
	<vadimp@nvidia.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <hdegoede@redhat.com>,
	<mazziesaccount@gmail.com>, <peterz@infradead.org>, <mingo@redhat.com>,
	<will@kernel.org>, <longman@redhat.com>, <boqun.feng@gmail.com>,
	<nikitos.tr@gmail.com>
Subject: [PATCH v3 05/11] leds: aw200xx: use devm API to cleanup module's resources
Date: Thu, 14 Dec 2023 11:29:34 +0300
Message-ID: <20231214082940.2718303-1-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 182104 [Dec 14 2023]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/12/14 06:13:00 #22683038
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
 drivers/leds/leds-aw200xx.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
index 1d3943f86f7f..eed1e65c1c0e 100644
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
@@ -530,6 +531,16 @@ static const struct regmap_config aw200xx_regmap_config = {
 	.disable_locking = true,
 };
 
+static void aw200xx_chip_reset_action(void *data)
+{
+	aw200xx_chip_reset(data);
+}
+
+static void aw200xx_disable_action(void *data)
+{
+	aw200xx_disable(data);
+}
+
 static int aw200xx_probe(struct i2c_client *client)
 {
 	const struct aw200xx_chipdef *cdef;
@@ -568,11 +579,17 @@ static int aw200xx_probe(struct i2c_client *client)
 
 	aw200xx_enable(chip);
 
+	ret = devm_add_action(&client->dev, aw200xx_disable_action, chip);
+	if (ret)
+		return ret;
+
 	ret = aw200xx_chip_check(chip);
 	if (ret)
 		return ret;
 
-	mutex_init(&chip->mutex);
+	ret = devm_mutex_init(&client->dev, &chip->mutex);
+	if (ret)
+		return ret;
 
 	/* Need a lock now since after call aw200xx_probe_fw, sysfs nodes created */
 	mutex_lock(&chip->mutex);
@@ -581,6 +598,10 @@ static int aw200xx_probe(struct i2c_client *client)
 	if (ret)
 		goto out_unlock;
 
+	ret = devm_add_action(&client->dev, aw200xx_chip_reset_action, chip);
+	if (ret)
+		goto out_unlock;
+
 	ret = aw200xx_probe_fw(&client->dev, chip);
 	if (ret)
 		goto out_unlock;
@@ -595,15 +616,6 @@ static int aw200xx_probe(struct i2c_client *client)
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
@@ -652,7 +664,6 @@ static struct i2c_driver aw200xx_driver = {
 		.of_match_table = aw200xx_match_table,
 	},
 	.probe_new = aw200xx_probe,
-	.remove = aw200xx_remove,
 	.id_table = aw200xx_id,
 };
 module_i2c_driver(aw200xx_driver);
-- 
2.25.1

