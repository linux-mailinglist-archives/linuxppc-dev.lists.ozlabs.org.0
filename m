Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A37707A5F9B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 12:32:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YiGhL32N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RqdJZ0pmyz3c4s
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 20:32:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YiGhL32N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqdHd3sghz2xdq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 20:31:24 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-68fe39555a0so5051753b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 03:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695119480; x=1695724280; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=poXRhJkAK9WV5aSXIh3udSLaQthmauT46bnS65tSwgw=;
        b=YiGhL32NT/kdqa+ZVLY21VN84hNbmLDotbTMM0IUnJZNmUDc0Tnn1GsAsXxBn7JmWE
         OmzrZp1ZUFbRNf1A9D/iOiL56wA5PSWL6JSZeDVztnGkXCzP8TR5HwpBCoCS12sVhdVX
         dFDUwEptBFaAWcSO1JizVOadvhS57iG7wunamlna/IGQg/1/DBLZXcwiJ9CvcIP52Wvb
         86o3YqklvV0s9fh8naf7xnoekLmhzScRaWYIQnmTp+U3Q2BuBOEQM931tKvM1qqaG+rq
         XLj0oI4hr+xFbC5nsBzsixAwUqmQRpgaSZ5yvs81n83uepwl1pd50r6pCesBhFXnisiw
         jw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695119480; x=1695724280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=poXRhJkAK9WV5aSXIh3udSLaQthmauT46bnS65tSwgw=;
        b=AHpaThWq46Ai2ZNBy4np7Y7MzkwaemjFxxb6swIkUUzlpzz69asMBMLvXvDfl02/xe
         scgXrI9LSUm9yEVXTHfNkvN4A3/LZUoA8FthwvXcMVFsb40CWrdQA9l0tTOjdX2svdIu
         hhCSx2pE3gxkEVL6RId6gph8m/zhXLS3Sg+hArdBpH4C9aP7ANo2dFc5sbPzZrK41kSX
         jfOfEiXBf5wWQFFoe80iZ7V5kqPtFpUYPEupXdUxS84NfedLn9K1mOH0b9hDk9E/e+/E
         COdbknYwbPE3BiLk+bTRqKdjWLkbSiRH2UmFf5+tKlAKVtVhW2qjFyf+YyIKTIHZ9OGp
         DMyQ==
X-Gm-Message-State: AOJu0YwiqSjbH5oyGFTNc0Mzmw4ayXss2gMzzL2X8izBsLm1nxLw5egs
	ePRl634WkM3kK05w6lzySLcqUsx81Uk+IO2H7SNTX06sTFE=
X-Google-Smtp-Source: AGHT+IF2IrXOt2RYELwf5x84VPabpFw4QGMztiaMU7bExwDdHhtZrXyi6RfYOP2G3QKtRk4KmBIA4VwK+hfHlEDEo9c=
X-Received: by 2002:a05:6a00:1516:b0:68f:c6f8:1451 with SMTP id
 q22-20020a056a00151600b0068fc6f81451mr14271558pfu.16.1695119480225; Tue, 19
 Sep 2023 03:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <1694670845-17070-1-git-send-email-shengjiu.wang@nxp.com>
 <1694670845-17070-7-git-send-email-shengjiu.wang@nxp.com> <ZQLdxMaqFYUukt4J@valkosipuli.retiisi.eu>
In-Reply-To: <ZQLdxMaqFYUukt4J@valkosipuli.retiisi.eu>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 19 Sep 2023 18:31:09 +0800
Message-ID: <CAA+D8AMB1zxSs_RgeoeUKxzWsNuEb0xANUZ0KxLX9UsQR8D=9Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 6/9] media: v4l2: Add audio capture and output support
To: Sakari Ailus <sakari.ailus@iki.fi>
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, mchehab@kernel.org, Xiubo.Lee@gmail.com, lgirdwood@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, hverkuil@xs4all.nl, linuxppc-dev@lists.ozlabs.org, broonie@kernel.org, perex@perex.cz, linux-media@vger.kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 14, 2023 at 6:17=E2=80=AFPM Sakari Ailus <sakari.ailus@iki.fi> =
wrote:
>
> Hi Shenjiu,
>
> Thanks for the update.
>
> On Thu, Sep 14, 2023 at 01:54:02PM +0800, Shengjiu Wang wrote:
> > Audio signal processing has the requirement for memory to
> > memory similar as Video.
> >
> > This patch is to add this support in v4l2 framework, defined
> > new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> > V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> > for audio case usage.
> >
> > Defined V4L2_AUDIO_FMT_LPCM format type for audio.
>
> This would be nicer as a separate patch. Also see the related comments
> below.

OK,  will separate it.

>
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
> > @@ -0,0 +1,63 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +
> > +.. _audiodev:
> > +
> > +******************
> > +audio Interface
>
> Capital "A"?

OK,  will modify it.

>
> > +******************
>
> Too many asterisks (same a few lines above, too).

ok, will update it.

>
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
>
> 80 characters (or less) per line, please.

Ok, will change it.

>
> Which values could this field have and what do they signify?

The values are SNDRV_PCM_FORMAT_S8, SNDRV_PCM_FORMAT_U8...
which are the PCM format, defined in ALSA.

>
> > +    * - u32 channels;
> > +      - channel number for each sample.
>
> I suppose the rest of the buffer would be samples? This should be
> documented. I think there are also different ways the data could be
> arrangeed and this needs to be documented, too.

All data in the buffer are the samples,  the 'samplerate', 'sampleformat'
'channels'  I list here is try to describe the samples.
I was confused how to write this document, so I list the characters.

Best regards
Wang Shengjiu
