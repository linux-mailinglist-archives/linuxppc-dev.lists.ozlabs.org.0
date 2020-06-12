Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF111F74F2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 10:00:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jtSG4hvgzDqP1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 18:00:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jtCD0SSNzDqx6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 17:48:56 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6C38B1A0B70;
 Fri, 12 Jun 2020 09:48:53 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 533FC1A0420;
 Fri, 12 Jun 2020 09:48:48 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id D929E40307;
 Fri, 12 Jun 2020 15:48:40 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lars@metafoo.de, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v3 4/4] ASoC: fsl_asrc_dma: Fix data copying speed issue
 with EDMA
Date: Fri, 12 Jun 2020 15:37:51 +0800
Message-Id: <424ed6c249bafcbe30791c9de0352821c5ea67e2.1591947428.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1591947428.git.shengjiu.wang@nxp.com>
References: <cover.1591947428.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1591947428.git.shengjiu.wang@nxp.com>
References: <cover.1591947428.git.shengjiu.wang@nxp.com>
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

With EDMA, there is two dma channels can be used for dev_to_dev,
one is from ASRC, one is from another peripheral (ESAI or SAI).

If we select the dma channel of ASRC, there is an issue for ideal
ratio case, the speed of copy data is faster than sample
frequency, because ASRC output data is very fast in ideal ratio
mode.

So it is reasonable to use the dma channel of Back-End peripheral.
then copying speed of DMA is controlled by data consumption
speed in the peripheral FIFO,

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc_common.h |  2 ++
 sound/soc/fsl/fsl_asrc_dma.c    | 26 +++++++++++++++-----------
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
index 77665b15c8db..7e1c13ca37f1 100644
--- a/sound/soc/fsl/fsl_asrc_common.h
+++ b/sound/soc/fsl/fsl_asrc_common.h
@@ -32,6 +32,7 @@ enum asrc_pair_index {
  * @dma_chan: inputer and output DMA channels
  * @dma_data: private dma data
  * @pos: hardware pointer position
+ * @req_dma_chan: flag to release dev_to_dev chan
  * @private: pair private area
  */
 struct fsl_asrc_pair {
@@ -45,6 +46,7 @@ struct fsl_asrc_pair {
 	struct dma_chan *dma_chan[2];
 	struct imx_dma_data dma_data;
 	unsigned int pos;
+	bool req_dma_chan;
 
 	void *private;
 };
diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index d88e6343e0a2..5f01a58f422a 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -233,11 +233,11 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 
 		pair->dma_chan[dir] =
 			dma_request_channel(mask, filter, &pair->dma_data);
+		pair->req_dma_chan = true;
 	} else {
-		if (!be_chan)
-			dma_release_channel(tmp_chan);
-		pair->dma_chan[dir] =
-			asrc->get_dma_channel(pair, dir);
+		pair->dma_chan[dir] = tmp_chan;
+		/* Do not flag to release if we are reusing the Back-End one */
+		pair->req_dma_chan = !be_chan;
 	}
 
 	if (!pair->dma_chan[dir]) {
@@ -276,7 +276,8 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	ret = dmaengine_slave_config(pair->dma_chan[dir], &config_be);
 	if (ret) {
 		dev_err(dev, "failed to config DMA channel for Back-End\n");
-		dma_release_channel(pair->dma_chan[dir]);
+		if (pair->req_dma_chan)
+			dma_release_channel(pair->dma_chan[dir]);
 		return ret;
 	}
 
@@ -288,19 +289,22 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
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
+	/* release dev_to_dev chan if we aren't reusing the Back-End one */
+	if (pair->dma_chan[dir] && pair->req_dma_chan)
+		dma_release_channel(pair->dma_chan[dir]);
 
-	pair->dma_chan[IN] = NULL;
-	pair->dma_chan[OUT] = NULL;
+	pair->dma_chan[!dir] = NULL;
+	pair->dma_chan[dir] = NULL;
 
 	return 0;
 }
-- 
2.21.0

