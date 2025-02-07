Return-Path: <linuxppc-dev+bounces-5924-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A66A2B883
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 02:56:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YpxsW5Smgz30Gf;
	Fri,  7 Feb 2025 12:56:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.188
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738893391;
	cv=none; b=mFTG4UvTitcpvcrUfc1nK6bVld1rfrMNvmFjMH0dOJelOner2Cn5AuEr+MK3EFEwC9n8Mmx3++j4bd1brPeXJkdOrU5lkZfHq8URJszGxUL7ciEkXds3+W1rqx1ErECtgb/0pjkQLG+k3ZjccT5UF9R9MWfwYtTBifWPkdTx/Esb+K5r6vxnqBV1OAvsZRj+4pgqkgOd7No1KJeqz3/DkTTMjG0rMRms6jNQT1vCIqG0RqjjlnB6xPWtAeQWwYLCard6vBkk0Re7gaf8e4frIY8nzVY5YiXDBD9NQZ0F1DdqRMIa9aazhm6MIruqMOVn+p3Y8YetrjEWTZXz2F7M4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738893391; c=relaxed/relaxed;
	bh=8c4ShNb79VS3uJ78niPOF4xUIo8m2Xpczu98d0+MjB8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A2SxuBwCpLlMiSP0/ZOn5htg2gyKrsDZ+5QwtteuufUOyFq8S8Xds75GTsHMi3aYW2g0HndEz/ufq27T5u0tq0Y+UJA+nAJz88m7BeHuuhFb2FlhrI3olBwWye/RQ15MF+ke05L1Loma6fhoSV6GnaKUkpdjOZSTJsX7y3NQkth6RHApB6oS62bIeyN2YcUoJsPIvbIj50mbP3PBwhm8kgEUlJX5vwY9KPHWPA26bxC271Tu5VXM6A03Djg3KI7JVX1P3QbXm9fjuGhr7z4E+zdvpQPRa7XTXa6cP7QMy8yKiaUercxwVB/4Zi9tYrz2XS0k3kf9WmPhgEj1FDCkqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YpxsV72hpz2yvl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 12:56:30 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YpxQT1ty7zgcbJ;
	Fri,  7 Feb 2025 09:36:33 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 73B881400DD;
	Fri,  7 Feb 2025 09:39:51 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 7 Feb
 2025 09:39:49 +0800
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
Subject: [PATCH 6/9] net: dsa: Use of_find_node_by_name_balanced() to find device_node
Date: Fri, 7 Feb 2025 09:31:14 +0800
Message-ID: <20250207013117.104205-7-zhangzekun11@huawei.com>
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
 drivers/net/dsa/bcm_sf2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
index fa2bf3fa9019..7567686317f1 100644
--- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -1435,9 +1435,7 @@ static int bcm_sf2_sw_probe(struct platform_device *pdev)
 	set_bit(0, priv->cfp.used);
 	set_bit(0, priv->cfp.unique);
 
-	/* Balance of_node_put() done by of_find_node_by_name() */
-	of_node_get(dn);
-	ports = of_find_node_by_name(dn, "ports");
+	ports = of_find_node_by_name_balanced(dn, "ports");
 	if (ports) {
 		bcm_sf2_identify_ports(priv, ports);
 		of_node_put(ports);
-- 
2.22.0


