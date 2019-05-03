Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF7C12831
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 08:55:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wNDl651YzDqX2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 16:55:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="c9VxYGjC"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wN832CDKzDqR1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:51:15 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44wN7z1Y1bz9v0XS;
 Fri,  3 May 2019 08:51:11 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=c9VxYGjC; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id KXN4wYVtsAaN; Fri,  3 May 2019 08:51:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44wN7z0PPJz9tytc;
 Fri,  3 May 2019 08:51:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556866271; bh=GT99LV8Z525zndega9MtAhPQMhcaNvpNWfMKvpkHrw4=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=c9VxYGjChvPUhpYBgU9n2Hgh5pnx4mHoVQNEpWDY+fYAMWPPzqA6ErSyPUKJ/E16i
 goUQTw5aglmC/64z4cGWng4mIT86awPl6Rk9GIYjUOHIM+uXCwBVEeRaleaCi39VNg
 ghVXxGzTx1cpFcdAdndwjEz4mfIF/bDHf/Lf2q/E=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EFF948B825;
 Fri,  3 May 2019 08:51:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nc1kRj3E7n09; Fri,  3 May 2019 08:51:11 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B404E8B819;
 Fri,  3 May 2019 08:51:11 +0200 (CEST)
Subject: Re: [PATCH v11 10/13] powerpc/32: Add KASAN support
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Daniel Axtens <dja@axtens.net>
References: <cover.1556295459.git.christophe.leroy@c-s.fr>
 <c08fe3fee59343ebf76fd7ea0de11f4ad07a1d6e.1556295461.git.christophe.leroy@c-s.fr>
Message-ID: <e3b1f65f-6b3b-1ae8-3a3c-13b750bcc810@c-s.fr>
Date: Fri, 3 May 2019 08:51:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c08fe3fee59343ebf76fd7ea0de11f4ad07a1d6e.1556295461.git.christophe.leroy@c-s.fr>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/04/2019 à 18:23, Christophe Leroy a écrit :
> This patch adds KASAN support for PPC32. The following patch
> will add an early activation of hash table for book3s. Until
> then, a warning will be raised if trying to use KASAN on an
> hash 6xx.
> 
> To support KASAN, this patch initialises that MMU mapings for
> accessing to the KASAN shadow area defined in a previous patch.
> 
> An early mapping is set as soon as the kernel code has been
> relocated at its definitive place.
> 
> Then the definitive mapping is set once paging is initialised.
> 
> For modules, the shadow area is allocated at module_alloc().
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>   arch/powerpc/Kconfig                  |   1 +
>   arch/powerpc/include/asm/kasan.h      |   9 ++
>   arch/powerpc/kernel/head_32.S         |   3 +
>   arch/powerpc/kernel/head_40x.S        |   3 +
>   arch/powerpc/kernel/head_44x.S        |   3 +
>   arch/powerpc/kernel/head_8xx.S        |   3 +
>   arch/powerpc/kernel/head_fsl_booke.S  |   3 +
>   arch/powerpc/kernel/setup-common.c    |   3 +
>   arch/powerpc/mm/Makefile              |   1 +
>   arch/powerpc/mm/init_32.c             |   3 +
>   arch/powerpc/mm/kasan/Makefile        |   5 ++

Looks like the above Makefile is missing in powerpc/next ???

Christophe

>   arch/powerpc/mm/kasan/kasan_init_32.c | 156 ++++++++++++++++++++++++++++++++++
>   12 files changed, 193 insertions(+)
>   create mode 100644 arch/powerpc/mm/kasan/Makefile
>   create mode 100644 arch/powerpc/mm/kasan/kasan_init_32.c
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index a7c80f2b08b5..1a2fb50126b2 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -173,6 +173,7 @@ config PPC
>   	select GENERIC_TIME_VSYSCALL
>   	select HAVE_ARCH_AUDITSYSCALL
>   	select HAVE_ARCH_JUMP_LABEL
> +	select HAVE_ARCH_KASAN			if PPC32
>   	select HAVE_ARCH_KGDB
>   	select HAVE_ARCH_MMAP_RND_BITS
>   	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
> diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
> index 05274dea3109..296e51c2f066 100644
> --- a/arch/powerpc/include/asm/kasan.h
> +++ b/arch/powerpc/include/asm/kasan.h
> @@ -27,5 +27,14 @@
>   
>   #define KASAN_SHADOW_SIZE	(KASAN_SHADOW_END - KASAN_SHADOW_START)
>   
> +#ifdef CONFIG_KASAN
> +void kasan_early_init(void);
> +void kasan_mmu_init(void);
> +void kasan_init(void);
> +#else
> +static inline void kasan_init(void) { }
> +static inline void kasan_mmu_init(void) { }
> +#endif
> +
>   #endif /* __ASSEMBLY */
>   #endif
> diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
> index 40aec3f00a05..6e85171e513c 100644
> --- a/arch/powerpc/kernel/head_32.S
> +++ b/arch/powerpc/kernel/head_32.S
> @@ -969,6 +969,9 @@ start_here:
>    * Do early platform-specific initialization,
>    * and set up the MMU.
>    */
> +#ifdef CONFIG_KASAN
> +	bl	kasan_early_init
> +#endif
>   	li	r3,0
>   	mr	r4,r31
>   	bl	machine_init
> diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
> index a9c934f2319b..efa219d2136e 100644
> --- a/arch/powerpc/kernel/head_40x.S
> +++ b/arch/powerpc/kernel/head_40x.S
> @@ -848,6 +848,9 @@ start_here:
>   /*
>    * Decide what sort of machine this is and initialize the MMU.
>    */
> +#ifdef CONFIG_KASAN
> +	bl	kasan_early_init
> +#endif
>   	li	r3,0
>   	mr	r4,r31
>   	bl	machine_init
> diff --git a/arch/powerpc/kernel/head_44x.S b/arch/powerpc/kernel/head_44x.S
> index 37117ab11584..34a5df827b38 100644
> --- a/arch/powerpc/kernel/head_44x.S
> +++ b/arch/powerpc/kernel/head_44x.S
> @@ -203,6 +203,9 @@ _ENTRY(_start);
>   /*
>    * Decide what sort of machine this is and initialize the MMU.
>    */
> +#ifdef CONFIG_KASAN
> +	bl	kasan_early_init
> +#endif
>   	li	r3,0
>   	mr	r4,r31
>   	bl	machine_init
> diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
> index 03c73b4c6435..d25adb6ef235 100644
> --- a/arch/powerpc/kernel/head_8xx.S
> +++ b/arch/powerpc/kernel/head_8xx.S
> @@ -853,6 +853,9 @@ start_here:
>   /*
>    * Decide what sort of machine this is and initialize the MMU.
>    */
> +#ifdef CONFIG_KASAN
> +	bl	kasan_early_init
> +#endif
>   	li	r3,0
>   	mr	r4,r31
>   	bl	machine_init
> diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
> index 32332e24e421..567e0ed45ca8 100644
> --- a/arch/powerpc/kernel/head_fsl_booke.S
> +++ b/arch/powerpc/kernel/head_fsl_booke.S
> @@ -268,6 +268,9 @@ set_ivor:
>   /*
>    * Decide what sort of machine this is and initialize the MMU.
>    */
> +#ifdef CONFIG_KASAN
> +	bl	kasan_early_init
> +#endif
>   	mr	r3,r30
>   	mr	r4,r31
>   	bl	machine_init
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index 1729bf409562..15afb01b4374 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -67,6 +67,7 @@
>   #include <asm/livepatch.h>
>   #include <asm/mmu_context.h>
>   #include <asm/cpu_has_feature.h>
> +#include <asm/kasan.h>
>   
>   #include "setup.h"
>   
> @@ -871,6 +872,8 @@ static void smp_setup_pacas(void)
>    */
>   void __init setup_arch(char **cmdline_p)
>   {
> +	kasan_init();
> +
>   	*cmdline_p = boot_command_line;
>   
>   	/* Set a half-reasonable default so udelay does something sensible */
> diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
> index dd945ca869b2..01afb10a7b33 100644
> --- a/arch/powerpc/mm/Makefile
> +++ b/arch/powerpc/mm/Makefile
> @@ -53,6 +53,7 @@ obj-$(CONFIG_PPC_COPRO_BASE)	+= copro_fault.o
>   obj-$(CONFIG_SPAPR_TCE_IOMMU)	+= mmu_context_iommu.o
>   obj-$(CONFIG_PPC_PTDUMP)	+= ptdump/
>   obj-$(CONFIG_PPC_MEM_KEYS)	+= pkeys.o
> +obj-$(CONFIG_KASAN)		+= kasan/
>   
>   # Disable kcov instrumentation on sensitive code
>   # This is necessary for booting with kcov enabled on book3e machines
> diff --git a/arch/powerpc/mm/init_32.c b/arch/powerpc/mm/init_32.c
> index 80cc97cd8878..5b61673e7eed 100644
> --- a/arch/powerpc/mm/init_32.c
> +++ b/arch/powerpc/mm/init_32.c
> @@ -46,6 +46,7 @@
>   #include <asm/sections.h>
>   #include <asm/hugetlb.h>
>   #include <asm/kup.h>
> +#include <asm/kasan.h>
>   
>   #include "mmu_decl.h"
>   
> @@ -179,6 +180,8 @@ void __init MMU_init(void)
>   	btext_unmap();
>   #endif
>   
> +	kasan_mmu_init();
> +
>   	setup_kup();
>   
>   	/* Shortly after that, the entire linear mapping will be available */
> diff --git a/arch/powerpc/mm/kasan/Makefile b/arch/powerpc/mm/kasan/Makefile
> new file mode 100644
> index 000000000000..6577897673dd
> --- /dev/null
> +++ b/arch/powerpc/mm/kasan/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +KASAN_SANITIZE := n
> +
> +obj-$(CONFIG_PPC32)           += kasan_init_32.o
> diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
> new file mode 100644
> index 000000000000..42617fcad828
> --- /dev/null
> +++ b/arch/powerpc/mm/kasan/kasan_init_32.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#define DISABLE_BRANCH_PROFILING
> +
> +#include <linux/kasan.h>
> +#include <linux/printk.h>
> +#include <linux/memblock.h>
> +#include <linux/sched/task.h>
> +#include <linux/vmalloc.h>
> +#include <asm/pgalloc.h>
> +#include <asm/code-patching.h>
> +#include <mm/mmu_decl.h>
> +
> +static void kasan_populate_pte(pte_t *ptep, pgprot_t prot)
> +{
> +	unsigned long va = (unsigned long)kasan_early_shadow_page;
> +	phys_addr_t pa = __pa(kasan_early_shadow_page);
> +	int i;
> +
> +	for (i = 0; i < PTRS_PER_PTE; i++, ptep++)
> +		__set_pte_at(&init_mm, va, ptep, pfn_pte(PHYS_PFN(pa), prot), 0);
> +}
> +
> +static int kasan_init_shadow_page_tables(unsigned long k_start, unsigned long k_end)
> +{
> +	pmd_t *pmd;
> +	unsigned long k_cur, k_next;
> +
> +	pmd = pmd_offset(pud_offset(pgd_offset_k(k_start), k_start), k_start);
> +
> +	for (k_cur = k_start; k_cur != k_end; k_cur = k_next, pmd++) {
> +		pte_t *new;
> +
> +		k_next = pgd_addr_end(k_cur, k_end);
> +		if ((void *)pmd_page_vaddr(*pmd) != kasan_early_shadow_pte)
> +			continue;
> +
> +		new = pte_alloc_one_kernel(&init_mm);
> +
> +		if (!new)
> +			return -ENOMEM;
> +		kasan_populate_pte(new, PAGE_KERNEL_RO);
> +		pmd_populate_kernel(&init_mm, pmd, new);
> +	}
> +	return 0;
> +}
> +
> +static void __ref *kasan_get_one_page(void)
> +{
> +	if (slab_is_available())
> +		return (void *)__get_free_page(GFP_KERNEL | __GFP_ZERO);
> +
> +	return memblock_alloc(PAGE_SIZE, PAGE_SIZE);
> +}
> +
> +static int __ref kasan_init_region(void *start, size_t size)
> +{
> +	unsigned long k_start = (unsigned long)kasan_mem_to_shadow(start);
> +	unsigned long k_end = (unsigned long)kasan_mem_to_shadow(start + size);
> +	unsigned long k_cur;
> +	int ret;
> +	void *block = NULL;
> +
> +	ret = kasan_init_shadow_page_tables(k_start, k_end);
> +	if (ret)
> +		return ret;
> +
> +	if (!slab_is_available())
> +		block = memblock_alloc(k_end - k_start, PAGE_SIZE);
> +
> +	for (k_cur = k_start; k_cur < k_end; k_cur += PAGE_SIZE) {
> +		pmd_t *pmd = pmd_offset(pud_offset(pgd_offset_k(k_cur), k_cur), k_cur);
> +		void *va = block ? block + k_cur - k_start : kasan_get_one_page();
> +		pte_t pte = pfn_pte(PHYS_PFN(__pa(va)), PAGE_KERNEL);
> +
> +		if (!va)
> +			return -ENOMEM;
> +
> +		__set_pte_at(&init_mm, k_cur, pte_offset_kernel(pmd, k_cur), pte, 0);
> +	}
> +	flush_tlb_kernel_range(k_start, k_end);
> +	return 0;
> +}
> +
> +static void __init kasan_remap_early_shadow_ro(void)
> +{
> +	kasan_populate_pte(kasan_early_shadow_pte, PAGE_KERNEL_RO);
> +
> +	flush_tlb_kernel_range(KASAN_SHADOW_START, KASAN_SHADOW_END);
> +}
> +
> +void __init kasan_mmu_init(void)
> +{
> +	int ret;
> +	struct memblock_region *reg;
> +
> +	for_each_memblock(memory, reg) {
> +		phys_addr_t base = reg->base;
> +		phys_addr_t top = min(base + reg->size, total_lowmem);
> +
> +		if (base >= top)
> +			continue;
> +
> +		ret = kasan_init_region(__va(base), top - base);
> +		if (ret)
> +			panic("kasan: kasan_init_region() failed");
> +	}
> +}
> +
> +void __init kasan_init(void)
> +{
> +	kasan_remap_early_shadow_ro();
> +
> +	clear_page(kasan_early_shadow_page);
> +
> +	/* At this point kasan is fully initialized. Enable error messages */
> +	init_task.kasan_depth = 0;
> +	pr_info("KASAN init done\n");
> +}
> +
> +#ifdef CONFIG_MODULES
> +void *module_alloc(unsigned long size)
> +{
> +	void *base = vmalloc_exec(size);
> +
> +	if (!base)
> +		return NULL;
> +
> +	if (!kasan_init_region(base, size))
> +		return base;
> +
> +	vfree(base);
> +
> +	return NULL;
> +}
> +#endif
> +
> +void __init kasan_early_init(void)
> +{
> +	unsigned long addr = KASAN_SHADOW_START;
> +	unsigned long end = KASAN_SHADOW_END;
> +	unsigned long next;
> +	pmd_t *pmd = pmd_offset(pud_offset(pgd_offset_k(addr), addr), addr);
> +
> +	BUILD_BUG_ON(KASAN_SHADOW_START & ~PGDIR_MASK);
> +
> +	kasan_populate_pte(kasan_early_shadow_pte, PAGE_KERNEL);
> +
> +	do {
> +		next = pgd_addr_end(addr, end);
> +		pmd_populate_kernel(&init_mm, pmd, kasan_early_shadow_pte);
> +	} while (pmd++, addr = next, addr != end);
> +
> +	if (early_mmu_has_feature(MMU_FTR_HPTE_TABLE))
> +		WARN(true, "KASAN not supported on hash 6xx");
> +}
> 
