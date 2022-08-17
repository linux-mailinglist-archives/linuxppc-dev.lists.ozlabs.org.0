Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4DD5968C1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 07:42:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6xjT4b9nz3cFl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 15:42:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6xj26pZBz2xKf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 15:41:41 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 31AE41A1A83;
	Wed, 17 Aug 2022 07:41:38 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id EC0291A1A2E;
	Wed, 17 Aug 2022 07:41:37 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 71091180031E;
	Wed, 17 Aug 2022 13:41:36 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	shengjiu.wang@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_sai: Remove unnecessary FIFO reset in ISR
Date: Wed, 17 Aug 2022 13:24:27 +0800
Message-Id: <1660713867-26921-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The FIFO reset drops the words in the FIFO, which may cause
channel swap when SAI module is running, especially when the
DMA speed is low. So it is not good to do FIFO reset in ISR,
then remove the operation.

Fixes: e2681a1bf5ae ("ASoC: fsl_sai: Add isr to deal with error flag")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index d430eece1d6b..a7fa6f0bf83d 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -114,11 +114,8 @@ static irqreturn_t fsl_sai_isr(int irq, void *devid)
 	if (flags & FSL_SAI_CSR_SEF)
 		dev_dbg(dev, "isr: Tx Frame sync error detected\n");
 
-	if (flags & FSL_SAI_CSR_FEF) {
+	if (flags & FSL_SAI_CSR_FEF)
 		dev_dbg(dev, "isr: Transmit underrun detected\n");
-		/* FIFO reset for safety */
-		xcsr |= FSL_SAI_CSR_FR;
-	}
 
 	if (flags & FSL_SAI_CSR_FWF)
 		dev_dbg(dev, "isr: Enabled transmit FIFO is empty\n");
@@ -148,11 +145,8 @@ static irqreturn_t fsl_sai_isr(int irq, void *devid)
 	if (flags & FSL_SAI_CSR_SEF)
 		dev_dbg(dev, "isr: Rx Frame sync error detected\n");
 
-	if (flags & FSL_SAI_CSR_FEF) {
+	if (flags & FSL_SAI_CSR_FEF)
 		dev_dbg(dev, "isr: Receive overflow detected\n");
-		/* FIFO reset for safety */
-		xcsr |= FSL_SAI_CSR_FR;
-	}
 
 	if (flags & FSL_SAI_CSR_FWF)
 		dev_dbg(dev, "isr: Enabled receive FIFO is full\n");
-- 
2.34.1

