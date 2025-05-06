Return-Path: <linuxppc-dev+bounces-8365-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCC8AACF9C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 23:37:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsWvQ6BLGz304f;
	Wed,  7 May 2025 07:37:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746567442;
	cv=none; b=TnC12qpB1kD5XK0pTsyByOdLKzRgLKSXR0Rmjt8M3VPgQPLEVkJX24hqyTHsCJIPDeMiI800yP7N9DGPU9Ng0R7ZrfcYeUuGnmol69NJHDDv6+uuzvCqPDfJaevhTF268fwu+fN86c9crrUyg/0Jinu1Ze2xderLuqK+BezSdMi1o8TgVBHt6MlvLvF/z+VNPvlDhGms95Z7qkiu2gFr9nFi3nLri3/hvr083qrEcyEWYoorFvrxWN16CiWQ7o/MRKWEchfbfhy4iDV6OBGnbyOkZA/E54qw+T8Z9N9+zph1RBn03UCBVJkSNBctb2uS+Od9BsMVBVd6jgHffJJkUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746567442; c=relaxed/relaxed;
	bh=9641NHNk5qFDO6SRPapBY7yEVofGXQ0J/U7vAQhEbr4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XebfyJuKNwteaZIXgbz1jLc0FIvcS3LcZbHIK77GCgZF9NzE3gRkIEmzeJedkHc97f5uXRkilNoR9qXoQ20peu9R+Tg4zZjGUmQ1iqVI5VHefsanr6+MJ3TWWoQdSoqSRlgxlVveA22fVxIr52eT0N4RN7iALrZc4h316YULpptAvl7Z2bm1GyKJqUr0lzbCi/ed+6gqxmh9JSeBEk19rcKzGG7ZufjgwTrWH2vSUUQkXfqVf3IYHiqgqz315gtrN0/EoDaJBfPdT5NnCiPxk6Dlc12ynfDoVje5D/gHuL03BcbFeg5hRv35s2yyPjEvnMoC7If2bHBD1ceTuK86gw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GFll7MAC; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GFll7MAC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsWvQ1g4wz2yvs
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 07:37:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 31AC7A4C3B1;
	Tue,  6 May 2025 21:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B88C4CEEE;
	Tue,  6 May 2025 21:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567439;
	bh=sDdNilLczBKLaYqH/j1+dAzPrmbkU/4O96N81w9WPAU=;
	h=From:To:Cc:Subject:Date:From;
	b=GFll7MACCfR30CYypbhc3YU4zQrW+sGnDisfzoH00p5OQqfXhoLJNyDslyTWzTgLm
	 zPgsGJ8anCr08Gku7f6TkhgldVWZFs/OqbJMJ9NzCayW+cecVJqcZkVAp10KdCt3tY
	 to1mgfK7BcuY4u8XX5Vyx4TEw2c5tL60UJhUQxYBC+zR4pDJQ5sdWmGu2202dlqvfB
	 tytHH0PNHiHzbrV6g2Czm9q7Dr8N5QpLpzkYlOPhidBAHaJVezxvCLoRorE3w4rFlI
	 WZUJHDEGrPV64ZTAamKTn12mtChhEmcejDop5wIoap5tTv6AoduUTcDWifmSZ20WIN
	 4wtYG8frBy+/g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Chenyuan Yang <chenyuan0y@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 1/6] ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of()
Date: Tue,  6 May 2025 17:37:09 -0400
Message-Id: <20250506213714.2983569-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
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
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.137
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Chenyuan Yang <chenyuan0y@gmail.com>

[ Upstream commit a9a69c3b38c89d7992fb53db4abb19104b531d32 ]

Incorrect types are used as sizeof() arguments in devm_kcalloc().
It should be sizeof(dai_link_data) for link_data instead of
sizeof(snd_soc_dai_link).

This is found by our static analysis tool.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Link: https://patch.msgid.link/20250406210854.149316-1-chenyuan0y@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/imx-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index c6d55b21f9496..11430f9f49968 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -517,7 +517,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 	if (!card->dai_link)
 		return -ENOMEM;
 
-	data->link_data = devm_kcalloc(dev, num_links, sizeof(*link), GFP_KERNEL);
+	data->link_data = devm_kcalloc(dev, num_links, sizeof(*link_data), GFP_KERNEL);
 	if (!data->link_data)
 		return -ENOMEM;
 
-- 
2.39.5


