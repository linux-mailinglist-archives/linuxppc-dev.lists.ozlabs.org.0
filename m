Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1597C36AFD3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Apr 2021 10:40:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTJHY0cd0z304c
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Apr 2021 18:40:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTJH84x4Gz2xgK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Apr 2021 18:39:47 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DFE2C203378;
 Mon, 26 Apr 2021 10:39:43 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id AB08F200620;
 Mon, 26 Apr 2021 10:39:39 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 5CD49402F3;
 Mon, 26 Apr 2021 10:39:34 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_spdif: add support for enabling raw capture mode
Date: Mon, 26 Apr 2021 16:24:04 +0800
Message-Id: <1619425444-8666-1-git-send-email-shengjiu.wang@nxp.com>
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

From: Viorel Suman <viorel.suman@nxp.com>

Since i.MX8MM SPDIF interface is able to capture raw data.
Add support in SPDIF driver for this functionality.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_spdif.c | 67 +++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_spdif.h |  1 +
 2 files changed, 68 insertions(+)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index c631de325a6e..2a76714eb8e6 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -49,6 +49,7 @@ static u8 srpc_dpll_locked[] = { 0x0, 0x1, 0x2, 0x3, 0x4, 0xa, 0xb };
  * @imx: for imx platform
  * @shared_root_clock: flag of sharing a clock source with others;
  *                     so the driver shouldn't set root clock rate
+ * @raw_capture_mode: if raw capture mode support
  * @interrupts: interrupt number
  * @tx_burst: tx maxburst size
  * @rx_burst: rx maxburst size
@@ -57,6 +58,7 @@ static u8 srpc_dpll_locked[] = { 0x0, 0x1, 0x2, 0x3, 0x4, 0xa, 0xb };
 struct fsl_spdif_soc_data {
 	bool imx;
 	bool shared_root_clock;
+	bool raw_capture_mode;
 	u32 interrupts;
 	u32 tx_burst;
 	u32 rx_burst;
@@ -136,6 +138,7 @@ struct fsl_spdif_priv {
 static struct fsl_spdif_soc_data fsl_spdif_vf610 = {
 	.imx = false,
 	.shared_root_clock = false,
+	.raw_capture_mode = false,
 	.interrupts = 1,
 	.tx_burst = FSL_SPDIF_TXFIFO_WML,
 	.rx_burst = FSL_SPDIF_RXFIFO_WML,
@@ -145,6 +148,7 @@ static struct fsl_spdif_soc_data fsl_spdif_vf610 = {
 static struct fsl_spdif_soc_data fsl_spdif_imx35 = {
 	.imx = true,
 	.shared_root_clock = false,
+	.raw_capture_mode = false,
 	.interrupts = 1,
 	.tx_burst = FSL_SPDIF_TXFIFO_WML,
 	.rx_burst = FSL_SPDIF_RXFIFO_WML,
@@ -154,6 +158,7 @@ static struct fsl_spdif_soc_data fsl_spdif_imx35 = {
 static struct fsl_spdif_soc_data fsl_spdif_imx6sx = {
 	.imx = true,
 	.shared_root_clock = true,
+	.raw_capture_mode = false,
 	.interrupts = 1,
 	.tx_burst = FSL_SPDIF_TXFIFO_WML,
 	.rx_burst = FSL_SPDIF_RXFIFO_WML,
@@ -164,12 +169,23 @@ static struct fsl_spdif_soc_data fsl_spdif_imx6sx = {
 static struct fsl_spdif_soc_data fsl_spdif_imx8qm = {
 	.imx = true,
 	.shared_root_clock = true,
+	.raw_capture_mode = false,
 	.interrupts = 2,
 	.tx_burst = 2,		/* Applied for EDMA */
 	.rx_burst = 2,		/* Applied for EDMA */
 	.tx_formats = SNDRV_PCM_FMTBIT_S24_LE,  /* Applied for EDMA */
 };
 
+static struct fsl_spdif_soc_data fsl_spdif_imx8mm = {
+	.imx = true,
+	.shared_root_clock = false,
+	.raw_capture_mode = true,
+	.interrupts = 1,
+	.tx_burst = FSL_SPDIF_TXFIFO_WML,
+	.rx_burst = FSL_SPDIF_RXFIFO_WML,
+	.tx_formats = FSL_SPDIF_FORMATS_PLAYBACK,
+};
+
 /* Check if clk is a root clock that does not share clock source with others */
 static inline bool fsl_spdif_can_set_clk_rate(struct fsl_spdif_priv *spdif, int clk)
 {
@@ -846,6 +862,39 @@ static int fsl_spdif_tx_vbit_put(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int fsl_spdif_rx_rcm_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(cpu_dai);
+	struct regmap *regmap = spdif_priv->regmap;
+	u32 val;
+
+	regmap_read(regmap, REG_SPDIF_SCR, &val);
+	val = (val & SCR_RAW_CAPTURE_MODE) ? 1 : 0;
+	ucontrol->value.integer.value[0] = val;
+
+	return 0;
+}
+
+static int fsl_spdif_rx_rcm_put(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(cpu_dai);
+	struct regmap *regmap = spdif_priv->regmap;
+	u32 val = (ucontrol->value.integer.value[0] ? SCR_RAW_CAPTURE_MODE : 0);
+
+	if (val)
+		cpu_dai->driver->capture.formats |= SNDRV_PCM_FMTBIT_S32_LE;
+	else
+		cpu_dai->driver->capture.formats &= ~SNDRV_PCM_FMTBIT_S32_LE;
+
+	regmap_update_bits(regmap, REG_SPDIF_SCR, SCR_RAW_CAPTURE_MODE, val);
+
+	return 0;
+}
+
 /* DPLL lock information */
 static int fsl_spdif_rxrate_info(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_info *uinfo)
@@ -1029,6 +1078,19 @@ static struct snd_kcontrol_new fsl_spdif_ctrls[] = {
 	},
 };
 
+static struct snd_kcontrol_new fsl_spdif_ctrls_rcm[] = {
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = "IEC958 Raw Capture Mode",
+		.access = SNDRV_CTL_ELEM_ACCESS_READ |
+			SNDRV_CTL_ELEM_ACCESS_WRITE |
+			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.info = snd_ctl_boolean_mono_info,
+		.get = fsl_spdif_rx_rcm_get,
+		.put = fsl_spdif_rx_rcm_put,
+	},
+};
+
 static int fsl_spdif_dai_probe(struct snd_soc_dai *dai)
 {
 	struct fsl_spdif_priv *spdif_private = snd_soc_dai_get_drvdata(dai);
@@ -1038,6 +1100,10 @@ static int fsl_spdif_dai_probe(struct snd_soc_dai *dai)
 
 	snd_soc_add_dai_controls(dai, fsl_spdif_ctrls, ARRAY_SIZE(fsl_spdif_ctrls));
 
+	if (spdif_private->soc->raw_capture_mode)
+		snd_soc_add_dai_controls(dai, fsl_spdif_ctrls_rcm,
+					 ARRAY_SIZE(fsl_spdif_ctrls_rcm));
+
 	/*Clear the val bit for Tx*/
 	regmap_update_bits(spdif_private->regmap, REG_SPDIF_SCR,
 			   SCR_VAL_MASK, SCR_VAL_CLEAR);
@@ -1476,6 +1542,7 @@ static const struct of_device_id fsl_spdif_dt_ids[] = {
 	{ .compatible = "fsl,vf610-spdif", .data = &fsl_spdif_vf610, },
 	{ .compatible = "fsl,imx6sx-spdif", .data = &fsl_spdif_imx6sx, },
 	{ .compatible = "fsl,imx8qm-spdif", .data = &fsl_spdif_imx8qm, },
+	{ .compatible = "fsl,imx8mm-spdif", .data = &fsl_spdif_imx8mm, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_spdif_dt_ids);
diff --git a/sound/soc/fsl/fsl_spdif.h b/sound/soc/fsl/fsl_spdif.h
index d5f1dfd58740..bff8290e71f2 100644
--- a/sound/soc/fsl/fsl_spdif.h
+++ b/sound/soc/fsl/fsl_spdif.h
@@ -63,6 +63,7 @@
 #define SCR_TXFIFO_FSEL_IF4		(0x1 << SCR_TXFIFO_FSEL_OFFSET)
 #define SCR_TXFIFO_FSEL_IF8		(0x2 << SCR_TXFIFO_FSEL_OFFSET)
 #define SCR_TXFIFO_FSEL_IF12		(0x3 << SCR_TXFIFO_FSEL_OFFSET)
+#define SCR_RAW_CAPTURE_MODE		BIT(14)
 #define SCR_LOW_POWER			(1 << 13)
 #define SCR_SOFT_RESET			(1 << 12)
 #define SCR_TXFIFO_CTRL_OFFSET		10
-- 
2.27.0

