Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE254BB20
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 16:18:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TRrM5DyPzDqv3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 00:18:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TQqK0ZgpzDqP8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 23:32:28 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x5JDVjMj029809;
 Wed, 19 Jun 2019 08:31:53 -0500
Message-ID: <a5fc355e44fb5edea41274329f7c5d04a8dff6fc.camel@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: enable a 30-bit ZONE_DMA for 32-bit pmac
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@lst.de>,
 paulus@samba.org
Date: Wed, 19 Jun 2019 23:31:44 +1000
In-Reply-To: <87tvcldacn.fsf@concordia.ellerman.id.au>
References: <20190613082446.18685-1-hch@lst.de>
 <20190619105039.GA10118@lst.de> <87tvcldacn.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: aaro.koskinen@iki.fi, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Larry.Finger@lwfinger.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-06-19 at 22:32 +1000, Michael Ellerman wrote:
> Christoph Hellwig <hch@lst.de> writes:
> > Any chance this could get picked up to fix the regression?
> 
> Was hoping Ben would Ack it. He's still powermac maintainer :)
> 
> I guess he OK'ed it in the other thread, will add it to my queue.

Yeah ack. If I had written it myself, I would have made the DMA bits a
variable and only set it down to 30 if I see that device in the DT
early on, but I can't be bothered now, if it works, ship it :-)

Note: The patch affects all ppc32, though I don't think it will cause
any significant issue on those who don't need it.

Cheers,
Ben.

> cheers
> 
> > On Thu, Jun 13, 2019 at 10:24:46AM +0200, Christoph Hellwig wrote:
> > > With the strict dma mask checking introduced with the switch to
> > > the generic DMA direct code common wifi chips on 32-bit
> > > powerbooks
> > > stopped working.  Add a 30-bit ZONE_DMA to the 32-bit pmac builds
> > > to allow them to reliably allocate dma coherent memory.
> > > 
> > > Fixes: 65a21b71f948 ("powerpc/dma: remove
> > > dma_nommu_dma_supported")
> > > Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > ---
> > >  arch/powerpc/include/asm/page.h         | 7 +++++++
> > >  arch/powerpc/mm/mem.c                   | 3 ++-
> > >  arch/powerpc/platforms/powermac/Kconfig | 1 +
> > >  3 files changed, 10 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/powerpc/include/asm/page.h
> > > b/arch/powerpc/include/asm/page.h
> > > index b8286a2013b4..0d52f57fca04 100644
> > > --- a/arch/powerpc/include/asm/page.h
> > > +++ b/arch/powerpc/include/asm/page.h
> > > @@ -319,6 +319,13 @@ struct vm_area_struct;
> > >  #endif /* __ASSEMBLY__ */
> > >  #include <asm/slice.h>
> > >  
> > > +/*
> > > + * Allow 30-bit DMA for very limited Broadcom wifi chips on many
> > > powerbooks.
> > > + */
> > > +#ifdef CONFIG_PPC32
> > > +#define ARCH_ZONE_DMA_BITS 30
> > > +#else
> > >  #define ARCH_ZONE_DMA_BITS 31
> > > +#endif
> > >  
> > >  #endif /* _ASM_POWERPC_PAGE_H */
> > > diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> > > index cba29131bccc..2540d3b2588c 100644
> > > --- a/arch/powerpc/mm/mem.c
> > > +++ b/arch/powerpc/mm/mem.c
> > > @@ -248,7 +248,8 @@ void __init paging_init(void)
> > >  	       (long int)((top_of_ram - total_ram) >> 20));
> > >  
> > >  #ifdef CONFIG_ZONE_DMA
> > > -	max_zone_pfns[ZONE_DMA]	= min(max_low_pfn, 0x7fffffffUL
> > > >> PAGE_SHIFT);
> > > +	max_zone_pfns[ZONE_DMA]	= min(max_low_pfn,
> > > +			((1UL << ARCH_ZONE_DMA_BITS) - 1) >>
> > > PAGE_SHIFT);
> > >  #endif
> > >  	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
> > >  #ifdef CONFIG_HIGHMEM
> > > diff --git a/arch/powerpc/platforms/powermac/Kconfig
> > > b/arch/powerpc/platforms/powermac/Kconfig
> > > index f834a19ed772..c02d8c503b29 100644
> > > --- a/arch/powerpc/platforms/powermac/Kconfig
> > > +++ b/arch/powerpc/platforms/powermac/Kconfig
> > > @@ -7,6 +7,7 @@ config PPC_PMAC
> > >  	select PPC_INDIRECT_PCI if PPC32
> > >  	select PPC_MPC106 if PPC32
> > >  	select PPC_NATIVE
> > > +	select ZONE_DMA if PPC32
> > >  	default y
> > >  
> > >  config PPC_PMAC64
> > > -- 
> > > 2.20.1
> > 
> > ---end quoted text---

