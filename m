Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BFE559621
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 11:11:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTrwH5lSpz3cg2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 19:11:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DujAp35g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DujAp35g;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTrvg4FBkz3bl8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 19:11:11 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 010A5CE2903
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 09:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 708DCC341CC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 09:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656061867;
	bh=QZAJaXcIRADU/xKJ+9ztqTuLJLuzfPWx4kL+CXKUusE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DujAp35gBkJI0ojh8Z4cz2WNMnPVa8X09AjvGzpyvg1W3zpRtikVU8S1p5YzkeFQn
	 lyqUI2IK/TRwsZ6Fphm5Gnrx8o8G+PE51sAvsFnYOkkSigRwkL7Ti34QY5mgrVlD4K
	 q87W/nor5rNmj3N+qIRXTKGiC0CtdvN0KmhO4zeDIsbYYD8QC1BFTaduxwig96j3Pp
	 tKSojB4iYnI/xdxLhYubiYytYTgX6J2RKt1/59qilMZK37CJaHmf49rGGpZzrmzm5C
	 vXPE3OAWpxbhgHGBmdLEkg9vKAPO5+PD+s0ZO+euAV2nmh7i/+PPY0rPFj46LXVDDi
	 0tE0Cc0wwED0w==
Received: by mail-yb1-f173.google.com with SMTP id o79so3487963ybc.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 02:11:07 -0700 (PDT)
X-Gm-Message-State: AJIora8rc6ky/mXhyPh/qPZpkZGNwJtHnGV8WCAafEjQDnZlPgjbUOIS
	L/8il5rzn5D1wM/pPyVs6bfRKANLyRRiFK3NFPg=
X-Google-Smtp-Source: AGRyM1thOWm6xvviAmnNqulTm+G1aNh8sMElBL34hFaSX/cB93p4OtnA8uz/osirQ5xn1zAs3G7Hy/thW2fsxExc9gs=
X-Received: by 2002:a05:6902:120f:b0:668:2228:9627 with SMTP id
 s15-20020a056902120f00b0066822289627mr14111407ybu.134.1656061866469; Fri, 24
 Jun 2022 02:11:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220617125750.728590-1-arnd@kernel.org> <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
In-Reply-To: <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 24 Jun 2022 11:10:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1XfwkTOV7qOs1fTxf4vthNBRXKNu8A5V7TWnHT081NGA@mail.gmail.com>
Message-ID: <CAK8P3a1XfwkTOV7qOs1fTxf4vthNBRXKNu8A5V7TWnHT081NGA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
To: Michael Schmitz <schmitzmic@gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Miquel van Smoorenburg <mikevs@xs4all.net>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-scsi <linux-scsi@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@lists.linux-m68k.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Denis Efremov <efremov@linux.com>, Mark Salyzyn <salyzyn@android.com>, Christoph Hellwig <hch@infradead.org>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Matt Wang <wwentao@vmware.com>, Parisc List <linux-parisc@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, Khalid Aziz <khalid@gonehiking.org>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 18, 2022 at 3:06 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 18.06.2022 um 00:57 schrieb Arnd Bergmann:
> >
> > All architecture-independent users of virt_to_bus() and bus_to_virt()
> > have been fixed to use the dma mapping interfaces or have been
> > removed now.  This means the definitions on most architectures, and the
> > CONFIG_VIRT_TO_BUS symbol are now obsolete and can be removed.
> >
> > The only exceptions to this are a few network and scsi drivers for m68k
> > Amiga and VME machines and ppc32 Macintosh. These drivers work correctly
> > with the old interfaces and are probably not worth changing.
>
> The Amiga SCSI drivers are all old WD33C93 ones, and replacing
> virt_to_bus by virt_to_phys in the dma_setup() function there would
> cause no functional change at all.

Ok, thanks for taking a look here.

> drivers/vme/bridges/vme_ca91cx42.c hasn't been used at all on m68k (it
> is a PCI-to-VME bridge chipset driver that would be needed on
> architectures that natively use a PCI bus). I haven't found anything
> that selects that driver, so not sure it is even still in use??

It's gone now, Greg has already taken my patches for this through
the staging tree.

> That would allow you to drop the remaining virt_to_bus define from
> arch/m68k/include/asm/virtconvert.h.
>
> I could submit a patch to convert the Amiga SCSI drivers to use
> virt_to_phys if Geert and the SCSI maintainers think it's worth the churn.

I don't think using virt_to_phys() is an improvement here, as
virt_to_bus() was originally meant as a better abstraction to
replace the use of virt_to_phys() to make drivers portable, before
it got replaced by the dma-mapping interface in turn.

It looks like the Amiga SCSI drivers have an open-coded version of
what dma_map_single() does, to do bounce buffering and cache
management. The ideal solution would be to convert the drivers
actually use the appropriate dma-mapping interfaces and remove
this custom code.

The same could be done for the two vme drivers (scsi/mvme147.c
and ethernet/82596.c), which do the cache management but
apparently don't need swiotlb bounce buffering.

Rewriting the drivers to modern APIs is of course non-trivial,
and if you want a shortcut here, I would suggest introducing
platform specific helpers similar to isa_virt_to_bus() and call
them amiga_virt_to_bus() and vme_virt_to_bus, respectively.

Putting these into a platform specific header file at least helps
clarify that both the helper functions and the drivers using them
are non-portable.

> 32bit powerpc is a different matter though.

It's similar, but unrelated. The two apple ethernet drivers
(bmac and mace) can again either get changed to use the
dma-mapping interfaces, or get a custom pmac_virt_to_bus()/
pmac_bus_to_virt() helper.

There is also drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c,
which I think just needs a trivial change, but I'm not sure
how to do it correctly.

      Arnd
