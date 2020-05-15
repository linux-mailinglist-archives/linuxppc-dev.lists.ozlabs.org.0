Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 401FD1D4AC1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 12:22:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Nkx64972zDqsm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 20:22:18 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Nkv95YDczDqnl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 20:20:35 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 872241A068B;
 Fri, 15 May 2020 12:20:31 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 179421A06A7;
 Fri, 15 May 2020 12:20:26 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id A61F940318;
 Fri, 15 May 2020 18:20:19 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] ASoC: fsl_esai: introduce SoC specific data
Date: Fri, 15 May 2020 18:10:50 +0800
Message-Id: <c188279975bd216995904f9bf8a84c7887b759a0.1589537601.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1589537601.git.shengjiu.wang@nxp.com>
References: <cover.1589537601.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1589537601.git.shengjiu.wang@nxp.com>
References: <cover.1589537601.git.shengjiu.wang@nxp.com>
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

Introduce a SoC specific data structure which contains the
differences between the different SoCs.
This makes it easier to support more differences without having
to introduce a new if/else each time.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 sound/soc/fsl/fsl_esai.c | 46 ++++++++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 84290be778f0..bac65ba7fbad 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -21,6 +21,17 @@
 				SNDRV_PCM_FMTBIT_S20_3LE | \
 				SNDRV_PCM_FMTBIT_S24_LE)
 
+/**
+ * fsl_esai_soc_data: soc specific data
+ *
+ * @imx: for imx platform
+ * @reset_at_xrun: flags for enable reset operaton
+ */
+struct fsl_esai_soc_data {
+	bool imx;
+	bool reset_at_xrun;
+};
+
 /**
  * fsl_esai: ESAI private data
  *
@@ -33,6 +44,7 @@
  * @fsysclk: system clock source to derive HCK, SCK and FS
  * @spbaclk: SPBA clock (optional, depending on SoC design)
  * @task: tasklet to handle the reset operation
+ * @soc: soc specific data
  * @lock: spin lock between hw_reset() and trigger()
  * @fifo_depth: depth of tx/rx FIFO
  * @slot_width: width of each DAI slot
@@ -44,7 +56,6 @@
  * @sck_div: if using PSR/PM dividers for SCKx clock
  * @slave_mode: if fully using DAI slave mode
  * @synchronous: if using tx/rx synchronous mode
- * @reset_at_xrun: flags for enable reset operaton
  * @name: driver name
  */
 struct fsl_esai {
@@ -57,6 +68,7 @@ struct fsl_esai {
 	struct clk *fsysclk;
 	struct clk *spbaclk;
 	struct tasklet_struct task;
+	const struct fsl_esai_soc_data *soc;
 	spinlock_t lock; /* Protect hw_reset and trigger */
 	u32 fifo_depth;
 	u32 slot_width;
@@ -70,10 +82,24 @@ struct fsl_esai {
 	bool sck_div[2];
 	bool slave_mode;
 	bool synchronous;
-	bool reset_at_xrun;
 	char name[32];
 };
 
+static struct fsl_esai_soc_data fsl_esai_vf610 = {
+	.imx = false,
+	.reset_at_xrun = true,
+};
+
+static struct fsl_esai_soc_data fsl_esai_imx35 = {
+	.imx = true,
+	.reset_at_xrun = true,
+};
+
+static struct fsl_esai_soc_data fsl_esai_imx6ull = {
+	.imx = true,
+	.reset_at_xrun = false,
+};
+
 static irqreturn_t esai_isr(int irq, void *devid)
 {
 	struct fsl_esai *esai_priv = (struct fsl_esai *)devid;
@@ -85,7 +111,7 @@ static irqreturn_t esai_isr(int irq, void *devid)
 	regmap_read(esai_priv->regmap, REG_ESAI_SAISR, &saisr);
 
 	if ((saisr & (ESAI_SAISR_TUE | ESAI_SAISR_ROE)) &&
-	    esai_priv->reset_at_xrun) {
+	    esai_priv->soc->reset_at_xrun) {
 		dev_dbg(&pdev->dev, "reset module for xrun\n");
 		regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
 				   ESAI_xCR_xEIE_MASK, 0);
@@ -936,9 +962,11 @@ static int fsl_esai_probe(struct platform_device *pdev)
 	esai_priv->pdev = pdev;
 	snprintf(esai_priv->name, sizeof(esai_priv->name), "%pOFn", np);
 
-	if (of_device_is_compatible(np, "fsl,vf610-esai") ||
-	    of_device_is_compatible(np, "fsl,imx35-esai"))
-		esai_priv->reset_at_xrun = true;
+	esai_priv->soc = of_device_get_match_data(&pdev->dev);
+	if (!esai_priv->soc) {
+		dev_err(&pdev->dev, "failed to get soc data\n");
+		return -ENODEV;
+	}
 
 	/* Get the addresses and IRQ */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -1063,9 +1091,9 @@ static int fsl_esai_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id fsl_esai_dt_ids[] = {
-	{ .compatible = "fsl,imx35-esai", },
-	{ .compatible = "fsl,vf610-esai", },
-	{ .compatible = "fsl,imx6ull-esai", },
+	{ .compatible = "fsl,imx35-esai", .data = &fsl_esai_imx35 },
+	{ .compatible = "fsl,vf610-esai", .data = &fsl_esai_vf610 },
+	{ .compatible = "fsl,imx6ull-esai", .data = &fsl_esai_imx6ull },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_esai_dt_ids);
-- 
2.21.0

