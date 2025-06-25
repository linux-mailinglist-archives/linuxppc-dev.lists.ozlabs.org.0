Return-Path: <linuxppc-dev+bounces-9795-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A88AE9320
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 01:59:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSJgh2f0jz2xWc;
	Thu, 26 Jun 2025 09:58:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750895936;
	cv=none; b=RO7Oc0cVpF6eo+pKGgaYMsVRrdT5Cw3uYY5MUyrcl0CPLxIx6yISsok56fGDcsp5Gw/YxlBh7pwT7XURAw/Hx5558k59l4JpcUE9gAmsL9u9UaZWNyqdAhS8ks1qtAXBDL26s0hWU+iCs/r2WADFUGFY0uaqSpSV7WMX+WWo4DwiZKEbUeyxe3slIy6SfxhEg/SHbbjN2mBIjKmW/PcOFQVtQ/kML1NT6vFHrEVvl5yNt0NC3DdfyR3nPgsIQymstLvsMrl34ObhUnyTVKI4QDRTjrayG+VqUVPRtv01fsc1/05Eu4vQx5qO6CX/xA5fp1xQJb3Hq40rABlAGyAd/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750895936; c=relaxed/relaxed;
	bh=CD1lNkNuFLFWeglbXsOJf1Gqo9Ci9AUb2FltuLTlbM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m59+WBu0GjiZY6KJJAQWu1emLlA2SBaQ63mpa98gfHv7AinSISQ9wFXXqyJ3WmbU82lHIaLrIDH+5jAJZHxdemSIkA2i7bgCn7EK++DoRxG0zvWFQmizE+6wGXNCRGGrhUeSo64CSjBvwsZGOJWxnVufrk1GhN/Ua4t3Bmtu58Cp33mFLDbNOErLgSXANl7BlxjauQ0XTC0ELkuhoySOqTbiS9qBbk9ucJOP+95wpkYwcZ0xTOZkUGF792XlENxkSxZoINuPBWSVFd/pxwTaakwwqhHJZF7e93x90B0vssrDxbxoltHfSIm08KZFVJoZiy0rBdMmS7cN1nduIVz9uw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net; dkim=pass (2048-bit key; unprotected) header.d=arunraghavan.net header.i=@arunraghavan.net header.a=rsa-sha256 header.s=fm1 header.b=hFYrc8cX; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=S55TUUup; dkim-atps=neutral; spf=pass (client-ip=103.168.172.149; helo=fout-a6-smtp.messagingengine.com; envelope-from=arun@arunraghavan.net; receiver=lists.ozlabs.org) smtp.mailfrom=arunraghavan.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arunraghavan.net header.i=@arunraghavan.net header.a=rsa-sha256 header.s=fm1 header.b=hFYrc8cX;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=S55TUUup;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arunraghavan.net (client-ip=103.168.172.149; helo=fout-a6-smtp.messagingengine.com; envelope-from=arun@arunraghavan.net; receiver=lists.ozlabs.org)
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSJgd2SMfz2xRt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 09:58:52 +1000 (AEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 2C0D5EC006C;
	Wed, 25 Jun 2025 19:58:50 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 25 Jun 2025 19:58:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	arunraghavan.net; h=cc:cc:content-transfer-encoding:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1750895930; x=1750982330; bh=CD1lNkNuFLFWeglbXsOJf1Gqo9Ci9AUb
	2FltuLTlbM4=; b=hFYrc8cXITwzHzjT/F/aPQJ77rnx5e+MBO/a13cIGRb5tj+7
	cUyJsyBF2SicL9lKAm3/KxBlyEFCfshn3SBHBrCrgWwiBCOSGXdWMjxSKCLMz2X6
	JruQ62JUmJn+GNYOJYhTraKa/k9STkzhfUSNzeNCHjRYFuc2Yp+DrqgqJ3+bwxcl
	Kx+yWK44kS9p4EuJTsw0r6cMJs50FNRUFdsq1VK+3fNnQ9bSHy3W1l4FbPhgbpNu
	ti+uicl4HXSgJxqVhvlyfqt46EsPR0Mk4lOk8xABD8rnDT8K2sKLkNmBgP4l7Pwt
	3WBkGMQPM6Ys6IYEmauBpx48PPkZxz5D/pvmWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1750895930; x=1750982330; bh=C
	D1lNkNuFLFWeglbXsOJf1Gqo9Ci9AUb2FltuLTlbM4=; b=S55TUUup7W5nUabXM
	5GrKoGJCLCdjhlQbM7P7XI6R1dv/nXq0EtPndoA1j6Y1mcKR9gNylRXGqs9e/rUL
	u67CmAmErYTLZydXyiMBEC9EvU3ywfOqYUex2PQbpZmar/rJMQPBRC3fjPCR02bT
	G4p7zPuaRbKeNh1E6UPDVwSBX3PRn3o9eE7mFOraaL63otc1XrMqGGQbAqXwI4eA
	Bk4UhlDAlBaCHDkrXzMqK5wesk9Ok2oaDyodLWcp67PLeSrYdDz3U2lisOc9fAaa
	qSUaULQNGfsNPJ/eG67P+t7bOZfh+iRTXLIYK2/iS5SB0WoZV2i+kJOW+wW1QokK
	Ns3gA==
X-ME-Sender: <xms:OY1caGS5hhhT6f4CjOJ-dl7nvFlvkdzxY2FMxZCbBGM-Tl50THJJbg>
    <xme:OY1caLzjEmTQG1o7c1Zsm6hUy83R2QA7DRWnfV-9V_NInwT6v-QRpWvpIQfytabZ1
    1MNgMoDRffyNwFXng>
X-ME-Received: <xmr:OY1caD03VoUDuA3YRdsrOFe1_iVCtdx_Vuvmlnux0dWrtcHxqW5yUufNQWQn5UL7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvgeduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetrhhunhcutfgr
    ghhhrghvrghnuceorghruhhnsegrrhhunhhrrghghhgrvhgrnhdrnhgvtheqnecuggftrf
    grthhtvghrnhepieduheehtedukeeuheeiudevgeelgfelvdelgeeftedutdeutdefjeek
    feejfeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghruhhnsegrrhhunhhrrghghhgrvhgrnhdrnhgvthdpnhgspghrtghpthhtohepudef
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehshhgvnhhgjhhiuhdrfigrnhhgse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepgihiuhgsohdrlhgvvgesghhmrghilhdrtgho
    mhdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhope
    hnihgtohhlvghothhsuhhkrgesghhmrghilhdrtghomhdprhgtphhtthhopehlghhirhgu
    fihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohep
    thhifigrihesshhushgvrdgtohhmpdhrtghpthhtohepphdrtggrmhgvrhhlhihntghkse
    htvghlvghvihgtrdgtohhm
X-ME-Proxy: <xmx:OY1caCC_dVKYHIlC4s3YEUEVi3EQEA_1-fTdfIneZE3dUoLt3JMOAQ>
    <xmx:OY1caPjknBNGroiNcNWnGDngbv4tTWukNiQD71-d6XRCnqMiWTYp9A>
    <xmx:OY1caOrpCvXLDXEJxG-FpXmikX1mow5PYnPKUJg6y9i0rsp0zYVJJQ>
    <xmx:OY1caChmIyY52nia4tniWmsAjJhAb45YPGk1nBTa88poAeKTm2kyVw>
    <xmx:Oo1caNwtsxehlSruYPtKNWHbl-gn7HkGmXPL_YSbY_8VvuYkXaTtwsNA>
Feedback-ID: i42c0435e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jun 2025 19:58:48 -0400 (EDT)
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
Subject: [PATCH v2] ASoC: fsl_sai: Force a software reset when starting in consumer mode
Date: Wed, 25 Jun 2025 19:56:16 -0400
Message-ID: <20250625235757.68058-3-arun@arunraghavan.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625130648.201331-1-arun@arunraghavan.net>
References: <20250625130648.201331-1-arun@arunraghavan.net>
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

v2:
- Address build warning from kernel test robot

 sound/soc/fsl/fsl_sai.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index af1a168d35e3..d158352c7640 100644
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
+		if (sai->is_consumer_mode[tx]) {
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


