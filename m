Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1EA910002
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 11:12:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=AWbHokCp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4ZW75Sc5z3cSd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 19:12:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=AWbHokCp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4ZS32qJ5z3bZN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 19:09:21 +1000 (AEST)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 051BBC24FC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 08:43:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id B86202000E;
	Thu, 20 Jun 2024 08:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718872993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qz56XJSUWFIXioYtOWzibVEtfgyCjJ8wlnP/M2Ai9vM=;
	b=AWbHokCpxotyrZuw1NlkQ2ZXO2viJ65ahJRtBSnWBWLVA0yV09QVhY4z1epYHtYnt+NMMK
	vcc9NB9k6m9ZXdTniL8PM42Klu3XTbN5b7nKj8uCG1c0phhmvoDKsLql4RwftbhAK9zBey
	SugYVBLETSYrliS9FpbxOkplqU4Rjxy94IYiQgYeTk0c6AL9zIkGWuK6+pTh9ALYTeqv+9
	X1q/R0ydUxz6VkGtTx0erij7w1jgFtXLXvIaS/8DczmSEHQPVrX2lA05jkRaXaOcS3g/tm
	DoiQFKfku+oAuzBglYeE/Y7x9BfLNjO/WpnIq6eq2Cz5etK8YiyV7zJI/dDzfA==
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
Subject: [PATCH 03/10] ASoC: fsl: fsl_qmc_audio: Split channel buffer and PCM pointer handling
Date: Thu, 20 Jun 2024 10:42:50 +0200
Message-ID: <20240620084300.397853-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240620084300.397853-1-herve.codina@bootlin.com>
References: <20240620084300.397853-1-herve.codina@bootlin.com>
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

The driver mixes some internal values for channel DMA buffer handling
and PCM pointer handling. In the currently supported interleaved mode,
this mix does not lead to any issues but in order to prepare the
support for the non-interleaved mode, having them clearly separated will
ease the support and avoid additional computation to convert values used
in channel DMA buffer management in values usable for PCM pointer.

Use a specific set of variable for PCM pointer handling and an other set
for channel DMA buffer.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/fsl/fsl_qmc_audio.c | 84 +++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 38 deletions(-)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index 917a32389f3d..e8281e548746 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -35,11 +35,16 @@ struct qmc_audio {
 
 struct qmc_dai_prtd {
 	struct qmc_dai *qmc_dai;
-	dma_addr_t dma_buffer_start;
-	dma_addr_t period_ptr_submitted;
-	dma_addr_t period_ptr_ended;
-	dma_addr_t dma_buffer_end;
-	size_t period_size;
+
+	snd_pcm_uframes_t buffer_ended;
+	snd_pcm_uframes_t buffer_size;
+	snd_pcm_uframes_t period_size;
+
+	dma_addr_t ch_dma_addr_start;
+	dma_addr_t ch_dma_addr_current;
+	dma_addr_t ch_dma_addr_end;
+	size_t ch_dma_size;
+
 	struct snd_pcm_substream *substream;
 };
 
@@ -65,13 +70,17 @@ static int qmc_audio_pcm_hw_params(struct snd_soc_component *component,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct qmc_dai_prtd *prtd = substream->runtime->private_data;
 
-	prtd->dma_buffer_start = runtime->dma_addr;
-	prtd->dma_buffer_end = runtime->dma_addr + params_buffer_bytes(params);
-	prtd->period_size = params_period_bytes(params);
-	prtd->period_ptr_submitted = prtd->dma_buffer_start;
-	prtd->period_ptr_ended = prtd->dma_buffer_start;
 	prtd->substream = substream;
 
+	prtd->buffer_ended = 0;
+	prtd->buffer_size = params_buffer_size(params);
+	prtd->period_size = params_period_size(params);
+
+	prtd->ch_dma_addr_start = runtime->dma_addr;
+	prtd->ch_dma_addr_end = runtime->dma_addr + params_buffer_bytes(params);
+	prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
+	prtd->ch_dma_size = params_period_bytes(params);
+
 	return 0;
 }
 
@@ -80,16 +89,16 @@ static void qmc_audio_pcm_write_complete(void *context)
 	struct qmc_dai_prtd *prtd = context;
 	int ret;
 
-	prtd->period_ptr_ended += prtd->period_size;
-	if (prtd->period_ptr_ended >= prtd->dma_buffer_end)
-		prtd->period_ptr_ended = prtd->dma_buffer_start;
+	prtd->buffer_ended += prtd->period_size;
+	if (prtd->buffer_ended >= prtd->buffer_size)
+		prtd->buffer_ended = 0;
 
-	prtd->period_ptr_submitted += prtd->period_size;
-	if (prtd->period_ptr_submitted >= prtd->dma_buffer_end)
-		prtd->period_ptr_submitted = prtd->dma_buffer_start;
+	prtd->ch_dma_addr_current += prtd->ch_dma_size;
+	if (prtd->ch_dma_addr_current >= prtd->ch_dma_addr_end)
+		prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
 	ret = qmc_chan_write_submit(prtd->qmc_dai->qmc_chan,
-				    prtd->period_ptr_submitted, prtd->period_size,
+				    prtd->ch_dma_addr_current, prtd->ch_dma_size,
 				    qmc_audio_pcm_write_complete, prtd);
 	if (ret) {
 		dev_err(prtd->qmc_dai->dev, "write_submit failed %d\n",
@@ -104,21 +113,21 @@ static void qmc_audio_pcm_read_complete(void *context, size_t length, unsigned i
 	struct qmc_dai_prtd *prtd = context;
 	int ret;
 
-	if (length != prtd->period_size) {
+	if (length != prtd->ch_dma_size) {
 		dev_err(prtd->qmc_dai->dev, "read complete length = %zu, exp %zu\n",
-			length, prtd->period_size);
+			length, prtd->ch_dma_size);
 	}
 
-	prtd->period_ptr_ended += prtd->period_size;
-	if (prtd->period_ptr_ended >= prtd->dma_buffer_end)
-		prtd->period_ptr_ended = prtd->dma_buffer_start;
+	prtd->buffer_ended += prtd->period_size;
+	if (prtd->buffer_ended >= prtd->buffer_size)
+		prtd->buffer_ended = 0;
 
-	prtd->period_ptr_submitted += prtd->period_size;
-	if (prtd->period_ptr_submitted >= prtd->dma_buffer_end)
-		prtd->period_ptr_submitted = prtd->dma_buffer_start;
+	prtd->ch_dma_addr_current += prtd->ch_dma_size;
+	if (prtd->ch_dma_addr_current >= prtd->ch_dma_addr_end)
+		prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
 	ret = qmc_chan_read_submit(prtd->qmc_dai->qmc_chan,
-				   prtd->period_ptr_submitted, prtd->period_size,
+				   prtd->ch_dma_addr_current, prtd->ch_dma_size,
 				   qmc_audio_pcm_read_complete, prtd);
 	if (ret) {
 		dev_err(prtd->qmc_dai->dev, "read_submit failed %d\n",
@@ -144,7 +153,7 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 			/* Submit first chunk ... */
 			ret = qmc_chan_write_submit(prtd->qmc_dai->qmc_chan,
-						    prtd->period_ptr_submitted, prtd->period_size,
+						    prtd->ch_dma_addr_current, prtd->ch_dma_size,
 						    qmc_audio_pcm_write_complete, prtd);
 			if (ret) {
 				dev_err(component->dev, "write_submit failed %d\n",
@@ -153,13 +162,13 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 			}
 
 			/* ... prepare next one ... */
-			prtd->period_ptr_submitted += prtd->period_size;
-			if (prtd->period_ptr_submitted >= prtd->dma_buffer_end)
-				prtd->period_ptr_submitted = prtd->dma_buffer_start;
+			prtd->ch_dma_addr_current += prtd->ch_dma_size;
+			if (prtd->ch_dma_addr_current >= prtd->ch_dma_addr_end)
+				prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
 			/* ... and send it */
 			ret = qmc_chan_write_submit(prtd->qmc_dai->qmc_chan,
-						    prtd->period_ptr_submitted, prtd->period_size,
+						    prtd->ch_dma_addr_current, prtd->ch_dma_size,
 						    qmc_audio_pcm_write_complete, prtd);
 			if (ret) {
 				dev_err(component->dev, "write_submit failed %d\n",
@@ -169,7 +178,7 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 		} else {
 			/* Submit first chunk ... */
 			ret = qmc_chan_read_submit(prtd->qmc_dai->qmc_chan,
-						   prtd->period_ptr_submitted, prtd->period_size,
+						   prtd->ch_dma_addr_current, prtd->ch_dma_size,
 						   qmc_audio_pcm_read_complete, prtd);
 			if (ret) {
 				dev_err(component->dev, "read_submit failed %d\n",
@@ -178,13 +187,13 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 			}
 
 			/* ... prepare next one ... */
-			prtd->period_ptr_submitted += prtd->period_size;
-			if (prtd->period_ptr_submitted >= prtd->dma_buffer_end)
-				prtd->period_ptr_submitted = prtd->dma_buffer_start;
+			prtd->ch_dma_addr_current += prtd->ch_dma_size;
+			if (prtd->ch_dma_addr_current >= prtd->ch_dma_addr_end)
+				prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
 			/* ... and send it */
 			ret = qmc_chan_read_submit(prtd->qmc_dai->qmc_chan,
-						   prtd->period_ptr_submitted, prtd->period_size,
+						   prtd->ch_dma_addr_current, prtd->ch_dma_size,
 						   qmc_audio_pcm_read_complete, prtd);
 			if (ret) {
 				dev_err(component->dev, "write_submit failed %d\n",
@@ -215,8 +224,7 @@ static snd_pcm_uframes_t qmc_audio_pcm_pointer(struct snd_soc_component *compone
 {
 	struct qmc_dai_prtd *prtd = substream->runtime->private_data;
 
-	return bytes_to_frames(substream->runtime,
-			       prtd->period_ptr_ended - prtd->dma_buffer_start);
+	return prtd->buffer_ended;
 }
 
 static int qmc_audio_of_xlate_dai_name(struct snd_soc_component *component,
-- 
2.45.0

