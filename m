Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 984105391F8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 15:46:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCD8m4Q9Wz3blj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 23:46:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IPls8TGr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IPls8TGr;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCD880hZ8z2xt3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 23:46:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 486C7B8119B
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 13:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B3EC36AE7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 13:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654004770;
	bh=78EZ5LaBeckPDTtLcYWM6Qi4P+FbeRbfKSny4fF4pN0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IPls8TGr2g7s3nXsbhePHhy8MQ4iSl9yRtv/CBfqhq6rb82s0F8hWlgZPjdxH0V/t
	 dsfIZwuPuTh5foh6EK9KIIzvx3f2qwL9v+doWJXvevrv/8BNB58zhNt+L+TdDtJ1M4
	 CXNgMdTaRuvl7vIbQagcdwpsauJrrElaHj8l2DoPJhcZJ0mK3rfs2i6MDTiZ00gp4R
	 xbYTXxUQe1zJ/nvLtQANOeOePFNBb8XrrPLDVHo5N6faul0xW0xpp2EX1+DXe/g1lq
	 xVZwt7q0CtvU0d4N0zydPAHqz5ZPcFV6FhTHdeKTrxo5hssMorVIwKzRkLm+PB+G8X
	 4WAh9oTOyqVmQ==
Received: by mail-ua1-f54.google.com with SMTP id n11so1038915uaq.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 06:46:10 -0700 (PDT)
X-Gm-Message-State: AOAM532SR4XOQ0OkpRPeIf5hN/XVMGqJk2U+4yaNizyhJDZJxSzVWAIp
	PI6HHEjXSTaT60JH9BoBipRPg01Rm4zBxZwspQ==
X-Google-Smtp-Source: ABdhPJxGFCPdlNe0s9n88/b+8NUyxAgKHNJScMxYyBZYmrO9SIR638s/26FuqoCP07vAq9W4jBdDfEB0RsMABMNAlcA=
X-Received: by 2002:ab0:44e7:0:b0:364:e6da:9176 with SMTP id
 n94-20020ab044e7000000b00364e6da9176mr21024023uan.77.1654004769908; Tue, 31
 May 2022 06:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <283c811b-27f7-64a8-8a67-11cf6c3a79cf@xenosoft.de>
 <2e1b72bd-ae44-19d1-5981-09f5c69759dc@csgroup.eu> <OSZPR01MB7019C5EC6E5CF5230600B283AAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <8a2aa8a5-55b3-93e9-7428-867311f568e2@xenosoft.de> <OSZPR01MB7019313DCB5A79F91BE6D91CAAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <9e8dd323-4a36-abb2-568d-fe1384b1579c@xenosoft.de> <CAL_JsqLN6bT=YhyRTVWU2WmG-htCujtCROQuK+gdMUHMSHVeaQ@mail.gmail.com>
 <83ff7361-d54c-ac39-9ccb-0926c3a3d8e2@xenosoft.de>
In-Reply-To: <83ff7361-d54c-ac39-9ccb-0926c3a3d8e2@xenosoft.de>
From: Rob Herring <robh@kernel.org>
Date: Tue, 31 May 2022 08:45:58 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK+OqML54Dfs_JNeM1_od9EBGf-eMH_4sXgpjqs2R-iYQ@mail.gmail.com>
Message-ID: <CAL_JsqK+OqML54Dfs_JNeM1_od9EBGf-eMH_4sXgpjqs2R-iYQ@mail.gmail.com>
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

On Mon, May 30, 2022 at 12:26 AM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
>
> On 27 May 2022 at 04:23 pm, Rob Herring wrote:
> > The issue is in drivers/usb/host/fsl-mph-dr-of.c which copies the
> > resources to a child platform device. Can you try the following
> > change:
> >
> > diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
> > index 44a7e58a26e3..47d9b7be60da 100644
> > --- a/drivers/usb/host/fsl-mph-dr-of.c
> > +++ b/drivers/usb/host/fsl-mph-dr-of.c
> > @@ -80,8 +80,6 @@ static struct platform_device *fsl_usb2_device_register(
> >                                          const char *name, int id)
> >   {
> >          struct platform_device *pdev;
> > -       const struct resource *res = ofdev->resource;
> > -       unsigned int num = ofdev->num_resources;
> >          int retval;
> >
> >          pdev = platform_device_alloc(name, id);
> > @@ -106,11 +104,7 @@ static struct platform_device *fsl_usb2_device_register(
> >          if (retval)
> >                  goto error;
> >
> > -       if (num) {
> > -               retval = platform_device_add_resources(pdev, res, num);
> > -               if (retval)
> > -                       goto error;
> > -       }
> > +       pdev->dev.of_node = ofdev->dev.of_node;
> >
> >          retval = platform_device_add(pdev);
> >          if (retval)
> Hello Rob,
>
> Thanks a lot for your patch! Unfortunately, this leads to a boot loop.
> Do you have another idea?

Do you have a dmesg log?

The other way to fix is creating a IRQ resource and adding it to the
child device resources.

Rob
