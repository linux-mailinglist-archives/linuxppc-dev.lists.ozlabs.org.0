Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BF23105D9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 08:30:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DX6XR22jbzDwfp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 18:30:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX6FV2w0PzDvbM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 18:17:49 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8C3C81A1456;
 Fri,  5 Feb 2021 08:08:51 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AE2001A0B09;
 Fri,  5 Feb 2021 08:08:45 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 589FE40309;
 Fri,  5 Feb 2021 08:08:39 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, linuxppc-dev@lists.ozlabs.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH 5/7] ASoC: imx-pcm-rpmsg: Add platform driver for audio base
 on rpmsg
Date: Fri,  5 Feb 2021 14:57:28 +0800
Message-Id: <1612508250-10586-6-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612508250-10586-1-git-send-email-shengjiu.wang@nxp.com>
References: <1612508250-10586-1-git-send-email-shengjiu.wang@nxp.com>
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

platform driver base on rpmsg is the interface for sending and
receiving rpmsg to and from M core. It will tell the Cortex-M core
sound format/rate/channel, where is the data buffer, where is
the period size, when to start, when to stop and when suspend
or resume happen, each this behavior there is defined rpmsg
command.

Especially we designed the low power audio case, that is to
allocate a large buffer and fill the data, then Cortex-A core can go
to sleep mode, Cortex-M core continue to play the sound, when the
buffer is consumed, Cortex-M core will trigger the Cortex-A core to
wakeup.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/Kconfig         |   5 +
 sound/soc/fsl/Makefile        |   1 +
 sound/soc/fsl/imx-pcm-rpmsg.c | 898 ++++++++++++++++++++++++++++++++++
 sound/soc/fsl/imx-pcm-rpmsg.h | 512 +++++++++++++++++++
 4 files changed, 1416 insertions(+)
 create mode 100644 sound/soc/fsl/imx-pcm-rpmsg.c
 create mode 100644 sound/soc/fsl/imx-pcm-rpmsg.h

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 84d9f0f1f75b..749c44fc0759 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -130,6 +130,11 @@ config SND_SOC_IMX_AUDIO_RPMSG
 	tristate
 	depends on RPMSG
 
+config SND_SOC_IMX_PCM_RPMSG
+	tristate
+	depends on SND_SOC_IMX_AUDIO_RPMSG
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+
 config SND_SOC_IMX_AUDMUX
 	tristate "Digital Audio Mux module support"
 	help
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index f08f3cd07ff5..ce4f4324c3a2 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -61,6 +61,7 @@ obj-$(CONFIG_SND_SOC_IMX_AUDMUX) += snd-soc-imx-audmux.o
 obj-$(CONFIG_SND_SOC_IMX_PCM_FIQ) += imx-pcm-fiq.o
 obj-$(CONFIG_SND_SOC_IMX_PCM_DMA) += imx-pcm-dma.o
 obj-$(CONFIG_SND_SOC_IMX_AUDIO_RPMSG) += imx-audio-rpmsg.o
+obj-$(CONFIG_SND_SOC_IMX_PCM_RPMSG) += imx-pcm-rpmsg.o
 
 # i.MX Machine Support
 snd-soc-eukrea-tlv320-objs := eukrea-tlv320.o
diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
new file mode 100644
index 000000000000..48df864bc092
--- /dev/null
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -0,0 +1,898 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2017-2021 NXP
+
+#include <linux/dma-mapping.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/rpmsg.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/soc.h>
+
+#include "imx-pcm.h"
+#include "fsl_rpmsg.h"
+#include "imx-pcm-rpmsg.h"
+
+static struct snd_pcm_hardware imx_rpmsg_pcm_hardware = {
+	.info = SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		SNDRV_PCM_INFO_MMAP |
+		SNDRV_PCM_INFO_MMAP_VALID |
+		SNDRV_PCM_INFO_NO_PERIOD_WAKEUP |
+		SNDRV_PCM_INFO_PAUSE |
+		SNDRV_PCM_INFO_RESUME,
+	.buffer_bytes_max = IMX_DEFAULT_DMABUF_SIZE,
+	.period_bytes_min = 512,
+	.period_bytes_max = 65536,
+	.periods_min = 2,
+	.periods_max = 6000,
+	.fifo_size = 0,
+};
+
+static int imx_rpmsg_pcm_send_message(struct rpmsg_msg *msg,
+				      struct rpmsg_info *info)
+{
+	struct rpmsg_device *rpdev = info->rpdev;
+	int ret = 0;
+
+	mutex_lock(&info->msg_lock);
+	if (!rpdev) {
+		dev_err(info->dev, "rpmsg channel not ready\n");
+		mutex_unlock(&info->msg_lock);
+		return -EINVAL;
+	}
+
+	dev_dbg(&rpdev->dev, "send cmd %d\n", msg->s_msg.header.cmd);
+
+	if (!(msg->s_msg.header.type == MSG_TYPE_C))
+		reinit_completion(&info->cmd_complete);
+
+	ret = rpmsg_send(rpdev->ept, (void *)&msg->s_msg,
+			 sizeof(struct rpmsg_s_msg));
+	if (ret) {
+		dev_err(&rpdev->dev, "rpmsg_send failed: %d\n", ret);
+		mutex_unlock(&info->msg_lock);
+		return ret;
+	}
+
+	/* No receive msg for TYPE_C command */
+	if (msg->s_msg.header.type == MSG_TYPE_C) {
+		mutex_unlock(&info->msg_lock);
+		return 0;
+	}
+
+	/* wait response from rpmsg */
+	ret = wait_for_completion_timeout(&info->cmd_complete,
+					  msecs_to_jiffies(RPMSG_TIMEOUT));
+	if (!ret) {
+		dev_err(&rpdev->dev, "rpmsg_send cmd %d timeout!\n",
+			msg->s_msg.header.cmd);
+		mutex_unlock(&info->msg_lock);
+		return -ETIMEDOUT;
+	}
+
+	memcpy(&msg->r_msg, &info->r_msg, sizeof(struct rpmsg_r_msg));
+	memcpy(&info->msg[msg->r_msg.header.cmd].r_msg,
+	       &msg->r_msg, sizeof(struct rpmsg_r_msg));
+
+	/*
+	 * Reset the buffer pointer to be zero, actully we have
+	 * set the buffer pointer to be zero in imx_rpmsg_terminate_all
+	 * But if there is timer task queued in queue, after it is
+	 * executed the buffer pointer will be changed, so need to
+	 * reset it again with TERMINATE command.
+	 */
+	switch (msg->s_msg.header.cmd) {
+	case TX_TERMINATE:
+		info->msg[TX_POINTER].r_msg.param.buffer_offset = 0;
+		break;
+	case RX_TERMINATE:
+		info->msg[RX_POINTER].r_msg.param.buffer_offset = 0;
+		break;
+	default:
+		break;
+	}
+
+	dev_dbg(&rpdev->dev, "cmd:%d, resp %d\n", msg->s_msg.header.cmd,
+		info->r_msg.param.resp);
+
+	mutex_unlock(&info->msg_lock);
+
+	return 0;
+}
+
+static int imx_rpmsg_insert_workqueue(struct snd_pcm_substream *substream,
+				      struct rpmsg_msg *msg,
+				      struct rpmsg_info *info)
+{
+	unsigned long flags;
+	int ret = 0;
+
+	/*
+	 * Queue the work to workqueue.
+	 * If the queue is full, drop the message.
+	 */
+	spin_lock_irqsave(&info->wq_lock, flags);
+	if (info->work_write_index != info->work_read_index) {
+		int index = info->work_write_index;
+
+		memcpy(&info->work_list[index].msg, msg,
+		       sizeof(struct rpmsg_s_msg));
+
+		queue_work(info->rpmsg_wq, &info->work_list[index].work);
+		info->work_write_index++;
+		info->work_write_index %= WORK_MAX_NUM;
+	} else {
+		info->msg_drop_count[substream->stream]++;
+		ret = -EPIPE;
+	}
+	spin_unlock_irqrestore(&info->wq_lock, flags);
+
+	return ret;
+}
+
+static int imx_rpmsg_pcm_hw_params(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params)
+{
+	struct rpmsg_info *info = dev_get_drvdata(component->dev);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct rpmsg_msg *msg;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		msg = &info->msg[TX_HW_PARAM];
+		msg->s_msg.header.cmd = TX_HW_PARAM;
+	} else {
+		msg = &info->msg[RX_HW_PARAM];
+		msg->s_msg.header.cmd = RX_HW_PARAM;
+	}
+
+	msg->s_msg.param.rate = params_rate(params);
+
+	if (params_format(params) == SNDRV_PCM_FORMAT_S16_LE)
+		msg->s_msg.param.format   = RPMSG_S16_LE;
+	else if (params_format(params) == SNDRV_PCM_FORMAT_S24_LE)
+		msg->s_msg.param.format   = RPMSG_S24_LE;
+	else if (params_format(params) == SNDRV_PCM_FORMAT_DSD_U16_LE)
+		msg->s_msg.param.format   = SNDRV_PCM_FORMAT_DSD_U16_LE;
+	else if (params_format(params) == SNDRV_PCM_FORMAT_DSD_U32_LE)
+		msg->s_msg.param.format   = SNDRV_PCM_FORMAT_DSD_U32_LE;
+	else
+		msg->s_msg.param.format   = RPMSG_S32_LE;
+
+	if (params_channels(params) == 1)
+		msg->s_msg.param.channels = RPMSG_CH_LEFT;
+	else
+		msg->s_msg.param.channels = RPMSG_CH_STEREO;
+
+	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
+	runtime->dma_bytes = params_buffer_bytes(params);
+
+	info->send_message(msg, info);
+
+	return 0;
+}
+
+static int imx_rpmsg_pcm_hw_free(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream)
+{
+	snd_pcm_set_runtime_buffer(substream, NULL);
+	return 0;
+}
+
+static snd_pcm_uframes_t imx_rpmsg_pcm_pointer(struct snd_soc_component *component,
+					       struct snd_pcm_substream *substream)
+{
+	struct rpmsg_info *info = dev_get_drvdata(component->dev);
+	struct rpmsg_msg *msg;
+	unsigned int pos = 0;
+	int buffer_tail = 0;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		msg = &info->msg[TX_PERIOD_DONE + MSG_TYPE_A_NUM];
+	else
+		msg = &info->msg[RX_PERIOD_DONE + MSG_TYPE_A_NUM];
+
+	buffer_tail = msg->r_msg.param.buffer_tail;
+	pos = buffer_tail * snd_pcm_lib_period_bytes(substream);
+
+	return bytes_to_frames(substream->runtime, pos);
+}
+
+static void imx_rpmsg_timer_callback(struct timer_list *t)
+{
+	struct stream_timer  *stream_timer =
+			from_timer(stream_timer, t, timer);
+	struct snd_pcm_substream *substream = stream_timer->substream;
+	struct rpmsg_info *info = stream_timer->info;
+	struct rpmsg_msg *msg;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		msg = &info->msg[TX_PERIOD_DONE + MSG_TYPE_A_NUM];
+		msg->s_msg.header.cmd = TX_PERIOD_DONE;
+	} else {
+		msg = &info->msg[RX_PERIOD_DONE + MSG_TYPE_A_NUM];
+		msg->s_msg.header.cmd = RX_PERIOD_DONE;
+	}
+
+	imx_rpmsg_insert_workqueue(substream, msg, info);
+}
+
+static int imx_rpmsg_pcm_open(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream)
+{
+	struct rpmsg_info *info = dev_get_drvdata(component->dev);
+	struct rpmsg_msg *msg;
+	int ret = 0;
+	int cmd;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		msg = &info->msg[TX_OPEN];
+		msg->s_msg.header.cmd = TX_OPEN;
+
+		/* reinitialize buffer counter*/
+		cmd = TX_PERIOD_DONE + MSG_TYPE_A_NUM;
+		info->msg[cmd].s_msg.param.buffer_tail = 0;
+		info->msg[cmd].r_msg.param.buffer_tail = 0;
+		info->msg[TX_POINTER].r_msg.param.buffer_offset = 0;
+
+	} else {
+		msg = &info->msg[RX_OPEN];
+		msg->s_msg.header.cmd = RX_OPEN;
+
+		/* reinitialize buffer counter*/
+		cmd = RX_PERIOD_DONE + MSG_TYPE_A_NUM;
+		info->msg[cmd].s_msg.param.buffer_tail = 0;
+		info->msg[cmd].r_msg.param.buffer_tail = 0;
+		info->msg[RX_POINTER].r_msg.param.buffer_offset = 0;
+	}
+
+	info->send_message(msg, info);
+
+	imx_rpmsg_pcm_hardware.period_bytes_max =
+			imx_rpmsg_pcm_hardware.buffer_bytes_max / 2;
+
+	snd_soc_set_runtime_hwparams(substream, &imx_rpmsg_pcm_hardware);
+
+	ret = snd_pcm_hw_constraint_integer(substream->runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0)
+		return ret;
+
+	info->msg_drop_count[substream->stream] = 0;
+
+	/* Create timer*/
+	info->stream_timer[substream->stream].info = info;
+	info->stream_timer[substream->stream].substream = substream;
+	timer_setup(&info->stream_timer[substream->stream].timer,
+		    imx_rpmsg_timer_callback, 0);
+	return ret;
+}
+
+static int imx_rpmsg_pcm_close(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct rpmsg_info *info = dev_get_drvdata(component->dev);
+	struct rpmsg_msg *msg;
+	int ret = 0;
+
+	/* Flush work in workqueue to make TX_CLOSE is the last message */
+	flush_workqueue(info->rpmsg_wq);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		msg = &info->msg[TX_CLOSE];
+		msg->s_msg.header.cmd = TX_CLOSE;
+	} else {
+		msg = &info->msg[RX_CLOSE];
+		msg->s_msg.header.cmd = RX_CLOSE;
+	}
+
+	info->send_message(msg, info);
+
+	del_timer(&info->stream_timer[substream->stream].timer);
+
+	rtd->dai_link->ignore_suspend = 0;
+
+	if (info->msg_drop_count[substream->stream])
+		dev_warn(rtd->dev, "Msg is dropped!, number is %d\n",
+			 info->msg_drop_count[substream->stream]);
+
+	return ret;
+}
+
+static int imx_rpmsg_pcm_prepare(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct fsl_rpmsg *rpmsg = dev_get_drvdata(cpu_dai->dev);
+
+	/*
+	 * NON-MMAP mode, NONBLOCK, Version 2, enable lpa in dts
+	 * four conditions to determine the lpa is enabled.
+	 */
+	if ((runtime->access == SNDRV_PCM_ACCESS_RW_INTERLEAVED ||
+	     runtime->access == SNDRV_PCM_ACCESS_RW_NONINTERLEAVED) &&
+	     rpmsg->version == API_VERSION_V2 &&
+	     rpmsg->enable_lpa) {
+		/*
+		 * Ignore suspend operation in low power mode
+		 * M core will continue playback music on A core suspend.
+		 */
+		rtd->dai_link->ignore_suspend = 1;
+		rpmsg->force_lpa = 1;
+	} else {
+		rpmsg->force_lpa = 0;
+	}
+
+	return 0;
+}
+
+static int imx_rpmsg_pcm_mmap(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream,
+			      struct vm_area_struct *vma)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	return dma_mmap_wc(substream->pcm->card->dev, vma,
+			   runtime->dma_area,
+			   runtime->dma_addr,
+			   runtime->dma_bytes);
+}
+
+static void imx_rpmsg_pcm_dma_complete(void *arg)
+{
+	struct snd_pcm_substream *substream = arg;
+
+	snd_pcm_period_elapsed(substream);
+}
+
+static int imx_rpmsg_prepare_and_submit(struct snd_soc_component *component,
+					struct snd_pcm_substream *substream)
+{
+	struct rpmsg_info *info = dev_get_drvdata(component->dev);
+	struct rpmsg_msg *msg;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		msg = &info->msg[TX_BUFFER];
+		msg->s_msg.header.cmd = TX_BUFFER;
+	} else {
+		msg = &info->msg[RX_BUFFER];
+		msg->s_msg.header.cmd = RX_BUFFER;
+	}
+
+	/* Send buffer address and buffer size */
+	msg->s_msg.param.buffer_addr = substream->runtime->dma_addr;
+	msg->s_msg.param.buffer_size = snd_pcm_lib_buffer_bytes(substream);
+	msg->s_msg.param.period_size = snd_pcm_lib_period_bytes(substream);
+	msg->s_msg.param.buffer_tail = 0;
+
+	info->num_period[substream->stream] = msg->s_msg.param.buffer_size /
+					      msg->s_msg.param.period_size;
+
+	info->callback[substream->stream] = imx_rpmsg_pcm_dma_complete;
+	info->callback_param[substream->stream] = substream;
+
+	return imx_rpmsg_insert_workqueue(substream, msg, info);
+}
+
+static int imx_rpmsg_async_issue_pending(struct snd_soc_component *component,
+					 struct snd_pcm_substream *substream)
+{
+	struct rpmsg_info *info = dev_get_drvdata(component->dev);
+	struct rpmsg_msg *msg;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		msg = &info->msg[TX_START];
+		msg->s_msg.header.cmd = TX_START;
+	} else {
+		msg = &info->msg[RX_START];
+		msg->s_msg.header.cmd = RX_START;
+	}
+
+	return imx_rpmsg_insert_workqueue(substream, msg, info);
+}
+
+static int imx_rpmsg_restart(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream)
+{
+	struct rpmsg_info *info = dev_get_drvdata(component->dev);
+	struct rpmsg_msg *msg;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		msg = &info->msg[TX_RESTART];
+		msg->s_msg.header.cmd = TX_RESTART;
+	} else {
+		msg = &info->msg[RX_RESTART];
+		msg->s_msg.header.cmd = RX_RESTART;
+	}
+
+	return imx_rpmsg_insert_workqueue(substream, msg, info);
+}
+
+static int imx_rpmsg_pause(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream)
+{
+	struct rpmsg_info *info = dev_get_drvdata(component->dev);
+	struct rpmsg_msg *msg;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		msg = &info->msg[TX_PAUSE];
+		msg->s_msg.header.cmd = TX_PAUSE;
+	} else {
+		msg = &info->msg[RX_PAUSE];
+		msg->s_msg.header.cmd = RX_PAUSE;
+	}
+
+	return imx_rpmsg_insert_workqueue(substream, msg, info);
+}
+
+static int imx_rpmsg_terminate_all(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream)
+{
+	struct rpmsg_info *info = dev_get_drvdata(component->dev);
+	struct rpmsg_msg *msg;
+	int cmd;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		msg = &info->msg[TX_TERMINATE];
+		msg->s_msg.header.cmd = TX_TERMINATE;
+		/* Clear buffer count*/
+		cmd = TX_PERIOD_DONE + MSG_TYPE_A_NUM;
+		info->msg[cmd].s_msg.param.buffer_tail = 0;
+		info->msg[cmd].r_msg.param.buffer_tail = 0;
+		info->msg[TX_POINTER].r_msg.param.buffer_offset = 0;
+	} else {
+		msg = &info->msg[RX_TERMINATE];
+		msg->s_msg.header.cmd = RX_TERMINATE;
+		/* Clear buffer count*/
+		cmd = RX_PERIOD_DONE + MSG_TYPE_A_NUM;
+		info->msg[cmd].s_msg.param.buffer_tail = 0;
+		info->msg[cmd].r_msg.param.buffer_tail = 0;
+		info->msg[RX_POINTER].r_msg.param.buffer_offset = 0;
+	}
+
+	del_timer(&info->stream_timer[substream->stream].timer);
+
+	return imx_rpmsg_insert_workqueue(substream, msg, info);
+}
+
+static int imx_rpmsg_pcm_trigger(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream, int cmd)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct fsl_rpmsg *rpmsg = dev_get_drvdata(cpu_dai->dev);
+	int ret = 0;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+		ret = imx_rpmsg_prepare_and_submit(component, substream);
+		if (ret)
+			return ret;
+		ret = imx_rpmsg_async_issue_pending(component, substream);
+		break;
+	case SNDRV_PCM_TRIGGER_RESUME:
+		if (rpmsg->force_lpa)
+			break;
+		fallthrough;
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		ret = imx_rpmsg_restart(component, substream);
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		if (!rpmsg->force_lpa) {
+			if (runtime->info & SNDRV_PCM_INFO_PAUSE)
+				ret = imx_rpmsg_pause(component, substream);
+			else
+				ret = imx_rpmsg_terminate_all(component, substream);
+		}
+		break;
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		ret = imx_rpmsg_pause(component, substream);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+		ret = imx_rpmsg_terminate_all(component, substream);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/*
+ * imx_rpmsg_pcm_ack
+ *
+ * Send the period index to M core through rpmsg, but not send
+ * all the period index to M core, reduce some unnessesary msg
+ * to reduce the pressure of rpmsg bandwidth.
+ */
+static int imx_rpmsg_pcm_ack(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct fsl_rpmsg *rpmsg = dev_get_drvdata(cpu_dai->dev);
+	struct rpmsg_info *info = dev_get_drvdata(component->dev);
+	snd_pcm_uframes_t period_size = runtime->period_size;
+	snd_pcm_sframes_t avail;
+	struct timer_list *timer;
+	struct rpmsg_msg *msg;
+	unsigned long flags;
+	int buffer_tail = 0;
+	int writen_num = 0;
+
+	if (!rpmsg->force_lpa)
+		return 0;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		msg = &info->msg[TX_PERIOD_DONE + MSG_TYPE_A_NUM];
+		msg->s_msg.header.cmd = TX_PERIOD_DONE;
+	} else {
+		msg = &info->msg[RX_PERIOD_DONE + MSG_TYPE_A_NUM];
+		msg->s_msg.header.cmd = RX_PERIOD_DONE;
+	}
+
+	msg->s_msg.header.type = MSG_TYPE_C;
+
+	buffer_tail = (frames_to_bytes(runtime, runtime->control->appl_ptr) %
+		       snd_pcm_lib_buffer_bytes(substream));
+	buffer_tail = buffer_tail / snd_pcm_lib_period_bytes(substream);
+
+	/* There is update for period index */
+	if (buffer_tail != msg->s_msg.param.buffer_tail) {
+		writen_num = buffer_tail - msg->s_msg.param.buffer_tail;
+		if (writen_num < 0)
+			writen_num += runtime->periods;
+
+		msg->s_msg.param.buffer_tail = buffer_tail;
+
+		/* The notification message is updated to latest */
+		spin_lock_irqsave(&info->lock[substream->stream], flags);
+		memcpy(&info->notify[substream->stream], msg,
+		       sizeof(struct rpmsg_s_msg));
+		info->notify_updated[substream->stream] = true;
+		spin_unlock_irqrestore(&info->lock[substream->stream], flags);
+
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			avail = snd_pcm_playback_hw_avail(runtime);
+		else
+			avail = snd_pcm_capture_hw_avail(runtime);
+
+		timer = &info->stream_timer[substream->stream].timer;
+		/*
+		 * if the data in the buffer is less than one period
+		 * send message immediately.
+		 * if there is more than one period data, delay one
+		 * period (timer) to send the message.
+		 */
+		if ((avail - writen_num * period_size) <= period_size) {
+			imx_rpmsg_insert_workqueue(substream, msg, info);
+		} else if (rpmsg->force_lpa && !timer_pending(timer)) {
+			int time_msec;
+
+			time_msec = (int)(runtime->period_size * 1000 / runtime->rate);
+			mod_timer(timer, jiffies + msecs_to_jiffies(time_msec));
+		}
+	}
+
+	return 0;
+}
+
+static int imx_rpmsg_pcm_preallocate_dma_buffer(struct snd_pcm *pcm,
+						int stream, int size)
+{
+	struct snd_pcm_substream *substream = pcm->streams[stream].substream;
+	struct snd_dma_buffer *buf = &substream->dma_buffer;
+
+	buf->dev.type = SNDRV_DMA_TYPE_DEV;
+	buf->dev.dev = pcm->card->dev;
+	buf->private_data = NULL;
+	buf->area = dma_alloc_wc(pcm->card->dev, size,
+				 &buf->addr, GFP_KERNEL);
+	if (!buf->area)
+		return -ENOMEM;
+
+	buf->bytes = size;
+	return 0;
+}
+
+static void imx_rpmsg_pcm_free_dma_buffers(struct snd_soc_component *component,
+					   struct snd_pcm *pcm)
+{
+	struct snd_pcm_substream *substream;
+	struct snd_dma_buffer *buf;
+	int stream;
+
+	for (stream = SNDRV_PCM_STREAM_PLAYBACK;
+	     stream < SNDRV_PCM_STREAM_LAST; stream++) {
+		substream = pcm->streams[stream].substream;
+		if (!substream)
+			continue;
+
+		buf = &substream->dma_buffer;
+		if (!buf->area)
+			continue;
+
+		dma_free_wc(pcm->card->dev, buf->bytes,
+			    buf->area, buf->addr);
+		buf->area = NULL;
+	}
+}
+
+static int imx_rpmsg_pcm_new(struct snd_soc_component *component,
+			     struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_card *card = rtd->card->snd_card;
+	struct snd_pcm *pcm = rtd->pcm;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct fsl_rpmsg *rpmsg = dev_get_drvdata(cpu_dai->dev);
+	int ret;
+
+	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
+	if (ret)
+		return ret;
+
+	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {
+		ret = imx_rpmsg_pcm_preallocate_dma_buffer(pcm, SNDRV_PCM_STREAM_PLAYBACK,
+							   rpmsg->buffer_size);
+		if (ret)
+			goto out;
+	}
+
+	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
+		ret = imx_rpmsg_pcm_preallocate_dma_buffer(pcm, SNDRV_PCM_STREAM_CAPTURE,
+							   rpmsg->buffer_size);
+		if (ret)
+			goto out;
+	}
+
+	imx_rpmsg_pcm_hardware.buffer_bytes_max = rpmsg->buffer_size;
+out:
+	/* free preallocated buffers in case of error */
+	if (ret)
+		imx_rpmsg_pcm_free_dma_buffers(component, pcm);
+
+	return ret;
+}
+
+static const struct snd_soc_component_driver imx_rpmsg_soc_component = {
+	.name		= IMX_PCM_DRV_NAME,
+	.pcm_construct	= imx_rpmsg_pcm_new,
+	.pcm_destruct	= imx_rpmsg_pcm_free_dma_buffers,
+	.open		= imx_rpmsg_pcm_open,
+	.close		= imx_rpmsg_pcm_close,
+	.hw_params	= imx_rpmsg_pcm_hw_params,
+	.hw_free	= imx_rpmsg_pcm_hw_free,
+	.trigger	= imx_rpmsg_pcm_trigger,
+	.pointer	= imx_rpmsg_pcm_pointer,
+	.mmap		= imx_rpmsg_pcm_mmap,
+	.ack		= imx_rpmsg_pcm_ack,
+	.prepare	= imx_rpmsg_pcm_prepare,
+};
+
+static void imx_rpmsg_pcm_work(struct work_struct *work)
+{
+	struct work_of_rpmsg *work_of_rpmsg;
+	bool is_notification = false;
+	struct rpmsg_info *info;
+	struct rpmsg_msg msg;
+	unsigned long flags;
+
+	work_of_rpmsg = container_of(work, struct work_of_rpmsg, work);
+	info = work_of_rpmsg->info;
+
+	/**
+	 * Every work in the work queue, first we check if there
+	 * is update for period is filled, because there may be not
+	 * enough data in M core side, need to let M core know
+	 * data is updated immediately.
+	 */
+	spin_lock_irqsave(&info->lock[TX], flags);
+	if (info->notify_updated[TX]) {
+		memcpy(&msg, &info->notify[TX], sizeof(struct rpmsg_s_msg));
+		info->notify_updated[TX] = false;
+		spin_unlock_irqrestore(&info->lock[TX], flags);
+		info->send_message(&msg, info);
+	} else {
+		spin_unlock_irqrestore(&info->lock[TX], flags);
+	}
+
+	spin_lock_irqsave(&info->lock[RX], flags);
+	if (info->notify_updated[RX]) {
+		memcpy(&msg, &info->notify[RX], sizeof(struct rpmsg_s_msg));
+		info->notify_updated[RX] = false;
+		spin_unlock_irqrestore(&info->lock[RX], flags);
+		info->send_message(&msg, info);
+	} else {
+		spin_unlock_irqrestore(&info->lock[RX], flags);
+	}
+
+	/* Skip the notification message for it has been processed above */
+	if (work_of_rpmsg->msg.s_msg.header.type == MSG_TYPE_C &&
+	    (work_of_rpmsg->msg.s_msg.header.cmd == TX_PERIOD_DONE ||
+	     work_of_rpmsg->msg.s_msg.header.cmd == RX_PERIOD_DONE))
+		is_notification = true;
+
+	if (!is_notification)
+		info->send_message(&work_of_rpmsg->msg, info);
+
+	/* update read index */
+	spin_lock_irqsave(&info->wq_lock, flags);
+	info->work_read_index++;
+	info->work_read_index %= WORK_MAX_NUM;
+	spin_unlock_irqrestore(&info->wq_lock, flags);
+}
+
+static int imx_rpmsg_pcm_probe(struct platform_device *pdev)
+{
+	struct snd_soc_component *component;
+	struct rpmsg_info *info;
+	int ret, i;
+
+	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, info);
+
+	info->rpdev = container_of(pdev->dev.parent, struct rpmsg_device, dev);
+	info->dev = &pdev->dev;
+	/* Setup work queue */
+	info->rpmsg_wq = alloc_ordered_workqueue("rpmsg_audio",
+						 WQ_HIGHPRI |
+						 WQ_UNBOUND |
+						 WQ_FREEZABLE);
+	if (!info->rpmsg_wq) {
+		dev_err(&pdev->dev, "workqueue create failed\n");
+		return -ENOMEM;
+	}
+
+	/* Write index initialize 1, make it differ with the read index */
+	info->work_write_index = 1;
+	info->send_message = imx_rpmsg_pcm_send_message;
+
+	for (i = 0; i < WORK_MAX_NUM; i++) {
+		INIT_WORK(&info->work_list[i].work, imx_rpmsg_pcm_work);
+		info->work_list[i].info = info;
+	}
+
+	/* Initialize msg */
+	for (i = 0; i < MSG_MAX_NUM; i++) {
+		info->msg[i].s_msg.header.cate  = IMX_RPMSG_AUDIO;
+		info->msg[i].s_msg.header.major = IMX_RMPSG_MAJOR;
+		info->msg[i].s_msg.header.minor = IMX_RMPSG_MINOR;
+		info->msg[i].s_msg.header.type  = MSG_TYPE_A;
+		info->msg[i].s_msg.param.audioindex = 0;
+	}
+
+	init_completion(&info->cmd_complete);
+	mutex_init(&info->msg_lock);
+	spin_lock_init(&info->lock[TX]);
+	spin_lock_init(&info->lock[RX]);
+	spin_lock_init(&info->wq_lock);
+
+	ret = devm_snd_soc_register_component(&pdev->dev,
+					      &imx_rpmsg_soc_component,
+					      NULL, 0);
+	if (ret)
+		goto fail;
+
+	component = snd_soc_lookup_component(&pdev->dev, IMX_PCM_DRV_NAME);
+	if (!component) {
+		ret = -EINVAL;
+		goto fail;
+	}
+#ifdef CONFIG_DEBUG_FS
+	component->debugfs_prefix = "rpmsg";
+#endif
+
+	return 0;
+
+fail:
+	if (info->rpmsg_wq)
+		destroy_workqueue(info->rpmsg_wq);
+
+	return ret;
+}
+
+static int imx_rpmsg_pcm_remove(struct platform_device *pdev)
+{
+	struct rpmsg_info *info = platform_get_drvdata(pdev);
+
+	if (info->rpmsg_wq)
+		destroy_workqueue(info->rpmsg_wq);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM
+static int imx_rpmsg_pcm_runtime_resume(struct device *dev)
+{
+	struct rpmsg_info *info = dev_get_drvdata(dev);
+
+	cpu_latency_qos_add_request(&info->pm_qos_req, 0);
+
+	return 0;
+}
+
+static int imx_rpmsg_pcm_runtime_suspend(struct device *dev)
+{
+	struct rpmsg_info *info = dev_get_drvdata(dev);
+
+	cpu_latency_qos_remove_request(&info->pm_qos_req);
+
+	return 0;
+}
+#endif
+
+#ifdef CONFIG_PM_SLEEP
+static int imx_rpmsg_pcm_suspend(struct device *dev)
+{
+	struct rpmsg_info *info = dev_get_drvdata(dev);
+	struct rpmsg_msg *rpmsg_tx;
+	struct rpmsg_msg *rpmsg_rx;
+
+	rpmsg_tx = &info->msg[TX_SUSPEND];
+	rpmsg_rx = &info->msg[RX_SUSPEND];
+
+	rpmsg_tx->s_msg.header.cmd = TX_SUSPEND;
+	info->send_message(rpmsg_tx, info);
+
+	rpmsg_rx->s_msg.header.cmd = RX_SUSPEND;
+	info->send_message(rpmsg_rx, info);
+
+	return 0;
+}
+
+static int imx_rpmsg_pcm_resume(struct device *dev)
+{
+	struct rpmsg_info *info = dev_get_drvdata(dev);
+	struct rpmsg_msg *rpmsg_tx;
+	struct rpmsg_msg *rpmsg_rx;
+
+	rpmsg_tx = &info->msg[TX_RESUME];
+	rpmsg_rx = &info->msg[RX_RESUME];
+
+	rpmsg_tx->s_msg.header.cmd = TX_RESUME;
+	info->send_message(rpmsg_tx, info);
+
+	rpmsg_rx->s_msg.header.cmd = RX_RESUME;
+	info->send_message(rpmsg_rx, info);
+
+	return 0;
+}
+#endif /* CONFIG_PM_SLEEP */
+
+static const struct dev_pm_ops imx_rpmsg_pcm_pm_ops = {
+	SET_RUNTIME_PM_OPS(imx_rpmsg_pcm_runtime_suspend,
+			   imx_rpmsg_pcm_runtime_resume,
+			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(imx_rpmsg_pcm_suspend,
+				imx_rpmsg_pcm_resume)
+};
+
+static struct platform_driver imx_pcm_rpmsg_driver = {
+	.probe  = imx_rpmsg_pcm_probe,
+	.remove	= imx_rpmsg_pcm_remove,
+	.driver = {
+		.name = IMX_PCM_DRV_NAME,
+		.pm = &imx_rpmsg_pcm_pm_ops,
+	},
+};
+module_platform_driver(imx_pcm_rpmsg_driver);
+
+MODULE_DESCRIPTION("Freescale SoC Audio RPMSG PCM interface");
+MODULE_AUTHOR("Shengjiu Wang <shengjiu.wang@nxp.com>");
+MODULE_ALIAS("platform:" IMX_PCM_DRV_NAME);
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/fsl/imx-pcm-rpmsg.h b/sound/soc/fsl/imx-pcm-rpmsg.h
new file mode 100644
index 000000000000..308d153920a3
--- /dev/null
+++ b/sound/soc/fsl/imx-pcm-rpmsg.h
@@ -0,0 +1,512 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2017-2021  NXP
+ *
+ ******************************************************************************
+ * Communication stack of audio with rpmsg
+ ******************************************************************************
+ * Packet structure:
+ *   A SRTM message consists of a 10 bytes header followed by 0~N bytes of data
+ *
+ *   +---------------+-------------------------------+
+ *   |               |            Content            |
+ *   +---------------+-------------------------------+
+ *   |  Byte Offset  | 7   6   5   4   3   2   1   0 |
+ *   +---------------+---+---+---+---+---+---+---+---+
+ *   |       0       |           Category            |
+ *   +---------------+---+---+---+---+---+---+---+---+
+ *   |     1 ~ 2     |           Version             |
+ *   +---------------+---+---+---+---+---+---+---+---+
+ *   |       3       |             Type              |
+ *   +---------------+---+---+---+---+---+---+---+---+
+ *   |       4       |           Command             |
+ *   +---------------+---+---+---+---+---+---+---+---+
+ *   |       5       |           Reserved0           |
+ *   +---------------+---+---+---+---+---+---+---+---+
+ *   |       6       |           Reserved1           |
+ *   +---------------+---+---+---+---+---+---+---+---+
+ *   |       7       |           Reserved2           |
+ *   +---------------+---+---+---+---+---+---+---+---+
+ *   |       8       |           Reserved3           |
+ *   +---------------+---+---+---+---+---+---+---+---+
+ *   |       9       |           Reserved4           |
+ *   +---------------+---+---+---+---+---+---+---+---+
+ *   |       10      |            DATA 0             |
+ *   +---------------+---+---+---+---+---+---+---+---+
+ *   :   :   :   :   :   :   :   :   :   :   :   :   :
+ *   +---------------+---+---+---+---+---+---+---+---+
+ *   |   N + 10 - 1  |            DATA N-1           |
+ *   +---------------+---+---+---+---+---+---+---+---+
+ *
+ *   +----------+------------+------------------------------------------------+
+ *   |  Field   |    Byte    |                                                |
+ *   +----------+------------+------------------------------------------------+
+ *   | Category |     0      | The destination category.                      |
+ *   +----------+------------+------------------------------------------------+
+ *   | Version  |   1 ~ 2    | The category version of the sender of the      |
+ *   |          |            | packet.                                        |
+ *   |          |            | The first byte represent the major version of  |
+ *   |          |            | the packet.The second byte represent the minor |
+ *   |          |            | version of the packet.                         |
+ *   +----------+------------+------------------------------------------------+
+ *   |  Type    |     3      | The message type of current message packet.    |
+ *   +----------+------------+------------------------------------------------+
+ *   | Command  |     4      | The command byte sent to remote processor/SoC. |
+ *   +----------+------------+------------------------------------------------+
+ *   | Reserved |   5 ~ 9    | Reserved field for future extension.           |
+ *   +----------+------------+------------------------------------------------+
+ *   | Data     |     N      | The data payload of the message packet.        |
+ *   +----------+------------+------------------------------------------------+
+ *
+ * Audio control:
+ *   SRTM Audio Control Category Request Command Table:
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   | Category | Version | Type | Command | Data                          | Function              |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x00 |  0x00   | Data[0]: Audio Device Index   | Open a TX Instance.   |
+ *   |          |         |      |         | Data[1]:     format           |                       |
+ *   |          |         |      |         | Data[2]:     channels         |                       |
+ *   |          |         |      |         | Data[3-6]:   samplerate       |                       |
+ *   |          |         |      |         | Data[7-10]:  buffer_addr      |                       |
+ *   |          |         |      |         | Data[11-14]: buffer_size      |                       |
+ *   |          |         |      |         | Data[15-18]: period_size      |                       |
+ *   |          |         |      |         | Data[19-22]: buffer_tail      |                       |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x00 |  0x01   | Data[0]: Audio Device Index   | Start a TX Instance.  |
+ *   |          |         |      |         | Same as above command         |                       |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x00 |  0x02   | Data[0]: Audio Device Index   | Pause a TX Instance.  |
+ *   |          |         |      |         | Same as above command         |                       |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x00 |  0x03   | Data[0]: Audio Device Index   | Resume a TX Instance. |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x00 |  0x04   | Data[0]: Audio Device Index   | Stop a TX Instance.   |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x00 |  0x05   | Data[0]: Audio Device Index   | Close a TX Instance.  |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x00 |  0x06   | Data[0]: Audio Device Index   | Set Parameters for    |
+ *   |          |         |      |         | Data[1]:     format           | a TX Instance.        |
+ *   |          |         |      |         | Data[2]:     channels         |                       |
+ *   |          |         |      |         | Data[3-6]:   samplerate       |                       |
+ *   |          |         |      |         | Data[7-22]:  reserved         |                       |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x00 |  0x07   | Data[0]: Audio Device Index   | Set TX Buffer.        |
+ *   |          |         |      |         | Data[1-6]:   reserved         |                       |
+ *   |          |         |      |         | Data[7-10]:  buffer_addr      |                       |
+ *   |          |         |      |         | Data[11-14]: buffer_size      |                       |
+ *   |          |         |      |         | Data[15-18]: period_size      |                       |
+ *   |          |         |      |         | Data[19-22]: buffer_tail      |                       |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x00 |  0x08   | Data[0]: Audio Device Index   | Suspend a TX Instance |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x00 |  0x09   | Data[0]: Audio Device Index   | Resume a TX Instance. |
+ *   |          |         |      |         | Data[1]:     format           |                       |
+ *   |          |         |      |         | Data[2]:     channels         |                       |
+ *   |          |         |      |         | Data[3-6]:   samplerate       |                       |
+ *   |          |         |      |         | Data[7-10]:  buffer_addr      |                       |
+ *   |          |         |      |         | Data[11-14]: buffer_size      |                       |
+ *   |          |         |      |         | Data[15-18]: period_size      |                       |
+ *   |          |         |      |         | Data[19-22]: buffer_tail      |                       |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x00 |  0x0A   | Data[0]: Audio Device Index   | Open a RX Instance.   |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x00 |  0x0B   | Data[0]: Audio Device Index   | Start a RX Instance.  |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x00 |  0x0C   | Data[0]: Audio Device Index   | Pause a RX Instance.  |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x00 |  0x0D   | Data[0]: Audio Device Index   | Resume a RX Instance. |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x00 |  0x0E   | Data[0]: Audio Device Index   | Stop a RX Instance.   |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x00 |  0x0F   | Data[0]: Audio Device Index   | Close a RX Instance.  |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x00 |  0x10   | Data[0]: Audio Device Index   | Set Parameters for    |
+ *   |          |         |      |         | Data[1]:     format           | a RX Instance.        |
+ *   |          |         |      |         | Data[2]:     channels         |                       |
+ *   |          |         |      |         | Data[3-6]:   samplerate       |                       |
+ *   |          |         |      |         | Data[7-22]:  reserved         |                       |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x00 |  0x11   | Data[0]: Audio Device Index   | Set RX Buffer.        |
+ *   |          |         |      |         | Data[1-6]:   reserved         |                       |
+ *   |          |         |      |         | Data[7-10]:  buffer_addr      |                       |
+ *   |          |         |      |         | Data[11-14]: buffer_size      |                       |
+ *   |          |         |      |         | Data[15-18]: period_size      |                       |
+ *   |          |         |      |         | Data[19-22]: buffer_tail      |                       |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x00 |  0x12   | Data[0]: Audio Device Index   | Suspend a RX Instance.|
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x00 |  0x13   | Data[0]: Audio Device Index   | Resume a RX Instance. |
+ *   |          |         |      |         | Data[1]:     format           |                       |
+ *   |          |         |      |         | Data[2]:     channels         |                       |
+ *   |          |         |      |         | Data[3-6]:   samplerate       |                       |
+ *   |          |         |      |         | Data[7-10]:  buffer_addr      |                       |
+ *   |          |         |      |         | Data[11-14]: buffer_size      |                       |
+ *   |          |         |      |         | Data[15-18]: period_size      |                       |
+ *   |          |         |      |         | Data[19-22]: buffer_tail      |                       |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x00 |  0x14   | Data[0]: Audio Device Index   | Set register value    |
+ *   |          |         |      |         | Data[1-6]:   reserved         | to codec              |
+ *   |          |         |      |         | Data[7-10]:  register         |                       |
+ *   |          |         |      |         | Data[11-14]: value            |                       |
+ *   |          |         |      |         | Data[15-22]: reserved         |                       |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x00 |  0x15   | Data[0]: Audio Device Index   | Get register value    |
+ *   |          |         |      |         | Data[1-6]:   reserved         | from codec            |
+ *   |          |         |      |         | Data[7-10]:  register         |                       |
+ *   |          |         |      |         | Data[11-22]: reserved         |                       |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   Note 1: See <List of Sample Format> for available value of
+ *           Sample Format;
+ *   Note 2: See <List of Audio Channels> for available value of Channels;
+ *   Note 3: Sample Rate of Set Parameters for an Audio TX Instance
+ *           Command and Set Parameters for an Audio RX Instance Command is
+ *           in little-endian format.
+ *
+ *   SRTM Audio Control Category Response Command Table:
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   | Category | Version | Type | Command | Data                          | Function              |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x01 |  0x00   | Data[0]: Audio Device Index   | Reply for Open        |
+ *   |          |         |      |         | Data[1]: Return code          | a TX Instance         |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x01 |  0x01   | Data[0]: Audio Device Index   | Reply for Start       |
+ *   |          |         |      |         | Data[1]: Return code          | a TX Instance         |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x01 |  0x02   | Data[0]: Audio Device Index   | Reply for Pause       |
+ *   |          |         |      |         | Data[1]: Return code          | a TX Instance         |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x01 |  0x03   | Data[0]: Audio Device Index   | Reply for Resume      |
+ *   |          |         |      |         | Data[1]: Return code          | a TX Instance         |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x01 |  0x04   | Data[0]: Audio Device Index   | Reply for Stop        |
+ *   |          |         |      |         | Data[1]: Return code          | a TX Instance         |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x01 |  0x05   | Data[0]: Audio Device Index   | Reply for Close       |
+ *   |          |         |      |         | Data[1]: Return code          | a TX Instance         |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x01 |  0x06   | Data[0]: Audio Device Index   | Reply for Set Param   |
+ *   |          |         |      |         | Data[1]: Return code          | for a TX Instance.    |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x01 |  0x07   | Data[0]: Audio Device Index   | Reply for Set         |
+ *   |          |         |      |         | Data[1]: Return code          | TX Buffer             |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x01 |  0x08   | Data[0]: Audio Device Index   | Reply for Suspend     |
+ *   |          |         |      |         | Data[1]: Return code          | a TX Instance         |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x01 |  0x09   | Data[0]: Audio Device Index   | Reply for Resume      |
+ *   |          |         |      |         | Data[1]: Return code          | a TX Instance         |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x01 |  0x0A   | Data[0]: Audio Device Index   | Reply for Open        |
+ *   |          |         |      |         | Data[1]: Return code          | a TX Instance         |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x01 |  0x0B   | Data[0]: Audio Device Index   | Reply for Start       |
+ *   |          |         |      |         | Data[1]: Return code          | a TX Instance         |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x01 |  0x0C   | Data[0]: Audio Device Index   | Reply for Pause       |
+ *   |          |         |      |         | Data[1]: Return code          | a TX Instance         |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x01 |  0x0D   | Data[0]: Audio Device Index   | Reply for Resume      |
+ *   |          |         |      |         | Data[1]: Return code          | a RX Instance         |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x01 |  0x0E   | Data[0]: Audio Device Index   | Reply for Stop        |
+ *   |          |         |      |         | Data[1]: Return code          | a RX Instance         |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x01 |  0x0F   | Data[0]: Audio Device Index   | Reply for Close       |
+ *   |          |         |      |         | Data[1]: Return code          | a RX Instance         |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x01 |  0x10   | Data[0]: Audio Device Index   | Reply for Set Param   |
+ *   |          |         |      |         | Data[1]: Return code          | for a RX Instance.    |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x01 |  0x11   | Data[0]: Audio Device Index   | Reply for Set         |
+ *   |          |         |      |         | Data[1]: Return code          | RX Buffer             |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x01 |  0x12   | Data[0]: Audio Device Index   | Reply for Suspend     |
+ *   |          |         |      |         | Data[1]: Return code          | a RX Instance         |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x01 |  0x13   | Data[0]: Audio Device Index   | Reply for Resume      |
+ *   |          |         |      |         | Data[1]: Return code          | a RX Instance         |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x01 |  0x14   | Data[0]: Audio Device Index   | Reply for Set codec   |
+ *   |          |         |      |         | Data[1]: Return code          | register value        |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x01 |  0x15   | Data[0]: Audio Device Index   | Reply for Get codec   |
+ *   |          |         |      |         | Data[1]: Return code          | register value        |
+ *   |          |         |      |         | Data[2-6]:   reserved         |                       |
+ *   |          |         |      |         | Data[7-10]:  register         |                       |
+ *   |          |         |      |         | Data[11-14]: value            |                       |
+ *   |          |         |      |         | Data[15-22]: reserved         |                       |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *
+ *   SRTM Audio Control Category Notification Command Table:
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   | Category | Version | Type | Command | Data                          | Function              |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x02 |  0x00   | Data[0]: Audio Device Index   | Notify one TX period  |
+ *   |          |         |      |         |                               | is finished           |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *   |  0x03    | 0x0100  | 0x02 |  0x01   | Data[0]: Audio Device Index   | Notify one RX period  |
+ *   |          |         |      |         |                               | is finished           |
+ *   +----------+---------+------+---------+-------------------------------+-----------------------+
+ *
+ *   List of Sample Format:
+ *   +------------------+-----------------------+
+ *   | Sample Format    |   Description         |
+ *   +------------------+-----------------------+
+ *   |       0x0        | S16_LE                |
+ *   +------------------+-----------------------+
+ *   |       0x1        | S24_LE                |
+ *   +------------------+-----------------------+
+ *
+ *   List of Audio Channels
+ *   +------------------+-----------------------+
+ *   |  Audio Channel   |   Description         |
+ *   +------------------+-----------------------+
+ *   |       0x0        | Left Channel          |
+ *   +------------------+-----------------------+
+ *   |       0x1        | Right Channel         |
+ *   +------------------+---------------- ------+
+ *   |       0x2        | Left & Right Channel  |
+ *   +------------------+-----------------------+
+ *
+ */
+
+#ifndef _IMX_PCM_RPMSG_H
+#define _IMX_PCM_RPMSG_H
+
+#include <linux/pm_qos.h>
+#include <linux/interrupt.h>
+#include <sound/dmaengine_pcm.h>
+
+#define RPMSG_TIMEOUT 1000
+
+/* RPMSG Command (TYPE A)*/
+#define TX_OPEN		0x0
+#define	TX_START	0x1
+#define	TX_PAUSE	0x2
+#define	TX_RESTART	0x3
+#define	TX_TERMINATE	0x4
+#define	TX_CLOSE	0x5
+#define TX_HW_PARAM	0x6
+#define	TX_BUFFER	0x7
+#define	TX_SUSPEND	0x8
+#define	TX_RESUME	0x9
+
+#define	RX_OPEN		0xA
+#define	RX_START	0xB
+#define	RX_PAUSE	0xC
+#define	RX_RESTART	0xD
+#define	RX_TERMINATE	0xE
+#define	RX_CLOSE	0xF
+#define	RX_HW_PARAM	0x10
+#define	RX_BUFFER	0x11
+#define	RX_SUSPEND	0x12
+#define	RX_RESUME	0x13
+#define SET_CODEC_VALUE 0x14
+#define GET_CODEC_VALUE 0x15
+#define	TX_POINTER	0x16
+#define	RX_POINTER	0x17
+/* Total msg numver for type A */
+#define MSG_TYPE_A_NUM  0x18
+
+/* RPMSG Command (TYPE C)*/
+#define	TX_PERIOD_DONE	0x0
+#define	RX_PERIOD_DONE	0x1
+/* Total msg numver for type C */
+#define MSG_TYPE_C_NUM  0x2
+
+#define MSG_MAX_NUM     (MSG_TYPE_A_NUM + MSG_TYPE_C_NUM)
+
+#define MSG_TYPE_A	0x0
+#define MSG_TYPE_B	0x1
+#define MSG_TYPE_C	0x2
+
+#define RESP_NONE		0x0
+#define RESP_NOT_ALLOWED	0x1
+#define	RESP_SUCCESS		0x2
+#define	RESP_FAILED		0x3
+
+#define	RPMSG_S16_LE		0x0
+#define	RPMSG_S24_LE		0x1
+#define	RPMSG_S32_LE		0x2
+#define	RPMSG_DSD_U16_LE	0x3
+#define	RPMSG_DSD_U24_LE	0x4
+#define	RPMSG_DSD_U32_LE	0x5
+
+#define	RPMSG_CH_LEFT		0x0
+#define	RPMSG_CH_RIGHT		0x1
+#define	RPMSG_CH_STEREO		0x2
+
+#define WORK_MAX_NUM    0x30
+
+/* Category define */
+#define IMX_RMPSG_LIFECYCLE     1
+#define IMX_RPMSG_PMIC          2
+#define IMX_RPMSG_AUDIO         3
+#define IMX_RPMSG_KEY           4
+#define IMX_RPMSG_GPIO          5
+#define IMX_RPMSG_RTC           6
+#define IMX_RPMSG_SENSOR        7
+
+/* rpmsg version */
+#define IMX_RMPSG_MAJOR         1
+#define IMX_RMPSG_MINOR         0
+
+#define TX SNDRV_PCM_STREAM_PLAYBACK
+#define RX SNDRV_PCM_STREAM_CAPTURE
+
+/**
+ * struct rpmsg_head: rpmsg header structure
+ *
+ * @cate: category
+ * @major: major version
+ * @minor: minor version
+ * @type: message type (A/B/C)
+ * @cmd: message command
+ * @reserved: reserved space
+ */
+struct rpmsg_head {
+	u8 cate;
+	u8 major;
+	u8 minor;
+	u8 type;
+	u8 cmd;
+	u8 reserved[5];
+} __packed;
+
+/**
+ * struct param_s: sent rpmsg parameter
+ *
+ * @audioindex: audio instance index
+ * @format: audio format
+ * @channels: audio channel number
+ * @rate: sample rate
+ * @buffer_addr: dma buffer physical address or register for SET_CODEC_VALUE
+ * @buffer_size: dma buffer size or register value for SET_CODEC_VALUE
+ * @period_size: period size
+ * @buffer_tail: current period index
+ */
+struct param_s {
+	unsigned char audioindex;
+	unsigned char format;
+	unsigned char channels;
+	unsigned int  rate;
+	unsigned int  buffer_addr;
+	unsigned int  buffer_size;
+	unsigned int  period_size;
+	unsigned int  buffer_tail;
+} __packed;
+
+/**
+ * struct param_s: send rpmsg parameter
+ *
+ * @audioindex: audio instance index
+ * @resp: response value
+ * @reserved1: reserved space
+ * @buffer_offset: the consumed offset of buffer
+ * @reg_addr: register addr of codec
+ * @reg_data: register value of codec
+ * @reserved2: reserved space
+ * @buffer_tail: current period index
+ */
+struct param_r {
+	unsigned char audioindex;
+	unsigned char resp;
+	unsigned char reserved1[1];
+	unsigned int  buffer_offset;
+	unsigned int  reg_addr;
+	unsigned int  reg_data;
+	unsigned char reserved2[4];
+	unsigned int  buffer_tail;
+} __packed;
+
+/* Struct of sent message */
+struct rpmsg_s_msg {
+	struct rpmsg_head header;
+	struct param_s    param;
+};
+
+/* Struct of received message */
+struct rpmsg_r_msg {
+	struct rpmsg_head header;
+	struct param_r    param;
+};
+
+/* Struct of rpmsg */
+struct rpmsg_msg {
+	struct rpmsg_s_msg  s_msg;
+	struct rpmsg_r_msg  r_msg;
+};
+
+/* Struct of rpmsg for workqueue */
+struct work_of_rpmsg {
+	struct rpmsg_info   *info;
+	/* Sent msg for each work */
+	struct rpmsg_msg    msg;
+	struct work_struct  work;
+};
+
+/* Struct of timer */
+struct stream_timer {
+	struct timer_list   timer;
+	struct rpmsg_info   *info;
+	struct snd_pcm_substream *substream;
+};
+
+typedef void (*dma_callback)(void *arg);
+
+/**
+ * struct rpmsg_info: rpmsg audio information
+ *
+ * @rpdev: pointer of rpmsg_device
+ * @dev: pointer for imx_pcm_rpmsg device
+ * @cmd_complete: command is finished
+ * @pm_qos_req: request of pm qos
+ * @r_msg: received rpmsg
+ * @msg: array of rpmsg
+ * @notify: notification msg (type C) for TX & RX
+ * @notify_updated: notification flag for TX & RX
+ * @rpmsg_wq: rpmsg workqueue
+ * @work_list: array of work list for workqueue
+ * @work_write_index: write index of work list
+ * @work_read_index: read index of work list
+ * @msg_drop_count: counter of dropped msg for TX & RX
+ * @num_period: period number for TX & RX
+ * @callback_param: parameter for period elapse callback for TX & RX
+ * @callback: period elapse callback for TX & RX
+ * @send_message: function pointer for send message
+ * @lock: spin lock for TX & RX
+ * @wq_lock: lock for work queue
+ * @msg_lock: lock for send message
+ * @stream_timer: timer for tigger workqueue
+ */
+struct rpmsg_info {
+	struct rpmsg_device      *rpdev;
+	struct device            *dev;
+	struct completion        cmd_complete;
+	struct pm_qos_request    pm_qos_req;
+
+	/* Received msg (global) */
+	struct rpmsg_r_msg       r_msg;
+	struct rpmsg_msg         msg[MSG_MAX_NUM];
+	/* period done */
+	struct rpmsg_msg         notify[2];
+	bool                     notify_updated[2];
+
+	struct workqueue_struct  *rpmsg_wq;
+	struct work_of_rpmsg	 work_list[WORK_MAX_NUM];
+	int                      work_write_index;
+	int                      work_read_index;
+	int                      msg_drop_count[2];
+	int                      num_period[2];
+	void                     *callback_param[2];
+	dma_callback             callback[2];
+	int (*send_message)(struct rpmsg_msg *msg, struct rpmsg_info *info);
+	spinlock_t               lock[2]; /* spin lock for resource protection */
+	spinlock_t               wq_lock; /* spin lock for resource protection */
+	struct mutex             msg_lock; /* mutex for resource protection */
+	struct stream_timer      stream_timer[2];
+};
+
+#define IMX_PCM_DRV_NAME "imx_pcm_rpmsg"
+
+#endif /* IMX_PCM_RPMSG_H */
-- 
2.27.0

