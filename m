Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEF47E9A89
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 11:49:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=iLwdtlyj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STR4c5sgwz3cgM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 21:49:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=iLwdtlyj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ideasonboard.com (client-ip=213.167.242.64; helo=perceval.ideasonboard.com; envelope-from=laurent.pinchart@ideasonboard.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 342 seconds by postgrey-1.37 at boromir; Mon, 13 Nov 2023 21:48:19 AEDT
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STR3l2Dslz3c5L
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 21:48:19 +1100 (AEDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E34D510A;
	Mon, 13 Nov 2023 11:42:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699872127;
	bh=6ihvpfxog/JlU6xFHC7s7/xfpVvhabzUKotPpV7QC2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iLwdtlyjr9XaJgEq3GIS+tAqup/UOKkw9CD7xt6h7DwcFk2Jy6GcqzMIv8i5b2nty
	 YDM0eBQ9g6LgQ3Uiy6swYxkGgEHz9eKBgmI5tn7c0CpqziSP7wwwZNlU1vRvfyJlZM
	 e9cfogzJJnOl+xLA4frg+PnYkyippD2ByhKc6H38=
Date: Mon, 13 Nov 2023 12:42:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v9 10/15] media: uapi: Add V4L2_CTRL_TYPE_FIXED_POINT
Message-ID: <20231113104238.GA13981@pendragon.ideasonboard.com>
References: <1699595289-25773-1-git-send-email-shengjiu.wang@nxp.com>
 <1699595289-25773-11-git-send-email-shengjiu.wang@nxp.com>
 <4cd6b593-2376-4cbc-a7c8-d3eb36a2f7a0@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4cd6b593-2376-4cbc-a7c8-d3eb36a2f7a0@xs4all.nl>
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

On Mon, Nov 13, 2023 at 11:29:09AM +0100, Hans Verkuil wrote:
> Hi Shengjiu,
> 
> On 10/11/2023 06:48, Shengjiu Wang wrote:
> > Fixed point controls are used by the user to configure
> > a fixed point value in 64bits, which Q31.32 format.
> > 
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> This patch adds a new control type. This is something that also needs to be
> tested by v4l2-compliance, and for that we need to add support for this to
> one of the media test-drivers. The best place for that is the vivid driver,
> since that has already a bunch of test controls for other control types.
> 
> See e.g. VIVID_CID_INTEGER64 in vivid-ctrls.c.
> 
> Can you add a patch adding a fixed point test control to vivid?

I don't think V4L2_CTRL_TYPE_FIXED_POINT is a good idea. This seems to
relate more to units than control types. We have lots of fixed-point
values in controls already, using the 32-bit and 64-bit integer control
types. They use various locations for the decimal point, depending on
the control. If we want to make this more explicit to users, we should
work on adding unit support to the V4L2 controls.

> > ---
> >  .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst  | 13 +++++++------
> >  .../userspace-api/media/v4l/vidioc-queryctrl.rst    |  9 ++++++++-
> >  .../userspace-api/media/videodev2.h.rst.exceptions  |  1 +
> >  drivers/media/v4l2-core/v4l2-ctrls-api.c            |  5 ++++-
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c           |  2 ++
> >  include/uapi/linux/videodev2.h                      |  1 +
> >  6 files changed, 23 insertions(+), 8 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > index e8475f9fd2cf..e7e5d78dc11e 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > @@ -162,13 +162,13 @@ still cause this situation.
> >      * - __s32
> >        - ``value``
> >        - New value or current value. Valid if this control is not of type
> > -	``V4L2_CTRL_TYPE_INTEGER64`` and ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is
> > -	not set.
> > +	``V4L2_CTRL_TYPE_INTEGER64``, ``V4L2_CTRL_TYPE_FIXED_POINT`` and
> > +	``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is not set.
> >      * - __s64
> >        - ``value64``
> >        - New value or current value. Valid if this control is of type
> > -	``V4L2_CTRL_TYPE_INTEGER64`` and ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is
> > -	not set.
> > +	``V4L2_CTRL_TYPE_INTEGER64``, ``V4L2_CTRL_TYPE_FIXED_POINT`` and
> > +	``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is not set.
> >      * - char *
> >        - ``string``
> >        - A pointer to a string. Valid if this control is of type
> > @@ -193,8 +193,9 @@ still cause this situation.
> >      * - __s64 *
> >        - ``p_s64``
> >        - A pointer to a matrix control of signed 64-bit values. Valid if
> > -        this control is of type ``V4L2_CTRL_TYPE_INTEGER64`` and
> > -        ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is set.
> > +        this control is of type ``V4L2_CTRL_TYPE_INTEGER64``,
> > +        ``V4L2_CTRL_TYPE_FIXED_POINT`` and ``V4L2_CTRL_FLAG_HAS_PAYLOAD``
> > +        is set.
> >      * - struct :c:type:`v4l2_area` *
> >        - ``p_area``
> >        - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> > index 4d38acafe8e1..f3995ec57044 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> > @@ -235,7 +235,8 @@ See also the examples in :ref:`control`.
> >        - ``default_value``
> >        - The default value of a ``V4L2_CTRL_TYPE_INTEGER``, ``_INTEGER64``,
> >  	``_BOOLEAN``, ``_BITMASK``, ``_MENU``, ``_INTEGER_MENU``, ``_U8``
> > -	or ``_U16`` control. Not valid for other types of controls.
> > +	``_FIXED_POINT`` or ``_U16`` control. Not valid for other types of
> > +	controls.
> >  
> >  	.. note::
> >  
> > @@ -549,6 +550,12 @@ See also the examples in :ref:`control`.
> >        - n/a
> >        - A struct :c:type:`v4l2_ctrl_av1_film_grain`, containing AV1 Film Grain
> >          parameters for stateless video decoders.
> > +    * - ``V4L2_CTRL_TYPE_FIXED_POINT``
> > +      - any
> > +      - any
> > +      - any
> > +      - A 64-bit integer valued control, containing parameter which is
> > +        Q31.32 format.
> >  
> >  .. raw:: latex
> >  
> > diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > index e61152bb80d1..2faa5a2015eb 100644
> > --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > @@ -167,6 +167,7 @@ replace symbol V4L2_CTRL_TYPE_AV1_SEQUENCE :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_AV1_FRAME :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_AV1_FILM_GRAIN :c:type:`v4l2_ctrl_type`
> > +replace symbol V4L2_CTRL_TYPE_FIXED_POINT :c:type:`v4l2_ctrl_type`
> >  
> >  # V4L2 capability defines
> >  replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> > index 002ea6588edf..e6a0fb8d6791 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> > @@ -57,6 +57,7 @@ static int ptr_to_user(struct v4l2_ext_control *c,
> >  		return copy_to_user(c->string, ptr.p_char, len + 1) ?
> >  		       -EFAULT : 0;
> >  	case V4L2_CTRL_TYPE_INTEGER64:
> > +	case V4L2_CTRL_TYPE_FIXED_POINT:
> >  		c->value64 = *ptr.p_s64;
> >  		break;
> >  	default:
> > @@ -132,6 +133,7 @@ static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
> >  
> >  	switch (ctrl->type) {
> >  	case V4L2_CTRL_TYPE_INTEGER64:
> > +	case V4L2_CTRL_TYPE_FIXED_POINT:
> >  		*ctrl->p_new.p_s64 = c->value64;
> >  		break;
> >  	case V4L2_CTRL_TYPE_STRING:
> > @@ -540,7 +542,8 @@ static int validate_ctrls(struct v4l2_ext_controls *cs,
> >  		 */
> >  		if (ctrl->is_ptr)
> >  			continue;
> > -		if (ctrl->type == V4L2_CTRL_TYPE_INTEGER64)
> > +		if (ctrl->type == V4L2_CTRL_TYPE_INTEGER64 ||
> > +		    ctrl->type == V4L2_CTRL_TYPE_FIXED_POINT)
> >  			p_new.p_s64 = &cs->controls[i].value64;
> >  		else
> >  			p_new.p_s32 = &cs->controls[i].value;
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > index a662fb60f73f..9d50df0d9874 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > @@ -1187,6 +1187,7 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
> >  	case V4L2_CTRL_TYPE_INTEGER:
> >  		return ROUND_TO_RANGE(ptr.p_s32[idx], u32, ctrl);
> >  	case V4L2_CTRL_TYPE_INTEGER64:
> > +	case V4L2_CTRL_TYPE_FIXED_POINT:
> >  		/*
> >  		 * We can't use the ROUND_TO_RANGE define here due to
> >  		 * the u64 divide that needs special care.
> > @@ -1779,6 +1780,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
> >  	/* Prefill elem_size for all types handled by std_type_ops */
> >  	switch ((u32)type) {
> >  	case V4L2_CTRL_TYPE_INTEGER64:
> > +	case V4L2_CTRL_TYPE_FIXED_POINT:
> >  		elem_size = sizeof(s64);
> >  		break;
> >  	case V4L2_CTRL_TYPE_STRING:
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index cf8c44595a1d..9482ac66a675 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -1903,6 +1903,7 @@ enum v4l2_ctrl_type {
> >  	V4L2_CTRL_TYPE_STRING        = 7,
> >  	V4L2_CTRL_TYPE_BITMASK       = 8,
> >  	V4L2_CTRL_TYPE_INTEGER_MENU  = 9,
> > +	V4L2_CTRL_TYPE_FIXED_POINT   = 10,
> >  
> >  	/* Compound types are >= 0x0100 */
> >  	V4L2_CTRL_COMPOUND_TYPES     = 0x0100,

-- 
Regards,

Laurent Pinchart
