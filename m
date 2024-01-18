Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD608312A2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jan 2024 07:14:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B49SolAo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TFss74JPqz3cBW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jan 2024 17:14:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B49SolAo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TFsrD6dhgz2yVG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jan 2024 17:13:30 +1100 (AEDT)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3619e804f3aso477575ab.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jan 2024 22:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705558406; x=1706163206; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psNDQHRCyv1u6oorOD5ItiDL1q1l1yimVzhYqMm/C90=;
        b=B49SolAohamr3d3cp23fGj6WQMUqdSXsX2XWzHF3RYffs0g5bIBy6YpaxaTW/Q8lWA
         fzbbhdi5R71QMTuZbQDL1DGsKngDx1LHOrJwHnQ0D2LyiOpcfpvyHuEAiNPKYBxIkqfU
         VGEhb3c/AQSNpydAGLflYhqngT3hCRalUM5soU3tLGryJMbCpI13g8kuiRYnMLLL/XFA
         bkhxWWpthcOvetzBbDBnzNtLzwx3cDFkKdaMFt3RJmKZZPd5bmdrTqacBFGAahi8+r4q
         IyplpNvLCuw5wSvq3v57U+0Vz6fsMvrHSFYybGYASC7z5nqILXyDKrOcESXo1dtFUS2v
         DD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705558406; x=1706163206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psNDQHRCyv1u6oorOD5ItiDL1q1l1yimVzhYqMm/C90=;
        b=u1ncjENQvF0w3Z9uM4lK2uGA0xz++ewKc+oWrGi0qmW1b40A0UV6DnGOUci+YRf/qZ
         sxHKPlvSengpenzxasGqkYmsIL1n2QnaPH3qvHqdfJrdTrdbmySDoedb15JS1QPcmYZH
         ELXJMOlRh8QJNUgX5cr6TzuqmJIDOVSfYsyGbBvwMmKivxQ79LtAiwYacr4t6QfdKpCP
         cy1j5hPveakbJAJaWpuHf0boc2vmHrdD9W6x+p8ksOR1RRcWRNb78+6AG7p4FqOcvPXx
         R8QXo6Swms8XGZZSVOuEJI4YjcJg/h0+9ByhDKVOb4xt5KzouUTIydeI2qQXumxP0Che
         c1DA==
X-Gm-Message-State: AOJu0YzeRM3BgepPQKCjAHcPabhaglAY53tC41Skyrdd8hWsmE3Jgyeg
	xWJ9HBJEjSX/jtrs8bcWU79zmOOG6pW7TB9ZqYB9aHz6KnVUCKxBMekHps82VAd6sBfLiQmCj5K
	xp98//DdQIhY7KDG75tC89pkeIdM=
X-Google-Smtp-Source: AGHT+IFP7Ef+7i1gm6eTzc4sfzIVfocxh7jqKXEC8s6NaBmUAzTMnzDFJAUS1BOOymEU6CEFMsrkKqwG5hcjHr23xTY=
X-Received: by 2002:a92:4a0e:0:b0:35f:efdc:764e with SMTP id
 m14-20020a924a0e000000b0035fefdc764emr439660ilf.32.1705558406287; Wed, 17 Jan
 2024 22:13:26 -0800 (PST)
MIME-Version: 1.0
References: <1700637838-6743-1-git-send-email-shengjiu.wang@nxp.com>
 <1700637838-6743-16-git-send-email-shengjiu.wang@nxp.com> <6d96cf56-c534-4abf-8819-03cd32fda3d5@xs4all.nl>
In-Reply-To: <6d96cf56-c534-4abf-8819-03cd32fda3d5@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 18 Jan 2024 14:13:15 +0800
Message-ID: <CAA+D8ANfkQkuV9YgQQ1ggS2G0GhqvmhZrA6Yn-et0E5z6mPSxQ@mail.gmail.com>
Subject: Re: [PATCH v11 15/15] media: vim2m-audio: add virtual driver for
 audio memory to memory
To: Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org, broonie@kernel.org, sakari.ailus@iki.fi, perex@perex.cz, mchehab@kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 17, 2024 at 6:32=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 22/11/2023 08:23, Shengjiu Wang wrote:
> > Audio memory to memory virtual driver use video memory to memory
> > virtual driver vim2m.c as example. The main difference is
> > device type is VFL_TYPE_AUDIO and device cap type is V4L2_CAP_AUDIO_M2M=
.
> >
> > The device_run function is a dummy function, which is simply
> > copy the data from input buffer to output buffer.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/media/test-drivers/Kconfig       |  11 +
> >  drivers/media/test-drivers/Makefile      |   1 +
> >  drivers/media/test-drivers/vim2m-audio.c | 799 +++++++++++++++++++++++
> >  3 files changed, 811 insertions(+)
> >  create mode 100644 drivers/media/test-drivers/vim2m-audio.c
> >
> > diff --git a/drivers/media/test-drivers/Kconfig b/drivers/media/test-dr=
ivers/Kconfig
> > index 459b433e9fae..55f8af6ee4e2 100644
> > --- a/drivers/media/test-drivers/Kconfig
> > +++ b/drivers/media/test-drivers/Kconfig
> > @@ -17,6 +17,17 @@ config VIDEO_VIM2M
> >         This is a virtual test device for the memory-to-memory driver
> >         framework.
> >
> > +config VIDEO_VIM2M_AUDIO
> > +     tristate "Virtual Memory-to-Memory Driver For Audio"
> > +     depends on VIDEO_DEV
> > +     select VIDEOBUF2_VMALLOC
> > +     select V4L2_MEM2MEM_DEV
> > +     select MEDIA_CONTROLLER
> > +     select MEDIA_CONTROLLER_REQUEST_API
>
> Drop this. This option has been removed.
>
> > +     help
> > +       This is a virtual audio test device for the memory-to-memory dr=
iver
> > +       framework.
> > +
> >  source "drivers/media/test-drivers/vicodec/Kconfig"
> >  source "drivers/media/test-drivers/vimc/Kconfig"
> >  source "drivers/media/test-drivers/vivid/Kconfig"
> > diff --git a/drivers/media/test-drivers/Makefile b/drivers/media/test-d=
rivers/Makefile
> > index 740714a4584d..0c61c9ada3e1 100644
> > --- a/drivers/media/test-drivers/Makefile
> > +++ b/drivers/media/test-drivers/Makefile
> > @@ -10,6 +10,7 @@ obj-$(CONFIG_DVB_VIDTV) +=3D vidtv/
> >
> >  obj-$(CONFIG_VIDEO_VICODEC) +=3D vicodec/
> >  obj-$(CONFIG_VIDEO_VIM2M) +=3D vim2m.o
> > +obj-$(CONFIG_VIDEO_VIM2M_AUDIO) +=3D vim2m-audio.o
> >  obj-$(CONFIG_VIDEO_VIMC) +=3D vimc/
> >  obj-$(CONFIG_VIDEO_VIVID) +=3D vivid/
> >  obj-$(CONFIG_VIDEO_VISL) +=3D visl/
> > diff --git a/drivers/media/test-drivers/vim2m-audio.c b/drivers/media/t=
est-drivers/vim2m-audio.c
> > new file mode 100644
> > index 000000000000..72806ada8628
> > --- /dev/null
> > +++ b/drivers/media/test-drivers/vim2m-audio.c
> > @@ -0,0 +1,799 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * A virtual v4l2-mem2mem example for audio device.
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/delay.h>
> > +#include <linux/fs.h>
> > +#include <linux/sched.h>
> > +#include <linux/slab.h>
> > +
> > +#include <linux/platform_device.h>
> > +#include <media/v4l2-mem2mem.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-ioctl.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/videobuf2-vmalloc.h>
> > +#include <sound/dmaengine_pcm.h>
> > +
> > +MODULE_DESCRIPTION("Virtual device for audio mem2mem testing");
> > +MODULE_LICENSE("GPL");
> > +
> > +static unsigned int debug;
> > +module_param(debug, uint, 0644);
> > +MODULE_PARM_DESC(debug, "debug level");
> > +
> > +#define MEM2MEM_NAME "vim2m-audio"
> > +
> > +#define dprintk(dev, lvl, fmt, arg...) \
> > +     v4l2_dbg(lvl, debug, &(dev)->v4l2_dev, "%s: " fmt, __func__, ## a=
rg)
> > +
> > +#define SAMPLE_NUM 4096
> > +
> > +static void audm2m_dev_release(struct device *dev)
> > +{}
> > +
> > +static struct platform_device audm2m_pdev =3D {
> > +     .name           =3D MEM2MEM_NAME,
> > +     .dev.release    =3D audm2m_dev_release,
> > +};
> > +
> > +static u32 formats[] =3D {
> > +     V4L2_AUDIO_FMT_S16_LE,
> > +};
> > +
> > +#define NUM_FORMATS ARRAY_SIZE(formats)
> > +
> > +/* Per-queue, driver-specific private data */
> > +struct audm2m_q_data {
> > +     unsigned int            rate;
> > +     unsigned int            channels;
> > +     unsigned int            buffersize;
> > +     unsigned int            sequence;
> > +     u32                     fourcc;
> > +};
> > +
> > +enum {
> > +     V4L2_M2M_SRC =3D 0,
> > +     V4L2_M2M_DST =3D 1,
> > +};
> > +
> > +static snd_pcm_format_t find_format(u32 fourcc)
> > +{
> > +     snd_pcm_format_t fmt;
> > +     unsigned int k;
> > +
> > +     for (k =3D 0; k < NUM_FORMATS; k++) {
> > +             if (formats[k] =3D=3D fourcc)
> > +                     break;
> > +     }
> > +
> > +     if (k =3D=3D NUM_FORMATS)
> > +             return 0;
> > +
> > +     fmt =3D v4l2_fourcc_to_audfmt(formats[k]);
> > +
> > +     return fmt;
> > +}
> > +
> > +struct audm2m_dev {
> > +     struct v4l2_device      v4l2_dev;
> > +     struct video_device     vfd;
> > +
> > +     struct mutex            dev_mutex;
> > +
> > +     struct v4l2_m2m_dev     *m2m_dev;
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +     struct media_device     mdev;
> > +#endif
> > +};
> > +
> > +struct audm2m_ctx {
> > +     struct v4l2_fh          fh;
> > +     struct v4l2_ctrl_handler        ctrl_handler;
> > +     struct audm2m_dev       *dev;
> > +
> > +     struct mutex            vb_mutex;
> > +
> > +     /* Source and destination queue data */
> > +     struct audm2m_q_data   q_data[2];
> > +};
> > +
> > +static inline struct audm2m_ctx *file2ctx(struct file *file)
> > +{
> > +     return container_of(file->private_data, struct audm2m_ctx, fh);
> > +}
> > +
> > +static struct audm2m_q_data *get_q_data(struct audm2m_ctx *ctx,
> > +                                     enum v4l2_buf_type type)
> > +{
> > +     if (type =3D=3D V4L2_BUF_TYPE_AUDIO_OUTPUT)
> > +             return &ctx->q_data[V4L2_M2M_SRC];
> > +     return &ctx->q_data[V4L2_M2M_DST];
> > +}
> > +
> > +static const char *type_name(enum v4l2_buf_type type)
> > +{
> > +     if (type =3D=3D V4L2_BUF_TYPE_AUDIO_OUTPUT)
> > +             return "Output";
> > +     return "Capture";
> > +}
> > +
> > +/*
> > + * mem2mem callbacks
> > + */
> > +
> > +/*
> > + * device_run() - prepares and starts the device
> > + */
> > +static void device_run(void *priv)
> > +{
> > +     struct audm2m_ctx *ctx =3D priv;
> > +     struct audm2m_dev *audm2m_dev;
> > +     struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > +     struct audm2m_q_data *q_data_src, *q_data_dst;
> > +     int src_size, dst_size =3D 0;
> > +     short *src_addr, *dst_addr;
> > +     int i;
> > +
> > +     audm2m_dev =3D ctx->dev;
> > +
> > +     q_data_src =3D get_q_data(ctx, V4L2_BUF_TYPE_AUDIO_OUTPUT);
> > +     if (!q_data_src)
> > +             return;
> > +
> > +     q_data_dst =3D get_q_data(ctx, V4L2_BUF_TYPE_AUDIO_CAPTURE);
> > +     if (!q_data_dst)
> > +             return;
> > +
> > +     src_buf =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> > +     dst_buf =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > +     src_buf->sequence =3D q_data_src->sequence++;
> > +     dst_buf->sequence =3D q_data_dst->sequence++;
> > +     v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
> > +
> > +     /* Process the conversion */
> > +     src_size =3D vb2_get_plane_payload(&src_buf->vb2_buf, 0);
> > +
> > +     src_addr =3D vb2_plane_vaddr(&src_buf->vb2_buf, 0);
> > +     dst_addr =3D vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
> > +
> > +     if (q_data_src->rate =3D=3D q_data_dst->rate) {
> > +             memcpy(dst_addr, src_addr, src_size);
> > +             dst_size =3D src_size;
> > +     } else if (q_data_src->rate =3D=3D 2 * q_data_dst->rate) {
> > +             /* 8k to 16k */
> > +             for (i =3D 0; i < src_size / 2; i++) {
> > +                     *dst_addr++ =3D *src_addr++;
> > +                     src_addr++;
> > +             }
> > +
> > +             dst_size =3D src_size / 2;
> > +     } else if (q_data_src->rate * 2 =3D=3D q_data_dst->rate) {
> > +             /* 16k to 8k */
> > +             for (i =3D 0; i < src_size / 2; i++) {
> > +                     *dst_addr++ =3D *src_addr;
> > +                     *dst_addr++ =3D *src_addr++;
> > +             }
> > +
> > +             dst_size =3D src_size * 2;
> > +     }
> > +
> > +     vb2_set_plane_payload(&dst_buf->vb2_buf, 0, dst_size);
> > +
> > +     src_buf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> > +     dst_buf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> > +
> > +     v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
> > +     v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
> > +     v4l2_m2m_job_finish(audm2m_dev->m2m_dev, ctx->fh.m2m_ctx);
> > +}
> > +
> > +static int audm2m_querycap(struct file *file, void *priv,
> > +                        struct v4l2_capability *cap)
> > +{
> > +     strscpy(cap->driver, MEM2MEM_NAME, sizeof(cap->driver));
> > +     strscpy(cap->card, MEM2MEM_NAME, sizeof(cap->card));
> > +     snprintf(cap->bus_info, sizeof(cap->bus_info),
> > +              "platform:%s", MEM2MEM_NAME);
>
> You can drop this bus_info line, it's filled in for you.

I see there is a warning from v4l2-compliance test if this line is removed.

warn: v4l2-compliance.cpp(676): media bus_info 'platform:vim2m-audio'
differs from V4L2 bus_info 'platform:vim2m-audio.0'


Best regards
Shengjiu Wang

>
> > +
> > +     return 0;
> > +}
> > +
> > +static int enum_fmt(struct v4l2_fmtdesc *f)
> > +{
> > +     int i, num;
> > +
> > +     num =3D 0;
> > +
> > +     for (i =3D 0; i < NUM_FORMATS; ++i) {
> > +             if (num =3D=3D f->index)
> > +                     break;
> > +             /*
> > +              * Correct type but haven't reached our index yet,
> > +              * just increment per-type index
> > +              */
> > +             ++num;
> > +     }
> > +
> > +     if (i < NUM_FORMATS) {
> > +             /* Format found */
> > +             f->pixelformat =3D formats[i];
> > +             return 0;
> > +     }
> > +
> > +     /* Format not found */
> > +     return -EINVAL;
> > +}
> > +
> > +static int audm2m_enum_fmt_audio_cap(struct file *file, void *priv,
> > +                                  struct v4l2_fmtdesc *f)
> > +{
> > +     return enum_fmt(f);
> > +}
> > +
> > +static int audm2m_enum_fmt_audio_out(struct file *file, void *priv,
> > +                                  struct v4l2_fmtdesc *f)
> > +{
> > +     return enum_fmt(f);
> > +}
> > +
> > +static int audm2m_g_fmt(struct audm2m_ctx *ctx, struct v4l2_format *f)
> > +{
> > +     struct vb2_queue *vq;
> > +     struct audm2m_q_data *q_data;
> > +
> > +     vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> > +     if (!vq)
> > +             return -EINVAL;
> > +
> > +     q_data =3D get_q_data(ctx, f->type);
> > +     if (!q_data)
> > +             return -EINVAL;
> > +
> > +     f->fmt.audio.audioformat =3D q_data->fourcc;
> > +     f->fmt.audio.channels   =3D q_data->channels;
> > +     f->fmt.audio.buffersize =3D q_data->buffersize;
> > +
> > +     return 0;
> > +}
> > +
> > +static int audm2m_g_fmt_audio_out(struct file *file, void *priv,
> > +                               struct v4l2_format *f)
> > +{
> > +     return audm2m_g_fmt(file2ctx(file), f);
> > +}
> > +
> > +static int audm2m_g_fmt_audio_cap(struct file *file, void *priv,
> > +                               struct v4l2_format *f)
> > +{
> > +     return audm2m_g_fmt(file2ctx(file), f);
> > +}
> > +
> > +static int audm2m_try_fmt(struct v4l2_format *f, snd_pcm_format_t fmt)
> > +{
> > +     f->fmt.audio.channels =3D 1;
> > +     f->fmt.audio.buffersize =3D f->fmt.audio.channels *
> > +                               snd_pcm_format_physical_width(fmt) *
> > +                               SAMPLE_NUM;
> > +     return 0;
> > +}
> > +
> > +static int audm2m_try_fmt_audio_cap(struct file *file, void *priv,
> > +                                 struct v4l2_format *f)
> > +{
> > +     snd_pcm_format_t fmt;
> > +
> > +     fmt =3D find_format(f->fmt.audio.audioformat);
> > +     if (!fmt) {
> > +             f->fmt.audio.audioformat =3D formats[0];
> > +             fmt =3D find_format(f->fmt.audio.audioformat);
> > +     }
> > +
> > +     return audm2m_try_fmt(f, fmt);
> > +}
> > +
> > +static int audm2m_try_fmt_audio_out(struct file *file, void *priv,
> > +                                 struct v4l2_format *f)
> > +{
> > +     snd_pcm_format_t fmt;
> > +
> > +     fmt =3D find_format(f->fmt.audio.audioformat);
> > +     if (!fmt) {
> > +             f->fmt.audio.audioformat =3D formats[0];
> > +             fmt =3D find_format(f->fmt.audio.audioformat);
> > +     }
> > +
> > +     return audm2m_try_fmt(f, fmt);
> > +}
> > +
> > +static int audm2m_s_fmt(struct audm2m_ctx *ctx, struct v4l2_format *f)
> > +{
> > +     struct audm2m_q_data *q_data;
> > +     struct vb2_queue *vq;
> > +     snd_pcm_format_t fmt;
> > +
> > +     vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> > +     if (!vq)
> > +             return -EINVAL;
> > +
> > +     q_data =3D get_q_data(ctx, f->type);
> > +     if (!q_data)
> > +             return -EINVAL;
> > +
> > +     if (vb2_is_busy(vq)) {
> > +             v4l2_err(&ctx->dev->v4l2_dev, "%s queue busy\n", __func__=
);
> > +             return -EBUSY;
> > +     }
> > +
> > +     q_data->fourcc  =3D f->fmt.audio.audioformat;
> > +     q_data->channels =3D f->fmt.audio.channels;
> > +
> > +     fmt =3D find_format(f->fmt.audio.audioformat);
> > +     q_data->buffersize =3D q_data->channels *
> > +                          snd_pcm_format_physical_width(fmt) *
> > +                          SAMPLE_NUM;
> > +
> > +     dprintk(ctx->dev, 1,
> > +             "Format for type %s: %d/%d, fmt: %c%c%c%c\n",
> > +             type_name(f->type), q_data->rate,
> > +             q_data->channels,
> > +             (q_data->fourcc & 0xff),
> > +             (q_data->fourcc >>  8) & 0xff,
> > +             (q_data->fourcc >> 16) & 0xff,
> > +             (q_data->fourcc >> 24) & 0xff);
> > +
> > +     return 0;
> > +}
> > +
> > +static int audm2m_s_fmt_audio_cap(struct file *file, void *priv,
> > +                               struct v4l2_format *f)
> > +{
> > +     int ret;
> > +
> > +     ret =3D audm2m_try_fmt_audio_cap(file, priv, f);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return audm2m_s_fmt(file2ctx(file), f);
> > +}
> > +
> > +static int audm2m_s_fmt_audio_out(struct file *file, void *priv,
> > +                               struct v4l2_format *f)
> > +{
> > +     int ret;
> > +
> > +     ret =3D audm2m_try_fmt_audio_out(file, priv, f);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return audm2m_s_fmt(file2ctx(file), f);
> > +}
> > +
> > +static const struct v4l2_ioctl_ops audm2m_ioctl_ops =3D {
> > +     .vidioc_querycap                =3D audm2m_querycap,
> > +
> > +     .vidioc_enum_fmt_audio_cap      =3D audm2m_enum_fmt_audio_cap,
> > +     .vidioc_g_fmt_audio_cap         =3D audm2m_g_fmt_audio_cap,
> > +     .vidioc_try_fmt_audio_cap       =3D audm2m_try_fmt_audio_cap,
> > +     .vidioc_s_fmt_audio_cap         =3D audm2m_s_fmt_audio_cap,
> > +
> > +     .vidioc_enum_fmt_audio_out      =3D audm2m_enum_fmt_audio_out,
> > +     .vidioc_g_fmt_audio_out         =3D audm2m_g_fmt_audio_out,
> > +     .vidioc_try_fmt_audio_out       =3D audm2m_try_fmt_audio_out,
> > +     .vidioc_s_fmt_audio_out         =3D audm2m_s_fmt_audio_out,
> > +
> > +     .vidioc_reqbufs                 =3D v4l2_m2m_ioctl_reqbufs,
> > +     .vidioc_querybuf                =3D v4l2_m2m_ioctl_querybuf,
> > +     .vidioc_qbuf                    =3D v4l2_m2m_ioctl_qbuf,
> > +     .vidioc_dqbuf                   =3D v4l2_m2m_ioctl_dqbuf,
> > +     .vidioc_prepare_buf             =3D v4l2_m2m_ioctl_prepare_buf,
> > +     .vidioc_create_bufs             =3D v4l2_m2m_ioctl_create_bufs,
> > +     .vidioc_expbuf                  =3D v4l2_m2m_ioctl_expbuf,
> > +
> > +     .vidioc_streamon                =3D v4l2_m2m_ioctl_streamon,
> > +     .vidioc_streamoff               =3D v4l2_m2m_ioctl_streamoff,
> > +
> > +     .vidioc_subscribe_event         =3D v4l2_ctrl_subscribe_event,
> > +     .vidioc_unsubscribe_event       =3D v4l2_event_unsubscribe,
> > +};
> > +
> > +/*
> > + * Queue operations
> > + */
> > +static int audm2m_queue_setup(struct vb2_queue *vq,
> > +                           unsigned int *nbuffers,
> > +                           unsigned int *nplanes,
> > +                           unsigned int sizes[],
> > +                           struct device *alloc_devs[])
> > +{
> > +     struct audm2m_ctx *ctx =3D vb2_get_drv_priv(vq);
> > +     struct audm2m_q_data *q_data;
> > +
> > +     q_data =3D get_q_data(ctx, vq->type);
> > +
> > +     if (*nplanes)
> > +             return sizes[0] < q_data->buffersize ? -EINVAL : 0;
> > +
> > +     *nplanes =3D 1;
> > +     sizes[0] =3D q_data->buffersize;
> > +
> > +     dprintk(ctx->dev, 1, "%s: get %d buffer(s) of size %d each.\n",
> > +             type_name(vq->type), *nplanes, sizes[0]);
> > +
> > +     return 0;
> > +}
> > +
> > +static void audm2m_buf_queue(struct vb2_buffer *vb)
> > +{
> > +     struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> > +     struct audm2m_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> > +
> > +     v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> > +}
> > +
> > +static int audm2m_start_streaming(struct vb2_queue *q, unsigned int co=
unt)
> > +{
> > +     struct audm2m_ctx *ctx =3D vb2_get_drv_priv(q);
> > +     struct audm2m_q_data *q_data =3D get_q_data(ctx, q->type);
> > +
> > +     q_data->sequence =3D 0;
> > +     return 0;
> > +}
> > +
> > +static void audm2m_stop_streaming(struct vb2_queue *q)
> > +{
> > +     struct audm2m_ctx *ctx =3D vb2_get_drv_priv(q);
> > +     struct vb2_v4l2_buffer *vbuf;
> > +
> > +     for (;;) {
> > +             if (V4L2_TYPE_IS_OUTPUT(q->type))
> > +                     vbuf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx)=
;
> > +             else
> > +                     vbuf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx)=
;
> > +             if (!vbuf)
> > +                     return;
> > +             v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
> > +     }
> > +}
> > +
> > +static const struct vb2_ops audm2m_qops =3D {
> > +     .queue_setup     =3D audm2m_queue_setup,
> > +     .buf_queue       =3D audm2m_buf_queue,
> > +     .start_streaming =3D audm2m_start_streaming,
> > +     .stop_streaming  =3D audm2m_stop_streaming,
> > +     .wait_prepare    =3D vb2_ops_wait_prepare,
> > +     .wait_finish     =3D vb2_ops_wait_finish,
> > +};
> > +
> > +static int queue_init(void *priv, struct vb2_queue *src_vq,
> > +                   struct vb2_queue *dst_vq)
> > +{
> > +     struct audm2m_ctx *ctx =3D priv;
> > +     int ret;
> > +
> > +     src_vq->type =3D V4L2_BUF_TYPE_AUDIO_OUTPUT;
> > +     src_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> > +     src_vq->drv_priv =3D ctx;
> > +     src_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> > +     src_vq->ops =3D &audm2m_qops;
> > +     src_vq->mem_ops =3D &vb2_vmalloc_memops;
> > +     src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > +     src_vq->lock =3D &ctx->vb_mutex;
> > +     src_vq->min_buffers_needed =3D 1;
>
> Drop this, it's not needed.
>
> > +
> > +     ret =3D vb2_queue_init(src_vq);
> > +     if (ret)
> > +             return ret;
> > +
> > +     dst_vq->type =3D V4L2_BUF_TYPE_AUDIO_CAPTURE;
> > +     dst_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> > +     dst_vq->drv_priv =3D ctx;
> > +     dst_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> > +     dst_vq->ops =3D &audm2m_qops;
> > +     dst_vq->mem_ops =3D &vb2_vmalloc_memops;
> > +     dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > +     dst_vq->lock =3D &ctx->vb_mutex;
> > +     dst_vq->min_buffers_needed =3D 1;
>
> Ditto.
>
> > +
> > +     return vb2_queue_init(dst_vq);
> > +}
> > +
> > +static const s64 audm2m_rates[] =3D {
> > +     8000, 16000,
> > +};
> > +
> > +static int audm2m_op_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +     struct audm2m_ctx *ctx =3D
> > +             container_of(ctrl->handler, struct audm2m_ctx, ctrl_handl=
er);
> > +     int ret =3D 0;
> > +
> > +     switch (ctrl->id) {
> > +     case V4L2_CID_M2M_AUDIO_SOURCE_RATE:
> > +             ctx->q_data[V4L2_M2M_SRC].rate =3D ctrl->qmenu_int[ctrl->=
val];
> > +             break;
> > +     case V4L2_CID_M2M_AUDIO_DEST_RATE:
> > +             ctx->q_data[V4L2_M2M_DST].rate =3D ctrl->qmenu_int[ctrl->=
val];
> > +             break;
> > +     default:
> > +             ret =3D -EINVAL;
> > +             break;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops audm2m_ctrl_ops =3D {
> > +     .s_ctrl =3D audm2m_op_s_ctrl,
> > +};
> > +
> > +/*
> > + * File operations
> > + */
> > +static int audm2m_open(struct file *file)
> > +{
> > +     struct audm2m_dev *dev =3D video_drvdata(file);
> > +     struct audm2m_ctx *ctx =3D NULL;
> > +     snd_pcm_format_t fmt;
> > +     int width;
> > +     int rc =3D 0;
> > +
> > +     if (mutex_lock_interruptible(&dev->dev_mutex))
> > +             return -ERESTARTSYS;
> > +     ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
> > +     if (!ctx) {
> > +             rc =3D -ENOMEM;
> > +             goto open_unlock;
> > +     }
> > +
> > +     v4l2_fh_init(&ctx->fh, video_devdata(file));
> > +     file->private_data =3D &ctx->fh;
> > +     ctx->dev =3D dev;
> > +
> > +     ctx->q_data[V4L2_M2M_SRC].fourcc =3D formats[0];
> > +     ctx->q_data[V4L2_M2M_SRC].rate =3D 8000;
> > +     ctx->q_data[V4L2_M2M_SRC].channels =3D 1;
> > +
> > +     /* Fix to 4096 samples */
> > +     fmt =3D find_format(formats[0]);
> > +     width =3D snd_pcm_format_physical_width(fmt);
> > +     ctx->q_data[V4L2_M2M_SRC].buffersize =3D SAMPLE_NUM * width;
> > +     ctx->q_data[V4L2_M2M_DST] =3D ctx->q_data[V4L2_M2M_SRC];
> > +
> > +     ctx->fh.m2m_ctx =3D v4l2_m2m_ctx_init(dev->m2m_dev, ctx, &queue_i=
nit);
> > +
> > +     mutex_init(&ctx->vb_mutex);
> > +
> > +     if (IS_ERR(ctx->fh.m2m_ctx)) {
> > +             rc =3D PTR_ERR(ctx->fh.m2m_ctx);
> > +
> > +             v4l2_fh_exit(&ctx->fh);
> > +             kfree(ctx);
> > +             goto open_unlock;
> > +     }
> > +
> > +     v4l2_fh_add(&ctx->fh);
> > +
> > +     dprintk(dev, 1, "Created instance: %p, m2m_ctx: %p\n",
> > +             ctx, ctx->fh.m2m_ctx);
> > +
> > +     v4l2_ctrl_handler_init(&ctx->ctrl_handler, 2);
> > +
> > +     v4l2_ctrl_new_int_menu(&ctx->ctrl_handler, &audm2m_ctrl_ops,
> > +                            V4L2_CID_M2M_AUDIO_SOURCE_RATE,
> > +                            ARRAY_SIZE(audm2m_rates) - 1, 0, audm2m_ra=
tes);
> > +     v4l2_ctrl_new_int_menu(&ctx->ctrl_handler, &audm2m_ctrl_ops,
> > +                            V4L2_CID_M2M_AUDIO_DEST_RATE,
> > +                            ARRAY_SIZE(audm2m_rates) - 1, 0, audm2m_ra=
tes);
> > +
> > +     if (ctx->ctrl_handler.error) {
> > +             rc =3D ctx->ctrl_handler.error;
> > +             v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> > +             goto err_ctrl_handler;
> > +     }
> > +
> > +     ctx->fh.ctrl_handler =3D &ctx->ctrl_handler;
> > +
> > +     mutex_unlock(&dev->dev_mutex);
> > +
> > +     return 0;
> > +
> > +err_ctrl_handler:
> > +     v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> > +open_unlock:
> > +     mutex_unlock(&dev->dev_mutex);
> > +     return rc;
> > +}
> > +
> > +static int audm2m_release(struct file *file)
> > +{
> > +     struct audm2m_dev *dev =3D video_drvdata(file);
> > +     struct audm2m_ctx *ctx =3D file2ctx(file);
> > +
> > +     dprintk(dev, 1, "Releasing instance %p\n", ctx);
> > +
> > +     v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> > +     v4l2_fh_del(&ctx->fh);
> > +     v4l2_fh_exit(&ctx->fh);
> > +     mutex_lock(&dev->dev_mutex);
> > +     v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> > +     mutex_unlock(&dev->dev_mutex);
> > +     kfree(ctx);
> > +
> > +     return 0;
> > +}
> > +
> > +static void audm2m_device_release(struct video_device *vdev)
> > +{
> > +     struct audm2m_dev *dev =3D container_of(vdev, struct audm2m_dev, =
vfd);
> > +
> > +     v4l2_device_unregister(&dev->v4l2_dev);
> > +     v4l2_m2m_release(dev->m2m_dev);
> > +
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +     media_device_cleanup(&dev->mdev);
> > +#endif
> > +     kfree(dev);
> > +}
> > +
> > +static const struct v4l2_file_operations audm2m_fops =3D {
> > +     .owner          =3D THIS_MODULE,
> > +     .open           =3D audm2m_open,
> > +     .release        =3D audm2m_release,
> > +     .poll           =3D v4l2_m2m_fop_poll,
> > +     .unlocked_ioctl =3D video_ioctl2,
> > +     .mmap           =3D v4l2_m2m_fop_mmap,
> > +};
> > +
> > +static const struct video_device audm2m_videodev =3D {
> > +     .name           =3D MEM2MEM_NAME,
> > +     .vfl_dir        =3D VFL_DIR_M2M,
> > +     .fops           =3D &audm2m_fops,
> > +     .ioctl_ops      =3D &audm2m_ioctl_ops,
> > +     .minor          =3D -1,
> > +     .release        =3D audm2m_device_release,
> > +     .device_caps    =3D V4L2_CAP_AUDIO_M2M | V4L2_CAP_STREAMING,
> > +};
> > +
> > +static const struct v4l2_m2m_ops m2m_ops =3D {
> > +     .device_run     =3D device_run,
> > +};
> > +
> > +static const struct media_device_ops audm2m_media_ops =3D {
> > +     .req_validate =3D vb2_request_validate,
> > +     .req_queue =3D v4l2_m2m_request_queue,
> > +};
> > +
> > +static int audm2m_probe(struct platform_device *pdev)
> > +{
> > +     struct audm2m_dev *dev;
> > +     struct video_device *vfd;
> > +     int ret;
> > +
> > +     dev =3D kzalloc(sizeof(*dev), GFP_KERNEL);
> > +     if (!dev)
> > +             return -ENOMEM;
> > +
> > +     ret =3D v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
> > +     if (ret)
> > +             goto error_free;
> > +
> > +     mutex_init(&dev->dev_mutex);
> > +
> > +     dev->vfd =3D audm2m_videodev;
> > +     vfd =3D &dev->vfd;
> > +     vfd->lock =3D &dev->dev_mutex;
> > +     vfd->v4l2_dev =3D &dev->v4l2_dev;
> > +
> > +     video_set_drvdata(vfd, dev);
> > +     platform_set_drvdata(pdev, dev);
> > +
> > +     dev->m2m_dev =3D v4l2_m2m_init(&m2m_ops);
> > +     if (IS_ERR(dev->m2m_dev)) {
> > +             v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem device\n=
");
> > +             ret =3D PTR_ERR(dev->m2m_dev);
> > +             dev->m2m_dev =3D NULL;
> > +             goto error_dev;
> > +     }
> > +
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +     dev->mdev.dev =3D &pdev->dev;
> > +     strscpy(dev->mdev.model, MEM2MEM_NAME, sizeof(dev->mdev.model));
> > +     snprintf(dev->mdev.bus_info, sizeof(dev->mdev.bus_info),
> > +              "platform:%s", MEM2MEM_NAME);
> > +     media_device_init(&dev->mdev);
> > +     dev->mdev.ops =3D &audm2m_media_ops;
> > +     dev->v4l2_dev.mdev =3D &dev->mdev;
> > +#endif
> > +
> > +     ret =3D video_register_device(vfd, VFL_TYPE_AUDIO, 0);
> > +     if (ret) {
> > +             v4l2_err(&dev->v4l2_dev, "Failed to register video device=
\n");
> > +             goto error_m2m;
> > +     }
> > +
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +     ret =3D v4l2_m2m_register_media_controller(dev->m2m_dev, vfd,
> > +                                              MEDIA_ENT_F_PROC_AUDIO_R=
ESAMPLER);
> > +     if (ret) {
> > +             v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem media co=
ntroller\n");
> > +             goto error_v4l2;
> > +     }
> > +
> > +     ret =3D media_device_register(&dev->mdev);
> > +     if (ret) {
> > +             v4l2_err(&dev->v4l2_dev, "Failed to register mem2mem medi=
a device\n");
> > +             goto error_m2m_mc;
> > +     }
> > +#endif
> > +
> > +     v4l2_info(&dev->v4l2_dev,
> > +               "Device registered as /dev/v4l-audio%d\n", vfd->num);
> > +
> > +     return 0;
> > +
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +error_m2m_mc:
> > +     v4l2_m2m_unregister_media_controller(dev->m2m_dev);
> > +#endif
> > +error_v4l2:
> > +     video_unregister_device(&dev->vfd);
> > +     /* audm2m_device_release called by video_unregister_device to rel=
ease various objects */
> > +     return ret;
> > +error_m2m:
> > +     v4l2_m2m_release(dev->m2m_dev);
> > +error_dev:
> > +     v4l2_device_unregister(&dev->v4l2_dev);
> > +error_free:
> > +     kfree(dev);
> > +
> > +     return ret;
> > +}
> > +
> > +static void audm2m_remove(struct platform_device *pdev)
> > +{
> > +     struct audm2m_dev *dev =3D platform_get_drvdata(pdev);
> > +
> > +     v4l2_info(&dev->v4l2_dev, "Removing " MEM2MEM_NAME);
> > +
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +     media_device_unregister(&dev->mdev);
> > +     v4l2_m2m_unregister_media_controller(dev->m2m_dev);
> > +#endif
> > +     video_unregister_device(&dev->vfd);
> > +}
> > +
> > +static struct platform_driver audm2m_pdrv =3D {
> > +     .probe          =3D audm2m_probe,
> > +     .remove_new     =3D audm2m_remove,
> > +     .driver         =3D {
> > +             .name   =3D MEM2MEM_NAME,
> > +     },
> > +};
> > +
> > +static void __exit audm2m_exit(void)
> > +{
> > +     platform_driver_unregister(&audm2m_pdrv);
> > +     platform_device_unregister(&audm2m_pdev);
> > +}
> > +
> > +static int __init audm2m_init(void)
> > +{
> > +     int ret;
> > +
> > +     ret =3D platform_device_register(&audm2m_pdev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D platform_driver_register(&audm2m_pdrv);
> > +     if (ret)
> > +             platform_device_unregister(&audm2m_pdev);
> > +
> > +     return ret;
> > +}
> > +
> > +module_init(audm2m_init);
> > +module_exit(audm2m_exit);
>
> Regards,
>
>         Hans
