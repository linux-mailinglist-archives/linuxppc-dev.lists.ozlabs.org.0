Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD5055BADE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 17:53:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWsh80Z6Jz3chL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 01:53:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IbsyGbkP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IbsyGbkP;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWsgV6dzjz2yjS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 01:52:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 05904616A3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 15:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49D3C341CC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 15:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656345154;
	bh=gQ/8rpTLJoHf5hQ/J7Tim5kyblxVTDM3oOXl5+ou4X8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IbsyGbkPTtqeePxaq5vuQk6Ht9AerYj0BNdaIJeaP2yIG4mWUvLkdgXT8Edp2ohY7
	 nzPSwVaENUOq3xv4oKUyhKgAs0ak4sniH6vMOI9UqqfMKtPYoltLcJBkRkvNWugATA
	 WpHq+crwQUruG8rRlTTZaRkJIo0F2SXec9xqPCwZPZYnPpY1iRRrfvaPHQ0vfaGL6P
	 KnEFJ2a8LKiPE5L1X7ryDbtrE09FJuwK4pLr8fEvvAj/g+IBAWr/HUQOCRZPHs1S23
	 d8QvdDm0CVWq8Tno6vdGnev1gtzAOPuqy05cd2fo/wNcAbR3jB1bH3PQLRLdynNkkg
	 2obC0cGmD2mOA==
Received: by mail-vs1-f52.google.com with SMTP id w187so9394765vsb.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 08:52:34 -0700 (PDT)
X-Gm-Message-State: AJIora/s7umjDMnGbeyG89vL23VvROvU0bk7xXNgjknEwqL4vjdjzT4n
	qXWzFrXC3/HMFBldz8ht2D+Zn82b2fT/tW2RsQ==
X-Google-Smtp-Source: AGRyM1spI4V2i5L3miuavcwk5M71oji9JvRZrCj9WaP3J+qZiNMHshh0zQhnC3gDnlZgRs+sJkzpms/ovm9XpOnk2fk=
X-Received: by 2002:a67:1787:0:b0:354:6490:437f with SMTP id
 129-20020a671787000000b003546490437fmr4876195vsx.26.1656345153833; Mon, 27
 Jun 2022 08:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220625214151.547b3570@Cyrus.lan> <947e4583-fe0b-b8af-61b3-2d120357727c@gmail.com>
 <53ac873c23e.3ae9df00@auth.smtp.1and1.co.uk>
In-Reply-To: <53ac873c23e.3ae9df00@auth.smtp.1and1.co.uk>
From: Rob Herring <robh@kernel.org>
Date: Mon, 27 Jun 2022 09:52:22 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKd2QaoPH16JqKrx0_XNmyUgKqsiOD56QHO1C0r1rCp7g@mail.gmail.com>
Message-ID: <CAL_JsqKd2QaoPH16JqKrx0_XNmyUgKqsiOD56QHO1C0r1rCp7g@mail.gmail.com>
Subject: Re: drivers/usb/host/ehci-fsl: Fix interrupt setup in host mode.
To: Darren Stevens <darren@stevens-zone.net>
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
Cc: Shawn Guo <shawnguo@kernel.org>, Linux USB List <linux-usb@vger.kernel.org>, Yang-Leo Li <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Sergei Shtylyov <sergei.shtylyov@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jun 26, 2022 at 2:03 PM Darren Stevens <darren@stevens-zone.net> wr=
ote:
>
> Hello Sergei
>
> On 26/06/2022, Sergei Shtylyov wrote:
> > Hello!
> >
> > On 6/25/22 11:41 PM, Darren Stevens wrote:
> >
> >> In patch a1a2b7125e10 (Drop static setup of IRQ resource from DT
> >> core) we stopped platform_get_resource() from returning the IRQ, as al=
l
> >
> > In commit a1a2b7125e10 ("Drop static setup of IRQ resource from DT core=
")
> >
> >> drivers were supposed to have switched to platform_get_irq()
> >> Unfortunately the Freescale EHCI driver in host mode got missed. Fix
> >> it. Also fix allocation of resources to work with current kernel.
> >
> >    The basic rule (especially for the fixes) is "do one thing per patch=
".
>
> I thought I'd done that, this is the minimum amount of changes that fix w=
hat changed in the specified commit.
>
> > [...]
> >> @@ -92,15 +89,18 @@ static int fsl_ehci_drv_probe(struct platform_devi=
ce *pdev)
> >>          goto err1;
> >>      }
> >>
> >> -    res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >> -    hcd->regs =3D devm_ioremap_resource(&pdev->dev, res);
> >> +    tmp =3D of_address_to_resource(dn, 0, &res);
> >
> >    Hm, why? What does this fix?
>
> With baseline the mouse and keyboard on our machines don't work - dmesg r=
eports no interrupt. Fixing the interrupt detection throws a 'invalid resou=
re' error instead (No idea why), which these lines fix. Both problems disap=
pear if we revert the 'fixes' patch.
>

I see the problem. You need to keep the
platform_device_add_resources() call in fsl-mph-dr-of.c so that the
memory resource is copied from the parent to the child device.

Rob
