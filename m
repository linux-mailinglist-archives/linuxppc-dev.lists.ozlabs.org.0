Return-Path: <linuxppc-dev+bounces-8361-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9995BAACF8D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 23:36:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsWtC3vpSz304x;
	Wed,  7 May 2025 07:36:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746567379;
	cv=none; b=NesFe6zYTpU1+/vh+kEsAwvUqaJdKO7NMRQoUCtGJKbhV2B/dmFbqdF0sUMFMaLV1BpYNb/O6w268u853gjoxB5dosYP4eN7DKpZTl5WzCZfyIejS+6/tq2fQQjtlAZDr2LKtpgPGgu5FON2Xc0JRj9vpq2SkyqNWfKdtNymixpvd2P/HKUDeaQeUbPK8jrw/oJgHXSji/xmwXAYzI2oO00c/v89fOgji4FuxfZJg08SvJJa4lFQUFih5VjlHdAU3L9J6XCd1bigPdsmDj+6wXyiwyM0o3RxmwJugLIxSjjVG7uIMCJg3LWpMP2H731v1Lg0KHIxmpedpFOMM1rwDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746567379; c=relaxed/relaxed;
	bh=UBhgoSu/5IdrEt42iorbB9s12SvmL417LsGOIHBC3lA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VcyOBEGa2Us+Kvl0AFohelMvHYv6mMWKYB/CST137KSchEndwZJ7UUdNqDUJ6TbuV5WLvccfcvPCGjxR+wIiv9rHPA6YgtKMVwbBh2NJQ2JIFwhF04T3hCJEZJ/n0EQ9qpjF4vspWLs3lFa0fwAECXI+N0z4FkkQXEK9mDNjd0I8TLh82fE3q6KpXsdyJfJtE+tU9/yMW3NynEcv7oYswgAvRXpT9qHxwWQ3fTB1tVe3lT2T1s7/topk2eK1Rc2R2UovhP/B/zMQwvSKNHzs3HxyDa/OauunGdNSWHYeSSGfqBniue7ObaLDazFQsN5MmhUk50IK/BnPflXOTQEt4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dKl6VUYJ; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dKl6VUYJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsWtB6TkNz300F
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 07:36:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F2C89A4C3BB;
	Tue,  6 May 2025 21:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20E3C4CEE4;
	Tue,  6 May 2025 21:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567375;
	bh=yBu1az8/OZoi8PDKYPnp/10aiX5KHCwBplGq28w4TsA=;
	h=From:To:Cc:Subject:Date:From;
	b=dKl6VUYJMX/9CDIRIxh4vgqSY6j7YnuwWCtY00dsO63ca5MXGUmNHEi+pIBV8Ed6v
	 Xx0nX0J1fXsa32qQa7du82v/3d+mR4Jfw+7nB9igMxxgzIZrKcXgWNYs/66tLZlzN5
	 o6/mw0NtkejhOGrMQims4ChvY4JoDgkFmyDddnNsBkr+pzdtg9D4CQvTiCng4RzPMU
	 H8VcYre60/8HIcTI+a9Xhe3r0Lub4LItq8Bj1YVELSAR84fCGCF7SaCmZF1fgF69VB
	 Vgs8zeaB7g0FU3uvPfTkvUS5x3j3+ZKr5jqIJdYQc3q0nhh+DGpr+gKs7Ejlu7FMKH
	 S3SoVOm/sKk8g==
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
Subject: [PATCH AUTOSEL 6.12 01/18] ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of()
Date: Tue,  6 May 2025 17:35:53 -0400
Message-Id: <20250506213610.2983098-1-sashal@kernel.org>
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
X-stable-base: Linux 6.12.27
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
index 93dbe40008c00..e5ae435171d68 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -516,7 +516,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 	if (!card->dai_link)
 		return -ENOMEM;
 
-	data->link_data = devm_kcalloc(dev, num_links, sizeof(*link), GFP_KERNEL);
+	data->link_data = devm_kcalloc(dev, num_links, sizeof(*link_data), GFP_KERNEL);
 	if (!data->link_data)
 		return -ENOMEM;
 
-- 
2.39.5


