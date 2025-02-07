Return-Path: <linuxppc-dev+bounces-5926-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1956A2B887
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 02:58:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ypxvy52VCz30Pl;
	Fri,  7 Feb 2025 12:58:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.189
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738893518;
	cv=none; b=aKAK4toeoPi28uexSWjCWqvHndB4BOZ0Thfg6/74paDx0EhhXSBJpAS6Utw+2BvLo2m4eMDOy46HiUp0ym+/X8XH5jmnP15u+VN1i+yNwst4szVPlzHn3+5Mwa/eOecPGkn6Uwe5celq8zRriIBzRbs4gvjluu+4aWIllQ95N70ohpZ4z4TvZKI2p2NIO4wBKks1gQYJ+fPH1hsnw7zFS0IcN3J/mMqS5Gy0wZFkN//Qv9B9oi6e2sR3rLFDdZkSwHw9FvvtsQOJ4Bf2tiSszLhZK6eN4K+B1mP5FgtpErsJLHe9UMqo4JBIX9AHEzrPyciCCkymNbO6OycVb4phpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738893518; c=relaxed/relaxed;
	bh=No3eO3i874ScDiXujnBPmjZ64FfX9PGQgsSFjcx+w0I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S3RNyip3Rgc8v9tgnP8TOc3Qw8H3hJ4NsTUgBmhlMyD5W39kyo3l3ienQS2V0IsF+MF3CpEP58Pq1OJ4oTfFVsIYF+F0Dei3H3qNpmmxY+0hSrRXCfbx6kNxD9xInEv23yaFVNJQqep5kHnYNAT4RViWHxEUaXO3/EytgZdKmhq/JTxOESWEaAFaSKKACL6Oa6q+M+88TiQYVqNN8tqch3lC5Ei1aFL+Mrkfyj0ZOYAHfe9tU5/iyCcQxD2Hzq392YovAWesvS7IPIM/2ACU+QkgpCF42fxdoXVi0mK1RmQwv2iDRN7Qa15KPrpRCtvnF5Y8CjFZHehJP22K/ueZyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ypxvx6Zl8z30PF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 12:58:37 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4YpxQy6DbnzmZC4;
	Fri,  7 Feb 2025 09:36:58 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 21BB41400DD;
	Fri,  7 Feb 2025 09:39:46 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 7 Feb
 2025 09:39:44 +0800
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
Subject: [PATCH 3/9] net: pse-pd: Add missing of_node_get() before of_find_node_by_name()
Date: Fri, 7 Feb 2025 09:31:11 +0800
Message-ID: <20250207013117.104205-4-zhangzekun11@huawei.com>
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

of_find_node_by_name() will decrease the refount of the device_node.
So, get the device_node before passing to it.

Fixes: 20e6d190ffe1 ("net: pse-pd: Add TI TPS23881 PSE controller driver")
Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/net/pse-pd/tps23881.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/pse-pd/tps23881.c b/drivers/net/pse-pd/tps23881.c
index 5e9dda2c0eac..a595358ac60b 100644
--- a/drivers/net/pse-pd/tps23881.c
+++ b/drivers/net/pse-pd/tps23881.c
@@ -502,7 +502,7 @@ tps23881_get_of_channels(struct tps23881_priv *priv,
 	if (!priv->np)
 		return -EINVAL;
 
-	channels_node = of_find_node_by_name(priv->np, "channels");
+	channels_node = of_find_node_by_name_balanced(priv->np, "channels");
 	if (!channels_node)
 		return -EINVAL;
 
-- 
2.22.0


