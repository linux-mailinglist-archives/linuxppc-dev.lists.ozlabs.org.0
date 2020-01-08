Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCEC13428B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 13:57:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47t8Ql5TXDzDqPR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 23:57:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="ASFa2eXL"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47t8Kf4rJtzDqB2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 23:52:36 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47t8KW0bL1z9v3s7;
 Wed,  8 Jan 2020 13:52:31 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ASFa2eXL; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id WvWtbz_GORpc; Wed,  8 Jan 2020 13:52:31 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47t8KV6Yq9z9v3s6;
 Wed,  8 Jan 2020 13:52:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1578487950; bh=iCpiM9yluessuiYMXd5X7atJK0djf+rAMLGayXAybJY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ASFa2eXLWtuvkoA3HFs717Tpvt+FYx1aOmCNjvDkpkLoeMYpEKhdHW+PV9M6i5vrV
 cK5FBo/ZAM5lXS0bdKiFqsMmgA0bA6qEPmEwYTqJkjNP4CH9rrBrmZOWG7Jj3R8z/p
 zrCJSVP1I8RTabfLtriKnqZj+azZBrWEx6zr6adc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1D46B8B808;
 Wed,  8 Jan 2020 13:52:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id roO02oPFIkFt; Wed,  8 Jan 2020 13:52:32 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DD7BA8B7EA;
 Wed,  8 Jan 2020 13:52:31 +0100 (CET)
Subject: Re: [PATCH v6 1/5] powerpc/mm: Implement set_memory() routines
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
References: <20191224055545.178462-1-ruscur@russell.cc>
 <20191224055545.178462-2-ruscur@russell.cc>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <8f8940e2-c6ab-fca2-ab8a-61b80b2edd22@c-s.fr>
Date: Wed, 8 Jan 2020 13:52:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191224055545.178462-2-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 joel@jms.id.au, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/12/2019 à 06:55, Russell Currey a écrit :
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
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> ---
>   arch/powerpc/Kconfig                  |  1 +
>   arch/powerpc/include/asm/set_memory.h | 32 +++++++++++
>   arch/powerpc/mm/Makefile              |  1 +
>   arch/powerpc/mm/pageattr.c            | 83 +++++++++++++++++++++++++++
>   4 files changed, 117 insertions(+)
>   create mode 100644 arch/powerpc/include/asm/set_memory.h
>   create mode 100644 arch/powerpc/mm/pageattr.c
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 1ec34e16ed65..f0b9b47b5353 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -133,6 +133,7 @@ config PPC
>   	select ARCH_HAS_PTE_SPECIAL
>   	select ARCH_HAS_MEMBARRIER_CALLBACKS
>   	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
> +	select ARCH_HAS_SET_MEMORY
>   	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !RELOCATABLE && !HIBERNATION)
>   	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
>   	select ARCH_HAS_UACCESS_FLUSHCACHE
> diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/include/asm/set_memory.h
> new file mode 100644
> index 000000000000..5230ddb2fefd
> --- /dev/null
> +++ b/arch/powerpc/include/asm/set_memory.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_POWERPC_SET_MEMORY_H
> +#define _ASM_POWERPC_SET_MEMORY_H
> +
> +#define SET_MEMORY_RO	1
> +#define SET_MEMORY_RW	2
> +#define SET_MEMORY_NX	3
> +#define SET_MEMORY_X	4

Maybe going from 0 to 3 would be better than 1 to 4

> +
> +int change_memory_attr(unsigned long addr, int numpages, int action);

action could be unsigned.

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
> index 5e147986400d..d0a0bcbc9289 100644
> --- a/arch/powerpc/mm/Makefile
> +++ b/arch/powerpc/mm/Makefile
> @@ -20,3 +20,4 @@ obj-$(CONFIG_HIGHMEM)		+= highmem.o
>   obj-$(CONFIG_PPC_COPRO_BASE)	+= copro_fault.o
>   obj-$(CONFIG_PPC_PTDUMP)	+= ptdump/
>   obj-$(CONFIG_KASAN)		+= kasan/
> +obj-$(CONFIG_ARCH_HAS_SET_MEMORY) += pageattr.o

CONFIG_ARCH_HAS_SET_MEMORY is set inconditionnally, I think you should 
add pageattr.o to obj-y instead. CONFIG_ARCH_HAS_XXX are almost never 
used in Makefiles

> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> new file mode 100644
> index 000000000000..15d5fb04f531
> --- /dev/null
> +++ b/arch/powerpc/mm/pageattr.c
> @@ -0,0 +1,83 @@
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
> + */
> +static int __change_page_attr(pte_t *ptep, unsigned long addr, void *data)
> +{
> +	int action = *((int *)data);

Don't use pointers for so simple things, pointers forces the compiler to 
setup a stack frame and save the data into stack. Instead do:

	int action = (int)data;

> +	pte_t pte_val;
> +
> +	// invalidate the PTE so it's safe to modify
> +	pte_val = ptep_get_and_clear(&init_mm, addr, ptep);
> +	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);

Why flush a range for a single page ? On most targets this will do a 
tlbia which is heavy, while a tlbie would suffice.

I think flush_tlb_kernel_range() should be replaced by something 
flushing only a single page.

> +
> +	// modify the PTE bits as desired, then apply
> +	switch (action) {
> +	case SET_MEMORY_RO:
> +		pte_val = pte_wrprotect(pte_val);
> +		break;
> +	case SET_MEMORY_RW:
> +		pte_val = pte_mkwrite(pte_val);
> +		break;
> +	case SET_MEMORY_NX:
> +		pte_val = pte_exprotect(pte_val);
> +		break;
> +	case SET_MEMORY_X:
> +		pte_val = pte_mkexec(pte_val);
> +		break;
> +	default:
> +		WARN_ON(true);
> +		return -EINVAL;

Is it worth checking that the action is valid for each page ? I think 
validity of action should be checked in change_memory_attr(). All other 
functions are static so you know they won't be called from outside.

Once done, you can squash __change_page_attr() into change_page_attr(), 
remove the ret var and return 0 all the time.

> +	}
> +
> +	set_pte_at(&init_mm, addr, ptep, pte_val);
> +
> +	return 0;
> +}
> +
> +static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
> +{
> +	int ret;
> +
> +	spin_lock(&init_mm.page_table_lock);
> +	ret = __change_page_attr(ptep, addr, data);
> +	spin_unlock(&init_mm.page_table_lock);
> +
> +	return ret;
> +}
> +
> +int change_memory_attr(unsigned long addr, int numpages, int action)
> +{
> +	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
> +	unsigned long size = numpages * PAGE_SIZE;
> +
> +	if (!numpages)
> +		return 0;
> +
> +	return apply_to_page_range(&init_mm, start, size, change_page_attr, &action);

Use (void*)action instead of &action (see upper comment)

> +}
> 

Christophe

