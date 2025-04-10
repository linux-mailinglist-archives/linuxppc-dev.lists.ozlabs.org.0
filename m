Return-Path: <linuxppc-dev+bounces-7566-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5516A83F1E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Apr 2025 11:42:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYFGY2HYtz3blk;
	Thu, 10 Apr 2025 19:42:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8:216:3eff:fe9d:e7b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744278149;
	cv=none; b=OsLMDzwxeBEmz4DQJasS6LGayzO9/YSAR+q9HCk8Er8hHAs0b789IH3o0G7SrIuP8BBtms/W04/HSXh3dycnqFCvgypShCgQEhAzY+Omo7OTDW3iOHA1gdjdfFezeyiGMXuiTViPhjokKp4JFodKySQPaVDP7Sl7AplxE+FeHNG4ZvRJFBjWvKHiAdGoMlCSPWF72NU6589A4ti4dasRzmDf2sbNf8JoC9WwpWjLLg+zIB02ZIeyVzNYDzO9F/ZXYdyVRs2a9VS/G2TP/pSlj4BGXHFoGhHijvBMJk/AJrlvvkDUAQYq5wtMXpSlM1OFoxUQ9W7+UmVJQ5/4SbS1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744278149; c=relaxed/relaxed;
	bh=RXfF9Y2cL7mQps/DxKXkwK8dk0p3899KyBTvvn4p4qo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A8Wy5dpxuf//l5rq6Qk9f5mnvhZgP6zw2vgaywMvn5e3Abwgn2t1oTb46oiBHSjPXfweCoNWYG/iw4wKWWmdg0Zl6fsCn+u3d8O3s7exoGeevgWj9lNjg23AOR6GoBPez7j6UF0zL37e0HmPDCRngURW4k1E3WoubhWj2fJozIJlCzXnlveD84tQmhGCfhAh7RzggKM/INh5X951IQNhPGPd4UAH/5JIOsREAKfknEQV7DA8lKkpgF16rQAWdhQdmBkewsjBnvdPSGXtsOTk2NV7En7LaO3TALiycwCn+OHwzczf1JXh4BEOlvKQH+7UxQ3m8bhdyFvHebrqKxDHVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=i6veY8PT; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=i6veY8PT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [IPv6:2001:4b98:dc4:8:216:3eff:fe9d:e7b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYFGW5Bg4z3blT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Apr 2025 19:42:27 +1000 (AEST)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 0165E583D5C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Apr 2025 09:17:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id B255443137;
	Thu, 10 Apr 2025 09:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744276611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RXfF9Y2cL7mQps/DxKXkwK8dk0p3899KyBTvvn4p4qo=;
	b=i6veY8PTN1LEUXtwSuGCybJctp3ofui6noGnAgCrwivJm7wnzEx4/nl/OWX21frLWAFICV
	UDmM25RlWSD8H7n4RQakUQ8m8hOIjrYTYvN9o1HnFW1BxrcSS4RxYaSzTtvh98fu88MnVq
	bSN9QUa+rQp7CauSazRquc+NGeYm3obSid6U5RfcS6Pcoc0OLuenkzr8eGPxypTb0vSg4h
	m7nQXa5daQvowErjxtL2HlRGzrk883ee/O4LvODlr+ZiAuUl0iSqP25v4DA/uYhjqrIdcu
	FC5qYX1WbyeDSbnnOUQ629Dgf4XIdN5J+APuvKaDFe3VCs+wm5U69rVh2QJoVw==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: fsl: fsl_qmc_audio: Reset audio data pointers on TRIGGER_START event
Date: Thu, 10 Apr 2025 11:16:43 +0200
Message-ID: <20250410091643.535627-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekhedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeetkeffjedvieffteeugeetueevteduieekvdevgfeugefhveetleduheekgffgnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduhedprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehshhgvnhhgjhhiuhdrfigrnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepighiuhgsohdrnfgvvgesghhmrghilhdrtghomhdprhgtphhtthhopehfv
 ghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehnihgtohhlvghothhsuhhkrgesghhmrghilhdrtghomhdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgii
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On SNDRV_PCM_TRIGGER_START event, audio data pointers are not reset.

This leads to wrong data buffer usage when multiple TRIGGER_START are
received and ends to incorrect buffer usage between the user-space and
the driver. Indeed, the driver can read data that are not already set by
the user-space or the user-space and the driver are writing and reading
the same area.

Fix that resetting data pointers on each SNDRV_PCM_TRIGGER_START events.

Fixes: 075c7125b11c ("ASoC: fsl: Add support for QMC audio")
Cc: stable@vger.kernel.org
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/fsl/fsl_qmc_audio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index b2979290c973..5614a8b909ed 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -250,6 +250,9 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		bitmap_zero(prtd->chans_pending, 64);
+		prtd->buffer_ended = 0;
+		prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
+
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 			for (i = 0; i < prtd->channels; i++)
 				prtd->qmc_dai->chans[i].prtd_tx = prtd;
-- 
2.49.0


