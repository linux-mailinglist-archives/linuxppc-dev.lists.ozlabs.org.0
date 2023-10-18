Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 278A17CDC53
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 14:53:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JXLsZhyD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9W3w553cz3cLv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 23:53:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JXLsZhyD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9W343p3Vz3c9j
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 23:52:31 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6be0277c05bso2646436b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 05:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697633548; x=1698238348; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rASzYfDFOppJqmOky5lKGkjvRlnpTgsTLNwXPfFeupI=;
        b=JXLsZhyDXh3Xl4S5Ln2/4RQiI55413e/gOicxZDBoDvt08lUx2Z/MVag3elLVW8tbK
         r2Xo2xO2Q9T3GitRkn3NnbpmZPhwGwFhr3j4FXj8Q/Mz3qi8r9j4zTAz3QHqm4FqW3IO
         v/vf5hEm3qG/L2YtvOtt3Pi2w34DnBwIG0yBRM+x+Gite2tjveHHupBfWov4ppR6UHAu
         MFpEdhz1tthpFS+4dHW3JXZOPa73jMbirSXtd5IZUqiFyr4y5B3kEyQf7Bf37jjUNgwj
         SwJi4hAtuzgfk2l53hsXZiIkKHGrLoXsqUyZxJXmF7NOYEfbD/BwnUORJS9+kMkLMOUR
         M3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697633548; x=1698238348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rASzYfDFOppJqmOky5lKGkjvRlnpTgsTLNwXPfFeupI=;
        b=i03Gfu7GU/MAVbEJp+3Di+6fUVvMUxbRqZUyEA1AnKouHe2aHGL0C47/LJEqze1dkH
         04Kk8blbDzybnIlRbp5ZqMlha/hG8oeZR+kuHLIcD2U72GK8uP32NBYXcTVoGi979U9c
         WIh6J/JtN5/MAmxd2bVJsriXaLEuWX28WtWUrYgT2mp9I+SoB0MI3xBP0/XUXsT11k0o
         KfB9bglxQB0eps249T9IFw1xb6rhZ2W09g3GdZpMvKmL+mqoBJtbzAYipqJoTIWDpN5J
         3QU6PKixvu5lCfCaq2mPm25PuziBrGWovj5IYVr21Pn6vxwgVa1ycuMBDdyaIGaz4aEM
         pg0g==
X-Gm-Message-State: AOJu0YwWufzYIeE1vXA0GZYtumP//W9+u+mkQOKAemIvRj71k72XW1g7
	6q2+ZLMAIKA13v3DujZIYUXuNpI7DpagSrmhrXQ=
X-Google-Smtp-Source: AGHT+IGxAMVXnYXihObc4mYOwx4O3O5kNzr9FTXcRoXxpfrnLJkHEfhHxv8s6zUKs2ePQo9rb86KJvkzMd+NJYJh1yY=
X-Received: by 2002:a05:6a21:7741:b0:16e:ab42:9837 with SMTP id
 bc1-20020a056a21774100b0016eab429837mr4985243pzc.29.1697633547558; Wed, 18
 Oct 2023 05:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <1697185865-27528-1-git-send-email-shengjiu.wang@nxp.com>
 <1697185865-27528-10-git-send-email-shengjiu.wang@nxp.com>
 <a0dfe959-3b32-4d03-9f1b-8f3c1054ecf7@xs4all.nl> <CAA+D8AP1a-Vioy2Cr7dZ4wErXpkm7g9Caw-yPKc9jbWpPnN0JQ@mail.gmail.com>
 <0ae6d9e1-bdd9-45ab-9749-8b0cb5c624ff@xs4all.nl> <CAA+D8AMa9tpMq08XsUuAtV0DLWbLOwsfYjd30NJ3OBezkTs5YA@mail.gmail.com>
 <CAA+D8AOJ=Akp5AmE4PCy=O=TGYaP3Cn0jLveL-aoqV3tFAVPSg@mail.gmail.com>
 <36360a55-4cb4-4494-aa69-96837ba7750d@xs4all.nl> <CAA+D8APMRpWXPy3VHPev5A+g8o6m5Tj4BKivSGk_SZAZsMoBAw@mail.gmail.com>
 <90873bfe-f5c2-44b3-834e-2cea82cb3c48@xs4all.nl>
In-Reply-To: <90873bfe-f5c2-44b3-834e-2cea82cb3c48@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 18 Oct 2023 20:52:15 +0800
Message-ID: <CAA+D8APZVjF-JqHWLdD0bwN_W7rs_gAzHq9PYVvPc9KabeRCxg@mail.gmail.com>
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

On Wed, Oct 18, 2023 at 3:58=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 18/10/2023 09:40, Shengjiu Wang wrote:
> > On Wed, Oct 18, 2023 at 3:31=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.n=
l> wrote:
> >>
> >> On 18/10/2023 09:23, Shengjiu Wang wrote:
> >>> On Wed, Oct 18, 2023 at 10:27=E2=80=AFAM Shengjiu Wang <shengjiu.wang=
@gmail.com> wrote:
> >>>>
> >>>> On Tue, Oct 17, 2023 at 9:37=E2=80=AFPM Hans Verkuil <hverkuil@xs4al=
l.nl> wrote:
> >>>>>
> >>>>> On 17/10/2023 15:11, Shengjiu Wang wrote:
> >>>>>> On Mon, Oct 16, 2023 at 9:16=E2=80=AFPM Hans Verkuil <hverkuil@xs4=
all.nl> wrote:
> >>>>>>>
> >>>>>>> Hi Shengjiu,
> >>>>>>>
> >>>>>>> On 13/10/2023 10:31, Shengjiu Wang wrote:
> >>>>>>>> Fixed point controls are used by the user to configure
> >>>>>>>> the audio sample rate to driver.
> >>>>>>>>
> >>>>>>>> Add V4L2_CID_ASRC_SOURCE_RATE and V4L2_CID_ASRC_DEST_RATE
> >>>>>>>> new IDs for ASRC rate control.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>>>>>> ---
> >>>>>>>>  .../userspace-api/media/v4l/common.rst        |  1 +
> >>>>>>>>  .../media/v4l/ext-ctrls-fixed-point.rst       | 36 ++++++++++++=
+++++++
> >>>>>>>>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 +++
> >>>>>>>>  .../media/v4l/vidioc-queryctrl.rst            |  7 ++++
> >>>>>>>>  .../media/videodev2.h.rst.exceptions          |  1 +
> >>>>>>>>  drivers/media/v4l2-core/v4l2-ctrls-core.c     |  5 +++
> >>>>>>>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  4 +++
> >>>>>>>>  include/media/v4l2-ctrls.h                    |  2 ++
> >>>>>>>>  include/uapi/linux/v4l2-controls.h            | 13 +++++++
> >>>>>>>>  include/uapi/linux/videodev2.h                |  3 ++
> >>>>>>>>  10 files changed, 76 insertions(+)
> >>>>>>>>  create mode 100644 Documentation/userspace-api/media/v4l/ext-ct=
rls-fixed-point.rst
> >>>>>>>>
> >>>>>>>> diff --git a/Documentation/userspace-api/media/v4l/common.rst b/=
Documentation/userspace-api/media/v4l/common.rst
> >>>>>>>> index ea0435182e44..35707edffb13 100644
> >>>>>>>> --- a/Documentation/userspace-api/media/v4l/common.rst
> >>>>>>>> +++ b/Documentation/userspace-api/media/v4l/common.rst
> >>>>>>>> @@ -52,6 +52,7 @@ applicable to all devices.
> >>>>>>>>      ext-ctrls-fm-rx
> >>>>>>>>      ext-ctrls-detect
> >>>>>>>>      ext-ctrls-colorimetry
> >>>>>>>> +    ext-ctrls-fixed-point
> >>>>>>>
> >>>>>>> Rename this to ext-ctrls-audio-m2m.
> >>>>>>>
> >>>>>>>>      fourcc
> >>>>>>>>      format
> >>>>>>>>      planar-apis
> >>>>>>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-fix=
ed-point.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-fixed-point.=
rst
> >>>>>>>> new file mode 100644
> >>>>>>>> index 000000000000..2ef6e250580c
> >>>>>>>> --- /dev/null
> >>>>>>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fixed-poin=
t.rst
> >>>>>>>> @@ -0,0 +1,36 @@
> >>>>>>>> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> >>>>>>>> +
> >>>>>>>> +.. _fixed-point-controls:
> >>>>>>>> +
> >>>>>>>> +***************************
> >>>>>>>> +Fixed Point Control Reference
> >>>>>>>
> >>>>>>> This is for audio controls. "Fixed Point" is just the type, and i=
t doesn't make
> >>>>>>> sense to group fixed point controls. But it does make sense to gr=
oup the audio
> >>>>>>> controls.
> >>>>>>>
> >>>>>>> V4L2 controls can be grouped into classes. Basically it is a way =
to put controls
> >>>>>>> into categories, and for each category there is also a control th=
at gives a
> >>>>>>> description of the class (see 2.15.15 in
> >>>>>>> https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/v4l2-co=
ntrols.html#introduction)
> >>>>>>>
> >>>>>>> If you use e.g. 'v4l2-ctl -l' to list all the controls, then you =
will see that
> >>>>>>> they are grouped based on what class of control they are.
> >>>>>>>
> >>>>>>> So I think it would be a good idea to create a new control class =
for M2M audio controls,
> >>>>>>> instead of just adding them to the catch-all 'User Controls' clas=
s.
> >>>>>>>
> >>>>>>> Search e.g. for V4L2_CTRL_CLASS_COLORIMETRY and V4L2_CID_COLORIME=
TRY_CLASS to see how
> >>>>>>> it is done.
> >>>>>>>
> >>>>>>> M2M_AUDIO would probably be a good name for the class.
> >>>>>>>
> >>>>>>>> +***************************
> >>>>>>>> +
> >>>>>>>> +These controls are intended to support an asynchronous sample
> >>>>>>>> +rate converter.
> >>>>>>>
> >>>>>>> Add ' (ASRC).' at the end to indicate the common abbreviation for
> >>>>>>> that.
> >>>>>>>
> >>>>>>>> +
> >>>>>>>> +.. _v4l2-audio-asrc:
> >>>>>>>> +
> >>>>>>>> +``V4L2_CID_ASRC_SOURCE_RATE``
> >>>>>>>> +    sets the resampler source rate.
> >>>>>>>> +
> >>>>>>>> +``V4L2_CID_ASRC_DEST_RATE``
> >>>>>>>> +    sets the resampler destination rate.
> >>>>>>>
> >>>>>>> Document the unit (Hz) for these two controls.
> >>>>>>>
> >>>>>>>> +
> >>>>>>>> +.. c:type:: v4l2_ctrl_fixed_point
> >>>>>>>> +
> >>>>>>>> +.. cssclass:: longtable
> >>>>>>>> +
> >>>>>>>> +.. tabularcolumns:: |p{1.5cm}|p{5.8cm}|p{10.0cm}|
> >>>>>>>> +
> >>>>>>>> +.. flat-table:: struct v4l2_ctrl_fixed_point
> >>>>>>>> +    :header-rows:  0
> >>>>>>>> +    :stub-columns: 0
> >>>>>>>> +    :widths:       1 1 2
> >>>>>>>> +
> >>>>>>>> +    * - __u32
> >>>>>>>
> >>>>>>> Hmm, shouldn't this be __s32?
> >>>>>>>
> >>>>>>>> +      - ``integer``
> >>>>>>>> +      - integer part of fixed point value.
> >>>>>>>> +    * - __s32
> >>>>>>>
> >>>>>>> and this __u32?
> >>>>>>>
> >>>>>>> You want to be able to use this generic type as a signed value.
> >>>>>>>
> >>>>>>>> +      - ``fractional``
> >>>>>>>> +      - fractional part of fixed point value, which is Q31.
> >>>>>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-=
ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> >>>>>>>> index f9f73530a6be..1811dabf5c74 100644
> >>>>>>>> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.r=
st
> >>>>>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.r=
st
> >>>>>>>> @@ -295,6 +295,10 @@ still cause this situation.
> >>>>>>>>        - ``p_av1_film_grain``
> >>>>>>>>        - A pointer to a struct :c:type:`v4l2_ctrl_av1_film_grain=
`. Valid if this control is
> >>>>>>>>          of type ``V4L2_CTRL_TYPE_AV1_FILM_GRAIN``.
> >>>>>>>> +    * - struct :c:type:`v4l2_ctrl_fixed_point` *
> >>>>>>>> +      - ``p_fixed_point``
> >>>>>>>> +      - A pointer to a struct :c:type:`v4l2_ctrl_fixed_point`. =
Valid if this control is
> >>>>>>>> +        of type ``V4L2_CTRL_TYPE_FIXED_POINT``.
> >>>>>>>>      * - void *
> >>>>>>>>        - ``ptr``
> >>>>>>>>        - A pointer to a compound type which can be an N-dimensio=
nal array
> >>>>>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryc=
trl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> >>>>>>>> index 4d38acafe8e1..9285f4f39eed 100644
> >>>>>>>> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> >>>>>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> >>>>>>>> @@ -549,6 +549,13 @@ See also the examples in :ref:`control`.
> >>>>>>>>        - n/a
> >>>>>>>>        - A struct :c:type:`v4l2_ctrl_av1_film_grain`, containing=
 AV1 Film Grain
> >>>>>>>>          parameters for stateless video decoders.
> >>>>>>>> +    * - ``V4L2_CTRL_TYPE_FIXED_POINT``
> >>>>>>>> +      - n/a
> >>>>>>>> +      - n/a
> >>>>>>>> +      - n/a
> >>>>>>>> +      - A struct :c:type:`v4l2_ctrl_fixed_point`, containing pa=
rameter which has
> >>>>>>>> +        integer part and fractional part, i.e. audio sample rat=
e.
> >>>>>>>> +
> >>>>>>>>
> >>>>>>>>  .. raw:: latex
> >>>>>>>>
> >>>>>>>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.e=
xceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >>>>>>>> index e61152bb80d1..2faa5a2015eb 100644
> >>>>>>>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptio=
ns
> >>>>>>>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptio=
ns
> >>>>>>>> @@ -167,6 +167,7 @@ replace symbol V4L2_CTRL_TYPE_AV1_SEQUENCE :=
c:type:`v4l2_ctrl_type`
> >>>>>>>>  replace symbol V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY :c:type:`v4l=
2_ctrl_type`
> >>>>>>>>  replace symbol V4L2_CTRL_TYPE_AV1_FRAME :c:type:`v4l2_ctrl_type=
`
> >>>>>>>>  replace symbol V4L2_CTRL_TYPE_AV1_FILM_GRAIN :c:type:`v4l2_ctrl=
_type`
> >>>>>>>> +replace symbol V4L2_CTRL_TYPE_FIXED_POINT :c:type:`v4l2_ctrl_ty=
pe`
> >>>>>>>>
> >>>>>>>>  # V4L2 capability defines
> >>>>>>>>  replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
> >>>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers=
/media/v4l2-core/v4l2-ctrls-core.c
> >>>>>>>> index a662fb60f73f..7a616ac91059 100644
> >>>>>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> >>>>>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> >>>>>>>> @@ -1168,6 +1168,8 @@ static int std_validate_compound(const str=
uct v4l2_ctrl *ctrl, u32 idx,
> >>>>>>>>               if (!area->width || !area->height)
> >>>>>>>>                       return -EINVAL;
> >>>>>>>>               break;
> >>>>>>>> +     case V4L2_CTRL_TYPE_FIXED_POINT:
> >>>>>>>> +             break;
> >>>>>>>
> >>>>>>> Hmm, this would need this patch 'v4l2-ctrls: add support for V4L2=
_CTRL_WHICH_MIN/MAX_VAL':
> >>>>>>>
> >>>>>>> https://patchwork.linuxtv.org/project/linux-media/patch/202310100=
22136.1504015-7-yunkec@google.com/
> >>>>>>>
> >>>>>>> since min and max values are perfectly fine for a fixed point val=
ue.
> >>>>>>>
> >>>>>>> Even a step value (currently not supported in that patch) would m=
ake sense.
> >>>>>>>
> >>>>>>> But I wonder if we couldn't simplify this: instead of creating a =
v4l2_ctrl_fixed_point,
> >>>>>>> why not represent the fixed point value as a Q31.32. Then the sta=
ndard
> >>>>>>> minimum/maximum/step values can be used, and it acts like a regul=
ar V4L2_TYPE_INTEGER64.
> >>>>>>>
> >>>>>>> Except that both userspace and drivers need to multiply it with 2=
^-32 to get the actual
> >>>>>>> value.
> >>>>>>>
> >>>>>>> So in enum v4l2_ctrl_type add:
> >>>>>>>
> >>>>>>>         V4L2_CTRL_TYPE_FIXED_POINT =3D 10,
> >>>>>>>
> >>>>>>> (10, because it is no longer a compound type).
> >>>>>>
> >>>>>> Seems we don't need V4L2_CTRL_TYPE_FIXED_POINT, just use V4L2_TYPE=
_INTEGER64?
> >>>>>>
> >>>>>> The reason I use the 'integer' and 'fractional' is that I want
> >>>>>> 'integer' to be the normal sample
> >>>>>> rate, for example 48kHz.  The 'fractional' is the difference with
> >>>>>> normal sample rate.
> >>>>>>
> >>>>>> For example, the rate =3D 47998.12345.  so integer =3D 48000,  fra=
ctional=3D -1.87655.
> >>>>>>
> >>>>>> So if we use s64 for rate, then in driver need to convert the rate=
 to
> >>>>>> the closed normal
> >>>>>> sample rate + fractional.
> >>>>>
> >>>>> That wasn't what the documentation said :-)
> >>>>>
> >>>>> So this is really two controls: one for the 'normal sample rate' (w=
hatever 'normal'
> >>>>> means in this context) and the offset to the actual sample rate.
> >>>>>
> >>>>> Presumably the 'normal' sample rate is set once, while the offset c=
hanges
> >>>>> regularly.
> >>>>>
> >>>>> But why do you need the 'normal' sample rate? With audio resampling=
 I assume
> >>>>> you resample from one rate to another, so why do you need a third '=
normal'
> >>>>> rate?
> >>>>>
> >>>>
> >>>> 'Normal' rate is used to select the prefilter table.
> >>>>
> >>>
> >>> Currently I think we may define
> >>> V4L2_CID_M2M_AUDIO_SOURCE_RATE
> >>> V4L2_CID_M2M_AUDIO_DEST_RATE
> >>
> >> That makes sense.
> >>
> >>> V4L2_CID_M2M_AUDIO_ASRC_RATIO_MOD
> >>
> >> OK, can you document this control? Just write it down in the reply, I =
just want
> >> to understand how the integer value you set here is used.
> >>
> >
> > It is Q31 value.   It is equal to:
> > in_rate_new / out_rate_new -  in_rate_old / out_rate_old
>
> So that's not an integer. Also, Q31 is limited to -1...1, and I think
> that's too limiting.
>
> For this having a Q31.32 fixed point type still makes a lot of sense.
>
> I still feel this is a overly complicated API.
>
> See more below...
>
> >
> > Best regards
> > Wang shengjiu
> >
> >> Regards,
> >>
> >>         Hans
> >>
> >>>
> >>> All of them can be V4L2_CTRL_TYPE_INTEGER.
> >>>
> >>> RATIO_MOD was defined in the very beginning version.
> >>> I think it is better to let users calculate this value.
> >>>
> >>> The reason is:
> >>> if we define the offset for source rate and dest rate in
> >>> driver separately,  when offset of source rate is set,
> >>> driver don't know if it needs to wait or not the dest rate
> >>> offset,  then go to calculate the ratio_mod.
>
> Ah, in order to update the ratio mod userspace needs to set both source a=
nd
> dest rate at the same time to avoid race conditions.
>
> That is perfectly possible in the V4L2 control framework. See:
>
> https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/v4l2-controls.h=
tml#control-clusters
>
> In practice, isn't it likely that you would fix either the source or
> destination rate, and let the other rate fluctuate? It kind of feels weir=
d
> to me that both source AND destination rates can fluctuate over time.
>
Right, the source and dest rates needn't change in same time.

> In any case, with a control cluster it doesn't really matter, you can set
> one rate or both rates, and it will be handled atomically.
>
> I feel that the RATIO_MOD control is too hardware specific. This is somet=
hing
> that should be hidden in the driver.
>

I will use:

V4L2_CID_M2M_AUDIO_SOURCE_RATE
V4L2_CID_M2M_AUDIO_DEST_RATE
V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET
V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET

'OFFSET' is V4L2_CTRL_TYPE_FIXED_POINT, which is Q31.32.

best regards
wang shengjiu

> Regards,
>
>         Hans
>
> >>>
> >>> best regards
> >>> wang shengjiu
> >>>
> >>>> Best regards
> >>>> Wang Shengjiu
> >>>>
> >>>>> Regards,
> >>>>>
> >>>>>         Hans
> >>>>>
> >>>>>>
> >>>>>> best regards
> >>>>>> wang shengjiu
> >>>>>>
> >>>>>>>
> >>>>>>>>
> >>>>>>>>       default:
> >>>>>>>>               return -EINVAL;
> >>>>>>>> @@ -1868,6 +1870,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(str=
uct v4l2_ctrl_handler *hdl,
> >>>>>>>>       case V4L2_CTRL_TYPE_AREA:
> >>>>>>>>               elem_size =3D sizeof(struct v4l2_area);
> >>>>>>>>               break;
> >>>>>>>> +     case V4L2_CTRL_TYPE_FIXED_POINT:
> >>>>>>>> +             elem_size =3D sizeof(struct v4l2_ctrl_fixed_point)=
;
> >>>>>>>> +             break;
> >>>>>>>>       default:
> >>>>>>>>               if (type < V4L2_CTRL_COMPOUND_TYPES)
> >>>>>>>>                       elem_size =3D sizeof(s32);
> >>>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers=
/media/v4l2-core/v4l2-ctrls-defs.c
> >>>>>>>> index 8696eb1cdd61..d8f232df6b6a 100644
> >>>>>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>>>>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>>>>>>> @@ -1602,6 +1602,10 @@ void v4l2_ctrl_fill(u32 id, const char **=
name, enum v4l2_ctrl_type *type,
> >>>>>>>>       case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
> >>>>>>>>               *type =3D V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
> >>>>>>>>               break;
> >>>>>>>> +     case V4L2_CID_ASRC_SOURCE_RATE:
> >>>>>>>> +     case V4L2_CID_ASRC_DEST_RATE:
> >>>>>>>> +             *type =3D V4L2_CTRL_TYPE_FIXED_POINT;
> >>>>>>>> +             break;
> >>>>>>>>       default:
> >>>>>>>>               *type =3D V4L2_CTRL_TYPE_INTEGER;
> >>>>>>>>               break;
> >>>>>>>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctr=
ls.h
> >>>>>>>> index 59679a42b3e7..645e4cccafc7 100644
> >>>>>>>> --- a/include/media/v4l2-ctrls.h
> >>>>>>>> +++ b/include/media/v4l2-ctrls.h
> >>>>>>>> @@ -56,6 +56,7 @@ struct video_device;
> >>>>>>>>   * @p_av1_tile_group_entry:  Pointer to an AV1 tile group entry=
 structure.
> >>>>>>>>   * @p_av1_frame:             Pointer to an AV1 frame structure.
> >>>>>>>>   * @p_av1_film_grain:                Pointer to an AV1 film gra=
in structure.
> >>>>>>>> + * @p_fixed_point:           Pointer to a struct v4l2_ctrl_fixe=
d_point.
> >>>>>>>>   * @p:                               Pointer to a compound valu=
e.
> >>>>>>>>   * @p_const:                 Pointer to a constant compound val=
ue.
> >>>>>>>>   */
> >>>>>>>> @@ -89,6 +90,7 @@ union v4l2_ctrl_ptr {
> >>>>>>>>       struct v4l2_ctrl_av1_tile_group_entry *p_av1_tile_group_en=
try;
> >>>>>>>>       struct v4l2_ctrl_av1_frame *p_av1_frame;
> >>>>>>>>       struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
> >>>>>>>> +     struct v4l2_ctrl_fixed_point *p_fixed_point;
> >>>>>>>>       void *p;
> >>>>>>>>       const void *p_const;
> >>>>>>>>  };
> >>>>>>>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/l=
inux/v4l2-controls.h
> >>>>>>>> index c3604a0a3e30..91096259e3ea 100644
> >>>>>>>> --- a/include/uapi/linux/v4l2-controls.h
> >>>>>>>> +++ b/include/uapi/linux/v4l2-controls.h
> >>>>>>>> @@ -112,6 +112,8 @@ enum v4l2_colorfx {
> >>>>>>>>
> >>>>>>>>  /* last CID + 1 */
> >>>>>>>>  #define V4L2_CID_LASTP1                         (V4L2_CID_BASE+=
44)
> >>>>>>>> +#define V4L2_CID_ASRC_SOURCE_RATE            (V4L2_CID_BASE + 4=
5)
> >>>>>>>> +#define V4L2_CID_ASRC_DEST_RATE                      (V4L2_CID_=
BASE + 46)
> >>>>>>>
> >>>>>>> This patch needs to be split in three parts:
> >>>>>>>
> >>>>>>> 1) Add the new M2M_AUDIO control class,
> >>>>>>> 2) Add the new V4L2_CTRL_TYPE_FIXED_POINT type,
> >>>>>>> 3) Add the new controls.
> >>>>>>>
> >>>>>>> These are all independent changes, so separating them makes it ea=
sier to
> >>>>>>> review.
> >>>>>>>
> >>>>>>>>
> >>>>>>>>  /* USER-class private control IDs */
> >>>>>>>>
> >>>>>>>> @@ -3488,4 +3490,15 @@ struct v4l2_ctrl_av1_film_grain {
> >>>>>>>>  #define V4L2_CID_MPEG_MFC51_BASE        V4L2_CID_CODEC_MFC51_BA=
SE
> >>>>>>>>  #endif
> >>>>>>>>
> >>>>>>>> +/**
> >>>>>>>> + * struct v4l2_ctrl_fixed_point - fixed point parameter.
> >>>>>>>> + *
> >>>>>>>> + * @rate_integer: integer part of fixed point value.
> >>>>>>>> + * @rate_fractional: fractional part of fixed point value
> >>>>>>>> + */
> >>>>>>>> +struct v4l2_ctrl_fixed_point {
> >>>>>>>> +     __u32 integer;
> >>>>>>>
> >>>>>>> __s32?
> >>>>>>>
> >>>>>>>> +     __u32 fractional;
> >>>>>>>> +};
> >>>>>>>> +
> >>>>>>>>  #endif
> >>>>>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux=
/videodev2.h
> >>>>>>>> index 2ac7b989394c..3ef32c09c2fa 100644
> >>>>>>>> --- a/include/uapi/linux/videodev2.h
> >>>>>>>> +++ b/include/uapi/linux/videodev2.h
> >>>>>>>> @@ -1888,6 +1888,7 @@ struct v4l2_ext_control {
> >>>>>>>>               struct v4l2_ctrl_av1_tile_group_entry __user *p_av=
1_tile_group_entry;
> >>>>>>>>               struct v4l2_ctrl_av1_frame __user *p_av1_frame;
> >>>>>>>>               struct v4l2_ctrl_av1_film_grain __user *p_av1_film=
_grain;
> >>>>>>>> +             struct v4l2_ctrl_fixed_point __user *p_fixed_point=
;
> >>>>>>>>               void __user *ptr;
> >>>>>>>>       };
> >>>>>>>>  } __attribute__ ((packed));
> >>>>>>>> @@ -1966,6 +1967,8 @@ enum v4l2_ctrl_type {
> >>>>>>>>       V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY =3D 0x281,
> >>>>>>>>       V4L2_CTRL_TYPE_AV1_FRAME            =3D 0x282,
> >>>>>>>>       V4L2_CTRL_TYPE_AV1_FILM_GRAIN       =3D 0x283,
> >>>>>>>> +
> >>>>>>>> +     V4L2_CTRL_TYPE_FIXED_POINT          =3D 0x290,
> >>>>>>>>  };
> >>>>>>>>
> >>>>>>>>  /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
> >>>>>>>
> >>>>>>> Regards,
> >>>>>>>
> >>>>>>>         Hans
> >>>>>
> >>
>
