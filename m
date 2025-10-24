Return-Path: <linuxppc-dev+bounces-13300-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0C4C08F51
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Oct 2025 13:07:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctxnj5bjkz3bW7;
	Sat, 25 Oct 2025 22:07:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a02:9e0:8000::40"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761326070;
	cv=none; b=IKW4hyJK4L9Ij3h+auhGewgVfBTlKk4mmtLv//DKx1yUYqanU4C47dKqLOPZoRT3kvDqnJsEDMl4AvE0mJHuz96XH5H/xKQRzJB9Zj36Jww1qe3ewkO9NQxNGae5t0rWdD0TPU2pNJPkblcCIlwToh15zU/juzzRLMQHeI5/IWK01oezhmtgm4WkbZTEs69ne+LoNd4QXuCYocXEmgMDScChUJXoWFF/t1ArSr9QusGP1BD58qc65gEEL5WG+6ieIlhVee5bN7pzj9uh90efNw747Cm3lBvkB663tKaSXU9/jKf05/OOyyXm8hjKE5gXAeuPx83nwhjZ4ZuFdsAEsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761326070; c=relaxed/relaxed;
	bh=C48gu7NXP8y9dk94tbYBWS5GwTbZ0M7NmzNqhOYrSd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TA258Qrwn1fg5CJUNcSQXaKtuVwIpiFsXs/CXFJjBD6ooRsKq5pFsiOl9eq30t+DqAdTpUwjSk/f+zVKA21MmXYI55zZA+lywjwyCvnnV1ZIFUyKVbIXU47wwDm9rPLNXUPnt9/007pjFl8p/RsF7Dy+2hW8vWaETdNt6tEI3suuZdyKT3uKB9kfPVzm1ROmcqrB0u9quLRFTtA05mGzus14jBms6O80n6jDHDDxBX3c0Kqe4J/HGfzyu+aZ7Ngkmo8ymgaIElZWaFAuWtW7QwLOMPzINSvTQVldJLQuyJSzWdd947maOJWwjbRjrNzRdsnxVVEa/SrwjYhYpgxGBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=zanders.be; dkim=pass (2048-bit key; secure) header.d=zanders.be header.i=@zanders.be header.a=rsa-sha256 header.s=202002 header.b=KjvhtKgE; dkim-atps=neutral; spf=pass (client-ip=2a02:9e0:8000::40; helo=smtp28.bhosted.nl; envelope-from=maarten@zanders.be; receiver=lists.ozlabs.org) smtp.mailfrom=zanders.be
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=zanders.be
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=zanders.be header.i=@zanders.be header.a=rsa-sha256 header.s=202002 header.b=KjvhtKgE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zanders.be (client-ip=2a02:9e0:8000::40; helo=smtp28.bhosted.nl; envelope-from=maarten@zanders.be; receiver=lists.ozlabs.org)
X-Greylist: delayed 11712 seconds by postgrey-1.37 at boromir; Sat, 25 Oct 2025 04:14:27 AEDT
Received: from smtp28.bhosted.nl (smtp28.bhosted.nl [IPv6:2a02:9e0:8000::40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctTz74cknz30N8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 04:14:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zanders.be; s=202002;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=C48gu7NXP8y9dk94tbYBWS5GwTbZ0M7NmzNqhOYrSd4=;
	b=KjvhtKgExdpcHYFilqCL/n3gSrBhfxpmDPuL5KhQYQniH2SckHkfQfl0G0TdKrdljobuZ0t4/oKn3
	 zlxgX3bOVmPGQt//fSkWkHAfUQ3CHEitL+D63lQY6oor3b8A0uUbOEo2bItFey7M++/SyRGJeDCriF
	 WoeVMY0l1T8+ZEqU7WgjI3f9ptb1/n3ZLyl7oVueLdzpSod1HXJBeN7Stro84l3y89obs40vbrhXkn
	 7iWeq/JoBPjAy0lMTSvIR7DrCKEVpAPzr+LBThbF2im/t2isyYzwG1mna5IBN1oDKuNdx/B5FAsNio
	 MIbhsdVGxyjODj/30hd2vQouQIs58/w==
X-MSG-ID: 75dfb013-b0e1-11f0-bf45-0050568164d1
From: Maarten Zanders <maarten@zanders.be>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zidan Wang <zidan.wang@freescale.com>
Cc: Maarten Zanders <maarten@zanders.be>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_sai: Fix sync error in consumer mode
Date: Fri, 24 Oct 2025 15:57:15 +0200
Message-ID: <20251024135716.584265-1-maarten@zanders.be>
X-Mailer: git-send-email 2.51.0
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.9 required=3.0 tests=DATE_IN_PAST_03_06,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When configured for default synchronisation (Rx syncs to Tx) and the
SAI operates in consumer mode (clocks provided externally to Tx), a
synchronisation error occurs on Tx on the first attempt after device
initialisation when the playback stream is started while a capture
stream is already active. This results in channel shift/swap on the
playback stream.
Subsequent streams (ie after that first failing one) always work
correctly, no matter the order, with or without the other stream active.

This issue was observed (and fix tested) on an i.MX6UL board connected
to an ADAU1761 codec, where the codec provides both frame and bit clock
(connected to TX pins).

To fix this, always initialize the 'other' xCR4 and xCR5 registers when
we're starting a stream which is synced to the opposite one, irregardless
of the producer/consumer status.

Fixes: 51659ca069ce ("ASoC: fsl-sai: set xCR4/xCR5/xMR for SAI master mode")

Signed-off-by: Maarten Zanders <maarten@zanders.be>
---
 sound/soc/fsl/fsl_sai.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 757e7868e322..178a6e8fbe2c 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -653,12 +653,12 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 		val_cr4 |= FSL_SAI_CR4_CHMOD;
 
 	/*
-	 * For SAI provider mode, when Tx(Rx) sync with Rx(Tx) clock, Rx(Tx) will
-	 * generate bclk and frame clock for Tx(Rx), we should set RCR4(TCR4),
-	 * RCR5(TCR5) for playback(capture), or there will be sync error.
+	 * When Tx(Rx) sync with Rx(Tx) clock, Rx(Tx) will provide bclk and
+	 * frame clock for Tx(Rx). We should set RCR4(TCR4), RCR5(TCR5)
+	 * for playback(capture), or there will be sync error.
 	 */
 
-	if (!sai->is_consumer_mode[tx] && fsl_sai_dir_is_synced(sai, adir)) {
+	if (fsl_sai_dir_is_synced(sai, adir)) {
 		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(!tx, ofs),
 				   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK |
 				   FSL_SAI_CR4_CHMOD_MASK,
-- 
2.51.0


