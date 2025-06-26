Return-Path: <linuxppc-dev+bounces-9808-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FF6AE9CDD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 13:52:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bScWC1hBcz30KY;
	Thu, 26 Jun 2025 21:52:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750938759;
	cv=none; b=LNPdWsHtJnHcm9DUp9rzQeoXQGDE6xhKRu+iCAelciygIzadr0qVrWHMAF7uWTw+h/bX9dPtjeeB8TJW3gd46hNqBRav0C1Zs7uBhjY5mVZuCLy7ngDM0E9Nf6Rco7l8HWoVqCG104e3yOOXXwtLhElN4xkkIV7ITXi6ZTQtruIlGYxvnCfuUskJW0UbCXduLsah0BGQGb/SFbcr+GE3QYncw/cZns6+QiFsEfmkeyn6mK+NlXy/E7m36yVgR/7HXA/ezs0nhRpQwkREpaqgDFRiqhohRoR6yq0xCZ8Lrlh2Z2X4yFW9dF/vwSNzJiK55FvykagqmQC12USf7Eb+HA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750938759; c=relaxed/relaxed;
	bh=D76ucE6r4U6GishIFwF0qlrah5XVDlhRiq5O7CVmMK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l7yvVLXhSAJg93UjEgQvTrIUT7Lsqg/PLiQ78NIdvglVKIkD+b5rvC7cifFLkAE3Wphnne0zk0BfCeZJT1GQd7TSDeM6WmR8LeF0qbkRZLnW42bRuI5Mk8J3w0ly5p3kcsfq1JqZNPqreRQnfOrMx297uXDyPd5KJoEN8/QXHTzse6fh2WLTH9NIsoExFhvUq7r8OqAnAeQZjAqA2A69ueIZwgTWsSlYkDGcvNp5tmmP3i2JOVXniDYwUb8k4vRAZmSVUUYYrwoJ3M/6EtsiB+Maubt42MsxaWWjvo++aJFyMQ+MOZ6zHBWsQ0cEVnMeOO+dl6hs1l2JjOx2bNd0NA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net; dkim=pass (2048-bit key; unprotected) header.d=arunraghavan.net header.i=@arunraghavan.net header.a=rsa-sha256 header.s=fm1 header.b=QkH2ScQe; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=n4jF9ECf; dkim-atps=neutral; spf=pass (client-ip=202.12.124.147; helo=fout-b4-smtp.messagingengine.com; envelope-from=arun@arunraghavan.net; receiver=lists.ozlabs.org) smtp.mailfrom=arunraghavan.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arunraghavan.net header.i=@arunraghavan.net header.a=rsa-sha256 header.s=fm1 header.b=QkH2ScQe;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=n4jF9ECf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arunraghavan.net (client-ip=202.12.124.147; helo=fout-b4-smtp.messagingengine.com; envelope-from=arun@arunraghavan.net; receiver=lists.ozlabs.org)
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bScWB4RFmz2xYl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 21:52:38 +1000 (AEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 7206F1D001A7;
	Thu, 26 Jun 2025 07:52:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 26 Jun 2025 07:52:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	arunraghavan.net; h=cc:cc:content-transfer-encoding:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm1; t=1750938756; x=
	1751025156; bh=D76ucE6r4U6GishIFwF0qlrah5XVDlhRiq5O7CVmMK4=; b=Q
	kH2ScQeY9TemKvzA4WHpb1jJ8BG2dseCerHmx31zFgB3yEedFEgZPqdql6j5U4It
	mlR0fVAwqNHylO/IBV7eYs6tGt2wcB8QvnqDNSofJtW3VSBe+jLIEeLWfPl40Dlw
	WXhvpebiW3VfzplDFppykeBISJBxJn2BN/1tabKZn0QCHVuv10UEGxB9NqwiFTcr
	8pnyxYUcYWFotsojwAl3b1cIaA72LHWuxhP9SlsFwAuiwhDrwALkIDsvGkGhAx4/
	5K4Pe5YB1Ta1DZXHZ6U7875R+gqJMboMLXP3w3pnurKbFnFQ3/4vyGxTYd1BrQ0N
	cwr2ckQtNIYXXW8JUG1ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1750938756; x=1751025156; bh=D76ucE6r4U6GishIFwF0qlrah5XVDlhRiq5
	O7CVmMK4=; b=n4jF9ECf6EkTSqo/wddtNtU3q6w2R3G/Hw5WJgg0WsAx4B3fp//
	CZ/Z5nndXscxYpMMqbl7TXOt38uCJ2R6AUG19YlNZBos+wIPCKvvWs1Ot7z6H0MM
	H9wkarbyBSPvA13lh6aiS/YxEibl1+IwLoUEd0F+Cx2h9L3chfh3rdTMEstfAoML
	Z8J4WY1HFhJ0NcIeEMgFSMTiAcf+pQaJIAhrAlKfPwdg/zai/bnIr4SjJwOFoXtk
	PC3dWweRE+8q5IMCBk6sHHfRtyTLDgjQeyqPc+HZOeHpYR5N7CaJf4rRv8jMSz8S
	yvb3ubfzikDg3NS36FzxSsBaq/sJ/n1yW4Q==
X-ME-Sender: <xms:gzRdaFxoc4Kt8em8TEOF9SBgQVUcFEcW3_lh4prOv47W7LGE0aRZuQ>
    <xme:gzRdaFQzrH_uuiH-XBEB8U_uj8uK6VqPDY4WkEPHI_DG2NPOPUz8oFA679OYqyT8z
    HW7hYWiEJw-g56Q6g>
X-ME-Received: <xmr:gzRdaPWqPzO7IyyzIAj13qZEPVkxKIkCv7ZjyRg2lqCI3G8_v6b312E_6POXDAvk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    fhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetrhhunhcutfgrghhhrghv
    rghnuceorghruhhnsegrrhhunhhrrghghhgrvhgrnhdrnhgvtheqnecuggftrfgrthhtvg
    hrnhepteduheelvedvledvudfhudevkefhhfeifefggeevkedvudfgueelvdehtdetvdef
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghruh
    hnsegrrhhunhhrrghghhgrvhgrnhdrnhgvthdpnhgspghrtghpthhtohepudefpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehshhgvnhhgjhhiuhdrfigrnhhgsehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepgihiuhgsohdrlhgvvgesghhmrghilhdrtghomhdprhgt
    phhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehnihgtoh
    hlvghothhsuhhkrgesghhmrghilhdrtghomhdprhgtphhtthhopehlghhirhgufihoohgu
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifigr
    ihesshhushgvrdgtohhmpdhrtghpthhtohepphdrtggrmhgvrhhlhihntghksehtvghlvg
    hvihgtrdgtohhm
X-ME-Proxy: <xmx:hDRdaHhUc1pAZjHaW9ixReOptq3kk6Ay4dDv0pAr14hmefVThJvq0g>
    <xmx:hDRdaHCL4ktOslRU0PokGQgLvbqPe3mzY5g7rkgJuz-uHLSzbUrHFA>
    <xmx:hDRdaAKb4gTiWcmTRgmAD-nvWdU1UYkXRwHmmpn_VM7fUGi1IpHNqQ>
    <xmx:hDRdaGBdNcBnGbR0Q4htHNFosMSMadeCVXpUO43mXd2n0Vmhxb_0KA>
    <xmx:hDRdaFS3yrc7xiYB0oLUqf7AgIvf1k__38E-Xw3zK1E0_dbjPCF09HYC>
Feedback-ID: i42c0435e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jun 2025 07:52:35 -0400 (EDT)
From: Arun Raghavan <arun@arunraghavan.net>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pieterjan Camerlynck <p.camerlynck@televic.com>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Arun Raghavan <arun@asymptotic.io>
Subject: [PATCH v3] ASoC: fsl_sai: Force a software reset when starting in consumer mode
Date: Thu, 26 Jun 2025 07:52:18 -0400
Message-ID: <20250626115218.141874-1-arun@arunraghavan.net>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Arun Raghavan <arun@asymptotic.io>

On an imx8mm platform with an external clock provider, when running the
receiver (arecord) and triggering an xrun with xrun_injection, we see a
channel swap/offset. This happens sometimes when running only the
receiver, but occurs reliably if a transmitter (aplay) is also
concurrently running.

It seems that the SAI loses track of frame sync during the trigger stop
-> trigger start cycle that occurs during an xrun. Doing just a FIFO
reset in this case does not suffice, and only a software reset seems to
get it back on track.

This looks like the same h/w bug that is already handled for the
producer case, so we now do the reset unconditionally on config disable.

Signed-off-by: Arun Raghavan <arun@asymptotic.io>
Reported-by: Pieterjan Camerlynck <p.camerlynck@televic.com>
---

v3
- Incorporate feedback from Shengjiu Wang to consolidate with the
  existing handling of this issue in producer mode

 sound/soc/fsl/fsl_sai.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index af1a168d35e3..50af6b725670 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -803,13 +803,15 @@ static void fsl_sai_config_disable(struct fsl_sai *sai, int dir)
 	 * anymore. Add software reset to fix this issue.
 	 * This is a hardware bug, and will be fix in the
 	 * next sai version.
+	 *
+	 * In consumer mode, this can happen even after a
+	 * single open/close, especially if both tx and rx
+	 * are running concurrently.
 	 */
-	if (!sai->is_consumer_mode[tx]) {
-		/* Software Reset */
-		regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_SR);
-		/* Clear SR bit to finish the reset */
-		regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
-	}
+	/* Software Reset */
+	regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_SR);
+	/* Clear SR bit to finish the reset */
+	regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
 }
 
 static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
-- 
2.49.0


