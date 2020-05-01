Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3131C0F76
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 10:28:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49D53f23fWzDqp5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 18:27:58 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49D4vq5kC8zDr6y
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 18:21:09 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A67F5200B30;
 Fri,  1 May 2020 10:21:06 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6C932200B47;
 Fri,  1 May 2020 10:21:01 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id B2D69402DE;
 Fri,  1 May 2020 16:20:54 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH 2/3] ASoC: fsl_esai: Add support for imx8qm
Date: Fri,  1 May 2020 16:12:05 +0800
Message-Id: <a933bafd2d6a60a69f840d9d4b613337efcf2816.1588320656.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1588320655.git.shengjiu.wang@nxp.com>
References: <cover.1588320655.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1588320655.git.shengjiu.wang@nxp.com>
References: <cover.1588320655.git.shengjiu.wang@nxp.com>
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

The difference for esai on imx8qm is that DMA device is EDMA.

EDMA requires the period size to be multiple of maxburst. Otherwise
the remaining bytes are not transferred and thus noise is produced.

We can handle this issue by adding a constraint on
SNDRV_PCM_HW_PARAM_PERIOD_SIZE to be multiple of tx/rx maxburst value.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_esai.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index bac65ba7fbad..61b5c0bde788 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -26,10 +26,12 @@
  *
  * @imx: for imx platform
  * @reset_at_xrun: flags for enable reset operaton
+ * @use_edma: edma is used.
  */
 struct fsl_esai_soc_data {
 	bool imx;
 	bool reset_at_xrun;
+	bool use_edma;
 };
 
 /**
@@ -88,16 +90,25 @@ struct fsl_esai {
 static struct fsl_esai_soc_data fsl_esai_vf610 = {
 	.imx = false,
 	.reset_at_xrun = true,
+	.use_edma = false,
 };
 
 static struct fsl_esai_soc_data fsl_esai_imx35 = {
 	.imx = true,
 	.reset_at_xrun = true,
+	.use_edma = false,
 };
 
 static struct fsl_esai_soc_data fsl_esai_imx6ull = {
 	.imx = true,
 	.reset_at_xrun = false,
+	.use_edma = false,
+};
+
+static struct fsl_esai_soc_data fsl_esai_imx8qm = {
+	.imx = true,
+	.reset_at_xrun = false,
+	.use_edma = true,
 };
 
 static irqreturn_t esai_isr(int irq, void *devid)
@@ -513,6 +524,7 @@ static int fsl_esai_startup(struct snd_pcm_substream *substream,
 			    struct snd_soc_dai *dai)
 {
 	struct fsl_esai *esai_priv = snd_soc_dai_get_drvdata(dai);
+	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 
 	if (!dai->active) {
 		/* Set synchronous mode */
@@ -527,6 +539,12 @@ static int fsl_esai_startup(struct snd_pcm_substream *substream,
 				   ESAI_xCCR_xDC_MASK, ESAI_xCCR_xDC(2));
 	}
 
+	if (esai_priv->soc->use_edma)
+		snd_pcm_hw_constraint_step(substream->runtime, 0,
+					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+					   tx ? esai_priv->dma_params_tx.maxburst :
+					   esai_priv->dma_params_rx.maxburst);
+
 	return 0;
 
 }
@@ -1094,6 +1112,7 @@ static const struct of_device_id fsl_esai_dt_ids[] = {
 	{ .compatible = "fsl,imx35-esai", .data = &fsl_esai_imx35 },
 	{ .compatible = "fsl,vf610-esai", .data = &fsl_esai_vf610 },
 	{ .compatible = "fsl,imx6ull-esai", .data = &fsl_esai_imx6ull },
+	{ .compatible = "fsl,imx8qm-esai", .data = &fsl_esai_imx8qm },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_esai_dt_ids);
-- 
2.21.0

