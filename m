Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF6F699656
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 14:51:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHbvh5f67z3fR8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 00:51:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=SSz1Ttg5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::227; helo=relay7-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=SSz1Ttg5;
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHbk33h9zz3f3K
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 00:43:07 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 06B102000B;
	Thu, 16 Feb 2023 13:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676554984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UGAu1cwlyDk/eT+ktcQI4tEx9hTKnRXRtAWKoS3GEJU=;
	b=SSz1Ttg5ylXpjIHgG2b2E087vpwXzPrcb6J0W8Rkkm/e//4DMcirJei+QwMo39+YkSZAGV
	k/P1ASR6gDU/7U/dUA7n+4IiFXSZ7ZR7EUl7VL7lHNXWv4ngZvU7ZHe8y/YQ43XuEEfffj
	yDUMl6PbbP7Dkh0KrzN/DHw5c2GcqZ35WKxcnXtlhN4Be00/WNwKJJGoXuP9K4+LwGtvAy
	yUUvHXQFhi8sgjXA4iSH+R+RREJYEVSYofQ0TLvRt+jNhQ2a1pUjIJ38mrLp/DinQUH2yP
	eBb2LlgYNKADR34STpYAOa4JV6KP9l5WLbFdg019rvVjb8XzL12FIHBt4iRylA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH v5 09/10] ASoC: fsl: Add support for QMC audio
Date: Thu, 16 Feb 2023 14:42:25 +0100
Message-Id: <20230216134226.1692107-10-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216134226.1692107-1-herve.codina@bootlin.com>
References: <20230216134226.1692107-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The QMC audio is an ASoC component which provides DAIs
that use the QMC (QUICC Multichannel Controller) to transfer
the audio data.

It provides as many DAIs as the number of QMC channels it
references.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/fsl/Kconfig         |   9 +
 sound/soc/fsl/Makefile        |   2 +
 sound/soc/fsl/fsl_qmc_audio.c | 735 ++++++++++++++++++++++++++++++++++
 3 files changed, 746 insertions(+)
 create mode 100644 sound/soc/fsl/fsl_qmc_audio.c

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 614eceda6b9e..17db29c25d96 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -172,6 +172,15 @@ config SND_MPC52xx_DMA
 config SND_SOC_POWERPC_DMA
 	tristate
 
+config SND_SOC_POWERPC_QMC_AUDIO
+	tristate "QMC ALSA SoC support"
+	depends on CPM_QMC
+	help
+	  ALSA SoC Audio support using the Freescale QUICC Multichannel
+	  Controller (QMC).
+	  Say Y or M if you want to add support for SoC audio using Freescale
+	  QMC.
+
 comment "SoC Audio support for Freescale PPC boards:"
 
 config SND_SOC_MPC8610_HPCD
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index b54beb1a66fa..8db7e97d0bd5 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -28,6 +28,7 @@ snd-soc-fsl-easrc-objs := fsl_easrc.o
 snd-soc-fsl-xcvr-objs := fsl_xcvr.o
 snd-soc-fsl-aud2htx-objs := fsl_aud2htx.o
 snd-soc-fsl-rpmsg-objs := fsl_rpmsg.o
+snd-soc-fsl-qmc-audio-objs := fsl_qmc_audio.o
 
 obj-$(CONFIG_SND_SOC_FSL_AUDMIX) += snd-soc-fsl-audmix.o
 obj-$(CONFIG_SND_SOC_FSL_ASOC_CARD) += snd-soc-fsl-asoc-card.o
@@ -44,6 +45,7 @@ obj-$(CONFIG_SND_SOC_POWERPC_DMA) += snd-soc-fsl-dma.o
 obj-$(CONFIG_SND_SOC_FSL_XCVR) += snd-soc-fsl-xcvr.o
 obj-$(CONFIG_SND_SOC_FSL_AUD2HTX) += snd-soc-fsl-aud2htx.o
 obj-$(CONFIG_SND_SOC_FSL_RPMSG) += snd-soc-fsl-rpmsg.o
+obj-$(CONFIG_SND_SOC_POWERPC_QMC_AUDIO) += snd-soc-fsl-qmc-audio.o
 
 # MPC5200 Platform Support
 obj-$(CONFIG_SND_MPC52xx_DMA) += mpc5200_dma.o
diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
new file mode 100644
index 000000000000..7cbb8e4758cc
--- /dev/null
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -0,0 +1,735 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ALSA SoC using the QUICC Multichannel Controller (QMC)
+ *
+ * Copyright 2022 CS GROUP France
+ *
+ * Author: Herve Codina <herve.codina@bootlin.com>
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <soc/fsl/qe/qmc.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+struct qmc_dai {
+	char *name;
+	int id;
+	struct device *dev;
+	struct qmc_chan *qmc_chan;
+	unsigned int nb_tx_ts;
+	unsigned int nb_rx_ts;
+};
+
+struct qmc_audio {
+	struct device *dev;
+	unsigned int num_dais;
+	struct qmc_dai *dais;
+	struct snd_soc_dai_driver *dai_drivers;
+};
+
+struct qmc_dai_prtd {
+	struct qmc_dai *qmc_dai;
+	dma_addr_t dma_buffer_start;
+	dma_addr_t period_ptr_submitted;
+	dma_addr_t period_ptr_ended;
+	dma_addr_t dma_buffer_end;
+	size_t period_size;
+	struct snd_pcm_substream *substream;
+};
+
+static int qmc_audio_pcm_construct(struct snd_soc_component *component,
+				   struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_card *card = rtd->card->snd_card;
+	int ret;
+
+	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
+	if (ret)
+		return ret;
+
+	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV, card->dev,
+				       64*1024, 64*1024);
+	return 0;
+}
+
+static int qmc_audio_pcm_hw_params(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct qmc_dai_prtd *prtd = substream->runtime->private_data;
+
+	prtd->dma_buffer_start = runtime->dma_addr;
+	prtd->dma_buffer_end = runtime->dma_addr + params_buffer_bytes(params);
+	prtd->period_size = params_period_bytes(params);
+	prtd->period_ptr_submitted = prtd->dma_buffer_start;
+	prtd->period_ptr_ended = prtd->dma_buffer_start;
+	prtd->substream = substream;
+
+	return 0;
+}
+
+static void qmc_audio_pcm_write_complete(void *context)
+{
+	struct qmc_dai_prtd *prtd = context;
+	int ret;
+
+	prtd->period_ptr_ended += prtd->period_size;
+	if (prtd->period_ptr_ended >= prtd->dma_buffer_end)
+		prtd->period_ptr_ended = prtd->dma_buffer_start;
+
+	prtd->period_ptr_submitted += prtd->period_size;
+	if (prtd->period_ptr_submitted >= prtd->dma_buffer_end)
+		prtd->period_ptr_submitted = prtd->dma_buffer_start;
+
+	ret = qmc_chan_write_submit(prtd->qmc_dai->qmc_chan,
+		prtd->period_ptr_submitted, prtd->period_size,
+		qmc_audio_pcm_write_complete, prtd);
+	if (ret) {
+		dev_err(prtd->qmc_dai->dev, "write_submit failed %d\n",
+			ret);
+	}
+
+	snd_pcm_period_elapsed(prtd->substream);
+}
+
+static void qmc_audio_pcm_read_complete(void *context, size_t length)
+{
+	struct qmc_dai_prtd *prtd = context;
+	int ret;
+
+	if (length != prtd->period_size) {
+		dev_err(prtd->qmc_dai->dev, "read complete length = %zu, exp %zu\n",
+			length, prtd->period_size);
+	}
+
+	prtd->period_ptr_ended += prtd->period_size;
+	if (prtd->period_ptr_ended >= prtd->dma_buffer_end)
+		prtd->period_ptr_ended = prtd->dma_buffer_start;
+
+	prtd->period_ptr_submitted += prtd->period_size;
+	if (prtd->period_ptr_submitted >= prtd->dma_buffer_end)
+		prtd->period_ptr_submitted = prtd->dma_buffer_start;
+
+	ret = qmc_chan_read_submit(prtd->qmc_dai->qmc_chan,
+		prtd->period_ptr_submitted, prtd->period_size,
+		qmc_audio_pcm_read_complete, prtd);
+	if (ret) {
+		dev_err(prtd->qmc_dai->dev, "read_submit failed %d\n",
+			ret);
+	}
+
+	snd_pcm_period_elapsed(prtd->substream);
+}
+
+static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream, int cmd)
+{
+	struct qmc_dai_prtd *prtd = substream->runtime->private_data;
+	int ret;
+
+	if (!prtd->qmc_dai) {
+		dev_err(component->dev, "qmc_dai is not set\n");
+		return -EINVAL;
+	}
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			/* Submit first chunk ... */
+			ret = qmc_chan_write_submit(prtd->qmc_dai->qmc_chan,
+				prtd->period_ptr_submitted, prtd->period_size,
+				qmc_audio_pcm_write_complete, prtd);
+			if (ret) {
+				dev_err(component->dev, "write_submit failed %d\n",
+					ret);
+				return ret;
+			}
+
+			/* ... prepare next one ... */
+			prtd->period_ptr_submitted += prtd->period_size;
+			if (prtd->period_ptr_submitted >= prtd->dma_buffer_end)
+				prtd->period_ptr_submitted = prtd->dma_buffer_start;
+
+			/* ... and send it */
+			ret = qmc_chan_write_submit(prtd->qmc_dai->qmc_chan,
+				prtd->period_ptr_submitted, prtd->period_size,
+				qmc_audio_pcm_write_complete, prtd);
+			if (ret) {
+				dev_err(component->dev, "write_submit failed %d\n",
+					ret);
+				return ret;
+			}
+		} else {
+			/* Submit first chunk ... */
+			ret = qmc_chan_read_submit(prtd->qmc_dai->qmc_chan,
+				prtd->period_ptr_submitted, prtd->period_size,
+				qmc_audio_pcm_read_complete, prtd);
+			if (ret) {
+				dev_err(component->dev, "read_submit failed %d\n",
+					ret);
+				return ret;
+			}
+
+			/* ... prepare next one ... */
+			prtd->period_ptr_submitted += prtd->period_size;
+			if (prtd->period_ptr_submitted >= prtd->dma_buffer_end)
+				prtd->period_ptr_submitted = prtd->dma_buffer_start;
+
+			/* ... and send it */
+			ret = qmc_chan_read_submit(prtd->qmc_dai->qmc_chan,
+				prtd->period_ptr_submitted, prtd->period_size,
+				qmc_audio_pcm_read_complete, prtd);
+			if (ret) {
+				dev_err(component->dev, "write_submit failed %d\n",
+					ret);
+				return ret;
+			}
+		}
+		break;
+
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		break;
+
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static snd_pcm_uframes_t qmc_audio_pcm_pointer(struct snd_soc_component *component,
+					       struct snd_pcm_substream *substream)
+{
+	struct qmc_dai_prtd *prtd = substream->runtime->private_data;
+
+	return bytes_to_frames(substream->runtime,
+			       prtd->period_ptr_ended - prtd->dma_buffer_start);
+}
+
+static int qmc_audio_of_xlate_dai_name(struct snd_soc_component *component,
+					const struct of_phandle_args *args,
+					const char **dai_name)
+{
+	struct qmc_audio *qmc_audio = dev_get_drvdata(component->dev);
+	struct snd_soc_dai_driver *dai_driver;
+	int id = args->args[0];
+	int i;
+
+	for (i = 0; i  < qmc_audio->num_dais; i++) {
+		dai_driver = qmc_audio->dai_drivers + i;
+		if (dai_driver->id == id) {
+			*dai_name = dai_driver->name;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static const struct snd_pcm_hardware qmc_audio_pcm_hardware = {
+	.info			= SNDRV_PCM_INFO_MMAP |
+				  SNDRV_PCM_INFO_MMAP_VALID |
+				  SNDRV_PCM_INFO_INTERLEAVED |
+				  SNDRV_PCM_INFO_PAUSE,
+	.period_bytes_min	= 32,
+	.period_bytes_max	= 64*1024,
+	.periods_min		= 2,
+	.periods_max		= 2*1024,
+	.buffer_bytes_max	= 64*1024,
+};
+
+static int qmc_audio_pcm_open(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct qmc_dai_prtd *prtd;
+	int ret;
+
+	snd_soc_set_runtime_hwparams(substream, &qmc_audio_pcm_hardware);
+
+	/* ensure that buffer size is a multiple of period size */
+	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0)
+		return ret;
+
+	prtd = kzalloc(sizeof(*prtd), GFP_KERNEL);
+	if (prtd == NULL)
+		return -ENOMEM;
+
+	runtime->private_data = prtd;
+
+	return 0;
+}
+
+static int qmc_audio_pcm_close(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream)
+{
+	struct qmc_dai_prtd *prtd = substream->runtime->private_data;
+
+	kfree(prtd);
+	return 0;
+}
+
+static const struct snd_soc_component_driver qmc_audio_soc_platform = {
+	.open			= qmc_audio_pcm_open,
+	.close			= qmc_audio_pcm_close,
+	.hw_params		= qmc_audio_pcm_hw_params,
+	.trigger		= qmc_audio_pcm_trigger,
+	.pointer		= qmc_audio_pcm_pointer,
+	.pcm_construct		= qmc_audio_pcm_construct,
+	.of_xlate_dai_name	= qmc_audio_of_xlate_dai_name,
+};
+
+static unsigned int qmc_dai_get_index(struct snd_soc_dai *dai)
+{
+	struct qmc_audio *qmc_audio = snd_soc_dai_get_drvdata(dai);
+
+	return dai->driver - qmc_audio->dai_drivers;
+}
+
+static struct qmc_dai *qmc_dai_get_data(struct snd_soc_dai *dai)
+{
+	struct qmc_audio *qmc_audio = snd_soc_dai_get_drvdata(dai);
+	unsigned int index;
+
+	index = qmc_dai_get_index(dai);
+	if (index > qmc_audio->num_dais)
+		return NULL;
+
+	return qmc_audio->dais + index;
+}
+
+/*
+ * The constraints for format/channel is to match with the number of 8bit
+ * time-slots available.
+ */
+static int qmc_dai_hw_rule_channels_by_format(struct qmc_dai *qmc_dai,
+					      struct snd_pcm_hw_params *params,
+					      unsigned int nb_ts)
+{
+	struct snd_interval *c = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+	snd_pcm_format_t format = params_format(params);
+	struct snd_interval ch = {0};
+
+	switch (snd_pcm_format_physical_width(format)) {
+	case 8:
+		ch.max = nb_ts;
+		break;
+	case 16:
+		ch.max = nb_ts/2;
+		break;
+	case 32:
+		ch.max = nb_ts/4;
+		break;
+	case 64:
+		ch.max = nb_ts/8;
+		break;
+	default:
+		dev_err(qmc_dai->dev, "format physical width %u not supported\n",
+			snd_pcm_format_physical_width(format));
+		return -EINVAL;
+	}
+
+	ch.min = ch.max ? 1 : 0;
+
+	return snd_interval_refine(c, &ch);
+}
+
+static int qmc_dai_hw_rule_playback_channels_by_format(struct snd_pcm_hw_params *params,
+						       struct snd_pcm_hw_rule *rule)
+{
+	struct qmc_dai *qmc_dai = rule->private;
+
+	return qmc_dai_hw_rule_channels_by_format(qmc_dai, params, qmc_dai->nb_tx_ts);
+}
+
+static int qmc_dai_hw_rule_capture_channels_by_format(
+			struct snd_pcm_hw_params *params,
+			struct snd_pcm_hw_rule *rule)
+{
+	struct qmc_dai *qmc_dai = rule->private;
+
+	return qmc_dai_hw_rule_channels_by_format(qmc_dai, params, qmc_dai->nb_rx_ts);
+}
+
+static int qmc_dai_hw_rule_format_by_channels(struct qmc_dai *qmc_dai,
+					      struct snd_pcm_hw_params *params,
+					      unsigned int nb_ts)
+{
+	struct snd_mask *f_old = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+	unsigned int channels = params_channels(params);
+	unsigned int slot_width;
+	struct snd_mask f_new;
+	unsigned int i;
+
+	if (!channels || channels > nb_ts) {
+		dev_err(qmc_dai->dev, "channels %u not supported\n",
+			nb_ts);
+		return -EINVAL;
+	}
+
+	slot_width = (nb_ts / channels) * 8;
+
+	snd_mask_none(&f_new);
+	for (i = 0; i <= SNDRV_PCM_FORMAT_LAST; i++) {
+		if (snd_mask_test(f_old, i)) {
+			if (snd_pcm_format_physical_width(i) <= slot_width)
+				snd_mask_set(&f_new, i);
+		}
+	}
+
+	return snd_mask_refine(f_old, &f_new);
+}
+
+static int qmc_dai_hw_rule_playback_format_by_channels(
+			struct snd_pcm_hw_params *params,
+			struct snd_pcm_hw_rule *rule)
+{
+	struct qmc_dai *qmc_dai = rule->private;
+
+	return qmc_dai_hw_rule_format_by_channels(qmc_dai, params, qmc_dai->nb_tx_ts);
+}
+
+static int qmc_dai_hw_rule_capture_format_by_channels(
+			struct snd_pcm_hw_params *params,
+			struct snd_pcm_hw_rule *rule)
+{
+	struct qmc_dai *qmc_dai = rule->private;
+
+	return qmc_dai_hw_rule_format_by_channels(qmc_dai, params, qmc_dai->nb_rx_ts);
+}
+
+static int qmc_dai_startup(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	struct qmc_dai_prtd *prtd = substream->runtime->private_data;
+	snd_pcm_hw_rule_func_t hw_rule_channels_by_format;
+	snd_pcm_hw_rule_func_t hw_rule_format_by_channels;
+	struct qmc_dai *qmc_dai;
+	unsigned int frame_bits;
+	int ret;
+
+	qmc_dai = qmc_dai_get_data(dai);
+	if (!qmc_dai) {
+		dev_err(dai->dev, "Invalid dai\n");
+		return -EINVAL;
+	}
+
+	prtd->qmc_dai = qmc_dai;
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		hw_rule_channels_by_format = qmc_dai_hw_rule_capture_channels_by_format;
+		hw_rule_format_by_channels = qmc_dai_hw_rule_capture_format_by_channels;
+		frame_bits = qmc_dai->nb_rx_ts * 8;
+	} else {
+		hw_rule_channels_by_format = qmc_dai_hw_rule_playback_channels_by_format;
+		hw_rule_format_by_channels = qmc_dai_hw_rule_playback_format_by_channels;
+		frame_bits = qmc_dai->nb_tx_ts * 8;
+	}
+
+	ret = snd_pcm_hw_rule_add(substream->runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				  hw_rule_channels_by_format, qmc_dai,
+				  SNDRV_PCM_HW_PARAM_FORMAT, -1);
+	if (ret) {
+		dev_err(dai->dev, "Failed to add channels rule (%d)\n", ret);
+		return ret;
+	}
+
+	ret = snd_pcm_hw_rule_add(substream->runtime, 0,  SNDRV_PCM_HW_PARAM_FORMAT,
+				  hw_rule_format_by_channels, qmc_dai,
+				  SNDRV_PCM_HW_PARAM_CHANNELS, -1);
+	if (ret) {
+		dev_err(dai->dev, "Failed to add format rule (%d)\n", ret);
+		return ret;
+	}
+
+	ret = snd_pcm_hw_constraint_single(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_FRAME_BITS,
+					   frame_bits);
+	if (ret < 0) {
+		dev_err(dai->dev, "Failed to add frame_bits constraint (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int qmc_dai_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params,
+			     struct snd_soc_dai *dai)
+{
+	struct qmc_chan_param chan_param = {0};
+	struct qmc_dai *qmc_dai;
+	int ret;
+
+	qmc_dai = qmc_dai_get_data(dai);
+	if (!qmc_dai) {
+		dev_err(dai->dev, "Invalid dai\n");
+		return -EINVAL;
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		chan_param.mode = QMC_TRANSPARENT;
+		chan_param.transp.max_rx_buf_size = params_period_bytes(params);
+		ret = qmc_chan_set_param(qmc_dai->qmc_chan, &chan_param);
+		if (ret) {
+			dev_err(dai->dev, "set param failed %d\n",
+				ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int qmc_dai_trigger(struct snd_pcm_substream *substream, int cmd,
+			   struct snd_soc_dai *dai)
+{
+	struct qmc_dai *qmc_dai;
+	int direction;
+	int ret;
+
+	qmc_dai = qmc_dai_get_data(dai);
+	if (!qmc_dai) {
+		dev_err(dai->dev, "Invalid dai\n");
+		return -EINVAL;
+	}
+
+	direction = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+		    QMC_CHAN_WRITE : QMC_CHAN_READ;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		ret = qmc_chan_start(qmc_dai->qmc_chan, direction);
+		if (ret)
+			return ret;
+		break;
+
+	case SNDRV_PCM_TRIGGER_STOP:
+		ret = qmc_chan_stop(qmc_dai->qmc_chan, direction);
+		if (ret)
+			return ret;
+		ret = qmc_chan_reset(qmc_dai->qmc_chan, direction);
+		if (ret)
+			return ret;
+		break;
+
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		ret = qmc_chan_stop(qmc_dai->qmc_chan, direction);
+		if (ret)
+			return ret;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops qmc_dai_ops = {
+	.startup	= qmc_dai_startup,
+	.trigger	= qmc_dai_trigger,
+	.hw_params	= qmc_dai_hw_params,
+};
+
+static u64 qmc_audio_formats(u8 nb_ts)
+{
+	u64 formats;
+	unsigned int chan_width;
+	unsigned int format_width;
+	int i;
+
+	if (!nb_ts)
+		return 0;
+
+	formats = 0;
+	chan_width = nb_ts * 8;
+	for (i = 0; i <= SNDRV_PCM_FORMAT_LAST; i++) {
+		/*
+		 * Support format other than little-endian (ie big-endian or
+		 * without endianness such as 8bit formats)
+		 */
+		if (snd_pcm_format_little_endian(i) == 1)
+			continue;
+
+		/* Support physical width multiple of 8bit */
+		format_width = snd_pcm_format_physical_width(i);
+		if (format_width == 0 || format_width % 8)
+			continue;
+
+		/*
+		 * And support physical width that can fit N times in the
+		 * channel
+		 */
+		if (format_width > chan_width || chan_width % format_width)
+			continue;
+
+		formats |= (1ULL << i);
+	}
+	return formats;
+}
+
+static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *np,
+	struct qmc_dai *qmc_dai, struct snd_soc_dai_driver *qmc_soc_dai_driver)
+{
+	struct qmc_chan_info info;
+	u32 val;
+	int ret;
+
+	qmc_dai->dev = qmc_audio->dev;
+
+	ret = of_property_read_u32(np, "reg", &val);
+	if (ret) {
+		dev_err(qmc_audio->dev, "%pOF: failed to read reg\n", np);
+		return ret;
+	}
+	qmc_dai->id = val;
+
+	qmc_dai->name = devm_kasprintf(qmc_audio->dev, GFP_KERNEL, "%s.%d",
+				       np->parent->name, qmc_dai->id);
+
+	qmc_dai->qmc_chan = devm_qmc_chan_get_byphandle(qmc_audio->dev, np,
+							"fsl,qmc-chan");
+	if (IS_ERR(qmc_dai->qmc_chan)) {
+		ret = PTR_ERR(qmc_dai->qmc_chan);
+		return dev_err_probe(qmc_audio->dev, ret,
+				     "dai %d get QMC channel failed\n", qmc_dai->id);
+	}
+
+	qmc_soc_dai_driver->id = qmc_dai->id;
+	qmc_soc_dai_driver->name = qmc_dai->name;
+
+	ret = qmc_chan_get_info(qmc_dai->qmc_chan, &info);
+	if (ret) {
+		dev_err(qmc_audio->dev, "dai %d get QMC channel info failed %d\n",
+			qmc_dai->id, ret);
+		return ret;
+	}
+	dev_info(qmc_audio->dev, "dai %d QMC channel mode %d, nb_tx_ts %u, nb_rx_ts %u\n",
+		 qmc_dai->id, info.mode, info.nb_tx_ts, info.nb_rx_ts);
+
+	if (info.mode != QMC_TRANSPARENT) {
+		dev_err(qmc_audio->dev, "dai %d QMC chan mode %d is not QMC_TRANSPARENT\n",
+			qmc_dai->id, info.mode);
+		return -EINVAL;
+	}
+	qmc_dai->nb_tx_ts = info.nb_tx_ts;
+	qmc_dai->nb_rx_ts = info.nb_rx_ts;
+
+	qmc_soc_dai_driver->playback.channels_min = 0;
+	qmc_soc_dai_driver->playback.channels_max = 0;
+	if (qmc_dai->nb_tx_ts) {
+		qmc_soc_dai_driver->playback.channels_min = 1;
+		qmc_soc_dai_driver->playback.channels_max = qmc_dai->nb_tx_ts;
+	}
+	qmc_soc_dai_driver->playback.formats = qmc_audio_formats(qmc_dai->nb_tx_ts);
+
+	qmc_soc_dai_driver->capture.channels_min = 0;
+	qmc_soc_dai_driver->capture.channels_max = 0;
+	if (qmc_dai->nb_rx_ts) {
+		qmc_soc_dai_driver->capture.channels_min = 1;
+		qmc_soc_dai_driver->capture.channels_max = qmc_dai->nb_rx_ts;
+	}
+	qmc_soc_dai_driver->capture.formats = qmc_audio_formats(qmc_dai->nb_rx_ts);
+
+	qmc_soc_dai_driver->playback.rates = snd_pcm_rate_to_rate_bit(info.tx_fs_rate);
+	qmc_soc_dai_driver->playback.rate_min = info.tx_fs_rate;
+	qmc_soc_dai_driver->playback.rate_max = info.tx_fs_rate;
+	qmc_soc_dai_driver->capture.rates = snd_pcm_rate_to_rate_bit(info.rx_fs_rate);
+	qmc_soc_dai_driver->capture.rate_min = info.rx_fs_rate;
+	qmc_soc_dai_driver->capture.rate_max = info.rx_fs_rate;
+
+	qmc_soc_dai_driver->ops = &qmc_dai_ops;
+
+	return 0;
+}
+
+static int qmc_audio_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct qmc_audio *qmc_audio;
+	struct device_node *child;
+	unsigned int i;
+	int ret;
+
+	qmc_audio = devm_kzalloc(&pdev->dev, sizeof(*qmc_audio), GFP_KERNEL);
+	if (!qmc_audio)
+		return -ENOMEM;
+
+	qmc_audio->dev = &pdev->dev;
+
+	qmc_audio->num_dais = of_get_available_child_count(np);
+	if (qmc_audio->num_dais) {
+		qmc_audio->dais = devm_kcalloc(&pdev->dev, qmc_audio->num_dais,
+					       sizeof(*qmc_audio->dais),
+					       GFP_KERNEL);
+		if (!qmc_audio->dais)
+			return -ENOMEM;
+
+		qmc_audio->dai_drivers = devm_kcalloc(&pdev->dev, qmc_audio->num_dais,
+						      sizeof(*qmc_audio->dai_drivers),
+						      GFP_KERNEL);
+		if (!qmc_audio->dai_drivers)
+			return -ENOMEM;
+	}
+
+	i = 0;
+	for_each_available_child_of_node(np, child) {
+		ret = qmc_audio_dai_parse(qmc_audio, child,
+					  qmc_audio->dais + i,
+					  qmc_audio->dai_drivers + i);
+		if (ret) {
+			of_node_put(child);
+			return ret;
+		}
+		i++;
+	}
+
+
+	platform_set_drvdata(pdev, qmc_audio);
+
+	ret = devm_snd_soc_register_component(qmc_audio->dev,
+					      &qmc_audio_soc_platform,
+					      qmc_audio->dai_drivers,
+					      qmc_audio->num_dais);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct of_device_id qmc_audio_id_table[] = {
+	{ .compatible = "fsl,qmc-audio" },
+	{} /* sentinel */
+};
+MODULE_DEVICE_TABLE(of, qmc_audio_id_table);
+
+static struct platform_driver qmc_audio_driver = {
+	.driver = {
+		.name = "fsl-qmc-audio",
+		.of_match_table = of_match_ptr(qmc_audio_id_table),
+	},
+	.probe = qmc_audio_probe,
+};
+module_platform_driver(qmc_audio_driver);
+
+MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");
+MODULE_DESCRIPTION("CPM/QE QMC audio driver");
+MODULE_LICENSE("GPL");
-- 
2.39.1

