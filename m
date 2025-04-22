Return-Path: <linuxppc-dev+bounces-7871-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C545DA95AFE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 04:17:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhQqN3Jqyz3bpm;
	Tue, 22 Apr 2025 12:17:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745288240;
	cv=none; b=CCoQd/IZY5/9solFnT0v7oYFeaIL8aK8+ADXF7i1cEN4CmYcHbZjUxLDvebD5IsyMHj+X+AVyMLJNm9JlES9UBLIJX19cV7Asu4lJFcAkorHn7sQYISLXsYCS55/dm8sRxvggGNNn1fVWHldYlQyzXw+whu9TTl8UJzgcKb2pQ5kq1gEwYtIrZbJjftC7alz6tSrzFB3Fr19otlDKAX4Kcv1HLldMGlaGx8pr4ySH7xV3Yly7BLYF5LqaiZXn+KYm5dC80rgCoHl0x2cnQykB1u0dpHNFppKu3WRO18spgCpc8R+00MvphAME9M7OTyM/gzkRb6ntji1HUhAvnOV9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745288240; c=relaxed/relaxed;
	bh=Lb+J9ZokVSqqxIsPp1kmHD+Y9qcFSWI6Hw+ckhxKTBU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eNZ1+y2ewlOBRpWfWM/U2cfbD3dIBFxUtXtSj9Kzn0+C9MAK9jId67elhGgB8InWiEpzYR8AJbfBwsu+gpyjyB2fFxKajrisRVvdNDp3lC2Jme89xnfAbA1RyRcJqbYGrRNDysNc58/NkRli2FXI3iRIJqYHQNpsND0gRLvZhyP3HphnBjVk8w3sDed/8WCYTWrzNgd71cNq+07nRPyyByej0AatynQVIqf3cVg6LpgtUhAvFLXNqSyCoyscAbRC6i8J4pMDnn8fNiyTA8XhWkdY4k4NLfJMgBtuN8bfwN5El3S3qTdjw3+scFhptzi6cVteOjZSWJdHRkJ/6CEbWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=myhualnb; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=myhualnb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhQqM5K9Xz2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 12:17:19 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 08298A4BF35;
	Tue, 22 Apr 2025 02:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77FD6C4CEEE;
	Tue, 22 Apr 2025 02:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745288235;
	bh=NjNbpF18wPAYd3eJEswSOl8w+6PgqTaTcYBTzvy0/08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=myhualnbDMfLHwDB1hoHPqRPJtTa+7waxg6JDU0hWW00KQSUwZfmyrBlsMpI5BtAh
	 WX6TDBujrsi1h9CJNtD6MbWWWQ2nMmLq1zI7NcRGB88q2kA6MArJ8pOGoPexJqqrm5
	 9RdACuCLAVsCCOjSEOUGZG9VoHa6xcXVqW7HMrW8IOEricD88vuJ+ulY1v1DfSN/W+
	 g3uZvqnUUdQ+sj3NqQjLte5IEd7oDP2bcYFb8MO7Z2pftvDI1ouxXmskzHeAD7927W
	 N/JUdIvT0qkxUI326jEqMd1F3dfj64NhU3k8Y8BXGE3wbb3bYXDdGrwCkPaspuW56A
	 U9cV79TOeBTQw==
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
Subject: [PATCH AUTOSEL 6.12 07/23] ASoC: fsl_asrc_dma: get codec or cpu dai from backend
Date: Mon, 21 Apr 2025 22:16:47 -0400
Message-Id: <20250422021703.1941244-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250422021703.1941244-1-sashal@kernel.org>
References: <20250422021703.1941244-1-sashal@kernel.org>
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
X-stable-base: Linux 6.12.24
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


