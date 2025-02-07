Return-Path: <linuxppc-dev+bounces-5928-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D077A2B889
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 03:00:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ypxxw74L7z30T1;
	Fri,  7 Feb 2025 13:00:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738893620;
	cv=none; b=AblRyUU3rAxcimMXz+Qc64N9x7xeuIyIau5ZMF3LPOqnjcqYgHF5us+zISiskpZ4OxBe3PfrbixCeIaHFpAbz2uJG/JhM2Xq/NbZcMcQpQNBtPtThtcV48bEHvN0FJAXIFgm6TA9YpJYfHZ2eGZCKAUJqahiq+huqpaURWpgBH9pHQXLt9gAgyXW6QJmMaTOoFL++xJDlxk4UnPnswz/lCL6bNlvMtI6LeWf5BvhlwcrjGhB3tDFpCUba/Y1j/8VQyb1Y5TueUWbt+9qcIoTUP/Ofk9Vbm4rPxDJj1+bsfiR3574RXCcUMPNS2B9Zx1HR/s7K8U0OSUvyB4IEY9M6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738893620; c=relaxed/relaxed;
	bh=p4mWCtrk7n0Ch1AiiJ9Uk6VD8300/kQGSsE6469uRzg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cMknIDoIME44a4LpGIEe/4Vw0f1BV1+Qvo2JWlpRCQ3DGijAP8v+OP+XWKbr/yyRRC331pGNzgPt3HMSdH/+vHd2UuhNF8cB3xr9y8a0juILn3+mJBMlfJuXm1Fc3/UJu2VqNdN+yj8j1dM8JYRdOXH8E70NaJ2cHrXAAXSvuyflvhIgsjfD5U9zerRst2bKWra6QiQnzz7TT9oJ/DrREJXfl4yvSu3RQG6d3N6m25xXa/wNhoRnYlN+QLPCmOHeNSWd9aJOv2ahiKfY8cgJd+d38q9hD6ItZAR402dtb1+5yuLdO9AJ48DieLfflJwawnxOg1ellrth4kI4rS4p7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ypxxw1MyRz30Qk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 13:00:20 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YpxR24hwTz22m8l;
	Fri,  7 Feb 2025 09:37:02 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id A8ED714010C;
	Fri,  7 Feb 2025 09:39:49 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 7 Feb
 2025 09:39:47 +0800
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
Subject: [PATCH 5/9] powerpc: Use of_find_node_by_name_balanced() to find device_node
Date: Fri, 7 Feb 2025 09:31:13 +0800
Message-ID: <20250207013117.104205-6-zhangzekun11@huawei.com>
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
 arch/powerpc/platforms/powermac/pic.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
index 2202bf77c7a3..0619334adf2a 100644
--- a/arch/powerpc/platforms/powermac/pic.c
+++ b/arch/powerpc/platforms/powermac/pic.c
@@ -308,9 +308,7 @@ static void __init pmac_pic_probe_oldstyle(void)
 
 		/* We might have a second cascaded heathrow */
 
-		/* Compensate for of_node_put() in of_find_node_by_name() */
-		of_node_get(master);
-		slave = of_find_node_by_name(master, "mac-io");
+		slave = of_find_node_by_name_balanced(master, "mac-io");
 
 		/* Check ordering of master & slave */
 		if (of_device_is_compatible(master, "gatwick")) {
-- 
2.22.0


