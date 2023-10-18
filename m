Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C337CDC5D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 14:54:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nTyK+VeZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9W5r1cz1z3cSg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 23:54:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nTyK+VeZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9W4x1JPXz2yLr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 23:54:08 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-27d45f5658fso4089686a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 05:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697633646; x=1698238446; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYEq60W3cQ0IOLHhSHQVQnPHAP0QX+x4dG+z4ckNRUU=;
        b=nTyK+VeZsitpiZyju/WoF3RyvzYqhrnMM3RoHrJ7UT7XEKwqs6T+xCGswSPlLys3mt
         wUW8qtdjd0540GDPINwCxmwHsGAp83RpHw31b1Rrjo/PbHCgTTN7BD2KA2TZ60YSUwqH
         zwnl4+OrVOOTit4MjJEquXCxmyG+i46smirCcv4KlBLkzmgCAUvCOqxu3TF6nLrWHDt1
         ebGhYInTAITgWqR+DCSIcPZdYJMyiYR/qnZwsqxcQg1DRZT3OG1v0OxyD3ZXFpJhXneU
         i7c3x/qwX4rbzU7Zj2bsiObhpMHb48gZ6SKsGCWFf3rVuPeIFvUX+QKEwYVRITp7hsw1
         hcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697633646; x=1698238446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYEq60W3cQ0IOLHhSHQVQnPHAP0QX+x4dG+z4ckNRUU=;
        b=BdKls+TVmP9k96N2ubjOYVw/Hi3oFZIs7/G2cTGde5QF0ZQDa1YcB3/7MjGeGVfvLO
         x+ZguDUew1lfeLaQA/FkKbjwAXUH/BKnWoYHPCZQoPVscVaQGTJV1ze4pXYJhBw+lPh8
         xaD+nT6brp2EReuPMw+YLEZcKfjKRhaR+NX5M5oJeowjFzaXzC7Z0mHrlsmL7WVutP8O
         cqErZEoQX24qFFe4Dxqki0Tj/Az/S58GaLcphSaZf9ziimbbKVxK4FcUJNkGlRsRNN/1
         EJSjLp2iSThydpR7Nti+MTJ/GkGRR3ZAcufPJbxoeaYvQG7DdBdSKnK9oilo7ogGF9Wr
         kjLw==
X-Gm-Message-State: AOJu0YwDEIexVFSzTp+kpoIAZb6WXelvEqLO8aJQ4pYjPMFAdiQ8od1M
	Gy3c3oeHLQYQoT1Lf0w0rAg96WoELZN2LQL1jTo=
X-Google-Smtp-Source: AGHT+IF6ZhQy0x9RVpSmIlut8LveSN/a7II2m5Q9PL27ZyPfjf3Coe5gIVUhOFSGUu584o6dhyfjZw8zG/crR6xmbq0=
X-Received: by 2002:a17:90a:fb96:b0:27d:273:93ba with SMTP id
 cp22-20020a17090afb9600b0027d027393bamr4968894pjb.30.1697633645812; Wed, 18
 Oct 2023 05:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <1697185865-27528-1-git-send-email-shengjiu.wang@nxp.com>
 <1697185865-27528-11-git-send-email-shengjiu.wang@nxp.com> <677abf53-651a-42d3-ac65-c2a7d0b63fe6@xs4all.nl>
In-Reply-To: <677abf53-651a-42d3-ac65-c2a7d0b63fe6@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 18 Oct 2023 20:53:54 +0800
Message-ID: <CAA+D8ANKVwwqoYKo=rZGx029BykH9eDv=-VCQ3PP9p-k8faJ_w@mail.gmail.com>
Subject: Re: [RFC PATCH v6 10/11] media: imx-asrc: Add memory to memory driver
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

On Mon, Oct 16, 2023 at 10:01=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> =
wrote:
>
> On 13/10/2023 10:31, Shengjiu Wang wrote:
> > Implement the ASRC memory to memory function using
> > the v4l2 framework, user can use this function with
> > v4l2 ioctl interface.
> >
> > User send the output and capture buffer to driver and
> > driver store the converted data to the capture buffer.
> >
> > This feature can be shared by ASRC and EASRC drivers
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/media/platform/nxp/Kconfig    |   12 +
> >  drivers/media/platform/nxp/Makefile   |    1 +
> >  drivers/media/platform/nxp/imx-asrc.c | 1248 +++++++++++++++++++++++++
> >  3 files changed, 1261 insertions(+)
> >  create mode 100644 drivers/media/platform/nxp/imx-asrc.c
> >
> > diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platfor=
m/nxp/Kconfig
> > index 40e3436669e2..8234644ee341 100644
> > --- a/drivers/media/platform/nxp/Kconfig
> > +++ b/drivers/media/platform/nxp/Kconfig
> > @@ -67,3 +67,15 @@ config VIDEO_MX2_EMMAPRP
> >
> >  source "drivers/media/platform/nxp/dw100/Kconfig"
> >  source "drivers/media/platform/nxp/imx-jpeg/Kconfig"
> > +
> > +config VIDEO_IMX_ASRC
> > +     tristate "NXP i.MX ASRC M2M support"
> > +     depends on V4L_MEM2MEM_DRIVERS
> > +     depends on MEDIA_SUPPORT
> > +     select VIDEOBUF2_DMA_CONTIG
> > +     select V4L2_MEM2MEM_DEV
> > +     help
> > +         Say Y if you want to add ASRC M2M support for NXP CPUs.
> > +         It is a complement for ASRC M2P and ASRC P2M features.
> > +         This option is only useful for out-of-tree drivers since
> > +         in-tree drivers select it automatically.
> > diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platfo=
rm/nxp/Makefile
> > index 4d90eb713652..1325675e34f5 100644
> > --- a/drivers/media/platform/nxp/Makefile
> > +++ b/drivers/media/platform/nxp/Makefile
> > @@ -9,3 +9,4 @@ obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) +=3D imx8mq-mipi-c=
si2.o
> >  obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) +=3D imx-mipi-csis.o
> >  obj-$(CONFIG_VIDEO_IMX_PXP) +=3D imx-pxp.o
> >  obj-$(CONFIG_VIDEO_MX2_EMMAPRP) +=3D mx2_emmaprp.o
> > +obj-$(CONFIG_VIDEO_IMX_ASRC) +=3D imx-asrc.o
> > diff --git a/drivers/media/platform/nxp/imx-asrc.c b/drivers/media/plat=
form/nxp/imx-asrc.c
> > new file mode 100644
> > index 000000000000..373ca2b5ec90
> > --- /dev/null
> > +++ b/drivers/media/platform/nxp/imx-asrc.c
> > @@ -0,0 +1,1248 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +//
> > +// Copyright (C) 2014-2016 Freescale Semiconductor, Inc.
> > +// Copyright (C) 2019-2023 NXP
> > +//
> > +// Freescale ASRC Memory to Memory (M2M) driver
> > +
> > +#include <linux/dma/imx-dma.h>
> > +#include <linux/pm_runtime.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-fh.h>
> > +#include <media/v4l2-ioctl.h>
> > +#include <media/v4l2-mem2mem.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +#include <sound/dmaengine_pcm.h>
> > +#include <sound/fsl_asrc_common.h>
> > +
> > +#define V4L_CAP OUT
> > +#define V4L_OUT IN
> > +
> > +#define ASRC_xPUT_DMA_CALLBACK(dir) \
> > +     (((dir) =3D=3D V4L_OUT) ? asrc_input_dma_callback \
> > +     : asrc_output_dma_callback)
> > +
> > +#define DIR_STR(dir) (dir) =3D=3D V4L_OUT ? "out" : "cap"
> > +
> > +#define ASRC_M2M_BUFFER_SIZE (512 * 1024)
> > +#define ASRC_M2M_PERIOD_SIZE (48 * 1024)
> > +#define ASRC_M2M_SG_NUM (20)
>
> Where do all these values come from? How do they relate?
> Some comments would be welcome.
>
> Esp. ASRC_M2M_SG_NUM is a bit odd.
>
> > +
> > +struct asrc_fmt {
> > +     u32     fourcc;
> > +     snd_pcm_format_t     format;
>
> Do you need this field? If not, then you can drop the whole
> struct and just use u32 fourcc in the formats[] array.
>
> > +};
> > +
> > +struct asrc_pair_m2m {
> > +     struct fsl_asrc_pair *pair;
> > +     struct asrc_m2m *m2m;
> > +     struct v4l2_fh fh;
> > +     struct v4l2_ctrl_handler ctrl_handler;
> > +     int channels[2];
> > +     struct v4l2_ctrl_fixed_point src_rate;
> > +     struct v4l2_ctrl_fixed_point dst_rate;
> > +
> > +};
> > +
> > +struct asrc_m2m {
> > +     struct fsl_asrc_m2m_pdata pdata;
> > +     struct v4l2_device v4l2_dev;
> > +     struct v4l2_m2m_dev *m2m_dev;
> > +     struct video_device *dec_vdev;
> > +     struct mutex mlock; /* v4l2 ioctls serialization */
> > +     struct platform_device *pdev;
> > +};
> > +
> > +static struct asrc_fmt formats[] =3D {
> > +     {
> > +             .fourcc =3D V4L2_AUDIO_FMT_S8,
> > +     },
> > +     {
> > +             .fourcc =3D V4L2_AUDIO_FMT_S16_LE,
> > +     },
> > +     {
> > +             .fourcc =3D V4L2_AUDIO_FMT_U16_LE,
> > +     },
> > +     {
> > +             .fourcc =3D V4L2_AUDIO_FMT_S24_LE,
> > +     },
> > +     {
> > +             .fourcc =3D V4L2_AUDIO_FMT_S24_3LE,
> > +     },
> > +     {
> > +             .fourcc =3D V4L2_AUDIO_FMT_U24_LE,
> > +     },
> > +     {
> > +             .fourcc =3D V4L2_AUDIO_FMT_U24_3LE,
> > +     },
> > +     {
> > +             .fourcc =3D V4L2_AUDIO_FMT_S32_LE,
> > +     },
> > +     {
> > +             .fourcc =3D V4L2_AUDIO_FMT_U32_LE,
> > +     },
> > +     {
> > +             .fourcc =3D V4L2_AUDIO_FMT_S20_3LE,
> > +     },
> > +     {
> > +             .fourcc =3D V4L2_AUDIO_FMT_U20_3LE,
> > +     },
> > +     {
> > +             .fourcc =3D V4L2_AUDIO_FMT_FLOAT_LE,
> > +     },
> > +     {
> > +             .fourcc =3D V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE,
> > +     },
> > +};
> > +
> > +#define NUM_FORMATS ARRAY_SIZE(formats)
> > +
> > +static snd_pcm_format_t convert_fourcc(u32 fourcc) {
> > +
> > +     return (__force snd_pcm_format_t)v4l2_fourcc_to_audfmt(fourcc);
>
> Is this cast something that should be done in the v4l2_fourcc_to_audfmt
> define instead?

need to avoid include asound.h in videodev2.h,  so add this cast in driver.

best regards
wang shengjiu
>
> > +}
> > +
> > +static u32 find_fourcc(snd_pcm_format_t format)
> > +{
> > +     struct asrc_fmt *fmt;
> > +     unsigned int k;
> > +
> > +     for (k =3D 0; k < NUM_FORMATS; k++) {
> > +             fmt =3D &formats[k];
> > +             fmt->format =3D convert_fourcc(fmt->fourcc);
> > +             if (fmt->format =3D=3D format)
> > +                     break;
> > +     }
> > +
> > +     if (k =3D=3D NUM_FORMATS)
> > +             return 0;
> > +
> > +     return formats[k].fourcc;
> > +}
> > +
> > +static snd_pcm_format_t find_format(u32 fourcc)
> > +{
> > +     struct asrc_fmt *fmt;
> > +     unsigned int k;
> > +
> > +     for (k =3D 0; k < NUM_FORMATS; k++) {
> > +             fmt =3D &formats[k];
> > +             if (fmt->fourcc =3D=3D fourcc)
> > +                     break;
> > +     }
> > +
> > +     if (k =3D=3D NUM_FORMATS)
> > +             return 0;
> > +
> > +     formats[k].format =3D convert_fourcc(formats[k].fourcc);
> > +
> > +     return formats[k].format;
>
> I don't really thing the format field makes any sense. You just
> keep setting it.
>
> > +}
> > +
> > +static int asrc_check_format(struct asrc_pair_m2m *pair_m2m, u8 dir, u=
32 format)
> > +{
> > +     struct asrc_m2m *m2m =3D pair_m2m->m2m;
> > +     struct fsl_asrc_m2m_pdata *pdata =3D &m2m->pdata;
> > +     struct fsl_asrc_pair *pair =3D pair_m2m->pair;
> > +     u64 format_bit =3D 0;
> > +     int i;
> > +
> > +     for (i =3D 0; i < NUM_FORMATS; ++i) {
> > +             if (formats[i].fourcc =3D=3D format) {
> > +                     formats[i].format =3D convert_fourcc(formats[i].f=
ourcc);
> > +                     format_bit =3D pcm_format_to_bits(formats[i].form=
at);
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (dir =3D=3D IN && !(format_bit & pdata->fmt_in))
> > +             return find_fourcc(pair->sample_format[V4L_OUT]);
> > +     else if (dir =3D=3D OUT && !(format_bit & pdata->fmt_out))
> > +             return find_fourcc(pair->sample_format[V4L_CAP]);
> > +     else
> > +             return format;
> > +}
> > +
> > +static int asrc_check_channel(struct asrc_pair_m2m *pair_m2m, u8 dir, =
u32 channels)
> > +{
> > +     struct asrc_m2m *m2m =3D pair_m2m->m2m;
> > +     struct fsl_asrc_m2m_pdata *pdata =3D &m2m->pdata;
> > +     struct fsl_asrc_pair *pair =3D pair_m2m->pair;
> > +
> > +     if (channels < pdata->chan_min || channels > pdata->chan_max)
> > +             return pair->channels;
> > +     else
> > +             return channels;
> > +}
> > +
> > +static int asrc_check_rate(struct asrc_pair_m2m *pair_m2m, u8 dir, u32=
 rate)
> > +{
> > +     struct asrc_m2m *m2m =3D pair_m2m->m2m;
> > +     struct fsl_asrc_m2m_pdata *pdata =3D &m2m->pdata;
> > +     struct fsl_asrc_pair *pair =3D pair_m2m->pair;
> > +
> > +     if (rate < pdata->rate_min || rate > pdata->rate_max)
> > +             return pair->rate[dir];
> > +     else
> > +             return rate;
> > +}
> > +
> > +static inline struct asrc_pair_m2m *asrc_m2m_fh_to_ctx(struct v4l2_fh =
*fh)
> > +{
> > +     return container_of(fh, struct asrc_pair_m2m, fh);
> > +}
> > +
> > +/**
> > + * asrc_read_last_fifo: read all the remaining data from FIFO
> > + *   @pair: Structure pointer of fsl_asrc_pair
> > + *   @dma_vaddr: virtual address of capture buffer
> > + *   @length: payload length of capture buffer
> > + */
> > +static void asrc_read_last_fifo(struct fsl_asrc_pair *pair, void *dma_=
vaddr, u32 *length)
> > +{
> > +     struct fsl_asrc *asrc =3D pair->asrc;
> > +     enum asrc_pair_index index =3D pair->index;
> > +     u32 i, reg, size, t_size =3D 0, width;
> > +     u32 *reg32 =3D NULL;
> > +     u16 *reg16 =3D NULL;
> > +     u8  *reg24 =3D NULL;
> > +
> > +     width =3D snd_pcm_format_physical_width(pair->sample_format[V4L_C=
AP]);
> > +     if (width =3D=3D 32)
> > +             reg32 =3D dma_vaddr + *length;
> > +     else if (width =3D=3D 16)
> > +             reg16 =3D dma_vaddr + *length;
> > +     else
> > +             reg24 =3D dma_vaddr + *length;
> > +retry:
> > +     size =3D asrc->get_output_fifo_size(pair);
> > +     if (size + *length > ASRC_M2M_BUFFER_SIZE)
> > +             goto end;
> > +
> > +     for (i =3D 0; i < size * pair->channels; i++) {
> > +             regmap_read(asrc->regmap, asrc->get_fifo_addr(OUT, index)=
, &reg);
> > +             if (reg32) {
> > +                     *(reg32) =3D reg;
> > +                     reg32++;
> > +             } else if (reg16) {
> > +                     *(reg16) =3D (u16)reg;
> > +                     reg16++;
> > +             } else {
> > +                     *reg24++ =3D (u8)reg;
> > +                     *reg24++ =3D (u8)(reg >> 8);
> > +                     *reg24++ =3D (u8)(reg >> 16);
> > +             }
> > +     }
> > +     t_size +=3D size;
> > +
> > +     /* In case there is data left in FIFO */
> > +     if (size)
> > +             goto retry;
> > +end:
> > +     /* Update payload length */
> > +     if (reg32)
> > +             *length +=3D t_size * pair->channels * 4;
> > +     else if (reg16)
> > +             *length +=3D t_size * pair->channels * 2;
> > +     else
> > +             *length +=3D t_size * pair->channels * 3;
> > +}
> > +
> > +static int asrc_m2m_start_streaming(struct vb2_queue *q, unsigned int =
count)
> > +{
> > +     struct asrc_pair_m2m *pair_m2m =3D vb2_get_drv_priv(q);
> > +     struct fsl_asrc_pair *pair =3D pair_m2m->pair;
> > +     struct asrc_m2m *m2m =3D pair_m2m->m2m;
> > +     struct fsl_asrc *asrc =3D pair->asrc;
> > +     struct device *dev =3D &m2m->pdev->dev;
> > +     struct vb2_v4l2_buffer *buf;
> > +     bool request_flag =3D false;
> > +     int ret;
> > +
> > +     dev_dbg(dev, "Start streaming pair=3D%p, %d\n", pair, q->type);
> > +
> > +     ret =3D pm_runtime_get_sync(dev);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to power up asrc\n");
> > +             goto err_pm_runtime;
> > +     }
> > +
> > +     /* Request asrc pair/context */
> > +     if (!pair->req_pair) {
> > +             /* flag for error handler of this function */
> > +             request_flag =3D true;
> > +
> > +             ret =3D asrc->request_pair(pair->channels, pair);
> > +             if (ret) {
> > +                     dev_err(dev, "failed to request pair: %d\n", ret)=
;
> > +                     goto err_request_pair;
> > +             }
> > +
> > +             ret =3D asrc->m2m_prepare(pair);
> > +             if (ret) {
> > +                     dev_err(dev, "failed to start pair part one: %d\n=
", ret);
> > +                     goto err_start_part_one;
> > +             }
> > +
> > +             pair->req_pair =3D true;
> > +     }
> > +
> > +     /* Request dma channels */
> > +     if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> > +             pair->dma_chan[V4L_OUT] =3D asrc->get_dma_channel(pair, I=
N);
> > +             if (!pair->dma_chan[V4L_OUT]) {
> > +                     dev_err(dev, "[ctx%d] failed to get input DMA cha=
nnel\n", pair->index);
> > +                     ret =3D -EBUSY;
> > +                     goto err_dma_channel;
> > +             }
> > +     } else {
> > +             pair->dma_chan[V4L_CAP] =3D asrc->get_dma_channel(pair, O=
UT);
> > +             if (!pair->dma_chan[V4L_CAP]) {
> > +                     dev_err(dev, "[ctx%d] failed to get output DMA ch=
annel\n", pair->index);
> > +                     ret =3D -EBUSY;
> > +                     goto err_dma_channel;
> > +             }
> > +     }
> > +
> > +     v4l2_m2m_update_start_streaming_state(pair_m2m->fh.m2m_ctx, q);
> > +
> > +     return 0;
> > +
> > +err_dma_channel:
> > +     if (request_flag && asrc->m2m_unprepare)
> > +             asrc->m2m_unprepare(pair);
> > +err_start_part_one:
> > +     if (request_flag)
> > +             asrc->release_pair(pair);
> > +err_request_pair:
> > +     pm_runtime_put_sync(dev);
> > +err_pm_runtime:
> > +     /* Release buffers */
> > +     if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> > +             while ((buf =3D v4l2_m2m_src_buf_remove(pair_m2m->fh.m2m_=
ctx)))
> > +                     v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
> > +     } else {
> > +             while ((buf =3D v4l2_m2m_dst_buf_remove(pair_m2m->fh.m2m_=
ctx)))
> > +                     v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
> > +     }
> > +     return ret;
> > +}
> > +
> > +static void asrc_m2m_stop_streaming(struct vb2_queue *q)
> > +{
> > +     struct asrc_pair_m2m *pair_m2m =3D vb2_get_drv_priv(q);
> > +     struct asrc_m2m *m2m =3D pair_m2m->m2m;
> > +     struct fsl_asrc_pair *pair =3D pair_m2m->pair;
> > +     struct fsl_asrc *asrc =3D pair->asrc;
> > +     struct device *dev =3D &m2m->pdev->dev;
> > +
> > +     dev_dbg(dev, "Stop streaming pair=3D%p, %d\n", pair, q->type);
> > +
> > +     v4l2_m2m_update_stop_streaming_state(pair_m2m->fh.m2m_ctx, q);
> > +
> > +     /* Stop & release pair/context */
> > +     if (asrc->m2m_stop)
> > +             asrc->m2m_stop(pair);
> > +
> > +     if (pair->req_pair) {
> > +             if (asrc->m2m_unprepare)
> > +                     asrc->m2m_unprepare(pair);
> > +             asrc->release_pair(pair);
> > +             pair->req_pair =3D false;
> > +     }
> > +
> > +     /* Release dma channel */
> > +     if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> > +             if (pair->dma_chan[V4L_OUT])
> > +                     dma_release_channel(pair->dma_chan[V4L_OUT]);
> > +     } else {
> > +             if (pair->dma_chan[V4L_CAP])
> > +                     dma_release_channel(pair->dma_chan[V4L_CAP]);
> > +     }
> > +
> > +     pm_runtime_put_sync(dev);
> > +}
> > +
> > +static int asrc_m2m_queue_setup(struct vb2_queue *q,
> > +                             unsigned int *num_buffers, unsigned int *=
num_planes,
> > +                             unsigned int sizes[], struct device *allo=
c_devs[])
> > +{
> > +     struct asrc_pair_m2m *pair_m2m =3D vb2_get_drv_priv(q);
> > +     struct fsl_asrc_pair *pair =3D pair_m2m->pair;
> > +
> > +     /* single buffer */
> > +     *num_planes =3D 1;
>
> This isn't quite right. This driver supports VIDIOC_CREATE_BUFS, which us=
erspace
> can use to add new buffers on the fly. Note that there is no correspondin=
g DELETE_BUFS
> ioctl to delete buffers, but work is in progress for that.
>
> If a driver supports CREATE_BUFS, then queue_setup has to check whether t=
he
> values passed by VIDIOC_CREATE_BUFS are valid.
>
> That's done through:
>
>         u32 size;
>
>         if (V4L2_TYPE_IS_OUTPUT(q->type))
>                 size =3D pair->buf_len[V4L_OUT];
>         else
>                 size =3D pair->buf_len[V4L_CAP];
>
>         if (*nplanes)
>                 return sizes[0] < size ? -EINVAL : 0;
>
>         *num_planes =3D 1;
>         sizes[0] =3D size;
>         return 0;
>
> One of these days this rather ugly construction should be cleaned up.
>
> Oh well...
>
> Regards,
>
>         Hans
>
> > +
> > +     /*
> > +      * The capture buffer size depends on output buffer size
> > +      * and the convert ratio.
> > +      *
> > +      * Here just use a fix length for capture and output buffer.
> > +      * User need to care about it.
> > +      */
> > +
> > +     if (V4L2_TYPE_IS_OUTPUT(q->type))
> > +             sizes[0] =3D pair->buf_len[V4L_OUT];
> > +     else
> > +             sizes[0] =3D pair->buf_len[V4L_CAP];
> > +
> > +     return 0;
> > +}
> > +
> > +static void asrc_m2m_buf_queue(struct vb2_buffer *vb)
> > +{
> > +     struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> > +     struct asrc_pair_m2m *pair_m2m =3D vb2_get_drv_priv(vb->vb2_queue=
);
> > +
> > +     /* queue buffer */
> > +     v4l2_m2m_buf_queue(pair_m2m->fh.m2m_ctx, vbuf);
> > +}
> > +
> > +static const struct vb2_ops asrc_m2m_qops =3D {
> > +     .wait_prepare           =3D vb2_ops_wait_prepare,
> > +     .wait_finish            =3D vb2_ops_wait_finish,
> > +     .start_streaming        =3D asrc_m2m_start_streaming,
> > +     .stop_streaming         =3D asrc_m2m_stop_streaming,
> > +     .queue_setup            =3D asrc_m2m_queue_setup,
> > +     .buf_queue              =3D asrc_m2m_buf_queue,
> > +};
> > +
> > +/* Init video buffer queue for src and dst. */
> > +static int asrc_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
> > +                            struct vb2_queue *dst_vq)
> > +{
> > +     struct asrc_pair_m2m *pair_m2m =3D priv;
> > +     struct asrc_m2m *m2m =3D pair_m2m->m2m;
> > +     int ret;
> > +
> > +     src_vq->type =3D V4L2_BUF_TYPE_AUDIO_OUTPUT;
> > +     src_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> > +     src_vq->drv_priv =3D pair_m2m;
> > +     src_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> > +     src_vq->ops =3D &asrc_m2m_qops;
> > +     src_vq->mem_ops =3D &vb2_dma_contig_memops;
> > +     src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > +     src_vq->lock =3D &m2m->mlock;
> > +     src_vq->dev =3D &m2m->pdev->dev;
> > +     src_vq->min_buffers_needed =3D 1;
> > +
> > +     ret =3D vb2_queue_init(src_vq);
> > +     if (ret)
> > +             return ret;
> > +
> > +     dst_vq->type =3D V4L2_BUF_TYPE_AUDIO_CAPTURE;
> > +     dst_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> > +     dst_vq->drv_priv =3D pair_m2m;
> > +     dst_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> > +     dst_vq->ops =3D &asrc_m2m_qops;
> > +     dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> > +     dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > +     dst_vq->lock =3D &m2m->mlock;
> > +     dst_vq->dev =3D &m2m->pdev->dev;
> > +     dst_vq->min_buffers_needed =3D 1;
> > +
> > +     ret =3D vb2_queue_init(dst_vq);
> > +     return ret;
> > +}
> > +
> > +static int asrc_m2m_op_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +     struct asrc_pair_m2m *pair_m2m =3D
> > +             container_of(ctrl->handler, struct asrc_pair_m2m, ctrl_ha=
ndler);
> > +     struct fsl_asrc_pair *pair =3D pair_m2m->pair;
> > +     struct fsl_asrc *asrc =3D pair->asrc;
> > +     int src_rate_int, src_rate_frac;
> > +     int dst_rate_int, dst_rate_frac;
> > +     int new_rate, new_frac;
> > +     u64 src_rate, dst_rate;
> > +     u64 ratio_pre, ratio_cur;
> > +     s64 ratio_diff;
> > +     int ret =3D 0;
> > +
> > +     switch (ctrl->id) {
> > +     case V4L2_CID_ASRC_SOURCE_RATE:
> > +             new_rate =3D ctrl->p_new.p_fixed_point->integer;
> > +             new_frac =3D ctrl->p_new.p_fixed_point->fractional;
> > +             src_rate_int =3D asrc_check_rate(pair_m2m, IN, new_rate);
> > +             if (src_rate_int !=3D new_rate ||
> > +                 (pair_m2m->src_rate.integer > 0 &&
> > +                  src_rate_int !=3D pair_m2m->src_rate.integer))
> > +                     return -EINVAL;
> > +
> > +             pair->rate[V4L_OUT] =3D src_rate_int;
> > +
> > +             if (new_frac !=3D pair_m2m->src_rate.fractional &&
> > +                 new_rate =3D=3D pair_m2m->src_rate.integer &&
> > +                 pair_m2m->dst_rate.integer > 0) {
> > +                     /*
> > +                      * use maximum rate 768kHz as limitation, then we=
 can shift right 21 bit for
> > +                      * division
> > +                      */
> > +                     src_rate_frac =3D pair_m2m->src_rate.fractional;
> > +                     src_rate =3D ((s64)src_rate_int << 31) + src_rate=
_frac;
> > +                     dst_rate_int =3D pair_m2m->dst_rate.integer;
> > +                     dst_rate_frac =3D pair_m2m->dst_rate.fractional;
> > +                     dst_rate =3D (((s64)dst_rate_int << 31) + dst_rat=
e_frac) >> 20;
> > +                     do_div(src_rate, dst_rate);
> > +                     ratio_pre =3D src_rate;
> > +
> > +                     src_rate_frac =3D new_frac;
> > +                     src_rate =3D ((s64)src_rate_int << 31) + src_rate=
_frac;
> > +                     dst_rate =3D (((s64)dst_rate_int << 31) + dst_rat=
e_frac) >> 20;
> > +                     do_div(src_rate, dst_rate);
> > +                     ratio_cur =3D src_rate;
> > +
> > +                     ratio_diff =3D ratio_cur - ratio_pre;
> > +                     asrc->m2m_set_ratio_mod(pair, ratio_diff << 11);
> > +             }
> > +
> > +             pair_m2m->src_rate.integer =3D new_rate;
> > +             pair_m2m->src_rate.fractional =3D new_frac;
> > +
> > +             break;
> > +     case V4L2_CID_ASRC_DEST_RATE:
> > +             new_rate =3D ctrl->p_new.p_fixed_point->integer;
> > +             new_frac =3D ctrl->p_new.p_fixed_point->fractional;
> > +
> > +             dst_rate_int =3D asrc_check_rate(pair_m2m, OUT, new_rate)=
;
> > +             if (dst_rate_int !=3D new_rate ||
> > +                 (pair_m2m->dst_rate.integer > 0 &&
> > +                  dst_rate_int !=3D pair_m2m->dst_rate.integer))
> > +                     return -EINVAL;
> > +
> > +             pair->rate[V4L_CAP] =3D dst_rate_int;
> > +
> > +             if (new_frac !=3D pair_m2m->dst_rate.fractional &&
> > +                 new_rate =3D=3D pair_m2m->dst_rate.integer &&
> > +                 pair_m2m->src_rate.integer > 0) {
> > +                     /*
> > +                      * use maximum rate 768kHz as limitation, then we=
 can shift right 21 bit for
> > +                      * division
> > +                      */
> > +                     src_rate_int =3D pair_m2m->src_rate.integer;
> > +                     src_rate_frac =3D pair_m2m->src_rate.fractional;
> > +                     src_rate =3D ((s64)src_rate_int << 31) + src_rate=
_frac;
> > +                     dst_rate_frac =3D pair_m2m->dst_rate.fractional;
> > +                     dst_rate =3D (((s64)dst_rate_int << 31) + dst_rat=
e_frac) >> 20;
> > +                     do_div(src_rate, dst_rate);
> > +                     ratio_pre =3D src_rate;
> > +
> > +                     src_rate =3D ((s64)src_rate_int << 31) + src_rate=
_frac;
> > +                     dst_rate_int =3D new_rate;
> > +                     dst_rate_frac =3D new_frac;
> > +                     dst_rate =3D (((s64)dst_rate_int << 31) + dst_rat=
e_frac) >> 20;
> > +                     do_div(src_rate, dst_rate);
> > +                     ratio_cur =3D src_rate;
> > +
> > +                     ratio_diff =3D ratio_cur - ratio_pre;
> > +                     /* convert ratio_diff to Q31*/
> > +                     asrc->m2m_set_ratio_mod(pair, ratio_diff << 11);
>
> This is very similar to the other control. You really just want to pass
> two rates (source and dest) and let that function calculate the ratio mod=
.
>
> > +             }
> > +
> > +             pair_m2m->dst_rate.integer =3D new_rate;
> > +             pair_m2m->dst_rate.fractional =3D new_frac;
> > +
> > +             break;
> > +     default:
> > +             ret =3D -EINVAL;
> > +             break;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops asrc_m2m_ctrl_ops =3D {
> > +     .s_ctrl =3D asrc_m2m_op_s_ctrl,
> > +};
> > +
> > +static const struct v4l2_ctrl_config asrc_src_rate_control =3D {
> > +     .ops =3D &asrc_m2m_ctrl_ops,
> > +     .id =3D V4L2_CID_ASRC_SOURCE_RATE,
> > +     .name =3D "asrc source sample rate",
>
> How about "Audio Source Sample Rate"?
>
> But we want these controls as standard types (not driver specific), so
> this should be added to drivers/media/v4l2-core/v4l2-ctrls-defs.c.
>
> And if we just use an s64 to store the fixed point, then you can just
> call v4l2_ctrl_new_std().
>
> But you probably want to add some helper defines to split a fixed point
> value into integer and fractional parts, and to construct one.
>
> > +     .type =3D V4L2_CTRL_TYPE_FIXED_POINT,
> > +     .min =3D 0,
> > +     .max =3D 0x7fffffff,
> > +     .def =3D 8000,
> > +     .flags =3D V4L2_CTRL_FLAG_UPDATE,
> > +};
> > +
> > +static const struct v4l2_ctrl_config asrc_dst_rate_control =3D {
> > +     .ops =3D &asrc_m2m_ctrl_ops,
> > +     .id =3D V4L2_CID_ASRC_DEST_RATE,
> > +     .name =3D "asrc dest sample rate",
> > +     .type =3D V4L2_CTRL_TYPE_FIXED_POINT,
> > +     .min =3D 0,
> > +     .max =3D 0x7fffffff,
> > +     .def =3D 8000,
> > +     .flags =3D V4L2_CTRL_FLAG_UPDATE,
> > +};
> > +
> > +/* system callback for open() */
> > +static int asrc_m2m_open(struct file *file)
> > +{
> > +     struct asrc_m2m *m2m =3D video_drvdata(file);
> > +     struct fsl_asrc *asrc =3D m2m->pdata.asrc;
> > +     struct video_device *vdev =3D video_devdata(file);
> > +     struct fsl_asrc_pair *pair;
> > +     struct asrc_pair_m2m *pair_m2m;
> > +     int ret =3D 0;
> > +
> > +     if (mutex_lock_interruptible(&m2m->mlock))
> > +             return -ERESTARTSYS;
> > +
> > +     pair =3D kzalloc(sizeof(*pair) + asrc->pair_priv_size, GFP_KERNEL=
);
> > +     if (!pair) {
> > +             ret =3D -ENOMEM;
> > +             goto err_alloc_pair;
> > +     }
> > +
> > +     pair_m2m =3D kzalloc(sizeof(*pair_m2m), GFP_KERNEL);
> > +     if (!pair_m2m) {
> > +             ret =3D -ENOMEM;
> > +             goto err_alloc_pair_m2m;
> > +     }
> > +
> > +     pair->private =3D (void *)pair + sizeof(struct fsl_asrc_pair);
> > +     pair->asrc =3D asrc;
> > +
> > +     pair->buf_len[V4L_OUT] =3D ASRC_M2M_BUFFER_SIZE;
> > +     pair->buf_len[V4L_CAP] =3D ASRC_M2M_BUFFER_SIZE;
> > +
> > +     pair->channels =3D 2;
> > +     pair->rate[V4L_OUT] =3D 8000;
> > +     pair->rate[V4L_CAP] =3D 8000;
> > +     pair->sample_format[V4L_OUT] =3D SNDRV_PCM_FORMAT_S16_LE;
> > +     pair->sample_format[V4L_CAP] =3D SNDRV_PCM_FORMAT_S16_LE;
> > +
> > +     init_completion(&pair->complete[V4L_OUT]);
> > +     init_completion(&pair->complete[V4L_CAP]);
> > +
> > +     v4l2_fh_init(&pair_m2m->fh, vdev);
> > +     v4l2_fh_add(&pair_m2m->fh);
> > +     file->private_data =3D &pair_m2m->fh;
> > +
> > +     pair_m2m->pair =3D pair;
> > +     pair_m2m->m2m =3D m2m;
> > +     /* m2m context init */
> > +     pair_m2m->fh.m2m_ctx =3D v4l2_m2m_ctx_init(m2m->m2m_dev, pair_m2m=
,
> > +                                              asrc_m2m_queue_init);
> > +     if (IS_ERR(pair_m2m->fh.m2m_ctx)) {
> > +             ret =3D PTR_ERR(pair_m2m->fh.m2m_ctx);
> > +             goto err_ctx_init;
> > +     }
> > +
> > +     v4l2_ctrl_handler_init(&pair_m2m->ctrl_handler, 2);
> > +
> > +     /* use V4L2_CID_GAIN for ratio update control */
> > +     v4l2_ctrl_new_custom(&pair_m2m->ctrl_handler, &asrc_src_rate_cont=
rol, NULL);
> > +     v4l2_ctrl_new_custom(&pair_m2m->ctrl_handler, &asrc_dst_rate_cont=
rol, NULL);
> > +
> > +     if (pair_m2m->ctrl_handler.error) {
> > +             ret =3D pair_m2m->ctrl_handler.error;
> > +             v4l2_ctrl_handler_free(&pair_m2m->ctrl_handler);
> > +             goto err_ctrl_handler;
> > +     }
> > +
> > +     pair_m2m->fh.ctrl_handler =3D &pair_m2m->ctrl_handler;
> > +
> > +     mutex_unlock(&m2m->mlock);
> > +
> > +     return 0;
> > +
> > +err_ctrl_handler:
> > +     v4l2_m2m_ctx_release(pair_m2m->fh.m2m_ctx);
> > +err_ctx_init:
> > +     v4l2_fh_del(&pair_m2m->fh);
> > +     v4l2_fh_exit(&pair_m2m->fh);
> > +     kfree(pair_m2m);
> > +err_alloc_pair_m2m:
> > +     kfree(pair);
> > +err_alloc_pair:
> > +     mutex_unlock(&m2m->mlock);
> > +     return ret;
> > +}
> > +
> > +static int asrc_m2m_release(struct file *file)
> > +{
> > +     struct asrc_m2m *m2m =3D video_drvdata(file);
> > +     struct asrc_pair_m2m *pair_m2m =3D asrc_m2m_fh_to_ctx(file->priva=
te_data);
> > +     struct fsl_asrc_pair *pair =3D pair_m2m->pair;
> > +
> > +     mutex_lock(&m2m->mlock);
> > +     v4l2_ctrl_handler_free(&pair_m2m->ctrl_handler);
> > +     v4l2_m2m_ctx_release(pair_m2m->fh.m2m_ctx);
> > +     v4l2_fh_del(&pair_m2m->fh);
> > +     v4l2_fh_exit(&pair_m2m->fh);
> > +     kfree(pair_m2m);
> > +     kfree(pair);
> > +     mutex_unlock(&m2m->mlock);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct v4l2_file_operations asrc_m2m_fops =3D {
> > +     .owner          =3D THIS_MODULE,
> > +     .open           =3D asrc_m2m_open,
> > +     .release        =3D asrc_m2m_release,
> > +     .poll           =3D v4l2_m2m_fop_poll,
> > +     .unlocked_ioctl =3D video_ioctl2,
> > +     .mmap           =3D v4l2_m2m_fop_mmap,
> > +};
> > +
> > +static int asrc_m2m_querycap(struct file *file, void *priv,
> > +                          struct v4l2_capability *cap)
> > +{
> > +     strscpy(cap->driver, "asrc m2m", sizeof(cap->driver));
> > +     strscpy(cap->card, "asrc m2m", sizeof(cap->card));
>
> This is rather ugly. It should at least mention imx, right?
>
> > +     cap->device_caps =3D V4L2_CAP_STREAMING | V4L2_CAP_AUDIO_M2M;
> > +     cap->capabilities =3D cap->device_caps | V4L2_CAP_DEVICE_CAPS;
>
> You can drop this last line, that's done for you.
>
> > +
> > +     return 0;
> > +}
> > +
> > +static int enum_fmt(struct v4l2_fmtdesc *f, u64 fmtbit)
> > +{
> > +     int i, num;
> > +     struct asrc_fmt *fmt;
> > +
> > +     num =3D 0;
> > +
> > +     for (i =3D 0; i < NUM_FORMATS; ++i) {
> > +             formats[i].format =3D convert_fourcc(formats[i].fourcc);
> > +             if (pcm_format_to_bits(formats[i].format) & fmtbit) {
> > +                     if (num =3D=3D f->index)
> > +                             break;
> > +                     /*
> > +                      * Correct type but haven't reached our index yet=
,
> > +                      * just increment per-type index
> > +                      */
> > +                     ++num;
> > +             }
> > +     }
> > +
> > +     if (i < NUM_FORMATS) {
> > +             /* Format found */
> > +             fmt =3D &formats[i];
> > +             f->pixelformat =3D fmt->fourcc;
> > +             return 0;
> > +     }
> > +
> > +     return -EINVAL;
> > +}
> > +
> > +static int asrc_m2m_enum_fmt_aud_cap(struct file *file, void *fh,
> > +                                  struct v4l2_fmtdesc *f)
> > +{
> > +     struct asrc_pair_m2m *pair_m2m =3D asrc_m2m_fh_to_ctx(fh);
> > +     struct asrc_m2m *m2m =3D pair_m2m->m2m;
> > +
> > +     return enum_fmt(f, m2m->pdata.fmt_out);
> > +}
> > +
> > +static int asrc_m2m_enum_fmt_aud_out(struct file *file, void *fh,
> > +                                  struct v4l2_fmtdesc *f)
> > +{
> > +     struct asrc_pair_m2m *pair_m2m =3D asrc_m2m_fh_to_ctx(fh);
> > +     struct asrc_m2m *m2m =3D pair_m2m->m2m;
> > +
> > +     return enum_fmt(f, m2m->pdata.fmt_in);
> > +}
> > +
> > +static int asrc_m2m_g_fmt_aud_cap(struct file *file, void *fh,
> > +                               struct v4l2_format *f)
> > +{
> > +     struct asrc_pair_m2m *pair_m2m =3D asrc_m2m_fh_to_ctx(fh);
> > +     struct fsl_asrc_pair *pair =3D pair_m2m->pair;
> > +
> > +     f->fmt.audio.channels =3D pair->channels;
> > +     f->fmt.audio.buffersize =3D pair->buf_len[V4L_CAP];
> > +     f->fmt.audio.audioformat =3D find_fourcc(pair->sample_format[V4L_=
CAP]);
> > +
> > +     return 0;
> > +}
> > +
> > +static int asrc_m2m_g_fmt_aud_out(struct file *file, void *fh,
> > +                               struct v4l2_format *f)
> > +{
> > +     struct asrc_pair_m2m *pair_m2m =3D asrc_m2m_fh_to_ctx(fh);
> > +     struct fsl_asrc_pair *pair =3D pair_m2m->pair;
> > +
> > +     f->fmt.audio.channels =3D pair->channels;
> > +     f->fmt.audio.buffersize =3D pair->buf_len[V4L_OUT];
> > +     f->fmt.audio.audioformat =3D find_fourcc(pair->sample_format[V4L_=
OUT]);
> > +
> > +     return 0;
> > +}
> > +
> > +/* output for asrc */
> > +static int asrc_m2m_s_fmt_aud_cap(struct file *file, void *fh,
> > +                               struct v4l2_format *f)
> > +{
> > +     struct asrc_pair_m2m *pair_m2m =3D asrc_m2m_fh_to_ctx(fh);
> > +     struct fsl_asrc_pair *pair =3D pair_m2m->pair;
> > +     struct asrc_m2m *m2m =3D pair_m2m->m2m;
> > +     struct device *dev =3D &m2m->pdev->dev;
> > +
> > +     f->fmt.audio.audioformat =3D asrc_check_format(pair_m2m, OUT, f->=
fmt.audio.audioformat);
> > +     f->fmt.audio.channels =3D asrc_check_channel(pair_m2m, OUT, f->fm=
t.audio.channels);
> > +
> > +     if (pair_m2m->channels[V4L_CAP] > 0 &&
> > +         pair_m2m->channels[V4L_CAP] !=3D f->fmt.audio.channels) {
> > +             dev_err(dev, "channels don't match for cap and out\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     pair_m2m->channels[V4L_CAP] =3D f->fmt.audio.channels;
> > +     pair->channels =3D f->fmt.audio.channels;
> > +     pair->sample_format[V4L_CAP] =3D find_format(f->fmt.audio.audiofo=
rmat);
> > +
> > +     return 0;
> > +}
> > +
> > +/* input for asrc */
> > +static int asrc_m2m_s_fmt_aud_out(struct file *file, void *fh,
> > +                               struct v4l2_format *f)
> > +{
> > +     struct asrc_pair_m2m *pair_m2m =3D asrc_m2m_fh_to_ctx(fh);
> > +     struct fsl_asrc_pair *pair =3D pair_m2m->pair;
> > +     struct asrc_m2m *m2m =3D pair_m2m->m2m;
> > +     struct device *dev =3D &m2m->pdev->dev;
> > +
> > +     f->fmt.audio.audioformat =3D asrc_check_format(pair_m2m, IN, f->f=
mt.audio.audioformat);
> > +     f->fmt.audio.channels =3D asrc_check_channel(pair_m2m, IN, f->fmt=
.audio.channels);
> > +     if (pair_m2m->channels[V4L_OUT] > 0 &&
> > +         pair_m2m->channels[V4L_OUT] !=3D f->fmt.audio.channels) {
> > +             dev_err(dev, "channels don't match for cap and out\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     pair_m2m->channels[V4L_OUT] =3D f->fmt.audio.channels;
> > +     pair->channels =3D f->fmt.audio.channels;
> > +     pair->sample_format[V4L_OUT] =3D find_format(f->fmt.audio.audiofo=
rmat);
> > +
> > +     return 0;
> > +}
> > +
> > +static int asrc_m2m_try_fmt_audio_cap(struct file *file, void *fh,
> > +                                   struct v4l2_format *f)
> > +{
> > +     struct asrc_pair_m2m *pair_m2m =3D asrc_m2m_fh_to_ctx(fh);
> > +
> > +     f->fmt.audio.audioformat =3D asrc_check_format(pair_m2m, OUT, f->=
fmt.audio.audioformat);
> > +     f->fmt.audio.channels =3D asrc_check_channel(pair_m2m, OUT, f->fm=
t.audio.channels);
> > +
> > +     return 0;
> > +}
> > +
> > +static int asrc_m2m_try_fmt_audio_out(struct file *file, void *fh,
> > +                                   struct v4l2_format *f)
> > +{
> > +     struct asrc_pair_m2m *pair_m2m =3D asrc_m2m_fh_to_ctx(fh);
> > +
> > +     f->fmt.audio.audioformat =3D asrc_check_format(pair_m2m, IN, f->f=
mt.audio.audioformat);
> > +     f->fmt.audio.channels =3D asrc_check_channel(pair_m2m, IN, f->fmt=
.audio.channels);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct v4l2_ioctl_ops asrc_m2m_ioctl_ops =3D {
> > +     .vidioc_querycap                =3D asrc_m2m_querycap,
> > +
> > +     .vidioc_enum_fmt_audio_cap      =3D asrc_m2m_enum_fmt_aud_cap,
> > +     .vidioc_enum_fmt_audio_out      =3D asrc_m2m_enum_fmt_aud_out,
> > +
> > +     .vidioc_g_fmt_audio_cap         =3D asrc_m2m_g_fmt_aud_cap,
> > +     .vidioc_g_fmt_audio_out         =3D asrc_m2m_g_fmt_aud_out,
> > +
> > +     .vidioc_s_fmt_audio_cap         =3D asrc_m2m_s_fmt_aud_cap,
> > +     .vidioc_s_fmt_audio_out         =3D asrc_m2m_s_fmt_aud_out,
> > +
> > +     .vidioc_try_fmt_audio_cap       =3D asrc_m2m_try_fmt_audio_cap,
> > +     .vidioc_try_fmt_audio_out       =3D asrc_m2m_try_fmt_audio_out,
> > +
> > +     .vidioc_qbuf                    =3D v4l2_m2m_ioctl_qbuf,
> > +     .vidioc_dqbuf                   =3D v4l2_m2m_ioctl_dqbuf,
> > +
> > +     .vidioc_create_bufs             =3D v4l2_m2m_ioctl_create_bufs,
> > +     .vidioc_prepare_buf             =3D v4l2_m2m_ioctl_prepare_buf,
> > +     .vidioc_reqbufs                 =3D v4l2_m2m_ioctl_reqbufs,
> > +     .vidioc_querybuf                =3D v4l2_m2m_ioctl_querybuf,
> > +     .vidioc_streamon                =3D v4l2_m2m_ioctl_streamon,
> > +     .vidioc_streamoff               =3D v4l2_m2m_ioctl_streamoff,
> > +     .vidioc_subscribe_event         =3D v4l2_ctrl_subscribe_event,
> > +     .vidioc_unsubscribe_event       =3D v4l2_event_unsubscribe,
> > +};
> > +
> > +/* dma complete callback */
> > +static void asrc_input_dma_callback(void *data)
> > +{
> > +     struct fsl_asrc_pair *pair =3D (struct fsl_asrc_pair *)data;
> > +
> > +     complete(&pair->complete[V4L_OUT]);
> > +}
> > +
> > +/* dma complete callback */
> > +static void asrc_output_dma_callback(void *data)
> > +{
> > +     struct fsl_asrc_pair *pair =3D (struct fsl_asrc_pair *)data;
> > +
> > +     complete(&pair->complete[V4L_CAP]);
> > +}
> > +
> > +/* config dma channel */
> > +static int asrc_dmaconfig(struct asrc_pair_m2m *pair_m2m,
> > +                       struct dma_chan *chan,
> > +                       u32 dma_addr, dma_addr_t buf_addr, u32 buf_len,
> > +                       int dir, int width)
> > +{
> > +     struct fsl_asrc_pair *pair =3D pair_m2m->pair;
> > +     struct fsl_asrc *asrc =3D pair->asrc;
> > +     struct asrc_m2m *m2m =3D pair_m2m->m2m;
> > +     struct device *dev =3D &m2m->pdev->dev;
> > +     struct dma_slave_config slave_config;
> > +     struct scatterlist sg[ASRC_M2M_SG_NUM];
> > +     enum dma_slave_buswidth buswidth;
> > +     unsigned int sg_len, max_period_size;
> > +     int ret, i;
> > +
> > +     switch (width) {
> > +     case 8:
> > +             buswidth =3D DMA_SLAVE_BUSWIDTH_1_BYTE;
> > +             break;
> > +     case 16:
> > +             buswidth =3D DMA_SLAVE_BUSWIDTH_2_BYTES;
> > +             break;
> > +     case 24:
> > +             buswidth =3D DMA_SLAVE_BUSWIDTH_3_BYTES;
> > +             break;
> > +     case 32:
> > +             buswidth =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> > +             break;
> > +     default:
> > +             dev_err(dev, "invalid word width\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     memset(&slave_config, 0, sizeof(slave_config));
> > +     if (dir =3D=3D V4L_OUT) {
> > +             slave_config.direction =3D DMA_MEM_TO_DEV;
> > +             slave_config.dst_addr =3D dma_addr;
> > +             slave_config.dst_addr_width =3D buswidth;
> > +             slave_config.dst_maxburst =3D asrc->m2m_get_maxburst(IN, =
pair);
> > +     } else {
> > +             slave_config.direction =3D DMA_DEV_TO_MEM;
> > +             slave_config.src_addr =3D dma_addr;
> > +             slave_config.src_addr_width =3D buswidth;
> > +             slave_config.src_maxburst =3D asrc->m2m_get_maxburst(OUT,=
 pair);
> > +     }
> > +
> > +     ret =3D dmaengine_slave_config(chan, &slave_config);
> > +     if (ret) {
> > +             dev_err(dev, "failed to config dmaengine for %s task: %d\=
n",
> > +                     DIR_STR(dir), ret);
> > +             return -EINVAL;
> > +     }
> > +
> > +     max_period_size =3D rounddown(ASRC_M2M_PERIOD_SIZE, width * pair-=
>channels / 8);
> > +     /* scatter gather mode */
> > +     sg_len =3D buf_len / max_period_size;
> > +     if (buf_len % max_period_size)
> > +             sg_len +=3D 1;
> > +
> > +     sg_init_table(sg, sg_len);
> > +     for (i =3D 0; i < (sg_len - 1); i++) {
> > +             sg_dma_address(&sg[i]) =3D buf_addr + i * max_period_size=
;
> > +             sg_dma_len(&sg[i]) =3D max_period_size;
> > +     }
> > +     sg_dma_address(&sg[i]) =3D buf_addr + i * max_period_size;
> > +     sg_dma_len(&sg[i]) =3D buf_len - i * max_period_size;
> > +
> > +     pair->desc[dir] =3D dmaengine_prep_slave_sg(chan, sg, sg_len,
> > +                                               slave_config.direction,
> > +                                               DMA_PREP_INTERRUPT);
> > +     if (!pair->desc[dir]) {
> > +             dev_err(dev, "failed to prepare dmaengine for %s task\n",=
 DIR_STR(dir));
> > +             return -EINVAL;
> > +     }
> > +
> > +     pair->desc[dir]->callback =3D ASRC_xPUT_DMA_CALLBACK(dir);
> > +     pair->desc[dir]->callback_param =3D pair;
> > +
> > +     return 0;
> > +}
> > +
> > +/* main function of converter */
> > +static void asrc_m2m_device_run(void *priv)
> > +{
> > +     struct asrc_pair_m2m *pair_m2m =3D priv;
> > +     struct fsl_asrc_pair *pair =3D pair_m2m->pair;
> > +     struct asrc_m2m *m2m =3D pair_m2m->m2m;
> > +     struct fsl_asrc *asrc =3D pair->asrc;
> > +     struct device *dev =3D &m2m->pdev->dev;
> > +     enum asrc_pair_index index =3D pair->index;
> > +     struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > +     unsigned int out_buf_len;
> > +     unsigned int cap_dma_len;
> > +     unsigned int width;
> > +     u32 fifo_addr;
> > +     int ret;
> > +
> > +     src_buf =3D v4l2_m2m_next_src_buf(pair_m2m->fh.m2m_ctx);
> > +     dst_buf =3D v4l2_m2m_next_dst_buf(pair_m2m->fh.m2m_ctx);
> > +
> > +     width =3D snd_pcm_format_physical_width(pair->sample_format[V4L_O=
UT]);
> > +     fifo_addr =3D asrc->paddr + asrc->get_fifo_addr(IN, index);
> > +     out_buf_len =3D vb2_get_plane_payload(&src_buf->vb2_buf, 0);
> > +     if (out_buf_len < width * pair->channels / 8 ||
> > +         out_buf_len > ASRC_M2M_BUFFER_SIZE ||
> > +         out_buf_len % (width * pair->channels / 8)) {
> > +             dev_err(dev, "out buffer size is error: [%d]\n", out_buf_=
len);
> > +             goto end;
> > +     }
> > +
> > +     /* dma config for output dma channel */
> > +     ret =3D asrc_dmaconfig(pair_m2m,
> > +                          pair->dma_chan[V4L_OUT],
> > +                          fifo_addr,
> > +                          vb2_dma_contig_plane_dma_addr(&src_buf->vb2_=
buf, 0),
> > +                          out_buf_len, V4L_OUT, width);
> > +     if (ret) {
> > +             dev_err(dev, "out dma config error\n");
> > +             goto end;
> > +     }
> > +
> > +     width =3D snd_pcm_format_physical_width(pair->sample_format[V4L_C=
AP]);
> > +     fifo_addr =3D asrc->paddr + asrc->get_fifo_addr(OUT, index);
> > +     cap_dma_len =3D asrc->m2m_calc_out_len(pair, out_buf_len);
> > +     if (cap_dma_len > 0 && cap_dma_len <=3D ASRC_M2M_BUFFER_SIZE) {
> > +             /* dma config for capture dma channel */
> > +             ret =3D asrc_dmaconfig(pair_m2m,
> > +                                  pair->dma_chan[V4L_CAP],
> > +                                  fifo_addr,
> > +                                  vb2_dma_contig_plane_dma_addr(&dst_b=
uf->vb2_buf, 0),
> > +                                  cap_dma_len, V4L_CAP, width);
> > +             if (ret) {
> > +                     dev_err(dev, "cap dma config error\n");
> > +                     goto end;
> > +             }
> > +     } else if (cap_dma_len > ASRC_M2M_BUFFER_SIZE) {
> > +             dev_err(dev, "cap buffer size error\n");
> > +             goto end;
> > +     }
> > +
> > +     reinit_completion(&pair->complete[V4L_OUT]);
> > +     reinit_completion(&pair->complete[V4L_CAP]);
> > +
> > +     /* Submit DMA request */
> > +     dmaengine_submit(pair->desc[V4L_OUT]);
> > +     dma_async_issue_pending(pair->desc[V4L_OUT]->chan);
> > +     if (cap_dma_len > 0) {
> > +             dmaengine_submit(pair->desc[V4L_CAP]);
> > +             dma_async_issue_pending(pair->desc[V4L_CAP]->chan);
> > +     }
> > +
> > +     asrc->m2m_start(pair);
> > +
> > +     if (!wait_for_completion_interruptible_timeout(&pair->complete[V4=
L_OUT], 10 * HZ)) {
> > +             dev_err(dev, "out DMA task timeout\n");
> > +             goto end;
> > +     }
> > +
> > +     if (cap_dma_len > 0) {
> > +             if (!wait_for_completion_interruptible_timeout(&pair->com=
plete[V4L_CAP], 10 * HZ)) {
> > +                     dev_err(dev, "cap DMA task timeout\n");
> > +                     goto end;
> > +             }
> > +     }
> > +
> > +     /* read the last words from FIFO */
> > +     asrc_read_last_fifo(pair, vb2_plane_vaddr(&dst_buf->vb2_buf, 0), =
&cap_dma_len);
> > +     /* update payload length for capture */
> > +     vb2_set_plane_payload(&dst_buf->vb2_buf, 0, cap_dma_len);
> > +
> > +end:
> > +     src_buf =3D v4l2_m2m_src_buf_remove(pair_m2m->fh.m2m_ctx);
> > +     dst_buf =3D v4l2_m2m_dst_buf_remove(pair_m2m->fh.m2m_ctx);
> > +
> > +     v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
> > +     v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
> > +
> > +     v4l2_m2m_job_finish(m2m->m2m_dev, pair_m2m->fh.m2m_ctx);
> > +}
> > +
> > +static int asrc_m2m_job_ready(void *priv)
> > +{
> > +     struct asrc_pair_m2m *pair_m2m =3D priv;
> > +
> > +     if (v4l2_m2m_num_src_bufs_ready(pair_m2m->fh.m2m_ctx) > 0 &&
> > +         v4l2_m2m_num_dst_bufs_ready(pair_m2m->fh.m2m_ctx) > 0) {
> > +             return 1;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct v4l2_m2m_ops asrc_m2m_ops =3D {
> > +     .job_ready =3D asrc_m2m_job_ready,
> > +     .device_run =3D asrc_m2m_device_run,
> > +};
> > +
> > +static int asrc_m2m_probe(struct platform_device *pdev)
> > +{
> > +     struct fsl_asrc_m2m_pdata *data =3D pdev->dev.platform_data;
> > +     struct device *dev =3D &pdev->dev;
> > +     struct asrc_m2m *m2m;
> > +     int ret;
> > +
> > +     m2m =3D devm_kzalloc(dev, sizeof(struct asrc_m2m), GFP_KERNEL);
> > +     if (!m2m)
> > +             return -ENOMEM;
> > +
> > +     m2m->pdata =3D *data;
> > +     m2m->pdev =3D pdev;
> > +
> > +     ret =3D v4l2_device_register(dev, &m2m->v4l2_dev);
> > +     if (ret) {
> > +             dev_err(dev, "failed to register v4l2 device\n");
> > +             goto err_register;
> > +     }
> > +
> > +     m2m->m2m_dev =3D v4l2_m2m_init(&asrc_m2m_ops);
> > +     if (IS_ERR(m2m->m2m_dev)) {
> > +             dev_err(dev, "failed to register v4l2 device\n");
> > +             ret =3D PTR_ERR(m2m->m2m_dev);
> > +             goto err_m2m;
> > +     }
> > +
> > +     m2m->dec_vdev =3D video_device_alloc();
> > +     if (!m2m->dec_vdev) {
> > +             dev_err(dev, "failed to register v4l2 device\n");
> > +             ret =3D -ENOMEM;
> > +             goto err_vdev_alloc;
> > +     }
> > +
> > +     mutex_init(&m2m->mlock);
> > +
> > +     m2m->dec_vdev->fops =3D &asrc_m2m_fops;
> > +     m2m->dec_vdev->ioctl_ops =3D &asrc_m2m_ioctl_ops;
> > +     m2m->dec_vdev->minor =3D -1;
> > +     m2m->dec_vdev->release =3D video_device_release;
> > +     m2m->dec_vdev->lock =3D &m2m->mlock; /* lock for ioctl serializat=
ion */
> > +     m2m->dec_vdev->v4l2_dev =3D &m2m->v4l2_dev;
> > +     m2m->dec_vdev->vfl_dir =3D VFL_DIR_M2M;
> > +     m2m->dec_vdev->device_caps =3D V4L2_CAP_STREAMING | V4L2_CAP_AUDI=
O_M2M;
> > +
> > +     ret =3D video_register_device(m2m->dec_vdev, VFL_TYPE_AUDIO, -1);
> > +     if (ret) {
> > +             dev_err(dev, "failed to register video device\n");
> > +             goto err_vdev_register;
> > +     }
> > +
> > +     video_set_drvdata(m2m->dec_vdev, m2m);
> > +     platform_set_drvdata(pdev, m2m);
> > +     pm_runtime_enable(&pdev->dev);
> > +
> > +     return 0;
> > +
> > +err_vdev_register:
> > +     video_device_release(m2m->dec_vdev);
> > +err_vdev_alloc:
> > +     v4l2_m2m_release(m2m->m2m_dev);
> > +err_m2m:
> > +     v4l2_device_unregister(&m2m->v4l2_dev);
> > +err_register:
> > +     return ret;
> > +}
> > +
> > +static void asrc_m2m_remove(struct platform_device *pdev)
> > +{
> > +     struct asrc_m2m *m2m =3D platform_get_drvdata(pdev);
> > +
> > +     pm_runtime_disable(&pdev->dev);
> > +     video_unregister_device(m2m->dec_vdev);
> > +     video_device_release(m2m->dec_vdev);
> > +     v4l2_m2m_release(m2m->m2m_dev);
> > +     v4l2_device_unregister(&m2m->v4l2_dev);
> > +}
> > +
> > +#ifdef CONFIG_PM_SLEEP
> > +/* suspend callback for m2m */
> > +static int asrc_m2m_suspend(struct device *dev)
> > +{
> > +     struct asrc_m2m *m2m =3D dev_get_drvdata(dev);
> > +     struct fsl_asrc *asrc =3D m2m->pdata.asrc;
> > +     struct fsl_asrc_pair *pair;
> > +     unsigned long lock_flags;
> > +     int i;
> > +
> > +     for (i =3D 0; i < PAIR_CTX_NUM; i++) {
> > +             spin_lock_irqsave(&asrc->lock, lock_flags);
> > +             pair =3D asrc->pair[i];
> > +             if (!pair || !pair->req_pair) {
> > +                     spin_unlock_irqrestore(&asrc->lock, lock_flags);
> > +                     continue;
> > +             }
> > +             if (!completion_done(&pair->complete[V4L_OUT])) {
> > +                     if (pair->dma_chan[V4L_OUT])
> > +                             dmaengine_terminate_all(pair->dma_chan[V4=
L_OUT]);
> > +                     asrc_input_dma_callback((void *)pair);
> > +             }
> > +             if (!completion_done(&pair->complete[V4L_CAP])) {
> > +                     if (pair->dma_chan[V4L_CAP])
> > +                             dmaengine_terminate_all(pair->dma_chan[V4=
L_CAP]);
> > +                     asrc_output_dma_callback((void *)pair);
> > +             }
> > +
> > +             if (asrc->m2m_pair_suspend)
> > +                     asrc->m2m_pair_suspend(pair);
> > +
> > +             spin_unlock_irqrestore(&asrc->lock, lock_flags);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int asrc_m2m_resume(struct device *dev)
> > +{
> > +     struct asrc_m2m *m2m =3D dev_get_drvdata(dev);
> > +     struct fsl_asrc *asrc =3D m2m->pdata.asrc;
> > +     struct fsl_asrc_pair *pair;
> > +     unsigned long lock_flags;
> > +     int i;
> > +
> > +     for (i =3D 0; i < PAIR_CTX_NUM; i++) {
> > +             spin_lock_irqsave(&asrc->lock, lock_flags);
> > +             pair =3D asrc->pair[i];
> > +             if (!pair || !pair->req_pair) {
> > +                     spin_unlock_irqrestore(&asrc->lock, lock_flags);
> > +                     continue;
> > +             }
> > +             if (asrc->m2m_pair_resume)
> > +                     asrc->m2m_pair_resume(pair);
> > +
> > +             spin_unlock_irqrestore(&asrc->lock, lock_flags);
> > +     }
> > +
> > +     return 0;
> > +}
> > +#endif
> > +
> > +static const struct dev_pm_ops asrc_m2m_pm_ops =3D {
> > +     SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(asrc_m2m_suspend,
> > +                                   asrc_m2m_resume)
> > +};
> > +
> > +static struct platform_driver asrc_m2m_driver =3D {
> > +     .probe  =3D asrc_m2m_probe,
> > +     .remove_new =3D asrc_m2m_remove,
> > +     .driver =3D {
> > +             .name =3D "fsl_asrc_m2m",
> > +             .pm =3D &asrc_m2m_pm_ops,
> > +     },
> > +};
> > +module_platform_driver(asrc_m2m_driver);
> > +
> > +MODULE_DESCRIPTION("Freescale ASRC M2M driver");
> > +MODULE_LICENSE("GPL");
>
> Regards,
>
>         Hans
