Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2587CA80C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 14:33:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8GjT1GLXz3cnS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 23:33:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=srs0=khzu=f6=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8Ghy0Qncz2xFl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 23:32:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 081DDCE14EB;
	Mon, 16 Oct 2023 12:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24174C433C8;
	Mon, 16 Oct 2023 12:32:25 +0000 (UTC)
Message-ID: <79491697-9851-42eb-aedc-0c36ab5d3c69@xs4all.nl>
Date: Mon, 16 Oct 2023 14:32:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 08/11] media: uapi: define audio sample format
 fourcc type
Content-Language: en-US, nl
To: Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
References: <1697185865-27528-1-git-send-email-shengjiu.wang@nxp.com>
 <1697185865-27528-9-git-send-email-shengjiu.wang@nxp.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <1697185865-27528-9-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 13/10/2023 10:31, Shengjiu Wang wrote:
> The audio sample format definition is from alsa,
> the header file is include/uapi/sound/asound.h, but
> don't include this header file directly, because in
> user space, there is another copy in alsa-lib.
> There will be conflict in userspace for include
> videodev2.h & asound.h and asoundlib.h
> 
> Here still use the fourcc format.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-audio.rst  | 202 ++++++++++++++++++
>  .../userspace-api/media/v4l/pixfmt.rst        |   1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  36 ++++
>  include/uapi/linux/videodev2.h                |  48 +++++
>  4 files changed, 287 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-audio.rst b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> new file mode 100644
> index 000000000000..ac89b2c4b594
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> @@ -0,0 +1,202 @@
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
> +    * .. _V4L2-AUDIO-FMT-U8:
> +
> +      - ``V4L2_AUDIO_FMT_U8``
> +      - 'U8'
> +      - Corresponds to SNDRV_PCM_FORMAT_U8 in ALSA
> +    * .. _V4L2-AUDIO-FMT-S16-LE:
> +
> +      - ``V4L2_AUDIO_FMT_S16_LE``
> +      - 'S16_LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_S16_LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-S16-BE:
> +
> +      - ``V4L2_AUDIO_FMT_S16_BE``
> +      - 'S16_BE'
> +      - Corresponds to SNDRV_PCM_FORMAT_S16_BE in ALSA
> +    * .. _V4L2-AUDIO-FMT-U16-LE:
> +
> +      - ``V4L2_AUDIO_FMT_U16_LE``
> +      - 'U16_LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_U16_LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-U16-BE:
> +
> +      - ``V4L2_AUDIO_FMT_U16_BE``
> +      - 'U16_BE'
> +      - Corresponds to SNDRV_PCM_FORMAT_U16_BE in ALSA
> +    * .. _V4L2-AUDIO-FMT-S24-LE:
> +
> +      - ``V4L2_AUDIO_FMT_S24_LE``
> +      - 'S24_LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_S24_LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-S24-BE:
> +
> +      - ``V4L2_AUDIO_FMT_S24_BE``
> +      - 'S24_BE'
> +      - Corresponds to SNDRV_PCM_FORMAT_S24_BE in ALSA
> +    * .. _V4L2-AUDIO-FMT-U24-LE:
> +
> +      - ``V4L2_AUDIO_FMT_U24_LE``
> +      - 'U24_LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_U24_LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-U24-BE:
> +
> +      - ``V4L2_AUDIO_FMT_U24_BE``
> +      - 'U24_BE'
> +      - Corresponds to SNDRV_PCM_FORMAT_U24_BE in ALSA
> +    * .. _V4L2-AUDIO-FMT-S32-LE:
> +
> +      - ``V4L2_AUDIO_FMT_S32_LE``
> +      - 'S32_LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_S32_LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-S32-BE:
> +
> +      - ``V4L2_AUDIO_FMT_S32_BE``
> +      - 'S32_BE'
> +      - Corresponds to SNDRV_PCM_FORMAT_S32_BE in ALSA
> +    * .. _V4L2-AUDIO-FMT-U32-LE:
> +
> +      - ``V4L2_AUDIO_FMT_U32_LE``
> +      - 'U32_LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_U32_LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-U32-BE:
> +
> +      - ``V4L2_AUDIO_FMT_U32_BE``
> +      - 'U32_BE'
> +      - Corresponds to SNDRV_PCM_FORMAT_U32_BE in ALSA
> +    * .. _V4L2-AUDIO-FMT-FLOAT-LE:
> +
> +      - ``V4L2_AUDIO_FMT_FLOAT_LE``
> +      - 'FLOAT_LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_FLOAT_LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-FLOAT-BE:
> +
> +      - ``V4L2_AUDIO_FMT_FLOAT_BE``
> +      - 'FLOAT_BE'
> +      - Corresponds to SNDRV_PCM_FORMAT_FLOAT_BE in ALSA
> +    * .. _V4L2-AUDIO-FMT-FLOAT64-LE:
> +
> +      - ``V4L2_AUDIO_FMT_FLOAT64_LE``
> +      - 'FLOAT64_LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_FLOAT64_LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-FLOAT64-BE:
> +
> +      - ``V4L2_AUDIO_FMT_FLOAT64_BE``
> +      - 'FLOAT64_BE'
> +      - Corresponds to SNDRV_PCM_FORMAT_FLOAT64_BE in ALSA
> +    * .. _V4L2-AUDIO-FMT-IEC958-SUBFRAME-LE:
> +
> +      - ``V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE``
> +      - 'IEC958_SUBFRAME_LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-IEC958-SUBFRAME-BE:
> +
> +      - ``V4L2_AUDIO_FMT_IEC958_SUBFRAME_BE``
> +      - 'IEC958_SUBFRAME_BE'
> +      - Corresponds to SNDRV_PCM_FORMAT_IEC958_SUBFRAME_BE in ALSA
> +    * .. _V4L2-AUDIO-FMT-S20-LE:
> +
> +      - ``V4L2_AUDIO_FMT_S20_LE``
> +      - 'S20_LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_S20_LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-S20-BE:
> +
> +      - ``V4L2_AUDIO_FMT_S20_BE``
> +      - 'S20_BE'
> +      - Corresponds to SNDRV_PCM_FORMAT_S20_BE in ALSA
> +    * .. _V4L2-AUDIO-FMT-U20-LE:
> +
> +      - ``V4L2_AUDIO_FMT_U20_LE``
> +      - 'U20_LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_U20_LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-U20-BE:
> +
> +      - ``V4L2_AUDIO_FMT_U20_BE``
> +      - 'U20_BE'
> +      - Corresponds to SNDRV_PCM_FORMAT_U20_BE in ALSA
> +    * .. _V4L2-AUDIO-FMT-S24-3LE:
> +
> +      - ``V4L2_AUDIO_FMT_S24_3LE``
> +      - 'S24_3LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_S24_3LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-S24-3BE:
> +
> +      - ``V4L2_AUDIO_FMT_S24_3BE``
> +      - 'S24_3BE'
> +      - Corresponds to SNDRV_PCM_FORMAT_S24_3BE in ALSA
> +    * .. _V4L2-AUDIO-FMT-U24-3LE:
> +
> +      - ``V4L2_AUDIO_FMT_U24_3LE``
> +      - 'U24_3LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_U24_3LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-U24-3BE:
> +
> +      - ``V4L2_AUDIO_FMT_U24_3BE``
> +      - 'U24_3BE'
> +      - Corresponds to SNDRV_PCM_FORMAT_U24_3BE in ALSA
> +    * .. _V4L2-AUDIO-FMT-S20-3LE:
> +
> +      - ``V4L2_AUDIO_FMT_S20_3LE``
> +      - 'S20_3LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_S24_3LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-S20-3BE:
> +
> +      - ``V4L2_AUDIO_FMT_S20_3BE``
> +      - 'S20_3BE'
> +      - Corresponds to SNDRV_PCM_FORMAT_S20_3BE in ALSA
> +    * .. _V4L2-AUDIO-FMT-U20-3LE:
> +
> +      - ``V4L2_AUDIO_FMT_U20_3LE``
> +      - 'U20_3LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_U20_3LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-U20-3BE:
> +
> +      - ``V4L2_AUDIO_FMT_U20_3BE``
> +      - 'U20_3BE'
> +      - Corresponds to SNDRV_PCM_FORMAT_U20_3BE in ALSA
> +    * .. _V4L2-AUDIO-FMT-S18-3LE:
> +
> +      - ``V4L2_AUDIO_FMT_S18_3LE``
> +      - 'S18_3LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_S18_3LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-S18-3BE:
> +
> +      - ``V4L2_AUDIO_FMT_S18_3BE``
> +      - 'S18_3BE'
> +      - Corresponds to SNDRV_PCM_FORMAT_S18_3BE in ALSA
> +    * .. _V4L2-AUDIO-FMT-U18-3LE:
> +
> +      - ``V4L2_AUDIO_FMT_U18_3LE``
> +      - 'U18_3LE'
> +      - Corresponds to SNDRV_PCM_FORMAT_U18_3LE in ALSA
> +    * .. _V4L2-AUDIO-FMT-U18-3BE:
> +
> +      - ``V4L2_AUDIO_FMT_U18_3BE``
> +      - 'U18_3BE'
> +      - Corresponds to SNDRV_PCM_FORMAT_U18_3BE in ALSA
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Documentation/userspace-api/media/v4l/pixfmt.rst
> index 11dab4a90630..2eb6fdd3b43d 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
> @@ -36,3 +36,4 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
>      colorspaces
>      colorspaces-defs
>      colorspaces-details
> +    pixfmt-audio
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 5d088e6c43e4..31e443c644db 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1471,6 +1471,42 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
>  	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
>  	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
> +	case V4L2_AUDIO_FMT_S8:		descr = "8-bit Signed"; break;
> +	case V4L2_AUDIO_FMT_U8:		descr = "8-bit Unsigned"; break;
> +	case V4L2_AUDIO_FMT_S16_LE:	descr = "16-bit Signed LE"; break;
> +	case V4L2_AUDIO_FMT_S16_BE:		descr = "16-bit Signed BE"; break;
> +	case V4L2_AUDIO_FMT_U16_LE:		descr = "16-bit Unsigned LE"; break;
> +	case V4L2_AUDIO_FMT_U16_BE:		descr = "16-bit Unsigned BE"; break;
> +	case V4L2_AUDIO_FMT_S24_LE:		descr = "24(32)-bit Signed LE"; break;
> +	case V4L2_AUDIO_FMT_S24_BE:		descr = "24(32)-bit Signed BE"; break;
> +	case V4L2_AUDIO_FMT_U24_LE:		descr = "24(32)-bit Unsigned LE"; break;
> +	case V4L2_AUDIO_FMT_U24_BE:		descr = "24(32)-bit Unsigned BE"; break;
> +	case V4L2_AUDIO_FMT_S32_LE:		descr = "32-bit Signed LE"; break;
> +	case V4L2_AUDIO_FMT_S32_BE:		descr = "32-bit Signed BE"; break;
> +	case V4L2_AUDIO_FMT_U32_LE:		descr = "32-bit Unsigned LE"; break;
> +	case V4L2_AUDIO_FMT_U32_BE:		descr = "32-bit Unsigned BE"; break;
> +	case V4L2_AUDIO_FMT_FLOAT_LE:		descr = "32-bit Float LE"; break;
> +	case V4L2_AUDIO_FMT_FLOAT_BE:		descr = "32-bit Float BE"; break;
> +	case V4L2_AUDIO_FMT_FLOAT64_LE:		descr = "64-bit Float LE"; break;
> +	case V4L2_AUDIO_FMT_FLOAT64_BE:		descr = "64-bit Float BE"; break;
> +	case V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE:	descr = "32-bit IEC958 LE"; break;
> +	case V4L2_AUDIO_FMT_IEC958_SUBFRAME_BE:	descr = "32-bit IEC958 BE"; break;
> +	case V4L2_AUDIO_FMT_S20_LE:		descr = "20-bit Signed LE"; break;
> +	case V4L2_AUDIO_FMT_S20_BE:		descr = "20-bit Signed BE"; break;
> +	case V4L2_AUDIO_FMT_U20_LE:		descr = "20-bit Unsigned LE"; break;
> +	case V4L2_AUDIO_FMT_U20_BE:		descr = "20-bit Unsigned BE"; break;
> +	case V4L2_AUDIO_FMT_S24_3LE:		descr = "24(24)-bit Signed LE"; break;
> +	case V4L2_AUDIO_FMT_S24_3BE:		descr = "24(24)-bit Signed BE"; break;
> +	case V4L2_AUDIO_FMT_U24_3LE:		descr = "24(24)-bit Unsigned LE"; break;
> +	case V4L2_AUDIO_FMT_U24_3BE:		descr = "24(24)-bit Unsigned BE"; break;
> +	case V4L2_AUDIO_FMT_S20_3LE:		descr = "20(24)-bit Signed LE"; break;
> +	case V4L2_AUDIO_FMT_S20_3BE:		descr = "20(24)-bit Signed BE"; break;
> +	case V4L2_AUDIO_FMT_U20_3LE:		descr = "20(24)-bit Unsigned LE"; break;
> +	case V4L2_AUDIO_FMT_U20_3BE:		descr = "20(24)-bit Unsigned BE"; break;
> +	case V4L2_AUDIO_FMT_S18_3LE:		descr = "18(24)-bit Signed LE"; break;
> +	case V4L2_AUDIO_FMT_S18_3BE:		descr = "18(24)-bit Signed BE"; break;
> +	case V4L2_AUDIO_FMT_U18_3LE:		descr = "18(24)-bit Unsigned LE"; break;
> +	case V4L2_AUDIO_FMT_U18_3BE:		descr = "18(24)-bit Unsigned BE"; break;

This still has several formats that are not used by the initial drivers imx-asrc
and viaudm2m. Please just add the ones that are actually used.

We had bad experiences in the past with defined-but-never-used formats, so we
are fairly strict about that these days.

>  
>  	default:
>  		/* Compressed formats */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index b0ddb7319d36..2ac7b989394c 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -842,6 +842,54 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
>  #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
>  
> +/*
> + * Audio-data formats
> + * All these audio formats use a fourcc starting with 'AU'
> + * followed by the SNDRV_PCM_FORMAT_ value from asound.h.
> + */
> +#define V4L2_AUDIO_FMT_S8			v4l2_fourcc('A', 'U', '0', '0')
> +#define V4L2_AUDIO_FMT_U8			v4l2_fourcc('A', 'U', '0', '1')
> +#define V4L2_AUDIO_FMT_S16_LE			v4l2_fourcc('A', 'U', '0', '2')
> +#define V4L2_AUDIO_FMT_S16_BE			v4l2_fourcc('A', 'U', '0', '3')
> +#define V4L2_AUDIO_FMT_U16_LE			v4l2_fourcc('A', 'U', '0', '4')
> +#define V4L2_AUDIO_FMT_U16_BE			v4l2_fourcc('A', 'U', '0', '5')
> +#define V4L2_AUDIO_FMT_S24_LE			v4l2_fourcc('A', 'U', '0', '6')
> +#define V4L2_AUDIO_FMT_S24_BE			v4l2_fourcc('A', 'U', '0', '7')
> +#define V4L2_AUDIO_FMT_U24_LE			v4l2_fourcc('A', 'U', '0', '8')
> +#define V4L2_AUDIO_FMT_U24_BE			v4l2_fourcc('A', 'U', '0', '9')
> +
> +#define V4L2_AUDIO_FMT_S32_LE			v4l2_fourcc('A', 'U', '1', '0')
> +#define V4L2_AUDIO_FMT_S32_BE			v4l2_fourcc('A', 'U', '1', '1')
> +#define V4L2_AUDIO_FMT_U32_LE			v4l2_fourcc('A', 'U', '1', '2')
> +#define V4L2_AUDIO_FMT_U32_BE			v4l2_fourcc('A', 'U', '1', '3')
> +#define V4L2_AUDIO_FMT_FLOAT_LE			v4l2_fourcc('A', 'U', '1', '4')
> +#define V4L2_AUDIO_FMT_FLOAT_BE			v4l2_fourcc('A', 'U', '1', '5')
> +#define V4L2_AUDIO_FMT_FLOAT64_LE		v4l2_fourcc('A', 'U', '1', '6')
> +#define V4L2_AUDIO_FMT_FLOAT64_BE		v4l2_fourcc('A', 'U', '1', '7')
> +#define V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE	v4l2_fourcc('A', 'U', '1', '8')
> +#define V4L2_AUDIO_FMT_IEC958_SUBFRAME_BE	v4l2_fourcc('A', 'U', '1', '9')
> +
> +#define V4L2_AUDIO_FMT_S20_LE			v4l2_fourcc('A', 'U', '2', '5')
> +#define V4L2_AUDIO_FMT_S20_BE			v4l2_fourcc('A', 'U', '2', '6')
> +#define V4L2_AUDIO_FMT_U20_LE			v4l2_fourcc('A', 'U', '2', '7')
> +#define V4L2_AUDIO_FMT_U20_BE			v4l2_fourcc('A', 'U', '2', '8')
> +
> +#define V4L2_AUDIO_FMT_S24_3LE			v4l2_fourcc('A', 'U', '3', '2')
> +#define V4L2_AUDIO_FMT_S24_3BE			v4l2_fourcc('A', 'U', '3', '3')
> +#define V4L2_AUDIO_FMT_U24_3LE			v4l2_fourcc('A', 'U', '3', '4')
> +#define V4L2_AUDIO_FMT_U24_3BE			v4l2_fourcc('A', 'U', '3', '5')
> +#define V4L2_AUDIO_FMT_S20_3LE			v4l2_fourcc('A', 'U', '3', '6')
> +#define V4L2_AUDIO_FMT_S20_3BE			v4l2_fourcc('A', 'U', '3', '7')
> +#define V4L2_AUDIO_FMT_U20_3LE			v4l2_fourcc('A', 'U', '3', '8')
> +#define V4L2_AUDIO_FMT_U20_3BE			v4l2_fourcc('A', 'U', '3', '9')
> +#define V4L2_AUDIO_FMT_S18_3LE			v4l2_fourcc('A', 'U', '4', '0')
> +#define V4L2_AUDIO_FMT_S18_3BE			v4l2_fourcc('A', 'U', '4', '1')
> +#define V4L2_AUDIO_FMT_U18_3LE			v4l2_fourcc('A', 'U', '4', '2')
> +#define V4L2_AUDIO_FMT_U18_3BE			v4l2_fourcc('A', 'U', '4', '3')
> +
> +#define v4l2_fourcc_to_audfmt(X)	\
> +	(((((X) >> 16) & 0xFF) - '0') * 10 + ((((X) >> 24) & 0xFF) - '0'))

X -> fourcc
0xFF -> 0xff

> +
>  /* priv field value to indicates that subsequent fields are valid. */
>  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
>  

Regards,

	Hans
