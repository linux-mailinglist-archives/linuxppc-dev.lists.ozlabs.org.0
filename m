Return-Path: <linuxppc-dev+bounces-785-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F4196560C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 05:58:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww4Bm1tl2z305m;
	Fri, 30 Aug 2024 13:58:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.255
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724990320;
	cv=none; b=DfYirK/H9fdYrMFzyg+wjm3IQDN4T4s7lJoIhnaSKK9KEe4g8ysybFpli4//nI8lKaQKDYmpmBjH8sywGFmbL9qmwv8dQMcGalRj8z3IAup6wHEpiVeUgNFbVY67ElZTV/+Q8bUtZCDoOl3OWsPQ9f1rsx1hXvG0bgPx2Jw26T3hJ68X9ng3Td5bampnvVo6qA02h/4LdZudwhrB0IkPPdymZ4MU//3+7kxog3GaETyWT3bFzJm2ucRLH45SEbLvbMAp3VyLfZdsmrMe5aPiPUX2H9UE9xvhsZS1UnTztGp4qtkNFWnvjAyUYtApw6BMKa2A7LfbFK5xUK/buu6ELA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724990320; c=relaxed/relaxed;
	bh=4X6/RxMpsbE97p+Qhg9yQOSsLMtRv4l/pqbipQn/Ulk=;
	h=Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy; b=Hn+2QDcp/RfV51sDkGLVXsjnfXHYWjzcOLhLK4GDuWRT2DJLveJyqtPu3utZMS5vXk5TAv9gNWkMwtOBhQlvwSP4Hyc/R1jh/mPWgexn4Qt0YiWDJ6YMWZ/rapQJeysLMmVUDTXgSJyrvsqifTHaS7Yz3JnuT4cba5qOskVnbsMWl8AkHyn7JduJdFl9rFHO6m/IEl5omLzGnBija8XPNU3ctTTHZB4UhMdZNVLPKiIKzb2HuDSutBSOamVboF5Oi8W8hpy1o92kg2FwTHQYc8NGPl50Vx7lZfYQqgqTD7mhiofcMi0cXKWArkAsO9Jtm1Pl6NeLd7T7N5GoXHZX0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww4Bl5v8nz305j
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 13:58:39 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Ww49c088gz18Mwr;
	Fri, 30 Aug 2024 11:57:40 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 70B831401F3;
	Fri, 30 Aug 2024 11:58:30 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 30 Aug
 2024 11:58:29 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <herve.codina@bootlin.com>, <qiang.zhao@nxp.com>,
	<christophe.leroy@csgroup.eu>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<krzk@kernel.org>, <jic23@kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v2 3/4] soc: fsl: cpm1: qmc: Simplify with scoped for each OF child
Date: Fri, 30 Aug 2024 12:06:35 +0800
Message-ID: <20240830040636.3508679-4-ruanjinjie@huawei.com>
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

Use scoped for_each_available_child_of_node_scoped() when iterating
over device nodes to make code a bit simpler.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/soc/fsl/qe/qmc.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 76bb496305a0..d5937b5b5f15 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -1174,31 +1174,26 @@ static unsigned int qmc_nb_chans(struct qmc *qmc)
 
 static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 {
-	struct device_node *chan_np;
 	struct qmc_chan *chan;
 	const char *mode;
 	u32 chan_id;
 	u64 ts_mask;
 	int ret;
 
-	for_each_available_child_of_node(np, chan_np) {
+	for_each_available_child_of_node_scoped(np, chan_np) {
 		ret = of_property_read_u32(chan_np, "reg", &chan_id);
 		if (ret) {
 			dev_err(qmc->dev, "%pOF: failed to read reg\n", chan_np);
-			of_node_put(chan_np);
 			return ret;
 		}
 		if (chan_id > 63) {
 			dev_err(qmc->dev, "%pOF: Invalid chan_id\n", chan_np);
-			of_node_put(chan_np);
 			return -EINVAL;
 		}
 
 		chan = devm_kzalloc(qmc->dev, sizeof(*chan), GFP_KERNEL);
-		if (!chan) {
-			of_node_put(chan_np);
+		if (!chan)
 			return -ENOMEM;
-		}
 
 		chan->id = chan_id;
 		spin_lock_init(&chan->ts_lock);
@@ -1209,7 +1204,6 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 		if (ret) {
 			dev_err(qmc->dev, "%pOF: failed to read fsl,tx-ts-mask\n",
 				chan_np);
-			of_node_put(chan_np);
 			return ret;
 		}
 		chan->tx_ts_mask_avail = ts_mask;
@@ -1219,7 +1213,6 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 		if (ret) {
 			dev_err(qmc->dev, "%pOF: failed to read fsl,rx-ts-mask\n",
 				chan_np);
-			of_node_put(chan_np);
 			return ret;
 		}
 		chan->rx_ts_mask_avail = ts_mask;
@@ -1230,7 +1223,6 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 		if (ret && ret != -EINVAL) {
 			dev_err(qmc->dev, "%pOF: failed to read fsl,operational-mode\n",
 				chan_np);
-			of_node_put(chan_np);
 			return ret;
 		}
 		if (!strcmp(mode, "transparent")) {
@@ -1240,7 +1232,6 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 		} else {
 			dev_err(qmc->dev, "%pOF: Invalid fsl,operational-mode (%s)\n",
 				chan_np, mode);
-			of_node_put(chan_np);
 			return -EINVAL;
 		}
 
-- 
2.34.1


