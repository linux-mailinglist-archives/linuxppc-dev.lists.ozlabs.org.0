Return-Path: <linuxppc-dev+bounces-604-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8B99608F3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 13:38:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtQXb5KP7z2yZ0;
	Tue, 27 Aug 2024 21:38:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.189
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724758703;
	cv=none; b=VvkBJcvn47zOrT6IbUVM155gTRfYq12+d3C5tg8eqtzuVE29VHRy8DlH2JJcaq297q5XMjFBkFNjKlpBpjVNK5jxqZKANBCfkhF9H1f0YpTq829Flkvm+ot2s2yG/IMRisp2DMsf14D0UlpXx+b/DfozB3650mZhY7Gy+9wK+F40hJ60MNb24DJ3vtTRpFq8bhDW6ZF42ouBcOKvi7+EudQikGV+HcgW3nrZKEXPJTQ4dITnyQ1G9y8QqoVRqDI1VKkV9M18bjVs2vTqnMIlMzyVOFTSGMRjEeJBVZZZSl6jPpjZUVfeDdKZU7o+GzIjcp1ztfDfdvxcNunvAzQGEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724758703; c=relaxed/relaxed;
	bh=B9a4Nu39qZmPOTpSWwgCGmcdd//9iD0eebXMV4pjG1I=;
	h=Received:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy; b=RRut5uo04OX/MILO5sYBuumOOjwtheSxYlrYwJYGfRJXwSo7ag5C4333bStdkoTX9i592oEJSxPUHPgg4E3viHXB2CSQhF/DGhHLuOT5qXWgAvMQP2AeHJGcF3TR8kesjmZ1A2XpZFSC+VUMu2V1giPXy7nVXpTSLXhKR4s8qTKuwNBGpZoL2JR1R9JNj5M4o0Ign7YeoCC23eowAbCRK4R50kbD/DQe8+diFg8aq8g6tKYDptkDzliow8bG5JUggKldz3BjvBbN9gC8EyCmya3/+beckmedWZ0KMag9gRuT9z+Eb6GlS+qoF+965yolRoJGXiS8EuYb7IbC/Z3v2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtQXY700Kz2yLT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 21:38:19 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WtQQt453RzQqgb;
	Tue, 27 Aug 2024 19:33:26 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 41C0D140202;
	Tue, 27 Aug 2024 19:38:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 19:38:13 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <andrew@lunn.ch>, <sebastian.hesselbarth@gmail.com>,
	<gregory.clement@bootlin.com>, <herve.codina@bootlin.com>,
	<qiang.zhao@nxp.com>, <christophe.leroy@csgroup.eu>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <nm@ti.com>,
	<ssantosh@kernel.org>, <petlozup@nvidia.com>, <pshete@nvidia.com>,
	<ruanjinjie@huawei.com>, <christophe.jaillet@wanadoo.fr>,
	<ulf.hansson@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-tegra@vger.kernel.org>, <krzk@kernel.org>, <jic23@kernel.org>
Subject: [PATCH -next 4/8] soc: fsl: cpm1: qmc: Simplify with dev_err_probe()
Date: Tue, 27 Aug 2024 19:46:03 +0800
Message-ID: <20240827114607.4019972-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240827114607.4019972-1-ruanjinjie@huawei.com>
References: <20240827114607.4019972-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Use the dev_err_probe() helper to simplify error handling during probe.
This also handle scenario, when EDEFER is returned and useless error
is printed.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
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


