Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D97326D38F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 08:21:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsRgV4JC1zDqWH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 16:21:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsRbq03RdzDqTK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 16:18:14 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 104402000FF;
 Thu, 17 Sep 2020 08:18:12 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6279D2000F5;
 Thu, 17 Sep 2020 08:18:07 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 5DD4040310;
 Thu, 17 Sep 2020 08:18:01 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com
Subject: [PATCH v2 1/3] ASoC: fsl_sai: Add new added registers and new bit
 definition
Date: Thu, 17 Sep 2020 14:11:17 +0800
Message-Id: <1600323079-5317-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600323079-5317-1-git-send-email-shengjiu.wang@nxp.com>
References: <1600323079-5317-1-git-send-email-shengjiu.wang@nxp.com>
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

On i.MX8MQ/i.MX8MN/i.MX8MM platform, the sai IP is upgraded.
There are some new registers and new bit definition. This
patch is to complete the register list.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 23 ++++++++++++++++
 sound/soc/fsl/fsl_sai.h | 59 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index b2d65e53dbc4..24ca528ca2be 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -796,6 +796,8 @@ static struct reg_default fsl_sai_reg_defaults_ofs8[] = {
 	{FSL_SAI_RCR4(8), 0},
 	{FSL_SAI_RCR5(8), 0},
 	{FSL_SAI_RMR, 0},
+	{FSL_SAI_MCTL, 0},
+	{FSL_SAI_MDIV, 0},
 };
 
 static bool fsl_sai_readable_reg(struct device *dev, unsigned int reg)
@@ -836,6 +838,18 @@ static bool fsl_sai_readable_reg(struct device *dev, unsigned int reg)
 	case FSL_SAI_RFR6:
 	case FSL_SAI_RFR7:
 	case FSL_SAI_RMR:
+	case FSL_SAI_MCTL:
+	case FSL_SAI_MDIV:
+	case FSL_SAI_VERID:
+	case FSL_SAI_PARAM:
+	case FSL_SAI_TTCTN:
+	case FSL_SAI_RTCTN:
+	case FSL_SAI_TTCTL:
+	case FSL_SAI_TBCTN:
+	case FSL_SAI_TTCAP:
+	case FSL_SAI_RTCTL:
+	case FSL_SAI_RBCTN:
+	case FSL_SAI_RTCAP:
 		return true;
 	default:
 		return false;
@@ -850,6 +864,10 @@ static bool fsl_sai_volatile_reg(struct device *dev, unsigned int reg)
 	if (reg == FSL_SAI_TCSR(ofs) || reg == FSL_SAI_RCSR(ofs))
 		return true;
 
+	/* Set VERID and PARAM be volatile for reading value in probe */
+	if (ofs == 8 && (reg == FSL_SAI_VERID || reg == FSL_SAI_PARAM))
+		return true;
+
 	switch (reg) {
 	case FSL_SAI_TFR0:
 	case FSL_SAI_TFR1:
@@ -903,6 +921,10 @@ static bool fsl_sai_writeable_reg(struct device *dev, unsigned int reg)
 	case FSL_SAI_TDR7:
 	case FSL_SAI_TMR:
 	case FSL_SAI_RMR:
+	case FSL_SAI_MCTL:
+	case FSL_SAI_MDIV:
+	case FSL_SAI_TTCTL:
+	case FSL_SAI_RTCTL:
 		return true;
 	default:
 		return false;
@@ -951,6 +973,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	if (sai->soc_data->reg_offset == 8) {
 		fsl_sai_regmap_config.reg_defaults = fsl_sai_reg_defaults_ofs8;
+		fsl_sai_regmap_config.max_register = FSL_SAI_MDIV;
 		fsl_sai_regmap_config.num_reg_defaults =
 			ARRAY_SIZE(fsl_sai_reg_defaults_ofs8);
 	}
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 736a437450c8..d16fc4241f41 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -14,6 +14,8 @@
 			 SNDRV_PCM_FMTBIT_S32_LE)
 
 /* SAI Register Map Register */
+#define FSL_SAI_VERID	0x00 /* SAI Version ID Register */
+#define FSL_SAI_PARAM	0x04 /* SAI Parameter Register */
 #define FSL_SAI_TCSR(ofs)	(0x00 + ofs) /* SAI Transmit Control */
 #define FSL_SAI_TCR1(ofs)	(0x04 + ofs) /* SAI Transmit Configuration 1 */
 #define FSL_SAI_TCR2(ofs)	(0x08 + ofs) /* SAI Transmit Configuration 2 */
@@ -37,6 +39,10 @@
 #define FSL_SAI_TFR6	0x58 /* SAI Transmit FIFO 6 */
 #define FSL_SAI_TFR7	0x5C /* SAI Transmit FIFO 7 */
 #define FSL_SAI_TMR	0x60 /* SAI Transmit Mask */
+#define FSL_SAI_TTCTL	0x70 /* SAI Transmit Timestamp Control Register */
+#define FSL_SAI_TTCTN	0x74 /* SAI Transmit Timestamp Counter Register */
+#define FSL_SAI_TBCTN	0x78 /* SAI Transmit Bit Counter Register */
+#define FSL_SAI_TTCAP	0x7C /* SAI Transmit Timestamp Capture */
 #define FSL_SAI_RCSR(ofs)	(0x80 + ofs) /* SAI Receive Control */
 #define FSL_SAI_RCR1(ofs)	(0x84 + ofs)/* SAI Receive Configuration 1 */
 #define FSL_SAI_RCR2(ofs)	(0x88 + ofs) /* SAI Receive Configuration 2 */
@@ -60,6 +66,13 @@
 #define FSL_SAI_RFR6	0xd8 /* SAI Receive FIFO 6 */
 #define FSL_SAI_RFR7	0xdc /* SAI Receive FIFO 7 */
 #define FSL_SAI_RMR	0xe0 /* SAI Receive Mask */
+#define FSL_SAI_RTCTL	0xf0 /* SAI Receive Timestamp Control Register */
+#define FSL_SAI_RTCTN	0xf4 /* SAI Receive Timestamp Counter Register */
+#define FSL_SAI_RBCTN	0xf8 /* SAI Receive Bit Counter Register */
+#define FSL_SAI_RTCAP	0xfc /* SAI Receive Timestamp Capture */
+
+#define FSL_SAI_MCTL	0x100 /* SAI MCLK Control Register */
+#define FSL_SAI_MDIV	0x104 /* SAI MCLK Divide Register */
 
 #define FSL_SAI_xCSR(tx, ofs)	(tx ? FSL_SAI_TCSR(ofs) : FSL_SAI_RCSR(ofs))
 #define FSL_SAI_xCR1(tx, ofs)	(tx ? FSL_SAI_TCR1(ofs) : FSL_SAI_RCR1(ofs))
@@ -73,6 +86,7 @@
 
 /* SAI Transmit/Receive Control Register */
 #define FSL_SAI_CSR_TERE	BIT(31)
+#define FSL_SAI_CSR_SE		BIT(30)
 #define FSL_SAI_CSR_FR		BIT(25)
 #define FSL_SAI_CSR_SR		BIT(24)
 #define FSL_SAI_CSR_xF_SHIFT	16
@@ -106,6 +120,7 @@
 #define FSL_SAI_CR2_MSEL(ID)	((ID) << 26)
 #define FSL_SAI_CR2_BCP		BIT(25)
 #define FSL_SAI_CR2_BCD_MSTR	BIT(24)
+#define FSL_SAI_CR2_BYP		BIT(23) /* BCLK bypass */
 #define FSL_SAI_CR2_DIV_MASK	0xff
 
 /* SAI Transmit and Receive Configuration 3 Register */
@@ -115,6 +130,13 @@
 #define FSL_SAI_CR3_WDFL_MASK	0x1f
 
 /* SAI Transmit and Receive Configuration 4 Register */
+
+#define FSL_SAI_CR4_FCONT	BIT(28)
+#define FSL_SAI_CR4_FCOMB_SHIFT BIT(26)
+#define FSL_SAI_CR4_FCOMB_SOFT  BIT(27)
+#define FSL_SAI_CR4_FCOMB_MASK  (0x3 << 26)
+#define FSL_SAI_CR4_FPACK_8     (0x2 << 24)
+#define FSL_SAI_CR4_FPACK_16    (0x3 << 24)
 #define FSL_SAI_CR4_FRSZ(x)	(((x) - 1) << 16)
 #define FSL_SAI_CR4_FRSZ_MASK	(0x1f << 16)
 #define FSL_SAI_CR4_SYWD(x)	(((x) - 1) << 8)
@@ -134,6 +156,43 @@
 #define FSL_SAI_CR5_FBT(x)	((x) << 8)
 #define FSL_SAI_CR5_FBT_MASK	(0x1f << 8)
 
+/* SAI MCLK Control Register */
+#define FSL_SAI_MCTL_MCLK_EN	BIT(30)	/* MCLK Enable */
+#define FSL_SAI_MCTL_MSEL_MASK	(0x3 << 24)
+#define FSL_SAI_MCTL_MSEL(ID)   ((ID) << 24)
+#define FSL_SAI_MCTL_MSEL_BUS	0
+#define FSL_SAI_MCTL_MSEL_MCLK1	BIT(24)
+#define FSL_SAI_MCTL_MSEL_MCLK2	BIT(25)
+#define FSL_SAI_MCTL_MSEL_MCLK3	(BIT(24) | BIT(25))
+#define FSL_SAI_MCTL_DIV_EN	BIT(23)
+#define FSL_SAI_MCTL_DIV_MASK	0xFF
+
+/* SAI VERID Register */
+#define FSL_SAI_VERID_MAJOR_SHIFT   24
+#define FSL_SAI_VERID_MAJOR_MASK    GENMASK(31, 24)
+#define FSL_SAI_VERID_MINOR_SHIFT   16
+#define FSL_SAI_VERID_MINOR_MASK    GENMASK(23, 16)
+#define FSL_SAI_VERID_FEATURE_SHIFT 0
+#define FSL_SAI_VERID_FEATURE_MASK  GENMASK(15, 0)
+#define FSL_SAI_VERID_EFIFO_EN	    BIT(0)
+#define FSL_SAI_VERID_TSTMP_EN	    BIT(1)
+
+/* SAI PARAM Register */
+#define FSL_SAI_PARAM_SPF_SHIFT	    16
+#define FSL_SAI_PARAM_SPF_MASK	    GENMASK(19, 16)
+#define FSL_SAI_PARAM_WPF_SHIFT	    8
+#define FSL_SAI_PARAM_WPF_MASK	    GENMASK(11, 8)
+#define FSL_SAI_PARAM_DLN_MASK	    GENMASK(3, 0)
+
+/* SAI MCLK Divide Register */
+#define FSL_SAI_MDIV_MASK	    0xFFFFF
+
+/* SAI timestamp and bitcounter */
+#define FSL_SAI_xTCTL_TSEN         BIT(0)
+#define FSL_SAI_xTCTL_TSINC        BIT(1)
+#define FSL_SAI_xTCTL_RTSC         BIT(8)
+#define FSL_SAI_xTCTL_RBC          BIT(9)
+
 /* SAI type */
 #define FSL_SAI_DMA		BIT(0)
 #define FSL_SAI_USE_AC97	BIT(1)
-- 
2.27.0

