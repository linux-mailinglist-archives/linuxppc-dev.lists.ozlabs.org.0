Return-Path: <linuxppc-dev+bounces-6396-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 029E3A4118E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Feb 2025 21:28:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1Fnd4QJhz2yt0;
	Mon, 24 Feb 2025 07:28:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.170
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740342533;
	cv=none; b=gb2N2dkWWv4bX7BnfDSoUX2oYNhNChfu2Nhv6gKY9a2YoRjPFImTNRKCNr1Ru+Zzhb1njkbA5VsmMjK8pou4DsiRY1A5J02rzLNFU/2a8RcND5+wcXzJlDjSVnuOUU+ZuLuwgBwdzj9g2v4Z7cP+wc8xaxRHY4mX3uKm7PV/AEIsyP1r86t+hWkI2bfoGEHkO1+ycrGLCVHNAutMEoI/a5BugB+ngzg2M9rwMfVXNHL/82vB2vAahc882Hjh52AL3lflweXq/7JLoQpsG8Hw3kFiF8tfo4Ot9z/g4OIGAT00MizCgpt1kWpCioE4Bmb5x7s2rrn1NrZ1v5LcmY8tOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740342533; c=relaxed/relaxed;
	bh=+zTJ3hkU+s+DVpC9GLX4g3ZeOAZuzC6afimUtBs/oto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CWUE/zKGI/De9RbBzV+gFsNPf8j1mbQJoMuaCyV5AQttH6qk33AqV2fTJqOsUdKrH/jjsuMd5afYcSPu8Ue0R083QReETLNne0fxNOjQS4DV0lTDV+lUbcWMhXOXoLirflkMG8C5l8RVBnUJ9hn2tMB4TuTl+ePW9inn+C/3eUEqibv5YkCuC9ZMQymWSlt3IBNsGbXh+lgsrfk2X/uxqBbhU2tzZfUq2h6lHjDfQzjrrDF8jB2ebfpdxsdfVP8dKJFkBYimY1cJo1lwdgNR69Lz4m1JoQTPH2VKuYV9yaiolN702V2z9dlEdCCGMguImOypQhfGGwbvEDw0pUsS9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lmnsaeOC; dkim-atps=neutral; spf=pass (client-ip=95.215.58.170; helo=out-170.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lmnsaeOC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.170; helo=out-170.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1FnZ3FXWz2yn4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2025 07:28:49 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740342508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+zTJ3hkU+s+DVpC9GLX4g3ZeOAZuzC6afimUtBs/oto=;
	b=lmnsaeOC9S8BAtthK/cic5Jq9HPDXa7zl2UuyMUWHwgbLUPq7Cs05LchrCjy2DEn+6dRch
	LEfwgj8nAy2sRTzEzDjvqVQRFs9KyO+6XM07cqypLKtDxuaocjVK85fEZNZS14V+kfK3l5
	9r3CN++W2BpuMHOKh2M1vd1M7PQeyYo=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herve Codina <herve.codina@bootlin.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl: fsl_qmc_audio: Remove unnecessary bool conversions
Date: Sun, 23 Feb 2025 21:27:41 +0100
Message-ID: <20250223202741.1916-2-thorsten.blum@linux.dev>
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
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Remove unnecessary bool conversions and simplify the code.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/soc/fsl/fsl_qmc_audio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index e257b8adafe0..b2979290c973 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -892,7 +892,7 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
 		qmc_soc_dai_driver->playback.channels_max = count > 1 ? count : nb_tx_ts;
 	}
 	qmc_soc_dai_driver->playback.formats = qmc_audio_formats(nb_tx_ts,
-								 count > 1 ? true : false);
+								 count > 1);
 
 	qmc_soc_dai_driver->capture.channels_min = 0;
 	qmc_soc_dai_driver->capture.channels_max = 0;
@@ -901,7 +901,7 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
 		qmc_soc_dai_driver->capture.channels_max = count > 1 ? count : nb_rx_ts;
 	}
 	qmc_soc_dai_driver->capture.formats = qmc_audio_formats(nb_rx_ts,
-								count > 1 ? true : false);
+								count > 1);
 
 	qmc_soc_dai_driver->playback.rates = snd_pcm_rate_to_rate_bit(tx_fs_rate);
 	qmc_soc_dai_driver->playback.rate_min = tx_fs_rate;
-- 
2.48.1


