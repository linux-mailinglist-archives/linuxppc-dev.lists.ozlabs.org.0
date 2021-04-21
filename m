Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF463663CD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 04:51:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQ4p45NcHz30C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 12:51:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RYEY+yoB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b30;
 helo=mail-yb1-xb30.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RYEY+yoB; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQ4nd1RjTz2xgK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 12:51:32 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id i4so7931399ybe.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 19:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gNVPW0JQNsVR1TIyBjBQIzSP/d6Ex55ej/X5s7XusCA=;
 b=RYEY+yoBJOIUBYxbwqlzQVjNmyGmSmWNzio5t2ibmqNJpu8t0fjHIBHDUckI4wKDvB
 2sl/veF3Oxu0fdzO51sRQEf4VaN7Z40Y6SUIZ7fVBxBixG7LcTRYjM14kG7ppsWoPTq9
 HFMR7+XsAfbqBG56pT7eT2RNQaVnV/8xtLKXYi/bpHBCwEPgNe3SJvNIknJ0fPVCA89B
 3GXFnlynDEhhVrwchu7Np4e3hQ9cDyS/0TexegVssn1IC6wirSFE582flm699LYQux26
 M7sGwlDuIUQxp8KTbAP213wVHld6tN1rHT9csh1DjjZh4wNiXtxScZL0fGh9lIHkkPAA
 8/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gNVPW0JQNsVR1TIyBjBQIzSP/d6Ex55ej/X5s7XusCA=;
 b=AsyX1bTgThWOFV4z1h2iwqyQtnyBmGJ4xEcWnaHaC6F8fEKzBCM+X1zZqfhJPd17YG
 cvHbn15uLDkReutHgTMTTpPMpmjIQkikmuF7Mo9sZoDX+4iElex9NJZYadG/slYNSM/D
 Z7KUccuZ9I+uz5k3Qj3gENVrawlznGB1eIuoIpWZWz3YT8sEDpGle9Bwj7Lw3py7QJEk
 9TYq5zfZi+po+tRpej9FxnLu8L7I9JQZNgC0f4wK5YNg8ysYNrVRZxn0Pn6xwl7kVUcI
 hckw6Eb8mS+vstGwFjc1efx/GM0jc4aQHkMdKecuxKTfsmAZVLFNLViW3Ga3cV9Kj31t
 GPwA==
X-Gm-Message-State: AOAM532XLTiPwEnhQik5pn2DKqDunUG2X81y1nbK29iCkb5aFL1LTCN+
 X+46BdqXz3OUXm5Nb+bYVD5NHZm1G+JgU2q18P8=
X-Google-Smtp-Source: ABdhPJxsr0V1J/ZqMOaSC2v4rIFIWTV5Q9zGxcKAOK3dpkr5lL1Luo9b5ajTF9X8oVyj+Ja1b0e+uz0jwvQ4INVIOfQ=
X-Received: by 2002:a25:3103:: with SMTP id x3mr28819395ybx.8.1618973489568;
 Tue, 20 Apr 2021 19:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210330045132.722243-1-jniethe5@gmail.com>
 <20210330045132.722243-2-jniethe5@gmail.com>
 <1503da9e-b74e-b6d0-b5f3-a1648270e930@csgroup.eu>
In-Reply-To: <1503da9e-b74e-b6d0-b5f3-a1648270e930@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 21 Apr 2021 12:51:18 +1000
Message-ID: <CACzsE9oG1X+cqvKwboFBtOeSmSJnWi86ceyaXqorTx1t6gPFPQ@mail.gmail.com>
Subject: Re: [PATCH v10 01/10] powerpc/mm: Implement set_memory() routines
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: ajd@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, cmr@codefail.de,
 naveen.n.rao@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 30, 2021 at 4:16 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 30/03/2021 =C3=A0 06:51, Jordan Niethe a =C3=A9crit :
> > From: Russell Currey <ruscur@russell.cc>
> >
> > The set_memory_{ro/rw/nx/x}() functions are required for STRICT_MODULE_=
RWX,
> > and are generally useful primitives to have.  This implementation is
> > designed to be completely generic across powerpc's many MMUs.
> >
> > It's possible that this could be optimised to be faster for specific
> > MMUs, but the focus is on having a generic and safe implementation for
> > now.
> >
> > This implementation does not handle cases where the caller is attemptin=
g
> > to change the mapping of the page it is executing from, or if another
> > CPU is concurrently using the page being altered.  These cases likely
> > shouldn't happen, but a more complex implementation with MMU-specific c=
ode
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
> > [jpn: -rebase on next plus "powerpc/mm/64s: Allow STRICT_KERNEL_RWX aga=
in"
> >        - WARN on hash linear map]
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v10: WARN if trying to change the hash linear map
> > ---
> >   arch/powerpc/Kconfig                  |  1 +
> >   arch/powerpc/include/asm/set_memory.h | 32 ++++++++++
> >   arch/powerpc/mm/Makefile              |  2 +-
> >   arch/powerpc/mm/pageattr.c            | 88 ++++++++++++++++++++++++++=
+
> >   4 files changed, 122 insertions(+), 1 deletion(-)
> >   create mode 100644 arch/powerpc/include/asm/set_memory.h
> >   create mode 100644 arch/powerpc/mm/pageattr.c
> >
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index fc7f5c5933e6..4498a27ac9db 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -135,6 +135,7 @@ config PPC
> >       select ARCH_HAS_MEMBARRIER_CALLBACKS
> >       select ARCH_HAS_MEMBARRIER_SYNC_CORE
> >       select ARCH_HAS_SCALED_CPUTIME          if VIRT_CPU_ACCOUNTING_NA=
TIVE && PPC_BOOK3S_64
> > +     select ARCH_HAS_SET_MEMORY
> >       select ARCH_HAS_STRICT_KERNEL_RWX       if ((PPC_BOOK3S_64 || PPC=
32) && !HIBERNATION)
> >       select ARCH_HAS_TICK_BROADCAST          if GENERIC_CLOCKEVENTS_BR=
OADCAST
> >       select ARCH_HAS_UACCESS_FLUSHCACHE
> > diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/inclu=
de/asm/set_memory.h
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
> >   ccflags-$(CONFIG_PPC64)     :=3D $(NO_MINIMAL_TOC)
> >
> > -obj-y                                :=3D fault.o mem.o pgtable.o mmap=
.o maccess.o \
> > +obj-y                                :=3D fault.o mem.o pgtable.o mmap=
.o maccess.o pageattr.o \
> >                                  init_$(BITS).o pgtable_$(BITS).o \
> >                                  pgtable-frag.o ioremap.o ioremap_$(BIT=
S).o \
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
> > + * This is unsafe if the caller is attempting to change the mapping of=
 the
> > + * page it is executing from, or if another CPU is concurrently using =
the
> > + * page being altered.
> > + *
> > + * TODO make the implementation resistant to this.
> > + *
> > + * NOTE: can be dangerous to call without STRICT_KERNEL_RWX
> > + */
> > +static int change_page_attr(pte_t *ptep, unsigned long addr, void *dat=
a)
> > +{
> > +     long action =3D (long)data;
> > +     pte_t pte;
> > +
> > +     spin_lock(&init_mm.page_table_lock);
> > +
> > +     /* invalidate the PTE so it's safe to modify */
> > +     pte =3D ptep_get_and_clear(&init_mm, addr, ptep);
> > +     flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> > +
> > +     /* modify the PTE bits as desired, then apply */
> > +     switch (action) {
> > +     case SET_MEMORY_RO:
> > +             pte =3D pte_wrprotect(pte);
> > +             break;
> > +     case SET_MEMORY_RW:
> > +             pte =3D pte_mkwrite(pte);
> > +             break;
> > +     case SET_MEMORY_NX:
> > +             pte =3D pte_exprotect(pte);
> > +             break;
> > +     case SET_MEMORY_X:
> > +             pte =3D pte_mkexec(pte);
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
> > +     unsigned long start =3D ALIGN_DOWN(addr, PAGE_SIZE);
> > +     unsigned long sz =3D numpages * PAGE_SIZE;
> > +
> > +     if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> > +             return 0;
>
> You should do this in the header file in order to get it optimised out co=
mpletely when
> CONFIG_STRICT_KERNEL_RWX is not set.
>
> In asm/set_memory.h you could have:
>
> #ifdef CONFIG_STRICT_KERNEL_RWX
> int change_memory_attr(unsigned long addr, int numpages, long action);
> #else
> static inline int change_memory_attr(unsigned long addr, int numpages, lo=
ng action) { return 0; }
> #endif
>
> Or another solution is to only define ARCH_HAS_SET_MEMORY when CONFIG_STR=
ICT_KERNEL_RWX is selected.
I think making ARCH_HAS_SET_MEMORY depend on CONFIG_STRICT_KERNEL_RWX
is the way to go.
>
> > +
> > +     if (numpages <=3D 0)
> > +             return 0;
> > +
> > +#ifdef CONFIG_PPC_BOOK3S_64
> > +     if (WARN_ON_ONCE(!radix_enabled() &&
> > +                  get_region_id(addr) =3D=3D LINEAR_MAP_REGION_ID)) {
> > +             return -1;
> > +     }
> > +#endif
> > +
> > +     return apply_to_existing_page_range(&init_mm, start, sz,
> > +                                         change_page_attr, (void *)act=
ion);
> > +}
> >
