Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20144F7070
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 10:24:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BQSK01lkzF3jk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 20:24:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BQMW0jwlzF4YX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 20:20:22 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0377020011D;
 Mon, 11 Nov 2019 10:20:20 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B39412005C3;
 Mon, 11 Nov 2019 10:20:13 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 61028402B7;
 Mon, 11 Nov 2019 17:20:06 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: [PATCH V3 2/2] ASoC: fsl_asrc: Add support for imx8qm
Date: Mon, 11 Nov 2019 17:18:23 +0800
Message-Id: <3c3e59ae7adde852f133a5d7c2cbb2730362fc53.1573462647.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <b1c922b3496020f611ecd6ea27d262369646d830.1573462647.git.shengjiu.wang@nxp.com>
References: <b1c922b3496020f611ecd6ea27d262369646d830.1573462647.git.shengjiu.wang@nxp.com>
In-Reply-To: <b1c922b3496020f611ecd6ea27d262369646d830.1573462647.git.shengjiu.wang@nxp.com>
References: <b1c922b3496020f611ecd6ea27d262369646d830.1573462647.git.shengjiu.wang@nxp.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are two asrc module in imx8qm, each module has different
clock configuration, and the DMA type is EDMA.

So in this patch, we define the new clocks, refine the clock map,
and include struct fsl_asrc_soc_data for different soc usage.

The EDMA channel is fixed with each dma request, one dma request
corresponding to one dma channel. So we need to request dma
channel with dma request of asrc module.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2
- use !use_edma to wrap code in fsl_asrc_dma
- add Acked-by: Nicolin Chen

changes in v3
- remove the acked-by for commit is updated
- read "fsl,asrc-clk-map" property, and update table
  clk_map_imx8qm.

 sound/soc/fsl/fsl_asrc.c     | 112 ++++++++++++++++++++++++++++-------
 sound/soc/fsl/fsl_asrc.h     |  64 +++++++++++++++++++-
 sound/soc/fsl/fsl_asrc_dma.c |  42 +++++++++----
 3 files changed, 183 insertions(+), 35 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index a3cfceea7d2f..03de33de8633 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -41,26 +41,62 @@ static struct snd_pcm_hw_constraint_list fsl_asrc_rate_constraints = {
  * The following tables map the relationship between asrc_inclk/asrc_outclk in
  * fsl_asrc.h and the registers of ASRCSR
  */
-static unsigned char input_clk_map_imx35[] = {
+static unsigned char input_clk_map_imx35[ASRC_CLK_MAP_LEN] = {
 	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf,
+	3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
+	3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
 };
 
-static unsigned char output_clk_map_imx35[] = {
+static unsigned char output_clk_map_imx35[ASRC_CLK_MAP_LEN] = {
 	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf,
+	3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
+	3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
 };
 
 /* i.MX53 uses the same map for input and output */
-static unsigned char input_clk_map_imx53[] = {
+static unsigned char input_clk_map_imx53[ASRC_CLK_MAP_LEN] = {
 /*	0x0  0x1  0x2  0x3  0x4  0x5  0x6  0x7  0x8  0x9  0xa  0xb  0xc  0xd  0xe  0xf */
 	0x0, 0x1, 0x2, 0x7, 0x4, 0x5, 0x6, 0x3, 0x8, 0x9, 0xa, 0xb, 0xc, 0xf, 0xe, 0xd,
+	0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7,
+	0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7,
 };
 
-static unsigned char output_clk_map_imx53[] = {
+static unsigned char output_clk_map_imx53[ASRC_CLK_MAP_LEN] = {
 /*	0x0  0x1  0x2  0x3  0x4  0x5  0x6  0x7  0x8  0x9  0xa  0xb  0xc  0xd  0xe  0xf */
 	0x8, 0x9, 0xa, 0x7, 0xc, 0x5, 0x6, 0xb, 0x0, 0x1, 0x2, 0x3, 0x4, 0xf, 0xe, 0xd,
+	0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7,
+	0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7,
 };
 
-static unsigned char *clk_map[2];
+/**
+ * i.MX8QM/i.MX8QXP uses the same map for input and output.
+ * clk_map_imx8qm[0] is for i.MX8QM asrc0
+ * clk_map_imx8qm[1] is for i.MX8QM asrc1
+ * clk_map_imx8qm[2] is for i.MX8QXP asrc0
+ * clk_map_imx8qm[3] is for i.MX8QXP asrc1
+ */
+static unsigned char clk_map_imx8qm[4][ASRC_CLK_MAP_LEN] = {
+	{
+	0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x0,
+	0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf,
+	0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf,
+	},
+	{
+	0xf, 0xf, 0xf, 0xf, 0xf, 0x7, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x0,
+	0x0, 0x1, 0x2, 0x3, 0xb, 0xc, 0xf, 0xf, 0xd, 0xe, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf,
+	0x4, 0x5, 0x6, 0xf, 0x8, 0x9, 0xa, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf,
+	},
+	{
+	0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x0,
+	0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0xf, 0x7, 0x8, 0x9, 0xa, 0xb, 0xc, 0xf, 0xf,
+	0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf,
+	},
+	{
+	0xf, 0xf, 0xf, 0xf, 0xf, 0x7, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x0,
+	0x0, 0x1, 0x2, 0x3, 0x7, 0x8, 0xf, 0xf, 0x9, 0xa, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf,
+	0xf, 0xf, 0x6, 0xf, 0xf, 0xf, 0xa, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf,
+	},
+};
 
 /**
  * Select the pre-processing and post-processing options
@@ -353,8 +389,8 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 	}
 
 	/* Validate input and output clock sources */
-	clk_index[IN] = clk_map[IN][config->inclk];
-	clk_index[OUT] = clk_map[OUT][config->outclk];
+	clk_index[IN] = asrc_priv->clk_map[IN][config->inclk];
+	clk_index[OUT] = asrc_priv->clk_map[OUT][config->outclk];
 
 	/* We only have output clock for ideal ratio mode */
 	clk = asrc_priv->asrck_clk[clk_index[ideal ? OUT : IN]];
@@ -398,13 +434,13 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 	/* Set the channel number */
 	channels = config->channel_num;
 
-	if (asrc_priv->channel_bits < 4)
+	if (asrc_priv->soc->channel_bits < 4)
 		channels /= 2;
 
 	/* Update channels for current pair */
 	regmap_update_bits(asrc_priv->regmap, REG_ASRCNCR,
-			   ASRCNCR_ANCi_MASK(index, asrc_priv->channel_bits),
-			   ASRCNCR_ANCi(index, channels, asrc_priv->channel_bits));
+			   ASRCNCR_ANCi_MASK(index, asrc_priv->soc->channel_bits),
+			   ASRCNCR_ANCi(index, channels, asrc_priv->soc->channel_bits));
 
 	/* Default setting: Automatic selection for processing mode */
 	regmap_update_bits(asrc_priv->regmap, REG_ASRCTR,
@@ -531,7 +567,7 @@ static int fsl_asrc_dai_startup(struct snd_pcm_substream *substream,
 	struct fsl_asrc *asrc_priv = snd_soc_dai_get_drvdata(dai);
 
 	/* Odd channel number is not valid for older ASRC (channel_bits==3) */
-	if (asrc_priv->channel_bits == 3)
+	if (asrc_priv->soc->channel_bits == 3)
 		snd_pcm_hw_constraint_step(substream->runtime, 0,
 					   SNDRV_PCM_HW_PARAM_CHANNELS, 2);
 
@@ -905,6 +941,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	struct resource *res;
 	void __iomem *regs;
 	int irq, ret, i;
+	u32 map_idx;
 	char tmp[16];
 
 	asrc_priv = devm_kzalloc(&pdev->dev, sizeof(*asrc_priv), GFP_KERNEL);
@@ -964,14 +1001,33 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		}
 	}
 
+	asrc_priv->soc = of_device_get_match_data(&pdev->dev);
+	if (!asrc_priv->soc) {
+		dev_err(&pdev->dev, "failed to get soc data\n");
+		return -ENODEV;
+	}
+
 	if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
-		asrc_priv->channel_bits = 3;
-		clk_map[IN] = input_clk_map_imx35;
-		clk_map[OUT] = output_clk_map_imx35;
-	} else {
-		asrc_priv->channel_bits = 4;
-		clk_map[IN] = input_clk_map_imx53;
-		clk_map[OUT] = output_clk_map_imx53;
+		asrc_priv->clk_map[IN] = input_clk_map_imx35;
+		asrc_priv->clk_map[OUT] = output_clk_map_imx35;
+	} else if (of_device_is_compatible(np, "fsl,imx53-asrc")) {
+		asrc_priv->clk_map[IN] = input_clk_map_imx53;
+		asrc_priv->clk_map[OUT] = output_clk_map_imx53;
+	} else if (of_device_is_compatible(np, "fsl,imx8qm-asrc")) {
+		ret = of_property_read_u32(np, "fsl,asrc-clk-map",
+					   &map_idx);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to get clk map index\n");
+			return ret;
+		}
+
+		if (map_idx > 3) {
+			dev_err(&pdev->dev, "unsupported clk map index\n");
+			return -EINVAL;
+		}
+
+		asrc_priv->clk_map[IN] = clk_map_imx8qm[map_idx];
+		asrc_priv->clk_map[OUT] = clk_map_imx8qm[map_idx];
 	}
 
 	ret = fsl_asrc_init(asrc_priv);
@@ -1113,9 +1169,25 @@ static const struct dev_pm_ops fsl_asrc_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(fsl_asrc_suspend, fsl_asrc_resume)
 };
 
+static const struct fsl_asrc_soc_data fsl_asrc_imx35_data = {
+	.use_edma = false,
+	.channel_bits = 3,
+};
+
+static const struct fsl_asrc_soc_data fsl_asrc_imx53_data = {
+	.use_edma = false,
+	.channel_bits = 4,
+};
+
+static const struct fsl_asrc_soc_data fsl_asrc_imx8qm_data = {
+	.use_edma = true,
+	.channel_bits = 4,
+};
+
 static const struct of_device_id fsl_asrc_ids[] = {
-	{ .compatible = "fsl,imx35-asrc", },
-	{ .compatible = "fsl,imx53-asrc", },
+	{ .compatible = "fsl,imx35-asrc", .data = &fsl_asrc_imx35_data },
+	{ .compatible = "fsl,imx53-asrc", .data = &fsl_asrc_imx53_data },
+	{ .compatible = "fsl,imx8qm-asrc", .data = &fsl_asrc_imx8qm_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_asrc_ids);
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 2b57e8c53728..8a821132d9d0 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -308,6 +308,29 @@ enum asrc_inclk {
 	INCLK_SSI3_TX = 0x0b,
 	INCLK_SPDIF_TX = 0x0c,
 	INCLK_ASRCK1_CLK = 0x0f,
+
+	/* clocks for imx8 */
+	INCLK_AUD_PLL_DIV_CLK0 = 0x10,
+	INCLK_AUD_PLL_DIV_CLK1 = 0x11,
+	INCLK_AUD_CLK0         = 0x12,
+	INCLK_AUD_CLK1         = 0x13,
+	INCLK_ESAI0_RX_CLK     = 0x14,
+	INCLK_ESAI0_TX_CLK     = 0x15,
+	INCLK_SPDIF0_RX        = 0x16,
+	INCLK_SPDIF1_RX        = 0x17,
+	INCLK_SAI0_RX_BCLK     = 0x18,
+	INCLK_SAI0_TX_BCLK     = 0x19,
+	INCLK_SAI1_RX_BCLK     = 0x1a,
+	INCLK_SAI1_TX_BCLK     = 0x1b,
+	INCLK_SAI2_RX_BCLK     = 0x1c,
+	INCLK_SAI3_RX_BCLK     = 0x1d,
+	INCLK_ASRC0_MUX_CLK    = 0x1e,
+
+	INCLK_ESAI1_RX_CLK     = 0x20,
+	INCLK_ESAI1_TX_CLK     = 0x21,
+	INCLK_SAI6_TX_BCLK     = 0x22,
+	INCLK_HDMI_RX_SAI0_RX_BCLK     = 0x24,
+	INCLK_HDMI_TX_SAI0_TX_BCLK     = 0x25,
 };
 
 enum asrc_outclk {
@@ -325,9 +348,33 @@ enum asrc_outclk {
 	OUTCLK_SSI3_RX = 0x0b,
 	OUTCLK_SPDIF_RX = 0x0c,
 	OUTCLK_ASRCK1_CLK = 0x0f,
+
+	/* clocks for imx8 */
+	OUTCLK_AUD_PLL_DIV_CLK0 = 0x10,
+	OUTCLK_AUD_PLL_DIV_CLK1 = 0x11,
+	OUTCLK_AUD_CLK0         = 0x12,
+	OUTCLK_AUD_CLK1         = 0x13,
+	OUTCLK_ESAI0_RX_CLK     = 0x14,
+	OUTCLK_ESAI0_TX_CLK     = 0x15,
+	OUTCLK_SPDIF0_RX        = 0x16,
+	OUTCLK_SPDIF1_RX        = 0x17,
+	OUTCLK_SAI0_RX_BCLK     = 0x18,
+	OUTCLK_SAI0_TX_BCLK     = 0x19,
+	OUTCLK_SAI1_RX_BCLK     = 0x1a,
+	OUTCLK_SAI1_TX_BCLK     = 0x1b,
+	OUTCLK_SAI2_RX_BCLK     = 0x1c,
+	OUTCLK_SAI3_RX_BCLK     = 0x1d,
+	OUTCLK_ASRCO_MUX_CLK    = 0x1e,
+
+	OUTCLK_ESAI1_RX_CLK     = 0x20,
+	OUTCLK_ESAI1_TX_CLK     = 0x21,
+	OUTCLK_SAI6_TX_BCLK     = 0x22,
+	OUTCLK_HDMI_RX_SAI0_RX_BCLK     = 0x24,
+	OUTCLK_HDMI_TX_SAI0_TX_BCLK     = 0x25,
 };
 
 #define ASRC_CLK_MAX_NUM	16
+#define ASRC_CLK_MAP_LEN	0x30
 
 enum asrc_word_width {
 	ASRC_WIDTH_24_BIT = 0,
@@ -387,6 +434,17 @@ struct dma_block {
 	unsigned int length;
 };
 
+/**
+ * fsl_asrc_soc_data: soc specific data
+ *
+ * @use_edma: using edma as dma device or not
+ * @channel_bits: width of ASRCNCR register for each pair
+ */
+struct fsl_asrc_soc_data {
+	bool use_edma;
+	unsigned int channel_bits;
+};
+
 /**
  * fsl_asrc_pair: ASRC Pair private data
  *
@@ -431,8 +489,9 @@ struct fsl_asrc_pair {
  * @asrck_clk: clock sources to driver ASRC internal logic
  * @lock: spin lock for resource protection
  * @pair: pair pointers
- * @channel_bits: width of ASRCNCR register for each pair
+ * @soc: soc specific data
  * @channel_avail: non-occupied channel numbers
+ * @clk_map: clock map for input/output clock
  * @asrc_rate: default sample rate for ASoC Back-Ends
  * @asrc_width: default sample width for ASoC Back-Ends
  * @regcache_cfg: store register value of REG_ASRCFG
@@ -450,8 +509,9 @@ struct fsl_asrc {
 	spinlock_t lock;
 
 	struct fsl_asrc_pair *pair[ASRC_PAIR_MAX_NUM];
-	unsigned int channel_bits;
+	const struct fsl_asrc_soc_data *soc;
 	unsigned int channel_avail;
+	unsigned char *clk_map[2];
 
 	int asrc_rate;
 	int asrc_width;
diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index d6146de9acd2..f871fdb9d1c6 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -197,21 +197,37 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	dma_cap_set(DMA_SLAVE, mask);
 	dma_cap_set(DMA_CYCLIC, mask);
 
-	/* Get DMA request of Back-End */
-	tmp_chan = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
-	tmp_data = tmp_chan->private;
-	pair->dma_data.dma_request = tmp_data->dma_request;
-	dma_release_channel(tmp_chan);
+	/*
+	 * For EDMA DEV_TO_DEV channel, we don't need to configure
+	 * dma_request and dma_request2, we can get dma channel through
+	 * dma_request_slave_channel directly.
+	 * Compare with SDMA channel, EDMA channel is bound with dma
+	 * request event of each peripheral, and it is fixed. Not like SDMA,
+	 * the channel is allocated dynamically. So when DMA is EDMA, we
+	 * can only get EDMA channel through dma-names of Front-End device.
+	 */
+	if (!asrc_priv->soc->use_edma) {
+		/* Get DMA request of Back-End */
+		tmp_chan = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
+		tmp_data = tmp_chan->private;
+		pair->dma_data.dma_request = tmp_data->dma_request;
+		dma_release_channel(tmp_chan);
 
-	/* Get DMA request of Front-End */
-	tmp_chan = fsl_asrc_get_dma_channel(pair, dir);
-	tmp_data = tmp_chan->private;
-	pair->dma_data.dma_request2 = tmp_data->dma_request;
-	pair->dma_data.peripheral_type = tmp_data->peripheral_type;
-	pair->dma_data.priority = tmp_data->priority;
-	dma_release_channel(tmp_chan);
+		/* Get DMA request of Front-End */
+		tmp_chan = fsl_asrc_get_dma_channel(pair, dir);
+		tmp_data = tmp_chan->private;
+		pair->dma_data.dma_request2 = tmp_data->dma_request;
+		pair->dma_data.peripheral_type = tmp_data->peripheral_type;
+		pair->dma_data.priority = tmp_data->priority;
+		dma_release_channel(tmp_chan);
+
+		pair->dma_chan[dir] =
+			dma_request_channel(mask, filter, &pair->dma_data);
+	} else {
+		pair->dma_chan[dir] =
+			fsl_asrc_get_dma_channel(pair, dir);
+	}
 
-	pair->dma_chan[dir] = dma_request_channel(mask, filter, &pair->dma_data);
 	if (!pair->dma_chan[dir]) {
 		dev_err(dev, "failed to request DMA channel for Back-End\n");
 		return -EINVAL;
-- 
2.21.0

