Return-Path: <linuxppc-dev+bounces-2638-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 536429B2D73
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 11:53:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcVbz0c4Hz2yL0;
	Mon, 28 Oct 2024 21:53:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730112799;
	cv=none; b=kVi813Qn16Hzzn6AVT73DGpxvaeLCbEOvbAiM7rHQeMdkJNUSyK6Hl/40W/8NlFm2uIErgQUt6mPleybOp+qK3G5mtShgbmhEoMXrTXFFerry1DTWyYdD3Wj9eq+BHZ9jg3GnbsrV/kyT8c5m2gAsYCVcOZVJBQMoK5Aujnzh8X0r0gP+gKTpAlvmYFgXkgDnozXaqhNgOx0Xzjy6Ls2I8ocdFtbo+YYptuLN0NV4anYqY3RnZ9AO/eA/9Yfpy+vQp7VFQu5Uq2B/DOenKNhJJVLhCvLQMorA6SbzMsq7KtC5a2KXaGw6DFwFI2eclxkoWlKWt/kpXWS9Lehg61LUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730112799; c=relaxed/relaxed;
	bh=oRMP66CHKbfblLibE9xptRdDBHBAs7O17e0m1wjdVmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A+4FmFa1DD0dfBUyCewOPe0I/bgACPcpvGlRrO14lgCDqIp39+cegCnaaLkEFcEW8L2y6c6I3DsRHLWkRIcAQWuYJuRxn7Qq1LIVEjusxHdMjqK2eUTLKosGhoG2pAtY2560MVZl5py2q+eJCC/b/rUDctNW0QHmRsuG3G5PZTfEE6atseqd8Trwj19X6gnjlDb3wKJ//EePmeWAlOFNN6nmFB89Lof7uRNtU210ztYNhR8TBIqmZH1h3p9AEEIriAU129VCMGXuD+lyPQwl2bgTlWcd7+LJ/d227x/bEo68fyCThFK9w+c61OkgCjp+4VEZ4gIqv28SUaU7PoW81w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rt6yO9F7; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rt6yO9F7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcVby1kbsz2xPc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 21:53:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 33F37A41BD4;
	Mon, 28 Oct 2024 10:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B7AC4CEC3;
	Mon, 28 Oct 2024 10:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730112795;
	bh=j3zZ92dY82Nr/+aVlMhvLc9sqirmrpWoRsvNNmGHFR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rt6yO9F7+K0HQuoyn9WKX7Bknz1rtiZUROVGA7OK6gyus8waslVn1aV8f91K6VaFQ
	 68oGazvDjfeQcOQSN8mSWGiTdwn7cWhYYPz5YBZdyFSjJyxjOBzWa4om9+0gmuFysw
	 7XDpI715libQtffaCUwYLUzkeXDog3qXpTsPuUk2BDos/r9SystUQxbeoeEwahjEdJ
	 opEf75QOkEFOB+hIUTCuhyH6O6QVKj7rwV5vLX8VYcQtEvjWmmO43oYrAHrDj+884T
	 yl2U/swoW6L+o4YBTOtEAOhggqNqub8FRG6tUmEve8thUz5fdnSO9MA9BF1Pg7Yf1h
	 Ixig9JmHMwgpQ==
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
Subject: [PATCH AUTOSEL 5.15 2/7] ASoC: fsl_esai: change dev_warn to dev_dbg in irq handler
Date: Mon, 28 Oct 2024 06:53:04 -0400
Message-ID: <20241028105311.3560419-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028105311.3560419-1-sashal@kernel.org>
References: <20241028105311.3560419-1-sashal@kernel.org>
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
X-stable-base: Linux 5.15.169
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
index 763f5f0592af1..2c2e1a5489225 100644
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


