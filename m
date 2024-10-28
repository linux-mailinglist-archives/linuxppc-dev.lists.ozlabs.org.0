Return-Path: <linuxppc-dev+bounces-2635-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 001459B2D6B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 11:52:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcVb16qTWz2xJK;
	Mon, 28 Oct 2024 21:52:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730112749;
	cv=none; b=IHfsJcncW+Ni4ibQeflIlfneNNz9Y2F2gisasUg0mn7yB4snCJKbk3u3xAgCUrIbEfdmC0IKhFG2/NgU15fyqZ0QM0bM9TZ8cqylsRE2ZCv72me5TlK75qCLnnnGln7ufo9XkzWZJEfCDR9i7zhDTLAzOEWxpLTZOc4cMrqUpkmApQKDTWuKYGY/Joc3kvtJVoobRQ9nW4XTkEsWlWJZbYQgw4mtwQGaYUVG7W3xy0gqc5gnDzWxSqFGDaNOEDqO0a4FOts8fqh3qLzKP/S38SElMj6hMPel+HIj8Q+ZDxMmIfSvh+3MCX5A28DgNBht2XVuyrcgCGUQQVnXD0t3Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730112749; c=relaxed/relaxed;
	bh=gVbssboAnkGtxt2Pg3oKgJ9jGBAjwnqlZpdGI2LMyt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CWoFwZrsAHVWXnrZ8FYvrlymFmDRQIf4P8Ov6PL81Dmmk6KESTYhoUlVL4riJr40b0IC5Bcnn49dDeBR9enb7HNGUzxoQJVkuGfwZuL36/mE/VlBT+cNDml4BbHJzhaMFJyEYO40b2XnW69M0fGIelSvKi89NoaRDlA/9IxRwUpRF4Hf6+I+7SYYjWDuvSgUfE9pKOS57UsAN/n7KdM5hoDQXKZPzEZ59HJZ4CfyqwoAdcAnLWZW4XSP3d82pRPPA92fOEjTwahzY4NX9FBDjffzQ9hhB1xqbp193APkbN6w81Tq0sWNayzPozeLxQadZw0qLhCiaEUUKCHiqGG5aA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TQroCa56; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TQroCa56;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcVb06qxQz2xH1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 21:52:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F07F3A41BF6;
	Mon, 28 Oct 2024 10:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3017DC4CEE7;
	Mon, 28 Oct 2024 10:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730112745;
	bh=7lam01olvUb3QSFzRWm5ouSmAo57fVc3EtizsiBcnsQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TQroCa56iQzeXUL8nrps8MEdX0HTouT9bMBetWU5XncOJSI0GAFhR3nBkLJ+obTc/
	 A5Rs7oW72YN3J1wglamvxwgpUk2f96yd5ZryyxUklFbWMTFi77nue7Pc9j2PKhQqTH
	 DrtNlYfoabrkUsaPhTx+3/50NY9JDScVWW4QuBK3NGfeq8muAWHSkvWk/1oUw224HD
	 kBFdBOkY81xekuRuozptoHU8eZjWpog9MDF7CI8XbCkZW5J4/RZcoHC5kqAyeHE3Xf
	 biqEB5kAz1c3QEqoSwuD2Rp5/677wR5F2dNxRedpyVeav18l1kirKGg25nZTbsus7g
	 D7QjjBenbXcVg==
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
Subject: [PATCH AUTOSEL 6.6 03/15] ASoC: fsl_esai: change dev_warn to dev_dbg in irq handler
Date: Mon, 28 Oct 2024 06:51:59 -0400
Message-ID: <20241028105218.3559888-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028105218.3559888-1-sashal@kernel.org>
References: <20241028105218.3559888-1-sashal@kernel.org>
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
X-stable-base: Linux 6.6.58
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


