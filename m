Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8B953E540
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 17:01:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGxWn4Nczz3bsq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 01:01:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JA16jqbQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JA16jqbQ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGxWB71XKz2xsm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jun 2022 01:00:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 909A5B81A82
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jun 2022 15:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB212C341C5
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jun 2022 15:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654527633;
	bh=tFvHiguChguydwXgPPk94DDRc3Gna/VqX+wPqkO+GTs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JA16jqbQeuWcQ2BdBv+Na1yw2Fsv4ZNsgyX0Rir5y0HP5v8ayb+DbcrlkdEodaQHA
	 p5mVtsR0j5VssOuJq1SuTacSyYnh9FuWA7MuF+LpD4B/1NPTEyhQEMmpNVLQQcrRkm
	 U2oDsmygP0mrNelWLqRVw+a46FbnSUaK6OXCijFA2qXWJTMua6Yk019a2K1ckpmqw6
	 r3a9iBGJ/qoKmfY5S0H8iPxHqsHuzCugiFQwVIbANF//xPXt1pHymPJGdfeCGSHFC8
	 2jWVp9Out3KIzaXURE3QhE/Hlijm7XMMwmZKLO4AZsYhWDtxtBR5/CLwG39yZO+OFL
	 rj3ILMq9jcjfg==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-30ce6492a60so145681537b3.8
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jun 2022 08:00:33 -0700 (PDT)
X-Gm-Message-State: AOAM5308uUsVlr4tmtZ/jsMkQGHdHwGANll0TGsnS2ojsDfMIxG9RakW
	jVYpLoksq9CGt2JmadNaMpuq2euhctjdUmiT/X4=
X-Google-Smtp-Source: ABdhPJyPD1+vFTL7zI7MOAWlVQpzZfCC/ogYQOnb9fs+BnJ9OUYDclIzyORrk2d04n90LZcBaiPMBu6CLlPqCKGn2dQ=
X-Received: by 2002:a81:ad7:0:b0:2e6:84de:3223 with SMTP id
 206-20020a810ad7000000b002e684de3223mr26970693ywk.209.1654527628777; Mon, 06
 Jun 2022 08:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220606084109.4108188-1-arnd@kernel.org> <20220606084109.4108188-6-arnd@kernel.org>
 <alpine.DEB.2.21.2206061057060.19680@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2206061057060.19680@angie.orcam.me.uk>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 6 Jun 2022 17:00:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0pqQHMucGgZDcLpoWMhoyU5yppXK=8y4Wsn0QL7=uD0g@mail.gmail.com>
Message-ID: <CAK8P3a0pqQHMucGgZDcLpoWMhoyU5yppXK=8y4Wsn0QL7=uD0g@mail.gmail.com>
Subject: Re: [PATCH 5/6] scsi: remove stale BusLogic driver
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martyn Welch <martyn@welchs.me.uk>, Manohar Vanga <manohar.vanga@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Denis Efremov <efremov@linux.com>, Christoph Hellwig <hch@infradead.org>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Matt Wang <wwentao@vmware.com>, Parisc List <linux-parisc@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, Khalid Aziz <khalid@gonehiking.org>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 6, 2022 at 12:40 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
> On Mon, 6 Jun 2022, Arnd Bergmann wrote:
>
> > This was in turn fixed in commit 56f396146af2 ("scsi: BusLogic: Fix
> > 64-bit system enumeration error for Buslogic"), 8 years later.
> >
> > The fact that this was found at all is an indication that there are
> > users, and it seems that Maciej, Matt and Khalid all have access to
> > this hardware, but if it took eight years to find the problem,
> > it's likely that nobody actually relies on it.
>
>  Umm, I use it with a 32-bit system, so it would be quite an issue for me
> to discover a problem with 64-bit configurations.  And I quite rely on
> this system for various stuff too!

Ok, good to know.

> > Remove it as part of the global virt_to_bus()/bus_to_virt() removal.
> > If anyone is still interested in keeping this driver, the alternative
> > is to stop it from using bus_to_virt(), possibly along the lines of
> > how dpt_i2o gets around the same issue.
>
>  Thanks for the pointer and for cc-ing me.  Please refrain from removing
> the driver at least for this release cycle and let me fix it.

Sure, no problem. It looks like I forgot to actually Cc you on the series
as I had meant to, glad it reached you anyway.

> It should be easy to mimic what I did for the defza driver: all bus addresses in
> the DMA API come associated with virtual addresses, so it is just a matter of
> recording those somewhere for later use rather than trying to mess up with
> bus addresses to figure out a reverse mapping.

I looked at the defza driver and that one appears simpler to me, as you
can look up the virtual address from an index, but it's possible I missed
what you do here. I meant specifically the calculation added by commit
67af2b060e02 ("[SCSI] dpt_i2o: move from virt_to_bus/bus_to_virt
to dma_alloc_coherent") in the dpt_i2o driver that can be used to
compute the virtual address. If something simpler works as well, that
is of course better.

        Arnd
