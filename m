Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2AB219AA3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 10:17:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2TYx4jhlzDqx5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 18:17:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=zong.li@sifive.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256
 header.s=google header.b=lD6xOkKM; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2TX706YgzDqmb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 18:15:58 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id h1so1082247otq.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 01:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GEJ8rqV6GQFdTSzDlFRo4pE94WMbcu0xJmZJAt1ex1M=;
 b=lD6xOkKMe9G0GfpsLz2cLSbqXBs9bq8GIXoKWKftDXZgwc1pvqZVwhgqfkSnaSC1lR
 CoLeAlxm886lAguh1kz/upQIk0YvsG9ETFTsEr0k3FvPNf5GkWmS/V+cGGMN9Pz2i2zo
 SN/E0Je0xEzfk/93XdPoV4BSTf0OXxCC8MrUnSafIrRC2TBiuLE/TK8oqJy6vv0/R2a9
 e7LcoZBTXpksXX2Or51uXH6xIFvtiRto4D5yleRx25v1rwMUC0U1Q9bTB4yRylNW40gV
 MICe2GZFr3r4UpZ2FAXQIM01h13wU/3O3PzT1YX6Ch4PZR6SGvl5dNxzLEUuFVuQKYoM
 ENdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GEJ8rqV6GQFdTSzDlFRo4pE94WMbcu0xJmZJAt1ex1M=;
 b=SGnuK32u9LAswY57CbnN2FXj8mpQcHMVKo0bRZvOlK7tDY8ATHzwi+f6R6+KWpnp0/
 9ZiP/JzyjkOv68zyQwgIiR/2OuNsFTYMuJiiuwNICAdCVJT/fwkT154sWKElxYGONDwp
 thKkgoZ7uhzhviw/xCSQH8RCQaW+7C73jEJaTaE3sd/EJbiqjfaiL3usPq5AuatOx8hw
 ymyB4fg1GvQynh59APZf9JyBCFfyp6qOVhniYMsHS/F2uk0cmz79Z9Hsq8V6/03Zsv+A
 BDmRYSSetbsaifczwi7O4bhigTs8/E84VC1ffLvsT8zFbJ7TOisuijMkPniQpm07Pr9K
 YDWQ==
X-Gm-Message-State: AOAM531ehYDNbs1pNTJSSSTWY4iGVa5Cfw9JgYFyK7u//ququ9jyjSUk
 2eY++yEy/1wHypFwx1BPph9NHWS+qZJpEoxvtKeXFg==
X-Google-Smtp-Source: ABdhPJxmCNZUaTjgzmZ5xWGHS8o1AFoWeykNt+BNXFS5KLlDoQlOB8qbCfJyFLm85hYSbHgN7GbfoOkE1nuHMZXxuvI=
X-Received: by 2002:a05:6830:130f:: with SMTP id
 p15mr32976507otq.33.1594282554505; 
 Thu, 09 Jul 2020 01:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200607075949.665-2-alex@ghiti.fr>
 <mhng-831c4073-aefa-4aa0-a583-6a17f9aff9b7@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-831c4073-aefa-4aa0-a583-6a17f9aff9b7@palmerdabbelt-glaptop1>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 9 Jul 2020 16:15:43 +0800
Message-ID: <CANXhq0pk39usrqUHMQesn3-9G6RZAGAPbx6vPRhMQkG=iBB7Lg@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
To: Palmer Dabbelt <palmer@dabbelt.com>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 9, 2020 at 1:05 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Sun, 07 Jun 2020 00:59:46 PDT (-0700), alex@ghiti.fr wrote:
> > This is a preparatory patch for relocatable kernel.
> >
> > The kernel used to be linked at PAGE_OFFSET address and used to be loaded
> > physically at the beginning of the main memory. Therefore, we could use
> > the linear mapping for the kernel mapping.
> >
> > But the relocated kernel base address will be different from PAGE_OFFSET
> > and since in the linear mapping, two different virtual addresses cannot
> > point to the same physical address, the kernel mapping needs to lie outside
> > the linear mapping.
>
> I know it's been a while, but I keep opening this up to review it and just
> can't get over how ugly it is to put the kernel's linear map in the vmalloc
> region.
>
> I guess I don't understand why this is necessary at all.  Specifically: why
> can't we just relocate the kernel within the linear map?  That would let the
> bootloader put the kernel wherever it wants, modulo the physical memory size we
> support.  We'd need to handle the regions that are coupled to the kernel's
> execution address, but we could just put them in an explicit memory region
> which is what we should probably be doing anyway.

The original implementation of relocation doesn't move the kernel's linear map
to the vmalloc region, and I also give the KASLR RFC patch [1] based on that.
In original, we relocate the kernel in the linear map region, we would
calculate a
random value first as the offset, then we move the kernel image to the
new target
address which is obtained by adding this offset to it's VA and PA.
It's enough for
randomizing the kernel, but it seems to me if we want to decouple the kernel's
linear mapping, the physical mapping of RAM and virtual mapping of RAM,
it might be good to move the kernel's mapping out from the linear region.
Even so, it is still an intrusive change. As far as I know, only arm64
does something
like that.

[1]  https://patchwork.kernel.org/project/linux-riscv/list/?series=260615



>
> > In addition, because modules and BPF must be close to the kernel (inside
> > +-2GB window), the kernel is placed at the end of the vmalloc zone minus
> > 2GB, which leaves room for modules and BPF. The kernel could not be
> > placed at the beginning of the vmalloc zone since other vmalloc
> > allocations from the kernel could get all the +-2GB window around the
> > kernel which would prevent new modules and BPF programs to be loaded.
>
> Well, that's not enough to make sure this doesn't happen -- it's just enough to
> make sure it doesn't happen very quickily.  That's the same boat we're already
> in, though, so it's not like it's worse.
>
> > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> > Reviewed-by: Zong Li <zong.li@sifive.com>
> > ---
> >  arch/riscv/boot/loader.lds.S     |  3 +-
> >  arch/riscv/include/asm/page.h    | 10 +++++-
> >  arch/riscv/include/asm/pgtable.h | 38 ++++++++++++++-------
> >  arch/riscv/kernel/head.S         |  3 +-
> >  arch/riscv/kernel/module.c       |  4 +--
> >  arch/riscv/kernel/vmlinux.lds.S  |  3 +-
> >  arch/riscv/mm/init.c             | 58 +++++++++++++++++++++++++-------
> >  arch/riscv/mm/physaddr.c         |  2 +-
> >  8 files changed, 88 insertions(+), 33 deletions(-)
> >
> > diff --git a/arch/riscv/boot/loader.lds.S b/arch/riscv/boot/loader.lds.S
> > index 47a5003c2e28..62d94696a19c 100644
> > --- a/arch/riscv/boot/loader.lds.S
> > +++ b/arch/riscv/boot/loader.lds.S
> > @@ -1,13 +1,14 @@
> >  /* SPDX-License-Identifier: GPL-2.0 */
> >
> >  #include <asm/page.h>
> > +#include <asm/pgtable.h>
> >
> >  OUTPUT_ARCH(riscv)
> >  ENTRY(_start)
> >
> >  SECTIONS
> >  {
> > -     . = PAGE_OFFSET;
> > +     . = KERNEL_LINK_ADDR;
> >
> >       .payload : {
> >               *(.payload)
> > diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> > index 2d50f76efe48..48bb09b6a9b7 100644
> > --- a/arch/riscv/include/asm/page.h
> > +++ b/arch/riscv/include/asm/page.h
> > @@ -90,18 +90,26 @@ typedef struct page *pgtable_t;
> >
> >  #ifdef CONFIG_MMU
> >  extern unsigned long va_pa_offset;
> > +extern unsigned long va_kernel_pa_offset;
> >  extern unsigned long pfn_base;
> >  #define ARCH_PFN_OFFSET              (pfn_base)
> >  #else
> >  #define va_pa_offset         0
> > +#define va_kernel_pa_offset  0
> >  #define ARCH_PFN_OFFSET              (PAGE_OFFSET >> PAGE_SHIFT)
> >  #endif /* CONFIG_MMU */
> >
> >  extern unsigned long max_low_pfn;
> >  extern unsigned long min_low_pfn;
> > +extern unsigned long kernel_virt_addr;
> >
> >  #define __pa_to_va_nodebug(x)        ((void *)((unsigned long) (x) + va_pa_offset))
> > -#define __va_to_pa_nodebug(x)        ((unsigned long)(x) - va_pa_offset)
> > +#define linear_mapping_va_to_pa(x)   ((unsigned long)(x) - va_pa_offset)
> > +#define kernel_mapping_va_to_pa(x)   \
> > +     ((unsigned long)(x) - va_kernel_pa_offset)
> > +#define __va_to_pa_nodebug(x)                \
> > +     (((x) >= PAGE_OFFSET) ?         \
> > +             linear_mapping_va_to_pa(x) : kernel_mapping_va_to_pa(x))
> >
> >  #ifdef CONFIG_DEBUG_VIRTUAL
> >  extern phys_addr_t __virt_to_phys(unsigned long x);
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index 35b60035b6b0..94ef3b49dfb6 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -11,23 +11,29 @@
> >
> >  #include <asm/pgtable-bits.h>
> >
> > -#ifndef __ASSEMBLY__
> > -
> > -/* Page Upper Directory not used in RISC-V */
> > -#include <asm-generic/pgtable-nopud.h>
> > -#include <asm/page.h>
> > -#include <asm/tlbflush.h>
> > -#include <linux/mm_types.h>
> > -
> > -#ifdef CONFIG_MMU
> > +#ifndef CONFIG_MMU
> > +#define KERNEL_VIRT_ADDR     PAGE_OFFSET
> > +#define KERNEL_LINK_ADDR     PAGE_OFFSET
> > +#else
> > +/*
> > + * Leave 2GB for modules and BPF that must lie within a 2GB range around
> > + * the kernel.
> > + */
> > +#define KERNEL_VIRT_ADDR     (VMALLOC_END - SZ_2G + 1)
> > +#define KERNEL_LINK_ADDR     KERNEL_VIRT_ADDR
>
> At a bare minimum this is going to make a mess of the 32-bit port, as
> non-relocatable kernels are now going to get linked at 1GiB which is where user
> code is supposed to live.  That's an easy fix, though, as the 32-bit stuff
> doesn't need any module address restrictions.
>
> >  #define VMALLOC_SIZE     (KERN_VIRT_SIZE >> 1)
> >  #define VMALLOC_END      (PAGE_OFFSET - 1)
> >  #define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
> >
> >  #define BPF_JIT_REGION_SIZE  (SZ_128M)
> > -#define BPF_JIT_REGION_START (PAGE_OFFSET - BPF_JIT_REGION_SIZE)
> > -#define BPF_JIT_REGION_END   (VMALLOC_END)
> > +#define BPF_JIT_REGION_START PFN_ALIGN((unsigned long)&_end)
> > +#define BPF_JIT_REGION_END   (BPF_JIT_REGION_START + BPF_JIT_REGION_SIZE)
> > +
> > +#ifdef CONFIG_64BIT
> > +#define VMALLOC_MODULE_START BPF_JIT_REGION_END
> > +#define VMALLOC_MODULE_END   (((unsigned long)&_start & PAGE_MASK) + SZ_2G)
> > +#endif
> >
> >  /*
> >   * Roughly size the vmemmap space to be large enough to fit enough
> > @@ -57,9 +63,16 @@
> >  #define FIXADDR_SIZE     PGDIR_SIZE
> >  #endif
> >  #define FIXADDR_START    (FIXADDR_TOP - FIXADDR_SIZE)
> > -
> >  #endif
> >
> > +#ifndef __ASSEMBLY__
> > +
> > +/* Page Upper Directory not used in RISC-V */
> > +#include <asm-generic/pgtable-nopud.h>
> > +#include <asm/page.h>
> > +#include <asm/tlbflush.h>
> > +#include <linux/mm_types.h>
> > +
> >  #ifdef CONFIG_64BIT
> >  #include <asm/pgtable-64.h>
> >  #else
> > @@ -483,6 +496,7 @@ static inline void __kernel_map_pages(struct page *page, int numpages, int enabl
> >
> >  #define kern_addr_valid(addr)   (1) /* FIXME */
> >
> > +extern char _start[];
> >  extern void *dtb_early_va;
> >  void setup_bootmem(void);
> >  void paging_init(void);
> > diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> > index 98a406474e7d..8f5bb7731327 100644
> > --- a/arch/riscv/kernel/head.S
> > +++ b/arch/riscv/kernel/head.S
> > @@ -49,7 +49,8 @@ ENTRY(_start)
> >  #ifdef CONFIG_MMU
> >  relocate:
> >       /* Relocate return address */
> > -     li a1, PAGE_OFFSET
> > +     la a1, kernel_virt_addr
> > +     REG_L a1, 0(a1)
> >       la a2, _start
> >       sub a1, a1, a2
> >       add ra, ra, a1
> > diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> > index 8bbe5dbe1341..1a8fbe05accf 100644
> > --- a/arch/riscv/kernel/module.c
> > +++ b/arch/riscv/kernel/module.c
> > @@ -392,12 +392,10 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
> >  }
> >
> >  #if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
> > -#define VMALLOC_MODULE_START \
> > -      max(PFN_ALIGN((unsigned long)&_end - SZ_2G), VMALLOC_START)
> >  void *module_alloc(unsigned long size)
> >  {
> >       return __vmalloc_node_range(size, 1, VMALLOC_MODULE_START,
> > -                                 VMALLOC_END, GFP_KERNEL,
> > +                                 VMALLOC_MODULE_END, GFP_KERNEL,
> >                                   PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
> >                                   __builtin_return_address(0));
> >  }
> > diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> > index 0339b6bbe11a..a9abde62909f 100644
> > --- a/arch/riscv/kernel/vmlinux.lds.S
> > +++ b/arch/riscv/kernel/vmlinux.lds.S
> > @@ -4,7 +4,8 @@
> >   * Copyright (C) 2017 SiFive
> >   */
> >
> > -#define LOAD_OFFSET PAGE_OFFSET
> > +#include <asm/pgtable.h>
> > +#define LOAD_OFFSET KERNEL_LINK_ADDR
> >  #include <asm/vmlinux.lds.h>
> >  #include <asm/page.h>
> >  #include <asm/cache.h>
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 736de6c8739f..71da78914645 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -22,6 +22,9 @@
> >
> >  #include "../kernel/head.h"
> >
> > +unsigned long kernel_virt_addr = KERNEL_VIRT_ADDR;
> > +EXPORT_SYMBOL(kernel_virt_addr);
> > +
> >  unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
> >                                                       __page_aligned_bss;
> >  EXPORT_SYMBOL(empty_zero_page);
> > @@ -178,8 +181,12 @@ void __init setup_bootmem(void)
> >  }
> >
> >  #ifdef CONFIG_MMU
> > +/* Offset between linear mapping virtual address and kernel load address */
> >  unsigned long va_pa_offset;
> >  EXPORT_SYMBOL(va_pa_offset);
> > +/* Offset between kernel mapping virtual address and kernel load address */
> > +unsigned long va_kernel_pa_offset;
> > +EXPORT_SYMBOL(va_kernel_pa_offset);
> >  unsigned long pfn_base;
> >  EXPORT_SYMBOL(pfn_base);
> >
> > @@ -271,7 +278,7 @@ static phys_addr_t __init alloc_pmd(uintptr_t va)
> >       if (mmu_enabled)
> >               return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
> >
> > -     pmd_num = (va - PAGE_OFFSET) >> PGDIR_SHIFT;
> > +     pmd_num = (va - kernel_virt_addr) >> PGDIR_SHIFT;
> >       BUG_ON(pmd_num >= NUM_EARLY_PMDS);
> >       return (uintptr_t)&early_pmd[pmd_num * PTRS_PER_PMD];
> >  }
> > @@ -372,14 +379,30 @@ static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
> >  #error "setup_vm() is called from head.S before relocate so it should not use absolute addressing."
> >  #endif
> >
> > +static uintptr_t load_pa, load_sz;
> > +
> > +static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
> > +{
> > +     uintptr_t va, end_va;
> > +
> > +     end_va = kernel_virt_addr + load_sz;
> > +     for (va = kernel_virt_addr; va < end_va; va += map_size)
> > +             create_pgd_mapping(pgdir, va,
> > +                                load_pa + (va - kernel_virt_addr),
> > +                                map_size, PAGE_KERNEL_EXEC);
> > +}
> > +
> >  asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> >  {
> >       uintptr_t va, end_va;
> > -     uintptr_t load_pa = (uintptr_t)(&_start);
> > -     uintptr_t load_sz = (uintptr_t)(&_end) - load_pa;
> >       uintptr_t map_size = best_map_size(load_pa, MAX_EARLY_MAPPING_SIZE);
> >
> > +     load_pa = (uintptr_t)(&_start);
> > +     load_sz = (uintptr_t)(&_end) - load_pa;
> > +
> >       va_pa_offset = PAGE_OFFSET - load_pa;
> > +     va_kernel_pa_offset = kernel_virt_addr - load_pa;
> > +
> >       pfn_base = PFN_DOWN(load_pa);
> >
> >       /*
> > @@ -402,26 +425,22 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> >       create_pmd_mapping(fixmap_pmd, FIXADDR_START,
> >                          (uintptr_t)fixmap_pte, PMD_SIZE, PAGE_TABLE);
> >       /* Setup trampoline PGD and PMD */
> > -     create_pgd_mapping(trampoline_pg_dir, PAGE_OFFSET,
> > +     create_pgd_mapping(trampoline_pg_dir, kernel_virt_addr,
> >                          (uintptr_t)trampoline_pmd, PGDIR_SIZE, PAGE_TABLE);
> > -     create_pmd_mapping(trampoline_pmd, PAGE_OFFSET,
> > +     create_pmd_mapping(trampoline_pmd, kernel_virt_addr,
> >                          load_pa, PMD_SIZE, PAGE_KERNEL_EXEC);
> >  #else
> >       /* Setup trampoline PGD */
> > -     create_pgd_mapping(trampoline_pg_dir, PAGE_OFFSET,
> > +     create_pgd_mapping(trampoline_pg_dir, kernel_virt_addr,
> >                          load_pa, PGDIR_SIZE, PAGE_KERNEL_EXEC);
> >  #endif
> >
> >       /*
> > -      * Setup early PGD covering entire kernel which will allows
> > +      * Setup early PGD covering entire kernel which will allow
> >        * us to reach paging_init(). We map all memory banks later
> >        * in setup_vm_final() below.
> >        */
> > -     end_va = PAGE_OFFSET + load_sz;
> > -     for (va = PAGE_OFFSET; va < end_va; va += map_size)
> > -             create_pgd_mapping(early_pg_dir, va,
> > -                                load_pa + (va - PAGE_OFFSET),
> > -                                map_size, PAGE_KERNEL_EXEC);
> > +     create_kernel_page_table(early_pg_dir, map_size);
> >
> >       /* Create fixed mapping for early FDT parsing */
> >       end_va = __fix_to_virt(FIX_FDT) + FIX_FDT_SIZE;
> > @@ -441,6 +460,7 @@ static void __init setup_vm_final(void)
> >       uintptr_t va, map_size;
> >       phys_addr_t pa, start, end;
> >       struct memblock_region *reg;
> > +     static struct vm_struct vm_kernel = { 0 };
> >
> >       /* Set mmu_enabled flag */
> >       mmu_enabled = true;
> > @@ -467,10 +487,22 @@ static void __init setup_vm_final(void)
> >               for (pa = start; pa < end; pa += map_size) {
> >                       va = (uintptr_t)__va(pa);
> >                       create_pgd_mapping(swapper_pg_dir, va, pa,
> > -                                        map_size, PAGE_KERNEL_EXEC);
> > +                                        map_size, PAGE_KERNEL);
> >               }
> >       }
> >
> > +     /* Map the kernel */
> > +     create_kernel_page_table(swapper_pg_dir, PMD_SIZE);
> > +
> > +     /* Reserve the vmalloc area occupied by the kernel */
> > +     vm_kernel.addr = (void *)kernel_virt_addr;
> > +     vm_kernel.phys_addr = load_pa;
> > +     vm_kernel.size = (load_sz + PMD_SIZE - 1) & ~(PMD_SIZE - 1);
> > +     vm_kernel.flags = VM_MAP | VM_NO_GUARD;
> > +     vm_kernel.caller = __builtin_return_address(0);
> > +
> > +     vm_area_add_early(&vm_kernel);
> > +
> >       /* Clear fixmap PTE and PMD mappings */
> >       clear_fixmap(FIX_PTE);
> >       clear_fixmap(FIX_PMD);
> > diff --git a/arch/riscv/mm/physaddr.c b/arch/riscv/mm/physaddr.c
> > index e8e4dcd39fed..35703d5ef5fd 100644
> > --- a/arch/riscv/mm/physaddr.c
> > +++ b/arch/riscv/mm/physaddr.c
> > @@ -23,7 +23,7 @@ EXPORT_SYMBOL(__virt_to_phys);
> >
> >  phys_addr_t __phys_addr_symbol(unsigned long x)
> >  {
> > -     unsigned long kernel_start = (unsigned long)PAGE_OFFSET;
> > +     unsigned long kernel_start = (unsigned long)kernel_virt_addr;
> >       unsigned long kernel_end = (unsigned long)_end;
> >
> >       /*
