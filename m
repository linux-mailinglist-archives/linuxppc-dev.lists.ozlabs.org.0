Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E319252E308
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 05:19:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4BlY6SFCz3btG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 13:19:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4Bl76sKHz2xXS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 13:18:43 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 169FF201365;
 Fri, 20 May 2022 05:18:40 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D0E79201362;
 Fri, 20 May 2022 05:18:39 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id AB7CE180031F;
 Fri, 20 May 2022 11:18:38 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_asrc_dma: enable dual fifo for ASRC P2P
Date: Fri, 20 May 2022 11:06:00 +0800
Message-Id: <1653015960-15474-1-git-send-email-shengjiu.wang@nxp.com>
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

The SSI and SPDIF has dual fifos, enhance P2P for these
case with using the sdma_peripheral_config struct

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc_dma.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 5038faf035cb..aaf7993935b7 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -129,6 +129,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 				  struct snd_pcm_hw_params *params)
 {
 	enum dma_slave_buswidth buswidth = DMA_SLAVE_BUSWIDTH_2_BYTES;
+	enum sdma_peripheral_type be_peripheral_type = IMX_DMATYPE_SSI;
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	struct snd_dmaengine_dai_dma_data *dma_params_fe = NULL;
@@ -139,6 +140,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	struct snd_soc_component *component_be = NULL;
 	struct fsl_asrc *asrc = pair->asrc;
 	struct dma_slave_config config_fe, config_be;
+	struct sdma_peripheral_config audio_config;
 	enum asrc_pair_index index = pair->index;
 	struct device *dev = component->dev;
 	struct device_node *of_dma_node;
@@ -221,6 +223,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 		/* Get DMA request of Back-End */
 		tmp_data = tmp_chan->private;
 		pair->dma_data.dma_request = tmp_data->dma_request;
+		be_peripheral_type = tmp_data->peripheral_type;
 		if (!be_chan)
 			dma_release_channel(tmp_chan);
 
@@ -268,6 +271,17 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	config_be.dst_addr_width = buswidth;
 	config_be.dst_maxburst = dma_params_be->maxburst;
 
+	memset(&audio_config, 0, sizeof(audio_config));
+	config_be.peripheral_config = &audio_config;
+	config_be.peripheral_size  = sizeof(audio_config);
+
+	if (tx && (be_peripheral_type == IMX_DMATYPE_SSI_DUAL ||
+		   be_peripheral_type == IMX_DMATYPE_SPDIF))
+		audio_config.n_fifos_dst = 2;
+	if (!tx && (be_peripheral_type == IMX_DMATYPE_SSI_DUAL ||
+		    be_peripheral_type == IMX_DMATYPE_SPDIF))
+		audio_config.n_fifos_src = 2;
+
 	if (tx) {
 		config_be.src_addr = asrc->paddr + asrc->get_fifo_addr(OUT, index);
 		config_be.dst_addr = dma_params_be->addr;
-- 
2.17.1

