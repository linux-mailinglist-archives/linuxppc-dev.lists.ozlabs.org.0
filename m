Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1582553E6A2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 19:07:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LH0KM6YSMz303k
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 03:07:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hJkgt2ZY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hJkgt2ZY;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LH0Jl3j7hz2yw3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jun 2022 03:06:47 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 59B3D60FF9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jun 2022 17:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5827C3411D
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jun 2022 17:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654535204;
	bh=GKK8Z3jcC7feB94sG//8HMqaJAY9gBwtueuI+WJ7YyM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hJkgt2ZYONGcLsy2WqMFfDBO6hjzJLXi6vXGQEe3YMAFrD55tVhdf2y9RuSseT62t
	 9SdIJ+xdzepMFWf7/TKj9Iw6ncAdUYdSxz8gwkjFEjOlJMzAH9p90lUJQTSLaeXuSf
	 cwmypezY8cO7rJWSlNGl4cl4el+AOkDT1fVcEGz8Aqae71gstzOYDm1f9jaVckJm7c
	 2ZJDGF1+KwAYToeZz+mFKeLQvN/Ox/SQzh9E0k0a2BY7tkOtvEXXYgViF9Uupyhq+3
	 HKJpcvWthh8iDaGG9+Ac8+Di8Fo3Ad/0WVsnKerIePM4XH4Kfb4n37Amv70t6mk6cj
	 rel2BFScoHA/Q==
Received: by mail-vs1-f42.google.com with SMTP id q14so14298151vsr.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jun 2022 10:06:44 -0700 (PDT)
X-Gm-Message-State: AOAM532ucB5MKLusT/cWqfZ4vMWOSc2FdgnDjIvVpqpHob7PjFhTw4P0
	3E5ScIqlYC/oSIJw/4zWYBCXk6zzYBphOyfK7A==
X-Google-Smtp-Source: ABdhPJx34xO4TB35zKyB9NtJRm8fQVRYxWbOQ8mTsU7yHSaCGqOvcDTPFa7vUFWLcPqn0NpuBZ7rbySqsHHxkfH9+gc=
X-Received: by 2002:a05:6102:3d0f:b0:34b:bdd0:baef with SMTP id
 i15-20020a0561023d0f00b0034bbdd0baefmr2455288vsv.85.1654535203689; Mon, 06
 Jun 2022 10:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <283c811b-27f7-64a8-8a67-11cf6c3a79cf@xenosoft.de>
 <2e1b72bd-ae44-19d1-5981-09f5c69759dc@csgroup.eu> <OSZPR01MB7019C5EC6E5CF5230600B283AAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <8a2aa8a5-55b3-93e9-7428-867311f568e2@xenosoft.de> <OSZPR01MB7019313DCB5A79F91BE6D91CAAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <9e8dd323-4a36-abb2-568d-fe1384b1579c@xenosoft.de> <CAL_JsqLN6bT=YhyRTVWU2WmG-htCujtCROQuK+gdMUHMSHVeaQ@mail.gmail.com>
 <CAL_JsqJs17p-hw-U3WAkT69y3V4kuc_-O8tU=Sr8KWHPvbWJpA@mail.gmail.com> <1e5fd88f-80dc-d48a-0812-4724765db489@xenosoft.de>
In-Reply-To: <1e5fd88f-80dc-d48a-0812-4724765db489@xenosoft.de>
From: Rob Herring <robh@kernel.org>
Date: Mon, 6 Jun 2022 12:06:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJXXGBcuO+921DNf1yYCbUX4Mv19kQds1rkFM8q8kwxSg@mail.gmail.com>
Message-ID: <CAL_JsqJXXGBcuO+921DNf1yYCbUX4Mv19kQds1rkFM8q8kwxSg@mail.gmail.com>
Subject: Re: [FSL P50x0] Keyboard and mouse don't work anymore after the
 devicetree updates for 5.19
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 6, 2022 at 11:14 AM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
>
> On 06 June 2022 at 04:58 pm, Rob Herring wrote:
> > On Fri, May 27, 2022 at 9:23 AM Rob Herring <robh@kernel.org> wrote:
> >> On Fri, May 27, 2022 at 3:33 AM Christian Zigotzky
> >> <chzigotzky@xenosoft.de> wrote:
> >>> On 27 May 2022 at 10:14 am, Prabhakar Mahadev Lad wrote:
> >>>> Hi,
> >>>>
> >>>>> -----Original Message-----
> >>>>> From: Christian Zigotzky <chzigotzky@xenosoft.de>
> >>>>>
> >>>>> On 27 May 2022 at 09:56 am, Prabhakar Mahadev Lad wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>>> -----Original Message-----
> >>>>>>> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> > [...]
> >
> >>>>>> Looks like the driver which you are using has not been converted to use
> >>>>> platform_get_irq(), could you please check that.
> >>>>>> Cheers,
> >>>>>> Prabhakar
> >>>>> Do you mean the mouse and keyboard driver?
> >>>>>
> >>>> No it could be your gpio/pinctrl driver assuming the keyboard/mouse are using GPIO's. If you are using interrupts then it might be some hierarchal irqc driver in drivers/irqchip/.
> >>>>
> >>>> Cheers,
> >>>> Prabhakar
> >>> Good to know. I only use unmodified drivers from the official Linux
> >>> kernel so it's not an issue of the Cyrus+ board.
> >> The issue is in drivers/usb/host/fsl-mph-dr-of.c which copies the
> >> resources to a child platform device. Can you try the following
> >> change:
> >>
> >> diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
> >> index 44a7e58a26e3..47d9b7be60da 100644
> >> --- a/drivers/usb/host/fsl-mph-dr-of.c
> >> +++ b/drivers/usb/host/fsl-mph-dr-of.c
> >> @@ -80,8 +80,6 @@ static struct platform_device *fsl_usb2_device_register(
> >>                                          const char *name, int id)
> >>   {
> >>          struct platform_device *pdev;
> >> -       const struct resource *res = ofdev->resource;
> >> -       unsigned int num = ofdev->num_resources;
> >>          int retval;
> >>
> >>          pdev = platform_device_alloc(name, id);
> >> @@ -106,11 +104,7 @@ static struct platform_device *fsl_usb2_device_register(
> >>          if (retval)
> >>                  goto error;
> >>
> >> -       if (num) {
> >> -               retval = platform_device_add_resources(pdev, res, num);
> >> -               if (retval)
> >> -                       goto error;
> >> -       }
> >> +       pdev->dev.of_node = ofdev->dev.of_node;
> > >From the log, I think you also need to add this line:
> >
> > pdev->dev.of_node_reused = true;
> >
> >>          retval = platform_device_add(pdev);
> >>          if (retval)
> Hello Rob,
>
> Thanks a lot for your answer.
>
> Is the following patch correct?

Yes

>
> --- a/drivers/usb/host/fsl-mph-dr-of.c    2022-05-28 09:10:26.797688422
> +0200
> +++ b/drivers/usb/host/fsl-mph-dr-of.c    2022-05-28 09:15:01.668594809
> +0200
> @@ -80,8 +80,6 @@ static struct platform_device *fsl_usb2_
>                       const char *name, int id)
>   {
>       struct platform_device *pdev;
> -    const struct resource *res = ofdev->resource;
> -    unsigned int num = ofdev->num_resources;
>       int retval;
>
>       pdev = platform_device_alloc(name, id);
> @@ -106,11 +104,7 @@ static struct platform_device *fsl_usb2_
>       if (retval)
>           goto error;
>
> -    if (num) {
> -        retval = platform_device_add_resources(pdev, res, num);
> -        if (retval)
> -            goto error;
> -    }
> +    pdev->dev.of_node = ofdev->dev.of_node;
> +    pdev->dev.of_node_reused = true;
>
>       retval = platform_device_add(pdev);
>       if (retval)
>
> ---
>
> Thanks,
> Christian
