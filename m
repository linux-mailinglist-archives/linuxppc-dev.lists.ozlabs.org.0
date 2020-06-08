Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AF51F1375
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 09:20:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gPmQ44SwzDqQN
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 17:20:38 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gPjF0pV4zDqQB
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jun 2020 17:17:52 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F1EA3200D08;
 Mon,  8 Jun 2020 09:17:47 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E1738200D10;
 Mon,  8 Jun 2020 09:17:42 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 964B340299;
 Mon,  8 Jun 2020 15:17:36 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lars@metafoo.de, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] ASoC: fsl_asrc_dma: Fix warning "Cannot create DMA dma:tx
 symlink"
Date: Mon,  8 Jun 2020 15:07:00 +0800
Message-Id: <83e1682e88baf127d25e3470011bd034cfc32032.1591598561.git.shengjiu.wang@nxp.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The issue log is:

[   48.021506] CPU: 0 PID: 664 Comm: aplay Not tainted 5.7.0-rc1-13120-g12b434cbbea0 #343
[   48.031063] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[   48.037638] [<c0110dd8>] (unwind_backtrace) from [<c010b8ec>] (show_stack+0x10/0x14)
[   48.045413] [<c010b8ec>] (show_stack) from [<c0557fc0>] (dump_stack+0xe4/0x118)
[   48.052757] [<c0557fc0>] (dump_stack) from [<c032aeb4>] (sysfs_warn_dup+0x50/0x64)
[   48.060357] [<c032aeb4>] (sysfs_warn_dup) from [<c032b1a8>] (sysfs_do_create_link_sd+0xc8/0xd4)
[   48.069086] [<c032b1a8>] (sysfs_do_create_link_sd) from [<c05dc668>] (dma_request_chan+0xb0/0x210)
[   48.078068] [<c05dc668>] (dma_request_chan) from [<c05dc7d0>] (dma_request_slave_channel+0x8/0x14)
[   48.087060] [<c05dc7d0>] (dma_request_slave_channel) from [<c09d5cd4>] (fsl_asrc_dma_hw_params+0x1dc/0x434)
[   48.096831] [<c09d5cd4>] (fsl_asrc_dma_hw_params) from [<c09c143c>] (soc_pcm_hw_params+0x4b0/0x650)
[   48.105903] [<c09c143c>] (soc_pcm_hw_params) from [<c09c36a8>] (dpcm_fe_dai_hw_params+0x70/0xe4)
[   48.114715] [<c09c36a8>] (dpcm_fe_dai_hw_params) from [<c099b274>] (snd_pcm_hw_params+0x158/0x418)
[   48.123701] [<c099b274>] (snd_pcm_hw_params) from [<c099c5a0>] (snd_pcm_ioctl+0x734/0x183c)
[   48.132079] [<c099c5a0>] (snd_pcm_ioctl) from [<c029ff94>] (ksys_ioctl+0x2ac/0xb98)
[   48.139765] [<c029ff94>] (ksys_ioctl) from [<c0100080>] (ret_fast_syscall+0x0/0x28)
[   48.147440] Exception stack(0xed3c5fa8 to 0xed3c5ff0)
[   48.152515] 5fa0:                   bec28670 00e92870 00000004 c25c4111 bec28670 0002000f
[   48.160716] 5fc0: bec28670 00e92870 00e92820 00000036 0000bb80 00000000 0002c2f8 00000003
[   48.168913] 5fe0: b6f4d3fc bec2853c b6ee7655 b6e22cf8
[   48.174236] fsl-esai-dai 2024000.esai: Cannot create DMA dma:tx symlink

The dma channel is already requested by Back-End cpu dai driver,
if fsl_asrc_dma requests dma chan with same dma:tx symlink, then
this warning comes out.

The warning is added by
commit 71723a96b8b1 ("dmaengine: Create symlinks between DMA channels and slaves")
commit bad83565eafe ("dmaengine: Cleanups for the slave <-> channel symlink support")

As the dma channel is requested by Back-End, we need to reuse the channel
and avoid to request a new one, then the issue can be fixed.

In order to get the dma channel which is already requested in Back-End.
we export two functions (snd_soc_lookup_component_nolocked and
soc_component_to_pcm), if we can get the dma channel, then reuse it.
if can't, then request a new one.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 include/sound/dmaengine_pcm.h         | 11 ++++++
 include/sound/soc.h                   |  2 ++
 sound/soc/fsl/fsl_asrc_common.h       |  2 ++
 sound/soc/fsl/fsl_asrc_dma.c          | 49 +++++++++++++++++++++------
 sound/soc/soc-core.c                  |  3 +-
 sound/soc/soc-generic-dmaengine-pcm.c | 12 -------
 6 files changed, 55 insertions(+), 24 deletions(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index b65220685920..8c5e38180fb0 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -161,4 +161,15 @@ int snd_dmaengine_pcm_prepare_slave_config(struct snd_pcm_substream *substream,
 
 #define SND_DMAENGINE_PCM_DRV_NAME "snd_dmaengine_pcm"
 
+struct dmaengine_pcm {
+	struct dma_chan *chan[SNDRV_PCM_STREAM_LAST + 1];
+	const struct snd_dmaengine_pcm_config *config;
+	struct snd_soc_component component;
+	unsigned int flags;
+};
+
+static inline struct dmaengine_pcm *soc_component_to_pcm(struct snd_soc_component *p)
+{
+	return container_of(p, struct dmaengine_pcm, component);
+}
 #endif
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 74868436ac79..565612a8d690 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -444,6 +444,8 @@ int devm_snd_soc_register_component(struct device *dev,
 			 const struct snd_soc_component_driver *component_driver,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai);
 void snd_soc_unregister_component(struct device *dev);
+struct snd_soc_component *snd_soc_lookup_component_nolocked(struct device *dev,
+							    const char *driver_name);
 struct snd_soc_component *snd_soc_lookup_component(struct device *dev,
 						   const char *driver_name);
 
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
index d6a3fc5f87e5..3ad862225326 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -135,6 +135,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	struct snd_dmaengine_dai_dma_data *dma_params_be = NULL;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
+	struct snd_soc_component *component_be = NULL;
 	struct fsl_asrc *asrc = pair->asrc;
 	struct dma_slave_config config_fe, config_be;
 	enum asrc_pair_index index = pair->index;
@@ -142,7 +143,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	int stream = substream->stream;
 	struct imx_dma_data *tmp_data;
 	struct snd_soc_dpcm *dpcm;
-	struct dma_chan *tmp_chan;
+	struct dma_chan *tmp_chan = NULL, *tmp_chan_new = NULL;
 	struct device *dev_be;
 	u8 dir = tx ? OUT : IN;
 	dma_cap_mask_t mask;
@@ -160,6 +161,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 		substream_be = snd_soc_dpcm_get_substream(be, stream);
 		dma_params_be = snd_soc_dai_get_dma_data(dai, substream_be);
 		dev_be = dai->dev;
+		component_be = snd_soc_lookup_component_nolocked(dev_be, SND_DMAENGINE_PCM_DRV_NAME);
 		break;
 	}
 
@@ -205,10 +207,16 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	 */
 	if (!asrc->use_edma) {
 		/* Get DMA request of Back-End */
-		tmp_chan = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
+		if (component_be)
+			tmp_chan = soc_component_to_pcm(component_be)->chan[substream->stream];
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
+		/* With EDMA, there is two dma channels can be used for p2p,
+		 * one is from ASRC, one is from another peripheral
+		 * (ESAI or SAI) previously we select the dma channel of ASRC,
+		 * but find an issue for ideal ratio case, there is no control
+		 * for data copy speed, the speed is faster than sample
+		 * frequency.
+		 *
+		 * So we switch to dma channel of peripheral (ESAI or SAI),
+		 * that copy speed of DMA is controlled by data consumption
+		 * speed in the peripheral FIFO.
+		 */
+		pair->req_dma_chan_dev_to_dev = false;
+		if (component_be)
+			pair->dma_chan[dir] = soc_component_to_pcm(component_be)->chan[substream->stream];;
+		if (!pair->dma_chan[dir]) {
+			pair->dma_chan[dir] = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
+			pair->req_dma_chan_dev_to_dev = true;
+		}
 	}
 
 	if (!pair->dma_chan[dir]) {
@@ -273,19 +298,21 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
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
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b07eca2c6ccc..d4c73e86d058 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -310,7 +310,7 @@ struct snd_soc_component *snd_soc_rtdcom_lookup(struct snd_soc_pcm_runtime *rtd,
 }
 EXPORT_SYMBOL_GPL(snd_soc_rtdcom_lookup);
 
-static struct snd_soc_component
+struct snd_soc_component
 *snd_soc_lookup_component_nolocked(struct device *dev, const char *driver_name)
 {
 	struct snd_soc_component *component;
@@ -329,6 +329,7 @@ static struct snd_soc_component
 
 	return found_component;
 }
+EXPORT_SYMBOL_GPL(snd_soc_lookup_component_nolocked);
 
 struct snd_soc_component *snd_soc_lookup_component(struct device *dev,
 						   const char *driver_name)
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index f728309a0833..80a4e71f2d95 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -21,18 +21,6 @@
  */
 #define SND_DMAENGINE_PCM_FLAG_NO_RESIDUE BIT(31)
 
-struct dmaengine_pcm {
-	struct dma_chan *chan[SNDRV_PCM_STREAM_LAST + 1];
-	const struct snd_dmaengine_pcm_config *config;
-	struct snd_soc_component component;
-	unsigned int flags;
-};
-
-static struct dmaengine_pcm *soc_component_to_pcm(struct snd_soc_component *p)
-{
-	return container_of(p, struct dmaengine_pcm, component);
-}
-
 static struct device *dmaengine_dma_dev(struct dmaengine_pcm *pcm,
 	struct snd_pcm_substream *substream)
 {
-- 
2.21.0

