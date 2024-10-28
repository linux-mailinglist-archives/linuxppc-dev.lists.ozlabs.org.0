Return-Path: <linuxppc-dev+bounces-2641-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D32D99B2D7B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 11:53:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcVcb5MYpz2yQ9;
	Mon, 28 Oct 2024 21:53:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730112831;
	cv=none; b=X5UOZpJHLxyy6AcxWmXCsprFmuURYi7aJ1kKjawmVDQW8+lWiX0oFYBllhmLIHHH1W2RtxuDdBAm25h03egK7JIVQCUSNQaQcFeg4cFROYgz9FsnCmcr99d9v+3m46e7Kobt3Ru/fLlVpIm+QllvfN2wDVgQT7CKnKEk1nl+NQV5J4rQIBZPkbg9Ye/QTDT2zUSeIrikP1PsRUzk1XLNum8vswrFnZ3PxgpgqXSGJj6oagBUL5lVlSxJkODAvYDr6EQ/bgiG8wFkkvzWocWO8oyJfialeHQNrKagJdvOa9B51W8rvc/t/C6RBSnCWPRyFcE/TciWWNMXlOpGU4vzGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730112831; c=relaxed/relaxed;
	bh=vHDvSMf2RKVr+ae8CaeTeWusOYt4k7GlU9zerubOJzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kGYXaQMyjdnU3SITjj1lzUNy8f4FKALk0ILGvxJRraDjdcapmbRizg5eQUpQXtk/VVHLvWVG3F4rZw2Gk2nxfCf5PSSBXaEkr1vFtgxcyeFZghUu0WgGWkqi886sFgFzstkib1SULYY0Gu1wFLfmx0VWeqYk9og2crwU7RjkJDQmGE8izblc3d2qXITpjYUVKRU+rYnGflijN9wchmhfd+bWzc7fV1pDsdJdXkGzRSKW5sOCgq3nxlT7Cz8LfazcZ6QOPvGLiA0lMouZAZuzLyoLXLb439fDx94uxFupN9lN6Te13SsPyrV+Fta/0f+wqll4uNh2NuoLrJ544mJnpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pUcmGRnb; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pUcmGRnb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcVcZ6WCYz2xPc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 21:53:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D9DB65C5A14;
	Mon, 28 Oct 2024 10:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E66EC4CEC3;
	Mon, 28 Oct 2024 10:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730112826;
	bh=v/yJgJ9CHq0ckMx8H6tzHK9iCJJWIhgHvJBlKLxKKok=;
	h=From:To:Cc:Subject:Date:From;
	b=pUcmGRnbpVI72Y9Mse8nsidUiBEdXY5TnHrmssxXPzPxFgTW/xx8q90MvM4PWUoMX
	 JWTOrJFWnRqfnKgAOkYiQGcD+6evDBJ4vfJsH9w6fMfQLdZWp9JbkxNjCUYu3nLmQE
	 OGNjghb7osyy6rxNTkCr4Ne05lIje13O5idSVlSGytmXN5mLcv0Q7+kUsytZ8ZIVMZ
	 QoikDFmsngjp4UZrlWNEaAqFhVGfwGQKKcjvRAiblcmeQXk02DIzy4BoE1s3MUVbxS
	 0h3QcZrIO+WAKmmLuccq4owpsUJUfVOyNL0F9BwC8y42rKrtViLdZZKNWeyGhz0rnD
	 UDyVG57e7ux1g==
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
Subject: [PATCH AUTOSEL 4.19 1/3] ASoC: fsl_esai: change dev_warn to dev_dbg in irq handler
Date: Mon, 28 Oct 2024 06:53:41 -0400
Message-ID: <20241028105343.3560809-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
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
X-stable-base: Linux 4.19.322
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
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
index baa76337c33f3..e3c324467a9b4 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -77,10 +77,10 @@ static irqreturn_t esai_isr(int irq, void *devid)
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


