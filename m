Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CADE7BE409
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 17:11:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S42Z33pscz3vXm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 02:11:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=srs0=b6ql=fx=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S42YV06chz3c6Q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 02:11:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2CFE1CE14EB;
	Mon,  9 Oct 2023 15:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAC26C433C7;
	Mon,  9 Oct 2023 15:11:18 +0000 (UTC)
Message-ID: <2c037e97-ca73-4c7c-b09e-302c725c1a94@xs4all.nl>
Date: Mon, 9 Oct 2023 17:11:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 11/11] media: audm2m: add virtual driver for audio
 memory to memory
Content-Language: en-US, nl
To: Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
References: <1695891619-32393-1-git-send-email-shengjiu.wang@nxp.com>
 <1695891619-32393-12-git-send-email-shengjiu.wang@nxp.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <1695891619-32393-12-git-send-email-shengjiu.wang@nxp.com>
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

On 28/09/2023 11:00, Shengjiu Wang wrote:
> Audio memory to memory virtual driver use video memory to memory
> virtual driver vim2m.c as example. The main difference is
> device type is VFL_TYPE_AUDIO and device cap type is V4L2_CAP_AUDIO_M2M.
> 
> The device_run function is a dummy function, which is simply
> copy the data from input buffer to output buffer.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/media/test-drivers/Kconfig  |   9 +
>  drivers/media/test-drivers/Makefile |   1 +
>  drivers/media/test-drivers/audm2m.c | 808 ++++++++++++++++++++++++++++
>  3 files changed, 818 insertions(+)
>  create mode 100644 drivers/media/test-drivers/audm2m.c
> 
> diff --git a/drivers/media/test-drivers/Kconfig b/drivers/media/test-drivers/Kconfig
> index 459b433e9fae..be60d73cbf97 100644
> --- a/drivers/media/test-drivers/Kconfig
> +++ b/drivers/media/test-drivers/Kconfig
> @@ -17,6 +17,15 @@ config VIDEO_VIM2M
>  	  This is a virtual test device for the memory-to-memory driver
>  	  framework.
>  
> +config VIDEO_AUDM2M
> +	tristate "Virtual Memory-to-Memory Driver For Audio"
> +	depends on VIDEO_DEV
> +	select VIDEOBUF2_VMALLOC
> +	select V4L2_MEM2MEM_DEV
> +	help
> +	  This is a virtual audio test device for the memory-to-memory driver
> +	  framework.
> +
>  source "drivers/media/test-drivers/vicodec/Kconfig"
>  source "drivers/media/test-drivers/vimc/Kconfig"
>  source "drivers/media/test-drivers/vivid/Kconfig"
> diff --git a/drivers/media/test-drivers/Makefile b/drivers/media/test-drivers/Makefile
> index 740714a4584d..b53ed7e6eaf1 100644
> --- a/drivers/media/test-drivers/Makefile
> +++ b/drivers/media/test-drivers/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_DVB_VIDTV) += vidtv/
>  
>  obj-$(CONFIG_VIDEO_VICODEC) += vicodec/
>  obj-$(CONFIG_VIDEO_VIM2M) += vim2m.o
> +obj-$(CONFIG_VIDEO_AUDM2M) += audm2m.o
>  obj-$(CONFIG_VIDEO_VIMC) += vimc/
>  obj-$(CONFIG_VIDEO_VIVID) += vivid/
>  obj-$(CONFIG_VIDEO_VISL) += visl/
> diff --git a/drivers/media/test-drivers/audm2m.c b/drivers/media/test-drivers/audm2m.c
> new file mode 100644
> index 000000000000..566cfc48748b
> --- /dev/null
> +++ b/drivers/media/test-drivers/audm2m.c
> @@ -0,0 +1,808 @@
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
> +MODULE_VERSION("0.1");
> +MODULE_ALIAS("audio_mem2mem_testdev");
> +
> +static unsigned int debug;
> +module_param(debug, uint, 0644);
> +MODULE_PARM_DESC(debug, "debug level");
> +
> +/* Flags that indicate a format can be used for capture/output */
> +#define MEM2MEM_CAPTURE	BIT(0)
> +#define MEM2MEM_OUTPUT	BIT(1)
> +
> +#define MEM2MEM_NAME "audm2m"

All the V4L2 virtual drivers start with 'vi', so call this viaudm2m.

Or perhaps just viaudio?

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
> +struct audm2m_fmt {
> +	u32	fourcc;
> +	snd_pcm_format_t     format;
> +	u32     types;
> +};
> +
> +static struct audm2m_fmt formats[] = {
> +	{
> +		.fourcc = V4L2_AUDIO_FMT_S8,
> +		.format = SNDRV_PCM_FORMAT_S8,

You can easily convert from a fourcc to the pcm format, I think it
would be useful to have macros in videodev2.h that can convert from one
to the other. That avoids mistakes, and it will simplify this code as
well (no need to provide both fourcc and format here). That's also
true for the previous patch.

> +		.types  = MEM2MEM_CAPTURE | MEM2MEM_OUTPUT,

The types field seems unnecessary since it is always the same. Just drop it.

> +	},
> +	{
> +		.fourcc = V4L2_AUDIO_FMT_S16_LE,
> +		.format = SNDRV_PCM_FORMAT_S16_LE,
> +		.types  = MEM2MEM_CAPTURE | MEM2MEM_OUTPUT,
> +	},
> +	{
> +		.fourcc = V4L2_AUDIO_FMT_U16_LE,
> +		.format = SNDRV_PCM_FORMAT_U16_LE,
> +		.types  = MEM2MEM_CAPTURE | MEM2MEM_OUTPUT,
> +	},
> +	{
> +		.fourcc = V4L2_AUDIO_FMT_S24_LE,
> +		.format = SNDRV_PCM_FORMAT_S24_LE,
> +		.types  = MEM2MEM_CAPTURE | MEM2MEM_OUTPUT,
> +	},
> +	{
> +		.fourcc = V4L2_AUDIO_FMT_S24_3LE,
> +		.format = SNDRV_PCM_FORMAT_S24_3LE,
> +		.types  = MEM2MEM_CAPTURE | MEM2MEM_OUTPUT,
> +	},
> +	{
> +		.fourcc = V4L2_AUDIO_FMT_U24_LE,
> +		.format = SNDRV_PCM_FORMAT_U24_LE,
> +		.types  = MEM2MEM_CAPTURE | MEM2MEM_OUTPUT,
> +	},
> +	{
> +		.fourcc = V4L2_AUDIO_FMT_U24_3LE,
> +		.format = SNDRV_PCM_FORMAT_U24_3LE,
> +		.types  = MEM2MEM_CAPTURE | MEM2MEM_OUTPUT,
> +	},
> +	{
> +		.fourcc = V4L2_AUDIO_FMT_S32_LE,
> +		.format = SNDRV_PCM_FORMAT_S32_LE,
> +		.types  = MEM2MEM_CAPTURE | MEM2MEM_OUTPUT,
> +	},
> +	{
> +		.fourcc = V4L2_AUDIO_FMT_U32_LE,
> +		.format = SNDRV_PCM_FORMAT_U32_LE,
> +		.types  = MEM2MEM_CAPTURE | MEM2MEM_OUTPUT,
> +	},
> +	{
> +		.fourcc = V4L2_AUDIO_FMT_S20_3LE,
> +		.format = SNDRV_PCM_FORMAT_S20_3LE,
> +		.types  = MEM2MEM_CAPTURE | MEM2MEM_OUTPUT,
> +	},
> +	{
> +		.fourcc = V4L2_AUDIO_FMT_U20_3LE,
> +		.format = SNDRV_PCM_FORMAT_U20_3LE,
> +		.types  = MEM2MEM_CAPTURE | MEM2MEM_OUTPUT,
> +	},
> +};
> +
> +#define NUM_FORMATS ARRAY_SIZE(formats)
> +
> +/* Per-queue, driver-specific private data */
> +struct audm2m_q_data {
> +	unsigned int		rate;
> +	unsigned int		channels;
> +	unsigned int		buffersize;
> +	struct audm2m_fmt	*fmt;
> +};
> +
> +enum {
> +	V4L2_M2M_SRC = 0,
> +	V4L2_M2M_DST = 1,
> +};
> +
> +static struct audm2m_fmt *find_format(u32 fourcc)
> +{
> +	struct audm2m_fmt *fmt;
> +	unsigned int k;
> +
> +	for (k = 0; k < NUM_FORMATS; k++) {
> +		fmt = &formats[k];
> +		if (fmt->fourcc == fourcc)
> +			break;
> +	}
> +
> +	if (k == NUM_FORMATS)
> +		return NULL;
> +
> +	return &formats[k];
> +}
> +
> +struct audm2m_dev {
> +	struct v4l2_device	v4l2_dev;
> +	struct video_device	vfd;
> +
> +	atomic_t		num_inst;
> +	struct mutex		dev_mutex;
> +
> +	struct v4l2_m2m_dev	*m2m_dev;
> +};
> +
> +struct audm2m_ctx {
> +	struct v4l2_fh		fh;
> +	struct audm2m_dev	*dev;
> +
> +	struct mutex		vb_mutex;
> +
> +	/* Abort requested by m2m */
> +	int			aborting;
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
> +	switch (type) {
> +	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> +		return &ctx->q_data[V4L2_M2M_SRC];
> +	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> +		return &ctx->q_data[V4L2_M2M_DST];
> +	default:
> +		return NULL;
> +	}

It's painful to have to check for NULL pointers, and it really can never
be anything but AUDIO_OUTPUT or _CAPTURE.

So just do:

	if (type == V4L2_BUF_TYPE_AUDIO_OUTPUT:
		return &ctx->q_data[V4L2_M2M_SRC];
	return &ctx->q_data[V4L2_M2M_DST];

I see this code and other code has been copied from vim2m.c. That driver
needs to be brought up to date w.r.t. the mem2mem framework, it's a bit
old fashioned at places.

> +}
> +
> +static const char *type_name(enum v4l2_buf_type type)
> +{
> +	switch (type) {
> +	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> +		return "Output";
> +	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> +		return "Capture";
> +	default:
> +		return "Invalid";
> +	}

You can do something similar here.

> +}
> +
> +/*
> + * mem2mem callbacks
> + */
> +
> +/*
> + * job_ready() - check whether an instance is ready to be scheduled to run
> + */
> +static int job_ready(void *priv)
> +{
> +	struct audm2m_ctx *ctx = priv;
> +
> +	if (v4l2_m2m_num_src_bufs_ready(ctx->fh.m2m_ctx) < 1 ||
> +	    v4l2_m2m_num_dst_bufs_ready(ctx->fh.m2m_ctx) < 1) {
> +		dprintk(ctx->dev, 1, "Not enough buffers available\n");
> +		return 0;
> +	}
> +
> +	return 1;
> +}

There should be no need for job_ready, since that check is the default
check if job_ready is not supplied.

> +
> +static void job_abort(void *priv)
> +{
> +	struct audm2m_ctx *ctx = priv;
> +
> +	/* Will cancel the transaction in the next interrupt handler */
> +	ctx->aborting = 1;
> +}

I think this is not needed either.

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
> +	int src_size, dst_size;
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
> +
> +	/* Process the conversion */
> +	src_size = vb2_get_plane_payload(&src_buf->vb2_buf, 0);
> +
> +	if (src_size > q_data_dst->buffersize)
> +		dst_size = q_data_dst->buffersize;
> +	else
> +		dst_size = src_size;
> +
> +	memcpy(vb2_plane_vaddr(&dst_buf->vb2_buf, 0),
> +	       vb2_plane_vaddr(&src_buf->vb2_buf, 0),
> +	       dst_size);
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
> +
> +	return 0;
> +}
> +
> +static int enum_fmt(struct v4l2_fmtdesc *f, u32 type)
> +{
> +	int i, num;
> +	struct audm2m_fmt *fmt;
> +
> +	num = 0;
> +
> +	for (i = 0; i < NUM_FORMATS; ++i) {
> +		if (formats[i].types & type) {
> +			if (num == f->index)
> +				break;
> +			/*
> +			 * Correct type but haven't reached our index yet,
> +			 * just increment per-type index
> +			 */
> +			++num;
> +		}
> +	}
> +
> +	if (i < NUM_FORMATS) {
> +		/* Format found */
> +		fmt = &formats[i];
> +		f->pixelformat = fmt->fourcc;
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
> +	return enum_fmt(f, MEM2MEM_CAPTURE);
> +}
> +
> +static int audm2m_enum_fmt_audio_out(struct file *file, void *priv,
> +				     struct v4l2_fmtdesc *f)
> +{
> +	return enum_fmt(f, MEM2MEM_OUTPUT);
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
> +	f->fmt.audio.pixelformat = q_data->fmt->fourcc;
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
> +static int audm2m_try_fmt(struct v4l2_format *f, struct audm2m_fmt *fmt)
> +{
> +	if (f->fmt.audio.channels < 1)
> +		f->fmt.audio.channels = 1;
> +	else if (f->fmt.audio.channels > 8)
> +		f->fmt.audio.channels = 8;
> +
> +	f->fmt.audio.buffersize = f->fmt.audio.channels *
> +				  snd_pcm_format_physical_width(fmt->format) *
> +				  SAMPLE_NUM;
> +	return 0;
> +}
> +
> +static int audm2m_try_fmt_audio_cap(struct file *file, void *priv,
> +				    struct v4l2_format *f)
> +{
> +	struct audm2m_fmt *fmt;
> +	struct audm2m_ctx *ctx = file2ctx(file);
> +
> +	fmt = find_format(f->fmt.audio.pixelformat);
> +	if (!fmt) {
> +		f->fmt.audio.pixelformat = formats[0].fourcc;
> +		fmt = find_format(f->fmt.audio.pixelformat);
> +	}
> +
> +	if (!(fmt->types & MEM2MEM_CAPTURE)) {
> +		v4l2_err(&ctx->dev->v4l2_dev,
> +			 "Fourcc format (0x%08x) invalid.\n",
> +			 f->fmt.audio.pixelformat);
> +		return -EINVAL;
> +	}
> +
> +	return audm2m_try_fmt(f, fmt);
> +}
> +
> +static int audm2m_try_fmt_audio_out(struct file *file, void *priv,
> +				    struct v4l2_format *f)
> +{
> +	struct audm2m_fmt *fmt;
> +	struct audm2m_ctx *ctx = file2ctx(file);
> +
> +	fmt = find_format(f->fmt.audio.pixelformat);
> +	if (!fmt) {
> +		f->fmt.audio.pixelformat = formats[0].fourcc;
> +		fmt = find_format(f->fmt.audio.pixelformat);
> +	}
> +
> +	if (!(fmt->types & MEM2MEM_OUTPUT)) {
> +		v4l2_err(&ctx->dev->v4l2_dev,
> +			 "Fourcc format (0x%08x) invalid.\n",
> +			 f->fmt.audio.pixelformat);
> +		return -EINVAL;
> +	}
> +
> +	return audm2m_try_fmt(f, fmt);
> +}
> +
> +static int audm2m_s_fmt(struct audm2m_ctx *ctx, struct v4l2_format *f)
> +{
> +	struct audm2m_q_data *q_data;
> +	struct vb2_queue *vq;
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
> +	q_data->fmt	= find_format(f->fmt.audio.pixelformat);
> +	q_data->channels = f->fmt.audio.channels;
> +	q_data->buffersize = q_data->channels *
> +			     snd_pcm_format_physical_width(q_data->fmt->format) *
> +			     SAMPLE_NUM;
> +
> +	dprintk(ctx->dev, 1,
> +		"Format for type %s: %d/%d, fmt: %c%c%c%c\n",
> +		type_name(f->type), q_data->rate,
> +		q_data->channels,
> +		(q_data->fmt->fourcc & 0xff),
> +		(q_data->fmt->fourcc >>  8) & 0xff,
> +		(q_data->fmt->fourcc >> 16) & 0xff,
> +		(q_data->fmt->fourcc >> 24) & 0xff);
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
> +	if (!q_data)
> +		return -EINVAL;

So this NULL check can be dropped.

Here you need to add:

	if (*nplanes)
		return sizes[0] < q_data->buffersize ? -EINVAL : 0;

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
> +	if (!q_data)
> +		return -EINVAL;

This can be dropped.

> +
> +	if (V4L2_TYPE_IS_OUTPUT(q->type))
> +		ctx->aborting = 0;

And I think the whole ctx->aborting field can be dropped.

> +
> +	return 0;
> +}

That would make this an empty function...

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

...and so this callback can be dropped.

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
> +
> +	return vb2_queue_init(dst_vq);
> +}
> +
> +/*
> + * File operations
> + */
> +static int audm2m_open(struct file *file)
> +{
> +	struct audm2m_dev *dev = video_drvdata(file);
> +	struct audm2m_ctx *ctx = NULL;
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
> +	ctx->q_data[V4L2_M2M_SRC].fmt = &formats[0];
> +	ctx->q_data[V4L2_M2M_SRC].rate = 8000;
> +	ctx->q_data[V4L2_M2M_SRC].channels = 2;
> +
> +	/* Fix to 4096 samples */
> +	width = snd_pcm_format_physical_width(formats[0].format);
> +	ctx->q_data[V4L2_M2M_SRC].buffersize = SAMPLE_NUM * 2 * width;
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
> +	atomic_inc(&dev->num_inst);

Just drop this atomic, it it's only used below, for no good reason.
Really should be dropped from vim2m as well.

> +
> +	dprintk(dev, 1, "Created instance: %p, m2m_ctx: %p\n",
> +		ctx, ctx->fh.m2m_ctx);
> +
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
> +	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_exit(&ctx->fh);
> +	mutex_lock(&dev->dev_mutex);
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	mutex_unlock(&dev->dev_mutex);
> +	kfree(ctx);
> +
> +	atomic_dec(&dev->num_inst);
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
> +	.job_ready	= job_ready,
> +	.job_abort	= job_abort,
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
> +	atomic_set(&dev->num_inst, 0);
> +	mutex_init(&dev->dev_mutex);
> +
> +	dev->vfd = audm2m_videodev;
> +	vfd = &dev->vfd;
> +	vfd->lock = &dev->dev_mutex;
> +	vfd->v4l2_dev = &dev->v4l2_dev;
> +
> +	video_set_drvdata(vfd, dev);
> +	v4l2_info(&dev->v4l2_dev,
> +		  "Device registered as /dev/v4l-audio%d\n", vfd->num);
> +
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
> +	ret = video_register_device(vfd, VFL_TYPE_AUDIO, 0);
> +	if (ret) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
> +		goto error_m2m;
> +	}
> +
> +	return 0;
> +
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
