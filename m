Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8719187B99F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 09:50:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=uwopaD5I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwLg52BVNz3vsd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 19:50:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=uwopaD5I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=37.18.73.165; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwLZf2TtPz3dWC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 19:46:18 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 164E3100018;
	Thu, 14 Mar 2024 11:46:15 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 164E3100018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710405975;
	bh=9xjL3ldEl071R5nZpqc+4uOtXpIAYgEXiDe8edy0VvQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=uwopaD5I3lyswjvnFUs2il/u6KavH3asrK4hew93h3UzGyfC7g4/yD8pQvqKO8OS7
	 iwKYj9VZhXKC4j1B5lITeLw/ZLqZXKDPx6IZzYs+m9EQcUtD0Z17FoJ5BypiFT/syZ
	 g2tn7ZlzPJUdxEDmRzql0BORiIlJQO3eIzMyR5e0YiGk4DnLRqE6Qt4xsvka7ImGrx
	 bgVf43e6PoY+m0qluVrLmMPy9O7ehGdmFAbXx1OuX1QWOO+KrYla72GUm812BuxDqC
	 zOheJunEr+pOqC9ZTsYnygQQMbgHlgUkNSjqmIOCNYgyxdyF/iBPa1Olhc3ma06kIt
	 nbrmcGQ1vXbyw==
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
Subject: [PATCH v6 6/9] leds: nic78bx: use devm API to cleanup module's resources
Date: Thu, 14 Mar 2024 11:45:28 +0300
Message-ID: <20240314084531.1935545-7-gnstark@salutedevices.com>
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
 drivers/leds/leds-nic78bx.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-nic78bx.c b/drivers/leds/leds-nic78bx.c
index a86b43dd995e..f3049fa14f04 100644
--- a/drivers/leds/leds-nic78bx.c
+++ b/drivers/leds/leds-nic78bx.c
@@ -118,6 +118,15 @@ static struct nic78bx_led nic78bx_leds[] = {
 	}
 };
 
+static void lock_led_reg_action(void *data)
+{
+	struct nic78bx_led_data *led_data = (struct nic78bx_led_data *)data;
+
+	/* Lock LED register */
+	outb(NIC78BX_LOCK_VALUE,
+	     led_data->io_base + NIC78BX_LOCK_REG_OFFSET);
+}
+
 static int nic78bx_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -152,6 +161,10 @@ static int nic78bx_probe(struct platform_device *pdev)
 	led_data->io_base = io_rc->start;
 	spin_lock_init(&led_data->lock);
 
+	ret = devm_add_action(dev, lock_led_reg_action, led_data);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < ARRAY_SIZE(nic78bx_leds); i++) {
 		nic78bx_leds[i].data = led_data;
 
@@ -167,15 +180,6 @@ static int nic78bx_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void nic78bx_remove(struct platform_device *pdev)
-{
-	struct nic78bx_led_data *led_data = platform_get_drvdata(pdev);
-
-	/* Lock LED register */
-	outb(NIC78BX_LOCK_VALUE,
-	     led_data->io_base + NIC78BX_LOCK_REG_OFFSET);
-}
-
 static const struct acpi_device_id led_device_ids[] = {
 	{"NIC78B3", 0},
 	{"", 0},
@@ -184,7 +188,6 @@ MODULE_DEVICE_TABLE(acpi, led_device_ids);
 
 static struct platform_driver led_driver = {
 	.probe = nic78bx_probe,
-	.remove_new = nic78bx_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.acpi_match_table = ACPI_PTR(led_device_ids),
-- 
2.25.1

