Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B11D31989A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 03:51:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rskq3l1SzDqn2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 12:51:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=Lpnp+6Qd; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=sHEgQ3pL; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rshr6S75zDqfD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 12:50:03 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5DF375C02C3;
 Mon, 30 Mar 2020 21:50:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 30 Mar 2020 21:50:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 p2KSOaTwCizI8NrfTNMFOYqWNJj9mQsC7SYLZS210X4=; b=Lpnp+6Qd62r57AI8
 w5UZSpXqQXuFVfr46N/aPdfOE4qCb+p8IKH4GkK/bPOXdTHbGL+rCXCYMCcbcOQk
 WWT8URf+8K8K1kJwqckL5JOP2EXWm8OQK9sRswr3S7oBFy++o2GDcP+qa/x4Lcv6
 v1FCy7AoxA+VqdKq9rWvP1L+E9FWOaUBOOE5AeIQg4mV7e+wXevaOurxuWGAVaC6
 6lU/e5g4S034JhXtRz3FHTpSXjRGyosMwkUrttW6sP9263OMhrTibiYEJDEbMRyQ
 Blo/TsrL84uE0ysgvT9jS+EHeH3yjhX0qDZ6hP7J+4xpiS8nudo0x6vziK9cbJKr
 XUU4ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=p2KSOaTwCizI8NrfTNMFOYqWNJj9mQsC7SYLZS210
 X4=; b=sHEgQ3pLqN4XlzRqunk7ikJyyogVVAUTcpBK4ek00vee9YQGrJ/ulaDvV
 WD+Zya4vUSFerCi4t2CBJpOH9wH1wkGNA5F4NrN94KSoXjedKKb0EL8hb5dzb3KG
 90HtF8ELYCeBpq2oXQ4SPA8hOUVo9YGcCBRwU4NcecPyYNugvaUgBYpPcPSYGOtS
 YkW24dCT9WVOCMpMVVIRxKEPo+T/nvAI12ov0wMottebELNf/K6Mu+ddLEvYSZek
 FAKwlfLQfR1bcpuOuc+U7UmLv5cISN4rhg3/POWdYEJ1DjL8JZCoTzwyABlURfOP
 xoqC4WrOdnvi3oACU98Op9D/RsrNA==
X-ME-Sender: <xms:xqGCXlSkEc0M8jFwOVAOCXDatkG289cklFhiaiaXsPBFsk4fOh4IcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudeiiedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdluddtmdenucfjughrpefkuf
 fhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhr
 rhgvhicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucfkphepuddvuddrgeehrd
 dvuddvrddvfeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:xqGCXiBQg7To1wQvKJZWR361wnN5tqiGf84Stgu0T0uOTlYimga05Q>
 <xmx:xqGCXhfUp7sB7fAHKwat1JULsAl0rbTryGEjQC-WMTRzozkCHzedqQ>
 <xmx:xqGCXgU7LytCDn1k8n1u_BbgEJGeYcz8-imN0cJUXEBRd2gkSANsIw>
 <xmx:yKGCXo06zHut1WVVyXNCfyd07JDhzOXJhFEEuA0t2Ya7vy2pQ7HaHw>
Received: from crackle.ozlabs.ibm.com
 (ppp121-45-212-239.bras1.cbr2.internode.on.net [121.45.212.239])
 by mail.messagingengine.com (Postfix) with ESMTPA id 146913280059;
 Mon, 30 Mar 2020 21:49:55 -0400 (EDT)
Message-ID: <7b275ce545dc289ec0e072bf79ce03fbf633160c.camel@russell.cc>
Subject: Re: [PATCH v6 1/7] powerpc/mm: Implement set_memory() routines
From: Russell Currey <ruscur@russell.cc>
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 31 Mar 2020 12:49:52 +1100
In-Reply-To: <87imjbpgw2.fsf@dja-thinkpad.axtens.net>
References: <20200310010338.21205-1-ruscur@russell.cc>
 <20200310010338.21205-2-ruscur@russell.cc>
 <87imjbpgw2.fsf@dja-thinkpad.axtens.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0 
MIME-Version: 1.0
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-03-11 at 17:03 +1100, Daniel Axtens wrote:
> Russell Currey <ruscur@russell.cc> writes:
> 
> > The set_memory_{ro/rw/nx/x}() functions are required for
> > STRICT_MODULE_RWX,
> > and are generally useful primitives to have.  This implementation
> > is
> > designed to be completely generic across powerpc's many MMUs.
> > 
> > It's possible that this could be optimised to be faster for
> > specific
> > MMUs, but the focus is on having a generic and safe implementation
> > for
> > now.
> > 
> > This implementation does not handle cases where the caller is
> > attempting
> > to change the mapping of the page it is executing from, or if
> > another
> > CPU is concurrently using the page being altered.  These cases
> > likely
> > shouldn't happen, but a more complex implementation with MMU-
> > specific code
> > could safely handle them, so that is left as a TODO for now.
> > 
> > These functions do nothing if STRICT_KERNEL_RWX is not enabled.
> > 
> > Signed-off-by: Russell Currey <ruscur@russell.cc>
> > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > ---
> > v6: Merge patch 8/8 from v5, handling RWX not being enabled.
> >     Add note to change_page_attr() in case it's ever made non-
> > static
> > ---
> >  arch/powerpc/Kconfig                  |  1 +
> >  arch/powerpc/include/asm/set_memory.h | 32 +++++++++++
> >  arch/powerpc/mm/Makefile              |  2 +-
> >  arch/powerpc/mm/pageattr.c            | 79
> > +++++++++++++++++++++++++++
> >  4 files changed, 113 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/powerpc/include/asm/set_memory.h
> >  create mode 100644 arch/powerpc/mm/pageattr.c
> > 
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index 497b7d0b2d7e..bd074246e34e 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -129,6 +129,7 @@ config PPC
> >  	select ARCH_HAS_PTE_SPECIAL
> >  	select ARCH_HAS_MEMBARRIER_CALLBACKS
> >  	select ARCH_HAS_SCALED_CPUTIME		if
> > VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
> > +	select ARCH_HAS_SET_MEMORY
> >  	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 ||
> > PPC32) && !HIBERNATION)
> >  	select ARCH_HAS_TICK_BROADCAST		if
> > GENERIC_CLOCKEVENTS_BROADCAST
> >  	select ARCH_HAS_UACCESS_FLUSHCACHE
> > diff --git a/arch/powerpc/include/asm/set_memory.h
> > b/arch/powerpc/include/asm/set_memory.h
> > new file mode 100644
> > index 000000000000..64011ea444b4
> > --- /dev/null
> > +++ b/arch/powerpc/include/asm/set_memory.h
> > @@ -0,0 +1,32 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_POWERPC_SET_MEMORY_H
> > +#define _ASM_POWERPC_SET_MEMORY_H
> > +
> > +#define SET_MEMORY_RO	0
> > +#define SET_MEMORY_RW	1
> > +#define SET_MEMORY_NX	2
> > +#define SET_MEMORY_X	3
> > +
> > +int change_memory_attr(unsigned long addr, int numpages, long
> > action);
> > +
> > +static inline int set_memory_ro(unsigned long addr, int numpages)
> > +{
> > +	return change_memory_attr(addr, numpages, SET_MEMORY_RO);
> > +}
> > +
> > +static inline int set_memory_rw(unsigned long addr, int numpages)
> > +{
> > +	return change_memory_attr(addr, numpages, SET_MEMORY_RW);
> > +}
> > +
> > +static inline int set_memory_nx(unsigned long addr, int numpages)
> > +{
> > +	return change_memory_attr(addr, numpages, SET_MEMORY_NX);
> > +}
> > +
> > +static inline int set_memory_x(unsigned long addr, int numpages)
> > +{
> > +	return change_memory_attr(addr, numpages, SET_MEMORY_X);
> > +}
> > +
> > +#endif
> > diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
> > index 5e147986400d..a998fdac52f9 100644
> > --- a/arch/powerpc/mm/Makefile
> > +++ b/arch/powerpc/mm/Makefile
> > @@ -5,7 +5,7 @@
> >  
> >  ccflags-$(CONFIG_PPC64)	:= $(NO_MINIMAL_TOC)
> >  
> > -obj-y				:= fault.o mem.o pgtable.o
> > mmap.o \
> > +obj-y				:= fault.o mem.o pgtable.o
> > mmap.o pageattr.o \
> >  				   init_$(BITS).o pgtable_$(BITS).o \
> >  				   pgtable-frag.o ioremap.o
> > ioremap_$(BITS).o \
> >  				   init-common.o mmu_context.o drmem.o
> > diff --git a/arch/powerpc/mm/pageattr.c
> > b/arch/powerpc/mm/pageattr.c
> > new file mode 100644
> > index 000000000000..748fa56d9db0
> > --- /dev/null
> > +++ b/arch/powerpc/mm/pageattr.c
> > @@ -0,0 +1,79 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +/*
> > + * MMU-generic set_memory implementation for powerpc
> > + *
> > + * Copyright 2019, IBM Corporation.
> > + */
> > +
> > +#include <linux/mm.h>
> > +#include <linux/set_memory.h>
> > +
> > +#include <asm/mmu.h>
> > +#include <asm/page.h>
> > +#include <asm/pgtable.h>
> > +
> > +
> > +/*
> > + * Updates the attributes of a page in three steps:
> > + *
> > + * 1. invalidate the page table entry
> > + * 2. flush the TLB
> > + * 3. install the new entry with the updated attributes
> > + *
> > + * This is unsafe if the caller is attempting to change the
> > mapping of the
> > + * page it is executing from, or if another CPU is concurrently
> > using the
> > + * page being altered.
> > + *
> > + * TODO make the implementation resistant to this.
> > + *
> > + * NOTE: can be dangerous to call without STRICT_KERNEL_RWX
> > + */
> > +static int change_page_attr(pte_t *ptep, unsigned long addr, void
> > *data)
> > +{
> > +	long action = (long)data;
> > +	pte_t pte;
> > +
> > +	spin_lock(&init_mm.page_table_lock);
> > +
> > +	/* invalidate the PTE so it's safe to modify */
> > +	pte = ptep_get_and_clear(&init_mm, addr, ptep);
> > +	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> > +
> > +	/* modify the PTE bits as desired, then apply */
> > +	switch (action) {
> > +	case SET_MEMORY_RO:
> > +		pte = pte_wrprotect(pte);
> > +		break;
> > +	case SET_MEMORY_RW:
> > +		pte = pte_mkwrite(pte);
> > +		break;
> > +	case SET_MEMORY_NX:
> > +		pte = pte_exprotect(pte);
> > +		break;
> > +	case SET_MEMORY_X:
> > +		pte = pte_mkexec(pte);
> > +		break;
> > +	default:
> > +		break;
> 
> Should this have a WARN_ON_ONCE to let you know you're doing
> something
> that doesn't work? I know it's only ever called by things in this
> file,
> but still... Anyway it's very minor and I'm not fussed either way.

True, might as well.

> 
> > +	}
> > +
> > +	set_pte_at(&init_mm, addr, ptep, pte);
> > +	spin_unlock(&init_mm.page_table_lock);
> 
> Initially I thought: shouldn't you put the PTL lock/unlock in the
> outer
> function? Then I remembered that apply_to_page_range can potentially
> allocate new page table entries which would deadlock if you held the
> lock.
> 
> Speaking of which - apply_to_page_range will create new pte entries
> if
> you apply it over an address range that isn't filled in. That doesn't
> really make sense here - should you use apply_to_existing_page_range
> instead?
> 
> You _might_ be able to move the PTL lock if you use
> apply_to_existing_page_range but I'm not completely sure if that's
> safe
> or if the speed boost is worth it. You could check mm/memory.c if you
> wanted.

Seems like I should definitely be using apply_to_existing_page_range()
but I'm not too keen on moving the lock in case it's unsafe - and these
only get called on module load so it's not a particularly hot path.

> > +
> > +	return 0;
> > +}
> > +
> > +int change_memory_attr(unsigned long addr, int numpages, long
> > action)
> > +{
> > +	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
> > +	unsigned long sz = numpages * PAGE_SIZE;
> > +
> > +	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> > +		return 0;
> > +
> > +	if (!numpages)
> > +		return 0;
> 
> What happens if numpages is negative? Doesn't the guard need to check
> for that rather than just for zero?

I don't know why numpages isn't unsigned in the set_memory API, that
sounds like another potential patch.

Anyway, yes.

> With those caveats, and noting that I've been focused only on:
>  - lock/unlock paths
>  - integer arithmetic
>  - stuff about apply_page_range semantics
> this patch is:
> 
> Reviewed-by: Daniel Axtens <dja@axtens.net>

Thanks for the review, I wasn't aware apply_to_existing_page_range()
existed.

> 
> Regards,
> Daniel
> 
> > +
> > +	return apply_to_page_range(&init_mm, start, sz,
> > change_page_attr, (void *)action);
> > +}
> > -- 
> > 2.25.1

