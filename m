Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5AE741E33
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 04:21:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qs2Hx0bdfz3cXp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 12:21:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qs2FH4Cy1z307V
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 12:18:58 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 33884200D39;
	Thu, 29 Jun 2023 04:10:35 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C6925200D36;
	Thu, 29 Jun 2023 04:10:34 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 0E481181D0E5;
	Thu, 29 Jun 2023 10:10:32 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/6] ASoC: fsl_asrc: define functions for memory to memory usage
Date: Thu, 29 Jun 2023 09:37:49 +0800
Message-Id: <1688002673-28493-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ASRC can be used on memory to memory case, define several
functions for m2m usage.

m2m_start_part_one: first part of the start steps
m2m_start_part_two: second part of the start steps
m2m_stop_part_one: first part of stop steps
m2m_stop_part_two: second part of stop steps
m2m_check_format: check format is supported or not
m2m_calc_out_len: calculate output length according to input length
m2m_get_maxburst: burst size for dma
m2m_pair_suspend: suspend function of pair
m2m_pair_resume: resume function of pair
get_output_fifo_size: get remaining data size in FIFO

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c        | 138 ++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_asrc.h        |   2 +
 sound/soc/fsl/fsl_asrc_common.h |  54 +++++++++++++
 3 files changed, 194 insertions(+)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index adb8a59de2bd..30190ccb74e7 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1063,6 +1063,135 @@ static int fsl_asrc_get_fifo_addr(u8 dir, enum asrc_pair_index index)
 	return REG_ASRDx(dir, index);
 }
 
+/* Get sample numbers in FIFO */
+static unsigned int fsl_asrc_get_output_fifo_size(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	enum asrc_pair_index index = pair->index;
+	u32 val;
+
+	regmap_read(asrc->regmap, REG_ASRFST(index), &val);
+
+	val &= ASRFSTi_OUTPUT_FIFO_MASK;
+
+	return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
+}
+
+static int fsl_asrc_m2m_start_part_one(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc_pair_priv *pair_priv = pair->private;
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &asrc->pdev->dev;
+	struct asrc_config config;
+	int ret;
+
+	/* fill config */
+	config.pair = pair->index;
+	config.channel_num = pair->channels;
+	config.input_sample_rate = pair->rate[IN];
+	config.output_sample_rate = pair->rate[OUT];
+	config.input_format = pair->sample_format[IN];
+	config.output_format = pair->sample_format[OUT];
+	config.inclk = INCLK_NONE;
+	config.outclk = OUTCLK_ASRCK1_CLK;
+
+	pair_priv->config = &config;
+	ret = fsl_asrc_config_pair(pair, true);
+	if (ret) {
+		dev_err(dev, "failed to config pair: %d\n", ret);
+		return ret;
+	}
+
+	fsl_asrc_start_pair(pair);
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_start_part_two(struct fsl_asrc_pair *pair)
+{
+	/*
+	 * Clear DMA request during the stall state of ASRC:
+	 * During STALL state, the remaining in input fifo would never be
+	 * smaller than the input threshold while the output fifo would not
+	 * be bigger than output one. Thus the DMA request would be cleared.
+	 */
+	fsl_asrc_set_watermarks(pair, ASRC_FIFO_THRESHOLD_MIN,
+				ASRC_FIFO_THRESHOLD_MAX);
+
+	/* Update the real input threshold to raise DMA request */
+	fsl_asrc_set_watermarks(pair, ASRC_M2M_INPUTFIFO_WML,
+				ASRC_M2M_OUTPUTFIFO_WML);
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_stop_part_one(struct fsl_asrc_pair *pair)
+{
+	fsl_asrc_stop_pair(pair);
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_check_format(u8 dir, u32 rate, u32 channels, u32 format)
+{
+	u64 support_format = FSL_ASRC_FORMATS;
+
+	if (channels < 1 || channels > 10)
+		return -EINVAL;
+
+	if (rate < 5512 || rate > 192000)
+		return -EINVAL;
+
+	if (dir == IN)
+		support_format |= SNDRV_PCM_FMTBIT_S8;
+
+	if (!(1 << format & support_format))
+		return -EINVAL;
+
+	return 0;
+}
+
+/* calculate capture data length according to output data length and sample rate */
+static int fsl_asrc_m2m_calc_out_len(struct fsl_asrc_pair *pair, int input_buffer_length)
+{
+	unsigned int in_width, out_width;
+	unsigned int channels = pair->channels;
+	unsigned int in_samples, out_samples;
+	unsigned int out_length;
+
+	in_width = snd_pcm_format_physical_width(pair->sample_format[IN]) / 8;
+	out_width = snd_pcm_format_physical_width(pair->sample_format[OUT]) / 8;
+
+	in_samples = input_buffer_length / in_width / channels;
+	out_samples = pair->rate[OUT] * in_samples / pair->rate[IN];
+	out_length = (out_samples - ASRC_OUTPUT_LAST_SAMPLE) * out_width * channels;
+
+	return out_length;
+}
+
+static int fsl_asrc_m2m_get_maxburst(u8 dir, struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	struct fsl_asrc_priv *asrc_priv = asrc->private;
+	int wml = (dir == IN) ? ASRC_M2M_INPUTFIFO_WML : ASRC_M2M_OUTPUTFIFO_WML;
+
+	if (!asrc_priv->soc->use_edma)
+		return wml * pair->channels;
+	else
+		return 1;
+}
+
+static int fsl_asrc_m2m_pair_resume(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	int i;
+
+	for (i = 0; i < pair->channels * 4; i++)
+		regmap_write(asrc->regmap, REG_ASRDI(pair->index), 0);
+
+	return 0;
+}
+
 static int fsl_asrc_runtime_resume(struct device *dev);
 static int fsl_asrc_runtime_suspend(struct device *dev);
 
@@ -1147,6 +1276,15 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	asrc->get_fifo_addr = fsl_asrc_get_fifo_addr;
 	asrc->pair_priv_size = sizeof(struct fsl_asrc_pair_priv);
 
+	asrc->m2m_start_part_one = fsl_asrc_m2m_start_part_one;
+	asrc->m2m_start_part_two = fsl_asrc_m2m_start_part_two;
+	asrc->m2m_stop_part_one = fsl_asrc_m2m_stop_part_one;
+	asrc->get_output_fifo_size = fsl_asrc_get_output_fifo_size;
+	asrc->m2m_check_format = fsl_asrc_m2m_check_format;
+	asrc->m2m_calc_out_len = fsl_asrc_m2m_calc_out_len;
+	asrc->m2m_get_maxburst = fsl_asrc_m2m_get_maxburst;
+	asrc->m2m_pair_resume = fsl_asrc_m2m_pair_resume;
+
 	if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
 		asrc_priv->clk_map[IN] = input_clk_map_imx35;
 		asrc_priv->clk_map[OUT] = output_clk_map_imx35;
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 86d2422ad606..1c492eb237f5 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -12,6 +12,8 @@
 
 #include  "fsl_asrc_common.h"
 
+#define ASRC_M2M_INPUTFIFO_WML		0x4
+#define ASRC_M2M_OUTPUTFIFO_WML		0x2
 #define ASRC_DMA_BUFFER_NUM		2
 #define ASRC_INPUTFIFO_THRESHOLD	32
 #define ASRC_OUTPUTFIFO_THRESHOLD	32
diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
index 7e1c13ca37f1..9294f378f0cc 100644
--- a/sound/soc/fsl/fsl_asrc_common.h
+++ b/sound/soc/fsl/fsl_asrc_common.h
@@ -4,6 +4,10 @@
  *
  */
 
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fh.h>
+
 #ifndef _FSL_ASRC_COMMON_H
 #define _FSL_ASRC_COMMON_H
 
@@ -34,6 +38,13 @@ enum asrc_pair_index {
  * @pos: hardware pointer position
  * @req_dma_chan: flag to release dev_to_dev chan
  * @private: pair private area
+ * @complete: dma task complete
+ * @fh: v4l2 file handler
+ * @ctrl_handler: v4l2 control handler
+ * @sample_format: format of m2m
+ * @rate: rate of m2m
+ * @buf_len: buffer length of m2m
+ * @req_pair: flag for request pair
  */
 struct fsl_asrc_pair {
 	struct fsl_asrc *asrc;
@@ -49,6 +60,15 @@ struct fsl_asrc_pair {
 	bool req_dma_chan;
 
 	void *private;
+
+	/* used for m2m */
+	struct completion complete[2];
+	struct v4l2_fh fh;
+	struct v4l2_ctrl_handler ctrl_handler;
+	snd_pcm_format_t sample_format[2];
+	unsigned int rate[2];
+	unsigned int buf_len[2];
+	bool req_pair;
 };
 
 /**
@@ -63,6 +83,10 @@ struct fsl_asrc_pair {
  * @ipg_clk: clock source to drive peripheral
  * @spba_clk: SPBA clock (optional, depending on SoC design)
  * @lock: spin lock for resource protection
+ * @v4l2_dev: v4l2 device structure
+ * @m2m_dev: pointer to v4l2_m2m_dev
+ * @dec_vdev: pointer to video_device
+ * @mlock: v4l2 ioctls serialization
  * @pair: pair pointers
  * @channel_avail: non-occupied channel numbers
  * @asrc_rate: default sample rate for ASoC Back-Ends
@@ -72,6 +96,17 @@ struct fsl_asrc_pair {
  * @request_pair: function pointer
  * @release_pair: function pointer
  * @get_fifo_addr: function pointer
+ * @m2m_start_part_one: function pointer
+ * @m2m_start_part_two: function pointer
+ * @m2m_stop_part_one: function pointer
+ * @m2m_stop_part_two: function pointer
+ * @m2m_check_format: function pointer
+ * @m2m_calc_out_len: function pointer
+ * @m2m_get_maxburst: function pointer
+ * @m2m_pair_suspend: function pointer
+ * @m2m_pair_resume: function pointer
+ * @m2m_set_ratio_mod: function pointer
+ * @get_output_fifo_size: function pointer
  * @pair_priv_size: size of pair private struct.
  * @private: private data structure
  */
@@ -86,6 +121,11 @@ struct fsl_asrc {
 	struct clk *spba_clk;
 	spinlock_t lock;      /* spin lock for resource protection */
 
+	struct v4l2_device v4l2_dev;
+	struct v4l2_m2m_dev *m2m_dev;
+	struct video_device *dec_vdev;
+	struct mutex mlock; /* v4l2 ioctls serialization */
+
 	struct fsl_asrc_pair *pair[PAIR_CTX_NUM];
 	unsigned int channel_avail;
 
@@ -97,6 +137,20 @@ struct fsl_asrc {
 	int (*request_pair)(int channels, struct fsl_asrc_pair *pair);
 	void (*release_pair)(struct fsl_asrc_pair *pair);
 	int (*get_fifo_addr)(u8 dir, enum asrc_pair_index index);
+
+	int (*m2m_start_part_one)(struct fsl_asrc_pair *pair);
+	int (*m2m_start_part_two)(struct fsl_asrc_pair *pair);
+	int (*m2m_stop_part_one)(struct fsl_asrc_pair *pair);
+	int (*m2m_stop_part_two)(struct fsl_asrc_pair *pair);
+
+	int (*m2m_check_format)(u8 dir, u32 rate, u32 channels, u32 format);
+	int (*m2m_calc_out_len)(struct fsl_asrc_pair *pair, int input_buffer_length);
+	int (*m2m_get_maxburst)(u8 dir, struct fsl_asrc_pair *pair);
+	int (*m2m_pair_suspend)(struct fsl_asrc_pair *pair);
+	int (*m2m_pair_resume)(struct fsl_asrc_pair *pair);
+	int (*m2m_set_ratio_mod)(struct fsl_asrc_pair *pair, int val);
+
+	unsigned int (*get_output_fifo_size)(struct fsl_asrc_pair *pair);
 	size_t pair_priv_size;
 
 	void *private;
-- 
2.34.1

