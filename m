Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC54533676
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 07:37:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7KZQ1983z3blH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 15:37:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7KYx4H2Nz3bXY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 15:36:36 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3B08720065E;
 Wed, 25 May 2022 07:36:33 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D0E2F200665;
 Wed, 25 May 2022 07:36:32 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 60AD0180031B;
 Wed, 25 May 2022 13:36:31 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_mqs: simplify the code with adding fsl_mqs_soc_data
Date: Wed, 25 May 2022 13:23:41 +0800
Message-Id: <1653456221-21613-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add soc specific data struct fsl_mqs_soc_data, move the
definition of control register, each function bits to it,
then the code can be simplified.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_mqs.c | 119 ++++++++++++++++++++++++----------------
 1 file changed, 71 insertions(+), 48 deletions(-)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index ceaecbe3a25e..8a8d727319d6 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -10,6 +10,7 @@
 #include <linux/moduleparam.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
+#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
 #include <linux/pm.h>
@@ -29,15 +30,41 @@
 #define MQS_CLK_DIV_MASK		(0xFF << 0)
 #define MQS_CLK_DIV_SHIFT		(0)
 
+/**
+ * struct fsl_mqs_soc_data - soc specific data
+ *
+ * @use_gpr: control register is in General Purpose Register group
+ * @ctrl_off: control register offset
+ * @en_mask: enable bit mask
+ * @en_shift: enable bit shift
+ * @rst_mask: reset bit mask
+ * @rst_shift: reset bit shift
+ * @osr_mask: oversample bit mask
+ * @osr_shift: oversample bit shift
+ * @div_mask: clock divider mask
+ * @div_shift: clock divider bit shift
+ */
+struct fsl_mqs_soc_data {
+	bool use_gpr;
+	int  ctrl_off;
+	int  en_mask;
+	int  en_shift;
+	int  rst_mask;
+	int  rst_shift;
+	int  osr_mask;
+	int  osr_shift;
+	int  div_mask;
+	int  div_shift;
+};
+
 /* codec private data */
 struct fsl_mqs {
 	struct regmap *regmap;
 	struct clk *mclk;
 	struct clk *ipg;
+	const struct fsl_mqs_soc_data *soc;
 
-	unsigned int reg_iomuxc_gpr2;
 	unsigned int reg_mqs_ctrl;
-	bool use_gpr;
 };
 
 #define FSL_MQS_RATES	(SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000)
@@ -65,19 +92,11 @@ static int fsl_mqs_hw_params(struct snd_pcm_substream *substream,
 	res = mclk_rate % (32 * lrclk * 2 * 8);
 
 	if (res == 0 && div > 0 && div <= 256) {
-		if (mqs_priv->use_gpr) {
-			regmap_update_bits(mqs_priv->regmap, IOMUXC_GPR2,
-					   IMX6SX_GPR2_MQS_CLK_DIV_MASK,
-					   (div - 1) << IMX6SX_GPR2_MQS_CLK_DIV_SHIFT);
-			regmap_update_bits(mqs_priv->regmap, IOMUXC_GPR2,
-					   IMX6SX_GPR2_MQS_OVERSAMPLE_MASK, 0);
-		} else {
-			regmap_update_bits(mqs_priv->regmap, REG_MQS_CTRL,
-					   MQS_CLK_DIV_MASK,
-					   (div - 1) << MQS_CLK_DIV_SHIFT);
-			regmap_update_bits(mqs_priv->regmap, REG_MQS_CTRL,
-					   MQS_OVERSAMPLE_MASK, 0);
-		}
+		regmap_update_bits(mqs_priv->regmap, mqs_priv->soc->ctrl_off,
+				   mqs_priv->soc->div_mask,
+				   (div - 1) << mqs_priv->soc->div_shift);
+		regmap_update_bits(mqs_priv->regmap, mqs_priv->soc->ctrl_off,
+				   mqs_priv->soc->osr_mask, 0);
 	} else {
 		dev_err(component->dev, "can't get proper divider\n");
 	}
@@ -118,14 +137,9 @@ static int fsl_mqs_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct fsl_mqs *mqs_priv = snd_soc_component_get_drvdata(component);
 
-	if (mqs_priv->use_gpr)
-		regmap_update_bits(mqs_priv->regmap, IOMUXC_GPR2,
-				   IMX6SX_GPR2_MQS_EN_MASK,
-				   1 << IMX6SX_GPR2_MQS_EN_SHIFT);
-	else
-		regmap_update_bits(mqs_priv->regmap, REG_MQS_CTRL,
-				   MQS_EN_MASK,
-				   1 << MQS_EN_SHIFT);
+	regmap_update_bits(mqs_priv->regmap, mqs_priv->soc->ctrl_off,
+			   mqs_priv->soc->en_mask,
+			   1 << mqs_priv->soc->en_shift);
 	return 0;
 }
 
@@ -135,12 +149,8 @@ static void fsl_mqs_shutdown(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct fsl_mqs *mqs_priv = snd_soc_component_get_drvdata(component);
 
-	if (mqs_priv->use_gpr)
-		regmap_update_bits(mqs_priv->regmap, IOMUXC_GPR2,
-				   IMX6SX_GPR2_MQS_EN_MASK, 0);
-	else
-		regmap_update_bits(mqs_priv->regmap, REG_MQS_CTRL,
-				   MQS_EN_MASK, 0);
+	regmap_update_bits(mqs_priv->regmap, mqs_priv->soc->ctrl_off,
+			   mqs_priv->soc->en_mask, 0);
 }
 
 static const struct snd_soc_component_driver soc_codec_fsl_mqs = {
@@ -191,12 +201,9 @@ static int fsl_mqs_probe(struct platform_device *pdev)
 	 * But in i.MX8QM/i.MX8QXP the control register is moved
 	 * to its own domain.
 	 */
-	if (of_device_is_compatible(np, "fsl,imx8qm-mqs"))
-		mqs_priv->use_gpr = false;
-	else
-		mqs_priv->use_gpr = true;
+	mqs_priv->soc = of_device_get_match_data(&pdev->dev);
 
-	if (mqs_priv->use_gpr) {
+	if (mqs_priv->soc->use_gpr) {
 		gpr_np = of_parse_phandle(np, "gpr", 0);
 		if (!gpr_np) {
 			dev_err(&pdev->dev, "failed to get gpr node by phandle\n");
@@ -280,12 +287,7 @@ static int fsl_mqs_runtime_resume(struct device *dev)
 		return ret;
 	}
 
-	if (mqs_priv->use_gpr)
-		regmap_write(mqs_priv->regmap, IOMUXC_GPR2,
-			     mqs_priv->reg_iomuxc_gpr2);
-	else
-		regmap_write(mqs_priv->regmap, REG_MQS_CTRL,
-			     mqs_priv->reg_mqs_ctrl);
+	regmap_write(mqs_priv->regmap, mqs_priv->soc->ctrl_off, mqs_priv->reg_mqs_ctrl);
 	return 0;
 }
 
@@ -293,12 +295,7 @@ static int fsl_mqs_runtime_suspend(struct device *dev)
 {
 	struct fsl_mqs *mqs_priv = dev_get_drvdata(dev);
 
-	if (mqs_priv->use_gpr)
-		regmap_read(mqs_priv->regmap, IOMUXC_GPR2,
-			    &mqs_priv->reg_iomuxc_gpr2);
-	else
-		regmap_read(mqs_priv->regmap, REG_MQS_CTRL,
-			    &mqs_priv->reg_mqs_ctrl);
+	regmap_read(mqs_priv->regmap, mqs_priv->soc->ctrl_off, &mqs_priv->reg_mqs_ctrl);
 
 	clk_disable_unprepare(mqs_priv->mclk);
 	clk_disable_unprepare(mqs_priv->ipg);
@@ -315,9 +312,35 @@ static const struct dev_pm_ops fsl_mqs_pm_ops = {
 				pm_runtime_force_resume)
 };
 
+static const struct fsl_mqs_soc_data fsl_mqs_imx8qm_data = {
+	.use_gpr = false,
+	.ctrl_off = REG_MQS_CTRL,
+	.en_mask  = MQS_EN_MASK,
+	.en_shift = MQS_EN_SHIFT,
+	.rst_mask = MQS_SW_RST_MASK,
+	.rst_shift = MQS_SW_RST_SHIFT,
+	.osr_mask = MQS_OVERSAMPLE_MASK,
+	.osr_shift = MQS_OVERSAMPLE_SHIFT,
+	.div_mask = MQS_CLK_DIV_MASK,
+	.div_shift = MQS_CLK_DIV_SHIFT,
+};
+
+static const struct fsl_mqs_soc_data fsl_mqs_imx6sx_data = {
+	.use_gpr = true,
+	.ctrl_off = IOMUXC_GPR2,
+	.en_mask  = IMX6SX_GPR2_MQS_EN_MASK,
+	.en_shift = IMX6SX_GPR2_MQS_EN_SHIFT,
+	.rst_mask = IMX6SX_GPR2_MQS_SW_RST_MASK,
+	.rst_shift = IMX6SX_GPR2_MQS_SW_RST_SHIFT,
+	.osr_mask  = IMX6SX_GPR2_MQS_OVERSAMPLE_MASK,
+	.osr_shift = IMX6SX_GPR2_MQS_OVERSAMPLE_SHIFT,
+	.div_mask  = IMX6SX_GPR2_MQS_CLK_DIV_MASK,
+	.div_shift = IMX6SX_GPR2_MQS_CLK_DIV_SHIFT,
+};
+
 static const struct of_device_id fsl_mqs_dt_ids[] = {
-	{ .compatible = "fsl,imx8qm-mqs", },
-	{ .compatible = "fsl,imx6sx-mqs", },
+	{ .compatible = "fsl,imx8qm-mqs", .data = &fsl_mqs_imx8qm_data },
+	{ .compatible = "fsl,imx6sx-mqs", .data = &fsl_mqs_imx6sx_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_mqs_dt_ids);
-- 
2.17.1

