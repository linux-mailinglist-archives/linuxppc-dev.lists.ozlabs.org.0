Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7956433F102
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 14:19:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0rND3SW9z3c1R
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 00:19:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0rMX6rWsz2xxj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 00:18:47 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D8C1E1A06D7;
 Wed, 17 Mar 2021 14:18:43 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 40C771A06F2;
 Wed, 17 Mar 2021 14:18:37 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id AC28D4029D;
 Wed, 17 Mar 2021 14:18:28 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] ASoC: fsl-asoc-card: Add support for WM8958 codec
Date: Wed, 17 Mar 2021 21:05:02 +0800
Message-Id: <1615986303-27959-1-git-send-email-shengjiu.wang@nxp.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

WM8958 codec is used on some i.MX based platform.
So add it support in this generic driver.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/Kconfig         |  2 ++
 sound/soc/fsl/fsl-asoc-card.c | 17 +++++++++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index c71c6024320b..0917d65d6921 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -310,6 +310,8 @@ config SND_SOC_FSL_ASOC_CARD
 	select SND_SOC_FSL_ESAI
 	select SND_SOC_FSL_SAI
 	select SND_SOC_FSL_SSI
+	select SND_SOC_WM8994
+	select MFD_WM8994
 	help
 	 ALSA SoC Audio support with ASRC feature for Freescale SoCs that have
 	 ESAI/SAI/SSI and connect with external CODECs such as WM8962, CS42888,
diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index f62f81ceab0d..c62bfd1c3ac7 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -25,6 +25,7 @@
 #include "../codecs/sgtl5000.h"
 #include "../codecs/wm8962.h"
 #include "../codecs/wm8960.h"
+#include "../codecs/wm8994.h"
 
 #define CS427x_SYSCLK_MCLK 0
 
@@ -37,12 +38,14 @@
 /**
  * struct codec_priv - CODEC private data
  * @mclk_freq: Clock rate of MCLK
+ * @free_freq: Clock rate of MCLK for hw_free()
  * @mclk_id: MCLK (or main clock) id for set_sysclk()
  * @fll_id: FLL (or secordary clock) id for set_sysclk()
  * @pll_id: PLL id for set_pll()
  */
 struct codec_priv {
 	unsigned long mclk_freq;
+	unsigned long free_freq;
 	u32 mclk_id;
 	u32 fll_id;
 	u32 pll_id;
@@ -235,10 +238,10 @@ static int fsl_asoc_card_hw_free(struct snd_pcm_substream *substream)
 	priv->streams &= ~BIT(substream->stream);
 
 	if (!priv->streams && codec_priv->pll_id && codec_priv->fll_id) {
-		/* Force freq to be 0 to avoid error message in codec */
+		/* Force freq to be free_freq to avoid error message in codec */
 		ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0),
 					     codec_priv->mclk_id,
-					     0,
+					     codec_priv->free_freq,
 					     SND_SOC_CLOCK_IN);
 		if (ret) {
 			dev_err(dev, "failed to switch away from FLL: %d\n", ret);
@@ -665,6 +668,15 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
 		priv->card.dapm_routes = audio_map_rx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_rx);
+	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8958")) {
+		codec_dai_name = "wm8994-aif1";
+		priv->dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
+		priv->codec_priv.mclk_id = WM8994_FLL_SRC_MCLK1;
+		priv->codec_priv.fll_id = WM8994_SYSCLK_FLL1;
+		priv->codec_priv.pll_id = WM8994_FLL1;
+		priv->codec_priv.free_freq = priv->codec_priv.mclk_freq;
+		priv->card.dapm_routes = NULL;
+		priv->card.num_dapm_routes = 0;
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret = -EINVAL;
@@ -882,6 +894,7 @@ static const struct of_device_id fsl_asoc_card_dt_ids[] = {
 	{ .compatible = "fsl,imx-audio-mqs", },
 	{ .compatible = "fsl,imx-audio-wm8524", },
 	{ .compatible = "fsl,imx-audio-si476x", },
+	{ .compatible = "fsl,imx-audio-wm8958", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_asoc_card_dt_ids);
-- 
2.27.0

