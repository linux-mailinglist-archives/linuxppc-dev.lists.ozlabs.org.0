Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 844F787B9A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 09:50:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=lc0Vhom+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwLgt27lmz3vvX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 19:50:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=lc0Vhom+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=45.89.224.132; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwLZf38Bvz3d36
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 19:46:18 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 69121120012;
	Thu, 14 Mar 2024 11:46:14 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 69121120012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710405974;
	bh=gvlhRnJ5xJg26euVayo9SmeLTTcIC3Y5vdfnz8cqeiE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=lc0Vhom+kVS5MsqC3TWjKvYENT3F534cqellvmHlUWQgIj6PypY0keqPsDPgjt5fq
	 d0ktIBzPxpqQL2UPI/H0FZSd9fmfv0Y9PI6V7xTt21+P8GOvHSkZDv1PbvnrBQ0254
	 AaHni4ZinyFHADmVfKya21p82j5Skbik3c9CQX/DvzbCcDtzQwwt99TJU/LE1gjXH2
	 DWKdGR9pc56XZhfmUYoRf+EhNmDYqY0rqau0cfdvyn3XSufWufhUmWyHfmoGt37KQg
	 F44bRQsZ05hseiAgDlF3UtBD9MHezCjuC8uEPA6qBSA+tfxBxkGtTw2sPp1nvEqmWr
	 x+BvBy6RM/mtg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 14 Mar 2024 11:46:14 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 14 Mar 2024 11:46:13 +0300
From: George Stark <gnstark@salutedevices.com>
To: <andy.shevchenko@gmail.com>, <pavel@ucw.cz>, <lee@kernel.org>,
	<vadimp@nvidia.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <hdegoede@redhat.com>,
	<mazziesaccount@gmail.com>, <peterz@infradead.org>, <mingo@redhat.com>,
	<will@kernel.org>, <longman@redhat.com>, <boqun.feng@gmail.com>,
	<nikitos.tr@gmail.com>, <marek.behun@nic.cz>, <kabel@kernel.org>
Subject: [PATCH v6 3/9] leds: aw200xx: use devm API to cleanup module's resources
Date: Thu, 14 Mar 2024 11:45:25 +0300
Message-ID: <20240314084531.1935545-4-gnstark@salutedevices.com>
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
 drivers/leds/leds-aw200xx.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
index f584a7f98fc5..5cba52d07b38 100644
--- a/drivers/leds/leds-aw200xx.c
+++ b/drivers/leds/leds-aw200xx.c
@@ -530,6 +530,16 @@ static const struct regmap_config aw200xx_regmap_config = {
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
@@ -568,11 +578,17 @@ static int aw200xx_probe(struct i2c_client *client)
 
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
@@ -581,6 +597,10 @@ static int aw200xx_probe(struct i2c_client *client)
 	if (ret)
 		goto out_unlock;
 
+	ret = devm_add_action(&client->dev, aw200xx_chip_reset_action, chip);
+	if (ret)
+		goto out_unlock;
+
 	ret = aw200xx_probe_fw(&client->dev, chip);
 	if (ret)
 		goto out_unlock;
@@ -595,15 +615,6 @@ static int aw200xx_probe(struct i2c_client *client)
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
@@ -652,7 +663,6 @@ static struct i2c_driver aw200xx_driver = {
 		.of_match_table = aw200xx_match_table,
 	},
 	.probe = aw200xx_probe,
-	.remove = aw200xx_remove,
 	.id_table = aw200xx_id,
 };
 module_i2c_driver(aw200xx_driver);
-- 
2.25.1

