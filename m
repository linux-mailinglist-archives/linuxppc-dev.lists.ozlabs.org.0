Return-Path: <linuxppc-dev+bounces-5927-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 253D7A2B888
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 03:00:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ypxxf6488z30PF;
	Fri,  7 Feb 2025 13:00:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738893606;
	cv=none; b=ZOPD8vBW9jGaZuFRkATeDZgaRM/DbpZz26+tmrR6hO1W4XEunp9UfAQQYq8w9jFXkpKBckukxewmN7XL6kcW0lQCZW28tR9ZDEQDhfQawSTGrO9zkYG+BsC7Jf/N0Cbdl4pBaP+1BDGOUv1sIRiuycddcUkR8dWMQJmzD/XHe16om+mMYD5XfO8wo0vbZaagbV9cw+eL8KUeVixjOeCiPIXqWx6hvyi/DCeYLU0G68Bybo4tk6MeKWE33YhoASaDPbyb3gQpNlI/CdO4HAoyFoO8ML6Baz903xDY2Ylqj9m2jfSxZ+dE9hGOZoGVYgpd/CwlTyYDG0IL2sEtdvJGQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738893606; c=relaxed/relaxed;
	bh=n1xb+E23Nbe3ojleGT9VXngqDiSNBpGLyobomTrByRM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ksxwfgcFDanpA8Z78PnI0uk0uNurzo7YErD/G2ujZBRuj3pSXfgS94jAp5jnyBEGYIaxTKzMtzd9oV9rfaZd10UGtxMu6PhHsKYll4NbK4xLuRGoo/OqJ9ttBntp4GGQ72JEH/xpklDKBYd47vZAy9jFhtV0DsrHKi3WO+FPB1UY/rbhCgqjSdpwlZjkFf3PKpKe6c74VmyxOfQHQKyV9Ckhp+Zfc67LF44gVWmXz3u/2r+cKxH9WGsViJ9Z8z/Sa664OQh/q/Qclavkl/OEdCjb/NhfHE8Fegsm42JBzbkOhLSul6UPkJwevnn12icRKka/li3jQVkDg/Rz9UNf6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ypxxd3QMrz30Qk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 13:00:05 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4YpxQL3PL4zbnrS;
	Fri,  7 Feb 2025 09:36:26 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 3E410140156;
	Fri,  7 Feb 2025 09:39:53 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 7 Feb
 2025 09:39:51 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <robh@kernel.org>, <saravanak@google.com>, <justin.chen@broadcom.com>,
	<florian.fainelli@broadcom.com>, <andrew+netdev@lunn.ch>, <kuba@kernel.org>,
	<o.rempel@pengutronix.de>, <kory.maincent@bootlin.com>,
	<jacopo+renesas@jmondi.org>, <kieran.bingham+renesas@ideasonboard.com>,
	<laurent.pinchart+renesas@ideasonboard.com>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <olteanv@gmail.com>,
	<davem@davemloft.net>, <taras.chornyi@plvision.eu>, <edumazet@google.com>,
	<pabeni@redhat.com>, <sudeep.holla@arm.com>, <cristian.marussi@arm.com>
CC: <arm-scmi@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-media@vger.kernel.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <chenjun102@huawei.com>,
	<zhangzekun11@huawei.com>
Subject: [PATCH 7/9] net: dsa: hellcreek: Use of_find_node_by_name_balanced() to find device_node
Date: Fri, 7 Feb 2025 09:31:15 +0800
Message-ID: <20250207013117.104205-8-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20250207013117.104205-1-zhangzekun11@huawei.com>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500003.china.huawei.com (7.202.181.241)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Instead of directly using of_node_get() before of_find_node_by_name()
to balance the refcount of the device_node, using wraper function
of_find_node_by_name_balanced() to make code logic a bit simplier.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/net/dsa/hirschmann/hellcreek_ptp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/dsa/hirschmann/hellcreek_ptp.c b/drivers/net/dsa/hirschmann/hellcreek_ptp.c
index bfe21f9f7dcd..360ceb6831ed 100644
--- a/drivers/net/dsa/hirschmann/hellcreek_ptp.c
+++ b/drivers/net/dsa/hirschmann/hellcreek_ptp.c
@@ -307,8 +307,7 @@ static int hellcreek_led_setup(struct hellcreek *hellcreek)
 	const char *label;
 	int ret = -EINVAL;
 
-	of_node_get(hellcreek->dev->of_node);
-	leds = of_find_node_by_name(hellcreek->dev->of_node, "leds");
+	leds = of_find_node_by_name_balanced(hellcreek->dev->of_node, "leds");
 	if (!leds) {
 		dev_err(hellcreek->dev, "No LEDs specified in device tree!\n");
 		return ret;
-- 
2.22.0


