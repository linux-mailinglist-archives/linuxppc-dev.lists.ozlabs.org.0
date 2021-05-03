Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 843DF37111A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 07:03:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYW8F4DBpz30DR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 15:03:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=IijfUSU7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b34;
 helo=mail-yb1-xb34.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IijfUSU7; dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYW7l5nZ6z2xb8
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 15:02:57 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id p126so6012127yba.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 May 2021 22:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mBrL2ZqmsgwNOa057zWt9ab9/QZrhMvwFD6jQjOP5TI=;
 b=IijfUSU7scLygnwhwS9y2lorj1wwgs9uZ/uqGyIgHWLQT41okhMwaGiDwiNK01IPYK
 RlnKOpMjqWH/X/aLw7216FsIyUYjCwdLz7ewOFO9J/0yzDQf70AcRXhvvs4VTIymB4lE
 LntgVDi5Js10ISkzYovg7/HJvOOLV4GW5R9Lg8guMtN0CghUCpLRBLen2LOk+qTCzPIO
 gNCptmeIWnANyInypn9jQCSRD9j8WcnYXfWtLcUZJGrjkiBDD5xmG3nMgVGkZplQ25dO
 hricdsegLv2XouViZ5IKRHvbcYi1USlEiHC/SWUhI9W8roPuUi2Mwq9a1xyDbMEvM3N0
 wcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mBrL2ZqmsgwNOa057zWt9ab9/QZrhMvwFD6jQjOP5TI=;
 b=HsqD/W569IUZeMyXPV+rdYEMlGQnT2zUWDLNubswEmrqnUFGOCwEbzOwtmPbOaB0k3
 irFwiyL6vlY88vKWkN3PNm6QgC2q5P0eJ7gVU01/YG7uZGFuGSoh/MfgtSxJV6OnEVi/
 PzBHXlXv6dq8nLnUdFkUGLIhmei8Oo6srx6O5hMwacqdnoJePZnhdZAOThuUdYcO0Ipy
 k/waNGM4z1wr6QmYw841C7WTW8YXLCpAcRlKdufmAeVMFXJ/SEH+flHV/ny1YaVDObJU
 FwYFYctt4O2wYzoZHOCJK+/RcDjTJd2AZMyCpqUAT6Inf55U2RhtkjWvtK3bapwo+LgP
 zXJA==
X-Gm-Message-State: AOAM5309zDdWXk+LX1dBSUWo257a/owEfqR3AVEGnym/hSPLYRfCWp0L
 5oVoNjQsmC/08ibfCNj3Ab5TUIiLX0jerOmsXQI=
X-Google-Smtp-Source: ABdhPJxGU5wqWL/uw0xZss4GfgfHnrEpalpVEn20eyhKN5PnXh1LlR2ra3nSrPahcKUZWIDbwq719G8KSVAHgU2H3w8=
X-Received: by 2002:a25:e64b:: with SMTP id d72mr23376879ybh.343.1620018172791; 
 Sun, 02 May 2021 22:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210429031602.2606654-1-jniethe5@gmail.com>
 <20210429031602.2606654-2-jniethe5@gmail.com>
 <eef1fef9-515c-3d7c-dbb7-6b93d97e35a1@csgroup.eu>
In-Reply-To: <eef1fef9-515c-3d7c-dbb7-6b93d97e35a1@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 3 May 2021 15:02:41 +1000
Message-ID: <CACzsE9qamXsq+c+8wF5nieBZ+VfmmCbBZ9_sUux1wsm6tvVf9w@mail.gmail.com>
Subject: Re: [PATCH v11 1/9] powerpc/mm: Implement set_memory() routines
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
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, naveen.n.rao@linux.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 29, 2021 at 5:32 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 29/04/2021 =C3=A0 05:15, Jordan Niethe a =C3=A9crit :
> > From: Russell Currey <ruscur@russell.cc>
> >
> > The set_memory_{ro/rw/nx/x}() functions are required for
> > STRICT_MODULE_RWX, and are generally useful primitives to have.  This
> > implementation is designed to be generic across powerpc's many MMUs.
> > It's possible that this could be optimised to be faster for specific
> > MMUs.
> >
> > This implementation does not handle cases where the caller is attemptin=
g
> > to change the mapping of the page it is executing from, or if another
> > CPU is concurrently using the page being altered.  These cases likely
> > shouldn't happen, but a more complex implementation with MMU-specific c=
ode
> > could safely handle them.
> >
> > On hash, the linear mapping is not kept in the linux pagetable, so this
> > will not change the protection if used on that range. Currently these
> > functions are not used on the linear map so just WARN for now.
> >
> > Reviewed-by: Daniel Axtens <dja@axtens.net>
> > Signed-off-by: Russell Currey <ruscur@russell.cc>
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > [jpn: - Allow set memory functions to be used without Strict RWX
> >        - Hash: Disallow certain regions
> >        - Have change_page_attr() take function pointers to manipulate p=
tes
>
> Did you look at the resulting generated code ? I find it awful.
>
> pte manipulation helpers are meant to be inlined. Here you force the comp=
iler to outline them. This
> also means that the input and output goes through memory.
>
> And now set_memory_xx are not tiny inlined functions anymore.
>
> What is the reason you abandonned the way it was done up to now, through =
the use of an 'action'
> value ? With the previous approach the generated code was a lot lighter.
When I was looking at the patch again, it started to look to me like
the action values were an unneeded abstraction. But yeah doing it like
this makes the generated code much worse. I'll change back in the next
version.
>
> >        - Radix: Add ptesync after set_pte_at()]
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v10: WARN if trying to change the hash linear map
> > v11: - Update copywrite dates
> >       - Allow set memory functions to be used without Strict RWX
> >       - Hash: Disallow certain regions and add comment explaining why
> >       - Have change_page_attr() take function pointers to manipulate pt=
es
> >       - Clarify change_page_attr()'s comment
> >       - Radix: Add ptesync after set_pte_at()
> > ---
> >   arch/powerpc/Kconfig                  |   1 +
> >   arch/powerpc/include/asm/set_memory.h |  10 +++
> >   arch/powerpc/mm/Makefile              |   2 +-
> >   arch/powerpc/mm/pageattr.c            | 105 +++++++++++++++++++++++++=
+
> >   4 files changed, 117 insertions(+), 1 deletion(-)
> >   create mode 100644 arch/powerpc/include/asm/set_memory.h
> >   create mode 100644 arch/powerpc/mm/pageattr.c
> >
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index cb2d44ee4e38..94c34932a74b 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -138,6 +138,7 @@ config PPC
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
> > index 000000000000..d1cd69b1a43a
> > --- /dev/null
> > +++ b/arch/powerpc/include/asm/set_memory.h
> > @@ -0,0 +1,10 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_POWERPC_SET_MEMORY_H
> > +#define _ASM_POWERPC_SET_MEMORY_H
> > +
> > +int set_memory_ro(unsigned long addr, int numpages);
> > +int set_memory_rw(unsigned long addr, int numpages);
> > +int set_memory_nx(unsigned long addr, int numpages);
> > +int set_memory_x(unsigned long addr, int numpages);
> > +
> > +#endif
> > diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
> > index c3df3a8501d4..9142cf1fb0d5 100644
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
> >                                  init-common.o mmu_context.o drmem.o \
> > diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> > new file mode 100644
> > index 000000000000..3b4aa72e555e
> > --- /dev/null
> > +++ b/arch/powerpc/mm/pageattr.c
> > @@ -0,0 +1,105 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +/*
> > + * MMU-generic set_memory implementation for powerpc
> > + *
> > + * Copyright 2019-2021, IBM Corporation.
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
> > + * Invalidating the pte means there are situations where this will not=
 work
> > + * when in theory it should.
> > + * For example:
> > + * - removing write from page whilst it is being executed
> > + * - setting a page read-only whilst it is being read by another CPU
> > + *
> > + */
> > +static int change_page_attr(pte_t *ptep, unsigned long addr, void *dat=
a)
> > +{
> > +     pte_t (*fn)(pte_t) =3D data;
> > +     pte_t pte;
> > +
> > +     spin_lock(&init_mm.page_table_lock);
> > +
> > +     /* invalidate the PTE so it's safe to modify */
> > +     pte =3D ptep_get_and_clear(&init_mm, addr, ptep);
> > +     flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> > +
> > +     /* modify the PTE bits as desired, then apply */
> > +     pte =3D fn(pte);
> > +
> > +     set_pte_at(&init_mm, addr, ptep, pte);
> > +
> > +     /* See ptesync comment in radix__set_pte_at() */
> > +     if (radix_enabled())
> > +             asm volatile("ptesync": : :"memory");
> > +     spin_unlock(&init_mm.page_table_lock);
> > +
> > +     return 0;
> > +}
> > +
> > +static int change_memory_attr(unsigned long addr, int numpages, pte_t =
(*fn)(pte_t))
> > +{
> > +     unsigned long start =3D ALIGN_DOWN(addr, PAGE_SIZE);
> > +     unsigned long size =3D numpages * PAGE_SIZE;
> > +
> > +     if (!numpages)
> > +             return 0;
> > +
> > +#ifdef CONFIG_PPC_BOOK3S_64
> > +     /*
> > +      * On hash, the linear mapping is not in the Linux page table so
> > +      * apply_to_existing_page_range() will have no effect. If in the =
future
> > +      * the set_memory_* functions are used on the linear map this wil=
l need
> > +      * to be updated.
> > +      */
> > +     if (!radix_enabled()) {
> > +             int region =3D get_region_id(addr);
> > +
> > +             if (WARN_ON_ONCE(region !=3D VMALLOC_REGION_ID && region =
!=3D IO_REGION_ID))
> > +                     return -EINVAL;
> > +     }
> > +#endif
> > +
> > +     return apply_to_existing_page_range(&init_mm, start, size,
> > +                                         change_page_attr, fn);
> > +}
> > +
> > +int set_memory_ro(unsigned long addr, int numpages)
> > +{
> > +     return change_memory_attr(addr, numpages, pte_wrprotect);
> > +}
> > +
> > +static pte_t pte_mkdirtywrite(pte_t pte)
> > +{
> > +     return pte_mkwrite(pte_mkdirty(pte));
> > +}
> > +
> > +int set_memory_rw(unsigned long addr, int numpages)
> > +{
> > +     return change_memory_attr(addr, numpages, pte_mkdirtywrite);
> > +}
> > +
> > +int set_memory_nx(unsigned long addr, int numpages)
> > +{
> > +     return change_memory_attr(addr, numpages, pte_exprotect);
> > +}
> > +
> > +int set_memory_x(unsigned long addr, int numpages)
> > +{
> > +     return change_memory_attr(addr, numpages, pte_mkexec);
> > +}
> >
