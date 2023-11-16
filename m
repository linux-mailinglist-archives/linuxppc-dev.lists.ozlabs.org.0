Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 052727EDC15
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 08:38:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=e2TbZXj4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWBjC6b8Kz3d8Y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 18:38:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=e2TbZXj4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=tfiga@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWBhJ47QYz2ykV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 18:37:34 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-53e08e439c7so691612a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 23:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700120242; x=1700725042; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUoHqMa5bMDIiRHmyl9q7kYLp0heHW41yVITFKQdPkg=;
        b=e2TbZXj4B1B0m0Xdcgsv3L3bgFwVAXB5dutAI90yiXdy/d0tfKFvwZLB5NQ/FfFEiw
         2fzm2u44sHfYc3BrA97Rmp0WllnIppmqRfXlY9rkCEusGiKa9U9GWregU9oNIh86WnyW
         3VXWoUjNozJZYurMEurJ9sWHpJNi6vl9VeVSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700120242; x=1700725042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QUoHqMa5bMDIiRHmyl9q7kYLp0heHW41yVITFKQdPkg=;
        b=o5bulN4LptJynpKCdrForIWF8fRQXkW3apy3WPrd/y1Zct05wOQ94cUZBmAGcDZK/W
         PFSToEIDU5sIEzxeH2V6oPfPNaw59KZFekj8je5rAP94J17tZCbPpscOEoYm7eIvGloO
         wgFd7ImzBIVjKL0gV6Jt8hvuAfJ+vJhXfvA3hhbaF1z2m86fx5d5Q/V+KMu2oPR24PFA
         hqpgX5+FeqkpKAbchCmUwYgkRFzMw7wJXcY5V++5dAC5Po91lHvb6mE3KNIzwMP7CsRH
         x4u4VJNbOWcufkbS2oulPz6z0lH8FC4+8hId6C+xAPFKIeIbXY4pCTBLpB87y9W4l9dj
         FkGQ==
X-Gm-Message-State: AOJu0YzemLL+DhmARK0gfe7ObY3bS3UkVbITlV/glszLxLlzNOzkR7Ce
	/tXO9XirC5gU9lVR31cKGPklTTKtK7wfLXK/8e7ZOAks
X-Google-Smtp-Source: AGHT+IF/1rwA+2NfjN+jUB2iMtrVk+VKdGjGvZvrEOSXHIM7X7DJFDoKR53oJx6zkW7CbSVDXmC8HQ==
X-Received: by 2002:a17:906:e084:b0:9c6:64be:a3c9 with SMTP id gh4-20020a170906e08400b009c664bea3c9mr11887230ejb.39.1700120241626;
        Wed, 15 Nov 2023 23:37:21 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id mb8-20020a170906eb0800b009bf7a4d591csm8129960ejb.11.2023.11.15.23.37.21
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 23:37:21 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-53f9af41444so676698a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 23:37:21 -0800 (PST)
X-Received: by 2002:adf:a19e:0:b0:32f:7bde:fa0 with SMTP id
 u30-20020adfa19e000000b0032f7bde0fa0mr10265212wru.32.1700119920153; Wed, 15
 Nov 2023 23:32:00 -0800 (PST)
MIME-Version: 1.0
References: <6a3e7eb9-505c-4cfb-8a86-a8947a2e44d5@xs4all.nl>
 <20231113110754.GB24338@pendragon.ideasonboard.com> <3e898664-cbfc-4892-9765-37b66891643b@xs4all.nl>
 <ZVIIc-fi32ZxIi-p@valkosipuli.retiisi.eu> <20231113114357.GD24338@pendragon.ideasonboard.com>
 <da6efe14-c00d-4bf4-bf61-dd4ed39c5c60@xs4all.nl> <20231113124412.GA18974@pendragon.ideasonboard.com>
 <b35601f7-8bb2-4317-a8f7-6fbf81572943@xs4all.nl> <20231115105518.GD13826@pendragon.ideasonboard.com>
 <a67491c0-4fdf-4472-852c-e75f5e1d67af@xs4all.nl> <20231115114931.GE13826@pendragon.ideasonboard.com>
In-Reply-To: <20231115114931.GE13826@pendragon.ideasonboard.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 16 Nov 2023 16:31:41 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BkCR=tYvmfjkOeTnjnccmURt8kEtiRee9CYqcz+FGHfg@mail.gmail.com>
Message-ID: <CAAFQd5BkCR=tYvmfjkOeTnjnccmURt8kEtiRee9CYqcz+FGHfg@mail.gmail.com>
Subject: Re: [PATCH v9 10/15] media: uapi: Add V4L2_CTRL_TYPE_FIXED_POINT
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, Hans Verkuil <hverkuil@xs4all.nl>, broonie@kernel.org, Sakari Ailus <sakari.ailus@iki.fi>, m.szyprowski@samsung.com, mchehab@kernel.org, shengjiu.wang@gmail.com, perex@perex.cz, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 15, 2023 at 8:49=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Hans,
>
> On Wed, Nov 15, 2023 at 12:19:31PM +0100, Hans Verkuil wrote:
> > On 11/15/23 11:55, Laurent Pinchart wrote:
> > > On Wed, Nov 15, 2023 at 09:09:42AM +0100, Hans Verkuil wrote:
> > >> On 13/11/2023 13:44, Laurent Pinchart wrote:
> > >>> On Mon, Nov 13, 2023 at 01:05:12PM +0100, Hans Verkuil wrote:
> > >>>> On 13/11/2023 12:43, Laurent Pinchart wrote:
> > >>>>> On Mon, Nov 13, 2023 at 11:28:51AM +0000, Sakari Ailus wrote:
> > >>>>>> On Mon, Nov 13, 2023 at 12:24:14PM +0100, Hans Verkuil wrote:
> > >>>>>>> On 13/11/2023 12:07, Laurent Pinchart wrote:
> > >>>>>>>> On Mon, Nov 13, 2023 at 11:56:49AM +0100, Hans Verkuil wrote:
> > >>>>>>>>> On 13/11/2023 11:42, Laurent Pinchart wrote:
> > >>>>>>>>>> On Mon, Nov 13, 2023 at 11:29:09AM +0100, Hans Verkuil wrote=
:
> > >>>>>>>>>>> On 10/11/2023 06:48, Shengjiu Wang wrote:
> > >>>>>>>>>>>> Fixed point controls are used by the user to configure
> > >>>>>>>>>>>> a fixed point value in 64bits, which Q31.32 format.
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > >>>>>>>>>>>
> > >>>>>>>>>>> This patch adds a new control type. This is something that =
also needs to be
> > >>>>>>>>>>> tested by v4l2-compliance, and for that we need to add supp=
ort for this to
> > >>>>>>>>>>> one of the media test-drivers. The best place for that is t=
he vivid driver,
> > >>>>>>>>>>> since that has already a bunch of test controls for other c=
ontrol types.
> > >>>>>>>>>>>
> > >>>>>>>>>>> See e.g. VIVID_CID_INTEGER64 in vivid-ctrls.c.
> > >>>>>>>>>>>
> > >>>>>>>>>>> Can you add a patch adding a fixed point test control to vi=
vid?
> > >>>>>>>>>>
> > >>>>>>>>>> I don't think V4L2_CTRL_TYPE_FIXED_POINT is a good idea. Thi=
s seems to
> > >>>>>>>>>> relate more to units than control types. We have lots of fix=
ed-point
> > >>>>>>>>>> values in controls already, using the 32-bit and 64-bit inte=
ger control
> > >>>>>>>>>> types. They use various locations for the decimal point, dep=
ending on
> > >>>>>>>>>> the control. If we want to make this more explicit to users,=
 we should
> > >>>>>>>>>> work on adding unit support to the V4L2 controls.
> > >>>>>>>>>
> > >>>>>>>>> "Fixed Point" is not a unit, it's a type. 'Db', 'Hz' etc. are=
 units.
> > >>>>>>>>
> > >>>>>>>> It's not a unit, but I think it's related to units. My point i=
s that,
> > >>>>>>>> without units support, I don't see why we need a formal defini=
tion of
> > >>>>>>>> fixed-point types, and why this series couldn't just use
> > >>>>>>>> VIVID_CID_INTEGER64. Drivers already interpret VIVID_CID_INTEG=
ER64
> > >>>>>>>> values as they see fit.
> > >>>>>>>
> > >>>>>>> They do? That's new to me. A quick grep for V4L2_CTRL_TYPE_INTE=
GER64
> > >>>>>>> (I assume you meant that rather than VIVID_CID_INTEGER64) shows=
 that it
> > >>>>>
> > >>>>> Yes, I meant V4L2_CTRL_TYPE_INTEGER64. Too hasty copy & paste :-)
> > >>>>>
> > >>>>>>> is always interpreted as a 64 bit integer and nothing else. As =
it should.
> > >>>>>
> > >>>>> The most common case for control handling in drivers is taking th=
e
> > >>>>> integer value and converting it to a register value, using
> > >>>>> device-specific encoding of the register value. It can be a fixed=
-point
> > >>>>> format or something else, depending on the device. My point is th=
at
> > >>>>> drivers routinely convert a "plain" integer to something else, an=
d that
> > >>>>> has never been considered as a cause of concern. I don't see why =
it
> > >>>>> would be different in this series.
> > >>>>>
> > >>>>>>> And while we do not have support for units (other than the docu=
mentation),
> > >>>>>>> we do have type support in the form of V4L2_CTRL_TYPE_*.
> > >>>>>>>
> > >>>>>>>>> A quick "git grep -i "fixed point" Documentation/userspace-ap=
i/media/'
> > >>>>>>>>> only shows a single driver specific control (dw100.rst).
> > >>>>>>>>>
> > >>>>>>>>> I'm not aware of other controls in mainline that use fixed po=
int.
> > >>>>>>>>
> > >>>>>>>> The analog gain control for sensors for instance.
> > >>>>>>>
> > >>>>>>> Not really. The documentation is super vague:
> > >>>>>>>
> > >>>>>>> V4L2_CID_ANALOGUE_GAIN (integer)
> > >>>>>>>
> > >>>>>>>       Analogue gain is gain affecting all colour components in =
the pixel matrix. The
> > >>>>>>>       gain operation is performed in the analogue domain before=
 A/D conversion.
> > >>>>>>>
> > >>>>>>> And the integer is just a range. Internally it might map to som=
e fixed
> > >>>>>>> point value, but userspace won't see that, it's hidden in the d=
river AFAICT.
> > >>>>>
> > >>>>> It's hidden so well that libcamera has a database of the sensor i=
t
> > >>>>> supports, with formulas to map a real gain value to the
> > >>>>> V4L2_CID_ANALOGUE_GAIN control. The encoding of the integer value=
 does
> > >>>>> matter, and the kernel doesn't expose it. We may or may not consi=
der
> > >>>>> that as a shortcoming of the V4L2 control API, but in any case it=
's the
> > >>>>> situation we have today.
> > >>>>>
> > >>>>>> I wonder if Laurent meant digital gain.
> > >>>>>
> > >>>>> No, I meant analog. It applies to digital gain too though.
> > >>>>>
> > >>>>>> Those are often Q numbers. The practice there has been that the =
default
> > >>>>>> value yields gain of 1.
> > >>>>>>
> > >>>>>> There are probably many other examples in controls where somethi=
ng being
> > >>>>>> controlled isn't actually an integer while integer controls are =
still being
> > >>>>>> used for the purpose.
> > >>>>>
> > >>>>> A good summary of my opinion :-)
> > >>>>
> > >>>> And that works fine as long as userspace doesn't need to know what=
 the value
> > >>>> actually means.
> > >>>>
> > >>>> That's not the case here. The control is really a fractional Hz va=
lue:
> > >>>>
> > >>>> +``V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET (fixed point)``
> > >>>> +    Sets the offset from the audio source sample rate, unit is Hz=
.
> > >>>> +    The offset compensates for any clock drift. The actual source=
 audio sample
> > >>>> +    rate is the ideal source audio sample rate from
> > >>>> +    ``V4L2_CID_M2M_AUDIO_SOURCE_RATE`` plus this fixed point offs=
et.
> > >>>
> > >>> I don't see why this would require a new type, you can use
> > >>> V4L2_CTRL_TYPE_INTEGER64, and document the control as containing
> > >>> fixed-point values in Q31.32 format.
> > >>
> > >> Why would you want to do this? I can store a double in a long long i=
nt,
> > >> and just document that the variable is really a double, but why woul=
d you?
> > >
> > > I'm happy we have no floating point control types ;-)
> > >
> > >> The cost of adding a FIXED_POINT type is minimal, and having this ty=
pe
> > >> makes it easy to work with fixed point controls (think about proper =
reporting
> > >> and setting of the value in v4l2-ctl and user applications in genera=
l that
> > >> deal with controls).
> > >
> > > The next thing you know is that someone will want a FIXED_POINT_Q15_1=
6
> > > type as 64-bit would be too large to store in a large array. And then
> > > Q7.8. And Q3.12. And a bunch of other type. I really don't see what
> > > added value they bring compared to using the 32-bit and 64-bit intege=
r
> > > types we already have. Every new type that is added adds complexity t=
o
> > > userspace that will need to deal with the type.
> > >
> > >> If this would add a thousand lines of complex code, then this would =
be a
> > >> consideration, but this is just a few lines.
> > >>
> > >> Just to give an example, if you use 'v4l2-ctl -l' to list a int64 co=
ntrol
> > >> and it reports the value 13958643712, would you be able to see that =
that is
> > >> really 3.25 in fixed point format? With the right type it would be p=
rinted
> > >> like that. Much easier to work work.
> > >
> > > The same is true for analog gains, where x1.23 or +12dB is nicer to r=
ead
> > > than raw values. If we care about printing values in command line too=
ls
> > > (which is nice to have, but certainly not the majority of use cases),
> > > then I would recommand working on units support for V4L2 controls, to
> > > convey how values are encoded, and in what unit they are expressed.
> >
> > So you prefer to have a way to specify the N value in QM.N as part
> > of the control information?
> >
> > E.g. add a '__u8 fraction_bits' field to structs v4l2_query_ext_ctrl
> > and v4l2_queryctrl. If 0, then it is an integer, otherwise it is the N
> > in QM.N.
> >
> > I can go along with that. This would be valid for INTEGER, INTEGER64,
> > U8, U16 and U32 controls (the last three are only used in control array=
s).
>
> I think that would be nicer. Not only is it more flexible, but it also
> allows applications to ignore that information, and still operate on
> integer controls without any modification.
>
> > A better name for 'fraction_bits' is welcome, I took it from the wikipe=
dia
> > article: https://en.wikipedia.org/wiki/Fixed-point_arithmetic
> >

I like the idea and the name sounds fine to me too.

> > Reporting unit names is certainly possible, but should perhaps be done
> > with a separate ioctl? E.g. VIDIOC_QUERY_CTRL_UNIT. It is not typically
> > needed for applications, unless they need to report values. In theory
> > it can also be reported through VIDIOC_QUERY_EXT_CTRL by using, say,
> > 4 of the reserved fields for a 'char unit[16];' field. But I feel a
> > bit uncomfortable taking reserved fields for something that is rarely
> > needed.
>
> I would make the unit an enumerated integer value. If it's a string, it
> gets more difficult to operate on. Having to standardize a unit means
> that the unit will get reviewed.
>

What usage do we envision for units? Could one give some examples? My
impression is that we already defined most of the controls with
explicit units.

> > >>>>>> Instead of this patch, I'd prefer to have a way to express the m=
eaning of
> > >>>>>> the control value, be it a Q number or something else, and do th=
at
> > >>>>>> independently of the type of the control.
> > >>>>
> > >>>> Huh? How is that different from the type of the control? You have =
integers
> > >>>> (one type) and fixed point (another type).
> > >>>>
> > >>>> Or do you want a more general V4L2_CTRL_TYPE_ that specifies the N=
.M values
> > >>>> explicitly?
> > >>>>
> > >>>> I think the main reason why we use integer controls for gain is th=
at we
> > >>>> never had a fixed point control type and you could get away with t=
hat in
> > >>>> user space for that particular use-case.
> > >>>>
> > >>>> Based on the V4L2_CID_NOTIFY_GAINS documentation the gain value ca=
n typically
> > >>>> be calculated as (value / default_value),
> > >>>
> > >>> Typically, but not always. Some sensor have an exponential gain mod=
el,
> > >>> and some have weird gain representation, such as 1/x. That's gettin=
g out
> > >>> of scope though.
> > >>>
> > >>>> but that won't work for a rate offset
> > >>>> control as above, or for e.g. CSC matrices for color converters.
> > >>>>
> > >>>>> Agreed.
> > >>>>>
> > >>>>>>> In the case of this particular series the control type is reall=
y a fixed point
> > >>>>>>> value with a documented unit (Hz). It really is not something y=
ou want to
> > >>>>>>> use type INTEGER64 for.
> > >>>>>>>
> > >>>>>>>>> Note that V4L2_CTRL_TYPE_FIXED_POINT is a Q31.32 format. By s=
etting
> > >>>>>>>>> min/max/step you can easily map that to just about any QN.M f=
ormat where
> > >>>>>>>>> N <=3D 31 and M <=3D 32.
> > >>>>>>>>>
> > >>>>>>>>> In the case of dw100 it is a bit different in that it is quit=
e specialized
> > >>>>>>>>> and it had to fit in 16 bits.
>
> --
> Regards,
>
> Laurent Pinchart
