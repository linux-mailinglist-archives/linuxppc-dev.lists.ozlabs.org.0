Return-Path: <linuxppc-dev+bounces-8359-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC09AACF80
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 23:35:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsWsL1wlRz2ySl;
	Wed,  7 May 2025 07:35:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746567334;
	cv=none; b=bmiKYwcAtEKmexJ7T/e0ifARkE6TsocH3+FcvNvHEEAAlpLV0I/IyulGq0zTVhS5cQXw43sNeKKkIh2tzSolARm1jwcursz0DlJOyjgPm8anIJBM6mPIIYI6hSfEc+LY0V4VR4Np3smWh++zisJfmbdWduyRZHE/wiSf7i95/YUkwTAw3+TB6MGNLYIftO7q7siu8tJGptet0gzXc4SwcM88crHivG6rh/nH6tkPXoQG/lzOLim+tl7+fSv9DWSZTurHY5ru99/OzFrUUz6lNk9KrrLdA+HZc3aiYWSxVCA0XlQwx4ZmAyqj/Tq10Dmzyqr5RdoMEvFdx4DES+p5lA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746567334; c=relaxed/relaxed;
	bh=RwgYvqopAzbsE+6lk2Pi2aF4CcdwbioO2BdIZ6OFToo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V7+wdubUlrb/32bDIjUScxPvh4sb7xSiotPx5j2CuSFcOxk5u1K3haMdvbwWptGLQy9X06H4Foh5vzdQYQPVcWYm8xLKp6FXhscqPQsZCWpf5rKncAWgBDLuF396R4iyb4MVk0/tj+72pyzZ+nXFgKTzwBEhLe8zokenQndZLp1yJxg4gwyEIjBkRHd8wT3q1sj+xGFh2MquyGpfaaeawrs8Cmwsrks+Kb1+gBCZd+xPtOundUMpLEt2a1JsdEz5pQOhC0jDlUGcndBV28sNcpw76HPAfRGA+ESWxY0LpCrlxTeXBg1j+rdEH9wk/Zv+lk1lPy2rv3GOWBYM7cR8ew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CV0IYFxE; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CV0IYFxE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsWsJ6d9Nz2ydQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 07:35:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B294DA4C3AC;
	Tue,  6 May 2025 21:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 512D8C4CEE4;
	Tue,  6 May 2025 21:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567329;
	bh=TKtp1XPzEnz0nV/IHJfa7zuMDZxO8VXjrfb3mToz8VE=;
	h=From:To:Cc:Subject:Date:From;
	b=CV0IYFxEGG3ggtbFUnwPZLVjTKIO7or7fTpnCNZtuLVBAoENhSCQ+NeDR95PU4s53
	 JYd5MDy5T8UqM7Cdl65/pNb28ZEZd4wNyYmP9uky9ecK8uXp2U5eG/dNTvUVwbcUXs
	 gF4gnwPQE5imHi1UT1L5m6Lv8Bs3vdzHqxLOs8EKa3wkBTJ7436sLdf3oFOVVB/Spf
	 SOeqr73xkw8iSUULpqYI7hRsnsrusx9G9yrarLU09r36tSVGcm8F+id/jrr8axyKRk
	 PHFA7SxUW5Mge0tKAagVbXNDtQlj68O+UBVnmeXYw/DrsbuVlbluQt0LbHj44EGkAx
	 gqlRRnkk3Dufg==
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
Subject: [PATCH AUTOSEL 6.14 01/20] ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of()
Date: Tue,  6 May 2025 17:35:04 -0400
Message-Id: <20250506213523.2982756-1-sashal@kernel.org>
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
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
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
index 21f617f6f9fa8..566214cb3d60c 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -543,7 +543,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 	if (!card->dai_link)
 		return -ENOMEM;
 
-	data->link_data = devm_kcalloc(dev, num_links, sizeof(*link), GFP_KERNEL);
+	data->link_data = devm_kcalloc(dev, num_links, sizeof(*link_data), GFP_KERNEL);
 	if (!data->link_data)
 		return -ENOMEM;
 
-- 
2.39.5


