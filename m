Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A50E3212F8C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 00:33:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yXv14yHzzDr68
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 08:33:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=2a00:1098:0:82:1000:25:2eeb:e3e3;
 helo=bhuna.collabora.co.uk; envelope-from=arnaud.ferraris@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=collabora.com
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yKzG4gY7zDqVx
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 00:21:44 +1000 (AEST)
Received: from xps.home (unknown [IPv6:2a01:e35:2fb5:1510:315a:ecf0:6250:a3ed])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: aferraris)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 35F8E2A5EC4;
 Thu,  2 Jul 2020 15:12:19 +0100 (BST)
From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
To: 
Subject: [PATCH 2/2] ASoC: fsl-asoc-card: add support for generic I2S slave
 use-case
Date: Thu,  2 Jul 2020 16:11:15 +0200
Message-Id: <20200702141114.232688-3-arnaud.ferraris@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702141114.232688-1-arnaud.ferraris@collabora.com>
References: <20200702141114.232688-1-arnaud.ferraris@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 03 Jul 2020 08:28:34 +1000
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 kernel@collabora.com, Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This commit implements support for generic codecs with the SoC acting as
I2S slave, by implementing the new `fsl,imx-audio-i2s-slave` compatible
and related properties.

This is particularly useful when using a Bluetooth controller acting as
I2S master, but other simple or dummy codecs might benefit from it too.

Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 46 ++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 11 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 57ea1b072326..6076b963c873 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -166,12 +166,15 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 		return 0;
 
 	/* Specific configurations of DAIs starts from here */
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), cpu_priv->sysclk_id[tx],
-				     cpu_priv->sysclk_freq[tx],
-				     cpu_priv->sysclk_dir[tx]);
-	if (ret && ret != -ENOTSUPP) {
-		dev_err(dev, "failed to set sysclk for cpu dai\n");
-		return ret;
+	if (cpu_priv->sysclk_freq[tx] > 0) {
+		ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0),
+					     cpu_priv->sysclk_id[tx],
+					     cpu_priv->sysclk_freq[tx],
+					     cpu_priv->sysclk_dir[tx]);
+		if (ret && ret != -ENOTSUPP) {
+			dev_err(dev, "failed to set sysclk for cpu dai\n");
+			return ret;
+		}
 	}
 
 	if (cpu_priv->slot_width) {
@@ -475,11 +478,14 @@ static int fsl_asoc_card_late_probe(struct snd_soc_card *card)
 		return 0;
 	}
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, codec_priv->mclk_id,
-				     codec_priv->mclk_freq, SND_SOC_CLOCK_IN);
-	if (ret && ret != -ENOTSUPP) {
-		dev_err(dev, "failed to set sysclk in %s\n", __func__);
-		return ret;
+	if (codec_priv->mclk_freq > 0) {
+		ret = snd_soc_dai_set_sysclk(codec_dai, codec_priv->mclk_id,
+					     codec_priv->mclk_freq,
+					     SND_SOC_CLOCK_IN);
+		if (ret && ret != -ENOTSUPP) {
+			dev_err(dev, "failed to set sysclk in %s\n", __func__);
+			return ret;
+		}
 	}
 
 	return 0;
@@ -620,6 +626,23 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->cpu_priv.slot_width = 32;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
+	} else if (of_device_is_compatible(np, "fsl,imx-audio-i2s-slave")) {
+		ret = of_property_read_string(np, "audio-codec-dai-name",
+					      &codec_dai_name);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to get codec DAI name\n");
+			ret = -EINVAL;
+			goto asrc_fail;
+		}
+		ret = of_property_read_u32(np, "audio-slot-width",
+					   &priv->cpu_priv.slot_width);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to get slot width\n");
+			ret = -EINVAL;
+			goto asrc_fail;
+		}
+		priv->card.set_bias_level = NULL;
+		priv->dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret = -EINVAL;
@@ -763,6 +786,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 
 static const struct of_device_id fsl_asoc_card_dt_ids[] = {
 	{ .compatible = "fsl,imx-audio-ac97", },
+	{ .compatible = "fsl,imx-audio-i2s-slave", },
 	{ .compatible = "fsl,imx-audio-cs42888", },
 	{ .compatible = "fsl,imx-audio-cs427x", },
 	{ .compatible = "fsl,imx-audio-sgtl5000", },
-- 
2.27.0

