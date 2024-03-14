Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D3187B9AD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 09:51:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=ahxOl+FY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwLhg20fRz3vxw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 19:51:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=ahxOl+FY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=45.89.224.132; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwLZf4TYlz3dWK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 19:46:18 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id D28FF120014;
	Thu, 14 Mar 2024 11:46:14 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru D28FF120014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710405974;
	bh=HLNCTgwzZsqdyYp20b9aN7SyO2BGd0FTbWWmDldD028=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ahxOl+FY3h1Uv5tYKMdCdjMv85duFzMGZgsuilG0nDULwvWDt/viK2nQGPXg37jBd
	 YhyFsOOP9hCdJX9Ew7ykKZ1rkLt0URgZ7hSVrgrxVDeJO+FjPUSH9j83i8zB/IPJrP
	 bGlnDRJkldD9tgdPifOry0WZMjGvG3FBzuRDOuDQX68cKgHJjPwg7MJrhPJa94Cu2L
	 vdu1KOXEmUFNunDHJZG1r1DXht+q5effeFpZXlde8KjPLywjF5j+JMHcpwbyEHNN93
	 fCDKZoB4SXLz8ZfusdurGpIP7yp1DWfX9XbaT+q1fXxO1aVgTodM4MqXLyyZrHoTFA
	 NFYr5zC7tS+hA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 14 Mar 2024 11:46:14 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 14 Mar 2024 11:46:14 +0300
From: George Stark <gnstark@salutedevices.com>
To: <andy.shevchenko@gmail.com>, <pavel@ucw.cz>, <lee@kernel.org>,
	<vadimp@nvidia.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <hdegoede@redhat.com>,
	<mazziesaccount@gmail.com>, <peterz@infradead.org>, <mingo@redhat.com>,
	<will@kernel.org>, <longman@redhat.com>, <boqun.feng@gmail.com>,
	<nikitos.tr@gmail.com>, <marek.behun@nic.cz>, <kabel@kernel.org>
Subject: [PATCH v6 5/9] leds: lm3532: use devm API to cleanup module's resources
Date: Thu, 14 Mar 2024 11:45:27 +0300
Message-ID: <20240314084531.1935545-6-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240314084531.1935545-1-gnstark@salutedevices.com>
References: <20240314084531.1935545-1-gnstark@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/29 19:21:00 #23899999
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
 drivers/leds/leds-lm3532.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 13662a4aa1f2..aa7966eb506f 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -542,6 +542,13 @@ static int lm3532_parse_als(struct lm3532_data *priv)
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
@@ -556,6 +563,12 @@ static int lm3532_parse_node(struct lm3532_data *priv)
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
@@ -691,7 +704,10 @@ static int lm3532_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	mutex_init(&drvdata->lock);
+	ret = devm_mutex_init(&client->dev, &drvdata->lock);
+	if (ret)
+		return ret;
+
 	i2c_set_clientdata(client, drvdata);
 
 	ret = lm3532_parse_node(drvdata);
@@ -703,16 +719,6 @@ static int lm3532_probe(struct i2c_client *client)
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
@@ -727,7 +733,6 @@ MODULE_DEVICE_TABLE(i2c, lm3532_id);
 
 static struct i2c_driver lm3532_i2c_driver = {
 	.probe = lm3532_probe,
-	.remove = lm3532_remove,
 	.id_table = lm3532_id,
 	.driver = {
 		.name = LM3532_NAME,
-- 
2.25.1

