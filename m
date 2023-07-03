Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F42746484
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 22:54:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JlEA/11x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qvypg2SjZz30ht
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 06:54:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JlEA/11x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qvh9B1TX5z2yxt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 19:54:37 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b82bf265b2so18618555ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jul 2023 02:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688378074; x=1690970074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4yjNXI6RsQY4No2IAn40O67+Q16S+qpvnnajPmOG68w=;
        b=JlEA/11xw6Qt/iiC60AtTIqnGIhB/ujCkbq9oM1AHAUBrCiKbO8mfWXZhjRMMydtVQ
         EuuDNLZ7IxWJCA4MUX8SZxsXZfI+f50hofwcd1pQlzkd+kNnAHM7I5ImtLrS8Hky11ue
         6GYyWJGvUuy4qLEQ+mgoH9tSfsXy5Arqnd0H+AyQU0NC9kpHYX69spBkHRQpCxZxExR+
         KsQ9SuOaaYPlwETwNk5ckrIXoOzgBao7MhRX3SMbehPH7IwQYexUp4phXcO5LNajZYzg
         NXw9S8hLmXnQ7BP2xCg7gnAm+xcMtjILZv3EfmdS/bG40iYXUd8PRxatiHwOIaXe7uzV
         8xFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688378074; x=1690970074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4yjNXI6RsQY4No2IAn40O67+Q16S+qpvnnajPmOG68w=;
        b=SNs8OmtPkwwky9sGKzRp9gUPEogsY4nCwglC3mkAFDCUl5MLeSr2SUpL9ISbwH8Bvu
         quit3szVRaf/vQ4Bzg9CBLwy34mFz45gQbDnroUjoCv2YE/cEeqVdHQaRvlxxbagzFXI
         hDEwNZVe6wmHmvht8uBfChQizOvByzRs4Hg6C7eRzuEQyxpnAl4gQUkQwSNFkQYNeXVh
         peexEU8iajqr2ujHw700+ZlOZRk3EdTJaKGFtsTnUkKeGgnq0iv0lmH3EwpnZu+keUo+
         kY4DKPo8U1ZWsV3f4fIO+VRilP5vjbz5krYmNBNDaPv1xWPWKOffqc6d0cj/FCOnuuN1
         WUgg==
X-Gm-Message-State: ABy/qLZgLARLuz8j9ULp0YeCBBFmbs53PmuPQBKlIKts3nnPBH25t/ol
	jYN2osLnfz9x86UPiVaC6yNltu8G8vgSQurgoug=
X-Google-Smtp-Source: APBJJlF58YOhTSzvaLhsT7DEDpEVx+lx9c0PjPzONnad+fkt+puwbbvmY+WhXDe+sU+Crg65RS81/RsSqtnucXABOIg=
X-Received: by 2002:a05:6a20:3955:b0:11f:b885:e83a with SMTP id
 r21-20020a056a20395500b0011fb885e83amr10484739pzg.57.1688378074243; Mon, 03
 Jul 2023 02:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
 <1688002673-28493-2-git-send-email-shengjiu.wang@nxp.com> <ZJ6o5fT4V4HXivFa@valkosipuli.retiisi.eu>
In-Reply-To: <ZJ6o5fT4V4HXivFa@valkosipuli.retiisi.eu>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 3 Jul 2023 17:54:22 +0800
Message-ID: <CAA+D8AND1yZ7eZLjBGxVF=i3hLMecUm-j7AVHN9npJi-4=3VrA@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: v4l2: Add audio capture and output support
To: Sakari Ailus <sakari.ailus@iki.fi>
Content-Type: multipart/alternative; boundary="0000000000005ca72e05ff92274d"
X-Mailman-Approved-At: Tue, 04 Jul 2023 06:53:49 +1000
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
Cc: hverkuil@xs4all.nl, alsa-devel@alsa-project.org, mchehab@kernel.org, Jacopo Mondi <jacopo@jmondi.org>, Xiubo.Lee@gmail.com, lgirdwood@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org, broonie@kernel.org, perex@perex.cz, linux-media@vger.kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000005ca72e05ff92274d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari

On Fri, Jun 30, 2023 at 6:05=E2=80=AFPM Sakari Ailus <sakari.ailus@iki.fi> =
wrote:

> Hi Shengjiu,
>
> On Thu, Jun 29, 2023 at 09:37:48AM +0800, Shengjiu Wang wrote:
> > Audio signal processing has the requirement for memory to
> > memory similar as Video.
> >
> > This patch is to add this support in v4l2 framework, defined
> > new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> > V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> > for audio case usage.
>
> Why are you proposing to add this to V4L2 framework instead of doing this
> within ALSA?
>
> Also cc Hans and Jacopo.


There is no such memory to memory interface defined in ALSA.  Seems
ALSA is not designed for M2M cases.

V4L2 is designed for video, radio, image, sdr, meta...,   so I think audio
can be
naturally added to the support scope.

Thanks.

Best regards
Shengjiu Wang

>


> >
> > The created audio device is named "/dev/audioX".
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../media/common/videobuf2/videobuf2-v4l2.c   |  4 ++
> >  drivers/media/v4l2-core/v4l2-dev.c            | 17 ++++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c          | 52 +++++++++++++++++++
> >  include/media/v4l2-dev.h                      |  2 +
> >  include/media/v4l2-ioctl.h                    | 34 ++++++++++++
> >  include/uapi/linux/videodev2.h                | 19 +++++++
> >  6 files changed, 128 insertions(+)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > index c7a54d82a55e..12f2be2773a2 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > @@ -785,6 +785,10 @@ int vb2_create_bufs(struct vb2_queue *q, struct
> v4l2_create_buffers *create)
> >       case V4L2_BUF_TYPE_META_OUTPUT:
> >               requested_sizes[0] =3D f->fmt.meta.buffersize;
> >               break;
> > +     case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> > +     case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> > +             requested_sizes[0] =3D f->fmt.audio.buffersize;
> > +             break;
> >       default:
> >               return -EINVAL;
> >       }
> > diff --git a/drivers/media/v4l2-core/v4l2-dev.c
> b/drivers/media/v4l2-core/v4l2-dev.c
> > index f81279492682..67484f4c6eaf 100644
> > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > @@ -553,6 +553,7 @@ static void determine_valid_ioctls(struct
> video_device *vdev)
> >       bool is_tch =3D vdev->vfl_type =3D=3D VFL_TYPE_TOUCH;
> >       bool is_meta =3D vdev->vfl_type =3D=3D VFL_TYPE_VIDEO &&
> >                      (vdev->device_caps & meta_caps);
> > +     bool is_audio =3D vdev->vfl_type =3D=3D VFL_TYPE_AUDIO;
> >       bool is_rx =3D vdev->vfl_dir !=3D VFL_DIR_TX;
> >       bool is_tx =3D vdev->vfl_dir !=3D VFL_DIR_RX;
> >       bool is_io_mc =3D vdev->device_caps & V4L2_CAP_IO_MC;
> > @@ -664,6 +665,19 @@ static void determine_valid_ioctls(struct
> video_device *vdev)
> >               SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_meta_out)=
;
> >               SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT,
> vidioc_try_fmt_meta_out);
> >       }
> > +     if (is_audio && is_rx) {
> > +             /* audio capture specific ioctls */
> > +             SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT,
> vidioc_enum_fmt_audio_cap);
> > +             SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_audio_cap=
);
> > +             SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_audio_cap=
);
> > +             SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT,
> vidioc_try_fmt_audio_cap);
> > +     } else if (is_audio && is_tx) {
> > +             /* audio output specific ioctls */
> > +             SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT,
> vidioc_enum_fmt_audio_out);
> > +             SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_audio_out=
);
> > +             SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_audio_out=
);
> > +             SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT,
> vidioc_try_fmt_audio_out);
> > +     }
> >       if (is_vbi) {
> >               /* vbi specific ioctls */
> >               if ((is_rx && (ops->vidioc_g_fmt_vbi_cap ||
> > @@ -927,6 +941,9 @@ int __video_register_device(struct video_device
> *vdev,
> >       case VFL_TYPE_TOUCH:
> >               name_base =3D "v4l-touch";
> >               break;
> > +     case VFL_TYPE_AUDIO:
> > +             name_base =3D "audio";
> > +             break;
> >       default:
> >               pr_err("%s called with unknown type: %d\n",
> >                      __func__, type);
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c
> b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index a858acea6547..26bc4b0d8ef0 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -188,6 +188,8 @@ const char *v4l2_type_names[] =3D {
> >       [V4L2_BUF_TYPE_SDR_OUTPUT]         =3D "sdr-out",
> >       [V4L2_BUF_TYPE_META_CAPTURE]       =3D "meta-cap",
> >       [V4L2_BUF_TYPE_META_OUTPUT]        =3D "meta-out",
> > +     [V4L2_BUF_TYPE_AUDIO_CAPTURE]      =3D "audio-cap",
> > +     [V4L2_BUF_TYPE_AUDIO_OUTPUT]       =3D "audio-out",
> >  };
> >  EXPORT_SYMBOL(v4l2_type_names);
> >
> > @@ -276,6 +278,7 @@ static void v4l_print_format(const void *arg, bool
> write_only)
> >       const struct v4l2_sliced_vbi_format *sliced;
> >       const struct v4l2_window *win;
> >       const struct v4l2_meta_format *meta;
> > +     const struct v4l2_audio_format *audio;
> >       u32 pixelformat;
> >       u32 planes;
> >       unsigned i;
> > @@ -346,6 +349,12 @@ static void v4l_print_format(const void *arg, bool
> write_only)
> >               pr_cont(", dataformat=3D%p4cc, buffersize=3D%u\n",
> >                       &pixelformat, meta->buffersize);
> >               break;
> > +     case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> > +     case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> > +             audio =3D &p->fmt.audio;
> > +             pr_cont(", rate=3D%u, format=3D%u, channels=3D%u,
> buffersize=3D%u\n",
> > +                     audio->rate, audio->format, audio->channels,
> audio->buffersize);
> > +             break;
> >       }
> >  }
> >
> > @@ -927,6 +936,7 @@ static int check_fmt(struct file *file, enum
> v4l2_buf_type type)
> >       bool is_tch =3D vfd->vfl_type =3D=3D VFL_TYPE_TOUCH;
> >       bool is_meta =3D vfd->vfl_type =3D=3D VFL_TYPE_VIDEO &&
> >                      (vfd->device_caps & meta_caps);
> > +     bool is_audio =3D vfd->vfl_type =3D=3D VFL_TYPE_AUDIO;
> >       bool is_rx =3D vfd->vfl_dir !=3D VFL_DIR_TX;
> >       bool is_tx =3D vfd->vfl_dir !=3D VFL_DIR_RX;
> >
> > @@ -992,6 +1002,14 @@ static int check_fmt(struct file *file, enum
> v4l2_buf_type type)
> >               if (is_meta && is_tx && ops->vidioc_g_fmt_meta_out)
> >                       return 0;
> >               break;
> > +     case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> > +             if (is_audio && is_rx && ops->vidioc_g_fmt_audio_cap)
> > +                     return 0;
> > +             break;
> > +     case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> > +             if (is_audio && is_tx && ops->vidioc_g_fmt_audio_out)
> > +                     return 0;
> > +             break;
> >       default:
> >               break;
> >       }
> > @@ -1592,6 +1610,16 @@ static int v4l_enum_fmt(const struct
> v4l2_ioctl_ops *ops,
> >                       break;
> >               ret =3D ops->vidioc_enum_fmt_meta_out(file, fh, arg);
> >               break;
> > +     case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> > +             if (unlikely(!ops->vidioc_enum_fmt_audio_cap))
> > +                     break;
> > +             ret =3D ops->vidioc_enum_fmt_audio_cap(file, fh, arg);
> > +             break;
> > +     case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> > +             if (unlikely(!ops->vidioc_enum_fmt_audio_out))
> > +                     break;
> > +             ret =3D ops->vidioc_enum_fmt_audio_out(file, fh, arg);
> > +             break;
> >       }
> >       if (ret =3D=3D 0)
> >               v4l_fill_fmtdesc(p);
> > @@ -1668,6 +1696,10 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops
> *ops,
> >               return ops->vidioc_g_fmt_meta_cap(file, fh, arg);
> >       case V4L2_BUF_TYPE_META_OUTPUT:
> >               return ops->vidioc_g_fmt_meta_out(file, fh, arg);
> > +     case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> > +             return ops->vidioc_g_fmt_audio_cap(file, fh, arg);
> > +     case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> > +             return ops->vidioc_g_fmt_audio_out(file, fh, arg);
> >       }
> >       return -EINVAL;
> >  }
> > @@ -1779,6 +1811,16 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops
> *ops,
> >                       break;
> >               memset_after(p, 0, fmt.meta);
> >               return ops->vidioc_s_fmt_meta_out(file, fh, arg);
> > +     case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> > +             if (unlikely(!ops->vidioc_s_fmt_audio_cap))
> > +                     break;
> > +             memset_after(p, 0, fmt.audio);
> > +             return ops->vidioc_s_fmt_audio_cap(file, fh, arg);
> > +     case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> > +             if (unlikely(!ops->vidioc_s_fmt_audio_out))
> > +                     break;
> > +             memset_after(p, 0, fmt.audio);
> > +             return ops->vidioc_s_fmt_audio_out(file, fh, arg);
> >       }
> >       return -EINVAL;
> >  }
> > @@ -1887,6 +1929,16 @@ static int v4l_try_fmt(const struct
> v4l2_ioctl_ops *ops,
> >                       break;
> >               memset_after(p, 0, fmt.meta);
> >               return ops->vidioc_try_fmt_meta_out(file, fh, arg);
> > +     case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> > +             if (unlikely(!ops->vidioc_try_fmt_audio_cap))
> > +                     break;
> > +             memset_after(p, 0, fmt.audio);
> > +             return ops->vidioc_try_fmt_audio_cap(file, fh, arg);
> > +     case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> > +             if (unlikely(!ops->vidioc_try_fmt_audio_out))
> > +                     break;
> > +             memset_after(p, 0, fmt.audio);
> > +             return ops->vidioc_try_fmt_audio_out(file, fh, arg);
> >       }
> >       return -EINVAL;
> >  }
> > diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> > index e0a13505f88d..0924e6d1dab1 100644
> > --- a/include/media/v4l2-dev.h
> > +++ b/include/media/v4l2-dev.h
> > @@ -30,6 +30,7 @@
> >   * @VFL_TYPE_SUBDEV: for V4L2 subdevices
> >   * @VFL_TYPE_SDR:    for Software Defined Radio tuners
> >   * @VFL_TYPE_TOUCH:  for touch sensors
> > + * @VFL_TYPE_AUDIO:  for audio input/output devices
> >   * @VFL_TYPE_MAX:    number of VFL types, must always be last in the
> enum
> >   */
> >  enum vfl_devnode_type {
> > @@ -39,6 +40,7 @@ enum vfl_devnode_type {
> >       VFL_TYPE_SUBDEV,
> >       VFL_TYPE_SDR,
> >       VFL_TYPE_TOUCH,
> > +     VFL_TYPE_AUDIO,
> >       VFL_TYPE_MAX /* Shall be the last one */
> >  };
> >
> > diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> > index edb733f21604..f840cf740ce1 100644
> > --- a/include/media/v4l2-ioctl.h
> > +++ b/include/media/v4l2-ioctl.h
> > @@ -45,6 +45,12 @@ struct v4l2_fh;
> >   * @vidioc_enum_fmt_meta_out: pointer to the function that implements
> >   *   :ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
> >   *   for metadata output
> > + * @vidioc_enum_fmt_audio_cap: pointer to the function that implements
> > + *   :ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
> > + *   for audio capture
> > + * @vidioc_enum_fmt_audio_out: pointer to the function that implements
> > + *   :ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
> > + *   for audio output
> >   * @vidioc_g_fmt_vid_cap: pointer to the function that implements
> >   *   :ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video capture
> >   *   in single plane mode
> > @@ -79,6 +85,10 @@ struct v4l2_fh;
> >   *   :ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for metadata captu=
re
> >   * @vidioc_g_fmt_meta_out: pointer to the function that implements
> >   *   :ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for metadata outpu=
t
> > + * @vidioc_g_fmt_audio_cap: pointer to the function that implements
> > + *   :ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for audio capture
> > + * @vidioc_g_fmt_audio_out: pointer to the function that implements
> > + *   :ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for audio output
> >   * @vidioc_s_fmt_vid_cap: pointer to the function that implements
> >   *   :ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video capture
> >   *   in single plane mode
> > @@ -113,6 +123,10 @@ struct v4l2_fh;
> >   *   :ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for metadata captu=
re
> >   * @vidioc_s_fmt_meta_out: pointer to the function that implements
> >   *   :ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for metadata outpu=
t
> > + * @vidioc_s_fmt_audio_cap: pointer to the function that implements
> > + *   :ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for audio capture
> > + * @vidioc_s_fmt_audio_out: pointer to the function that implements
> > + *   :ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for audio output
> >   * @vidioc_try_fmt_vid_cap: pointer to the function that implements
> >   *   :ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video captur=
e
> >   *   in single plane mode
> > @@ -149,6 +163,10 @@ struct v4l2_fh;
> >   *   :ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for metadata
> capture
> >   * @vidioc_try_fmt_meta_out: pointer to the function that implements
> >   *   :ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for metadata
> output
> > + * @vidioc_try_fmt_audio_cap: pointer to the function that implements
> > + *   :ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for audio captur=
e
> > + * @vidioc_try_fmt_audio_out: pointer to the function that implements
> > + *   :ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for audio output
> >   * @vidioc_reqbufs: pointer to the function that implements
> >   *   :ref:`VIDIOC_REQBUFS <vidioc_reqbufs>` ioctl
> >   * @vidioc_querybuf: pointer to the function that implements
> > @@ -315,6 +333,10 @@ struct v4l2_ioctl_ops {
> >                                       struct v4l2_fmtdesc *f);
> >       int (*vidioc_enum_fmt_meta_out)(struct file *file, void *fh,
> >                                       struct v4l2_fmtdesc *f);
> > +     int (*vidioc_enum_fmt_audio_cap)(struct file *file, void *fh,
> > +                                      struct v4l2_fmtdesc *f);
> > +     int (*vidioc_enum_fmt_audio_out)(struct file *file, void *fh,
> > +                                      struct v4l2_fmtdesc *f);
> >
> >       /* VIDIOC_G_FMT handlers */
> >       int (*vidioc_g_fmt_vid_cap)(struct file *file, void *fh,
> > @@ -345,6 +367,10 @@ struct v4l2_ioctl_ops {
> >                                    struct v4l2_format *f);
> >       int (*vidioc_g_fmt_meta_out)(struct file *file, void *fh,
> >                                    struct v4l2_format *f);
> > +     int (*vidioc_g_fmt_audio_cap)(struct file *file, void *fh,
> > +                                   struct v4l2_format *f);
> > +     int (*vidioc_g_fmt_audio_out)(struct file *file, void *fh,
> > +                                   struct v4l2_format *f);
> >
> >       /* VIDIOC_S_FMT handlers */
> >       int (*vidioc_s_fmt_vid_cap)(struct file *file, void *fh,
> > @@ -375,6 +401,10 @@ struct v4l2_ioctl_ops {
> >                                    struct v4l2_format *f);
> >       int (*vidioc_s_fmt_meta_out)(struct file *file, void *fh,
> >                                    struct v4l2_format *f);
> > +     int (*vidioc_s_fmt_audio_cap)(struct file *file, void *fh,
> > +                                   struct v4l2_format *f);
> > +     int (*vidioc_s_fmt_audio_out)(struct file *file, void *fh,
> > +                                   struct v4l2_format *f);
> >
> >       /* VIDIOC_TRY_FMT handlers */
> >       int (*vidioc_try_fmt_vid_cap)(struct file *file, void *fh,
> > @@ -405,6 +435,10 @@ struct v4l2_ioctl_ops {
> >                                      struct v4l2_format *f);
> >       int (*vidioc_try_fmt_meta_out)(struct file *file, void *fh,
> >                                      struct v4l2_format *f);
> > +     int (*vidioc_try_fmt_audio_cap)(struct file *file, void *fh,
> > +                                     struct v4l2_format *f);
> > +     int (*vidioc_try_fmt_audio_out)(struct file *file, void *fh,
> > +                                     struct v4l2_format *f);
> >
> >       /* Buffer handlers */
> >       int (*vidioc_reqbufs)(struct file *file, void *fh,
> > diff --git a/include/uapi/linux/videodev2.h
> b/include/uapi/linux/videodev2.h
> > index aee75eb9e686..a7af28f4c8c3 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -153,6 +153,8 @@ enum v4l2_buf_type {
> >       V4L2_BUF_TYPE_SDR_OUTPUT           =3D 12,
> >       V4L2_BUF_TYPE_META_CAPTURE         =3D 13,
> >       V4L2_BUF_TYPE_META_OUTPUT          =3D 14,
> > +     V4L2_BUF_TYPE_AUDIO_CAPTURE        =3D 15,
> > +     V4L2_BUF_TYPE_AUDIO_OUTPUT         =3D 16,
> >       /* Deprecated, do not use */
> >       V4L2_BUF_TYPE_PRIVATE              =3D 0x80,
> >  };
> > @@ -169,6 +171,7 @@ enum v4l2_buf_type {
> >        || (type) =3D=3D V4L2_BUF_TYPE_VBI_OUTPUT                  \
> >        || (type) =3D=3D V4L2_BUF_TYPE_SLICED_VBI_OUTPUT           \
> >        || (type) =3D=3D V4L2_BUF_TYPE_SDR_OUTPUT                  \
> > +      || (type) =3D=3D V4L2_BUF_TYPE_AUDIO_OUTPUT                \
> >        || (type) =3D=3D V4L2_BUF_TYPE_META_OUTPUT)
> >
> >  #define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
> > @@ -2404,6 +2407,20 @@ struct v4l2_meta_format {
> >       __u32                           buffersize;
> >  } __attribute__ ((packed));
> >
> > +/**
> > + * struct v4l2_audio_format - audio data format definition
> > + * @rate:            sample rate
> > + * @format:          sample format
> > + * @channels:                channel numbers
> > + * @buffersize:              maximum size in bytes required for data
> > + */
> > +struct v4l2_audio_format {
> > +     __u32                           rate;
> > +     __u32                           format;
> > +     __u32                           channels;
> > +     __u32                           buffersize;
> > +} __attribute__ ((packed));
> > +
> >  /**
> >   * struct v4l2_format - stream data format
> >   * @type:    enum v4l2_buf_type; type of the data stream
> > @@ -2412,6 +2429,7 @@ struct v4l2_meta_format {
> >   * @win:     definition of an overlaid image
> >   * @vbi:     raw VBI capture or output parameters
> >   * @sliced:  sliced VBI capture or output parameters
> > + * @audio:   definition of an audio format
> >   * @raw_data:        placeholder for future extensions and custom
> formats
> >   * @fmt:     union of @pix, @pix_mp, @win, @vbi, @sliced, @sdr, @meta
> >   *           and @raw_data
> > @@ -2426,6 +2444,7 @@ struct v4l2_format {
> >               struct v4l2_sliced_vbi_format   sliced;  /*
> V4L2_BUF_TYPE_SLICED_VBI_CAPTURE */
> >               struct v4l2_sdr_format          sdr;     /*
> V4L2_BUF_TYPE_SDR_CAPTURE */
> >               struct v4l2_meta_format         meta;    /*
> V4L2_BUF_TYPE_META_CAPTURE */
> > +             struct v4l2_audio_format        audio;   /*
> V4L2_BUF_TYPE_AUDIO_CAPTURE */
> >               __u8    raw_data[200];                   /* user-defined =
*/
> >       } fmt;
> >  };
> > --
> > 2.34.1
> >
>
> --
> Sakari Ailus
>

--0000000000005ca72e05ff92274d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Sakari</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, Jun 30, 2023 at 6:05=E2=80=AFPM Saka=
ri Ailus &lt;<a href=3D"mailto:sakari.ailus@iki.fi">sakari.ailus@iki.fi</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi S=
hengjiu,<br>
<br>
On Thu, Jun 29, 2023 at 09:37:48AM +0800, Shengjiu Wang wrote:<br>
&gt; Audio signal processing has the requirement for memory to<br>
&gt; memory similar as Video.<br>
&gt; <br>
&gt; This patch is to add this support in v4l2 framework, defined<br>
&gt; new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and<br>
&gt; V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format<br>
&gt; for audio case usage.<br>
<br>
Why are you proposing to add this to V4L2 framework instead of doing this<b=
r>
within ALSA?<br>
<br>
Also cc Hans and Jacopo.</blockquote><div><br></div><div>There is no such m=
emory to memory interface defined in ALSA.=C2=A0 Seems</div><div>ALSA is no=
t designed for M2M cases.</div><div><br></div><div>V4L2 is designed for vid=
eo, radio, image, sdr, meta...,=C2=A0 =C2=A0so I think audio can be</div><d=
iv>naturally added to the support scope.=C2=A0=C2=A0</div><div><br></div><d=
iv>Thanks.</div><div>=C2=A0</div><div>Best regards</div><div>Shengjiu Wang<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0</blockquote><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; The created audio device is named &quot;/dev/audioX&quot;.<br>
&gt; <br>
&gt; Signed-off-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@nxp.c=
om" target=3D"_blank">shengjiu.wang@nxp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../media/common/videobuf2/videobuf2-v4l2.c=C2=A0 =C2=A0|=C2=A0 =
4 ++<br>
&gt;=C2=A0 drivers/media/v4l2-core/v4l2-dev.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 17 ++++++<br>
&gt;=C2=A0 drivers/media/v4l2-core/v4l2-ioctl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 52 +++++++++++++++++++<br>
&gt;=C2=A0 include/media/v4l2-dev.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
&gt;=C2=A0 include/media/v4l2-ioctl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 34 ++++++++++++<br>
&gt;=C2=A0 include/uapi/linux/videodev2.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 19 +++++++<br>
&gt;=C2=A0 6 files changed, 128 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers=
/media/common/videobuf2/videobuf2-v4l2.c<br>
&gt; index c7a54d82a55e..12f2be2773a2 100644<br>
&gt; --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c<br>
&gt; +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c<br>
&gt; @@ -785,6 +785,10 @@ int vb2_create_bufs(struct vb2_queue *q, struct v=
4l2_create_buffers *create)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case V4L2_BUF_TYPE_META_OUTPUT:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0requested_sizes[=
0] =3D f-&gt;fmt.meta.buffersize;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case V4L2_BUF_TYPE_AUDIO_CAPTURE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case V4L2_BUF_TYPE_AUDIO_OUTPUT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0requested_sizes[0] =
=3D f-&gt;fmt.audio.buffersize;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-c=
ore/v4l2-dev.c<br>
&gt; index f81279492682..67484f4c6eaf 100644<br>
&gt; --- a/drivers/media/v4l2-core/v4l2-dev.c<br>
&gt; +++ b/drivers/media/v4l2-core/v4l2-dev.c<br>
&gt; @@ -553,6 +553,7 @@ static void determine_valid_ioctls(struct video_de=
vice *vdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_tch =3D vdev-&gt;vfl_type =3D=3D VFL=
_TYPE_TOUCH;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_meta =3D vdev-&gt;vfl_type =3D=3D VF=
L_TYPE_VIDEO &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (vdev-&gt;device_caps &amp; meta_caps);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool is_audio =3D vdev-&gt;vfl_type =3D=3D VFL_TY=
PE_AUDIO;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_rx =3D vdev-&gt;vfl_dir !=3D VFL_DIR=
_TX;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_tx =3D vdev-&gt;vfl_dir !=3D VFL_DIR=
_RX;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_io_mc =3D vdev-&gt;device_caps &amp;=
 V4L2_CAP_IO_MC;<br>
&gt; @@ -664,6 +665,19 @@ static void determine_valid_ioctls(struct video_d=
evice *vdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SET_VALID_IOCTL(=
ops, VIDIOC_S_FMT, vidioc_s_fmt_meta_out);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SET_VALID_IOCTL(=
ops, VIDIOC_TRY_FMT, vidioc_try_fmt_meta_out);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (is_audio &amp;&amp; is_rx) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* audio capture spec=
ific ioctls */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SET_VALID_IOCTL(ops, =
VIDIOC_ENUM_FMT, vidioc_enum_fmt_audio_cap);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SET_VALID_IOCTL(ops, =
VIDIOC_G_FMT, vidioc_g_fmt_audio_cap);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SET_VALID_IOCTL(ops, =
VIDIOC_S_FMT, vidioc_s_fmt_audio_cap);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SET_VALID_IOCTL(ops, =
VIDIOC_TRY_FMT, vidioc_try_fmt_audio_cap);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if (is_audio &amp;&amp; is_tx) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* audio output speci=
fic ioctls */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SET_VALID_IOCTL(ops, =
VIDIOC_ENUM_FMT, vidioc_enum_fmt_audio_out);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SET_VALID_IOCTL(ops, =
VIDIOC_G_FMT, vidioc_g_fmt_audio_out);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SET_VALID_IOCTL(ops, =
VIDIOC_S_FMT, vidioc_s_fmt_audio_out);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SET_VALID_IOCTL(ops, =
VIDIOC_TRY_FMT, vidioc_try_fmt_audio_out);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_vbi) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* vbi specific =
ioctls */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((is_rx &amp;=
&amp; (ops-&gt;vidioc_g_fmt_vbi_cap ||<br>
&gt; @@ -927,6 +941,9 @@ int __video_register_device(struct video_device *v=
dev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case VFL_TYPE_TOUCH:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name_base =3D &q=
uot;v4l-touch&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case VFL_TYPE_AUDIO:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name_base =3D &quot;a=
udio&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;%s =
called with unknown type: %d\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 __func__, type);<br>
&gt; diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2=
-core/v4l2-ioctl.c<br>
&gt; index a858acea6547..26bc4b0d8ef0 100644<br>
&gt; --- a/drivers/media/v4l2-core/v4l2-ioctl.c<br>
&gt; +++ b/drivers/media/v4l2-core/v4l2-ioctl.c<br>
&gt; @@ -188,6 +188,8 @@ const char *v4l2_type_names[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[V4L2_BUF_TYPE_SDR_OUTPUT]=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D &quot;sdr-out&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[V4L2_BUF_TYPE_META_CAPTURE]=C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;meta-cap&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[V4L2_BUF_TYPE_META_OUTPUT]=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D &quot;meta-out&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[V4L2_BUF_TYPE_AUDIO_CAPTURE]=C2=A0 =C2=A0 =C2=A0=
 =3D &quot;audio-cap&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[V4L2_BUF_TYPE_AUDIO_OUTPUT]=C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;audio-out&quot;,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 EXPORT_SYMBOL(v4l2_type_names);<br>
&gt;=C2=A0 <br>
&gt; @@ -276,6 +278,7 @@ static void v4l_print_format(const void *arg, bool=
 write_only)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct v4l2_sliced_vbi_format *sliced;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct v4l2_window *win;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct v4l2_meta_format *meta;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const struct v4l2_audio_format *audio;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 pixelformat;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 planes;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned i;<br>
&gt; @@ -346,6 +349,12 @@ static void v4l_print_format(const void *arg, boo=
l write_only)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_cont(&quot;, =
dataformat=3D%p4cc, buffersize=3D%u\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;pixelformat, meta-&gt;buffersize);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case V4L2_BUF_TYPE_AUDIO_CAPTURE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case V4L2_BUF_TYPE_AUDIO_OUTPUT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0audio =3D &amp;p-&gt;=
fmt.audio;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_cont(&quot;, rate=
=3D%u, format=3D%u, channels=3D%u, buffersize=3D%u\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0audio-&gt;rate, audio-&gt;format, audio-&gt;channels, audio-&gt;buff=
ersize);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -927,6 +936,7 @@ static int check_fmt(struct file *file, enum v4l2_=
buf_type type)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_tch =3D vfd-&gt;vfl_type =3D=3D VFL_=
TYPE_TOUCH;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_meta =3D vfd-&gt;vfl_type =3D=3D VFL=
_TYPE_VIDEO &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (vfd-&gt;device_caps &amp; meta_caps);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool is_audio =3D vfd-&gt;vfl_type =3D=3D VFL_TYP=
E_AUDIO;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_rx =3D vfd-&gt;vfl_dir !=3D VFL_DIR_=
TX;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_tx =3D vfd-&gt;vfl_dir !=3D VFL_DIR_=
RX;<br>
&gt;=C2=A0 <br>
&gt; @@ -992,6 +1002,14 @@ static int check_fmt(struct file *file, enum v4l=
2_buf_type type)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_meta &amp=
;&amp; is_tx &amp;&amp; ops-&gt;vidioc_g_fmt_meta_out)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case V4L2_BUF_TYPE_AUDIO_CAPTURE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_audio &amp;&am=
p; is_rx &amp;&amp; ops-&gt;vidioc_g_fmt_audio_cap)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case V4L2_BUF_TYPE_AUDIO_OUTPUT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_audio &amp;&am=
p; is_tx &amp;&amp; ops-&gt;vidioc_g_fmt_audio_out)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -1592,6 +1610,16 @@ static int v4l_enum_fmt(const struct v4l2_ioctl=
_ops *ops,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ops-&gt;=
vidioc_enum_fmt_meta_out(file, fh, arg);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case V4L2_BUF_TYPE_AUDIO_CAPTURE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(!ops-&gt=
;vidioc_enum_fmt_audio_cap))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ops-&gt;vidio=
c_enum_fmt_audio_cap(file, fh, arg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case V4L2_BUF_TYPE_AUDIO_OUTPUT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(!ops-&gt=
;vidioc_enum_fmt_audio_out))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ops-&gt;vidio=
c_enum_fmt_audio_out(file, fh, arg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v4l_fill_fmtdesc=
(p);<br>
&gt; @@ -1668,6 +1696,10 @@ static int v4l_g_fmt(const struct v4l2_ioctl_op=
s *ops,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ops-&gt;v=
idioc_g_fmt_meta_cap(file, fh, arg);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case V4L2_BUF_TYPE_META_OUTPUT:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ops-&gt;v=
idioc_g_fmt_meta_out(file, fh, arg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case V4L2_BUF_TYPE_AUDIO_CAPTURE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ops-&gt;vidioc=
_g_fmt_audio_cap(file, fh, arg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case V4L2_BUF_TYPE_AUDIO_OUTPUT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ops-&gt;vidioc=
_g_fmt_audio_out(file, fh, arg);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt;=C2=A0 }<br>
&gt; @@ -1779,6 +1811,16 @@ static int v4l_s_fmt(const struct v4l2_ioctl_op=
s *ops,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset_after(p, =
0, fmt.meta);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ops-&gt;v=
idioc_s_fmt_meta_out(file, fh, arg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case V4L2_BUF_TYPE_AUDIO_CAPTURE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(!ops-&gt=
;vidioc_s_fmt_audio_cap))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset_after(p, 0, fm=
t.audio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ops-&gt;vidioc=
_s_fmt_audio_cap(file, fh, arg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case V4L2_BUF_TYPE_AUDIO_OUTPUT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(!ops-&gt=
;vidioc_s_fmt_audio_out))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset_after(p, 0, fm=
t.audio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ops-&gt;vidioc=
_s_fmt_audio_out(file, fh, arg);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt;=C2=A0 }<br>
&gt; @@ -1887,6 +1929,16 @@ static int v4l_try_fmt(const struct v4l2_ioctl_=
ops *ops,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset_after(p, =
0, fmt.meta);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ops-&gt;v=
idioc_try_fmt_meta_out(file, fh, arg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case V4L2_BUF_TYPE_AUDIO_CAPTURE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(!ops-&gt=
;vidioc_try_fmt_audio_cap))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset_after(p, 0, fm=
t.audio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ops-&gt;vidioc=
_try_fmt_audio_cap(file, fh, arg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case V4L2_BUF_TYPE_AUDIO_OUTPUT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(!ops-&gt=
;vidioc_try_fmt_audio_out))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset_after(p, 0, fm=
t.audio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ops-&gt;vidioc=
_try_fmt_audio_out(file, fh, arg);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt;=C2=A0 }<br>
&gt; diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h<br>
&gt; index e0a13505f88d..0924e6d1dab1 100644<br>
&gt; --- a/include/media/v4l2-dev.h<br>
&gt; +++ b/include/media/v4l2-dev.h<br>
&gt; @@ -30,6 +30,7 @@<br>
&gt;=C2=A0 =C2=A0* @VFL_TYPE_SUBDEV: for V4L2 subdevices<br>
&gt;=C2=A0 =C2=A0* @VFL_TYPE_SDR:=C2=A0 =C2=A0 for Software Defined Radio t=
uners<br>
&gt;=C2=A0 =C2=A0* @VFL_TYPE_TOUCH:=C2=A0 for touch sensors<br>
&gt; + * @VFL_TYPE_AUDIO:=C2=A0 for audio input/output devices<br>
&gt;=C2=A0 =C2=A0* @VFL_TYPE_MAX:=C2=A0 =C2=A0 number of VFL types, must al=
ways be last in the enum<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 enum vfl_devnode_type {<br>
&gt; @@ -39,6 +40,7 @@ enum vfl_devnode_type {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VFL_TYPE_SUBDEV,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VFL_TYPE_SDR,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VFL_TYPE_TOUCH,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0VFL_TYPE_AUDIO,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VFL_TYPE_MAX /* Shall be the last one */<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h<b=
r>
&gt; index edb733f21604..f840cf740ce1 100644<br>
&gt; --- a/include/media/v4l2-ioctl.h<br>
&gt; +++ b/include/media/v4l2-ioctl.h<br>
&gt; @@ -45,6 +45,12 @@ struct v4l2_fh;<br>
&gt;=C2=A0 =C2=A0* @vidioc_enum_fmt_meta_out: pointer to the function that =
implements<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0:ref:`VIDIOC_ENUM_FMT &lt;vidioc_enum_fmt&gt=
;` ioctl logic<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0for metadata output<br>
&gt; + * @vidioc_enum_fmt_audio_cap: pointer to the function that implement=
s<br>
&gt; + *=C2=A0 =C2=A0:ref:`VIDIOC_ENUM_FMT &lt;vidioc_enum_fmt&gt;` ioctl l=
ogic<br>
&gt; + *=C2=A0 =C2=A0for audio capture<br>
&gt; + * @vidioc_enum_fmt_audio_out: pointer to the function that implement=
s<br>
&gt; + *=C2=A0 =C2=A0:ref:`VIDIOC_ENUM_FMT &lt;vidioc_enum_fmt&gt;` ioctl l=
ogic<br>
&gt; + *=C2=A0 =C2=A0for audio output<br>
&gt;=C2=A0 =C2=A0* @vidioc_g_fmt_vid_cap: pointer to the function that impl=
ements<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0:ref:`VIDIOC_G_FMT &lt;vidioc_g_fmt&gt;` ioc=
tl logic for video capture<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0in single plane mode<br>
&gt; @@ -79,6 +85,10 @@ struct v4l2_fh;<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0:ref:`VIDIOC_G_FMT &lt;vidioc_g_fmt&gt;` ioc=
tl logic for metadata capture<br>
&gt;=C2=A0 =C2=A0* @vidioc_g_fmt_meta_out: pointer to the function that imp=
lements<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0:ref:`VIDIOC_G_FMT &lt;vidioc_g_fmt&gt;` ioc=
tl logic for metadata output<br>
&gt; + * @vidioc_g_fmt_audio_cap: pointer to the function that implements<b=
r>
&gt; + *=C2=A0 =C2=A0:ref:`VIDIOC_G_FMT &lt;vidioc_g_fmt&gt;` ioctl logic f=
or audio capture<br>
&gt; + * @vidioc_g_fmt_audio_out: pointer to the function that implements<b=
r>
&gt; + *=C2=A0 =C2=A0:ref:`VIDIOC_G_FMT &lt;vidioc_g_fmt&gt;` ioctl logic f=
or audio output<br>
&gt;=C2=A0 =C2=A0* @vidioc_s_fmt_vid_cap: pointer to the function that impl=
ements<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0:ref:`VIDIOC_S_FMT &lt;vidioc_g_fmt&gt;` ioc=
tl logic for video capture<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0in single plane mode<br>
&gt; @@ -113,6 +123,10 @@ struct v4l2_fh;<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0:ref:`VIDIOC_S_FMT &lt;vidioc_g_fmt&gt;` ioc=
tl logic for metadata capture<br>
&gt;=C2=A0 =C2=A0* @vidioc_s_fmt_meta_out: pointer to the function that imp=
lements<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0:ref:`VIDIOC_S_FMT &lt;vidioc_g_fmt&gt;` ioc=
tl logic for metadata output<br>
&gt; + * @vidioc_s_fmt_audio_cap: pointer to the function that implements<b=
r>
&gt; + *=C2=A0 =C2=A0:ref:`VIDIOC_S_FMT &lt;vidioc_g_fmt&gt;` ioctl logic f=
or audio capture<br>
&gt; + * @vidioc_s_fmt_audio_out: pointer to the function that implements<b=
r>
&gt; + *=C2=A0 =C2=A0:ref:`VIDIOC_S_FMT &lt;vidioc_g_fmt&gt;` ioctl logic f=
or audio output<br>
&gt;=C2=A0 =C2=A0* @vidioc_try_fmt_vid_cap: pointer to the function that im=
plements<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0:ref:`VIDIOC_TRY_FMT &lt;vidioc_g_fmt&gt;` i=
octl logic for video capture<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0in single plane mode<br>
&gt; @@ -149,6 +163,10 @@ struct v4l2_fh;<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0:ref:`VIDIOC_TRY_FMT &lt;vidioc_g_fmt&gt;` i=
octl logic for metadata capture<br>
&gt;=C2=A0 =C2=A0* @vidioc_try_fmt_meta_out: pointer to the function that i=
mplements<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0:ref:`VIDIOC_TRY_FMT &lt;vidioc_g_fmt&gt;` i=
octl logic for metadata output<br>
&gt; + * @vidioc_try_fmt_audio_cap: pointer to the function that implements=
<br>
&gt; + *=C2=A0 =C2=A0:ref:`VIDIOC_TRY_FMT &lt;vidioc_g_fmt&gt;` ioctl logic=
 for audio capture<br>
&gt; + * @vidioc_try_fmt_audio_out: pointer to the function that implements=
<br>
&gt; + *=C2=A0 =C2=A0:ref:`VIDIOC_TRY_FMT &lt;vidioc_g_fmt&gt;` ioctl logic=
 for audio output<br>
&gt;=C2=A0 =C2=A0* @vidioc_reqbufs: pointer to the function that implements=
<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0:ref:`VIDIOC_REQBUFS &lt;vidioc_reqbufs&gt;`=
 ioctl<br>
&gt;=C2=A0 =C2=A0* @vidioc_querybuf: pointer to the function that implement=
s<br>
&gt; @@ -315,6 +333,10 @@ struct v4l2_ioctl_ops {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct=
 v4l2_fmtdesc *f);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*vidioc_enum_fmt_meta_out)(struct file =
*file, void *fh,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct=
 v4l2_fmtdesc *f);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int (*vidioc_enum_fmt_audio_cap)(struct file *fil=
e, void *fh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct v4l2=
_fmtdesc *f);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int (*vidioc_enum_fmt_audio_out)(struct file *fil=
e, void *fh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct v4l2=
_fmtdesc *f);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* VIDIOC_G_FMT handlers */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*vidioc_g_fmt_vid_cap)(struct file *fil=
e, void *fh,<br>
&gt; @@ -345,6 +367,10 @@ struct v4l2_ioctl_ops {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct v4l2_format =
*f);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*vidioc_g_fmt_meta_out)(struct file *fi=
le, void *fh,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct v4l2_format =
*f);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int (*vidioc_g_fmt_audio_cap)(struct file *file, =
void *fh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct v4l2_format =
*f);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int (*vidioc_g_fmt_audio_out)(struct file *file, =
void *fh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct v4l2_format =
*f);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* VIDIOC_S_FMT handlers */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*vidioc_s_fmt_vid_cap)(struct file *fil=
e, void *fh,<br>
&gt; @@ -375,6 +401,10 @@ struct v4l2_ioctl_ops {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct v4l2_format =
*f);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*vidioc_s_fmt_meta_out)(struct file *fi=
le, void *fh,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct v4l2_format =
*f);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int (*vidioc_s_fmt_audio_cap)(struct file *file, =
void *fh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct v4l2_format =
*f);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int (*vidioc_s_fmt_audio_out)(struct file *file, =
void *fh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct v4l2_format =
*f);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* VIDIOC_TRY_FMT handlers */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*vidioc_try_fmt_vid_cap)(struct file *f=
ile, void *fh,<br>
&gt; @@ -405,6 +435,10 @@ struct v4l2_ioctl_ops {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct v4l2_=
format *f);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*vidioc_try_fmt_meta_out)(struct file *=
file, void *fh,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct v4l2_=
format *f);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int (*vidioc_try_fmt_audio_cap)(struct file *file=
, void *fh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct v4l2_=
format *f);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int (*vidioc_try_fmt_audio_out)(struct file *file=
, void *fh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct v4l2_=
format *f);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Buffer handlers */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*vidioc_reqbufs)(struct file *file, voi=
d *fh,<br>
&gt; diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/video=
dev2.h<br>
&gt; index aee75eb9e686..a7af28f4c8c3 100644<br>
&gt; --- a/include/uapi/linux/videodev2.h<br>
&gt; +++ b/include/uapi/linux/videodev2.h<br>
&gt; @@ -153,6 +153,8 @@ enum v4l2_buf_type {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0V4L2_BUF_TYPE_SDR_OUTPUT=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0=3D 12,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0V4L2_BUF_TYPE_META_CAPTURE=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D 13,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0V4L2_BUF_TYPE_META_OUTPUT=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D 14,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0V4L2_BUF_TYPE_AUDIO_CAPTURE=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D 15,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0V4L2_BUF_TYPE_AUDIO_OUTPUT=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D 16,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Deprecated, do not use */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0V4L2_BUF_TYPE_PRIVATE=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x80,<br>
&gt;=C2=A0 };<br>
&gt; @@ -169,6 +171,7 @@ enum v4l2_buf_type {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (type) =3D=3D V4L2_BUF_TYPE_VBI_OUTPUT=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (type) =3D=3D V4L2_BUF_TYPE_SLICED_VBI_O=
UTPUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (type) =3D=3D V4L2_BUF_TYPE_SDR_OUTPUT=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 || (type) =3D=3D V4L2_BUF_TYPE_AUDIO_OUTPUT=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (type) =3D=3D V4L2_BUF_TYPE_META_OUTPUT)=
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))<=
br>
&gt; @@ -2404,6 +2407,20 @@ struct v4l2_meta_format {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buffersize;<br>
&gt;=C2=A0 } __attribute__ ((packed));<br>
&gt;=C2=A0 <br>
&gt; +/**<br>
&gt; + * struct v4l2_audio_format - audio data format definition<br>
&gt; + * @rate:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sample rate<br>
&gt; + * @format:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sample format<br>
&gt; + * @channels:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
channel numbers<br>
&gt; + * @buffersize:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 maxim=
um size in bytes required for data<br>
&gt; + */<br>
&gt; +struct v4l2_audio_format {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rate;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0channels;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buffersize;<br>
&gt; +} __attribute__ ((packed));<br>
&gt; +<br>
&gt;=C2=A0 /**<br>
&gt;=C2=A0 =C2=A0* struct v4l2_format - stream data format<br>
&gt;=C2=A0 =C2=A0* @type:=C2=A0 =C2=A0 enum v4l2_buf_type; type of the data=
 stream<br>
&gt; @@ -2412,6 +2429,7 @@ struct v4l2_meta_format {<br>
&gt;=C2=A0 =C2=A0* @win:=C2=A0 =C2=A0 =C2=A0definition of an overlaid image=
<br>
&gt;=C2=A0 =C2=A0* @vbi:=C2=A0 =C2=A0 =C2=A0raw VBI capture or output param=
eters<br>
&gt;=C2=A0 =C2=A0* @sliced:=C2=A0 sliced VBI capture or output parameters<b=
r>
&gt; + * @audio:=C2=A0 =C2=A0definition of an audio format<br>
&gt;=C2=A0 =C2=A0* @raw_data:=C2=A0 =C2=A0 =C2=A0 =C2=A0 placeholder for fu=
ture extensions and custom formats<br>
&gt;=C2=A0 =C2=A0* @fmt:=C2=A0 =C2=A0 =C2=A0union of @pix, @pix_mp, @win, @=
vbi, @sliced, @sdr, @meta<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and @raw_data<br=
>
&gt; @@ -2426,6 +2444,7 @@ struct v4l2_format {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct v4l2_slic=
ed_vbi_format=C2=A0 =C2=A0sliced;=C2=A0 /* V4L2_BUF_TYPE_SLICED_VBI_CAPTURE=
 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct v4l2_sdr_=
format=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sdr;=C2=A0 =C2=A0 =C2=A0/* V4L2_BU=
F_TYPE_SDR_CAPTURE */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct v4l2_meta=
_format=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta;=C2=A0 =C2=A0 /* V4L2_BUF_TYP=
E_META_CAPTURE */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct v4l2_audio_for=
mat=C2=A0 =C2=A0 =C2=A0 =C2=A0 audio;=C2=A0 =C2=A0/* V4L2_BUF_TYPE_AUDIO_CA=
PTURE */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__u8=C2=A0 =C2=
=A0 raw_data[200];=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* user-defined */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} fmt;<br>
&gt;=C2=A0 };<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
<br>
-- <br>
Sakari Ailus<br>
</blockquote></div></div>

--0000000000005ca72e05ff92274d--
