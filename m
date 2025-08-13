Return-Path: <linuxppc-dev+bounces-10937-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB61B24F7F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 18:24:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2DG73wg7z30T8;
	Thu, 14 Aug 2025 02:23:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755102239;
	cv=none; b=CXcHH4ghzNVr1r6xtoAacRC94c1juLT1TaXh9FScLWTYnFfOEUfiQOlQQzOg6BOx0/4ZChcsa/w+CE+GfTvfa354cMryi0OOEmmPp0PAQb5mo4Qwme7fPnVOFaq7RJYtumEOJ0AycXh+oZmRZhI1YPuIjd7pwHKv9QV3Q2tf83XdO8iSW8wkqud/+iONwUONKuJkTW6qSdNzbyfc9rjiqI4qrplB+vB5jZdVm5888uZNuQ/dKnxVLy/0zoN+I81O/qx5mbjyGsv5ia0lyQv0CYa1bsTHMsBx1YlKLshEYzWOa4o218kksdcfyy8QTT/FAi8BjVLiyxXF0wQb01jaTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755102239; c=relaxed/relaxed;
	bh=J9CDF1PF8W6GybR9yld+fxwZSNsmmzu58rx45VzXl/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GuQrTlors6UNg8KCw9DsyhlpJIfBj0Qvn/CxfqaHVr7pVWG5UdEJaA0eJAeWaI0asg0DdasEhFDPWmjZY6zPDk/TmveWw+yQ45yOyy9IJ5pn9IxowBc+JE0tgAErLp1H2SRMwf6ofg/PoaYyQLiqGz73hiMaUTHcXzxXTSG2wzcz1zyVW8M2O6iq3aPdXuzThfj9aoQ/aqQ0t2CEAwZCUxdB5HTqk53ggLnCWv8PtRpf/YpEX6dMHQcr2xib80f6Wk03hImlPP8/77573U2VgNhdxAmKJfzmB5+6qp/0w9c1Htm5YE2mcsls6744GZcuTFA0T05F0VwVQFCx3yVzOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=fZVAKgIm; dkim-atps=neutral; spf=pass (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=sang-engineering.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=fZVAKgIm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2DG634K3z2xcD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 02:23:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=J9CDF1PF8W6GybR9yld+fxwZSNsmmzu58rx45VzXl/U=; b=fZVAKg
	Im5XJZUijHK8GzMZA1287OP8q6519ZCJ1em9jXw8xCB1Fq1GWqQWRtLcpl14fFhY
	RIBc9a2f6FNUMlr4Ale7km7BY/6QfQLEeFXWzkdA5QE5VcLnrPTQ6ugqYlp4DrlE
	hu1dwQOCvPwh6pckihaF80N78IXlDoL1WNdhPZM5Ecdx6wGSZtPvKrndFF2JdlbU
	nemFjUD9B5yn9xcZRounsyXAIxSxkJLBCOMbFngFacoEq/+eLovUE0qm7rkyGkfi
	BoP3V2RHzOI30yAjGRfo4t81Dnvm5hgbXLQPM3FQzGQ7ZNg52KGzJDqfM3P6u37R
	iz0bjWIOXKSztaUA==
Received: (qmail 695904 invoked from network); 13 Aug 2025 18:16:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 18:16:34 +0200
X-UD-Smtp-Session: l3s3148p1@ZT75ekE8Gr1tKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 21/21] ASoC: remove unneeded 'fast_io' parameter in regmap_config
Date: Wed, 13 Aug 2025 18:15:07 +0200
Message-ID: <20250813161517.4746-22-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 sound/soc/fsl/fsl_sai.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index c313b654236c..cf1915b93d78 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1244,7 +1244,6 @@ static struct regmap_config fsl_sai_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 
 	.max_register = FSL_SAI_RMR,
 	.reg_defaults = fsl_sai_reg_defaults_ofs0,
-- 
2.47.2


