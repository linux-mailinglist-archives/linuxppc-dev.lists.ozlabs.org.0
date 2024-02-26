Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9308886774D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 14:56:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=jC6fPElg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk2Fy2wrMz3vcP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 00:56:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=jC6fPElg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ndufresne.ca (client-ip=2607:f8b0:4864:20::f31; helo=mail-qv1-xf31.google.com; envelope-from=nicolas@ndufresne.ca; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk2FC6lvPz3cDR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 00:55:26 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-68fb71fc886so13179186d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 05:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1708955723; x=1709560523; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mX0LkxU1mUxO71xVr5XgHY3HEQGcHTxe7iHJJpIZNU=;
        b=jC6fPElg/zoMU/jNO9IImjXnDZ/zDkpFn9Cfo2QJklBiLKyt+rsc25TnOw3GuhvE5N
         gIxld1DHWKUY7DCpvJgoT/FarVujcUZB4hm/3QaT4ad2T4MzwTV9nvj2S9O51jh1rbt4
         Oh+uH+f0/8jhAk4vCHFmNmcALJ/46CaA2FaStBRETkZ7N5MXZatNXeRUwpx3Q0OsLJfe
         IRhlA2a+kbpCRupb+Wmz3GNLtm+rubob/1ReKPfbpdmFFVdZPig5bBTGYe9ylIswiDhy
         3Xl/cvIHL5q0MCRiQaOdgMEdArMwjUi31UvWD1O78SRiU/K6xAXc9Q56IGrhfrEmBMhv
         wt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708955723; x=1709560523;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0mX0LkxU1mUxO71xVr5XgHY3HEQGcHTxe7iHJJpIZNU=;
        b=TA1fZo4NUm9JDcI/ecktrpAswqBxtusqGAJ4MVGuk3LO5YOyPMnvlecE6chY0khv3x
         oH3meEC5vKz9l3fN9M3LjRN7F9oRtC0/bE3CHd0ecu2GaxnJwsTWukMMyDfjcjVIcDB3
         kLxUNEfJEGEegRJWy5v1cnVlwt/W6t/aMbJVN3byECm3P6vAfqkriN9tPRGw7BXWfXTv
         XqneFRIbRyTwjbI+l7lqH6zx1GV+twlLOktjhHYHOqfwV2IRyhdfgXYneRwWgnCHczOV
         89o//GiUOOce5Znp3ChLkhvoyZIqUhLaCHlPiDGKLxXFmjCYj1d8eymV0v6lEHnOs8RJ
         ZARQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfHoB2WAtIEkmRxAv6+MHsrdUI5IndWop/PGsRxs77DjMgLGxHbnroVmOCj6G6fhokOvMbEKNOVXRFK0RNSmlehYXT7L5QP/Q7I8Sy6g==
X-Gm-Message-State: AOJu0YywiVbwiHAzBKRPR1N9/sCR+WZZHqmwno49Po8ZArF/mrqGe6Io
	bjZsWGGZKODiuGcqRNFf//XhW8dDKo7y4x8i1IfavZD4h28eadjUSXcht9xoYnE=
X-Google-Smtp-Source: AGHT+IHjPdfShNJb8Rc/lo8p7b+SENTW0Ze38RKXDgrgdkPf621TDjGDvsXbx49ge1zti3/zZ5Onmw==
X-Received: by 2002:ad4:5aab:0:b0:68f:fe88:cc4c with SMTP id u11-20020ad45aab000000b0068ffe88cc4cmr5470020qvg.41.1708955723271;
        Mon, 26 Feb 2024 05:55:23 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id lr9-20020a0562145bc900b0068fcfef2077sm2953628qvb.93.2024.02.26.05.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 05:55:23 -0800 (PST)
Message-ID: <71c860869caf899a72ebc547608220074c5939b1.camel@ndufresne.ca>
Subject: Re: [PATCH v13 09/16] media: uapi: Define audio sample format
 fourcc type
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, hverkuil@xs4all.nl, 
 sakari.ailus@iki.fi, tfiga@chromium.org, m.szyprowski@samsung.com, 
 mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,  shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com,  nicoleotsuka@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,  tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Date: Mon, 26 Feb 2024 08:55:19 -0500
In-Reply-To: <1708936109-11587-10-git-send-email-shengjiu.wang@nxp.com>
References: <1708936109-11587-1-git-send-email-shengjiu.wang@nxp.com>
	 <1708936109-11587-10-git-send-email-shengjiu.wang@nxp.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
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

Le lundi 26 f=C3=A9vrier 2024 =C3=A0 16:28 +0800, Shengjiu Wang a =C3=A9cri=
t=C2=A0:
> The audio sample format definition is from alsa,
> the header file is include/uapi/sound/asound.h, but
> don't include this header file directly, because in
> user space, there is another copy in alsa-lib.
> There will be conflict in userspace for include
> videodev2.h & asound.h and asoundlib.h
>=20
> Here still use the fourcc format.

I'd like to join Mauro's voice that duplicating the audio formats is a bad =
idea.
We have the same issues with video formats when you look at V4L2 vs DRM. Yo=
u're
rationale is that videodev2.h will be ambiguous if it includes asound.h, bu=
t
looking at this change, there is no reason why you need to include asound.h=
 in
videodev2.h at all. The format type can be abstracted out with a uint32 in =
the
API, and then it would be up to the users to include and use the appropriat=
e
formats IDs.

Nicolas

>=20
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-audio.rst  | 87 +++++++++++++++++++
>  .../userspace-api/media/v4l/pixfmt.rst        |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 13 +++
>  include/uapi/linux/videodev2.h                | 23 +++++
>  4 files changed, 124 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audio.rs=
t
>=20
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-audio.rst b/Doc=
umentation/userspace-api/media/v4l/pixfmt-audio.rst
> new file mode 100644
> index 000000000000..04b4a7fbd8f4
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> @@ -0,0 +1,87 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _pixfmt-audio:
> +
> +*************
> +Audio Formats
> +*************
> +
> +These formats are used for :ref:`audiomem2mem` interface only.
> +
> +.. tabularcolumns:: |p{5.8cm}|p{1.2cm}|p{10.3cm}|
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: Audio Format
> +    :header-rows:  1
> +    :stub-columns: 0
> +    :widths:       3 1 4
> +
> +    * - Identifier
> +      - Code
> +      - Details
> +    * .. _V4L2-AUDIO-FMT-S8:
> +
> +      - ``V4L2_AUDIO_FMT_S8``
> +      - 'S8'
> +      - Corresponds to SNDRV_PCM_FORMAT_S8 in ALSA
> +    * .. _V4L2-AUDIO-FMT-S16-LE:
> +
> +      - ``V4L2_AUDIO_FMT_S16_LE``
> +      - 'S16_LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_S16_LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-U16-LE:
> +
> +      - ``V4L2_AUDIO_FMT_U16_LE``
> +      - 'U16_LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_U16_LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-S24-LE:
> +
> +      - ``V4L2_AUDIO_FMT_S24_LE``
> +      - 'S24_LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_S24_LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-U24-LE:
> +
> +      - ``V4L2_AUDIO_FMT_U24_LE``
> +      - 'U24_LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_U24_LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-S32-LE:
> +
> +      - ``V4L2_AUDIO_FMT_S32_LE``
> +      - 'S32_LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_S32_LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-U32-LE:
> +
> +      - ``V4L2_AUDIO_FMT_U32_LE``
> +      - 'U32_LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_U32_LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-FLOAT-LE:
> +
> +      - ``V4L2_AUDIO_FMT_FLOAT_LE``
> +      - 'FLOAT_LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_FLOAT_LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-IEC958-SUBFRAME-LE:
> +
> +      - ``V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE``
> +      - 'IEC958_SUBFRAME_LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-S24-3LE:
> +
> +      - ``V4L2_AUDIO_FMT_S24_3LE``
> +      - 'S24_3LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_S24_3LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-U24-3LE:
> +
> +      - ``V4L2_AUDIO_FMT_U24_3LE``
> +      - 'U24_3LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_U24_3LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-S20-3LE:
> +
> +      - ``V4L2_AUDIO_FMT_S20_3LE``
> +      - 'S20_3LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_S24_3LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-U20-3LE:
> +
> +      - ``V4L2_AUDIO_FMT_U20_3LE``
> +      - 'U20_3LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_U20_3LE in ALSA
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Documenta=
tion/userspace-api/media/v4l/pixfmt.rst
> index 11dab4a90630..2eb6fdd3b43d 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
> @@ -36,3 +36,4 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
>      colorspaces
>      colorspaces-defs
>      colorspaces-details
> +    pixfmt-audio
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 961abcdf7290..be229c69e991 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1471,6 +1471,19 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *=
fmt)
>  	case V4L2_PIX_FMT_Y210:		descr =3D "10-bit YUYV Packed"; break;
>  	case V4L2_PIX_FMT_Y212:		descr =3D "12-bit YUYV Packed"; break;
>  	case V4L2_PIX_FMT_Y216:		descr =3D "16-bit YUYV Packed"; break;
> +	case V4L2_AUDIO_FMT_S8:		descr =3D "8-bit Signed"; break;
> +	case V4L2_AUDIO_FMT_S16_LE:	descr =3D "16-bit Signed LE"; break;
> +	case V4L2_AUDIO_FMT_U16_LE:		descr =3D "16-bit Unsigned LE"; break;
> +	case V4L2_AUDIO_FMT_S24_LE:		descr =3D "24(32)-bit Signed LE"; break;
> +	case V4L2_AUDIO_FMT_U24_LE:		descr =3D "24(32)-bit Unsigned LE"; break;
> +	case V4L2_AUDIO_FMT_S32_LE:		descr =3D "32-bit Signed LE"; break;
> +	case V4L2_AUDIO_FMT_U32_LE:		descr =3D "32-bit Unsigned LE"; break;
> +	case V4L2_AUDIO_FMT_FLOAT_LE:		descr =3D "32-bit Float LE"; break;
> +	case V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE:	descr =3D "32-bit IEC958 LE"; b=
reak;
> +	case V4L2_AUDIO_FMT_S24_3LE:		descr =3D "24(24)-bit Signed LE"; break;
> +	case V4L2_AUDIO_FMT_U24_3LE:		descr =3D "24(24)-bit Unsigned LE"; break=
;
> +	case V4L2_AUDIO_FMT_S20_3LE:		descr =3D "20(24)-bit Signed LE"; break;
> +	case V4L2_AUDIO_FMT_U20_3LE:		descr =3D "20(24)-bit Unsigned LE"; break=
;
> =20
>  	default:
>  		/* Compressed formats */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 2c03d2dfadbe..673a6235a029 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -843,6 +843,29 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* =
Rockchip ISP1 3A Parameters */
>  #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /*=
 Rockchip ISP1 3A Statistics */
> =20
> +/*
> + * Audio-data formats
> + * All these audio formats use a fourcc starting with 'AU'
> + * followed by the SNDRV_PCM_FORMAT_ value from asound.h.
> + */
> +#define V4L2_AUDIO_FMT_S8			v4l2_fourcc('A', 'U', '0', '0')
> +#define V4L2_AUDIO_FMT_S16_LE			v4l2_fourcc('A', 'U', '0', '2')
> +#define V4L2_AUDIO_FMT_U16_LE			v4l2_fourcc('A', 'U', '0', '4')
> +#define V4L2_AUDIO_FMT_S24_LE			v4l2_fourcc('A', 'U', '0', '6')
> +#define V4L2_AUDIO_FMT_U24_LE			v4l2_fourcc('A', 'U', '0', '8')
> +#define V4L2_AUDIO_FMT_S32_LE			v4l2_fourcc('A', 'U', '1', '0')
> +#define V4L2_AUDIO_FMT_U32_LE			v4l2_fourcc('A', 'U', '1', '2')
> +#define V4L2_AUDIO_FMT_FLOAT_LE			v4l2_fourcc('A', 'U', '1', '4')
> +#define V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE	v4l2_fourcc('A', 'U', '1', '8'=
)
> +#define V4L2_AUDIO_FMT_S24_3LE			v4l2_fourcc('A', 'U', '3', '2')
> +#define V4L2_AUDIO_FMT_U24_3LE			v4l2_fourcc('A', 'U', '3', '4')
> +#define V4L2_AUDIO_FMT_S20_3LE			v4l2_fourcc('A', 'U', '3', '6')
> +#define V4L2_AUDIO_FMT_U20_3LE			v4l2_fourcc('A', 'U', '3', '8')
> +
> +#define v4l2_fourcc_to_audfmt(fourcc)	\
> +	(__force snd_pcm_format_t)(((((fourcc) >> 16) & 0xff) - '0') * 10  \
> +				   + ((((fourcc) >> 24) & 0xff) - '0'))
> +
>  /* priv field value to indicates that subsequent fields are valid. */
>  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
> =20

