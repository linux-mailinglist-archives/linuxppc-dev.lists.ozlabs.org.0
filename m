Return-Path: <linuxppc-dev+bounces-9812-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96600AE9E3E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 15:09:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSfCR6zs2z2xYl;
	Thu, 26 Jun 2025 23:09:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750943347;
	cv=none; b=PSFkvlcJSVUojhlTNMLglSrSuX3zSdADS/aHmmkYwX3mql8kWZr3zuVkEPOk6go1qnMedRhxiKKosncNShUBfFzIq+I3YPBND31ox23+BFmpKihLbwB5zZYRwlPjTLzfiBalDy6wir1GG/eSA6DMCi0lWHaZuBjpNC3pbiCekbi3x4ArJPJtvxoR0A0+wkiAeAXX/BSlF8wGAkwCXz7wwdxBoNEI98gW9NpAGnHpggKnGZefxGdS6xc3QnJP1XTgXMAE3XFE7ZjhjM45iOG4633SPG30l6s8iiN+jLdh8US7DAn6c9b9AQ1QY4rfKLEO63WMZgnZMHRoe7RaXqj1hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750943347; c=relaxed/relaxed;
	bh=3TR8c1XlSAHzq5ql4c7mGOadV5LanrZWk1R0NaowOXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jetOcw/XAbecVRqQQPVNaxTLGqQkTItoTPPC64dzAcelt1pI63g8QNxnunvyu68NtB/pPn2MbdqPDXbnfdP8DZHmTN4xC3ev5J/mKKJrqIc2N95tpxIZpNA1+X0exWv913Mz/GFUyW0XUdLzemaDFglkvGeL6GTmCe11d2MxLGil5f83Dk/PnKieOaQtvTXRi9/OKQfuGkn3FySZXPaUllRaX4p7EIj5PWhslpPDq61htwZsrW9bmZ+B/ktJqLcjjUfQLMIVQ45f1RxHBsqIkerIASzWCgWV3xkJ1ieahUtrs3UuMCFetU7fwjXtMvtcENmKjZ2PXM5W3RmfPyvudg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net; dkim=pass (2048-bit key; unprotected) header.d=arunraghavan.net header.i=@arunraghavan.net header.a=rsa-sha256 header.s=fm1 header.b=PtNmuljE; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=OgUgAiwO; dkim-atps=neutral; spf=pass (client-ip=103.168.172.149; helo=fout-a6-smtp.messagingengine.com; envelope-from=arun@arunraghavan.net; receiver=lists.ozlabs.org) smtp.mailfrom=arunraghavan.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arunraghavan.net header.i=@arunraghavan.net header.a=rsa-sha256 header.s=fm1 header.b=PtNmuljE;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=OgUgAiwO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arunraghavan.net (client-ip=103.168.172.149; helo=fout-a6-smtp.messagingengine.com; envelope-from=arun@arunraghavan.net; receiver=lists.ozlabs.org)
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSfCP6XMnz2xRw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 23:09:04 +1000 (AEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 05540EC01D1;
	Thu, 26 Jun 2025 09:09:02 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 26 Jun 2025 09:09:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	arunraghavan.net; h=cc:cc:content-transfer-encoding:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm1; t=1750943342; x=
	1751029742; bh=3TR8c1XlSAHzq5ql4c7mGOadV5LanrZWk1R0NaowOXw=; b=P
	tNmuljElytKPpwQz2xCaNZXiDrB2v+MUCcyu4EOq+nvkgcUyiOH18XhQbZent4dc
	mIQpNliglBAWiM79yhhbQwmeyzqj/ZuFmui8i3MM1hbOHTDEwzlM5rHo0w0zsgtj
	1yXJ6ick3qlMTadVmoFCtZx8jdVTiainoddnZmImk9wu1mPwVVqrOKxJ/+Kb8MOU
	hZhDcatHzawvRfZjJ40rRKEjV9T+qJ6SLqTEzD9yEuk51xXFoto3acnZfZO6bDP+
	d9GBYP/e1EcIkT9zibyQbDduqdXFisWM31H4VdXsRkhEm0Vm6odJvR5qSetNzSBb
	DtPWqAeU/n3wKb6LEsVqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1750943342; x=1751029742; bh=3TR8c1XlSAHzq5ql4c7mGOadV5LanrZWk1R
	0NaowOXw=; b=OgUgAiwOR+NljDySxtWkacQflqePd6AVC7W1eXEjYtm0AZLzCiN
	0cx8EvvL+J9TYWEnOB1gNxhOierzdYC8rMFNLLFiPZLQLppa3ABJUUCG9xiTCdgt
	CKvyDH5MJLfO/oit9BfH21YlNxvkyWCyYHAufnd2yvzndB1Ls8c5aXoq3VPLuihx
	ACYak+2cke2D6RZ3Xz1827UYmZIrFiaQ+vc0rNdLInY6IHH4EjW8jNwHS2lbU7UJ
	GmzVz1twBAWNGp+vu8gwb40A+p2V2xLugVT6BrnlrbVZjHXOTOCD4i40GQ4uYX9n
	BT9BfjTNdQ4Fc9+gU1WJVLjWu4sW7rMvf/A==
X-ME-Sender: <xms:bUZdaCobQOs-jdUnkj5hgNMqXWq5ubSYk3YQL8uQw0wKLpjcSSINOA>
    <xme:bUZdaAppYYFqbQqI5YUyUFG9M83YNERiHj4g8Bxxsdsa--HRFH73uqKQ2V9pcYsRm
    EavPXnHvqK4WIyZXg>
X-ME-Received: <xmr:bUZdaHMNcRNZjIIoM4K_rYEgD6bBA5tgG7dHJ-FFuBjwzWYJjl9hQFImdgp1QmdS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddviecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    fhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetrhhunhcutfgrghhhrghv
    rghnuceorghruhhnsegrrhhunhhrrghghhgrvhgrnhdrnhgvtheqnecuggftrfgrthhtvg
    hrnhepteduheelvedvledvudfhudevkefhhfeifefggeevkedvudfgueelvdehtdetvdef
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghruh
    hnsegrrhhunhhrrghghhgrvhgrnhdrnhgvthdpnhgspghrtghpthhtohepudegpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehshhgvnhhgjhhiuhdrfigrnhhgsehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepgihiuhgsohdrlhgvvgesghhmrghilhdrtghomhdprhgt
    phhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehnihgtoh
    hlvghothhsuhhkrgesghhmrghilhdrtghomhdprhgtphhtthhopehlghhirhgufihoohgu
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifigr
    ihesshhushgvrdgtohhmpdhrtghpthhtohepphdrtggrmhgvrhhlhihntghksehtvghlvg
    hvihgtrdgtohhm
X-ME-Proxy: <xmx:bUZdaB54Hz6UhUVeDLG3l_ZwEUttpvdcpg1T5EsH99vDQPKzVTJTAg>
    <xmx:bUZdaB7dPLXisgzE6x7ObluNUnAkDoKb8nFuVrH2WW8-jdav1B2htw>
    <xmx:bUZdaBi2ITaqNxZIk6IqQvI_Y3DJAfLp9WeiX7noVe3XwalDn9mCGQ>
    <xmx:bUZdaL6psXbo9zJBPJ_3Ybzg4-di_hvQl0sm6ETIqBojIV2YSUwHlg>
    <xmx:bUZdaNpGehd9MBJzwrMUl8LVtfQNs4jACysufrmqmU4sldkB8Q23KAd_>
Feedback-ID: i42c0435e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jun 2025 09:09:00 -0400 (EDT)
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
	Arun Raghavan <arun@asymptotic.io>,
	stable@vger.kernel.org
Subject: [PATCH v4] ASoC: fsl_sai: Force a software reset when starting in consumer mode
Date: Thu, 26 Jun 2025 09:08:25 -0400
Message-ID: <20250626130858.163825-1-arun@arunraghavan.net>
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
Fixes: 3e3f8bd56955 ("ASoC: fsl_sai: fix no frame clk in master mode")
Cc: stable@vger.kernel.org
---

v4
- Add Fixes and cc stable

v3
- Incorporate feedback from Shengjiu Wang to consolidate with the
  existing handling of this issue in producer mode

v2 (no longer relevant)
- Address build warning from kernel test robot

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


