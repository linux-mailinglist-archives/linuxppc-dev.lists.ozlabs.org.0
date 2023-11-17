Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0E97EF37D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 14:09:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=PFdCi1WF;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=meesny header.b=JycuFiMl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWy0V6byNz3dL8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 00:09:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=PFdCi1WF;
	dkim=pass (1024-bit key; secure) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=meesny header.b=JycuFiMl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iki.fi (client-ip=185.185.170.37; helo=lahtoruutu.iki.fi; envelope-from=sakari.ailus@iki.fi; receiver=lists.ozlabs.org)
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWxzY2LQJz30gn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 00:08:25 +1100 (AEDT)
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4SWxzH62Zqz49Q3F
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 15:08:08 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1700226491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j73TzZWkh4ztuF5gwXyULN3t9yKeHQn5nD1gjZf1ChI=;
	b=PFdCi1WF57XldbB/4K6bLevgEA6D/moVT8zUFJOo+FDbFW9r6OYHxGyeg9EDKjM71OXAl5
	Ar7iY3xIWZbgoiO5NzCTk5gwGw02tv960Gq/ZV21+1/aNvW9L2MiOyl1M66ghMBqts5Ghx
	EfSOQ0k3NCi21WSCoYQsTXOs8hpSsdxjbQ6MVISj9nnxNnkrz3Csu73NntgNHhlZP+npso
	K6fzc9iWrcX36Pbx2RWYBQTd2PhzRHLjZ1yWGSoo6/p4pqpyN4Sgsgc7llDePIvFPteNcU
	CwJIlWdsIwxPIeAGS7R/PSbThkrmVoHSM/3TNt2msaZl5G8KXwSqJIWt98SnDA==
Received: from hillosipuli.retiisi.eu (185-9-10-242.cust.suomicom.net [185.9.10.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4SWxym4MQGzyT1;
	Fri, 17 Nov 2023 15:07:41 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1700226466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j73TzZWkh4ztuF5gwXyULN3t9yKeHQn5nD1gjZf1ChI=;
	b=JycuFiMl4abLaHyS9jy1KljuIGIssbLwEvAwRDpbkxHZpstmZgK5eqGmSVk7Nk7l3sONfB
	iB315CarGishGDetMyjodUchW3lvHyVLsdYZvF7aYI+7dN1A++aPXmhY4YNwZqF6DI913W
	X5SiJQg5pJjMyd+I+9ChltTTqQ5/blM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1700226466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j73TzZWkh4ztuF5gwXyULN3t9yKeHQn5nD1gjZf1ChI=;
	b=lYy9thrgYSTkpSJTUBe4SHxgBwJIbJ8O2cw5N59MTj7oLFvmKInWHDPqrnisjgXqExncHI
	OPxzTmQy17LFBiWt9RLpcSj3LTri5RXZ+nyLgh08eePvPmGBYnkyGs4icnqNrKJO3RNAzQ
	EQDXpwJC1psWSAMZWbSB9zNeUD7u/FQ=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1700226466; a=rsa-sha256; cv=none;
	b=LUGwMCIUUuaunrg45mZ0lU60ivZQPf2iQXfGe9vRi95Fl+KZxW/P1+5XFMLr/J8dvA72/t
	87TQRGifUPTg70D7hEC0157VdgajRsk55VvPht/xwVymz5G5KmZ8nwhZouM6UmZ3iOEnqE
	dNLL2dyCq0IcYRQlheW1yf6STxEq0D8=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id BAAAE634C94;
	Fri, 17 Nov 2023 15:07:37 +0200 (EET)
Date: Fri, 17 Nov 2023 13:07:37 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v9 10/15] media: uapi: Add V4L2_CTRL_TYPE_FIXED_POINT
Message-ID: <ZVdlmRlpW7ebrjQO@valkosipuli.retiisi.eu>
References: <da6efe14-c00d-4bf4-bf61-dd4ed39c5c60@xs4all.nl>
 <20231113124412.GA18974@pendragon.ideasonboard.com>
 <b35601f7-8bb2-4317-a8f7-6fbf81572943@xs4all.nl>
 <20231115105518.GD13826@pendragon.ideasonboard.com>
 <a67491c0-4fdf-4472-852c-e75f5e1d67af@xs4all.nl>
 <20231115114931.GE13826@pendragon.ideasonboard.com>
 <CAAFQd5BkCR=tYvmfjkOeTnjnccmURt8kEtiRee9CYqcz+FGHfg@mail.gmail.com>
 <7626e0f8-ce31-469e-b49c-f2fba664756f@xs4all.nl>
 <CAA+D8ANb6A9eh=MQR9+7sZi5jet+7RSHt6TdZqPz5EK6pBs3mA@mail.gmail.com>
 <6badc94c-c414-40d7-a9d7-8b3fc86d8d98@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6badc94c-c414-40d7-a9d7-8b3fc86d8d98@xs4all.nl>
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, nicoleotsuka@gmail.com, broonie@kernel.org, Tomasz Figa <tfiga@chromium.org>, m.szyprowski@samsung.com, mchehab@kernel.org, Shengjiu Wang <shengjiu.wang@gmail.com>, perex@perex.cz, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Hans,

Thank you for the patch.

On Fri, Nov 17, 2023 at 01:07:44PM +0100, Hans Verkuil wrote:
> Here is an RFC patch adding support for 'fraction_bits'. It's lacking
> documentation, but it can be used for testing.
> 
> It was rather a pain logging fixed point number in a reasonable format,
> but I think it is OK.
> 
> In userspace (where you can use floating point) it is a lot easier:
> 
> printf("%.*g\n", fraction_bits, (double)v * (1.0 / (1ULL << fraction_bits)));

I wonder if we could add a printk() format specifier for this. Doesn't need
to be done right now though, just an idea.

> 
> I decided to only expose fraction_bits in struct v4l2_query_ext_ctrl.
> I could add it to struct v4l2_queryctrl, but I did not think that was
> necessary. Other opinions are welcome.
> 
> In the meantime, let me know if this works for your patch series. If it
> does, then I can clean this up.
> 
> Regards,
> 
> 	Hans
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-api.c  |  1 +
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 72 +++++++++++++++++++----
>  include/media/v4l2-ctrls.h                |  7 ++-
>  include/uapi/linux/videodev2.h            | 20 ++++++-
>  4 files changed, 85 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> index 002ea6588edf..3132df315b17 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> @@ -1101,6 +1101,7 @@ int v4l2_query_ext_ctrl(struct v4l2_ctrl_handler *hdl, struct v4l2_query_ext_ctr
>  	qc->elems = ctrl->elems;
>  	qc->nr_of_dims = ctrl->nr_of_dims;
>  	memcpy(qc->dims, ctrl->dims, qc->nr_of_dims * sizeof(qc->dims[0]));
> +	qc->fraction_bits = ctrl->fraction_bits;
>  	qc->minimum = ctrl->minimum;
>  	qc->maximum = ctrl->maximum;
>  	qc->default_value = ctrl->default_value;
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index a662fb60f73f..0e08a371af5c 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -252,12 +252,42 @@ void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_type_op_init);
> 
> +static void v4l2_ctrl_log_fp(s64 v, unsigned int fraction_bits)
> +{
> +	s64 i = v4l2_fp_integer(v, fraction_bits);
> +	s64 f = v4l2_fp_fraction(v, fraction_bits);
> +
> +	if (!f) {
> +		pr_cont("%lld", i);
> +	} else if (fraction_bits < 20) {
> +		u64 div = 1ULL << fraction_bits;
> +
> +		if (!i && f < 0)
> +			pr_cont("-%lld/%llu", -f, div);
> +		else if (!i)
> +			pr_cont("%lld/%llu", f, div);
> +		else if (i < 0 || f < 0)
> +			pr_cont("-%lld-%llu/%llu", -i, -f, div);
> +		else
> +			pr_cont("%lld+%llu/%llu", i, f, div);
> +	} else {
> +		if (!i && f < 0)
> +			pr_cont("-%lld/(2^%u)", -f, fraction_bits);
> +		else if (!i)
> +			pr_cont("%lld/(2^%u)", f, fraction_bits);
> +		else if (i < 0 || f < 0)
> +			pr_cont("-%lld-%llu/(2^%u)", -i, -f, fraction_bits);
> +		else
> +			pr_cont("%lld+%llu/(2^%u)", i, f, fraction_bits);
> +	}
> +}
> +
>  void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
>  {
>  	union v4l2_ctrl_ptr ptr = ctrl->p_cur;
> 
>  	if (ctrl->is_array) {
> -		unsigned i;
> +		unsigned int i;
> 
>  		for (i = 0; i < ctrl->nr_of_dims; i++)
>  			pr_cont("[%u]", ctrl->dims[i]);
> @@ -266,7 +296,10 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
> 
>  	switch (ctrl->type) {
>  	case V4L2_CTRL_TYPE_INTEGER:
> -		pr_cont("%d", *ptr.p_s32);
> +		if (!ctrl->fraction_bits)
> +			pr_cont("%d", *ptr.p_s32);
> +		else
> +			v4l2_ctrl_log_fp(*ptr.p_s32, ctrl->fraction_bits);
>  		break;
>  	case V4L2_CTRL_TYPE_BOOLEAN:
>  		pr_cont("%s", *ptr.p_s32 ? "true" : "false");
> @@ -281,19 +314,31 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
>  		pr_cont("0x%08x", *ptr.p_s32);
>  		break;
>  	case V4L2_CTRL_TYPE_INTEGER64:
> -		pr_cont("%lld", *ptr.p_s64);
> +		if (!ctrl->fraction_bits)
> +			pr_cont("%lld", *ptr.p_s64);
> +		else
> +			v4l2_ctrl_log_fp(*ptr.p_s64, ctrl->fraction_bits);
>  		break;
>  	case V4L2_CTRL_TYPE_STRING:
>  		pr_cont("%s", ptr.p_char);
>  		break;
>  	case V4L2_CTRL_TYPE_U8:
> -		pr_cont("%u", (unsigned)*ptr.p_u8);
> +		if (!ctrl->fraction_bits)
> +			pr_cont("%u", (unsigned int)*ptr.p_u8);
> +		else
> +			v4l2_ctrl_log_fp((unsigned int)*ptr.p_u8, ctrl->fraction_bits);
>  		break;
>  	case V4L2_CTRL_TYPE_U16:
> -		pr_cont("%u", (unsigned)*ptr.p_u16);
> +		if (!ctrl->fraction_bits)
> +			pr_cont("%u", (unsigned int)*ptr.p_u16);
> +		else
> +			v4l2_ctrl_log_fp((unsigned int)*ptr.p_u16, ctrl->fraction_bits);
>  		break;
>  	case V4L2_CTRL_TYPE_U32:
> -		pr_cont("%u", (unsigned)*ptr.p_u32);
> +		if (!ctrl->fraction_bits)
> +			pr_cont("%u", (unsigned int)*ptr.p_u32);
> +		else
> +			v4l2_ctrl_log_fp((unsigned int)*ptr.p_u32, ctrl->fraction_bits);
>  		break;
>  	case V4L2_CTRL_TYPE_H264_SPS:
>  		pr_cont("H264_SPS");
> @@ -1752,7 +1797,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  			u32 id, const char *name, enum v4l2_ctrl_type type,
>  			s64 min, s64 max, u64 step, s64 def,
>  			const u32 dims[V4L2_CTRL_MAX_DIMS], u32 elem_size,
> -			u32 flags, const char * const *qmenu,
> +			u32 fraction_bits, u32 flags, const char * const *qmenu,
>  			const s64 *qmenu_int, const union v4l2_ctrl_ptr p_def,
>  			void *priv)
>  {
> @@ -1939,6 +1984,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  	ctrl->name = name;
>  	ctrl->type = type;
>  	ctrl->flags = flags;
> +	ctrl->fraction_bits = fraction_bits;
>  	ctrl->minimum = min;
>  	ctrl->maximum = max;
>  	ctrl->step = step;
> @@ -2037,7 +2083,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
>  	ctrl = v4l2_ctrl_new(hdl, cfg->ops, cfg->type_ops, cfg->id, name,
>  			type, min, max,
>  			is_menu ? cfg->menu_skip_mask : step, def,
> -			cfg->dims, cfg->elem_size,
> +			cfg->dims, cfg->elem_size, cfg->fraction_bits,
>  			flags, qmenu, qmenu_int, cfg->p_def, priv);
>  	if (ctrl)
>  		ctrl->is_private = cfg->is_private;
> @@ -2062,7 +2108,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
>  		return NULL;
>  	}
>  	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> -			     min, max, step, def, NULL, 0,
> +			     min, max, step, def, NULL, 0, 0,
>  			     flags, NULL, NULL, ptr_null, NULL);
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_new_std);
> @@ -2095,7 +2141,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
>  		return NULL;
>  	}
>  	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> -			     0, max, mask, def, NULL, 0,
> +			     0, max, mask, def, NULL, 0, 0,
>  			     flags, qmenu, qmenu_int, ptr_null, NULL);
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_new_std_menu);
> @@ -2127,7 +2173,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
>  		return NULL;
>  	}
>  	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> -			     0, max, mask, def, NULL, 0,
> +			     0, max, mask, def, NULL, 0, 0,
>  			     flags, qmenu, NULL, ptr_null, NULL);
> 
>  }
> @@ -2149,7 +2195,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
>  		return NULL;
>  	}
>  	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> -			     min, max, step, def, NULL, 0,
> +			     min, max, step, def, NULL, 0, 0,
>  			     flags, NULL, NULL, p_def, NULL);
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_new_std_compound);
> @@ -2173,7 +2219,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
>  		return NULL;
>  	}
>  	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> -			     0, max, 0, def, NULL, 0,
> +			     0, max, 0, def, NULL, 0, 0,
>  			     flags, NULL, qmenu_int, ptr_null, NULL);
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 59679a42b3e7..c35514c5bf88 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -211,7 +211,8 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
>   *		except for dynamic arrays. In that case it is in the range of
>   *		1 to @p_array_alloc_elems.
>   * @dims:	The size of each dimension.
> - * @nr_of_dims:The number of dimensions in @dims.
> + * @nr_of_dims: The number of dimensions in @dims.
> + * @fraction_bits: The number of fraction bits for fixed point values.
>   * @menu_skip_mask: The control's skip mask for menu controls. This makes it
>   *		easy to skip menu items that are not valid. If bit X is set,
>   *		then menu item X is skipped. Of course, this only works for
> @@ -228,6 +229,7 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
>   *		:math:`ceil(\frac{maximum - minimum}{step}) + 1`.
>   *		Used only if the @type is %V4L2_CTRL_TYPE_INTEGER_MENU.
>   * @flags:	The control's flags.
> + * @fraction_bits: The number of fraction bits for fixed point values.
>   * @priv:	The control's private pointer. For use by the driver. It is
>   *		untouched by the control framework. Note that this pointer is
>   *		not freed when the control is deleted. Should this be needed
> @@ -286,6 +288,7 @@ struct v4l2_ctrl {
>  	u32 new_elems;
>  	u32 dims[V4L2_CTRL_MAX_DIMS];
>  	u32 nr_of_dims;
> +	u32 fraction_bits;
>  	union {
>  		u64 step;
>  		u64 menu_skip_mask;
> @@ -426,6 +429,7 @@ struct v4l2_ctrl_handler {
>   * @dims:	The size of each dimension.
>   * @elem_size:	The size in bytes of the control.
>   * @flags:	The control's flags.
> + * @fraction_bits: The number of fraction bits for fixed point values.
>   * @menu_skip_mask: The control's skip mask for menu controls. This makes it
>   *		easy to skip menu items that are not valid. If bit X is set,
>   *		then menu item X is skipped. Of course, this only works for
> @@ -455,6 +459,7 @@ struct v4l2_ctrl_config {
>  	u32 dims[V4L2_CTRL_MAX_DIMS];
>  	u32 elem_size;
>  	u32 flags;
> +	u32 fraction_bits;
>  	u64 menu_skip_mask;
>  	const char * const *qmenu;
>  	const s64 *qmenu_int;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index c3d4e490ce7c..26ecac19722a 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1944,9 +1944,27 @@ struct v4l2_query_ext_ctrl {
>  	__u32                elems;
>  	__u32                nr_of_dims;
>  	__u32                dims[V4L2_CTRL_MAX_DIMS];
> -	__u32		     reserved[32];
> +	__u32                fraction_bits;

u8 would suffice. Not that we'd be short of space but still...

> +	__u32		     reserved[31];
>  };
> 
> +static inline __s64 v4l2_fp_compose(__s64 i, __s64 f, unsigned int fraction_bits)
> +{
> +	return (i << fraction_bits) + f;
> +}
> +
> +static inline __s64 v4l2_fp_integer(__s64 v, unsigned int fraction_bits)
> +{
> +	return v / (1LL << fraction_bits);

Why not just:

	return v >> fraction_bits;

I'd use macros so you could use whatever control types with this without
casting. E.g.

#define V4L2_FP_INTEGER(v, fraction_bits) ((v) >> fraction_bits)

A more generic way to expose this could be to have base and exponent, the
base being 2 in this case. Just an idea. This would of course be a little
bit more difficult to use.

> +}
> +
> +static inline __s64 v4l2_fp_fraction(__s64 v, unsigned int fraction_bits)
> +{
> +	__u64 mask = (1ULL << fraction_bits) - 1;
> +
> +	return v < 0 ? -((-v) & mask) : (v & mask);
> +}
> +
>  /*  Used in the VIDIOC_QUERYMENU ioctl for querying menu items */
>  struct v4l2_querymenu {
>  	__u32		id;

-- 
Kind regards,

Sakari Ailus
