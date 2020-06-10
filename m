Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA33D1F5340
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 13:31:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hlDZ6d9GzDqlw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 21:31:10 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hjZn4QntzDqcJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 20:16:49 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 781731A0463;
 Wed, 10 Jun 2020 12:16:44 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 685061A0474;
 Wed, 10 Jun 2020 12:16:39 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 743564031B;
 Wed, 10 Jun 2020 18:16:33 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lars@metafoo.de, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v2 3/3] ASoC: fsl_asrc_dma: Reuse the dma channel if
 available in Back-End
Date: Wed, 10 Jun 2020 18:05:49 +0800
Message-Id: <0473d4191ae04ab711d63c5c875e47f45f598137.1591783089.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1591783089.git.shengjiu.wang@nxp.com>
References: <cover.1591783089.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1591783089.git.shengjiu.wang@nxp.com>
References: <cover.1591783089.git.shengjiu.wang@nxp.com>
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

The dma channel has been requested by Back-End cpu dai driver already.
If fsl_asrc_dma requests dma chan with same dma:tx symlink, then
there will be below warning with SDMA.

[   48.174236] fsl-esai-dai 2024000.esai: Cannot create DMA dma:tx symlink

or with EDMA the request operation will fail for EDMA channel
can only be requested once.

So If we can reuse the dma channel of Back-End, then the issue can be
fixed.

In order to get the dma channel which is already requested in Back-End.
we use the exported two functions (snd_soc_lookup_component_nolocked
and soc_component_to_pcm). If we can get the dma channel, then reuse it,
if can't, then request a new one.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc_common.h |  2 ++
 sound/soc/fsl/fsl_asrc_dma.c    | 52 +++++++++++++++++++++++++--------
 2 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
index 77665b15c8db..09512bc79b80 100644
--- a/sound/soc/fsl/fsl_asrc_common.h
+++ b/sound/soc/fsl/fsl_asrc_common.h
@@ -32,6 +32,7 @@ enum asrc_pair_index {
  * @dma_chan: inputer and output DMA channels
  * @dma_data: private dma data
  * @pos: hardware pointer position
+ * @req_dma_chan_dev_to_dev: flag for release dev_to_dev chan
  * @private: pair private area
  */
 struct fsl_asrc_pair {
@@ -45,6 +46,7 @@ struct fsl_asrc_pair {
 	struct dma_chan *dma_chan[2];
 	struct imx_dma_data dma_data;
 	unsigned int pos;
+	bool req_dma_chan_dev_to_dev;
 
 	void *private;
 };
diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index d6a3fc5f87e5..5ecb77d466d3 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -133,6 +133,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	struct snd_dmaengine_dai_dma_data *dma_params_fe = NULL;
 	struct snd_dmaengine_dai_dma_data *dma_params_be = NULL;
+	struct dma_chan *tmp_chan = NULL, *tmp_chan_new = NULL;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
 	struct fsl_asrc *asrc = pair->asrc;
@@ -142,7 +143,6 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	int stream = substream->stream;
 	struct imx_dma_data *tmp_data;
 	struct snd_soc_dpcm *dpcm;
-	struct dma_chan *tmp_chan;
 	struct device *dev_be;
 	u8 dir = tx ? OUT : IN;
 	dma_cap_mask_t mask;
@@ -152,6 +152,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	for_each_dpcm_be(rtd, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 		struct snd_pcm_substream *substream_be;
+		struct snd_soc_component *component_be;
 		struct snd_soc_dai *dai = asoc_rtd_to_cpu(be, 0);
 
 		if (dpcm->fe != rtd)
@@ -160,6 +161,9 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 		substream_be = snd_soc_dpcm_get_substream(be, stream);
 		dma_params_be = snd_soc_dai_get_dma_data(dai, substream_be);
 		dev_be = dai->dev;
+		component_be = snd_soc_lookup_component_nolocked(dev_be, SND_DMAENGINE_PCM_DRV_NAME);
+		if (component_be)
+			tmp_chan = soc_component_to_pcm(component_be)->chan[substream->stream];
 		break;
 	}
 
@@ -205,10 +209,14 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	 */
 	if (!asrc->use_edma) {
 		/* Get DMA request of Back-End */
-		tmp_chan = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
+		if (!tmp_chan) {
+			tmp_chan_new = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
+			tmp_chan = tmp_chan_new;
+		}
 		tmp_data = tmp_chan->private;
 		pair->dma_data.dma_request = tmp_data->dma_request;
-		dma_release_channel(tmp_chan);
+		if (tmp_chan_new)
+			dma_release_channel(tmp_chan_new);
 
 		/* Get DMA request of Front-End */
 		tmp_chan = asrc->get_dma_channel(pair, dir);
@@ -220,9 +228,26 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 
 		pair->dma_chan[dir] =
 			dma_request_channel(mask, filter, &pair->dma_data);
+		pair->req_dma_chan_dev_to_dev = true;
 	} else {
-		pair->dma_chan[dir] =
-			asrc->get_dma_channel(pair, dir);
+		/*
+		 * With EDMA, there is two dma channels can be used for p2p,
+		 * one is from ASRC, one is from another peripheral
+		 * (ESAI or SAI). Previously we select the dma channel of ASRC,
+		 * but find an issue for ideal ratio case, there is no control
+		 * for data copy speed, the speed is faster than sample
+		 * frequency.
+		 *
+		 * So we switch to use dma channel of peripheral (ESAI or SAI),
+		 * that copy speed of DMA is controlled by data consumption
+		 * speed in the peripheral FIFO.
+		 */
+		pair->req_dma_chan_dev_to_dev = false;
+		pair->dma_chan[dir] = tmp_chan;
+		if (!pair->dma_chan[dir]) {
+			pair->dma_chan[dir] = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
+			pair->req_dma_chan_dev_to_dev = true;
+		}
 	}
 
 	if (!pair->dma_chan[dir]) {
@@ -261,7 +286,8 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	ret = dmaengine_slave_config(pair->dma_chan[dir], &config_be);
 	if (ret) {
 		dev_err(dev, "failed to config DMA channel for Back-End\n");
-		dma_release_channel(pair->dma_chan[dir]);
+		if (pair->req_dma_chan_dev_to_dev)
+			dma_release_channel(pair->dma_chan[dir]);
 		return ret;
 	}
 
@@ -273,19 +299,21 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 static int fsl_asrc_dma_hw_free(struct snd_soc_component *component,
 				struct snd_pcm_substream *substream)
 {
+	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
+	u8 dir = tx ? OUT : IN;
 
 	snd_pcm_set_runtime_buffer(substream, NULL);
 
-	if (pair->dma_chan[IN])
-		dma_release_channel(pair->dma_chan[IN]);
+	if (pair->dma_chan[!dir])
+		dma_release_channel(pair->dma_chan[!dir]);
 
-	if (pair->dma_chan[OUT])
-		dma_release_channel(pair->dma_chan[OUT]);
+	if (pair->dma_chan[dir] && pair->req_dma_chan_dev_to_dev)
+		dma_release_channel(pair->dma_chan[dir]);
 
-	pair->dma_chan[IN] = NULL;
-	pair->dma_chan[OUT] = NULL;
+	pair->dma_chan[!dir] = NULL;
+	pair->dma_chan[dir] = NULL;
 
 	return 0;
 }
-- 
2.21.0

