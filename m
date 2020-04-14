Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EE91A74D4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 09:32:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491cdH4v9hzDqbx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 17:32:19 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 491c1K0Lc0zDqYK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 17:04:36 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D158B1A0319;
 Tue, 14 Apr 2020 09:04:33 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 085451A0300;
 Tue, 14 Apr 2020 09:04:28 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 3A47840305;
 Tue, 14 Apr 2020 15:04:18 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: [PATCH v8 4/7] ASoC: fsl_asrc: Support new property fsl,asrc-format
Date: Tue, 14 Apr 2020 14:56:04 +0800
Message-Id: <f433acc8ea2694a07a16a8d459e4a06087bd66b5.1586845138.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1586845137.git.shengjiu.wang@nxp.com>
References: <cover.1586845137.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1586845137.git.shengjiu.wang@nxp.com>
References: <cover.1586845137.git.shengjiu.wang@nxp.com>
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

In order to align with new ESARC, we add new property fsl,asrc-format.
The fsl,asrc-format can replace the fsl,asrc-width, driver
can accept format from devicetree, don't need to convert it to
format through width.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c     | 41 +++++++++++++++++++++++-------------
 sound/soc/fsl/fsl_asrc.h     |  4 ++--
 sound/soc/fsl/fsl_asrc_dma.c | 15 ++++++++++---
 3 files changed, 40 insertions(+), 20 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 4d3e51bfa949..a9458fe268bc 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -589,7 +589,6 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 	unsigned int channels = params_channels(params);
 	unsigned int rate = params_rate(params);
 	struct asrc_config config;
-	snd_pcm_format_t format;
 	int ret;
 
 	ret = fsl_asrc_request_pair(channels, pair);
@@ -600,11 +599,6 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 
 	pair->config = &config;
 
-	if (asrc->asrc_width == 16)
-		format = SNDRV_PCM_FORMAT_S16_LE;
-	else
-		format = SNDRV_PCM_FORMAT_S24_LE;
-
 	config.pair = pair->index;
 	config.channel_num = channels;
 	config.inclk = INCLK_NONE;
@@ -612,11 +606,11 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		config.input_format   = params_format(params);
-		config.output_format  = format;
+		config.output_format  = asrc->asrc_format;
 		config.input_sample_rate  = rate;
 		config.output_sample_rate = asrc->asrc_rate;
 	} else {
-		config.input_format   = format;
+		config.input_format   = asrc->asrc_format;
 		config.output_format  = params_format(params);
 		config.input_sample_rate  = asrc->asrc_rate;
 		config.output_sample_rate = rate;
@@ -946,6 +940,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	int irq, ret, i;
 	u32 map_idx;
 	char tmp[16];
+	u32 width;
 
 	asrc = devm_kzalloc(&pdev->dev, sizeof(*asrc), GFP_KERNEL);
 	if (!asrc)
@@ -1052,16 +1047,32 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = of_property_read_u32(np, "fsl,asrc-width",
-				   &asrc->asrc_width);
+	ret = of_property_read_u32(np, "fsl,asrc-format", &asrc->asrc_format);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to get output width\n");
-		return ret;
+		ret = of_property_read_u32(np, "fsl,asrc-width", &width);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to decide output format\n");
+			return ret;
+		}
+
+		switch (width) {
+		case 16:
+			asrc->asrc_format = SNDRV_PCM_FORMAT_S16_LE;
+			break;
+		case 24:
+			asrc->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
+			break;
+		default:
+			dev_warn(&pdev->dev,
+				 "unsupported width, use default S24_LE\n");
+			asrc->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
+			break;
+		}
 	}
 
-	if (asrc->asrc_width != 16 && asrc->asrc_width != 24) {
-		dev_warn(&pdev->dev, "unsupported width, switching to 24bit\n");
-		asrc->asrc_width = 24;
+	if (!(FSL_ASRC_FORMATS & (1ULL << asrc->asrc_format))) {
+		dev_warn(&pdev->dev, "unsupported width, use default S24_LE\n");
+		asrc->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
 	}
 
 	platform_set_drvdata(pdev, asrc);
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 95d62c45afde..3b0f156af2c3 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -493,7 +493,7 @@ struct fsl_asrc_pair {
  * @channel_avail: non-occupied channel numbers
  * @clk_map: clock map for input/output clock
  * @asrc_rate: default sample rate for ASoC Back-Ends
- * @asrc_width: default sample width for ASoC Back-Ends
+ * @asrc_format: default sample format for ASoC Back-Ends
  * @regcache_cfg: store register value of REG_ASRCFG
  */
 struct fsl_asrc {
@@ -514,7 +514,7 @@ struct fsl_asrc {
 	unsigned char *clk_map[2];
 
 	int asrc_rate;
-	int asrc_width;
+	snd_pcm_format_t asrc_format;
 
 	u32 regcache_cfg;
 };
diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 5fe83aece25b..a9dd3155ff35 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -146,7 +146,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	struct device *dev_be;
 	u8 dir = tx ? OUT : IN;
 	dma_cap_mask_t mask;
-	int ret;
+	int ret, width;
 
 	/* Fetch the Back-End dma_data from DPCM */
 	for_each_dpcm_be(rtd, stream, dpcm) {
@@ -230,10 +230,19 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	if (asrc->asrc_width == 16)
+	width = snd_pcm_format_physical_width(asrc->asrc_format);
+	if (width < 8 || width > 64)
+		return -EINVAL;
+	else if (width == 8)
+		buswidth = DMA_SLAVE_BUSWIDTH_1_BYTE;
+	else if (width == 16)
 		buswidth = DMA_SLAVE_BUSWIDTH_2_BYTES;
-	else
+	else if (width == 24)
+		buswidth = DMA_SLAVE_BUSWIDTH_3_BYTES;
+	else if (width <= 32)
 		buswidth = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	else
+		buswidth = DMA_SLAVE_BUSWIDTH_8_BYTES;
 
 	config_be.direction = DMA_DEV_TO_DEV;
 	config_be.src_addr_width = buswidth;
-- 
2.21.0

