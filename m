Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5AB91DE36
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 13:39:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=hIqvZEVT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCPG76ygPz3cMX
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 21:39:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=hIqvZEVT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCP5g0H0dz3cSL
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 21:32:06 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 6A39624000A;
	Mon,  1 Jul 2024 11:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719833524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHG8lPGlQk6+IXxucX4unaLMS1tOpOoqGN2wBV2+b+Q=;
	b=hIqvZEVTTPI12BajyP21kj3t7NtwnC954hShbuFKmK5JJeq6vp54mDZjTm23yj/6j7ZtFH
	t2ap7DyW39eljVQG7nzdhf7/1XLJSpSL+JCp/p9VORtV8arvgj6Xlci4F/ujchA68jeY8S
	l9qO9XA4aZduY7lXPxC7Y+E9OLQhlbh7kIpTq4SZf3SQNNeYFQ2XwRe5Y91bf5k94aVWcg
	QJskuGVUbqu1DS7I5tlAxqdqmCXo/Qvprlez7yTMXVoDlmPtMwW7Cq2immyfT3Kabbjv9f
	Yd9mYpv9kXB+ofkaBrxlZxYSskntHgswokugaE5SY16dYK+95MtGdyk10ZtaAA==
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
Subject: [PATCH v2 10/10] ASoC: fsl: fsl_qmc_audio: Add support for non-interleaved mode.
Date: Mon,  1 Jul 2024 13:30:37 +0200
Message-ID: <20240701113038.55144-11-herve.codina@bootlin.com>
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

The current fsl_qmc_audio works in interleaved mode. The audio samples
are interleaved and all data are sent to (received from) one QMC
channel.

Using several QMC channels, non interleaved mode can be easily
supported. In that case, data related to ch0 are sent to (received from)
the first QMC channel, data related to ch1 use the next QMC channel and
so on up to the last channel.

In terms of constraints and settings, the two modes are slightly
different:
- Interleaved mode:
    - The sample size should fit in the number of time-slots available
      for the QMC channel.
    - The number of audio channels should fit in the number of
      time-slots (taking into account the sample size) available for the
      QMC channel.
- Non-interleaved mode:
    - The number of audio channels is the number of available QMC
      channels.
    - Each QMC channel should have the same number of time-slots.
    - The sample size equals the number of time-slots of one QMC
      channel.

Add support for the non-interleaved mode allowing multiple QMC channel
per DAI. The DAI switches in non-interleaved mode when more that one QMC
channel is available.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/fsl/fsl_qmc_audio.c | 372 +++++++++++++++++++++++++++-------
 1 file changed, 297 insertions(+), 75 deletions(-)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index f70c6c8eec4a..8668abd35208 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -29,7 +29,11 @@ struct qmc_dai {
 	struct device *dev;
 	unsigned int nb_tx_ts;
 	unsigned int nb_rx_ts;
-	struct qmc_dai_chan chan;
+
+	unsigned int nb_chans_avail;
+	unsigned int nb_chans_used_tx;
+	unsigned int nb_chans_used_rx;
+	struct qmc_dai_chan *chans;
 };
 
 struct qmc_audio {
@@ -50,7 +54,10 @@ struct qmc_dai_prtd {
 	dma_addr_t ch_dma_addr_current;
 	dma_addr_t ch_dma_addr_end;
 	size_t ch_dma_size;
+	size_t ch_dma_offset;
 
+	unsigned int channels;
+	DECLARE_BITMAP(chans_pending, 64);
 	struct snd_pcm_substream *substream;
 };
 
@@ -69,6 +76,18 @@ static int qmc_audio_pcm_construct(struct snd_soc_component *component,
 	return 0;
 }
 
+static bool qmc_audio_access_is_interleaved(snd_pcm_access_t access)
+{
+	switch (access) {
+	case SNDRV_PCM_ACCESS_MMAP_INTERLEAVED:
+	case SNDRV_PCM_ACCESS_RW_INTERLEAVED:
+		return true;
+	default:
+		break;
+	}
+	return false;
+}
+
 static int qmc_audio_pcm_hw_params(struct snd_soc_component *component,
 				   struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
@@ -76,6 +95,14 @@ static int qmc_audio_pcm_hw_params(struct snd_soc_component *component,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct qmc_dai_prtd *prtd = substream->runtime->private_data;
 
+	/*
+	 * In interleaved mode, the driver uses one QMC channel for all audio
+	 * channels whereas in non-interleaved mode, it uses one QMC channel per
+	 * audio channel.
+	 */
+	prtd->channels = qmc_audio_access_is_interleaved(params_access(params)) ?
+				1 : params_channels(params);
+
 	prtd->substream = substream;
 
 	prtd->buffer_ended = 0;
@@ -83,9 +110,10 @@ static int qmc_audio_pcm_hw_params(struct snd_soc_component *component,
 	prtd->period_size = params_period_size(params);
 
 	prtd->ch_dma_addr_start = runtime->dma_addr;
-	prtd->ch_dma_addr_end = runtime->dma_addr + params_buffer_bytes(params);
+	prtd->ch_dma_offset = params_buffer_bytes(params) / prtd->channels;
+	prtd->ch_dma_addr_end = runtime->dma_addr + prtd->ch_dma_offset;
 	prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
-	prtd->ch_dma_size = params_period_bytes(params);
+	prtd->ch_dma_size = params_period_bytes(params) / prtd->channels;
 
 	return 0;
 }
@@ -94,16 +122,23 @@ static void qmc_audio_pcm_write_complete(void *context);
 
 static int qmc_audio_pcm_write_submit(struct qmc_dai_prtd *prtd)
 {
+	unsigned int i;
 	int ret;
 
-	ret = qmc_chan_write_submit(prtd->qmc_dai->chan.qmc_chan,
-				    prtd->ch_dma_addr_current, prtd->ch_dma_size,
-				    qmc_audio_pcm_write_complete,
-				    &prtd->qmc_dai->chan);
-	if (ret) {
-		dev_err(prtd->qmc_dai->dev, "write_submit failed %d\n",
-			ret);
-		return ret;
+	for (i = 0; i < prtd->channels; i++) {
+		bitmap_set(prtd->chans_pending, i, 1);
+
+		ret = qmc_chan_write_submit(prtd->qmc_dai->chans[i].qmc_chan,
+					    prtd->ch_dma_addr_current + i * prtd->ch_dma_offset,
+					    prtd->ch_dma_size,
+					    qmc_audio_pcm_write_complete,
+					    &prtd->qmc_dai->chans[i]);
+		if (ret) {
+			dev_err(prtd->qmc_dai->dev, "write_submit %u failed %d\n",
+				i, ret);
+			bitmap_clear(prtd->chans_pending, i, 1);
+			return ret;
+		}
 	}
 
 	return 0;
@@ -116,6 +151,16 @@ static void qmc_audio_pcm_write_complete(void *context)
 
 	prtd = chan->prtd_tx;
 
+	/* Mark the current channel as completed */
+	bitmap_clear(prtd->chans_pending, chan - prtd->qmc_dai->chans, 1);
+
+	/*
+	 * All QMC channels involved must have completed their transfer before
+	 * submitting a new one.
+	 */
+	if (!bitmap_empty(prtd->chans_pending, 64))
+		return;
+
 	prtd->buffer_ended += prtd->period_size;
 	if (prtd->buffer_ended >= prtd->buffer_size)
 		prtd->buffer_ended = 0;
@@ -133,15 +178,23 @@ static void qmc_audio_pcm_read_complete(void *context, size_t length, unsigned i
 
 static int qmc_audio_pcm_read_submit(struct qmc_dai_prtd *prtd)
 {
+	unsigned int i;
 	int ret;
 
-	ret = qmc_chan_read_submit(prtd->qmc_dai->chan.qmc_chan,
-				   prtd->ch_dma_addr_current, prtd->ch_dma_size,
-				   qmc_audio_pcm_read_complete,
-				   &prtd->qmc_dai->chan);
-	if (ret) {
-		dev_err(prtd->qmc_dai->dev, "read_submit failed %d\n",
-			ret);
+	for (i = 0; i < prtd->channels; i++) {
+		bitmap_set(prtd->chans_pending, i, 1);
+
+		ret = qmc_chan_read_submit(prtd->qmc_dai->chans[i].qmc_chan,
+					   prtd->ch_dma_addr_current + i * prtd->ch_dma_offset,
+					   prtd->ch_dma_size,
+					   qmc_audio_pcm_read_complete,
+					   &prtd->qmc_dai->chans[i]);
+		if (ret) {
+			dev_err(prtd->qmc_dai->dev, "read_submit %u failed %d\n",
+				i, ret);
+			bitmap_clear(prtd->chans_pending, i, 1);
+			return ret;
+		}
 	}
 
 	return 0;
@@ -154,11 +207,21 @@ static void qmc_audio_pcm_read_complete(void *context, size_t length, unsigned i
 
 	prtd = chan->prtd_rx;
 
+	/* Mark the current channel as completed */
+	bitmap_clear(prtd->chans_pending, chan - prtd->qmc_dai->chans, 1);
+
 	if (length != prtd->ch_dma_size) {
 		dev_err(prtd->qmc_dai->dev, "read complete length = %zu, exp %zu\n",
 			length, prtd->ch_dma_size);
 	}
 
+	/*
+	 * All QMC channels involved must have completed their transfer before
+	 * submitting a new one.
+	 */
+	if (!bitmap_empty(prtd->chans_pending, 64))
+		return;
+
 	prtd->buffer_ended += prtd->period_size;
 	if (prtd->buffer_ended >= prtd->buffer_size)
 		prtd->buffer_ended = 0;
@@ -176,6 +239,7 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 				 struct snd_pcm_substream *substream, int cmd)
 {
 	struct qmc_dai_prtd *prtd = substream->runtime->private_data;
+	unsigned int i;
 	int ret;
 
 	if (!prtd->qmc_dai) {
@@ -185,8 +249,10 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
+		bitmap_zero(prtd->chans_pending, 64);
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			prtd->qmc_dai->chan.prtd_tx = prtd;
+			for (i = 0; i < prtd->channels; i++)
+				prtd->qmc_dai->chans[i].prtd_tx = prtd;
 
 			/* Submit first chunk ... */
 			ret = qmc_audio_pcm_write_submit(prtd);
@@ -203,7 +269,8 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 			if (ret)
 				return ret;
 		} else {
-			prtd->qmc_dai->chan.prtd_rx = prtd;
+			for (i = 0; i < prtd->channels; i++)
+				prtd->qmc_dai->chans[i].prtd_rx = prtd;
 
 			/* Submit first chunk ... */
 			ret = qmc_audio_pcm_read_submit(prtd);
@@ -270,6 +337,7 @@ static const struct snd_pcm_hardware qmc_audio_pcm_hardware = {
 	.info			= SNDRV_PCM_INFO_MMAP |
 				  SNDRV_PCM_INFO_MMAP_VALID |
 				  SNDRV_PCM_INFO_INTERLEAVED |
+				  SNDRV_PCM_INFO_NONINTERLEAVED |
 				  SNDRV_PCM_INFO_PAUSE,
 	.period_bytes_min	= 32,
 	.period_bytes_max	= 64 * 1024,
@@ -442,6 +510,7 @@ static int qmc_dai_constraints_interleaved(struct snd_pcm_substream *substream,
 	snd_pcm_hw_rule_func_t hw_rule_channels_by_format;
 	snd_pcm_hw_rule_func_t hw_rule_format_by_channels;
 	unsigned int frame_bits;
+	u64 access;
 	int ret;
 
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
@@ -478,6 +547,44 @@ static int qmc_dai_constraints_interleaved(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
+	access = 1ULL << (__force int)SNDRV_PCM_ACCESS_MMAP_INTERLEAVED |
+		 1ULL << (__force int)SNDRV_PCM_ACCESS_RW_INTERLEAVED;
+	ret = snd_pcm_hw_constraint_mask64(substream->runtime, SNDRV_PCM_HW_PARAM_ACCESS,
+					   access);
+	if (ret) {
+		dev_err(qmc_dai->dev, "Failed to add hw_param_access constraint (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int qmc_dai_constraints_noninterleaved(struct snd_pcm_substream *substream,
+					      struct qmc_dai *qmc_dai)
+{
+	unsigned int frame_bits;
+	u64 access;
+	int ret;
+
+	frame_bits = (substream->stream == SNDRV_PCM_STREAM_CAPTURE) ?
+			qmc_dai->nb_rx_ts * 8 : qmc_dai->nb_tx_ts * 8;
+	ret = snd_pcm_hw_constraint_single(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_FRAME_BITS,
+					   frame_bits);
+	if (ret < 0) {
+		dev_err(qmc_dai->dev, "Failed to add frame_bits constraint (%d)\n", ret);
+		return ret;
+	}
+
+	access = 1ULL << (__force int)SNDRV_PCM_ACCESS_MMAP_NONINTERLEAVED |
+		 1ULL << (__force int)SNDRV_PCM_ACCESS_RW_NONINTERLEAVED;
+	ret = snd_pcm_hw_constraint_mask64(substream->runtime, SNDRV_PCM_HW_PARAM_ACCESS,
+					   access);
+	if (ret) {
+		dev_err(qmc_dai->dev, "Failed to add hw_param_access constraint (%d)\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -495,7 +602,9 @@ static int qmc_dai_startup(struct snd_pcm_substream *substream,
 
 	prtd->qmc_dai = qmc_dai;
 
-	return qmc_dai_constraints_interleaved(substream, qmc_dai);
+	return qmc_dai->nb_chans_avail > 1 ?
+		qmc_dai_constraints_noninterleaved(substream, qmc_dai) :
+		qmc_dai_constraints_interleaved(substream, qmc_dai);
 }
 
 static int qmc_dai_hw_params(struct snd_pcm_substream *substream,
@@ -503,7 +612,9 @@ static int qmc_dai_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
 	struct qmc_chan_param chan_param = {0};
+	unsigned int nb_chans_used;
 	struct qmc_dai *qmc_dai;
+	unsigned int i;
 	int ret;
 
 	qmc_dai = qmc_dai_get_data(dai);
@@ -512,15 +623,34 @@ static int qmc_dai_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
+	/*
+	 * In interleaved mode, the driver uses one QMC channel for all audio
+	 * channels whereas in non-interleaved mode, it uses one QMC channel per
+	 * audio channel.
+	 */
+	nb_chans_used = qmc_audio_access_is_interleaved(params_access(params)) ?
+				1 : params_channels(params);
+
+	if (nb_chans_used > qmc_dai->nb_chans_avail) {
+		dev_err(dai->dev, "Not enough qmc_chans. Need %u, avail %u\n",
+			nb_chans_used, qmc_dai->nb_chans_avail);
+		return -EINVAL;
+	}
+
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
 		chan_param.mode = QMC_TRANSPARENT;
-		chan_param.transp.max_rx_buf_size = params_period_bytes(params);
-		ret = qmc_chan_set_param(qmc_dai->chan.qmc_chan, &chan_param);
-		if (ret) {
-			dev_err(dai->dev, "set param failed %d\n",
-				ret);
-			return ret;
+		chan_param.transp.max_rx_buf_size = params_period_bytes(params) / nb_chans_used;
+		for (i = 0; i < nb_chans_used; i++) {
+			ret = qmc_chan_set_param(qmc_dai->chans[i].qmc_chan, &chan_param);
+			if (ret) {
+				dev_err(dai->dev, "chans[%u], set param failed %d\n",
+					i, ret);
+				return ret;
+			}
 		}
+		qmc_dai->nb_chans_used_rx = nb_chans_used;
+	} else {
+		qmc_dai->nb_chans_used_tx = nb_chans_used;
 	}
 
 	return 0;
@@ -529,9 +659,12 @@ static int qmc_dai_hw_params(struct snd_pcm_substream *substream,
 static int qmc_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			   struct snd_soc_dai *dai)
 {
+	unsigned int nb_chans_used;
 	struct qmc_dai *qmc_dai;
+	unsigned int i;
 	int direction;
-	int ret;
+	int ret = 0;
+	int ret_tmp;
 
 	qmc_dai = qmc_dai_get_data(dai);
 	if (!qmc_dai) {
@@ -539,30 +672,50 @@ static int qmc_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		return -EINVAL;
 	}
 
-	direction = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
-		    QMC_CHAN_WRITE : QMC_CHAN_READ;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		direction = QMC_CHAN_WRITE;
+		nb_chans_used = qmc_dai->nb_chans_used_tx;
+	} else {
+		direction = QMC_CHAN_READ;
+		nb_chans_used = qmc_dai->nb_chans_used_rx;
+	}
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		ret = qmc_chan_start(qmc_dai->chan.qmc_chan, direction);
-		if (ret)
-			return ret;
+		for (i = 0; i < nb_chans_used; i++) {
+			ret = qmc_chan_start(qmc_dai->chans[i].qmc_chan, direction);
+			if (ret)
+				goto err_stop;
+		}
 		break;
 
 	case SNDRV_PCM_TRIGGER_STOP:
-		ret = qmc_chan_stop(qmc_dai->chan.qmc_chan, direction);
-		if (ret)
-			return ret;
-		ret = qmc_chan_reset(qmc_dai->chan.qmc_chan, direction);
+		/* Stop and reset all QMC channels and return the first error encountered */
+		for (i = 0; i < nb_chans_used; i++) {
+			ret_tmp = qmc_chan_stop(qmc_dai->chans[i].qmc_chan, direction);
+			if (!ret)
+				ret = ret_tmp;
+			if (ret_tmp)
+				continue;
+
+			ret_tmp = qmc_chan_reset(qmc_dai->chans[i].qmc_chan, direction);
+			if (!ret)
+				ret = ret_tmp;
+		}
 		if (ret)
 			return ret;
 		break;
 
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		ret = qmc_chan_stop(qmc_dai->chan.qmc_chan, direction);
+		/* Stop all QMC channels and return the first error encountered */
+		for (i = 0; i < nb_chans_used; i++) {
+			ret_tmp = qmc_chan_stop(qmc_dai->chans[i].qmc_chan, direction);
+			if (!ret)
+				ret = ret_tmp;
+		}
 		if (ret)
 			return ret;
 		break;
@@ -572,6 +725,13 @@ static int qmc_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	}
 
 	return 0;
+
+err_stop:
+	while (i--) {
+		qmc_chan_stop(qmc_dai->chans[i].qmc_chan, direction);
+		qmc_chan_reset(qmc_dai->chans[i].qmc_chan, direction);
+	}
+	return ret;
 }
 
 static const struct snd_soc_dai_ops qmc_dai_ops = {
@@ -580,7 +740,7 @@ static const struct snd_soc_dai_ops qmc_dai_ops = {
 	.hw_params	= qmc_dai_hw_params,
 };
 
-static u64 qmc_audio_formats(u8 nb_ts)
+static u64 qmc_audio_formats(u8 nb_ts, bool is_noninterleaved)
 {
 	unsigned int format_width;
 	unsigned int chan_width;
@@ -612,6 +772,13 @@ static u64 qmc_audio_formats(u8 nb_ts)
 		if (format_width > chan_width || chan_width % format_width)
 			continue;
 
+		/*
+		 * In non interleaved mode, we can only support formats that
+		 * can fit only 1 time in the channel
+		 */
+		if (is_noninterleaved && format_width != chan_width)
+			continue;
+
 		formats_mask |= pcm_format_to_bits(format);
 	}
 	return formats_mask;
@@ -622,6 +789,12 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
 			       struct snd_soc_dai_driver *qmc_soc_dai_driver)
 {
 	struct qmc_chan_info info;
+	unsigned long rx_fs_rate;
+	unsigned long tx_fs_rate;
+	unsigned int nb_tx_ts;
+	unsigned int nb_rx_ts;
+	unsigned int i;
+	int count;
 	u32 val;
 	int ret;
 
@@ -639,56 +812,105 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
 	if (!qmc_dai->name)
 		return -ENOMEM;
 
-	qmc_dai->chan.qmc_chan = devm_qmc_chan_get_byphandle(qmc_audio->dev, np,
-							     "fsl,qmc-chan");
-	if (IS_ERR(qmc_dai->chan.qmc_chan)) {
-		ret = PTR_ERR(qmc_dai->chan.qmc_chan);
-		return dev_err_probe(qmc_audio->dev, ret,
-				     "dai %d get QMC channel failed\n", qmc_dai->id);
-	}
+	count = qmc_chan_count_phandles(np, "fsl,qmc-chan");
+	if (count < 0)
+		return dev_err_probe(qmc_audio->dev, count,
+				     "dai %d get number of QMC channel failed\n", qmc_dai->id);
+	if (!count)
+		return dev_err_probe(qmc_audio->dev, -EINVAL,
+				     "dai %d no QMC channel defined\n", qmc_dai->id);
 
-	qmc_soc_dai_driver->id = qmc_dai->id;
-	qmc_soc_dai_driver->name = qmc_dai->name;
+	qmc_dai->chans = devm_kcalloc(qmc_audio->dev, count, sizeof(*qmc_dai->chans), GFP_KERNEL);
+	if (!qmc_dai->chans)
+		return -ENOMEM;
 
-	ret = qmc_chan_get_info(qmc_dai->chan.qmc_chan, &info);
-	if (ret) {
-		dev_err(qmc_audio->dev, "dai %d get QMC channel info failed %d\n",
-			qmc_dai->id, ret);
-		return ret;
-	}
-	dev_info(qmc_audio->dev, "dai %d QMC channel mode %d, nb_tx_ts %u, nb_rx_ts %u\n",
-		 qmc_dai->id, info.mode, info.nb_tx_ts, info.nb_rx_ts);
+	for (i = 0; i < count; i++) {
+		qmc_dai->chans[i].qmc_chan = devm_qmc_chan_get_byphandles_index(qmc_audio->dev, np,
+										"fsl,qmc-chan", i);
+		if (IS_ERR(qmc_dai->chans[i].qmc_chan)) {
+			return dev_err_probe(qmc_audio->dev, PTR_ERR(qmc_dai->chans[i].qmc_chan),
+					     "dai %d get QMC channel %d failed\n", qmc_dai->id, i);
+		}
 
-	if (info.mode != QMC_TRANSPARENT) {
-		dev_err(qmc_audio->dev, "dai %d QMC chan mode %d is not QMC_TRANSPARENT\n",
-			qmc_dai->id, info.mode);
-		return -EINVAL;
+		ret = qmc_chan_get_info(qmc_dai->chans[i].qmc_chan, &info);
+		if (ret) {
+			dev_err(qmc_audio->dev, "dai %d get QMC %d channel info failed %d\n",
+				qmc_dai->id, i, ret);
+			return ret;
+		}
+		dev_info(qmc_audio->dev, "dai %d QMC channel %d mode %d, nb_tx_ts %u, nb_rx_ts %u\n",
+			 qmc_dai->id, i, info.mode, info.nb_tx_ts, info.nb_rx_ts);
+
+		if (info.mode != QMC_TRANSPARENT) {
+			dev_err(qmc_audio->dev, "dai %d QMC chan %d mode %d is not QMC_TRANSPARENT\n",
+				qmc_dai->id, i, info.mode);
+			return -EINVAL;
+		}
+
+		/*
+		 * All channels must have the same number of Tx slots and the
+		 * same numbers of Rx slots.
+		 */
+		if (i == 0) {
+			nb_tx_ts = info.nb_tx_ts;
+			nb_rx_ts = info.nb_rx_ts;
+			tx_fs_rate = info.tx_fs_rate;
+			rx_fs_rate = info.rx_fs_rate;
+		} else {
+			if (nb_tx_ts != info.nb_tx_ts) {
+				dev_err(qmc_audio->dev, "dai %d QMC chan %d inconsistent number of Tx timeslots (%u instead of %u)\n",
+					qmc_dai->id, i, info.nb_tx_ts, nb_tx_ts);
+				return -EINVAL;
+			}
+			if (nb_rx_ts != info.nb_rx_ts) {
+				dev_err(qmc_audio->dev, "dai %d QMC chan %d inconsistent number of Rx timeslots (%u instead of %u)\n",
+					qmc_dai->id, i, info.nb_rx_ts, nb_rx_ts);
+				return -EINVAL;
+			}
+			if (tx_fs_rate != info.tx_fs_rate) {
+				dev_err(qmc_audio->dev, "dai %d QMC chan %d inconsistent Tx frame sample rate (%lu instead of %lu)\n",
+					qmc_dai->id, i, info.tx_fs_rate, tx_fs_rate);
+				return -EINVAL;
+			}
+			if (rx_fs_rate != info.rx_fs_rate) {
+				dev_err(qmc_audio->dev, "dai %d QMC chan %d inconsistent Rx frame sample rate (%lu instead of %lu)\n",
+					qmc_dai->id, i, info.rx_fs_rate, rx_fs_rate);
+				return -EINVAL;
+			}
+		}
 	}
-	qmc_dai->nb_tx_ts = info.nb_tx_ts;
-	qmc_dai->nb_rx_ts = info.nb_rx_ts;
+
+	qmc_dai->nb_chans_avail = count;
+	qmc_dai->nb_tx_ts = nb_tx_ts * count;
+	qmc_dai->nb_rx_ts = nb_rx_ts * count;
+
+	qmc_soc_dai_driver->id = qmc_dai->id;
+	qmc_soc_dai_driver->name = qmc_dai->name;
 
 	qmc_soc_dai_driver->playback.channels_min = 0;
 	qmc_soc_dai_driver->playback.channels_max = 0;
-	if (qmc_dai->nb_tx_ts) {
+	if (nb_tx_ts) {
 		qmc_soc_dai_driver->playback.channels_min = 1;
-		qmc_soc_dai_driver->playback.channels_max = qmc_dai->nb_tx_ts;
+		qmc_soc_dai_driver->playback.channels_max = count > 1 ? count : nb_tx_ts;
 	}
-	qmc_soc_dai_driver->playback.formats = qmc_audio_formats(qmc_dai->nb_tx_ts);
+	qmc_soc_dai_driver->playback.formats = qmc_audio_formats(nb_tx_ts,
+								 count > 1 ? true : false);
 
 	qmc_soc_dai_driver->capture.channels_min = 0;
 	qmc_soc_dai_driver->capture.channels_max = 0;
-	if (qmc_dai->nb_rx_ts) {
+	if (nb_rx_ts) {
 		qmc_soc_dai_driver->capture.channels_min = 1;
-		qmc_soc_dai_driver->capture.channels_max = qmc_dai->nb_rx_ts;
+		qmc_soc_dai_driver->capture.channels_max = count > 1 ? count : nb_rx_ts;
 	}
-	qmc_soc_dai_driver->capture.formats = qmc_audio_formats(qmc_dai->nb_rx_ts);
-
-	qmc_soc_dai_driver->playback.rates = snd_pcm_rate_to_rate_bit(info.tx_fs_rate);
-	qmc_soc_dai_driver->playback.rate_min = info.tx_fs_rate;
-	qmc_soc_dai_driver->playback.rate_max = info.tx_fs_rate;
-	qmc_soc_dai_driver->capture.rates = snd_pcm_rate_to_rate_bit(info.rx_fs_rate);
-	qmc_soc_dai_driver->capture.rate_min = info.rx_fs_rate;
-	qmc_soc_dai_driver->capture.rate_max = info.rx_fs_rate;
+	qmc_soc_dai_driver->capture.formats = qmc_audio_formats(nb_rx_ts,
+								count > 1 ? true : false);
+
+	qmc_soc_dai_driver->playback.rates = snd_pcm_rate_to_rate_bit(tx_fs_rate);
+	qmc_soc_dai_driver->playback.rate_min = tx_fs_rate;
+	qmc_soc_dai_driver->playback.rate_max = tx_fs_rate;
+	qmc_soc_dai_driver->capture.rates = snd_pcm_rate_to_rate_bit(rx_fs_rate);
+	qmc_soc_dai_driver->capture.rate_min = rx_fs_rate;
+	qmc_soc_dai_driver->capture.rate_max = rx_fs_rate;
 
 	qmc_soc_dai_driver->ops = &qmc_dai_ops;
 
-- 
2.45.0

