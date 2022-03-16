Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BF84DA9F7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 06:38:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJJwr2Ptcz3bWw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 16:38:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJJwN5wxfz2xTp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 16:38:27 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7B3E02004A6;
 Wed, 16 Mar 2022 06:38:23 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 16A202003D3;
 Wed, 16 Mar 2022 06:38:23 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 9338E183AD0B;
 Wed, 16 Mar 2022 13:38:21 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_spdif: Add new registers included on i.MX8ULP
Date: Wed, 16 Mar 2022 13:28:58 +0800
Message-Id: <1647408538-2982-1-git-send-email-shengjiu.wang@nxp.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are some new registers added on i.MX8ULP, they are
the SPDIF transmit Professional C channel registers,
192bit SPDIF receive C channel registers, and 192bit SPDIF
transmit C channel registers.

There are two output lines, SPDIF_OUT1 and SPDIF_OUT2, the
original REG_SPDIF_STCSCH and REG_SPDIF_STCSCL are used for
SPDIF_OUT1, the new REG_SPDIF_STCSPH and REG_SPDIF_STCSPL
are used for SPDIF_OUT2, the 192bit SPDIF C channel registers
are used for both.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_spdif.c | 52 ++++++++++++++++++++++++++++++++++++++-
 sound/soc/fsl/fsl_spdif.h | 14 +++++++++++
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index b502e7c3c04d..42d11aca38a1 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -50,6 +50,7 @@ static u8 srpc_dpll_locked[] = { 0x0, 0x1, 0x2, 0x3, 0x4, 0xa, 0xb };
  * @shared_root_clock: flag of sharing a clock source with others;
  *                     so the driver shouldn't set root clock rate
  * @raw_capture_mode: if raw capture mode support
+ * @cchannel_192b: if there are registers for 192bits C channel data
  * @interrupts: interrupt number
  * @tx_burst: tx maxburst size
  * @rx_burst: rx maxburst size
@@ -59,6 +60,7 @@ struct fsl_spdif_soc_data {
 	bool imx;
 	bool shared_root_clock;
 	bool raw_capture_mode;
+	bool cchannel_192b;
 	u32 interrupts;
 	u32 tx_burst;
 	u32 rx_burst;
@@ -196,6 +198,7 @@ static struct fsl_spdif_soc_data fsl_spdif_imx8ulp = {
 	.tx_burst = 2,		/* Applied for EDMA */
 	.rx_burst = 2,		/* Applied for EDMA */
 	.tx_formats = SNDRV_PCM_FMTBIT_S24_LE,	/* Applied for EDMA */
+	.cchannel_192b = true,
 };
 
 /* Check if clk is a root clock that does not share clock source with others */
@@ -441,6 +444,23 @@ static void spdif_write_channel_status(struct fsl_spdif_priv *spdif_priv)
 	regmap_write(regmap, REG_SPDIF_STCSCL, ch_status);
 
 	dev_dbg(&pdev->dev, "STCSCL: 0x%06x\n", ch_status);
+
+	if (spdif_priv->soc->cchannel_192b) {
+		ch_status = (bitrev8(ctrl->ch_status[0]) << 24) |
+			    (bitrev8(ctrl->ch_status[1]) << 16) |
+			    (bitrev8(ctrl->ch_status[2]) << 8) |
+			    bitrev8(ctrl->ch_status[3]);
+
+		regmap_update_bits(regmap, REG_SPDIF_SCR, 0x1000000, 0x1000000);
+
+		/*
+		 * The first 32bit should be in REG_SPDIF_STCCA_31_0 register,
+		 * but here we need to set REG_SPDIF_STCCA_191_160 on 8ULP
+		 * then can get correct result with HDMI analyzer capture.
+		 * There is a hardware bug here.
+		 */
+		regmap_write(regmap, REG_SPDIF_STCCA_191_160, ch_status);
+	}
 }
 
 /* Set SPDIF PhaseConfig register for rx clock */
@@ -1229,6 +1249,8 @@ static const struct reg_default fsl_spdif_reg_defaults[] = {
 	{REG_SPDIF_STR,	   0x00000000},
 	{REG_SPDIF_STCSCH, 0x00000000},
 	{REG_SPDIF_STCSCL, 0x00000000},
+	{REG_SPDIF_STCSPH, 0x00000000},
+	{REG_SPDIF_STCSPL, 0x00000000},
 	{REG_SPDIF_STC,	   0x00020f00},
 };
 
@@ -1248,8 +1270,22 @@ static bool fsl_spdif_readable_reg(struct device *dev, unsigned int reg)
 	case REG_SPDIF_SRQ:
 	case REG_SPDIF_STCSCH:
 	case REG_SPDIF_STCSCL:
+	case REG_SPDIF_STCSPH:
+	case REG_SPDIF_STCSPL:
 	case REG_SPDIF_SRFM:
 	case REG_SPDIF_STC:
+	case REG_SPDIF_SRCCA_31_0:
+	case REG_SPDIF_SRCCA_63_32:
+	case REG_SPDIF_SRCCA_95_64:
+	case REG_SPDIF_SRCCA_127_96:
+	case REG_SPDIF_SRCCA_159_128:
+	case REG_SPDIF_SRCCA_191_160:
+	case REG_SPDIF_STCCA_31_0:
+	case REG_SPDIF_STCCA_63_32:
+	case REG_SPDIF_STCCA_95_64:
+	case REG_SPDIF_STCCA_127_96:
+	case REG_SPDIF_STCCA_159_128:
+	case REG_SPDIF_STCCA_191_160:
 		return true;
 	default:
 		return false;
@@ -1268,6 +1304,12 @@ static bool fsl_spdif_volatile_reg(struct device *dev, unsigned int reg)
 	case REG_SPDIF_SRU:
 	case REG_SPDIF_SRQ:
 	case REG_SPDIF_SRFM:
+	case REG_SPDIF_SRCCA_31_0:
+	case REG_SPDIF_SRCCA_63_32:
+	case REG_SPDIF_SRCCA_95_64:
+	case REG_SPDIF_SRCCA_127_96:
+	case REG_SPDIF_SRCCA_159_128:
+	case REG_SPDIF_SRCCA_191_160:
 		return true;
 	default:
 		return false;
@@ -1286,7 +1328,15 @@ static bool fsl_spdif_writeable_reg(struct device *dev, unsigned int reg)
 	case REG_SPDIF_STR:
 	case REG_SPDIF_STCSCH:
 	case REG_SPDIF_STCSCL:
+	case REG_SPDIF_STCSPH:
+	case REG_SPDIF_STCSPL:
 	case REG_SPDIF_STC:
+	case REG_SPDIF_STCCA_31_0:
+	case REG_SPDIF_STCCA_63_32:
+	case REG_SPDIF_STCCA_95_64:
+	case REG_SPDIF_STCCA_127_96:
+	case REG_SPDIF_STCCA_159_128:
+	case REG_SPDIF_STCCA_191_160:
 		return true;
 	default:
 		return false;
@@ -1298,7 +1348,7 @@ static const struct regmap_config fsl_spdif_regmap_config = {
 	.reg_stride = 4,
 	.val_bits = 32,
 
-	.max_register = REG_SPDIF_STC,
+	.max_register = REG_SPDIF_STCCA_191_160,
 	.reg_defaults = fsl_spdif_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(fsl_spdif_reg_defaults),
 	.readable_reg = fsl_spdif_readable_reg,
diff --git a/sound/soc/fsl/fsl_spdif.h b/sound/soc/fsl/fsl_spdif.h
index bff8290e71f2..75b42a692c90 100644
--- a/sound/soc/fsl/fsl_spdif.h
+++ b/sound/soc/fsl/fsl_spdif.h
@@ -31,9 +31,23 @@
 #define REG_SPDIF_STR			0x30	/* SPDIFTxRight Register */
 #define REG_SPDIF_STCSCH		0x34	/* SPDIFTxCChannelCons_h Register */
 #define REG_SPDIF_STCSCL		0x38	/* SPDIFTxCChannelCons_l Register */
+#define REG_SPDIF_STCSPH		0x3C	/* SPDIFTxCChannel_Prof_h Register */
+#define REG_SPDIF_STCSPL		0x40	/* SPDIFTxCChannel_Prof_l Register */
 #define REG_SPDIF_SRFM			0x44	/* FreqMeas Register */
 #define REG_SPDIF_STC			0x50	/* SPDIFTxClk Register */
 
+#define REG_SPDIF_SRCCA_31_0		0x60	/* SPDIF receive C channel register, bits 31-0 */
+#define REG_SPDIF_SRCCA_63_32		0x64	/* SPDIF receive C channel register, bits 63-32 */
+#define REG_SPDIF_SRCCA_95_64		0x68	/* SPDIF receive C channel register, bits 95-64 */
+#define REG_SPDIF_SRCCA_127_96		0x6C	/* SPDIF receive C channel register, bits 127-96 */
+#define REG_SPDIF_SRCCA_159_128		0x70	/* SPDIF receive C channel register, bits 159-128 */
+#define REG_SPDIF_SRCCA_191_160		0x74	/* SPDIF receive C channel register, bits 191-160 */
+#define REG_SPDIF_STCCA_31_0		0x78	/* SPDIF transmit C channel register, bits 31-0 */
+#define REG_SPDIF_STCCA_63_32		0x7C	/* SPDIF transmit C channel register, bits 63-32 */
+#define REG_SPDIF_STCCA_95_64		0x80	/* SPDIF transmit C channel register, bits 95-64 */
+#define REG_SPDIF_STCCA_127_96		0x84	/* SPDIF transmit C channel register, bits 127-96 */
+#define REG_SPDIF_STCCA_159_128		0x88	/* SPDIF transmit C channel register, bits 159-128 */
+#define REG_SPDIF_STCCA_191_160		0x8C	/* SPDIF transmit C channel register, bits 191-160 */
 
 /* SPDIF Configuration register */
 #define SCR_RXFIFO_CTL_OFFSET		23
-- 
2.17.1

