Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3F154F26F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 10:01:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPWhW4G1Vz3bsq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 18:01:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPWf42D34z3bp8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 17:59:24 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B133E201FB3;
	Fri, 17 Jun 2022 09:59:21 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 67C92201F99;
	Fri, 17 Jun 2022 09:59:21 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 842991820F45;
	Fri, 17 Jun 2022 15:59:19 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	shengjiu.wang@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	robh+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 5/7] ASoC: fsl_sai: Make res a member of struct fsl_sai
Date: Fri, 17 Jun 2022 15:44:35 +0800
Message-Id: <1655451877-16382-6-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1655451877-16382-1-git-send-email-shengjiu.wang@nxp.com>
References: <1655451877-16382-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The resource info need to be accessed by hw_params()
function for multi fifo case, the start address may
be not the FIFO0. So move it to be a member of
struct fsl_sai.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 7 +++----
 sound/soc/fsl/fsl_sai.h | 1 +
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index ddfe28cb7df0..86aa0baba848 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1077,7 +1077,6 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct fsl_sai *sai;
 	struct regmap *gpr;
-	struct resource *res;
 	void __iomem *base;
 	char tmp[8];
 	int irq, ret, i;
@@ -1092,7 +1091,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	sai->is_lsb_first = of_property_read_bool(np, "lsb-first");
 
-	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &sai->res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
@@ -1192,8 +1191,8 @@ static int fsl_sai_probe(struct platform_device *pdev)
 				   MCLK_DIR(index));
 	}
 
-	sai->dma_params_rx.addr = res->start + FSL_SAI_RDR0;
-	sai->dma_params_tx.addr = res->start + FSL_SAI_TDR0;
+	sai->dma_params_rx.addr = sai->res->start + FSL_SAI_RDR0;
+	sai->dma_params_tx.addr = sai->res->start + FSL_SAI_TDR0;
 	sai->dma_params_rx.maxburst = FSL_SAI_MAXBURST_RX;
 	sai->dma_params_tx.maxburst = FSL_SAI_MAXBURST_TX;
 
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index c0b6bc42fc3c..4d657edc9c9f 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -258,6 +258,7 @@ struct fsl_sai {
 	struct regmap *regmap;
 	struct clk *bus_clk;
 	struct clk *mclk_clk[FSL_SAI_MCLK_MAX];
+	struct resource *res;
 
 	bool is_consumer_mode;
 	bool is_lsb_first;
-- 
2.17.1

