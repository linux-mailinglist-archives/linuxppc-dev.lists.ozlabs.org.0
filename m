Return-Path: <linuxppc-dev+bounces-2637-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB2B9B2D70
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 11:53:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcVbc2PLLz2yN2;
	Mon, 28 Oct 2024 21:53:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730112780;
	cv=none; b=fCwIYRwjTy3bgOAgCS2aJamjklDZo5Waa0oe0xdr/JQJPMsSzjAauAiZiwhRFzoFhVY9DJtuqDv20VJYTh1Z086VFI92H1kofzX3Y0uh9MxZ41iS/oH0KDQd6CuAR9J6w2mQwvh7uQqjjEX2I5pW1F6URUizQLYLQeiRXbRLCHrIGN5IdS37KbupLAtHm/7VlyMLNPrgFOm+UvonTuhO/Vdwj5mlAuSEn3ci/oz9WN4MLmZooYkZCrfm8jzqymFKZUp21h4bdkkLkUMFkkwTg9JTiR7hWS1PAg/HMoEzqUZRIvOcIsQnB/C0p2Cov/6OK/a5vPwefGILJh91wMBjoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730112780; c=relaxed/relaxed;
	bh=cnp5XV7jJKWr0axyEYF+us+f9JSscY+jAMngEmWjxMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KdAqL91fp1XHH55vKKLU/EtUSYLi6WiQAmL5qQ9e3WmlGJd0G6C/qpCTckKoZBmbbj16s3a0S+AcyYC/IbXROIcUkS44rDEsvd3L7tdCVj2MIZhHH1Yum3kDUkcM3VKq+8Tjmvij0saA9+5/tTuqoZoj+he5NotUNWv16+9uM1+9mX+Hxox7CjbPoPM6OLLJeW703oyfdd3k7F4GBVXbGkSD3m6gGCNjGaHpfLSA9TVCA9gCsq+PFwnrutKQfY9goTZJ2In1GicyeIKCPRE0PSFt2EdgD6ebb+VCUXyht9IJFhddNdLOFVNZ/DFBkzz8MK6q+UoWgtVMlco0ELJXTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ks5xVe8x; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ks5xVe8x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcVbb3cxTz2xPc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 21:52:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AFD885C5A40;
	Mon, 28 Oct 2024 10:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00CDC4CEE3;
	Mon, 28 Oct 2024 10:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730112777;
	bh=84GsBB5w5R2XUUGxJbtCGUeTswrKpBuwgnJQozcOhDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ks5xVe8xyhd+qioAWP5BCx8OI13+TrGwBraAJhAaBfCi7r2m0uSzIrqk0FolzP76w
	 UWh5WMsMLyjxmW9JNtSg2xKowl0L+mUvAPUgbTjL3EJkrR7h9y1aDL0ImOMd/qVQWi
	 m6081kfRXFtOKaLrGAypqmPI2U7rFHntId1OjcRgMSYWFrnReim1VnVk0h7vs6qOvV
	 VKE52+TNtdooxn2A+hbz6KgQTef5FRL8YhKTf1LMQO4g7Ik/y1nYI+K1NzXDo4Adnx
	 jQP/TZ4Yeh2tT6/ZNTziJgHBHSSAfvJiJJJOPklrKrma+RcFNLLD8FrS9Bw3Zvn+By
	 Xv+fb0L9Ls/uw==
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
Subject: [PATCH AUTOSEL 6.1 2/8] ASoC: fsl_esai: change dev_warn to dev_dbg in irq handler
Date: Mon, 28 Oct 2024 06:52:43 -0400
Message-ID: <20241028105252.3560220-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028105252.3560220-1-sashal@kernel.org>
References: <20241028105252.3560220-1-sashal@kernel.org>
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
X-stable-base: Linux 6.1.114
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
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
index 17fefd27ec90a..39eab7f0ab6ca 100644
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


