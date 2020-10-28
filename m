Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C2E29CF4B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 10:47:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLkJR2mc6zDqTN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 20:47:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLkF25cMTzDqF7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 20:44:37 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D338F1A150D;
 Wed, 28 Oct 2020 10:44:34 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 63CC11A150A;
 Wed, 28 Oct 2020 10:44:29 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id E233240307;
 Wed, 28 Oct 2020 10:44:22 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: fsl_aud2htx: Add aud2htx module driver
Date: Wed, 28 Oct 2020 17:38:50 +0800
Message-Id: <1603877930-10553-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603877930-10553-1-git-send-email-shengjiu.wang@nxp.com>
References: <1603877930-10553-1-git-send-email-shengjiu.wang@nxp.com>
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

The AUD2HTX is a digital module that provides a bridge between
the Audio Subsystem and the HDMI RTX Subsystem. This module
includes intermediate storage to queue SDMA transactions prior
to being synchronized and passed to the HDMI RTX Subsystem over
the Audio Link.

The AUD2HTX contains a DMA request routed to the SDMA module.
This DMA request is controlled based on the watermark level in
the 32-entry sample buffer.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2:
- remove hw_params, add operation to dai probe

 sound/soc/fsl/Kconfig       |   5 +
 sound/soc/fsl/Makefile      |   2 +
 sound/soc/fsl/fsl_aud2htx.c | 313 ++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_aud2htx.h |  67 ++++++++
 4 files changed, 387 insertions(+)
 create mode 100644 sound/soc/fsl/fsl_aud2htx.c
 create mode 100644 sound/soc/fsl/fsl_aud2htx.h

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index d04b64d32dc1..52a562215008 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -105,6 +105,11 @@ config SND_SOC_FSL_XCVR
 	  iMX CPUs. XCVR is a digital module that supports HDMI2.1 eARC,
 	  HDMI1.4 ARC and SPDIF.
 
+config SND_SOC_FSL_AUD2HTX
+	tristate "AUDIO TO HDMI TX module support"
+	help
+	  Say Y if you want to add AUDIO TO HDMI TX support for NXP.
+
 config SND_SOC_FSL_UTILS
 	tristate
 
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index 1d2231f9cc47..2181b7f9f677 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -26,6 +26,7 @@ snd-soc-fsl-dma-objs := fsl_dma.o
 snd-soc-fsl-mqs-objs := fsl_mqs.o
 snd-soc-fsl-easrc-objs := fsl_easrc.o
 snd-soc-fsl-xcvr-objs := fsl_xcvr.o
+snd-soc-fsl-aud2htx-objs := fsl_aud2htx.o
 
 obj-$(CONFIG_SND_SOC_FSL_AUDMIX) += snd-soc-fsl-audmix.o
 obj-$(CONFIG_SND_SOC_FSL_ASOC_CARD) += snd-soc-fsl-asoc-card.o
@@ -40,6 +41,7 @@ obj-$(CONFIG_SND_SOC_FSL_MQS) += snd-soc-fsl-mqs.o
 obj-$(CONFIG_SND_SOC_FSL_EASRC) += snd-soc-fsl-easrc.o
 obj-$(CONFIG_SND_SOC_POWERPC_DMA) += snd-soc-fsl-dma.o
 obj-$(CONFIG_SND_SOC_FSL_XCVR) += snd-soc-fsl-xcvr.o
+obj-$(CONFIG_SND_SOC_FSL_AUD2HTX) += snd-soc-fsl-aud2htx.o
 
 # MPC5200 Platform Support
 obj-$(CONFIG_SND_MPC52xx_DMA) += mpc5200_dma.o
diff --git a/sound/soc/fsl/fsl_aud2htx.c b/sound/soc/fsl/fsl_aud2htx.c
new file mode 100644
index 000000000000..a6e25195a8df
--- /dev/null
+++ b/sound/soc/fsl/fsl_aud2htx.c
@@ -0,0 +1,313 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2020 NXP
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/dmaengine.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/time.h>
+#include <linux/pm_qos.h>
+#include <sound/core.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/pcm_params.h>
+#include <linux/dma-mapping.h>
+
+#include "fsl_aud2htx.h"
+#include "imx-pcm.h"
+
+static int fsl_aud2htx_trigger(struct snd_pcm_substream *substream, int cmd,
+			       struct snd_soc_dai *dai)
+{
+	struct fsl_aud2htx *aud2htx = snd_soc_dai_get_drvdata(dai);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		regmap_update_bits(aud2htx->regmap, AUD2HTX_CTRL,
+				   AUD2HTX_CTRL_EN, AUD2HTX_CTRL_EN);
+		regmap_update_bits(aud2htx->regmap, AUD2HTX_CTRL_EXT,
+				   AUD2HTX_CTRE_DE, AUD2HTX_CTRE_DE);
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		regmap_update_bits(aud2htx->regmap, AUD2HTX_CTRL_EXT,
+				   AUD2HTX_CTRE_DE, 0);
+		regmap_update_bits(aud2htx->regmap, AUD2HTX_CTRL,
+				   AUD2HTX_CTRL_EN, 0);
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static const struct snd_soc_dai_ops fsl_aud2htx_dai_ops = {
+	.trigger	= fsl_aud2htx_trigger,
+};
+
+static int fsl_aud2htx_dai_probe(struct snd_soc_dai *cpu_dai)
+{
+	struct fsl_aud2htx *aud2htx = dev_get_drvdata(cpu_dai->dev);
+
+	/* DMA request when number of entries < WTMK_LOW */
+	regmap_update_bits(aud2htx->regmap, AUD2HTX_CTRL_EXT,
+			   AUD2HTX_CTRE_DT_MASK, 0);
+
+	/* Disable interrupts*/
+	regmap_update_bits(aud2htx->regmap, AUD2HTX_IRQ_MASK,
+			   AUD2HTX_WM_HIGH_IRQ_MASK |
+			   AUD2HTX_WM_LOW_IRQ_MASK |
+			   AUD2HTX_OVF_MASK,
+			   AUD2HTX_WM_HIGH_IRQ_MASK |
+			   AUD2HTX_WM_LOW_IRQ_MASK |
+			   AUD2HTX_OVF_MASK);
+
+	/* Configure watermark */
+	regmap_update_bits(aud2htx->regmap, AUD2HTX_CTRL_EXT,
+			   AUD2HTX_CTRE_WL_MASK,
+			   AUD2HTX_WTMK_LOW << AUD2HTX_CTRE_WL_SHIFT);
+	regmap_update_bits(aud2htx->regmap, AUD2HTX_CTRL_EXT,
+			   AUD2HTX_CTRE_WH_MASK,
+			   AUD2HTX_WTMK_HIGH << AUD2HTX_CTRE_WH_SHIFT);
+
+	snd_soc_dai_init_dma_data(cpu_dai, &aud2htx->dma_params_tx,
+				  &aud2htx->dma_params_rx);
+
+	return 0;
+}
+
+static struct snd_soc_dai_driver fsl_aud2htx_dai = {
+	.probe = fsl_aud2htx_dai_probe,
+	.playback = {
+		.stream_name = "CPU-Playback",
+		.channels_min = 1,
+		.channels_max = 8,
+		.rates = SNDRV_PCM_RATE_32000 |
+			 SNDRV_PCM_RATE_44100 |
+			 SNDRV_PCM_RATE_48000 |
+			 SNDRV_PCM_RATE_88200 |
+			 SNDRV_PCM_RATE_96000 |
+			 SNDRV_PCM_RATE_176400 |
+			 SNDRV_PCM_RATE_192000,
+		.formats = FSL_AUD2HTX_FORMATS,
+	},
+	.ops = &fsl_aud2htx_dai_ops,
+};
+
+static const struct snd_soc_component_driver fsl_aud2htx_component = {
+	.name	= "fsl-aud2htx",
+};
+
+static const struct reg_default fsl_aud2htx_reg_defaults[] = {
+	{AUD2HTX_CTRL,		0x00000000},
+	{AUD2HTX_CTRL_EXT,	0x00000000},
+	{AUD2HTX_WR,		0x00000000},
+	{AUD2HTX_STATUS,	0x00000000},
+	{AUD2HTX_IRQ_NOMASK,	0x00000000},
+	{AUD2HTX_IRQ_MASKED,	0x00000000},
+	{AUD2HTX_IRQ_MASK,	0x00000000},
+};
+
+static bool fsl_aud2htx_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case AUD2HTX_CTRL:
+	case AUD2HTX_CTRL_EXT:
+	case AUD2HTX_STATUS:
+	case AUD2HTX_IRQ_NOMASK:
+	case AUD2HTX_IRQ_MASKED:
+	case AUD2HTX_IRQ_MASK:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool fsl_aud2htx_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case AUD2HTX_CTRL:
+	case AUD2HTX_CTRL_EXT:
+	case AUD2HTX_WR:
+	case AUD2HTX_IRQ_NOMASK:
+	case AUD2HTX_IRQ_MASKED:
+	case AUD2HTX_IRQ_MASK:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool fsl_aud2htx_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case AUD2HTX_STATUS:
+	case AUD2HTX_IRQ_NOMASK:
+	case AUD2HTX_IRQ_MASKED:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config fsl_aud2htx_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+
+	.max_register = AUD2HTX_IRQ_MASK,
+	.reg_defaults = fsl_aud2htx_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(fsl_aud2htx_reg_defaults),
+	.readable_reg = fsl_aud2htx_readable_reg,
+	.volatile_reg = fsl_aud2htx_volatile_reg,
+	.writeable_reg = fsl_aud2htx_writeable_reg,
+	.cache_type = REGCACHE_RBTREE,
+};
+
+static const struct of_device_id fsl_aud2htx_dt_ids[] = {
+	{ .compatible = "fsl,imx8mp-aud2htx",},
+	{}
+};
+MODULE_DEVICE_TABLE(of, fsl_aud2htx_dt_ids);
+
+static irqreturn_t fsl_aud2htx_isr(int irq, void *dev_id)
+{
+	return IRQ_HANDLED;
+}
+
+static int fsl_aud2htx_probe(struct platform_device *pdev)
+{
+	struct fsl_aud2htx *aud2htx;
+	struct resource *res;
+	void __iomem *regs;
+	int ret, irq;
+
+	aud2htx = devm_kzalloc(&pdev->dev, sizeof(*aud2htx), GFP_KERNEL);
+	if (!aud2htx)
+		return -ENOMEM;
+
+	aud2htx->pdev = pdev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(regs)) {
+		dev_err(&pdev->dev, "failed ioremap\n");
+		return PTR_ERR(regs);
+	}
+
+	aud2htx->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
+						&fsl_aud2htx_regmap_config);
+	if (IS_ERR(aud2htx->regmap)) {
+		dev_err(&pdev->dev, "failed to init regmap");
+		return PTR_ERR(aud2htx->regmap);
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(&pdev->dev, "no irq for node %s\n",
+			dev_name(&pdev->dev));
+		return irq;
+	}
+
+	ret = devm_request_irq(&pdev->dev, irq, fsl_aud2htx_isr, 0,
+			       dev_name(&pdev->dev), aud2htx);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to claim irq %u: %d\n", irq, ret);
+		return ret;
+	}
+
+	aud2htx->bus_clk = devm_clk_get(&pdev->dev, "bus");
+	if (IS_ERR(aud2htx->bus_clk)) {
+		dev_err(&pdev->dev, "failed to get mem clock\n");
+		return PTR_ERR(aud2htx->bus_clk);
+	}
+
+	aud2htx->dma_params_tx.chan_name = "tx";
+	aud2htx->dma_params_tx.maxburst = AUD2HTX_MAXBURST;
+	aud2htx->dma_params_tx.addr = res->start + AUD2HTX_WR;
+
+	platform_set_drvdata(pdev, aud2htx);
+	pm_runtime_enable(&pdev->dev);
+
+	regcache_cache_only(aud2htx->regmap, true);
+
+	ret = devm_snd_soc_register_component(&pdev->dev,
+					      &fsl_aud2htx_component,
+					      &fsl_aud2htx_dai, 1);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register ASoC DAI\n");
+		return ret;
+	}
+
+	ret = imx_pcm_dma_init(pdev, IMX_DEFAULT_DMABUF_SIZE);
+	if (ret)
+		dev_err(&pdev->dev, "failed to init imx pcm dma: %d\n", ret);
+
+	return ret;
+}
+
+static int fsl_aud2htx_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM
+static int fsl_aud2htx_runtime_suspend(struct device *dev)
+{
+	struct fsl_aud2htx *aud2htx = dev_get_drvdata(dev);
+
+	regcache_cache_only(aud2htx->regmap, true);
+	clk_disable_unprepare(aud2htx->bus_clk);
+
+	return 0;
+}
+
+static int fsl_aud2htx_runtime_resume(struct device *dev)
+{
+	struct fsl_aud2htx *aud2htx = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(aud2htx->bus_clk);
+	if (ret)
+		return ret;
+
+	regcache_cache_only(aud2htx->regmap, false);
+	regcache_mark_dirty(aud2htx->regmap);
+	regcache_sync(aud2htx->regmap);
+
+	return 0;
+}
+#endif /*CONFIG_PM*/
+
+static const struct dev_pm_ops fsl_aud2htx_pm_ops = {
+	SET_RUNTIME_PM_OPS(fsl_aud2htx_runtime_suspend,
+			   fsl_aud2htx_runtime_resume,
+			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
+static struct platform_driver fsl_aud2htx_driver = {
+	.probe = fsl_aud2htx_probe,
+	.remove = fsl_aud2htx_remove,
+	.driver = {
+		.name = "fsl-aud2htx",
+		.pm = &fsl_aud2htx_pm_ops,
+		.of_match_table = fsl_aud2htx_dt_ids,
+	},
+};
+module_platform_driver(fsl_aud2htx_driver);
+
+MODULE_AUTHOR("Shengjiu Wang <Shengjiu.Wang@nxp.com>");
+MODULE_DESCRIPTION("NXP AUD2HTX driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/fsl/fsl_aud2htx.h b/sound/soc/fsl/fsl_aud2htx.h
new file mode 100644
index 000000000000..ad70d6a7694c
--- /dev/null
+++ b/sound/soc/fsl/fsl_aud2htx.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020 NXP
+ */
+
+#ifndef _FSL_AUD2HTX_H
+#define _FSL_AUD2HTX_H
+
+#define FSL_AUD2HTX_FORMATS (SNDRV_PCM_FMTBIT_S24_LE | \
+			     SNDRV_PCM_FMTBIT_S32_LE)
+
+/* AUD2HTX Register Map */
+#define AUD2HTX_CTRL          0x0   /* AUD2HTX Control Register */
+#define AUD2HTX_CTRL_EXT      0x4   /* AUD2HTX Control Extended Register */
+#define AUD2HTX_WR            0x8   /* AUD2HTX Write Register */
+#define AUD2HTX_STATUS        0xC   /* AUD2HTX Status Register */
+#define AUD2HTX_IRQ_NOMASK    0x10  /* AUD2HTX Nonmasked Interrupt Flags Register */
+#define AUD2HTX_IRQ_MASKED    0x14  /* AUD2HTX Masked Interrupt Flags Register */
+#define AUD2HTX_IRQ_MASK      0x18  /* AUD2HTX IRQ Masks Register */
+
+/* AUD2HTX Control Register */
+#define AUD2HTX_CTRL_EN          BIT(0)
+
+/* AUD2HTX Control Extended Register */
+#define AUD2HTX_CTRE_DE          BIT(0)
+#define AUD2HTX_CTRE_DT_SHIFT    0x1
+#define AUD2HTX_CTRE_DT_WIDTH    0x2
+#define AUD2HTX_CTRE_DT_MASK     ((BIT(AUD2HTX_CTRE_DT_WIDTH) - 1) \
+				 << AUD2HTX_CTRE_DT_SHIFT)
+#define AUD2HTX_CTRE_WL_SHIFT    16
+#define AUD2HTX_CTRE_WL_WIDTH    5
+#define AUD2HTX_CTRE_WL_MASK     ((BIT(AUD2HTX_CTRE_WL_WIDTH) - 1) \
+				 << AUD2HTX_CTRE_WL_SHIFT)
+#define AUD2HTX_CTRE_WH_SHIFT    24
+#define AUD2HTX_CTRE_WH_WIDTH    5
+#define AUD2HTX_CTRE_WH_MASK     ((BIT(AUD2HTX_CTRE_WH_WIDTH) - 1) \
+				 << AUD2HTX_CTRE_WH_SHIFT)
+
+/* AUD2HTX IRQ Masks Register */
+#define AUD2HTX_WM_HIGH_IRQ_MASK BIT(2)
+#define AUD2HTX_WM_LOW_IRQ_MASK  BIT(1)
+#define AUD2HTX_OVF_MASK         BIT(0)
+
+#define AUD2HTX_FIFO_DEPTH       0x20
+#define AUD2HTX_WTMK_LOW         0x10
+#define AUD2HTX_WTMK_HIGH        0x10
+#define AUD2HTX_MAXBURST         0x10
+
+/**
+ * fsl_aud2htx: AUD2HTX private data
+ *
+ * @pdev: platform device pointer
+ * @regmap: regmap handler
+ * @bus_clk: clock source to access register
+ * @dma_params_rx: DMA parameters for receive channel
+ * @dma_params_tx: DMA parameters for transmit channel
+ */
+struct fsl_aud2htx {
+	struct platform_device *pdev;
+	struct regmap *regmap;
+	struct clk *bus_clk;
+
+	struct snd_dmaengine_dai_dma_data dma_params_rx;
+	struct snd_dmaengine_dai_dma_data dma_params_tx;
+};
+
+#endif /* _FSL_AUD2HTX_H */
-- 
2.27.0

