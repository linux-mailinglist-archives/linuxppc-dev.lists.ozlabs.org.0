Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCBA228887
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 20:48:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BB6zv2WszzDqlD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 04:48:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ghiti.fr
 (client-ip=217.70.178.242; helo=mslow2.mail.gandi.net;
 envelope-from=alex@ghiti.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ghiti.fr
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BB6xk2yThzDqWJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 04:46:17 +1000 (AEST)
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id DD1843A5068
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 18:36:45 +0000 (UTC)
Received: from [192.168.1.14] (lfbn-gre-1-325-105.w90-112.abo.wanadoo.fr
 [90.112.45.105]) (Authenticated sender: alex@ghiti.fr)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 94342200009;
 Tue, 21 Jul 2020 18:36:12 +0000 (UTC)
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
From: Alex Ghiti <alex@ghiti.fr>
To: Palmer Dabbelt <palmer@dabbelt.com>
References: <mhng-831c4073-aefa-4aa0-a583-6a17f9aff9b7@palmerdabbelt-glaptop1>
 <d7e3cbb7-c12a-bce2-f1db-c336d15f74bd@ghiti.fr>
Message-ID: <7cb2285e-68ba-6827-5e61-e33a4b65ac03@ghiti.fr>
Date: Tue, 21 Jul 2020 14:36:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d7e3cbb7-c12a-bce2-f1db-c336d15f74bd@ghiti.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: aou@eecs.berkeley.edu, linux-mm@kvack.org, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 paulus@samba.org, zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's try to make progress here: I add linux-mm in CC to get feedback on 
this patch as it blocks sv48 support too.

Alex

Le 7/9/20 à 7:11 AM, Alex Ghiti a écrit :
> Hi Palmer,
> 
> Le 7/9/20 à 1:05 AM, Palmer Dabbelt a écrit :
>> On Sun, 07 Jun 2020 00:59:46 PDT (-0700), alex@ghiti.fr wrote:
>>> This is a preparatory patch for relocatable kernel.
>>>
>>> The kernel used to be linked at PAGE_OFFSET address and used to be 
>>> loaded
>>> physically at the beginning of the main memory. Therefore, we could use
>>> the linear mapping for the kernel mapping.
>>>
>>> But the relocated kernel base address will be different from PAGE_OFFSET
>>> and since in the linear mapping, two different virtual addresses cannot
>>> point to the same physical address, the kernel mapping needs to lie 
>>> outside
>>> the linear mapping.
>>
>> I know it's been a while, but I keep opening this up to review it and 
>> just
>> can't get over how ugly it is to put the kernel's linear map in the 
>> vmalloc
>> region.
>>
>> I guess I don't understand why this is necessary at all.  
>> Specifically: why
>> can't we just relocate the kernel within the linear map?  That would 
>> let the
>> bootloader put the kernel wherever it wants, modulo the physical 
>> memory size we
>> support.  We'd need to handle the regions that are coupled to the 
>> kernel's
>> execution address, but we could just put them in an explicit memory 
>> region
>> which is what we should probably be doing anyway.
> 
> Virtual relocation in the linear mapping requires to move the kernel 
> physically too. Zong implemented this physical move in its KASLR RFC 
> patchset, which is cumbersome since finding an available physical spot 
> is harder than just selecting a virtual range in the vmalloc range.
> 
> In addition, having the kernel mapping in the linear mapping prevents 
> the use of hugepage for the linear mapping resulting in performance loss 
> (at least for the GB that encompasses the kernel).
> 
> Why do you find this "ugly" ? The vmalloc region is just a bunch of 
> available virtual addresses to whatever purpose we want, and as noted by 
> Zong, arm64 uses the same scheme.
> 
>>
>>> In addition, because modules and BPF must be close to the kernel (inside
>>> +-2GB window), the kernel is placed at the end of the vmalloc zone minus
>>> 2GB, which leaves room for modules and BPF. The kernel could not be
>>> placed at the beginning of the vmalloc zone since other vmalloc
>>> allocations from the kernel could get all the +-2GB window around the
>>> kernel which would prevent new modules and BPF programs to be loaded.
>>
>> Well, that's not enough to make sure this doesn't happen -- it's just 
>> enough to
>> make sure it doesn't happen very quickily.  That's the same boat we're 
>> already
>> in, though, so it's not like it's worse.
> 
> Indeed, that's not worse, I haven't found a way to reserve vmalloc area 
> without actually allocating it.
> 
>>
>>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>>> Reviewed-by: Zong Li <zong.li@sifive.com>
>>> ---
>>>  arch/riscv/boot/loader.lds.S     |  3 +-
>>>  arch/riscv/include/asm/page.h    | 10 +++++-
>>>  arch/riscv/include/asm/pgtable.h | 38 ++++++++++++++-------
>>>  arch/riscv/kernel/head.S         |  3 +-
>>>  arch/riscv/kernel/module.c       |  4 +--
>>>  arch/riscv/kernel/vmlinux.lds.S  |  3 +-
>>>  arch/riscv/mm/init.c             | 58 +++++++++++++++++++++++++-------
>>>  arch/riscv/mm/physaddr.c         |  2 +-
>>>  8 files changed, 88 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/arch/riscv/boot/loader.lds.S b/arch/riscv/boot/loader.lds.S
>>> index 47a5003c2e28..62d94696a19c 100644
>>> --- a/arch/riscv/boot/loader.lds.S
>>> +++ b/arch/riscv/boot/loader.lds.S
>>> @@ -1,13 +1,14 @@
>>>  /* SPDX-License-Identifier: GPL-2.0 */
>>>
>>>  #include <asm/page.h>
>>> +#include <asm/pgtable.h>
>>>
>>>  OUTPUT_ARCH(riscv)
>>>  ENTRY(_start)
>>>
>>>  SECTIONS
>>>  {
>>> -    . = PAGE_OFFSET;
>>> +    . = KERNEL_LINK_ADDR;
>>>
>>>      .payload : {
>>>          *(.payload)
>>> diff --git a/arch/riscv/include/asm/page.h 
>>> b/arch/riscv/include/asm/page.h
>>> index 2d50f76efe48..48bb09b6a9b7 100644
>>> --- a/arch/riscv/include/asm/page.h
>>> +++ b/arch/riscv/include/asm/page.h
>>> @@ -90,18 +90,26 @@ typedef struct page *pgtable_t;
>>>
>>>  #ifdef CONFIG_MMU
>>>  extern unsigned long va_pa_offset;
>>> +extern unsigned long va_kernel_pa_offset;
>>>  extern unsigned long pfn_base;
>>>  #define ARCH_PFN_OFFSET        (pfn_base)
>>>  #else
>>>  #define va_pa_offset        0
>>> +#define va_kernel_pa_offset    0
>>>  #define ARCH_PFN_OFFSET        (PAGE_OFFSET >> PAGE_SHIFT)
>>>  #endif /* CONFIG_MMU */
>>>
>>>  extern unsigned long max_low_pfn;
>>>  extern unsigned long min_low_pfn;
>>> +extern unsigned long kernel_virt_addr;
>>>
>>>  #define __pa_to_va_nodebug(x)    ((void *)((unsigned long) (x) + 
>>> va_pa_offset))
>>> -#define __va_to_pa_nodebug(x)    ((unsigned long)(x) - va_pa_offset)
>>> +#define linear_mapping_va_to_pa(x)    ((unsigned long)(x) - 
>>> va_pa_offset)
>>> +#define kernel_mapping_va_to_pa(x)    \
>>> +    ((unsigned long)(x) - va_kernel_pa_offset)
>>> +#define __va_to_pa_nodebug(x)        \
>>> +    (((x) >= PAGE_OFFSET) ?        \
>>> +        linear_mapping_va_to_pa(x) : kernel_mapping_va_to_pa(x))
>>>
>>>  #ifdef CONFIG_DEBUG_VIRTUAL
>>>  extern phys_addr_t __virt_to_phys(unsigned long x);
>>> diff --git a/arch/riscv/include/asm/pgtable.h 
>>> b/arch/riscv/include/asm/pgtable.h
>>> index 35b60035b6b0..94ef3b49dfb6 100644
>>> --- a/arch/riscv/include/asm/pgtable.h
>>> +++ b/arch/riscv/include/asm/pgtable.h
>>> @@ -11,23 +11,29 @@
>>>
>>>  #include <asm/pgtable-bits.h>
>>>
>>> -#ifndef __ASSEMBLY__
>>> -
>>> -/* Page Upper Directory not used in RISC-V */
>>> -#include <asm-generic/pgtable-nopud.h>
>>> -#include <asm/page.h>
>>> -#include <asm/tlbflush.h>
>>> -#include <linux/mm_types.h>
>>> -
>>> -#ifdef CONFIG_MMU
>>> +#ifndef CONFIG_MMU
>>> +#define KERNEL_VIRT_ADDR    PAGE_OFFSET
>>> +#define KERNEL_LINK_ADDR    PAGE_OFFSET
>>> +#else
>>> +/*
>>> + * Leave 2GB for modules and BPF that must lie within a 2GB range 
>>> around
>>> + * the kernel.
>>> + */
>>> +#define KERNEL_VIRT_ADDR    (VMALLOC_END - SZ_2G + 1)
>>> +#define KERNEL_LINK_ADDR    KERNEL_VIRT_ADDR
>>
>> At a bare minimum this is going to make a mess of the 32-bit port, as
>> non-relocatable kernels are now going to get linked at 1GiB which is 
>> where user
>> code is supposed to live.  That's an easy fix, though, as the 32-bit 
>> stuff
>> doesn't need any module address restrictions.
> 
> Indeed, I will take a look at that.
> 
>>
>>>  #define VMALLOC_SIZE     (KERN_VIRT_SIZE >> 1)
>>>  #define VMALLOC_END      (PAGE_OFFSET - 1)
>>>  #define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
>>>
>>>  #define BPF_JIT_REGION_SIZE    (SZ_128M)
>>> -#define BPF_JIT_REGION_START    (PAGE_OFFSET - BPF_JIT_REGION_SIZE)
>>> -#define BPF_JIT_REGION_END    (VMALLOC_END)
>>> +#define BPF_JIT_REGION_START    PFN_ALIGN((unsigned long)&_end)
>>> +#define BPF_JIT_REGION_END    (BPF_JIT_REGION_START + 
>>> BPF_JIT_REGION_SIZE)
>>> +
>>> +#ifdef CONFIG_64BIT
>>> +#define VMALLOC_MODULE_START    BPF_JIT_REGION_END
>>> +#define VMALLOC_MODULE_END    (((unsigned long)&_start & PAGE_MASK) 
>>> + SZ_2G)
>>> +#endif
>>>
>>>  /*
>>>   * Roughly size the vmemmap space to be large enough to fit enough
>>> @@ -57,9 +63,16 @@
>>>  #define FIXADDR_SIZE     PGDIR_SIZE
>>>  #endif
>>>  #define FIXADDR_START    (FIXADDR_TOP - FIXADDR_SIZE)
>>> -
>>>  #endif
>>>
>>> +#ifndef __ASSEMBLY__
>>> +
>>> +/* Page Upper Directory not used in RISC-V */
>>> +#include <asm-generic/pgtable-nopud.h>
>>> +#include <asm/page.h>
>>> +#include <asm/tlbflush.h>
>>> +#include <linux/mm_types.h>
>>> +
>>>  #ifdef CONFIG_64BIT
>>>  #include <asm/pgtable-64.h>
>>>  #else
>>> @@ -483,6 +496,7 @@ static inline void __kernel_map_pages(struct page 
>>> *page, int numpages, int enabl
>>>
>>>  #define kern_addr_valid(addr)   (1) /* FIXME */
>>>
>>> +extern char _start[];
>>>  extern void *dtb_early_va;
>>>  void setup_bootmem(void);
>>>  void paging_init(void);
>>> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
>>> index 98a406474e7d..8f5bb7731327 100644
>>> --- a/arch/riscv/kernel/head.S
>>> +++ b/arch/riscv/kernel/head.S
>>> @@ -49,7 +49,8 @@ ENTRY(_start)
>>>  #ifdef CONFIG_MMU
>>>  relocate:
>>>      /* Relocate return address */
>>> -    li a1, PAGE_OFFSET
>>> +    la a1, kernel_virt_addr
>>> +    REG_L a1, 0(a1)
>>>      la a2, _start
>>>      sub a1, a1, a2
>>>      add ra, ra, a1
>>> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
>>> index 8bbe5dbe1341..1a8fbe05accf 100644
>>> --- a/arch/riscv/kernel/module.c
>>> +++ b/arch/riscv/kernel/module.c
>>> @@ -392,12 +392,10 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const 
>>> char *strtab,
>>>  }
>>>
>>>  #if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
>>> -#define VMALLOC_MODULE_START \
>>> -     max(PFN_ALIGN((unsigned long)&_end - SZ_2G), VMALLOC_START)
>>>  void *module_alloc(unsigned long size)
>>>  {
>>>      return __vmalloc_node_range(size, 1, VMALLOC_MODULE_START,
>>> -                    VMALLOC_END, GFP_KERNEL,
>>> +                    VMALLOC_MODULE_END, GFP_KERNEL,
>>>                      PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
>>>                      __builtin_return_address(0));
>>>  }
>>> diff --git a/arch/riscv/kernel/vmlinux.lds.S 
>>> b/arch/riscv/kernel/vmlinux.lds.S
>>> index 0339b6bbe11a..a9abde62909f 100644
>>> --- a/arch/riscv/kernel/vmlinux.lds.S
>>> +++ b/arch/riscv/kernel/vmlinux.lds.S
>>> @@ -4,7 +4,8 @@
>>>   * Copyright (C) 2017 SiFive
>>>   */
>>>
>>> -#define LOAD_OFFSET PAGE_OFFSET
>>> +#include <asm/pgtable.h>
>>> +#define LOAD_OFFSET KERNEL_LINK_ADDR
>>>  #include <asm/vmlinux.lds.h>
>>>  #include <asm/page.h>
>>>  #include <asm/cache.h>
>>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>>> index 736de6c8739f..71da78914645 100644
>>> --- a/arch/riscv/mm/init.c
>>> +++ b/arch/riscv/mm/init.c
>>> @@ -22,6 +22,9 @@
>>>
>>>  #include "../kernel/head.h"
>>>
>>> +unsigned long kernel_virt_addr = KERNEL_VIRT_ADDR;
>>> +EXPORT_SYMBOL(kernel_virt_addr);
>>> +
>>>  unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
>>>                              __page_aligned_bss;
>>>  EXPORT_SYMBOL(empty_zero_page);
>>> @@ -178,8 +181,12 @@ void __init setup_bootmem(void)
>>>  }
>>>
>>>  #ifdef CONFIG_MMU
>>> +/* Offset between linear mapping virtual address and kernel load 
>>> address */
>>>  unsigned long va_pa_offset;
>>>  EXPORT_SYMBOL(va_pa_offset);
>>> +/* Offset between kernel mapping virtual address and kernel load 
>>> address */
>>> +unsigned long va_kernel_pa_offset;
>>> +EXPORT_SYMBOL(va_kernel_pa_offset);
>>>  unsigned long pfn_base;
>>>  EXPORT_SYMBOL(pfn_base);
>>>
>>> @@ -271,7 +278,7 @@ static phys_addr_t __init alloc_pmd(uintptr_t va)
>>>      if (mmu_enabled)
>>>          return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
>>>
>>> -    pmd_num = (va - PAGE_OFFSET) >> PGDIR_SHIFT;
>>> +    pmd_num = (va - kernel_virt_addr) >> PGDIR_SHIFT;
>>>      BUG_ON(pmd_num >= NUM_EARLY_PMDS);
>>>      return (uintptr_t)&early_pmd[pmd_num * PTRS_PER_PMD];
>>>  }
>>> @@ -372,14 +379,30 @@ static uintptr_t __init 
>>> best_map_size(phys_addr_t base, phys_addr_t size)
>>>  #error "setup_vm() is called from head.S before relocate so it 
>>> should not use absolute addressing."
>>>  #endif
>>>
>>> +static uintptr_t load_pa, load_sz;
>>> +
>>> +static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t 
>>> map_size)
>>> +{
>>> +    uintptr_t va, end_va;
>>> +
>>> +    end_va = kernel_virt_addr + load_sz;
>>> +    for (va = kernel_virt_addr; va < end_va; va += map_size)
>>> +        create_pgd_mapping(pgdir, va,
>>> +                   load_pa + (va - kernel_virt_addr),
>>> +                   map_size, PAGE_KERNEL_EXEC);
>>> +}
>>> +
>>>  asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>>>  {
>>>      uintptr_t va, end_va;
>>> -    uintptr_t load_pa = (uintptr_t)(&_start);
>>> -    uintptr_t load_sz = (uintptr_t)(&_end) - load_pa;
>>>      uintptr_t map_size = best_map_size(load_pa, 
>>> MAX_EARLY_MAPPING_SIZE);
>>>
>>> +    load_pa = (uintptr_t)(&_start);
>>> +    load_sz = (uintptr_t)(&_end) - load_pa;
>>> +
>>>      va_pa_offset = PAGE_OFFSET - load_pa;
>>> +    va_kernel_pa_offset = kernel_virt_addr - load_pa;
>>> +
>>>      pfn_base = PFN_DOWN(load_pa);
>>>
>>>      /*
>>> @@ -402,26 +425,22 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>>>      create_pmd_mapping(fixmap_pmd, FIXADDR_START,
>>>                 (uintptr_t)fixmap_pte, PMD_SIZE, PAGE_TABLE);
>>>      /* Setup trampoline PGD and PMD */
>>> -    create_pgd_mapping(trampoline_pg_dir, PAGE_OFFSET,
>>> +    create_pgd_mapping(trampoline_pg_dir, kernel_virt_addr,
>>>                 (uintptr_t)trampoline_pmd, PGDIR_SIZE, PAGE_TABLE);
>>> -    create_pmd_mapping(trampoline_pmd, PAGE_OFFSET,
>>> +    create_pmd_mapping(trampoline_pmd, kernel_virt_addr,
>>>                 load_pa, PMD_SIZE, PAGE_KERNEL_EXEC);
>>>  #else
>>>      /* Setup trampoline PGD */
>>> -    create_pgd_mapping(trampoline_pg_dir, PAGE_OFFSET,
>>> +    create_pgd_mapping(trampoline_pg_dir, kernel_virt_addr,
>>>                 load_pa, PGDIR_SIZE, PAGE_KERNEL_EXEC);
>>>  #endif
>>>
>>>      /*
>>> -     * Setup early PGD covering entire kernel which will allows
>>> +     * Setup early PGD covering entire kernel which will allow
>>>       * us to reach paging_init(). We map all memory banks later
>>>       * in setup_vm_final() below.
>>>       */
>>> -    end_va = PAGE_OFFSET + load_sz;
>>> -    for (va = PAGE_OFFSET; va < end_va; va += map_size)
>>> -        create_pgd_mapping(early_pg_dir, va,
>>> -                   load_pa + (va - PAGE_OFFSET),
>>> -                   map_size, PAGE_KERNEL_EXEC);
>>> +    create_kernel_page_table(early_pg_dir, map_size);
>>>
>>>      /* Create fixed mapping for early FDT parsing */
>>>      end_va = __fix_to_virt(FIX_FDT) + FIX_FDT_SIZE;
>>> @@ -441,6 +460,7 @@ static void __init setup_vm_final(void)
>>>      uintptr_t va, map_size;
>>>      phys_addr_t pa, start, end;
>>>      struct memblock_region *reg;
>>> +    static struct vm_struct vm_kernel = { 0 };
>>>
>>>      /* Set mmu_enabled flag */
>>>      mmu_enabled = true;
>>> @@ -467,10 +487,22 @@ static void __init setup_vm_final(void)
>>>          for (pa = start; pa < end; pa += map_size) {
>>>              va = (uintptr_t)__va(pa);
>>>              create_pgd_mapping(swapper_pg_dir, va, pa,
>>> -                       map_size, PAGE_KERNEL_EXEC);
>>> +                       map_size, PAGE_KERNEL);
>>>          }
>>>      }
>>>
>>> +    /* Map the kernel */
>>> +    create_kernel_page_table(swapper_pg_dir, PMD_SIZE);
>>> +
>>> +    /* Reserve the vmalloc area occupied by the kernel */
>>> +    vm_kernel.addr = (void *)kernel_virt_addr;
>>> +    vm_kernel.phys_addr = load_pa;
>>> +    vm_kernel.size = (load_sz + PMD_SIZE - 1) & ~(PMD_SIZE - 1);
>>> +    vm_kernel.flags = VM_MAP | VM_NO_GUARD;
>>> +    vm_kernel.caller = __builtin_return_address(0);
>>> +
>>> +    vm_area_add_early(&vm_kernel);
>>> +
>>>      /* Clear fixmap PTE and PMD mappings */
>>>      clear_fixmap(FIX_PTE);
>>>      clear_fixmap(FIX_PMD);
>>> diff --git a/arch/riscv/mm/physaddr.c b/arch/riscv/mm/physaddr.c
>>> index e8e4dcd39fed..35703d5ef5fd 100644
>>> --- a/arch/riscv/mm/physaddr.c
>>> +++ b/arch/riscv/mm/physaddr.c
>>> @@ -23,7 +23,7 @@ EXPORT_SYMBOL(__virt_to_phys);
>>>
>>>  phys_addr_t __phys_addr_symbol(unsigned long x)
>>>  {
>>> -    unsigned long kernel_start = (unsigned long)PAGE_OFFSET;
>>> +    unsigned long kernel_start = (unsigned long)kernel_virt_addr;
>>>      unsigned long kernel_end = (unsigned long)_end;
>>>
>>>      /*
> 
> Alex
