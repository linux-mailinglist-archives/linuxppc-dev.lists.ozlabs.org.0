Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D711134E093
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 07:16:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8d325wmSz30Kq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 16:16:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8d2j3tpWz302C
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 16:16:09 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F8d2Z43hyz9txNW;
 Tue, 30 Mar 2021 07:16:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id GUB6RdKLv-Ry; Tue, 30 Mar 2021 07:16:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F8d2Z2vCtz9txNV;
 Tue, 30 Mar 2021 07:16:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9DC598B7E7;
 Tue, 30 Mar 2021 07:16:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7SohxMLoE3vH; Tue, 30 Mar 2021 07:16:06 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EDC638B75B;
 Tue, 30 Mar 2021 07:16:05 +0200 (CEST)
Subject: Re: [PATCH v10 01/10] powerpc/mm: Implement set_memory() routines
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210330045132.722243-1-jniethe5@gmail.com>
 <20210330045132.722243-2-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1503da9e-b74e-b6d0-b5f3-a1648270e930@csgroup.eu>
Date: Tue, 30 Mar 2021 07:16:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210330045132.722243-2-jniethe5@gmail.com>
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, cmr@codefail.de,
 naveen.n.rao@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/03/2021 à 06:51, Jordan Niethe a écrit :
> From: Russell Currey <ruscur@russell.cc>
> 
> The set_memory_{ro/rw/nx/x}() functions are required for STRICT_MODULE_RWX,
> and are generally useful primitives to have.  This implementation is
> designed to be completely generic across powerpc's many MMUs.
> 
> It's possible that this could be optimised to be faster for specific
> MMUs, but the focus is on having a generic and safe implementation for
> now.
> 
> This implementation does not handle cases where the caller is attempting
> to change the mapping of the page it is executing from, or if another
> CPU is concurrently using the page being altered.  These cases likely
> shouldn't happen, but a more complex implementation with MMU-specific code
> could safely handle them, so that is left as a TODO for now.
> 
> On hash the linear mapping is not kept in the linux pagetable, so this
> will not change the protection if used on that range. Currently these
> functions are not used on the linear map so just WARN for now.
> 
> These functions do nothing if STRICT_KERNEL_RWX is not enabled.
> 
> Reviewed-by: Daniel Axtens <dja@axtens.net>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> [jpn: -rebase on next plus "powerpc/mm/64s: Allow STRICT_KERNEL_RWX again"
>        - WARN on hash linear map]
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v10: WARN if trying to change the hash linear map
> ---
>   arch/powerpc/Kconfig                  |  1 +
>   arch/powerpc/include/asm/set_memory.h | 32 ++++++++++
>   arch/powerpc/mm/Makefile              |  2 +-
>   arch/powerpc/mm/pageattr.c            | 88 +++++++++++++++++++++++++++
>   4 files changed, 122 insertions(+), 1 deletion(-)
>   create mode 100644 arch/powerpc/include/asm/set_memory.h
>   create mode 100644 arch/powerpc/mm/pageattr.c
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index fc7f5c5933e6..4498a27ac9db 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -135,6 +135,7 @@ config PPC
>   	select ARCH_HAS_MEMBARRIER_CALLBACKS
>   	select ARCH_HAS_MEMBARRIER_SYNC_CORE
>   	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
> +	select ARCH_HAS_SET_MEMORY
>   	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !HIBERNATION)
>   	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
>   	select ARCH_HAS_UACCESS_FLUSHCACHE
> diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/include/asm/set_memory.h
> new file mode 100644
> index 000000000000..64011ea444b4
> --- /dev/null
> +++ b/arch/powerpc/include/asm/set_memory.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_POWERPC_SET_MEMORY_H
> +#define _ASM_POWERPC_SET_MEMORY_H
> +
> +#define SET_MEMORY_RO	0
> +#define SET_MEMORY_RW	1
> +#define SET_MEMORY_NX	2
> +#define SET_MEMORY_X	3
> +
> +int change_memory_attr(unsigned long addr, int numpages, long action);
> +
> +static inline int set_memory_ro(unsigned long addr, int numpages)
> +{
> +	return change_memory_attr(addr, numpages, SET_MEMORY_RO);
> +}
> +
> +static inline int set_memory_rw(unsigned long addr, int numpages)
> +{
> +	return change_memory_attr(addr, numpages, SET_MEMORY_RW);
> +}
> +
> +static inline int set_memory_nx(unsigned long addr, int numpages)
> +{
> +	return change_memory_attr(addr, numpages, SET_MEMORY_NX);
> +}
> +
> +static inline int set_memory_x(unsigned long addr, int numpages)
> +{
> +	return change_memory_attr(addr, numpages, SET_MEMORY_X);
> +}
> +
> +#endif
> diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
> index 3b4e9e4e25ea..d8a08abde1ae 100644
> --- a/arch/powerpc/mm/Makefile
> +++ b/arch/powerpc/mm/Makefile
> @@ -5,7 +5,7 @@
>   
>   ccflags-$(CONFIG_PPC64)	:= $(NO_MINIMAL_TOC)
>   
> -obj-y				:= fault.o mem.o pgtable.o mmap.o maccess.o \
> +obj-y				:= fault.o mem.o pgtable.o mmap.o maccess.o pageattr.o \
>   				   init_$(BITS).o pgtable_$(BITS).o \
>   				   pgtable-frag.o ioremap.o ioremap_$(BITS).o \
>   				   init-common.o mmu_context.o drmem.o
> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> new file mode 100644
> index 000000000000..9efcb01088da
> --- /dev/null
> +++ b/arch/powerpc/mm/pageattr.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * MMU-generic set_memory implementation for powerpc
> + *
> + * Copyright 2019, IBM Corporation.
> + */
> +
> +#include <linux/mm.h>
> +#include <linux/set_memory.h>
> +
> +#include <asm/mmu.h>
> +#include <asm/page.h>
> +#include <asm/pgtable.h>
> +
> +
> +/*
> + * Updates the attributes of a page in three steps:
> + *
> + * 1. invalidate the page table entry
> + * 2. flush the TLB
> + * 3. install the new entry with the updated attributes
> + *
> + * This is unsafe if the caller is attempting to change the mapping of the
> + * page it is executing from, or if another CPU is concurrently using the
> + * page being altered.
> + *
> + * TODO make the implementation resistant to this.
> + *
> + * NOTE: can be dangerous to call without STRICT_KERNEL_RWX
> + */
> +static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
> +{
> +	long action = (long)data;
> +	pte_t pte;
> +
> +	spin_lock(&init_mm.page_table_lock);
> +
> +	/* invalidate the PTE so it's safe to modify */
> +	pte = ptep_get_and_clear(&init_mm, addr, ptep);
> +	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +
> +	/* modify the PTE bits as desired, then apply */
> +	switch (action) {
> +	case SET_MEMORY_RO:
> +		pte = pte_wrprotect(pte);
> +		break;
> +	case SET_MEMORY_RW:
> +		pte = pte_mkwrite(pte);
> +		break;
> +	case SET_MEMORY_NX:
> +		pte = pte_exprotect(pte);
> +		break;
> +	case SET_MEMORY_X:
> +		pte = pte_mkexec(pte);
> +		break;
> +	default:
> +		WARN_ON_ONCE(1);
> +		break;
> +	}
> +
> +	set_pte_at(&init_mm, addr, ptep, pte);
> +	spin_unlock(&init_mm.page_table_lock);
> +
> +	return 0;
> +}
> +
> +int change_memory_attr(unsigned long addr, int numpages, long action)
> +{
> +	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
> +	unsigned long sz = numpages * PAGE_SIZE;
> +
> +	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> +		return 0;

You should do this in the header file in order to get it optimised out completely when 
CONFIG_STRICT_KERNEL_RWX is not set.

In asm/set_memory.h you could have:

#ifdef CONFIG_STRICT_KERNEL_RWX
int change_memory_attr(unsigned long addr, int numpages, long action);
#else
static inline int change_memory_attr(unsigned long addr, int numpages, long action) { return 0; }
#endif

Or another solution is to only define ARCH_HAS_SET_MEMORY when CONFIG_STRICT_KERNEL_RWX is selected.

> +
> +	if (numpages <= 0)
> +		return 0;
> +
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	if (WARN_ON_ONCE(!radix_enabled() &&
> +		     get_region_id(addr) == LINEAR_MAP_REGION_ID)) {
> +		return -1;
> +	}
> +#endif
> +
> +	return apply_to_existing_page_range(&init_mm, start, sz,
> +					    change_page_attr, (void *)action);
> +}
> 
