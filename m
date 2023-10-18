Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 701E17CDDDB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 15:51:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=meB/0M5i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9XMY2RvFz3cN6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 00:51:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=meB/0M5i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9XLd37dZz2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 00:51:03 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-27d3ede72f6so4516748a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 06:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697637061; x=1698241861; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOVN+NhhXOaI1O7xnj1Ib+HKxkuz7xr2nPaNZ+hG0YA=;
        b=meB/0M5ifUQav1VLenr9YsvL+wdyoLKmrzMJAQtYFtnwmahkMwkOTb2g1rS401TTIv
         xpxEkT3A0Jwj4JovjwZoskQelkZEHfljjnUZNzgRpP49Gfck8PlJG+9+cF3+0i2Bkw9j
         g+st8kTr1QKOPhxWY/DtHlJPnLr/waJtiLEbps9EV0PwfW3ofoMHmrFZEt7z591XwmoV
         Y8wa/vwrgAHLOdr58Lq+eomJAMEph/kaS5g45DZatjxq9GvGt38nlE7yIZ90PTHCdafM
         golmiDkWARxCORwUiy63Vp7+Grk+xYwh80FSMwN8TI2m9ejVk5ETqdqtosToP3y3coZG
         TnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697637061; x=1698241861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOVN+NhhXOaI1O7xnj1Ib+HKxkuz7xr2nPaNZ+hG0YA=;
        b=JqZK0+pHjaft7tC69LUQSKKw2Zg2bXuVOc3RsSnvq+ZohaUa8gCzsFS1kVDbjwiTqP
         pnczFrbFpHpKLDlpOGOA6T+C/F+l7xdJPplQQoQFS3xC530KODPpLSgwm7BMNhgbSg4b
         1bamCPy9LOScuD0dYE/u64SVO9Ue7Q0FaRyRIzZvk2oXRHu6iJs2nPINkjIPYCajenkw
         4Lb/Wr7g5W+jhhomU48WXUBhbGVUa+WbH2ljuBA2F3TKOWIfUGd0FBTSWTUQh0UhW5tI
         Wy9X/VV4d3b1oyCz5kqMUPeUYpyYrBrdFmGVtHUSSCsHAENobuYLFGE7q4RBvcWF2JVA
         CmiA==
X-Gm-Message-State: AOJu0Yxd8WR/BvffCl2/zS3eE+tXKgUI3ZnqT0YjSWCHRO+iP+ZTGC0A
	u35fyZUjexWbbLdxQ4mRq/7BdSSImxlkcrmi6zI=
X-Google-Smtp-Source: AGHT+IEvQRa4AWJcABn/YC32TZLjdGFql43bijQhx9HC725gmA+wgi4txjrj3aNGOA409K6WBuqXR6sCl5Au1SkBOEM=
X-Received: by 2002:a17:90a:1e:b0:27d:3f93:c148 with SMTP id
 30-20020a17090a001e00b0027d3f93c148mr5203558pja.13.1697637060749; Wed, 18 Oct
 2023 06:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <1697185865-27528-1-git-send-email-shengjiu.wang@nxp.com>
 <1697185865-27528-10-git-send-email-shengjiu.wang@nxp.com>
 <a0dfe959-3b32-4d03-9f1b-8f3c1054ecf7@xs4all.nl> <CAA+D8AP1a-Vioy2Cr7dZ4wErXpkm7g9Caw-yPKc9jbWpPnN0JQ@mail.gmail.com>
 <0ae6d9e1-bdd9-45ab-9749-8b0cb5c624ff@xs4all.nl> <CAA+D8AMa9tpMq08XsUuAtV0DLWbLOwsfYjd30NJ3OBezkTs5YA@mail.gmail.com>
 <CAA+D8AOJ=Akp5AmE4PCy=O=TGYaP3Cn0jLveL-aoqV3tFAVPSg@mail.gmail.com>
 <36360a55-4cb4-4494-aa69-96837ba7750d@xs4all.nl> <CAA+D8APMRpWXPy3VHPev5A+g8o6m5Tj4BKivSGk_SZAZsMoBAw@mail.gmail.com>
 <90873bfe-f5c2-44b3-834e-2cea82cb3c48@xs4all.nl> <CAA+D8APZVjF-JqHWLdD0bwN_W7rs_gAzHq9PYVvPc9KabeRCxg@mail.gmail.com>
 <28cce9d0-f22c-48b3-8029-78bdaa787839@xs4all.nl>
In-Reply-To: <28cce9d0-f22c-48b3-8029-78bdaa787839@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 18 Oct 2023 21:50:49 +0800
Message-ID: <CAA+D8APNYRADpsXn65zpVvP4AP_afVQNmH7S_a28kAnVmz7bZw@mail.gmail.com>
Subject: Re: [RFC PATCH v6 09/11] media: uapi: Add audio rate controls support
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

On Wed, Oct 18, 2023 at 9:09=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 18/10/2023 14:52, Shengjiu Wang wrote:
> > On Wed, Oct 18, 2023 at 3:58=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.n=
l> wrote:
> >>
> >> On 18/10/2023 09:40, Shengjiu Wang wrote:
> >>> On Wed, Oct 18, 2023 at 3:31=E2=80=AFPM Hans Verkuil <hverkuil@xs4all=
.nl> wrote:
> >>>>
> >>>> On 18/10/2023 09:23, Shengjiu Wang wrote:
> >>>>> On Wed, Oct 18, 2023 at 10:27=E2=80=AFAM Shengjiu Wang <shengjiu.wa=
ng@gmail.com> wrote:
> >>>>>>
> >>>>>> On Tue, Oct 17, 2023 at 9:37=E2=80=AFPM Hans Verkuil <hverkuil@xs4=
all.nl> wrote:
> >>>>>>>
> >>>>>>> On 17/10/2023 15:11, Shengjiu Wang wrote:
> >>>>>>>> On Mon, Oct 16, 2023 at 9:16=E2=80=AFPM Hans Verkuil <hverkuil@x=
s4all.nl> wrote:
> >>>>>>>>>
> >>>>>>>>> Hi Shengjiu,
> >>>>>>>>>
> >>>>>>>>> On 13/10/2023 10:31, Shengjiu Wang wrote:
> >>>>>>>>>> Fixed point controls are used by the user to configure
> >>>>>>>>>> the audio sample rate to driver.
> >>>>>>>>>>
> >>>>>>>>>> Add V4L2_CID_ASRC_SOURCE_RATE and V4L2_CID_ASRC_DEST_RATE
> >>>>>>>>>> new IDs for ASRC rate control.
> >>>>>>>>>>
> >>>>>>>>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>>>>>>>> ---
> >>>>>>>>>>  .../userspace-api/media/v4l/common.rst        |  1 +
> >>>>>>>>>>  .../media/v4l/ext-ctrls-fixed-point.rst       | 36 ++++++++++=
+++++++++
> >>>>>>>>>>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 +++
> >>>>>>>>>>  .../media/v4l/vidioc-queryctrl.rst            |  7 ++++
> >>>>>>>>>>  .../media/videodev2.h.rst.exceptions          |  1 +
> >>>>>>>>>>  drivers/media/v4l2-core/v4l2-ctrls-core.c     |  5 +++
> >>>>>>>>>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  4 +++
> >>>>>>>>>>  include/media/v4l2-ctrls.h                    |  2 ++
> >>>>>>>>>>  include/uapi/linux/v4l2-controls.h            | 13 +++++++
> >>>>>>>>>>  include/uapi/linux/videodev2.h                |  3 ++
> >>>>>>>>>>  10 files changed, 76 insertions(+)
> >>>>>>>>>>  create mode 100644 Documentation/userspace-api/media/v4l/ext-=
ctrls-fixed-point.rst
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/Documentation/userspace-api/media/v4l/common.rst =
b/Documentation/userspace-api/media/v4l/common.rst
> >>>>>>>>>> index ea0435182e44..35707edffb13 100644
> >>>>>>>>>> --- a/Documentation/userspace-api/media/v4l/common.rst
> >>>>>>>>>> +++ b/Documentation/userspace-api/media/v4l/common.rst
> >>>>>>>>>> @@ -52,6 +52,7 @@ applicable to all devices.
> >>>>>>>>>>      ext-ctrls-fm-rx
> >>>>>>>>>>      ext-ctrls-detect
> >>>>>>>>>>      ext-ctrls-colorimetry
> >>>>>>>>>> +    ext-ctrls-fixed-point
> >>>>>>>>>
> >>>>>>>>> Rename this to ext-ctrls-audio-m2m.
> >>>>>>>>>
> >>>>>>>>>>      fourcc
> >>>>>>>>>>      format
> >>>>>>>>>>      planar-apis
> >>>>>>>>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-f=
ixed-point.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-fixed-poin=
t.rst
> >>>>>>>>>> new file mode 100644
> >>>>>>>>>> index 000000000000..2ef6e250580c
> >>>>>>>>>> --- /dev/null
> >>>>>>>>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fixed-po=
int.rst
> >>>>>>>>>> @@ -0,0 +1,36 @@
> >>>>>>>>>> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> >>>>>>>>>> +
> >>>>>>>>>> +.. _fixed-point-controls:
> >>>>>>>>>> +
> >>>>>>>>>> +***************************
> >>>>>>>>>> +Fixed Point Control Reference
> >>>>>>>>>
> >>>>>>>>> This is for audio controls. "Fixed Point" is just the type, and=
 it doesn't make
> >>>>>>>>> sense to group fixed point controls. But it does make sense to =
group the audio
> >>>>>>>>> controls.
> >>>>>>>>>
> >>>>>>>>> V4L2 controls can be grouped into classes. Basically it is a wa=
y to put controls
> >>>>>>>>> into categories, and for each category there is also a control =
that gives a
> >>>>>>>>> description of the class (see 2.15.15 in
> >>>>>>>>> https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/v4l2-=
controls.html#introduction)
> >>>>>>>>>
> >>>>>>>>> If you use e.g. 'v4l2-ctl -l' to list all the controls, then yo=
u will see that
> >>>>>>>>> they are grouped based on what class of control they are.
> >>>>>>>>>
> >>>>>>>>> So I think it would be a good idea to create a new control clas=
s for M2M audio controls,
> >>>>>>>>> instead of just adding them to the catch-all 'User Controls' cl=
ass.
> >>>>>>>>>
> >>>>>>>>> Search e.g. for V4L2_CTRL_CLASS_COLORIMETRY and V4L2_CID_COLORI=
METRY_CLASS to see how
> >>>>>>>>> it is done.
> >>>>>>>>>
> >>>>>>>>> M2M_AUDIO would probably be a good name for the class.
> >>>>>>>>>
> >>>>>>>>>> +***************************
> >>>>>>>>>> +
> >>>>>>>>>> +These controls are intended to support an asynchronous sample
> >>>>>>>>>> +rate converter.
> >>>>>>>>>
> >>>>>>>>> Add ' (ASRC).' at the end to indicate the common abbreviation f=
or
> >>>>>>>>> that.
> >>>>>>>>>
> >>>>>>>>>> +
> >>>>>>>>>> +.. _v4l2-audio-asrc:
> >>>>>>>>>> +
> >>>>>>>>>> +``V4L2_CID_ASRC_SOURCE_RATE``
> >>>>>>>>>> +    sets the resampler source rate.
> >>>>>>>>>> +
> >>>>>>>>>> +``V4L2_CID_ASRC_DEST_RATE``
> >>>>>>>>>> +    sets the resampler destination rate.
> >>>>>>>>>
> >>>>>>>>> Document the unit (Hz) for these two controls.
> >>>>>>>>>
> >>>>>>>>>> +
> >>>>>>>>>> +.. c:type:: v4l2_ctrl_fixed_point
> >>>>>>>>>> +
> >>>>>>>>>> +.. cssclass:: longtable
> >>>>>>>>>> +
> >>>>>>>>>> +.. tabularcolumns:: |p{1.5cm}|p{5.8cm}|p{10.0cm}|
> >>>>>>>>>> +
> >>>>>>>>>> +.. flat-table:: struct v4l2_ctrl_fixed_point
> >>>>>>>>>> +    :header-rows:  0
> >>>>>>>>>> +    :stub-columns: 0
> >>>>>>>>>> +    :widths:       1 1 2
> >>>>>>>>>> +
> >>>>>>>>>> +    * - __u32
> >>>>>>>>>
> >>>>>>>>> Hmm, shouldn't this be __s32?
> >>>>>>>>>
> >>>>>>>>>> +      - ``integer``
> >>>>>>>>>> +      - integer part of fixed point value.
> >>>>>>>>>> +    * - __s32
> >>>>>>>>>
> >>>>>>>>> and this __u32?
> >>>>>>>>>
> >>>>>>>>> You want to be able to use this generic type as a signed value.
> >>>>>>>>>
> >>>>>>>>>> +      - ``fractional``
> >>>>>>>>>> +      - fractional part of fixed point value, which is Q31.
> >>>>>>>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ex=
t-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> >>>>>>>>>> index f9f73530a6be..1811dabf5c74 100644
> >>>>>>>>>> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls=
.rst
> >>>>>>>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls=
.rst
> >>>>>>>>>> @@ -295,6 +295,10 @@ still cause this situation.
> >>>>>>>>>>        - ``p_av1_film_grain``
> >>>>>>>>>>        - A pointer to a struct :c:type:`v4l2_ctrl_av1_film_gra=
in`. Valid if this control is
> >>>>>>>>>>          of type ``V4L2_CTRL_TYPE_AV1_FILM_GRAIN``.
> >>>>>>>>>> +    * - struct :c:type:`v4l2_ctrl_fixed_point` *
> >>>>>>>>>> +      - ``p_fixed_point``
> >>>>>>>>>> +      - A pointer to a struct :c:type:`v4l2_ctrl_fixed_point`=
. Valid if this control is
> >>>>>>>>>> +        of type ``V4L2_CTRL_TYPE_FIXED_POINT``.
> >>>>>>>>>>      * - void *
> >>>>>>>>>>        - ``ptr``
> >>>>>>>>>>        - A pointer to a compound type which can be an N-dimens=
ional array
> >>>>>>>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-quer=
yctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> >>>>>>>>>> index 4d38acafe8e1..9285f4f39eed 100644
> >>>>>>>>>> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.r=
st
> >>>>>>>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.r=
st
> >>>>>>>>>> @@ -549,6 +549,13 @@ See also the examples in :ref:`control`.
> >>>>>>>>>>        - n/a
> >>>>>>>>>>        - A struct :c:type:`v4l2_ctrl_av1_film_grain`, containi=
ng AV1 Film Grain
> >>>>>>>>>>          parameters for stateless video decoders.
> >>>>>>>>>> +    * - ``V4L2_CTRL_TYPE_FIXED_POINT``
> >>>>>>>>>> +      - n/a
> >>>>>>>>>> +      - n/a
> >>>>>>>>>> +      - n/a
> >>>>>>>>>> +      - A struct :c:type:`v4l2_ctrl_fixed_point`, containing =
parameter which has
> >>>>>>>>>> +        integer part and fractional part, i.e. audio sample r=
ate.
> >>>>>>>>>> +
> >>>>>>>>>>
> >>>>>>>>>>  .. raw:: latex
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst=
.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >>>>>>>>>> index e61152bb80d1..2faa5a2015eb 100644
> >>>>>>>>>> --- a/Documentation/userspace-api/media/videodev2.h.rst.except=
ions
> >>>>>>>>>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.except=
ions
> >>>>>>>>>> @@ -167,6 +167,7 @@ replace symbol V4L2_CTRL_TYPE_AV1_SEQUENCE=
 :c:type:`v4l2_ctrl_type`
> >>>>>>>>>>  replace symbol V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY :c:type:`v=
4l2_ctrl_type`
> >>>>>>>>>>  replace symbol V4L2_CTRL_TYPE_AV1_FRAME :c:type:`v4l2_ctrl_ty=
pe`
> >>>>>>>>>>  replace symbol V4L2_CTRL_TYPE_AV1_FILM_GRAIN :c:type:`v4l2_ct=
rl_type`
> >>>>>>>>>> +replace symbol V4L2_CTRL_TYPE_FIXED_POINT :c:type:`v4l2_ctrl_=
type`
> >>>>>>>>>>
> >>>>>>>>>>  # V4L2 capability defines
> >>>>>>>>>>  replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
> >>>>>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drive=
rs/media/v4l2-core/v4l2-ctrls-core.c
> >>>>>>>>>> index a662fb60f73f..7a616ac91059 100644
> >>>>>>>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> >>>>>>>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> >>>>>>>>>> @@ -1168,6 +1168,8 @@ static int std_validate_compound(const s=
truct v4l2_ctrl *ctrl, u32 idx,
> >>>>>>>>>>               if (!area->width || !area->height)
> >>>>>>>>>>                       return -EINVAL;
> >>>>>>>>>>               break;
> >>>>>>>>>> +     case V4L2_CTRL_TYPE_FIXED_POINT:
> >>>>>>>>>> +             break;
> >>>>>>>>>
> >>>>>>>>> Hmm, this would need this patch 'v4l2-ctrls: add support for V4=
L2_CTRL_WHICH_MIN/MAX_VAL':
> >>>>>>>>>
> >>>>>>>>> https://patchwork.linuxtv.org/project/linux-media/patch/2023101=
0022136.1504015-7-yunkec@google.com/
> >>>>>>>>>
> >>>>>>>>> since min and max values are perfectly fine for a fixed point v=
alue.
> >>>>>>>>>
> >>>>>>>>> Even a step value (currently not supported in that patch) would=
 make sense.
> >>>>>>>>>
> >>>>>>>>> But I wonder if we couldn't simplify this: instead of creating =
a v4l2_ctrl_fixed_point,
> >>>>>>>>> why not represent the fixed point value as a Q31.32. Then the s=
tandard
> >>>>>>>>> minimum/maximum/step values can be used, and it acts like a reg=
ular V4L2_TYPE_INTEGER64.
> >>>>>>>>>
> >>>>>>>>> Except that both userspace and drivers need to multiply it with=
 2^-32 to get the actual
> >>>>>>>>> value.
> >>>>>>>>>
> >>>>>>>>> So in enum v4l2_ctrl_type add:
> >>>>>>>>>
> >>>>>>>>>         V4L2_CTRL_TYPE_FIXED_POINT =3D 10,
> >>>>>>>>>
> >>>>>>>>> (10, because it is no longer a compound type).
> >>>>>>>>
> >>>>>>>> Seems we don't need V4L2_CTRL_TYPE_FIXED_POINT, just use V4L2_TY=
PE_INTEGER64?
> >>>>>>>>
> >>>>>>>> The reason I use the 'integer' and 'fractional' is that I want
> >>>>>>>> 'integer' to be the normal sample
> >>>>>>>> rate, for example 48kHz.  The 'fractional' is the difference wit=
h
> >>>>>>>> normal sample rate.
> >>>>>>>>
> >>>>>>>> For example, the rate =3D 47998.12345.  so integer =3D 48000,  f=
ractional=3D -1.87655.
> >>>>>>>>
> >>>>>>>> So if we use s64 for rate, then in driver need to convert the ra=
te to
> >>>>>>>> the closed normal
> >>>>>>>> sample rate + fractional.
> >>>>>>>
> >>>>>>> That wasn't what the documentation said :-)
> >>>>>>>
> >>>>>>> So this is really two controls: one for the 'normal sample rate' =
(whatever 'normal'
> >>>>>>> means in this context) and the offset to the actual sample rate.
> >>>>>>>
> >>>>>>> Presumably the 'normal' sample rate is set once, while the offset=
 changes
> >>>>>>> regularly.
> >>>>>>>
> >>>>>>> But why do you need the 'normal' sample rate? With audio resampli=
ng I assume
> >>>>>>> you resample from one rate to another, so why do you need a third=
 'normal'
> >>>>>>> rate?
> >>>>>>>
> >>>>>>
> >>>>>> 'Normal' rate is used to select the prefilter table.
> >>>>>>
> >>>>>
> >>>>> Currently I think we may define
> >>>>> V4L2_CID_M2M_AUDIO_SOURCE_RATE
> >>>>> V4L2_CID_M2M_AUDIO_DEST_RATE
> >>>>
> >>>> That makes sense.
> >>>>
> >>>>> V4L2_CID_M2M_AUDIO_ASRC_RATIO_MOD
> >>>>
> >>>> OK, can you document this control? Just write it down in the reply, =
I just want
> >>>> to understand how the integer value you set here is used.
> >>>>
> >>>
> >>> It is Q31 value.   It is equal to:
> >>> in_rate_new / out_rate_new -  in_rate_old / out_rate_old
> >>
> >> So that's not an integer. Also, Q31 is limited to -1...1, and I think
> >> that's too limiting.
> >>
> >> For this having a Q31.32 fixed point type still makes a lot of sense.
> >>
> >> I still feel this is a overly complicated API.
> >>
> >> See more below...
> >>
> >>>
> >>> Best regards
> >>> Wang shengjiu
> >>>
> >>>> Regards,
> >>>>
> >>>>         Hans
> >>>>
> >>>>>
> >>>>> All of them can be V4L2_CTRL_TYPE_INTEGER.
> >>>>>
> >>>>> RATIO_MOD was defined in the very beginning version.
> >>>>> I think it is better to let users calculate this value.
> >>>>>
> >>>>> The reason is:
> >>>>> if we define the offset for source rate and dest rate in
> >>>>> driver separately,  when offset of source rate is set,
> >>>>> driver don't know if it needs to wait or not the dest rate
> >>>>> offset,  then go to calculate the ratio_mod.
> >>
> >> Ah, in order to update the ratio mod userspace needs to set both sourc=
e and
> >> dest rate at the same time to avoid race conditions.
> >>
> >> That is perfectly possible in the V4L2 control framework. See:
> >>
> >> https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/v4l2-control=
s.html#control-clusters
> >>
> >> In practice, isn't it likely that you would fix either the source or
> >> destination rate, and let the other rate fluctuate? It kind of feels w=
eird
> >> to me that both source AND destination rates can fluctuate over time.
> >>
> > Right, the source and dest rates needn't change in same time.
> >
> >> In any case, with a control cluster it doesn't really matter, you can =
set
> >> one rate or both rates, and it will be handled atomically.
> >>
> >> I feel that the RATIO_MOD control is too hardware specific. This is so=
mething
> >> that should be hidden in the driver.
> >>
> >
> > I will use:
> >
> > V4L2_CID_M2M_AUDIO_SOURCE_RATE
> > V4L2_CID_M2M_AUDIO_DEST_RATE
> > V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET
> > V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET
> >
> > 'OFFSET' is V4L2_CTRL_TYPE_FIXED_POINT, which is Q31.32.
>
> So now I come back to my original question: why do you need both
> the rate and the offset? Isn't it enough to set just the rates,
> as long as that is in fixed point format?
>
> Why does the driver need both the 'ideal' rate + the offset?
>
> I'm not opposed to this, I'm just trying to understand whether this
> makes sense.
>
> Can't you take e.g. the source and dest rate as starting points
> when you start streaming? And every time userspace updates one or both
> of these rates you calculate the ratio_mod compared to the previous rates=
?
>
> Or is there a reason why you need the ideal rates as well? E.g. 48000 or
> 44100, etc.
>

ideal rates is used to select prefilter table. the prefilter table is index=
ed by
ideal rates.

The asrc has two part: prefilter and resampler filter.  The convert ratio i=
s
applied to rasampler filter part.

best regards
wang shengjiu
