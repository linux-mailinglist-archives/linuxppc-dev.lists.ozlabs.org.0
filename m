Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D94B2C3452
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 14:34:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jJcq2JyXzDqQk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 22:34:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=sirena.co.uk
 (client-ip=172.104.155.198; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.co.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="q6SqyX1C"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jJLG5F5CzDqDV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 22:22:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=iY6ES9hP3CWF4u3OHcTrGb1l/ZeOMGCP6gxjprw6Y3c=; b=q6SqyX1CYEul
 7ipsRGWpXBg9WW6ZuvTlIVkZyOqJJM/sdVVqPQ4ns9LN+ku3dxFiJ8t6g+eoDyeptQRHIePZLbML3
 JPzcpjFofHJEPCa6sL8eFjLoUW9795g9ecRk3toF1sABLnjbDMN5e5IQXC4jpiBb13DGRrN3Sm6yF
 g7g2I=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFGWM-0004Sc-L8; Tue, 01 Oct 2019 11:40:46 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2CCFA2742A10; Tue,  1 Oct 2019 12:40:46 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Applied "ASoC: fsl_asrc: Use in(out)put_format instead of
 in(out)put_word_width" to the asoc tree
In-Reply-To: <7937c1404ee327ce141cb03b3575b02ea01a740c.1569493933.git.shengjiu.wang@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001114046.2CCFA2742A10@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 12:40:46 +0100 (BST)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lars@metafoo.de, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 perex@perex.cz, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch

   ASoC: fsl_asrc: Use in(out)put_format instead of in(out)put_word_width

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 4bf62571070dd1021556e275d9221f736b2ffcf3 Mon Sep 17 00:00:00 2001
From: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Fri, 27 Sep 2019 09:46:09 +0800
Subject: [PATCH] ASoC: fsl_asrc: Use in(out)put_format instead of
 in(out)put_word_width

snd_pcm_format_t is more formal than enum asrc_word_width, which has
two property, width and physical width, which is more accurate than
enum asrc_word_width. So it is better to use in(out)put_format
instead of in(out)put_word_width.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Link: https://lore.kernel.org/r/7937c1404ee327ce141cb03b3575b02ea01a740c.1569493933.git.shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.20.1

