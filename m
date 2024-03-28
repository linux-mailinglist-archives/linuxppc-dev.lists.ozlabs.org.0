Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8F7874663
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 03:53:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=Z25DoIxn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tqv4w5LGRz3vXP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 13:53:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=Z25DoIxn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=45.89.224.132; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tqv140FZFz2yNX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 13:50:15 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4CF4A12002D;
	Thu,  7 Mar 2024 05:40:47 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4CF4A12002D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1709779247;
	bh=kK6WfysHnoHnPx6m7g6/YcvxmY15e9MkbOzMlx2Ecms=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Z25DoIxny13RFVUaWLPegVkGvGzrEAl2oayVtnHl8IGIpzQgatP+OrgyJ2/iyW+PW
	 Yrc8IUWTpYeqFybrXKwZf+rDXAhpxEwlTRYHB662QqsmRUgDu1PjNroNJHu1HkDeMt
	 wIxXqOTzX45R65eOe2Pnf82rZERDDGAhYycUZkolfZac3Dg5nC9MAXGcZlYSfk63ZL
	 OlULeEgZe1iHIptHjLtq3kNAYyPAYwgEoamIDNvHUsP2PdTNxBBGVmA5//lINbGdrg
	 m06/W2iHiC9OzgERgaIjNCWsF1RqOwdyHGWLdy/HuWagLHbmL31fn49drod0MvH/18
	 OdYWvxX3kFPCQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu,  7 Mar 2024 05:40:47 +0300 (MSK)
Received: from localhost.localdomain (100.125.24.169) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 7 Mar 2024 05:40:46 +0300
From: George Stark <gnstark@salutedevices.com>
To: <andy.shevchenko@gmail.com>, <pavel@ucw.cz>, <lee@kernel.org>,
	<vadimp@nvidia.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <hdegoede@redhat.com>,
	<mazziesaccount@gmail.com>, <peterz@infradead.org>, <mingo@redhat.com>,
	<will@kernel.org>, <longman@redhat.com>, <boqun.feng@gmail.com>,
	<nikitos.tr@gmail.com>, <kabel@kernel.org>
Subject: [PATCH v5 10/10] leds: powernv: use LED_RETAIN_AT_SHUTDOWN flag for leds
Date: Thu, 7 Mar 2024 05:40:34 +0300
Message-ID: <20240307024034.1548605-11-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240307024034.1548605-1-gnstark@salutedevices.com>
References: <20240307024034.1548605-1-gnstark@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [100.125.24.169]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s, ApMailHostAddress: 100.125.24.169
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

This driver wants to keep its LEDs state after module is removed
and implemented it in its own way. LED subsystem supports dedicated
flag LED_RETAIN_AT_SHUTDOWN for the same purpose so use the flag
instead of custom implementation.

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 drivers/leds/leds-powernv.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
index 4f01acb75727..9c6fb7d6e0e7 100644
--- a/drivers/leds/leds-powernv.c
+++ b/drivers/leds/leds-powernv.c
@@ -30,15 +30,6 @@ static const struct led_type_map led_type_map[] = {
 };
 
 struct powernv_led_common {
-	/*
-	 * By default unload path resets all the LEDs. But on PowerNV
-	 * platform we want to retain LED state across reboot as these
-	 * are controlled by firmware. Also service processor can modify
-	 * the LEDs independent of OS. Hence avoid resetting LEDs in
-	 * unload path.
-	 */
-	bool		led_disabled;
-
 	/* Max supported LED type */
 	__be64		max_led_type;
 
@@ -178,10 +169,6 @@ static int powernv_brightness_set(struct led_classdev *led_cdev,
 	struct powernv_led_common *powernv_led_common = powernv_led->common;
 	int rc;
 
-	/* Do not modify LED in unload path */
-	if (powernv_led_common->led_disabled)
-		return 0;
-
 	mutex_lock(&powernv_led_common->lock);
 	rc = powernv_led_set(powernv_led, value);
 	mutex_unlock(&powernv_led_common->lock);
@@ -225,6 +212,14 @@ static int powernv_led_create(struct device *dev,
 
 	powernv_led->cdev.brightness_set_blocking = powernv_brightness_set;
 	powernv_led->cdev.brightness_get = powernv_brightness_get;
+	/*
+	 * By default unload path resets all the LEDs. But on PowerNV
+	 * platform we want to retain LED state across reboot as these
+	 * are controlled by firmware. Also service processor can modify
+	 * the LEDs independent of OS. Hence avoid resetting LEDs in
+	 * unload path.
+	 */
+	powernv_led->cdev.flags = LED_RETAIN_AT_SHUTDOWN;
 	powernv_led->cdev.brightness = LED_OFF;
 	powernv_led->cdev.max_brightness = LED_FULL;
 
@@ -313,9 +308,7 @@ static void powernv_led_remove(struct platform_device *pdev)
 {
 	struct powernv_led_common *powernv_led_common;
 
-	/* Disable LED operation */
 	powernv_led_common = platform_get_drvdata(pdev);
-	powernv_led_common->led_disabled = true;
 
 	/* Destroy lock */
 	mutex_destroy(&powernv_led_common->lock);
-- 
2.25.1

