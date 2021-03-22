Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5183448F9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 16:15:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3yjV0mRnz2y0J
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:15:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3yj46FNCz2xxg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 02:14:46 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F3yhs4zWFz9tx56;
 Mon, 22 Mar 2021 16:14:37 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xrFnyo3xBiDa; Mon, 22 Mar 2021 16:14:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F3yhs3WhLz9tx55;
 Mon, 22 Mar 2021 16:14:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E78BA8B7A4;
 Mon, 22 Mar 2021 16:14:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GS3w4eeKc7cM; Mon, 22 Mar 2021 16:14:42 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 435378B79C;
 Mon, 22 Mar 2021 16:14:42 +0100 (CET)
Subject: Re: [PATCH v11 6/6] powerpc: Book3S 64-bit outline-only KASAN support
To: Daniel Axtens <dja@axtens.net>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 kasan-dev@googlegroups.com, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
References: <20210319144058.772525-1-dja@axtens.net>
 <20210319144058.772525-7-dja@axtens.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <24abf728-3070-c482-7623-ad575a4de809@csgroup.eu>
Date: Mon, 22 Mar 2021 16:14:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210319144058.772525-7-dja@axtens.net>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/03/2021 à 15:40, Daniel Axtens a écrit :
> Implement a limited form of KASAN for Book3S 64-bit machines running under
> the Radix MMU, supporting only outline mode.
> 
>   - Enable the compiler instrumentation to check addresses and maintain the
>     shadow region. (This is the guts of KASAN which we can easily reuse.)
> 
>   - Require kasan-vmalloc support to handle modules and anything else in
>     vmalloc space.
> 
>   - KASAN needs to be able to validate all pointer accesses, but we can't
>     instrument all kernel addresses - only linear map and vmalloc. On boot,
>     set up a single page of read-only shadow that marks all iomap and
>     vmemmap accesses as valid.
> 
>   - Make our stack-walking code KASAN-safe by using READ_ONCE_NOCHECK -
>     generic code, arm64, s390 and x86 all do this for similar sorts of
>     reasons: when unwinding a stack, we might touch memory that KASAN has
>     marked as being out-of-bounds. In our case we often get this when
>     checking for an exception frame because we're checking an arbitrary
>     offset into the stack frame.
> 
>     See commit 20955746320e ("s390/kasan: avoid false positives during stack
>     unwind"), commit bcaf669b4bdb ("arm64: disable kasan when accessing
>     frame->fp in unwind_frame"), commit 91e08ab0c851 ("x86/dumpstack:
>     Prevent KASAN false positive warnings") and commit 6e22c8366416
>     ("tracing, kasan: Silence Kasan warning in check_stack of stack_tracer")
> 
>   - Document KASAN in both generic and powerpc docs.
> 
> Background
> ----------
> 
> KASAN support on Book3S is a bit tricky to get right:
> 
>   - It would be good to support inline instrumentation so as to be able to
>     catch stack issues that cannot be caught with outline mode.
> 
>   - Inline instrumentation requires a fixed offset.
> 
>   - Book3S runs code with translations off ("real mode") during boot,
>     including a lot of generic device-tree parsing code which is used to
>     determine MMU features.
> 
>      [ppc64 mm note: The kernel installs a linear mapping at effective
>      address c000...-c008.... This is a one-to-one mapping with physical
>      memory from 0000... onward. Because of how memory accesses work on
>      powerpc 64-bit Book3S, a kernel pointer in the linear map accesses the
>      same memory both with translations on (accessing as an 'effective
>      address'), and with translations off (accessing as a 'real
>      address'). This works in both guests and the hypervisor. For more
>      details, see s5.7 of Book III of version 3 of the ISA, in particular
>      the Storage Control Overview, s5.7.3, and s5.7.5 - noting that this
>      KASAN implementation currently only supports Radix.]
> 
>   - Some code - most notably a lot of KVM code - also runs with translations
>     off after boot.
> 
>   - Therefore any offset has to point to memory that is valid with
>     translations on or off.
> 
> One approach is just to give up on inline instrumentation. This way
> boot-time checks can be delayed until after the MMU is set is up, and we
> can just not instrument any code that runs with translations off after
> booting. Take this approach for now and require outline instrumentation.
> 
> Previous attempts allowed inline instrumentation. However, they came with
> some unfortunate restrictions: only physically contiguous memory could be
> used and it had to be specified at compile time. Maybe we can do better in
> the future.
> 
> Cc: Balbir Singh <bsingharora@gmail.com> # ppc64 out-of-line radix version
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> # ppc64 hash version
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu> # ppc32 version
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> ---

> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 6084fa499aa3..163755b1cef4 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -32,6 +32,17 @@ KASAN_SANITIZE_early_32.o := n
>   KASAN_SANITIZE_cputable.o := n
>   KASAN_SANITIZE_prom_init.o := n
>   KASAN_SANITIZE_btext.o := n
> +KASAN_SANITIZE_paca.o := n
> +KASAN_SANITIZE_setup_64.o := n
> +KASAN_SANITIZE_mce.o := n
> +KASAN_SANITIZE_mce_power.o := n
> +
> +# we have to be particularly careful in ppc64 to exclude code that
> +# runs with translations off, as we cannot access the shadow with
> +# translations off. However, ppc32 can sanitize this.

Which functions of this file can run with translations off on PPC64 ?
On PPC32 no functions run with translation off.

> +ifdef CONFIG_PPC64
> +KASAN_SANITIZE_traps.o := n
> +endif
>   
>   ifdef CONFIG_KASAN
>   CFLAGS_early_32.o += -DDISABLE_BRANCH_PROFILING
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 3231c2df9e26..d4ae21b9e9b7 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -2160,8 +2160,8 @@ void show_stack(struct task_struct *tsk, unsigned long *stack,
>   			break;
>   
>   		stack = (unsigned long *) sp;
> -		newsp = stack[0];
> -		ip = stack[STACK_FRAME_LR_SAVE];
> +		newsp = READ_ONCE_NOCHECK(stack[0]);
> +		ip = READ_ONCE_NOCHECK(stack[STACK_FRAME_LR_SAVE]);
>   		if (!firstframe || ip != lr) {
>   			printk("%s["REG"] ["REG"] %pS",
>   				loglvl, sp, ip, (void *)ip);
> @@ -2179,17 +2179,19 @@ void show_stack(struct task_struct *tsk, unsigned long *stack,
>   		 * See if this is an exception frame.
>   		 * We look for the "regshere" marker in the current frame.
>   		 */
> -		if (validate_sp(sp, tsk, STACK_FRAME_WITH_PT_REGS)
> -		    && stack[STACK_FRAME_MARKER] == STACK_FRAME_REGS_MARKER) {
> +		if (validate_sp(sp, tsk, STACK_FRAME_WITH_PT_REGS) &&
> +		    (READ_ONCE_NOCHECK(stack[STACK_FRAME_MARKER]) ==
> +		     STACK_FRAME_REGS_MARKER)) {
>   			struct pt_regs *regs = (struct pt_regs *)
>   				(sp + STACK_FRAME_OVERHEAD);
>   
> -			lr = regs->link;
> +			lr = READ_ONCE_NOCHECK(regs->link);
>   			printk("%s--- interrupt: %lx at %pS\n",
> -			       loglvl, regs->trap, (void *)regs->nip);
> +			       loglvl, READ_ONCE_NOCHECK(regs->trap),
> +			       (void *)READ_ONCE_NOCHECK(regs->nip));
>   			__show_regs(regs);
>   			printk("%s--- interrupt: %lx\n",
> -			       loglvl, regs->trap);
> +			       loglvl, READ_ONCE_NOCHECK(regs->trap));
>   
>   			firstframe = 1;
>   		}


All changes in that file look more as a bug fix than a thing special for PPC64 KASAN. Could it be a 
separate patch ?


> diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
> index 2bfeaa13befb..7f1592dacbeb 100644
> --- a/arch/powerpc/kvm/Makefile
> +++ b/arch/powerpc/kvm/Makefile
> @@ -136,3 +136,8 @@ obj-$(CONFIG_KVM_BOOK3S_64_PR) += kvm-pr.o
>   obj-$(CONFIG_KVM_BOOK3S_64_HV) += kvm-hv.o
>   
>   obj-y += $(kvm-book3s_64-builtin-objs-y)
> +
> +# KVM does a lot in real-mode, and 64-bit Book3S KASAN doesn't support that
> +ifdef CONFIG_PPC_BOOK3S_64
> +KASAN_SANITIZE := n
> +endif
> diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
> index 1b56d3af47d4..a7d8a68bd2c5 100644
> --- a/arch/powerpc/mm/book3s64/Makefile
> +++ b/arch/powerpc/mm/book3s64/Makefile
> @@ -21,3 +21,12 @@ obj-$(CONFIG_PPC_PKEY)	+= pkeys.o
>   
>   # Instrumenting the SLB fault path can lead to duplicate SLB entries
>   KCOV_INSTRUMENT_slb.o := n
> +
> +# Parts of these can run in real mode and therefore are
> +# not safe with the current outline KASAN implementation
> +KASAN_SANITIZE_mmu_context.o := n
> +KASAN_SANITIZE_pgtable.o := n
> +KASAN_SANITIZE_radix_pgtable.o := n
> +KASAN_SANITIZE_radix_tlb.o := n
> +KASAN_SANITIZE_slb.o := n
> +KASAN_SANITIZE_pkeys.o := n
> diff --git a/arch/powerpc/mm/kasan/Makefile b/arch/powerpc/mm/kasan/Makefile
> index 42fb628a44fd..07eef87abd6c 100644
> --- a/arch/powerpc/mm/kasan/Makefile
> +++ b/arch/powerpc/mm/kasan/Makefile
> @@ -5,3 +5,4 @@ KASAN_SANITIZE := n
>   obj-$(CONFIG_PPC32)           += init_32.o
>   obj-$(CONFIG_PPC_8xx)		+= 8xx.o
>   obj-$(CONFIG_PPC_BOOK3S_32)	+= book3s_32.o
> +obj-$(CONFIG_PPC_BOOK3S_64)   += init_book3s_64.o
> diff --git a/arch/powerpc/mm/kasan/init_book3s_64.c b/arch/powerpc/mm/kasan/init_book3s_64.c
> new file mode 100644
> index 000000000000..ca913ed951a2
> --- /dev/null
> +++ b/arch/powerpc/mm/kasan/init_book3s_64.c
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KASAN for 64-bit Book3S powerpc
> + *
> + * Copyright (C) 2019-2020 IBM Corporation
> + * Author: Daniel Axtens <dja@axtens.net>
> + */
> +
> +#define DISABLE_BRANCH_PROFILING
> +
> +#include <linux/kasan.h>
> +#include <linux/printk.h>
> +#include <linux/sched/task.h>
> +#include <linux/memblock.h>
> +#include <asm/pgalloc.h>
> +
> +DEFINE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
> +
> +static void __init kasan_init_phys_region(void *start, void *end)
> +{
> +	unsigned long k_start, k_end, k_cur;
> +	void *va;
> +
> +	if (start >= end)
> +		return;
> +
> +	k_start = ALIGN_DOWN((unsigned long)kasan_mem_to_shadow(start), PAGE_SIZE);
> +	k_end = ALIGN((unsigned long)kasan_mem_to_shadow(end), PAGE_SIZE);
> +
> +	va = memblock_alloc(k_end - k_start, PAGE_SIZE);
> +	for (k_cur = k_start; k_cur < k_end; k_cur += PAGE_SIZE, va += PAGE_SIZE)
> +		map_kernel_page(k_cur, __pa(va), PAGE_KERNEL);
> +}
> +
> +void __init kasan_init(void)
> +{
> +	/*
> +	 * We want to do the following things:
> +	 *  1) Map real memory into the shadow for all physical memblocks
> +	 *     This takes us from c000... to c008...
> +	 *  2) Leave a hole over the shadow of vmalloc space. KASAN_VMALLOC
> +	 *     will manage this for us.
> +	 *     This takes us from c008... to c00a...
> +	 *  3) Map the 'early shadow'/zero page over iomap and vmemmap space.
> +	 *     This takes us up to where we start at c00e...
> +	 */
> +
> +	void *k_start = kasan_mem_to_shadow((void *)RADIX_VMALLOC_END);
> +	void *k_end = kasan_mem_to_shadow((void *)RADIX_VMEMMAP_END);
> +	phys_addr_t start, end;
> +	u64 i;
> +	pte_t zero_pte = pfn_pte(virt_to_pfn(kasan_early_shadow_page), PAGE_KERNEL);
> +
> +	if (!early_radix_enabled())
> +		panic("KASAN requires radix!");
> +
> +	for_each_mem_range(i, &start, &end)
> +		kasan_init_phys_region((void *)start, (void *)end);
> +
> +	for (i = 0; i < PTRS_PER_PTE; i++)
> +		__set_pte_at(&init_mm, (unsigned long)kasan_early_shadow_page,
> +			     &kasan_early_shadow_pte[i], zero_pte, 0);
> +
> +	for (i = 0; i < PTRS_PER_PMD; i++)
> +		pmd_populate_kernel(&init_mm, &kasan_early_shadow_pmd[i],
> +				    kasan_early_shadow_pte);
> +
> +	for (i = 0; i < PTRS_PER_PUD; i++)
> +		pud_populate(&init_mm, &kasan_early_shadow_pud[i],
> +			     kasan_early_shadow_pmd);
> +
> +	/* map the early shadow over the iomap and vmemmap space */
> +	kasan_populate_early_shadow(k_start, k_end);
> +
> +	/* mark early shadow region as RO and wipe it */
> +	zero_pte = pfn_pte(virt_to_pfn(kasan_early_shadow_page), PAGE_KERNEL_RO);
> +	for (i = 0; i < PTRS_PER_PTE; i++)
> +		__set_pte_at(&init_mm, (unsigned long)kasan_early_shadow_page,
> +			     &kasan_early_shadow_pte[i], zero_pte, 0);
> +
> +	/*
> +	 * clear_page relies on some cache info that hasn't been set up yet.
> +	 * It ends up looping ~forever and blows up other data.
> +	 * Use memset instead.
> +	 */
> +	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
> +
> +	static_branch_inc(&powerpc_kasan_enabled_key);
> +
> +	/* Enable error messages */
> +	init_task.kasan_depth = 0;
> +	pr_info("KASAN init done (64-bit Book3S)\n");
> +}
> +
> +void __init kasan_late_init(void) { }
> diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
> index aca354fb670b..63672aa656e8 100644
> --- a/arch/powerpc/mm/ptdump/ptdump.c
> +++ b/arch/powerpc/mm/ptdump/ptdump.c
> @@ -20,6 +20,7 @@
>   #include <linux/seq_file.h>
>   #include <asm/fixmap.h>
>   #include <linux/const.h>
> +#include <linux/kasan.h>
>   #include <asm/page.h>
>   #include <asm/hugetlb.h>
>   
> @@ -317,6 +318,23 @@ static void walk_pud(struct pg_state *st, p4d_t *p4d, unsigned long start)
>   	unsigned long addr;
>   	unsigned int i;
>   
> +#if defined(CONFIG_KASAN) && defined(CONFIG_PPC_BOOK3S_64)
> +	/*
> +	 * On radix + KASAN, we want to check for the KASAN "early" shadow
> +	 * which covers huge quantities of memory with the same set of
> +	 * read-only PTEs. If it is, we want to note the first page (to see
> +	 * the status change), and then note the last page. This gives us good
> +	 * results without spending ages noting the exact same PTEs over 100s of
> +	 * terabytes of memory.
> +	 */

Could you use huge pages to map shadow memory ?

We do that on PPC32 now.

> +	if (p4d_page(*p4d) == virt_to_page(lm_alias(kasan_early_shadow_pud))) {
> +		walk_pmd(st, pud, start);
> +		addr = start + (PTRS_PER_PUD - 1) * PUD_SIZE;
> +		walk_pmd(st, pud, addr);
> +		return;
> +	}
> +#endif
> +
>   	for (i = 0; i < PTRS_PER_PUD; i++, pud++) {
>   		addr = start + i * PUD_SIZE;
>   		if (!pud_none(*pud) && !pud_is_leaf(*pud))
> @@ -387,11 +405,11 @@ static void populate_markers(void)
>   #endif
>   	address_markers[i++].start_address = FIXADDR_START;
>   	address_markers[i++].start_address = FIXADDR_TOP;
> +#endif /* CONFIG_PPC64 */
>   #ifdef CONFIG_KASAN
>   	address_markers[i++].start_address = KASAN_SHADOW_START;
>   	address_markers[i++].start_address = KASAN_SHADOW_END;
>   #endif
> -#endif /* CONFIG_PPC64 */
>   }
>   
>   static int ptdump_show(struct seq_file *m, void *v)
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 3ce907523b1e..9063c13e7221 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -101,6 +101,7 @@ config PPC_BOOK3S_64
>   	select ARCH_SUPPORTS_NUMA_BALANCING
>   	select IRQ_WORK
>   	select PPC_MM_SLICES
> +	select KASAN_VMALLOC if KASAN
>   
>   config PPC_BOOK3E_64
>   	bool "Embedded processors"
> diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
> index 2eb6ae150d1f..f277e4793696 100644
> --- a/arch/powerpc/platforms/powernv/Makefile
> +++ b/arch/powerpc/platforms/powernv/Makefile
> @@ -1,4 +1,10 @@
>   # SPDX-License-Identifier: GPL-2.0
> +
> +# nothing that deals with real mode is safe to KASAN
> +# in particular, idle code runs a bunch of things in real mode
> +KASAN_SANITIZE_idle.o := n
> +KASAN_SANITIZE_pci-ioda.o := n
> +
>   obj-y			+= setup.o opal-call.o opal-wrappers.o opal.o opal-async.o
>   obj-y			+= idle.o opal-rtc.o opal-nvram.o opal-lpc.o opal-flash.o
>   obj-y			+= rng.o opal-elog.o opal-dump.o opal-sysparam.o opal-sensor.o
> diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
> index c8a2b0b05ac0..202199ef9e5c 100644
> --- a/arch/powerpc/platforms/pseries/Makefile
> +++ b/arch/powerpc/platforms/pseries/Makefile
> @@ -30,3 +30,6 @@ obj-$(CONFIG_PPC_SVM)		+= svm.o
>   obj-$(CONFIG_FA_DUMP)		+= rtas-fadump.o
>   
>   obj-$(CONFIG_SUSPEND)		+= suspend.o
> +
> +# nothing that operates in real mode is safe for KASAN
> +KASAN_SANITIZE_ras.o := n
> 

Christophe
