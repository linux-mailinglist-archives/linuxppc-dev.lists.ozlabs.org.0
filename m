Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A28F9AF480
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 04:47:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SmXQ1MSqzF1vG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 12:47:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SmSb2lB4zF1fH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 12:44:14 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8F50C20011B;
 Wed, 11 Sep 2019 04:44:10 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D438B2000C6;
 Wed, 11 Sep 2019 04:44:03 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id F26F9402CF;
 Wed, 11 Sep 2019 10:43:55 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: [PATCH 2/2] ASoC: fsl_mqs: Add MQS component driver
Date: Wed, 11 Sep 2019 10:42:39 -0400
Message-Id: <08524f143c18521680b724ab98375828fc18ab2b.1568169346.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cff8bff1e8d3334fa308ddfcec266a5284e3c858.1568169346.git.shengjiu.wang@nxp.com>
References: <cff8bff1e8d3334fa308ddfcec266a5284e3c858.1568169346.git.shengjiu.wang@nxp.com>
In-Reply-To: <cff8bff1e8d3334fa308ddfcec266a5284e3c858.1568169346.git.shengjiu.wang@nxp.com>
References: <cff8bff1e8d3334fa308ddfcec266a5284e3c858.1568169346.git.shengjiu.wang@nxp.com>
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

MQS (medium quality sound), is used to generate medium quality
audio via a standard digital output pin. It can be used to
connect stereo speakers or headphones simply via power amplifier
stages without an additional DAC chip. It only accepts 2-channel,
LSB-valid 16bit, MSB shift-out first, frame sync asserting with
the first bit of the frame, data shifted with the posedge of
bit clock, 44.1 kHz or 48 kHz signals from SAI1 in left justified
format; and it provides the SNR target as no more than 20dB for
the signals below 10 kHz. The signals above 10 kHz will have
worse THD+N values.

MQS provides only simple audio reproduction. No internal pop,
click or distortion artifact reduction methods are provided.

The MQS receives the audio data from the SAI1 Tx section.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/Kconfig   |  10 ++
 sound/soc/fsl/Makefile  |   2 +
 sound/soc/fsl/fsl_mqs.c | 336 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 348 insertions(+)
 create mode 100644 sound/soc/fsl/fsl_mqs.c

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index aa99c008a925..65e8cd4be930 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -25,6 +25,16 @@ config SND_SOC_FSL_SAI
 	  This option is only useful for out-of-tree drivers since
 	  in-tree drivers select it automatically.
 
+config SND_SOC_FSL_MQS
+	tristate "Medium Quality Sound (MQS) module support"
+	depends on SND_SOC_FSL_SAI
+	select REGMAP_MMIO
+	help
+	  Say Y if you want to add Medium Quality Sound (MQS)
+	  support for the Freescale CPUs.
+	  This option is only useful for out-of-tree drivers since
+	  in-tree drivers select it automatically.
+
 config SND_SOC_FSL_AUDMIX
 	tristate "Audio Mixer (AUDMIX) module support"
 	select REGMAP_MMIO
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index c0dd04422fe9..8cde88c72d93 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -23,6 +23,7 @@ snd-soc-fsl-esai-objs := fsl_esai.o
 snd-soc-fsl-micfil-objs := fsl_micfil.o
 snd-soc-fsl-utils-objs := fsl_utils.o
 snd-soc-fsl-dma-objs := fsl_dma.o
+snd-soc-fsl-mqs-objs := fsl_mqs.o
 
 obj-$(CONFIG_SND_SOC_FSL_AUDMIX) += snd-soc-fsl-audmix.o
 obj-$(CONFIG_SND_SOC_FSL_ASOC_CARD) += snd-soc-fsl-asoc-card.o
@@ -33,6 +34,7 @@ obj-$(CONFIG_SND_SOC_FSL_SPDIF) += snd-soc-fsl-spdif.o
 obj-$(CONFIG_SND_SOC_FSL_ESAI) += snd-soc-fsl-esai.o
 obj-$(CONFIG_SND_SOC_FSL_MICFIL) += snd-soc-fsl-micfil.o
 obj-$(CONFIG_SND_SOC_FSL_UTILS) += snd-soc-fsl-utils.o
+obj-$(CONFIG_SND_SOC_FSL_MQS) += snd-soc-fsl-mqs.o
 obj-$(CONFIG_SND_SOC_POWERPC_DMA) += snd-soc-fsl-dma.o
 
 # MPC5200 Platform Support
diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
new file mode 100644
index 000000000000..d164f5da3460
--- /dev/null
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -0,0 +1,336 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ALSA SoC IMX MQS driver
+ *
+ * Copyright (C) 2014-2019 Freescale Semiconductor, Inc.
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
+#include <linux/pm_runtime.h>
+#include <linux/of.h>
+#include <linux/pm.h>
+#include <linux/slab.h>
+#include <sound/soc.h>
+#include <sound/pcm.h>
+#include <sound/initval.h>
+
+#define REG_MQS_CTRL		0x00
+
+#define MQS_EN_MASK			(0x1 << 28)
+#define MQS_EN_SHIFT			(28)
+#define MQS_SW_RST_MASK			(0x1 << 24)
+#define MQS_SW_RST_SHIFT		(24)
+#define MQS_OVERSAMPLE_MASK		(0x1 << 20)
+#define MQS_OVERSAMPLE_SHIFT		(20)
+#define MQS_CLK_DIV_MASK		(0xFF << 0)
+#define MQS_CLK_DIV_SHIFT		(0)
+
+/* codec private data */
+struct fsl_mqs {
+	struct regmap *regmap;
+	struct clk *mclk;
+	struct clk *ipg;
+
+	unsigned int reg_iomuxc_gpr2;
+	unsigned int reg_mqs_ctrl;
+	bool use_gpr;
+};
+
+#define FSL_MQS_RATES	(SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000)
+#define FSL_MQS_FORMATS	SNDRV_PCM_FMTBIT_S16_LE
+
+static int fsl_mqs_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct fsl_mqs *mqs_priv = snd_soc_component_get_drvdata(component);
+	unsigned long mclk_rate;
+	int div, res;
+	int bclk, lrclk;
+
+	mclk_rate = clk_get_rate(mqs_priv->mclk);
+	bclk = snd_soc_params_to_bclk(params);
+	lrclk = params_rate(params);
+
+	/*
+	 * mclk_rate / (oversample(32,64) * FS * 2 * divider ) = repeat_rate;
+	 * if repeat_rate is 8, mqs can achieve better quality.
+	 * oversample rate is fix to 32 currently.
+	 */
+	div = mclk_rate / (32 * lrclk * 2 * 8);
+	res = mclk_rate % (32 * lrclk * 2 * 8);
+
+	if (res == 0 && div > 0 && div <= 256) {
+		if (mqs_priv->use_gpr) {
+			regmap_update_bits(mqs_priv->regmap, IOMUXC_GPR2,
+					   IMX6SX_GPR2_MQS_CLK_DIV_MASK,
+					   (div - 1) << IMX6SX_GPR2_MQS_CLK_DIV_SHIFT);
+			regmap_update_bits(mqs_priv->regmap, IOMUXC_GPR2,
+					   IMX6SX_GPR2_MQS_OVERSAMPLE_MASK, 0);
+		} else {
+			regmap_update_bits(mqs_priv->regmap, REG_MQS_CTRL,
+					   MQS_CLK_DIV_MASK,
+					   (div - 1) << MQS_CLK_DIV_SHIFT);
+			regmap_update_bits(mqs_priv->regmap, REG_MQS_CTRL,
+					   MQS_OVERSAMPLE_MASK, 0);
+		}
+	} else {
+		dev_err(component->dev, "can't get proper divider\n");
+	}
+
+	return 0;
+}
+
+static int fsl_mqs_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	/* Only LEFT_J & SLAVE mode is supported. */
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_LEFT_J:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBS_CFS:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int fsl_mqs_startup(struct snd_pcm_substream *substream,
+			   struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct fsl_mqs *mqs_priv = snd_soc_component_get_drvdata(component);
+
+	if (mqs_priv->use_gpr)
+		regmap_update_bits(mqs_priv->regmap, IOMUXC_GPR2,
+				   IMX6SX_GPR2_MQS_EN_MASK,
+				   1 << IMX6SX_GPR2_MQS_EN_SHIFT);
+	else
+		regmap_update_bits(mqs_priv->regmap, REG_MQS_CTRL,
+				   MQS_EN_MASK,
+				   1 << MQS_EN_SHIFT);
+	return 0;
+}
+
+static void fsl_mqs_shutdown(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct fsl_mqs *mqs_priv = snd_soc_component_get_drvdata(component);
+
+	if (mqs_priv->use_gpr)
+		regmap_update_bits(mqs_priv->regmap, IOMUXC_GPR2,
+				   IMX6SX_GPR2_MQS_EN_MASK, 0);
+	else
+		regmap_update_bits(mqs_priv->regmap, REG_MQS_CTRL,
+				   MQS_EN_MASK, 0);
+}
+
+const static struct snd_soc_component_driver soc_codec_fsl_mqs = {
+	.idle_bias_on = 1,
+	.non_legacy_dai_naming	= 1,
+};
+
+static const struct snd_soc_dai_ops fsl_mqs_dai_ops = {
+	.startup = fsl_mqs_startup,
+	.shutdown = fsl_mqs_shutdown,
+	.hw_params = fsl_mqs_hw_params,
+	.set_fmt = fsl_mqs_set_dai_fmt,
+};
+
+static struct snd_soc_dai_driver fsl_mqs_dai = {
+	.name		= "fsl-mqs-dai",
+	.playback	= {
+		.stream_name	= "Playback",
+		.channels_min	= 2,
+		.channels_max	= 2,
+		.rates		= FSL_MQS_RATES,
+		.formats	= FSL_MQS_FORMATS,
+	},
+	.ops = &fsl_mqs_dai_ops,
+};
+
+static const struct regmap_config fsl_mqs_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = REG_MQS_CTRL,
+	.cache_type = REGCACHE_NONE,
+};
+
+static int fsl_mqs_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct device_node *gpr_np = 0;
+	struct fsl_mqs *mqs_priv;
+	struct resource *res;
+	void __iomem *regs;
+	int ret = 0;
+
+	mqs_priv = devm_kzalloc(&pdev->dev, sizeof(*mqs_priv), GFP_KERNEL);
+	if (!mqs_priv)
+		return -ENOMEM;
+
+	/* On i.MX6sx the MQS control register is in GPR domain
+	 * But in i.MX8QM/i.MX8QXP the control register is moved
+	 * to its own domain.
+	 */
+	if (of_device_is_compatible(np, "fsl,imx8qm-mqs"))
+		mqs_priv->use_gpr = false;
+	else
+		mqs_priv->use_gpr = true;
+
+	if (mqs_priv->use_gpr) {
+		gpr_np = of_parse_phandle(np, "gpr", 0);
+		if (IS_ERR(gpr_np)) {
+			dev_err(&pdev->dev, "failed to get gpr node by phandle\n");
+			ret = PTR_ERR(gpr_np);
+			goto out;
+		}
+
+		mqs_priv->regmap = syscon_node_to_regmap(gpr_np);
+		if (IS_ERR(mqs_priv->regmap)) {
+			dev_err(&pdev->dev, "failed to get gpr regmap\n");
+			ret = PTR_ERR(mqs_priv->regmap);
+			goto out;
+		}
+	} else {
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		regs = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(regs))
+			return PTR_ERR(regs);
+
+		mqs_priv->regmap = devm_regmap_init_mmio_clk(&pdev->dev,
+							     "core",
+							     regs,
+							     &fsl_mqs_regmap_config);
+		if (IS_ERR(mqs_priv->regmap)) {
+			dev_err(&pdev->dev, "failed to init regmap: %ld\n",
+				PTR_ERR(mqs_priv->regmap));
+			return PTR_ERR(mqs_priv->regmap);
+		}
+
+		mqs_priv->ipg = devm_clk_get(&pdev->dev, "core");
+		if (IS_ERR(mqs_priv->ipg)) {
+			dev_err(&pdev->dev, "failed to get the clock: %ld\n",
+				PTR_ERR(mqs_priv->ipg));
+			goto out;
+		}
+	}
+
+	mqs_priv->mclk = devm_clk_get(&pdev->dev, "mclk");
+	if (IS_ERR(mqs_priv->mclk)) {
+		dev_err(&pdev->dev, "failed to get the clock: %ld\n",
+			PTR_ERR(mqs_priv->mclk));
+		goto out;
+	}
+
+	dev_set_drvdata(&pdev->dev, mqs_priv);
+	pm_runtime_enable(&pdev->dev);
+
+	return devm_snd_soc_register_component(&pdev->dev, &soc_codec_fsl_mqs,
+			&fsl_mqs_dai, 1);
+out:
+	if (!IS_ERR(gpr_np))
+		of_node_put(gpr_np);
+
+	return ret;
+}
+
+static int fsl_mqs_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+	return 0;
+}
+
+#ifdef CONFIG_PM
+static int fsl_mqs_runtime_resume(struct device *dev)
+{
+	struct fsl_mqs *mqs_priv = dev_get_drvdata(dev);
+
+	if (mqs_priv->ipg)
+		clk_prepare_enable(mqs_priv->ipg);
+
+	if (mqs_priv->mclk)
+		clk_prepare_enable(mqs_priv->mclk);
+
+	if (mqs_priv->use_gpr)
+		regmap_write(mqs_priv->regmap, IOMUXC_GPR2,
+			     mqs_priv->reg_iomuxc_gpr2);
+	else
+		regmap_write(mqs_priv->regmap, REG_MQS_CTRL,
+			     mqs_priv->reg_mqs_ctrl);
+	return 0;
+}
+
+static int fsl_mqs_runtime_suspend(struct device *dev)
+{
+	struct fsl_mqs *mqs_priv = dev_get_drvdata(dev);
+
+	if (mqs_priv->use_gpr)
+		regmap_read(mqs_priv->regmap, IOMUXC_GPR2,
+			    &mqs_priv->reg_iomuxc_gpr2);
+	else
+		regmap_read(mqs_priv->regmap, REG_MQS_CTRL,
+			    &mqs_priv->reg_mqs_ctrl);
+
+	if (mqs_priv->mclk)
+		clk_disable_unprepare(mqs_priv->mclk);
+
+	if (mqs_priv->ipg)
+		clk_disable_unprepare(mqs_priv->ipg);
+
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops fsl_mqs_pm_ops = {
+	SET_RUNTIME_PM_OPS(fsl_mqs_runtime_suspend,
+			   fsl_mqs_runtime_resume,
+			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
+static const struct of_device_id fsl_mqs_dt_ids[] = {
+	{ .compatible = "fsl,imx8qm-mqs", },
+	{ .compatible = "fsl,imx6sx-mqs", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, fsl_mqs_dt_ids);
+
+static struct platform_driver fsl_mqs_driver = {
+	.probe		= fsl_mqs_probe,
+	.remove		= fsl_mqs_remove,
+	.driver		= {
+		.name	= "fsl-mqs",
+		.of_match_table = fsl_mqs_dt_ids,
+		.pm = &fsl_mqs_pm_ops,
+	},
+};
+
+module_platform_driver(fsl_mqs_driver);
+
+MODULE_AUTHOR("Shengjiu Wang <Shengjiu.Wang@nxp.com>");
+MODULE_DESCRIPTION("MQS codec driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform: fsl-mqs");
-- 
2.21.0

