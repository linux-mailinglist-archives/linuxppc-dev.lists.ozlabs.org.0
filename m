Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D087AA71D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 04:52:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lN30A9ly;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsGyt2hl7z3ccb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 12:52:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lN30A9ly;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsGxy2sbwz3cDg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 12:51:48 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-577fb90bb76so1009322a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 19:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695351104; x=1695955904; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYkrqB9uA7M+0eOAqW1r8qSkknHUZhDVrIi/aSlq6T8=;
        b=lN30A9lyP2dY6fCXtr8UVJCY6FziwPResgzlLbK/Rhlt+yjhNACSUSd3ylbWjyCBki
         2DTdxWrxibmnYuDuG6lXtlrZQ7Xr+KUt6CTaExbEhiKFEHUEqL3/krvWT2V/yaQYGJmD
         +EpbQhkYU9fgynOlRjtTCtqT1nDgvvBB8aSKi0capQrANxlmZtap4oxSnKkqlSOKAXoS
         qoBAABfewPO5ROPcVdjBskWTTZVNibMNmhAPpO0RUuQUrMOF5SMj2C+kB+qT7L+K7Dmj
         ckRjuk66FlXj2sk6TqbIB5XkhUAMmmmsnzHcO/hFvGWDcoZVb+ty912A9NA8Mclguvat
         avBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695351104; x=1695955904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYkrqB9uA7M+0eOAqW1r8qSkknHUZhDVrIi/aSlq6T8=;
        b=BB37yx2yBcACO+xOPvM19RbOXLjSkwCfBJ8hs8dOJqIrWYNmtO1qCXzINR/zfNqVIE
         Ut4AHjGWventD7wLCe+qChqqf1EhGBZIa3+yCqoU0xZqUlhHQcHSFiwA3wiZyqrEpcNj
         ybg7K1Uf+ko+Wzu7C869UUuXdZtDl01LzxF+qBdR94r7ZAa6DnhdQzc+b0pzhljm8ReP
         zNHQI03mi+zHYSRmKvbPrHx4PM0lszVODqDEDb4bTgdLpl+Mq9Pfc8ctjR5N9FasC4xq
         0GgqZErTZs5o1+iffxaoC624jHi94gkJfYlSVvdtMvfuuWu8BywgLKogZSHRM+F/dds5
         b9KA==
X-Gm-Message-State: AOJu0YwZudgYXAowTMFiwDrPJy48DBmO2k6jpxWhYEmNFgJdSjOfKs9g
	SzjO2fX+keVn0ievnGoEGYepKoCxudu5GMC5u/uPfbqmXek=
X-Google-Smtp-Source: AGHT+IGtiz5wXyrbAhyFg8avb8jX5ymjFN23gqRi0pY8tk76E77xHmkQsY5RA8geWyon6mrn/RqdLparfr1kcZjp+nY=
X-Received: by 2002:a17:90b:19cb:b0:276:cd68:6081 with SMTP id
 nm11-20020a17090b19cb00b00276cd686081mr5418829pjb.40.1695351103836; Thu, 21
 Sep 2023 19:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <1695202370-24678-1-git-send-email-shengjiu.wang@nxp.com>
 <1695202370-24678-10-git-send-email-shengjiu.wang@nxp.com>
 <fbedcbf1-d925-47d6-b9fb-c9e15263c117@xs4all.nl> <CAA+D8APyNGFSry1GUv6TOW0nKYHKSwQd5bTcRNuT7cu0Xf8eUA@mail.gmail.com>
 <5292ce53-643e-44f0-b2cc-cb66efee9712@xs4all.nl> <CAA+D8AMZN59uTRs2sOrSeVb5AGopTzurNVCTNwJOVPahfEXd+w@mail.gmail.com>
 <2d44d574-08e5-4db3-87d9-5d12657f8935@xs4all.nl>
In-Reply-To: <2d44d574-08e5-4db3-87d9-5d12657f8935@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 22 Sep 2023 10:51:32 +0800
Message-ID: <CAA+D8AN+Uz+3CN9BnD5R_gp5opD1v-D8FBjANRpGrH43Ac2tdg@mail.gmail.com>
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

On Thu, Sep 21, 2023 at 10:09=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> =
wrote:
>
> On 21/09/2023 13:13, Shengjiu Wang wrote:
> > On Thu, Sep 21, 2023 at 3:11=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.n=
l> wrote:
> >>
> >> On 21/09/2023 08:55, Shengjiu Wang wrote:
> >>> On Wed, Sep 20, 2023 at 6:19=E2=80=AFPM Hans Verkuil <hverkuil@xs4all=
.nl> wrote:
> >>>>
> >>>> On 20/09/2023 11:32, Shengjiu Wang wrote:
> >>>>> The input clock and output clock may not be the accurate
> >>>>> rate as the sample rate, there is some drift, so the convert
> >>>>> ratio of i.MX ASRC module need to be changed according to
> >>>>> actual clock rate.
> >>>>>
> >>>>> Add V4L2_CID_USER_IMX_ASRC_RATIO_MOD control for user to
> >>>>> adjust the ratio.
> >>>>>
> >>>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>>> ---
> >>>>>  Documentation/userspace-api/media/v4l/control.rst | 5 +++++
> >>>>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 1 +
> >>>>>  include/uapi/linux/v4l2-controls.h                | 1 +
> >>>>>  3 files changed, 7 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Do=
cumentation/userspace-api/media/v4l/control.rst
> >>>>> index 4463fce694b0..2bc175900a34 100644
> >>>>> --- a/Documentation/userspace-api/media/v4l/control.rst
> >>>>> +++ b/Documentation/userspace-api/media/v4l/control.rst
> >>>>> @@ -318,6 +318,11 @@ Control IDs
> >>>>>      depending on particular custom controls should check the drive=
r name
> >>>>>      and version, see :ref:`querycap`.
> >>>>>
> >>>>> +.. _v4l2-audio-imx:
> >>>>> +
> >>>>> +``V4L2_CID_USER_IMX_ASRC_RATIO_MOD``
> >>>>> +    sets the rasampler ratio modifier of i.MX asrc module.
> >>>>
> >>>> rasampler -> resampler (I think?)
> >>>>
> >>>> This doesn't document at all what the type of the control is or how =
to interpret it.
> >>>>
> >>>>> +
> >>>>>  Applications can enumerate the available controls with the
> >>>>>  :ref:`VIDIOC_QUERYCTRL` and
> >>>>>  :ref:`VIDIOC_QUERYMENU <VIDIOC_QUERYCTRL>` ioctls, get and set a
> >>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/me=
dia/v4l2-core/v4l2-ctrls-defs.c
> >>>>> index 8696eb1cdd61..16f66f66198c 100644
> >>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>>>> @@ -1242,6 +1242,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >>>>>       case V4L2_CID_COLORIMETRY_CLASS:        return "Colorimetry C=
ontrols";
> >>>>>       case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:               retur=
n "HDR10 Content Light Info";
> >>>>>       case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:      retur=
n "HDR10 Mastering Display";
> >>>>> +     case V4L2_CID_USER_IMX_ASRC_RATIO_MOD:                  retur=
n "ASRC RATIO MOD";
> >>>>
> >>>> Let's stay consistent with the other control names:
> >>>>
> >>>> "ASRC Ratio Modifier"
> >>>>
> >>>> But if this is a driver specific control, then this doesn't belong h=
ere.
> >>>>
> >>>> Driver specific controls are defined in the driver itself, including=
 this
> >>>> description.
> >>>>
> >>>> Same for the control documentation: if it is driver specific, then t=
hat
> >>>> typically is documented either in a driver-specific public header, o=
r
> >>>> possibly in driver-specific documentation (Documentation/admin-guide=
/media/).
> >>>>
> >>>> But is this imx specific? Wouldn't other similar devices need this?
> >>>
> >>> It is imx specific.
> >>
> >> Why? I'm not opposed to this, but I wonder if you looked at datasheets=
 of
> >> similar devices from other vendors: would they use something similar?
> >
> > I tried to find some datasheets for other vendors, but failed to find t=
hem.
> > So I don't know how they implement this part.
> >
> > Ratio modification on i.MX is to modify the configured ratio.
> > For example, the input rate is 44.1kHz,  output rate is 48kHz,
> > configured ratio =3D 441/480,   the ratio modification is to modify
> > the fractional part of (441/480) with small steps.  because the
> > input clock or output clock has drift in the real hardware.
> > The ratio modification is signed value, it is added to configured
> > ratio.
> >
> > In our case, we have some sysfs interface for user to get the
> > clock from input audio device and output audio device, user
> > need to calculate the ratio dynamically , then configure the
> > modification to driver
>
> So this ratio modifier comes into play when either the audio input
> or audio output (or both) are realtime audio inputs/outputs where
> the sample rate is not a perfect 44.1 or 48 kHz, but slightly different?

yes.

>
> If you would use this resampler to do offline resampling (i.e. resample
> a 44.1 kHz wav file to a 48 kHz wav file), then this wouldn't be needed,
> correct?

yes.

>
> When dealing with realtime audio, userspace will know how to get the
> precise sample rate, but that is out-of-scope of this driver. Here
> you just need a knob to slightly tweak the resampling ratio.
>
> If my understanding is correct, then I wonder if it is such a good
> idea to put the rate into the v4l2_audio_format: it really has nothing
> to do with the audio format as it is stored in memory.
>
> What if you would drop that 'rate' field and instead create just a single
> control for the resampling ratio. This can use struct v4l2_fract to repre=
sent
> a fraction. It would be more work since v4l2_fract is currently not suppo=
rted
> for controls, but it is not hard to add support for that (just a bit tedi=
ous)
> and I actually think this might be a perfect solution.
>
> That way userspace can quite precisely tweak the ratio on the fly, and
> it is a generic solution as well instead of mediatek specific.
>

(rate, channel, format) are the basic parameters for audio stream.
For example, if there is decoder/encoder requirement, the rate field is
still needed,  I think the rate shouldn't be removed.

tweak ratio is not always needed by use case. As you said, for
file to file conversion, it is not needed, so keeping 'rate' is necessary.

best regards
wang shengjiu

> Regards,
>
>         Hans
>
> >
> > May be other vendors has similar implementation. or make
> > the definition be generic is an option.
> >
> > best regards
> > wang shengjiu
> >
> >>
> >> And the very short description you gave in the commit log refers to in=
put
> >> and output clock: how would userspace know those clock frequencies? In
> >> other words, what information does userspace need in order to set this
> >> control correctly? And is that information actually available? How wou=
ld
> >> you use this control?
> >>
> >> I don't really understand how this is supposed to be used.
> >>
> >>>
> >>> Does this mean that I need to create a header file in include/uapi/li=
nux
> >>> folder to put this definition?  I just hesitate if this is necessary.
> >>
> >> Yes, put it there. There are some examples of this already:
> >>
> >> include/uapi/linux/aspeed-video.h
> >> include/uapi/linux/max2175.h
> >>
> >>>
> >>> There is folder Documentation/userspace-api/media/drivers/ for driver=
s
> >>> Should this document in this folder, not in the
> >>> Documentation/admin-guide/media/?
> >>
> >> Yes, you are correct. For the headers above, the corresponding documen=
tation
> >> is in:
> >>
> >> Documentation/userspace-api/media/drivers/aspeed-video.rst
> >> Documentation/userspace-api/media/drivers/max2175.rst
> >>
> >> So you have some examples as reference.
> >>
> >> Frankly, what is in admin-guide and in userspace-api is a bit random, =
it
> >> probably could use a cleanup.
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>>
> >>> Best regards
> >>> Wang shengjiu
> >>>>
> >>>>>       default:
> >>>>>               return NULL;
> >>>>>       }
> >>>>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linu=
x/v4l2-controls.h
> >>>>> index c3604a0a3e30..b1c319906d12 100644
> >>>>> --- a/include/uapi/linux/v4l2-controls.h
> >>>>> +++ b/include/uapi/linux/v4l2-controls.h
> >>>>> @@ -162,6 +162,7 @@ enum v4l2_colorfx {
> >>>>>  /* The base for the imx driver controls.
> >>>>>   * We reserve 16 controls for this driver. */
> >>>>>  #define V4L2_CID_USER_IMX_BASE                       (V4L2_CID_USE=
R_BASE + 0x10b0)
> >>>>> +#define V4L2_CID_USER_IMX_ASRC_RATIO_MOD     (V4L2_CID_USER_IMX_BA=
SE + 0)
> >>>>>
> >>>>>  /*
> >>>>>   * The base for the atmel isc driver controls.
> >>>>
> >>>> Regards,
> >>>>
> >>>>         Hans
> >>
>
