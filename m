Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAB133841B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 03:54:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxVm01ZyVz3dD3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 13:54:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxVl14TTYz3cR3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 13:54:05 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B9EA52007B9;
 Fri, 12 Mar 2021 03:54:02 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E13C72007AA;
 Fri, 12 Mar 2021 03:53:55 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 3A18B402AD;
 Fri, 12 Mar 2021 03:53:47 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, linuxppc-dev@lists.ozlabs.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 2/6] ASoC: fsl_rpmsg: Add CPU DAI driver for audio base on
 rpmsg
Date: Fri, 12 Mar 2021 10:38:41 +0800
Message-Id: <1615516725-4975-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615516725-4975-1-git-send-email-shengjiu.wang@nxp.com>
References: <1615516725-4975-1-git-send-email-shengjiu.wang@nxp.com>
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

This is a cpu dai driver for rpmsg audio use case,
which is mainly used for getting the user's configuration
from devicetree and configure the clocks which is used by
Cortex-M core.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/Kconfig     |  10 ++
 sound/soc/fsl/Makefile    |   2 +
 sound/soc/fsl/fsl_rpmsg.c | 279 ++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_rpmsg.h |  35 +++++
 4 files changed, 326 insertions(+)
 create mode 100644 sound/soc/fsl/fsl_rpmsg.c
 create mode 100644 sound/soc/fsl/fsl_rpmsg.h

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index d7f30036d434..3326f30e28f6 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -115,6 +115,16 @@ config SND_SOC_FSL_AUD2HTX
 config SND_SOC_FSL_UTILS
 	tristate
 
+config SND_SOC_FSL_RPMSG
+	tristate "NXP Audio Base On RPMSG support"
+	depends on COMMON_CLK
+	depends on RPMSG
+	select SND_SOC_IMX_RPMSG if SND_IMX_SOC != n
+	help
+	  Say Y if you want to add rpmsg audio support for the Freescale CPUs.
+	  This option is only useful for out-of-tree drivers since
+	  in-tree drivers select it automatically.
+
 config SND_SOC_IMX_PCM_DMA
 	tristate
 	select SND_SOC_GENERIC_DMAENGINE_PCM
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index 8c5fa8a859c0..b63802f345cc 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -27,6 +27,7 @@ snd-soc-fsl-mqs-objs := fsl_mqs.o
 snd-soc-fsl-easrc-objs := fsl_easrc.o
 snd-soc-fsl-xcvr-objs := fsl_xcvr.o
 snd-soc-fsl-aud2htx-objs := fsl_aud2htx.o
+snd-soc-fsl-rpmsg-objs := fsl_rpmsg.o
 
 obj-$(CONFIG_SND_SOC_FSL_AUDMIX) += snd-soc-fsl-audmix.o
 obj-$(CONFIG_SND_SOC_FSL_ASOC_CARD) += snd-soc-fsl-asoc-card.o
@@ -42,6 +43,7 @@ obj-$(CONFIG_SND_SOC_FSL_EASRC) += snd-soc-fsl-easrc.o
 obj-$(CONFIG_SND_SOC_POWERPC_DMA) += snd-soc-fsl-dma.o
 obj-$(CONFIG_SND_SOC_FSL_XCVR) += snd-soc-fsl-xcvr.o
 obj-$(CONFIG_SND_SOC_FSL_AUD2HTX) += snd-soc-fsl-aud2htx.o
+obj-$(CONFIG_SND_SOC_FSL_RPMSG) += snd-soc-fsl-rpmsg.o
 
 # MPC5200 Platform Support
 obj-$(CONFIG_SND_MPC52xx_DMA) += mpc5200_dma.o
diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
new file mode 100644
index 000000000000..2d09d8850e2c
--- /dev/null
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -0,0 +1,279 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2018-2021 NXP
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/dmaengine.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/pm_runtime.h>
+#include <linux/rpmsg.h>
+#include <linux/slab.h>
+#include <sound/core.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/pcm_params.h>
+
+#include "fsl_rpmsg.h"
+#include "imx-pcm.h"
+
+#define FSL_RPMSG_RATES        (SNDRV_PCM_RATE_8000 | \
+				SNDRV_PCM_RATE_16000 | \
+				SNDRV_PCM_RATE_48000)
+#define FSL_RPMSG_FORMATS	SNDRV_PCM_FMTBIT_S16_LE
+
+/* 192kHz/32bit/2ch/60s size is 0x574e00 */
+#define LPA_LARGE_BUFFER_SIZE  (0x6000000)
+
+static const unsigned int fsl_rpmsg_rates[] = {
+	8000, 11025, 16000, 22050, 44100,
+	32000, 48000, 96000, 88200, 176400, 192000,
+	352800, 384000, 705600, 768000, 1411200, 2822400,
+};
+
+static const struct snd_pcm_hw_constraint_list fsl_rpmsg_rate_constraints = {
+	.count = ARRAY_SIZE(fsl_rpmsg_rates),
+	.list = fsl_rpmsg_rates,
+};
+
+static int fsl_rpmsg_hw_params(struct snd_pcm_substream *substream,
+			       struct snd_pcm_hw_params *params,
+			       struct snd_soc_dai *dai)
+{
+	struct fsl_rpmsg *rpmsg = snd_soc_dai_get_drvdata(dai);
+	struct clk *p = rpmsg->mclk, *pll = 0, *npll = 0;
+	u64 rate = params_rate(params);
+	int ret = 0;
+
+	/* Get current pll parent */
+	while (p && rpmsg->pll8k && rpmsg->pll11k) {
+		struct clk *pp = clk_get_parent(p);
+
+		if (clk_is_match(pp, rpmsg->pll8k) ||
+		    clk_is_match(pp, rpmsg->pll11k)) {
+			pll = pp;
+			break;
+		}
+		p = pp;
+	}
+
+	/* Switch to another pll parent if needed. */
+	if (pll) {
+		npll = (do_div(rate, 8000) ? rpmsg->pll11k : rpmsg->pll8k);
+		if (!clk_is_match(pll, npll)) {
+			ret = clk_set_parent(p, npll);
+			if (ret < 0)
+				dev_warn(dai->dev, "failed to set parent %s: %d\n",
+					 __clk_get_name(npll), ret);
+		}
+	}
+
+	if (!(rpmsg->mclk_streams & BIT(substream->stream))) {
+		ret = clk_prepare_enable(rpmsg->mclk);
+		if (ret) {
+			dev_err(dai->dev, "failed to enable mclk: %d\n", ret);
+			return ret;
+		}
+
+		rpmsg->mclk_streams |= BIT(substream->stream);
+	}
+
+	return ret;
+}
+
+static int fsl_rpmsg_hw_free(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	struct fsl_rpmsg *rpmsg = snd_soc_dai_get_drvdata(dai);
+
+	if (rpmsg->mclk_streams & BIT(substream->stream)) {
+		clk_disable_unprepare(rpmsg->mclk);
+		rpmsg->mclk_streams &= ~BIT(substream->stream);
+	}
+
+	return 0;
+}
+
+static int fsl_rpmsg_startup(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *cpu_dai)
+{
+	int ret;
+
+	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
+					 SNDRV_PCM_HW_PARAM_RATE,
+					 &fsl_rpmsg_rate_constraints);
+
+	return ret;
+}
+
+static const struct snd_soc_dai_ops fsl_rpmsg_dai_ops = {
+	.startup	= fsl_rpmsg_startup,
+	.hw_params      = fsl_rpmsg_hw_params,
+	.hw_free        = fsl_rpmsg_hw_free,
+};
+
+static struct snd_soc_dai_driver fsl_rpmsg_dai = {
+	.playback = {
+		.stream_name = "CPU-Playback",
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_KNOT,
+		.formats = FSL_RPMSG_FORMATS,
+	},
+	.capture = {
+		.stream_name = "CPU-Capture",
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_KNOT,
+		.formats = FSL_RPMSG_FORMATS,
+	},
+	.symmetric_rate        = 1,
+	.symmetric_channels    = 1,
+	.symmetric_sample_bits = 1,
+	.ops = &fsl_rpmsg_dai_ops,
+};
+
+static const struct snd_soc_component_driver fsl_component = {
+	.name           = "fsl-rpmsg",
+};
+
+static const struct of_device_id fsl_rpmsg_ids[] = {
+	{ .compatible = "fsl,imx7ulp-rpmsg-audio"},
+	{ .compatible = "fsl,imx8mm-rpmsg-audio"},
+	{ .compatible = "fsl,imx8mn-rpmsg-audio"},
+	{ .compatible = "fsl,imx8mp-rpmsg-audio"},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, fsl_rpmsg_ids);
+
+static int fsl_rpmsg_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct fsl_rpmsg *rpmsg;
+	int ret;
+
+	rpmsg = devm_kzalloc(&pdev->dev, sizeof(struct fsl_rpmsg), GFP_KERNEL);
+	if (!rpmsg)
+		return -ENOMEM;
+
+	if (of_property_read_bool(np, "fsl,enable-lpa")) {
+		rpmsg->enable_lpa = 1;
+		rpmsg->buffer_size = LPA_LARGE_BUFFER_SIZE;
+	} else {
+		rpmsg->buffer_size = IMX_DEFAULT_DMABUF_SIZE;
+	}
+
+	/* Get the optional clocks */
+	rpmsg->ipg = devm_clk_get(&pdev->dev, "ipg");
+	if (IS_ERR(rpmsg->ipg))
+		rpmsg->ipg = NULL;
+
+	rpmsg->mclk = devm_clk_get(&pdev->dev, "mclk");
+	if (IS_ERR(rpmsg->mclk))
+		rpmsg->mclk = NULL;
+
+	rpmsg->dma = devm_clk_get(&pdev->dev, "dma");
+	if (IS_ERR(rpmsg->dma))
+		rpmsg->dma = NULL;
+
+	rpmsg->pll8k = devm_clk_get(&pdev->dev, "pll8k");
+	if (IS_ERR(rpmsg->pll8k))
+		rpmsg->pll8k = NULL;
+
+	rpmsg->pll11k = devm_clk_get(&pdev->dev, "pll11k");
+	if (IS_ERR(rpmsg->pll11k))
+		rpmsg->pll11k = NULL;
+
+	platform_set_drvdata(pdev, rpmsg);
+	pm_runtime_enable(&pdev->dev);
+
+	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_component,
+					      &fsl_rpmsg_dai, 1);
+	if (ret)
+		return ret;
+
+	rpmsg->card_pdev = platform_device_register_data(&pdev->dev,
+							 "imx-audio-rpmsg",
+							 PLATFORM_DEVID_NONE,
+							 NULL,
+							 0);
+	if (IS_ERR(rpmsg->card_pdev)) {
+		dev_err(&pdev->dev, "failed to register rpmsg card\n");
+		ret = PTR_ERR(rpmsg->card_pdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int fsl_rpmsg_remove(struct platform_device *pdev)
+{
+	struct fsl_rpmsg *rpmsg = platform_get_drvdata(pdev);
+
+	if (rpmsg->card_pdev)
+		platform_device_unregister(rpmsg->card_pdev);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM
+static int fsl_rpmsg_runtime_resume(struct device *dev)
+{
+	struct fsl_rpmsg *rpmsg = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(rpmsg->ipg);
+	if (ret) {
+		dev_err(dev, "failed to enable ipg clock: %d\n", ret);
+		goto ipg_err;
+	}
+
+	ret = clk_prepare_enable(rpmsg->dma);
+	if (ret) {
+		dev_err(dev, "Failed to enable dma clock %d\n", ret);
+		goto dma_err;
+	}
+
+	return 0;
+
+dma_err:
+	clk_disable_unprepare(rpmsg->ipg);
+ipg_err:
+	return ret;
+}
+
+static int fsl_rpmsg_runtime_suspend(struct device *dev)
+{
+	struct fsl_rpmsg *rpmsg = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(rpmsg->dma);
+	clk_disable_unprepare(rpmsg->ipg);
+
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops fsl_rpmsg_pm_ops = {
+	SET_RUNTIME_PM_OPS(fsl_rpmsg_runtime_suspend,
+			   fsl_rpmsg_runtime_resume,
+			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
+static struct platform_driver fsl_rpmsg_driver = {
+	.probe  = fsl_rpmsg_probe,
+	.remove = fsl_rpmsg_remove,
+	.driver = {
+		.name = "fsl_rpmsg",
+		.pm = &fsl_rpmsg_pm_ops,
+		.of_match_table = fsl_rpmsg_ids,
+	},
+};
+module_platform_driver(fsl_rpmsg_driver);
+
+MODULE_DESCRIPTION("Freescale SoC Audio PRMSG CPU Interface");
+MODULE_AUTHOR("Shengjiu Wang <shengjiu.wang@nxp.com>");
+MODULE_ALIAS("platform:fsl_rpmsg");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/fsl/fsl_rpmsg.h b/sound/soc/fsl/fsl_rpmsg.h
new file mode 100644
index 000000000000..4f5b49eb18d8
--- /dev/null
+++ b/sound/soc/fsl/fsl_rpmsg.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2017-2021 NXP
+ */
+
+#ifndef __FSL_RPMSG_H
+#define __FSL_RPMSG_H
+
+/*
+ * struct fsl_rpmsg - rpmsg private data
+ *
+ * @ipg: ipg clock for cpu dai (SAI)
+ * @mclk: master clock for cpu dai (SAI)
+ * @dma: clock for dma device
+ * @pll8k: parent clock for multiple of 8kHz frequency
+ * @pll11k: parent clock for multiple of 11kHz frequency
+ * @card_pdev: Platform_device pointer to register a sound card
+ * @mclk_streams: Active streams that are using baudclk
+ * @force_lpa: force enable low power audio routine if condition satisfy
+ * @enable_lpa: enable low power audio routine according to dts setting
+ * @buffer_size: pre allocated dma buffer size
+ */
+struct fsl_rpmsg {
+	struct clk *ipg;
+	struct clk *mclk;
+	struct clk *dma;
+	struct clk *pll8k;
+	struct clk *pll11k;
+	struct platform_device *card_pdev;
+	unsigned int mclk_streams;
+	int force_lpa;
+	int enable_lpa;
+	int buffer_size;
+};
+#endif /* __FSL_RPMSG_H */
-- 
2.27.0

