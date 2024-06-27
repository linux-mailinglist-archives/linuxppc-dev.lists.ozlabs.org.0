Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF33E91A196
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 10:35:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=sUaRCeb1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8sMF3VFXz3d9g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 18:35:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=sUaRCeb1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=savoirfairelinux.com (client-ip=208.88.110.44; helo=mail.savoirfairelinux.com; envelope-from=elinor.montmasson@savoirfairelinux.com; receiver=lists.ozlabs.org)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8sHh3HJJz3dFy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 18:32:00 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 851EA9C5A9D;
	Thu, 27 Jun 2024 04:31:59 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id Cx6vf-EqgoYR; Thu, 27 Jun 2024 04:31:57 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CF6619C585F;
	Thu, 27 Jun 2024 04:31:56 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com CF6619C585F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1719477116; bh=7oC4Re62XV8miX16AgRzJ5AXo9VZfZuQo5Hja1WU+/Q=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=sUaRCeb1V0l9+VHzToEEE52HoPyU87lK1YbIy2SIWN7ghlLS0XMeJRVH4KhsqOcHe
	 OuwEmRZ/kyQPUyTC99GW84QMbRTH2mdE8JgFpAqVG8sY8CEKuIG5iMn9QfY/mCDYaZ
	 3BXz/JzHHbznIW2pbpNUW+qNPf8SaMXo/yFh8GLAM/+i5pc+WPzq6mMKY0vCKqBR6i
	 qLrNEFpjL8DEOZOK9J+Ay7klmFC7IMUoiBAfW04F2rWgQcTTn90EfSa02X4I2gflkb
	 ggd8z85fgu+rLbEp3ZorI3TVnmkBfuSXWFeB0ZV2471qI5wlKOy8X1IA0VHqS8nXvQ
	 Vxu2eyegaiAYA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id uxVzyp7bidlR; Thu, 27 Jun 2024 04:31:56 -0400 (EDT)
Received: from gerard.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id ED1209C5A22;
	Thu, 27 Jun 2024 04:31:53 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH v6 4/7] ASoC: fsl-asoc-card: merge spdif support from imx-spdif.c
Date: Thu, 27 Jun 2024 10:31:01 +0200
Message-Id: <20240627083104.123357-5-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627083104.123357-1-elinor.montmasson@savoirfairelinux.com>
References: <20240627083104.123357-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>, Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The imx-spdif machine driver creates audio card to directly use an
S/PDIF device. However, it doesn't support interacting with an ASRC.
fsl-asoc-card already has the support to create audio card which can
use the ASRC.

Merge the S/PDIF support from imx-spdif into driver fsl-asoc-card
to extend the support of S/PDIF audio card with the use of ASRC devices.

fsl-asoc-card uses slightly different DT properties than imx-spdif:
* the "spdif-controller" property from imx-spdif is named "audio-cpu" in
  fsl-asoc-card.
* fsl-asoc-card uses codecs explicitly declared in DT
  with "audio-codec".
  With an SPDIF, codec drivers spdif_transmitter and
  spdif_receiver should be used.
  Driver imx-spdif used instead the dummy codec and a pair of
  boolean properties, "spdif-in" and "spdif-out".

To keep backward compatibility, support for "spdif-controller",
"spdif-in" and "spdif-out" is also added to fsl-asoc-card.
However, it is recommended to use the new properties if possible.
It is better to declare transmitter and/or receiver in DT
than using the dummy codec.

DTs using compatible "fsl,imx-audio-spdif" are still compatible, and
fsl-asoc-card will behave the same as imx-spdif
for these DTs.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
---
 arch/arm/configs/imx_v6_v7_defconfig |   1 -
 arch/arm64/configs/defconfig         |   1 -
 sound/soc/fsl/Kconfig                |  10 +--
 sound/soc/fsl/Makefile               |   2 -
 sound/soc/fsl/fsl-asoc-card.c        |  85 +++++++++++++++++++++-
 sound/soc/fsl/imx-spdif.c            | 103 ---------------------------
 6 files changed, 84 insertions(+), 118 deletions(-)
 delete mode 100644 sound/soc/fsl/imx-spdif.c

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6=
_v7_defconfig
index cf2480dce285..ac5ae621b2af 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -311,7 +311,6 @@ CONFIG_SND_IMX_SOC=3Dy
 CONFIG_SND_SOC_EUKREA_TLV320=3Dy
 CONFIG_SND_SOC_IMX_ES8328=3Dy
 CONFIG_SND_SOC_IMX_SGTL5000=3Dy
-CONFIG_SND_SOC_IMX_SPDIF=3Dy
 CONFIG_SND_SOC_FSL_ASOC_CARD=3Dy
 CONFIG_SND_SOC_AC97_CODEC=3Dy
 CONFIG_SND_SOC_CS42XX8_I2C=3Dy
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 57a9abe78ee4..a6c9688fee0e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -940,7 +940,6 @@ CONFIG_SND_SOC_FSL_MICFIL=3Dm
 CONFIG_SND_SOC_FSL_EASRC=3Dm
 CONFIG_SND_IMX_SOC=3Dm
 CONFIG_SND_SOC_IMX_SGTL5000=3Dm
-CONFIG_SND_SOC_IMX_SPDIF=3Dm
 CONFIG_SND_SOC_FSL_ASOC_CARD=3Dm
 CONFIG_SND_SOC_IMX_AUDMIX=3Dm
 CONFIG_SND_SOC_MT8183=3Dm
diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 9a371d4496c2..e3b2bfb016c8 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -296,15 +296,6 @@ config SND_SOC_IMX_SGTL5000
 	  SND_SOC_FSL_ASOC_CARD and SND_SOC_SGTL5000 to use the newer
 	  driver.
=20
-config SND_SOC_IMX_SPDIF
-	tristate "SoC Audio support for i.MX boards with S/PDIF"
-	select SND_SOC_IMX_PCM_DMA
-	select SND_SOC_FSL_SPDIF
-	help
-	  SoC Audio support for i.MX boards with S/PDIF
-	  Say Y if you want to add support for SoC audio on an i.MX board with
-	  a S/DPDIF.
-
 config SND_SOC_FSL_ASOC_CARD
 	tristate "Generic ASoC Sound Card with ASRC support"
 	depends on OF && I2C
@@ -316,6 +307,7 @@ config SND_SOC_FSL_ASOC_CARD
 	select SND_SOC_FSL_ESAI
 	select SND_SOC_FSL_SAI
 	select SND_SOC_FSL_SSI
+	select SND_SOC_FSL_SPDIF
 	select SND_SOC_TLV320AIC31XX
 	select SND_SOC_WM8994
 	select MFD_WM8994
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index 2fe78eed3a48..1ae181b24a88 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -65,7 +65,6 @@ obj-$(CONFIG_SND_SOC_IMX_PCM_RPMSG) +=3D imx-pcm-rpmsg.o
 snd-soc-eukrea-tlv320-y :=3D eukrea-tlv320.o
 snd-soc-imx-es8328-y :=3D imx-es8328.o
 snd-soc-imx-sgtl5000-y :=3D imx-sgtl5000.o
-snd-soc-imx-spdif-y :=3D imx-spdif.o
 snd-soc-imx-audmix-y :=3D imx-audmix.o
 snd-soc-imx-hdmi-y :=3D imx-hdmi.o
 snd-soc-imx-rpmsg-y :=3D imx-rpmsg.o
@@ -74,7 +73,6 @@ snd-soc-imx-card-y :=3D imx-card.o
 obj-$(CONFIG_SND_SOC_EUKREA_TLV320) +=3D snd-soc-eukrea-tlv320.o
 obj-$(CONFIG_SND_SOC_IMX_ES8328) +=3D snd-soc-imx-es8328.o
 obj-$(CONFIG_SND_SOC_IMX_SGTL5000) +=3D snd-soc-imx-sgtl5000.o
-obj-$(CONFIG_SND_SOC_IMX_SPDIF) +=3D snd-soc-imx-spdif.o
 obj-$(CONFIG_SND_SOC_IMX_AUDMIX) +=3D snd-soc-imx-audmix.o
 obj-$(CONFIG_SND_SOC_IMX_HDMI) +=3D snd-soc-imx-hdmi.o
 obj-$(CONFIG_SND_SOC_IMX_RPMSG) +=3D snd-soc-imx-rpmsg.o
diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 87329731e02d..82df887b3af5 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -477,6 +477,75 @@ static int fsl_asoc_card_audmux_init(struct device_nod=
e *np,
 	return 0;
 }
=20
+static int fsl_asoc_card_spdif_init(struct device_node *codec_np[],
+				    struct device_node *cpu_np,
+				    const char *codec_dai_name[],
+				    struct fsl_asoc_card_priv *priv)
+{
+	struct device *dev =3D &priv->pdev->dev;
+	struct device_node *np =3D dev->of_node;
+
+	if (!of_node_name_eq(cpu_np, "spdif")) {
+		dev_err(dev, "CPU phandle invalid, should be an SPDIF device\n");
+		return -EINVAL;
+	}
+
+	priv->dai_link[0].playback_only =3D true;
+	priv->dai_link[0].capture_only =3D true;
+
+	for (int i =3D 0; i < 2; i++) {
+		if (!codec_np[i])
+			break;
+
+		if (of_device_is_compatible(codec_np[i], "linux,spdif-dit")) {
+			priv->dai_link[0].capture_only =3D false;
+			codec_dai_name[i] =3D "dit-hifi";
+		} else if (of_device_is_compatible(codec_np[i], "linux,spdif-dir")) {
+			priv->dai_link[0].playback_only =3D false;
+			codec_dai_name[i] =3D "dir-hifi";
+		}
+	}
+
+	// Old SPDIF DT binding
+	if (!codec_np[0]) {
+		codec_dai_name[0] =3D snd_soc_dummy_dlc.dai_name;
+		if (of_property_read_bool(np, "spdif-out"))
+			priv->dai_link[0].capture_only =3D false;
+		if (of_property_read_bool(np, "spdif-in"))
+			priv->dai_link[0].playback_only =3D false;
+	}
+
+	if (priv->dai_link[0].playback_only && priv->dai_link[0].capture_only) {
+		dev_err(dev, "no enabled S/PDIF DAI link\n");
+		return -EINVAL;
+	}
+
+	if (priv->dai_link[0].playback_only) {
+		priv->dai_link[1].dpcm_capture =3D false;
+		priv->dai_link[2].dpcm_capture =3D false;
+		priv->card.dapm_routes =3D audio_map_tx;
+		priv->card.num_dapm_routes =3D ARRAY_SIZE(audio_map_tx);
+	} else if (priv->dai_link[0].capture_only) {
+		priv->dai_link[1].dpcm_playback =3D false;
+		priv->dai_link[2].dpcm_playback =3D false;
+		priv->card.dapm_routes =3D audio_map_rx;
+		priv->card.num_dapm_routes =3D ARRAY_SIZE(audio_map_rx);
+	}
+
+	// No DAPM routes with old bindings and dummy codec
+	if (!codec_np[0]) {
+		priv->card.dapm_routes =3D NULL;
+		priv->card.num_dapm_routes =3D 0;
+	}
+
+	if (codec_np[0] && codec_np[1]) {
+		priv->dai_link[0].num_codecs =3D 2;
+		priv->dai_link[2].num_codecs =3D 2;
+	}
+
+	return 0;
+}
+
 static int hp_jack_event(struct notifier_block *nb, unsigned long event,
 			 void *data)
 {
@@ -582,9 +651,11 @@ static int fsl_asoc_card_probe(struct platform_device =
*pdev)
 	priv->pdev =3D pdev;
=20
 	cpu_np =3D of_parse_phandle(np, "audio-cpu", 0);
-	/* Give a chance to old DT binding */
+	/* Give a chance to old DT bindings */
 	if (!cpu_np)
 		cpu_np =3D of_parse_phandle(np, "ssi-controller", 0);
+	if (!cpu_np)
+		cpu_np =3D of_parse_phandle(np, "spdif-controller", 0);
 	if (!cpu_np) {
 		dev_err(&pdev->dev, "CPU phandle missing or invalid\n");
 		ret =3D -EINVAL;
@@ -748,6 +819,10 @@ static int fsl_asoc_card_probe(struct platform_device =
*pdev)
 		priv->codec_priv[0].fll_id =3D WM8904_CLK_FLL;
 		priv->codec_priv[0].pll_id =3D WM8904_FLL_MCLK;
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
+	} else if (of_device_is_compatible(np, "fsl,imx-audio-spdif")) {
+		ret =3D fsl_asoc_card_spdif_init(codec_np, cpu_np, codec_dai_name, priv);
+		if (ret)
+			goto asrc_fail;
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
@@ -797,7 +872,8 @@ static int fsl_asoc_card_probe(struct platform_device *=
pdev)
 	of_node_put(bitclkprovider);
 	of_node_put(frameprovider);
=20
-	if (!fsl_asoc_card_is_ac97(priv) && !codec_dev[0]) {
+	if (!fsl_asoc_card_is_ac97(priv) && !codec_dev[0]
+	    && codec_dai_name[0] !=3D snd_soc_dummy_dlc.dai_name) {
 		dev_dbg(&pdev->dev, "failed to find codec device\n");
 		ret =3D -EPROBE_DEFER;
 		goto asrc_fail;
@@ -862,6 +938,10 @@ static int fsl_asoc_card_probe(struct platform_device =
*pdev)
 		codec_comp->dai_name =3D codec_dai_name[codec_idx];
 	}
=20
+	// Old SPDIF DT binding support
+	if (codec_dai_name[0] =3D=3D snd_soc_dummy_dlc.dai_name)
+		priv->dai_link[0].codecs[0].name =3D snd_soc_dummy_dlc.name;
+
 	if (!fsl_asoc_card_is_ac97(priv)) {
 		for_each_link_codecs((&(priv->dai_link[0])), codec_idx, codec_comp) {
 			codec_comp->of_node =3D codec_np[codec_idx];
@@ -992,6 +1072,7 @@ static const struct of_device_id fsl_asoc_card_dt_ids[=
] =3D {
 	{ .compatible =3D "fsl,imx-audio-wm8958", },
 	{ .compatible =3D "fsl,imx-audio-nau8822", },
 	{ .compatible =3D "fsl,imx-audio-wm8904", },
+	{ .compatible =3D "fsl,imx-audio-spdif", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_asoc_card_dt_ids);
diff --git a/sound/soc/fsl/imx-spdif.c b/sound/soc/fsl/imx-spdif.c
deleted file mode 100644
index 1e57939a7e29..000000000000
--- a/sound/soc/fsl/imx-spdif.c
+++ /dev/null
@@ -1,103 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-//
-// Copyright (C) 2013 Freescale Semiconductor, Inc.
-
-#include <linux/module.h>
-#include <linux/of_platform.h>
-#include <sound/soc.h>
-
-struct imx_spdif_data {
-	struct snd_soc_dai_link dai;
-	struct snd_soc_card card;
-};
-
-static int imx_spdif_audio_probe(struct platform_device *pdev)
-{
-	struct device_node *spdif_np, *np =3D pdev->dev.of_node;
-	struct imx_spdif_data *data;
-	struct snd_soc_dai_link_component *comp;
-	int ret =3D 0;
-
-	spdif_np =3D of_parse_phandle(np, "spdif-controller", 0);
-	if (!spdif_np) {
-		dev_err(&pdev->dev, "failed to find spdif-controller\n");
-		ret =3D -EINVAL;
-		goto end;
-	}
-
-	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
-	comp =3D devm_kzalloc(&pdev->dev, sizeof(*comp), GFP_KERNEL);
-	if (!data || !comp) {
-		ret =3D -ENOMEM;
-		goto end;
-	}
-
-	/*
-	 * CPU =3D=3D Platform
-	 * platform is using soc-generic-dmaengine-pcm
-	 */
-	data->dai.cpus		=3D
-	data->dai.platforms	=3D comp;
-	data->dai.codecs	=3D &snd_soc_dummy_dlc;
-
-	data->dai.num_cpus	=3D 1;
-	data->dai.num_codecs	=3D 1;
-	data->dai.num_platforms	=3D 1;
-
-	data->dai.name =3D "S/PDIF PCM";
-	data->dai.stream_name =3D "S/PDIF PCM";
-	data->dai.cpus->of_node =3D spdif_np;
-	data->dai.playback_only =3D true;
-	data->dai.capture_only =3D true;
-
-	if (of_property_read_bool(np, "spdif-out"))
-		data->dai.capture_only =3D false;
-
-	if (of_property_read_bool(np, "spdif-in"))
-		data->dai.playback_only =3D false;
-
-	if (data->dai.playback_only && data->dai.capture_only) {
-		dev_err(&pdev->dev, "no enabled S/PDIF DAI link\n");
-		goto end;
-	}
-
-	data->card.dev =3D &pdev->dev;
-	data->card.dai_link =3D &data->dai;
-	data->card.num_links =3D 1;
-	data->card.owner =3D THIS_MODULE;
-
-	ret =3D snd_soc_of_parse_card_name(&data->card, "model");
-	if (ret)
-		goto end;
-
-	ret =3D devm_snd_soc_register_card(&pdev->dev, &data->card);
-	if (ret)
-		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
-
-end:
-	of_node_put(spdif_np);
-
-	return ret;
-}
-
-static const struct of_device_id imx_spdif_dt_ids[] =3D {
-	{ .compatible =3D "fsl,imx-audio-spdif", },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, imx_spdif_dt_ids);
-
-static struct platform_driver imx_spdif_driver =3D {
-	.driver =3D {
-		.name =3D "imx-spdif",
-		.pm =3D &snd_soc_pm_ops,
-		.of_match_table =3D imx_spdif_dt_ids,
-	},
-	.probe =3D imx_spdif_audio_probe,
-};
-
-module_platform_driver(imx_spdif_driver);
-
-MODULE_AUTHOR("Freescale Semiconductor, Inc.");
-MODULE_DESCRIPTION("Freescale i.MX S/PDIF machine driver");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:imx-spdif");
--=20
2.34.1

