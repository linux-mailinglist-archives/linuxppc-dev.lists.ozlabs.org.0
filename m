Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEA287B997
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 09:48:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=llg9699W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwLdW4wXHz3vf9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 19:48:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=llg9699W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=37.18.73.165; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwLZd56jJz3dVw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 19:46:17 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 9C1EE100017;
	Thu, 14 Mar 2024 11:46:14 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 9C1EE100017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710405974;
	bh=UKhnHyf3Q15t1sWab7Ng1cV9QPOXCfl6k9inzlZSB1c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=llg9699W2rj5jl7v8yvCPkzJKdUhJpldOk6JTJwKKcOidKi6wgSTIZfXHTxDvt10F
	 GvDRhAcEDAcj55+arFTzbJHLpMRtGGvHVku7AyzTwtiIohc8OQiVARs4qhzcfwHNWX
	 fDT8X3G+CQJK5AEi+icnfhCWbenJaozvYAoDDkmyiiibtCbIIaHaq3+/8JVoyhZjL0
	 MhZKF0np04TVDbMB8+IoDcEOoR7dmLSESFAEEtPUjk3rB3piPI/rKAQmpJ2Mno+fRu
	 /DmTy1ObF3/BpHT+EYC+/Hjz+PvHK09CX7ExRiJ9Mx8OYGpMMyTsG7OPc7IMQiMFDY
	 7R+SarmqMTygg==
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
Subject: [PATCH v6 4/9] leds: lp3952: use devm API to cleanup module's resources
Date: Thu, 14 Mar 2024 11:45:26 +0300
Message-ID: <20240314084531.1935545-5-gnstark@salutedevices.com>
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
Also drop explicit turning LEDs off from remove() due to they will be off
anyway by led_classdev_unregister().

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 drivers/leds/leds-lp3952.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-lp3952.c b/drivers/leds/leds-lp3952.c
index 5d18bbfd1f23..e24bfe686312 100644
--- a/drivers/leds/leds-lp3952.c
+++ b/drivers/leds/leds-lp3952.c
@@ -207,6 +207,13 @@ static const struct regmap_config lp3952_regmap = {
 	.cache_type = REGCACHE_MAPLE,
 };
 
+static void gpio_set_low_action(void *data)
+{
+	struct lp3952_led_array *priv = (struct lp3952_led_array *)data;
+
+	gpiod_set_value(priv->enable_gpio, 0);
+}
+
 static int lp3952_probe(struct i2c_client *client)
 {
 	int status;
@@ -226,6 +233,10 @@ static int lp3952_probe(struct i2c_client *client)
 		return status;
 	}
 
+	status = devm_add_action(&client->dev, gpio_set_low_action, priv);
+	if (status)
+		return status;
+
 	priv->regmap = devm_regmap_init_i2c(client, &lp3952_regmap);
 	if (IS_ERR(priv->regmap)) {
 		int err = PTR_ERR(priv->regmap);
@@ -254,15 +265,6 @@ static int lp3952_probe(struct i2c_client *client)
 	return 0;
 }
 
-static void lp3952_remove(struct i2c_client *client)
-{
-	struct lp3952_led_array *priv;
-
-	priv = i2c_get_clientdata(client);
-	lp3952_on_off(priv, LP3952_LED_ALL, false);
-	gpiod_set_value(priv->enable_gpio, 0);
-}
-
 static const struct i2c_device_id lp3952_id[] = {
 	{LP3952_NAME, 0},
 	{}
@@ -274,7 +276,6 @@ static struct i2c_driver lp3952_i2c_driver = {
 			.name = LP3952_NAME,
 	},
 	.probe = lp3952_probe,
-	.remove = lp3952_remove,
 	.id_table = lp3952_id,
 };
 
-- 
2.25.1

