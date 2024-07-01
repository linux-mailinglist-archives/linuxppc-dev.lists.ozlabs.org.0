Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB1191DE14
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 13:34:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ZnoUMiVn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCP8V2LRmz3cVT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 21:34:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ZnoUMiVn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCP5W0wBvz3cF6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 21:31:58 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 107CC24000B;
	Mon,  1 Jul 2024 11:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719833513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DgnTidH1/Oa8bludXLWM/W7+X2Tacy46pQTzIGVhdS4=;
	b=ZnoUMiVnb11UJdZZbvnee3w//260YfU36UdASsrxZKtnLT0RSKHw60Gza9IE+R0YneEvYO
	tGWwWBBjeDjc6MpybIvG2HH1uC++vXDFQpA1OYb4LxIOAPth4DVobC5KlVAi0UJGEHRYjV
	yuo1iIyZbcWezpzaje5Kh9wauaRxPh+pzTFwa/w/eb7ly3tsq0zx8t64ONw/NAs2WbM+Wm
	lWcqMP4Cw+klG8jOSHpxUWyAgAD9pD/Zl4f3SyYXTwXcqMUvNYKfYlJF8o2GfWy+L38E/S
	niiucXksWmGXv+kb/b2Kuu8Pu7ybwCHfqeOurvgvtYv5fVg9IavdiSh1R1WX6A==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 02/10] ASoC: fsl: fsl_qmc_audio: Fix issues detected by checkpatch
Date: Mon,  1 Jul 2024 13:30:29 +0200
Message-ID: <20240701113038.55144-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240701113038.55144-1-herve.codina@bootlin.com>
References: <20240701113038.55144-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

./scripts/checkpatch.pl --strict --codespell detected several issues
when running on the fsl_qmc_audio.c file:
  - CHECK: spaces preferred around that '*' (ctx:VxV)
  - CHECK: Alignment should match open parenthesis
  - CHECK: Comparison to NULL could be written "!prtd"
  - CHECK: spaces preferred around that '/' (ctx:VxV)
  - CHECK: Lines should not end with a '('
  - CHECK: Please don't use multiple blank lines
Some of them are present several times.

Fix all of these issues without any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/fsl/fsl_qmc_audio.c | 65 +++++++++++++++++------------------
 1 file changed, 31 insertions(+), 34 deletions(-)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index dd90ef16fa97..917a32389f3d 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -54,7 +54,7 @@ static int qmc_audio_pcm_construct(struct snd_soc_component *component,
 		return ret;
 
 	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV, card->dev,
-				       64*1024, 64*1024);
+				       64 * 1024, 64 * 1024);
 	return 0;
 }
 
@@ -89,8 +89,8 @@ static void qmc_audio_pcm_write_complete(void *context)
 		prtd->period_ptr_submitted = prtd->dma_buffer_start;
 
 	ret = qmc_chan_write_submit(prtd->qmc_dai->qmc_chan,
-		prtd->period_ptr_submitted, prtd->period_size,
-		qmc_audio_pcm_write_complete, prtd);
+				    prtd->period_ptr_submitted, prtd->period_size,
+				    qmc_audio_pcm_write_complete, prtd);
 	if (ret) {
 		dev_err(prtd->qmc_dai->dev, "write_submit failed %d\n",
 			ret);
@@ -118,8 +118,8 @@ static void qmc_audio_pcm_read_complete(void *context, size_t length, unsigned i
 		prtd->period_ptr_submitted = prtd->dma_buffer_start;
 
 	ret = qmc_chan_read_submit(prtd->qmc_dai->qmc_chan,
-		prtd->period_ptr_submitted, prtd->period_size,
-		qmc_audio_pcm_read_complete, prtd);
+				   prtd->period_ptr_submitted, prtd->period_size,
+				   qmc_audio_pcm_read_complete, prtd);
 	if (ret) {
 		dev_err(prtd->qmc_dai->dev, "read_submit failed %d\n",
 			ret);
@@ -144,8 +144,8 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 			/* Submit first chunk ... */
 			ret = qmc_chan_write_submit(prtd->qmc_dai->qmc_chan,
-				prtd->period_ptr_submitted, prtd->period_size,
-				qmc_audio_pcm_write_complete, prtd);
+						    prtd->period_ptr_submitted, prtd->period_size,
+						    qmc_audio_pcm_write_complete, prtd);
 			if (ret) {
 				dev_err(component->dev, "write_submit failed %d\n",
 					ret);
@@ -159,8 +159,8 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 
 			/* ... and send it */
 			ret = qmc_chan_write_submit(prtd->qmc_dai->qmc_chan,
-				prtd->period_ptr_submitted, prtd->period_size,
-				qmc_audio_pcm_write_complete, prtd);
+						    prtd->period_ptr_submitted, prtd->period_size,
+						    qmc_audio_pcm_write_complete, prtd);
 			if (ret) {
 				dev_err(component->dev, "write_submit failed %d\n",
 					ret);
@@ -169,8 +169,8 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 		} else {
 			/* Submit first chunk ... */
 			ret = qmc_chan_read_submit(prtd->qmc_dai->qmc_chan,
-				prtd->period_ptr_submitted, prtd->period_size,
-				qmc_audio_pcm_read_complete, prtd);
+						   prtd->period_ptr_submitted, prtd->period_size,
+						   qmc_audio_pcm_read_complete, prtd);
 			if (ret) {
 				dev_err(component->dev, "read_submit failed %d\n",
 					ret);
@@ -184,8 +184,8 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 
 			/* ... and send it */
 			ret = qmc_chan_read_submit(prtd->qmc_dai->qmc_chan,
-				prtd->period_ptr_submitted, prtd->period_size,
-				qmc_audio_pcm_read_complete, prtd);
+						   prtd->period_ptr_submitted, prtd->period_size,
+						   qmc_audio_pcm_read_complete, prtd);
 			if (ret) {
 				dev_err(component->dev, "write_submit failed %d\n",
 					ret);
@@ -220,8 +220,8 @@ static snd_pcm_uframes_t qmc_audio_pcm_pointer(struct snd_soc_component *compone
 }
 
 static int qmc_audio_of_xlate_dai_name(struct snd_soc_component *component,
-					const struct of_phandle_args *args,
-					const char **dai_name)
+				       const struct of_phandle_args *args,
+				       const char **dai_name)
 {
 	struct qmc_audio *qmc_audio = dev_get_drvdata(component->dev);
 	struct snd_soc_dai_driver *dai_driver;
@@ -245,10 +245,10 @@ static const struct snd_pcm_hardware qmc_audio_pcm_hardware = {
 				  SNDRV_PCM_INFO_INTERLEAVED |
 				  SNDRV_PCM_INFO_PAUSE,
 	.period_bytes_min	= 32,
-	.period_bytes_max	= 64*1024,
+	.period_bytes_max	= 64 * 1024,
 	.periods_min		= 2,
-	.periods_max		= 2*1024,
-	.buffer_bytes_max	= 64*1024,
+	.periods_max		= 2 * 1024,
+	.buffer_bytes_max	= 64 * 1024,
 };
 
 static int qmc_audio_pcm_open(struct snd_soc_component *component,
@@ -266,7 +266,7 @@ static int qmc_audio_pcm_open(struct snd_soc_component *component,
 		return ret;
 
 	prtd = kzalloc(sizeof(*prtd), GFP_KERNEL);
-	if (prtd == NULL)
+	if (!prtd)
 		return -ENOMEM;
 
 	runtime->private_data = prtd;
@@ -329,13 +329,13 @@ static int qmc_dai_hw_rule_channels_by_format(struct qmc_dai *qmc_dai,
 		ch.max = nb_ts;
 		break;
 	case 16:
-		ch.max = nb_ts/2;
+		ch.max = nb_ts / 2;
 		break;
 	case 32:
-		ch.max = nb_ts/4;
+		ch.max = nb_ts / 4;
 		break;
 	case 64:
-		ch.max = nb_ts/8;
+		ch.max = nb_ts / 8;
 		break;
 	default:
 		dev_err(qmc_dai->dev, "format physical width %u not supported\n",
@@ -356,9 +356,8 @@ static int qmc_dai_hw_rule_playback_channels_by_format(struct snd_pcm_hw_params
 	return qmc_dai_hw_rule_channels_by_format(qmc_dai, params, qmc_dai->nb_tx_ts);
 }
 
-static int qmc_dai_hw_rule_capture_channels_by_format(
-			struct snd_pcm_hw_params *params,
-			struct snd_pcm_hw_rule *rule)
+static int qmc_dai_hw_rule_capture_channels_by_format(struct snd_pcm_hw_params *params,
+						      struct snd_pcm_hw_rule *rule)
 {
 	struct qmc_dai *qmc_dai = rule->private;
 
@@ -394,18 +393,16 @@ static int qmc_dai_hw_rule_format_by_channels(struct qmc_dai *qmc_dai,
 	return snd_mask_refine(f_old, &f_new);
 }
 
-static int qmc_dai_hw_rule_playback_format_by_channels(
-			struct snd_pcm_hw_params *params,
-			struct snd_pcm_hw_rule *rule)
+static int qmc_dai_hw_rule_playback_format_by_channels(struct snd_pcm_hw_params *params,
+						       struct snd_pcm_hw_rule *rule)
 {
 	struct qmc_dai *qmc_dai = rule->private;
 
 	return qmc_dai_hw_rule_format_by_channels(qmc_dai, params, qmc_dai->nb_tx_ts);
 }
 
-static int qmc_dai_hw_rule_capture_format_by_channels(
-			struct snd_pcm_hw_params *params,
-			struct snd_pcm_hw_rule *rule)
+static int qmc_dai_hw_rule_capture_format_by_channels(struct snd_pcm_hw_params *params,
+						      struct snd_pcm_hw_rule *rule)
 {
 	struct qmc_dai *qmc_dai = rule->private;
 
@@ -413,7 +410,7 @@ static int qmc_dai_hw_rule_capture_format_by_channels(
 }
 
 static int qmc_dai_startup(struct snd_pcm_substream *substream,
-			     struct snd_soc_dai *dai)
+			   struct snd_soc_dai *dai)
 {
 	struct qmc_dai_prtd *prtd = substream->runtime->private_data;
 	snd_pcm_hw_rule_func_t hw_rule_channels_by_format;
@@ -587,7 +584,8 @@ static u64 qmc_audio_formats(u8 nb_ts)
 }
 
 static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *np,
-	struct qmc_dai *qmc_dai, struct snd_soc_dai_driver *qmc_soc_dai_driver)
+			       struct qmc_dai *qmc_dai,
+			       struct snd_soc_dai_driver *qmc_soc_dai_driver)
 {
 	struct qmc_chan_info info;
 	u32 val;
@@ -704,7 +702,6 @@ static int qmc_audio_probe(struct platform_device *pdev)
 		i++;
 	}
 
-
 	platform_set_drvdata(pdev, qmc_audio);
 
 	ret = devm_snd_soc_register_component(qmc_audio->dev,
-- 
2.45.0

