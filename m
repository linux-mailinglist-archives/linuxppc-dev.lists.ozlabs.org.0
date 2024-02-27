Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B5986887D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 06:08:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BRHsQr9j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkQVg55Z3z3vXK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 16:08:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BRHsQr9j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkLt744x3z2ykn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 13:25:03 +1100 (AEDT)
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7c785dda899so177797539f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 18:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709000700; x=1709605500; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=trXxIWhlilVtZa7inpdd75JruUHbDKZzQLQRwoI9L64=;
        b=BRHsQr9jeLLuQKlRDpSeWIWNi45w3U6f+56aafUbesqXchbaZvT+ALJ3qTKgsPvmj4
         Q5YrV1sVPISNfvkLOf/LIzHZfWl1uUKpS8z559dCKbIJoruaksls9zMu1kcDRVt76HrX
         /GdtuMqMLeyY8DlStCAADYQ0Vi7OV+RKGeO5+LocHCgRA26xJd+yOZFs7HT5EdNe1Nc0
         CS0niCK0bvOvRiK0IpRfGGf6MUh69ctmqZ3hgEoyRI++3YdLFWt33x5P2UXIlBCQ0sQJ
         xiSQfwYamdmhEArvCCuidUc8Px39DMcL6mn3tX5511NomKOqQUKKBn2YF2RhGAVtpvNM
         qubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709000700; x=1709605500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trXxIWhlilVtZa7inpdd75JruUHbDKZzQLQRwoI9L64=;
        b=hCAtjqUyTZyrKJuwcfbgpGF2salAj9Oj/Ij0ERJQRXlT28yxHvoJhA2DAOK5MhhDct
         IAS3T+3ZKTQirvrOY8zXBX1quLdFI+WR8iSn4bhhKSy/1P/KKgOeu3wpB19HwIU3tz5Q
         TvZT6+IhSalPmy+pdhlGYsMimE15sCKVQ+B5AJVV2sSB6n0ncPoxBH+d/sHgzxvAnpZx
         VyaXK/R5nq3N3Ly0JfLFI1j4ImMgpMPKB/7Az0qYQovcNVyXt7WofE+a04Z861auTGWX
         iqUQYcSElybV6UOyvsRNddBZ9pcwMXBrahiEKfDeo/gmIawMW7D/PHQB1W0HT78W2AHk
         AVXg==
X-Forwarded-Encrypted: i=1; AJvYcCWXH0e7CfdXRV5TZu8o5QkxV/XLBmDZX/impyj1UPib/Ke+zrPPav4fK5J9MR6NDZX2nPKzOb5eDiRwvoMGXALorGKIMFOX/BbuBWNv7Q==
X-Gm-Message-State: AOJu0YzxEXMvqQFn4oxk0ZhNQSve7UmdVAKEYwWJq7NgEOFsObAa45ja
	65mDh5stpKWzJ/t0BzQ0lCmjvfX9EsA/qYSrVkXj5rNUyzajrRyUrxezHGuTxeId2NM1QKnXZ7j
	/NpPEh0MfsA8usmyY62IHIVHKwao=
X-Google-Smtp-Source: AGHT+IGDQc2MqheNC5jO+umr8JQ2RT4J5i81iXqmAThAX6ig7dvBqkO5O0EyaRHm2PDEaXTxFSMETmDqVWa5eCagjF8=
X-Received: by 2002:a05:6e02:b4c:b0:365:2390:9313 with SMTP id
 f12-20020a056e020b4c00b0036523909313mr12453034ilu.12.1709000700325; Mon, 26
 Feb 2024 18:25:00 -0800 (PST)
MIME-Version: 1.0
References: <1708936109-11587-1-git-send-email-shengjiu.wang@nxp.com>
 <1708936109-11587-10-git-send-email-shengjiu.wang@nxp.com> <71c860869caf899a72ebc547608220074c5939b1.camel@ndufresne.ca>
In-Reply-To: <71c860869caf899a72ebc547608220074c5939b1.camel@ndufresne.ca>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 27 Feb 2024 10:24:49 +0800
Message-ID: <CAA+D8AOpvW9tVm0FmOKYXsQ0ZMEyk9iib7FUibPSPrTVK+81Qw@mail.gmail.com>
Subject: Re: [PATCH v13 09/16] media: uapi: Define audio sample format fourcc type
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: multipart/alternative; boundary="000000000000a9f41f061253bb2a"
X-Mailman-Approved-At: Tue, 27 Feb 2024 16:07:51 +1100
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, hverkuil@xs4all.nl, linuxppc-dev@lists.ozlabs.org, broonie@kernel.org, sakari.ailus@iki.fi, perex@perex.cz, mchehab@kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000a9f41f061253bb2a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 9:55=E2=80=AFPM Nicolas Dufresne <nicolas@ndufresne=
.ca>
wrote:
>
> Le lundi 26 f=C3=A9vrier 2024 =C3=A0 16:28 +0800, Shengjiu Wang a =C3=A9c=
rit :
> > The audio sample format definition is from alsa,
> > the header file is include/uapi/sound/asound.h, but
> > don't include this header file directly, because in
> > user space, there is another copy in alsa-lib.
> > There will be conflict in userspace for include
> > videodev2.h & asound.h and asoundlib.h
> >
> > Here still use the fourcc format.
>
> I'd like to join Mauro's voice that duplicating the audio formats is a
bad idea.
> We have the same issues with video formats when you look at V4L2 vs DRM.
You're
> rationale is that videodev2.h will be ambiguous if it includes asound.h,
but
> looking at this change, there is no reason why you need to include
asound.h in
> videodev2.h at all. The format type can be abstracted out with a uint32
in the
> API, and then it would be up to the users to include and use the
appropriate
> formats IDs.
>

Thanks.

There is another reason mentioned by Hans:
"
















*The problem is that within V4L2 we use fourcc consistently to describe
aformat, including in VIDIOC_ENUM_FMT. And the expectation is that the
fourcccan be printed to a human readable string (there is even a printk
format forthat these days).But the pcm values are all small integers (and
can even be 0!), andprinting the fourcc will give garbage. It doesn't work
well at allwith the V4L2 API. But by having a straightforward conversion
between thepcm identifier and a fourcc it was really easy to deal with
this.There might even be applications today that call VIDIOC_ENUM_FMT to
seewhat is supported and fail if it is not a proper fourcc is returned.It
will certainly report nonsense in v4l_print_fmtdesc() (v4l2-ioctl.c).One of
the early versions of this patch series did precisely what you request,but
it just doesn't work well within the V4L2 uAPI.*
*"*

Best regards
Shengjiu Wang

> Nicolas
>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../userspace-api/media/v4l/pixfmt-audio.rst  | 87 +++++++++++++++++++
> >  .../userspace-api/media/v4l/pixfmt.rst        |  1 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          | 13 +++
> >  include/uapi/linux/videodev2.h                | 23 +++++
> >  4 files changed, 124 insertions(+)
> >  create mode 100644
Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> >
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> > new file mode 100644
> > index 000000000000..04b4a7fbd8f4
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> > @@ -0,0 +1,87 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +
> > +.. _pixfmt-audio:
> > +
> > +*************
> > +Audio Formats
> > +*************
> > +
> > +These formats are used for :ref:`audiomem2mem` interface only.
> > +
> > +.. tabularcolumns:: |p{5.8cm}|p{1.2cm}|p{10.3cm}|
> > +
> > +.. cssclass:: longtable
> > +
> > +.. flat-table:: Audio Format
> > +    :header-rows:  1
> > +    :stub-columns: 0
> > +    :widths:       3 1 4
> > +
> > +    * - Identifier
> > +      - Code
> > +      - Details
> > +    * .. _V4L2-AUDIO-FMT-S8:
> > +
> > +      - ``V4L2_AUDIO_FMT_S8``
> > +      - 'S8'
> > +      - Corresponds to SNDRV_PCM_FORMAT_S8 in ALSA
> > +    * .. _V4L2-AUDIO-FMT-S16-LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_S16_LE``
> > +      - 'S16_LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_S16_LE in ALSA
> > +    * .. _V4L2-AUDIO-FMT-U16-LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_U16_LE``
> > +      - 'U16_LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_U16_LE in ALSA
> > +    * .. _V4L2-AUDIO-FMT-S24-LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_S24_LE``
> > +      - 'S24_LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_S24_LE in ALSA
> > +    * .. _V4L2-AUDIO-FMT-U24-LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_U24_LE``
> > +      - 'U24_LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_U24_LE in ALSA
> > +    * .. _V4L2-AUDIO-FMT-S32-LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_S32_LE``
> > +      - 'S32_LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_S32_LE in ALSA
> > +    * .. _V4L2-AUDIO-FMT-U32-LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_U32_LE``
> > +      - 'U32_LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_U32_LE in ALSA
> > +    * .. _V4L2-AUDIO-FMT-FLOAT-LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_FLOAT_LE``
> > +      - 'FLOAT_LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_FLOAT_LE in ALSA
> > +    * .. _V4L2-AUDIO-FMT-IEC958-SUBFRAME-LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE``
> > +      - 'IEC958_SUBFRAME_LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE in ALSA
> > +    * .. _V4L2-AUDIO-FMT-S24-3LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_S24_3LE``
> > +      - 'S24_3LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_S24_3LE in ALSA
> > +    * .. _V4L2-AUDIO-FMT-U24-3LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_U24_3LE``
> > +      - 'U24_3LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_U24_3LE in ALSA
> > +    * .. _V4L2-AUDIO-FMT-S20-3LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_S20_3LE``
> > +      - 'S20_3LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_S24_3LE in ALSA
> > +    * .. _V4L2-AUDIO-FMT-U20-3LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_U20_3LE``
> > +      - 'U20_3LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_U20_3LE in ALSA
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst
b/Documentation/userspace-api/media/v4l/pixfmt.rst
> > index 11dab4a90630..2eb6fdd3b43d 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
> > @@ -36,3 +36,4 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
> >      colorspaces
> >      colorspaces-defs
> >      colorspaces-details
> > +    pixfmt-audio
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c
b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 961abcdf7290..be229c69e991 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1471,6 +1471,19 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc
*fmt)
> >       case V4L2_PIX_FMT_Y210:         descr =3D "10-bit YUYV Packed";
break;
> >       case V4L2_PIX_FMT_Y212:         descr =3D "12-bit YUYV Packed";
break;
> >       case V4L2_PIX_FMT_Y216:         descr =3D "16-bit YUYV Packed";
break;
> > +     case V4L2_AUDIO_FMT_S8:         descr =3D "8-bit Signed"; break;
> > +     case V4L2_AUDIO_FMT_S16_LE:     descr =3D "16-bit Signed LE"; bre=
ak;
> > +     case V4L2_AUDIO_FMT_U16_LE:             descr =3D "16-bit Unsigne=
d
LE"; break;
> > +     case V4L2_AUDIO_FMT_S24_LE:             descr =3D "24(32)-bit
Signed LE"; break;
> > +     case V4L2_AUDIO_FMT_U24_LE:             descr =3D "24(32)-bit
Unsigned LE"; break;
> > +     case V4L2_AUDIO_FMT_S32_LE:             descr =3D "32-bit Signed
LE"; break;
> > +     case V4L2_AUDIO_FMT_U32_LE:             descr =3D "32-bit Unsigne=
d
LE"; break;
> > +     case V4L2_AUDIO_FMT_FLOAT_LE:           descr =3D "32-bit Float
LE"; break;
> > +     case V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE: descr =3D "32-bit IEC958
LE"; break;
> > +     case V4L2_AUDIO_FMT_S24_3LE:            descr =3D "24(24)-bit
Signed LE"; break;
> > +     case V4L2_AUDIO_FMT_U24_3LE:            descr =3D "24(24)-bit
Unsigned LE"; break;
> > +     case V4L2_AUDIO_FMT_S20_3LE:            descr =3D "20(24)-bit
Signed LE"; break;
> > +     case V4L2_AUDIO_FMT_U20_3LE:            descr =3D "20(24)-bit
Unsigned LE"; break;
> >
> >       default:
> >               /* Compressed formats */
> > diff --git a/include/uapi/linux/videodev2.h
b/include/uapi/linux/videodev2.h
> > index 2c03d2dfadbe..673a6235a029 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -843,6 +843,29 @@ struct v4l2_pix_format {
> >  #define V4L2_META_FMT_RK_ISP1_PARAMS v4l2_fourcc('R', 'K', '1', 'P')
/* Rockchip ISP1 3A Parameters */
> >  #define V4L2_META_FMT_RK_ISP1_STAT_3A        v4l2_fourcc('R', 'K',
'1', 'S') /* Rockchip ISP1 3A Statistics */
> >
> > +/*
> > + * Audio-data formats
> > + * All these audio formats use a fourcc starting with 'AU'
> > + * followed by the SNDRV_PCM_FORMAT_ value from asound.h.
> > + */
> > +#define V4L2_AUDIO_FMT_S8                    v4l2_fourcc('A', 'U',
'0', '0')
> > +#define V4L2_AUDIO_FMT_S16_LE                        v4l2_fourcc('A',
'U', '0', '2')
> > +#define V4L2_AUDIO_FMT_U16_LE                        v4l2_fourcc('A',
'U', '0', '4')
> > +#define V4L2_AUDIO_FMT_S24_LE                        v4l2_fourcc('A',
'U', '0', '6')
> > +#define V4L2_AUDIO_FMT_U24_LE                        v4l2_fourcc('A',
'U', '0', '8')
> > +#define V4L2_AUDIO_FMT_S32_LE                        v4l2_fourcc('A',
'U', '1', '0')
> > +#define V4L2_AUDIO_FMT_U32_LE                        v4l2_fourcc('A',
'U', '1', '2')
> > +#define V4L2_AUDIO_FMT_FLOAT_LE                      v4l2_fourcc('A',
'U', '1', '4')
> > +#define V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE    v4l2_fourcc('A', 'U',
'1', '8')
> > +#define V4L2_AUDIO_FMT_S24_3LE                       v4l2_fourcc('A',
'U', '3', '2')
> > +#define V4L2_AUDIO_FMT_U24_3LE                       v4l2_fourcc('A',
'U', '3', '4')
> > +#define V4L2_AUDIO_FMT_S20_3LE                       v4l2_fourcc('A',
'U', '3', '6')
> > +#define V4L2_AUDIO_FMT_U20_3LE                       v4l2_fourcc('A',
'U', '3', '8')
> > +
> > +#define v4l2_fourcc_to_audfmt(fourcc)        \
> > +     (__force snd_pcm_format_t)(((((fourcc) >> 16) & 0xff) - '0') * 10
 \
> > +                                + ((((fourcc) >> 24) & 0xff) - '0'))
> > +
> >  /* priv field value to indicates that subsequent fields are valid. */
> >  #define V4L2_PIX_FMT_PRIV_MAGIC              0xfeedcafe
> >
>

--000000000000a9f41f061253bb2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Mon, Feb 26, 2024 at 9:55=E2=80=AFPM Nicolas Du=
fresne &lt;<a href=3D"mailto:nicolas@ndufresne.ca">nicolas@ndufresne.ca</a>=
&gt; wrote:<br>&gt;<br>&gt; Le lundi 26 f=C3=A9vrier 2024 =C3=A0 16:28 +080=
0, Shengjiu Wang a =C3=A9crit :<br>&gt; &gt; The audio sample format defini=
tion is from alsa,<br>&gt; &gt; the header file is include/uapi/sound/asoun=
d.h, but<br>&gt; &gt; don&#39;t include this header file directly, because =
in<br>&gt; &gt; user space, there is another copy in alsa-lib.<br>&gt; &gt;=
 There will be conflict in userspace for include<br>&gt; &gt; videodev2.h &=
amp; asound.h and asoundlib.h<br>&gt; &gt;<br>&gt; &gt; Here still use the =
fourcc format.<br>&gt;<br>&gt; I&#39;d like to join Mauro&#39;s voice that =
duplicating the audio formats is a bad idea.<br>&gt; We have the same issue=
s with video formats when you look at V4L2 vs DRM. You&#39;re<br>&gt; ratio=
nale is that videodev2.h will be ambiguous if it includes asound.h, but<br>=
&gt; looking at this change, there is no reason why you need to include aso=
und.h in<br>&gt; videodev2.h at all. The format type can be abstracted out =
with a uint32 in the<br>&gt; API, and then it would be up to the users to i=
nclude and use the appropriate<br>&gt; formats IDs.<br>&gt;<div><br></div><=
div>Thanks.</div><div><br>There is another reason mentioned by Hans:<br>&qu=
ot;<br><i>The problem is that within V4L2 we use fourcc consistently to des=
cribe a<br>format, including in VIDIOC_ENUM_FMT. And the expectation is tha=
t the fourcc<br>can be printed to a human readable string (there is even a =
printk format for<br>that these days).<br><br>But the pcm values are all sm=
all integers (and can even be 0!), and<br>printing the fourcc will give gar=
bage. It doesn&#39;t work well at all<br>with the V4L2 API. But by having a=
 straightforward conversion between the<br>pcm identifier and a fourcc it w=
as really easy to deal with this.<br><br>There might even be applications t=
oday that call VIDIOC_ENUM_FMT to see<br>what is supported and fail if it i=
s not a proper fourcc is returned.<br><br>It will certainly report nonsense=
 in v4l_print_fmtdesc() (v4l2-ioctl.c).<br><br>One of the early versions of=
 this patch series did precisely what you request,<br>but it just doesn&#39=
;t work well within the V4L2 uAPI.</i><div><i>&quot;</i><br><br>Best regard=
s</div><div>Shengjiu Wang<br><br>&gt; Nicolas<br>&gt;<br>&gt; &gt;<br>&gt; =
&gt; Signed-off-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@nxp.c=
om">shengjiu.wang@nxp.com</a>&gt;<br>&gt; &gt; ---<br>&gt; &gt; =C2=A0.../u=
serspace-api/media/v4l/pixfmt-audio.rst =C2=A0| 87 +++++++++++++++++++<br>&=
gt; &gt; =C2=A0.../userspace-api/media/v4l/pixfmt.rst =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A01 +<br>&gt; &gt; =C2=A0drivers/media/v4l2-core/v4l2-ioctl.c =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 13 +++<br>&gt; &gt; =C2=A0include/uapi/=
linux/videodev2.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
23 +++++<br>&gt; &gt; =C2=A04 files changed, 124 insertions(+)<br>&gt; &gt;=
 =C2=A0create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audi=
o.rst<br>&gt; &gt;<br>&gt; &gt; diff --git a/Documentation/userspace-api/me=
dia/v4l/pixfmt-audio.rst b/Documentation/userspace-api/media/v4l/pixfmt-aud=
io.rst<br>&gt; &gt; new file mode 100644<br>&gt; &gt; index 000000000000..0=
4b4a7fbd8f4<br>&gt; &gt; --- /dev/null<br>&gt; &gt; +++ b/Documentation/use=
rspace-api/media/v4l/pixfmt-audio.rst<br>&gt; &gt; @@ -0,0 +1,87 @@<br>&gt;=
 &gt; +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later<br>&gt; =
&gt; +<br>&gt; &gt; +.. _pixfmt-audio:<br>&gt; &gt; +<br>&gt; &gt; +*******=
******<br>&gt; &gt; +Audio Formats<br>&gt; &gt; +*************<br>&gt; &gt;=
 +<br>&gt; &gt; +These formats are used for :ref:`audiomem2mem` interface o=
nly.<br>&gt; &gt; +<br>&gt; &gt; +.. tabularcolumns:: |p{5.8cm}|p{1.2cm}|p{=
10.3cm}|<br>&gt; &gt; +<br>&gt; &gt; +.. cssclass:: longtable<br>&gt; &gt; =
+<br>&gt; &gt; +.. flat-table:: Audio Format<br>&gt; &gt; + =C2=A0 =C2=A0:h=
eader-rows: =C2=A01<br>&gt; &gt; + =C2=A0 =C2=A0:stub-columns: 0<br>&gt; &g=
t; + =C2=A0 =C2=A0:widths: =C2=A0 =C2=A0 =C2=A0 3 1 4<br>&gt; &gt; +<br>&gt=
; &gt; + =C2=A0 =C2=A0* - Identifier<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- C=
ode<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- Details<br>&gt; &gt; + =C2=A0 =C2=
=A0* .. _V4L2-AUDIO-FMT-S8:<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0- ``V4L2_AUDIO_FMT_S8``<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- &#39;S8&#39=
;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- Corresponds to SNDRV_PCM_FORMAT_S8 i=
n ALSA<br>&gt; &gt; + =C2=A0 =C2=A0* .. _V4L2-AUDIO-FMT-S16-LE:<br>&gt; &gt=
; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- ``V4L2_AUDIO_FMT_S16_LE``<br>&gt; =
&gt; + =C2=A0 =C2=A0 =C2=A0- &#39;S16_LE&#39;<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0- Corresponds to SNDRV_PCM_FORMAT_S16_LE in ALSA<br>&gt; &gt; + =C2=
=A0 =C2=A0* .. _V4L2-AUDIO-FMT-U16-LE:<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0=
 =C2=A0 =C2=A0- ``V4L2_AUDIO_FMT_U16_LE``<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0- &#39;U16_LE&#39;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- Corresponds to S=
NDRV_PCM_FORMAT_U16_LE in ALSA<br>&gt; &gt; + =C2=A0 =C2=A0* .. _V4L2-AUDIO=
-FMT-S24-LE:<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- ``V4L2_AUD=
IO_FMT_S24_LE``<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- &#39;S24_LE&#39;<br>&g=
t; &gt; + =C2=A0 =C2=A0 =C2=A0- Corresponds to SNDRV_PCM_FORMAT_S24_LE in A=
LSA<br>&gt; &gt; + =C2=A0 =C2=A0* .. _V4L2-AUDIO-FMT-U24-LE:<br>&gt; &gt; +=
<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- ``V4L2_AUDIO_FMT_U24_LE``<br>&gt; &gt=
; + =C2=A0 =C2=A0 =C2=A0- &#39;U24_LE&#39;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0- Corresponds to SNDRV_PCM_FORMAT_U24_LE in ALSA<br>&gt; &gt; + =C2=A0 =
=C2=A0* .. _V4L2-AUDIO-FMT-S32-LE:<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0- ``V4L2_AUDIO_FMT_S32_LE``<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- =
&#39;S32_LE&#39;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- Corresponds to SNDRV_=
PCM_FORMAT_S32_LE in ALSA<br>&gt; &gt; + =C2=A0 =C2=A0* .. _V4L2-AUDIO-FMT-=
U32-LE:<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- ``V4L2_AUDIO_FM=
T_U32_LE``<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- &#39;U32_LE&#39;<br>&gt; &g=
t; + =C2=A0 =C2=A0 =C2=A0- Corresponds to SNDRV_PCM_FORMAT_U32_LE in ALSA<b=
r>&gt; &gt; + =C2=A0 =C2=A0* .. _V4L2-AUDIO-FMT-FLOAT-LE:<br>&gt; &gt; +<br=
>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- ``V4L2_AUDIO_FMT_FLOAT_LE``<br>&gt; &gt;=
 + =C2=A0 =C2=A0 =C2=A0- &#39;FLOAT_LE&#39;<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0- Corresponds to SNDRV_PCM_FORMAT_FLOAT_LE in ALSA<br>&gt; &gt; + =C2=
=A0 =C2=A0* .. _V4L2-AUDIO-FMT-IEC958-SUBFRAME-LE:<br>&gt; &gt; +<br>&gt; &=
gt; + =C2=A0 =C2=A0 =C2=A0- ``V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE``<br>&gt; &=
gt; + =C2=A0 =C2=A0 =C2=A0- &#39;IEC958_SUBFRAME_LE&#39;<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0- Corresponds to SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE in AL=
SA<br>&gt; &gt; + =C2=A0 =C2=A0* .. _V4L2-AUDIO-FMT-S24-3LE:<br>&gt; &gt; +=
<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- ``V4L2_AUDIO_FMT_S24_3LE``<br>&gt; &g=
t; + =C2=A0 =C2=A0 =C2=A0- &#39;S24_3LE&#39;<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0- Corresponds to SNDRV_PCM_FORMAT_S24_3LE in ALSA<br>&gt; &gt; + =C2=
=A0 =C2=A0* .. _V4L2-AUDIO-FMT-U24-3LE:<br>&gt; &gt; +<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0- ``V4L2_AUDIO_FMT_U24_3LE``<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0- &#39;U24_3LE&#39;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- Corresponds =
to SNDRV_PCM_FORMAT_U24_3LE in ALSA<br>&gt; &gt; + =C2=A0 =C2=A0* .. _V4L2-=
AUDIO-FMT-S20-3LE:<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- ``V4=
L2_AUDIO_FMT_S20_3LE``<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- &#39;S20_3LE&#3=
9;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- Corresponds to SNDRV_PCM_FORMAT_S24=
_3LE in ALSA<br>&gt; &gt; + =C2=A0 =C2=A0* .. _V4L2-AUDIO-FMT-U20-3LE:<br>&=
gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- ``V4L2_AUDIO_FMT_U20_3LE``<=
br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- &#39;U20_3LE&#39;<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0- Corresponds to SNDRV_PCM_FORMAT_U20_3LE in ALSA<br>&gt; =
&gt; diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Docume=
ntation/userspace-api/media/v4l/pixfmt.rst<br>&gt; &gt; index 11dab4a90630.=
.2eb6fdd3b43d 100644<br>&gt; &gt; --- a/Documentation/userspace-api/media/v=
4l/pixfmt.rst<br>&gt; &gt; +++ b/Documentation/userspace-api/media/v4l/pixf=
mt.rst<br>&gt; &gt; @@ -36,3 +36,4 @@ see also :ref:`VIDIOC_G_FBUF &lt;VIDI=
OC_G_FBUF&gt;`.)<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0colorspaces<br>&gt; &gt; =
=C2=A0 =C2=A0 =C2=A0colorspaces-defs<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0color=
spaces-details<br>&gt; &gt; + =C2=A0 =C2=A0pixfmt-audio<br>&gt; &gt; diff -=
-git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-=
ioctl.c<br>&gt; &gt; index 961abcdf7290..be229c69e991 100644<br>&gt; &gt; -=
-- a/drivers/media/v4l2-core/v4l2-ioctl.c<br>&gt; &gt; +++ b/drivers/media/=
v4l2-core/v4l2-ioctl.c<br>&gt; &gt; @@ -1471,6 +1471,19 @@ static void v4l_=
fill_fmtdesc(struct v4l2_fmtdesc *fmt)<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 ca=
se V4L2_PIX_FMT_Y210: =C2=A0 =C2=A0 =C2=A0 =C2=A0 descr =3D &quot;10-bit YU=
YV Packed&quot;; break;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 case V4L2_PIX_FMT=
_Y212: =C2=A0 =C2=A0 =C2=A0 =C2=A0 descr =3D &quot;12-bit YUYV Packed&quot;=
; break;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 case V4L2_PIX_FMT_Y216: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 descr =3D &quot;16-bit YUYV Packed&quot;; break;<br>&g=
t; &gt; + =C2=A0 =C2=A0 case V4L2_AUDIO_FMT_S8: =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 descr =3D &quot;8-bit Signed&quot;; break;<br>&gt; &gt; + =C2=A0 =C2=A0 ca=
se V4L2_AUDIO_FMT_S16_LE: =C2=A0 =C2=A0 descr =3D &quot;16-bit Signed LE&qu=
ot;; break;<br>&gt; &gt; + =C2=A0 =C2=A0 case V4L2_AUDIO_FMT_U16_LE: =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 descr =3D &quot;16-bit Unsigned LE&quot=
;; break;<br>&gt; &gt; + =C2=A0 =C2=A0 case V4L2_AUDIO_FMT_S24_LE: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 descr =3D &quot;24(32)-bit Signed LE&quo=
t;; break;<br>&gt; &gt; + =C2=A0 =C2=A0 case V4L2_AUDIO_FMT_U24_LE: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 descr =3D &quot;24(32)-bit Unsigned LE&q=
uot;; break;<br>&gt; &gt; + =C2=A0 =C2=A0 case V4L2_AUDIO_FMT_S32_LE: =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 descr =3D &quot;32-bit Signed LE&quo=
t;; break;<br>&gt; &gt; + =C2=A0 =C2=A0 case V4L2_AUDIO_FMT_U32_LE: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 descr =3D &quot;32-bit Unsigned LE&quot;=
; break;<br>&gt; &gt; + =C2=A0 =C2=A0 case V4L2_AUDIO_FMT_FLOAT_LE: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 descr =3D &quot;32-bit Float LE&quot;; break;<b=
r>&gt; &gt; + =C2=A0 =C2=A0 case V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE: descr =
=3D &quot;32-bit IEC958 LE&quot;; break;<br>&gt; &gt; + =C2=A0 =C2=A0 case =
V4L2_AUDIO_FMT_S24_3LE: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0descr =3D =
&quot;24(24)-bit Signed LE&quot;; break;<br>&gt; &gt; + =C2=A0 =C2=A0 case =
V4L2_AUDIO_FMT_U24_3LE: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0descr =3D =
&quot;24(24)-bit Unsigned LE&quot;; break;<br>&gt; &gt; + =C2=A0 =C2=A0 cas=
e V4L2_AUDIO_FMT_S20_3LE: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0descr =
=3D &quot;20(24)-bit Signed LE&quot;; break;<br>&gt; &gt; + =C2=A0 =C2=A0 c=
ase V4L2_AUDIO_FMT_U20_3LE: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0descr =
=3D &quot;20(24)-bit Unsigned LE&quot;; break;<br>&gt; &gt;<br>&gt; &gt; =
=C2=A0 =C2=A0 =C2=A0 default:<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* Compressed formats */<br>&gt; &gt; diff --git a/includ=
e/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h<br>&gt; &gt; inde=
x 2c03d2dfadbe..673a6235a029 100644<br>&gt; &gt; --- a/include/uapi/linux/v=
ideodev2.h<br>&gt; &gt; +++ b/include/uapi/linux/videodev2.h<br>&gt; &gt; @=
@ -843,6 +843,29 @@ struct v4l2_pix_format {<br>&gt; &gt; =C2=A0#define V4L=
2_META_FMT_RK_ISP1_PARAMS v4l2_fourcc(&#39;R&#39;, &#39;K&#39;, &#39;1&#39;=
, &#39;P&#39;) /* Rockchip ISP1 3A Parameters */<br>&gt; &gt; =C2=A0#define=
 V4L2_META_FMT_RK_ISP1_STAT_3A =C2=A0 =C2=A0 =C2=A0 =C2=A0v4l2_fourcc(&#39;=
R&#39;, &#39;K&#39;, &#39;1&#39;, &#39;S&#39;) /* Rockchip ISP1 3A Statisti=
cs */<br>&gt; &gt;<br>&gt; &gt; +/*<br>&gt; &gt; + * Audio-data formats<br>=
&gt; &gt; + * All these audio formats use a fourcc starting with &#39;AU&#3=
9;<br>&gt; &gt; + * followed by the SNDRV_PCM_FORMAT_ value from asound.h.<=
br>&gt; &gt; + */<br>&gt; &gt; +#define V4L2_AUDIO_FMT_S8 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v4l2_fourcc(&#39;A&#39;=
, &#39;U&#39;, &#39;0&#39;, &#39;0&#39;)<br>&gt; &gt; +#define V4L2_AUDIO_F=
MT_S16_LE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0v4l2_fourcc(&#39;A&#39;, &#39;U&#39;, &#39;0&#39;, &#39=
;2&#39;)<br>&gt; &gt; +#define V4L2_AUDIO_FMT_U16_LE =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v4l2_fourcc(&=
#39;A&#39;, &#39;U&#39;, &#39;0&#39;, &#39;4&#39;)<br>&gt; &gt; +#define V4=
L2_AUDIO_FMT_S24_LE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0v4l2_fourcc(&#39;A&#39;, &#39;U&#39;, &#39;0&#3=
9;, &#39;6&#39;)<br>&gt; &gt; +#define V4L2_AUDIO_FMT_U24_LE =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v4l2_f=
ourcc(&#39;A&#39;, &#39;U&#39;, &#39;0&#39;, &#39;8&#39;)<br>&gt; &gt; +#de=
fine V4L2_AUDIO_FMT_S32_LE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v4l2_fourcc(&#39;A&#39;, &#39;U&#39;, &#=
39;1&#39;, &#39;0&#39;)<br>&gt; &gt; +#define V4L2_AUDIO_FMT_U32_LE =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0v4l2_fourcc(&#39;A&#39;, &#39;U&#39;, &#39;1&#39;, &#39;2&#39;)<br>&gt; =
&gt; +#define V4L2_AUDIO_FMT_FLOAT_LE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v4l2_fourcc(&#39;A&#39;, &#39;U&#3=
9;, &#39;1&#39;, &#39;4&#39;)<br>&gt; &gt; +#define V4L2_AUDIO_FMT_IEC958_S=
UBFRAME_LE =C2=A0 =C2=A0v4l2_fourcc(&#39;A&#39;, &#39;U&#39;, &#39;1&#39;, =
&#39;8&#39;)<br>&gt; &gt; +#define V4L2_AUDIO_FMT_S24_3LE =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v4l2_fourcc(&#3=
9;A&#39;, &#39;U&#39;, &#39;3&#39;, &#39;2&#39;)<br>&gt; &gt; +#define V4L2=
_AUDIO_FMT_U24_3LE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 v4l2_fourcc(&#39;A&#39;, &#39;U&#39;, &#39;3&#39;, &#3=
9;4&#39;)<br>&gt; &gt; +#define V4L2_AUDIO_FMT_S20_3LE =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v4l2_fourcc(&#39;A=
&#39;, &#39;U&#39;, &#39;3&#39;, &#39;6&#39;)<br>&gt; &gt; +#define V4L2_AU=
DIO_FMT_U20_3LE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 v4l2_fourcc(&#39;A&#39;, &#39;U&#39;, &#39;3&#39;, &#39;8=
&#39;)<br>&gt; &gt; +<br>&gt; &gt; +#define v4l2_fourcc_to_audfmt(fourcc) =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>&gt; &gt; + =C2=A0 =C2=A0 (__force snd_pcm_=
format_t)(((((fourcc) &gt;&gt; 16) &amp; 0xff) - &#39;0&#39;) * 10 =C2=A0\<=
br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ ((((fourcc) &gt;&gt; =
24) &amp; 0xff) - &#39;0&#39;))<br>&gt; &gt; +<br>&gt; &gt; =C2=A0/* priv f=
ield value to indicates that subsequent fields are valid. */<br>&gt; &gt; =
=C2=A0#define V4L2_PIX_FMT_PRIV_MAGIC =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00xfeedcafe<br>&gt; &gt;<br>&gt;</div></div></div>

--000000000000a9f41f061253bb2a--
