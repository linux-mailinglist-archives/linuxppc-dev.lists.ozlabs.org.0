Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6D03664B7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 07:19:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQ84d26Fyz30DT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 15:19:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=c8F4U79S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b31;
 helo=mail-yb1-xb31.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=c8F4U79S; dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQ84B6MWSz2y0B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 15:19:22 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id i4so8217105ybe.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 22:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XAZIHVdijUUGFo2ah07FxVug1uuGj3P2LI6gDVTxbFA=;
 b=c8F4U79SiV8zQ++PLmGCh9QD45RQqtZjXFREu1whB2ILdr/u7a1VIt+7Ae2EkYpFIm
 AmgS6RZ5cuDhi7Qp8iVDWV9vGWmiR4QiX/xeEpYR3SHG03e60G7p+wxUMchlMbIHfc9a
 SnUcJGGCaeZqYCOn2aespGM4VLXdb6/Mt1027CRReRsxTbM0CFGQAOFSWPLtDL51ZlxR
 sNf0yoZRSYSFHAvVNYajB10X9Y8pn3hiuvujk4neFfkEr4ofKo/nrWlgIACVwLqLUQ+i
 gydZ00GwhTmCPLPP5vRJk6lgGv496x9Opv85Y2HqB5jA6il0KOma0lZ6ZKZPqsrqzLFC
 opDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XAZIHVdijUUGFo2ah07FxVug1uuGj3P2LI6gDVTxbFA=;
 b=LzAQza48v6uOY/kjpsDG+I9R/KW9NltbEn+KPSXn2UaDpa2SaMTg0vXCyND4kTa16o
 erqKbZRFxPT3zM3HdoYYg/c+I0p1TlTMeFS7qgtEebNtf7rXUW4UkYyd+lC6nRmGay45
 5s6cq65cQexpWOEAjGEbq0Rtn9qJMapOIMR1VpA2kfSV0XeJodtyDsOE6lDI7YmL4I6S
 6JKPjDavsLf9WEvJWFxUfMX+cPygMidF7UMRh+y/tqBi6BKaivf+s4AbbJy60DMoB5h1
 PbZ5PGyy05HQ3Jjoj11raLrEP8hcZTh6zrvMVErCKV96ubaskUzzqTQRvGnDHTSTrriS
 DeiA==
X-Gm-Message-State: AOAM531iu7i+H5HT40RqwnZHWS8k4dJ6e749eyOgJnWS6B1SvRLSlt0F
 nEacKLHKDykP2LLIvu6Lk/M07gqE9R+VllxJOPc=
X-Google-Smtp-Source: ABdhPJwF8y/VaW5w6GhlSVmSRE/XyKJ/+Sw57IhMI1DV8jH1npKTGp6qLLwgyggkvXUc0rFrZgE5+wkMhRMn4fsmLZE=
X-Received: by 2002:a05:6902:124a:: with SMTP id
 t10mr16058068ybu.386.1618982360609; 
 Tue, 20 Apr 2021 22:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210330045132.722243-1-jniethe5@gmail.com>
 <20210330045132.722243-2-jniethe5@gmail.com>
 <87czve7h8r.fsf@linux.ibm.com>
In-Reply-To: <87czve7h8r.fsf@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 21 Apr 2021 15:19:09 +1000
Message-ID: <CACzsE9rXXUW1iuxXFNQ-5HTH6_=EMGJ-TXT03RQ-LiLVFiTHpA@mail.gmail.com>
Subject: Re: [PATCH v10 01/10] powerpc/mm: Implement set_memory() routines
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: ajd@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, cmr@codefail.de,
 naveen.n.rao@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 1, 2021 at 3:37 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Jordan Niethe <jniethe5@gmail.com> writes:
>
> > From: Russell Currey <ruscur@russell.cc>
> >
> > The set_memory_{ro/rw/nx/x}() functions are required for STRICT_MODULE_RWX,
> > and are generally useful primitives to have.  This implementation is
> > designed to be completely generic across powerpc's many MMUs.
> >
> > It's possible that this could be optimised to be faster for specific
> > MMUs, but the focus is on having a generic and safe implementation for
> > now.
> >
> > This implementation does not handle cases where the caller is attempting
> > to change the mapping of the page it is executing from, or if another
> > CPU is concurrently using the page being altered.  These cases likely
> > shouldn't happen, but a more complex implementation with MMU-specific code
> > could safely handle them, so that is left as a TODO for now.
> >
> > On hash the linear mapping is not kept in the linux pagetable, so this
> > will not change the protection if used on that range. Currently these
> > functions are not used on the linear map so just WARN for now.
> >
> > These functions do nothing if STRICT_KERNEL_RWX is not enabled.
> >
> > Reviewed-by: Daniel Axtens <dja@axtens.net>
> > Signed-off-by: Russell Currey <ruscur@russell.cc>
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > [jpn: -rebase on next plus "powerpc/mm/64s: Allow STRICT_KERNEL_RWX again"
> >       - WARN on hash linear map]
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v10: WARN if trying to change the hash linear map
> > ---
> >  arch/powerpc/Kconfig                  |  1 +
> >  arch/powerpc/include/asm/set_memory.h | 32 ++++++++++
> >  arch/powerpc/mm/Makefile              |  2 +-
> >  arch/powerpc/mm/pageattr.c            | 88 +++++++++++++++++++++++++++
> >  4 files changed, 122 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/powerpc/include/asm/set_memory.h
> >  create mode 100644 arch/powerpc/mm/pageattr.c
> >
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index fc7f5c5933e6..4498a27ac9db 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -135,6 +135,7 @@ config PPC
> >       select ARCH_HAS_MEMBARRIER_CALLBACKS
> >       select ARCH_HAS_MEMBARRIER_SYNC_CORE
> >       select ARCH_HAS_SCALED_CPUTIME          if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
> > +     select ARCH_HAS_SET_MEMORY
> >       select ARCH_HAS_STRICT_KERNEL_RWX       if ((PPC_BOOK3S_64 || PPC32) && !HIBERNATION)
> >       select ARCH_HAS_TICK_BROADCAST          if GENERIC_CLOCKEVENTS_BROADCAST
> >       select ARCH_HAS_UACCESS_FLUSHCACHE
> > diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/include/asm/set_memory.h
> > new file mode 100644
> > index 000000000000..64011ea444b4
> > --- /dev/null
> > +++ b/arch/powerpc/include/asm/set_memory.h
> > @@ -0,0 +1,32 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_POWERPC_SET_MEMORY_H
> > +#define _ASM_POWERPC_SET_MEMORY_H
> > +
> > +#define SET_MEMORY_RO        0
> > +#define SET_MEMORY_RW        1
> > +#define SET_MEMORY_NX        2
> > +#define SET_MEMORY_X 3
> > +
> > +int change_memory_attr(unsigned long addr, int numpages, long action);
> > +
> > +static inline int set_memory_ro(unsigned long addr, int numpages)
> > +{
> > +     return change_memory_attr(addr, numpages, SET_MEMORY_RO);
> > +}
> > +
> > +static inline int set_memory_rw(unsigned long addr, int numpages)
> > +{
> > +     return change_memory_attr(addr, numpages, SET_MEMORY_RW);
> > +}
> > +
> > +static inline int set_memory_nx(unsigned long addr, int numpages)
> > +{
> > +     return change_memory_attr(addr, numpages, SET_MEMORY_NX);
> > +}
> > +
> > +static inline int set_memory_x(unsigned long addr, int numpages)
> > +{
> > +     return change_memory_attr(addr, numpages, SET_MEMORY_X);
> > +}
> > +
> > +#endif
> > diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
> > index 3b4e9e4e25ea..d8a08abde1ae 100644
> > --- a/arch/powerpc/mm/Makefile
> > +++ b/arch/powerpc/mm/Makefile
> > @@ -5,7 +5,7 @@
> >
> >  ccflags-$(CONFIG_PPC64)      := $(NO_MINIMAL_TOC)
> >
> > -obj-y                                := fault.o mem.o pgtable.o mmap.o maccess.o \
> > +obj-y                                := fault.o mem.o pgtable.o mmap.o maccess.o pageattr.o \
> >                                  init_$(BITS).o pgtable_$(BITS).o \
> >                                  pgtable-frag.o ioremap.o ioremap_$(BITS).o \
> >                                  init-common.o mmu_context.o drmem.o
> > diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> > new file mode 100644
> > index 000000000000..9efcb01088da
> > --- /dev/null
> > +++ b/arch/powerpc/mm/pageattr.c
> > @@ -0,0 +1,88 @@
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
> > + * This is unsafe if the caller is attempting to change the mapping of the
> > + * page it is executing from, or if another CPU is concurrently using the
> > + * page being altered.
> > + *
> > + * TODO make the implementation resistant to this.
> > + *
> > + * NOTE: can be dangerous to call without STRICT_KERNEL_RWX
> > + */
> > +static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
> > +{
> > +     long action = (long)data;
> > +     pte_t pte;
> > +
> > +     spin_lock(&init_mm.page_table_lock);
> > +
> > +     /* invalidate the PTE so it's safe to modify */
> > +     pte = ptep_get_and_clear(&init_mm, addr, ptep);
> > +     flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> > +
> > +     /* modify the PTE bits as desired, then apply */
> > +     switch (action) {
> > +     case SET_MEMORY_RO:
> > +             pte = pte_wrprotect(pte);
> > +             break;
> > +     case SET_MEMORY_RW:
> > +             pte = pte_mkwrite(pte);
> > +             break;
> > +     case SET_MEMORY_NX:
> > +             pte = pte_exprotect(pte);
> > +             break;
> > +     case SET_MEMORY_X:
> > +             pte = pte_mkexec(pte);
> > +             break;
> > +     default:
> > +             WARN_ON_ONCE(1);
> > +             break;
> > +     }
> > +
> > +     set_pte_at(&init_mm, addr, ptep, pte);
> > +     spin_unlock(&init_mm.page_table_lock);
> > +
> > +     return 0;
> > +}
> > +
> > +int change_memory_attr(unsigned long addr, int numpages, long action)
> > +{
> > +     unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
> > +     unsigned long sz = numpages * PAGE_SIZE;
> > +
> > +     if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> > +             return 0;
>
> What restrictions imposed by that config are we dependent on here?
So the reasons given here
https://lore.kernel.org/linuxppc-dev/20200226062403.63790-9-ruscur@russell.cc/
were:
"
 - The linear mapping is a different size and apply_to_page_range()
may modify a giant section, breaking everything
 - patch_instruction() doesn't know to work around a page being marked
  RO, and will subsequently crash
"
but now I'm not 100% sure about it... we might not actually need to
have that restriction.

>
>
> > +
> > +     if (numpages <= 0)
> > +             return 0;
> > +
> > +#ifdef CONFIG_PPC_BOOK3S_64
> > +     if (WARN_ON_ONCE(!radix_enabled() &&
> > +                  get_region_id(addr) == LINEAR_MAP_REGION_ID)) {
> > +             return -1;
> > +     }
> > +#endif
>
> What about VMEMMAP_REGIOND_ID
True.
>
> > +
> > +     return apply_to_existing_page_range(&init_mm, start, sz,
> > +                                         change_page_attr, (void *)action);
>
>
> That handles on 64K mapping. What about linear map? Also there is a
> patchset implementing hugepage for vmalloc mapping.
At least for now there is nothing that calls the set memory functions
on the linear map.
Is that this series:
https://lore.kernel.org/linuxppc-dev/20210317062402.533919-15-npiggin@gmail.com/
?
I will test on top of that.
>
> > +}
> > --
> > 2.25.1
