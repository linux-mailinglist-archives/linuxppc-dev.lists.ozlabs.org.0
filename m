Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C1885CF4E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 05:31:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LO1uyMoO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tfjz30FnFz3cDr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 15:31:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LO1uyMoO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=tfiga@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfjyC4YSwz30Qk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 15:30:57 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-563e330351dso5511898a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 20:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708489849; x=1709094649; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTLF+9/86+3ZrNqwWCAt6rY4IvAqp7zzJB3AKM6ztK4=;
        b=LO1uyMoONLRfAekll6EUHFGTswktL5vaZ5sd5j37wJE2bctw0iWAqYbAAt7fBgV8Wo
         uqTVhH7Ls1yTLPjLf256vCoHivDbrf0OUvFarMNLxduH5fe1VFqQFR6WVDB2CM2FV9x9
         5SvJ2hIuW8wStFXrj8XqrBdZA2IuDCF9pYgbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708489849; x=1709094649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTLF+9/86+3ZrNqwWCAt6rY4IvAqp7zzJB3AKM6ztK4=;
        b=erpvqKt/8loVJ8TaZAe6sriV8dbQpRvmHTISzkxLJBx4fEB1hL3hs9h6omV8iVIlvD
         bbiJGbVUBnfkOl5/+vz4sev729MHA73sp67GtOMCzP+1Go8tmwCYoH+p/jg/GEgysp03
         +0x372DxNMJSyRRVJKVwbcv2+PBuRPrf5gfi5pwa/HntIG6jJao3SCbzo7svonb91Bwo
         bvSVEc1RsOnCdDRvS1HdZYb8+AFxtu8M7J8JxMyKVElC12534MclvOgvtRj2O8iS7EwV
         t7IgmFRsPTkKm7FCkXqiwgYQVyUXW0pMP3zgdEIufK2RU+waLY3hfy+O3dTp09dKvjIj
         Sw0A==
X-Forwarded-Encrypted: i=1; AJvYcCX98G3FgwFMquNybT7CrJkEWIFy3n5mSgSIOLoRLvNtKYRru9eup7y/peu0XTj4Hjz/bzs6afkMpyeFyRwUAg+2P7zTLKYYVF2+gfnGGw==
X-Gm-Message-State: AOJu0YwTEeaqywdbta9qnRahtRNvLUAPv7KMn35K1DZVxtns6Ks+8WA5
	w479X0MJUuK+2zPcIV8b14A2FtvcD1JxdLr6DL5WDpwBta9ElYkp99bsXIcU5OLbUIoFIxsouUZ
	xVg==
X-Google-Smtp-Source: AGHT+IE8bSmaoi4lBzfsjFcx5REg982sXS1yzXOu/UNZOQJj68WuvFe7+AHdzlCS6ujb7xIJ3y2ERQ==
X-Received: by 2002:aa7:d409:0:b0:563:e961:98a9 with SMTP id z9-20020aa7d409000000b00563e96198a9mr9196225edq.13.1708489849144;
        Tue, 20 Feb 2024 20:30:49 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id da16-20020a056402177000b00564e4debe29sm531919edb.78.2024.02.20.20.30.47
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 20:30:47 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33d3b72f710so2076125f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 20:30:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVnv0NcvukpEK0BqBW5jOuwu7Cgwpgv+ICt8chP+XKDtifgTLgcOtbaml3t+tzXJ9SBRXK4+QmUA/lHjJTF+5rLiy3wL1dTe7YiSKe5Nw==
X-Received: by 2002:adf:ef8f:0:b0:33d:2775:1e63 with SMTP id
 d15-20020adfef8f000000b0033d27751e63mr9141684wro.41.1708489847044; Tue, 20
 Feb 2024 20:30:47 -0800 (PST)
MIME-Version: 1.0
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
 <1705581128-4604-8-git-send-email-shengjiu.wang@nxp.com> <20240217104212.32f07e3a@coco.lan>
In-Reply-To: <20240217104212.32f07e3a@coco.lan>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 21 Feb 2024 13:30:29 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CY731HRhFHpmwzGxAZ-BFV_pT7NNGwNGy4ZOA=qz8ntg@mail.gmail.com>
Message-ID: <CAAFQd5CY731HRhFHpmwzGxAZ-BFV_pT7NNGwNGy4ZOA=qz8ntg@mail.gmail.com>
Subject: Re: [PATCH v12 07/15] media: v4l2: Add audio capture and output support
To: Mauro Carvalho Chehab <mchehab@kernel.org>
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, hverkuil@xs4all.nl, broonie@kernel.org, sakari.ailus@iki.fi, perex@perex.cz, m.szyprowski@samsung.com, shengjiu.wang@gmail.com, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Feb 17, 2024 at 6:42=E2=80=AFPM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> Em Thu, 18 Jan 2024 20:32:00 +0800
> Shengjiu Wang <shengjiu.wang@nxp.com> escreveu:
>
> > Audio signal processing has the requirement for memory to
> > memory similar as Video.
> >
> > This patch is to add this support in v4l2 framework, defined
> > new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> > V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> > for audio case usage.
> >
> > The created audio device is named "/dev/v4l-audioX".
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../userspace-api/media/v4l/buffer.rst        |  6 ++
> >  .../media/v4l/dev-audio-mem2mem.rst           | 71 +++++++++++++++++++
> >  .../userspace-api/media/v4l/devices.rst       |  1 +
> >  .../media/v4l/vidioc-enum-fmt.rst             |  2 +
> >  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |  4 ++
> >  .../media/videodev2.h.rst.exceptions          |  2 +
> >  .../media/common/videobuf2/videobuf2-v4l2.c   |  4 ++
> >  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  9 +++
> >  drivers/media/v4l2-core/v4l2-dev.c            | 17 +++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c          | 53 ++++++++++++++
> >  include/media/v4l2-dev.h                      |  2 +
> >  include/media/v4l2-ioctl.h                    | 34 +++++++++
> >  include/uapi/linux/videodev2.h                | 17 +++++
> >  13 files changed, 222 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-mem=
2mem.rst
> >
> > diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documen=
tation/userspace-api/media/v4l/buffer.rst
> > index 52bbee81c080..a3754ca6f0d6 100644
> > --- a/Documentation/userspace-api/media/v4l/buffer.rst
> > +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> > @@ -438,6 +438,12 @@ enum v4l2_buf_type
> >      * - ``V4L2_BUF_TYPE_META_OUTPUT``
> >        - 14
>
> >        - Buffer for metadata output, see :ref:`metadata`.
> > +    * - ``V4L2_BUF_TYPE_AUDIO_CAPTURE``
> > +      - 15
> > +      - Buffer for audio capture, see :ref:`audio`.
> > +    * - ``V4L2_BUF_TYPE_AUDIO_OUTPUT``
> > +      - 16
>
> Hmm... alsa APi define input/output as:
>         enum {
>                 SNDRV_PCM_STREAM_PLAYBACK =3D 0,
>                 SNDRV_PCM_STREAM_CAPTURE,
>                 SNDRV_PCM_STREAM_LAST =3D SNDRV_PCM_STREAM_CAPTURE,
>         };
>
>
> I would use a namespace as close as possible to the
> ALSA API. Also, we're not talking about V4L2, but, instead
> audio. so, not sure if I like the prefix to start with
> V4L2_. Maybe ALSA_?
>
> So, a better namespace would be:
>
>         ${prefix}_BUF_TYPE_PCM_STREAM_PLAYBACK
> and
>         ${prefix}_BUF_TYPE_PCM_STREAM_CAPTURE
>

The API is still V4L2, and all the other non-video buf types also use
the V4L2_ prefix, so perhaps that's good here as well?

Whether AUDIO or PCM_STREAM makes more sense goes outside of my
expertise. Subjectively, a PCM stream sounds more specific than an
audio stream. Do those buf types also support non-PCM audio streams?

> > +      - Buffer for audio output, see :ref:`audio`.
> >
> >
> >  .. _buffer-flags:
> > diff --git a/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rs=
t b/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
> > new file mode 100644
> > index 000000000000..68faecfe3a02
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
> > @@ -0,0 +1,71 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +
> > +.. _audiomem2mem:
> > +
> > +********************************
> > +Audio Memory-To-Memory Interface
> > +********************************
> > +
> > +An audio memory-to-memory device can compress, decompress, transform, =
or
> > +otherwise convert audio data from one format into another format, in m=
emory.
> > +Such memory-to-memory devices set the ``V4L2_CAP_AUDIO_M2M`` capabilit=
y.
> > +Examples of memory-to-memory devices are audio codecs, audio preproces=
sing,
> > +audio postprocessing.
> > +
> > +A memory-to-memory audio node supports both output (sending audio fram=
es from
> > +memory to the hardware) and capture (receiving the processed audio fra=
mes
> > +from the hardware into memory) stream I/O. An application will have to
> > +setup the stream I/O for both sides and finally call
> > +:ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>` for both capture and output t=
o
> > +start the hardware.
> > +
> > +Memory-to-memory devices function as a shared resource: you can
> > +open the audio node multiple times, each application setting up their
> > +own properties that are local to the file handle, and each can use
> > +it independently from the others. The driver will arbitrate access to
> > +the hardware and reprogram it whenever another file handler gets acces=
s.
> > +
> > +Audio memory-to-memory devices are accessed through character device
> > +special files named ``/dev/v4l-audio``
> > +
> > +Querying Capabilities
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Device nodes supporting the audio memory-to-memory interface set the
> > +``V4L2_CAP_AUDIO_M2M`` flag in the ``device_caps`` field of the
> > +:c:type:`v4l2_capability` structure returned by the :c:func:`VIDIOC_QU=
ERYCAP`
> > +ioctl.
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
> > +      - ``pixelformat``
> > +      - The sample format, set by the application. see :ref:`pixfmt-au=
dio`
>
> pixelformat doesn't make any sense for audio: there are no pixels on a
> PCM stream. Please use call it, instead: `snd_pcm_format`, making it matc=
h
> the values for snd_pcm_format_t.
>

+1

FWIW v4l2_meta_format uses the name "dataformat".

Actually, I just realized that the C code actually uses the name
"audioformat". Tbh., after reading the kerneldoc comment, my
subjective preference would be on "sample_format", since that's
exactly what it is.

> Yet, I would keep defining it as u32 (or u64?) instead of using a
> typedef int field there (snd_pcm_format_t), as the size of integer
> is different on 32 and 64 bit kernels.

+1

Best regards,
Tomasz
