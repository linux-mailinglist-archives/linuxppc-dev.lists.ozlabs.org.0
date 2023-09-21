Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4307A91D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 08:56:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=axwPVhFN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrmR00V4fz3c54
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 16:56:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=axwPVhFN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrmQ31v8cz3by6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 16:55:52 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-570a432468bso1207835a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 23:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695279348; x=1695884148; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bVL+jGs6sqP7VG1dEZazWMAPQBBD+mX9InFJhTfc4M=;
        b=axwPVhFNjHE2nBndElm9sDGFQNFo7x8l2NToaBnkvv6O8OV3tjLkqkz6GTBSLpuAAk
         lQRk03JbC0Tn2Yxg2rOKyPJroQlwMSLzwHV+8/TU9eBP98SS/eeBweDDNR7ARYlGCOAg
         gsJN8lN2X5v/4vusnpXK15hScqubmZtsSOLQPNzRR+7d6OfGd7cTV1+O3du6XtIoATGN
         CLOZxDtSNTBFusRUiyGRHD98ZYWcVKiD+24QQwOrBrSOEa/byPRIu3PD/sGRE815Ss33
         3PI5SDLS05kzXRMhfaAplmGSIL3ZUe6tzb0RSIXu5LThbeZRb2YacMruQg4bEe/uCE3g
         gIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695279348; x=1695884148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bVL+jGs6sqP7VG1dEZazWMAPQBBD+mX9InFJhTfc4M=;
        b=KjtoCrK9UClLhcCQzcr9GfLuV/gQbouk+zl2UFohrJZbT/caALj7QrEabbK21z/NGk
         NPxrsBavKOBZO4zFTrDkZO6CXsb50LwBRxIByxUNrAGjyIcZKFOqGK03mQt7ru3cOEUM
         EDywLQgeWrNkUo8VY5vQ6GjqxKkWbjx02uhEoKk2zUdK1ZfdML0lxbS2t0r1bWi0B3mK
         PckAo8VBj7xjlHXIK9ppEz1p4B6Ojsxd687X9hXsv8xdNl8dkYAtRgEPxRMc5DSle42T
         Y77MEuQb/Upkmd2ffOzVfsy7BIOKtWo8ruWXyifNxYfU0mVIpQ0ZXtF4VfqTO11nt31s
         xNNg==
X-Gm-Message-State: AOJu0YyAspzhhBz5QHZ7R+7EzDE4j1ykA21geWEOuTogvPKGoLJUw9sf
	vdhK/0VImwC1PmAygMaoz80jLLuReJR9OuPNUYs=
X-Google-Smtp-Source: AGHT+IFVBrCouVQWwD+e2QYzdo6XT481j2Idi0aW4ihmGivrnNEgvLCRqXRTybpDG6APLo336LaCnJUTntu6YTFsRW0=
X-Received: by 2002:a17:90b:1482:b0:276:6be8:8bfe with SMTP id
 js2-20020a17090b148200b002766be88bfemr7106957pjb.23.1695279348052; Wed, 20
 Sep 2023 23:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <1695202370-24678-1-git-send-email-shengjiu.wang@nxp.com>
 <1695202370-24678-10-git-send-email-shengjiu.wang@nxp.com> <fbedcbf1-d925-47d6-b9fb-c9e15263c117@xs4all.nl>
In-Reply-To: <fbedcbf1-d925-47d6-b9fb-c9e15263c117@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 21 Sep 2023 14:55:36 +0800
Message-ID: <CAA+D8APyNGFSry1GUv6TOW0nKYHKSwQd5bTcRNuT7cu0Xf8eUA@mail.gmail.com>
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

On Wed, Sep 20, 2023 at 6:19=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 20/09/2023 11:32, Shengjiu Wang wrote:
> > The input clock and output clock may not be the accurate
> > rate as the sample rate, there is some drift, so the convert
> > ratio of i.MX ASRC module need to be changed according to
> > actual clock rate.
> >
> > Add V4L2_CID_USER_IMX_ASRC_RATIO_MOD control for user to
> > adjust the ratio.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  Documentation/userspace-api/media/v4l/control.rst | 5 +++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 1 +
> >  include/uapi/linux/v4l2-controls.h                | 1 +
> >  3 files changed, 7 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Docume=
ntation/userspace-api/media/v4l/control.rst
> > index 4463fce694b0..2bc175900a34 100644
> > --- a/Documentation/userspace-api/media/v4l/control.rst
> > +++ b/Documentation/userspace-api/media/v4l/control.rst
> > @@ -318,6 +318,11 @@ Control IDs
> >      depending on particular custom controls should check the driver na=
me
> >      and version, see :ref:`querycap`.
> >
> > +.. _v4l2-audio-imx:
> > +
> > +``V4L2_CID_USER_IMX_ASRC_RATIO_MOD``
> > +    sets the rasampler ratio modifier of i.MX asrc module.
>
> rasampler -> resampler (I think?)
>
> This doesn't document at all what the type of the control is or how to in=
terpret it.
>
> > +
> >  Applications can enumerate the available controls with the
> >  :ref:`VIDIOC_QUERYCTRL` and
> >  :ref:`VIDIOC_QUERYMENU <VIDIOC_QUERYCTRL>` ioctls, get and set a
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/=
v4l2-core/v4l2-ctrls-defs.c
> > index 8696eb1cdd61..16f66f66198c 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1242,6 +1242,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >       case V4L2_CID_COLORIMETRY_CLASS:        return "Colorimetry Contr=
ols";
> >       case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:               return "H=
DR10 Content Light Info";
> >       case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:      return "H=
DR10 Mastering Display";
> > +     case V4L2_CID_USER_IMX_ASRC_RATIO_MOD:                  return "A=
SRC RATIO MOD";
>
> Let's stay consistent with the other control names:
>
> "ASRC Ratio Modifier"
>
> But if this is a driver specific control, then this doesn't belong here.
>
> Driver specific controls are defined in the driver itself, including this
> description.
>
> Same for the control documentation: if it is driver specific, then that
> typically is documented either in a driver-specific public header, or
> possibly in driver-specific documentation (Documentation/admin-guide/medi=
a/).
>
> But is this imx specific? Wouldn't other similar devices need this?

It is imx specific.

Does this mean that I need to create a header file in include/uapi/linux
folder to put this definition?  I just hesitate if this is necessary.

There is folder Documentation/userspace-api/media/drivers/ for drivers
Should this document in this folder, not in the
Documentation/admin-guide/media/?

Best regards
Wang shengjiu
>
> >       default:
> >               return NULL;
> >       }
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4=
l2-controls.h
> > index c3604a0a3e30..b1c319906d12 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -162,6 +162,7 @@ enum v4l2_colorfx {
> >  /* The base for the imx driver controls.
> >   * We reserve 16 controls for this driver. */
> >  #define V4L2_CID_USER_IMX_BASE                       (V4L2_CID_USER_BA=
SE + 0x10b0)
> > +#define V4L2_CID_USER_IMX_ASRC_RATIO_MOD     (V4L2_CID_USER_IMX_BASE +=
 0)
> >
> >  /*
> >   * The base for the atmel isc driver controls.
>
> Regards,
>
>         Hans
