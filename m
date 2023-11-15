Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 745417EBE81
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 09:23:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVblM2kMGz3dFw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 19:23:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=96pf=g4=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVbks4tHpz2xb2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 19:22:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id EAFE8B81864;
	Wed, 15 Nov 2023 08:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2830CC433C8;
	Wed, 15 Nov 2023 08:22:36 +0000 (UTC)
Message-ID: <cf2dacde-dbf6-455a-988a-afb6a6cf0254@xs4all.nl>
Date: Wed, 15 Nov 2023 09:22:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/15] media: uapi: Add V4L2_CTRL_TYPE_FIXED_POINT
Content-Language: en-US, nl
To: Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
References: <1699595289-25773-1-git-send-email-shengjiu.wang@nxp.com>
 <1699595289-25773-11-git-send-email-shengjiu.wang@nxp.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <1699595289-25773-11-git-send-email-shengjiu.wang@nxp.com>
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

On 10/11/2023 06:48, Shengjiu Wang wrote:
> Fixed point controls are used by the user to configure
> a fixed point value in 64bits, which Q31.32 format.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst  | 13 +++++++------
>  .../userspace-api/media/v4l/vidioc-queryctrl.rst    |  9 ++++++++-
>  .../userspace-api/media/videodev2.h.rst.exceptions  |  1 +
>  drivers/media/v4l2-core/v4l2-ctrls-api.c            |  5 ++++-
>  drivers/media/v4l2-core/v4l2-ctrls-core.c           |  2 ++
>  include/uapi/linux/videodev2.h                      |  1 +
>  6 files changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index e8475f9fd2cf..e7e5d78dc11e 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -162,13 +162,13 @@ still cause this situation.
>      * - __s32
>        - ``value``
>        - New value or current value. Valid if this control is not of type
> -	``V4L2_CTRL_TYPE_INTEGER64`` and ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is
> -	not set.
> +	``V4L2_CTRL_TYPE_INTEGER64``, ``V4L2_CTRL_TYPE_FIXED_POINT`` and
> +	``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is not set.
>      * - __s64
>        - ``value64``
>        - New value or current value. Valid if this control is of type
> -	``V4L2_CTRL_TYPE_INTEGER64`` and ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is
> -	not set.
> +	``V4L2_CTRL_TYPE_INTEGER64``, ``V4L2_CTRL_TYPE_FIXED_POINT`` and
> +	``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is not set.
>      * - char *
>        - ``string``
>        - A pointer to a string. Valid if this control is of type
> @@ -193,8 +193,9 @@ still cause this situation.
>      * - __s64 *
>        - ``p_s64``
>        - A pointer to a matrix control of signed 64-bit values. Valid if
> -        this control is of type ``V4L2_CTRL_TYPE_INTEGER64`` and
> -        ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is set.
> +        this control is of type ``V4L2_CTRL_TYPE_INTEGER64``,
> +        ``V4L2_CTRL_TYPE_FIXED_POINT`` and ``V4L2_CTRL_FLAG_HAS_PAYLOAD``
> +        is set.
>      * - struct :c:type:`v4l2_area` *
>        - ``p_area``
>        - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index 4d38acafe8e1..f3995ec57044 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -235,7 +235,8 @@ See also the examples in :ref:`control`.
>        - ``default_value``
>        - The default value of a ``V4L2_CTRL_TYPE_INTEGER``, ``_INTEGER64``,
>  	``_BOOLEAN``, ``_BITMASK``, ``_MENU``, ``_INTEGER_MENU``, ``_U8``
> -	or ``_U16`` control. Not valid for other types of controls.
> +	``_FIXED_POINT`` or ``_U16`` control. Not valid for other types of
> +	controls.
>  
>  	.. note::
>  
> @@ -549,6 +550,12 @@ See also the examples in :ref:`control`.
>        - n/a
>        - A struct :c:type:`v4l2_ctrl_av1_film_grain`, containing AV1 Film Grain
>          parameters for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_FIXED_POINT``
> +      - any
> +      - any
> +      - any
> +      - A 64-bit integer valued control, containing parameter which is
> +        Q31.32 format.
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
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> index 002ea6588edf..e6a0fb8d6791 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> @@ -57,6 +57,7 @@ static int ptr_to_user(struct v4l2_ext_control *c,
>  		return copy_to_user(c->string, ptr.p_char, len + 1) ?
>  		       -EFAULT : 0;
>  	case V4L2_CTRL_TYPE_INTEGER64:
> +	case V4L2_CTRL_TYPE_FIXED_POINT:n
>  		c->value64 = *ptr.p_s64;
>  		break;
>  	default:
> @@ -132,6 +133,7 @@ static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
>  
>  	switch (ctrl->type) {
>  	case V4L2_CTRL_TYPE_INTEGER64:
> +	case V4L2_CTRL_TYPE_FIXED_POINT:
>  		*ctrl->p_new.p_s64 = c->value64;
>  		break;
>  	case V4L2_CTRL_TYPE_STRING:
> @@ -540,7 +542,8 @@ static int validate_ctrls(struct v4l2_ext_controls *cs,
>  		 */
>  		if (ctrl->is_ptr)
>  			continue;
> -		if (ctrl->type == V4L2_CTRL_TYPE_INTEGER64)
> +		if (ctrl->type == V4L2_CTRL_TYPE_INTEGER64 ||
> +		    ctrl->type == V4L2_CTRL_TYPE_FIXED_POINT)
>  			p_new.p_s64 = &cs->controls[i].value64;
>  		else
>  			p_new.p_s32 = &cs->controls[i].value;

You missed a few more: everywhere in this source where V4L2_CTRL_TYPE_INTEGER64
is used you need to add a check for FIXED_POINT as well.

> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index a662fb60f73f..9d50df0d9874 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c

Same here for this source.

Note that v4l2_ctrl_type_op_log() needs a separate case for FIXED_POINT so that it
can be logged properly.

> @@ -1187,6 +1187,7 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
>  	case V4L2_CTRL_TYPE_INTEGER:
>  		return ROUND_TO_RANGE(ptr.p_s32[idx], u32, ctrl);
>  	case V4L2_CTRL_TYPE_INTEGER64:
> +	case V4L2_CTRL_TYPE_FIXED_POINT:
>  		/*
>  		 * We can't use the ROUND_TO_RANGE define here due to
>  		 * the u64 divide that needs special care.
> @@ -1779,6 +1780,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  	/* Prefill elem_size for all types handled by std_type_ops */
>  	switch ((u32)type) {
>  	case V4L2_CTRL_TYPE_INTEGER64:
> +	case V4L2_CTRL_TYPE_FIXED_POINT:
>  		elem_size = sizeof(s64);
>  		break;
>  	case V4L2_CTRL_TYPE_STRING:

There is one more place where V4L2_CTRL_TYPE_INTEGER64 is used:
drivers/media/v4l2-core/v4l2-ioctl.c. That should report a fixed point
value in the same way as v4l2_ctrl_type_op_log().

> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index cf8c44595a1d..9482ac66a675 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1903,6 +1903,7 @@ enum v4l2_ctrl_type {
>  	V4L2_CTRL_TYPE_STRING        = 7,
>  	V4L2_CTRL_TYPE_BITMASK       = 8,
>  	V4L2_CTRL_TYPE_INTEGER_MENU  = 9,
> +	V4L2_CTRL_TYPE_FIXED_POINT   = 10,
>  
>  	/* Compound types are >= 0x0100 */
>  	V4L2_CTRL_COMPOUND_TYPES     = 0x0100,

We will probably need a helper to create a fixed point value from the integer
and fractional part, and one to extract them.

Regards,

	Hans
