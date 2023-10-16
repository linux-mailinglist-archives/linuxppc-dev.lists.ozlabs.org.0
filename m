Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A894B7CA930
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 15:17:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8HhK4Sl1z3vXD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 00:17:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=srs0=khzu=f6=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8Hgq4qQkz2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 00:16:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5D722CE16C8;
	Mon, 16 Oct 2023 13:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793B9C433C8;
	Mon, 16 Oct 2023 13:16:33 +0000 (UTC)
Message-ID: <a0dfe959-3b32-4d03-9f1b-8f3c1054ecf7@xs4all.nl>
Date: Mon, 16 Oct 2023 15:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 09/11] media: uapi: Add audio rate controls support
Content-Language: en-US, nl
To: Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
References: <1697185865-27528-1-git-send-email-shengjiu.wang@nxp.com>
 <1697185865-27528-10-git-send-email-shengjiu.wang@nxp.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <1697185865-27528-10-git-send-email-shengjiu.wang@nxp.com>
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

Hi Shengjiu,

On 13/10/2023 10:31, Shengjiu Wang wrote:
> Fixed point controls are used by the user to configure
> the audio sample rate to driver.
> 
> Add V4L2_CID_ASRC_SOURCE_RATE and V4L2_CID_ASRC_DEST_RATE
> new IDs for ASRC rate control.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../userspace-api/media/v4l/common.rst        |  1 +
>  .../media/v4l/ext-ctrls-fixed-point.rst       | 36 +++++++++++++++++++
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 +++
>  .../media/v4l/vidioc-queryctrl.rst            |  7 ++++
>  .../media/videodev2.h.rst.exceptions          |  1 +
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     |  5 +++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  4 +++
>  include/media/v4l2-ctrls.h                    |  2 ++
>  include/uapi/linux/v4l2-controls.h            | 13 +++++++
>  include/uapi/linux/videodev2.h                |  3 ++
>  10 files changed, 76 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-fixed-point.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/common.rst b/Documentation/userspace-api/media/v4l/common.rst
> index ea0435182e44..35707edffb13 100644
> --- a/Documentation/userspace-api/media/v4l/common.rst
> +++ b/Documentation/userspace-api/media/v4l/common.rst
> @@ -52,6 +52,7 @@ applicable to all devices.
>      ext-ctrls-fm-rx
>      ext-ctrls-detect
>      ext-ctrls-colorimetry
> +    ext-ctrls-fixed-point

Rename this to ext-ctrls-audio-m2m.

>      fourcc
>      format
>      planar-apis
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-fixed-point.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-fixed-point.rst
> new file mode 100644
> index 000000000000..2ef6e250580c
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fixed-point.rst
> @@ -0,0 +1,36 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _fixed-point-controls:
> +
> +***************************
> +Fixed Point Control Reference

This is for audio controls. "Fixed Point" is just the type, and it doesn't make
sense to group fixed point controls. But it does make sense to group the audio
controls.

V4L2 controls can be grouped into classes. Basically it is a way to put controls
into categories, and for each category there is also a control that gives a
description of the class (see 2.15.15 in
https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/v4l2-controls.html#introduction)

If you use e.g. 'v4l2-ctl -l' to list all the controls, then you will see that
they are grouped based on what class of control they are.

So I think it would be a good idea to create a new control class for M2M audio controls,
instead of just adding them to the catch-all 'User Controls' class.

Search e.g. for V4L2_CTRL_CLASS_COLORIMETRY and V4L2_CID_COLORIMETRY_CLASS to see how
it is done.

M2M_AUDIO would probably be a good name for the class.

> +***************************
> +
> +These controls are intended to support an asynchronous sample
> +rate converter.

Add ' (ASRC).' at the end to indicate the common abbreviation for
that.

> +
> +.. _v4l2-audio-asrc:
> +
> +``V4L2_CID_ASRC_SOURCE_RATE``
> +    sets the resampler source rate.
> +
> +``V4L2_CID_ASRC_DEST_RATE``
> +    sets the resampler destination rate.

Document the unit (Hz) for these two controls.

> +
> +.. c:type:: v4l2_ctrl_fixed_point
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{5.8cm}|p{10.0cm}|
> +
> +.. flat-table:: struct v4l2_ctrl_fixed_point
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u32

Hmm, shouldn't this be __s32?

> +      - ``integer``
> +      - integer part of fixed point value.
> +    * - __s32

and this __u32?

You want to be able to use this generic type as a signed value.

> +      - ``fractional``
> +      - fractional part of fixed point value, which is Q31.
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index f9f73530a6be..1811dabf5c74 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -295,6 +295,10 @@ still cause this situation.
>        - ``p_av1_film_grain``
>        - A pointer to a struct :c:type:`v4l2_ctrl_av1_film_grain`. Valid if this control is
>          of type ``V4L2_CTRL_TYPE_AV1_FILM_GRAIN``.
> +    * - struct :c:type:`v4l2_ctrl_fixed_point` *
> +      - ``p_fixed_point``
> +      - A pointer to a struct :c:type:`v4l2_ctrl_fixed_point`. Valid if this control is
> +        of type ``V4L2_CTRL_TYPE_FIXED_POINT``.
>      * - void *
>        - ``ptr``
>        - A pointer to a compound type which can be an N-dimensional array
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index 4d38acafe8e1..9285f4f39eed 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -549,6 +549,13 @@ See also the examples in :ref:`control`.
>        - n/a
>        - A struct :c:type:`v4l2_ctrl_av1_film_grain`, containing AV1 Film Grain
>          parameters for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_FIXED_POINT``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_ctrl_fixed_point`, containing parameter which has
> +        integer part and fractional part, i.e. audio sample rate.
> +
>  
>  .. raw:: latex
>  
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index e61152bb80d1..2faa5a2015eb 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -167,6 +167,7 @@ replace symbol V4L2_CTRL_TYPE_AV1_SEQUENCE :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_AV1_FRAME :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_AV1_FILM_GRAIN :c:type:`v4l2_ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_FIXED_POINT :c:type:`v4l2_ctrl_type`
>  
>  # V4L2 capability defines
>  replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index a662fb60f73f..7a616ac91059 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -1168,6 +1168,8 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  		if (!area->width || !area->height)
>  			return -EINVAL;
>  		break;
> +	case V4L2_CTRL_TYPE_FIXED_POINT:
> +		break;

Hmm, this would need this patch 'v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL':

https://patchwork.linuxtv.org/project/linux-media/patch/20231010022136.1504015-7-yunkec@google.com/

since min and max values are perfectly fine for a fixed point value.

Even a step value (currently not supported in that patch) would make sense.

But I wonder if we couldn't simplify this: instead of creating a v4l2_ctrl_fixed_point,
why not represent the fixed point value as a Q31.32. Then the standard
minimum/maximum/step values can be used, and it acts like a regular V4L2_TYPE_INTEGER64.

Except that both userspace and drivers need to multiply it with 2^-32 to get the actual
value.

So in enum v4l2_ctrl_type add:

	V4L2_CTRL_TYPE_FIXED_POINT = 10,

(10, because it is no longer a compound type).

>  
>  	default:
>  		return -EINVAL;
> @@ -1868,6 +1870,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  	case V4L2_CTRL_TYPE_AREA:
>  		elem_size = sizeof(struct v4l2_area);
>  		break;
> +	case V4L2_CTRL_TYPE_FIXED_POINT:
> +		elem_size = sizeof(struct v4l2_ctrl_fixed_point);
> +		break;
>  	default:
>  		if (type < V4L2_CTRL_COMPOUND_TYPES)
>  			elem_size = sizeof(s32);
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 8696eb1cdd61..d8f232df6b6a 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1602,6 +1602,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
>  		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
>  		break;
> +	case V4L2_CID_ASRC_SOURCE_RATE:
> +	case V4L2_CID_ASRC_DEST_RATE:
> +		*type = V4L2_CTRL_TYPE_FIXED_POINT;
> +		break;
>  	default:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		break;
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 59679a42b3e7..645e4cccafc7 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -56,6 +56,7 @@ struct video_device;
>   * @p_av1_tile_group_entry:	Pointer to an AV1 tile group entry structure.
>   * @p_av1_frame:		Pointer to an AV1 frame structure.
>   * @p_av1_film_grain:		Pointer to an AV1 film grain structure.
> + * @p_fixed_point:		Pointer to a struct v4l2_ctrl_fixed_point.
>   * @p:				Pointer to a compound value.
>   * @p_const:			Pointer to a constant compound value.
>   */
> @@ -89,6 +90,7 @@ union v4l2_ctrl_ptr {
>  	struct v4l2_ctrl_av1_tile_group_entry *p_av1_tile_group_entry;
>  	struct v4l2_ctrl_av1_frame *p_av1_frame;
>  	struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
> +	struct v4l2_ctrl_fixed_point *p_fixed_point;
>  	void *p;
>  	const void *p_const;
>  };
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index c3604a0a3e30..91096259e3ea 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -112,6 +112,8 @@ enum v4l2_colorfx {
>  
>  /* last CID + 1 */
>  #define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
> +#define V4L2_CID_ASRC_SOURCE_RATE		(V4L2_CID_BASE + 45)
> +#define V4L2_CID_ASRC_DEST_RATE			(V4L2_CID_BASE + 46)

This patch needs to be split in three parts:

1) Add the new M2M_AUDIO control class,
2) Add the new V4L2_CTRL_TYPE_FIXED_POINT type,
3) Add the new controls.

These are all independent changes, so separating them makes it easier to
review.

>  
>  /* USER-class private control IDs */
>  
> @@ -3488,4 +3490,15 @@ struct v4l2_ctrl_av1_film_grain {
>  #define V4L2_CID_MPEG_MFC51_BASE        V4L2_CID_CODEC_MFC51_BASE
>  #endif
>  
> +/**
> + * struct v4l2_ctrl_fixed_point - fixed point parameter.
> + *
> + * @rate_integer: integer part of fixed point value.
> + * @rate_fractional: fractional part of fixed point value
> + */
> +struct v4l2_ctrl_fixed_point {
> +	__u32 integer;

__s32?

> +	__u32 fractional;
> +};
> +
>  #endif
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 2ac7b989394c..3ef32c09c2fa 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1888,6 +1888,7 @@ struct v4l2_ext_control {
>  		struct v4l2_ctrl_av1_tile_group_entry __user *p_av1_tile_group_entry;
>  		struct v4l2_ctrl_av1_frame __user *p_av1_frame;
>  		struct v4l2_ctrl_av1_film_grain __user *p_av1_film_grain;
> +		struct v4l2_ctrl_fixed_point __user *p_fixed_point;
>  		void __user *ptr;
>  	};
>  } __attribute__ ((packed));
> @@ -1966,6 +1967,8 @@ enum v4l2_ctrl_type {
>  	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
>  	V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
>  	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
> +
> +	V4L2_CTRL_TYPE_FIXED_POINT          = 0x290,
>  };
>  
>  /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */

Regards,

	Hans
