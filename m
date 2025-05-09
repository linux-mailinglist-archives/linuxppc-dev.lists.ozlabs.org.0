Return-Path: <linuxppc-dev+bounces-8460-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8460DAB0CFF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 10:20:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zv24p4kwTz2yr6;
	Fri,  9 May 2025 18:20:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746778842;
	cv=none; b=NikYXwUSUNhvb4Kqi00eaSAN9kVdIR8Bti7XgsoL2Jqjf1fzmbIm2umOZm8rW8FELYC4LS+i0wnGbdWr67TB/nwgEaAoQLEtDQWszDoZYigOyFVrdf/bFOp/cfLqiCafGJWlmHBovr13O8whTDcVraWNPYRwIDInSdffjzESt2RXtvoHieUPPTsqz76gaeyTKqZqA04a9ALnvjOe8O21C+JClDNRF5+5/HE9nqnZ8Wnii/fNiFbANv7abPx8H8dy8VvT75IfDSiUYAjzdflGs0cpjspuZBPzat4urhNHH1YgfnSRC5MajP8gXwoP+zn9Q78T/tU1R3IAhM9pFRRV7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746778842; c=relaxed/relaxed;
	bh=DDErgOnlGEBdfv4c40tBkAC3r0zY+AuTKExK9F6oG9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZTZm9Sv2X8iqYEedwTSS7U2J186hn0qSQ/TQQ8C5tCKS5Ah9+izd5zMbbaDJZNGXvyDzOd/MiHEmp9p4GMWGYYV9gUqPPXSEUTCvyDIjMDM6rZCLn5t+I7iV31gXxHxgREl4R2bphq86jKKx854U0M833imFiUkxha9QZKUWsRm+U8P0hUHH2T1dTHmk8G3E9KQU6hfPJqu6c9y2/g9ITDGc7zTbwpUCmWnD6BjYvbkOUjdYvH76HwzQUNVv6AQ4ipAVdQMW53jssJ780D+POSfKzepFOLmwizWVkFPamWMkrwkF792JjHiO9WqaWatAGWKrsLl8MsUeaiYElbCz6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zv24n6j5kz2yqh
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 18:20:41 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Zv1N70gPNz9sTD;
	Fri,  9 May 2025 09:48:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l8my8DMb5sE0; Fri,  9 May 2025 09:48:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Zv1N64WlFz9sN6;
	Fri,  9 May 2025 09:48:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 95ABE8B768;
	Fri,  9 May 2025 09:48:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id P9tCJmusC6Op; Fri,  9 May 2025 09:48:54 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D45D98B776;
	Fri,  9 May 2025 09:48:53 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ASoC: fsl: fsl_qmc_audio: Only request completion on last channel
Date: Fri,  9 May 2025 09:48:45 +0200
Message-ID: <5cffeb220617584a5e4bc03067cc10e6cdcfc25e.1746776731.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <19aa9d8a84c8475c62c42ac886dad0980428c6c0.1746776731.git.christophe.leroy@csgroup.eu>
References: <19aa9d8a84c8475c62c42ac886dad0980428c6c0.1746776731.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746776925; l=10077; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=qS+6twvaRu/wygD2f1R3B2s7Jy+aBlACdx44l7A162I=; b=HxNlDFVk2OUnrusEPMihlzysfbr74DAToAOfpHgKMtivHXB/IWIzbMrLgEG8AjcMRXa9wmS9p 4N3S5Xx00LXAkVhOA0ILKxoGmaKrJ/TbDM+CpnVvH+NoebEYWqa2Iu4
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In non-interleaved mode, several QMC channels are used in sync.
More details can be found in commit 188d9cae5438 ("ASoC: fsl:
fsl_qmc_audio: Add support for non-interleaved mode.")
At the time being, an interrupt is requested on each channel to
perform capture/playback completion, allthough the completion is
really performed only once all channels have completed their work.

This leads to a lot more interrupts than really needed. Looking at
/proc/interrupts shows ~3800 interrupts per second when using
4 capture and 4 playback devices with 5ms periods while
only 1600 (200 x 4 + 200 x 4) periods are processed during one second.

The QMC channels work in sync, the one started first is the one
finishing first and the one started last is the one finishing last,
so when the last one finishes it is guaranteed that the other ones are
finished as well. Therefore, only request completion processing on the
last QMC channel.

On my board with the above exemple, on a kernel started with
'threadirqs' option, the QMC irq thread uses 16% CPU time with this
patch while it uses 26% CPU time without this patch.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 sound/soc/fsl/fsl_qmc_audio.c | 95 +++++++++--------------------------
 1 file changed, 24 insertions(+), 71 deletions(-)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index 5614a8b909ed..ecd614984b90 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -17,12 +17,6 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 
-struct qmc_dai_chan {
-	struct qmc_dai_prtd *prtd_tx;
-	struct qmc_dai_prtd *prtd_rx;
-	struct qmc_chan *qmc_chan;
-};
-
 struct qmc_dai {
 	char *name;
 	int id;
@@ -33,7 +27,7 @@ struct qmc_dai {
 	unsigned int nb_chans_avail;
 	unsigned int nb_chans_used_tx;
 	unsigned int nb_chans_used_rx;
-	struct qmc_dai_chan *chans;
+	struct qmc_chan **qmc_chans;
 };
 
 struct qmc_audio {
@@ -57,7 +51,6 @@ struct qmc_dai_prtd {
 	size_t ch_dma_offset;
 
 	unsigned int channels;
-	DECLARE_BITMAP(chans_pending, 64);
 	struct snd_pcm_substream *substream;
 };
 
@@ -126,17 +119,14 @@ static int qmc_audio_pcm_write_submit(struct qmc_dai_prtd *prtd)
 	int ret;
 
 	for (i = 0; i < prtd->channels; i++) {
-		bitmap_set(prtd->chans_pending, i, 1);
-
-		ret = qmc_chan_write_submit(prtd->qmc_dai->chans[i].qmc_chan,
+		ret = qmc_chan_write_submit(prtd->qmc_dai->qmc_chans[i],
 					    prtd->ch_dma_addr_current + i * prtd->ch_dma_offset,
 					    prtd->ch_dma_size,
-					    qmc_audio_pcm_write_complete,
-					    &prtd->qmc_dai->chans[i]);
+					    i == prtd->channels - 1 ? qmc_audio_pcm_write_complete :
+								      NULL, prtd);
 		if (ret) {
 			dev_err(prtd->qmc_dai->dev, "write_submit %u failed %d\n",
 				i, ret);
-			bitmap_clear(prtd->chans_pending, i, 1);
 			return ret;
 		}
 	}
@@ -146,20 +136,7 @@ static int qmc_audio_pcm_write_submit(struct qmc_dai_prtd *prtd)
 
 static void qmc_audio_pcm_write_complete(void *context)
 {
-	struct qmc_dai_chan *chan = context;
-	struct qmc_dai_prtd *prtd;
-
-	prtd = chan->prtd_tx;
-
-	/* Mark the current channel as completed */
-	bitmap_clear(prtd->chans_pending, chan - prtd->qmc_dai->chans, 1);
-
-	/*
-	 * All QMC channels involved must have completed their transfer before
-	 * submitting a new one.
-	 */
-	if (!bitmap_empty(prtd->chans_pending, 64))
-		return;
+	struct qmc_dai_prtd *prtd = context;
 
 	prtd->buffer_ended += prtd->period_size;
 	if (prtd->buffer_ended >= prtd->buffer_size)
@@ -182,17 +159,14 @@ static int qmc_audio_pcm_read_submit(struct qmc_dai_prtd *prtd)
 	int ret;
 
 	for (i = 0; i < prtd->channels; i++) {
-		bitmap_set(prtd->chans_pending, i, 1);
-
-		ret = qmc_chan_read_submit(prtd->qmc_dai->chans[i].qmc_chan,
+		ret = qmc_chan_read_submit(prtd->qmc_dai->qmc_chans[i],
 					   prtd->ch_dma_addr_current + i * prtd->ch_dma_offset,
 					   prtd->ch_dma_size,
-					   qmc_audio_pcm_read_complete,
-					   &prtd->qmc_dai->chans[i]);
+					   i == prtd->channels - 1 ? qmc_audio_pcm_read_complete :
+								     NULL, prtd);
 		if (ret) {
 			dev_err(prtd->qmc_dai->dev, "read_submit %u failed %d\n",
 				i, ret);
-			bitmap_clear(prtd->chans_pending, i, 1);
 			return ret;
 		}
 	}
@@ -202,26 +176,13 @@ static int qmc_audio_pcm_read_submit(struct qmc_dai_prtd *prtd)
 
 static void qmc_audio_pcm_read_complete(void *context, size_t length, unsigned int flags)
 {
-	struct qmc_dai_chan *chan = context;
-	struct qmc_dai_prtd *prtd;
-
-	prtd = chan->prtd_rx;
-
-	/* Mark the current channel as completed */
-	bitmap_clear(prtd->chans_pending, chan - prtd->qmc_dai->chans, 1);
+	struct qmc_dai_prtd *prtd = context;
 
 	if (length != prtd->ch_dma_size) {
 		dev_err(prtd->qmc_dai->dev, "read complete length = %zu, exp %zu\n",
 			length, prtd->ch_dma_size);
 	}
 
-	/*
-	 * All QMC channels involved must have completed their transfer before
-	 * submitting a new one.
-	 */
-	if (!bitmap_empty(prtd->chans_pending, 64))
-		return;
-
 	prtd->buffer_ended += prtd->period_size;
 	if (prtd->buffer_ended >= prtd->buffer_size)
 		prtd->buffer_ended = 0;
@@ -239,7 +200,6 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 				 struct snd_pcm_substream *substream, int cmd)
 {
 	struct qmc_dai_prtd *prtd = substream->runtime->private_data;
-	unsigned int i;
 	int ret;
 
 	if (!prtd->qmc_dai) {
@@ -249,14 +209,10 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
-		bitmap_zero(prtd->chans_pending, 64);
 		prtd->buffer_ended = 0;
 		prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			for (i = 0; i < prtd->channels; i++)
-				prtd->qmc_dai->chans[i].prtd_tx = prtd;
-
 			/* Submit first chunk ... */
 			ret = qmc_audio_pcm_write_submit(prtd);
 			if (ret)
@@ -272,9 +228,6 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 			if (ret)
 				return ret;
 		} else {
-			for (i = 0; i < prtd->channels; i++)
-				prtd->qmc_dai->chans[i].prtd_rx = prtd;
-
 			/* Submit first chunk ... */
 			ret = qmc_audio_pcm_read_submit(prtd);
 			if (ret)
@@ -644,9 +597,9 @@ static int qmc_dai_hw_params(struct snd_pcm_substream *substream,
 		chan_param.mode = QMC_TRANSPARENT;
 		chan_param.transp.max_rx_buf_size = params_period_bytes(params) / nb_chans_used;
 		for (i = 0; i < nb_chans_used; i++) {
-			ret = qmc_chan_set_param(qmc_dai->chans[i].qmc_chan, &chan_param);
+			ret = qmc_chan_set_param(qmc_dai->qmc_chans[i], &chan_param);
 			if (ret) {
-				dev_err(dai->dev, "chans[%u], set param failed %d\n",
+				dev_err(dai->dev, "qmc_chans[%u], set param failed %d\n",
 					i, ret);
 				return ret;
 			}
@@ -688,7 +641,7 @@ static int qmc_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		for (i = 0; i < nb_chans_used; i++) {
-			ret = qmc_chan_start(qmc_dai->chans[i].qmc_chan, direction);
+			ret = qmc_chan_start(qmc_dai->qmc_chans[i], direction);
 			if (ret)
 				goto err_stop;
 		}
@@ -697,13 +650,13 @@ static int qmc_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_STOP:
 		/* Stop and reset all QMC channels and return the first error encountered */
 		for (i = 0; i < nb_chans_used; i++) {
-			ret_tmp = qmc_chan_stop(qmc_dai->chans[i].qmc_chan, direction);
+			ret_tmp = qmc_chan_stop(qmc_dai->qmc_chans[i], direction);
 			if (!ret)
 				ret = ret_tmp;
 			if (ret_tmp)
 				continue;
 
-			ret_tmp = qmc_chan_reset(qmc_dai->chans[i].qmc_chan, direction);
+			ret_tmp = qmc_chan_reset(qmc_dai->qmc_chans[i], direction);
 			if (!ret)
 				ret = ret_tmp;
 		}
@@ -715,7 +668,7 @@ static int qmc_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		/* Stop all QMC channels and return the first error encountered */
 		for (i = 0; i < nb_chans_used; i++) {
-			ret_tmp = qmc_chan_stop(qmc_dai->chans[i].qmc_chan, direction);
+			ret_tmp = qmc_chan_stop(qmc_dai->qmc_chans[i], direction);
 			if (!ret)
 				ret = ret_tmp;
 		}
@@ -731,8 +684,8 @@ static int qmc_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 
 err_stop:
 	while (i--) {
-		qmc_chan_stop(qmc_dai->chans[i].qmc_chan, direction);
-		qmc_chan_reset(qmc_dai->chans[i].qmc_chan, direction);
+		qmc_chan_stop(qmc_dai->qmc_chans[i], direction);
+		qmc_chan_reset(qmc_dai->qmc_chans[i], direction);
 	}
 	return ret;
 }
@@ -823,19 +776,19 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
 		return dev_err_probe(qmc_audio->dev, -EINVAL,
 				     "dai %d no QMC channel defined\n", qmc_dai->id);
 
-	qmc_dai->chans = devm_kcalloc(qmc_audio->dev, count, sizeof(*qmc_dai->chans), GFP_KERNEL);
-	if (!qmc_dai->chans)
+	qmc_dai->qmc_chans = devm_kcalloc(qmc_audio->dev, count, sizeof(*qmc_dai->qmc_chans), GFP_KERNEL);
+	if (!qmc_dai->qmc_chans)
 		return -ENOMEM;
 
 	for (i = 0; i < count; i++) {
-		qmc_dai->chans[i].qmc_chan = devm_qmc_chan_get_byphandles_index(qmc_audio->dev, np,
-										"fsl,qmc-chan", i);
-		if (IS_ERR(qmc_dai->chans[i].qmc_chan)) {
-			return dev_err_probe(qmc_audio->dev, PTR_ERR(qmc_dai->chans[i].qmc_chan),
+		qmc_dai->qmc_chans[i] = devm_qmc_chan_get_byphandles_index(qmc_audio->dev, np,
+									   "fsl,qmc-chan", i);
+		if (IS_ERR(qmc_dai->qmc_chans[i])) {
+			return dev_err_probe(qmc_audio->dev, PTR_ERR(qmc_dai->qmc_chans[i]),
 					     "dai %d get QMC channel %d failed\n", qmc_dai->id, i);
 		}
 
-		ret = qmc_chan_get_info(qmc_dai->chans[i].qmc_chan, &info);
+		ret = qmc_chan_get_info(qmc_dai->qmc_chans[i], &info);
 		if (ret) {
 			dev_err(qmc_audio->dev, "dai %d get QMC %d channel info failed %d\n",
 				qmc_dai->id, i, ret);
-- 
2.47.0


