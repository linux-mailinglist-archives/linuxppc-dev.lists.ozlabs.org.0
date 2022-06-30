Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE106561207
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 07:56:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYSHr4s6nz3fBH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 15:56:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYSFm1dyKz3blL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 15:54:20 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 782E32009F2;
	Thu, 30 Jun 2022 07:54:17 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0EC872009E5;
	Thu, 30 Jun 2022 07:54:17 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B731C180222C;
	Thu, 30 Jun 2022 13:54:15 +0800 (+08)
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
Subject: [PATCH 4/6] ASoC: fsl_sai: Add support for PLL switch at runtime
Date: Thu, 30 Jun 2022 13:39:12 +0800
Message-Id: <1656567554-32122-5-git-send-email-shengjiu.wang@nxp.com>
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
the appropriate AUDIO PLL as function of sysclk rate.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/Kconfig   |  1 +
 sound/soc/fsl/fsl_sai.c | 54 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_sai.h |  2 ++
 3 files changed, 57 insertions(+)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 533937166b4a..614eceda6b9e 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -19,6 +19,7 @@ config SND_SOC_FSL_SAI
 	select REGMAP_MMIO
 	select SND_SOC_IMX_PCM_DMA if SND_IMX_SOC != n
 	select SND_SOC_GENERIC_DMAENGINE_PCM
+	select SND_SOC_FSL_UTILS
 	help
 	  Say Y if you want to add Synchronous Audio Interface (SAI)
 	  support for the Freescale CPUs.
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index a0ddaf7e9f60..749ba9a76eb4 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -23,6 +23,7 @@
 #include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
 
 #include "fsl_sai.h"
+#include "fsl_utils.h"
 #include "imx-pcm.h"
 
 #define FSL_SAI_FLAGS (FSL_SAI_CSR_SEIE |\
@@ -220,14 +221,64 @@ static int fsl_sai_set_dai_sysclk_tr(struct snd_soc_dai *cpu_dai,
 	return 0;
 }
 
+static int fsl_sai_set_mclk_rate(struct snd_soc_dai *dai, int clk_id, unsigned int freq)
+{
+	struct fsl_sai *sai = snd_soc_dai_get_drvdata(dai);
+	struct device *dev = &sai->pdev->dev;
+	u64 ratio = freq;
+	struct clk *clk;
+	int ret;
+
+	/* Reparent clock if required condition is true */
+	if (!sai->pll8k_clk || !sai->pll11k_clk)
+		return 0;
+
+	ratio = do_div(ratio, 8000) ? CLK_11K_FREQ : CLK_8K_FREQ;
+
+	/* Get root clock */
+	clk = sai->mclk_clk[clk_id];
+	if (IS_ERR_OR_NULL(clk)) {
+		dev_err(dev, "no mclk clock in devicetree\n");
+		return PTR_ERR(clk);
+	}
+
+	fsl_asoc_reparent_pll_clocks(dev, clk, sai->pll8k_clk,
+				     sai->pll11k_clk, ratio);
+
+	ret = clk_set_rate(sai->mclk_clk[clk_id], freq);
+	if (ret < 0)
+		dev_err(dai->dev, "failed to set clock rate (%u): %d\n", freq, ret);
+
+	return ret;
+}
+
 static int fsl_sai_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
 		int clk_id, unsigned int freq, int dir)
 {
+	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
 	int ret;
 
 	if (dir == SND_SOC_CLOCK_IN)
 		return 0;
 
+	if (freq > 0 && clk_id != FSL_SAI_CLK_BUS) {
+		if (clk_id < 0 || clk_id >= FSL_SAI_MCLK_MAX) {
+			dev_err(cpu_dai->dev, "Unknown clock id: %d\n", clk_id);
+			return -EINVAL;
+		}
+
+		if (IS_ERR_OR_NULL(sai->mclk_clk[clk_id])) {
+			dev_err(cpu_dai->dev, "Unassigned clock: %d\n", clk_id);
+			return -EINVAL;
+		}
+
+		if (sai->mclk_streams == 0) {
+			ret = fsl_sai_set_mclk_rate(cpu_dai, clk_id, freq);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
 	ret = fsl_sai_set_dai_sysclk_tr(cpu_dai, clk_id, freq, true);
 	if (ret) {
 		dev_err(cpu_dai->dev, "Cannot set tx sysclk: %d\n", ret);
@@ -1281,6 +1332,9 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	else
 		sai->mclk_clk[0] = sai->bus_clk;
 
+	fsl_asoc_get_pll_clocks(&pdev->dev, &sai->pll8k_clk,
+				&sai->pll11k_clk);
+
 	/* read dataline mask for rx and tx*/
 	ret = fsl_sai_read_dlcfg(sai);
 	if (ret < 0) {
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 9bb8ced520c8..17956b5731dc 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -273,6 +273,8 @@ struct fsl_sai {
 	struct regmap *regmap;
 	struct clk *bus_clk;
 	struct clk *mclk_clk[FSL_SAI_MCLK_MAX];
+	struct clk *pll8k_clk;
+	struct clk *pll11k_clk;
 	struct resource *res;
 
 	bool is_consumer_mode;
-- 
2.17.1

