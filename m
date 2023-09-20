Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C83557A78DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 12:15:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrDtn4mGRz3cjk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 20:15:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrDmb49pBz3cDr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 20:10:07 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CC48A201BC7;
	Wed, 20 Sep 2023 12:10:04 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 12324201BFF;
	Wed, 20 Sep 2023 12:10:03 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 76FF8180327D;
	Wed, 20 Sep 2023 18:10:01 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: hverkuil@xs4all.nl,
	sakari.ailus@iki.fi,
	tfiga@chromium.org,
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
Subject: [RFC PATCH v4 11/11] media: imx-asrc: Add memory to memory driver
Date: Wed, 20 Sep 2023 17:32:50 +0800
Message-Id: <1695202370-24678-12-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1695202370-24678-1-git-send-email-shengjiu.wang@nxp.com>
References: <1695202370-24678-1-git-send-email-shengjiu.wang@nxp.com>
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

Implement the ASRC memory to memory function using
the v4l2 framework, user can use this function with
v4l2 ioctl interface.

User send the output and capture buffer to driver and
driver store the converted data to the capture buffer.

This feature can be shared by ASRC and EASRC drivers

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/media/platform/nxp/Kconfig    |   12 +
 drivers/media/platform/nxp/Makefile   |    1 +
 drivers/media/platform/nxp/imx-asrc.c | 1058 +++++++++++++++++++++++++
 3 files changed, 1071 insertions(+)
 create mode 100644 drivers/media/platform/nxp/imx-asrc.c

diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index 40e3436669e2..8234644ee341 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -67,3 +67,15 @@ config VIDEO_MX2_EMMAPRP
 
 source "drivers/media/platform/nxp/dw100/Kconfig"
 source "drivers/media/platform/nxp/imx-jpeg/Kconfig"
+
+config VIDEO_IMX_ASRC
+	tristate "NXP i.MX ASRC M2M support"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on MEDIA_SUPPORT
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_MEM2MEM_DEV
+	help
+	    Say Y if you want to add ASRC M2M support for NXP CPUs.
+	    It is a complement for ASRC M2P and ASRC P2M features.
+	    This option is only useful for out-of-tree drivers since
+	    in-tree drivers select it automatically.
diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
index 4d90eb713652..1325675e34f5 100644
--- a/drivers/media/platform/nxp/Makefile
+++ b/drivers/media/platform/nxp/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
 obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
 obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
 obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
+obj-$(CONFIG_VIDEO_IMX_ASRC) += imx-asrc.o
diff --git a/drivers/media/platform/nxp/imx-asrc.c b/drivers/media/platform/nxp/imx-asrc.c
new file mode 100644
index 000000000000..21079c7abd27
--- /dev/null
+++ b/drivers/media/platform/nxp/imx-asrc.c
@@ -0,0 +1,1058 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (C) 2014-2016 Freescale Semiconductor, Inc.
+// Copyright (C) 2019-2023 NXP
+//
+// Freescale ASRC Memory to Memory (M2M) driver
+
+#include <linux/dma/imx-dma.h>
+#include <linux/pm_runtime.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-dma-contig.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/fsl_asrc_common.h>
+
+#define V4L_CAP OUT
+#define V4L_OUT IN
+
+/* Flags that indicate a format can be used for capture/output */
+#define MEM2MEM_CAPTURE	BIT(0)
+#define MEM2MEM_OUTPUT	BIT(1)
+
+#define ASRC_xPUT_DMA_CALLBACK(dir) \
+	(((dir) == V4L_OUT) ? asrc_input_dma_callback \
+	: asrc_output_dma_callback)
+
+#define DIR_STR(dir) (dir) == V4L_OUT ? "out" : "cap"
+
+#define ASRC_M2M_BUFFER_SIZE (512 * 1024)
+#define ASRC_M2M_PERIOD_SIZE (48 * 1024)
+#define ASRC_M2M_SG_NUM (20)
+
+struct asrc_pair_m2m {
+	struct fsl_asrc_pair *pair;
+	struct asrc_m2m *m2m;
+	struct v4l2_fh fh;
+	struct v4l2_ctrl_handler ctrl_handler;
+};
+
+struct asrc_m2m {
+	struct fsl_asrc *asrc;
+	struct v4l2_device v4l2_dev;
+	struct v4l2_m2m_dev *m2m_dev;
+	struct video_device *dec_vdev;
+	struct mutex mlock; /* v4l2 ioctls serialization */
+	struct platform_device *pdev;
+};
+
+struct asrc_fmt {
+	u32	fourcc;
+	u32     types;
+};
+
+static struct asrc_fmt formats[] = {
+	{
+		.fourcc = V4L2_AUDIO_FMT_LPCM,
+		.types  = MEM2MEM_CAPTURE | MEM2MEM_OUTPUT,
+	},
+};
+
+#define NUM_FORMATS ARRAY_SIZE(formats)
+
+static inline struct asrc_pair_m2m *asrc_m2m_fh_to_ctx(struct v4l2_fh *fh)
+{
+	return container_of(fh, struct asrc_pair_m2m, fh);
+}
+
+/**
+ * asrc_read_last_fifo: read all the remaining data from FIFO
+ *	@pair: Structure pointer of fsl_asrc_pair
+ *	@dma_vaddr: virtual address of capture buffer
+ *	@length: payload length of capture buffer
+ */
+static void asrc_read_last_fifo(struct fsl_asrc_pair *pair, void *dma_vaddr, u32 *length)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	enum asrc_pair_index index = pair->index;
+	u32 i, reg, size, t_size = 0, width;
+	u32 *reg32 = NULL;
+	u16 *reg16 = NULL;
+	u8  *reg24 = NULL;
+
+	width = snd_pcm_format_physical_width(pair->sample_format[V4L_CAP]);
+	if (width == 32)
+		reg32 = dma_vaddr + *length;
+	else if (width == 16)
+		reg16 = dma_vaddr + *length;
+	else
+		reg24 = dma_vaddr + *length;
+retry:
+	size = asrc->get_output_fifo_size(pair);
+	if (size + *length > ASRC_M2M_BUFFER_SIZE)
+		goto end;
+
+	for (i = 0; i < size * pair->channels; i++) {
+		regmap_read(asrc->regmap, asrc->get_fifo_addr(OUT, index), &reg);
+		if (reg32) {
+			*(reg32) = reg;
+			reg32++;
+		} else if (reg16) {
+			*(reg16) = (u16)reg;
+			reg16++;
+		} else {
+			*reg24++ = (u8)reg;
+			*reg24++ = (u8)(reg >> 8);
+			*reg24++ = (u8)(reg >> 16);
+		}
+	}
+	t_size += size;
+
+	/* In case there is data left in FIFO */
+	if (size)
+		goto retry;
+end:
+	/* Update payload length */
+	if (reg32)
+		*length += t_size * pair->channels * 4;
+	else if (reg16)
+		*length += t_size * pair->channels * 2;
+	else
+		*length += t_size * pair->channels * 3;
+}
+
+static int asrc_m2m_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct asrc_pair_m2m *pair_m2m = vb2_get_drv_priv(q);
+	struct fsl_asrc_pair *pair = pair_m2m->pair;
+	struct asrc_m2m *m2m = pair_m2m->m2m;
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &m2m->pdev->dev;
+	struct vb2_v4l2_buffer *buf;
+	bool request_flag = false;
+	int ret;
+
+	dev_dbg(dev, "Start streaming pair=%p, %d\n", pair, q->type);
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to power up asrc\n");
+		goto err_pm_runtime;
+	}
+
+	/* Request asrc pair/context */
+	if (!pair->req_pair) {
+		/* flag for error handler of this function */
+		request_flag = true;
+
+		ret = asrc->request_pair(pair->channels, pair);
+		if (ret) {
+			dev_err(dev, "failed to request pair: %d\n", ret);
+			goto err_request_pair;
+		}
+
+		ret = asrc->m2m_start_part_one(pair);
+		if (ret) {
+			dev_err(dev, "failed to start pair part one: %d\n", ret);
+			goto err_start_part_one;
+		}
+
+		pair->req_pair = true;
+	}
+
+	/* Request dma channels */
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		pair->dma_chan[V4L_OUT] = asrc->get_dma_channel(pair, IN);
+		if (!pair->dma_chan[V4L_OUT]) {
+			dev_err(dev, "[ctx%d] failed to get input DMA channel\n", pair->index);
+			ret = -EBUSY;
+			goto err_dma_channel;
+		}
+	} else {
+		pair->dma_chan[V4L_CAP] = asrc->get_dma_channel(pair, OUT);
+		if (!pair->dma_chan[V4L_CAP]) {
+			dev_err(dev, "[ctx%d] failed to get output DMA channel\n", pair->index);
+			ret = -EBUSY;
+			goto err_dma_channel;
+		}
+	}
+
+	v4l2_m2m_update_start_streaming_state(pair_m2m->fh.m2m_ctx, q);
+
+	return 0;
+
+err_dma_channel:
+	if (request_flag && asrc->m2m_stop_part_one)
+		asrc->m2m_stop_part_one(pair);
+err_start_part_one:
+	if (request_flag)
+		asrc->release_pair(pair);
+err_request_pair:
+	pm_runtime_put_sync(dev);
+err_pm_runtime:
+	/* Release buffers */
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		while ((buf = v4l2_m2m_src_buf_remove(pair_m2m->fh.m2m_ctx)))
+			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
+	} else {
+		while ((buf = v4l2_m2m_dst_buf_remove(pair_m2m->fh.m2m_ctx)))
+			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
+	}
+	return ret;
+}
+
+static void asrc_m2m_stop_streaming(struct vb2_queue *q)
+{
+	struct asrc_pair_m2m *pair_m2m = vb2_get_drv_priv(q);
+	struct asrc_m2m *m2m = pair_m2m->m2m;
+	struct fsl_asrc_pair *pair = pair_m2m->pair;
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &m2m->pdev->dev;
+
+	dev_dbg(dev, "Stop streaming pair=%p, %d\n", pair, q->type);
+
+	v4l2_m2m_update_stop_streaming_state(pair_m2m->fh.m2m_ctx, q);
+
+	/* Stop & release pair/context */
+	if (asrc->m2m_stop_part_two)
+		asrc->m2m_stop_part_two(pair);
+
+	if (pair->req_pair) {
+		if (asrc->m2m_stop_part_one)
+			asrc->m2m_stop_part_one(pair);
+		asrc->release_pair(pair);
+		pair->req_pair = false;
+	}
+
+	/* Release dma channel */
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		if (pair->dma_chan[V4L_OUT])
+			dma_release_channel(pair->dma_chan[V4L_OUT]);
+	} else {
+		if (pair->dma_chan[V4L_CAP])
+			dma_release_channel(pair->dma_chan[V4L_CAP]);
+	}
+
+	pm_runtime_put_sync(dev);
+}
+
+static int asrc_m2m_queue_setup(struct vb2_queue *q,
+				unsigned int *num_buffers, unsigned int *num_planes,
+				unsigned int sizes[], struct device *alloc_devs[])
+{
+	struct asrc_pair_m2m *pair_m2m = vb2_get_drv_priv(q);
+	struct fsl_asrc_pair *pair = pair_m2m->pair;
+
+	/* single buffer */
+	*num_planes = 1;
+
+	/*
+	 * The capture buffer size depends on output buffer size
+	 * and the convert ratio.
+	 *
+	 * Here just use a fix length for capture and output buffer.
+	 * User need to care about it.
+	 */
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
+		sizes[0] = pair->buf_len[V4L_OUT];
+	else
+		sizes[0] = pair->buf_len[V4L_CAP];
+
+	return 0;
+}
+
+static void asrc_m2m_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct asrc_pair_m2m *pair_m2m = vb2_get_drv_priv(vb->vb2_queue);
+
+	/* queue buffer */
+	v4l2_m2m_buf_queue(pair_m2m->fh.m2m_ctx, vbuf);
+}
+
+static const struct vb2_ops asrc_m2m_qops = {
+	.wait_prepare		= vb2_ops_wait_prepare,
+	.wait_finish		= vb2_ops_wait_finish,
+	.start_streaming	= asrc_m2m_start_streaming,
+	.stop_streaming		= asrc_m2m_stop_streaming,
+	.queue_setup		= asrc_m2m_queue_setup,
+	.buf_queue		= asrc_m2m_buf_queue,
+};
+
+/* Init video buffer queue for src and dst. */
+static int asrc_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
+			       struct vb2_queue *dst_vq)
+{
+	struct asrc_pair_m2m *pair_m2m = priv;
+	struct asrc_m2m *m2m = pair_m2m->m2m;
+	int ret;
+
+	src_vq->type = V4L2_BUF_TYPE_AUDIO_OUTPUT;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->drv_priv = pair_m2m;
+	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	src_vq->ops = &asrc_m2m_qops;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->lock = &m2m->mlock;
+	src_vq->dev = &m2m->pdev->dev;
+	src_vq->min_buffers_needed = 1;
+
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->type = V4L2_BUF_TYPE_AUDIO_CAPTURE;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	dst_vq->drv_priv = pair_m2m;
+	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	dst_vq->ops = &asrc_m2m_qops;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->lock = &m2m->mlock;
+	dst_vq->dev = &m2m->pdev->dev;
+	dst_vq->min_buffers_needed = 1;
+
+	ret = vb2_queue_init(dst_vq);
+	return ret;
+}
+
+static int asrc_m2m_op_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct asrc_pair_m2m *pair_m2m =
+		container_of(ctrl->handler, struct asrc_pair_m2m, ctrl_handler);
+	struct fsl_asrc_pair *pair = pair_m2m->pair;
+	struct fsl_asrc *asrc = pair->asrc;
+	int ret = 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_USER_IMX_ASRC_RATIO_MOD:
+		if (asrc->m2m_set_ratio_mod)
+			asrc->m2m_set_ratio_mod(pair, ctrl->val);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops asrc_m2m_ctrl_ops = {
+	.s_ctrl = asrc_m2m_op_s_ctrl,
+};
+
+/* system callback for open() */
+static int asrc_m2m_open(struct file *file)
+{
+	struct asrc_m2m *m2m = video_drvdata(file);
+	struct fsl_asrc *asrc = m2m->asrc;
+	struct video_device *vdev = video_devdata(file);
+	struct fsl_asrc_pair *pair;
+	struct asrc_pair_m2m *pair_m2m;
+	int ret = 0;
+
+	if (mutex_lock_interruptible(&m2m->mlock))
+		return -ERESTARTSYS;
+
+	pair = kzalloc(sizeof(*pair) + asrc->pair_priv_size, GFP_KERNEL);
+	if (!pair) {
+		ret = -ENOMEM;
+		goto err_alloc_pair;
+	}
+
+	pair_m2m = kzalloc(sizeof(*pair_m2m), GFP_KERNEL);
+	if (!pair_m2m) {
+		ret = -ENOMEM;
+		goto err_alloc_pair_m2m;
+	}
+
+	pair->private = (void *)pair + sizeof(struct fsl_asrc_pair);
+	pair->asrc = m2m->asrc;
+
+	pair->buf_len[V4L_OUT] = ASRC_M2M_BUFFER_SIZE;
+	pair->buf_len[V4L_CAP] = ASRC_M2M_BUFFER_SIZE;
+
+	pair->channels = 2;
+	pair->rate[V4L_OUT] = 8000;
+	pair->rate[V4L_CAP] = 8000;
+	pair->sample_format[V4L_OUT] = SNDRV_PCM_FORMAT_S16_LE;
+	pair->sample_format[V4L_CAP] = SNDRV_PCM_FORMAT_S16_LE;
+
+	init_completion(&pair->complete[V4L_OUT]);
+	init_completion(&pair->complete[V4L_CAP]);
+
+	v4l2_fh_init(&pair_m2m->fh, vdev);
+	v4l2_fh_add(&pair_m2m->fh);
+	file->private_data = &pair_m2m->fh;
+
+	pair_m2m->pair = pair;
+	pair_m2m->m2m = m2m;
+	/* m2m context init */
+	pair_m2m->fh.m2m_ctx = v4l2_m2m_ctx_init(m2m->m2m_dev, pair_m2m,
+						 asrc_m2m_queue_init);
+	if (IS_ERR(pair_m2m->fh.m2m_ctx)) {
+		ret = PTR_ERR(pair_m2m->fh.m2m_ctx);
+		goto err_ctx_init;
+	}
+
+	v4l2_ctrl_handler_init(&pair_m2m->ctrl_handler, 2);
+
+	/* use V4L2_CID_GAIN for ratio update control */
+	v4l2_ctrl_new_std(&pair_m2m->ctrl_handler, &asrc_m2m_ctrl_ops,
+			  V4L2_CID_USER_IMX_ASRC_RATIO_MOD,
+			  0xFFFFFFFF80000001, 0x7fffffff, 1, 0);
+
+	if (pair_m2m->ctrl_handler.error) {
+		ret = pair_m2m->ctrl_handler.error;
+		v4l2_ctrl_handler_free(&pair_m2m->ctrl_handler);
+		goto err_ctrl_handler;
+	}
+
+	pair_m2m->fh.ctrl_handler = &pair_m2m->ctrl_handler;
+
+	mutex_unlock(&m2m->mlock);
+
+	return 0;
+
+err_ctrl_handler:
+	v4l2_m2m_ctx_release(pair_m2m->fh.m2m_ctx);
+err_ctx_init:
+	v4l2_fh_del(&pair_m2m->fh);
+	v4l2_fh_exit(&pair_m2m->fh);
+	kfree(pair_m2m);
+err_alloc_pair_m2m:
+	kfree(pair);
+err_alloc_pair:
+	mutex_unlock(&m2m->mlock);
+	return ret;
+}
+
+static int asrc_m2m_release(struct file *file)
+{
+	struct asrc_m2m *m2m = video_drvdata(file);
+	struct asrc_pair_m2m *pair_m2m = asrc_m2m_fh_to_ctx(file->private_data);
+	struct fsl_asrc_pair *pair = pair_m2m->pair;
+
+	mutex_lock(&m2m->mlock);
+	v4l2_ctrl_handler_free(&pair_m2m->ctrl_handler);
+	v4l2_m2m_ctx_release(pair_m2m->fh.m2m_ctx);
+	v4l2_fh_del(&pair_m2m->fh);
+	v4l2_fh_exit(&pair_m2m->fh);
+	kfree(pair_m2m);
+	kfree(pair);
+	mutex_unlock(&m2m->mlock);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations asrc_m2m_fops = {
+	.owner          = THIS_MODULE,
+	.open           = asrc_m2m_open,
+	.release        = asrc_m2m_release,
+	.poll           = v4l2_m2m_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap           = v4l2_m2m_fop_mmap,
+};
+
+static int asrc_m2m_querycap(struct file *file, void *priv,
+			     struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, "asrc m2m", sizeof(cap->driver));
+	strscpy(cap->card, "asrc m2m", sizeof(cap->card));
+	cap->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_AUDIO_M2M;
+	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
+
+	return 0;
+}
+
+static int enum_fmt(struct v4l2_fmtdesc *f, u32 type)
+{
+	int i, num;
+	struct asrc_fmt *fmt;
+
+	num = 0;
+
+	for (i = 0; i < NUM_FORMATS; ++i) {
+		if (formats[i].types & type) {
+			if (num == f->index)
+				break;
+			/*
+			 * Correct type but haven't reached our index yet,
+			 * just increment per-type index
+			 */
+			++num;
+		}
+	}
+
+	if (i < NUM_FORMATS) {
+		/* Format found */
+		fmt = &formats[i];
+		f->pixelformat = fmt->fourcc;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int asrc_m2m_enum_fmt_aud_cap(struct file *file, void *fh,
+				     struct v4l2_fmtdesc *f)
+{
+	return enum_fmt(f, MEM2MEM_CAPTURE);
+}
+
+static int asrc_m2m_enum_fmt_aud_out(struct file *file, void *fh,
+				     struct v4l2_fmtdesc *f)
+{
+	return enum_fmt(f, MEM2MEM_OUTPUT);
+}
+
+static int asrc_m2m_g_fmt_aud_cap(struct file *file, void *fh,
+				  struct v4l2_format *f)
+{
+	struct asrc_pair_m2m *pair_m2m = asrc_m2m_fh_to_ctx(fh);
+	struct fsl_asrc_pair *pair = pair_m2m->pair;
+
+	f->fmt.audio.channels = pair->channels;
+	f->fmt.audio.rate = pair->rate[V4L_CAP];
+	f->fmt.audio.format = pair->sample_format[V4L_CAP];
+	f->fmt.audio.buffersize = pair->buf_len[V4L_CAP];
+
+	return 0;
+}
+
+static int asrc_m2m_g_fmt_aud_out(struct file *file, void *fh,
+				  struct v4l2_format *f)
+{
+	struct asrc_pair_m2m *pair_m2m = asrc_m2m_fh_to_ctx(fh);
+	struct fsl_asrc_pair *pair = pair_m2m->pair;
+
+	f->fmt.audio.channels = pair->channels;
+	f->fmt.audio.rate = pair->rate[V4L_OUT];
+	f->fmt.audio.format = pair->sample_format[V4L_OUT];
+	f->fmt.audio.buffersize = pair->buf_len[V4L_OUT];
+
+	return 0;
+}
+
+/* output for asrc */
+static int asrc_m2m_s_fmt_aud_cap(struct file *file, void *fh,
+				  struct v4l2_format *f)
+{
+	struct asrc_pair_m2m *pair_m2m = asrc_m2m_fh_to_ctx(fh);
+	struct fsl_asrc_pair *pair = pair_m2m->pair;
+	struct asrc_m2m *m2m = pair_m2m->m2m;
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &m2m->pdev->dev;
+	int ret;
+
+	ret = asrc->m2m_check_format(OUT, f->fmt.audio.format);
+	if (ret)
+		f->fmt.audio.format = pair->sample_format[V4L_CAP];
+
+	ret = asrc->m2m_check_rate(OUT, f->fmt.audio.rate);
+	if (ret)
+		f->fmt.audio.rate = pair->rate[V4L_CAP];
+
+	ret = asrc->m2m_check_channel(OUT, f->fmt.audio.channels);
+	if (ret)
+		f->fmt.audio.channels = pair->channels;
+
+	if (pair->channels > 0 && pair->channels != f->fmt.audio.channels) {
+		dev_err(dev, "channels don't match for cap and out\n");
+		return -EINVAL;
+	}
+
+	pair->channels = f->fmt.audio.channels;
+	pair->rate[V4L_CAP] = f->fmt.audio.rate;
+	pair->sample_format[V4L_CAP] = f->fmt.audio.format;
+
+	return 0;
+}
+
+/* input for asrc */
+static int asrc_m2m_s_fmt_aud_out(struct file *file, void *fh,
+				  struct v4l2_format *f)
+{
+	struct asrc_pair_m2m *pair_m2m = asrc_m2m_fh_to_ctx(fh);
+	struct fsl_asrc_pair *pair = pair_m2m->pair;
+	struct asrc_m2m *m2m = pair_m2m->m2m;
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &m2m->pdev->dev;
+	int ret;
+
+	ret = asrc->m2m_check_format(IN, f->fmt.audio.format);
+	if (ret)
+		f->fmt.audio.format = pair->sample_format[V4L_OUT];
+
+	ret = asrc->m2m_check_rate(IN, f->fmt.audio.rate);
+	if (ret)
+		f->fmt.audio.rate = pair->rate[V4L_OUT];
+
+	ret = asrc->m2m_check_channel(IN, f->fmt.audio.channels);
+	if (ret)
+		f->fmt.audio.channels = pair->channels;
+
+	if (pair->channels > 0 && pair->channels != f->fmt.audio.channels) {
+		dev_err(dev, "channels don't match for cap and out\n");
+		return -EINVAL;
+	}
+
+	pair->channels = f->fmt.audio.channels;
+	pair->rate[V4L_OUT] = f->fmt.audio.rate;
+	pair->sample_format[V4L_OUT] = f->fmt.audio.format;
+
+	return 0;
+}
+
+static int asrc_m2m_try_fmt_audio_cap(struct file *file, void *fh,
+				      struct v4l2_format *f)
+{
+	struct asrc_pair_m2m *pair_m2m = asrc_m2m_fh_to_ctx(fh);
+	struct fsl_asrc_pair *pair = pair_m2m->pair;
+	struct asrc_m2m *m2m = video_drvdata(file);
+	struct fsl_asrc *asrc = m2m->asrc;
+	int ret;
+
+	ret = asrc->m2m_check_format(OUT, f->fmt.audio.format);
+	if (ret)
+		f->fmt.audio.format = pair->sample_format[V4L_CAP];
+
+	ret = asrc->m2m_check_rate(OUT, f->fmt.audio.rate);
+	if (ret)
+		f->fmt.audio.rate = pair->rate[V4L_CAP];
+
+	ret = asrc->m2m_check_channel(OUT, f->fmt.audio.channels);
+	if (ret)
+		f->fmt.audio.channels = pair->channels;
+
+	return 0;
+}
+
+static int asrc_m2m_try_fmt_audio_out(struct file *file, void *fh,
+				      struct v4l2_format *f)
+{
+	struct asrc_pair_m2m *pair_m2m = asrc_m2m_fh_to_ctx(fh);
+	struct fsl_asrc_pair *pair = pair_m2m->pair;
+	struct asrc_m2m *m2m = video_drvdata(file);
+	struct fsl_asrc *asrc = m2m->asrc;
+	int ret;
+
+	ret = asrc->m2m_check_format(IN, f->fmt.audio.format);
+	if (ret)
+		f->fmt.audio.format = pair->sample_format[V4L_OUT];
+
+	ret = asrc->m2m_check_rate(IN, f->fmt.audio.rate);
+	if (ret)
+		f->fmt.audio.rate = pair->rate[V4L_OUT];
+
+	ret = asrc->m2m_check_channel(IN, f->fmt.audio.channels);
+	if (ret)
+		f->fmt.audio.channels = pair->channels;
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops asrc_m2m_ioctl_ops = {
+	.vidioc_querycap		= asrc_m2m_querycap,
+
+	.vidioc_enum_fmt_audio_cap	= asrc_m2m_enum_fmt_aud_cap,
+	.vidioc_enum_fmt_audio_out	= asrc_m2m_enum_fmt_aud_out,
+
+	.vidioc_g_fmt_audio_cap		= asrc_m2m_g_fmt_aud_cap,
+	.vidioc_g_fmt_audio_out		= asrc_m2m_g_fmt_aud_out,
+
+	.vidioc_s_fmt_audio_cap		= asrc_m2m_s_fmt_aud_cap,
+	.vidioc_s_fmt_audio_out		= asrc_m2m_s_fmt_aud_out,
+
+	.vidioc_try_fmt_audio_cap	= asrc_m2m_try_fmt_audio_cap,
+	.vidioc_try_fmt_audio_out	= asrc_m2m_try_fmt_audio_out,
+
+	.vidioc_qbuf			= v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf			= v4l2_m2m_ioctl_dqbuf,
+
+	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
+	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_reqbufs			= v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf		= v4l2_m2m_ioctl_querybuf,
+	.vidioc_streamon		= v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
+	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+};
+
+/* dma complete callback */
+static void asrc_input_dma_callback(void *data)
+{
+	struct fsl_asrc_pair *pair = (struct fsl_asrc_pair *)data;
+
+	complete(&pair->complete[V4L_OUT]);
+}
+
+/* dma complete callback */
+static void asrc_output_dma_callback(void *data)
+{
+	struct fsl_asrc_pair *pair = (struct fsl_asrc_pair *)data;
+
+	complete(&pair->complete[V4L_CAP]);
+}
+
+/* config dma channel */
+static int asrc_dmaconfig(struct asrc_pair_m2m *pair_m2m,
+			  struct dma_chan *chan,
+			  u32 dma_addr, dma_addr_t buf_addr, u32 buf_len,
+			  int dir, int width)
+{
+	struct fsl_asrc_pair *pair = pair_m2m->pair;
+	struct fsl_asrc *asrc = pair->asrc;
+	struct asrc_m2m *m2m = pair_m2m->m2m;
+	struct device *dev = &m2m->pdev->dev;
+	struct dma_slave_config slave_config;
+	struct scatterlist sg[ASRC_M2M_SG_NUM];
+	enum dma_slave_buswidth buswidth;
+	unsigned int sg_len, max_period_size;
+	int ret, i;
+
+	switch (width) {
+	case 8:
+		buswidth = DMA_SLAVE_BUSWIDTH_1_BYTE;
+		break;
+	case 16:
+		buswidth = DMA_SLAVE_BUSWIDTH_2_BYTES;
+		break;
+	case 24:
+		buswidth = DMA_SLAVE_BUSWIDTH_3_BYTES;
+		break;
+	case 32:
+		buswidth = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		break;
+	default:
+		dev_err(dev, "invalid word width\n");
+		return -EINVAL;
+	}
+
+	memset(&slave_config, 0, sizeof(slave_config));
+	if (dir == V4L_OUT) {
+		slave_config.direction = DMA_MEM_TO_DEV;
+		slave_config.dst_addr = dma_addr;
+		slave_config.dst_addr_width = buswidth;
+		slave_config.dst_maxburst = asrc->m2m_get_maxburst(IN, pair);
+	} else {
+		slave_config.direction = DMA_DEV_TO_MEM;
+		slave_config.src_addr = dma_addr;
+		slave_config.src_addr_width = buswidth;
+		slave_config.src_maxburst = asrc->m2m_get_maxburst(OUT, pair);
+	}
+
+	ret = dmaengine_slave_config(chan, &slave_config);
+	if (ret) {
+		dev_err(dev, "failed to config dmaengine for %s task: %d\n",
+			DIR_STR(dir), ret);
+		return -EINVAL;
+	}
+
+	max_period_size = rounddown(ASRC_M2M_PERIOD_SIZE, width * pair->channels / 8);
+	/* scatter gather mode */
+	sg_len = buf_len / max_period_size;
+	if (buf_len % max_period_size)
+		sg_len += 1;
+
+	sg_init_table(sg, sg_len);
+	for (i = 0; i < (sg_len - 1); i++) {
+		sg_dma_address(&sg[i]) = buf_addr + i * max_period_size;
+		sg_dma_len(&sg[i]) = max_period_size;
+	}
+	sg_dma_address(&sg[i]) = buf_addr + i * max_period_size;
+	sg_dma_len(&sg[i]) = buf_len - i * max_period_size;
+
+	pair->desc[dir] = dmaengine_prep_slave_sg(chan, sg, sg_len,
+						  slave_config.direction,
+						  DMA_PREP_INTERRUPT);
+	if (!pair->desc[dir]) {
+		dev_err(dev, "failed to prepare dmaengine for %s task\n", DIR_STR(dir));
+		return -EINVAL;
+	}
+
+	pair->desc[dir]->callback = ASRC_xPUT_DMA_CALLBACK(dir);
+	pair->desc[dir]->callback_param = pair;
+
+	return 0;
+}
+
+/* main function of converter */
+static void asrc_m2m_device_run(void *priv)
+{
+	struct asrc_pair_m2m *pair_m2m = priv;
+	struct fsl_asrc_pair *pair = pair_m2m->pair;
+	struct asrc_m2m *m2m = pair_m2m->m2m;
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &m2m->pdev->dev;
+	enum asrc_pair_index index = pair->index;
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	unsigned int out_buf_len;
+	unsigned int cap_dma_len;
+	unsigned int width;
+	u32 fifo_addr;
+	int ret;
+
+	src_buf = v4l2_m2m_next_src_buf(pair_m2m->fh.m2m_ctx);
+	dst_buf = v4l2_m2m_next_dst_buf(pair_m2m->fh.m2m_ctx);
+
+	width = snd_pcm_format_physical_width(pair->sample_format[V4L_OUT]);
+	fifo_addr = asrc->paddr + asrc->get_fifo_addr(IN, index);
+	out_buf_len = vb2_get_plane_payload(&src_buf->vb2_buf, 0);
+	if (out_buf_len < width * pair->channels / 8 ||
+	    out_buf_len > ASRC_M2M_BUFFER_SIZE ||
+	    out_buf_len % (width * pair->channels / 8)) {
+		dev_err(dev, "out buffer size is error: [%d]\n", out_buf_len);
+		goto end;
+	}
+
+	/* dma config for output dma channel */
+	ret = asrc_dmaconfig(pair_m2m,
+			     pair->dma_chan[V4L_OUT],
+			     fifo_addr,
+			     vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0),
+			     out_buf_len, V4L_OUT, width);
+	if (ret) {
+		dev_err(dev, "out dma config error\n");
+		goto end;
+	}
+
+	width = snd_pcm_format_physical_width(pair->sample_format[V4L_CAP]);
+	fifo_addr = asrc->paddr + asrc->get_fifo_addr(OUT, index);
+	cap_dma_len = asrc->m2m_calc_out_len(pair, out_buf_len);
+	if (cap_dma_len > 0 && cap_dma_len <= ASRC_M2M_BUFFER_SIZE) {
+		/* dma config for capture dma channel */
+		ret = asrc_dmaconfig(pair_m2m,
+				     pair->dma_chan[V4L_CAP],
+				     fifo_addr,
+				     vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0),
+				     cap_dma_len, V4L_CAP, width);
+		if (ret) {
+			dev_err(dev, "cap dma config error\n");
+			goto end;
+		}
+	} else if (cap_dma_len > ASRC_M2M_BUFFER_SIZE) {
+		dev_err(dev, "cap buffer size error\n");
+		goto end;
+	}
+
+	reinit_completion(&pair->complete[V4L_OUT]);
+	reinit_completion(&pair->complete[V4L_CAP]);
+
+	/* Submit DMA request */
+	dmaengine_submit(pair->desc[V4L_OUT]);
+	dma_async_issue_pending(pair->desc[V4L_OUT]->chan);
+	if (cap_dma_len > 0) {
+		dmaengine_submit(pair->desc[V4L_CAP]);
+		dma_async_issue_pending(pair->desc[V4L_CAP]->chan);
+	}
+
+	asrc->m2m_start_part_two(pair);
+
+	if (!wait_for_completion_interruptible_timeout(&pair->complete[V4L_OUT], 10 * HZ)) {
+		dev_err(dev, "out DMA task timeout\n");
+		goto end;
+	}
+
+	if (cap_dma_len > 0) {
+		if (!wait_for_completion_interruptible_timeout(&pair->complete[V4L_CAP], 10 * HZ)) {
+			dev_err(dev, "cap DMA task timeout\n");
+			goto end;
+		}
+	}
+
+	/* read the last words from FIFO */
+	asrc_read_last_fifo(pair, vb2_plane_vaddr(&dst_buf->vb2_buf, 0), &cap_dma_len);
+	/* update payload length for capture */
+	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, cap_dma_len);
+
+end:
+	src_buf = v4l2_m2m_src_buf_remove(pair_m2m->fh.m2m_ctx);
+	dst_buf = v4l2_m2m_dst_buf_remove(pair_m2m->fh.m2m_ctx);
+
+	v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
+	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
+
+	v4l2_m2m_job_finish(m2m->m2m_dev, pair_m2m->fh.m2m_ctx);
+}
+
+static int asrc_m2m_job_ready(void *priv)
+{
+	struct asrc_pair_m2m *pair_m2m = priv;
+
+	if (v4l2_m2m_num_src_bufs_ready(pair_m2m->fh.m2m_ctx) > 0 &&
+	    v4l2_m2m_num_dst_bufs_ready(pair_m2m->fh.m2m_ctx) > 0) {
+		return 1;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_m2m_ops asrc_m2m_ops = {
+	.job_ready = asrc_m2m_job_ready,
+	.device_run = asrc_m2m_device_run,
+};
+
+static int asrc_m2m_probe(struct platform_device *pdev)
+{
+	struct fsl_asrc_m2m_pdata *data = pdev->dev.platform_data;
+	struct fsl_asrc *asrc = data->asrc;
+	struct device *dev = &pdev->dev;
+	struct asrc_m2m *m2m;
+	int ret;
+
+	m2m = devm_kzalloc(dev, sizeof(struct asrc_m2m), GFP_KERNEL);
+	if (!m2m)
+		return -ENOMEM;
+
+	m2m->asrc = asrc;
+	m2m->pdev = pdev;
+
+	ret = v4l2_device_register(dev, &m2m->v4l2_dev);
+	if (ret) {
+		dev_err(dev, "failed to register v4l2 device\n");
+		goto err_register;
+	}
+
+	m2m->m2m_dev = v4l2_m2m_init(&asrc_m2m_ops);
+	if (IS_ERR(m2m->m2m_dev)) {
+		dev_err(dev, "failed to register v4l2 device\n");
+		ret = PTR_ERR(m2m->m2m_dev);
+		goto err_m2m;
+	}
+
+	m2m->dec_vdev = video_device_alloc();
+	if (!m2m->dec_vdev) {
+		dev_err(dev, "failed to register v4l2 device\n");
+		ret = -ENOMEM;
+		goto err_vdev_alloc;
+	}
+
+	mutex_init(&m2m->mlock);
+
+	m2m->dec_vdev->fops = &asrc_m2m_fops;
+	m2m->dec_vdev->ioctl_ops = &asrc_m2m_ioctl_ops;
+	m2m->dec_vdev->minor = -1;
+	m2m->dec_vdev->release = video_device_release;
+	m2m->dec_vdev->lock = &m2m->mlock; /* lock for ioctl serialization */
+	m2m->dec_vdev->v4l2_dev = &m2m->v4l2_dev;
+	m2m->dec_vdev->vfl_dir = VFL_DIR_M2M;
+	m2m->dec_vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_AUDIO_M2M;
+
+	ret = video_register_device(m2m->dec_vdev, VFL_TYPE_AUDIO, -1);
+	if (ret) {
+		dev_err(dev, "failed to register video device\n");
+		goto err_vdev_register;
+	}
+
+	video_set_drvdata(m2m->dec_vdev, m2m);
+	platform_set_drvdata(pdev, m2m);
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
+
+err_vdev_register:
+	video_device_release(m2m->dec_vdev);
+err_vdev_alloc:
+	v4l2_m2m_release(m2m->m2m_dev);
+err_m2m:
+	v4l2_device_unregister(&m2m->v4l2_dev);
+err_register:
+	return ret;
+}
+
+static void asrc_m2m_remove(struct platform_device *pdev)
+{
+	struct asrc_m2m *m2m = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(&pdev->dev);
+	video_unregister_device(m2m->dec_vdev);
+	video_device_release(m2m->dec_vdev);
+	v4l2_m2m_release(m2m->m2m_dev);
+	v4l2_device_unregister(&m2m->v4l2_dev);
+}
+
+/* suspend callback for m2m */
+static int asrc_m2m_suspend(struct device *dev)
+{
+	struct asrc_m2m *m2m = dev_get_drvdata(dev);
+	struct fsl_asrc *asrc = m2m->asrc;
+	struct fsl_asrc_pair *pair;
+	unsigned long lock_flags;
+	int i;
+
+	for (i = 0; i < PAIR_CTX_NUM; i++) {
+		spin_lock_irqsave(&asrc->lock, lock_flags);
+		pair = asrc->pair[i];
+		if (!pair || !pair->req_pair) {
+			spin_unlock_irqrestore(&asrc->lock, lock_flags);
+			continue;
+		}
+		if (!completion_done(&pair->complete[V4L_OUT])) {
+			if (pair->dma_chan[V4L_OUT])
+				dmaengine_terminate_all(pair->dma_chan[V4L_OUT]);
+			asrc_input_dma_callback((void *)pair);
+		}
+		if (!completion_done(&pair->complete[V4L_CAP])) {
+			if (pair->dma_chan[V4L_CAP])
+				dmaengine_terminate_all(pair->dma_chan[V4L_CAP]);
+			asrc_output_dma_callback((void *)pair);
+		}
+
+		if (asrc->m2m_pair_suspend)
+			asrc->m2m_pair_suspend(pair);
+
+		spin_unlock_irqrestore(&asrc->lock, lock_flags);
+	}
+
+	return 0;
+}
+
+static int asrc_m2m_resume(struct device *dev)
+{
+	struct asrc_m2m *m2m = dev_get_drvdata(dev);
+	struct fsl_asrc *asrc = m2m->asrc;
+	struct fsl_asrc_pair *pair;
+	unsigned long lock_flags;
+	int i;
+
+	for (i = 0; i < PAIR_CTX_NUM; i++) {
+		spin_lock_irqsave(&asrc->lock, lock_flags);
+		pair = asrc->pair[i];
+		if (!pair || !pair->req_pair) {
+			spin_unlock_irqrestore(&asrc->lock, lock_flags);
+			continue;
+		}
+		if (asrc->m2m_pair_resume)
+			asrc->m2m_pair_resume(pair);
+
+		spin_unlock_irqrestore(&asrc->lock, lock_flags);
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops asrc_m2m_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(asrc_m2m_suspend,
+				      asrc_m2m_resume)
+};
+
+static struct platform_driver asrc_m2m_driver = {
+	.probe  = asrc_m2m_probe,
+	.remove_new = asrc_m2m_remove,
+	.driver = {
+		.name = "fsl_asrc_m2m",
+		.pm = &asrc_m2m_pm_ops,
+	},
+};
+module_platform_driver(asrc_m2m_driver);
+
+MODULE_DESCRIPTION("Freescale ASRC M2M driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

