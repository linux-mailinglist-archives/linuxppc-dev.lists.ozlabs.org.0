Return-Path: <linuxppc-dev+bounces-5925-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1E0A2B884
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 02:56:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ypxsc0mbvz30Sy;
	Fri,  7 Feb 2025 12:56:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.191
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738893396;
	cv=none; b=XzCws+/p2V32PgN3WFz/jSNceiWKICcrTAPR6vDNbHOCC9tWyDqV7y9Z34fKlCt8nqAOxXp9phBVf32HQFWTFtEdTwEvJ6RhjrISdFHyKkSc+kMp6EdVnCWNBcvfbIvIRf0DnbKHOjCFv/xRaM7xCtjhQNqg6WahPZQRiVe7AphABrDmRWUh3GaL55VEmfsT/iPaJHIXvN5NYNm0FmkCN0tpVHKpsC0DGgQ8c84n85RSb/+P5h2JcT6t8i3O1nK6UUuCL9eAxWABQy1jzcUg3laFu1AVg44M9XwjPEvio9E9UerzypNAl2gxCtsrmgwkMJKxLKGrZHVeQy8Bw1dQ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738893396; c=relaxed/relaxed;
	bh=HgmzFqnowmHaICe63vQCPOEp7KctLVy/XYlqp6Src5w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VCVZEw3V7eBupHoifqtK856mazBfKfF1etE4T1ikrTpB77n+4bGfRzEsoJAqRPsTcPFXq5ONhXAsIt9cdT01fjlojsJv91zTyocbm2Vk0Tw+oxiG1OyoSXnzo851yQ9bTP9JEKYDvbLpqPZpzxatWjRmy+joXiQTm6f8Z0oVr9Tezr19Qkb9sO9LqnPxvv1xKG1kh89TEd1ANfiZLoTGuYAfmzVK+rsfAR8FE5INQyZnYLTe4wKV2tRunbC50CGZ+EO90h9SHesZSsyJLPrFpkzpo+2pIS2e/eyKo3xJMMTLcPZ1MN+aotWV7lEfQi57umaVXvxFFqDoMYJn7mAdYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ypxsb2Mtqz2yvl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 12:56:35 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YpxQ10YRMz1l0lp;
	Fri,  7 Feb 2025 09:36:09 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id E03DE1A0188;
	Fri,  7 Feb 2025 09:39:47 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 7 Feb
 2025 09:39:45 +0800
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
Subject: [PATCH 4/9] media: max9286: Use of_find_node_by_name_balanced() to find device_node
Date: Fri, 7 Feb 2025 09:31:12 +0800
Message-ID: <20250207013117.104205-5-zhangzekun11@huawei.com>
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
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Instead of directly using of_node_get() before of_find_node_by_name()
to balance the refcount of the device_node, using wraper function
of_find_node_by_name_balanced() to make code logic a bit simplier.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/media/i2c/max9286.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 9fc4e130a273..0299d08a7196 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1399,9 +1399,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 	u32 i2c_clk_freq = 105000;
 	unsigned int i;
 
-	/* Balance the of_node_put() performed by of_find_node_by_name(). */
-	of_node_get(dev->of_node);
-	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
+	i2c_mux = of_find_node_by_name_balanced(dev->of_node, "i2c-mux");
 	if (!i2c_mux) {
 		dev_err(dev, "Failed to find i2c-mux node\n");
 		return -EINVAL;
-- 
2.22.0


