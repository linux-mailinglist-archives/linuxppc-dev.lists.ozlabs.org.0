Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 458715214D7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 14:09:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyH061c9Wz3cLc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 22:09:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyGzd1KLmz2xfP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 22:08:59 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 615831A005D;
 Tue, 10 May 2022 14:08:56 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CE76B1A0056;
 Tue, 10 May 2022 14:08:55 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 99A48180031E;
 Tue, 10 May 2022 20:08:54 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_ssi: Add support multi fifo script
Date: Tue, 10 May 2022 19:56:48 +0800
Message-Id: <1652183808-3745-1-git-send-email-shengjiu.wang@nxp.com>
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

With dual fifo enabled, the case that recording mono sound
in the background, playback mono sound twice in parallal,
at second time playback sound may distort, the possible
reason is using dual fifo to playback mono sound is not
recommended.

This patch is to provide a option to use multi fifo script,
which can be dynamically configured as one fifo or two fifo
mode.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_ssi.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index ca30a4ede076..84cb36d9dfea 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -40,6 +40,7 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/dma/imx-dma.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -214,6 +215,7 @@ struct fsl_ssi_soc_data {
  * @synchronous: Use synchronous mode - both of TX and RX use STCK and SFCK
  * @use_dma: DMA is used or FIQ with stream filter
  * @use_dual_fifo: DMA with support for dual FIFO mode
+ * @use_dyna_fifo: DMA with support for multi FIFO script
  * @has_ipg_clk_name: If "ipg" is in the clock name list of device tree
  * @fifo_depth: Depth of the SSI FIFOs
  * @slot_width: Width of each DAI slot
@@ -243,6 +245,7 @@ struct fsl_ssi_soc_data {
  * @dma_maxburst: Max number of words to transfer in one go. So far,
  *                this is always the same as fifo_watermark.
  * @ac97_reg_lock: Mutex lock to serialize AC97 register access operations
+ * @audio_config: configure for dma multi fifo script
  */
 struct fsl_ssi {
 	struct regmap *regs;
@@ -255,6 +258,7 @@ struct fsl_ssi {
 	bool synchronous;
 	bool use_dma;
 	bool use_dual_fifo;
+	bool use_dyna_fifo;
 	bool has_ipg_clk_name;
 	unsigned int fifo_depth;
 	unsigned int slot_width;
@@ -287,6 +291,7 @@ struct fsl_ssi {
 	u32 dma_maxburst;
 
 	struct mutex ac97_reg_lock;
+	struct sdma_peripheral_config audio_config[2];
 };
 
 /*
@@ -643,7 +648,7 @@ static int fsl_ssi_startup(struct snd_pcm_substream *substream,
 	 * task from fifo0, fifo1 would be neglected at the end of each
 	 * period. But SSI would still access fifo1 with an invalid data.
 	 */
-	if (ssi->use_dual_fifo)
+	if (ssi->use_dual_fifo || ssi->use_dyna_fifo)
 		snd_pcm_hw_constraint_step(substream->runtime, 0,
 					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 2);
 
@@ -802,6 +807,7 @@ static int fsl_ssi_hw_params(struct snd_pcm_substream *substream,
 {
 	bool tx2, tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(dai);
+	struct fsl_ssi_regvals *vals = ssi->regvals;
 	struct regmap *regs = ssi->regs;
 	unsigned int channels = params_channels(hw_params);
 	unsigned int sample_size = params_width(hw_params);
@@ -856,6 +862,28 @@ static int fsl_ssi_hw_params(struct snd_pcm_substream *substream,
 	tx2 = tx || ssi->synchronous;
 	regmap_update_bits(regs, REG_SSI_SxCCR(tx2), SSI_SxCCR_WL_MASK, wl);
 
+	if (ssi->use_dyna_fifo) {
+		if (channels == 1) {
+			ssi->audio_config[0].n_fifos_dst = 1;
+			ssi->audio_config[1].n_fifos_src = 1;
+			vals[RX].srcr &= ~SSI_SRCR_RFEN1;
+			vals[TX].stcr &= ~SSI_STCR_TFEN1;
+			vals[RX].scr  &= ~SSI_SCR_TCH_EN;
+			vals[TX].scr  &= ~SSI_SCR_TCH_EN;
+		} else {
+			ssi->audio_config[0].n_fifos_dst = 2;
+			ssi->audio_config[1].n_fifos_src = 2;
+			vals[RX].srcr |= SSI_SRCR_RFEN1;
+			vals[TX].stcr |= SSI_STCR_TFEN1;
+			vals[RX].scr  |= SSI_SCR_TCH_EN;
+			vals[TX].scr  |= SSI_SCR_TCH_EN;
+		}
+		ssi->dma_params_tx.peripheral_config = &ssi->audio_config[0];
+		ssi->dma_params_tx.peripheral_size = sizeof(ssi->audio_config[0]);
+		ssi->dma_params_rx.peripheral_config = &ssi->audio_config[1];
+		ssi->dma_params_rx.peripheral_size = sizeof(ssi->audio_config[1]);
+	}
+
 	return 0;
 }
 
@@ -1353,7 +1381,7 @@ static int fsl_ssi_imx_probe(struct platform_device *pdev,
 	ssi->dma_params_rx.addr = ssi->ssi_phys + REG_SSI_SRX0;
 
 	/* Use even numbers to avoid channel swap due to SDMA script design */
-	if (ssi->use_dual_fifo) {
+	if (ssi->use_dual_fifo || ssi->use_dyna_fifo) {
 		ssi->dma_params_tx.maxburst &= ~0x1;
 		ssi->dma_params_rx.maxburst &= ~0x1;
 	}
@@ -1446,6 +1474,8 @@ static int fsl_ssi_probe_from_dt(struct fsl_ssi *ssi)
 	if (ssi->use_dma && !ret && dmas[2] == IMX_DMATYPE_SSI_DUAL)
 		ssi->use_dual_fifo = true;
 
+	if (ssi->use_dma && !ret && dmas[2] == IMX_DMATYPE_MULTI_SAI)
+		ssi->use_dyna_fifo = true;
 	/*
 	 * Backward compatible for older bindings by manually triggering the
 	 * machine driver's probe(). Use /compatible property, including the
-- 
2.17.1

