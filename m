Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA75259A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 23:05:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457pFM1ySYzDqQF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 07:05:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=sirena.org.uk
 (client-ip=2a01:7e01::f03c:91ff:fed4:a3b6; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="QcucmyVv"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457pCx5mKGzDqK1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 07:04:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=/W7ef6lCr7o1OP2KP1Bd5O0fKasIWnPjuvtwCbwngjw=; b=QcucmyVvAOXl
 W4twnCLQRv/ncGQL77hFbQltHY+Xq4OyqXGyRPiE5O3ZbfjsrVdXtTfziSeSyprLi0NsBN4MHRdPa
 xRZCr7SsWSA3E05YCFCcp/AX9tJ8RAerHYkQGEco0wb9kb7k/NIiZiFpRsuzn3DCxziY7dntH40pX
 BfoSw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hTBvY-0002EZ-PB; Tue, 21 May 2019 21:04:04 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 226341126D13; Tue, 21 May 2019 22:04:00 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: S.j. Wang <shengjiu.wang@nxp.com>
Subject: Applied "ASoC: fsl_asrc: Unify the supported input and output rate"
 to the asoc tree
In-Reply-To: <39916109c570791be514db4a3a7793a9467d6484.1557901312.git.shengjiu.wang@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190521210400.226341126D13@debutante.sirena.org.uk>
Date: Tue, 21 May 2019 22:04:00 +0100 (BST)
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch

   ASoC: fsl_asrc: Unify the supported input and output rate

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From d281bf5d924a0284f0dac1f471e1d8328b3a92ca Mon Sep 17 00:00:00 2001
From: "S.j. Wang" <shengjiu.wang@nxp.com>
Date: Wed, 15 May 2019 06:42:26 +0000
Subject: [PATCH] ASoC: fsl_asrc: Unify the supported input and output rate

Unify the supported input and output rate, add the
12kHz/24kHz/128kHz to the support list

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_asrc.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index a8d6710f2541..cbbf6257f08a 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -27,13 +27,14 @@
 	dev_dbg(&asrc_priv->pdev->dev, "Pair %c: " fmt, 'A' + index, ##__VA_ARGS__)
 
 /* Corresponding to process_option */
-static int supported_input_rate[] = {
-	5512, 8000, 11025, 16000, 22050, 32000, 44100, 48000, 64000, 88200,
-	96000, 176400, 192000,
+static unsigned int supported_asrc_rate[] = {
+	5512, 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000,
+	64000, 88200, 96000, 128000, 176400, 192000,
 };
 
-static int supported_asrc_rate[] = {
-	8000, 11025, 16000, 22050, 32000, 44100, 48000, 64000, 88200, 96000, 176400, 192000,
+static struct snd_pcm_hw_constraint_list fsl_asrc_rate_constraints = {
+	.count = ARRAY_SIZE(supported_asrc_rate),
+	.list = supported_asrc_rate,
 };
 
 /**
@@ -293,11 +294,11 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
 	ideal = config->inclk == INCLK_NONE;
 
 	/* Validate input and output sample rates */
-	for (in = 0; in < ARRAY_SIZE(supported_input_rate); in++)
-		if (inrate == supported_input_rate[in])
+	for (in = 0; in < ARRAY_SIZE(supported_asrc_rate); in++)
+		if (inrate == supported_asrc_rate[in])
 			break;
 
-	if (in == ARRAY_SIZE(supported_input_rate)) {
+	if (in == ARRAY_SIZE(supported_asrc_rate)) {
 		pair_err("unsupported input sample rate: %dHz\n", inrate);
 		return -EINVAL;
 	}
@@ -311,7 +312,7 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
 		return -EINVAL;
 	}
 
-	if ((outrate >= 8000 && outrate <= 30000) &&
+	if ((outrate >= 5512 && outrate <= 30000) &&
 	    (outrate > 24 * inrate || inrate > 8 * outrate)) {
 		pair_err("exceed supported ratio range [1/24, 8] for \
 				inrate/outrate: %d/%d\n", inrate, outrate);
@@ -486,7 +487,9 @@ static int fsl_asrc_dai_startup(struct snd_pcm_substream *substream,
 		snd_pcm_hw_constraint_step(substream->runtime, 0,
 					   SNDRV_PCM_HW_PARAM_CHANNELS, 2);
 
-	return 0;
+
+	return snd_pcm_hw_constraint_list(substream->runtime, 0,
+			SNDRV_PCM_HW_PARAM_RATE, &fsl_asrc_rate_constraints);
 }
 
 static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
@@ -599,7 +602,6 @@ static int fsl_asrc_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
-#define FSL_ASRC_RATES		 SNDRV_PCM_RATE_8000_192000
 #define FSL_ASRC_FORMATS	(SNDRV_PCM_FMTBIT_S24_LE | \
 				 SNDRV_PCM_FMTBIT_S16_LE | \
 				 SNDRV_PCM_FMTBIT_S20_3LE)
@@ -610,14 +612,18 @@ static struct snd_soc_dai_driver fsl_asrc_dai = {
 		.stream_name = "ASRC-Playback",
 		.channels_min = 1,
 		.channels_max = 10,
-		.rates = FSL_ASRC_RATES,
+		.rate_min = 5512,
+		.rate_max = 192000,
+		.rates = SNDRV_PCM_RATE_KNOT,
 		.formats = FSL_ASRC_FORMATS,
 	},
 	.capture = {
 		.stream_name = "ASRC-Capture",
 		.channels_min = 1,
 		.channels_max = 10,
-		.rates = FSL_ASRC_RATES,
+		.rate_min = 5512,
+		.rate_max = 192000,
+		.rates = SNDRV_PCM_RATE_KNOT,
 		.formats = FSL_ASRC_FORMATS,
 	},
 	.ops = &fsl_asrc_dai_ops,
-- 
2.20.1

