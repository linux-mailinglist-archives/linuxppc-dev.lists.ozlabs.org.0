Return-Path: <linuxppc-dev+bounces-2633-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 831D49B2D56
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 11:51:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcVYb3bR6z2yJ5;
	Mon, 28 Oct 2024 21:51:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730112675;
	cv=none; b=I5QhH0N6h9zrubQBb4pAjxSaD+3P3b6esmD1YOc88yD2qFydeiinqOdP/n20YqDDr5pagQtoHC2gyLOg0wB8NasqddgOa8ibCQO+rYBtD2d//onONsayXiLr+ZiH7sA3oGmlDb2EIgdSEfpewa/lxz58NCXL2w5eHPhG0hWBFWWTojJ1AYymdhsR4bszYY9FbGt3iC6E31xyaQ4kI/SG0obOfMlarVBBwbcr0CUFWZF1oA9xkAQvvV0yFrViQhu/9rLFNjegEJVnZJmqfaM0so6p6JL3m8J1b+unvFQ+RdJliEhl3M0smRsyiWOiIqQs7wy9TQY2PtVHRcbeng1m/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730112675; c=relaxed/relaxed;
	bh=gVbssboAnkGtxt2Pg3oKgJ9jGBAjwnqlZpdGI2LMyt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QS054e70WDlWksv0Yrt2N1VL5iMNVdC2zfP9f4S1XuDy5y51PzJP2keAkiUw7VwB3dPweCquZ9mMtIydMnBAHmES/NHfFD2LggpbbQAQmKs7S08OOGBw20eObedqOOGf1tLCY9AA/273J/HgaJsXAj94j9Dz+3RPJOy+u/x+n5oXbYOc7aRssbl4IBpYhXXig+dhXFvagGTFoFlDq7gBUTVZNKrfPK0w2yfV3w6/6DrnPKL71PmTF+lhcqa2fDSBfLhFTkg9Ng6Wipn4tHF/ulffnGW7rH9xELSJWgqKl6zvPK2uvySJtJIUC4vhARMQ0n/xY9GZAfZATrsah5SbgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bFzqSECV; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bFzqSECV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcVYY4ncpz2yHj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 21:51:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 495E6A41BF9;
	Mon, 28 Oct 2024 10:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B76C4CEE8;
	Mon, 28 Oct 2024 10:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730112669;
	bh=7lam01olvUb3QSFzRWm5ouSmAo57fVc3EtizsiBcnsQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bFzqSECVcqWowTN2vTltnRV/Oyxyg9LNCwpgEtv16bkNeK53zzb/0Z5M19CUwGBKb
	 gvqo++yzNZGLVv0dn0C6hmoRVKChatWBkrG8JWNq2j18whCtaPmsccAz5ID1+Et8w8
	 QGYlQMTd0Gvs4Vqi8FrEgd16R7jUxOC7vNzoOO8IwMsQyq7mUW9/dEkBumf8MQkOJn
	 JJx7w+1lycK+vyNDkLGTcu3pz193sAvNxL5MlSq914A4CxzihOosEHDAsZS5N1glqj
	 guOHV8rDIDHsTizXvwmsPTuKx1kO+OAuPsqupKcz+MBah1LjV0O95fNwPR+Qx7lNsS
	 cKPkFZhhuVP2Q==
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
Subject: [PATCH AUTOSEL 6.11 05/32] ASoC: fsl_esai: change dev_warn to dev_dbg in irq handler
Date: Mon, 28 Oct 2024 06:49:47 -0400
Message-ID: <20241028105050.3559169-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028105050.3559169-1-sashal@kernel.org>
References: <20241028105050.3559169-1-sashal@kernel.org>
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
X-stable-base: Linux 6.11.5
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
index d0d8a01da9bdd..0cf9484183d43 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -119,10 +119,10 @@ static irqreturn_t esai_isr(int irq, void *devid)
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


