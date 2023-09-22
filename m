Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F174B7AACE1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 10:40:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X495x/Z4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsQgp5cZlz3gd5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 18:40:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X495x/Z4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsQbx6Lg6z3jSS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 18:36:45 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-27666e94ad7so1520795a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 01:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695371802; x=1695976602; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDQ7y+hkk4dwa8EQCdhEUcJ35wSsUoT3qA/mweAqTX4=;
        b=X495x/Z4HuKB+99LYfTXBIfi29FMiA+mp1/o6LPxQz1fgqmT1zQn+5u4rkplEWqWEr
         zpBRxbwlRyP385FTauD5K1+/7Ry5i8+FyjUuHu0Ih/OWqAxkSFBU2GO9zVpTzuTP9Ue6
         pnSUpefr83of4QRirvBzcaiozQfy1MU3OIx0JVriX1IoBCsiC5EAa6qzsRd8BxIUzjls
         j2hBM9hNgzMD5zCM4A84jpI1VlurtKmtE9LjKn1X4ZOIztbp1WFOh1EiOi9+kazSMZqg
         WBQznLr5pWC8qqYMpHT0eQ3RlwjNiLTKj/fmXEQ3eRLj9gUu9zHU7vc85dSd5fn0tuzE
         HRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695371802; x=1695976602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDQ7y+hkk4dwa8EQCdhEUcJ35wSsUoT3qA/mweAqTX4=;
        b=i83GeJrRSWVcWdXOfGAcs4FpTcSqjDHDO3pFo9uQgTBoWjtq/7cAlsrltdOcnx++yw
         vsgDM7sLgnSezsyrgcZ/fDKTDVjSgdVHnZLq6hEvFXvlti3OnYqcu1nt7oTv8nYWxweW
         +eznJWi/SlpNUiZcBf647oGjKIrKKmIJf6cpFjrqe4WU1iJiIJLVSeVAMWQlOWt4szik
         H2T3g2b+tNZPfieTRO0zrVDeUDgWbU3a5j9SXIbPau2lhG2xu8TVg1vdB8NibBw7Iw1Q
         ypVAbPWMFOlluNGstLu6qL8AKxsHpDdImbxBY5SolSc6D4Nvbr6gXSJLeuteul1yt2Uv
         7igQ==
X-Gm-Message-State: AOJu0Yy1bQ6yd3GZ35fUdEl2W4irIFIJWGrvntva2d39yKIrlFbmDJ8f
	3LfMWSVXXt/8Nz1ePayCntTBkSpeB07A1KQfCrk=
X-Google-Smtp-Source: AGHT+IHVbcp30ADAfkX3fLMWL6UNAVka+ZWooXyuwVAx22QOruriV59YsHoYMIRnE1G2jWqtyp1T1aaGk5Xc/rOx9No=
X-Received: by 2002:a17:90a:2a84:b0:273:f10c:b6d2 with SMTP id
 j4-20020a17090a2a8400b00273f10cb6d2mr3090086pjd.18.1695371802265; Fri, 22 Sep
 2023 01:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <1694670845-17070-1-git-send-email-shengjiu.wang@nxp.com>
 <1694670845-17070-7-git-send-email-shengjiu.wang@nxp.com> <f9ad3d89-af41-4bcf-8f58-bb52f8458532@xs4all.nl>
In-Reply-To: <f9ad3d89-af41-4bcf-8f58-bb52f8458532@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 22 Sep 2023 16:36:30 +0800
Message-ID: <CAA+D8AMdmbKwdnqewCfcG1uTnk9vQYaiHBbP8bVgzxVnJuGYRQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 6/9] media: v4l2: Add audio capture and output support
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

On Wed, Sep 20, 2023 at 6:12=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> Hi Shengjiu,
>
> I just noticed you posted a v4, but I expect that my comments below are s=
till valid...
>
> On 14/09/2023 07:54, Shengjiu Wang wrote:
> > Audio signal processing has the requirement for memory to
> > memory similar as Video.
> >
> > This patch is to add this support in v4l2 framework, defined
> > new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> > V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> > for audio case usage.
> >
> > Defined V4L2_AUDIO_FMT_LPCM format type for audio.
> >
> > Defined V4L2_CAP_AUDIO_M2M capability type for audio memory
> > to memory case.
> >
> > The created audio device is named "/dev/v4l-audioX".
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../userspace-api/media/v4l/audio-formats.rst | 15 +++++
> >  .../userspace-api/media/v4l/buffer.rst        |  6 ++
> >  .../userspace-api/media/v4l/dev-audio.rst     | 63 +++++++++++++++++++
> >  .../userspace-api/media/v4l/devices.rst       |  1 +
> >  .../media/v4l/pixfmt-aud-lpcm.rst             | 31 +++++++++
> >  .../userspace-api/media/v4l/pixfmt.rst        |  1 +
> >  .../media/v4l/vidioc-enum-fmt.rst             |  2 +
> >  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |  4 ++
> >  .../media/v4l/vidioc-querycap.rst             |  3 +
> >  .../media/videodev2.h.rst.exceptions          |  2 +
> >  .../media/common/videobuf2/videobuf2-v4l2.c   |  4 ++
> >  drivers/media/v4l2-core/v4l2-dev.c            | 17 +++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c          | 53 ++++++++++++++++
> >  include/media/v4l2-dev.h                      |  2 +
> >  include/media/v4l2-ioctl.h                    | 34 ++++++++++
> >  include/uapi/linux/videodev2.h                | 25 ++++++++
> >  16 files changed, 263 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/v4l/audio-formats=
.rst
> >  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio.rst
> >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-aud-lp=
cm.rst
> >
> > diff --git a/Documentation/userspace-api/media/v4l/audio-formats.rst b/=
Documentation/userspace-api/media/v4l/audio-formats.rst
> > new file mode 100644
> > index 000000000000..bc52712d20d3
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/audio-formats.rst
> > @@ -0,0 +1,15 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +
> > +.. _audio-formats:
> > +
> > +*************
> > +Audio Formats
> > +*************
> > +
> > +These formats are used for :ref:`audio` interface only.
> > +
> > +
> > +.. toctree::
> > +    :maxdepth: 1
> > +
> > +    pixfmt-aud-lpcm
> > diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documen=
tation/userspace-api/media/v4l/buffer.rst
> > index 04dec3e570ed..80cf2cb20dfe 100644
> > --- a/Documentation/userspace-api/media/v4l/buffer.rst
> > +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> > @@ -438,6 +438,12 @@ enum v4l2_buf_type
> >      * - ``V4L2_BUF_TYPE_META_OUTPUT``
> >        - 14
> >        - Buffer for metadata output, see :ref:`metadata`.
> > +    * - ``V4L2_BUF_TYPE_AUDIO_CAPTURE``
> > +      - 15
> > +      - Buffer for audio capture, see :ref:`audio`.
> > +    * - ``V4L2_BUF_TYPE_AUDIO_OUTPUT``
> > +      - 16
> > +      - Buffer for audio output, see :ref:`audio`.
> >
> >
> >  .. _buffer-flags:
> > diff --git a/Documentation/userspace-api/media/v4l/dev-audio.rst b/Docu=
mentation/userspace-api/media/v4l/dev-audio.rst
> > new file mode 100644
> > index 000000000000..f9bcf0c7b056
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/dev-audio.rst
>
> Rename the file to dev-audio-mem2mem.rst as this is specific to an audio
> M2M interface.
>
> > @@ -0,0 +1,63 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +
> > +.. _audiodev:
> > +
> > +******************
> > +audio Interface
> > +******************
> > +
> > +The audio interface is implemented on audio device nodes. The audio de=
vice
> > +which uses application software for modulation or demodulation. This
> > +interface is intended for controlling and data streaming of such devic=
es
> > +
> > +Audio devices are accessed through character device special files name=
d
> > +``/dev/v4l-audio``
>
> I think this intro is somewhat confusing. I would recommend to copy the i=
ntro
> from dev-mem2mem.rst instead, adapting it for audio.
>
> > +
> > +Querying Capabilities
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Device nodes supporting the audio capture and output interface set the
> > +``V4L2_CAP_AUDIO_M2M`` flag in the ``device_caps`` field of the
> > +:c:type:`v4l2_capability` structure returned by the :c:func:`VIDIOC_QU=
ERYCAP`
> > +ioctl.
> > +
> > +At least one of the read/write or streaming I/O methods must be suppor=
ted.
>
> M2M devices do not support read/write, only streaming I/O is supported.
>
> > +
> > +
> > +Data Format Negotiation
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The audio device uses the :ref:`format` ioctls to select the capture f=
ormat.
> > +The audio buffer content format is bound to that selected format. In a=
ddition
> > +to the basic :ref:`format` ioctls, the :c:func:`VIDIOC_ENUM_FMT` ioctl=
 must be
> > +supported as well.
> > +
> > +To use the :ref:`format` ioctls applications set the ``type`` field of=
 the
> > +:c:type:`v4l2_format` structure to ``V4L2_BUF_TYPE_AUDIO_CAPTURE`` or =
to
> > +``V4L2_BUF_TYPE_AUDIO_OUTPUT``. Both drivers and applications must set=
 the
> > +remainder of the :c:type:`v4l2_format` structure to 0.
> > +
> > +.. c:type:: v4l2_audio_format
> > +
> > +.. tabularcolumns:: |p{1.4cm}|p{2.4cm}|p{13.5cm}|
> > +
> > +.. flat-table:: struct v4l2_audio_format
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 1 2
> > +
> > +    * - __u32
> > +      - ``rate``
> > +      - The sample rate, set by the application. The range is [5512, 7=
68000].
> > +    * - __u32
> > +      - ``format``
> > +      - The sample format, set by the application. format is defined a=
s
> > +        SNDRV_PCM_FORMAT_S8, SNDRV_PCM_FORMAT_U8, ...,
> > +    * - __u32
> > +      - ``channels``
> > +      - The channel number, set by the application. channel number ran=
ge is
> > +        [1, 32].
> > +    * - __u32
> > +      - ``buffersize``
> > +      - Maximum buffer size in bytes required for data. The value is s=
et by the
> > +        driver.
> > diff --git a/Documentation/userspace-api/media/v4l/devices.rst b/Docume=
ntation/userspace-api/media/v4l/devices.rst
> > index 8bfbad65a9d4..8261f3468489 100644
> > --- a/Documentation/userspace-api/media/v4l/devices.rst
> > +++ b/Documentation/userspace-api/media/v4l/devices.rst
> > @@ -24,3 +24,4 @@ Interfaces
> >      dev-event
> >      dev-subdev
> >      dev-meta
> > +    dev-audio
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-aud-lpcm.rst =
b/Documentation/userspace-api/media/v4l/pixfmt-aud-lpcm.rst
> > new file mode 100644
> > index 000000000000..f9ebe2a05f69
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-aud-lpcm.rst
> > @@ -0,0 +1,31 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +
> > +.. _v4l2-aud-fmt-lpcm:
> > +
> > +*************************
> > +V4L2_AUDIO_FMT_LPCM ('LPCM')
> > +*************************
> > +
> > +Linear Pulse-Code Modulation (LPCM)
> > +
> > +
> > +Description
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +This describes audio format used by the audio memory to memory driver.
> > +
> > +It contains the following fields:
> > +
> > +.. flat-table::
> > +    :widths: 1 4
> > +    :header-rows:  1
> > +    :stub-columns: 0
> > +
> > +    * - Field
> > +      - Description
> > +    * - u32 samplerate;
> > +      - which is the number of times per second that samples are taken=
.
> > +    * - u32 sampleformat;
> > +      - which determines the number of possible digital values that ca=
n be used to represent each sample
> > +    * - u32 channels;
> > +      - channel number for each sample.
>
> See Sakari's comments. This section describes how the audio data is forma=
tted
> in the buffer memory. Presumably this is already documented somewhere in =
the ALSA
> docs, so a reference to that would work.
>
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Documen=
tation/userspace-api/media/v4l/pixfmt.rst
> > index 11dab4a90630..e205db5fa8af 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
> > @@ -36,3 +36,4 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
> >      colorspaces
> >      colorspaces-defs
> >      colorspaces-details
> > +    audio-formats
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst =
b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> > index 000c154b0f98..42deb07f4ff4 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> > @@ -96,6 +96,8 @@ the ``mbus_code`` field is handled differently:
> >       ``V4L2_BUF_TYPE_VIDEO_OVERLAY``,
> >       ``V4L2_BUF_TYPE_SDR_CAPTURE``,
> >       ``V4L2_BUF_TYPE_SDR_OUTPUT``,
> > +     ``V4L2_BUF_TYPE_AUDIO_CAPTURE``,
> > +     ``V4L2_BUF_TYPE_AUDIO_OUTPUT``,
> >       ``V4L2_BUF_TYPE_META_CAPTURE`` and
> >       ``V4L2_BUF_TYPE_META_OUTPUT``.
> >       See :c:type:`v4l2_buf_type`.
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst b/D=
ocumentation/userspace-api/media/v4l/vidioc-g-fmt.rst
> > index 675c385e5aca..1ecb7d640057 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst
> > @@ -130,6 +130,10 @@ The format as returned by :ref:`VIDIOC_TRY_FMT <VI=
DIOC_G_FMT>` must be identical
> >        - ``meta``
> >        - Definition of a metadata format, see :ref:`meta-formats`, used=
 by
> >       metadata capture devices.
> > +    * - struct :c:type:`v4l2_audio_format`
> > +      - ``audio``
> > +      - Definition of a audio data format, see :ref:`dev-audio`, used =
by
> > +        audio capture and output devices
> >      * - __u8
> >        - ``raw_data``\ [200]
> >        - Place holder for future extensions.
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst =
b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
> > index 6c57b8428356..0b3cefefc86b 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
> > @@ -259,6 +259,9 @@ specification the ioctl returns an ``EINVAL`` error=
 code.
> >          video topology configuration, including which I/O entity is ro=
uted to
> >          the input/output, is configured by userspace via the Media Con=
troller.
> >          See :ref:`media_controller`.
> > +    * - ``V4L2_CAP_AUDIO_M2M``
> > +      - 0x40000000
> > +      - The device supports the audio Memory-To-Memory interface.
> >      * - ``V4L2_CAP_DEVICE_CAPS``
> >        - 0x80000000
> >        - The driver fills the ``device_caps`` field. This capability ca=
n
> > diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptio=
ns b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > index 3e58aac4ef0b..48ef3bce3d20 100644
> > --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > @@ -29,6 +29,8 @@ replace symbol V4L2_FIELD_SEQ_TB :c:type:`v4l2_field`
> >  replace symbol V4L2_FIELD_TOP :c:type:`v4l2_field`
> >
> >  # Documented enum v4l2_buf_type
> > +replace symbol V4L2_BUF_TYPE_AUDIO_CAPTURE :c:type:`v4l2_buf_type`
> > +replace symbol V4L2_BUF_TYPE_AUDIO_OUTPUT :c:type:`v4l2_buf_type`
> >  replace symbol V4L2_BUF_TYPE_META_CAPTURE :c:type:`v4l2_buf_type`
> >  replace symbol V4L2_BUF_TYPE_META_OUTPUT :c:type:`v4l2_buf_type`
> >  replace symbol V4L2_BUF_TYPE_SDR_CAPTURE :c:type:`v4l2_buf_type`
> > diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/=
media/common/videobuf2/videobuf2-v4l2.c
> > index c7a54d82a55e..12f2be2773a2 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > @@ -785,6 +785,10 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4=
l2_create_buffers *create)
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
> > diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-co=
re/v4l2-dev.c
> > index f81279492682..b92c760b611a 100644
> > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > @@ -553,6 +553,7 @@ static void determine_valid_ioctls(struct video_dev=
ice *vdev)
> >       bool is_tch =3D vdev->vfl_type =3D=3D VFL_TYPE_TOUCH;
> >       bool is_meta =3D vdev->vfl_type =3D=3D VFL_TYPE_VIDEO &&
> >                      (vdev->device_caps & meta_caps);
> > +     bool is_audio =3D vdev->vfl_type =3D=3D VFL_TYPE_AUDIO;
> >       bool is_rx =3D vdev->vfl_dir !=3D VFL_DIR_TX;
> >       bool is_tx =3D vdev->vfl_dir !=3D VFL_DIR_RX;
> >       bool is_io_mc =3D vdev->device_caps & V4L2_CAP_IO_MC;
> > @@ -664,6 +665,19 @@ static void determine_valid_ioctls(struct video_de=
vice *vdev)
> >               SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_meta_out)=
;
> >               SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_meta_=
out);
> >       }
> > +     if (is_audio && is_rx) {
> > +             /* audio capture specific ioctls */
> > +             SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_aud=
io_cap);
> > +             SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_audio_cap=
);
> > +             SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_audio_cap=
);
> > +             SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_audio=
_cap);
> > +     } else if (is_audio && is_tx) {
> > +             /* audio output specific ioctls */
> > +             SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_aud=
io_out);
> > +             SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_audio_out=
);
> > +             SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_audio_out=
);
> > +             SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_audio=
_out);
> > +     }
> >       if (is_vbi) {
> >               /* vbi specific ioctls */
> >               if ((is_rx && (ops->vidioc_g_fmt_vbi_cap ||
> > @@ -927,6 +941,9 @@ int __video_register_device(struct video_device *vd=
ev,
> >       case VFL_TYPE_TOUCH:
> >               name_base =3D "v4l-touch";
> >               break;
> > +     case VFL_TYPE_AUDIO:
> > +             name_base =3D "v4l-audio";
> > +             break;
> >       default:
> >               pr_err("%s called with unknown type: %d\n",
> >                      __func__, type);
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-=
core/v4l2-ioctl.c
> > index f4d9d6279094..767588d5822a 100644
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
> > @@ -276,6 +278,7 @@ static void v4l_print_format(const void *arg, bool =
write_only)
> >       const struct v4l2_sliced_vbi_format *sliced;
> >       const struct v4l2_window *win;
> >       const struct v4l2_meta_format *meta;
> > +     const struct v4l2_audio_format *audio;
> >       u32 pixelformat;
> >       u32 planes;
> >       unsigned i;
> > @@ -346,6 +349,12 @@ static void v4l_print_format(const void *arg, bool=
 write_only)
> >               pr_cont(", dataformat=3D%p4cc, buffersize=3D%u\n",
> >                       &pixelformat, meta->buffersize);
> >               break;
> > +     case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> > +     case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> > +             audio =3D &p->fmt.audio;
> > +             pr_cont(", rate=3D%u, format=3D%u, channels=3D%u, buffers=
ize=3D%u\n",
> > +                     audio->rate, audio->format, audio->channels, audi=
o->buffersize);
> > +             break;
> >       }
> >  }
> >
> > @@ -927,6 +936,7 @@ static int check_fmt(struct file *file, enum v4l2_b=
uf_type type)
> >       bool is_tch =3D vfd->vfl_type =3D=3D VFL_TYPE_TOUCH;
> >       bool is_meta =3D vfd->vfl_type =3D=3D VFL_TYPE_VIDEO &&
> >                      (vfd->device_caps & meta_caps);
> > +     bool is_audio =3D vfd->vfl_type =3D=3D VFL_TYPE_AUDIO;
> >       bool is_rx =3D vfd->vfl_dir !=3D VFL_DIR_TX;
> >       bool is_tx =3D vfd->vfl_dir !=3D VFL_DIR_RX;
> >
> > @@ -992,6 +1002,14 @@ static int check_fmt(struct file *file, enum v4l2=
_buf_type type)
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
> > @@ -1452,6 +1470,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc =
*fmt)
> >       case V4L2_PIX_FMT_Y210:         descr =3D "10-bit YUYV Packed"; b=
reak;
> >       case V4L2_PIX_FMT_Y212:         descr =3D "12-bit YUYV Packed"; b=
reak;
> >       case V4L2_PIX_FMT_Y216:         descr =3D "16-bit YUYV Packed"; b=
reak;
> > +     case V4L2_AUDIO_FMT_LPCM:       descr =3D "Audio LPCM"; break;
> >
> >       default:
> >               /* Compressed formats */
> > @@ -1596,6 +1615,16 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_=
ops *ops,
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
> > @@ -1672,6 +1701,10 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops=
 *ops,
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
> > @@ -1783,6 +1816,16 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops=
 *ops,
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
> > @@ -1891,6 +1934,16 @@ static int v4l_try_fmt(const struct v4l2_ioctl_o=
ps *ops,
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
>
> Change this to: "for audio memory-to-memory devices"
> That's the only audio type we support at the moment. I don't see a need
> for pure capture or output audio devices, since that would be handled in
> alsa.
>
> >   * @VFL_TYPE_MAX:    number of VFL types, must always be last in the e=
num
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
> >   *   :ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for metadata cap=
ture
> >   * @vidioc_try_fmt_meta_out: pointer to the function that implements
> >   *   :ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for metadata out=
put
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
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videod=
ev2.h
> > index 78260e5d9985..8dc615f2b60c 100644
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
> > @@ -508,6 +511,7 @@ struct v4l2_capability {
> >  #define V4L2_CAP_TOUCH                  0x10000000  /* Is a touch devi=
ce */
> >
> >  #define V4L2_CAP_IO_MC                       0x20000000  /* Is input/o=
utput controlled by the media controller */
> > +#define V4L2_CAP_AUDIO_M2M              0x40000000
> >
> >  #define V4L2_CAP_DEVICE_CAPS            0x80000000  /* sets device cap=
abilities field */
> >
> > @@ -838,6 +842,9 @@ struct v4l2_pix_format {
> >  #define V4L2_META_FMT_RK_ISP1_PARAMS v4l2_fourcc('R', 'K', '1', 'P') /=
* Rockchip ISP1 3A Parameters */
> >  #define V4L2_META_FMT_RK_ISP1_STAT_3A        v4l2_fourcc('R', 'K', '1'=
, 'S') /* Rockchip ISP1 3A Statistics */
> >
> > +/* Audio-data formats */
> > +#define V4L2_AUDIO_FMT_LPCM    v4l2_fourcc('L', 'P', 'C', 'M') /* audi=
o lpcm */
> > +
>
> Hmm, this I am uncertain about. This doesn't add anything. If you enumera=
te the
> formats, they will all report just this format, so you still don't know w=
hich
> actual audio formats are supported.
>
> The real audio format is the 'format' field.
>
> >  /* priv field value to indicates that subsequent fields are valid. */
> >  #define V4L2_PIX_FMT_PRIV_MAGIC              0xfeedcafe
> >
> > @@ -2417,6 +2424,22 @@ struct v4l2_meta_format {
> >       __u32                           buffersize;
> >  } __attribute__ ((packed));
> >
> > +/**
> > + * struct v4l2_audio_format - audio data format definition
> > + * @pixelformat:     little endian four character code (fourcc)
> > + * @rate:            sample rate
> > + * @format:          sample format
> > + * @channels:                channel numbers
> > + * @buffersize:              maximum size in bytes required for data
> > + */
> > +struct v4l2_audio_format {
> > +     __u32                           pixelformat;
>
> Why not just drop this field, and instead use the format field?
>
> You would have to update the ENUM_FMT documentation to indicate that for
> audio m2m device the pixelformat field of v4l2_fmtdesc is actually the
> audio format, and that it is not a fourcc, but a SNDRV_PCM_FORMAT_ format=
.
>
> v4l_fill_fmtdesc can just add 'case SNDRV_PCM_FORMAT_U8:' etc., since the=
y
> luckily won't conflict with the existing fourccs as far as I can tell.
>
> One problem might be the use of %p4cc as a printf formatter for fourcc
> values, that would fail with these formats.
>
> One option to solve this could be to add a define to videodev2.h that con=
verts
> a SNDRV_PCM_FORMAT_* to a fourcc, e.g.:
>
> #define v4l2_fourcc_pcm(pcm_fmt) v4l2_fourcc('A', 'U', (pcm_fmt) / 10 + '=
0', (pcm_fmt) % 10 + '0')
>
> So all audio formats end up like 'ADXX' where XX is the SNDRV_PCM_FORMAT_=
* value.
>
> You would also need a define to translate a fourcc back to a pcm format.
>
> This scheme would allow %p4cc to continue to be used. Alternatively, you =
need
> to check all places where %p4cc is used in the media subsystem core and s=
ee if
> you need to check if it is an audio buffer type, and if so, just use %u.
>
> I'm not quite sure which of the two options is best.
>
> More input on this would be welcome.

One thing I try to avoid is to include the asound.h,  which has the
definition of
'format',  because in user space, there is another copy in alsa-lib. there =
will
be conflict in userspace for include videodev2.h/asound.h and asoundlib.h.

Another reason for adding V4L2_AUDIO_FMT_LPCM,  I think use LPCM is
general for audio cases,  maybe in the future there will be a requirement f=
or
non-PCM,  like MP3/AAC format.

If use SNDRV_PCM_FORMAT_*,  there will be a lot of pixfmt need to be added.
a little complicated:)

'format' field is one character of LPCM.  From this point of view, it seems=
 LPCM
is simple.

Best regards
Wang shengjiu

>
> > +     __u32                           rate;
> > +     __u32                           format;
> > +     __u32                           channels;
> > +     __u32                           buffersize;
> > +} __attribute__ ((packed));
> > +
> >  /**
> >   * struct v4l2_format - stream data format
> >   * @type:    enum v4l2_buf_type; type of the data stream
> > @@ -2425,6 +2448,7 @@ struct v4l2_meta_format {
> >   * @win:     definition of an overlaid image
> >   * @vbi:     raw VBI capture or output parameters
> >   * @sliced:  sliced VBI capture or output parameters
> > + * @audio:   definition of an audio format
> >   * @raw_data:        placeholder for future extensions and custom form=
ats
> >   * @fmt:     union of @pix, @pix_mp, @win, @vbi, @sliced, @sdr, @meta
> >   *           and @raw_data
> > @@ -2439,6 +2463,7 @@ struct v4l2_format {
> >               struct v4l2_sliced_vbi_format   sliced;  /* V4L2_BUF_TYPE=
_SLICED_VBI_CAPTURE */
> >               struct v4l2_sdr_format          sdr;     /* V4L2_BUF_TYPE=
_SDR_CAPTURE */
> >               struct v4l2_meta_format         meta;    /* V4L2_BUF_TYPE=
_META_CAPTURE */
> > +             struct v4l2_audio_format        audio;   /* V4L2_BUF_TYPE=
_AUDIO_CAPTURE */
> >               __u8    raw_data[200];                   /* user-defined =
*/
> >       } fmt;
> >  };
>
> Regards,
>
>         Hans
