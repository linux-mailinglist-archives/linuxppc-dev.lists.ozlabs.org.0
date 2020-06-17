Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BE51FC55C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 06:45:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49msvd6GY2zDqf1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 14:45:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mspj6fqYzDqvP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 14:41:33 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F21A31A09DA;
 Wed, 17 Jun 2020 06:41:29 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 817F41A09EC;
 Wed, 17 Jun 2020 06:41:24 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id B2172402B3;
 Wed, 17 Jun 2020 12:41:17 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: fsl_spdif: Add support for imx6sx platform
Date: Wed, 17 Jun 2020 12:30:17 +0800
Message-Id: <53a969a83999de91f3ff2809d78335c3f0cc1ee3.1592368322.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <feda3bb02296455d43aeebb7575918d9b28e1a3f.1592368322.git.shengjiu.wang@nxp.com>
References: <feda3bb02296455d43aeebb7575918d9b28e1a3f.1592368322.git.shengjiu.wang@nxp.com>
In-Reply-To: <feda3bb02296455d43aeebb7575918d9b28e1a3f.1592368322.git.shengjiu.wang@nxp.com>
References: <feda3bb02296455d43aeebb7575918d9b28e1a3f.1592368322.git.shengjiu.wang@nxp.com>
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

The one difference on imx6sx platform is that the root clock
is shared with ASRC module, so we add a new flags
"shared_root_clock" which means the root clock is independent,
then we will not do the clk_set_rate and clk_round_rate to avoid
impact ASRC module usage.

As add a new flags, we include the soc specific data struct.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2
- use shared_root_clk instead ind_root_clk.
- add fsl_spdif_can_set_clk_rate function.

 sound/soc/fsl/fsl_spdif.c | 50 +++++++++++++++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 1b2e516f9162..8dc1959d0463 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -42,6 +42,18 @@ static u8 srpc_dpll_locked[] = { 0x0, 0x1, 0x2, 0x3, 0x4, 0xa, 0xb };
 
 #define DEFAULT_RXCLK_SRC	1
 
+/**
+ * struct fsl_spdif_soc_data: soc specific data
+ *
+ * @imx: for imx platform
+ * @shared_root_clock: flag of sharing a clock source with others;
+ *                     so the driver shouldn't set root clock rate
+ */
+struct fsl_spdif_soc_data {
+	bool imx;
+	bool shared_root_clock;
+};
+
 /*
  * SPDIF control structure
  * Defines channel status, subcode and Q sub
@@ -89,6 +101,7 @@ struct spdif_mixer_control {
  * @dma_params_rx: DMA parameters for receive channel
  */
 struct fsl_spdif_priv {
+	const struct fsl_spdif_soc_data *soc;
 	struct spdif_mixer_control fsl_spdif_control;
 	struct snd_soc_dai_driver cpu_dai_drv;
 	struct platform_device *pdev;
@@ -110,6 +123,28 @@ struct fsl_spdif_priv {
 	u32 regcache_srpc;
 };
 
+static struct fsl_spdif_soc_data fsl_spdif_vf610 = {
+	.imx = false,
+	.shared_root_clock = false,
+};
+
+static struct fsl_spdif_soc_data fsl_spdif_imx35 = {
+	.imx = true,
+	.shared_root_clock = false,
+};
+
+static struct fsl_spdif_soc_data fsl_spdif_imx6sx = {
+	.imx = true,
+	.shared_root_clock = true,
+};
+
+/* Check if clk is a root clock that does not share clock source with others */
+static inline bool fsl_spdif_can_set_clk_rate(struct fsl_spdif_priv *spdif,
+					      int clk)
+{
+	return (clk == STC_TXCLK_SPDIF_ROOT) && !spdif->soc->shared_root_clock;
+}
+
 /* DPLL locked and lock loss interrupt handler */
 static void spdif_irq_dpll_lock(struct fsl_spdif_priv *spdif_priv)
 {
@@ -421,7 +456,7 @@ static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
 	sysclk_df = spdif_priv->sysclk_df[rate];
 
 	/* Don't mess up the clocks from other modules */
-	if (clk != STC_TXCLK_SPDIF_ROOT)
+	if (!fsl_spdif_can_set_clk_rate(spdif_priv, clk))
 		goto clk_set_bypass;
 
 	/* The S/PDIF block needs a clock of 64 * fs * txclk_df */
@@ -1186,7 +1221,7 @@ static int fsl_spdif_probe_txclk(struct fsl_spdif_priv *spdif_priv,
 			continue;
 
 		ret = fsl_spdif_txclk_caldiv(spdif_priv, clk, savesub, index,
-					     i == STC_TXCLK_SPDIF_ROOT);
+					     fsl_spdif_can_set_clk_rate(spdif_priv, i));
 		if (savesub == ret)
 			continue;
 
@@ -1230,6 +1265,12 @@ static int fsl_spdif_probe(struct platform_device *pdev)
 
 	spdif_priv->pdev = pdev;
 
+	spdif_priv->soc = of_device_get_match_data(&pdev->dev);
+	if (!spdif_priv->soc) {
+		dev_err(&pdev->dev, "failed to get soc data\n");
+		return -ENODEV;
+	}
+
 	/* Initialize this copy of the CPU DAI driver structure */
 	memcpy(&spdif_priv->cpu_dai_drv, &fsl_spdif_dai, sizeof(fsl_spdif_dai));
 	spdif_priv->cpu_dai_drv.name = dev_name(&pdev->dev);
@@ -1359,8 +1400,9 @@ static const struct dev_pm_ops fsl_spdif_pm = {
 };
 
 static const struct of_device_id fsl_spdif_dt_ids[] = {
-	{ .compatible = "fsl,imx35-spdif", },
-	{ .compatible = "fsl,vf610-spdif", },
+	{ .compatible = "fsl,imx35-spdif", .data = &fsl_spdif_imx35, },
+	{ .compatible = "fsl,vf610-spdif", .data = &fsl_spdif_vf610, },
+	{ .compatible = "fsl,imx6sx-spdif", .data = &fsl_spdif_imx6sx, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_spdif_dt_ids);
-- 
2.21.0

