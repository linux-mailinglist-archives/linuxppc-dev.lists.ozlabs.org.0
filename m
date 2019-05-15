Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFF91E843
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 08:26:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453l1z4JryzDqQ6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 16:26:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="mUvem90I"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453kzq41n3zDqP2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 16:24:39 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 453kzl0jHgz9vDbV;
 Wed, 15 May 2019 08:24:35 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=mUvem90I; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id HeXDQa6JfvKo; Wed, 15 May 2019 08:24:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 453kzk6ZMFz9vDbT;
 Wed, 15 May 2019 08:24:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557901474; bh=ZYsf6ayFsYVI9sLCSpcd42fzC/87wn4sXB6mg49OpnY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=mUvem90IQ+erDW3yaQKXOvhJHNwS/fIYKG63dERCu3/pbwKyuxOWh+1lyfbglgXYp
 0fBMNQN+MbnI2BT1vg/Aj0HMQF1bgdQycDBpX0fEepH/8iRyQ0ks2+ashhUB+JmvzX
 tvml8a8MalRcyQTlBbP7DxGYWMP0SwdNcqss+2Eo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CE5108B785;
 Wed, 15 May 2019 08:24:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id a4BLzuVuBX5K; Wed, 15 May 2019 08:24:35 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9B6D68B77C;
 Wed, 15 May 2019 08:24:35 +0200 (CEST)
Subject: Re: [PATCH] powerpc/mm/book3s64: Implement STRICT_MODULE_RWX
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
References: <20190515013000.16085-1-ruscur@russell.cc>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <7f651e1e-32d4-1e1d-7d45-8c90338327f6@c-s.fr>
Date: Wed, 15 May 2019 08:24:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190515013000.16085-1-ruscur@russell.cc>
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



Le 15/05/2019 à 03:30, Russell Currey a écrit :
> Strict module RWX is just like strict kernel RWX, but for modules - so
> loadable modules aren't marked both writable and executable at the same
> time.  This is handled by the generic code in kernel/module.c, and
> simply requires the architecture to implement the set_memory() set of
> functions, declared with ARCH_HAS_SET_MEMORY.
> 
> The set_memory() family of functions are implemented for book3s64
> MMUs (so Hash and Radix), however they could likely be adapted to work
> for other platforms as well and made more generic.  I did it this way
> since they're the platforms I have the most understanding of and ability
> to test.

Based on this patch, I have drafted a generic implementation. Please 
comment and test. I'll test on my side on PPC32.

Christophe

> 
> There's nothing other than these functions required to turn
> ARCH_HAS_STRICT_MODULE_RWX on, so turn that on too.
> 
> With STRICT_MODULE_RWX enabled, there are as many W+X pages at runtime
> as there are with CONFIG_MODULES=n (none), so in my testing it works
> well on both Hash and Radix.
> 
> There's a TODO in the code for also applying the page permission changes
> to the backing pages in the linear mapping: this is pretty simple for
> Radix and (seemingly) a lot harder for Hash, so I've left it for now
> since there's still a notable security benefit for the patch as-is.
> 
> Technically can be enabled without STRICT_KERNEL_RWX, but I don't think
> that gets you a whole lot, so I think we should leave it off by default
> until we can get STRICT_KERNEL_RWX to the point where it's enabled by
> default.
> 
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> ---
>   arch/powerpc/Kconfig                  |   2 +
>   arch/powerpc/include/asm/set_memory.h |  12 +++
>   arch/powerpc/mm/book3s64/Makefile     |   2 +-
>   arch/powerpc/mm/book3s64/pageattr.c   | 106 ++++++++++++++++++++++++++
>   4 files changed, 121 insertions(+), 1 deletion(-)
>   create mode 100644 arch/powerpc/include/asm/set_memory.h
>   create mode 100644 arch/powerpc/mm/book3s64/pageattr.c
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index d7996cfaceca..9e1bfa81bc5a 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -131,7 +131,9 @@ config PPC
>   	select ARCH_HAS_PTE_SPECIAL
>   	select ARCH_HAS_MEMBARRIER_CALLBACKS
>   	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC64
> +	select ARCH_HAS_SET_MEMORY		if PPC_BOOK3S_64
>   	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !RELOCATABLE && !HIBERNATION)
> +	select ARCH_HAS_STRICT_MODULE_RWX	if PPC_BOOK3S_64
>   	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
>   	select ARCH_HAS_UACCESS_FLUSHCACHE	if PPC64
>   	select ARCH_HAS_UBSAN_SANITIZE_ALL
> diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/include/asm/set_memory.h
> new file mode 100644
> index 000000000000..5323a8b06f98
> --- /dev/null
> +++ b/arch/powerpc/include/asm/set_memory.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +#ifndef _ASM_POWERPC_SET_MEMORY_H
> +#define _ASM_POWERPC_SET_MEMORY_H
> +
> +#ifdef CONFIG_PPC_BOOK3S_64
> +int set_memory_ro(unsigned long addr, int numpages);
> +int set_memory_rw(unsigned long addr, int numpages);
> +int set_memory_nx(unsigned long addr, int numpages);
> +int set_memory_x(unsigned long addr, int numpages);
> +#endif
> +
> +#endif
> diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
> index 974b4fc19f4f..09c5afadf235 100644
> --- a/arch/powerpc/mm/book3s64/Makefile
> +++ b/arch/powerpc/mm/book3s64/Makefile
> @@ -5,7 +5,7 @@ ccflags-y	:= $(NO_MINIMAL_TOC)
>   CFLAGS_REMOVE_slb.o = $(CC_FLAGS_FTRACE)
>   
>   obj-y				+= hash_pgtable.o hash_utils.o slb.o \
> -				   mmu_context.o pgtable.o hash_tlb.o
> +				   mmu_context.o pgtable.o hash_tlb.o pageattr.o
>   obj-$(CONFIG_PPC_NATIVE)	+= hash_native.o
>   obj-$(CONFIG_PPC_RADIX_MMU)	+= radix_pgtable.o radix_tlb.o
>   obj-$(CONFIG_PPC_4K_PAGES)	+= hash_4k.o
> diff --git a/arch/powerpc/mm/book3s64/pageattr.c b/arch/powerpc/mm/book3s64/pageattr.c
> new file mode 100644
> index 000000000000..d6afa89fb407
> --- /dev/null
> +++ b/arch/powerpc/mm/book3s64/pageattr.c
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Page attribute and set_memory routines for Radix and Hash MMUs
> + *
> + * Derived from the arm64 implementation.
> + *
> + * Author: Russell Currey <ruscur@russell.cc>
> + *
> + * Copyright 2019, IBM Corporation.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or (at your
> + * option) any later version.

Above text should be removed as it is redundant with the 
SPDX-Licence-Identifier

> + */
> +
> +#include <linux/mm.h>
> +#include <linux/vmalloc.h>
> +
> +#include <asm/mmu.h>
> +#include <asm/page.h>
> +#include <asm/pgtable.h>
> +
> +// we need this to have a single pointer to pass into apply_to_page_range()
> +struct page_change_data {
> +	pgprot_t set_mask;
> +	pgprot_t clear_mask;
> +};
> +
> +static pte_t clear_pte_bit(pte_t pte, pgprot_t prot)
> +{
> +	return __pte(pte_val(pte) & ~pgprot_val(prot));
> +}
> +
> +static pte_t set_pte_bit(pte_t pte, pgprot_t prot)
> +{
> +	return __pte(pte_val(pte) | pgprot_val(prot));
> +}
> +
> +static int change_page_range(pte_t *ptep, pgtable_t token, unsigned long addr,
> +			     void *data)
> +{
> +	struct page_change_data *cdata = data;
> +	pte_t pte = READ_ONCE(*ptep);
> +
> +	pte = clear_pte_bit(pte, cdata->clear_mask);
> +	pte = set_pte_bit(pte, cdata->set_mask);
> +
> +	set_pte_at(&init_mm, addr, ptep, pte);
> +	return 0;
> +}
> +
> +static int change_memory(unsigned long addr, int numpages, pgprot_t set_mask,
> +			 pgprot_t clear_mask)
> +{
> +	unsigned long size = numpages * PAGE_SIZE;
> +	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
> +	unsigned long end = PAGE_ALIGN(start + size);

We have aligned the start and the size, so the end is automatically aligned.

Christophe

> +	struct page_change_data data;
> +	struct vm_struct *area;
> +	int ret;
> +
> +	if (!numpages)
> +		return 0;
> +
> +	// only operate on VM areas for now
> +	area = find_vm_area((void *)addr);
> +	if (!area || end > (unsigned long)area->addr + area->size ||
> +	    !(area->flags & VM_ALLOC))
> +		return -EINVAL;
> +
> +	// TODO: also apply change to the backing pages in the linear mapping
> +	data.set_mask = set_mask;
> +	data.clear_mask = clear_mask;
> +
> +	ret = apply_to_page_range(&init_mm, start, size, change_page_range,
> +				  &data);
> +
> +	flush_tlb_kernel_range(start, end);
> +	return ret;
> +}
> +
> +int set_memory_ro(unsigned long addr, int numpages)
> +{
> +	return change_memory(addr, numpages,
> +			     __pgprot(0), __pgprot(_PAGE_WRITE));
> +}
> +
> +int set_memory_rw(unsigned long addr, int numpages)
> +{
> +	return change_memory(addr, numpages,
> +			     __pgprot(_PAGE_RW), __pgprot(0));
> +}
> +
> +int set_memory_nx(unsigned long addr, int numpages)
> +{
> +	return change_memory(addr, numpages,
> +			     __pgprot(0), __pgprot(_PAGE_EXEC));
> +}
> +
> +int set_memory_x(unsigned long addr, int numpages)
> +{
> +	return change_memory(addr, numpages,
> +			     __pgprot(_PAGE_EXEC), __pgprot(0));
> +}
> 
