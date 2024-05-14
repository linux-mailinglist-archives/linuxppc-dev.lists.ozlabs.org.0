Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F71D8C4B80
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 05:32:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vdhkf03j6z3dLW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 13:32:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdhjY4Rx1z30TR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2024 13:31:45 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1EB202017E7;
	Tue, 14 May 2024 05:31:43 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 867942017D0;
	Tue, 14 May 2024 05:31:42 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 6972A180222C;
	Tue, 14 May 2024 11:31:40 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] ASoC: fsl_xcvr: Add support for i.MX95 platform
Date: Tue, 14 May 2024 11:12:09 +0800
Message-Id: <1715656329-8061-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1715656329-8061-1-git-send-email-shengjiu.wang@nxp.com>
References: <1715656329-8061-1-git-send-email-shengjiu.wang@nxp.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On i.MX95, the XCVR uses a new PLL in the PHY, which is
General Purpose (GP) PLL. Add GP PLL configuration support
in the driver and add the 'pll_ver' flag to distinguish
different PLL on different platforms.

The XCVR also use PHY but limited for SPDIF only case
Add 'use_phy' flag to distinguish these platforms.

When there are 'pll8k' and 'pll11k' clock existing, the clock
source of 'phy_clk' can be changed for different sample rate
requirement.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/Kconfig    |   1 +
 sound/soc/fsl/fsl_xcvr.c | 128 ++++++++++++++++++++++++++-------------
 sound/soc/fsl/fsl_xcvr.h |  91 ++++++++++++++++++++++++++++
 3 files changed, 177 insertions(+), 43 deletions(-)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 270726c134b3..9a371d4496c2 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -103,6 +103,7 @@ config SND_SOC_FSL_XCVR
 	select REGMAP_MMIO
 	select SND_SOC_IMX_PCM_DMA if SND_IMX_SOC != n
 	select SND_SOC_GENERIC_DMAENGINE_PCM
+	select SND_SOC_FSL_UTILS
 	help
 	  Say Y if you want to add Audio Transceiver (XCVR) support for NXP
 	  iMX CPUs. XCVR is a digital module that supports HDMI2.1 eARC,
diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index c46f64557a7f..6b1715ac67c5 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -15,14 +15,22 @@
 #include <sound/pcm_params.h>
 
 #include "fsl_xcvr.h"
+#include "fsl_utils.h"
 #include "imx-pcm.h"
 
 #define FSL_XCVR_CAPDS_SIZE	256
 
+enum fsl_xcvr_pll_verison {
+	PLL_MX8MP,
+	PLL_MX95,
+};
+
 struct fsl_xcvr_soc_data {
 	const char *fw_name;
 	bool spdif_only;
 	bool use_edma;
+	bool use_phy;
+	enum fsl_xcvr_pll_verison pll_ver;
 };
 
 struct fsl_xcvr {
@@ -33,6 +41,8 @@ struct fsl_xcvr {
 	struct clk *pll_ipg_clk;
 	struct clk *phy_clk;
 	struct clk *spba_clk;
+	struct clk *pll8k_clk;
+	struct clk *pll11k_clk;
 	struct reset_control *reset;
 	u8 streams;
 	u32 mode;
@@ -262,10 +272,10 @@ static int fsl_xcvr_ai_write(struct fsl_xcvr *xcvr, u8 reg, u32 data, bool phy)
 static int fsl_xcvr_en_phy_pll(struct fsl_xcvr *xcvr, u32 freq, bool tx)
 {
 	struct device *dev = &xcvr->pdev->dev;
-	u32 i, div = 0, log2;
+	u32 i, div = 0, log2, val;
 	int ret;
 
-	if (xcvr->soc_data->spdif_only)
+	if (!xcvr->soc_data->use_phy)
 		return 0;
 
 	for (i = 0; i < ARRAY_SIZE(fsl_xcvr_pll_cfg); i++) {
@@ -288,45 +298,62 @@ static int fsl_xcvr_en_phy_pll(struct fsl_xcvr *xcvr, u32 freq, bool tx)
 		return ret;
 	}
 
-	/* PLL: BANDGAP_SET: EN_VBG (enable bandgap) */
-	fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_BANDGAP_SET,
-			  FSL_XCVR_PLL_BANDGAP_EN_VBG, 0);
-
-	/* PLL: CTRL0: DIV_INTEGER */
-	fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0, fsl_xcvr_pll_cfg[i].mfi, 0);
-	/* PLL: NUMERATOR: MFN */
-	fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_NUM, fsl_xcvr_pll_cfg[i].mfn, 0);
-	/* PLL: DENOMINATOR: MFD */
-	fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_DEN, fsl_xcvr_pll_cfg[i].mfd, 0);
-	/* PLL: CTRL0_SET: HOLD_RING_OFF, POWER_UP */
-	fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_SET,
-			  FSL_XCVR_PLL_CTRL0_HROFF | FSL_XCVR_PLL_CTRL0_PWP, 0);
-	udelay(25);
-	/* PLL: CTRL0: Clear Hold Ring Off */
-	fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_CLR,
-			  FSL_XCVR_PLL_CTRL0_HROFF, 0);
-	udelay(100);
-	if (tx) { /* TX is enabled for SPDIF only */
-		/* PLL: POSTDIV: PDIV0 */
-		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_PDIV,
-				  FSL_XCVR_PLL_PDIVx(log2, 0), 0);
-		/* PLL: CTRL_SET: CLKMUX0_EN */
-		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_SET,
-				  FSL_XCVR_PLL_CTRL0_CM0_EN, 0);
-	} else if (xcvr->mode == FSL_XCVR_MODE_EARC) { /* eARC RX */
-		/* PLL: POSTDIV: PDIV1 */
-		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_PDIV,
-				  FSL_XCVR_PLL_PDIVx(log2, 1), 0);
-		/* PLL: CTRL_SET: CLKMUX1_EN */
-		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_SET,
-				  FSL_XCVR_PLL_CTRL0_CM1_EN, 0);
-	} else { /* SPDIF / ARC RX */
-		/* PLL: POSTDIV: PDIV2 */
-		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_PDIV,
-				  FSL_XCVR_PLL_PDIVx(log2, 2), 0);
-		/* PLL: CTRL_SET: CLKMUX2_EN */
+	switch (xcvr->soc_data->pll_ver) {
+	case PLL_MX8MP:
+		/* PLL: BANDGAP_SET: EN_VBG (enable bandgap) */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_BANDGAP_SET,
+				  FSL_XCVR_PLL_BANDGAP_EN_VBG, 0);
+
+		/* PLL: CTRL0: DIV_INTEGER */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0, fsl_xcvr_pll_cfg[i].mfi, 0);
+		/* PLL: NUMERATOR: MFN */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_NUM, fsl_xcvr_pll_cfg[i].mfn, 0);
+		/* PLL: DENOMINATOR: MFD */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_DEN, fsl_xcvr_pll_cfg[i].mfd, 0);
+		/* PLL: CTRL0_SET: HOLD_RING_OFF, POWER_UP */
 		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_SET,
-				  FSL_XCVR_PLL_CTRL0_CM2_EN, 0);
+				  FSL_XCVR_PLL_CTRL0_HROFF | FSL_XCVR_PLL_CTRL0_PWP, 0);
+		udelay(25);
+		/* PLL: CTRL0: Clear Hold Ring Off */
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_CLR,
+				  FSL_XCVR_PLL_CTRL0_HROFF, 0);
+		udelay(100);
+		if (tx) { /* TX is enabled for SPDIF only */
+			/* PLL: POSTDIV: PDIV0 */
+			fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_PDIV,
+					  FSL_XCVR_PLL_PDIVx(log2, 0), 0);
+			/* PLL: CTRL_SET: CLKMUX0_EN */
+			fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_SET,
+					  FSL_XCVR_PLL_CTRL0_CM0_EN, 0);
+		} else if (xcvr->mode == FSL_XCVR_MODE_EARC) { /* eARC RX */
+			/* PLL: POSTDIV: PDIV1 */
+			fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_PDIV,
+					  FSL_XCVR_PLL_PDIVx(log2, 1), 0);
+			/* PLL: CTRL_SET: CLKMUX1_EN */
+			fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_SET,
+					  FSL_XCVR_PLL_CTRL0_CM1_EN, 0);
+		} else { /* SPDIF / ARC RX */
+			/* PLL: POSTDIV: PDIV2 */
+			fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_PDIV,
+					  FSL_XCVR_PLL_PDIVx(log2, 2), 0);
+			/* PLL: CTRL_SET: CLKMUX2_EN */
+			fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_SET,
+					  FSL_XCVR_PLL_CTRL0_CM2_EN, 0);
+		}
+		break;
+	case PLL_MX95:
+		val = fsl_xcvr_pll_cfg[i].mfi << FSL_XCVR_GP_PLL_DIV_MFI_SHIFT | div;
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_GP_PLL_DIV, val, 0);
+		val = fsl_xcvr_pll_cfg[i].mfn << FSL_XCVR_GP_PLL_NUMERATOR_MFN_SHIFT;
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_GP_PLL_NUMERATOR, val, 0);
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_GP_PLL_DENOMINATOR,
+				  fsl_xcvr_pll_cfg[i].mfd, 0);
+		val = FSL_XCVR_GP_PLL_CTRL_POWERUP | FSL_XCVR_GP_PLL_CTRL_CLKMUX_EN;
+		fsl_xcvr_ai_write(xcvr, FSL_XCVR_GP_PLL_CTRL, val, 0);
+		break;
+	default:
+		dev_err(dev, "Error for PLL version %d\n", xcvr->soc_data->pll_ver);
+		return -EINVAL;
 	}
 
 	if (xcvr->mode == FSL_XCVR_MODE_EARC) { /* eARC mode */
@@ -362,6 +389,8 @@ static int fsl_xcvr_en_aud_pll(struct fsl_xcvr *xcvr, u32 freq)
 
 	freq = xcvr->soc_data->spdif_only ? freq / 5 : freq;
 	clk_disable_unprepare(xcvr->phy_clk);
+	fsl_asoc_reparent_pll_clocks(dev, xcvr->phy_clk,
+				     xcvr->pll8k_clk, xcvr->pll11k_clk, freq);
 	ret = clk_set_rate(xcvr->phy_clk, freq);
 	if (ret < 0) {
 		dev_err(dev, "Error while setting AUD PLL rate: %d\n", ret);
@@ -373,7 +402,7 @@ static int fsl_xcvr_en_aud_pll(struct fsl_xcvr *xcvr, u32 freq)
 		return ret;
 	}
 
-	if (xcvr->soc_data->spdif_only)
+	if (!xcvr->soc_data->use_phy)
 		return 0;
 	/* Release AI interface from reset */
 	ret = regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_SET,
@@ -1017,7 +1046,7 @@ static bool fsl_xcvr_readable_reg(struct device *dev, unsigned int reg)
 {
 	struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
 
-	if (xcvr->soc_data->spdif_only)
+	if (!xcvr->soc_data->use_phy)
 		if ((reg >= FSL_XCVR_IER && reg <= FSL_XCVR_PHY_AI_RDATA) ||
 		    reg > FSL_XCVR_TX_DPTH_BCRR)
 			return false;
@@ -1090,7 +1119,7 @@ static bool fsl_xcvr_writeable_reg(struct device *dev, unsigned int reg)
 {
 	struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
 
-	if (xcvr->soc_data->spdif_only)
+	if (!xcvr->soc_data->use_phy)
 		if (reg >= FSL_XCVR_IER && reg <= FSL_XCVR_PHY_AI_RDATA)
 			return false;
 	switch (reg) {
@@ -1234,6 +1263,8 @@ static irqreturn_t irq0_isr(int irq, void *devid)
 
 static const struct fsl_xcvr_soc_data fsl_xcvr_imx8mp_data = {
 	.fw_name = "imx/xcvr/xcvr-imx8mp.bin",
+	.use_phy = true,
+	.pll_ver = PLL_MX8MP,
 };
 
 static const struct fsl_xcvr_soc_data fsl_xcvr_imx93_data = {
@@ -1241,9 +1272,17 @@ static const struct fsl_xcvr_soc_data fsl_xcvr_imx93_data = {
 	.use_edma = true,
 };
 
+static const struct fsl_xcvr_soc_data fsl_xcvr_imx95_data = {
+	.spdif_only = true,
+	.use_phy = true,
+	.use_edma = true,
+	.pll_ver = PLL_MX95,
+};
+
 static const struct of_device_id fsl_xcvr_dt_ids[] = {
 	{ .compatible = "fsl,imx8mp-xcvr", .data = &fsl_xcvr_imx8mp_data },
 	{ .compatible = "fsl,imx93-xcvr", .data = &fsl_xcvr_imx93_data},
+	{ .compatible = "fsl,imx95-xcvr", .data = &fsl_xcvr_imx95_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_xcvr_dt_ids);
@@ -1287,6 +1326,9 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 		return PTR_ERR(xcvr->pll_ipg_clk);
 	}
 
+	fsl_asoc_get_pll_clocks(dev, &xcvr->pll8k_clk,
+				&xcvr->pll11k_clk);
+
 	xcvr->ram_addr = devm_platform_ioremap_resource_byname(pdev, "ram");
 	if (IS_ERR(xcvr->ram_addr))
 		return PTR_ERR(xcvr->ram_addr);
diff --git a/sound/soc/fsl/fsl_xcvr.h b/sound/soc/fsl/fsl_xcvr.h
index 044058fc6aa2..882428592e1a 100644
--- a/sound/soc/fsl/fsl_xcvr.h
+++ b/sound/soc/fsl/fsl_xcvr.h
@@ -291,4 +291,95 @@
 #define FSL_XCVR_RX_CS_BUFF_1		0xA0 /* Second RX CS buffer */
 #define FSL_XCVR_CAP_DATA_STR		0x300 /* Capabilities data structure */
 
+/* GP PLL Registers */
+#define FSL_XCVR_GP_PLL_CTRL			0x00
+#define FSL_XCVR_GP_PLL_CTRL_SET		0x04
+#define FSL_XCVR_GP_PLL_CTRL_CLR		0x08
+#define FSL_XCVR_GP_PLL_CTRL_TOG		0x0C
+#define FSL_XCVR_GP_PLL_ANA_PRG			0x10
+#define FSL_XCVR_GP_PLL_ANA_PRG_SET		0x14
+#define FSL_XCVR_GP_PLL_ANA_PRG_CLR		0x18
+#define FSL_XCVR_GP_PLL_ANA_PRG_TOG		0x1C
+#define FSL_XCVR_GP_PLL_TEST			0x20
+#define FSL_XCVR_GP_PLL_TEST_SET		0x24
+#define FSL_XCVR_GP_PLL_TEST_CLR		0x28
+#define FSL_XCVR_GP_PLL_TEST_TOG		0x2C
+#define FSL_XCVR_GP_PLL_SPREAD_SPECTRUM		0x30
+#define FSL_XCVR_GP_PLL_SPREAD_SPECTRUM_SET	0x34
+#define FSL_XCVR_GP_PLL_SPREAD_SPECTRUM_CLR	0x38
+#define FSL_XCVR_GP_PLL_SPREAD_SPECTRUM_TOG	0x3C
+#define FSL_XCVR_GP_PLL_NUMERATOR		0x40
+#define FSL_XCVR_GP_PLL_NUMERATOR_SET		0x44
+#define FSL_XCVR_GP_PLL_NUMERATOR_CLR		0x48
+#define FSL_XCVR_GP_PLL_NUMERATOR_TOG		0x4C
+#define FSL_XCVR_GP_PLL_DENOMINATOR		0x50
+#define FSL_XCVR_GP_PLL_DENOMINATOR_SET		0x54
+#define FSL_XCVR_GP_PLL_DENOMINATOR_CLR		0x58
+#define FSL_XCVR_GP_PLL_DENOMINATOR_TOG		0x5C
+#define FSL_XCVR_GP_PLL_DIV			0x60
+#define FSL_XCVR_GP_PLL_DIV_SET			0x64
+#define FSL_XCVR_GP_PLL_DIV_CLR			0x68
+#define FSL_XCVR_GP_PLL_DIV_TOG			0x6C
+#define FSL_XCVR_GP_PLL_DFS_CTRL0		0x70
+#define FSL_XCVR_GP_PLL_DFS_CTRL0_SET		0x74
+#define FSL_XCVR_GP_PLL_DFS_CTRL0_CLR		0x78
+#define FSL_XCVR_GP_PLL_DFS_CTRL0_TOG		0x7C
+#define FSL_XCVR_GP_PLL_DFS_DIV0		0x80
+#define FSL_XCVR_GP_PLL_DFS_DIV0_SET		0x84
+#define FSL_XCVR_GP_PLL_DFS_DIV0_CLR		0x88
+#define FSL_XCVR_GP_PLL_DFS_DIV0_TOG		0x8C
+#define FSL_XCVR_GP_PLL_DFS_CTRL1		0x90
+#define FSL_XCVR_GP_PLL_DFS_CTRL1_SET		0x94
+#define FSL_XCVR_GP_PLL_DFS_CTRL1_CLR		0x98
+#define FSL_XCVR_GP_PLL_DFS_CTRL1_TOG		0x9C
+#define FSL_XCVR_GP_PLL_DFS_DIV1		0xA0
+#define FSL_XCVR_GP_PLL_DFS_DIV1_SET		0xA4
+#define FSL_XCVR_GP_PLL_DFS_DIV1_CLR		0xA8
+#define FSL_XCVR_GP_PLL_DFS_DIV1_TOG		0xAC
+#define FSL_XCVR_GP_PLL_DFS_CTRL2		0xB0
+#define FSL_XCVR_GP_PLL_DFS_CTRL2_SET		0xB4
+#define FSL_XCVR_GP_PLL_DFS_CTRL2_CLR		0xB8
+#define FSL_XCVR_GP_PLL_DFS_CTRL2_TOG		0xBC
+#define FSL_XCVR_GP_PLL_DFS_DIV2		0xC0
+#define FSL_XCVR_GP_PLL_DFS_DIV2_SET		0xC4
+#define FSL_XCVR_GP_PLL_DFS_DIV2_CLR		0xC8
+#define FSL_XCVR_GP_PLL_DFS_DIV2_TOG		0xCC
+#define FSL_XCVR_GP_PLL_DFS_CTRL3		0xD0
+#define FSL_XCVR_GP_PLL_DFS_CTRL3_SET		0xD4
+#define FSL_XCVR_GP_PLL_DFS_CTRL3_CLR		0xD8
+#define FSL_XCVR_GP_PLL_DFS_CTRL3_TOG		0xDC
+#define FSL_XCVR_GP_PLL_DFS_DIV3		0xE0
+#define FSL_XCVR_GP_PLL_DFS_DIV3_SET		0xE4
+#define FSL_XCVR_GP_PLL_DFS_DIV3_CLR		0xE8
+#define FSL_XCVR_GP_PLL_DFS_DIV3_TOG		0xEC
+#define FSL_XCVR_GP_PLL_STATUS			0xF0
+#define FSL_XCVR_GP_PLL_STATUS_SET		0xF4
+#define FSL_XCVR_GP_PLL_STATUS_CLR		0xF8
+#define FSL_XCVR_GP_PLL_STATUS_TOG		0xFC
+
+/* GP PLL Control Register */
+#define FSL_XCVR_GP_PLL_CTRL_LBYPASS		BIT(31)
+#define FSL_XCVR_GP_PLL_CTRL_HCS		BIT(16)
+#define FSL_XCVR_GP_PLL_CTRL_MSD		BIT(12)
+#define FSL_XCVR_GP_PLL_CTRL_DITHER_EN3		BIT(11)
+#define FSL_XCVR_GP_PLL_CTRL_DITHER_EN2		BIT(10)
+#define FSL_XCVR_GP_PLL_CTRL_DITHER_EN1		BIT(9)
+#define FSL_XCVR_GP_PLL_CTRL_SPREADCTL		BIT(8)
+#define FSL_XCVR_GP_PLL_CTRL_CLKMUX_BYPASS	BIT(2)
+#define FSL_XCVR_GP_PLL_CTRL_CLKMUX_EN		BIT(1)
+#define FSL_XCVR_GP_PLL_CTRL_POWERUP		BIT(0)
+
+/* GP PLL Numerator Register */
+#define FSL_XCVR_GP_PLL_NUMERATOR_MFN_SHIFT	2
+#define FSL_XCVR_GP_PLL_NUMERATOR_MFN		GENMASK(31, 2)
+
+/* GP PLL Denominator Register */
+#define FSL_XCVR_GP_PLL_DENOMINATOR_MFD		GENMASK(29, 0)
+
+/* GP PLL Dividers Register */
+#define FSL_XCVR_GP_PLL_DIV_MFI_SHIFT		16
+#define FSL_XCVR_GP_PLL_DIV_MFI			GENMASK(24, 16)
+#define FSL_XCVR_GP_PLL_DIV_RDIV		GENMASK(15, 13)
+#define FSL_XCVR_GP_PLL_DIV_ODIV		GENMASK(7, 0)
+
 #endif /* __FSL_XCVR_H */
-- 
2.34.1

