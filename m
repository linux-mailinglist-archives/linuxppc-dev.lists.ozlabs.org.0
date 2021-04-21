Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4253664AA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 07:03:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQ7kN0R42z30CX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 15:03:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=BVHd6bZp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2f;
 helo=mail-yb1-xb2f.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BVHd6bZp; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQ7jw0cS0z2xYb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 15:03:29 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id i4so8184933ybe.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 22:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WsnpduOQb2wTRgLnYXhzkomr9dZvV+zTzYSBzH9Lq+I=;
 b=BVHd6bZpxX5gB7jdHbPcVlg4JvFaEPvXMd5KcHavOZI0YanGWPtC/ov9BMyeqTS57i
 ZXtTEMbbVpwL3cLUpHPvuTCD9Yvkd5UBRQ5VBPmTA3uXJUD6hoSkauWdqViORqqt5TbY
 EORa6Bx2b2KWiKkhWmC4efoXXRAVXH46V9N2/sY4c+6NOidZAMs8qDL+Kk4wluKOduBR
 MIRe7jhZTwJ6Xh7EtGY3k30CfNSH2Dm/FIr8PVThZxNlrTu/j9Z1nTqeqQbUhK/HTuEY
 DeAnGLa8TA2lhM5XHBppWUZfCf2SjkuOvXtrtOgm25TFZ28m86hBkLTY83lSAjx/LrUq
 /hUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WsnpduOQb2wTRgLnYXhzkomr9dZvV+zTzYSBzH9Lq+I=;
 b=ddJupE/YgTiEBW3E1gnBY8/sOT6IFRd5nAMbEH/GPMqgwEIU7bcMj/hPWPYQCEkPBy
 6StbPVtmIKQHEtkieCkC8hMFDKBwKb5IVpTMVSm7fkkRCMqHD9FwRBOQ9cv1SOP84zjP
 WyDE5neLqRM6mXcOjael98+UIrfcHKyMOvRttzDy/xcXWMJqt2z2K6CDSRd9Yxpbxyfc
 27LhblwunU+QspQnhgIpKnH5msS/BcfIjKGzsAo+gat8oy/6EAAm0IN3iuSkHLWbhiFw
 7KPWI/1zp/VTV1wgNQEfPj9yUohlOv0Uu6nelJ/h6HrSArLtu1unfh/xwWHwXm+jX655
 ARCw==
X-Gm-Message-State: AOAM531qeL4zI0ilkuHpZkG4NSj7Rup4fCcqe3JhTpLFbypKdcldpGzJ
 VqLrJyZSdKOVi4yVmzgsYTnf4zpTZ4yP6mkfJdQ=
X-Google-Smtp-Source: ABdhPJytwwEf3ivaxmqVi4V2ptgZwaDnKqmpoKXE0tgJSQ4zA1NGl7lR/AnJQDdefdYDQpwB4IbNb2h45SY6iraIo4E=
X-Received: by 2002:a25:5146:: with SMTP id f67mr29058792ybb.332.1618981404066; 
 Tue, 20 Apr 2021 22:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210330045132.722243-1-jniethe5@gmail.com>
 <20210330045132.722243-2-jniethe5@gmail.com>
 <87lfa37euw.fsf@mpe.ellerman.id.au>
In-Reply-To: <87lfa37euw.fsf@mpe.ellerman.id.au>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 21 Apr 2021 15:03:11 +1000
Message-ID: <CACzsE9oZ1fdQF3zmAKy78FsUMime+ZmyqpZpBe6p9Vhx3VvpHw@mail.gmail.com>
Subject: Re: [PATCH v10 01/10] powerpc/mm: Implement set_memory() routines
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: ajd@linux.ibm.com, cmr@codefail.de, Nicholas Piggin <npiggin@gmail.com>,
 naveen.n.rao@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 31, 2021 at 10:16 PM Michael Ellerman <mpe@ellerman.id.au> wrot=
e:
>
> Hi Jordan,
>
> A few nits below ...
>
> Jordan Niethe <jniethe5@gmail.com> writes:
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
> >       select ARCH_HAS_SCALED_CPUTIME          if VIRT_CPU_ACCOUNTING_NA=
TIVE && PPC_BOOK3S_64
> > +     select ARCH_HAS_SET_MEMORY
>
> Below you do:
>
>         if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
>                 return 0;
>
> Which suggests we should instead just only select ARCH_HAS_SET_MEMORY if
> STRICT_KERNEL_RWX ?
Yeah, I'm just going to do that.
>
>
> > diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
> > index 3b4e9e4e25ea..d8a08abde1ae 100644
> > --- a/arch/powerpc/mm/Makefile
> > +++ b/arch/powerpc/mm/Makefile
> > @@ -5,7 +5,7 @@
> >
> >  ccflags-$(CONFIG_PPC64)      :=3D $(NO_MINIMAL_TOC)
> >
> > -obj-y                                :=3D fault.o mem.o pgtable.o mmap=
.o maccess.o \
> > +obj-y                                :=3D fault.o mem.o pgtable.o mmap=
.o maccess.o pageattr.o \
>
> .. and then the file should only be built if ARCH_HAS_SET_MEMORY =3D y.
>
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
>
> Should be 2019-2021.
Right.
>
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
>
> Is the 2nd part of that statement true?
>
> Or, I guess maybe it is true depending on what "unsafe" means.
>
> AIUI it's unsafe to use this on the page you're executing from, and by
> unsafe we mean the kernel will potentially crash because it will lose
> the mapping for the currently executing text.
>
> Using this on a page that another CPU is accessing could be safe, if eg.
> the other CPU is reading from the page and we are just changing it from
> RW->RO.
>
> So I'm not sure they're the same type of "unsafe".

I think the comment was prompted by your message here:
https://lore.kernel.org/linuxppc-dev/87pnio5fva.fsf@mpe.ellerman.id.au/

So I'll rewrite the comment to separate the two cases and indicate the
2nd case only might be an issue.
>
> > + * TODO make the implementation resistant to this.
> > + *
> > + * NOTE: can be dangerous to call without STRICT_KERNEL_RWX
>
> I don't think we need that anymore?
No we don't, change_memory_attr() won't call it without STRICT_KERNEL_RWX.
>
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
>
> So set_memory_ro() removes write, but doesn't remove execute.
>
> That doesn't match my mental model of what "set to ro" means, but I
> guess I'm wrong because the other implementations seem to do something
> similar.
Hm, looking at arm and riscv it does seem to make it just RO.
>
>
> > +     case SET_MEMORY_RW:
> > +             pte =3D pte_mkwrite(pte);
>
> I think we want to add pte_mkdirty() here also to avoid a fault when the
> mapping is written to.
Right.
>
> eg. pmd_mkwrite(pmd_mkdirty(pte));
>
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
> > +
> > +     if (numpages <=3D 0)
> > +             return 0;
> > +
>
> This =E2=86=93 should have a comment explaining what it's doing:
Sure.
>
> > +#ifdef CONFIG_PPC_BOOK3S_64
> > +     if (WARN_ON_ONCE(!radix_enabled() &&
> > +                  get_region_id(addr) =3D=3D LINEAR_MAP_REGION_ID)) {
> > +             return -1;
> > +     }
> > +#endif
>
> Maybe:
As Chrisophe says, we can't do that because those symbols aren't
defined for !CONFIG_PPC_BOOK3S_64.
>
>         if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
>             WARN_ON_ONCE(!radix_enabled() && get_region_id(addr) =3D=3D L=
INEAR_MAP_REGION_ID)) {
>                 return -1;
>         }
>
> But then Aneesh pointed out that we should also block VMEMMAP_REGION_ID.
>
> It might be better to just check for the permitted regions.
That would probably work better.
>
>         if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !radix_enabled()) {
>                 int region =3D get_region_id(addr);
>
>                 if (WARN_ON_ONCE(region !=3D VMALLOC_REGION_ID && region =
!=3D IO_REGION_ID))
>                         return -1;
>         }
>
> > +
> > +     return apply_to_existing_page_range(&init_mm, start, sz,
> > +                                         change_page_attr, (void *)act=
ion);
> > +}
>
>
> cheers
