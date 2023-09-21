Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3AD7A93CB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 13:14:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d8Oht1nh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrt8904KSz3cGJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 21:14:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d8Oht1nh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrt7H6z6dz2yVh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 21:13:30 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2745cd2ba68so512354a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 04:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695294806; x=1695899606; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6Io+NqdH4bxbw7qedQ2WLW3wnG7KpfohNDHzRzQ7HQ=;
        b=d8Oht1nhpWW6yuGGBjllmrImpUw8hLclgCMuao651PSsYVUXN+0WJh3tNaGxmBoMKJ
         PXHlX/9F1r+RCRCpuK0TRHZLU/HIqFpCL6zOWgW0LejJMeO2M6H4I05MN/TlJLWV1Aut
         wsY7fvYqEFqAS36pfvNKiA9tqXRfT9pjn38QoVVoY0DtAkwV1XaTBAxqzeQpU60f8FiJ
         G37csg4Rq+fRLDdXh7pgvQwOgob6JVTH1zGEm0a69NmXP4YsJjcCpDpCqhxuXxcBhg8j
         yotxEIV6wCaKuQvI9nmwg3W1Nch6ykVh2QuyaSOXl422dGjh9LcO41myMddCig6eKdb1
         mXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695294806; x=1695899606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6Io+NqdH4bxbw7qedQ2WLW3wnG7KpfohNDHzRzQ7HQ=;
        b=wkIYNGjd58QjSYvzHvkb5x1imt2B5fWbetSGcSbw/n5NmUVh19m1oJCG7alQBmvLjz
         NXFdMeKBVZTvnmn7Obicqk5p2iZu44kP/y0I11vSiVoYbDdOZo4ib8gBZvyEMTVMde9P
         eexLT8muZ7uafU1WBZbLVI4sZWWdV6nvRJ+4gicpiLRg05Vyx/JK0VSemhYOAS6b1PCX
         Wr2Fn7JRFciM4weh57wKp8+zdiDjoGC7r1aSANoKC+VZbxxlFJb3+m5YmRQitpY5wmb2
         TcJwkT+5FZ0briAKCre65bbRjazoIX/ynHOmjvJhEpQ/+tskwSuikwvqMtR7lYXM282G
         9z3g==
X-Gm-Message-State: AOJu0YxWKTrt9b9RsErr9u30kDAS3xIbbnD2QyQJA5IlaRIcqjNhhKkF
	5KEubzYgkfQ3gN+MXcjsiuBjy+iihIajYD4xe4Q=
X-Google-Smtp-Source: AGHT+IFd83OFEN20e4ml9L8pmlvbvhS2daJ1R+Y7BWCut39c7qxVh2xC1k3KYOAJpyayzaGsCncOE3w/BFNte+w5Fc8=
X-Received: by 2002:a17:90b:390a:b0:26d:2bac:a0bb with SMTP id
 ob10-20020a17090b390a00b0026d2baca0bbmr4967326pjb.6.1695294806097; Thu, 21
 Sep 2023 04:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <1695202370-24678-1-git-send-email-shengjiu.wang@nxp.com>
 <1695202370-24678-10-git-send-email-shengjiu.wang@nxp.com>
 <fbedcbf1-d925-47d6-b9fb-c9e15263c117@xs4all.nl> <CAA+D8APyNGFSry1GUv6TOW0nKYHKSwQd5bTcRNuT7cu0Xf8eUA@mail.gmail.com>
 <5292ce53-643e-44f0-b2cc-cb66efee9712@xs4all.nl>
In-Reply-To: <5292ce53-643e-44f0-b2cc-cb66efee9712@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 21 Sep 2023 19:13:14 +0800
Message-ID: <CAA+D8AMZN59uTRs2sOrSeVb5AGopTzurNVCTNwJOVPahfEXd+w@mail.gmail.com>
Subject: Re: [RFC PATCH v4 09/11] media: uapi: Add V4L2_CID_USER_IMX_ASRC_RATIO_MOD
 control
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org, broonie@kernel.org, sakari.ailus@iki.fi, perex@perex.cz, mchehab@kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 21, 2023 at 3:11=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 21/09/2023 08:55, Shengjiu Wang wrote:
> > On Wed, Sep 20, 2023 at 6:19=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.n=
l> wrote:
> >>
> >> On 20/09/2023 11:32, Shengjiu Wang wrote:
> >>> The input clock and output clock may not be the accurate
> >>> rate as the sample rate, there is some drift, so the convert
> >>> ratio of i.MX ASRC module need to be changed according to
> >>> actual clock rate.
> >>>
> >>> Add V4L2_CID_USER_IMX_ASRC_RATIO_MOD control for user to
> >>> adjust the ratio.
> >>>
> >>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>> ---
> >>>  Documentation/userspace-api/media/v4l/control.rst | 5 +++++
> >>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 1 +
> >>>  include/uapi/linux/v4l2-controls.h                | 1 +
> >>>  3 files changed, 7 insertions(+)
> >>>
> >>> diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Docu=
mentation/userspace-api/media/v4l/control.rst
> >>> index 4463fce694b0..2bc175900a34 100644
> >>> --- a/Documentation/userspace-api/media/v4l/control.rst
> >>> +++ b/Documentation/userspace-api/media/v4l/control.rst
> >>> @@ -318,6 +318,11 @@ Control IDs
> >>>      depending on particular custom controls should check the driver =
name
> >>>      and version, see :ref:`querycap`.
> >>>
> >>> +.. _v4l2-audio-imx:
> >>> +
> >>> +``V4L2_CID_USER_IMX_ASRC_RATIO_MOD``
> >>> +    sets the rasampler ratio modifier of i.MX asrc module.
> >>
> >> rasampler -> resampler (I think?)
> >>
> >> This doesn't document at all what the type of the control is or how to=
 interpret it.
> >>
> >>> +
> >>>  Applications can enumerate the available controls with the
> >>>  :ref:`VIDIOC_QUERYCTRL` and
> >>>  :ref:`VIDIOC_QUERYMENU <VIDIOC_QUERYCTRL>` ioctls, get and set a
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/medi=
a/v4l2-core/v4l2-ctrls-defs.c
> >>> index 8696eb1cdd61..16f66f66198c 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>> @@ -1242,6 +1242,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >>>       case V4L2_CID_COLORIMETRY_CLASS:        return "Colorimetry Con=
trols";
> >>>       case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:               return =
"HDR10 Content Light Info";
> >>>       case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:      return =
"HDR10 Mastering Display";
> >>> +     case V4L2_CID_USER_IMX_ASRC_RATIO_MOD:                  return =
"ASRC RATIO MOD";
> >>
> >> Let's stay consistent with the other control names:
> >>
> >> "ASRC Ratio Modifier"
> >>
> >> But if this is a driver specific control, then this doesn't belong her=
e.
> >>
> >> Driver specific controls are defined in the driver itself, including t=
his
> >> description.
> >>
> >> Same for the control documentation: if it is driver specific, then tha=
t
> >> typically is documented either in a driver-specific public header, or
> >> possibly in driver-specific documentation (Documentation/admin-guide/m=
edia/).
> >>
> >> But is this imx specific? Wouldn't other similar devices need this?
> >
> > It is imx specific.
>
> Why? I'm not opposed to this, but I wonder if you looked at datasheets of
> similar devices from other vendors: would they use something similar?

I tried to find some datasheets for other vendors, but failed to find them.
So I don't know how they implement this part.

Ratio modification on i.MX is to modify the configured ratio.
For example, the input rate is 44.1kHz,  output rate is 48kHz,
configured ratio =3D 441/480,   the ratio modification is to modify
the fractional part of (441/480) with small steps.  because the
input clock or output clock has drift in the real hardware.
The ratio modification is signed value, it is added to configured
ratio.

In our case, we have some sysfs interface for user to get the
clock from input audio device and output audio device, user
need to calculate the ratio dynamically , then configure the
modification to driver

May be other vendors has similar implementation. or make
the definition be generic is an option.

best regards
wang shengjiu

>
> And the very short description you gave in the commit log refers to input
> and output clock: how would userspace know those clock frequencies? In
> other words, what information does userspace need in order to set this
> control correctly? And is that information actually available? How would
> you use this control?
>
> I don't really understand how this is supposed to be used.
>
> >
> > Does this mean that I need to create a header file in include/uapi/linu=
x
> > folder to put this definition?  I just hesitate if this is necessary.
>
> Yes, put it there. There are some examples of this already:
>
> include/uapi/linux/aspeed-video.h
> include/uapi/linux/max2175.h
>
> >
> > There is folder Documentation/userspace-api/media/drivers/ for drivers
> > Should this document in this folder, not in the
> > Documentation/admin-guide/media/?
>
> Yes, you are correct. For the headers above, the corresponding documentat=
ion
> is in:
>
> Documentation/userspace-api/media/drivers/aspeed-video.rst
> Documentation/userspace-api/media/drivers/max2175.rst
>
> So you have some examples as reference.
>
> Frankly, what is in admin-guide and in userspace-api is a bit random, it
> probably could use a cleanup.
>
> Regards,
>
>         Hans
>
> >
> > Best regards
> > Wang shengjiu
> >>
> >>>       default:
> >>>               return NULL;
> >>>       }
> >>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/=
v4l2-controls.h
> >>> index c3604a0a3e30..b1c319906d12 100644
> >>> --- a/include/uapi/linux/v4l2-controls.h
> >>> +++ b/include/uapi/linux/v4l2-controls.h
> >>> @@ -162,6 +162,7 @@ enum v4l2_colorfx {
> >>>  /* The base for the imx driver controls.
> >>>   * We reserve 16 controls for this driver. */
> >>>  #define V4L2_CID_USER_IMX_BASE                       (V4L2_CID_USER_=
BASE + 0x10b0)
> >>> +#define V4L2_CID_USER_IMX_ASRC_RATIO_MOD     (V4L2_CID_USER_IMX_BASE=
 + 0)
> >>>
> >>>  /*
> >>>   * The base for the atmel isc driver controls.
> >>
> >> Regards,
> >>
> >>         Hans
>
