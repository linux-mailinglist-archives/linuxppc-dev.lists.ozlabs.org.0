Return-Path: <linuxppc-dev+bounces-11086-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 511EDB2A0C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 13:50:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c59yN6pYlz3cYd;
	Mon, 18 Aug 2025 21:50:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755517836;
	cv=none; b=OSYYeiaFK94B3+Ey6f6veZrhgd+dmUFtjN50CEONgb55iMs/FVerd3r9+dVdX4c+cOJKurLg4Ai4Wm2ypCzBbPj8H++cAHRMQR7iSb60NT1xtPbRY18x8skapoRGBLi5DuTcvjkrUdvZKo+yNVSTHuk5NQ/rG+T6l5NxmCSuBa30uqB2jwFzmtKp+AKdc/vuVkw53EUR7q9zOlxNzFMr/bf1N1wgdbtPTOF28Rg4PKOqt4Vi7F8e6vY27ii249KzDGV/dEehdOtc/96Duu92dwmZ9ziNzUHUMe8/nUsOKGMV6m8m5Vl2RcqmLMkzX55rg/2EblusawtYjv8Ct33S/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755517836; c=relaxed/relaxed;
	bh=xwj4sCJ/eZcv2C3ZOrPPfezifvmWxjVjQdzGCZMZDu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nx2Srek33ouE51i+7SOh/lvhHeUoJIxyD0sjkunGxSCzkSrR0N9ISTZ4PjmltmWsU38fqIkWwZ3n2wC7dlEtKaNNgIRwKS4SsjPRBULBCJ68f8bV3np2Jf5SRk3CRYc/+Ntx4XhiLY0nSZsI0HN0B9rWAqvwO/7EEmxVoIsvSQZC+EfC7twMVW8c3CvT4h1/h5thfxupROlgVik56qUrH0rhAgq2oex1chQiCg2VD5CG+DwO3aPAE1j4vnN5dGJ+gTmjl/Y+0VHITCJfD7vlDECeZ+PaYCPLIYqqz+2immUZLwJfVyVzmnrUrN978YvEYAJp7ehdzy3buwQYXBMz8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c59yN0wqRz3cYR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 21:50:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55HW2lrvz9sWD;
	Mon, 18 Aug 2025 10:20:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lm2-x3VqRKpO; Mon, 18 Aug 2025 10:20:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55HS5GJqz9sWB;
	Mon, 18 Aug 2025 10:20:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D7048B765;
	Mon, 18 Aug 2025 10:20:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id sXvKLLQEmvwu; Mon, 18 Aug 2025 10:20:04 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6713D8B764;
	Mon, 18 Aug 2025 10:20:04 +0200 (CEST)
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
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v3 3/4] ASoC: fsl: fsl_qmc_audio: Only request completion on last channel
Date: Mon, 18 Aug 2025 10:20:02 +0200
Message-ID: <2684693bdea6a31a0e8d1ef2af6d534b7fa97044.1755504428.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1755504428.git.christophe.leroy@csgroup.eu>
References: <cover.1755504428.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755505199; l=4994; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=LtGMMyc9XKRicdulQjD8tGFVx/BvLiQjDfeh4aHdKJc=; b=/aq0V28neDnaGuCyCxuNMZqphvYCXrD2+CswoU8Wzj27y2FboMgQ8+CZlMDfxKyr4gJTTLJ0y 3aQNnJHYyAZBAgrvrvpA39O/09PRPDvhGpy1rQd9r6qi4LTXxrGdbnN
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
finished as well. Therefore only request completion processing on the
last QMC channel.

On my board with the above exemple, on a kernel started with
'threadirqs' option, the QMC irq thread uses 16% CPU time with this
patch while it uses 26% CPU time without this patch.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/fsl/fsl_qmc_audio.c | 46 +++++------------------------------
 1 file changed, 6 insertions(+), 40 deletions(-)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index c0c7ef0a1511..2790953543c5 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -57,7 +57,6 @@ struct qmc_dai_prtd {
 	size_t ch_dma_offset;
 
 	unsigned int channels;
-	DECLARE_BITMAP(chans_pending, 64);
 	struct snd_pcm_substream *substream;
 };
 
@@ -126,17 +125,14 @@ static int qmc_audio_pcm_write_submit(struct qmc_dai_prtd *prtd)
 	int ret;
 
 	for (i = 0; i < prtd->channels; i++) {
-		bitmap_set(prtd->chans_pending, i, 1);
-
 		ret = qmc_chan_write_submit(prtd->qmc_dai->chans[i].qmc_chan,
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
@@ -146,20 +142,7 @@ static int qmc_audio_pcm_write_submit(struct qmc_dai_prtd *prtd)
 
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
@@ -182,17 +165,14 @@ static int qmc_audio_pcm_read_submit(struct qmc_dai_prtd *prtd)
 	int ret;
 
 	for (i = 0; i < prtd->channels; i++) {
-		bitmap_set(prtd->chans_pending, i, 1);
-
 		ret = qmc_chan_read_submit(prtd->qmc_dai->chans[i].qmc_chan,
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
@@ -202,26 +182,13 @@ static int qmc_audio_pcm_read_submit(struct qmc_dai_prtd *prtd)
 
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
@@ -249,7 +216,6 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
-		bitmap_zero(prtd->chans_pending, 64);
 		prtd->buffer_ended = 0;
 		prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
-- 
2.49.0


