Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 827627BE2E6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 16:33:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S41k72dFnz3cDn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 01:33:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=b6ql=fx=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S41jf0tLfz2yGv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 01:33:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F45A611DB;
	Mon,  9 Oct 2023 14:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319E9C433C8;
	Mon,  9 Oct 2023 14:33:19 +0000 (UTC)
Message-ID: <ff0cbd65-33ee-4a5e-acc3-0ca085eaaed4@xs4all.nl>
Date: Mon, 9 Oct 2023 16:33:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 08/11] media: uapi: Add audio rate controls support
Content-Language: en-US, nl
To: Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
References: <1695891619-32393-1-git-send-email-shengjiu.wang@nxp.com>
 <1695891619-32393-9-git-send-email-shengjiu.wang@nxp.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <1695891619-32393-9-git-send-email-shengjiu.wang@nxp.com>
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

On 28/09/2023 11:00, Shengjiu Wang wrote:
> Audio rate controls is used for user to configure

is -> are
for -> by the

> the audio sample rate to driver.
> 
> Add V4L2_CID_ASRC_SOURCE_RATE and V4L2_CID_ASRC_DEST_RATE
> new ID for ASRC rate control.

ID -> IDs

> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../userspace-api/media/v4l/common.rst        |  1 +
>  .../media/v4l/ext-ctrls-asrc-rate.rst         | 36 +++++++++++++++++++
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 +++
>  .../media/v4l/vidioc-queryctrl.rst            |  7 ++++
>  .../media/videodev2.h.rst.exceptions          |  1 +
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     |  5 +++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  4 +++
>  include/media/v4l2-ctrls.h                    |  1 +
>  include/uapi/linux/v4l2-controls.h            | 13 +++++++
>  include/uapi/linux/videodev2.h                |  1 +
>  10 files changed, 73 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-asrc-rate.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/common.rst b/Documentation/userspace-api/media/v4l/common.rst
> index ea0435182e44..fe6cd7ae60e4 100644
> --- a/Documentation/userspace-api/media/v4l/common.rst
> +++ b/Documentation/userspace-api/media/v4l/common.rst
> @@ -52,6 +52,7 @@ applicable to all devices.
>      ext-ctrls-fm-rx
>      ext-ctrls-detect
>      ext-ctrls-colorimetry
> +    ext-ctrls-asrc-rate
>      fourcc
>      format
>      planar-apis
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-asrc-rate.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-asrc-rate.rst
> new file mode 100644
> index 000000000000..28bf9e1628e1
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-asrc-rate.rst
> @@ -0,0 +1,36 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _asrc-rate-controls:
> +
> +***************************
> +ASRC RATE Control Reference

RATE -> Rate

> +***************************
> +
> +These controls is intended to support asynchronous sample

is -> are
support -> support an

> +rate converter.
> +
> +.. _v4l2-audio-asrc:
> +
> +``V4L2_CID_ASRC_SOURCE_RATE``
> +    sets the rasampler source rate.

You mean 'resampler'?

> +
> +``V4L2_CID_ASRC_DEST_RATE``
> +    sets the rasampler destination rate.

Ditto

> +
> +.. c:type:: v4l2_ctrl_asrc_rate
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{5.8cm}|p{10.0cm}|
> +
> +.. flat-table:: struct v4l2_ctrl_asrc_rate
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u32
> +      - ``rate_integer``
> +      - integer part of sample rate.
> +    * - __s32
> +      - ``rate_fractional``
> +      - fractional part of sample rate, which is Q31.
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index f9f73530a6be..93ce15330490 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -295,6 +295,10 @@ still cause this situation.
>        - ``p_av1_film_grain``
>        - A pointer to a struct :c:type:`v4l2_ctrl_av1_film_grain`. Valid if this control is
>          of type ``V4L2_CTRL_TYPE_AV1_FILM_GRAIN``.
> +    * - struct :c:type:`v4l2_ctrl_asrc_rate` *
> +      - ``p_asrc_rate``
> +      - A pointer to a struct :c:type:`v4l2_ctrl_asrc_rate`. Valid if this control is
> +        of type ``V4L2_CTRL_TYPE_ASRC_RATE``.
>      * - void *
>        - ``ptr``
>        - A pointer to a compound type which can be an N-dimensional array
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index 4d38acafe8e1..8c15a0bb0fbc 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -549,6 +549,13 @@ See also the examples in :ref:`control`.
>        - n/a
>        - A struct :c:type:`v4l2_ctrl_av1_film_grain`, containing AV1 Film Grain
>          parameters for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_ASRC_RATE``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_ctrl_asrc_rate`, containing audio
> +        parameters for asrc component.
> +

You relate the name of the type to the controls that use it, but I think
the type should be about the actual value it carries. So:

V4L2_CTRL_TYPE_FRACTIONAL

I.e. it is the type for a fractional value and it can be used by any
control that would need a fractional value.

Note: I'm not sure if 'fractional' is the best name. Perhaps 'FIXED_POINT'
would be better? Suggestions welcome.

>  
>  .. raw:: latex
>  
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index e61152bb80d1..769e333a2b75 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -167,6 +167,7 @@ replace symbol V4L2_CTRL_TYPE_AV1_SEQUENCE :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_AV1_FRAME :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_AV1_FILM_GRAIN :c:type:`v4l2_ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_ASRC_RATE :c:type:`v4l2_ctrl_type`
>  
>  # V4L2 capability defines
>  replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index a662fb60f73f..2a72779f3508 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -1168,6 +1168,8 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  		if (!area->width || !area->height)
>  			return -EINVAL;
>  		break;
> +	case V4L2_CTRL_TYPE_ASRC_RATE:
> +		break;
>  
>  	default:
>  		return -EINVAL;
> @@ -1868,6 +1870,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  	case V4L2_CTRL_TYPE_AREA:
>  		elem_size = sizeof(struct v4l2_area);
>  		break;
> +	case V4L2_CTRL_TYPE_ASRC_RATE:
> +		elem_size = sizeof(struct v4l2_ctrl_asrc_rate);
> +		break;
>  	default:
>  		if (type < V4L2_CTRL_COMPOUND_TYPES)
>  			elem_size = sizeof(s32);
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 8696eb1cdd61..84766037db80 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1602,6 +1602,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
>  		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
>  		break;
> +	case V4L2_CID_ASRC_SOURCE_RATE:
> +	case V4L2_CID_ASRC_DEST_RATE:
> +		*type = V4L2_CTRL_TYPE_ASRC_RATE;
> +		break;
>  	default:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		break;
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 59679a42b3e7..40475965f8e4 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -89,6 +89,7 @@ union v4l2_ctrl_ptr {
>  	struct v4l2_ctrl_av1_tile_group_entry *p_av1_tile_group_entry;
>  	struct v4l2_ctrl_av1_frame *p_av1_frame;
>  	struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
> +	struct v4l2_ctrl_asrc_rate *p_asrc_rate;
>  	void *p;
>  	const void *p_const;
>  };
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index c3604a0a3e30..a08be3bd5977 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -112,6 +112,8 @@ enum v4l2_colorfx {
>  
>  /* last CID + 1 */
>  #define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
> +#define V4L2_CID_ASRC_SOURCE_RATE		(V4L2_CID_BASE + 45)
> +#define V4L2_CID_ASRC_DEST_RATE			(V4L2_CID_BASE + 46)
>  
>  /* USER-class private control IDs */
>  
> @@ -3488,4 +3490,15 @@ struct v4l2_ctrl_av1_film_grain {
>  #define V4L2_CID_MPEG_MFC51_BASE        V4L2_CID_CODEC_MFC51_BASE
>  #endif
>  
> +/**
> + * struct v4l2_ctrl_asrc_rate - ASRC sample rate.
> + *
> + * @rate_integer: integer part of rate.
> + * @rate_fractional: fractional part of rate, most time may be zero
> + */
> +struct v4l2_ctrl_asrc_rate {
> +	__u32 rate_integer;
> +	__u32 rate_fractional;
> +};
> +
>  #endif
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 3630f50eedb1..166c51f537cc 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1840,6 +1840,7 @@ struct v4l2_ext_control {
>  		struct v4l2_ctrl_av1_tile_group_entry __user *p_av1_tile_group_entry;
>  		struct v4l2_ctrl_av1_frame __user *p_av1_frame;
>  		struct v4l2_ctrl_av1_film_grain __user *p_av1_film_grain;
> +		struct v4l2_ctrl_asrc_rate __user *p_asrc_rate;
>  		void __user *ptr;
>  	};
>  } __attribute__ ((packed));

Regards,

	Hans
