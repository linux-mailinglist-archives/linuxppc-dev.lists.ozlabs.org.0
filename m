Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DADB31A7062
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 02:58:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491Rtg0nQFzDqLH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 10:58:19 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 491Rkp6ww9zDqL9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 10:51:28 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1F4081A024F;
 Tue, 14 Apr 2020 02:51:26 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1A4581A0223;
 Tue, 14 Apr 2020 02:51:20 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id EF667402B4;
 Tue, 14 Apr 2020 08:51:12 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: [PATCH v7 1/7] ASoC: fsl_asrc: rename asrc_priv to asrc
Date: Tue, 14 Apr 2020 08:43:03 +0800
Message-Id: <722142c2e1b57a95f911db1d42d901b88fc283d6.1586747728.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1586747728.git.shengjiu.wang@nxp.com>
References: <cover.1586747728.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1586747728.git.shengjiu.wang@nxp.com>
References: <cover.1586747728.git.shengjiu.wang@nxp.com>
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

In order to move common structure to fsl_asrc_common.h
we change the name of asrc_priv to asrc, the asrc_priv
will be used by new struct fsl_asrc_priv.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c     | 298 +++++++++++++++++------------------
 sound/soc/fsl/fsl_asrc.h     |   4 +-
 sound/soc/fsl/fsl_asrc_dma.c |  24 +--
 3 files changed, 163 insertions(+), 163 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 0dcebc24c312..4d3e51bfa949 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -21,10 +21,10 @@
 #define IDEAL_RATIO_DECIMAL_DEPTH 26
 
 #define pair_err(fmt, ...) \
-	dev_err(&asrc_priv->pdev->dev, "Pair %c: " fmt, 'A' + index, ##__VA_ARGS__)
+	dev_err(&asrc->pdev->dev, "Pair %c: " fmt, 'A' + index, ##__VA_ARGS__)
 
 #define pair_dbg(fmt, ...) \
-	dev_dbg(&asrc_priv->pdev->dev, "Pair %c: " fmt, 'A' + index, ##__VA_ARGS__)
+	dev_dbg(&asrc->pdev->dev, "Pair %c: " fmt, 'A' + index, ##__VA_ARGS__)
 
 /* Corresponding to process_option */
 static unsigned int supported_asrc_rate[] = {
@@ -157,15 +157,15 @@ static void fsl_asrc_sel_proc(int inrate, int outrate,
 int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
 {
 	enum asrc_pair_index index = ASRC_INVALID_PAIR;
-	struct fsl_asrc *asrc_priv = pair->asrc_priv;
-	struct device *dev = &asrc_priv->pdev->dev;
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &asrc->pdev->dev;
 	unsigned long lock_flags;
 	int i, ret = 0;
 
-	spin_lock_irqsave(&asrc_priv->lock, lock_flags);
+	spin_lock_irqsave(&asrc->lock, lock_flags);
 
 	for (i = ASRC_PAIR_A; i < ASRC_PAIR_MAX_NUM; i++) {
-		if (asrc_priv->pair[i] != NULL)
+		if (asrc->pair[i] != NULL)
 			continue;
 
 		index = i;
@@ -177,17 +177,17 @@ int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
 	if (index == ASRC_INVALID_PAIR) {
 		dev_err(dev, "all pairs are busy now\n");
 		ret = -EBUSY;
-	} else if (asrc_priv->channel_avail < channels) {
+	} else if (asrc->channel_avail < channels) {
 		dev_err(dev, "can't afford required channels: %d\n", channels);
 		ret = -EINVAL;
 	} else {
-		asrc_priv->channel_avail -= channels;
-		asrc_priv->pair[index] = pair;
+		asrc->channel_avail -= channels;
+		asrc->pair[index] = pair;
 		pair->channels = channels;
 		pair->index = index;
 	}
 
-	spin_unlock_irqrestore(&asrc_priv->lock, lock_flags);
+	spin_unlock_irqrestore(&asrc->lock, lock_flags);
 
 	return ret;
 }
@@ -195,25 +195,25 @@ int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
 /**
  * Release ASRC pair
  *
- * It clears the resource from asrc_priv and releases the occupied channels.
+ * It clears the resource from asrc and releases the occupied channels.
  */
 void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
 {
-	struct fsl_asrc *asrc_priv = pair->asrc_priv;
+	struct fsl_asrc *asrc = pair->asrc;
 	enum asrc_pair_index index = pair->index;
 	unsigned long lock_flags;
 
 	/* Make sure the pair is disabled */
-	regmap_update_bits(asrc_priv->regmap, REG_ASRCTR,
+	regmap_update_bits(asrc->regmap, REG_ASRCTR,
 			   ASRCTR_ASRCEi_MASK(index), 0);
 
-	spin_lock_irqsave(&asrc_priv->lock, lock_flags);
+	spin_lock_irqsave(&asrc->lock, lock_flags);
 
-	asrc_priv->channel_avail += pair->channels;
-	asrc_priv->pair[index] = NULL;
+	asrc->channel_avail += pair->channels;
+	asrc->pair[index] = NULL;
 	pair->error = 0;
 
-	spin_unlock_irqrestore(&asrc_priv->lock, lock_flags);
+	spin_unlock_irqrestore(&asrc->lock, lock_flags);
 }
 
 /**
@@ -221,10 +221,10 @@ void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
  */
 static void fsl_asrc_set_watermarks(struct fsl_asrc_pair *pair, u32 in, u32 out)
 {
-	struct fsl_asrc *asrc_priv = pair->asrc_priv;
+	struct fsl_asrc *asrc = pair->asrc;
 	enum asrc_pair_index index = pair->index;
 
-	regmap_update_bits(asrc_priv->regmap, REG_ASRMCR(index),
+	regmap_update_bits(asrc->regmap, REG_ASRMCR(index),
 			   ASRMCRi_EXTTHRSHi_MASK |
 			   ASRMCRi_INFIFO_THRESHOLD_MASK |
 			   ASRMCRi_OUTFIFO_THRESHOLD_MASK,
@@ -257,7 +257,7 @@ static u32 fsl_asrc_cal_asrck_divisor(struct fsl_asrc_pair *pair, u32 div)
 static int fsl_asrc_set_ideal_ratio(struct fsl_asrc_pair *pair,
 				    int inrate, int outrate)
 {
-	struct fsl_asrc *asrc_priv = pair->asrc_priv;
+	struct fsl_asrc *asrc = pair->asrc;
 	enum asrc_pair_index index = pair->index;
 	unsigned long ratio;
 	int i;
@@ -286,8 +286,8 @@ static int fsl_asrc_set_ideal_ratio(struct fsl_asrc_pair *pair,
 			break;
 	}
 
-	regmap_write(asrc_priv->regmap, REG_ASRIDRL(index), ratio);
-	regmap_write(asrc_priv->regmap, REG_ASRIDRH(index), ratio >> 24);
+	regmap_write(asrc->regmap, REG_ASRIDRL(index), ratio);
+	regmap_write(asrc->regmap, REG_ASRIDRH(index), ratio >> 24);
 
 	return 0;
 }
@@ -309,7 +309,7 @@ static int fsl_asrc_set_ideal_ratio(struct fsl_asrc_pair *pair,
 static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 {
 	struct asrc_config *config = pair->config;
-	struct fsl_asrc *asrc_priv = pair->asrc_priv;
+	struct fsl_asrc *asrc = pair->asrc;
 	enum asrc_pair_index index = pair->index;
 	enum asrc_word_width input_word_width;
 	enum asrc_word_width output_word_width;
@@ -392,11 +392,11 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 	}
 
 	/* Validate input and output clock sources */
-	clk_index[IN] = asrc_priv->clk_map[IN][config->inclk];
-	clk_index[OUT] = asrc_priv->clk_map[OUT][config->outclk];
+	clk_index[IN] = asrc->clk_map[IN][config->inclk];
+	clk_index[OUT] = asrc->clk_map[OUT][config->outclk];
 
 	/* We only have output clock for ideal ratio mode */
-	clk = asrc_priv->asrck_clk[clk_index[ideal ? OUT : IN]];
+	clk = asrc->asrck_clk[clk_index[ideal ? OUT : IN]];
 
 	clk_rate = clk_get_rate(clk);
 	rem[IN] = do_div(clk_rate, inrate);
@@ -417,7 +417,7 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 
 	div[IN] = min_t(u32, 1024, div[IN]);
 
-	clk = asrc_priv->asrck_clk[clk_index[OUT]];
+	clk = asrc->asrck_clk[clk_index[OUT]];
 	clk_rate = clk_get_rate(clk);
 	if (ideal && use_ideal_rate)
 		rem[OUT] = do_div(clk_rate, IDEAL_RATIO_RATE);
@@ -437,22 +437,22 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 	/* Set the channel number */
 	channels = config->channel_num;
 
-	if (asrc_priv->soc->channel_bits < 4)
+	if (asrc->soc->channel_bits < 4)
 		channels /= 2;
 
 	/* Update channels for current pair */
-	regmap_update_bits(asrc_priv->regmap, REG_ASRCNCR,
-			   ASRCNCR_ANCi_MASK(index, asrc_priv->soc->channel_bits),
-			   ASRCNCR_ANCi(index, channels, asrc_priv->soc->channel_bits));
+	regmap_update_bits(asrc->regmap, REG_ASRCNCR,
+			   ASRCNCR_ANCi_MASK(index, asrc->soc->channel_bits),
+			   ASRCNCR_ANCi(index, channels, asrc->soc->channel_bits));
 
 	/* Default setting: Automatic selection for processing mode */
-	regmap_update_bits(asrc_priv->regmap, REG_ASRCTR,
+	regmap_update_bits(asrc->regmap, REG_ASRCTR,
 			   ASRCTR_ATSi_MASK(index), ASRCTR_ATS(index));
-	regmap_update_bits(asrc_priv->regmap, REG_ASRCTR,
+	regmap_update_bits(asrc->regmap, REG_ASRCTR,
 			   ASRCTR_USRi_MASK(index), 0);
 
 	/* Set the input and output clock sources */
-	regmap_update_bits(asrc_priv->regmap, REG_ASRCSR,
+	regmap_update_bits(asrc->regmap, REG_ASRCSR,
 			   ASRCSR_AICSi_MASK(index) | ASRCSR_AOCSi_MASK(index),
 			   ASRCSR_AICS(index, clk_index[IN]) |
 			   ASRCSR_AOCS(index, clk_index[OUT]));
@@ -462,19 +462,19 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 	outdiv = fsl_asrc_cal_asrck_divisor(pair, div[OUT]);
 
 	/* Suppose indiv and outdiv includes prescaler, so add its MASK too */
-	regmap_update_bits(asrc_priv->regmap, REG_ASRCDR(index),
+	regmap_update_bits(asrc->regmap, REG_ASRCDR(index),
 			   ASRCDRi_AOCPi_MASK(index) | ASRCDRi_AICPi_MASK(index) |
 			   ASRCDRi_AOCDi_MASK(index) | ASRCDRi_AICDi_MASK(index),
 			   ASRCDRi_AOCP(index, outdiv) | ASRCDRi_AICP(index, indiv));
 
 	/* Implement word_width configurations */
-	regmap_update_bits(asrc_priv->regmap, REG_ASRMCR1(index),
+	regmap_update_bits(asrc->regmap, REG_ASRMCR1(index),
 			   ASRMCR1i_OW16_MASK | ASRMCR1i_IWD_MASK,
 			   ASRMCR1i_OW16(output_word_width) |
 			   ASRMCR1i_IWD(input_word_width));
 
 	/* Enable BUFFER STALL */
-	regmap_update_bits(asrc_priv->regmap, REG_ASRMCR(index),
+	regmap_update_bits(asrc->regmap, REG_ASRMCR(index),
 			   ASRMCRi_BUFSTALLi_MASK, ASRMCRi_BUFSTALLi);
 
 	/* Set default thresholds for input and output FIFO */
@@ -486,18 +486,18 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 		return 0;
 
 	/* Clear ASTSx bit to use Ideal Ratio mode */
-	regmap_update_bits(asrc_priv->regmap, REG_ASRCTR,
+	regmap_update_bits(asrc->regmap, REG_ASRCTR,
 			   ASRCTR_ATSi_MASK(index), 0);
 
 	/* Enable Ideal Ratio mode */
-	regmap_update_bits(asrc_priv->regmap, REG_ASRCTR,
+	regmap_update_bits(asrc->regmap, REG_ASRCTR,
 			   ASRCTR_IDRi_MASK(index) | ASRCTR_USRi_MASK(index),
 			   ASRCTR_IDR(index) | ASRCTR_USR(index));
 
 	fsl_asrc_sel_proc(inrate, outrate, &pre_proc, &post_proc);
 
 	/* Apply configurations for pre- and post-processing */
-	regmap_update_bits(asrc_priv->regmap, REG_ASRCFG,
+	regmap_update_bits(asrc->regmap, REG_ASRCFG,
 			   ASRCFG_PREMODi_MASK(index) |	ASRCFG_POSTMODi_MASK(index),
 			   ASRCFG_PREMOD(index, pre_proc) |
 			   ASRCFG_POSTMOD(index, post_proc));
@@ -512,28 +512,28 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
  */
 static void fsl_asrc_start_pair(struct fsl_asrc_pair *pair)
 {
-	struct fsl_asrc *asrc_priv = pair->asrc_priv;
+	struct fsl_asrc *asrc = pair->asrc;
 	enum asrc_pair_index index = pair->index;
 	int reg, retry = 10, i;
 
 	/* Enable the current pair */
-	regmap_update_bits(asrc_priv->regmap, REG_ASRCTR,
+	regmap_update_bits(asrc->regmap, REG_ASRCTR,
 			   ASRCTR_ASRCEi_MASK(index), ASRCTR_ASRCE(index));
 
 	/* Wait for status of initialization */
 	do {
 		udelay(5);
-		regmap_read(asrc_priv->regmap, REG_ASRCFG, &reg);
+		regmap_read(asrc->regmap, REG_ASRCFG, &reg);
 		reg &= ASRCFG_INIRQi_MASK(index);
 	} while (!reg && --retry);
 
 	/* Make the input fifo to ASRC STALL level */
-	regmap_read(asrc_priv->regmap, REG_ASRCNCR, &reg);
+	regmap_read(asrc->regmap, REG_ASRCNCR, &reg);
 	for (i = 0; i < pair->channels * 4; i++)
-		regmap_write(asrc_priv->regmap, REG_ASRDI(index), 0);
+		regmap_write(asrc->regmap, REG_ASRDI(index), 0);
 
 	/* Enable overload interrupt */
-	regmap_write(asrc_priv->regmap, REG_ASRIER, ASRIER_AOLIE);
+	regmap_write(asrc->regmap, REG_ASRIER, ASRIER_AOLIE);
 }
 
 /**
@@ -541,11 +541,11 @@ static void fsl_asrc_start_pair(struct fsl_asrc_pair *pair)
  */
 static void fsl_asrc_stop_pair(struct fsl_asrc_pair *pair)
 {
-	struct fsl_asrc *asrc_priv = pair->asrc_priv;
+	struct fsl_asrc *asrc = pair->asrc;
 	enum asrc_pair_index index = pair->index;
 
 	/* Stop the current pair */
-	regmap_update_bits(asrc_priv->regmap, REG_ASRCTR,
+	regmap_update_bits(asrc->regmap, REG_ASRCTR,
 			   ASRCTR_ASRCEi_MASK(index), 0);
 }
 
@@ -554,23 +554,23 @@ static void fsl_asrc_stop_pair(struct fsl_asrc_pair *pair)
  */
 struct dma_chan *fsl_asrc_get_dma_channel(struct fsl_asrc_pair *pair, bool dir)
 {
-	struct fsl_asrc *asrc_priv = pair->asrc_priv;
+	struct fsl_asrc *asrc = pair->asrc;
 	enum asrc_pair_index index = pair->index;
 	char name[4];
 
 	sprintf(name, "%cx%c", dir == IN ? 'r' : 't', index + 'a');
 
-	return dma_request_slave_channel(&asrc_priv->pdev->dev, name);
+	return dma_request_slave_channel(&asrc->pdev->dev, name);
 }
 EXPORT_SYMBOL_GPL(fsl_asrc_get_dma_channel);
 
 static int fsl_asrc_dai_startup(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
-	struct fsl_asrc *asrc_priv = snd_soc_dai_get_drvdata(dai);
+	struct fsl_asrc *asrc = snd_soc_dai_get_drvdata(dai);
 
 	/* Odd channel number is not valid for older ASRC (channel_bits==3) */
-	if (asrc_priv->soc->channel_bits == 3)
+	if (asrc->soc->channel_bits == 3)
 		snd_pcm_hw_constraint_step(substream->runtime, 0,
 					   SNDRV_PCM_HW_PARAM_CHANNELS, 2);
 
@@ -583,7 +583,7 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params,
 				  struct snd_soc_dai *dai)
 {
-	struct fsl_asrc *asrc_priv = snd_soc_dai_get_drvdata(dai);
+	struct fsl_asrc *asrc = snd_soc_dai_get_drvdata(dai);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
 	unsigned int channels = params_channels(params);
@@ -600,7 +600,7 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 
 	pair->config = &config;
 
-	if (asrc_priv->asrc_width == 16)
+	if (asrc->asrc_width == 16)
 		format = SNDRV_PCM_FORMAT_S16_LE;
 	else
 		format = SNDRV_PCM_FORMAT_S24_LE;
@@ -614,11 +614,11 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 		config.input_format   = params_format(params);
 		config.output_format  = format;
 		config.input_sample_rate  = rate;
-		config.output_sample_rate = asrc_priv->asrc_rate;
+		config.output_sample_rate = asrc->asrc_rate;
 	} else {
 		config.input_format   = format;
 		config.output_format  = params_format(params);
-		config.input_sample_rate  = asrc_priv->asrc_rate;
+		config.input_sample_rate  = asrc->asrc_rate;
 		config.output_sample_rate = rate;
 	}
 
@@ -676,10 +676,10 @@ static const struct snd_soc_dai_ops fsl_asrc_dai_ops = {
 
 static int fsl_asrc_dai_probe(struct snd_soc_dai *dai)
 {
-	struct fsl_asrc *asrc_priv = snd_soc_dai_get_drvdata(dai);
+	struct fsl_asrc *asrc = snd_soc_dai_get_drvdata(dai);
 
-	snd_soc_dai_init_dma_data(dai, &asrc_priv->dma_params_tx,
-				  &asrc_priv->dma_params_rx);
+	snd_soc_dai_init_dma_data(dai, &asrc->dma_params_tx,
+				  &asrc->dma_params_rx);
 
 	return 0;
 }
@@ -858,30 +858,30 @@ static const struct regmap_config fsl_asrc_regmap_config = {
 /**
  * Initialize ASRC registers with a default configurations
  */
-static int fsl_asrc_init(struct fsl_asrc *asrc_priv)
+static int fsl_asrc_init(struct fsl_asrc *asrc)
 {
 	/* Halt ASRC internal FP when input FIFO needs data for pair A, B, C */
-	regmap_write(asrc_priv->regmap, REG_ASRCTR, ASRCTR_ASRCEN);
+	regmap_write(asrc->regmap, REG_ASRCTR, ASRCTR_ASRCEN);
 
 	/* Disable interrupt by default */
-	regmap_write(asrc_priv->regmap, REG_ASRIER, 0x0);
+	regmap_write(asrc->regmap, REG_ASRIER, 0x0);
 
 	/* Apply recommended settings for parameters from Reference Manual */
-	regmap_write(asrc_priv->regmap, REG_ASRPM1, 0x7fffff);
-	regmap_write(asrc_priv->regmap, REG_ASRPM2, 0x255555);
-	regmap_write(asrc_priv->regmap, REG_ASRPM3, 0xff7280);
-	regmap_write(asrc_priv->regmap, REG_ASRPM4, 0xff7280);
-	regmap_write(asrc_priv->regmap, REG_ASRPM5, 0xff7280);
+	regmap_write(asrc->regmap, REG_ASRPM1, 0x7fffff);
+	regmap_write(asrc->regmap, REG_ASRPM2, 0x255555);
+	regmap_write(asrc->regmap, REG_ASRPM3, 0xff7280);
+	regmap_write(asrc->regmap, REG_ASRPM4, 0xff7280);
+	regmap_write(asrc->regmap, REG_ASRPM5, 0xff7280);
 
 	/* Base address for task queue FIFO. Set to 0x7C */
-	regmap_update_bits(asrc_priv->regmap, REG_ASRTFR1,
+	regmap_update_bits(asrc->regmap, REG_ASRTFR1,
 			   ASRTFR1_TF_BASE_MASK, ASRTFR1_TF_BASE(0xfc));
 
 	/* Set the processing clock for 76KHz to 133M */
-	regmap_write(asrc_priv->regmap, REG_ASR76K, 0x06D6);
+	regmap_write(asrc->regmap, REG_ASR76K, 0x06D6);
 
 	/* Set the processing clock for 56KHz to 133M */
-	return regmap_write(asrc_priv->regmap, REG_ASR56K, 0x0947);
+	return regmap_write(asrc->regmap, REG_ASR56K, 0x0947);
 }
 
 /**
@@ -889,15 +889,15 @@ static int fsl_asrc_init(struct fsl_asrc *asrc_priv)
  */
 static irqreturn_t fsl_asrc_isr(int irq, void *dev_id)
 {
-	struct fsl_asrc *asrc_priv = (struct fsl_asrc *)dev_id;
-	struct device *dev = &asrc_priv->pdev->dev;
+	struct fsl_asrc *asrc = (struct fsl_asrc *)dev_id;
+	struct device *dev = &asrc->pdev->dev;
 	enum asrc_pair_index index;
 	u32 status;
 
-	regmap_read(asrc_priv->regmap, REG_ASRSTR, &status);
+	regmap_read(asrc->regmap, REG_ASRSTR, &status);
 
 	/* Clean overload error */
-	regmap_write(asrc_priv->regmap, REG_ASRSTR, ASRSTR_AOLE);
+	regmap_write(asrc->regmap, REG_ASRSTR, ASRSTR_AOLE);
 
 	/*
 	 * We here use dev_dbg() for all exceptions because ASRC itself does
@@ -905,31 +905,31 @@ static irqreturn_t fsl_asrc_isr(int irq, void *dev_id)
 	 * interrupt would result a ridged conversion.
 	 */
 	for (index = ASRC_PAIR_A; index < ASRC_PAIR_MAX_NUM; index++) {
-		if (!asrc_priv->pair[index])
+		if (!asrc->pair[index])
 			continue;
 
 		if (status & ASRSTR_ATQOL) {
-			asrc_priv->pair[index]->error |= ASRC_TASK_Q_OVERLOAD;
+			asrc->pair[index]->error |= ASRC_TASK_Q_OVERLOAD;
 			dev_dbg(dev, "ASRC Task Queue FIFO overload\n");
 		}
 
 		if (status & ASRSTR_AOOL(index)) {
-			asrc_priv->pair[index]->error |= ASRC_OUTPUT_TASK_OVERLOAD;
+			asrc->pair[index]->error |= ASRC_OUTPUT_TASK_OVERLOAD;
 			pair_dbg("Output Task Overload\n");
 		}
 
 		if (status & ASRSTR_AIOL(index)) {
-			asrc_priv->pair[index]->error |= ASRC_INPUT_TASK_OVERLOAD;
+			asrc->pair[index]->error |= ASRC_INPUT_TASK_OVERLOAD;
 			pair_dbg("Input Task Overload\n");
 		}
 
 		if (status & ASRSTR_AODO(index)) {
-			asrc_priv->pair[index]->error |= ASRC_OUTPUT_BUFFER_OVERFLOW;
+			asrc->pair[index]->error |= ASRC_OUTPUT_BUFFER_OVERFLOW;
 			pair_dbg("Output Data Buffer has overflowed\n");
 		}
 
 		if (status & ASRSTR_AIDU(index)) {
-			asrc_priv->pair[index]->error |= ASRC_INPUT_BUFFER_UNDERRUN;
+			asrc->pair[index]->error |= ASRC_INPUT_BUFFER_UNDERRUN;
 			pair_dbg("Input Data Buffer has underflowed\n");
 		}
 	}
@@ -940,18 +940,18 @@ static irqreturn_t fsl_asrc_isr(int irq, void *dev_id)
 static int fsl_asrc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct fsl_asrc *asrc_priv;
+	struct fsl_asrc *asrc;
 	struct resource *res;
 	void __iomem *regs;
 	int irq, ret, i;
 	u32 map_idx;
 	char tmp[16];
 
-	asrc_priv = devm_kzalloc(&pdev->dev, sizeof(*asrc_priv), GFP_KERNEL);
-	if (!asrc_priv)
+	asrc = devm_kzalloc(&pdev->dev, sizeof(*asrc), GFP_KERNEL);
+	if (!asrc)
 		return -ENOMEM;
 
-	asrc_priv->pdev = pdev;
+	asrc->pdev = pdev;
 
 	/* Get the addresses and IRQ */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -959,13 +959,13 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	asrc_priv->paddr = res->start;
+	asrc->paddr = res->start;
 
-	asrc_priv->regmap = devm_regmap_init_mmio_clk(&pdev->dev, "mem", regs,
-						      &fsl_asrc_regmap_config);
-	if (IS_ERR(asrc_priv->regmap)) {
+	asrc->regmap = devm_regmap_init_mmio_clk(&pdev->dev, "mem", regs,
+						 &fsl_asrc_regmap_config);
+	if (IS_ERR(asrc->regmap)) {
 		dev_err(&pdev->dev, "failed to init regmap\n");
-		return PTR_ERR(asrc_priv->regmap);
+		return PTR_ERR(asrc->regmap);
 	}
 
 	irq = platform_get_irq(pdev, 0);
@@ -973,49 +973,49 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		return irq;
 
 	ret = devm_request_irq(&pdev->dev, irq, fsl_asrc_isr, 0,
-			       dev_name(&pdev->dev), asrc_priv);
+			       dev_name(&pdev->dev), asrc);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to claim irq %u: %d\n", irq, ret);
 		return ret;
 	}
 
-	asrc_priv->mem_clk = devm_clk_get(&pdev->dev, "mem");
-	if (IS_ERR(asrc_priv->mem_clk)) {
+	asrc->mem_clk = devm_clk_get(&pdev->dev, "mem");
+	if (IS_ERR(asrc->mem_clk)) {
 		dev_err(&pdev->dev, "failed to get mem clock\n");
-		return PTR_ERR(asrc_priv->mem_clk);
+		return PTR_ERR(asrc->mem_clk);
 	}
 
-	asrc_priv->ipg_clk = devm_clk_get(&pdev->dev, "ipg");
-	if (IS_ERR(asrc_priv->ipg_clk)) {
+	asrc->ipg_clk = devm_clk_get(&pdev->dev, "ipg");
+	if (IS_ERR(asrc->ipg_clk)) {
 		dev_err(&pdev->dev, "failed to get ipg clock\n");
-		return PTR_ERR(asrc_priv->ipg_clk);
+		return PTR_ERR(asrc->ipg_clk);
 	}
 
-	asrc_priv->spba_clk = devm_clk_get(&pdev->dev, "spba");
-	if (IS_ERR(asrc_priv->spba_clk))
+	asrc->spba_clk = devm_clk_get(&pdev->dev, "spba");
+	if (IS_ERR(asrc->spba_clk))
 		dev_warn(&pdev->dev, "failed to get spba clock\n");
 
 	for (i = 0; i < ASRC_CLK_MAX_NUM; i++) {
 		sprintf(tmp, "asrck_%x", i);
-		asrc_priv->asrck_clk[i] = devm_clk_get(&pdev->dev, tmp);
-		if (IS_ERR(asrc_priv->asrck_clk[i])) {
+		asrc->asrck_clk[i] = devm_clk_get(&pdev->dev, tmp);
+		if (IS_ERR(asrc->asrck_clk[i])) {
 			dev_err(&pdev->dev, "failed to get %s clock\n", tmp);
-			return PTR_ERR(asrc_priv->asrck_clk[i]);
+			return PTR_ERR(asrc->asrck_clk[i]);
 		}
 	}
 
-	asrc_priv->soc = of_device_get_match_data(&pdev->dev);
-	if (!asrc_priv->soc) {
+	asrc->soc = of_device_get_match_data(&pdev->dev);
+	if (!asrc->soc) {
 		dev_err(&pdev->dev, "failed to get soc data\n");
 		return -ENODEV;
 	}
 
 	if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
-		asrc_priv->clk_map[IN] = input_clk_map_imx35;
-		asrc_priv->clk_map[OUT] = output_clk_map_imx35;
+		asrc->clk_map[IN] = input_clk_map_imx35;
+		asrc->clk_map[OUT] = output_clk_map_imx35;
 	} else if (of_device_is_compatible(np, "fsl,imx53-asrc")) {
-		asrc_priv->clk_map[IN] = input_clk_map_imx53;
-		asrc_priv->clk_map[OUT] = output_clk_map_imx53;
+		asrc->clk_map[IN] = input_clk_map_imx53;
+		asrc->clk_map[OUT] = output_clk_map_imx53;
 	} else if (of_device_is_compatible(np, "fsl,imx8qm-asrc") ||
 		   of_device_is_compatible(np, "fsl,imx8qxp-asrc")) {
 		ret = of_property_read_u32(np, "fsl,asrc-clk-map", &map_idx);
@@ -1029,44 +1029,44 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 			return -EINVAL;
 		}
 		if (of_device_is_compatible(np, "fsl,imx8qm-asrc")) {
-			asrc_priv->clk_map[IN] = clk_map_imx8qm[map_idx];
-			asrc_priv->clk_map[OUT] = clk_map_imx8qm[map_idx];
+			asrc->clk_map[IN] = clk_map_imx8qm[map_idx];
+			asrc->clk_map[OUT] = clk_map_imx8qm[map_idx];
 		} else {
-			asrc_priv->clk_map[IN] = clk_map_imx8qxp[map_idx];
-			asrc_priv->clk_map[OUT] = clk_map_imx8qxp[map_idx];
+			asrc->clk_map[IN] = clk_map_imx8qxp[map_idx];
+			asrc->clk_map[OUT] = clk_map_imx8qxp[map_idx];
 		}
 	}
 
-	ret = fsl_asrc_init(asrc_priv);
+	ret = fsl_asrc_init(asrc);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to init asrc %d\n", ret);
 		return ret;
 	}
 
-	asrc_priv->channel_avail = 10;
+	asrc->channel_avail = 10;
 
 	ret = of_property_read_u32(np, "fsl,asrc-rate",
-				   &asrc_priv->asrc_rate);
+				   &asrc->asrc_rate);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to get output rate\n");
 		return ret;
 	}
 
 	ret = of_property_read_u32(np, "fsl,asrc-width",
-				   &asrc_priv->asrc_width);
+				   &asrc->asrc_width);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to get output width\n");
 		return ret;
 	}
 
-	if (asrc_priv->asrc_width != 16 && asrc_priv->asrc_width != 24) {
+	if (asrc->asrc_width != 16 && asrc->asrc_width != 24) {
 		dev_warn(&pdev->dev, "unsupported width, switching to 24bit\n");
-		asrc_priv->asrc_width = 24;
+		asrc->asrc_width = 24;
 	}
 
-	platform_set_drvdata(pdev, asrc_priv);
+	platform_set_drvdata(pdev, asrc);
 	pm_runtime_enable(&pdev->dev);
-	spin_lock_init(&asrc_priv->lock);
+	spin_lock_init(&asrc->lock);
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_asrc_component,
 					      &fsl_asrc_dai, 1);
@@ -1081,22 +1081,22 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 #ifdef CONFIG_PM
 static int fsl_asrc_runtime_resume(struct device *dev)
 {
-	struct fsl_asrc *asrc_priv = dev_get_drvdata(dev);
+	struct fsl_asrc *asrc = dev_get_drvdata(dev);
 	int i, ret;
 
-	ret = clk_prepare_enable(asrc_priv->mem_clk);
+	ret = clk_prepare_enable(asrc->mem_clk);
 	if (ret)
 		return ret;
-	ret = clk_prepare_enable(asrc_priv->ipg_clk);
+	ret = clk_prepare_enable(asrc->ipg_clk);
 	if (ret)
 		goto disable_mem_clk;
-	if (!IS_ERR(asrc_priv->spba_clk)) {
-		ret = clk_prepare_enable(asrc_priv->spba_clk);
+	if (!IS_ERR(asrc->spba_clk)) {
+		ret = clk_prepare_enable(asrc->spba_clk);
 		if (ret)
 			goto disable_ipg_clk;
 	}
 	for (i = 0; i < ASRC_CLK_MAX_NUM; i++) {
-		ret = clk_prepare_enable(asrc_priv->asrck_clk[i]);
+		ret = clk_prepare_enable(asrc->asrck_clk[i]);
 		if (ret)
 			goto disable_asrck_clk;
 	}
@@ -1105,27 +1105,27 @@ static int fsl_asrc_runtime_resume(struct device *dev)
 
 disable_asrck_clk:
 	for (i--; i >= 0; i--)
-		clk_disable_unprepare(asrc_priv->asrck_clk[i]);
-	if (!IS_ERR(asrc_priv->spba_clk))
-		clk_disable_unprepare(asrc_priv->spba_clk);
+		clk_disable_unprepare(asrc->asrck_clk[i]);
+	if (!IS_ERR(asrc->spba_clk))
+		clk_disable_unprepare(asrc->spba_clk);
 disable_ipg_clk:
-	clk_disable_unprepare(asrc_priv->ipg_clk);
+	clk_disable_unprepare(asrc->ipg_clk);
 disable_mem_clk:
-	clk_disable_unprepare(asrc_priv->mem_clk);
+	clk_disable_unprepare(asrc->mem_clk);
 	return ret;
 }
 
 static int fsl_asrc_runtime_suspend(struct device *dev)
 {
-	struct fsl_asrc *asrc_priv = dev_get_drvdata(dev);
+	struct fsl_asrc *asrc = dev_get_drvdata(dev);
 	int i;
 
 	for (i = 0; i < ASRC_CLK_MAX_NUM; i++)
-		clk_disable_unprepare(asrc_priv->asrck_clk[i]);
-	if (!IS_ERR(asrc_priv->spba_clk))
-		clk_disable_unprepare(asrc_priv->spba_clk);
-	clk_disable_unprepare(asrc_priv->ipg_clk);
-	clk_disable_unprepare(asrc_priv->mem_clk);
+		clk_disable_unprepare(asrc->asrck_clk[i]);
+	if (!IS_ERR(asrc->spba_clk))
+		clk_disable_unprepare(asrc->spba_clk);
+	clk_disable_unprepare(asrc->ipg_clk);
+	clk_disable_unprepare(asrc->mem_clk);
 
 	return 0;
 }
@@ -1134,37 +1134,37 @@ static int fsl_asrc_runtime_suspend(struct device *dev)
 #ifdef CONFIG_PM_SLEEP
 static int fsl_asrc_suspend(struct device *dev)
 {
-	struct fsl_asrc *asrc_priv = dev_get_drvdata(dev);
+	struct fsl_asrc *asrc = dev_get_drvdata(dev);
 
-	regmap_read(asrc_priv->regmap, REG_ASRCFG,
-		    &asrc_priv->regcache_cfg);
+	regmap_read(asrc->regmap, REG_ASRCFG,
+		    &asrc->regcache_cfg);
 
-	regcache_cache_only(asrc_priv->regmap, true);
-	regcache_mark_dirty(asrc_priv->regmap);
+	regcache_cache_only(asrc->regmap, true);
+	regcache_mark_dirty(asrc->regmap);
 
 	return 0;
 }
 
 static int fsl_asrc_resume(struct device *dev)
 {
-	struct fsl_asrc *asrc_priv = dev_get_drvdata(dev);
+	struct fsl_asrc *asrc = dev_get_drvdata(dev);
 	u32 asrctr;
 
 	/* Stop all pairs provisionally */
-	regmap_read(asrc_priv->regmap, REG_ASRCTR, &asrctr);
-	regmap_update_bits(asrc_priv->regmap, REG_ASRCTR,
+	regmap_read(asrc->regmap, REG_ASRCTR, &asrctr);
+	regmap_update_bits(asrc->regmap, REG_ASRCTR,
 			   ASRCTR_ASRCEi_ALL_MASK, 0);
 
 	/* Restore all registers */
-	regcache_cache_only(asrc_priv->regmap, false);
-	regcache_sync(asrc_priv->regmap);
+	regcache_cache_only(asrc->regmap, false);
+	regcache_sync(asrc->regmap);
 
-	regmap_update_bits(asrc_priv->regmap, REG_ASRCFG,
+	regmap_update_bits(asrc->regmap, REG_ASRCFG,
 			   ASRCFG_NDPRi_ALL_MASK | ASRCFG_POSTMODi_ALL_MASK |
-			   ASRCFG_PREMODi_ALL_MASK, asrc_priv->regcache_cfg);
+			   ASRCFG_PREMODi_ALL_MASK, asrc->regcache_cfg);
 
 	/* Restart enabled pairs */
-	regmap_update_bits(asrc_priv->regmap, REG_ASRCTR,
+	regmap_update_bits(asrc->regmap, REG_ASRCTR,
 			   ASRCTR_ASRCEi_ALL_MASK, asrctr);
 
 	return 0;
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 8a821132d9d0..95d62c45afde 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -448,7 +448,7 @@ struct fsl_asrc_soc_data {
 /**
  * fsl_asrc_pair: ASRC Pair private data
  *
- * @asrc_priv: pointer to its parent module
+ * @asrc: pointer to its parent module
  * @config: configuration profile
  * @error: error record
  * @index: pair index (ASRC_PAIR_A, ASRC_PAIR_B, ASRC_PAIR_C)
@@ -460,7 +460,7 @@ struct fsl_asrc_soc_data {
  * @private: pair private area
  */
 struct fsl_asrc_pair {
-	struct fsl_asrc *asrc_priv;
+	struct fsl_asrc *asrc;
 	struct asrc_config *config;
 	unsigned int error;
 
diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index e7178817d7a7..5fe83aece25b 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -135,7 +135,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	struct snd_dmaengine_dai_dma_data *dma_params_be = NULL;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
-	struct fsl_asrc *asrc_priv = pair->asrc_priv;
+	struct fsl_asrc *asrc = pair->asrc;
 	struct dma_slave_config config_fe, config_be;
 	enum asrc_pair_index index = pair->index;
 	struct device *dev = component->dev;
@@ -170,7 +170,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 
 	/* Override dma_data of the Front-End and config its dmaengine */
 	dma_params_fe = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
-	dma_params_fe->addr = asrc_priv->paddr + REG_ASRDx(!dir, index);
+	dma_params_fe->addr = asrc->paddr + REG_ASRDx(!dir, index);
 	dma_params_fe->maxburst = dma_params_be->maxburst;
 
 	pair->dma_chan[!dir] = fsl_asrc_get_dma_channel(pair, !dir);
@@ -203,7 +203,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	 * need to configure dma_request and dma_request2, but get dma_chan via
 	 * dma_request_slave_channel directly with dma name of Front-End device
 	 */
-	if (!asrc_priv->soc->use_edma) {
+	if (!asrc->soc->use_edma) {
 		/* Get DMA request of Back-End */
 		tmp_chan = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
 		tmp_data = tmp_chan->private;
@@ -230,7 +230,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	if (asrc_priv->asrc_width == 16)
+	if (asrc->asrc_width == 16)
 		buswidth = DMA_SLAVE_BUSWIDTH_2_BYTES;
 	else
 		buswidth = DMA_SLAVE_BUSWIDTH_4_BYTES;
@@ -242,10 +242,10 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	config_be.dst_maxburst = dma_params_be->maxburst;
 
 	if (tx) {
-		config_be.src_addr = asrc_priv->paddr + REG_ASRDO(index);
+		config_be.src_addr = asrc->paddr + REG_ASRDO(index);
 		config_be.dst_addr = dma_params_be->addr;
 	} else {
-		config_be.dst_addr = asrc_priv->paddr + REG_ASRDI(index);
+		config_be.dst_addr = asrc->paddr + REG_ASRDI(index);
 		config_be.src_addr = dma_params_be->addr;
 	}
 
@@ -288,7 +288,7 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	struct device *dev = component->dev;
-	struct fsl_asrc *asrc_priv = dev_get_drvdata(dev);
+	struct fsl_asrc *asrc = dev_get_drvdata(dev);
 	struct fsl_asrc_pair *pair;
 	struct dma_chan *tmp_chan = NULL;
 	u8 dir = tx ? OUT : IN;
@@ -306,7 +306,7 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
 	if (!pair)
 		return -ENOMEM;
 
-	pair->asrc_priv = asrc_priv;
+	pair->asrc = asrc;
 
 	runtime->private_data = pair;
 
@@ -361,15 +361,15 @@ static int fsl_asrc_dma_shutdown(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
-	struct fsl_asrc *asrc_priv;
+	struct fsl_asrc *asrc;
 
 	if (!pair)
 		return 0;
 
-	asrc_priv = pair->asrc_priv;
+	asrc = pair->asrc;
 
-	if (asrc_priv->pair[pair->index] == pair)
-		asrc_priv->pair[pair->index] = NULL;
+	if (asrc->pair[pair->index] == pair)
+		asrc->pair[pair->index] = NULL;
 
 	kfree(pair);
 
-- 
2.21.0

