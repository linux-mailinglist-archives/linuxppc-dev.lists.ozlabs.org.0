Return-Path: <linuxppc-dev+bounces-8366-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A0BAACFA1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 23:37:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsWvp6kbVz305v;
	Wed,  7 May 2025 07:37:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746567462;
	cv=none; b=h7XQd0ydJIsnaALSmYsBRqEtYYNz+HtnDkt0P9To5/ysMqFJMT38tX0YLJId/W9lKhuiK+XlY4f6biCjRW2q3XlgjGVhdLGaDIEWIPZllHjvPynq5NqLm0+byZG3sUD6TFCvV6Mqkr5mVnW8I0qJfHgYIfK46v0TbO+vXFdYu4kPzY4a5R2T3KGSulfw+KFUZePfLfD+kOLtU0f/DOctnmn0MrB3JSL4QYO7WPUhVT2su4cDCk1IS05tkF37R+9NoQ0a7je0NgGMa97h8rpg21wIsnI2uLTLMlGOc3T9ZMjBWoxKrBxcS6DtPBFY6PTpjfL5A9H6VdadhgPcLXjDZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746567462; c=relaxed/relaxed;
	bh=W9EpIIvGZC026Xhg6X5Ld+DXQ1Sos6ZjcJn4ZoAt1Mg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RVPK/mWPZYVUICpwYzf3lqBQLaP5AKCL4uIyZu3xq6Fzp8JnK4I07ODm2Ccxcmw/yBc5EfERw5bU2HWtip6dG5n61nKWPQtyKiQgdUQ3/kJcg9+dTbCcxI7T6Cdkzz8m3e59/c3a33O36fnbQgAJS3Bj4B2z/eclRF9prTmpnKRUB4Lsm96+l286b7nWxkTbvXvhlm/Q+Pq57o0mf2FZvOqjCmQ+aKnRnTqX4bU7FddBEDjb9dQiUwN9TkkZqI1sDToBT2g3L0JulVU+fOFr1cq4TLNA3B1e1G8BfDjlIqSN8S7ZIoElLyJfaTm/95170CIKeeRoSTV2nbHbrRzTqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hsWNs7U7; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hsWNs7U7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsWvp2TZrz2yvs
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 07:37:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6BD0D5C31A0;
	Tue,  6 May 2025 21:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3F6C4CEE4;
	Tue,  6 May 2025 21:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567460;
	bh=L6Tt2ffMkg9EVgZa42tozx0zcdnP3UBkZcqvblRNdv4=;
	h=From:To:Cc:Subject:Date:From;
	b=hsWNs7U7gMY5LY7oLi3jBIWTu03Lv4lLsUfyUU3Z3tucFubQgZIj8ZKg+2ZCiEEFr
	 czKi/tTmSeQIDa1PJwUz/H83sHV2yPeu0jqmyNhT2Lq2zl4KT5lWCrLbKMncaahM2O
	 Lwz01Q7PX2TV/tx31W1ECr0ZhsXncI1ebgSppGLPRBzX1nZh1Iok3+2NNcSvtUY4Hj
	 atKyBez0SG0m2GbJjfAqyaXmFvs4P6REkoojh+Hvlrqt3WG0AoWvWOXCBIj6M9kfTB
	 YUobReJ/93Jg9MFnZM4XyYJl0S0Fdk2gN/bjyztcLeOaW5abUtbiWwURpufeDy08A3
	 eSxGUtxBlzW8A==
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
Subject: [PATCH AUTOSEL 5.15 1/5] ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of()
Date: Tue,  6 May 2025 17:37:30 -0400
Message-Id: <20250506213734.2983663-1-sashal@kernel.org>
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
X-stable-base: Linux 5.15.181
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
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
index 2b64c0384b6bb..9b14cda56b068 100644
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


