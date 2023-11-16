Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 416267EDD73
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 10:16:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GOgy2Rgm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWDt41951z3d96
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 20:16:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GOgy2Rgm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWDs75VMMz3cFh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 20:15:21 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6bee11456baso513532b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 01:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700126118; x=1700730918; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+d9N89OMFeO33CQui3a6Kx5Dd/xHDLmk5c8TCPndM10=;
        b=GOgy2Rgm4BlsOAQP2G3aUO52KP3+USvpzUPb5R1r1URw5wtuRbeuIXKzkH8HcITNg/
         mAOVLnwlDCWecc8Rml9/peN579SUc1mByM4vhbZPejAc0XhZ0E4evYYIILeIECV7a1eS
         EXlhos7ZD1eYZHdz+i7N4W25DgczfiBU3K63ul2YswQOVes24LMmXrRQMU7JKaKxRglm
         o5WV0Pk44eqeYm1Lg6zSuY7PrBOi4WBJyrHHuSVNaofAo161EeEnDMVdWr9aJiUFK+ky
         sg0nrZLUXJrWqFN5GmqPuijxoM9nsKrzfatbkfbpfyQJHfG/lBrR9ShTysafA/MsB4/C
         t3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700126118; x=1700730918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+d9N89OMFeO33CQui3a6Kx5Dd/xHDLmk5c8TCPndM10=;
        b=acK1icxH9L4+nGddwhiH9eTsmrdEf0EekFj2fhEb+JZK69NYoUT22qxPVt3etZ89xn
         x3YWn35uxvQQwR5kxMS7UCmiCoAAt9Vu+pxRhEgASC6Y4mMmG4eOpm/z6rcrzApXXXZB
         TD5HEBnmJnLMH0zVuzne4BqKIjGt5PoOGcg56Z1PxxCRDq+FqBjN/hrfnwcsMWbCKn/j
         4FEai62XVSargl2nr8kkmFOt0vpG2y/p/NJM3kBklkE7IdOUT6whryQkV5XplIZU54M0
         3Od5ZWRXL+DKfjKMnjBi4Qf4rENkDgijR/lCp8R0YQAkqRfl20dSxY4l6MlCTJSx6sDI
         DPag==
X-Gm-Message-State: AOJu0Yy+KB4+ibUQ9OHQmuFUNHfP3hour8ixq3QG6t+fMn5z669uMifc
	jf97o1L/mrAJYIcOtFn5BSnmNN0UJYR6g4hEd/Q=
X-Google-Smtp-Source: AGHT+IEY46jPGNuJPy7j7GS/hOlQfUYREEXhLeGoTEKdSvbj9ld8s+Efyh6T8SpjgdW4T3vHwooVV4CEEYpkPmrdD0U=
X-Received: by 2002:a05:6a21:18b:b0:187:1606:2fc5 with SMTP id
 le11-20020a056a21018b00b0018716062fc5mr8908222pzb.50.1700126118438; Thu, 16
 Nov 2023 01:15:18 -0800 (PST)
MIME-Version: 1.0
References: <6a3e7eb9-505c-4cfb-8a86-a8947a2e44d5@xs4all.nl>
 <20231113110754.GB24338@pendragon.ideasonboard.com> <3e898664-cbfc-4892-9765-37b66891643b@xs4all.nl>
 <ZVIIc-fi32ZxIi-p@valkosipuli.retiisi.eu> <20231113114357.GD24338@pendragon.ideasonboard.com>
 <da6efe14-c00d-4bf4-bf61-dd4ed39c5c60@xs4all.nl> <20231113124412.GA18974@pendragon.ideasonboard.com>
 <b35601f7-8bb2-4317-a8f7-6fbf81572943@xs4all.nl> <20231115105518.GD13826@pendragon.ideasonboard.com>
 <a67491c0-4fdf-4472-852c-e75f5e1d67af@xs4all.nl> <20231115114931.GE13826@pendragon.ideasonboard.com>
 <CAAFQd5BkCR=tYvmfjkOeTnjnccmURt8kEtiRee9CYqcz+FGHfg@mail.gmail.com> <7626e0f8-ce31-469e-b49c-f2fba664756f@xs4all.nl>
In-Reply-To: <7626e0f8-ce31-469e-b49c-f2fba664756f@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 16 Nov 2023 17:15:07 +0800
Message-ID: <CAA+D8ANb6A9eh=MQR9+7sZi5jet+7RSHt6TdZqPz5EK6pBs3mA@mail.gmail.com>
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

On Thu, Nov 16, 2023 at 4:01=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> Shengjiu,
>
> FYI: I started work on adding the fraction_bits field. I hope to have a
> patch for that early next week.
>
Thanks.  I will wait for your patch to be ready.

best regards
wang shengjiu

> Regards,
>
>         Hans
>
> On 16/11/2023 08:31, Tomasz Figa wrote:
> > On Wed, Nov 15, 2023 at 8:49=E2=80=AFPM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> >>
> >> Hi Hans,
> >>
> >> On Wed, Nov 15, 2023 at 12:19:31PM +0100, Hans Verkuil wrote:
> >>> On 11/15/23 11:55, Laurent Pinchart wrote:
> >>>> On Wed, Nov 15, 2023 at 09:09:42AM +0100, Hans Verkuil wrote:
> >>>>> On 13/11/2023 13:44, Laurent Pinchart wrote:
> >>>>>> On Mon, Nov 13, 2023 at 01:05:12PM +0100, Hans Verkuil wrote:
> >>>>>>> On 13/11/2023 12:43, Laurent Pinchart wrote:
> >>>>>>>> On Mon, Nov 13, 2023 at 11:28:51AM +0000, Sakari Ailus wrote:
> >>>>>>>>> On Mon, Nov 13, 2023 at 12:24:14PM +0100, Hans Verkuil wrote:
> >>>>>>>>>> On 13/11/2023 12:07, Laurent Pinchart wrote:
> >>>>>>>>>>> On Mon, Nov 13, 2023 at 11:56:49AM +0100, Hans Verkuil wrote:
> >>>>>>>>>>>> On 13/11/2023 11:42, Laurent Pinchart wrote:
> >>>>>>>>>>>>> On Mon, Nov 13, 2023 at 11:29:09AM +0100, Hans Verkuil wrot=
e:
> >>>>>>>>>>>>>> On 10/11/2023 06:48, Shengjiu Wang wrote:
> >>>>>>>>>>>>>>> Fixed point controls are used by the user to configure
> >>>>>>>>>>>>>>> a fixed point value in 64bits, which Q31.32 format.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> This patch adds a new control type. This is something that=
 also needs to be
> >>>>>>>>>>>>>> tested by v4l2-compliance, and for that we need to add sup=
port for this to
> >>>>>>>>>>>>>> one of the media test-drivers. The best place for that is =
the vivid driver,
> >>>>>>>>>>>>>> since that has already a bunch of test controls for other =
control types.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> See e.g. VIVID_CID_INTEGER64 in vivid-ctrls.c.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Can you add a patch adding a fixed point test control to v=
ivid?
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> I don't think V4L2_CTRL_TYPE_FIXED_POINT is a good idea. Th=
is seems to
> >>>>>>>>>>>>> relate more to units than control types. We have lots of fi=
xed-point
> >>>>>>>>>>>>> values in controls already, using the 32-bit and 64-bit int=
eger control
> >>>>>>>>>>>>> types. They use various locations for the decimal point, de=
pending on
> >>>>>>>>>>>>> the control. If we want to make this more explicit to users=
, we should
> >>>>>>>>>>>>> work on adding unit support to the V4L2 controls.
> >>>>>>>>>>>>
> >>>>>>>>>>>> "Fixed Point" is not a unit, it's a type. 'Db', 'Hz' etc. ar=
e units.
> >>>>>>>>>>>
> >>>>>>>>>>> It's not a unit, but I think it's related to units. My point =
is that,
> >>>>>>>>>>> without units support, I don't see why we need a formal defin=
ition of
> >>>>>>>>>>> fixed-point types, and why this series couldn't just use
> >>>>>>>>>>> VIVID_CID_INTEGER64. Drivers already interpret VIVID_CID_INTE=
GER64
> >>>>>>>>>>> values as they see fit.
> >>>>>>>>>>
> >>>>>>>>>> They do? That's new to me. A quick grep for V4L2_CTRL_TYPE_INT=
EGER64
> >>>>>>>>>> (I assume you meant that rather than VIVID_CID_INTEGER64) show=
s that it
> >>>>>>>>
> >>>>>>>> Yes, I meant V4L2_CTRL_TYPE_INTEGER64. Too hasty copy & paste :-=
)
> >>>>>>>>
> >>>>>>>>>> is always interpreted as a 64 bit integer and nothing else. As=
 it should.
> >>>>>>>>
> >>>>>>>> The most common case for control handling in drivers is taking t=
he
> >>>>>>>> integer value and converting it to a register value, using
> >>>>>>>> device-specific encoding of the register value. It can be a fixe=
d-point
> >>>>>>>> format or something else, depending on the device. My point is t=
hat
> >>>>>>>> drivers routinely convert a "plain" integer to something else, a=
nd that
> >>>>>>>> has never been considered as a cause of concern. I don't see why=
 it
> >>>>>>>> would be different in this series.
> >>>>>>>>
> >>>>>>>>>> And while we do not have support for units (other than the doc=
umentation),
> >>>>>>>>>> we do have type support in the form of V4L2_CTRL_TYPE_*.
> >>>>>>>>>>
> >>>>>>>>>>>> A quick "git grep -i "fixed point" Documentation/userspace-a=
pi/media/'
> >>>>>>>>>>>> only shows a single driver specific control (dw100.rst).
> >>>>>>>>>>>>
> >>>>>>>>>>>> I'm not aware of other controls in mainline that use fixed p=
oint.
> >>>>>>>>>>>
> >>>>>>>>>>> The analog gain control for sensors for instance.
> >>>>>>>>>>
> >>>>>>>>>> Not really. The documentation is super vague:
> >>>>>>>>>>
> >>>>>>>>>> V4L2_CID_ANALOGUE_GAIN (integer)
> >>>>>>>>>>
> >>>>>>>>>>       Analogue gain is gain affecting all colour components in=
 the pixel matrix. The
> >>>>>>>>>>       gain operation is performed in the analogue domain befor=
e A/D conversion.
> >>>>>>>>>>
> >>>>>>>>>> And the integer is just a range. Internally it might map to so=
me fixed
> >>>>>>>>>> point value, but userspace won't see that, it's hidden in the =
driver AFAICT.
> >>>>>>>>
> >>>>>>>> It's hidden so well that libcamera has a database of the sensor =
it
> >>>>>>>> supports, with formulas to map a real gain value to the
> >>>>>>>> V4L2_CID_ANALOGUE_GAIN control. The encoding of the integer valu=
e does
> >>>>>>>> matter, and the kernel doesn't expose it. We may or may not cons=
ider
> >>>>>>>> that as a shortcoming of the V4L2 control API, but in any case i=
t's the
> >>>>>>>> situation we have today.
> >>>>>>>>
> >>>>>>>>> I wonder if Laurent meant digital gain.
> >>>>>>>>
> >>>>>>>> No, I meant analog. It applies to digital gain too though.
> >>>>>>>>
> >>>>>>>>> Those are often Q numbers. The practice there has been that the=
 default
> >>>>>>>>> value yields gain of 1.
> >>>>>>>>>
> >>>>>>>>> There are probably many other examples in controls where someth=
ing being
> >>>>>>>>> controlled isn't actually an integer while integer controls are=
 still being
> >>>>>>>>> used for the purpose.
> >>>>>>>>
> >>>>>>>> A good summary of my opinion :-)
> >>>>>>>
> >>>>>>> And that works fine as long as userspace doesn't need to know wha=
t the value
> >>>>>>> actually means.
> >>>>>>>
> >>>>>>> That's not the case here. The control is really a fractional Hz v=
alue:
> >>>>>>>
> >>>>>>> +``V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET (fixed point)``
> >>>>>>> +    Sets the offset from the audio source sample rate, unit is H=
z.
> >>>>>>> +    The offset compensates for any clock drift. The actual sourc=
e audio sample
> >>>>>>> +    rate is the ideal source audio sample rate from
> >>>>>>> +    ``V4L2_CID_M2M_AUDIO_SOURCE_RATE`` plus this fixed point off=
set.
> >>>>>>
> >>>>>> I don't see why this would require a new type, you can use
> >>>>>> V4L2_CTRL_TYPE_INTEGER64, and document the control as containing
> >>>>>> fixed-point values in Q31.32 format.
> >>>>>
> >>>>> Why would you want to do this? I can store a double in a long long =
int,
> >>>>> and just document that the variable is really a double, but why wou=
ld you?
> >>>>
> >>>> I'm happy we have no floating point control types ;-)
> >>>>
> >>>>> The cost of adding a FIXED_POINT type is minimal, and having this t=
ype
> >>>>> makes it easy to work with fixed point controls (think about proper=
 reporting
> >>>>> and setting of the value in v4l2-ctl and user applications in gener=
al that
> >>>>> deal with controls).
> >>>>
> >>>> The next thing you know is that someone will want a FIXED_POINT_Q15_=
16
> >>>> type as 64-bit would be too large to store in a large array. And the=
n
> >>>> Q7.8. And Q3.12. And a bunch of other type. I really don't see what
> >>>> added value they bring compared to using the 32-bit and 64-bit integ=
er
> >>>> types we already have. Every new type that is added adds complexity =
to
> >>>> userspace that will need to deal with the type.
> >>>>
> >>>>> If this would add a thousand lines of complex code, then this would=
 be a
> >>>>> consideration, but this is just a few lines.
> >>>>>
> >>>>> Just to give an example, if you use 'v4l2-ctl -l' to list a int64 c=
ontrol
> >>>>> and it reports the value 13958643712, would you be able to see that=
 that is
> >>>>> really 3.25 in fixed point format? With the right type it would be =
printed
> >>>>> like that. Much easier to work work.
> >>>>
> >>>> The same is true for analog gains, where x1.23 or +12dB is nicer to =
read
> >>>> than raw values. If we care about printing values in command line to=
ols
> >>>> (which is nice to have, but certainly not the majority of use cases)=
,
> >>>> then I would recommand working on units support for V4L2 controls, t=
o
> >>>> convey how values are encoded, and in what unit they are expressed.
> >>>
> >>> So you prefer to have a way to specify the N value in QM.N as part
> >>> of the control information?
> >>>
> >>> E.g. add a '__u8 fraction_bits' field to structs v4l2_query_ext_ctrl
> >>> and v4l2_queryctrl. If 0, then it is an integer, otherwise it is the =
N
> >>> in QM.N.
> >>>
> >>> I can go along with that. This would be valid for INTEGER, INTEGER64,
> >>> U8, U16 and U32 controls (the last three are only used in control arr=
ays).
> >>
> >> I think that would be nicer. Not only is it more flexible, but it also
> >> allows applications to ignore that information, and still operate on
> >> integer controls without any modification.
> >>
> >>> A better name for 'fraction_bits' is welcome, I took it from the wiki=
pedia
> >>> article: https://en.wikipedia.org/wiki/Fixed-point_arithmetic
> >>>
> >
> > I like the idea and the name sounds fine to me too.
> >
> >>> Reporting unit names is certainly possible, but should perhaps be don=
e
> >>> with a separate ioctl? E.g. VIDIOC_QUERY_CTRL_UNIT. It is not typical=
ly
> >>> needed for applications, unless they need to report values. In theory
> >>> it can also be reported through VIDIOC_QUERY_EXT_CTRL by using, say,
> >>> 4 of the reserved fields for a 'char unit[16];' field. But I feel a
> >>> bit uncomfortable taking reserved fields for something that is rarely
> >>> needed.
> >>
> >> I would make the unit an enumerated integer value. If it's a string, i=
t
> >> gets more difficult to operate on. Having to standardize a unit means
> >> that the unit will get reviewed.
> >>
> >
> > What usage do we envision for units? Could one give some examples? My
> > impression is that we already defined most of the controls with
> > explicit units.
> >
> >>>>>>>>> Instead of this patch, I'd prefer to have a way to express the =
meaning of
> >>>>>>>>> the control value, be it a Q number or something else, and do t=
hat
> >>>>>>>>> independently of the type of the control.
> >>>>>>>
> >>>>>>> Huh? How is that different from the type of the control? You have=
 integers
> >>>>>>> (one type) and fixed point (another type).
> >>>>>>>
> >>>>>>> Or do you want a more general V4L2_CTRL_TYPE_ that specifies the =
N.M values
> >>>>>>> explicitly?
> >>>>>>>
> >>>>>>> I think the main reason why we use integer controls for gain is t=
hat we
> >>>>>>> never had a fixed point control type and you could get away with =
that in
> >>>>>>> user space for that particular use-case.
> >>>>>>>
> >>>>>>> Based on the V4L2_CID_NOTIFY_GAINS documentation the gain value c=
an typically
> >>>>>>> be calculated as (value / default_value),
> >>>>>>
> >>>>>> Typically, but not always. Some sensor have an exponential gain mo=
del,
> >>>>>> and some have weird gain representation, such as 1/x. That's getti=
ng out
> >>>>>> of scope though.
> >>>>>>
> >>>>>>> but that won't work for a rate offset
> >>>>>>> control as above, or for e.g. CSC matrices for color converters.
> >>>>>>>
> >>>>>>>> Agreed.
> >>>>>>>>
> >>>>>>>>>> In the case of this particular series the control type is real=
ly a fixed point
> >>>>>>>>>> value with a documented unit (Hz). It really is not something =
you want to
> >>>>>>>>>> use type INTEGER64 for.
> >>>>>>>>>>
> >>>>>>>>>>>> Note that V4L2_CTRL_TYPE_FIXED_POINT is a Q31.32 format. By =
setting
> >>>>>>>>>>>> min/max/step you can easily map that to just about any QN.M =
format where
> >>>>>>>>>>>> N <=3D 31 and M <=3D 32.
> >>>>>>>>>>>>
> >>>>>>>>>>>> In the case of dw100 it is a bit different in that it is qui=
te specialized
> >>>>>>>>>>>> and it had to fit in 16 bits.
> >>
> >> --
> >> Regards,
> >>
> >> Laurent Pinchart
>
