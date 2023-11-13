Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 488A27E9AB5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 12:08:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=f+g1zMT5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STRWD1SQSz3cZP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 22:08:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=f+g1zMT5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ideasonboard.com (client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647; helo=perceval.ideasonboard.com; envelope-from=laurent.pinchart@ideasonboard.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1505 seconds by postgrey-1.37 at boromir; Mon, 13 Nov 2023 22:07:51 AEDT
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STRVH3HTMz3dDx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 22:07:51 +1100 (AEDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62A6410A;
	Mon, 13 Nov 2023 12:07:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699873642;
	bh=44XxDMZ8vV3iZkNBqPO1GmXv2iPnvXqCnW7IKgatAEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f+g1zMT5sVTdL0UYHZw8lTioKQ71fT9LaG2nS3f3ftw+VxQsWnosT0cx4CH7bkU5P
	 t6WCi04avRTLwUJlSuFwVJd0E19oqlEMdXAn04A0DWKwoxOEqBlpzVHNVcbQWmC2Ln
	 LpMRv49vUCqPnEE/A1p/tjFWpQQZwmyTuD8YpoNc=
Date: Mon, 13 Nov 2023 13:07:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v9 10/15] media: uapi: Add V4L2_CTRL_TYPE_FIXED_POINT
Message-ID: <20231113110754.GB24338@pendragon.ideasonboard.com>
References: <1699595289-25773-1-git-send-email-shengjiu.wang@nxp.com>
 <1699595289-25773-11-git-send-email-shengjiu.wang@nxp.com>
 <4cd6b593-2376-4cbc-a7c8-d3eb36a2f7a0@xs4all.nl>
 <20231113104238.GA13981@pendragon.ideasonboard.com>
 <6a3e7eb9-505c-4cfb-8a86-a8947a2e44d5@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6a3e7eb9-505c-4cfb-8a86-a8947a2e44d5@xs4all.nl>
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org, broonie@kernel.org, sakari.ailus@iki.fi, festevam@gmail.com, perex@perex.cz, mchehab@kernel.org, shengjiu.wang@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 13, 2023 at 11:56:49AM +0100, Hans Verkuil wrote:
> On 13/11/2023 11:42, Laurent Pinchart wrote:
> > On Mon, Nov 13, 2023 at 11:29:09AM +0100, Hans Verkuil wrote:
> >> Hi Shengjiu,
> >>
> >> On 10/11/2023 06:48, Shengjiu Wang wrote:
> >>> Fixed point controls are used by the user to configure
> >>> a fixed point value in 64bits, which Q31.32 format.
> >>>
> >>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>
> >> This patch adds a new control type. This is something that also needs to be
> >> tested by v4l2-compliance, and for that we need to add support for this to
> >> one of the media test-drivers. The best place for that is the vivid driver,
> >> since that has already a bunch of test controls for other control types.
> >>
> >> See e.g. VIVID_CID_INTEGER64 in vivid-ctrls.c.
> >>
> >> Can you add a patch adding a fixed point test control to vivid?
> > 
> > I don't think V4L2_CTRL_TYPE_FIXED_POINT is a good idea. This seems to
> > relate more to units than control types. We have lots of fixed-point
> > values in controls already, using the 32-bit and 64-bit integer control
> > types. They use various locations for the decimal point, depending on
> > the control. If we want to make this more explicit to users, we should
> > work on adding unit support to the V4L2 controls.
> 
> "Fixed Point" is not a unit, it's a type. 'Db', 'Hz' etc. are units.

It's not a unit, but I think it's related to units. My point is that,
without units support, I don't see why we need a formal definition of
fixed-point types, and why this series couldn't just use
VIVID_CID_INTEGER64. Drivers already interpret VIVID_CID_INTEGER64
values as they see fit.

> A quick "git grep -i "fixed point" Documentation/userspace-api/media/'
> only shows a single driver specific control (dw100.rst).
> 
> I'm not aware of other controls in mainline that use fixed point.

The analog gain control for sensors for instance.

> Note that V4L2_CTRL_TYPE_FIXED_POINT is a Q31.32 format. By setting
> min/max/step you can easily map that to just about any QN.M format where
> N <= 31 and M <= 32.
> 
> In the case of dw100 it is a bit different in that it is quite specialized
> and it had to fit in 16 bits.
> 
> >>> ---
> >>>  .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst  | 13 +++++++------
> >>>  .../userspace-api/media/v4l/vidioc-queryctrl.rst    |  9 ++++++++-
> >>>  .../userspace-api/media/videodev2.h.rst.exceptions  |  1 +
> >>>  drivers/media/v4l2-core/v4l2-ctrls-api.c            |  5 ++++-
> >>>  drivers/media/v4l2-core/v4l2-ctrls-core.c           |  2 ++
> >>>  include/uapi/linux/videodev2.h                      |  1 +
> >>>  6 files changed, 23 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> >>> index e8475f9fd2cf..e7e5d78dc11e 100644
> >>> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> >>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> >>> @@ -162,13 +162,13 @@ still cause this situation.
> >>>      * - __s32
> >>>        - ``value``
> >>>        - New value or current value. Valid if this control is not of type
> >>> -	``V4L2_CTRL_TYPE_INTEGER64`` and ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is
> >>> -	not set.
> >>> +	``V4L2_CTRL_TYPE_INTEGER64``, ``V4L2_CTRL_TYPE_FIXED_POINT`` and
> >>> +	``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is not set.
> >>>      * - __s64
> >>>        - ``value64``
> >>>        - New value or current value. Valid if this control is of type
> >>> -	``V4L2_CTRL_TYPE_INTEGER64`` and ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is
> >>> -	not set.
> >>> +	``V4L2_CTRL_TYPE_INTEGER64``, ``V4L2_CTRL_TYPE_FIXED_POINT`` and
> >>> +	``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is not set.
> >>>      * - char *
> >>>        - ``string``
> >>>        - A pointer to a string. Valid if this control is of type
> >>> @@ -193,8 +193,9 @@ still cause this situation.
> >>>      * - __s64 *
> >>>        - ``p_s64``
> >>>        - A pointer to a matrix control of signed 64-bit values. Valid if
> >>> -        this control is of type ``V4L2_CTRL_TYPE_INTEGER64`` and
> >>> -        ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is set.
> >>> +        this control is of type ``V4L2_CTRL_TYPE_INTEGER64``,
> >>> +        ``V4L2_CTRL_TYPE_FIXED_POINT`` and ``V4L2_CTRL_FLAG_HAS_PAYLOAD``
> >>> +        is set.
> >>>      * - struct :c:type:`v4l2_area` *
> >>>        - ``p_area``
> >>>        - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
> >>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> >>> index 4d38acafe8e1..f3995ec57044 100644
> >>> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> >>> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> >>> @@ -235,7 +235,8 @@ See also the examples in :ref:`control`.
> >>>        - ``default_value``
> >>>        - The default value of a ``V4L2_CTRL_TYPE_INTEGER``, ``_INTEGER64``,
> >>>  	``_BOOLEAN``, ``_BITMASK``, ``_MENU``, ``_INTEGER_MENU``, ``_U8``
> >>> -	or ``_U16`` control. Not valid for other types of controls.
> >>> +	``_FIXED_POINT`` or ``_U16`` control. Not valid for other types of
> >>> +	controls.
> >>>  
> >>>  	.. note::
> >>>  
> >>> @@ -549,6 +550,12 @@ See also the examples in :ref:`control`.
> >>>        - n/a
> >>>        - A struct :c:type:`v4l2_ctrl_av1_film_grain`, containing AV1 Film Grain
> >>>          parameters for stateless video decoders.
> >>> +    * - ``V4L2_CTRL_TYPE_FIXED_POINT``
> >>> +      - any
> >>> +      - any
> >>> +      - any
> >>> +      - A 64-bit integer valued control, containing parameter which is
> >>> +        Q31.32 format.
> >>>  
> >>>  .. raw:: latex
> >>>  
> >>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >>> index e61152bb80d1..2faa5a2015eb 100644
> >>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >>> @@ -167,6 +167,7 @@ replace symbol V4L2_CTRL_TYPE_AV1_SEQUENCE :c:type:`v4l2_ctrl_type`
> >>>  replace symbol V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY :c:type:`v4l2_ctrl_type`
> >>>  replace symbol V4L2_CTRL_TYPE_AV1_FRAME :c:type:`v4l2_ctrl_type`
> >>>  replace symbol V4L2_CTRL_TYPE_AV1_FILM_GRAIN :c:type:`v4l2_ctrl_type`
> >>> +replace symbol V4L2_CTRL_TYPE_FIXED_POINT :c:type:`v4l2_ctrl_type`
> >>>  
> >>>  # V4L2 capability defines
> >>>  replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> >>> index 002ea6588edf..e6a0fb8d6791 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> >>> @@ -57,6 +57,7 @@ static int ptr_to_user(struct v4l2_ext_control *c,
> >>>  		return copy_to_user(c->string, ptr.p_char, len + 1) ?
> >>>  		       -EFAULT : 0;
> >>>  	case V4L2_CTRL_TYPE_INTEGER64:
> >>> +	case V4L2_CTRL_TYPE_FIXED_POINT:
> >>>  		c->value64 = *ptr.p_s64;
> >>>  		break;
> >>>  	default:
> >>> @@ -132,6 +133,7 @@ static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
> >>>  
> >>>  	switch (ctrl->type) {
> >>>  	case V4L2_CTRL_TYPE_INTEGER64:
> >>> +	case V4L2_CTRL_TYPE_FIXED_POINT:
> >>>  		*ctrl->p_new.p_s64 = c->value64;
> >>>  		break;
> >>>  	case V4L2_CTRL_TYPE_STRING:
> >>> @@ -540,7 +542,8 @@ static int validate_ctrls(struct v4l2_ext_controls *cs,
> >>>  		 */
> >>>  		if (ctrl->is_ptr)
> >>>  			continue;
> >>> -		if (ctrl->type == V4L2_CTRL_TYPE_INTEGER64)
> >>> +		if (ctrl->type == V4L2_CTRL_TYPE_INTEGER64 ||
> >>> +		    ctrl->type == V4L2_CTRL_TYPE_FIXED_POINT)
> >>>  			p_new.p_s64 = &cs->controls[i].value64;
> >>>  		else
> >>>  			p_new.p_s32 = &cs->controls[i].value;
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> >>> index a662fb60f73f..9d50df0d9874 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> >>> @@ -1187,6 +1187,7 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
> >>>  	case V4L2_CTRL_TYPE_INTEGER:
> >>>  		return ROUND_TO_RANGE(ptr.p_s32[idx], u32, ctrl);
> >>>  	case V4L2_CTRL_TYPE_INTEGER64:
> >>> +	case V4L2_CTRL_TYPE_FIXED_POINT:
> >>>  		/*
> >>>  		 * We can't use the ROUND_TO_RANGE define here due to
> >>>  		 * the u64 divide that needs special care.
> >>> @@ -1779,6 +1780,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
> >>>  	/* Prefill elem_size for all types handled by std_type_ops */
> >>>  	switch ((u32)type) {
> >>>  	case V4L2_CTRL_TYPE_INTEGER64:
> >>> +	case V4L2_CTRL_TYPE_FIXED_POINT:
> >>>  		elem_size = sizeof(s64);
> >>>  		break;
> >>>  	case V4L2_CTRL_TYPE_STRING:
> >>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> >>> index cf8c44595a1d..9482ac66a675 100644
> >>> --- a/include/uapi/linux/videodev2.h
> >>> +++ b/include/uapi/linux/videodev2.h
> >>> @@ -1903,6 +1903,7 @@ enum v4l2_ctrl_type {
> >>>  	V4L2_CTRL_TYPE_STRING        = 7,
> >>>  	V4L2_CTRL_TYPE_BITMASK       = 8,
> >>>  	V4L2_CTRL_TYPE_INTEGER_MENU  = 9,
> >>> +	V4L2_CTRL_TYPE_FIXED_POINT   = 10,
> >>>  
> >>>  	/* Compound types are >= 0x0100 */
> >>>  	V4L2_CTRL_COMPOUND_TYPES     = 0x0100,

-- 
Regards,

Laurent Pinchart
