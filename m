Return-Path: <linuxppc-dev+bounces-5922-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56869A2B87F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 02:55:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ypxrf0YsLz30P3;
	Fri,  7 Feb 2025 12:55:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738893346;
	cv=none; b=aPRjOMhGN1+BycdJaGkDg9325TdfYz3IgO14DghjHPxbw9BTTa1czSaNhyifSL9fgA7OrmlPXBSZ+rYyrdT7C8ahsuRx6LfYXpOPmym1XcyK81Yi8M4dsx0UCtUOd9ico/tgkAurPDT6fK95vE9/qLwudq/YbN9xvPsaeX5gpcLb84e2oBYY8Dj88rTxXCJHOkIDeUyRSBidanK4zOo9D2mJnw3WqtvenYRjeOa9LGF932lNTCc9z2beXHqacoaGNRf6KgOT9j5AOkd7Syya913XmnHQ8t4NRWMAjnw0w0faNp2qyU6blscN+06Rbh9uRipfVdfVM9YESGkY3G9Iwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738893346; c=relaxed/relaxed;
	bh=a9qKJ6pCH39CfmrQbm+rcyMj2NCDIgMIm8UYN6/0Uz4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TV1a8QVXEbR/GtPKIBhwRR6DtqL6e3Uh4SOPLF4hwyneCq98ZUze6P25lE/AieW4QuzVCFoCL5XtjVPTMKiq7reAzQ7VClMz3TA3wB1+EUNzTFkCexjZw1xvmnAvFoyirV/De0u0+JFGncYDAoEsDE8Q/0OolQuVBNnpoPn+tZus+sH1DcEJz73NNLQyAVmohvESoE10B/VH/QYNktkHwtr3Cv0JOPEmIi722ternVSucjbST8zJbJ69K9bQ5I1dIk/f1t1il0UJaWzugJWNnjwwFpk04zAGq/Uo0IsOer1BLeoO8DLjPa+eFL75dIyV/8lhltm/uvbJedF91teKsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ypxrd1mc7z2yvl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 12:55:44 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YpxPx2CKLz2Fd0Z;
	Fri,  7 Feb 2025 09:36:05 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 579D2180216;
	Fri,  7 Feb 2025 09:39:44 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 7 Feb
 2025 09:39:42 +0800
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
Subject: [PATCH 2/9] net: bcmasp: Add missing of_node_get() before of_find_node_by_name()
Date: Fri, 7 Feb 2025 09:31:10 +0800
Message-ID: <20250207013117.104205-3-zhangzekun11@huawei.com>
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

of_find_node_by_name() will decrease the refcount of the device_node.
So, get the device_node before passing to it.

Fixes: 490cb412007d ("net: bcmasp: Add support for ASP2.0 Ethernet controller")
Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/net/ethernet/broadcom/asp2/bcmasp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.c b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
index a68fab1b05f0..093c8ea72af9 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
@@ -1367,7 +1367,7 @@ static int bcmasp_probe(struct platform_device *pdev)
 	bcmasp_core_init(priv);
 	bcmasp_core_init_filters(priv);
 
-	ports_node = of_find_node_by_name(dev->of_node, "ethernet-ports");
+	ports_node = of_find_node_by_name_balanced(dev->of_node, "ethernet-ports");
 	if (!ports_node) {
 		dev_warn(dev, "No ports found\n");
 		return -EINVAL;
-- 
2.22.0


