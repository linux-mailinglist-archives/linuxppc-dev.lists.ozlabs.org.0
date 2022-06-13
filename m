Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81674548701
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 17:58:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMGSL172jz3chH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 01:58:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h74NZSz5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h74NZSz5;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMGRm1MWXz2ypZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 01:57:40 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 65963614D3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jun 2022 15:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6585C3411B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jun 2022 15:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655135856;
	bh=5LELPMlZgORWGS0Q/Me0zEuAVidBHgnRbjk9vI39cfQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h74NZSz5rKiy8TrTzuSGNok1JSS6cTl5S3pG5pZV/JDEgJlQMXNgoM2o9P+PALX96
	 6PR5nW5vWqf2CVgxJOKl/Q8dXppoS60prGy27yZleiRazVqWVgf4zft7CDHcofVe5u
	 CspmwLmTJ5SB9F0jpJtsye3Xbar7e3JDoek7xY2pqi8fMWrqI/ir2EH32+fypU/Sl9
	 E4EtzrNQ5+cYA6FqSl3M+4zxDjt8iG+548XEKqsh2upUwz/v9XMBRz/U2uBVXVrj0M
	 afpmTOJ9HgybiiMzKlB9O7phju+gOpZGoBFSRVJ+FBMcR9RLMAdHXg6hWX0Z6AYpNQ
	 k+7t5BFN32elw==
Received: by mail-vs1-f42.google.com with SMTP id q14so6266819vsr.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jun 2022 08:57:36 -0700 (PDT)
X-Gm-Message-State: AJIora897U3MXNeRiodITCfUuKIeHGORV2r2ITkNpEHyUCt+YAZwF04o
	LZgRJJqkQYOACyBgz5HsGu3LJpIDSW9Tayrobw==
X-Google-Smtp-Source: AGRyM1t3jLOgtxbVuzrwkWRxD9MWJNJ+55PsG/fZgG/UWx+gik+oXEQl0q4pmZ5+kqFTdV7k5YdUzm+XUQ34KZttq4I=
X-Received: by 2002:a05:6102:3117:b0:34b:ea03:5664 with SMTP id
 e23-20020a056102311700b0034bea035664mr325472vsh.53.1655135855811; Mon, 13 Jun
 2022 08:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <283c811b-27f7-64a8-8a67-11cf6c3a79cf@xenosoft.de>
 <2e1b72bd-ae44-19d1-5981-09f5c69759dc@csgroup.eu> <OSZPR01MB7019C5EC6E5CF5230600B283AAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <8a2aa8a5-55b3-93e9-7428-867311f568e2@xenosoft.de> <OSZPR01MB7019313DCB5A79F91BE6D91CAAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <9e8dd323-4a36-abb2-568d-fe1384b1579c@xenosoft.de> <CAL_JsqLN6bT=YhyRTVWU2WmG-htCujtCROQuK+gdMUHMSHVeaQ@mail.gmail.com>
 <CAL_JsqJs17p-hw-U3WAkT69y3V4kuc_-O8tU=Sr8KWHPvbWJpA@mail.gmail.com>
 <1e5fd88f-80dc-d48a-0812-4724765db489@xenosoft.de> <CAL_JsqJXXGBcuO+921DNf1yYCbUX4Mv19kQds1rkFM8q8kwxSg@mail.gmail.com>
 <229b38b6-1a79-259a-e571-2551d80f334d@xenosoft.de>
In-Reply-To: <229b38b6-1a79-259a-e571-2551d80f334d@xenosoft.de>
From: Rob Herring <robh@kernel.org>
Date: Mon, 13 Jun 2022 09:57:24 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKUwFrck58vfnqOyOkQxJ1SRySj15ytMQPLvr2fg_V-uA@mail.gmail.com>
Message-ID: <CAL_JsqKUwFrck58vfnqOyOkQxJ1SRySj15ytMQPLvr2fg_V-uA@mail.gmail.com>
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

On Thu, Jun 9, 2022 at 12:03 PM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
>
> On 06 June 2022 at 07:06 pm, Rob Herring wrote:
> > On Mon, Jun 6, 2022 at 11:14 AM Christian Zigotzky
> > <chzigotzky@xenosoft.de> wrote:
> >> On 06 June 2022 at 04:58 pm, Rob Herring wrote:
> >>> On Fri, May 27, 2022 at 9:23 AM Rob Herring <robh@kernel.org> wrote:
> >>>> On Fri, May 27, 2022 at 3:33 AM Christian Zigotzky
> >>>> <chzigotzky@xenosoft.de> wrote:
> >>>>> On 27 May 2022 at 10:14 am, Prabhakar Mahadev Lad wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>>> -----Original Message-----
> >>>>>>> From: Christian Zigotzky <chzigotzky@xenosoft.de>
> >>>>>>>
> >>>>>>> On 27 May 2022 at 09:56 am, Prabhakar Mahadev Lad wrote:
> >>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>>> -----Original Message-----
> >>>>>>>>> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> >>> [...]
> >>>
> >>>>>>>> Looks like the driver which you are using has not been converted to use
> >>>>>>> platform_get_irq(), could you please check that.
> >>>>>>>> Cheers,
> >>>>>>>> Prabhakar
> >>>>>>> Do you mean the mouse and keyboard driver?
> >>>>>>>
> >>>>>> No it could be your gpio/pinctrl driver assuming the keyboard/mouse are using GPIO's. If you are using interrupts then it might be some hierarchal irqc driver in drivers/irqchip/.
> >>>>>>
> >>>>>> Cheers,
> >>>>>> Prabhakar
> >>>>> Good to know. I only use unmodified drivers from the official Linux
> >>>>> kernel so it's not an issue of the Cyrus+ board.
> >>>> The issue is in drivers/usb/host/fsl-mph-dr-of.c which copies the
> >>>> resources to a child platform device. Can you try the following
> >>>> change:
> >>>>
> >>>> diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
> >>>> index 44a7e58a26e3..47d9b7be60da 100644
> >>>> --- a/drivers/usb/host/fsl-mph-dr-of.c
> >>>> +++ b/drivers/usb/host/fsl-mph-dr-of.c
> >>>> @@ -80,8 +80,6 @@ static struct platform_device *fsl_usb2_device_register(
> >>>>                                           const char *name, int id)
> >>>>    {
> >>>>           struct platform_device *pdev;
> >>>> -       const struct resource *res = ofdev->resource;
> >>>> -       unsigned int num = ofdev->num_resources;
> >>>>           int retval;
> >>>>
> >>>>           pdev = platform_device_alloc(name, id);
> >>>> @@ -106,11 +104,7 @@ static struct platform_device *fsl_usb2_device_register(
> >>>>           if (retval)
> >>>>                   goto error;
> >>>>
> >>>> -       if (num) {
> >>>> -               retval = platform_device_add_resources(pdev, res, num);
> >>>> -               if (retval)
> >>>> -                       goto error;
> >>>> -       }
> >>>> +       pdev->dev.of_node = ofdev->dev.of_node;
> >>> >From the log, I think you also need to add this line:
> >>>
> >>> pdev->dev.of_node_reused = true;
> >>>
> >>>>           retval = platform_device_add(pdev);
> >>>>           if (retval)
> >> Hello Rob,
> >>
> >> Thanks a lot for your answer.
> >>
> >> Is the following patch correct?
> > Yes
> >
> >> --- a/drivers/usb/host/fsl-mph-dr-of.c    2022-05-28 09:10:26.797688422
> >> +0200
> >> +++ b/drivers/usb/host/fsl-mph-dr-of.c    2022-05-28 09:15:01.668594809
> >> +0200
> >> @@ -80,8 +80,6 @@ static struct platform_device *fsl_usb2_
> >>                        const char *name, int id)
> >>    {
> >>        struct platform_device *pdev;
> >> -    const struct resource *res = ofdev->resource;
> >> -    unsigned int num = ofdev->num_resources;
> >>        int retval;
> >>
> >>        pdev = platform_device_alloc(name, id);
> >> @@ -106,11 +104,7 @@ static struct platform_device *fsl_usb2_
> >>        if (retval)
> >>            goto error;
> >>
> >> -    if (num) {
> >> -        retval = platform_device_add_resources(pdev, res, num);
> >> -        if (retval)
> >> -            goto error;
> >> -    }
> >> +    pdev->dev.of_node = ofdev->dev.of_node;
> >> +    pdev->dev.of_node_reused = true;
> >>
> >>        retval = platform_device_add(pdev);
> >>        if (retval)
> >>
> >> ---
> >>
> >> Thanks,
> >> Christian
> Hello Rob,
>
> I tested this patch today and unfortunately the issue still exists.

The log is the same?

Rob
