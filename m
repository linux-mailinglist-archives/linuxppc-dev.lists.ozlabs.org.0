Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89554BFCF9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 03:58:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fZhn5PGdzDr0t
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 11:58:49 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fZSV5bQVzDqxZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 11:48:10 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 964E620060B;
 Fri, 27 Sep 2019 03:48:07 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E8E902005DF;
 Fri, 27 Sep 2019 03:48:00 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id BA3E04029A;
 Fri, 27 Sep 2019 09:47:52 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org,
 lars@metafoo.de
Subject: [PATCH V6 4/4] ASoC: fsl_asrc: Fix error with S24_3LE format
 bitstream in i.MX8
Date: Fri, 27 Sep 2019 09:46:12 +0800
Message-Id: <b6a4de2bbf960ef291ee902afe4388bd0fc1d347.1569493933.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569493933.git.shengjiu.wang@nxp.com>
References: <cover.1569493933.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1569493933.git.shengjiu.wang@nxp.com>
References: <cover.1569493933.git.shengjiu.wang@nxp.com>
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

There is error "aplay: pcm_write:2023: write error: Input/output error"
on i.MX8QM/i.MX8QXP platform for S24_3LE format.

In i.MX8QM/i.MX8QXP, the DMA is EDMA, which don't support 24bit
sample, but we didn't add any constraint, that cause issues.

So we need to query the caps of dma, then update the hw parameters
according to the caps.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c     |  4 +--
 sound/soc/fsl/fsl_asrc.h     |  3 ++
 sound/soc/fsl/fsl_asrc_dma.c | 64 ++++++++++++++++++++++++++++++++----
 3 files changed, 62 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 584badf956d2..0bf91a6f54b9 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -115,7 +115,7 @@ static void fsl_asrc_sel_proc(int inrate, int outrate,
  * within range [ANCA, ANCA+ANCB-1], depends on the channels of pair A
  * while pair A and pair C are comparatively independent.
  */
-static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
+int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
 {
 	enum asrc_pair_index index = ASRC_INVALID_PAIR;
 	struct fsl_asrc *asrc_priv = pair->asrc_priv;
@@ -158,7 +158,7 @@ static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
  *
  * It clears the resource from asrc_priv and releases the occupied channels.
  */
-static void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
+void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
 {
 	struct fsl_asrc *asrc_priv = pair->asrc_priv;
 	enum asrc_pair_index index = pair->index;
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 38af485bdd22..2b57e8c53728 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -462,4 +462,7 @@ struct fsl_asrc {
 #define DRV_NAME "fsl-asrc-dai"
 extern struct snd_soc_component_driver fsl_asrc_component;
 struct dma_chan *fsl_asrc_get_dma_channel(struct fsl_asrc_pair *pair, bool dir);
+int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair);
+void fsl_asrc_release_pair(struct fsl_asrc_pair *pair);
+
 #endif /* _FSL_ASRC_H */
diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 01052a0808b0..2a60fc6142b1 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -16,13 +16,11 @@
 
 #define FSL_ASRC_DMABUF_SIZE	(256 * 1024)
 
-static const struct snd_pcm_hardware snd_imx_hardware = {
+static struct snd_pcm_hardware snd_imx_hardware = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		SNDRV_PCM_INFO_MMAP |
-		SNDRV_PCM_INFO_MMAP_VALID |
-		SNDRV_PCM_INFO_PAUSE |
-		SNDRV_PCM_INFO_RESUME,
+		SNDRV_PCM_INFO_MMAP_VALID,
 	.buffer_bytes_max = FSL_ASRC_DMABUF_SIZE,
 	.period_bytes_min = 128,
 	.period_bytes_max = 65535, /* Limited by SDMA engine */
@@ -270,12 +268,25 @@ static int fsl_asrc_dma_hw_free(struct snd_pcm_substream *substream)
 
 static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
 {
+	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
+	struct snd_dmaengine_dai_dma_data *dma_data;
 	struct device *dev = component->dev;
 	struct fsl_asrc *asrc_priv = dev_get_drvdata(dev);
 	struct fsl_asrc_pair *pair;
+	struct dma_chan *tmp_chan = NULL;
+	u8 dir = tx ? OUT : IN;
+	bool release_pair = true;
+	int ret = 0;
+
+	ret = snd_pcm_hw_constraint_integer(substream->runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0) {
+		dev_err(dev, "failed to set pcm hw params periods\n");
+		return ret;
+	}
 
 	pair = kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL);
 	if (!pair)
@@ -285,11 +296,50 @@ static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
 
 	runtime->private_data = pair;
 
-	snd_pcm_hw_constraint_integer(substream->runtime,
-				      SNDRV_PCM_HW_PARAM_PERIODS);
+	/* Request a dummy pair, which will be released later.
+	 * Request pair function needs channel num as input, for this
+	 * dummy pair, we just request "1" channel temporarily.
+	 */
+	ret = fsl_asrc_request_pair(1, pair);
+	if (ret < 0) {
+		dev_err(dev, "failed to request asrc pair\n");
+		goto req_pair_err;
+	}
+
+	/* Request a dummy dma channel, which will be released later. */
+	tmp_chan = fsl_asrc_get_dma_channel(pair, dir);
+	if (!tmp_chan) {
+		dev_err(dev, "failed to get dma channel\n");
+		ret = -EINVAL;
+		goto dma_chan_err;
+	}
+
+	dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+
+	/* Refine the snd_imx_hardware according to caps of DMA. */
+	ret = snd_dmaengine_pcm_refine_runtime_hwparams(substream,
+							dma_data,
+							&snd_imx_hardware,
+							tmp_chan);
+	if (ret < 0) {
+		dev_err(dev, "failed to refine runtime hwparams\n");
+		goto out;
+	}
+
+	release_pair = false;
 	snd_soc_set_runtime_hwparams(substream, &snd_imx_hardware);
 
-	return 0;
+out:
+	dma_release_channel(tmp_chan);
+
+dma_chan_err:
+	fsl_asrc_release_pair(pair);
+
+req_pair_err:
+	if (release_pair)
+		kfree(pair);
+
+	return ret;
 }
 
 static int fsl_asrc_dma_shutdown(struct snd_pcm_substream *substream)
-- 
2.21.0

