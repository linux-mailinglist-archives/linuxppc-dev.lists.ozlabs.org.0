Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A574A948D1A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 12:48:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdVQz4SgWz3fp8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 20:48:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdVPl2xMtz3c5h
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2024 20:47:39 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6DCE1200E62;
	Tue,  6 Aug 2024 12:47:36 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 07EA2200E29;
	Tue,  6 Aug 2024 12:47:36 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 48540183487B;
	Tue,  6 Aug 2024 18:47:34 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 2/6] ASoC: fsl_asrc: define functions for memory to memory usage
Date: Tue,  6 Aug 2024 18:26:39 +0800
Message-Id: <1722940003-20126-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
References: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
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

m2m_prepare: prepare for the start step
m2m_start: the start step
m2m_unprepare: unprepare for stop step, optional
m2m_stop: stop step
m2m_check_format: check format is supported or not
m2m_calc_out_len: calculate output length according to input length
m2m_get_maxburst: burst size for dma
m2m_pair_suspend: suspend function of pair, optional.
m2m_pair_resume: resume function of pair
get_output_fifo_size: get remaining data size in FIFO

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c        | 139 ++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_asrc.h        |   2 +
 sound/soc/fsl/fsl_asrc_common.h |  59 ++++++++++++++
 3 files changed, 200 insertions(+)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index b793263291dc..01e3af5b1bea 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1063,6 +1063,136 @@ static int fsl_asrc_get_fifo_addr(u8 dir, enum asrc_pair_index index)
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
+static int fsl_asrc_m2m_prepare(struct fsl_asrc_pair *pair)
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
+	pair->first_convert = 1;
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_start(struct fsl_asrc_pair *pair)
+{
+	if (pair->first_convert) {
+		fsl_asrc_start_pair(pair);
+		pair->first_convert = 0;
+	}
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
+static int fsl_asrc_m2m_stop(struct fsl_asrc_pair *pair)
+{
+	if (!pair->first_convert) {
+		fsl_asrc_stop_pair(pair);
+		pair->first_convert = 1;
+	}
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
+static int fsl_asrc_m2m_get_cap(struct fsl_asrc_m2m_cap *cap)
+{
+	cap->fmt_in = FSL_ASRC_FORMATS;
+	cap->fmt_out = FSL_ASRC_FORMATS | SNDRV_PCM_FMTBIT_S8;
+	cap->rate_in = SNDRV_PCM_RATE_8000_192000 | SNDRV_PCM_RATE_5512;
+	cap->rate_out = SNDRV_PCM_RATE_8000_192000 | SNDRV_PCM_RATE_5512;
+	cap->chan_min = 1;
+	cap->chan_max = 10;
+
+	return 0;
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
+	pair->first_convert = 1;
+	return 0;
+}
+
 static int fsl_asrc_runtime_resume(struct device *dev);
 static int fsl_asrc_runtime_suspend(struct device *dev);
 
@@ -1147,6 +1277,15 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	asrc->get_fifo_addr = fsl_asrc_get_fifo_addr;
 	asrc->pair_priv_size = sizeof(struct fsl_asrc_pair_priv);
 
+	asrc->m2m_prepare = fsl_asrc_m2m_prepare;
+	asrc->m2m_start = fsl_asrc_m2m_start;
+	asrc->m2m_stop = fsl_asrc_m2m_stop;
+	asrc->get_output_fifo_size = fsl_asrc_get_output_fifo_size;
+	asrc->m2m_calc_out_len = fsl_asrc_m2m_calc_out_len;
+	asrc->m2m_get_maxburst = fsl_asrc_m2m_get_maxburst;
+	asrc->m2m_pair_resume = fsl_asrc_m2m_pair_resume;
+	asrc->m2m_get_cap = fsl_asrc_m2m_get_cap;
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
index 7e1c13ca37f1..91dad736a969 100644
--- a/sound/soc/fsl/fsl_asrc_common.h
+++ b/sound/soc/fsl/fsl_asrc_common.h
@@ -21,6 +21,24 @@ enum asrc_pair_index {
 
 #define PAIR_CTX_NUM  0x4
 
+/**
+ * struct fsl_asrc_m2m_cap - capability data
+ * @fmt_in: input sample format
+ * @fmt_out: output sample format
+ * @chan_min: minimum channel number
+ * @chan_max: maximum channel number
+ * @rate_in: minimum rate
+ * @rate_out: maximum rete
+ */
+struct fsl_asrc_m2m_cap {
+	u64 fmt_in;
+	u64 fmt_out;
+	int chan_min;
+	int chan_max;
+	int rate_in;
+	int rate_out;
+};
+
 /**
  * fsl_asrc_pair: ASRC Pair common data
  *
@@ -34,6 +52,13 @@ enum asrc_pair_index {
  * @pos: hardware pointer position
  * @req_dma_chan: flag to release dev_to_dev chan
  * @private: pair private area
+ * @complete: dma task complete
+ * @sample_format: format of m2m
+ * @rate: rate of m2m
+ * @buf_len: buffer length of m2m
+ * @dma_buffer: buffer pointers
+ * @first_convert: start of conversion
+ * @ratio_mod: ratio modification
  */
 struct fsl_asrc_pair {
 	struct fsl_asrc *asrc;
@@ -49,6 +74,15 @@ struct fsl_asrc_pair {
 	bool req_dma_chan;
 
 	void *private;
+
+	/* used for m2m */
+	struct completion complete[2];
+	snd_pcm_format_t sample_format[2];
+	unsigned int rate[2];
+	unsigned int buf_len[2];
+	struct snd_dma_buffer dma_buffer[2];
+	unsigned int first_convert;
+	unsigned int ratio_mod;
 };
 
 /**
@@ -72,6 +106,17 @@ struct fsl_asrc_pair {
  * @request_pair: function pointer
  * @release_pair: function pointer
  * @get_fifo_addr: function pointer
+ * @m2m_get_cap: function pointer
+ * @m2m_prepare: function pointer
+ * @m2m_start: function pointer
+ * @m2m_unprepare: function pointer
+ * @m2m_stop: function pointer
+ * @m2m_calc_out_len: function pointer
+ * @m2m_get_maxburst: function pointer
+ * @m2m_pair_suspend: function pointer
+ * @m2m_pair_resume: function pointer
+ * @m2m_set_ratio_mod: function pointer
+ * @get_output_fifo_size: function pointer
  * @pair_priv_size: size of pair private struct.
  * @private: private data structure
  */
@@ -97,6 +142,20 @@ struct fsl_asrc {
 	int (*request_pair)(int channels, struct fsl_asrc_pair *pair);
 	void (*release_pair)(struct fsl_asrc_pair *pair);
 	int (*get_fifo_addr)(u8 dir, enum asrc_pair_index index);
+	int (*m2m_get_cap)(struct fsl_asrc_m2m_cap *cap);
+
+	int (*m2m_prepare)(struct fsl_asrc_pair *pair);
+	int (*m2m_start)(struct fsl_asrc_pair *pair);
+	int (*m2m_unprepare)(struct fsl_asrc_pair *pair);
+	int (*m2m_stop)(struct fsl_asrc_pair *pair);
+
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

