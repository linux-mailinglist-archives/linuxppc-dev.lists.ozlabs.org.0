Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2E570043
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 14:56:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45shSd70TzzDqCl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 22:56:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=daniel.baluta@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45shHx0jqkzDqRD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 22:48:53 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9EE522002C8;
 Mon, 22 Jul 2019 14:48:50 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9043E20004A;
 Mon, 22 Jul 2019 14:48:50 +0200 (CEST)
Received: from fsr-ub1864-103.ea.freescale.net
 (fsr-ub1864-103.ea.freescale.net [10.171.82.17])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id D52CD205DB;
 Mon, 22 Jul 2019 14:48:49 +0200 (CEST)
From: Daniel Baluta <daniel.baluta@nxp.com>
To: broonie@kernel.org
Subject: [PATCH 03/10] ASoC: fsl_sai: Add registers definition for multiple
 datalines
Date: Mon, 22 Jul 2019 15:48:26 +0300
Message-Id: <20190722124833.28757-4-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190722124833.28757-1-daniel.baluta@nxp.com>
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 viorel.suman@nxp.com, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@nxp.com, angus@akkea.ca,
 tiwai@suse.com, perex@perex.cz, nicoleotsuka@gmail.com, linux-imx@nxp.com,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 l.stach@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SAI IP supports up to 8 data lines. The configuration of
supported number of data lines is decided at SoC integration
time.

This patch adds definitions for all related data TX/RX registers:
	* TDR0..7, Transmit data register
	* TFR0..7, Transmit FIFO register
	* RDR0..7, Receive data register
	* RFR0..7, Receive FIFO register

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 76 +++++++++++++++++++++++++++++++++++------
 sound/soc/fsl/fsl_sai.h | 36 ++++++++++++++++---
 2 files changed, 98 insertions(+), 14 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 1d1a447163e3..7f8823fe4b90 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -685,7 +685,14 @@ static struct reg_default fsl_sai_reg_defaults[] = {
 	{FSL_SAI_TCR3, 0},
 	{FSL_SAI_TCR4, 0},
 	{FSL_SAI_TCR5, 0},
-	{FSL_SAI_TDR,  0},
+	{FSL_SAI_TDR0, 0},
+	{FSL_SAI_TDR1, 0},
+	{FSL_SAI_TDR2, 0},
+	{FSL_SAI_TDR3, 0},
+	{FSL_SAI_TDR4, 0},
+	{FSL_SAI_TDR5, 0},
+	{FSL_SAI_TDR6, 0},
+	{FSL_SAI_TDR7, 0},
 	{FSL_SAI_TMR,  0},
 	{FSL_SAI_RCR1, 0},
 	{FSL_SAI_RCR2, 0},
@@ -704,7 +711,14 @@ static bool fsl_sai_readable_reg(struct device *dev, unsigned int reg)
 	case FSL_SAI_TCR3:
 	case FSL_SAI_TCR4:
 	case FSL_SAI_TCR5:
-	case FSL_SAI_TFR:
+	case FSL_SAI_TFR0:
+	case FSL_SAI_TFR1:
+	case FSL_SAI_TFR2:
+	case FSL_SAI_TFR3:
+	case FSL_SAI_TFR4:
+	case FSL_SAI_TFR5:
+	case FSL_SAI_TFR6:
+	case FSL_SAI_TFR7:
 	case FSL_SAI_TMR:
 	case FSL_SAI_RCSR:
 	case FSL_SAI_RCR1:
@@ -712,8 +726,22 @@ static bool fsl_sai_readable_reg(struct device *dev, unsigned int reg)
 	case FSL_SAI_RCR3:
 	case FSL_SAI_RCR4:
 	case FSL_SAI_RCR5:
-	case FSL_SAI_RDR:
-	case FSL_SAI_RFR:
+	case FSL_SAI_RDR0:
+	case FSL_SAI_RDR1:
+	case FSL_SAI_RDR2:
+	case FSL_SAI_RDR3:
+	case FSL_SAI_RDR4:
+	case FSL_SAI_RDR5:
+	case FSL_SAI_RDR6:
+	case FSL_SAI_RDR7:
+	case FSL_SAI_RFR0:
+	case FSL_SAI_RFR1:
+	case FSL_SAI_RFR2:
+	case FSL_SAI_RFR3:
+	case FSL_SAI_RFR4:
+	case FSL_SAI_RFR5:
+	case FSL_SAI_RFR6:
+	case FSL_SAI_RFR7:
 	case FSL_SAI_RMR:
 		return true;
 	default:
@@ -726,9 +754,30 @@ static bool fsl_sai_volatile_reg(struct device *dev, unsigned int reg)
 	switch (reg) {
 	case FSL_SAI_TCSR:
 	case FSL_SAI_RCSR:
-	case FSL_SAI_TFR:
-	case FSL_SAI_RFR:
-	case FSL_SAI_RDR:
+	case FSL_SAI_TFR0:
+	case FSL_SAI_TFR1:
+	case FSL_SAI_TFR2:
+	case FSL_SAI_TFR3:
+	case FSL_SAI_TFR4:
+	case FSL_SAI_TFR5:
+	case FSL_SAI_TFR6:
+	case FSL_SAI_TFR7:
+	case FSL_SAI_RFR0:
+	case FSL_SAI_RFR1:
+	case FSL_SAI_RFR2:
+	case FSL_SAI_RFR3:
+	case FSL_SAI_RFR4:
+	case FSL_SAI_RFR5:
+	case FSL_SAI_RFR6:
+	case FSL_SAI_RFR7:
+	case FSL_SAI_RDR0:
+	case FSL_SAI_RDR1:
+	case FSL_SAI_RDR2:
+	case FSL_SAI_RDR3:
+	case FSL_SAI_RDR4:
+	case FSL_SAI_RDR5:
+	case FSL_SAI_RDR6:
+	case FSL_SAI_RDR7:
 		return true;
 	default:
 		return false;
@@ -744,7 +793,14 @@ static bool fsl_sai_writeable_reg(struct device *dev, unsigned int reg)
 	case FSL_SAI_TCR3:
 	case FSL_SAI_TCR4:
 	case FSL_SAI_TCR5:
-	case FSL_SAI_TDR:
+	case FSL_SAI_TDR0:
+	case FSL_SAI_TDR1:
+	case FSL_SAI_TDR2:
+	case FSL_SAI_TDR3:
+	case FSL_SAI_TDR4:
+	case FSL_SAI_TDR5:
+	case FSL_SAI_TDR6:
+	case FSL_SAI_TDR7:
 	case FSL_SAI_TMR:
 	case FSL_SAI_RCSR:
 	case FSL_SAI_RCR1:
@@ -884,8 +940,8 @@ static int fsl_sai_probe(struct platform_device *pdev)
 				   MCLK_DIR(index));
 	}
 
-	sai->dma_params_rx.addr = res->start + FSL_SAI_RDR;
-	sai->dma_params_tx.addr = res->start + FSL_SAI_TDR;
+	sai->dma_params_rx.addr = res->start + FSL_SAI_RDR0;
+	sai->dma_params_tx.addr = res->start + FSL_SAI_TDR0;
 	sai->dma_params_rx.maxburst = FSL_SAI_MAXBURST_RX;
 	sai->dma_params_tx.maxburst = FSL_SAI_MAXBURST_TX;
 
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 7c1ef671da28..4bb478041d67 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -20,8 +20,22 @@
 #define FSL_SAI_TCR3	0x0c /* SAI Transmit Configuration 3 */
 #define FSL_SAI_TCR4	0x10 /* SAI Transmit Configuration 4 */
 #define FSL_SAI_TCR5	0x14 /* SAI Transmit Configuration 5 */
-#define FSL_SAI_TDR	0x20 /* SAI Transmit Data */
-#define FSL_SAI_TFR	0x40 /* SAI Transmit FIFO */
+#define FSL_SAI_TDR0	0x20 /* SAI Transmit Data 0 */
+#define FSL_SAI_TDR1	0x24 /* SAI Transmit Data 1 */
+#define FSL_SAI_TDR2	0x28 /* SAI Transmit Data 2 */
+#define FSL_SAI_TDR3	0x2C /* SAI Transmit Data 3 */
+#define FSL_SAI_TDR4	0x30 /* SAI Transmit Data 4 */
+#define FSL_SAI_TDR5	0x34 /* SAI Transmit Data 5 */
+#define FSL_SAI_TDR6	0x38 /* SAI Transmit Data 6 */
+#define FSL_SAI_TDR7	0x3C /* SAI Transmit Data 7 */
+#define FSL_SAI_TFR0	0x40 /* SAI Transmit FIFO 0 */
+#define FSL_SAI_TFR1	0x44 /* SAI Transmit FIFO 1 */
+#define FSL_SAI_TFR2	0x48 /* SAI Transmit FIFO 2 */
+#define FSL_SAI_TFR3	0x4C /* SAI Transmit FIFO 3 */
+#define FSL_SAI_TFR4	0x50 /* SAI Transmit FIFO 4 */
+#define FSL_SAI_TFR5	0x54 /* SAI Transmit FIFO 5 */
+#define FSL_SAI_TFR6	0x58 /* SAI Transmit FIFO 6 */
+#define FSL_SAI_TFR7	0x5C /* SAI Transmit FIFO 7 */
 #define FSL_SAI_TMR	0x60 /* SAI Transmit Mask */
 #define FSL_SAI_RCSR	0x80 /* SAI Receive Control */
 #define FSL_SAI_RCR1	0x84 /* SAI Receive Configuration 1 */
@@ -29,8 +43,22 @@
 #define FSL_SAI_RCR3	0x8c /* SAI Receive Configuration 3 */
 #define FSL_SAI_RCR4	0x90 /* SAI Receive Configuration 4 */
 #define FSL_SAI_RCR5	0x94 /* SAI Receive Configuration 5 */
-#define FSL_SAI_RDR	0xa0 /* SAI Receive Data */
-#define FSL_SAI_RFR	0xc0 /* SAI Receive FIFO */
+#define FSL_SAI_RDR0	0xa0 /* SAI Receive Data 0 */
+#define FSL_SAI_RDR1	0xa4 /* SAI Receive Data 1 */
+#define FSL_SAI_RDR2	0xa8 /* SAI Receive Data 2 */
+#define FSL_SAI_RDR3	0xac /* SAI Receive Data 3 */
+#define FSL_SAI_RDR4	0xb0 /* SAI Receive Data 4 */
+#define FSL_SAI_RDR5	0xb4 /* SAI Receive Data 5 */
+#define FSL_SAI_RDR6	0xb8 /* SAI Receive Data 6 */
+#define FSL_SAI_RDR7	0xbc /* SAI Receive Data 7 */
+#define FSL_SAI_RFR0	0xc0 /* SAI Receive FIFO 0 */
+#define FSL_SAI_RFR1	0xc4 /* SAI Receive FIFO 1 */
+#define FSL_SAI_RFR2	0xc8 /* SAI Receive FIFO 2 */
+#define FSL_SAI_RFR3	0xcc /* SAI Receive FIFO 3 */
+#define FSL_SAI_RFR4	0xd0 /* SAI Receive FIFO 4 */
+#define FSL_SAI_RFR5	0xd4 /* SAI Receive FIFO 5 */
+#define FSL_SAI_RFR6	0xd8 /* SAI Receive FIFO 6 */
+#define FSL_SAI_RFR7	0xdc /* SAI Receive FIFO 7 */
 #define FSL_SAI_RMR	0xe0 /* SAI Receive Mask */
 
 #define FSL_SAI_xCSR(tx)	(tx ? FSL_SAI_TCSR : FSL_SAI_RCSR)
-- 
2.17.1

