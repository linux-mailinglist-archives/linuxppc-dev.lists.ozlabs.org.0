Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA53495ADE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 08:36:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgB5b5R3nz3cNK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 18:36:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgB581y0tz2yLX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 18:36:10 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4JgB5053Cdz9sT9;
 Fri, 21 Jan 2022 08:36:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NPFFJpROeVg5; Fri, 21 Jan 2022 08:36:04 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4JgB50478Fz9sT7;
 Fri, 21 Jan 2022 08:36:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7C85B8B786;
 Fri, 21 Jan 2022 08:36:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CvuQQvWWDV_V; Fri, 21 Jan 2022 08:36:04 +0100 (CET)
Received: from [192.168.4.125] (unknown [192.168.4.125])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E5A568B764;
 Fri, 21 Jan 2022 08:36:03 +0100 (CET)
Message-ID: <7eba6780-5ffd-54f4-feb0-b5e627ec6216@csgroup.eu>
Date: Fri, 21 Jan 2022 08:36:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v7 3/7] powerpc/pmem: Add flush routines using new pmem
 store and sync instruction
Content-Language: fr-FR
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 linux-nvdimm@lists.01.org, dan.j.williams@intel.com
References: <20200701072235.223558-1-aneesh.kumar@linux.ibm.com>
 <20200701072235.223558-4-aneesh.kumar@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20200701072235.223558-4-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: oohall@gmail.com, Jeff Moyer <jmoyer@redhat.com>, msuchanek@suse.de,
 Jan Kara <jack@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 01/07/2020 à 09:22, Aneesh Kumar K.V a écrit :
> Start using dcbstps; phwsync; sequence for flushing persistent memory range.
> The new instructions are implemented as a variant of dcbf and hwsync and on
> P8 and P9 they will be executed as those instructions. We avoid using them on
> older hardware. This helps to avoid difficult to debug bugs.
> 

Before this patch, the flush was done for all.
After this patch, IIUC the flush is done only on CPUs having feature 
CPU_FTR_ARCH_207S.

What about other CPUs ?

I don't know much about PMEM, my concern is about the UACCESS_FLUSHCACHE 
API introduced by commit 6c44741d75a2 ("powerpc/lib: Implement 
UACCESS_FLUSHCACHE API")

After your patch, __copy_from_user_flushcache() and memcpy_flushcache() 
are not doing cache flush anymore.

Is that intended ?

I'm trying to optimise some ALSA driver that does copy_from_user + 
cache_flush for DMA, and I was wondering if using 
__copy_from_user_flushcache() was an alternative.

Or is it __copy_from_user_inatomic_nocache() which has to be done for that ?

Thanks
Christophe


> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/cacheflush.h |  1 +
>   arch/powerpc/lib/pmem.c               | 50 ++++++++++++++++++++++++---
>   2 files changed, 47 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/cacheflush.h b/arch/powerpc/include/asm/cacheflush.h
> index de600b915a3c..54764c6e922d 100644
> --- a/arch/powerpc/include/asm/cacheflush.h
> +++ b/arch/powerpc/include/asm/cacheflush.h
> @@ -6,6 +6,7 @@
>   
>   #include <linux/mm.h>
>   #include <asm/cputable.h>
> +#include <asm/cpu_has_feature.h>
>   
>   #ifdef CONFIG_PPC_BOOK3S_64
>   /*
> diff --git a/arch/powerpc/lib/pmem.c b/arch/powerpc/lib/pmem.c
> index 0666a8d29596..5a61aaeb6930 100644
> --- a/arch/powerpc/lib/pmem.c
> +++ b/arch/powerpc/lib/pmem.c
> @@ -9,20 +9,62 @@
>   
>   #include <asm/cacheflush.h>
>   
> +static inline void __clean_pmem_range(unsigned long start, unsigned long stop)
> +{
> +	unsigned long shift = l1_dcache_shift();
> +	unsigned long bytes = l1_dcache_bytes();
> +	void *addr = (void *)(start & ~(bytes - 1));
> +	unsigned long size = stop - (unsigned long)addr + (bytes - 1);
> +	unsigned long i;
> +
> +	for (i = 0; i < size >> shift; i++, addr += bytes)
> +		asm volatile(PPC_DCBSTPS(%0, %1): :"i"(0), "r"(addr): "memory");
> +
> +
> +	asm volatile(PPC_PHWSYNC ::: "memory");
> +}
> +
> +static inline void __flush_pmem_range(unsigned long start, unsigned long stop)
> +{
> +	unsigned long shift = l1_dcache_shift();
> +	unsigned long bytes = l1_dcache_bytes();
> +	void *addr = (void *)(start & ~(bytes - 1));
> +	unsigned long size = stop - (unsigned long)addr + (bytes - 1);
> +	unsigned long i;
> +
> +	for (i = 0; i < size >> shift; i++, addr += bytes)
> +		asm volatile(PPC_DCBFPS(%0, %1): :"i"(0), "r"(addr): "memory");
> +
> +
> +	asm volatile(PPC_PHWSYNC ::: "memory");
> +}
> +
> +static inline void clean_pmem_range(unsigned long start, unsigned long stop)
> +{
> +	if (cpu_has_feature(CPU_FTR_ARCH_207S))
> +		return __clean_pmem_range(start, stop);
> +}
> +
> +static inline void flush_pmem_range(unsigned long start, unsigned long stop)
> +{
> +	if (cpu_has_feature(CPU_FTR_ARCH_207S))
> +		return __flush_pmem_range(start, stop);
> +}
> +
>   /*
>    * CONFIG_ARCH_HAS_PMEM_API symbols
>    */
>   void arch_wb_cache_pmem(void *addr, size_t size)
>   {
>   	unsigned long start = (unsigned long) addr;
> -	flush_dcache_range(start, start + size);
> +	clean_pmem_range(start, start + size);
>   }
>   EXPORT_SYMBOL_GPL(arch_wb_cache_pmem);
>   
>   void arch_invalidate_pmem(void *addr, size_t size)
>   {
>   	unsigned long start = (unsigned long) addr;
> -	flush_dcache_range(start, start + size);
> +	flush_pmem_range(start, start + size);
>   }
>   EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
>   
> @@ -35,7 +77,7 @@ long __copy_from_user_flushcache(void *dest, const void __user *src,
>   	unsigned long copied, start = (unsigned long) dest;
>   
>   	copied = __copy_from_user(dest, src, size);
> -	flush_dcache_range(start, start + size);
> +	clean_pmem_range(start, start + size);
>   
>   	return copied;
>   }
> @@ -45,7 +87,7 @@ void *memcpy_flushcache(void *dest, const void *src, size_t size)
>   	unsigned long start = (unsigned long) dest;
>   
>   	memcpy(dest, src, size);
> -	flush_dcache_range(start, start + size);
> +	clean_pmem_range(start, start + size);
>   
>   	return dest;
>   }
