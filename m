Return-Path: <linuxppc-dev+bounces-786-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C6A96560E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 05:59:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww4Bm2Rsnz305n;
	Fri, 30 Aug 2024 13:58:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724990320;
	cv=none; b=PBeBtdOb8kZ3x1LreaNElq6tDccLDtlsHH1IjX4y26mV+kYTUMxm5leUmpRbynjG6U7rZGY5xwZoy0QqYg9wyF2wuSAS6Vx0dz/ZOGGzHL7+kO22wNxJHB6b0D+kQmF7+jpO6EShexvAXdU8PDEoWsf92Xgo6BxWO5qEZOdZfi2ffUSjWfOwA7ROzkHVJ27nAm8JVsUWcGKfYAg2hJXJe7UH+CKBQiSInB+AxtOXYXtDCf+1GJWLevSifnAzHMdUEqLL4/P3d3kP1lYi3oRLgrG42YlONoAZGppD9yvC3H0KLQJ+oHop4ejI2zlPkNKYNymOoutWM4MGSa2BbKHqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724990320; c=relaxed/relaxed;
	bh=jkEOqyUxcBoPPL5BncIqsc96Qi8FOwtCEEq+nb0MFfA=;
	h=Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy; b=K7O39Wsh69dBxXVtOpnTbSfzYER4QV3bV9MoycWJlOAE1rWTYITdj2CDkqB9EzJ4nQiq2Xim5b0APOvhLtB9eWvWPd399qo4+nB9W0OjJ1SaSu3T38CnpmHyBiWyJGehkxcfTwOE/iaUUKf2FqK4puzX8D4mupW1UyDa3WChex1Mtr2vEKaMs29qB5dhS6QpPG/UbBncf/7RCmmdqhHAvZEgPKJTkA8B0+IrkxSN456UIs4k6HjjeMhdH7LMTBZJXuqCorNqxBJIzqwDliluG+3zemb1fZRDgD9Nidg4TL+oRc/LdC1926LGuSQ5hxloPvLrNXOAuk5euZ+/pegOFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww4Bl3c9Cz3041
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 13:58:39 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Ww4BJ0Vtvz2DbbD;
	Fri, 30 Aug 2024 11:58:16 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 950761A0188;
	Fri, 30 Aug 2024 11:58:29 +0800 (CST)
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
Subject: [PATCH -next v2 1/4] soc: fsl: cpm1: Simplify with scoped for each OF child loop
Date: Fri, 30 Aug 2024 12:06:33 +0800
Message-ID: <20240830040636.3508679-2-ruanjinjie@huawei.com>
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


