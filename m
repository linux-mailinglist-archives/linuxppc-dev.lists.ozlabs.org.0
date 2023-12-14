Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C088138F9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 18:42:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=o4PVSh0a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Srfnh4SpFz3vql
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 04:42:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=o4PVSh0a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=45.89.224.132; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrffX5YBtz3cXK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 04:36:36 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id EEC3A12001E;
	Thu, 14 Dec 2023 20:36:25 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru EEC3A12001E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1702575385;
	bh=k3WMJ0GNwuGRczuP2LxdxutooPucV6JPLeqyGQDEPIA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=o4PVSh0a2zgp2DaGeInM7daHcqicls01cPeXE8aE6Ms6f52DMAt8ZQiWho05YOyaI
	 kjcXnU24UMVevOlFWDY+qDps3W3bdbk9SwHjjg0L/2ghAUIzrZyR4stKkdvlreFN85
	 7B4xg+GBckWhUmhdlCDgpn0fr8MVe2nJCptXc2hho4tNOsxUkBxc0iCJXlOEz/pEHS
	 ho/FuaUTz+zI7l1DiApIVydpaCILJD0TrC/mN2Bvqt3BhYDzEJXV7dwJpQasMnOB0j
	 RnRnOF33H+rh8lCfr/PqJboNgzzGUCU8u8O0cElS+Z7LkSVXPcsldDb4zMAH/fjNOh
	 51D/Z/+OlCB7Q==
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
Subject: [PATCH v4 07/10] leds: nic78bx: use devm API to cleanup module's resources
Date: Thu, 14 Dec 2023 20:36:11 +0300
Message-ID: <20231214173614.2820929-8-gnstark@salutedevices.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
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
 drivers/leds/leds-nic78bx.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-nic78bx.c b/drivers/leds/leds-nic78bx.c
index f196f52eec1e..f3049fa14f04 100644
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
 
@@ -167,17 +180,6 @@ static int nic78bx_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int nic78bx_remove(struct platform_device *pdev)
-{
-	struct nic78bx_led_data *led_data = platform_get_drvdata(pdev);
-
-	/* Lock LED register */
-	outb(NIC78BX_LOCK_VALUE,
-	     led_data->io_base + NIC78BX_LOCK_REG_OFFSET);
-
-	return 0;
-}
-
 static const struct acpi_device_id led_device_ids[] = {
 	{"NIC78B3", 0},
 	{"", 0},
@@ -186,7 +188,6 @@ MODULE_DEVICE_TABLE(acpi, led_device_ids);
 
 static struct platform_driver led_driver = {
 	.probe = nic78bx_probe,
-	.remove = nic78bx_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.acpi_match_table = ACPI_PTR(led_device_ids),
-- 
2.25.1

