Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0B585D540
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 11:12:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dZjKee1X;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfsXN0cSwz3d2N
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 21:12:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dZjKee1X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfsWf34LHz2y1Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 21:11:56 +1100 (AEDT)
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3650b558a8cso15045405ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 02:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708510314; x=1709115114; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZKbp4usF7ZooMwkbNPV/awlOsKnx7RNduGOVFzVFPI=;
        b=dZjKee1Xh63CU/mmDHLRkUaqXgLwRBwIEk071wvhdoWxtHOxPns7srOdD04xOv0EXN
         ehu4YmAlS+HoQbRtSKoniO2pFrrjCQwtMjZYId9sHcb8hck2O9fuumyc4DifFsKp9A6t
         i0W10Oxam+ppqNgxo7J3HH7hi9t1uiAtlVslrgw7PQZVRD1YgsZXPYbRQfvGoy3XSMQK
         /Ch6nomGz47neoViMQznelu2/jNufajBhD5Ds9Z20a+3up2vdxO4lTyGtwBsAoCrO/C4
         4cQ/kvHmt6hZ/2p9VIeOc6p/X98VrYKeGeDEMSi5FDSqubgg+4ruNWuRUJokVyotL0LP
         y+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708510314; x=1709115114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZKbp4usF7ZooMwkbNPV/awlOsKnx7RNduGOVFzVFPI=;
        b=E2UfKXh1UARrf0It3zbXZehzl2xiHZUjwJiQUx2LsyT5PdJBCmPcWXb2bvTfRSNRIF
         0RrMVLxeU1q+K5fk5EsYdM74Zr4a3RetF09d7cs1cgfxPOW6vc+XlhyfE0CbEE+bvu2E
         nv6DZgYIxb86MjdeZNV0QzK9d+0CUZXvuJUQ99ReHGKgoCj4kcd/PsZyrw56kLBm3u2v
         PgIlXdNbYRYg07cIw33CpNC3OdkIzTQredFVaZqjWgGb0xjDpqasYVUlMbeo13KQO+80
         v6xXHc9HBMT1MD/Qtk4Y0xUacdppH2anExeWf1yNgv/1LhVay8mxg2W+YRHwJm54FpD8
         NFjA==
X-Forwarded-Encrypted: i=1; AJvYcCWrLzcJHAsTVFznH+q/ps8glUnDdUCxtzmeMFNGIzM8DuJcyDMo716DatSsnFLdeDN5Qo1XF9qR5u1LybhcCeNJWzB3FwmPQ7cqrfB8IA==
X-Gm-Message-State: AOJu0YwyraS23VbCYBaCnURweDEOqUPdUQNTCcKiQ0D1fXB3ejlcgK7D
	fx174NVd3ipzWd4U2sXRF5x6DTdS9pcIF8KcKwnuvYVjhEbiHlklji+Qb+xJHB47QUFxlVwdGdZ
	zvcpvJsMwzl5mPae9bch1GddYXGM=
X-Google-Smtp-Source: AGHT+IHwP0YGlKphHtm67xpwTbsPvnykS5moEGEGjG8wLiOUfX/6e8WVQL0nA7L2tX6O8Xl8WZ/vKMFsIJfBgPoCVzU=
X-Received: by 2002:a05:6e02:1143:b0:364:fffe:44c4 with SMTP id
 o3-20020a056e02114300b00364fffe44c4mr15812470ill.7.1708510313179; Wed, 21 Feb
 2024 02:11:53 -0800 (PST)
MIME-Version: 1.0
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
 <1705581128-4604-8-git-send-email-shengjiu.wang@nxp.com> <20240217104212.32f07e3a@coco.lan>
 <CAAFQd5CY731HRhFHpmwzGxAZ-BFV_pT7NNGwNGy4ZOA=qz8ntg@mail.gmail.com>
In-Reply-To: <CAAFQd5CY731HRhFHpmwzGxAZ-BFV_pT7NNGwNGy4ZOA=qz8ntg@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 21 Feb 2024 18:11:42 +0800
Message-ID: <CAA+D8AOKNK37urZfVsuzaTv8PYP-ggTORQEVSpNO0pbaereyLg@mail.gmail.com>
Subject: Re: [PATCH v12 07/15] media: v4l2: Add audio capture and output support
To: Tomasz Figa <tfiga@chromium.org>
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, hverkuil@xs4all.nl, broonie@kernel.org, sakari.ailus@iki.fi, m.szyprowski@samsung.com, Mauro Carvalho Chehab <mchehab@kernel.org>, festevam@gmail.com, perex@perex.cz, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 21, 2024 at 12:30=E2=80=AFPM Tomasz Figa <tfiga@chromium.org> w=
rote:
>
> On Sat, Feb 17, 2024 at 6:42=E2=80=AFPM Mauro Carvalho Chehab
> <mchehab@kernel.org> wrote:
> >
> > Em Thu, 18 Jan 2024 20:32:00 +0800
> > Shengjiu Wang <shengjiu.wang@nxp.com> escreveu:
> >
> > > Audio signal processing has the requirement for memory to
> > > memory similar as Video.
> > >
> > > This patch is to add this support in v4l2 framework, defined
> > > new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> > > V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> > > for audio case usage.
> > >
> > > The created audio device is named "/dev/v4l-audioX".
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  .../userspace-api/media/v4l/buffer.rst        |  6 ++
> > >  .../media/v4l/dev-audio-mem2mem.rst           | 71 +++++++++++++++++=
++
> > >  .../userspace-api/media/v4l/devices.rst       |  1 +
> > >  .../media/v4l/vidioc-enum-fmt.rst             |  2 +
> > >  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |  4 ++
> > >  .../media/videodev2.h.rst.exceptions          |  2 +
> > >  .../media/common/videobuf2/videobuf2-v4l2.c   |  4 ++
> > >  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  9 +++
> > >  drivers/media/v4l2-core/v4l2-dev.c            | 17 +++++
> > >  drivers/media/v4l2-core/v4l2-ioctl.c          | 53 ++++++++++++++
> > >  include/media/v4l2-dev.h                      |  2 +
> > >  include/media/v4l2-ioctl.h                    | 34 +++++++++
> > >  include/uapi/linux/videodev2.h                | 17 +++++
> > >  13 files changed, 222 insertions(+)
> > >  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-m=
em2mem.rst
> > >
> > > diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Docum=
entation/userspace-api/media/v4l/buffer.rst
> > > index 52bbee81c080..a3754ca6f0d6 100644
> > > --- a/Documentation/userspace-api/media/v4l/buffer.rst
> > > +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> > > @@ -438,6 +438,12 @@ enum v4l2_buf_type
> > >      * - ``V4L2_BUF_TYPE_META_OUTPUT``
> > >        - 14
> >
> > >        - Buffer for metadata output, see :ref:`metadata`.
> > > +    * - ``V4L2_BUF_TYPE_AUDIO_CAPTURE``
> > > +      - 15
> > > +      - Buffer for audio capture, see :ref:`audio`.
> > > +    * - ``V4L2_BUF_TYPE_AUDIO_OUTPUT``
> > > +      - 16
> >
> > Hmm... alsa APi define input/output as:
> >         enum {
> >                 SNDRV_PCM_STREAM_PLAYBACK =3D 0,
> >                 SNDRV_PCM_STREAM_CAPTURE,
> >                 SNDRV_PCM_STREAM_LAST =3D SNDRV_PCM_STREAM_CAPTURE,
> >         };
> >
> >
> > I would use a namespace as close as possible to the
> > ALSA API. Also, we're not talking about V4L2, but, instead
> > audio. so, not sure if I like the prefix to start with
> > V4L2_. Maybe ALSA_?
> >
> > So, a better namespace would be:
> >
> >         ${prefix}_BUF_TYPE_PCM_STREAM_PLAYBACK
> > and
> >         ${prefix}_BUF_TYPE_PCM_STREAM_CAPTURE
> >
>
> The API is still V4L2, and all the other non-video buf types also use
> the V4L2_ prefix, so perhaps that's good here as well?
>
> Whether AUDIO or PCM_STREAM makes more sense goes outside of my
> expertise. Subjectively, a PCM stream sounds more specific than an
> audio stream. Do those buf types also support non-PCM audio streams?

Currently I use it for PCM,  but I think it can also be used for non-PCM.
So use the below name?
V4L2_BUF_TYPE_AUDIO_CAPTURE
V4L2_BUF_TYPE_AUDIO_PLAYBACK

>
> > > +      - Buffer for audio output, see :ref:`audio`.
> > >
> > >
> > >  .. _buffer-flags:
> > > diff --git a/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.=
rst b/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
> > > new file mode 100644
> > > index 000000000000..68faecfe3a02
> > > --- /dev/null
> > > +++ b/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
> > > @@ -0,0 +1,71 @@
> > > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > > +
> > > +.. _audiomem2mem:
> > > +
> > > +********************************
> > > +Audio Memory-To-Memory Interface
> > > +********************************
> > > +
> > > +An audio memory-to-memory device can compress, decompress, transform=
, or
> > > +otherwise convert audio data from one format into another format, in=
 memory.
> > > +Such memory-to-memory devices set the ``V4L2_CAP_AUDIO_M2M`` capabil=
ity.
> > > +Examples of memory-to-memory devices are audio codecs, audio preproc=
essing,
> > > +audio postprocessing.
> > > +
> > > +A memory-to-memory audio node supports both output (sending audio fr=
ames from
> > > +memory to the hardware) and capture (receiving the processed audio f=
rames
> > > +from the hardware into memory) stream I/O. An application will have =
to
> > > +setup the stream I/O for both sides and finally call
> > > +:ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>` for both capture and output=
 to
> > > +start the hardware.
> > > +
> > > +Memory-to-memory devices function as a shared resource: you can
> > > +open the audio node multiple times, each application setting up thei=
r
> > > +own properties that are local to the file handle, and each can use
> > > +it independently from the others. The driver will arbitrate access t=
o
> > > +the hardware and reprogram it whenever another file handler gets acc=
ess.
> > > +
> > > +Audio memory-to-memory devices are accessed through character device
> > > +special files named ``/dev/v4l-audio``
> > > +
> > > +Querying Capabilities
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +Device nodes supporting the audio memory-to-memory interface set the
> > > +``V4L2_CAP_AUDIO_M2M`` flag in the ``device_caps`` field of the
> > > +:c:type:`v4l2_capability` structure returned by the :c:func:`VIDIOC_=
QUERYCAP`
> > > +ioctl.
> > > +
> > > +Data Format Negotiation
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > +
> > > +The audio device uses the :ref:`format` ioctls to select the capture=
 format.
> > > +The audio buffer content format is bound to that selected format. In=
 addition
> > > +to the basic :ref:`format` ioctls, the :c:func:`VIDIOC_ENUM_FMT` ioc=
tl must be
> > > +supported as well.
> > > +
> > > +To use the :ref:`format` ioctls applications set the ``type`` field =
of the
> > > +:c:type:`v4l2_format` structure to ``V4L2_BUF_TYPE_AUDIO_CAPTURE`` o=
r to
> > > +``V4L2_BUF_TYPE_AUDIO_OUTPUT``. Both drivers and applications must s=
et the
> > > +remainder of the :c:type:`v4l2_format` structure to 0.
> > > +
> > > +.. c:type:: v4l2_audio_format
> > > +
> > > +.. tabularcolumns:: |p{1.4cm}|p{2.4cm}|p{13.5cm}|
> > > +
> > > +.. flat-table:: struct v4l2_audio_format
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths:       1 1 2
> > > +
> > > +    * - __u32
> > > +      - ``pixelformat``
> > > +      - The sample format, set by the application. see :ref:`pixfmt-=
audio`
> >
> > pixelformat doesn't make any sense for audio: there are no pixels on a
> > PCM stream. Please use call it, instead: `snd_pcm_format`, making it ma=
tch
> > the values for snd_pcm_format_t.
> >
>
> +1
>
> FWIW v4l2_meta_format uses the name "dataformat".
>
> Actually, I just realized that the C code actually uses the name
> "audioformat". Tbh., after reading the kerneldoc comment, my
> subjective preference would be on "sample_format", since that's
> exactly what it is.
>
Ok, I will change it to sampleformat.

Best Regards
Shengjiu Wang

> > Yet, I would keep defining it as u32 (or u64?) instead of using a
> > typedef int field there (snd_pcm_format_t), as the size of integer
> > is different on 32 and 64 bit kernels.
>
> +1
>
> Best regards,
> Tomasz
