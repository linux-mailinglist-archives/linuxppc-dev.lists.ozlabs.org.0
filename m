Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E229C7F0D96
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 09:31:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TAFpHpnA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYghw5tPZz3cmg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 19:31:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TAFpHpnA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYgh33bb9z2xTm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 19:30:58 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1cc1ee2d8dfso36502455ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 00:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700469054; x=1701073854; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8pLvrLgD2ZEhHiQ0cj5bgUPnbB4UjLNecxwJOC5wVk=;
        b=TAFpHpnAugYCBgpL3Pl/v9OI6nNhz9vZCSrxcUwgRikHVQ2v0y/Hs7BznQA1UpCvxh
         EJVV8VRmW4AUYBKcHRrzMR2s1Iblz3Ur0dJA5/oCmwGfAMi7xwj2sMkdrk8QQdVOWk0U
         Rrt9HXqoZUKR4nHe2d0FriLabhmkhG1xJMxJxt1CPtf2YZc9yzxDU6/yGOpp5OlWInog
         ZoqEzYiIrHANiQmMvtapihnkwe2IZ3otwVw0H0el6gUDbyyIoeEZPdH3akMmDCFOQyH+
         XmuUCjspk5FrVvQjJAuxCHFeJyZfcWLJA2PYCOyBrzev+C9emSD2lAdCO6yQK/t1aiYH
         ggYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700469054; x=1701073854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8pLvrLgD2ZEhHiQ0cj5bgUPnbB4UjLNecxwJOC5wVk=;
        b=Apdm5H2DZEQGnkKRNMGL/9VLlhjwW2nmrsebqgX8DpJOh1MoKk8Yd5899v8+1VZ7V8
         aihf7+Fv9MobK1JCVKHutFqkoV5/6w4V2164TyYYBkvfGlXfZ+ZxfKury5Spk/hBP01p
         uBYVsYaA+AFTB6AOn+g2U9zwmZjVSyV1UMF5h463S+rJwQsOGxoKME8xKG6M1HnXlCA8
         zRulnolG1VTZf5hA65YidUsEMV7zdEeGEBbsggaIEwHQc96hkZFZq2tTmIy23i0JqNnO
         yavA2UCAIBruX3QmkjnUbkfE6WOsTiPjxdaX8u8cSSj8uFrv2QGR6sMTJZwJPPtYG+Il
         AoOQ==
X-Gm-Message-State: AOJu0YzgT2q7kd+0fVkdwfX6oOjffEwKtV9VQcUEYNl74Zs8sshxO3Qo
	rjB9DG99c0XwhlH8umVJbb2wa2k0zNk3VmJiFTA=
X-Google-Smtp-Source: AGHT+IEntfnZrM2bVRFYTSrss3tnE305+o84BHnyJmsaKP/syGgR6XudGSoxXotVzzZaAkkEfPaMJel6jFwHZnGGwqY=
X-Received: by 2002:a17:90b:3886:b0:283:2932:e912 with SMTP id
 mu6-20020a17090b388600b002832932e912mr7800222pjb.28.1700469053767; Mon, 20
 Nov 2023 00:30:53 -0800 (PST)
MIME-Version: 1.0
References: <6a3e7eb9-505c-4cfb-8a86-a8947a2e44d5@xs4all.nl>
 <20231113110754.GB24338@pendragon.ideasonboard.com> <3e898664-cbfc-4892-9765-37b66891643b@xs4all.nl>
 <ZVIIc-fi32ZxIi-p@valkosipuli.retiisi.eu> <20231113114357.GD24338@pendragon.ideasonboard.com>
 <da6efe14-c00d-4bf4-bf61-dd4ed39c5c60@xs4all.nl> <20231113124412.GA18974@pendragon.ideasonboard.com>
 <b35601f7-8bb2-4317-a8f7-6fbf81572943@xs4all.nl> <20231115105518.GD13826@pendragon.ideasonboard.com>
 <a67491c0-4fdf-4472-852c-e75f5e1d67af@xs4all.nl> <20231115114931.GE13826@pendragon.ideasonboard.com>
 <CAAFQd5BkCR=tYvmfjkOeTnjnccmURt8kEtiRee9CYqcz+FGHfg@mail.gmail.com>
 <7626e0f8-ce31-469e-b49c-f2fba664756f@xs4all.nl> <CAA+D8ANb6A9eh=MQR9+7sZi5jet+7RSHt6TdZqPz5EK6pBs3mA@mail.gmail.com>
 <6badc94c-c414-40d7-a9d7-8b3fc86d8d98@xs4all.nl>
In-Reply-To: <6badc94c-c414-40d7-a9d7-8b3fc86d8d98@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 20 Nov 2023 16:30:42 +0800
Message-ID: <CAA+D8ANeGmFz-bcfJAJbPFNVfH5T045ijLebm1c8hbtEKdTVfg@mail.gmail.com>
Subject: Re: [PATCH v9 10/15] media: uapi: Add V4L2_CTRL_TYPE_FIXED_POINT
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
Cc: alsa-devel@alsa-project.org, Tomasz Figa <tfiga@chromium.org>, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, nicoleotsuka@gmail.com, broonie@kernel.org, Sakari Ailus <sakari.ailus@iki.fi>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, m.szyprowski@samsung.com, mchehab@kernel.org, festevam@gmail.com, perex@perex.cz, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 17, 2023 at 8:07=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> Here is an RFC patch adding support for 'fraction_bits'. It's lacking
> documentation, but it can be used for testing.
>
> It was rather a pain logging fixed point number in a reasonable format,
> but I think it is OK.
>
> In userspace (where you can use floating point) it is a lot easier:
>
> printf("%.*g\n", fraction_bits, (double)v * (1.0 / (1ULL << fraction_bits=
)));
>
> I decided to only expose fraction_bits in struct v4l2_query_ext_ctrl.
> I could add it to struct v4l2_queryctrl, but I did not think that was
> necessary. Other opinions are welcome.
>
> In the meantime, let me know if this works for your patch series. If it
> does, then I can clean this up.

Thanks.  It works for me.  What I have done are:
1. drop FIXED_POINT
2. use v4l2_ctrl_new_custom

Best regards
Wang shengjiu

>
> Regards,
>
>         Hans
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-api.c  |  1 +
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 72 +++++++++++++++++++----
>  include/media/v4l2-ctrls.h                |  7 ++-
>  include/uapi/linux/videodev2.h            | 20 ++++++-
>  4 files changed, 85 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l=
2-core/v4l2-ctrls-api.c
> index 002ea6588edf..3132df315b17 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> @@ -1101,6 +1101,7 @@ int v4l2_query_ext_ctrl(struct v4l2_ctrl_handler *h=
dl, struct v4l2_query_ext_ctr
>         qc->elems =3D ctrl->elems;
>         qc->nr_of_dims =3D ctrl->nr_of_dims;
>         memcpy(qc->dims, ctrl->dims, qc->nr_of_dims * sizeof(qc->dims[0])=
);
> +       qc->fraction_bits =3D ctrl->fraction_bits;
>         qc->minimum =3D ctrl->minimum;
>         qc->maximum =3D ctrl->maximum;
>         qc->default_value =3D ctrl->default_value;
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index a662fb60f73f..0e08a371af5c 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -252,12 +252,42 @@ void v4l2_ctrl_type_op_init(const struct v4l2_ctrl =
*ctrl, u32 from_idx,
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_type_op_init);
>
> +static void v4l2_ctrl_log_fp(s64 v, unsigned int fraction_bits)
> +{
> +       s64 i =3D v4l2_fp_integer(v, fraction_bits);
> +       s64 f =3D v4l2_fp_fraction(v, fraction_bits);
> +
> +       if (!f) {
> +               pr_cont("%lld", i);
> +       } else if (fraction_bits < 20) {
> +               u64 div =3D 1ULL << fraction_bits;
> +
> +               if (!i && f < 0)
> +                       pr_cont("-%lld/%llu", -f, div);
> +               else if (!i)
> +                       pr_cont("%lld/%llu", f, div);
> +               else if (i < 0 || f < 0)
> +                       pr_cont("-%lld-%llu/%llu", -i, -f, div);
> +               else
> +                       pr_cont("%lld+%llu/%llu", i, f, div);
> +       } else {
> +               if (!i && f < 0)
> +                       pr_cont("-%lld/(2^%u)", -f, fraction_bits);
> +               else if (!i)
> +                       pr_cont("%lld/(2^%u)", f, fraction_bits);
> +               else if (i < 0 || f < 0)
> +                       pr_cont("-%lld-%llu/(2^%u)", -i, -f, fraction_bit=
s);
> +               else
> +                       pr_cont("%lld+%llu/(2^%u)", i, f, fraction_bits);
> +       }
> +}
> +
>  void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
>  {
>         union v4l2_ctrl_ptr ptr =3D ctrl->p_cur;
>
>         if (ctrl->is_array) {
> -               unsigned i;
> +               unsigned int i;
>
>                 for (i =3D 0; i < ctrl->nr_of_dims; i++)
>                         pr_cont("[%u]", ctrl->dims[i]);
> @@ -266,7 +296,10 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *c=
trl)
>
>         switch (ctrl->type) {
>         case V4L2_CTRL_TYPE_INTEGER:
> -               pr_cont("%d", *ptr.p_s32);
> +               if (!ctrl->fraction_bits)
> +                       pr_cont("%d", *ptr.p_s32);
> +               else
> +                       v4l2_ctrl_log_fp(*ptr.p_s32, ctrl->fraction_bits)=
;
>                 break;
>         case V4L2_CTRL_TYPE_BOOLEAN:
>                 pr_cont("%s", *ptr.p_s32 ? "true" : "false");
> @@ -281,19 +314,31 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *=
ctrl)
>                 pr_cont("0x%08x", *ptr.p_s32);
>                 break;
>         case V4L2_CTRL_TYPE_INTEGER64:
> -               pr_cont("%lld", *ptr.p_s64);
> +               if (!ctrl->fraction_bits)
> +                       pr_cont("%lld", *ptr.p_s64);
> +               else
> +                       v4l2_ctrl_log_fp(*ptr.p_s64, ctrl->fraction_bits)=
;
>                 break;
>         case V4L2_CTRL_TYPE_STRING:
>                 pr_cont("%s", ptr.p_char);
>                 break;
>         case V4L2_CTRL_TYPE_U8:
> -               pr_cont("%u", (unsigned)*ptr.p_u8);
> +               if (!ctrl->fraction_bits)
> +                       pr_cont("%u", (unsigned int)*ptr.p_u8);
> +               else
> +                       v4l2_ctrl_log_fp((unsigned int)*ptr.p_u8, ctrl->f=
raction_bits);
>                 break;
>         case V4L2_CTRL_TYPE_U16:
> -               pr_cont("%u", (unsigned)*ptr.p_u16);
> +               if (!ctrl->fraction_bits)
> +                       pr_cont("%u", (unsigned int)*ptr.p_u16);
> +               else
> +                       v4l2_ctrl_log_fp((unsigned int)*ptr.p_u16, ctrl->=
fraction_bits);
>                 break;
>         case V4L2_CTRL_TYPE_U32:
> -               pr_cont("%u", (unsigned)*ptr.p_u32);
> +               if (!ctrl->fraction_bits)
> +                       pr_cont("%u", (unsigned int)*ptr.p_u32);
> +               else
> +                       v4l2_ctrl_log_fp((unsigned int)*ptr.p_u32, ctrl->=
fraction_bits);
>                 break;
>         case V4L2_CTRL_TYPE_H264_SPS:
>                 pr_cont("H264_SPS");
> @@ -1752,7 +1797,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_=
ctrl_handler *hdl,
>                         u32 id, const char *name, enum v4l2_ctrl_type typ=
e,
>                         s64 min, s64 max, u64 step, s64 def,
>                         const u32 dims[V4L2_CTRL_MAX_DIMS], u32 elem_size=
,
> -                       u32 flags, const char * const *qmenu,
> +                       u32 fraction_bits, u32 flags, const char * const =
*qmenu,
>                         const s64 *qmenu_int, const union v4l2_ctrl_ptr p=
_def,
>                         void *priv)
>  {
> @@ -1939,6 +1984,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_=
ctrl_handler *hdl,
>         ctrl->name =3D name;
>         ctrl->type =3D type;
>         ctrl->flags =3D flags;
> +       ctrl->fraction_bits =3D fraction_bits;
>         ctrl->minimum =3D min;
>         ctrl->maximum =3D max;
>         ctrl->step =3D step;
> @@ -2037,7 +2083,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_=
ctrl_handler *hdl,
>         ctrl =3D v4l2_ctrl_new(hdl, cfg->ops, cfg->type_ops, cfg->id, nam=
e,
>                         type, min, max,
>                         is_menu ? cfg->menu_skip_mask : step, def,
> -                       cfg->dims, cfg->elem_size,
> +                       cfg->dims, cfg->elem_size, cfg->fraction_bits,
>                         flags, qmenu, qmenu_int, cfg->p_def, priv);
>         if (ctrl)
>                 ctrl->is_private =3D cfg->is_private;
> @@ -2062,7 +2108,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctr=
l_handler *hdl,
>                 return NULL;
>         }
>         return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> -                            min, max, step, def, NULL, 0,
> +                            min, max, step, def, NULL, 0, 0,
>                              flags, NULL, NULL, ptr_null, NULL);
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_new_std);
> @@ -2095,7 +2141,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l=
2_ctrl_handler *hdl,
>                 return NULL;
>         }
>         return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> -                            0, max, mask, def, NULL, 0,
> +                            0, max, mask, def, NULL, 0, 0,
>                              flags, qmenu, qmenu_int, ptr_null, NULL);
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_new_std_menu);
> @@ -2127,7 +2173,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(stru=
ct v4l2_ctrl_handler *hdl,
>                 return NULL;
>         }
>         return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> -                            0, max, mask, def, NULL, 0,
> +                            0, max, mask, def, NULL, 0, 0,
>                              flags, qmenu, NULL, ptr_null, NULL);
>
>  }
> @@ -2149,7 +2195,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct=
 v4l2_ctrl_handler *hdl,
>                 return NULL;
>         }
>         return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> -                            min, max, step, def, NULL, 0,
> +                            min, max, step, def, NULL, 0, 0,
>                              flags, NULL, NULL, p_def, NULL);
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_new_std_compound);
> @@ -2173,7 +2219,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l=
2_ctrl_handler *hdl,
>                 return NULL;
>         }
>         return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> -                            0, max, 0, def, NULL, 0,
> +                            0, max, 0, def, NULL, 0, 0,
>                              flags, NULL, qmenu_int, ptr_null, NULL);
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 59679a42b3e7..c35514c5bf88 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -211,7 +211,8 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl=
 *ctrl, void *priv);
>   *             except for dynamic arrays. In that case it is in the rang=
e of
>   *             1 to @p_array_alloc_elems.
>   * @dims:      The size of each dimension.
> - * @nr_of_dims:The number of dimensions in @dims.
> + * @nr_of_dims: The number of dimensions in @dims.
> + * @fraction_bits: The number of fraction bits for fixed point values.
>   * @menu_skip_mask: The control's skip mask for menu controls. This make=
s it
>   *             easy to skip menu items that are not valid. If bit X is s=
et,
>   *             then menu item X is skipped. Of course, this only works f=
or
> @@ -228,6 +229,7 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl=
 *ctrl, void *priv);
>   *             :math:`ceil(\frac{maximum - minimum}{step}) + 1`.
>   *             Used only if the @type is %V4L2_CTRL_TYPE_INTEGER_MENU.
>   * @flags:     The control's flags.
> + * @fraction_bits: The number of fraction bits for fixed point values.
>   * @priv:      The control's private pointer. For use by the driver. It =
is
>   *             untouched by the control framework. Note that this pointe=
r is
>   *             not freed when the control is deleted. Should this be nee=
ded
> @@ -286,6 +288,7 @@ struct v4l2_ctrl {
>         u32 new_elems;
>         u32 dims[V4L2_CTRL_MAX_DIMS];
>         u32 nr_of_dims;
> +       u32 fraction_bits;
>         union {
>                 u64 step;
>                 u64 menu_skip_mask;
> @@ -426,6 +429,7 @@ struct v4l2_ctrl_handler {
>   * @dims:      The size of each dimension.
>   * @elem_size: The size in bytes of the control.
>   * @flags:     The control's flags.
> + * @fraction_bits: The number of fraction bits for fixed point values.
>   * @menu_skip_mask: The control's skip mask for menu controls. This make=
s it
>   *             easy to skip menu items that are not valid. If bit X is s=
et,
>   *             then menu item X is skipped. Of course, this only works f=
or
> @@ -455,6 +459,7 @@ struct v4l2_ctrl_config {
>         u32 dims[V4L2_CTRL_MAX_DIMS];
>         u32 elem_size;
>         u32 flags;
> +       u32 fraction_bits;
>         u64 menu_skip_mask;
>         const char * const *qmenu;
>         const s64 *qmenu_int;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index c3d4e490ce7c..26ecac19722a 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1944,9 +1944,27 @@ struct v4l2_query_ext_ctrl {
>         __u32                elems;
>         __u32                nr_of_dims;
>         __u32                dims[V4L2_CTRL_MAX_DIMS];
> -       __u32                reserved[32];
> +       __u32                fraction_bits;
> +       __u32                reserved[31];
>  };
>
> +static inline __s64 v4l2_fp_compose(__s64 i, __s64 f, unsigned int fract=
ion_bits)
> +{
> +       return (i << fraction_bits) + f;
> +}
> +
> +static inline __s64 v4l2_fp_integer(__s64 v, unsigned int fraction_bits)
> +{
> +       return v / (1LL << fraction_bits);
> +}
> +
> +static inline __s64 v4l2_fp_fraction(__s64 v, unsigned int fraction_bits=
)
> +{
> +       __u64 mask =3D (1ULL << fraction_bits) - 1;
> +
> +       return v < 0 ? -((-v) & mask) : (v & mask);
> +}
> +
>  /*  Used in the VIDIOC_QUERYMENU ioctl for querying menu items */
>  struct v4l2_querymenu {
>         __u32           id;
> --
> 2.42.0
>
>
