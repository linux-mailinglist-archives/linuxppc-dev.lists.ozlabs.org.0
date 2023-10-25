Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F23F7D77CB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 00:24:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=EmYuRvSh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SG3Q82hq1z3dWn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 09:24:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=EmYuRvSh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=37.18.73.165; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SFqBR3y07z3c1L
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 00:13:51 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8E872100043;
	Wed, 25 Oct 2023 16:07:44 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8E872100043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1698239264;
	bh=QI0eEMit4cRAk0dzmRcmJgiC5EDe0H7Kqy7+mSGTVrU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=EmYuRvSh8MROTQg+CWmVIV3ikaw4wqLxA7YespJ51Vt90wv4OJBBVdF+A5bM2O+Ba
	 xt2+No1w8iIhvvbU5n2TEQAIQYAcJMnAhYhjOx9JLMTz+KvRmWNDTkFhsIVeHS15FX
	 kFcvkjVZyJdhPO7MLDC+1DlRcdY/ab9UH9b07OjAxJzT7FcihnWqKC7njeuiOZiu0s
	 dGG9otRgt3xpTKhii8rk7Hf5c2WpFtWR7RloZynI1NYjVRB0QniDtYs6JssC4m75SN
	 DP+ROqDLgC3vJW3qJrzHnHAvhngpAEgcn8eKIZ5x08gylzWBzvkkVv713uOWrfqwHr
	 Z1G9FXd3eeORw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 25 Oct 2023 16:07:44 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Wed, 25 Oct 2023 16:07:44 +0300
From: George Stark <gnstark@salutedevices.com>
To: <pavel@ucw.cz>, <lee@kernel.org>, <vadimp@nvidia.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<gnstark@salutedevices.com>
Subject: [PATCH 1/8] leds: powernv: explicitly unregister LEDs at module's shutdown
Date: Wed, 25 Oct 2023 16:07:30 +0300
Message-ID: <20231025130737.2015468-2-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025130737.2015468-1-gnstark@salutedevices.com>
References: <20231025130737.2015468-1-gnstark@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 180883 [Oct 25 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/10/25 11:29:00 #22291710
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Approved-At: Thu, 26 Oct 2023 09:18:28 +1100
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
Cc: kernel@sberdevices.ru, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

LEDs are registered using devm_led_classdev_register() and automatically
unregistered after module's remove(). led_classdev_unregister() calls
led_set_brightness() to turn off the LEDs and module's appropriate callback
uses resources those were destroyed already in module's remove().
So explicitly unregister LEDs at module shutdown.

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 drivers/leds/leds-powernv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
index 743e2cdd0891..7c7f696c8265 100644
--- a/drivers/leds/leds-powernv.c
+++ b/drivers/leds/leds-powernv.c
@@ -302,7 +302,12 @@ static int powernv_led_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, powernv_led_common);
 
+	if (!devres_open_group(&pdev->dev, priv, GFP_KERNEL))
+		return -ENOMEM;
+
 	rc = powernv_led_classdev(pdev, led_node, powernv_led_common);
+	if (rc)
+		devres_remove_group(dev, priv);
 out:
 	of_node_put(led_node);
 	return rc;
@@ -313,6 +318,8 @@ static int powernv_led_remove(struct platform_device *pdev)
 {
 	struct powernv_led_common *powernv_led_common;
 
+	devres_release_group(&pdev->dev, powernv_led_common);
+
 	/* Disable LED operation */
 	powernv_led_common = platform_get_drvdata(pdev);
 	powernv_led_common->led_disabled = true;
-- 
2.38.4

