Return-Path: <linuxppc-dev+bounces-2639-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4329B2D77
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 11:53:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcVcG6s9Cz2yNR;
	Mon, 28 Oct 2024 21:53:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730112814;
	cv=none; b=nZGTWbKTgM0Nev/lY2JAjCObFDJmP6NzL4SDzrTSEVt7VuyG9g+TO3wY9qwVbtWRbPgLAI/WxI1+DHk5+FiYqQHPMInMH8cSO0jOd2mMff7U+lI1wf7VUYRXAhSH3+yPtPXOSy5rEdKYepYa66ESuaIPgNH1/R+I3KW/rrgf+yi/eWyE6NjHOy59zYJRLy3kBrCdQhQmOtGFni2RPMtMmh1TS354rszOR3bF5/ri6/Uazf76sz4iH8egeIXUGWMw+yU84RGDvB/3VHtn3MJuTAwfCcKmHvHDfZdgm1K9uAddvRk2O96zP4BbwGIeZJJ2p9WTAwcZO4FzEHzTVeNlBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730112814; c=relaxed/relaxed;
	bh=pAIJdewgculPX7/zawbioClDAMHomUnPCeK5FblnGqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IlvQDgr5yb2+XYch1w7IIxMtGFFeKEJUUFgALttfbiE8D7UjkPD9iH6+HQ8DBOCGO0DushRpOO8f8uFNeNBpee0yAEb6QBIMqtVN1I28HXxOE3FpXksfwIE8tITgyfcXagIaPoJQOQ2DKQU0he6h6RLdViP4zcZBFJF9BydeJ6DT6S6x83sXfncF7LccFCvvjZaF6Uqcg6atVV/Q6gSqxMIjqSmoHmd71x2RL4LBD24rQB68VS7KH4521IWWc+NLcgutwzxxgSUjViXkvxkOy/m/GajTqBg1PXSL23PTEsQH982Day00PqAwa/NLpZEs+lcQwL1tRgrO0IEcoic3uA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oEHycxlm; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oEHycxlm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcVcG04cKz2xPc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 21:53:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C80A7A41C1B;
	Mon, 28 Oct 2024 10:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D311C4CEE4;
	Mon, 28 Oct 2024 10:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730112811;
	bh=pquUi3GFsc2qWnsQ6j4Q1aC0V0bSxG/2pY7Vq/C+t2g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oEHycxlm+i7MHY0rVAl+iEESXM2ovJf2vko+qZk12U8M5gWWXxaZ08yctIzkrlvIa
	 PB6siduA/9hgXInWSETU2XXjCZho/lIBLx6hbBPPx2O7lMXRORdARNOTfC1G/4yvMQ
	 jvJ7jQrl4q4vyfWO16KjcbdkrTjhw+ReEV5TPzhyhQ3PvnWxelibks6zvZY2vbYUc0
	 zbPZtlPx9YXLr17jwypxrTFFyxWBaziSCI/NoZluG8pLxTTydt7pMmpgDee8+rtDRH
	 yhVRBAMO49TTSHPX/bQybASShd/W2MF5dLepp2O2kKGSOC5N5kC1q5XYZGA+5BTSly
	 EDU/70zrJMUqQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 5.10 2/4] ASoC: fsl_esai: change dev_warn to dev_dbg in irq handler
Date: Mon, 28 Oct 2024 06:53:23 -0400
Message-ID: <20241028105327.3560637-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028105327.3560637-1-sashal@kernel.org>
References: <20241028105327.3560637-1-sashal@kernel.org>
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
X-stable-base: Linux 5.10.228
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Shengjiu Wang <shengjiu.wang@nxp.com>

[ Upstream commit 54c805c1eb264c839fa3027d0073bb7f323b0722 ]

Irq handler need to be executed as fast as possible, so
the log in irq handler is better to use dev_dbg which needs
to be enabled when debugging.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Link: https://patch.msgid.link/1728622433-2873-1-git-send-email-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/fsl_esai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 9f5f217a96077..cd215cec726be 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -124,10 +124,10 @@ static irqreturn_t esai_isr(int irq, void *devid)
 		dev_dbg(&pdev->dev, "isr: Transmission Initialized\n");
 
 	if (esr & ESAI_ESR_RFF_MASK)
-		dev_warn(&pdev->dev, "isr: Receiving overrun\n");
+		dev_dbg(&pdev->dev, "isr: Receiving overrun\n");
 
 	if (esr & ESAI_ESR_TFE_MASK)
-		dev_warn(&pdev->dev, "isr: Transmission underrun\n");
+		dev_dbg(&pdev->dev, "isr: Transmission underrun\n");
 
 	if (esr & ESAI_ESR_TLS_MASK)
 		dev_dbg(&pdev->dev, "isr: Just transmitted the last slot\n");
-- 
2.43.0


