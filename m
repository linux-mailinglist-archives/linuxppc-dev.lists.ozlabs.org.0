Return-Path: <linuxppc-dev+bounces-7870-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D90EA95AE4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 04:16:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhQp30q1dz3bpd;
	Tue, 22 Apr 2025 12:16:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745288171;
	cv=none; b=ML3xZq2bo9RAX5CB06yeNwE+VRdYKhEX7ez5Dj8VkJts3DLvd2EoQpAzcOSOtYd/bVWYi5iOJ4bvF16kIDGC9gLhiSXxtC7kQAEcTga5/4DXgWM8MlktYnoFkYmUIhDdj37G2GsGMPIo3iKriifJ0a0Z783vsj/kLSLMZlQX1YwzET5sPnREglAk2Nd1tZlf5iG6AUfjvuBgfgfc4X0L3oBrg7as9TGV0lx5LnmBX7LM2f6HAswgOl0ay0A2gHfgZMfPDFwSQUvAuS0D+9o+/b1vGqMpBy8VNBSNWJTTqbmFI1J7WJM3QKSHgUwKzbB+alJ6xqgx0d41OB2bqHFBbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745288171; c=relaxed/relaxed;
	bh=Lb+J9ZokVSqqxIsPp1kmHD+Y9qcFSWI6Hw+ckhxKTBU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=REyeXTb+dH0YPpkMRp9pxt/Ez7uiNuu5MLiy4l+TJu/T7Bk0LHeu9u+mhX3Y+TCLfJygvFOpXZ8hmSRBsoLFqiCfptjiGQsGZtgDGQTBKZmVHMYdyvbdAFmC6qFUbxYWfZYoSkA33x1C6d1zZltXK/xXm6EnnOWNjM8ZDjaT4VbfO2yaOzUCdjqiuuKPYKz79VpsvDHXb++IH+nGcrM/EDseGk7zuFHVpK2ooeqkjbs4loidbyOgDuPSm/jez+ZLfV5JAwyrNbfzaRSbiG5iKLbiIWZqFygP/5N23v27/2u8ZKmhnDbJCp/6pPeJBOFGUGbcDY+ib6Yim2qDh8wsiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T0cGpG5p; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T0cGpG5p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhQnz5QKWz2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 12:16:07 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AEE6D61362;
	Tue, 22 Apr 2025 02:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2B6C4CEE4;
	Tue, 22 Apr 2025 02:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745288162;
	bh=NjNbpF18wPAYd3eJEswSOl8w+6PgqTaTcYBTzvy0/08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T0cGpG5pt5czQsrotSYEqBUiq8Z1Ytt4b1AyrqD4F7+mEz1csQmgIQiTUi6CejhZy
	 4/WrPT3rb0+gy1qiwQQS6imAhdv81PdZOLh6RJPVHY2U/wROVrjbTNhtX4w5UvcY4E
	 qlxMYwZylZwXh80VZLEVexWvkajFEfcId9Ho8L2eHY9hFfhRIwAgD0jQLUe587+9IN
	 g2AAenO0LsFVLAiyHIe7T8StZHTy7pYcz9Dl4yO6srn1iBPTDmpvnC+3p8HlpjYqq3
	 KbTH0a1MA7jxCNjDoLOQdNyPv92HezL/qXNP4XoH0Ek9gkGctCAEfRG38LWZxh/7Jw
	 TEE0iJn/jUfzw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.14 07/30] ASoC: fsl_asrc_dma: get codec or cpu dai from backend
Date: Mon, 21 Apr 2025 22:15:27 -0400
Message-Id: <20250422021550.1940809-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250422021550.1940809-1-sashal@kernel.org>
References: <20250422021550.1940809-1-sashal@kernel.org>
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
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.3
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Shengjiu Wang <shengjiu.wang@nxp.com>

[ Upstream commit ef5c23ae9ab380fa756f257411024a9b4518d1b9 ]

With audio graph card, original cpu dai is changed to codec device in
backend, so if cpu dai is dummy device in backend, get the codec dai
device, which is the real hardware device connected.

The specific case is ASRC->SAI->AMIX->CODEC.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Link: https://patch.msgid.link/20250319033504.2898605-1-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/fsl_asrc_dma.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index f501f47242fb0..1bba48318e2dd 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -156,11 +156,24 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	for_each_dpcm_be(rtd, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 		struct snd_pcm_substream *substream_be;
-		struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(be, 0);
+		struct snd_soc_dai *dai_cpu = snd_soc_rtd_to_cpu(be, 0);
+		struct snd_soc_dai *dai_codec = snd_soc_rtd_to_codec(be, 0);
+		struct snd_soc_dai *dai;
 
 		if (dpcm->fe != rtd)
 			continue;
 
+		/*
+		 * With audio graph card, original cpu dai is changed to codec
+		 * device in backend, so if cpu dai is dummy device in backend,
+		 * get the codec dai device, which is the real hardware device
+		 * connected.
+		 */
+		if (!snd_soc_dai_is_dummy(dai_cpu))
+			dai = dai_cpu;
+		else
+			dai = dai_codec;
+
 		substream_be = snd_soc_dpcm_get_substream(be, stream);
 		dma_params_be = snd_soc_dai_get_dma_data(dai, substream_be);
 		dev_be = dai->dev;
-- 
2.39.5


