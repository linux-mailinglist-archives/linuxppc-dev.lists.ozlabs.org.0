Return-Path: <linuxppc-dev+bounces-783-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D994965608
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 05:58:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww4Bk2Rkkz304C;
	Fri, 30 Aug 2024 13:58:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.188
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724990318;
	cv=none; b=UJz+SRi+YFVeyYuUoaFQdm4zSEqtt2oo5TEv2M9UxF26jj8EyrRVrNxQBIx8tVPHxMc6VUN5GyBfJKkto43zT2khmVJBaq7u2+6lmUnegEUIt6Lc41zu2bf4CQoSfr7ayCT0lsXilMBwmM1FoXTTBXFTHT/wt+FxfSGqvZN6S4kItoI7MR8/DXh6fYGub1JZjrcRc+s2SpH84mTNZQii2Wtm/ARfe3iUnXbaelw6XxQHI0zu6YvyUz/kjPZOiYf4NN823PaAFqTYIZJhPIEskLQ3Qyk6cZz2INA7KeAWfjXjZAMfs/j2z0EYy0uXttvgueYGjAIHqK1cmmnYgvGs9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724990318; c=relaxed/relaxed;
	bh=g9wBhjYLlviDHiMrAUgmwPhGkeBhFmGoHFroxZyIdos=;
	h=Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy; b=fBYuCHzoUo4/UUDMWRbHLOuW4kWcP510Ll0IV8HKCk5yLwtdfAthrvdmy2Plz9fZPzAfLivEEI/6s2ptiMInmgqe12QVu4Y95X1og46YYJGciJauTnOUwgfkmXyB0HS6b5MmfluQo8F3+cdR/YPNKRCg8kgzMuHm85L8tZiC9gxmkoK95Se2iGa0bUUAn51pbxLewXgHzzrlmXi2Wz6Vnhe4BRb99ogl5eDxR5aw4ZxwUZNDU7cmQKv8PYhNS1iOcXIwuIddfegOgeUAdXUNIUaxj2j+OS+sRrfKt4PkbnO673I9Y1Uv0BzMmC2NFu8ziR28uO6EaFvnyzqEWwcytw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww4Bj3LQ6z303N
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 13:58:36 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Ww48Z2BJJzpV4p;
	Fri, 30 Aug 2024 11:56:46 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id E41171401F3;
	Fri, 30 Aug 2024 11:58:30 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 30 Aug
 2024 11:58:30 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <herve.codina@bootlin.com>, <qiang.zhao@nxp.com>,
	<christophe.leroy@csgroup.eu>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<krzk@kernel.org>, <jic23@kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v2 4/4] soc: fsl: cpm1: qmc: Simplify with dev_err_probe()
Date: Fri, 30 Aug 2024 12:06:36 +0800
Message-ID: <20240830040636.3508679-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240830040636.3508679-1-ruanjinjie@huawei.com>
References: <20240830040636.3508679-1-ruanjinjie@huawei.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Use the dev_err_probe() helper to simplify error handling during probe.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- Update the commit message.
---
 drivers/soc/fsl/qe/qmc.c | 53 ++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index d5937b5b5f15..4315af115b8e 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -1182,14 +1182,10 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 
 	for_each_available_child_of_node_scoped(np, chan_np) {
 		ret = of_property_read_u32(chan_np, "reg", &chan_id);
-		if (ret) {
-			dev_err(qmc->dev, "%pOF: failed to read reg\n", chan_np);
-			return ret;
-		}
-		if (chan_id > 63) {
-			dev_err(qmc->dev, "%pOF: Invalid chan_id\n", chan_np);
-			return -EINVAL;
-		}
+		if (ret)
+			return dev_err_probe(qmc->dev, ret, "%pOF: failed to read reg\n", chan_np);
+		if (chan_id > 63)
+			return dev_err_probe(qmc->dev, -EINVAL, "%pOF: Invalid chan_id\n", chan_np);
 
 		chan = devm_kzalloc(qmc->dev, sizeof(*chan), GFP_KERNEL);
 		if (!chan)
@@ -1201,39 +1197,34 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 		spin_lock_init(&chan->tx_lock);
 
 		ret = of_property_read_u64(chan_np, "fsl,tx-ts-mask", &ts_mask);
-		if (ret) {
-			dev_err(qmc->dev, "%pOF: failed to read fsl,tx-ts-mask\n",
-				chan_np);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(qmc->dev, ret,
+					     "%pOF: failed to read fsl,tx-ts-mask\n",
+					     chan_np);
 		chan->tx_ts_mask_avail = ts_mask;
 		chan->tx_ts_mask = chan->tx_ts_mask_avail;
 
 		ret = of_property_read_u64(chan_np, "fsl,rx-ts-mask", &ts_mask);
-		if (ret) {
-			dev_err(qmc->dev, "%pOF: failed to read fsl,rx-ts-mask\n",
-				chan_np);
-			return ret;
-		}
+		if (ret)
+			dev_err_probe(qmc->dev, ret, "%pOF: failed to read fsl,rx-ts-mask\n",
+				      chan_np);
 		chan->rx_ts_mask_avail = ts_mask;
 		chan->rx_ts_mask = chan->rx_ts_mask_avail;
 
 		mode = "transparent";
 		ret = of_property_read_string(chan_np, "fsl,operational-mode", &mode);
-		if (ret && ret != -EINVAL) {
-			dev_err(qmc->dev, "%pOF: failed to read fsl,operational-mode\n",
-				chan_np);
-			return ret;
-		}
+		if (ret && ret != -EINVAL)
+			return dev_err_probe(qmc->dev, ret,
+					     "%pOF: failed to read fsl,operational-mode\n",
+					     chan_np);
 		if (!strcmp(mode, "transparent")) {
 			chan->mode = QMC_TRANSPARENT;
 		} else if (!strcmp(mode, "hdlc")) {
 			chan->mode = QMC_HDLC;
-		} else {
-			dev_err(qmc->dev, "%pOF: Invalid fsl,operational-mode (%s)\n",
-				chan_np, mode);
-			return -EINVAL;
-		}
+		} else
+			return dev_err_probe(qmc->dev, -EINVAL,
+					     "%pOF: Invalid fsl,operational-mode (%s)\n",
+					     chan_np, mode);
 
 		chan->is_reverse_data = of_property_read_bool(chan_np,
 							      "fsl,reverse-data");
@@ -1590,10 +1581,8 @@ static int qmc_probe(struct platform_device *pdev)
 
 	/* Connect the serial (SCC) to TSA */
 	ret = tsa_serial_connect(qmc->tsa_serial);
-	if (ret) {
-		dev_err(qmc->dev, "Failed to connect TSA serial\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(qmc->dev, ret, "Failed to connect TSA serial\n");
 
 	/* Parse channels informationss */
 	ret = qmc_of_parse_chans(qmc, np);
-- 
2.34.1


