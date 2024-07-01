Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1754891DE25
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 13:35:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=IC5jzmz3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCPB26SlMz3cTw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 21:35:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=IC5jzmz3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCP5Y2dlqz3cF6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 21:32:01 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 205FF24000A;
	Mon,  1 Jul 2024 11:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719833518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/jcw3B7br9mMf7ih+RGvbztJQGfoFsNFtd4Dmae4m5o=;
	b=IC5jzmz3RVMVKUDvfu2V+XY4gJ+VHN6WFRD8L1onHskN2e69nRp7IeJEgXosa6zV1QNFxs
	zV59lemE1n19UnDiU/okAXlc69cTrM8bVVX50Rsjk+xsNww3u8LFC1Lkt/cgHjKddn3Ypw
	fX5OXOELddg8RQOVke87B1O+lFsWJMt6YI5DsztR3UBqXpEuwwcce/eKLkDFYkRfhCucys
	niF7SwR7wVERwg7MQ/5erLs6/tRk+tgG2cwqMmyjXZ0Ntu88AuvL3vTeNH1Itfpjhbzct/
	c6eF2AcA3bZT9tnwAdbnYgL5+kQllm3lqYy81VtTzTYd85qFkUajhWjEmC9/6w==
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
Subject: [PATCH v2 05/10] ASoC: fsl: fsl_qmc_audio: Introduce qmc_audio_pcm_{read,write}_submit()
Date: Mon,  1 Jul 2024 13:30:32 +0200
Message-ID: <20240701113038.55144-6-herve.codina@bootlin.com>
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

Submitting data to QMC channels is done in several places: transfer
completions and DAI start. The operation done is simple and consist in
one function call.

With the future introduction of support for non-interleaved mode,
submitting data will be more complex.

To avoid copy/paste of code in several places, introduce
qmc_audio_pcm_{read,write}_submit() whose goal is to handle this
data submission.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/fsl/fsl_qmc_audio.c | 93 +++++++++++++++++------------------
 1 file changed, 45 insertions(+), 48 deletions(-)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index b07770257bad..36145f1ddbf1 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -90,11 +90,29 @@ static int qmc_audio_pcm_hw_params(struct snd_soc_component *component,
 	return 0;
 }
 
+static void qmc_audio_pcm_write_complete(void *context);
+
+static int qmc_audio_pcm_write_submit(struct qmc_dai_prtd *prtd)
+{
+	int ret;
+
+	ret = qmc_chan_write_submit(prtd->qmc_dai->chan.qmc_chan,
+				    prtd->ch_dma_addr_current, prtd->ch_dma_size,
+				    qmc_audio_pcm_write_complete,
+				    &prtd->qmc_dai->chan);
+	if (ret) {
+		dev_err(prtd->qmc_dai->dev, "write_submit failed %d\n",
+			ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static void qmc_audio_pcm_write_complete(void *context)
 {
 	struct qmc_dai_chan *chan = context;
 	struct qmc_dai_prtd *prtd;
-	int ret;
 
 	prtd = chan->prtd_tx;
 
@@ -106,23 +124,33 @@ static void qmc_audio_pcm_write_complete(void *context)
 	if (prtd->ch_dma_addr_current >= prtd->ch_dma_addr_end)
 		prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
-	ret = qmc_chan_write_submit(prtd->qmc_dai->chan.qmc_chan,
-				    prtd->ch_dma_addr_current, prtd->ch_dma_size,
-				    qmc_audio_pcm_write_complete,
-				    &prtd->qmc_dai->chan);
+	qmc_audio_pcm_write_submit(prtd);
+
+	snd_pcm_period_elapsed(prtd->substream);
+}
+
+static void qmc_audio_pcm_read_complete(void *context, size_t length, unsigned int flags);
+
+static int qmc_audio_pcm_read_submit(struct qmc_dai_prtd *prtd)
+{
+	int ret;
+
+	ret = qmc_chan_read_submit(prtd->qmc_dai->chan.qmc_chan,
+				   prtd->ch_dma_addr_current, prtd->ch_dma_size,
+				   qmc_audio_pcm_read_complete,
+				   &prtd->qmc_dai->chan);
 	if (ret) {
-		dev_err(prtd->qmc_dai->dev, "write_submit failed %d\n",
+		dev_err(prtd->qmc_dai->dev, "read_submit failed %d\n",
 			ret);
 	}
 
-	snd_pcm_period_elapsed(prtd->substream);
+	return 0;
 }
 
 static void qmc_audio_pcm_read_complete(void *context, size_t length, unsigned int flags)
 {
 	struct qmc_dai_chan *chan = context;
 	struct qmc_dai_prtd *prtd;
-	int ret;
 
 	prtd = chan->prtd_rx;
 
@@ -139,14 +167,7 @@ static void qmc_audio_pcm_read_complete(void *context, size_t length, unsigned i
 	if (prtd->ch_dma_addr_current >= prtd->ch_dma_addr_end)
 		prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
-	ret = qmc_chan_read_submit(prtd->qmc_dai->chan.qmc_chan,
-				   prtd->ch_dma_addr_current, prtd->ch_dma_size,
-				   qmc_audio_pcm_read_complete,
-				   &prtd->qmc_dai->chan);
-	if (ret) {
-		dev_err(prtd->qmc_dai->dev, "read_submit failed %d\n",
-			ret);
-	}
+	qmc_audio_pcm_read_submit(prtd);
 
 	snd_pcm_period_elapsed(prtd->substream);
 }
@@ -168,15 +189,9 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 			prtd->qmc_dai->chan.prtd_tx = prtd;
 
 			/* Submit first chunk ... */
-			ret = qmc_chan_write_submit(prtd->qmc_dai->chan.qmc_chan,
-						    prtd->ch_dma_addr_current, prtd->ch_dma_size,
-						    qmc_audio_pcm_write_complete,
-						    &prtd->qmc_dai->chan);
-			if (ret) {
-				dev_err(component->dev, "write_submit failed %d\n",
-					ret);
+			ret = qmc_audio_pcm_write_submit(prtd);
+			if (ret)
 				return ret;
-			}
 
 			/* ... prepare next one ... */
 			prtd->ch_dma_addr_current += prtd->ch_dma_size;
@@ -184,28 +199,16 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 				prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
 			/* ... and send it */
-			ret = qmc_chan_write_submit(prtd->qmc_dai->chan.qmc_chan,
-						    prtd->ch_dma_addr_current, prtd->ch_dma_size,
-						    qmc_audio_pcm_write_complete,
-						    &prtd->qmc_dai->chan);
-			if (ret) {
-				dev_err(component->dev, "write_submit failed %d\n",
-					ret);
+			ret = qmc_audio_pcm_write_submit(prtd);
+			if (ret)
 				return ret;
-			}
 		} else {
 			prtd->qmc_dai->chan.prtd_rx = prtd;
 
 			/* Submit first chunk ... */
-			ret = qmc_chan_read_submit(prtd->qmc_dai->chan.qmc_chan,
-						   prtd->ch_dma_addr_current, prtd->ch_dma_size,
-						   qmc_audio_pcm_read_complete,
-						   &prtd->qmc_dai->chan);
-			if (ret) {
-				dev_err(component->dev, "read_submit failed %d\n",
-					ret);
+			ret = qmc_audio_pcm_read_submit(prtd);
+			if (ret)
 				return ret;
-			}
 
 			/* ... prepare next one ... */
 			prtd->ch_dma_addr_current += prtd->ch_dma_size;
@@ -213,15 +216,9 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 				prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
 			/* ... and send it */
-			ret = qmc_chan_read_submit(prtd->qmc_dai->chan.qmc_chan,
-						   prtd->ch_dma_addr_current, prtd->ch_dma_size,
-						   qmc_audio_pcm_read_complete,
-						   &prtd->qmc_dai->chan);
-			if (ret) {
-				dev_err(component->dev, "write_submit failed %d\n",
-					ret);
+			ret = qmc_audio_pcm_read_submit(prtd);
+			if (ret)
 				return ret;
-			}
 		}
 		break;
 
-- 
2.45.0

