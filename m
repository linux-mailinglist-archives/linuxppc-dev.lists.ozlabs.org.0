Return-Path: <linuxppc-dev+bounces-1816-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C90993EE9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 08:51:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XN69q47zKz2xY0;
	Tue,  8 Oct 2024 17:51:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=92.121.34.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728370271;
	cv=none; b=a7SZ1itidN4dkUHz994VbI8IT+pk38ZR+iQOQnIYd+6LrKnxBQcUzfbQ4JO6UTf6XzksM7qSh9nwEBeJwPnite+xqDXDhdmp0s96JiJghlJEM9Rv7QTqk8ar3j04NMIyvYT7hwytzyceFHWX8DFUUTT5kfjxKuNhq2q+yRrzlxbBTp1fXYdDVlNFXUP3376oyvklpiRY/JlhHuWoevQ/HFfGBJROYbUJsIzFOZrbgi+IHCapjK9MNviVFTA2iuno+6VHtp02hKgm8fenOcNEe3DfFT6z0cHMAmyLyKKE8/EaiZcgA38Y6AQcaHNu2+jiftb65/477wyag1BVfNAprw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728370271; c=relaxed/relaxed;
	bh=WGhe5+/a0RKYvSszaJGmZaEA2I6QsbpMmlsmXcNUBcY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References; b=Z4X2c/wJ6CDCRXiQVAp1ysyDO/AVxQbQigbgnhLcZ2RbIVcKlI7HTfFVStW1NDj1LRoJ7XHNwx2eqHeezoC1vEBeyramTZY/9eBAfatG3pOHrbMDyqZOvTT7AII2yKKXK1uZ4lcoT8fuHsj2hn2C+q/DapFdEfDgcPVxNOA39jY5LTTJtj6MhoXbnfTvua+NGsMHY0WIDQX6mxR1tCbBY3cAgEgmDR8X0VJvfIxFXWqObwp2c7/Wc0ZLGYSZ87JAtrEOYbRi4kLNrFGi9U6BPzGS/ZOo8jHerJLD9+8foffKgkJYZQR70Vaw1iY9k8vOw9EY+FbzS88ACv3hy0ayyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XN69l6kRTz2xSl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 17:51:07 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3D9A5200269;
	Tue,  8 Oct 2024 08:51:05 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 03EA1200222;
	Tue,  8 Oct 2024 08:51:05 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 55889183B721;
	Tue,  8 Oct 2024 14:51:03 +0800 (+08)
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
Subject: [PATCH 1/2] ASoC: fsl_xcvr: enable interrupt of cmdc status update
Date: Tue,  8 Oct 2024 14:27:52 +0800
Message-Id: <1728368873-31379-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1728368873-31379-1-git-send-email-shengjiu.wang@nxp.com>
References: <1728368873-31379-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

This enables the interrupt to be asserted when there
is a change in Capabilities data structure / Latency
request of the CMDC Status register.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 4 ++++
 sound/soc/fsl/fsl_xcvr.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index beede7344efd..9e24d6462c01 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1265,6 +1265,10 @@ static irqreturn_t irq0_isr(int irq, void *devid)
 		dev_dbg(dev, "DMA write request\n");
 		isr_clr |= FSL_XCVR_IRQ_DMA_WR_REQ;
 	}
+	if (isr & FSL_XCVR_IRQ_CMDC_STATUS_UPD) {
+		dev_dbg(dev, "CMDC status update\n");
+		isr_clr |= FSL_XCVR_IRQ_CMDC_STATUS_UPD;
+	}
 
 	if (isr_clr) {
 		regmap_write(regmap, FSL_XCVR_EXT_ISR_CLR, isr_clr);
diff --git a/sound/soc/fsl/fsl_xcvr.h b/sound/soc/fsl/fsl_xcvr.h
index 882428592e1a..ce27b13698e7 100644
--- a/sound/soc/fsl/fsl_xcvr.h
+++ b/sound/soc/fsl/fsl_xcvr.h
@@ -165,6 +165,7 @@
 					 FSL_XCVR_IRQ_MUTE | \
 					 FSL_XCVR_IRQ_FIFO_UOFL_ERR | \
 					 FSL_XCVR_IRQ_HOST_WAKEUP | \
+					 FSL_XCVR_IRQ_CMDC_STATUS_UPD |\
 					 FSL_XCVR_IRQ_ARC_MODE)
 
 #define FSL_XCVR_ISR_CMDC_TX_EN		BIT(3)
-- 
2.34.1


