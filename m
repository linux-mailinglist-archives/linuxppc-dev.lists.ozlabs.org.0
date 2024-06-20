Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5C890FFC3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 11:00:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=JMOTMWHl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4ZG92Xwwz3cLl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 19:00:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=JMOTMWHl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4ZF82pBlz30Vp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 18:59:55 +1000 (AEST)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 540F0C4783
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 08:43:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 240FB2000A;
	Thu, 20 Jun 2024 08:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718872997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XcZoHw1OxV6TsmAdg+08k1YhnLc5NmNZMePFnQJFI74=;
	b=JMOTMWHljpjCiEnj20gVflZbP5I0/oA0m5LI7Peo2g6KnbKgJM+tpDzkfM60wiK006X4rD
	fdJ+B7kHZfNdZ1wTM9N+lqNE0kDbAjNf7LysqWif9DsZBNhinrBuS5CUowXI5Dcg/pRLAs
	reYJFaKbfMDOSThnKTcGOB0PageUCGNZZXa2g9rAmdAt9+N5wIRGOYOkZJ1PETHJz3OJ2x
	qvVBt66rDKhQwnn0/bwwJ4qtm02pn5w51tXQQ9gyujkTyHeeWJ0BEqHIZi2CYAaPTwFMEQ
	zBMSXhdRBYeowrpIqM4FpapoCbb++LQHx6r8bgAie559o0HfGxskJl3NQnzICQ==
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
Subject: [PATCH 06/10] ASoC: fsl: fsl_qmc_audio: Introduce qmc_dai_constraints_interleaved()
Date: Thu, 20 Jun 2024 10:42:53 +0200
Message-ID: <20240620084300.397853-7-herve.codina@bootlin.com>
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

Constraints are set by qmc_dai_startup(). These constraints are specific
to the interleaved mode.

With the future introduction of support for non-interleaved mode, a new
set of constraints will be set. To make the code clear and keep
qmc_dai_startup() simple, extract the current interleaved mode
constraints settings to a specific function.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/fsl/fsl_qmc_audio.c | 37 +++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index 36145f1ddbf1..f70c6c8eec4a 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -436,24 +436,14 @@ static int qmc_dai_hw_rule_capture_format_by_channels(struct snd_pcm_hw_params *
 	return qmc_dai_hw_rule_format_by_channels(qmc_dai, params, qmc_dai->nb_rx_ts);
 }
 
-static int qmc_dai_startup(struct snd_pcm_substream *substream,
-			   struct snd_soc_dai *dai)
+static int qmc_dai_constraints_interleaved(struct snd_pcm_substream *substream,
+					   struct qmc_dai *qmc_dai)
 {
-	struct qmc_dai_prtd *prtd = substream->runtime->private_data;
 	snd_pcm_hw_rule_func_t hw_rule_channels_by_format;
 	snd_pcm_hw_rule_func_t hw_rule_format_by_channels;
-	struct qmc_dai *qmc_dai;
 	unsigned int frame_bits;
 	int ret;
 
-	qmc_dai = qmc_dai_get_data(dai);
-	if (!qmc_dai) {
-		dev_err(dai->dev, "Invalid dai\n");
-		return -EINVAL;
-	}
-
-	prtd->qmc_dai = qmc_dai;
-
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
 		hw_rule_channels_by_format = qmc_dai_hw_rule_capture_channels_by_format;
 		hw_rule_format_by_channels = qmc_dai_hw_rule_capture_format_by_channels;
@@ -468,7 +458,7 @@ static int qmc_dai_startup(struct snd_pcm_substream *substream,
 				  hw_rule_channels_by_format, qmc_dai,
 				  SNDRV_PCM_HW_PARAM_FORMAT, -1);
 	if (ret) {
-		dev_err(dai->dev, "Failed to add channels rule (%d)\n", ret);
+		dev_err(qmc_dai->dev, "Failed to add channels rule (%d)\n", ret);
 		return ret;
 	}
 
@@ -476,7 +466,7 @@ static int qmc_dai_startup(struct snd_pcm_substream *substream,
 				  hw_rule_format_by_channels, qmc_dai,
 				  SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 	if (ret) {
-		dev_err(dai->dev, "Failed to add format rule (%d)\n", ret);
+		dev_err(qmc_dai->dev, "Failed to add format rule (%d)\n", ret);
 		return ret;
 	}
 
@@ -484,13 +474,30 @@ static int qmc_dai_startup(struct snd_pcm_substream *substream,
 					   SNDRV_PCM_HW_PARAM_FRAME_BITS,
 					   frame_bits);
 	if (ret < 0) {
-		dev_err(dai->dev, "Failed to add frame_bits constraint (%d)\n", ret);
+		dev_err(qmc_dai->dev, "Failed to add frame_bits constraint (%d)\n", ret);
 		return ret;
 	}
 
 	return 0;
 }
 
+static int qmc_dai_startup(struct snd_pcm_substream *substream,
+			   struct snd_soc_dai *dai)
+{
+	struct qmc_dai_prtd *prtd = substream->runtime->private_data;
+	struct qmc_dai *qmc_dai;
+
+	qmc_dai = qmc_dai_get_data(dai);
+	if (!qmc_dai) {
+		dev_err(dai->dev, "Invalid dai\n");
+		return -EINVAL;
+	}
+
+	prtd->qmc_dai = qmc_dai;
+
+	return qmc_dai_constraints_interleaved(substream, qmc_dai);
+}
+
 static int qmc_dai_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params,
 			     struct snd_soc_dai *dai)
-- 
2.45.0

