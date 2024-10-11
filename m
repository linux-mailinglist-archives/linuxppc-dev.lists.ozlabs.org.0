Return-Path: <linuxppc-dev+bounces-2092-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEAD999C02
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 07:17:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPvyB5q7Kz3bj8;
	Fri, 11 Oct 2024 16:17:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=92.121.34.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728623842;
	cv=none; b=eFQIIVVifVUJSa24NYvZhnQMZLHRSIMiSo5ivClmKe5g4vIyV2/Z43ylNjbeRKSzseftB185lukKl40+fcjai8F1qozM33SC+TxUEo4EMWtfTjZnghWXV2ox7EBuieMuBxjSa6iKAexaocUG7Zgv1pnpJjqILtqZeQKlQ9v8xkuNnbs/y5tKlFU5z1KkzwwwFvRf5af8IdZ6D2QxIN3vfa+ZEmQ1cabeH8Gt6JRV6bf023xTazJ4tHyRBAPL7uTo3MxJE5Jxjs9ScGdFBuJYbXv97e/hnwgCMbW85o+/935w4ABDmbNeOWK9BhLkXoGLkkRLNiHDRCuqTkBqd4Ln6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728623842; c=relaxed/relaxed;
	bh=UYPmkPrq5u5G1a15knjf7zPNwstwyoyCgqZ0LmNhcOc=;
	h=From:To:Subject:Date:Message-Id; b=LzMvk8p+zqdTVRuPG/g18ULjyJZRWhYj2Yul1+//BA6eORtGZJin9QQ5wJIGcHZ6mHuqmV7FoLESETOdkbSsiy9FpJwaccQnX5xMZRTjOQksiISfP1h9z5jAqVv0y99UsXPS2GuON5ppG7XPp6M5MWjTFKLs1xcqtgAW1r6YU5dixQG+pEdkdvrHB94b8fJB2S1DOCgCxNhWSDTa5w6YwJymr83yjLZ3bZdlXBylenxCqQmcWgxmcsz3cJk5aS0ZMmOkhLNTFoFUa//d32fbDCUInfn70dlO7o4P0Cy6Y/z0alrEs9estymBFNECovEevN2iecz0/t8X6bee6QDKhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPvy94vF3z3bj7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 16:17:21 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BA0621A18CD;
	Fri, 11 Oct 2024 07:17:17 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 802E41A18A2;
	Fri, 11 Oct 2024 07:17:17 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id D3E9F183B720;
	Fri, 11 Oct 2024 13:17:15 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_esai: change dev_warn to dev_dbg in irq handler
Date: Fri, 11 Oct 2024 12:53:53 +0800
Message-Id: <1728622433-2873-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Irq handler need to be executed as fast as possible, so
the log in irq handler is better to use dev_dbg which needs
to be enabled when debugging.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_esai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index a65f5b9935a2..0b247f16a163 100644
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
2.34.1


