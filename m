Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8905F5DE53
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 08:57:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dsP40Hx2zDqMH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 16:57:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dsG96vvQzDqQP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 16:51:21 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id ACEC2200351;
 Wed,  3 Jul 2019 08:51:18 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 19643200349;
 Wed,  3 Jul 2019 08:51:14 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id DED2D402EB;
 Wed,  3 Jul 2019 14:51:08 +0800 (SGT)
From: shengjiu.wang@nxp.com
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH V2 2/2] ASoC: fsl_esai: recover the channel swap after xrun
Date: Wed,  3 Jul 2019 14:42:05 +0800
Message-Id: <c29639336b6b32fa781bdddad30287f8b76d5e0b.1562136119.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1562136119.git.shengjiu.wang@nxp.com>
References: <cover.1562136119.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1562136119.git.shengjiu.wang@nxp.com>
References: <cover.1562136119.git.shengjiu.wang@nxp.com>
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

From: Shengjiu Wang <shengjiu.wang@nxp.com>

There is chip errata ERR008000, the reference doc is
(https://www.nxp.com/docs/en/errata/IMX6DQCE.pdf),

The issue is "While using ESAI transmit or receive and
an underrun/overrun happens, channel swap may occur.
The only recovery mechanism is to reset the ESAI."

This issue exist in imx3/imx5/imx6(partial) series.

In this commit add a tasklet to handle reset of ESAI
after xrun happens to recover the channel swap.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_esai.c | 76 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 20039ae9893b..8c92e49ad6d8 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -32,6 +32,7 @@
  * @extalclk: esai clock source to derive HCK, SCK and FS
  * @fsysclk: system clock source to derive HCK, SCK and FS
  * @spbaclk: SPBA clock (optional, depending on SoC design)
+ * @task: tasklet to handle the reset operation
  * @fifo_depth: depth of tx/rx FIFO
  * @slot_width: width of each DAI slot
  * @slots: number of slots
@@ -42,6 +43,7 @@
  * @sck_div: if using PSR/PM dividers for SCKx clock
  * @slave_mode: if fully using DAI slave mode
  * @synchronous: if using tx/rx synchronous mode
+ * @reset_at_xrun: flags for enable reset operaton
  * @name: driver name
  */
 struct fsl_esai {
@@ -53,6 +55,7 @@ struct fsl_esai {
 	struct clk *extalclk;
 	struct clk *fsysclk;
 	struct clk *spbaclk;
+	struct tasklet_struct task;
 	u32 fifo_depth;
 	u32 slot_width;
 	u32 slots;
@@ -65,6 +68,7 @@ struct fsl_esai {
 	bool sck_div[2];
 	bool slave_mode;
 	bool synchronous;
+	bool reset_at_xrun;
 	char name[32];
 };
 
@@ -73,8 +77,16 @@ static irqreturn_t esai_isr(int irq, void *devid)
 	struct fsl_esai *esai_priv = (struct fsl_esai *)devid;
 	struct platform_device *pdev = esai_priv->pdev;
 	u32 esr;
+	u32 saisr;
 
 	regmap_read(esai_priv->regmap, REG_ESAI_ESR, &esr);
+	regmap_read(esai_priv->regmap, REG_ESAI_SAISR, &saisr);
+
+	if ((saisr & (ESAI_SAISR_TUE | ESAI_SAISR_ROE)) &&
+	    esai_priv->reset_at_xrun) {
+		dev_dbg(&pdev->dev, "reset module for xrun\n");
+		tasklet_schedule(&esai_priv->task);
+	}
 
 	if (esr & ESAI_ESR_TINIT_MASK)
 		dev_dbg(&pdev->dev, "isr: Transmission Initialized\n");
@@ -634,10 +646,17 @@ static void fsl_esai_trigger_start(struct fsl_esai *esai_priv, bool tx)
 			   ESAI_xSMB_xS_MASK, ESAI_xSMB_xS(mask));
 	regmap_update_bits(esai_priv->regmap, REG_ESAI_xSMA(tx),
 			   ESAI_xSMA_xS_MASK, ESAI_xSMA_xS(mask));
+
+	/* Enable Exception interrupt */
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
+			   ESAI_xCR_xEIE_MASK, ESAI_xCR_xEIE);
 }
 
 static void fsl_esai_trigger_stop(struct fsl_esai *esai_priv, bool tx)
 {
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
+			   ESAI_xCR_xEIE_MASK, 0);
+
 	regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
 			   tx ? ESAI_xCR_TE_MASK : ESAI_xCR_RE_MASK, 0);
 	regmap_update_bits(esai_priv->regmap, REG_ESAI_xSMA(tx),
@@ -652,6 +671,53 @@ static void fsl_esai_trigger_stop(struct fsl_esai *esai_priv, bool tx)
 			   ESAI_xFCR_xFR, 0);
 }
 
+static void fsl_esai_reset(unsigned long arg)
+{
+	struct fsl_esai *esai_priv = (struct fsl_esai *)arg;
+	u32 saisr, tfcr, rfcr;
+
+	/* save the registers */
+	regmap_read(esai_priv->regmap, REG_ESAI_TFCR, &tfcr);
+	regmap_read(esai_priv->regmap, REG_ESAI_RFCR, &rfcr);
+
+	/* stop the tx & rx */
+	fsl_esai_trigger_stop(esai_priv, 1);
+	fsl_esai_trigger_stop(esai_priv, 0);
+
+	/* reset the esai, and restore the registers */
+	fsl_esai_init(esai_priv);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
+			   ESAI_xCR_xPR_MASK,
+			   ESAI_xCR_xPR);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
+			   ESAI_xCR_xPR_MASK,
+			   ESAI_xCR_xPR);
+
+	/* restore registers by regcache_sync */
+	fsl_esai_register_restore(esai_priv);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
+			   ESAI_xCR_xPR_MASK, 0);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
+			   ESAI_xCR_xPR_MASK, 0);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_PRRC,
+			   ESAI_PRRC_PDC_MASK,
+			   ESAI_PRRC_PDC(ESAI_GPIO));
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_PCRC,
+			   ESAI_PCRC_PC_MASK,
+			   ESAI_PCRC_PC(ESAI_GPIO));
+
+	regmap_read(esai_priv->regmap, REG_ESAI_SAISR, &saisr);
+
+	/* restart tx / rx, if they already enabled */
+	if (tfcr & ESAI_xFCR_xFEN)
+		fsl_esai_trigger_start(esai_priv, 1);
+	if (rfcr & ESAI_xFCR_xFEN)
+		fsl_esai_trigger_start(esai_priv, 0);
+}
+
 static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
 			    struct snd_soc_dai *dai)
 {
@@ -856,6 +922,10 @@ static int fsl_esai_probe(struct platform_device *pdev)
 	esai_priv->pdev = pdev;
 	snprintf(esai_priv->name, sizeof(esai_priv->name), "%pOFn", np);
 
+	if (of_device_is_compatible(np, "fsl,vf610-esai") ||
+	    of_device_is_compatible(np, "fsl,imx35-esai"))
+		esai_priv->reset_at_xrun = true;
+
 	/* Get the addresses and IRQ */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	regs = devm_ioremap_resource(&pdev->dev, res);
@@ -955,6 +1025,9 @@ static int fsl_esai_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	tasklet_init(&esai_priv->task, fsl_esai_reset,
+		     (unsigned long)esai_priv);
+
 	pm_runtime_enable(&pdev->dev);
 
 	regcache_cache_only(esai_priv->regmap, true);
@@ -968,7 +1041,10 @@ static int fsl_esai_probe(struct platform_device *pdev)
 
 static int fsl_esai_remove(struct platform_device *pdev)
 {
+	struct fsl_esai *esai_priv = platform_get_drvdata(pdev);
+
 	pm_runtime_disable(&pdev->dev);
+	tasklet_kill(&esai_priv->task);
 
 	return 0;
 }
-- 
2.21.0

