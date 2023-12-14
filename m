Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D442813908
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 18:45:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=G4PwqNGZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrfrN749kz3w2g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 04:45:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=G4PwqNGZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=45.89.224.132; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrffX5X9sz3cX4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 04:36:36 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id BDB3112001D;
	Thu, 14 Dec 2023 20:36:25 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru BDB3112001D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1702575385;
	bh=EC3dQnKKfurosn6pqq8G2JOlIq4yy+2qbil19wlXj5E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=G4PwqNGZSJIaHMLsMt8lN89HV60oNIGdkIpRYP3hyKR+uqCIJBwMqtGcLf5Cdg8qn
	 MX9PLkcgRsEHbld2kt2wZan57KWwPDBXb5wgtfvzsaXjt+84g8THHtHK7ohFmPOQ1y
	 HWSn6NabwFrCg1A9C/ap6rLbNiMTwGRlOGP1KbyUb+zCunl1rmjQW6TpCsrCljOfly
	 2aAfqrXiPZExmclBEKW4Wed/pyUVf4P/CyH6fyzVYpsppTBwDxd+HK14ry9Ag+1w6X
	 vM8SU6RFyKB/5J2d5dSZFZMow8UikCKZMJJGwpQ6DRYQ8cvahAxpvIGsWTnVnieYTn
	 K6gRi8Qri+h8g==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 14 Dec 2023 20:36:25 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 14 Dec 2023 20:36:25 +0300
From: George Stark <gnstark@salutedevices.com>
To: <andy.shevchenko@gmail.com>, <pavel@ucw.cz>, <lee@kernel.org>,
	<vadimp@nvidia.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <hdegoede@redhat.com>,
	<mazziesaccount@gmail.com>, <peterz@infradead.org>, <mingo@redhat.com>,
	<will@kernel.org>, <longman@redhat.com>, <boqun.feng@gmail.com>,
	<nikitos.tr@gmail.com>
Subject: [PATCH v4 06/10] leds: lm3532: use devm API to cleanup module's resources
Date: Thu, 14 Dec 2023 20:36:10 +0300
Message-ID: <20231214173614.2820929-7-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231214173614.2820929-1-gnstark@salutedevices.com>
References: <20231214173614.2820929-1-gnstark@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 182125 [Dec 14 2023]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;www.ti.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/12/14 14:24:00
X-KSMG-LinksScanning: Clean, bases: 2023/12/14 14:25:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/12/14 10:50:00 #22693095
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
 drivers/leds/leds-lm3532.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 13662a4aa1f2..713900947e35 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -3,6 +3,7 @@
 // Copyright (C) 2019 Texas Instruments Incorporated - https://www.ti.com/
 // https://www.ti.com/lit/ds/symlink/lm3532.pdf
 
+#include <linux/devm-helpers.h>
 #include <linux/i2c.h>
 #include <linux/leds.h>
 #include <linux/slab.h>
@@ -542,6 +543,13 @@ static int lm3532_parse_als(struct lm3532_data *priv)
 	return ret;
 }
 
+static void gpio_set_low_action(void *data)
+{
+	struct lm3532_data *priv = (struct lm3532_data *)data;
+
+	gpiod_direction_output(priv->enable_gpio, 0);
+}
+
 static int lm3532_parse_node(struct lm3532_data *priv)
 {
 	struct fwnode_handle *child = NULL;
@@ -556,6 +564,12 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 	if (IS_ERR(priv->enable_gpio))
 		priv->enable_gpio = NULL;
 
+	if (priv->enable_gpio) {
+		ret = devm_add_action(&priv->client->dev, gpio_set_low_action, priv);
+		if (ret)
+			return ret;
+	}
+
 	priv->regulator = devm_regulator_get(&priv->client->dev, "vin");
 	if (IS_ERR(priv->regulator))
 		priv->regulator = NULL;
@@ -691,7 +705,10 @@ static int lm3532_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	mutex_init(&drvdata->lock);
+	ret = devm_mutex_init(&client->dev, &drvdata->lock);
+	if (ret)
+		return ret;
+
 	i2c_set_clientdata(client, drvdata);
 
 	ret = lm3532_parse_node(drvdata);
@@ -703,16 +720,6 @@ static int lm3532_probe(struct i2c_client *client)
 	return ret;
 }
 
-static void lm3532_remove(struct i2c_client *client)
-{
-	struct lm3532_data *drvdata = i2c_get_clientdata(client);
-
-	mutex_destroy(&drvdata->lock);
-
-	if (drvdata->enable_gpio)
-		gpiod_direction_output(drvdata->enable_gpio, 0);
-}
-
 static const struct of_device_id of_lm3532_leds_match[] = {
 	{ .compatible = "ti,lm3532", },
 	{},
@@ -727,7 +734,6 @@ MODULE_DEVICE_TABLE(i2c, lm3532_id);
 
 static struct i2c_driver lm3532_i2c_driver = {
 	.probe = lm3532_probe,
-	.remove = lm3532_remove,
 	.id_table = lm3532_id,
 	.driver = {
 		.name = LM3532_NAME,
-- 
2.25.1

