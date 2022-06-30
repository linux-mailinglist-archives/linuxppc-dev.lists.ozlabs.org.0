Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE60561204
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 07:55:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYSHQ6ydTz3f69
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 15:55:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYSFk6qY9z3blL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 15:54:18 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 418F22009FE;
	Thu, 30 Jun 2022 07:54:16 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D5D3B2009E5;
	Thu, 30 Jun 2022 07:54:15 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 891EC1820F45;
	Thu, 30 Jun 2022 13:54:14 +0800 (+08)
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
Subject: [PATCH 3/6] ASoC: fsl_micfil: Add support for PLL switch at runtime
Date: Thu, 30 Jun 2022 13:39:11 +0800
Message-Id: <1656567554-32122-4-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1656567554-32122-1-git-send-email-shengjiu.wang@nxp.com>
References: <1656567554-32122-1-git-send-email-shengjiu.wang@nxp.com>
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

i.MX8MQ/MN/MM/MP platforms typically have 2 AUDIO PLLs being
configured to handle 8kHz and 11kHz series audio rates.

The patch implements the functionality to select at runtime
the appropriate AUDIO PLL as function of audio file rate.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/Kconfig      |  1 +
 sound/soc/fsl/fsl_micfil.c | 41 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 910b8747b6bd..533937166b4a 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -81,6 +81,7 @@ config SND_SOC_FSL_MICFIL
 	select REGMAP_MMIO
 	select SND_SOC_IMX_PCM_DMA if SND_IMX_SOC != n
 	select SND_SOC_GENERIC_DMAENGINE_PCM
+	select SND_SOC_FSL_UTILS
 	help
 	  Say Y if you want to add Pulse Density Modulation microphone
 	  interface (MICFIL) support for NXP.
diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 18ab80b68752..9b4baeb0f41d 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -24,6 +24,7 @@
 #include <sound/core.h>
 
 #include "fsl_micfil.h"
+#include "fsl_utils.h"
 
 #define MICFIL_OSR_DEFAULT	16
 
@@ -42,6 +43,8 @@ struct fsl_micfil {
 	const struct fsl_micfil_soc_data *soc;
 	struct clk *busclk;
 	struct clk *mclk;
+	struct clk *pll8k_clk;
+	struct clk *pll11k_clk;
 	struct snd_dmaengine_dai_dma_data dma_params_rx;
 	struct sdma_peripheral_config sdmacfg;
 	unsigned int dataline;
@@ -283,6 +286,37 @@ static int fsl_micfil_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
+static int fsl_micfil_reparent_rootclk(struct fsl_micfil *micfil, unsigned int sample_rate)
+{
+	struct device *dev = &micfil->pdev->dev;
+	u64 ratio = sample_rate;
+	struct clk *clk;
+	int ret;
+
+	/* Reparent clock if required condition is true */
+	if (!micfil->pll8k_clk || !micfil->pll11k_clk)
+		return 0;
+
+	ratio = do_div(ratio, 8000) ? CLK_11K_FREQ : CLK_8K_FREQ;
+
+	/* Get root clock */
+	clk = micfil->mclk;
+	if (IS_ERR_OR_NULL(clk)) {
+		dev_err(dev, "no mclk clock in devicetree\n");
+		return PTR_ERR(clk);
+	}
+
+	/* Disable clock first, for it was enabled by pm_runtime */
+	clk_disable_unprepare(clk);
+	fsl_asoc_reparent_pll_clocks(dev, clk, micfil->pll8k_clk,
+				     micfil->pll11k_clk, ratio);
+	ret = clk_prepare_enable(clk);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
@@ -306,6 +340,10 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		return ret;
 
+	ret = fsl_micfil_reparent_rootclk(micfil, rate);
+	if (ret)
+		return ret;
+
 	ret = clk_set_rate(micfil->mclk, rate * clk_div * osr * 8);
 	if (ret)
 		return ret;
@@ -610,6 +648,9 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 		return PTR_ERR(micfil->busclk);
 	}
 
+	fsl_asoc_get_pll_clocks(&pdev->dev, &micfil->pll8k_clk,
+				&micfil->pll11k_clk);
+
 	/* init regmap */
 	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(regs))
-- 
2.17.1

