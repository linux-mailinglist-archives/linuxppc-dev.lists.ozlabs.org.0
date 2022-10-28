Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFAA610B3E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 09:25:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzDZy3m8Lz3cFG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 18:24:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzDZL1fmbz3c6D
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 18:24:24 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D39791A0CE8;
	Fri, 28 Oct 2022 09:24:20 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6B4841A0CDE;
	Fri, 28 Oct 2022 09:24:20 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E1F83183486A;
	Fri, 28 Oct 2022 15:24:18 +0800 (+08)
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
Subject: [PATCH] ASoC: fsl_xcvr: Add Counter registers
Date: Fri, 28 Oct 2022 15:03:47 +0800
Message-Id: <1666940627-7611-1-git-send-email-shengjiu.wang@nxp.com>
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

These counter registers are part of register list,
add them to complete the register map

- DMAC counter control registers
- Data path Timestamp counter register
- Data path bit counter register
- Data path bit count timestamp register
- Data path bit read timestamp register

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 40 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_xcvr.h | 21 +++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index c043efe4548d..2a6802fb2a8b 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -934,6 +934,14 @@ static const struct reg_default fsl_xcvr_reg_defaults[] = {
 	{ FSL_XCVR_RX_DPTH_CTRL_SET,	0x00002C89 },
 	{ FSL_XCVR_RX_DPTH_CTRL_CLR,	0x00002C89 },
 	{ FSL_XCVR_RX_DPTH_CTRL_TOG,	0x00002C89 },
+	{ FSL_XCVR_RX_DPTH_CNTR_CTRL,	0x00000000 },
+	{ FSL_XCVR_RX_DPTH_CNTR_CTRL_SET, 0x00000000 },
+	{ FSL_XCVR_RX_DPTH_CNTR_CTRL_CLR, 0x00000000 },
+	{ FSL_XCVR_RX_DPTH_CNTR_CTRL_TOG, 0x00000000 },
+	{ FSL_XCVR_RX_DPTH_TSCR, 0x00000000 },
+	{ FSL_XCVR_RX_DPTH_BCR,  0x00000000 },
+	{ FSL_XCVR_RX_DPTH_BCTR, 0x00000000 },
+	{ FSL_XCVR_RX_DPTH_BCRR, 0x00000000 },
 	{ FSL_XCVR_TX_DPTH_CTRL,	0x00000000 },
 	{ FSL_XCVR_TX_DPTH_CTRL_SET,	0x00000000 },
 	{ FSL_XCVR_TX_DPTH_CTRL_CLR,	0x00000000 },
@@ -944,6 +952,14 @@ static const struct reg_default fsl_xcvr_reg_defaults[] = {
 	{ FSL_XCVR_TX_CS_DATA_3,	0x00000000 },
 	{ FSL_XCVR_TX_CS_DATA_4,	0x00000000 },
 	{ FSL_XCVR_TX_CS_DATA_5,	0x00000000 },
+	{ FSL_XCVR_TX_DPTH_CNTR_CTRL,	0x00000000 },
+	{ FSL_XCVR_TX_DPTH_CNTR_CTRL_SET, 0x00000000 },
+	{ FSL_XCVR_TX_DPTH_CNTR_CTRL_CLR, 0x00000000 },
+	{ FSL_XCVR_TX_DPTH_CNTR_CTRL_TOG, 0x00000000 },
+	{ FSL_XCVR_TX_DPTH_TSCR, 0x00000000 },
+	{ FSL_XCVR_TX_DPTH_BCR,	 0x00000000 },
+	{ FSL_XCVR_TX_DPTH_BCTR, 0x00000000 },
+	{ FSL_XCVR_TX_DPTH_BCRR, 0x00000000 },
 	{ FSL_XCVR_DEBUG_REG_0,		0x00000000 },
 	{ FSL_XCVR_DEBUG_REG_1,		0x00000000 },
 };
@@ -975,6 +991,14 @@ static bool fsl_xcvr_readable_reg(struct device *dev, unsigned int reg)
 	case FSL_XCVR_RX_DPTH_CTRL_SET:
 	case FSL_XCVR_RX_DPTH_CTRL_CLR:
 	case FSL_XCVR_RX_DPTH_CTRL_TOG:
+	case FSL_XCVR_RX_DPTH_CNTR_CTRL:
+	case FSL_XCVR_RX_DPTH_CNTR_CTRL_SET:
+	case FSL_XCVR_RX_DPTH_CNTR_CTRL_CLR:
+	case FSL_XCVR_RX_DPTH_CNTR_CTRL_TOG:
+	case FSL_XCVR_RX_DPTH_TSCR:
+	case FSL_XCVR_RX_DPTH_BCR:
+	case FSL_XCVR_RX_DPTH_BCTR:
+	case FSL_XCVR_RX_DPTH_BCRR:
 	case FSL_XCVR_TX_DPTH_CTRL:
 	case FSL_XCVR_TX_DPTH_CTRL_SET:
 	case FSL_XCVR_TX_DPTH_CTRL_CLR:
@@ -985,6 +1009,14 @@ static bool fsl_xcvr_readable_reg(struct device *dev, unsigned int reg)
 	case FSL_XCVR_TX_CS_DATA_3:
 	case FSL_XCVR_TX_CS_DATA_4:
 	case FSL_XCVR_TX_CS_DATA_5:
+	case FSL_XCVR_TX_DPTH_CNTR_CTRL:
+	case FSL_XCVR_TX_DPTH_CNTR_CTRL_SET:
+	case FSL_XCVR_TX_DPTH_CNTR_CTRL_CLR:
+	case FSL_XCVR_TX_DPTH_CNTR_CTRL_TOG:
+	case FSL_XCVR_TX_DPTH_TSCR:
+	case FSL_XCVR_TX_DPTH_BCR:
+	case FSL_XCVR_TX_DPTH_BCTR:
+	case FSL_XCVR_TX_DPTH_BCRR:
 	case FSL_XCVR_DEBUG_REG_0:
 	case FSL_XCVR_DEBUG_REG_1:
 		return true;
@@ -1017,6 +1049,10 @@ static bool fsl_xcvr_writeable_reg(struct device *dev, unsigned int reg)
 	case FSL_XCVR_RX_DPTH_CTRL_SET:
 	case FSL_XCVR_RX_DPTH_CTRL_CLR:
 	case FSL_XCVR_RX_DPTH_CTRL_TOG:
+	case FSL_XCVR_RX_DPTH_CNTR_CTRL:
+	case FSL_XCVR_RX_DPTH_CNTR_CTRL_SET:
+	case FSL_XCVR_RX_DPTH_CNTR_CTRL_CLR:
+	case FSL_XCVR_RX_DPTH_CNTR_CTRL_TOG:
 	case FSL_XCVR_TX_DPTH_CTRL_SET:
 	case FSL_XCVR_TX_DPTH_CTRL_CLR:
 	case FSL_XCVR_TX_DPTH_CTRL_TOG:
@@ -1026,6 +1062,10 @@ static bool fsl_xcvr_writeable_reg(struct device *dev, unsigned int reg)
 	case FSL_XCVR_TX_CS_DATA_3:
 	case FSL_XCVR_TX_CS_DATA_4:
 	case FSL_XCVR_TX_CS_DATA_5:
+	case FSL_XCVR_TX_DPTH_CNTR_CTRL:
+	case FSL_XCVR_TX_DPTH_CNTR_CTRL_SET:
+	case FSL_XCVR_TX_DPTH_CNTR_CTRL_CLR:
+	case FSL_XCVR_TX_DPTH_CNTR_CTRL_TOG:
 		return true;
 	default:
 		return false;
diff --git a/sound/soc/fsl/fsl_xcvr.h b/sound/soc/fsl/fsl_xcvr.h
index 7f2853c60085..4769b0fca21d 100644
--- a/sound/soc/fsl/fsl_xcvr.h
+++ b/sound/soc/fsl/fsl_xcvr.h
@@ -49,6 +49,16 @@
 #define FSL_XCVR_RX_DPTH_CTRL_CLR	0x188
 #define FSL_XCVR_RX_DPTH_CTRL_TOG	0x18c
 
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL	0x1C0
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_SET	0x1C4
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_CLR	0x1C8
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TOG	0x1CC
+
+#define FSL_XCVR_RX_DPTH_TSCR		0x1D0
+#define FSL_XCVR_RX_DPTH_BCR		0x1D4
+#define FSL_XCVR_RX_DPTH_BCTR		0x1D8
+#define FSL_XCVR_RX_DPTH_BCRR		0x1DC
+
 #define FSL_XCVR_TX_DPTH_CTRL		0x220 /* TX datapath ctrl reg */
 #define FSL_XCVR_TX_DPTH_CTRL_SET	0x224
 #define FSL_XCVR_TX_DPTH_CTRL_CLR	0x228
@@ -59,6 +69,17 @@
 #define FSL_XCVR_TX_CS_DATA_3		0x23C
 #define FSL_XCVR_TX_CS_DATA_4		0x240
 #define FSL_XCVR_TX_CS_DATA_5		0x244
+
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL	0x260
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_SET	0x264
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_CLR	0x268
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TOG	0x26C
+
+#define FSL_XCVR_TX_DPTH_TSCR		0x270
+#define FSL_XCVR_TX_DPTH_BCR		0x274
+#define FSL_XCVR_TX_DPTH_BCTR		0x278
+#define FSL_XCVR_TX_DPTH_BCRR		0x27C
+
 #define FSL_XCVR_DEBUG_REG_0		0x2E0
 #define FSL_XCVR_DEBUG_REG_1		0x2F0
 
-- 
2.34.1

