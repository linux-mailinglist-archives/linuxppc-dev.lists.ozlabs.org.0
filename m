Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C183473C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 14:48:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JBXw0wNfzDqQB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 22:48:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="QKUG8xzb"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JBVd3gJXzDqPW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 22:45:58 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45JBVS5s84z9vDbD;
 Tue,  4 Jun 2019 14:45:52 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=QKUG8xzb; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0dKNbhHsbTGC; Tue,  4 Jun 2019 14:45:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45JBVS4b2tz9vDbC;
 Tue,  4 Jun 2019 14:45:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1559652352; bh=0bIuEy7DiebcxthQL0padbBj5NRJHe3Hz83QMlXOndI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QKUG8xzb8+maCp9s7Mw7gLUNcx0jafliGipMuLQ0A5SZQB7aaR8NTUzHFd3Nt9eag
 vp6MsqLz+flb5FFeX0QmLgWEksJeTX11Mea+VDgBFVl9L2RYV+2HGZamG3mNx1yhWR
 urvu01+YvxnGlsf5mljAzpAPcJEHurF84kerxsII=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7823D8B982;
 Tue,  4 Jun 2019 14:45:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fQkei6wJwUHI; Tue,  4 Jun 2019 14:45:53 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B907E8B967;
 Tue,  4 Jun 2019 14:45:51 +0200 (CEST)
Subject: Re: [RFC PATCH] powerpc/book3e: KASAN Full support for 64bit
To: Daniel Axtens <dja@axtens.net>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <3401648225001077db54172ee87573b21e1cfa38.1553782837.git.christophe.leroy@c-s.fr>
 <877ea7za12.fsf@dja-thinkpad.axtens.net>
 <028d7332-57e0-bbec-1843-29f87b33a1d4@c-s.fr>
 <87woi2xm8l.fsf@dja-thinkpad.axtens.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a0c04cb8-a19b-2d73-5725-4868556e2b47@c-s.fr>
Date: Tue, 4 Jun 2019 12:43:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87woi2xm8l.fsf@dja-thinkpad.axtens.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/03/2019 11:50 PM, Daniel Axtens wrote:
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
> 
>> Hi,
>>
>> Ok, can you share your .config ?
> 
> Sure! This one is with kasan off as the last build I did was testing to
> see if the code reorgisation was the cause of the issues. (it was not)
> 
> 
> 
> 
> This was the kasan-enabled config that failed to boot:
> 
> 

Same issue with your .config under QEMU:

A go with gdb shows:

Breakpoint 3, 0xc000000000027b6c in exc_0x700_common ()
=> 0xc000000000027b6c <exc_0x700_common+0>:	f8 01 00 70	std     r0,112(r1)
(gdb) bt
#0  0xc000000000027b6c in exc_0x700_common ()
#1  0xc00000000136f80c in .udbg_init_memcons ()


Without CONFIG_PPC_EARLY_DEBUG, it boots fine for me. Can you check on 
your side ?

Deactivating KASAN for arch/powerpc/kernel/udbg.o and 
arch/powerpc/sysdev/udbg_memcons.o is not enough, we hit a call to 
strstr() in register_early_udbg_console(), and once we get rid of it (in 
the same way as in prom_init.c) the next issue is register_console() and 
I don't know what to do about that one.

Christophe

> 
> 
> Regards,
> Daniel
> 
>>
>> Christophe
>>
>> Le 31/05/2019 à 03:29, Daniel Axtens a écrit :
>>> Hi Christophe,
>>>
>>> I tried this on the t4240rdb and it fails to boot if KASAN is
>>> enabled. It does boot with the patch applied but KASAN disabled, so that
>>> narrows it down a little bit.
>>>
>>> I need to focus on 3s first so I'll just drop 3e from my patch set for
>>> now.
>>>
>>> Regards,
>>> Daniel
>>>
>>>> The KASAN shadow area is mapped into vmemmap space:
>>>> 0x8000 0400 0000 0000 to 0x8000 0600 0000 0000.
>>>> For this vmemmap has to be disabled.
>>>>
>>>> Cc: Daniel Axtens <dja@axtens.net>
>>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>>> ---
>>>>    arch/powerpc/Kconfig                  |   1 +
>>>>    arch/powerpc/Kconfig.debug            |   3 +-
>>>>    arch/powerpc/include/asm/kasan.h      |  11 +++
>>>>    arch/powerpc/kernel/Makefile          |   2 +
>>>>    arch/powerpc/kernel/head_64.S         |   3 +
>>>>    arch/powerpc/kernel/setup_64.c        |  20 +++---
>>>>    arch/powerpc/mm/kasan/Makefile        |   1 +
>>>>    arch/powerpc/mm/kasan/kasan_init_64.c | 129 ++++++++++++++++++++++++++++++++++
>>>>    8 files changed, 159 insertions(+), 11 deletions(-)
>>>>    create mode 100644 arch/powerpc/mm/kasan/kasan_init_64.c
>>>>
>>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>>> index 1a2fb50126b2..e0b7c45e4dc7 100644
>>>> --- a/arch/powerpc/Kconfig
>>>> +++ b/arch/powerpc/Kconfig
>>>> @@ -174,6 +174,7 @@ config PPC
>>>>    	select HAVE_ARCH_AUDITSYSCALL
>>>>    	select HAVE_ARCH_JUMP_LABEL
>>>>    	select HAVE_ARCH_KASAN			if PPC32
>>>> +	select HAVE_ARCH_KASAN			if PPC_BOOK3E_64 && !SPARSEMEM_VMEMMAP
>>>>    	select HAVE_ARCH_KGDB
>>>>    	select HAVE_ARCH_MMAP_RND_BITS
>>>>    	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
>>>> diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
>>>> index 61febbbdd02b..b4140dd6b4e4 100644
>>>> --- a/arch/powerpc/Kconfig.debug
>>>> +++ b/arch/powerpc/Kconfig.debug
>>>> @@ -370,4 +370,5 @@ config PPC_FAST_ENDIAN_SWITCH
>>>>    config KASAN_SHADOW_OFFSET
>>>>    	hex
>>>>    	depends on KASAN
>>>> -	default 0xe0000000
>>>> +	default 0xe0000000 if PPC32
>>>> +	default 0x6800040000000000 if PPC64
>>>> diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
>>>> index 296e51c2f066..756b3d58f921 100644
>>>> --- a/arch/powerpc/include/asm/kasan.h
>>>> +++ b/arch/powerpc/include/asm/kasan.h
>>>> @@ -23,10 +23,21 @@
>>>>    
>>>>    #define KASAN_SHADOW_OFFSET	ASM_CONST(CONFIG_KASAN_SHADOW_OFFSET)
>>>>    
>>>> +#ifdef CONFIG_PPC32
>>>>    #define KASAN_SHADOW_END	0UL
>>>>    
>>>>    #define KASAN_SHADOW_SIZE	(KASAN_SHADOW_END - KASAN_SHADOW_START)
>>>>    
>>>> +#else
>>>> +
>>>> +#include <asm/pgtable.h>
>>>> +
>>>> +#define KASAN_SHADOW_SIZE	(KERN_VIRT_SIZE >> KASAN_SHADOW_SCALE_SHIFT)
>>>> +
>>>> +#define KASAN_SHADOW_END	(KASAN_SHADOW_START + KASAN_SHADOW_SIZE)
>>>> +
>>>> +#endif /* CONFIG_PPC32 */
>>>> +
>>>>    #ifdef CONFIG_KASAN
>>>>    void kasan_early_init(void);
>>>>    void kasan_mmu_init(void);
>>>> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
>>>> index 0ea6c4aa3a20..7f232c06f11d 100644
>>>> --- a/arch/powerpc/kernel/Makefile
>>>> +++ b/arch/powerpc/kernel/Makefile
>>>> @@ -35,6 +35,8 @@ KASAN_SANITIZE_early_32.o := n
>>>>    KASAN_SANITIZE_cputable.o := n
>>>>    KASAN_SANITIZE_prom_init.o := n
>>>>    KASAN_SANITIZE_btext.o := n
>>>> +KASAN_SANITIZE_paca.o := n
>>>> +KASAN_SANITIZE_setup_64.o := n
>>>>    
>>>>    ifdef CONFIG_KASAN
>>>>    CFLAGS_early_32.o += -DDISABLE_BRANCH_PROFILING
>>>> diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
>>>> index 3fad8d499767..80fbd8024fb2 100644
>>>> --- a/arch/powerpc/kernel/head_64.S
>>>> +++ b/arch/powerpc/kernel/head_64.S
>>>> @@ -966,6 +966,9 @@ start_here_multiplatform:
>>>>    	 * and SLB setup before we turn on relocation.
>>>>    	 */
>>>>    
>>>> +#ifdef CONFIG_KASAN
>>>> +	bl	kasan_early_init
>>>> +#endif
>>>>    	/* Restore parameters passed from prom_init/kexec */
>>>>    	mr	r3,r31
>>>>    	bl	early_setup		/* also sets r13 and SPRG_PACA */
>>>> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
>>>> index ba404dd9ce1d..d2bf860dd966 100644
>>>> --- a/arch/powerpc/kernel/setup_64.c
>>>> +++ b/arch/powerpc/kernel/setup_64.c
>>>> @@ -311,6 +311,16 @@ void __init early_setup(unsigned long dt_ptr)
>>>>     	DBG(" -> early_setup(), dt_ptr: 0x%lx\n", dt_ptr);
>>>>    
>>>>    	/*
>>>> +	 * Configure exception handlers. This include setting up trampolines
>>>> +	 * if needed, setting exception endian mode, etc...
>>>> +	 */
>>>> +	configure_exceptions();
>>>> +
>>>> +	/* Apply all the dynamic patching */
>>>> +	apply_feature_fixups();
>>>> +	setup_feature_keys();
>>>> +
>>>> +	/*
>>>>    	 * Do early initialization using the flattened device
>>>>    	 * tree, such as retrieving the physical memory map or
>>>>    	 * calculating/retrieving the hash table size.
>>>> @@ -325,16 +335,6 @@ void __init early_setup(unsigned long dt_ptr)
>>>>    	setup_paca(paca_ptrs[boot_cpuid]);
>>>>    	fixup_boot_paca();
>>>>    
>>>> -	/*
>>>> -	 * Configure exception handlers. This include setting up trampolines
>>>> -	 * if needed, setting exception endian mode, etc...
>>>> -	 */
>>>> -	configure_exceptions();
>>>> -
>>>> -	/* Apply all the dynamic patching */
>>>> -	apply_feature_fixups();
>>>> -	setup_feature_keys();
>>>> -
>>>>    	/* Initialize the hash table or TLB handling */
>>>>    	early_init_mmu();
>>>>    
>>>> diff --git a/arch/powerpc/mm/kasan/Makefile b/arch/powerpc/mm/kasan/Makefile
>>>> index 6577897673dd..0bfbe3892808 100644
>>>> --- a/arch/powerpc/mm/kasan/Makefile
>>>> +++ b/arch/powerpc/mm/kasan/Makefile
>>>> @@ -3,3 +3,4 @@
>>>>    KASAN_SANITIZE := n
>>>>    
>>>>    obj-$(CONFIG_PPC32)           += kasan_init_32.o
>>>> +obj-$(CONFIG_PPC64)	+= kasan_init_64.o
>>>> diff --git a/arch/powerpc/mm/kasan/kasan_init_64.c b/arch/powerpc/mm/kasan/kasan_init_64.c
>>>> new file mode 100644
>>>> index 000000000000..7fd71b8e883b
>>>> --- /dev/null
>>>> +++ b/arch/powerpc/mm/kasan/kasan_init_64.c
>>>> @@ -0,0 +1,129 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +
>>>> +#define DISABLE_BRANCH_PROFILING
>>>> +
>>>> +#include <linux/kasan.h>
>>>> +#include <linux/printk.h>
>>>> +#include <linux/memblock.h>
>>>> +#include <linux/sched/task.h>
>>>> +#include <asm/pgalloc.h>
>>>> +
>>>> +static void __init kasan_populate_pte(pte_t *ptep, pgprot_t prot)
>>>> +{
>>>> +	unsigned long va = (unsigned long)kasan_early_shadow_page;
>>>> +	phys_addr_t pa = __pa(kasan_early_shadow_page);
>>>> +	int i;
>>>> +
>>>> +	for (i = 0; i < PTRS_PER_PTE; i++, ptep++)
>>>> +		__set_pte_at(&init_mm, va, ptep, pfn_pte(PHYS_PFN(pa), prot), 0);
>>>> +}
>>>> +
>>>> +static void __init kasan_populate_pmd(pmd_t *pmdp)
>>>> +{
>>>> +	int i;
>>>> +
>>>> +	for (i = 0; i < PTRS_PER_PMD; i++)
>>>> +		pmd_populate_kernel(&init_mm, pmdp + i, kasan_early_shadow_pte);
>>>> +}
>>>> +
>>>> +static void __init kasan_populate_pud(pud_t *pudp)
>>>> +{
>>>> +	int i;
>>>> +
>>>> +	for (i = 0; i < PTRS_PER_PUD; i++)
>>>> +		pud_populate(&init_mm, pudp + i, kasan_early_shadow_pmd);
>>>> +}
>>>> +
>>>> +static void __init *kasan_alloc_pgtable(unsigned long size)
>>>> +{
>>>> +	void *ptr = memblock_alloc_try_nid(size, size, MEMBLOCK_LOW_LIMIT,
>>>> +					   __pa(MAX_DMA_ADDRESS), NUMA_NO_NODE);
>>>> +
>>>> +	if (!ptr)
>>>> +		panic("%s: Failed to allocate %lu bytes align=0x%lx max_addr=%lx\n",
>>>> +		      __func__, size, size, __pa(MAX_DMA_ADDRESS));
>>>> +
>>>> +	return ptr;
>>>> +}
>>>> +
>>>> +static int __init kasan_map_page(unsigned long va, unsigned long pa, pgprot_t prot)
>>>> +{
>>>> +	pgd_t *pgdp = pgd_offset_k(va);
>>>> +	pud_t *pudp;
>>>> +	pmd_t *pmdp;
>>>> +	pte_t *ptep;
>>>> +
>>>> +	if (pgd_none(*pgdp) || (void *)pgd_page_vaddr(*pgdp) == kasan_early_shadow_pud) {
>>>> +		pudp = kasan_alloc_pgtable(PUD_TABLE_SIZE);
>>>> +		kasan_populate_pud(pudp);
>>>> +		pgd_populate(&init_mm, pgdp, pudp);
>>>> +	}
>>>> +	pudp = pud_offset(pgdp, va);
>>>> +	if (pud_none(*pudp) || (void *)pud_page_vaddr(*pudp) == kasan_early_shadow_pmd) {
>>>> +		pmdp = kasan_alloc_pgtable(PMD_TABLE_SIZE);
>>>> +		kasan_populate_pmd(pmdp);
>>>> +		pud_populate(&init_mm, pudp, pmdp);
>>>> +	}
>>>> +	pmdp = pmd_offset(pudp, va);
>>>> +	if (!pmd_present(*pmdp) || (void *)pmd_page_vaddr(*pmdp) == kasan_early_shadow_pte) {
>>>> +		ptep = kasan_alloc_pgtable(PTE_TABLE_SIZE);
>>>> +		kasan_populate_pte(ptep, PAGE_KERNEL);
>>>> +		pmd_populate_kernel(&init_mm, pmdp, ptep);
>>>> +	}
>>>> +	ptep = pte_offset_kernel(pmdp, va);
>>>> +
>>>> +	__set_pte_at(&init_mm, va, ptep, pfn_pte(pa >> PAGE_SHIFT, prot), 0);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void __init kasan_init_region(struct memblock_region *reg)
>>>> +{
>>>> +	void *start = __va(reg->base);
>>>> +	void *end = __va(reg->base + reg->size);
>>>> +	unsigned long k_start, k_end, k_cur;
>>>> +
>>>> +	if (start >= end)
>>>> +		return;
>>>> +
>>>> +	k_start = (unsigned long)kasan_mem_to_shadow(start);
>>>> +	k_end = (unsigned long)kasan_mem_to_shadow(end);
>>>> +
>>>> +	for (k_cur = k_start; k_cur < k_end; k_cur += PAGE_SIZE) {
>>>> +		void *va = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
>>>> +
>>>> +		kasan_map_page(k_cur, __pa(va), PAGE_KERNEL);
>>>> +	}
>>>> +	flush_tlb_kernel_range(k_start, k_end);
>>>> +}
>>>> +
>>>> +void __init kasan_init(void)
>>>> +{
>>>> +	struct memblock_region *reg;
>>>> +
>>>> +	for_each_memblock(memory, reg)
>>>> +		kasan_init_region(reg);
>>>> +
>>>> +	/* It's too early to use clear_page() ! */
>>>> +	memset(kasan_early_shadow_page, 0, sizeof(kasan_early_shadow_page));
>>>> +
>>>> +	/* Enable error messages */
>>>> +	init_task.kasan_depth = 0;
>>>> +	pr_info("KASAN init done\n");
>>>> +}
>>>> +
>>>> +/* The early shadow maps everything to a single page of zeroes */
>>>> +asmlinkage void __init kasan_early_init(void)
>>>> +{
>>>> +	unsigned long addr = KASAN_SHADOW_START;
>>>> +	unsigned long end = KASAN_SHADOW_END;
>>>> +	pgd_t *pgdp = pgd_offset_k(addr);
>>>> +
>>>> +	kasan_populate_pte(kasan_early_shadow_pte, PAGE_KERNEL);
>>>> +	kasan_populate_pmd(kasan_early_shadow_pmd);
>>>> +	kasan_populate_pud(kasan_early_shadow_pud);
>>>> +
>>>> +	do {
>>>> +		pgd_populate(&init_mm, pgdp, kasan_early_shadow_pud);
>>>> +	} while (pgdp++, addr = pgd_addr_end(addr, end), addr != end);
>>>> +}
>>>> -- 
>>>> 2.13.3
