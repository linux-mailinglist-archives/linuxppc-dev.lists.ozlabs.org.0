Return-Path: <linuxppc-dev+bounces-9748-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B13AE851A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 15:47:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS35Y1sQfz307K;
	Wed, 25 Jun 2025 23:46:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750856836;
	cv=none; b=dwuGc4qM4ky7YpH8qybGV4uAl1xDLJbaflCzQljIT/n6fRDUaMkQwN2oa7ONhz5vlyh6ml3ZER0upAOucJk2rcvLHEG613mr+FN1wE1WtneMoNUVeE8TyfmB5aS0TR4BMVygU3a8vVztkat/b52AkUPtIpdxOjVuu4V3qmDPIukqgUBvdpmcfPRUhgKO/gPUQQMa1aNCcbMyw7wWr5Kp/UX4Rn+nMDzf/OazpzrKEt7lyAefmrrOxuUa5Q6qPDfWryjBLpLiqlu6jk5StLUpaFgu6ZLUTT/bz1UJM79bkPbUozduhy6UnBoTDHpEfKmBUBNB9MA28122+4cWfkcqcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750856836; c=relaxed/relaxed;
	bh=mYAc1EALspLuVXr2tNLHf33N87U9klyBRW2qKuitYhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AF7jNR7bLvOOA1ht/gGkEqn+iVcjUXuFAJNIktm0aVP8A2xuxdCAEKejL4B+qur9xTJ3rravtY0c9WliJ5wEnn0R2CV9JxsNIDIYQR9e39tqq/Wjn2KdfukclzWE/ddjIQnAy6KRQRiILuvKxF8N/L/fhdNSt6Sj8C0LL+IHYpe8QYkC93HWtKKx3hw7GnSjBEiN35Iji0A7s1oNhH/4Wb1UAldXzs/c2g0RCzIcctT73wN5ZprKpkqjf+Yja9po+GwXvgXqiBh3rKPOEsF1HS+KlxHBcr8ayesr4MVgUVaXco6SAx0L1lwaXhPd4N5VPmGeEgG3CC3eVmYPU2wRbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net; dkim=pass (2048-bit key; unprotected) header.d=arunraghavan.net header.i=@arunraghavan.net header.a=rsa-sha256 header.s=fm1 header.b=NiRCZPsb; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Uz297v19; dkim-atps=neutral; spf=pass (client-ip=202.12.124.149; helo=fout-b6-smtp.messagingengine.com; envelope-from=arun@arunraghavan.net; receiver=lists.ozlabs.org) smtp.mailfrom=arunraghavan.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arunraghavan.net header.i=@arunraghavan.net header.a=rsa-sha256 header.s=fm1 header.b=NiRCZPsb;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Uz297v19;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arunraghavan.net (client-ip=202.12.124.149; helo=fout-b6-smtp.messagingengine.com; envelope-from=arun@arunraghavan.net; receiver=lists.ozlabs.org)
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bS2Cj2zhwz306l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 23:07:12 +1000 (AEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 0327E1D00217;
	Wed, 25 Jun 2025 09:07:08 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 25 Jun 2025 09:07:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	arunraghavan.net; h=cc:cc:content-transfer-encoding:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm1; t=1750856828; x=
	1750943228; bh=mYAc1EALspLuVXr2tNLHf33N87U9klyBRW2qKuitYhc=; b=N
	iRCZPsbnH0kf8n0T3tzCALGVTdE+PGEtgVpNv/12qeHdRRgqV+f5VUV2IDGJbW75
	DwT0YMujfHs4HHLSQpxvqcckpZz5zDcWoSYssh3eYpdCYKhhzjwcwfQOPKQ0HoM9
	SexImBEwq0A/1ser+E7rIxm9EyMarN7ecbH0a348B76DhD4JtpOuMf4KK9MikN0N
	f6NkgLVPjpQ+1UFeYpk5OZZ1qnC7qRTzaRSayZa96nfbglvFNNYyNjNoLl/p3YJ6
	Ve0P6HIKuH+erc970GAGHnahzbsdlQN3bTzm8RFnjK2ggVVD1ABdAUcTOLO4/g5B
	ACn40mBQtAj6ddaQG4VNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1750856828; x=1750943228; bh=mYAc1EALspLuVXr2tNLHf33N87U9klyBRW2
	qKuitYhc=; b=Uz297v19dxDBmaCgXDfknpPIZW+pHMmgOjDcFyB54SxvpZl6Vja
	b7s0N7hUfSC4qs0ayFcAwqePPMSwvdjHYj2WppEEVeBlaZq1yHBSzmclPDs0+gE5
	mzIMQZdZMsxLMo01OTltX1UsD9J7vab4fn9ZYaECZJV7Inb+1JRa8Y5cCVNaI3LB
	ZC6Bk+MTBzMU+q4Cv8Y/m6x1MEv2pUAIJZqPM2DZhEVGLAhSkSAJnM3cdkexXENe
	swLfgj0H55ja98Y8RoUJe8N9KEiiQlrNYrSdXUV9XEkx+240zalkmEIVyp8hyyRO
	rZDusFTAenq5GWYGS2FelndeOxVhl0s+UDg==
X-ME-Sender: <xms:e_RbaBJkMxaGd8E8pikNRd405FY43X_jhr45TSBzWwShZjklcnxSew>
    <xme:e_RbaNLjV8QP-AqS623yT--JoEalmfCMsmoh4qqebQAPHuGeTPLV7a-SJNZexSR06
    nY9p_JAld-vdOzeOg>
X-ME-Received: <xmr:e_RbaJsEE6l4tAifTSWhNnVwCyl-WQJr1JP4GJddF-5H5b89QiXmekKpDStq1Trz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvdekhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetrhhunhcutfgrghhh
    rghvrghnuceorghruhhnsegrrhhunhhrrghghhgrvhgrnhdrnhgvtheqnecuggftrfgrth
    htvghrnhepteduheelvedvledvudfhudevkefhhfeifefggeevkedvudfgueelvdehtdet
    vdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hruhhnsegrrhhunhhrrghghhgrvhgrnhdrnhgvthdpnhgspghrtghpthhtohepudefpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehshhgvnhhgjhhiuhdrfigrnhhgsehgmh
    grihhlrdgtohhmpdhrtghpthhtohepgihiuhgsohdrlhgvvgesghhmrghilhdrtghomhdp
    rhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehnih
    gtohhlvghothhsuhhkrgesghhmrghilhdrtghomhdprhgtphhtthhopehlghhirhgufiho
    ohgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhi
    figrihesshhushgvrdgtohhmpdhrtghpthhtohepphdrtggrmhgvrhhlhihntghksehtvg
    hlvghvihgtrdgtohhm
X-ME-Proxy: <xmx:e_RbaCakAwEoJ-N3AuLc6sRbLQSp7FC_TzfgO_6jk7UkOpVN27ZgXA>
    <xmx:e_RbaIbMUjfp5FiWTkCiO7V5ntXLGeuabYiGZUgSKLGs3ciGqwo2Iw>
    <xmx:e_RbaGAVcDLFmlIN9eDjCOyUqdkCvA4KUQICVaKnCrF4L8n6mi42_g>
    <xmx:e_RbaGbrCpRevF54zYbUdCgNvs3GHf8RhmhjIGf3hjsx9E4hbJSF7A>
    <xmx:fPRbaCIbg9Vu5L40sdvsI0bLIuxbK8TFcuRsoolv83b_LMG0z0WTLYzy>
Feedback-ID: i42c0435e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jun 2025 09:07:06 -0400 (EDT)
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
Subject: [PATCH] ASoC: fsl_sai: Force a software reset when starting in consumer mode
Date: Wed, 25 Jun 2025 09:06:48 -0400
Message-ID: <20250625130648.201331-1-arun@arunraghavan.net>
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

In a setup with an external clock provider, when running the receiver
(arecord) and triggering an xrun with xrun_injection, we see a channel
swap/offset. This happens sometimes when running only the receiver, but
occurs reliably if a transmitter (aplay) is also concurrently running.

The theory is that SAI seems to lose track of frame sync during the
trigger stop -> trigger start cycle that occurs during an xrun. Doing
just a FIFO reset in this case does not suffice, and only a software
reset seems to get it back on track.

Signed-off-by: Arun Raghavan <arun@asymptotic.io>
Reported-by: Pieterjan Camerlynck <p.camerlynck@televic.com>
---
 sound/soc/fsl/fsl_sai.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index af1a168d35e3..3a5ebf32903f 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -841,6 +841,18 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		/*
+		 * Force a software reset if we are not the clock provider, as we
+		 * might have lost frame sync during xrun recovery.
+		 */
+		if (sai->is_consumer_mode) {
+			regmap_update_bits(sai->regmap,
+					FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_SR,
+					FSL_SAI_CSR_SR);
+			regmap_update_bits(sai->regmap,
+					FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_SR,
+					0);
+		}
 		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
 				   FSL_SAI_CSR_FRDE, FSL_SAI_CSR_FRDE);
 
-- 
2.49.0


