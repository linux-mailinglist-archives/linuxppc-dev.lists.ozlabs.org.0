Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AAA654F2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 13:06:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ktX969qBzDqcF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 21:06:01 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ktNF6Lh1zDqcH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 20:59:06 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 820C0200907;
 Thu, 11 Jul 2019 12:59:03 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7DE64200903;
 Thu, 11 Jul 2019 12:58:57 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 1F52D402E3;
 Thu, 11 Jul 2019 18:58:50 +0800 (SGT)
From: shengjiu.wang@nxp.com
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 broonie@kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH V4 1/2] ASoC: fsl_esai: Wrap some operations to be functions
Date: Thu, 11 Jul 2019 18:49:45 +0800
Message-Id: <804d7e75ae7e06a913479912b578b3538ca7cd3f.1562842206.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1562842206.git.shengjiu.wang@nxp.com>
References: <cover.1562842206.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1562842206.git.shengjiu.wang@nxp.com>
References: <cover.1562842206.git.shengjiu.wang@nxp.com>
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

Extract the operation to be functions, to improve the
readability.

In this patch, fsl_esai_hw_init, fsl_esai_register_restore,
fsl_esai_trigger_start and fsl_esai_trigger_stop are
extracted.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 sound/soc/fsl/fsl_esai.c | 192 ++++++++++++++++++++++++---------------
 1 file changed, 119 insertions(+), 73 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 10d2210c91ef..ab460d6d7432 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -35,6 +35,7 @@
  * @fifo_depth: depth of tx/rx FIFO
  * @slot_width: width of each DAI slot
  * @slots: number of slots
+ * @channels: channel num for tx or rx
  * @hck_rate: clock rate of desired HCKx clock
  * @sck_rate: clock rate of desired SCKx clock
  * @hck_dir: the direction of HCKx pads
@@ -57,6 +58,7 @@ struct fsl_esai {
 	u32 slots;
 	u32 tx_mask;
 	u32 rx_mask;
+	u32 channels[2];
 	u32 hck_rate[2];
 	u32 sck_rate[2];
 	bool hck_dir[2];
@@ -543,64 +545,132 @@ static int fsl_esai_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
-			    struct snd_soc_dai *dai)
+static int fsl_esai_hw_init(struct fsl_esai *esai_priv)
 {
-	struct fsl_esai *esai_priv = snd_soc_dai_get_drvdata(dai);
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-	u8 i, channels = substream->runtime->channels;
+	struct platform_device *pdev = esai_priv->pdev;
+	int ret;
+
+	/* Reset ESAI unit */
+	ret = regmap_update_bits(esai_priv->regmap, REG_ESAI_ECR,
+				 ESAI_ECR_ESAIEN_MASK | ESAI_ECR_ERST_MASK,
+				 ESAI_ECR_ESAIEN | ESAI_ECR_ERST);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to reset ESAI: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * We need to enable ESAI so as to access some of its registers.
+	 * Otherwise, we would fail to dump regmap from user space.
+	 */
+	ret = regmap_update_bits(esai_priv->regmap, REG_ESAI_ECR,
+				 ESAI_ECR_ESAIEN_MASK | ESAI_ECR_ERST_MASK,
+				 ESAI_ECR_ESAIEN);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to enable ESAI: %d\n", ret);
+		return ret;
+	}
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_PRRC,
+			   ESAI_PRRC_PDC_MASK, 0);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_PCRC,
+			   ESAI_PCRC_PC_MASK, 0);
+
+	return 0;
+}
+
+static int fsl_esai_register_restore(struct fsl_esai *esai_priv)
+{
+	int ret;
+
+	/* FIFO reset for safety */
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TFCR,
+			   ESAI_xFCR_xFR, ESAI_xFCR_xFR);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RFCR,
+			   ESAI_xFCR_xFR, ESAI_xFCR_xFR);
+
+	regcache_mark_dirty(esai_priv->regmap);
+	ret = regcache_sync(esai_priv->regmap);
+	if (ret)
+		return ret;
+
+	/* FIFO reset done */
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TFCR, ESAI_xFCR_xFR, 0);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RFCR, ESAI_xFCR_xFR, 0);
+
+	return 0;
+}
+
+static void fsl_esai_trigger_start(struct fsl_esai *esai_priv, bool tx)
+{
+	u8 i, channels = esai_priv->channels[tx];
 	u32 pins = DIV_ROUND_UP(channels, esai_priv->slots);
 	u32 mask;
 
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_xFCR(tx),
+			   ESAI_xFCR_xFEN_MASK, ESAI_xFCR_xFEN);
+
+	/* Write initial words reqiured by ESAI as normal procedure */
+	for (i = 0; tx && i < channels; i++)
+		regmap_write(esai_priv->regmap, REG_ESAI_ETDR, 0x0);
+
+	/*
+	 * When set the TE/RE in the end of enablement flow, there
+	 * will be channel swap issue for multi data line case.
+	 * In order to workaround this issue, we switch the bit
+	 * enablement sequence to below sequence
+	 * 1) clear the xSMB & xSMA: which is done in probe and
+	 *                           stop state.
+	 * 2) set TE/RE
+	 * 3) set xSMB
+	 * 4) set xSMA:  xSMA is the last one in this flow, which
+	 *               will trigger esai to start.
+	 */
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
+			   tx ? ESAI_xCR_TE_MASK : ESAI_xCR_RE_MASK,
+			   tx ? ESAI_xCR_TE(pins) : ESAI_xCR_RE(pins));
+	mask = tx ? esai_priv->tx_mask : esai_priv->rx_mask;
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_xSMB(tx),
+			   ESAI_xSMB_xS_MASK, ESAI_xSMB_xS(mask));
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_xSMA(tx),
+			   ESAI_xSMA_xS_MASK, ESAI_xSMA_xS(mask));
+}
+
+static void fsl_esai_trigger_stop(struct fsl_esai *esai_priv, bool tx)
+{
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
+			   tx ? ESAI_xCR_TE_MASK : ESAI_xCR_RE_MASK, 0);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_xSMA(tx),
+			   ESAI_xSMA_xS_MASK, 0);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_xSMB(tx),
+			   ESAI_xSMB_xS_MASK, 0);
+
+	/* Disable and reset FIFO */
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_xFCR(tx),
+			   ESAI_xFCR_xFR | ESAI_xFCR_xFEN, ESAI_xFCR_xFR);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_xFCR(tx),
+			   ESAI_xFCR_xFR, 0);
+}
+
+static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
+			    struct snd_soc_dai *dai)
+{
+	struct fsl_esai *esai_priv = snd_soc_dai_get_drvdata(dai);
+	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+
+	esai_priv->channels[tx] = substream->runtime->channels;
+
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		regmap_update_bits(esai_priv->regmap, REG_ESAI_xFCR(tx),
-				   ESAI_xFCR_xFEN_MASK, ESAI_xFCR_xFEN);
-
-		/* Write initial words reqiured by ESAI as normal procedure */
-		for (i = 0; tx && i < channels; i++)
-			regmap_write(esai_priv->regmap, REG_ESAI_ETDR, 0x0);
-
-		/*
-		 * When set the TE/RE in the end of enablement flow, there
-		 * will be channel swap issue for multi data line case.
-		 * In order to workaround this issue, we switch the bit
-		 * enablement sequence to below sequence
-		 * 1) clear the xSMB & xSMA: which is done in probe and
-		 *                           stop state.
-		 * 2) set TE/RE
-		 * 3) set xSMB
-		 * 4) set xSMA:  xSMA is the last one in this flow, which
-		 *               will trigger esai to start.
-		 */
-		regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
-				   tx ? ESAI_xCR_TE_MASK : ESAI_xCR_RE_MASK,
-				   tx ? ESAI_xCR_TE(pins) : ESAI_xCR_RE(pins));
-		mask = tx ? esai_priv->tx_mask : esai_priv->rx_mask;
-
-		regmap_update_bits(esai_priv->regmap, REG_ESAI_xSMB(tx),
-				   ESAI_xSMB_xS_MASK, ESAI_xSMB_xS(mask));
-		regmap_update_bits(esai_priv->regmap, REG_ESAI_xSMA(tx),
-				   ESAI_xSMA_xS_MASK, ESAI_xSMA_xS(mask));
-
+		fsl_esai_trigger_start(esai_priv, tx);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
-				   tx ? ESAI_xCR_TE_MASK : ESAI_xCR_RE_MASK, 0);
-		regmap_update_bits(esai_priv->regmap, REG_ESAI_xSMA(tx),
-				   ESAI_xSMA_xS_MASK, 0);
-		regmap_update_bits(esai_priv->regmap, REG_ESAI_xSMB(tx),
-				   ESAI_xSMB_xS_MASK, 0);
-
-		/* Disable and reset FIFO */
-		regmap_update_bits(esai_priv->regmap, REG_ESAI_xFCR(tx),
-				   ESAI_xFCR_xFR | ESAI_xFCR_xFEN, ESAI_xFCR_xFR);
-		regmap_update_bits(esai_priv->regmap, REG_ESAI_xFCR(tx),
-				   ESAI_xFCR_xFR, 0);
+		fsl_esai_trigger_stop(esai_priv, tx);
 		break;
 	default:
 		return -EINVAL;
@@ -866,22 +936,9 @@ static int fsl_esai_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, esai_priv);
 
-	/* Reset ESAI unit */
-	ret = regmap_write(esai_priv->regmap, REG_ESAI_ECR, ESAI_ECR_ERST);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to reset ESAI: %d\n", ret);
+	ret = fsl_esai_hw_init(esai_priv);
+	if (ret)
 		return ret;
-	}
-
-	/*
-	 * We need to enable ESAI so as to access some of its registers.
-	 * Otherwise, we would fail to dump regmap from user space.
-	 */
-	ret = regmap_write(esai_priv->regmap, REG_ESAI_ECR, ESAI_ECR_ESAIEN);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to enable ESAI: %d\n", ret);
-		return ret;
-	}
 
 	esai_priv->tx_mask = 0xFFFFFFFF;
 	esai_priv->rx_mask = 0xFFFFFFFF;
@@ -955,20 +1012,10 @@ static int fsl_esai_runtime_resume(struct device *dev)
 
 	regcache_cache_only(esai->regmap, false);
 
-	/* FIFO reset for safety */
-	regmap_update_bits(esai->regmap, REG_ESAI_TFCR,
-			   ESAI_xFCR_xFR, ESAI_xFCR_xFR);
-	regmap_update_bits(esai->regmap, REG_ESAI_RFCR,
-			   ESAI_xFCR_xFR, ESAI_xFCR_xFR);
-
-	ret = regcache_sync(esai->regmap);
+	ret = fsl_esai_register_restore(esai);
 	if (ret)
 		goto err_regcache_sync;
 
-	/* FIFO reset done */
-	regmap_update_bits(esai->regmap, REG_ESAI_TFCR, ESAI_xFCR_xFR, 0);
-	regmap_update_bits(esai->regmap, REG_ESAI_RFCR, ESAI_xFCR_xFR, 0);
-
 	return 0;
 
 err_regcache_sync:
@@ -991,7 +1038,6 @@ static int fsl_esai_runtime_suspend(struct device *dev)
 	struct fsl_esai *esai = dev_get_drvdata(dev);
 
 	regcache_cache_only(esai->regmap, true);
-	regcache_mark_dirty(esai->regmap);
 
 	if (!IS_ERR(esai->fsysclk))
 		clk_disable_unprepare(esai->fsysclk);
-- 
2.21.0

