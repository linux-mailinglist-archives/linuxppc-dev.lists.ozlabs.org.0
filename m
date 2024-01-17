Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EB88303AF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jan 2024 11:33:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TFMfM0sbkz3cLl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jan 2024 21:33:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=kqa0=i3=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TFMdv2Ww0z2xFl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jan 2024 21:32:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id F0082B80B40;
	Wed, 17 Jan 2024 10:32:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26B2C433F1;
	Wed, 17 Jan 2024 10:32:43 +0000 (UTC)
Message-ID: <6d96cf56-c534-4abf-8819-03cd32fda3d5@xs4all.nl>
Date: Wed, 17 Jan 2024 11:32:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 15/15] media: vim2m-audio: add virtual driver for
 audio memory to memory
Content-Language: en-US, nl
To: Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
References: <1700637838-6743-1-git-send-email-shengjiu.wang@nxp.com>
 <1700637838-6743-16-git-send-email-shengjiu.wang@nxp.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <1700637838-6743-16-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 22/11/2023 08:23, Shengjiu Wang wrote:
> Audio memory to memory virtual driver use video memory to memory
> virtual driver vim2m.c as example. The main difference is
> device type is VFL_TYPE_AUDIO and device cap type is V4L2_CAP_AUDIO_M2M.
> 
> The device_run function is a dummy function, which is simply
> copy the data from input buffer to output buffer.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/media/test-drivers/Kconfig       |  11 +
>  drivers/media/test-drivers/Makefile      |   1 +
>  drivers/media/test-drivers/vim2m-audio.c | 799 +++++++++++++++++++++++
>  3 files changed, 811 insertions(+)
>  create mode 100644 drivers/media/test-drivers/vim2m-audio.c
> 
> diff --git a/drivers/media/test-drivers/Kconfig b/drivers/media/test-drivers/Kconfig
> index 459b433e9fae..55f8af6ee4e2 100644
> --- a/drivers/media/test-drivers/Kconfig
> +++ b/drivers/media/test-drivers/Kconfig
> @@ -17,6 +17,17 @@ config VIDEO_VIM2M
>  	  This is a virtual test device for the memory-to-memory driver
>  	  framework.
>  
> +config VIDEO_VIM2M_AUDIO
> +	tristate "Virtual Memory-to-Memory Driver For Audio"
> +	depends on VIDEO_DEV
> +	select VIDEOBUF2_VMALLOC
> +	select V4L2_MEM2MEM_DEV
> +	select MEDIA_CONTROLLER
> +	select MEDIA_CONTROLLER_REQUEST_API

Drop this. This option has been removed.

> +	help
> +	  This is a virtual audio test device for the memory-to-memory driver
> +	  framework.
> +
>  source "drivers/media/test-drivers/vicodec/Kconfig"
>  source "drivers/media/test-drivers/vimc/Kconfig"
>  source "drivers/media/test-drivers/vivid/Kconfig"
> diff --git a/drivers/media/test-drivers/Makefile b/drivers/media/test-drivers/Makefile
> index 740714a4584d..0c61c9ada3e1 100644
> --- a/drivers/media/test-drivers/Makefile
> +++ b/drivers/media/test-drivers/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_DVB_VIDTV) += vidtv/
>  
>  obj-$(CONFIG_VIDEO_VICODEC) += vicodec/
>  obj-$(CONFIG_VIDEO_VIM2M) += vim2m.o
> +obj-$(CONFIG_VIDEO_VIM2M_AUDIO) += vim2m-audio.o
>  obj-$(CONFIG_VIDEO_VIMC) += vimc/
>  obj-$(CONFIG_VIDEO_VIVID) += vivid/
>  obj-$(CONFIG_VIDEO_VISL) += visl/
> diff --git a/drivers/media/test-drivers/vim2m-audio.c b/drivers/media/test-drivers/vim2m-audio.c
> new file mode 100644
> index 000000000000..72806ada8628
> --- /dev/null
> +++ b/drivers/media/test-drivers/vim2m-audio.c
> @@ -0,0 +1,799 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * A virtual v4l2-mem2mem example for audio device.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/delay.h>
> +#include <linux/fs.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +
> +#include <linux/platform_device.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/videobuf2-vmalloc.h>
> +#include <sound/dmaengine_pcm.h>
> +
> +MODULE_DESCRIPTION("Virtual device for audio mem2mem testing");
> +MODULE_LICENSE("GPL");
> +
> +static unsigned int debug;
> +module_param(debug, uint, 0644);
> +MODULE_PARM_DESC(debug, "debug level");
> +
> +#define MEM2MEM_NAME "vim2m-audio"
> +
> +#define dprintk(dev, lvl, fmt, arg...) \
> +	v4l2_dbg(lvl, debug, &(dev)->v4l2_dev, "%s: " fmt, __func__, ## arg)
> +
> +#define SAMPLE_NUM 4096
> +
> +static void audm2m_dev_release(struct device *dev)
> +{}
> +
> +static struct platform_device audm2m_pdev = {
> +	.name		= MEM2MEM_NAME,
> +	.dev.release	= audm2m_dev_release,
> +};
> +
> +static u32 formats[] = {
> +	V4L2_AUDIO_FMT_S16_LE,
> +};
> +
> +#define NUM_FORMATS ARRAY_SIZE(formats)
> +
> +/* Per-queue, driver-specific private data */
> +struct audm2m_q_data {
> +	unsigned int		rate;
> +	unsigned int		channels;
> +	unsigned int		buffersize;
> +	unsigned int		sequence;
> +	u32			fourcc;
> +};
> +
> +enum {
> +	V4L2_M2M_SRC = 0,
> +	V4L2_M2M_DST = 1,
> +};
> +
> +static snd_pcm_format_t find_format(u32 fourcc)
> +{
> +	snd_pcm_format_t fmt;
> +	unsigned int k;
> +
> +	for (k = 0; k < NUM_FORMATS; k++) {
> +		if (formats[k] == fourcc)
> +			break;
> +	}
> +
> +	if (k == NUM_FORMATS)
> +		return 0;
> +
> +	fmt = v4l2_fourcc_to_audfmt(formats[k]);
> +
> +	return fmt;
> +}
> +
> +struct audm2m_dev {
> +	struct v4l2_device	v4l2_dev;
> +	struct video_device	vfd;
> +
> +	struct mutex		dev_mutex;
> +
> +	struct v4l2_m2m_dev	*m2m_dev;
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	struct media_device	mdev;
> +#endif
> +};
> +
> +struct audm2m_ctx {
> +	struct v4l2_fh		fh;
> +	struct v4l2_ctrl_handler	ctrl_handler;
> +	struct audm2m_dev	*dev;
> +
> +	struct mutex		vb_mutex;
> +
> +	/* Source and destination queue data */
> +	struct audm2m_q_data   q_data[2];
> +};
> +
> +static inline struct audm2m_ctx *file2ctx(struct file *file)
> +{
> +	return container_of(file->private_data, struct audm2m_ctx, fh);
> +}
> +
> +static struct audm2m_q_data *get_q_data(struct audm2m_ctx *ctx,
> +					enum v4l2_buf_type type)
> +{
> +	if (type == V4L2_BUF_TYPE_AUDIO_OUTPUT)
> +		return &ctx->q_data[V4L2_M2M_SRC];
> +	return &ctx->q_data[V4L2_M2M_DST];
> +}
> +
> +static const char *type_name(enum v4l2_buf_type type)
> +{
> +	if (type == V4L2_BUF_TYPE_AUDIO_OUTPUT)
> +		return "Output";
> +	return "Capture";
> +}
> +
> +/*
> + * mem2mem callbacks
> + */
> +
> +/*
> + * device_run() - prepares and starts the device
> + */
> +static void device_run(void *priv)
> +{
> +	struct audm2m_ctx *ctx = priv;
> +	struct audm2m_dev *audm2m_dev;
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct audm2m_q_data *q_data_src, *q_data_dst;
> +	int src_size, dst_size = 0;
> +	short *src_addr, *dst_addr;
> +	int i;
> +
> +	audm2m_dev = ctx->dev;
> +
> +	q_data_src = get_q_data(ctx, V4L2_BUF_TYPE_AUDIO_OUTPUT);
> +	if (!q_data_src)
> +		return;
> +
> +	q_data_dst = get_q_data(ctx, V4L2_BUF_TYPE_AUDIO_CAPTURE);
> +	if (!q_data_dst)
> +		return;
> +
> +	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +	src_buf->sequence = q_data_src->sequence++;
> +	dst_buf->sequence = q_data_dst->sequence++;
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
> +
> +	/* Process the conversion */
> +	src_size = vb2_get_plane_payload(&src_buf->vb2_buf, 0);
> +
> +	src_addr = vb2_plane_vaddr(&src_buf->vb2_buf, 0);
> +	dst_addr = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
> +
> +	if (q_data_src->rate == q_data_dst->rate) {
> +		memcpy(dst_addr, src_addr, src_size);
> +		dst_size = src_size;
> +	} else if (q_data_src->rate == 2 * q_data_dst->rate) {
> +		/* 8k to 16k */
> +		for (i = 0; i < src_size / 2; i++) {
> +			*dst_addr++ = *src_addr++;
> +			src_addr++;
> +		}
> +
> +		dst_size = src_size / 2;
> +	} else if (q_data_src->rate * 2 == q_data_dst->rate) {
> +		/* 16k to 8k */
> +		for (i = 0; i < src_size / 2; i++) {
> +			*dst_addr++ = *src_addr;
> +			*dst_addr++ = *src_addr++;
> +		}
> +
> +		dst_size = src_size * 2;
> +	}
> +
> +	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, dst_size);
> +
> +	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +
> +	v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
> +	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
> +	v4l2_m2m_job_finish(audm2m_dev->m2m_dev, ctx->fh.m2m_ctx);
> +}
> +
> +static int audm2m_querycap(struct file *file, void *priv,
> +			   struct v4l2_capability *cap)
> +{
> +	strscpy(cap->driver, MEM2MEM_NAME, sizeof(cap->driver));
> +	strscpy(cap->card, MEM2MEM_NAME, sizeof(cap->card));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
> +		 "platform:%s", MEM2MEM_NAME);

You can drop this bus_info line, it's filled in for you.

> +
> +	return 0;
> +}
> +
> +static int enum_fmt(struct v4l2_fmtdesc *f)
> +{
> +	int i, num;
> +
> +	num = 0;
> +
> +	for (i = 0; i < NUM_FORMATS; ++i) {
> +		if (num == f->index)
> +			break;
> +		/*
> +		 * Correct type but haven't reached our index yet,
> +		 * just increment per-type index
> +		 */
> +		++num;
> +	}
> +
> +	if (i < NUM_FORMATS) {
> +		/* Format found */
> +		f->pixelformat = formats[i];
> +		return 0;
> +	}
> +
> +	/* Format not found */
> +	return -EINVAL;
> +}
> +
> +static int audm2m_enum_fmt_audio_cap(struct file *file, void *priv,
> +				     struct v4l2_fmtdesc *f)
> +{
> +	return enum_fmt(f);
> +}
> +
> +static int audm2m_enum_fmt_audio_out(struct file *file, void *priv,
> +				     struct v4l2_fmtdesc *f)
> +{
> +	return enum_fmt(f);
> +}
> +
> +static int audm2m_g_fmt(struct audm2m_ctx *ctx, struct v4l2_format *f)
> +{
> +	struct vb2_queue *vq;
> +	struct audm2m_q_data *q_data;
> +
> +	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> +	if (!vq)
> +		return -EINVAL;
> +
> +	q_data = get_q_data(ctx, f->type);
> +	if (!q_data)
> +		return -EINVAL;
> +
> +	f->fmt.audio.audioformat = q_data->fourcc;
> +	f->fmt.audio.channels	= q_data->channels;
> +	f->fmt.audio.buffersize = q_data->buffersize;
> +
> +	return 0;
> +}
> +
> +static int audm2m_g_fmt_audio_out(struct file *file, void *priv,
> +				  struct v4l2_format *f)
> +{
> +	return audm2m_g_fmt(file2ctx(file), f);
> +}
> +
> +static int audm2m_g_fmt_audio_cap(struct file *file, void *priv,
> +				  struct v4l2_format *f)
> +{
> +	return audm2m_g_fmt(file2ctx(file), f);
> +}
> +
> +static int audm2m_try_fmt(struct v4l2_format *f, snd_pcm_format_t fmt)
> +{
> +	f->fmt.audio.channels = 1;
> +	f->fmt.audio.buffersize = f->fmt.audio.channels *
> +				  snd_pcm_format_physical_width(fmt) *
> +				  SAMPLE_NUM;
> +	return 0;
> +}
> +
> +static int audm2m_try_fmt_audio_cap(struct file *file, void *priv,
> +				    struct v4l2_format *f)
> +{
> +	snd_pcm_format_t fmt;
> +
> +	fmt = find_format(f->fmt.audio.audioformat);
> +	if (!fmt) {
> +		f->fmt.audio.audioformat = formats[0];
> +		fmt = find_format(f->fmt.audio.audioformat);
> +	}
> +
> +	return audm2m_try_fmt(f, fmt);
> +}
> +
> +static int audm2m_try_fmt_audio_out(struct file *file, void *priv,
> +				    struct v4l2_format *f)
> +{
> +	snd_pcm_format_t fmt;
> +
> +	fmt = find_format(f->fmt.audio.audioformat);
> +	if (!fmt) {
> +		f->fmt.audio.audioformat = formats[0];
> +		fmt = find_format(f->fmt.audio.audioformat);
> +	}
> +
> +	return audm2m_try_fmt(f, fmt);
> +}
> +
> +static int audm2m_s_fmt(struct audm2m_ctx *ctx, struct v4l2_format *f)
> +{
> +	struct audm2m_q_data *q_data;
> +	struct vb2_queue *vq;
> +	snd_pcm_format_t fmt;
> +
> +	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> +	if (!vq)
> +		return -EINVAL;
> +
> +	q_data = get_q_data(ctx, f->type);
> +	if (!q_data)
> +		return -EINVAL;
> +
> +	if (vb2_is_busy(vq)) {
> +		v4l2_err(&ctx->dev->v4l2_dev, "%s queue busy\n", __func__);
> +		return -EBUSY;
> +	}
> +
> +	q_data->fourcc	= f->fmt.audio.audioformat;
> +	q_data->channels = f->fmt.audio.channels;
> +
> +	fmt = find_format(f->fmt.audio.audioformat);
> +	q_data->buffersize = q_data->channels *
> +			     snd_pcm_format_physical_width(fmt) *
> +			     SAMPLE_NUM;
> +
> +	dprintk(ctx->dev, 1,
> +		"Format for type %s: %d/%d, fmt: %c%c%c%c\n",
> +		type_name(f->type), q_data->rate,
> +		q_data->channels,
> +		(q_data->fourcc & 0xff),
> +		(q_data->fourcc >>  8) & 0xff,
> +		(q_data->fourcc >> 16) & 0xff,
> +		(q_data->fourcc >> 24) & 0xff);
> +
> +	return 0;
> +}
> +
> +static int audm2m_s_fmt_audio_cap(struct file *file, void *priv,
> +				  struct v4l2_format *f)
> +{
> +	int ret;
> +
> +	ret = audm2m_try_fmt_audio_cap(file, priv, f);
> +	if (ret)
> +		return ret;
> +
> +	return audm2m_s_fmt(file2ctx(file), f);
> +}
> +
> +static int audm2m_s_fmt_audio_out(struct file *file, void *priv,
> +				  struct v4l2_format *f)
> +{
> +	int ret;
> +
> +	ret = audm2m_try_fmt_audio_out(file, priv, f);
> +	if (ret)
> +		return ret;
> +
> +	return audm2m_s_fmt(file2ctx(file), f);
> +}
> +
> +static const struct v4l2_ioctl_ops audm2m_ioctl_ops = {
> +	.vidioc_querycap		= audm2m_querycap,
> +
> +	.vidioc_enum_fmt_audio_cap	= audm2m_enum_fmt_audio_cap,
> +	.vidioc_g_fmt_audio_cap		= audm2m_g_fmt_audio_cap,
> +	.vidioc_try_fmt_audio_cap	= audm2m_try_fmt_audio_cap,
> +	.vidioc_s_fmt_audio_cap		= audm2m_s_fmt_audio_cap,
> +
> +	.vidioc_enum_fmt_audio_out	= audm2m_enum_fmt_audio_out,
> +	.vidioc_g_fmt_audio_out		= audm2m_g_fmt_audio_out,
> +	.vidioc_try_fmt_audio_out	= audm2m_try_fmt_audio_out,
> +	.vidioc_s_fmt_audio_out		= audm2m_s_fmt_audio_out,
> +
> +	.vidioc_reqbufs			= v4l2_m2m_ioctl_reqbufs,
> +	.vidioc_querybuf		= v4l2_m2m_ioctl_querybuf,
> +	.vidioc_qbuf			= v4l2_m2m_ioctl_qbuf,
> +	.vidioc_dqbuf			= v4l2_m2m_ioctl_dqbuf,
> +	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
> +	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
> +	.vidioc_expbuf			= v4l2_m2m_ioctl_expbuf,
> +
> +	.vidioc_streamon		= v4l2_m2m_ioctl_streamon,
> +	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
> +
> +	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
> +	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
> +};
> +
> +/*
> + * Queue operations
> + */
> +static int audm2m_queue_setup(struct vb2_queue *vq,
> +			      unsigned int *nbuffers,
> +			      unsigned int *nplanes,
> +			      unsigned int sizes[],
> +			      struct device *alloc_devs[])
> +{
> +	struct audm2m_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct audm2m_q_data *q_data;
> +
> +	q_data = get_q_data(ctx, vq->type);
> +
> +	if (*nplanes)
> +		return sizes[0] < q_data->buffersize ? -EINVAL : 0;
> +
> +	*nplanes = 1;
> +	sizes[0] = q_data->buffersize;
> +
> +	dprintk(ctx->dev, 1, "%s: get %d buffer(s) of size %d each.\n",
> +		type_name(vq->type), *nplanes, sizes[0]);
> +
> +	return 0;
> +}
> +
> +static void audm2m_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct audm2m_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> +}
> +
> +static int audm2m_start_streaming(struct vb2_queue *q, unsigned int count)
> +{
> +	struct audm2m_ctx *ctx = vb2_get_drv_priv(q);
> +	struct audm2m_q_data *q_data = get_q_data(ctx, q->type);
> +
> +	q_data->sequence = 0;
> +	return 0;
> +}
> +
> +static void audm2m_stop_streaming(struct vb2_queue *q)
> +{
> +	struct audm2m_ctx *ctx = vb2_get_drv_priv(q);
> +	struct vb2_v4l2_buffer *vbuf;
> +
> +	for (;;) {
> +		if (V4L2_TYPE_IS_OUTPUT(q->type))
> +			vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +		else
> +			vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +		if (!vbuf)
> +			return;
> +		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
> +	}
> +}
> +
> +static const struct vb2_ops audm2m_qops = {
> +	.queue_setup	 = audm2m_queue_setup,
> +	.buf_queue	 = audm2m_buf_queue,
> +	.start_streaming = audm2m_start_streaming,
> +	.stop_streaming  = audm2m_stop_streaming,
> +	.wait_prepare	 = vb2_ops_wait_prepare,
> +	.wait_finish	 = vb2_ops_wait_finish,
> +};
> +
> +static int queue_init(void *priv, struct vb2_queue *src_vq,
> +		      struct vb2_queue *dst_vq)
> +{
> +	struct audm2m_ctx *ctx = priv;
> +	int ret;
> +
> +	src_vq->type = V4L2_BUF_TYPE_AUDIO_OUTPUT;
> +	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	src_vq->drv_priv = ctx;
> +	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> +	src_vq->ops = &audm2m_qops;
> +	src_vq->mem_ops = &vb2_vmalloc_memops;
> +	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	src_vq->lock = &ctx->vb_mutex;
> +	src_vq->min_buffers_needed = 1;

Drop this, it's not needed.

> +
> +	ret = vb2_queue_init(src_vq);
> +	if (ret)
> +		return ret;
> +
> +	dst_vq->type = V4L2_BUF_TYPE_AUDIO_CAPTURE;
> +	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	dst_vq->drv_priv = ctx;
> +	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> +	dst_vq->ops = &audm2m_qops;
> +	dst_vq->mem_ops = &vb2_vmalloc_memops;
> +	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	dst_vq->lock = &ctx->vb_mutex;
> +	dst_vq->min_buffers_needed = 1;

Ditto.

> +
> +	return vb2_queue_init(dst_vq);
> +}
> +
> +static const s64 audm2m_rates[] = {
> +	8000, 16000,
> +};
> +
> +static int audm2m_op_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct audm2m_ctx *ctx =
> +		container_of(ctrl->handler, struct audm2m_ctx, ctrl_handler);
> +	int ret = 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_M2M_AUDIO_SOURCE_RATE:
> +		ctx->q_data[V4L2_M2M_SRC].rate = ctrl->qmenu_int[ctrl->val];
> +		break;
> +	case V4L2_CID_M2M_AUDIO_DEST_RATE:
> +		ctx->q_data[V4L2_M2M_DST].rate = ctrl->qmenu_int[ctrl->val];
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops audm2m_ctrl_ops = {
> +	.s_ctrl = audm2m_op_s_ctrl,
> +};
> +
> +/*
> + * File operations
> + */
> +static int audm2m_open(struct file *file)
> +{
> +	struct audm2m_dev *dev = video_drvdata(file);
> +	struct audm2m_ctx *ctx = NULL;
> +	snd_pcm_format_t fmt;
> +	int width;
> +	int rc = 0;
> +
> +	if (mutex_lock_interruptible(&dev->dev_mutex))
> +		return -ERESTARTSYS;
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx) {
> +		rc = -ENOMEM;
> +		goto open_unlock;
> +	}
> +
> +	v4l2_fh_init(&ctx->fh, video_devdata(file));
> +	file->private_data = &ctx->fh;
> +	ctx->dev = dev;
> +
> +	ctx->q_data[V4L2_M2M_SRC].fourcc = formats[0];
> +	ctx->q_data[V4L2_M2M_SRC].rate = 8000;
> +	ctx->q_data[V4L2_M2M_SRC].channels = 1;
> +
> +	/* Fix to 4096 samples */
> +	fmt = find_format(formats[0]);
> +	width = snd_pcm_format_physical_width(fmt);
> +	ctx->q_data[V4L2_M2M_SRC].buffersize = SAMPLE_NUM * width;
> +	ctx->q_data[V4L2_M2M_DST] = ctx->q_data[V4L2_M2M_SRC];
> +
> +	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(dev->m2m_dev, ctx, &queue_init);
> +
> +	mutex_init(&ctx->vb_mutex);
> +
> +	if (IS_ERR(ctx->fh.m2m_ctx)) {
> +		rc = PTR_ERR(ctx->fh.m2m_ctx);
> +
> +		v4l2_fh_exit(&ctx->fh);
> +		kfree(ctx);
> +		goto open_unlock;
> +	}
> +
> +	v4l2_fh_add(&ctx->fh);
> +
> +	dprintk(dev, 1, "Created instance: %p, m2m_ctx: %p\n",
> +		ctx, ctx->fh.m2m_ctx);
> +
> +	v4l2_ctrl_handler_init(&ctx->ctrl_handler, 2);
> +
> +	v4l2_ctrl_new_int_menu(&ctx->ctrl_handler, &audm2m_ctrl_ops,
> +			       V4L2_CID_M2M_AUDIO_SOURCE_RATE,
> +			       ARRAY_SIZE(audm2m_rates) - 1, 0, audm2m_rates);
> +	v4l2_ctrl_new_int_menu(&ctx->ctrl_handler, &audm2m_ctrl_ops,
> +			       V4L2_CID_M2M_AUDIO_DEST_RATE,
> +			       ARRAY_SIZE(audm2m_rates) - 1, 0, audm2m_rates);
> +
> +	if (ctx->ctrl_handler.error) {
> +		rc = ctx->ctrl_handler.error;
> +		v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> +		goto err_ctrl_handler;
> +	}
> +
> +	ctx->fh.ctrl_handler = &ctx->ctrl_handler;
> +
> +	mutex_unlock(&dev->dev_mutex);
> +
> +	return 0;
> +
> +err_ctrl_handler:
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +open_unlock:
> +	mutex_unlock(&dev->dev_mutex);
> +	return rc;
> +}
> +
> +static int audm2m_release(struct file *file)
> +{
> +	struct audm2m_dev *dev = video_drvdata(file);
> +	struct audm2m_ctx *ctx = file2ctx(file);
> +
> +	dprintk(dev, 1, "Releasing instance %p\n", ctx);
> +
> +	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> +	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_exit(&ctx->fh);
> +	mutex_lock(&dev->dev_mutex);
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	mutex_unlock(&dev->dev_mutex);
> +	kfree(ctx);
> +
> +	return 0;
> +}
> +
> +static void audm2m_device_release(struct video_device *vdev)
> +{
> +	struct audm2m_dev *dev = container_of(vdev, struct audm2m_dev, vfd);
> +
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +	v4l2_m2m_release(dev->m2m_dev);
> +
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	media_device_cleanup(&dev->mdev);
> +#endif
> +	kfree(dev);
> +}
> +
> +static const struct v4l2_file_operations audm2m_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= audm2m_open,
> +	.release	= audm2m_release,
> +	.poll		= v4l2_m2m_fop_poll,
> +	.unlocked_ioctl	= video_ioctl2,
> +	.mmap		= v4l2_m2m_fop_mmap,
> +};
> +
> +static const struct video_device audm2m_videodev = {
> +	.name		= MEM2MEM_NAME,
> +	.vfl_dir	= VFL_DIR_M2M,
> +	.fops		= &audm2m_fops,
> +	.ioctl_ops	= &audm2m_ioctl_ops,
> +	.minor		= -1,
> +	.release	= audm2m_device_release,
> +	.device_caps	= V4L2_CAP_AUDIO_M2M | V4L2_CAP_STREAMING,
> +};
> +
> +static const struct v4l2_m2m_ops m2m_ops = {
> +	.device_run	= device_run,
> +};
> +
> +static const struct media_device_ops audm2m_media_ops = {
> +	.req_validate = vb2_request_validate,
> +	.req_queue = v4l2_m2m_request_queue,
> +};
> +
> +static int audm2m_probe(struct platform_device *pdev)
> +{
> +	struct audm2m_dev *dev;
> +	struct video_device *vfd;
> +	int ret;
> +
> +	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return -ENOMEM;
> +
> +	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
> +	if (ret)
> +		goto error_free;
> +
> +	mutex_init(&dev->dev_mutex);
> +
> +	dev->vfd = audm2m_videodev;
> +	vfd = &dev->vfd;
> +	vfd->lock = &dev->dev_mutex;
> +	vfd->v4l2_dev = &dev->v4l2_dev;
> +
> +	video_set_drvdata(vfd, dev);
> +	platform_set_drvdata(pdev, dev);
> +
> +	dev->m2m_dev = v4l2_m2m_init(&m2m_ops);
> +	if (IS_ERR(dev->m2m_dev)) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem device\n");
> +		ret = PTR_ERR(dev->m2m_dev);
> +		dev->m2m_dev = NULL;
> +		goto error_dev;
> +	}
> +
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	dev->mdev.dev = &pdev->dev;
> +	strscpy(dev->mdev.model, MEM2MEM_NAME, sizeof(dev->mdev.model));
> +	snprintf(dev->mdev.bus_info, sizeof(dev->mdev.bus_info),
> +		 "platform:%s", MEM2MEM_NAME);
> +	media_device_init(&dev->mdev);
> +	dev->mdev.ops = &audm2m_media_ops;
> +	dev->v4l2_dev.mdev = &dev->mdev;
> +#endif
> +
> +	ret = video_register_device(vfd, VFL_TYPE_AUDIO, 0);
> +	if (ret) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
> +		goto error_m2m;
> +	}
> +
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	ret = v4l2_m2m_register_media_controller(dev->m2m_dev, vfd,
> +						 MEDIA_ENT_F_PROC_AUDIO_RESAMPLER);
> +	if (ret) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem media controller\n");
> +		goto error_v4l2;
> +	}
> +
> +	ret = media_device_register(&dev->mdev);
> +	if (ret) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to register mem2mem media device\n");
> +		goto error_m2m_mc;
> +	}
> +#endif
> +
> +	v4l2_info(&dev->v4l2_dev,
> +		  "Device registered as /dev/v4l-audio%d\n", vfd->num);
> +
> +	return 0;
> +
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +error_m2m_mc:
> +	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
> +#endif
> +error_v4l2:
> +	video_unregister_device(&dev->vfd);
> +	/* audm2m_device_release called by video_unregister_device to release various objects */
> +	return ret;
> +error_m2m:
> +	v4l2_m2m_release(dev->m2m_dev);
> +error_dev:
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +error_free:
> +	kfree(dev);
> +
> +	return ret;
> +}
> +
> +static void audm2m_remove(struct platform_device *pdev)
> +{
> +	struct audm2m_dev *dev = platform_get_drvdata(pdev);
> +
> +	v4l2_info(&dev->v4l2_dev, "Removing " MEM2MEM_NAME);
> +
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	media_device_unregister(&dev->mdev);
> +	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
> +#endif
> +	video_unregister_device(&dev->vfd);
> +}
> +
> +static struct platform_driver audm2m_pdrv = {
> +	.probe		= audm2m_probe,
> +	.remove_new	= audm2m_remove,
> +	.driver		= {
> +		.name	= MEM2MEM_NAME,
> +	},
> +};
> +
> +static void __exit audm2m_exit(void)
> +{
> +	platform_driver_unregister(&audm2m_pdrv);
> +	platform_device_unregister(&audm2m_pdev);
> +}
> +
> +static int __init audm2m_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_device_register(&audm2m_pdev);
> +	if (ret)
> +		return ret;
> +
> +	ret = platform_driver_register(&audm2m_pdrv);
> +	if (ret)
> +		platform_device_unregister(&audm2m_pdev);
> +
> +	return ret;
> +}
> +
> +module_init(audm2m_init);
> +module_exit(audm2m_exit);

Regards,

	Hans
