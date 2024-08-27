Return-Path: <linuxppc-dev+bounces-605-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5C49608F6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 13:39:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtQXc2M2Sz2yQG;
	Tue, 27 Aug 2024 21:38:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724758704;
	cv=none; b=F+YUVtFekXihD5RSadeCBQ4EUMqxDt0Jc3E1cvVxnegaqY2a/APsyMtL/hu0a2mU0szaZGIToOdzIQwlCizfpDhBQx2urGDZSVkGLy9x9YaAf3FJ4eD5sIUsflYvcXhmFczWUFySe/q/zZt5RrDHDKpWZ6Q07dCunO8Gth4swcQRmOV5lfDlK6pkidSTSvC8UFMawi5zjKYx2O10rH19Hqw9n7kSQAXRxgQ8ULkF4eNXQjGutR2kcNnRn3alBY1XrkXz0kuvA8fOVqfaoHAy/H3ZjeGkkVqHpaKlobjL0qic/EspgWJOuaSjlmTl7QjHCLOh1NRz4M8gCgUWchhPpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724758704; c=relaxed/relaxed;
	bh=jkEOqyUxcBoPPL5BncIqsc96Qi8FOwtCEEq+nb0MFfA=;
	h=Received:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy; b=oMdwn+CcmL907EcO+Aha+TS6C4Im5NA6uLA3DMs9zZHCNE1RNdJXQAezSN6NHgW4/5UGAk/ogKNRHNPncNF2soteCenK0XHypaAnVK+htuFakdKtTSPObkocwVoWl2sElpCZjGCt1NNPrUOBhZFPayC/dLaPIu2jFPrfB9GYO9odfWP2VfR7qGwFd7901zdKOFDNGdXsfQWsvvsoM38LOA0W8E21z83u7lx+Y5WBSg8H/h43o6FFlRggtIFtkmoRn65UscNGnYC+VrFwoerhgpPSnVVt6q9DGnLRHEqXdsEyV9mF3ANhWOr6tpThGqF933DBvGHXhkjiwHIeEEJ8+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtQXb3T2Fz2yYJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 21:38:23 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WtQQr3KRVz20mN6;
	Tue, 27 Aug 2024 19:33:24 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id B66FB180019;
	Tue, 27 Aug 2024 19:38:12 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 19:38:11 +0800
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
Subject: [PATCH -next 1/8] soc: fsl: cpm1: Simplify with scoped for each OF child loop
Date: Tue, 27 Aug 2024 19:46:00 +0800
Message-ID: <20240827114607.4019972-2-ruanjinjie@huawei.com>
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

Use scoped for_each_available_child_of_node_scoped when iterating
over device nodes to make code a bit simpler.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/soc/fsl/qe/tsa.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
index 6c5741cf5e9d..7fa399b7a47c 100644
--- a/drivers/soc/fsl/qe/tsa.c
+++ b/drivers/soc/fsl/qe/tsa.c
@@ -441,7 +441,6 @@ static inline int tsa_of_parse_tdm_tx_route(struct tsa *tsa,
 
 static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 {
-	struct device_node *tdm_np;
 	struct tsa_tdm *tdm;
 	struct clk *clk;
 	u32 tdm_id, val;
@@ -452,11 +451,10 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 	tsa->tdm[0].is_enable = false;
 	tsa->tdm[1].is_enable = false;
 
-	for_each_available_child_of_node(np, tdm_np) {
+	for_each_available_child_of_node_scoped(np, tdm_np) {
 		ret = of_property_read_u32(tdm_np, "reg", &tdm_id);
 		if (ret) {
 			dev_err(tsa->dev, "%pOF: failed to read reg\n", tdm_np);
-			of_node_put(tdm_np);
 			return ret;
 		}
 		switch (tdm_id) {
@@ -469,16 +467,14 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 		default:
 			dev_err(tsa->dev, "%pOF: Invalid tdm_id (%u)\n", tdm_np,
 				tdm_id);
-			of_node_put(tdm_np);
 			return -EINVAL;
 		}
 	}
 
-	for_each_available_child_of_node(np, tdm_np) {
+	for_each_available_child_of_node_scoped(np, tdm_np) {
 		ret = of_property_read_u32(tdm_np, "reg", &tdm_id);
 		if (ret) {
 			dev_err(tsa->dev, "%pOF: failed to read reg\n", tdm_np);
-			of_node_put(tdm_np);
 			return ret;
 		}
 
@@ -492,14 +488,12 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 			dev_err(tsa->dev,
 				"%pOF: failed to read fsl,rx-frame-sync-delay-bits\n",
 				tdm_np);
-			of_node_put(tdm_np);
 			return ret;
 		}
 		if (val > 3) {
 			dev_err(tsa->dev,
 				"%pOF: Invalid fsl,rx-frame-sync-delay-bits (%u)\n",
 				tdm_np, val);
-			of_node_put(tdm_np);
 			return -EINVAL;
 		}
 		tdm->simode_tdm |= TSA_SIMODE_TDM_RFSD(val);
@@ -511,14 +505,12 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 			dev_err(tsa->dev,
 				"%pOF: failed to read fsl,tx-frame-sync-delay-bits\n",
 				tdm_np);
-			of_node_put(tdm_np);
 			return ret;
 		}
 		if (val > 3) {
 			dev_err(tsa->dev,
 				"%pOF: Invalid fsl,tx-frame-sync-delay-bits (%u)\n",
 				tdm_np, val);
-			of_node_put(tdm_np);
 			return -EINVAL;
 		}
 		tdm->simode_tdm |= TSA_SIMODE_TDM_TFSD(val);
@@ -538,13 +530,11 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 		clk = of_clk_get_by_name(tdm_np, "l1rsync");
 		if (IS_ERR(clk)) {
 			ret = PTR_ERR(clk);
-			of_node_put(tdm_np);
 			goto err;
 		}
 		ret = clk_prepare_enable(clk);
 		if (ret) {
 			clk_put(clk);
-			of_node_put(tdm_np);
 			goto err;
 		}
 		tdm->l1rsync_clk = clk;
@@ -552,13 +542,11 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 		clk = of_clk_get_by_name(tdm_np, "l1rclk");
 		if (IS_ERR(clk)) {
 			ret = PTR_ERR(clk);
-			of_node_put(tdm_np);
 			goto err;
 		}
 		ret = clk_prepare_enable(clk);
 		if (ret) {
 			clk_put(clk);
-			of_node_put(tdm_np);
 			goto err;
 		}
 		tdm->l1rclk_clk = clk;
@@ -567,13 +555,11 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 			clk = of_clk_get_by_name(tdm_np, "l1tsync");
 			if (IS_ERR(clk)) {
 				ret = PTR_ERR(clk);
-				of_node_put(tdm_np);
 				goto err;
 			}
 			ret = clk_prepare_enable(clk);
 			if (ret) {
 				clk_put(clk);
-				of_node_put(tdm_np);
 				goto err;
 			}
 			tdm->l1tsync_clk = clk;
@@ -581,29 +567,23 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 			clk = of_clk_get_by_name(tdm_np, "l1tclk");
 			if (IS_ERR(clk)) {
 				ret = PTR_ERR(clk);
-				of_node_put(tdm_np);
 				goto err;
 			}
 			ret = clk_prepare_enable(clk);
 			if (ret) {
 				clk_put(clk);
-				of_node_put(tdm_np);
 				goto err;
 			}
 			tdm->l1tclk_clk = clk;
 		}
 
 		ret = tsa_of_parse_tdm_rx_route(tsa, tdm_np, tsa->tdms, tdm_id);
-		if (ret) {
-			of_node_put(tdm_np);
+		if (ret)
 			goto err;
-		}
 
 		ret = tsa_of_parse_tdm_tx_route(tsa, tdm_np, tsa->tdms, tdm_id);
-		if (ret) {
-			of_node_put(tdm_np);
+		if (ret)
 			goto err;
-		}
 
 		tdm->is_enable = true;
 	}
-- 
2.34.1


