Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3472D0309
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 11:53:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CpjwW0xS9zDqkp
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 21:53:31 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CpjrM11kyzDqhS
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Dec 2020 21:49:53 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1A40C1A0AAF;
 Sun,  6 Dec 2020 11:49:50 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C6CFF1A0AC3;
 Sun,  6 Dec 2020 11:49:44 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 4B3FA402E1;
 Sun,  6 Dec 2020 11:49:38 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: fsl: Add imx-hdmi machine driver
Date: Sun,  6 Dec 2020 18:41:59 +0800
Message-Id: <1607251319-5821-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607251319-5821-1-git-send-email-shengjiu.wang@nxp.com>
References: <1607251319-5821-1-git-send-email-shengjiu.wang@nxp.com>
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

The driver is initially designed for sound card using HDMI
interface on i.MX platform. There is internal HDMI IP or
external HDMI modules connect with SAI or AUD2HTX interface.
It supports both transmitter and receiver devices.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2
- update according to Nicolin's comments.

 sound/soc/fsl/Kconfig    |  12 ++
 sound/soc/fsl/Makefile   |   2 +
 sound/soc/fsl/imx-hdmi.c | 236 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 250 insertions(+)
 create mode 100644 sound/soc/fsl/imx-hdmi.c

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 24710decd38a..84db0b7b9d59 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -305,6 +305,18 @@ config SND_SOC_IMX_AUDMIX
 	  Say Y if you want to add support for SoC audio on an i.MX board with
 	  an Audio Mixer.
 
+config SND_SOC_IMX_HDMI
+	tristate "SoC Audio support for i.MX boards with HDMI port"
+	select SND_SOC_FSL_SAI
+	select SND_SOC_FSL_AUD2HTX
+	select SND_SOC_HDMI_CODEC
+	help
+	  ALSA SoC Audio support with HDMI feature for Freescale SoCs that have
+	  SAI/AUD2HTX and connect with internal HDMI IP or external module
+	  SII902X.
+	  Say Y if you want to add support for SoC audio on an i.MX board with
+	  IMX HDMI.
+
 endif # SND_IMX_SOC
 
 endmenu
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index 0b20e038b65b..8c5fa8a859c0 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -65,9 +65,11 @@ snd-soc-imx-es8328-objs := imx-es8328.o
 snd-soc-imx-sgtl5000-objs := imx-sgtl5000.o
 snd-soc-imx-spdif-objs := imx-spdif.o
 snd-soc-imx-audmix-objs := imx-audmix.o
+snd-soc-imx-hdmi-objs := imx-hdmi.o
 
 obj-$(CONFIG_SND_SOC_EUKREA_TLV320) += snd-soc-eukrea-tlv320.o
 obj-$(CONFIG_SND_SOC_IMX_ES8328) += snd-soc-imx-es8328.o
 obj-$(CONFIG_SND_SOC_IMX_SGTL5000) += snd-soc-imx-sgtl5000.o
 obj-$(CONFIG_SND_SOC_IMX_SPDIF) += snd-soc-imx-spdif.o
 obj-$(CONFIG_SND_SOC_IMX_AUDMIX) += snd-soc-imx-audmix.o
+obj-$(CONFIG_SND_SOC_IMX_HDMI) += snd-soc-imx-hdmi.o
diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
new file mode 100644
index 000000000000..2c2a76a71940
--- /dev/null
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright 2017-2020 NXP
+
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <sound/jack.h>
+#include <sound/pcm_params.h>
+#include <sound/hdmi-codec.h>
+#include "fsl_sai.h"
+
+/**
+ * struct cpu_priv - CPU private data
+ * @sysclk_freq: SYSCLK rates for set_sysclk()
+ * @sysclk_dir: SYSCLK directions for set_sysclk()
+ * @sysclk_id: SYSCLK ids for set_sysclk()
+ * @slot_width: Slot width of each frame
+ *
+ * Note: [1] for tx and [0] for rx
+ */
+struct cpu_priv {
+	unsigned long sysclk_freq[2];
+	u32 sysclk_dir[2];
+	u32 sysclk_id[2];
+	u32 slot_width;
+};
+
+struct imx_hdmi_data {
+	struct snd_soc_dai_link dai;
+	struct snd_soc_card card;
+	struct snd_soc_jack hdmi_jack;
+	struct snd_soc_jack_pin hdmi_jack_pin;
+	struct cpu_priv cpu_priv;
+	u32 dai_fmt;
+};
+
+static int imx_hdmi_hw_params(struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct imx_hdmi_data *data = snd_soc_card_get_drvdata(rtd->card);
+	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+	struct device *dev = card->dev;
+	u32 slot_width = data->cpu_priv.slot_width;
+	int ret;
+
+	/* MCLK always is (256 or 192) * rate. */
+	ret = snd_soc_dai_set_sysclk(cpu_dai, data->cpu_priv.sysclk_id[tx],
+				     8 * slot_width * params_rate(params),
+				     tx ? SND_SOC_CLOCK_OUT : SND_SOC_CLOCK_IN);
+	if (ret && ret != -ENOTSUPP) {
+		dev_err(dev, "failed to set cpu sysclk: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0, 2, slot_width);
+	if (ret && ret != -ENOTSUPP) {
+		dev_err(dev, "failed to set cpu dai tdm slot: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static struct snd_soc_ops imx_hdmi_ops = {
+	.hw_params = imx_hdmi_hw_params,
+};
+
+static const struct snd_soc_dapm_widget imx_hdmi_widgets[] = {
+	SND_SOC_DAPM_LINE("HDMI Jack", NULL),
+};
+
+static int imx_hdmi_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
+	struct imx_hdmi_data *data = snd_soc_card_get_drvdata(card);
+	int ret;
+
+	data->hdmi_jack_pin.pin = "HDMI Jack";
+	data->hdmi_jack_pin.mask = SND_JACK_LINEOUT;
+	/* enable jack detection */
+	ret = snd_soc_card_jack_new(card, "HDMI Jack", SND_JACK_LINEOUT,
+				    &data->hdmi_jack, &data->hdmi_jack_pin, 1);
+	if (ret) {
+		dev_err(card->dev, "Can't new HDMI Jack %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_component_set_jack(component, &data->hdmi_jack, NULL);
+	if (ret && ret != -EOPNOTSUPP) {
+		dev_err(card->dev, "Can't set HDMI Jack %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+};
+
+static int imx_hdmi_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	bool hdmi_out = of_property_read_bool(np, "hdmi-out");
+	bool hdmi_in = of_property_read_bool(np, "hdmi-in");
+	struct snd_soc_dai_link_component *dlc;
+	struct platform_device *cpu_pdev;
+	struct device_node *cpu_np;
+	struct imx_hdmi_data *data;
+	int ret;
+
+	dlc = devm_kzalloc(&pdev->dev, 3 * sizeof(*dlc), GFP_KERNEL);
+	if (!dlc)
+		return -ENOMEM;
+
+	cpu_np = of_parse_phandle(np, "audio-cpu", 0);
+	if (!cpu_np) {
+		dev_err(&pdev->dev, "cpu dai phandle missing or invalid\n");
+		ret = -EINVAL;
+		goto fail;
+	}
+
+	cpu_pdev = of_find_device_by_node(cpu_np);
+	if (!cpu_pdev) {
+		dev_err(&pdev->dev, "failed to find SAI platform device\n");
+		ret = -EINVAL;
+		goto fail;
+	}
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data) {
+		ret = -ENOMEM;
+		goto fail;
+	}
+
+	data->dai.cpus = &dlc[0];
+	data->dai.num_cpus = 1;
+	data->dai.platforms = &dlc[1];
+	data->dai.num_platforms = 1;
+	data->dai.codecs = &dlc[2];
+	data->dai.num_codecs = 1;
+
+	data->dai.name = "i.MX HDMI";
+	data->dai.stream_name = "i.MX HDMI";
+	data->dai.cpus->dai_name = dev_name(&cpu_pdev->dev);
+	data->dai.platforms->of_node = cpu_np;
+	data->dai.ops = &imx_hdmi_ops;
+	data->dai.playback_only = true;
+	data->dai.capture_only = false;
+	data->dai.init = imx_hdmi_init;
+
+	if (of_node_name_eq(cpu_np, "sai")) {
+		data->cpu_priv.sysclk_id[1] = FSL_SAI_CLK_MAST1;
+		data->cpu_priv.sysclk_id[0] = FSL_SAI_CLK_MAST1;
+	}
+
+	if (of_device_is_compatible(np, "fsl,imx-audio-sii902x")) {
+		data->dai_fmt = SND_SOC_DAIFMT_LEFT_J;
+		data->cpu_priv.slot_width = 24;
+	} else {
+		data->dai_fmt = SND_SOC_DAIFMT_I2S;
+		data->cpu_priv.slot_width = 32;
+	}
+
+	if ((hdmi_out && hdmi_in) || (!hdmi_out && !hdmi_in)) {
+		dev_err(&pdev->dev, "Invalid HDMI DAI link\n");
+		goto fail;
+	}
+
+	if (hdmi_out) {
+		data->dai.playback_only = true;
+		data->dai.capture_only = false;
+		data->dai.codecs->dai_name = "i2s-hifi";
+		data->dai.codecs->name = "hdmi-audio-codec.1";
+		data->dai.dai_fmt = data->dai_fmt |
+				    SND_SOC_DAIFMT_NB_NF |
+				    SND_SOC_DAIFMT_CBS_CFS;
+	}
+
+	if (hdmi_in) {
+		data->dai.playback_only = false;
+		data->dai.capture_only = true;
+		data->dai.codecs->dai_name = "i2s-hifi";
+		data->dai.codecs->name = "hdmi-audio-codec.2";
+		data->dai.dai_fmt = data->dai_fmt |
+				    SND_SOC_DAIFMT_NB_NF |
+				    SND_SOC_DAIFMT_CBM_CFM;
+	}
+
+	data->card.dapm_widgets = imx_hdmi_widgets;
+	data->card.num_dapm_widgets = ARRAY_SIZE(imx_hdmi_widgets);
+	data->card.dev = &pdev->dev;
+	data->card.owner = THIS_MODULE;
+	ret = snd_soc_of_parse_card_name(&data->card, "model");
+	if (ret)
+		goto fail;
+
+	data->card.num_links = 1;
+	data->card.dai_link = &data->dai;
+
+	snd_soc_card_set_drvdata(&data->card, data);
+	ret = devm_snd_soc_register_card(&pdev->dev, &data->card);
+	if (ret) {
+		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
+		goto fail;
+	}
+
+fail:
+	if (cpu_np)
+		of_node_put(cpu_np);
+
+	return ret;
+}
+
+static const struct of_device_id imx_hdmi_dt_ids[] = {
+	{ .compatible = "fsl,imx-audio-hdmi", },
+	{ .compatible = "fsl,imx-audio-sii902x", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx_hdmi_dt_ids);
+
+static struct platform_driver imx_hdmi_driver = {
+	.driver = {
+		.name = "imx-hdmi",
+		.owner = THIS_MODULE,
+		.pm = &snd_soc_pm_ops,
+		.of_match_table = imx_hdmi_dt_ids,
+	},
+	.probe = imx_hdmi_probe,
+};
+module_platform_driver(imx_hdmi_driver);
+
+MODULE_AUTHOR("Freescale Semiconductor, Inc.");
+MODULE_DESCRIPTION("Freescale i.MX hdmi audio ASoC machine driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:imx-hdmi");
-- 
2.27.0

