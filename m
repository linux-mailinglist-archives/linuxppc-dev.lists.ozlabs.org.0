Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2576FFED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 14:40:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sh6W5B5QzDqQC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 22:40:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=sirena.org.uk
 (client-ip=2a01:7e01::f03c:91ff:fed4:a3b6; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="uCPTokai"; dkim-atps=neutral
X-Greylist: delayed 988 seconds by postgrey-1.36 at bilbo;
 Mon, 22 Jul 2019 22:38:49 AEST
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45sh496tZzzDqS8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 22:38:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=/Qw7EW1lUw5JE6HEEC0gh5tWgu8taRiBHnBhmdLd3IY=; b=uCPTokaiYDKj
 DDgaZj3JufjCZJvXPnFpfgEuidaYkHDyBr2s/1U1z+t3JkKASvDPD/JlidKRWHpneoTsDLB7j5qVO
 4YJPzcdJMv8bS+hITVE7XA4uunTCv+E/aF2i00pTw9CdX1w6dN+v871LNmP6FCiEQtkJRjE6p53zt
 psLU8=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpXKT-0007dK-Dn; Mon, 22 Jul 2019 12:22:09 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id BB7DB27416CB; Mon, 22 Jul 2019 13:22:08 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Applied "ASoC: fsl_esai: Wrap some operations to be functions" to the
 asoc tree
In-Reply-To: <804d7e75ae7e06a913479912b578b3538ca7cd3f.1562842206.git.shengjiu.wang@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190722122208.BB7DB27416CB@ypsilon.sirena.org.uk>
Date: Mon, 22 Jul 2019 13:22:08 +0100 (BST)
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, perex@perex.cz, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch

   ASoC: fsl_esai: Wrap some operations to be functions

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 5be6155b50bbf7083b4bfa219e4ce6d1491f42f0 Mon Sep 17 00:00:00 2001
From: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Thu, 11 Jul 2019 18:49:45 +0800
Subject: [PATCH] ASoC: fsl_esai: Wrap some operations to be functions

Extract the operation to be functions, to improve the
readability.

In this patch, fsl_esai_hw_init, fsl_esai_register_restore,
fsl_esai_trigger_start and fsl_esai_trigger_stop are
extracted.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Link: https://lore.kernel.org/r/804d7e75ae7e06a913479912b578b3538ca7cd3f.1562842206.git.shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_esai.c | 188 ++++++++++++++++++++++++---------------
 1 file changed, 117 insertions(+), 71 deletions(-)

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
 
+static int fsl_esai_hw_init(struct fsl_esai *esai_priv)
+{
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
+	u32 pins = DIV_ROUND_UP(channels, esai_priv->slots);
+	u32 mask;
+
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
 static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
 			    struct snd_soc_dai *dai)
 {
 	struct fsl_esai *esai_priv = snd_soc_dai_get_drvdata(dai);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-	u8 i, channels = substream->runtime->channels;
-	u32 pins = DIV_ROUND_UP(channels, esai_priv->slots);
-	u32 mask;
+
+	esai_priv->channels[tx] = substream->runtime->channels;
 
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
-		return ret;
-	}
-
-	/*
-	 * We need to enable ESAI so as to access some of its registers.
-	 * Otherwise, we would fail to dump regmap from user space.
-	 */
-	ret = regmap_write(esai_priv->regmap, REG_ESAI_ECR, ESAI_ECR_ESAIEN);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to enable ESAI: %d\n", ret);
+	ret = fsl_esai_hw_init(esai_priv);
+	if (ret)
 		return ret;
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
2.20.1

