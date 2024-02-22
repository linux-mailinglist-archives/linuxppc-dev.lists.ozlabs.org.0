Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C9785F02F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 04:51:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AMUwK5Ra;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgK2N4hZWz3dWv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 14:51:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AMUwK5Ra;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgK1c1GZkz3bnv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 14:50:58 +1100 (AEDT)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-363bdac74c6so20482815ab.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 19:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708573855; x=1709178655; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/Q0YGTOKcdouf/IIlA2xOaiZYdgb6GG89hveRTd/5g=;
        b=AMUwK5Ra4E056GC8G/MP18DJ//Dw1ngWZD5971fQRV/aKpdP/juI8c0wOXAHdANsnP
         t6/N0aoqULRuE0Br6CdN+zY7Xro4bS4L3vDdxYVIi6y3ATclHgkhiDpmXbv4i3NVChyB
         N5w38Qkaj+yysThygnaba5JjAaK3mG3QpdaLTcPsBvFuWX5NJb0rvekzjU21OdETIng2
         +mEK27rTtUFOBqtmAn4LR5RtzbJgH/B5u5jTw4ayGar1xMmUL2VrbvLVpcN5mJ/Xjrpf
         f+QvZmgcC0z5NrBN/QbIBUOPwSH9xBOsumZQoYkmaMpqo/nnzmIiwroUfI39ztmm1LCH
         00jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708573855; x=1709178655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/Q0YGTOKcdouf/IIlA2xOaiZYdgb6GG89hveRTd/5g=;
        b=MLkUSQZhG+98sNLuxzXW15JMXQsPF7S7bTjDNgshx4JG1F3M/28zWIfilCWx2lIhea
         pmMzAJz3c8QEq5/pNXVyH8VNuiMeq3kMVDZdtGJgLWK1PJGEHpuw5aco8pB+pJgzryuR
         HdraOnGb6Th4sQ1+IF8S5K4AcOWcuKZVCgW3D8KpB2cxdpH4H2+VvvcXki0j2pqBli6Z
         SlR0v+kbboKI6DnUTm1OqTnOGh7H54J/cwPfGMBez6hDkoPkvdCAPcXfXPmbjf+SJzGZ
         uDSkUs3QtdU2ffKrHSA9INjAE8fKMUHKdsCFvF/OpWEr/qTB+syVQ9UVbpfTNHo4w+zx
         5Apg==
X-Forwarded-Encrypted: i=1; AJvYcCXouNzbwXrs/g/uzyV3Je6DovDtMdPgS9apOvXenFPEj09W2NRETJGEKdTQHPxqdTXkOE/1EkVk8K8CXMBzDb/wcz5Qhq0zTy90efaiTg==
X-Gm-Message-State: AOJu0YyTX6QsDsfymAGaW3Q4glAIlpvA8dr1zEk3eqVI5t8Tgzqp6wGi
	9+oS3lZmHH51DPSIfVm8QbTcl8kAjY1ruAlxwVZEBF7B5dKQCFXUOR6T8ZKMuwfDpLg+ndtTw+V
	JsaTCM+1Hg8OY8bIsDVDdSVFRnbo=
X-Google-Smtp-Source: AGHT+IGObMpA8I/bjIFzhd2/BOrRWHNb8S+mrmq/qw5er4vLZtC3xDXgfTc2XDOuXSracqAay+Hkeu1DOzd3Ewhetl0=
X-Received: by 2002:a05:6e02:1d95:b0:365:1305:fac5 with SMTP id
 h21-20020a056e021d9500b003651305fac5mr19489792ila.0.1708573854696; Wed, 21
 Feb 2024 19:50:54 -0800 (PST)
MIME-Version: 1.0
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
 <1705581128-4604-9-git-send-email-shengjiu.wang@nxp.com> <20240217101926.3f1d2452@coco.lan>
 <CAA+D8APD+zL0xYkf6FxPNfM3Y3O8+PhT7WEXO7XCLAmBjoMmUA@mail.gmail.com>
 <20240219135618.5c557e66@coco.lan> <e98a23c6-a35d-422b-be8a-1179392215c1@xs4all.nl>
In-Reply-To: <e98a23c6-a35d-422b-be8a-1179392215c1@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 22 Feb 2024 11:50:43 +0800
Message-ID: <CAA+D8AN1KEjmb7f5dzMn1EV=UB5QqA4q__y2mTOW8-CH_7gchQ@mail.gmail.com>
Subject: Re: [PATCH v12 08/15] media: uapi: Define audio sample format fourcc type
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org, broonie@kernel.org, sakari.ailus@iki.fi, perex@perex.cz, Mauro Carvalho Chehab <mchehab@kernel.org>, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 21, 2024 at 7:10=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 19/02/2024 13:56, Mauro Carvalho Chehab wrote:
> > Em Mon, 19 Feb 2024 12:05:02 +0800
> > Shengjiu Wang <shengjiu.wang@gmail.com> escreveu:
> >
> >> Hi Mauro
> >>
> >> On Sat, Feb 17, 2024 at 5:19=E2=80=AFPM Mauro Carvalho Chehab
> >> <mchehab@kernel.org> wrote:
> >>>
> >>> Em Thu, 18 Jan 2024 20:32:01 +0800
> >>> Shengjiu Wang <shengjiu.wang@nxp.com> escreveu:
> >>>
> >>>> The audio sample format definition is from alsa,
> >>>> the header file is include/uapi/sound/asound.h, but
> >>>> don't include this header file directly, because in
> >>>> user space, there is another copy in alsa-lib.
> >>>> There will be conflict in userspace for include
> >>>> videodev2.h & asound.h and asoundlib.h
> >>>>
> >>>> Here still use the fourcc format.
> >>>>
> >>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>> ---
> >>>>  .../userspace-api/media/v4l/pixfmt-audio.rst  | 87 ++++++++++++++++=
+++
> >>>>  .../userspace-api/media/v4l/pixfmt.rst        |  1 +
> >>>>  drivers/media/v4l2-core/v4l2-ioctl.c          | 13 +++
> >>>>  include/uapi/linux/videodev2.h                | 23 +++++
> >>>>  4 files changed, 124 insertions(+)
> >>>>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-aud=
io.rst
> >>>>
> >>>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-audio.rst =
b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> >>>> new file mode 100644
> >>>> index 000000000000..04b4a7fbd8f4
> >>>> --- /dev/null
> >>>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> >>>> @@ -0,0 +1,87 @@
> >>>> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> >>>> +
> >>>> +.. _pixfmt-audio:
> >>>> +
> >>>> +*************
> >>>> +Audio Formats
> >>>> +*************
> >>>> +
> >>>> +These formats are used for :ref:`audiomem2mem` interface only.
> >>>> +
> >>>> +.. tabularcolumns:: |p{5.8cm}|p{1.2cm}|p{10.3cm}|
> >>>> +
> >>>> +.. cssclass:: longtable
> >>>> +
> >>>> +.. flat-table:: Audio Format
> >>>> +    :header-rows:  1
> >>>> +    :stub-columns: 0
> >>>> +    :widths:       3 1 4
> >>>> +
> >>>> +    * - Identifier
> >>>> +      - Code
> >>>> +      - Details
> >>>> +    * .. _V4L2-AUDIO-FMT-S8:
> >>>> +
> >>>> +      - ``V4L2_AUDIO_FMT_S8``
> >>>> +      - 'S8'
> >>>> +      - Corresponds to SNDRV_PCM_FORMAT_S8 in ALSA
> >>>> +    * .. _V4L2-AUDIO-FMT-S16-LE:
> >>>
> >>> Hmm... why can't we just use SNDRV_*_FORMAT_*? Those are already part=
 of
> >>> an uAPI header. No need to add any abstraction here and/or redefine
> >>> what is there already at include/uapi/sound/asound.h.
> >>>
> >> Actually I try to avoid including the include/uapi/sound/asound.h.
> >> Because in user space, there is another copy in alsa-lib (asoundlib.h)=
.
> >> There will be conflict in userspace when including videodev2.h and
> >> asoundlib.h.
> >
> > Well, alsasoundlib.h seems to be using the same definitions:
> >       https://github.com/michaelwu/alsa-lib/blob/master/include/pcm.h
> >
> > So, I can't see what would be the actual issue, as both userspace libra=
ry
> > and ALSA internal headers use the same magic numbers.
> >
> > You can still do things like:
> >
> >       #ifdef __KERNEL__
> >       #  include <sound/asound.h>
> >       #else
> >       #  include <asoundlib.h>
> >       #endif
> >
> > To avoid such kind of conflicts, if you need to have it included on
> > some header file. Yet, I can't see why you would need that.
> >
> > IMO, at uAPI headers, you just need to declare the uAPI audiofmt field
> > to be either __u32 or __u64, pointing it to where this value comes from
> > (on both userspace and Kernelspace. E. g.:
> >
> > /**
> >  * struct v4l2_audio_format - audio data format definition
> >  * @audioformat:
> >  *    an integer number matching the fields inside
> >  *    enum snd_pcm_format_t (e. g. `SNDRV_PCM_FORMAT_*`), as defined
> >  *    in include/uapi/sound/asound.h and
> >  *      https://www.alsa-project.org/alsa-doc/alsa-lib/group___p_c_m.ht=
ml#gaa14b7f26877a812acbb39811364177f8.
> >  * @channels:         channel numbers
> >  * @buffersize:               maximum size in bytes required for data
> >  */
> > struct v4l2_audio_format {
> >       __u32                           audioformat;
> >       __u32                           channels;
> >       __u32                           buffersize;
> > } __attribute__ ((packed));
> >
> > Then, at documentation you just need to point to where the
> > possible values for SNDRV_PCM_FORMAT_ are defined. No need to
> > document them one by one.
> >
> > With such definition, you'll only need to include sound/asound.h
> > within the kAPI scope.
> >
> >>
> >> And in the V4l framework, the fourcc type is commonly used in other
> >> cases (video, radio, touch, meta....), to avoid changing common code
> >> a lot, so I think using fourcc definition for audio may be simpler.
> >
> > Those are real video streams (or a video-related streams, in the case
> > of metadata) where fourcc is widely used. There, it makes sense.
> > However, ALSA format definitions are already being used for a long time=
.
> > There's no sense on trying to reinvent it - or having an abstract layer
> > to convert from/to fourcc <=3D=3D> enum snd_pcm_format_t. Just use what=
 is
> > there already.
>
> The problem is that within V4L2 we use fourcc consistently to describe a
> format, including in VIDIOC_ENUM_FMT. And the expectation is that the fou=
rcc
> can be printed to a human readable string (there is even a printk format =
for
> that these days).
>
> But the pcm values are all small integers (and can even be 0!), and
> printing the fourcc will give garbage. It doesn't work well at all
> with the V4L2 API. But by having a straightforward conversion between the
> pcm identifier and a fourcc it was really easy to deal with this.
>
> There might even be applications today that call VIDIOC_ENUM_FMT to see
> what is supported and fail if it is not a proper fourcc is returned.
>
> It will certainly report nonsense in v4l_print_fmtdesc() (v4l2-ioctl.c).
>
> One of the early versions of this patch series did precisely what you req=
uest,
> but it just doesn't work well within the V4L2 uAPI.
>

Thanks all.

So can I reach the conclusion below?
1. Keep using the fourcc definition for v4l2_audio_format.audioformat.
2. Keep the name V4L2_BUF_TYPE_AUDIO_CAPTURE and
    V4L2_BUF_TYPE_AUDIO_OUTPUT.
3. Fix Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
    to change 'pixelformat' to 'audioformat'.
4. Update Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
    to add more description for clock drift.

Best Regards
Shengjiu Wang

> Regards,
>
>         Hans
>
> >
> > Thanks,
> > Mauro
>
