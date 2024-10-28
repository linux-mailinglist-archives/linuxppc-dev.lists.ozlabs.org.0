Return-Path: <linuxppc-dev+bounces-2640-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8297B9B2D78
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 11:53:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcVcQ33yMz2yNt;
	Mon, 28 Oct 2024 21:53:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730112822;
	cv=none; b=H8VjBOgifDXntqlqPgSWr4jhK8JfqeH7pBXGRcmVGO2H0ZeW6xft6tYvuyFjJlircYUVV/5hSE5L5nY2QCWfipQmV+31GBZ1xXmYcgiThMKn36b2sKOKLAZaEXQr823bZ/Jcr1x5FchXHaSJ7eQguFPMweOonUQQS5fXh+2gdwS2KypGV1QD9ufU9cwikZaiA31gGTkc6tVqEDdxzbxXVKuGRBwKtkOSamieuSAzkcHrAJsdCH6JjX20L95g9smvKq5HTi5tx55Fphtgxr4ByRIt3pjZklZa71nmmDP38F7bYus+QRY4zLI8y2o+RtKWB5EbrKpqdAC/sCtTruuOqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730112822; c=relaxed/relaxed;
	bh=yoRDYk6s6+vAEVMSKtngCMS/tdQHsx9UQLVYquVgG54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MA2tVSfYJcftHtebkeEfF8x8GVPpTW9pwb3tBWaLj3d4evUU8hLZBRIdCm4KnkEXQNa2+p/YFC6yU9AUgufUyuoyz+UbjG5G38k1OBLJW7V/DOF0B0SMOMLRbNOraZVC/IEEsFbrNzsQwDfGWrNgd7vtk4wlZphl1M8WASdRZXKDXJk2b7tq3DoUbs8sTSSH1saPA+Uhzk9j4sWS58a+7+wCfHcBQelm/UUdh83SzGU56BBzLBSEWoHZ0NfO6d0TM+LEdXjtC3gemaxQCliILHHSPCbF+XZsOnYWwz/66uyb/r5u37e19dOZPOGvwPmMy7CFgmx1Arupzqw7zyp+FA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jZoK+lID; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jZoK+lID;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcVcP3lQNz2xPc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 21:53:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7965EA41BFE;
	Mon, 28 Oct 2024 10:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DA3C4CEC3;
	Mon, 28 Oct 2024 10:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730112819;
	bh=6WZXQ1MujIT4FRtqwHDvxkdeBFqBLQzEoNLj7/HKqes=;
	h=From:To:Cc:Subject:Date:From;
	b=jZoK+lIDLFXPL2exrRQ+9KKXs+iIoQuaziH4qMOaqbzXi5e5X6Am6dQze7Sl4Zcf7
	 4UrTXyXw8CXB22etHDkOeXl6i5MZ3xtQW8W0sjzRL3XV3GLM6hda/nZci7gHkXupCL
	 EOjKmY8XJ2E9knwmt/iAakolDlo/ew8ql3WrTu0FlT9sYhvcYivsfV1YLg8e5zxarm
	 ch5WGpba15Xsc1iXklRFW4UZA0do7v2JkkX3n5oDswfHwqUw7sMRS0k+DdjqpaGgTZ
	 3BjPnqK/3Y6QBD1canGAzIQe3hLYq8NSgdy6ZpBvNLjcrRpjQJARliTbsXDdVFvnD8
	 aNLkR63ScwKfA==
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
Subject: [PATCH AUTOSEL 5.4 1/3] ASoC: fsl_esai: change dev_warn to dev_dbg in irq handler
Date: Mon, 28 Oct 2024 06:53:33 -0400
Message-ID: <20241028105336.3560730-1-sashal@kernel.org>
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
X-stable-base: Linux 5.4.284
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
index 33ade79fa032e..4904f48de612d 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -98,10 +98,10 @@ static irqreturn_t esai_isr(int irq, void *devid)
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


