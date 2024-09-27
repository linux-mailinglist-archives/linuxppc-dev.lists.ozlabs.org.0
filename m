Return-Path: <linuxppc-dev+bounces-1636-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB76988037
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 10:23:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFNlB1Zpjz30Gh;
	Fri, 27 Sep 2024 18:23:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=92.121.34.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727425397;
	cv=none; b=lQBPjswNombjeMq5tG2idCQd5EWcteId5j4lmJsKIj419B/S0OcxFQt1XNQCvBTxBBr0w5+N8vHWqLmJpPe1HYJ49TeWt7O+eFuSSswbhfdoeWGSfScTnfx9UmbT5iMeXTMl76+ugFIsJBAqyYY+eXWH1gnTORu4mGjy9c8SwOHHOfA8atJpjBG20bVv6mKr2nNSkrIkzUO8LjFKTCyJL8PHgro1xL5+1U7xgqcoSy0tA5UTHKZycFcmWXIIC5W0qDa5TGaEIJvwIC7CyGpx+bVv4YcOUV+pz60SJzQ+FsGsvS0VfWw6DMxCyPdHcuCcOdxaYT54cZR6AqTrU8FxUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727425397; c=relaxed/relaxed;
	bh=iyX1bX56TlP4AP3eMa/aax7CnSZ6KbNmNUFxBgRQwak=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References; b=hyJATv7wcWjUAgduaTLLGJ2fsPjMXqeyPyHq4nDqBD1D4rStzdzu4Vrh0s6Pye26Flo8HGm/kuHTkDPV39rjFrcFa8iJTjPCkWOdgob76wTR2XmPQ7gq37aTHWFwX9ggdmI2QePDmt599tdbnHi57KLwH1DrwkurSSRZ/FF1+NQZLI8JsSGLfy7Q3088cydq7hkjQacqy1uj4SHR39ZoWj/oWE42bxMsGmyPnUZyx50E0pYRYX0WIKQBxYfNljlT4zk+vRIka/zSeeK/Cy9wLLCV181rLKQVSZK+L1avyT5mrchL9yXQPUudcgxHnx/JkyI58g0rZynAS8tp0HjYTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFNl93CjVz2yhZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 18:23:16 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A6E9C201A4B;
	Fri, 27 Sep 2024 10:23:13 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 75F5D201A45;
	Fri, 27 Sep 2024 10:23:13 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id BF066183DC04;
	Fri, 27 Sep 2024 16:23:11 +0800 (+08)
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
Subject: [PATCH 1/3] ASoC: fsl_micfil: fix regmap_write_bits usage
Date: Fri, 27 Sep 2024 16:00:29 +0800
Message-Id: <1727424031-19551-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1727424031-19551-1-git-send-email-shengjiu.wang@nxp.com>
References: <1727424031-19551-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

The last parameter 1 means BIT(0), which should be the
correct BIT(X).

Fixes: 47a70e6fc9a8 ("ASoC: Add MICFIL SoC Digital Audio Interface driver.")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 193be098fa5e..c347cb3a4712 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -988,7 +988,7 @@ static irqreturn_t micfil_isr(int irq, void *devid)
 			regmap_write_bits(micfil->regmap,
 					  REG_MICFIL_STAT,
 					  MICFIL_STAT_CHXF(i),
-					  1);
+					  MICFIL_STAT_CHXF(i));
 	}
 
 	for (i = 0; i < MICFIL_FIFO_NUM; i++) {
@@ -1023,7 +1023,7 @@ static irqreturn_t micfil_err_isr(int irq, void *devid)
 	if (stat_reg & MICFIL_STAT_LOWFREQF) {
 		dev_dbg(&pdev->dev, "isr: ipg_clk_app is too low\n");
 		regmap_write_bits(micfil->regmap, REG_MICFIL_STAT,
-				  MICFIL_STAT_LOWFREQF, 1);
+				  MICFIL_STAT_LOWFREQF, MICFIL_STAT_LOWFREQF);
 	}
 
 	return IRQ_HANDLED;
-- 
2.34.1


