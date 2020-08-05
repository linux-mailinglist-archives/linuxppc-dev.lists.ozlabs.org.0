Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C18C623C385
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 04:34:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLwgQ4WcDzDqb5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 12:34:26 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLwXm0j73zDqZS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 12:28:39 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 257AD20138C;
 Wed,  5 Aug 2020 04:28:37 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4741320019A;
 Wed,  5 Aug 2020 04:28:32 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 5AF1640302;
 Wed,  5 Aug 2020 04:28:26 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: fsl_sai: Refine enable and disable sequence for
 synchronous mode
Date: Wed,  5 Aug 2020 10:23:53 +0800
Message-Id: <1596594233-13489-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596594233-13489-1-git-send-email-shengjiu.wang@nxp.com>
References: <1596594233-13489-1-git-send-email-shengjiu.wang@nxp.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tx synchronous with Rx:
The TCSR.TE is no need to enabled when only Rx is going to be enabled.
Check if need to disable RSCR.RE before disabling TCSR.TE.

Rx synchronous with Tx:
The RCSR.RE is no need to enabled when only Tx is going to be enabled.
Check if need to disable TSCR.RE before disabling RCSR.TE.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 126 +++++++++++++++++++++++++++-------------
 1 file changed, 85 insertions(+), 41 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 84714fe7144c..f30c4e7b5221 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -517,6 +517,56 @@ static int fsl_sai_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+/**
+ * fsl_sai_dir_is_synced - Check if stream is synced by the opposite stream
+ *
+ * SAI supports synchronous mode using bit/frame clocks of either Transmitter's
+ * or Receiver's for both streams. This function is used to check if clocks of
+ * the stream's are synced by the opposite stream.
+ *
+ * @sai: SAI context
+ * @dir: stream direction
+ */
+static inline bool fsl_sai_dir_is_synced(struct fsl_sai *sai, int dir)
+{
+	int adir = (dir == TX) ? RX : TX;
+
+	/* current dir in async mode while opposite dir in sync mode */
+	return !sai->synchronous[dir] && sai->synchronous[adir];
+}
+
+static void fsl_sai_config_disable(struct fsl_sai *sai, int dir)
+{
+	unsigned int ofs = sai->soc_data->reg_offset;
+	bool tx = dir == TX;
+	u32 xcsr, count = 100;
+
+	regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
+			   FSL_SAI_CSR_TERE, 0);
+
+	/* TERE will remain set till the end of current frame */
+	do {
+		udelay(10);
+		regmap_read(sai->regmap, FSL_SAI_xCSR(tx, ofs), &xcsr);
+	} while (--count && xcsr & FSL_SAI_CSR_TERE);
+
+	regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
+			   FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
+
+	/*
+	 * For sai master mode, after several open/close sai,
+	 * there will be no frame clock, and can't recover
+	 * anymore. Add software reset to fix this issue.
+	 * This is a hardware bug, and will be fix in the
+	 * next sai version.
+	 */
+	if (!sai->is_slave_mode) {
+		/* Software Reset */
+		regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_SR);
+		/* Clear SR bit to finish the reset */
+		regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
+	}
+}
 
 static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 		struct snd_soc_dai *cpu_dai)
@@ -525,7 +575,9 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 	unsigned int ofs = sai->soc_data->reg_offset;
 
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-	u32 xcsr, count = 100;
+	int adir = tx ? RX : TX;
+	int dir = tx ? TX : RX;
+	u32 xcsr;
 
 	/*
 	 * Asynchronous mode: Clear SYNC for both Tx and Rx.
@@ -548,10 +600,22 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
 				   FSL_SAI_CSR_FRDE, FSL_SAI_CSR_FRDE);
 
-		regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs),
-				   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
-		regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
+		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
 				   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
+		/*
+		 * Enable the opposite direction for synchronous mode
+		 * 1. Tx sync with Rx: only set RE for Rx; set TE & RE for Tx
+		 * 2. Rx sync with Tx: only set TE for Tx; set RE & TE for Rx
+		 *
+		 * RM recommends to enable RE after TE for case 1 and to enable
+		 * TE after RE for case 2, but we here may not always guarantee
+		 * that happens: "arecord 1.wav; aplay 2.wav" in case 1 enables
+		 * TE after RE, which is against what RM recommends but should
+		 * be safe to do, judging by years of testing results.
+		 */
+		if (fsl_sai_dir_is_synced(sai, adir))
+			regmap_update_bits(sai->regmap, FSL_SAI_xCSR((!tx), ofs),
+					   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
 
 		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
 				   FSL_SAI_CSR_xIE_MASK, FSL_SAI_FLAGS);
@@ -566,43 +630,23 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 
 		/* Check if the opposite FRDE is also disabled */
 		regmap_read(sai->regmap, FSL_SAI_xCSR(!tx, ofs), &xcsr);
-		if (!(xcsr & FSL_SAI_CSR_FRDE)) {
-			/* Disable both directions and reset their FIFOs */
-			regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
-					   FSL_SAI_CSR_TERE, 0);
-			regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs),
-					   FSL_SAI_CSR_TERE, 0);
-
-			/* TERE will remain set till the end of current frame */
-			do {
-				udelay(10);
-				regmap_read(sai->regmap,
-					    FSL_SAI_xCSR(tx, ofs), &xcsr);
-			} while (--count && xcsr & FSL_SAI_CSR_TERE);
-
-			regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
-					   FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
-			regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs),
-					   FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
-
-			/*
-			 * For sai master mode, after several open/close sai,
-			 * there will be no frame clock, and can't recover
-			 * anymore. Add software reset to fix this issue.
-			 * This is a hardware bug, and will be fix in the
-			 * next sai version.
-			 */
-			if (!sai->is_slave_mode) {
-				/* Software Reset for both Tx and Rx */
-				regmap_write(sai->regmap, FSL_SAI_TCSR(ofs),
-					     FSL_SAI_CSR_SR);
-				regmap_write(sai->regmap, FSL_SAI_RCSR(ofs),
-					     FSL_SAI_CSR_SR);
-				/* Clear SR bit to finish the reset */
-				regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), 0);
-				regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), 0);
-			}
-		}
+
+		/*
+		 * If opposite stream provides clocks for synchronous mode and
+		 * it is inactive, disable it before disabling the current one
+		 */
+		if (fsl_sai_dir_is_synced(sai, adir) && !(xcsr & FSL_SAI_CSR_FRDE))
+			fsl_sai_config_disable(sai, adir);
+
+		/*
+		 * Disable current stream if either of:
+		 * 1. current stream doesn't provide clocks for synchronous mode
+		 * 2. current stream provides clocks for synchronous mode but no
+		 *    more stream is active.
+		 */
+		if (!fsl_sai_dir_is_synced(sai, dir) || !(xcsr & FSL_SAI_CSR_FRDE))
+			fsl_sai_config_disable(sai, dir);
+
 		break;
 	default:
 		return -EINVAL;
-- 
2.27.0

