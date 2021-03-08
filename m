Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 018ED330F78
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 14:37:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvKCG059sz3dgF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 00:37:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvK9F4JVvz3ccS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 00:35:45 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F19AA1A0146;
 Mon,  8 Mar 2021 14:35:42 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 217461A0BB0;
 Mon,  8 Mar 2021 14:35:36 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id C579440313;
 Mon,  8 Mar 2021 14:35:27 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, linuxppc-dev@lists.ozlabs.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v4 6/6] ASoC: imx-rpmsg: Add machine driver for audio base on
 rpmsg
Date: Mon,  8 Mar 2021 21:22:30 +0800
Message-Id: <1615209750-2357-7-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615209750-2357-1-git-send-email-shengjiu.wang@nxp.com>
References: <1615209750-2357-1-git-send-email-shengjiu.wang@nxp.com>
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

The platform device is not registered by device tree or
cpu dai driver, it is registered by the rpmsg channel,
So add a dedicated machine driver to handle this case.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/Kconfig     |  12 ++++
 sound/soc/fsl/Makefile    |   2 +
 sound/soc/fsl/imx-rpmsg.c | 127 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 141 insertions(+)
 create mode 100644 sound/soc/fsl/imx-rpmsg.c

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 3b94882aee99..ad69026a7fd1 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -334,6 +334,18 @@ config SND_SOC_IMX_HDMI
 	  Say Y if you want to add support for SoC audio on an i.MX board with
 	  IMX HDMI.
 
+config SND_SOC_IMX_RPMSG
+	tristate "SoC Audio support for i.MX boards with rpmsg"
+	depends on RPMSG
+	select SND_SOC_IMX_PCM_RPMSG
+	select SND_SOC_IMX_AUDIO_RPMSG
+	select SND_SOC_FSL_RPMSG
+	help
+	  SoC Audio support for i.MX boards with rpmsg.
+	  There should be rpmsg devices defined in other core (M core)
+	  Say Y if you want to add support for SoC audio on an i.MX board with
+	  a rpmsg devices.
+
 endif # SND_IMX_SOC
 
 endmenu
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index ce4f4324c3a2..f146ce464acd 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -70,6 +70,7 @@ snd-soc-imx-sgtl5000-objs := imx-sgtl5000.o
 snd-soc-imx-spdif-objs := imx-spdif.o
 snd-soc-imx-audmix-objs := imx-audmix.o
 snd-soc-imx-hdmi-objs := imx-hdmi.o
+snd-soc-imx-rpmsg-objs := imx-rpmsg.o
 
 obj-$(CONFIG_SND_SOC_EUKREA_TLV320) += snd-soc-eukrea-tlv320.o
 obj-$(CONFIG_SND_SOC_IMX_ES8328) += snd-soc-imx-es8328.o
@@ -77,3 +78,4 @@ obj-$(CONFIG_SND_SOC_IMX_SGTL5000) += snd-soc-imx-sgtl5000.o
 obj-$(CONFIG_SND_SOC_IMX_SPDIF) += snd-soc-imx-spdif.o
 obj-$(CONFIG_SND_SOC_IMX_AUDMIX) += snd-soc-imx-audmix.o
 obj-$(CONFIG_SND_SOC_IMX_HDMI) += snd-soc-imx-hdmi.o
+obj-$(CONFIG_SND_SOC_IMX_RPMSG) += snd-soc-imx-rpmsg.o
diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
new file mode 100644
index 000000000000..c26531525a7b
--- /dev/null
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2017-2020 NXP
+
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/i2c.h>
+#include <linux/of_gpio.h>
+#include <linux/slab.h>
+#include <linux/gpio.h>
+#include <linux/clk.h>
+#include <sound/soc.h>
+#include <sound/jack.h>
+#include <sound/control.h>
+#include <sound/pcm_params.h>
+#include <sound/soc-dapm.h>
+#include "imx-pcm-rpmsg.h"
+
+struct imx_rpmsg {
+	struct snd_soc_dai_link dai;
+	struct snd_soc_card card;
+};
+
+static int imx_rpmsg_probe(struct platform_device *pdev)
+{
+	struct snd_soc_dai_link_component *dlc;
+	struct device *dev = pdev->dev.parent;
+	/* rpmsg_pdev is the platform device for the rpmsg node that probed us */
+	struct platform_device *rpmsg_pdev = to_platform_device(dev);
+	struct device_node *np = rpmsg_pdev->dev.of_node;
+	struct of_phandle_args args;
+	struct imx_rpmsg *data;
+	int ret = 0;
+
+	dlc = devm_kzalloc(&pdev->dev, 3 * sizeof(*dlc), GFP_KERNEL);
+	if (!dlc)
+		return -ENOMEM;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data) {
+		ret = -ENOMEM;
+		goto fail;
+	}
+
+	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
+	if (ret)
+		dev_warn(&pdev->dev, "no reserved DMA memory\n");
+
+	data->dai.cpus = &dlc[0];
+	data->dai.num_cpus = 1;
+	data->dai.platforms = &dlc[1];
+	data->dai.num_platforms = 1;
+	data->dai.codecs = &dlc[2];
+	data->dai.num_codecs = 1;
+
+	data->dai.name = "rpmsg hifi";
+	data->dai.stream_name = "rpmsg hifi";
+	data->dai.dai_fmt = SND_SOC_DAIFMT_I2S |
+			    SND_SOC_DAIFMT_NB_NF |
+			    SND_SOC_DAIFMT_CBS_CFS;
+
+	/* Optional codec node */
+	ret = of_parse_phandle_with_fixed_args(np, "audio-codec", 0, 0, &args);
+	if (ret) {
+		data->dai.codecs->dai_name = "snd-soc-dummy-dai";
+		data->dai.codecs->name = "snd-soc-dummy";
+	} else {
+		data->dai.codecs->of_node = args.np;
+		ret = snd_soc_get_dai_name(&args, &data->dai.codecs->dai_name);
+		if (ret) {
+			dev_err(&pdev->dev, "Unable to get codec_dai_name\n");
+			goto fail;
+		}
+	}
+
+	data->dai.cpus->dai_name = dev_name(&rpmsg_pdev->dev);
+	data->dai.platforms->name = IMX_PCM_DRV_NAME;
+	data->dai.playback_only = true;
+	data->dai.capture_only = true;
+	data->card.num_links = 1;
+	data->card.dai_link = &data->dai;
+
+	if (of_property_read_bool(np, "fsl,rpmsg-out"))
+		data->dai.capture_only = false;
+
+	if (of_property_read_bool(np, "fsl,rpmsg-in"))
+		data->dai.playback_only = false;
+
+	if (data->dai.playback_only && data->dai.capture_only) {
+		dev_err(&pdev->dev, "no enabled rpmsg DAI link\n");
+		ret = -EINVAL;
+		goto fail;
+	}
+
+	data->card.dev = &pdev->dev;
+	data->card.owner = THIS_MODULE;
+
+	ret = of_property_read_string_index(np, "model", 0, &data->card.name);
+	if (ret)
+		goto fail;
+
+	platform_set_drvdata(pdev, &data->card);
+	snd_soc_card_set_drvdata(&data->card, data);
+	ret = devm_snd_soc_register_card(&pdev->dev, &data->card);
+	if (ret) {
+		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
+		goto fail;
+	}
+
+fail:
+	return ret;
+}
+
+static struct platform_driver imx_rpmsg_driver = {
+	.driver = {
+		.name = "imx-audio-rpmsg",
+		.owner = THIS_MODULE,
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = imx_rpmsg_probe,
+};
+module_platform_driver(imx_rpmsg_driver);
+
+MODULE_DESCRIPTION("Freescale SoC Audio RPMSG Machine Driver");
+MODULE_AUTHOR("Shengjiu Wang <shengjiu.wang@nxp.com>");
+MODULE_ALIAS("platform:imx-audio-rpmsg");
+MODULE_LICENSE("GPL v2");
-- 
2.27.0

