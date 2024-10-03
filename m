Return-Path: <linuxppc-dev+bounces-1746-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A03698EF14
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2024 14:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XK9kD2mpqz2xtp;
	Thu,  3 Oct 2024 22:20:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.199
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727958036;
	cv=none; b=IqYtABUBT29SNqDp0+Y23nB9QcPNz8gYK+IkhJkAFXp27nOGBze5xWl8mEu7UXNkLFT7ndFkSi5cw3HUMyMZIP5qQy1WMvGs6FX1ILsdjCZE9srRKEJc3I/2Yv5e7nd6wOMTm1iKUow+VXCRoP1JSJEiPBW7fw/6ZwmFLm4b86tHqLn21dZQEBfbeRNYz5RX7sR+/4s3clzxanajr6fVg2LYrNahhSmbEjmMvV+Bkn8g5fqX7H/MIxj2M07XdJhVRfiD+4MDhdUf2aCavHxvKSlQCt37xZ71d74vBRSAHsaNggh9FwPgTkH48b9gNCog7jn8VFnJhigyt9gz6iryPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727958036; c=relaxed/relaxed;
	bh=raONT/HDAF820rUPmdb9npjFE1C+hNrjJMaVhiZEuHE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U58XR2dibSRZ1CmGz4mh+0eBpwRRR0jIR/3MZY498cMLF1wLUjYsSj8cysydf3AWBtyyEyJKtYHZ4eKLP4s6Y7nfo+G5r0gHpAkewgBCoDX22rHkndcP+gqPj48XyYpSlEJnE4F1cATLcc2pggTebA09N8JOrFcbYVg/PHvamz/LFEBnQlWW+omAB0G/G5lqoNuXZ/xJbXbXzBkDhytbPaW/ME82yv9Zq+1ywK7xQr8vicaxa3rqRg2863MnK98Cf6JZ01tOJO2Rdtpw+G/E2/W/YKfuHmZ2WzriZpyyFkbyrEgbuvItw0Yx/8ZzMgoEy67ilvfpuSjWbTdJKs1Njw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=PPUl49i+; dkim-atps=neutral; spf=pass (client-ip=217.70.183.199; helo=relay9-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=PPUl49i+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.199; helo=relay9-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XK9kB3V0Vz2xsG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2024 22:20:30 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id BAF6CFF806;
	Thu,  3 Oct 2024 12:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727958026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=raONT/HDAF820rUPmdb9npjFE1C+hNrjJMaVhiZEuHE=;
	b=PPUl49i+7NL/QVvzTkv5oQjcPgshOGCSDxQagvw3DTLFvBv82BV+k54uuDBe9nbRcNXo2d
	hisqysF1sOJjfB89Oc06laVvprUi+zQ79MssBxBh5mQ95tYjNmTXtSRI2LSGiwE2oDhkW/
	kdxFYqYpzmsONGgzRKnNrlR5ybMbODq+1SpX1BcnXyG3QXee8h7Gy39CnJei4w4rKCveu7
	B2ND3URuDcfprMIGXuInRg80a4qcyDX+lCy9a08x5h9ZpiMe4+s5xk6QFAE50luGV2nr91
	jIkuY4AWaqvKiAjfZjvQKYJY83t53WvcWSXZqpyzERxATdI67lRGvzX9s5IIcQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH] ASoC: fsl: fsl_qmc_audio: Remove the logging when parsing channels
Date: Thu,  3 Oct 2024 14:20:15 +0200
Message-ID: <20241003122015.677681-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.46.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On each channel parsing, a log message is issued. This log message is
not needed and become annoying when many channels are used (up to 64
channel supported).

Simply remove this unneeded log message.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/fsl/fsl_qmc_audio.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index 8668abd35208..e257b8adafe0 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -838,8 +838,6 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
 				qmc_dai->id, i, ret);
 			return ret;
 		}
-		dev_info(qmc_audio->dev, "dai %d QMC channel %d mode %d, nb_tx_ts %u, nb_rx_ts %u\n",
-			 qmc_dai->id, i, info.mode, info.nb_tx_ts, info.nb_rx_ts);
 
 		if (info.mode != QMC_TRANSPARENT) {
 			dev_err(qmc_audio->dev, "dai %d QMC chan %d mode %d is not QMC_TRANSPARENT\n",
-- 
2.46.1


