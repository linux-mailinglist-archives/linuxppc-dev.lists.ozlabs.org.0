Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 251FCC342A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 14:24:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jJNq2l3rzDqHp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 22:24:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=sirena.co.uk
 (client-ip=172.104.155.198; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.co.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="iINKzrI+"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jJKz459KzDq7c
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 22:21:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=IQpff9+FFEjBtJ3qLM9oqa1G0Z3v6f4D+L7wU0kojcw=; b=iINKzrI+l92A
 Wu2SchcLfFiMGx/1tQlMB8cT7Z55uWSwLpJ6V2PITLkOP4O1PBqSlQu9gAHlyCuXojtoE9A1kCth0
 J0DxjAXRaq28wLRpvYQbHUzRHySbeh2lezF0I1CEoberRtCMIzsbuAplz8rXNvO2NpFyTaUA1CGl8
 m6M8E=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFGWS-0004Vf-Tw; Tue, 01 Oct 2019 11:40:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6328B2742A30; Tue,  1 Oct 2019 12:40:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Applied "ASoC: fsl_mqs: Add MQS component driver" to the asoc tree
In-Reply-To: <74dfc73a92d2df4213225abe7d2a3db82672fe0f.1568367274.git.shengjiu.wang@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001114052.6328B2742A30@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 12:40:52 +0100 (BST)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 perex@perex.cz, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch

   ASoC: fsl_mqs: Add MQS component driver

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 9e28f6532c611c0c3fa759d2101aba9f0d41e860 Mon Sep 17 00:00:00 2001
From: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Fri, 13 Sep 2019 17:42:14 +0800
Subject: [PATCH] ASoC: fsl_mqs: Add MQS component driver

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
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Link: https://lore.kernel.org/r/74dfc73a92d2df4213225abe7d2a3db82672fe0f.1568367274.git.shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/Kconfig   |  10 ++
 sound/soc/fsl/Makefile  |   2 +
 sound/soc/fsl/fsl_mqs.c | 333 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 345 insertions(+)
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
index 000000000000..c1619a553514
--- /dev/null
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -0,0 +1,333 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// ALSA SoC IMX MQS driver
+//
+// Copyright (C) 2014-2015 Freescale Semiconductor, Inc.
+// Copyright 2019 NXP
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
+		regs = devm_platform_ioremap_resource(pdev, 0);
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
2.20.1

