Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD016BC61C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 13:01:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cysk13K0zDqBb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 21:00:58 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cykB2ZJwzDqSK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 20:54:24 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4799E20000B;
 Tue, 24 Sep 2019 12:54:19 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7FB3E2001A6;
 Tue, 24 Sep 2019 12:54:12 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 3AFB540323;
 Tue, 24 Sep 2019 18:54:03 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org,
 lars@metafoo.de
Subject: [PATCH V4 1/4] ASoC: fsl_asrc: Use in(out)put_format instead of
 in(out)put_word_width
Date: Tue, 24 Sep 2019 18:52:32 +0800
Message-Id: <7937c1404ee327ce141cb03b3575b02ea01a740c.1569296075.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569296075.git.shengjiu.wang@nxp.com>
References: <cover.1569296075.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1569296075.git.shengjiu.wang@nxp.com>
References: <cover.1569296075.git.shengjiu.wang@nxp.com>
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

snd_pcm_format_t is more formal than enum asrc_word_width, which has
two property, width and physical width, which is more accurate than
enum asrc_word_width. So it is better to use in(out)put_format
instead of in(out)put_word_width.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 56 +++++++++++++++++++++++++++-------------
 sound/soc/fsl/fsl_asrc.h |  4 +--
 2 files changed, 40 insertions(+), 20 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index cfa40ef6b1ca..4d3804a1ea55 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -265,6 +265,8 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
 	struct asrc_config *config = pair->config;
 	struct fsl_asrc *asrc_priv = pair->asrc_priv;
 	enum asrc_pair_index index = pair->index;
+	enum asrc_word_width input_word_width;
+	enum asrc_word_width output_word_width;
 	u32 inrate, outrate, indiv, outdiv;
 	u32 clk_index[2], div[2];
 	int in, out, channels;
@@ -283,9 +285,32 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
 		return -EINVAL;
 	}
 
-	/* Validate output width */
-	if (config->output_word_width == ASRC_WIDTH_8_BIT) {
-		pair_err("does not support 8bit width output\n");
+	switch (snd_pcm_format_width(config->input_format)) {
+	case 8:
+		input_word_width = ASRC_WIDTH_8_BIT;
+		break;
+	case 16:
+		input_word_width = ASRC_WIDTH_16_BIT;
+		break;
+	case 24:
+		input_word_width = ASRC_WIDTH_24_BIT;
+		break;
+	default:
+		pair_err("does not support this input format, %d\n",
+			 config->input_format);
+		return -EINVAL;
+	}
+
+	switch (snd_pcm_format_width(config->output_format)) {
+	case 16:
+		output_word_width = ASRC_WIDTH_16_BIT;
+		break;
+	case 24:
+		output_word_width = ASRC_WIDTH_24_BIT;
+		break;
+	default:
+		pair_err("does not support this output format, %d\n",
+			 config->output_format);
 		return -EINVAL;
 	}
 
@@ -383,8 +408,8 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
 	/* Implement word_width configurations */
 	regmap_update_bits(asrc_priv->regmap, REG_ASRMCR1(index),
 			   ASRMCR1i_OW16_MASK | ASRMCR1i_IWD_MASK,
-			   ASRMCR1i_OW16(config->output_word_width) |
-			   ASRMCR1i_IWD(config->input_word_width));
+			   ASRMCR1i_OW16(output_word_width) |
+			   ASRMCR1i_IWD(input_word_width));
 
 	/* Enable BUFFER STALL */
 	regmap_update_bits(asrc_priv->regmap, REG_ASRMCR(index),
@@ -497,13 +522,13 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
 	struct fsl_asrc *asrc_priv = snd_soc_dai_get_drvdata(dai);
-	int width = params_width(params);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
 	unsigned int channels = params_channels(params);
 	unsigned int rate = params_rate(params);
 	struct asrc_config config;
-	int word_width, ret;
+	snd_pcm_format_t format;
+	int ret;
 
 	ret = fsl_asrc_request_pair(channels, pair);
 	if (ret) {
@@ -513,15 +538,10 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 
 	pair->config = &config;
 
-	if (width == 16)
-		width = ASRC_WIDTH_16_BIT;
-	else
-		width = ASRC_WIDTH_24_BIT;
-
 	if (asrc_priv->asrc_width == 16)
-		word_width = ASRC_WIDTH_16_BIT;
+		format = SNDRV_PCM_FORMAT_S16_LE;
 	else
-		word_width = ASRC_WIDTH_24_BIT;
+		format = SNDRV_PCM_FORMAT_S24_LE;
 
 	config.pair = pair->index;
 	config.channel_num = channels;
@@ -529,13 +549,13 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 	config.outclk = OUTCLK_ASRCK1_CLK;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		config.input_word_width   = width;
-		config.output_word_width  = word_width;
+		config.input_format   = params_format(params);
+		config.output_format  = format;
 		config.input_sample_rate  = rate;
 		config.output_sample_rate = asrc_priv->asrc_rate;
 	} else {
-		config.input_word_width   = word_width;
-		config.output_word_width  = width;
+		config.input_format   = format;
+		config.output_format  = params_format(params);
 		config.input_sample_rate  = asrc_priv->asrc_rate;
 		config.output_sample_rate = rate;
 	}
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index c60075112570..38af485bdd22 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -342,8 +342,8 @@ struct asrc_config {
 	unsigned int dma_buffer_size;
 	unsigned int input_sample_rate;
 	unsigned int output_sample_rate;
-	enum asrc_word_width input_word_width;
-	enum asrc_word_width output_word_width;
+	snd_pcm_format_t input_format;
+	snd_pcm_format_t output_format;
 	enum asrc_inclk inclk;
 	enum asrc_outclk outclk;
 };
-- 
2.21.0

