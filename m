Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD53578D257
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 05:12:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JXCa1fLT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rb8V44hYGz3c2n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 13:12:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JXCa1fLT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e31; helo=mail-vs1-xe31.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rb8TB702cz2yVc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 13:11:25 +1000 (AEST)
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-44e84fbaab9so2306912137.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 20:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693365082; x=1693969882; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/zpOgLvIkPFvPcaR4xxmX73FKY11ocg9236FvpZH8M=;
        b=JXCa1fLTWmD8bMfNDrpFAhDEDrAGdCCQLuyW0V+lWaGw1k8lnVYBU3vqNCWJhYk1/d
         sfhg+vS0yjDlXit1+tNvm+I3Vfmv16ASFEuK6hawkfHvGl7GBjSOgiecNRGU8KPPKAx1
         iuOEwB//IURm6m/qZ1UpWfsIP480ErsD2uJ0UyGbd38BFaJsshvCtRSWR39Rkve/liQj
         V18IQ8ZzBfrZamCGaTLt6ijmfjvEKwbNOfpcjVGI0J0eUAFgDinLLFjAujGaE2xhOsN0
         pXEfdllhnEk8M0IgpmhSkECF4FZ69YOSMSct2WuTAe4Af6PSjFvemReK6lWIjhDlzc+l
         EUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693365082; x=1693969882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/zpOgLvIkPFvPcaR4xxmX73FKY11ocg9236FvpZH8M=;
        b=kWy0w7WmexWGkSJqNcDpixgQGFOg4z3/JDbSaEmNjsEnXGZnNy8h/WqGEyyewb1UYY
         /tOAOwU2USm43FrdQNBm+IXjLfoKpMBhnb4B7llZxMlGPF568Z37UCFXV7lDaA3igb+k
         wIfdrGEWD4BtEJkPjWAm9zkywgzbDbZCPLV1zRJDEUY27ef0dx1buTfBXFZ+u21Gh6Yv
         XXNfjstpZPL4HCDOom1khCNEjFZB6r7EqWkf6iRdZwGbVDPaghn+tZ70to9PXOO8XG+w
         0zMTgm8EuPa9Sk4YA1X1xCqoUvcafQVCSkj50V/p/buWTkK55oZrreMfK+PVK3rueYoV
         i7QA==
X-Gm-Message-State: AOJu0YwmzIN1TgXeUVVTPZHP+JC1MffV2GuuholC1KN01PSh8xesl395
	xqPvdWdrI8VmlBXUidWkVFL1IPfUaaSPRjzD+Mw=
X-Google-Smtp-Source: AGHT+IFcKHvGWkCwrHeUph6QKacvUFGeoVK+QuP9OlsWGA4RbslTUal2tr2ZR3/eQCQuMJw2exL8eO3QY5zcc/iGMW8=
X-Received: by 2002:a05:6102:3ce:b0:44e:dd43:38e1 with SMTP id
 n14-20020a05610203ce00b0044edd4338e1mr1018093vsq.1.1693365081966; Tue, 29 Aug
 2023 20:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl>
 <87il9xu1ro.wl-tiwai@suse.de> <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
 <87il9xoddo.wl-tiwai@suse.de> <CAA+D8AOVEpGxO0YNeS1p+Ym86k6VP-CNQB3JmbeT7mPKg0R99A@mail.gmail.com>
 <844ef9b6-d5e2-46a9-b7a5-7ee86a2e449c@sirena.org.uk> <CAA+D8AOnsx+7t3MrWm42waxtetL07nbKURLsh1hBx39LUDm+Zg@mail.gmail.com>
 <CAA+D8AMriHO60SD2OqQSDMmi7wm=0MkoW6faR5nyve-j2Q5AEQ@mail.gmail.com>
 <CAA+D8AN34-NVrgksRAG014PuHGUssTm0p-KR-HYGe+Pt8Yejxg@mail.gmail.com>
 <87wmxk8jaq.wl-tiwai@suse.de> <ZOe74PO4S6bj/QlV@finisterre.sirena.org.uk>
 <CAA+D8AM_pqbjQaE59n6Qm5gypLb8zPAwOpJR+_ZEG89-q3B8pg@mail.gmail.com>
 <8735076xdn.wl-tiwai@suse.de> <bc12f76e-a2ac-2818-f136-b31f6fa49310@xs4all.nl>
In-Reply-To: <bc12f76e-a2ac-2818-f136-b31f6fa49310@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 30 Aug 2023 11:11:10 +0800
Message-ID: <CAA+D8AMdvnBnaNyZ6jPpn9g=zwRa4Ht+mi=aU0o02zw_W-fEag@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add audio support in v4l2 framework
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, sakari.ailus@iki.fi, perex@perex.cz, mchehab@kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 25, 2023 at 10:15=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> =
wrote:
>
> On 25/08/2023 15:54, Takashi Iwai wrote:
> > On Fri, 25 Aug 2023 05:46:43 +0200,
> > Shengjiu Wang wrote:
> >>
> >> On Fri, Aug 25, 2023 at 4:21=E2=80=AFAM Mark Brown <broonie@kernel.org=
> wrote:
> >>>
> >>> On Thu, Aug 24, 2023 at 07:03:09PM +0200, Takashi Iwai wrote:
> >>>> Shengjiu Wang wrote:
> >>>
> >>>>> But there are several issues:
> >>>>> 1. Need to create sound cards.  ASRC module support multi instances=
, then
> >>>>> need to create multi sound cards for each instance.
> >>>
> >>>> Hm, why can't it be multiple PCM instances instead?
> >>>
> >>> I'm having a hard time following this one too.
> >>>
> >>>>> 2. The ASRC is an entirety but with DPCM we need to separate input =
port and
> >>>>> output port to playback substream and capture stream. Synchronous b=
etween
> >>>>> playback substream and capture substream is a problem.
> >>>>> How to start them and stop them at the same time.
> >>>
> >>>> This could be done by enforcing the full duplex and linking the both
> >>>> PCM streams, I suppose.
> >>>
> >>>>> So shall we make the decision that we can go to the V4L2 solution?
> >>>
> >>>> Honestly speaking, I don't mind much whether it's implemented in V2L=
4
> >>>> or not -- at least for the kernel part, we can reorganize / refactor
> >>>> things internally.  But, the biggest remaining question to me is
> >>>> whether this user-space interface is the most suitable one.  Is it
> >>>> well defined, usable and maintained for the audio applications?  Or
> >>>> is it meant to be a stop-gap for a specific use case?
> >>>
> >>> I'm having a really hard time summoning much enthusiasm for using v4l
> >>> here, it feels like this is heading down the same bodge route as DPCM
> >>> but directly as ABI so even harder to fix properly.  That said all th=
e
> >>> ALSA APIs are really intended to be used in real time and this sounds
> >>> like a non real time application?  I don't fully understand what the
> >>> actual use case is here.
> >>
> >> Thanks for your reply.
> >>
> >> This asrc memory to memory (memory ->asrc->memory) case is a non
> >> real time use case.
> >>
> >> User fills the input buffer to the asrc module,  after conversion, the=
n asrc
> >> sends back the output buffer to user. So it is not a traditional ALSA =
playback
> >> and capture case. I think it is not good to create sound card for it, =
 it is
> >> not a sound card actually.
> >>
> >> It is a specific use case,  there is no reference in current kernel.
> >> v4l2 memory to memory is the closed implementation,  v4l2 current
> >> support video, image, radio, tuner, touch devices, so it is not
> >> complicated to add support for this specific audio case.
> >>
> >> Maybe you can go through these patches first.  Because we
> >> had implemented the "memory -> asrc ->i2s device-> codec"
> >> use case in ALSA.  Now the "memory->asrc->memory" needs
> >> to reuse the code in asrc driver, so the first 3 patches is for refini=
ng
> >> the code to make it can be shared by the "memory->asrc->memory"
> >> driver.
> >>
> >> The main change is in the v4l2 side, A /dev/vl42-audio will be created=
,
> >> user applications only use the ioctl of v4l2 framework.
> >
> > Ah, now I'm slowly understanding.  So, what you want is to have an
> > interface to perform the batch conversion of a data stream from an
> > input to an output?  And ALSA PCM interface doesn't fit fully for that
> > purpose because the data handling is batched and it's not like a
> > normal PCM streaming?
> >
> > Basically the whole M2M arguments are rather subtle.  Those are
> > implementation details that can be resolved in several different ways
> > in the kernel side.  But the design of the operation is the crucial
> > point.
> >
> > Maybe we can consider implementing a similar feature in ALSA API, too.
> > But it's too far-stretched for now.
> >
> > So, if v4l2 interface provides the requested feature (the batched
> > audio stream conversion), it's OK to ride on it.
>
> The V4L2 M2M interface is simple: you open a video device and then you ca=
n
> pass data to the hardware, it processes it and you get the processed data=
 back.
>
> The hardware just processes the data as fast as it can. Each time you ope=
n
> the video device a new instance is created, and each instance can pass jo=
bs
> to the hardware.
>
> Currently it is used for video scalers, deinterlacers, colorspace convert=
ers and
> codecs, but in the end it is just data in, data out with some job schedul=
ing (fifo)
> towards the hardware. So supporting audio using the same core m2m framewo=
rk wouldn't
> be a big deal. We'd probably make a /dev/v4l-audio device for that.
>
> It doesn't come for free: it is a new API, so besides adding support for =
it, it
> also needs to be documented, we would need compliance tests, and very lik=
ely I
> would want a new virtual driver for this (vim2m.c would be a good templat=
e).
>

Thanks all.

I will try to pass the compliance test.  Should the virtual driver be added=
 now?

Best regards
Wang Shengiu
