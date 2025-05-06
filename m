Return-Path: <linuxppc-dev+bounces-8363-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F191AAACF96
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 23:36:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsWtv683zz2yys;
	Wed,  7 May 2025 07:36:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746567415;
	cv=none; b=MWlsXlUgKQv7b1/r0jL/YMinkuz+APGtx90sJegTs3haZcRha2VZyjCXNHStZnmt94M6Rk79iDu+CVxWhBuUhee3BnFxQp3pEovT4TEgpEv/pGQjdBSuo/Ptse39a5sFKCA2KX9reHoC6RQHO/I+IJnSRySyisMyPUSKQSy3Nc7YGH5t05wq+NYAlp9J6r6E0nZmQ3l1CdZCyG+sAeIcSOKsOjv6paYC8MYmgnsNCYaplQ0jWs7/6/VzwEt3aNgEDDzkW1Ot3y7B1BPqf0g9cHUkUQAbXeuZMrkb2vv85Qfinv9ruGSJgP4iQSU+/u8ZFGVqxTUKwUrttpAZQmAUuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746567415; c=relaxed/relaxed;
	bh=p+Dck54LelKfFHarJJxO87LH00lqZOeaegRHSKx0xqw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FAOid6QsN8HAVrhy/pELktUB46ekFYn9NMuWxe/Np0XCFa8506B0QpQORjrr4fdu7PClOJbK33waFReEpqdR5w1u28Rj+A+hypA097f20H+CLIBN4BYczwGEcP/7+uF1AisHxDWfiZhsV4TFaMBRzgdNmPtmXUCRykEOn42mnYN82VpTMFUzuIjZTpJzZrSVGesgPRaVHFr18GlERPbCUEpBjtIuFUJhYaNqSMwbgZt4ErPrAkAX1+rdO27VklsjbojW+qSNwSjrBDH5pRJKN4F+85ZMrIgGUy98RhBDN+smk/Swx0RjpUJKRwFGCV4EfvldIUg37bWmwrLb6+FBAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V95Btymw; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V95Btymw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsWtv1sFLz2yvs
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 07:36:55 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 68B435C5A3E;
	Tue,  6 May 2025 21:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC145C4CEE4;
	Tue,  6 May 2025 21:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567413;
	bh=+fNJE1yTF2PALBlbEE+UifwLAvbWwqAE5ZTkWve7cD4=;
	h=From:To:Cc:Subject:Date:From;
	b=V95BtymwV/E5DqMEVgxfcFw1cm+UfaeVTE4Ot+mz1hWuy5jquRBNrGqRbMcxK60gm
	 kGgBDOHhzzVxIxKncgDuCr2T+PSlv9hDzWDuk9tpjo3a6/wKiHKvSZzqntNZohn9b/
	 QfigwMXfLSE9koBDnxL1KxkO7bZMDv7XguJ3PNC9pPpF6k+TrKV93CaHY+NIgjFd0/
	 snS4zfT2WYuuwQvRXNfGoCwgLuZatdeUpnuDrnzlrn7xcJ9tJ/zkrMH5vMdZs0slgG
	 FfYLVyOlHNQsuvnsvytTfhx0CvCskXCzITY4/HG9Co3r94bAB5MmLdHbVsoJnz/FI6
	 05om8T1x1HVIA==
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
Subject: [PATCH AUTOSEL 6.6 01/12] ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of()
Date: Tue,  6 May 2025 17:36:36 -0400
Message-Id: <20250506213647.2983356-1-sashal@kernel.org>
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
X-stable-base: Linux 6.6.89
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
index 7128bcf3a743e..bb304de5cc38a 100644
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


