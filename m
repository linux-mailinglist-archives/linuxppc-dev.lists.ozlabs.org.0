Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE961E38CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 08:07:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49X0jc2ZxHzDqSG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 16:07:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=zong.li@sifive.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256
 header.s=google header.b=cNSjZH/u; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49X0gm4GhGzDqQt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 16:05:54 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id o13so18338121otl.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 23:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/0yPaXUMvGeEuOZvv3Vg8K9ivpEmWs7M17Z9CsO0EAk=;
 b=cNSjZH/uz0PD0RBnQoFstwhhxvQZHAmKZgeQf4CiQyVPQ8/eCWn+8dOq6gZdbkKtDX
 hlYqmeBP94LpVKhnVVzsrw707SX3DqRNVg/2oX2756z4GJ+SFrWi3AwF1hcaA7G/dFTN
 /VzlfNWKKbXnWsDpvrtzHxws5JsNba0JWzfRc6SMm90tKxkWGYWT9SZOZHhKQKO7r72x
 HJVKasoj5FyhO//ViNQDh9tXOXTwL5/3266moA2ZZEoRiaD28tSJymN4sHAq52fAUa0v
 tIYcqho0HZBYbePdaKv7dg7h/y0EgjRwS29UWsMLorN+F4LEOLtwpGNre4aSg9BtXmoC
 Hgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/0yPaXUMvGeEuOZvv3Vg8K9ivpEmWs7M17Z9CsO0EAk=;
 b=R3KDbFSP0qr3Sv6SIPB+b8ehT+GdmA327ehbx4Ighn82u1CL/8sgTFanLMl25utZtG
 UFnsaDtWs39bhD0zquMofS6Aoqtk8KEoXICZIl+rPGYkkdAR9DoZD22o/BbKRhJ56ctP
 6QMWoHruoqbvxOmv4MvrpqotZ49MfNts9WtPze4Iy5//rz95ABYQuJToywa1U4+5E14g
 qhAvy1a8C+n4vZoIRQ4ONm9zeuZMyOHvNNxNMUkZQpFwTJXnsQ57c7+NtMB0eW15B5Yt
 IUdTIN0YF2loJYP69EhQkFeZUlF2Wyyyi3/wiyy7reZkYFPPe/xXmpRCbMaDHK4mYVZe
 8g8g==
X-Gm-Message-State: AOAM530ur7l2qkH96CCzi6sPTjaRdHzfB7p/vicCYX58zGW5GWJ4IsS1
 VCUPLdxhNlQFohJeiX9W8RgTZal+Rnfa1DxuIIMGgg==
X-Google-Smtp-Source: ABdhPJyxI/DzFb6WuyefOxguPHF4+Gjuf2siy++I/r4Hwv3TI19bjxar4tmWPm5VU04O4hzdXsQ8F4+oE3vcwdxEt3I=
X-Received: by 2002:a9d:6ac9:: with SMTP id m9mr3506634otq.33.1590559551221;
 Tue, 26 May 2020 23:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200524085259.24784-1-alex@ghiti.fr>
 <20200524085259.24784-2-alex@ghiti.fr>
 <CANXhq0q_ba+zQrGUN0L+FQMPz6hWbYSQa2c8wLO3M-JTPWginA@mail.gmail.com>
 <6d6b09bc-32e4-4969-7020-12f9f02e557e@ghiti.fr>
In-Reply-To: <6d6b09bc-32e4-4969-7020-12f9f02e557e@ghiti.fr>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 27 May 2020 14:05:40 +0800
Message-ID: <CANXhq0qBOjFNvRB4QL-AoWzr5dU6Pz=tbf2qJMQxJjR99NHU3A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] riscv: Move kernel mapping to vmalloc zone
To: Alex Ghiti <alex@ghiti.fr>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 27, 2020 at 1:06 AM Alex Ghiti <alex@ghiti.fr> wrote:
>
> Hi Zong,
>
> Le 5/26/20 =C3=A0 5:43 AM, Zong Li a =C3=A9crit :
> > On Sun, May 24, 2020 at 4:54 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
> >> This is a preparatory patch for relocatable kernel.
> >>
> >> The kernel used to be linked at PAGE_OFFSET address and used to be loa=
ded
> >> physically at the beginning of the main memory. Therefore, we could us=
e
> >> the linear mapping for the kernel mapping.
> >>
> >> But the relocated kernel base address will be different from PAGE_OFFS=
ET
> >> and since in the linear mapping, two different virtual addresses canno=
t
> >> point to the same physical address, the kernel mapping needs to lie ou=
tside
> >> the linear mapping.
> >>
> >> In addition, because modules and BPF must be close to the kernel (insi=
de
> >> +-2GB window), the kernel is placed at the end of the vmalloc zone min=
us
> >> 2GB, which leaves room for modules and BPF. The kernel could not be
> >> placed at the beginning of the vmalloc zone since other vmalloc
> >> allocations from the kernel could get all the +-2GB window around the
> >> kernel which would prevent new modules and BPF programs to be loaded.
> >>
> >> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> >> ---
> >>   arch/riscv/boot/loader.lds.S     |  3 +-
> >>   arch/riscv/include/asm/page.h    | 10 +++++-
> >>   arch/riscv/include/asm/pgtable.h | 37 +++++++++++++-------
> >>   arch/riscv/kernel/head.S         |  3 +-
> >>   arch/riscv/kernel/module.c       |  4 +--
> >>   arch/riscv/kernel/vmlinux.lds.S  |  3 +-
> >>   arch/riscv/mm/init.c             | 58 +++++++++++++++++++++++++-----=
--
> >>   arch/riscv/mm/physaddr.c         |  2 +-
> >>   8 files changed, 87 insertions(+), 33 deletions(-)
> >>
> >> diff --git a/arch/riscv/boot/loader.lds.S b/arch/riscv/boot/loader.lds=
.S
> >> index 47a5003c2e28..62d94696a19c 100644
> >> --- a/arch/riscv/boot/loader.lds.S
> >> +++ b/arch/riscv/boot/loader.lds.S
> >> @@ -1,13 +1,14 @@
> >>   /* SPDX-License-Identifier: GPL-2.0 */
> >>
> >>   #include <asm/page.h>
> >> +#include <asm/pgtable.h>
> >>
> >>   OUTPUT_ARCH(riscv)
> >>   ENTRY(_start)
> >>
> >>   SECTIONS
> >>   {
> >> -       . =3D PAGE_OFFSET;
> >> +       . =3D KERNEL_LINK_ADDR;
> >>
> >>          .payload : {
> >>                  *(.payload)
> >> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/pa=
ge.h
> >> index 2d50f76efe48..48bb09b6a9b7 100644
> >> --- a/arch/riscv/include/asm/page.h
> >> +++ b/arch/riscv/include/asm/page.h
> >> @@ -90,18 +90,26 @@ typedef struct page *pgtable_t;
> >>
> >>   #ifdef CONFIG_MMU
> >>   extern unsigned long va_pa_offset;
> >> +extern unsigned long va_kernel_pa_offset;
> >>   extern unsigned long pfn_base;
> >>   #define ARCH_PFN_OFFSET                (pfn_base)
> >>   #else
> >>   #define va_pa_offset           0
> >> +#define va_kernel_pa_offset    0
> >>   #define ARCH_PFN_OFFSET                (PAGE_OFFSET >> PAGE_SHIFT)
> >>   #endif /* CONFIG_MMU */
> >>
> >>   extern unsigned long max_low_pfn;
> >>   extern unsigned long min_low_pfn;
> >> +extern unsigned long kernel_virt_addr;
> >>
> >>   #define __pa_to_va_nodebug(x)  ((void *)((unsigned long) (x) + va_pa=
_offset))
> >> -#define __va_to_pa_nodebug(x)  ((unsigned long)(x) - va_pa_offset)
> >> +#define linear_mapping_va_to_pa(x)     ((unsigned long)(x) - va_pa_of=
fset)
> >> +#define kernel_mapping_va_to_pa(x)     \
> >> +       ((unsigned long)(x) - va_kernel_pa_offset)
> >> +#define __va_to_pa_nodebug(x)          \
> >> +       (((x) >=3D PAGE_OFFSET) ?         \
> >> +               linear_mapping_va_to_pa(x) : kernel_mapping_va_to_pa(x=
))
> >>
> >>   #ifdef CONFIG_DEBUG_VIRTUAL
> >>   extern phys_addr_t __virt_to_phys(unsigned long x);
> >> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm=
/pgtable.h
> >> index 35b60035b6b0..25213cfaf680 100644
> >> --- a/arch/riscv/include/asm/pgtable.h
> >> +++ b/arch/riscv/include/asm/pgtable.h
> >> @@ -11,23 +11,29 @@
> >>
> >>   #include <asm/pgtable-bits.h>
> >>
> >> -#ifndef __ASSEMBLY__
> >> -
> >> -/* Page Upper Directory not used in RISC-V */
> >> -#include <asm-generic/pgtable-nopud.h>
> >> -#include <asm/page.h>
> >> -#include <asm/tlbflush.h>
> >> -#include <linux/mm_types.h>
> >> -
> >> -#ifdef CONFIG_MMU
> >> +#ifndef CONFIG_MMU
> >> +#define KERNEL_VIRT_ADDR       PAGE_OFFSET
> >> +#define KERNEL_LINK_ADDR       PAGE_OFFSET
> >> +#else
> >> +/*
> >> + * Leave 2GB for modules and BPF that must lie within a 2GB range aro=
und
> >> + * the kernel.
> >> + */
> >> +#define KERNEL_VIRT_ADDR       (VMALLOC_END - SZ_2G + 1)
> >> +#define KERNEL_LINK_ADDR       KERNEL_VIRT_ADDR
> >>
> >>   #define VMALLOC_SIZE     (KERN_VIRT_SIZE >> 1)
> >>   #define VMALLOC_END      (PAGE_OFFSET - 1)
> >>   #define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
> >>
> >>   #define BPF_JIT_REGION_SIZE    (SZ_128M)
> >> -#define BPF_JIT_REGION_START   (PAGE_OFFSET - BPF_JIT_REGION_SIZE)
> >> -#define BPF_JIT_REGION_END     (VMALLOC_END)
> >> +#define BPF_JIT_REGION_START   (kernel_virt_addr)
> >> +#define BPF_JIT_REGION_END     (kernel_virt_addr + BPF_JIT_REGION_SIZ=
E)
> > It seems to have a potential risk here, the region of bpf is
> > overlapping with kernel mapping, so if kernel size is bigger than
> > 128MB, bpf region would be occupied and run out by kernel mapping.

Is there the risk as I mentioned?

> >
> >> +
> >> +#ifdef CONFIG_64BIT
> >> +#define VMALLOC_MODULE_START   BPF_JIT_REGION_END
> >> +#define VMALLOC_MODULE_END     VMALLOC_END
> >> +#endif
> >>
> > Although kernel_virt_addr is a fixed address now, I think it could be
> > changed for the purpose of relocatable or KASLR, so if
> > kernel_virt_addr is moved to far from VMALLOC_END than 2G, the region
> > of module would be too big.
>
>
> Yes you're right, that's wrong to allow modules to lie outside
> the 2G window, thanks for noticing.
>
>
> > In addition, the region of module could be
> > +-2G around the kernel, so we don't be limited in one direction as
> > before. It seems to me that the region of the module could be decided
> > at runtime, for example, VMALLOC_MODULE_START is "&_end - 2G" and
> > VMLLOC_MODULE_END is "&_start + 2G".
>
>
> I had tried that, but as we need to make sure BPF region is different
> from the module's
> that makes the macro definitions really cumbersome. I'll give a try
> again anyway. And
> I tried to use _end and _start here but it failed, I have to debug this.
>
>
> >   I'm not sure whether the size of
> > region of bpf has to be 128MB for some particular reason, if not,
> > maybe the region of bpf could be the same with module to avoid being
> > run out by module.
>
>
> On the contrary, BPF region must not be the same as module's since in
> that case,
> modules could take all the space and make BPF fail.

ok, I got it. Thanks for the explaining.


>
>
> Thanks for your review Zong,
>
>
> Alex
>
>
> >
> >>   /*
> >>    * Roughly size the vmemmap space to be large enough to fit enough
> >> @@ -57,9 +63,16 @@
> >>   #define FIXADDR_SIZE     PGDIR_SIZE
> >>   #endif
> >>   #define FIXADDR_START    (FIXADDR_TOP - FIXADDR_SIZE)
> >> -
> >>   #endif
> >>
> >> +#ifndef __ASSEMBLY__
> >> +
> >> +/* Page Upper Directory not used in RISC-V */
> >> +#include <asm-generic/pgtable-nopud.h>
> >> +#include <asm/page.h>
> >> +#include <asm/tlbflush.h>
> >> +#include <linux/mm_types.h>
> >> +
> >>   #ifdef CONFIG_64BIT
> >>   #include <asm/pgtable-64.h>
> >>   #else
> >> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> >> index 98a406474e7d..8f5bb7731327 100644
> >> --- a/arch/riscv/kernel/head.S
> >> +++ b/arch/riscv/kernel/head.S
> >> @@ -49,7 +49,8 @@ ENTRY(_start)
> >>   #ifdef CONFIG_MMU
> >>   relocate:
> >>          /* Relocate return address */
> >> -       li a1, PAGE_OFFSET
> >> +       la a1, kernel_virt_addr
> >> +       REG_L a1, 0(a1)
> >>          la a2, _start
> >>          sub a1, a1, a2
> >>          add ra, ra, a1
> >> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> >> index 8bbe5dbe1341..1a8fbe05accf 100644
> >> --- a/arch/riscv/kernel/module.c
> >> +++ b/arch/riscv/kernel/module.c
> >> @@ -392,12 +392,10 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const =
char *strtab,
> >>   }
> >>
> >>   #if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
> >> -#define VMALLOC_MODULE_START \
> >> -        max(PFN_ALIGN((unsigned long)&_end - SZ_2G), VMALLOC_START)
> >>   void *module_alloc(unsigned long size)
> >>   {
> >>          return __vmalloc_node_range(size, 1, VMALLOC_MODULE_START,
> >> -                                   VMALLOC_END, GFP_KERNEL,
> >> +                                   VMALLOC_MODULE_END, GFP_KERNEL,
> >>                                      PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE=
,
> >>                                      __builtin_return_address(0));
> >>   }
> >> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlin=
ux.lds.S
> >> index 0339b6bbe11a..a9abde62909f 100644
> >> --- a/arch/riscv/kernel/vmlinux.lds.S
> >> +++ b/arch/riscv/kernel/vmlinux.lds.S
> >> @@ -4,7 +4,8 @@
> >>    * Copyright (C) 2017 SiFive
> >>    */
> >>
> >> -#define LOAD_OFFSET PAGE_OFFSET
> >> +#include <asm/pgtable.h>
> >> +#define LOAD_OFFSET KERNEL_LINK_ADDR
> >>   #include <asm/vmlinux.lds.h>
> >>   #include <asm/page.h>
> >>   #include <asm/cache.h>
> >> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> >> index 27a334106708..17f108baec4f 100644
> >> --- a/arch/riscv/mm/init.c
> >> +++ b/arch/riscv/mm/init.c
> >> @@ -22,6 +22,9 @@
> >>
> >>   #include "../kernel/head.h"
> >>
> >> +unsigned long kernel_virt_addr =3D KERNEL_VIRT_ADDR;
> >> +EXPORT_SYMBOL(kernel_virt_addr);
> >> +
> >>   unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
> >>                                                          __page_aligne=
d_bss;
> >>   EXPORT_SYMBOL(empty_zero_page);
> >> @@ -178,8 +181,12 @@ void __init setup_bootmem(void)
> >>   }
> >>
> >>   #ifdef CONFIG_MMU
> >> +/* Offset between linear mapping virtual address and kernel load addr=
ess */
> >>   unsigned long va_pa_offset;
> >>   EXPORT_SYMBOL(va_pa_offset);
> >> +/* Offset between kernel mapping virtual address and kernel load addr=
ess */
> >> +unsigned long va_kernel_pa_offset;
> >> +EXPORT_SYMBOL(va_kernel_pa_offset);
> >>   unsigned long pfn_base;
> >>   EXPORT_SYMBOL(pfn_base);
> >>
> >> @@ -271,7 +278,7 @@ static phys_addr_t __init alloc_pmd(uintptr_t va)
> >>          if (mmu_enabled)
> >>                  return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
> >>
> >> -       pmd_num =3D (va - PAGE_OFFSET) >> PGDIR_SHIFT;
> >> +       pmd_num =3D (va - kernel_virt_addr) >> PGDIR_SHIFT;
> >>          BUG_ON(pmd_num >=3D NUM_EARLY_PMDS);
> >>          return (uintptr_t)&early_pmd[pmd_num * PTRS_PER_PMD];
> >>   }
> >> @@ -372,14 +379,30 @@ static uintptr_t __init best_map_size(phys_addr_=
t base, phys_addr_t size)
> >>   #error "setup_vm() is called from head.S before relocate so it shoul=
d not use absolute addressing."
> >>   #endif
> >>
> >> +static uintptr_t load_pa, load_sz;
> >> +
> >> +void create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
> >> +{
> >> +       uintptr_t va, end_va;
> >> +
> >> +       end_va =3D kernel_virt_addr + load_sz;
> >> +       for (va =3D kernel_virt_addr; va < end_va; va +=3D map_size)
> >> +               create_pgd_mapping(pgdir, va,
> >> +                                  load_pa + (va - kernel_virt_addr),
> >> +                                  map_size, PAGE_KERNEL_EXEC);
> >> +}
> >> +
> >>   asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> >>   {
> >>          uintptr_t va, end_va;
> >> -       uintptr_t load_pa =3D (uintptr_t)(&_start);
> >> -       uintptr_t load_sz =3D (uintptr_t)(&_end) - load_pa;
> >>          uintptr_t map_size =3D best_map_size(load_pa, MAX_EARLY_MAPPI=
NG_SIZE);
> >>
> >> +       load_pa =3D (uintptr_t)(&_start);
> >> +       load_sz =3D (uintptr_t)(&_end) - load_pa;
> >> +
> >>          va_pa_offset =3D PAGE_OFFSET - load_pa;
> >> +       va_kernel_pa_offset =3D kernel_virt_addr - load_pa;
> >> +
> >>          pfn_base =3D PFN_DOWN(load_pa);
> >>
> >>          /*
> >> @@ -402,26 +425,22 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa=
)
> >>          create_pmd_mapping(fixmap_pmd, FIXADDR_START,
> >>                             (uintptr_t)fixmap_pte, PMD_SIZE, PAGE_TABL=
E);
> >>          /* Setup trampoline PGD and PMD */
> >> -       create_pgd_mapping(trampoline_pg_dir, PAGE_OFFSET,
> >> +       create_pgd_mapping(trampoline_pg_dir, kernel_virt_addr,
> >>                             (uintptr_t)trampoline_pmd, PGDIR_SIZE, PAG=
E_TABLE);
> >> -       create_pmd_mapping(trampoline_pmd, PAGE_OFFSET,
> >> +       create_pmd_mapping(trampoline_pmd, kernel_virt_addr,
> >>                             load_pa, PMD_SIZE, PAGE_KERNEL_EXEC);
> >>   #else
> >>          /* Setup trampoline PGD */
> >> -       create_pgd_mapping(trampoline_pg_dir, PAGE_OFFSET,
> >> +       create_pgd_mapping(trampoline_pg_dir, kernel_virt_addr,
> >>                             load_pa, PGDIR_SIZE, PAGE_KERNEL_EXEC);
> >>   #endif
> >>
> >>          /*
> >> -        * Setup early PGD covering entire kernel which will allows
> >> +        * Setup early PGD covering entire kernel which will allow
> >>           * us to reach paging_init(). We map all memory banks later
> >>           * in setup_vm_final() below.
> >>           */
> >> -       end_va =3D PAGE_OFFSET + load_sz;
> >> -       for (va =3D PAGE_OFFSET; va < end_va; va +=3D map_size)
> >> -               create_pgd_mapping(early_pg_dir, va,
> >> -                                  load_pa + (va - PAGE_OFFSET),
> >> -                                  map_size, PAGE_KERNEL_EXEC);
> >> +       create_kernel_page_table(early_pg_dir, map_size);
> >>
> >>          /* Create fixed mapping for early FDT parsing */
> >>          end_va =3D __fix_to_virt(FIX_FDT) + FIX_FDT_SIZE;
> >> @@ -441,6 +460,7 @@ static void __init setup_vm_final(void)
> >>          uintptr_t va, map_size;
> >>          phys_addr_t pa, start, end;
> >>          struct memblock_region *reg;
> >> +       static struct vm_struct vm_kernel =3D { 0 };
> >>
> >>          /* Set mmu_enabled flag */
> >>          mmu_enabled =3D true;
> >> @@ -467,10 +487,22 @@ static void __init setup_vm_final(void)
> >>                  for (pa =3D start; pa < end; pa +=3D map_size) {
> >>                          va =3D (uintptr_t)__va(pa);
> >>                          create_pgd_mapping(swapper_pg_dir, va, pa,
> >> -                                          map_size, PAGE_KERNEL_EXEC)=
;
> >> +                                          map_size, PAGE_KERNEL);
> >>                  }
> >>          }
> >>
> >> +       /* Map the kernel */
> >> +       create_kernel_page_table(swapper_pg_dir, PMD_SIZE);
> >> +
> >> +       /* Reserve the vmalloc area occupied by the kernel */
> >> +       vm_kernel.addr =3D (void *)kernel_virt_addr;
> >> +       vm_kernel.phys_addr =3D load_pa;
> >> +       vm_kernel.size =3D (load_sz + PMD_SIZE) & ~(PMD_SIZE - 1);
> >> +       vm_kernel.flags =3D VM_MAP | VM_NO_GUARD;
> >> +       vm_kernel.caller =3D __builtin_return_address(0);
> >> +
> >> +       vm_area_add_early(&vm_kernel);
> >> +
> >>          /* Clear fixmap PTE and PMD mappings */
> >>          clear_fixmap(FIX_PTE);
> >>          clear_fixmap(FIX_PMD);
> >> diff --git a/arch/riscv/mm/physaddr.c b/arch/riscv/mm/physaddr.c
> >> index e8e4dcd39fed..35703d5ef5fd 100644
> >> --- a/arch/riscv/mm/physaddr.c
> >> +++ b/arch/riscv/mm/physaddr.c
> >> @@ -23,7 +23,7 @@ EXPORT_SYMBOL(__virt_to_phys);
> >>
> >>   phys_addr_t __phys_addr_symbol(unsigned long x)
> >>   {
> >> -       unsigned long kernel_start =3D (unsigned long)PAGE_OFFSET;
> >> +       unsigned long kernel_start =3D (unsigned long)kernel_virt_addr=
;
> >>          unsigned long kernel_end =3D (unsigned long)_end;
> >>
> >>          /*
> >> --
> >> 2.20.1
> >>
