Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 105AA55B04F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 10:37:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LW43K6rL7z3c1g
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 18:37:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f6yc1RaN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f6yc1RaN;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LW42h0JWgz3bhB
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jun 2022 18:36:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7CCE861177
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jun 2022 08:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD5CC341D3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jun 2022 08:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656232582;
	bh=juR3pWHFZdE8Vf6QGsSTJiJ2f3ZwildJoxwQZWNpG/E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f6yc1RaNJwQq5dElIkyuYvUvwHkvBLBi9KqlHP2ZC+oxWcerSMGK3hkxIM7cIAAT/
	 TtueQ33cy4/n0Uda61TReBytE65eLfQrezytZmtm7bX//WKI/yOT60iTP49ZEIOPSW
	 6z1NOCnw36qsukMeObt289BsjK4np0rxC1P8TL2Fy3MIi0PXPCcxYI0ThEmMrCWGfS
	 UrkYBYjapcfJFTuf2LfH5cpnGXFFNt0wE6A6XBDTb085dl806k7RyMDAUO+JHUYTkX
	 Au2xvaXvS/pK8PTQWyJuWsS1hRHbV8q3oa+eOltOLdGmLNGlNuBwPHqKBVX/LvLixJ
	 OvRvGfKxK4K+w==
Received: by mail-yb1-f177.google.com with SMTP id x184so9022138ybg.12
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jun 2022 01:36:22 -0700 (PDT)
X-Gm-Message-State: AJIora9FmMyuyayVflK0teuebASVO2Lu+8etE7MBt0s0WxMH+jmrz92j
	JNYlgfv73RKdFmNfy+cd1pN7T4G3TYOGyMRLOY0=
X-Google-Smtp-Source: AGRyM1s9r/oqGpmVzKxZ+US+FaaRE8PSLnvRSxz/eiJkctG/2AzfYvDmvG4YKVmQhXgJnW7ApVihluVitAAeI1SlHhw=
X-Received: by 2002:a25:8b8b:0:b0:669:b37d:f9cd with SMTP id
 j11-20020a258b8b000000b00669b37df9cdmr7722013ybl.394.1656232581073; Sun, 26
 Jun 2022 01:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220617125750.728590-1-arnd@kernel.org> <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com> <CAK8P3a1XfwkTOV7qOs1fTxf4vthNBRXKNu8A5V7TWnHT081NGA@mail.gmail.com>
 <6d1d88ee-1cf6-c735-1e6d-bafd2096e322@gmail.com>
In-Reply-To: <6d1d88ee-1cf6-c735-1e6d-bafd2096e322@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 26 Jun 2022 10:36:02 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1KKPXr0ews9po_xjmnGYUWf18gBaZYYmnC+DvtxTKLmQ@mail.gmail.com>
Message-ID: <CAK8P3a1KKPXr0ews9po_xjmnGYUWf18gBaZYYmnC+DvtxTKLmQ@mail.gmail.com>
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

(On Sun, Jun 26, 2022 at 7:21 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>  > The same could be done for the two vme drivers (scsi/mvme147.c
> > and ethernet/82596.c), which do the cache management but
> > apparently don't need swiotlb bounce buffering.
> >
> > Rewriting the drivers to modern APIs is of course non-trivial,
> > and if you want a shortcut here, I would suggest introducing
> > platform specific helpers similar to isa_virt_to_bus() and call
> > them amiga_virt_to_bus() and vme_virt_to_bus, respectively.
>
> I don't think Amiga and m68k VME differ at all in that respect, so might
> just call it m68k_virt_to_bus() for now.
>
> > Putting these into a platform specific header file at least helps
> > clarify that both the helper functions and the drivers using them
> > are non-portable.
>
> There are no platform specific header files other than asm/amigahw.h and
> asm/mvme147hw.h, currently only holding register address definitions.
> Would it be OK to add m68k_virt_to_bus() in there if it can't remain in
> asm/virtconvert.h, Geert?

In that case, I would just leave it under the current name and not change
m68k at all. I don't like the m68k_virt_to_bus() name because there is
not anything CPU specific in what it does, and keeping it in a common
header does nothing to prevent it from being used on other platforms
either.

> >> 32bit powerpc is a different matter though.
> >
> > It's similar, but unrelated. The two apple ethernet drivers
> > (bmac and mace) can again either get changed to use the
> > dma-mapping interfaces, or get a custom pmac_virt_to_bus()/
> > pmac_bus_to_virt() helper.
>
> Hmmm - I see Finn had done the DMA API conversion on macmace.c which
> might give some hints on what to do about mace.c ... no idea about
> bmac.c though. And again, haven't got hardware to test, so custom
> helpers is it, then.

Ok.

          Arnd
