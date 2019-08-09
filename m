Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C14875D9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 11:25:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464fwW2b8zzDqr6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 19:25:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="s2iQn4J9"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464ftV58l1zDqml
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2019 19:23:30 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 464ftP6KdQz9vBnS;
 Fri,  9 Aug 2019 11:23:25 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=s2iQn4J9; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id X6yYNi38oEOR; Fri,  9 Aug 2019 11:23:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 464ftP59vtz9vBnC;
 Fri,  9 Aug 2019 11:23:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565342605; bh=MSN2VoVfRF+Vi8Bs7k+Ix9wLxyM2N+3Scm0HUsXVt4g=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=s2iQn4J9iUC4jJ0nOmjMZvjXkAZqkNK1NQeIPfvSLi3kzN1GLjEqGmqhBEuxCjbKe
 cmtcbmtuOt1Cdx7t4fBnaDyidzMXh6oH7v1JDd47smujjCuGJWuM9gTP7+pqyViVxX
 RTg0UNkHDHqewqStxMAweW5u0iPf6j8nGVcKEHIs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BF5268B887;
 Fri,  9 Aug 2019 11:23:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VuXIUSzOOgWO; Fri,  9 Aug 2019 11:23:26 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 867B08B886;
 Fri,  9 Aug 2019 11:23:26 +0200 (CEST)
Subject: Re: [PATCH 2/2] powerpc: Convert flush_icache_range to C
To: Alastair D'Silva <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20190809004658.22512-1-alastair@au1.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <ee96e072-d212-3653-7544-716e7eea4992@c-s.fr>
Date: Fri, 9 Aug 2019 11:23:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809004658.22512-1-alastair@au1.ibm.com>
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
Cc: linux-kernel@vger.kernel.org, Qian Cai <cai@lca.pw>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/08/2019 à 02:46, Alastair D'Silva a écrit :
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> Similar to commit 22e9c88d486a
> ("powerpc/64: reuse PPC32 static inline flush_dcache_range()")
> this patch converts flush_icache_range to C.

Should we also convert __flush_dcache_icache() which does exactly the 
same but on a full page ? We could most likely use the same code, ie 
call flush_icache_range() from __flush_dcache_icache() ?

> 
> This was done as we discovered a long-standing bug where the
> length of the range was truncated due to using a 32 bit shift
> instead of a 64 bit one.
> 
> By converting this function to C, it becomes easier to maintain.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>   arch/powerpc/include/asm/cache.h      | 35 +++++++++++++--
>   arch/powerpc/include/asm/cacheflush.h | 63 +++++++++++++++++++++++----
>   arch/powerpc/kernel/misc_64.S         | 55 -----------------------

There is also a flush_icache_range() in arch/powerpc/kernel/misc_32.S, 
it must be converted as well.

>   3 files changed, 85 insertions(+), 68 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/cache.h b/arch/powerpc/include/asm/cache.h
> index b3388d95f451..d3d7077b75e2 100644
> --- a/arch/powerpc/include/asm/cache.h
> +++ b/arch/powerpc/include/asm/cache.h
> @@ -55,25 +55,46 @@ struct ppc64_caches {
>   
>   extern struct ppc64_caches ppc64_caches;
>   
> -static inline u32 l1_cache_shift(void)
> +static inline u32 l1_dcache_shift(void)
>   {
>   	return ppc64_caches.l1d.log_block_size;
>   }
>   
> -static inline u32 l1_cache_bytes(void)
> +static inline u32 l1_dcache_bytes(void)
>   {
>   	return ppc64_caches.l1d.block_size;
>   }
> +
> +static inline u32 l1_icache_shift(void)
> +{
> +	return ppc64_caches.l1i.log_block_size;
> +}
> +
> +static inline u32 l1_icache_bytes(void)
> +{
> +	return ppc64_caches.l1i.block_size;
> +}
>   #else
> -static inline u32 l1_cache_shift(void)
> +static inline u32 l1_dcache_shift(void)
>   {
>   	return L1_CACHE_SHIFT;
>   }
>   
> -static inline u32 l1_cache_bytes(void)
> +static inline u32 l1_dcache_bytes(void)
>   {
>   	return L1_CACHE_BYTES;
>   }
> +
> +static inline u32 l1_icache_shift(void)
> +{
> +	return L1_CACHE_SHIFT;
> +}
> +
> +static inline u32 l1_icache_bytes(void)
> +{
> +	return L1_CACHE_BYTES;
> +}
> +

Could the above adds/changes be a separate patch ?

>   #endif
>   #endif /* ! __ASSEMBLY__ */
>   
> @@ -124,6 +145,12 @@ static inline void dcbst(void *addr)
>   {
>   	__asm__ __volatile__ ("dcbst %y0" : : "Z"(*(u8 *)addr) : "memory");
>   }
> +
> +static inline void icbi(void *addr)
> +{
> +	__asm__ __volatile__ ("icbi %y0" : : "Z"(*(u8 *)addr) : "memory");
> +}
> +

Commit 6c5875843b87c3ad ("") is likely to be reverted in the near future 
due to a bug in CLANG and because it has no real benefit in our use cases.

So maybe you should consider using the previous format when adding icbi() ?

Should you also add iccci() in order to handle the 4xx part from misc_32 ?

>   #endif /* !__ASSEMBLY__ */
>   #endif /* __KERNEL__ */
>   #endif /* _ASM_POWERPC_CACHE_H */
> diff --git a/arch/powerpc/include/asm/cacheflush.h b/arch/powerpc/include/asm/cacheflush.h
> index eef388f2659f..f68e75a6dc4b 100644
> --- a/arch/powerpc/include/asm/cacheflush.h
> +++ b/arch/powerpc/include/asm/cacheflush.h
> @@ -42,7 +42,6 @@ extern void flush_dcache_page(struct page *page);
>   #define flush_dcache_mmap_lock(mapping)		do { } while (0)
>   #define flush_dcache_mmap_unlock(mapping)	do { } while (0)
>   
> -extern void flush_icache_range(unsigned long, unsigned long);
>   extern void flush_icache_user_range(struct vm_area_struct *vma,
>   				    struct page *page, unsigned long addr,
>   				    int len);
> @@ -57,14 +56,17 @@ static inline void __flush_dcache_icache_phys(unsigned long physaddr)
>   }
>   #endif
>   
> -/*
> - * Write any modified data cache blocks out to memory and invalidate them.
> +/**
> + * flush_dcache_range: Write any modified data cache blocks out to memory and invalidate them.
>    * Does not invalidate the corresponding instruction cache blocks.
> + *
> + * @start: the start address
> + * @stop: the stop address (exclusive)
>    */
>   static inline void flush_dcache_range(unsigned long start, unsigned long stop)
>   {
> -	unsigned long shift = l1_cache_shift();
> -	unsigned long bytes = l1_cache_bytes();
> +	unsigned long shift = l1_dcache_shift();
> +	unsigned long bytes = l1_dcache_bytes();
>   	void *addr = (void *)(start & ~(bytes - 1));
>   	unsigned long size = stop - (unsigned long)addr + (bytes - 1);
>   	unsigned long i;
> @@ -82,6 +84,49 @@ static inline void flush_dcache_range(unsigned long start, unsigned long stop)
>   		isync();
>   }
>   
> +/**
> + * flush_icache_range: Write any modified data cache blocks out to memory
> + * and invalidate the corresponding blocks in the instruction cache
> + *
> + * Generic code will call this after writing memory, before executing from it.
> + *
> + * @start: the start address
> + * @stop: the stop address (exclusive)
> + */
> +static inline void flush_icache_range(unsigned long start, unsigned long stop)

Wondering if it doesn't start to be a bit big for an inline function. 
Not sure thought. Maybe the addr and size calculation should remain 
inlined in order to benefit from constant inputs while the two loops and 
sync stuff around them could be a dedicated function ?

> +{
> +	unsigned long shift = l1_dcache_shift();
> +	unsigned long bytes = l1_dcache_bytes();
> +	void *addr = (void *)(start & ~(bytes - 1));
> +	unsigned long size = stop - (unsigned long)addr + (bytes - 1);
> +	unsigned long i;
> +
> +	if (cpu_has_feature(CPU_FTR_COHERENT_ICACHE)) {
> +		mb(); /* sync */
> +		icbi((void *)start);
> +		mb(); /* sync */
> +		isync();
> +		return;
> +	}
> +
> +	/* Flush the data cache to memory */
> +	for (i = 0; i < size >> shift; i++, addr += bytes)
> +		dcbst(addr);
> +
> +	mb();	/* sync */
> +
> +	shift = l1_icache_shift();
> +	bytes = l1_icache_bytes();
> +	addr = (void *)(start & ~(bytes - 1));
> +	size = stop - (unsigned long)addr + (bytes - 1);
> +
> +	/* Now invalidate the instruction cache */
> +	for (i = 0; i < size >> shift; i++, addr += bytes)
> +		icbi(addr);
> +
> +	isync();
> +}

Don't forget to also take misc_32 into account.

Christophe

> +
>   /*
>    * Write any modified data cache blocks out to memory.
>    * Does not invalidate the corresponding cache lines (especially for
> @@ -89,8 +134,8 @@ static inline void flush_dcache_range(unsigned long start, unsigned long stop)
>    */
>   static inline void clean_dcache_range(unsigned long start, unsigned long stop)
>   {
> -	unsigned long shift = l1_cache_shift();
> -	unsigned long bytes = l1_cache_bytes();
> +	unsigned long shift = l1_dcache_shift();
> +	unsigned long bytes = l1_dcache_bytes();
>   	void *addr = (void *)(start & ~(bytes - 1));
>   	unsigned long size = stop - (unsigned long)addr + (bytes - 1);
>   	unsigned long i;
> @@ -108,8 +153,8 @@ static inline void clean_dcache_range(unsigned long start, unsigned long stop)
>   static inline void invalidate_dcache_range(unsigned long start,
>   					   unsigned long stop)
>   {
> -	unsigned long shift = l1_cache_shift();
> -	unsigned long bytes = l1_cache_bytes();
> +	unsigned long shift = l1_dcache_shift();
> +	unsigned long bytes = l1_dcache_bytes();
>   	void *addr = (void *)(start & ~(bytes - 1));
>   	unsigned long size = stop - (unsigned long)addr + (bytes - 1);
>   	unsigned long i;
> diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
> index 9bc0aa9aeb65..999828e86bba 100644
> --- a/arch/powerpc/kernel/misc_64.S
> +++ b/arch/powerpc/kernel/misc_64.S
> @@ -54,61 +54,6 @@ PPC64_CACHES:
>   	.tc		ppc64_caches[TC],ppc64_caches
>   	.section	".text"
>   
> -/*
> - * Write any modified data cache blocks out to memory
> - * and invalidate the corresponding instruction cache blocks.
> - *
> - * flush_icache_range(unsigned long start, unsigned long stop)
> - *
> - *   flush all bytes from start through stop-1 inclusive
> - */
> -
> -_GLOBAL_TOC(flush_icache_range)
> -BEGIN_FTR_SECTION
> -	PURGE_PREFETCHED_INS
> -	blr
> -END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_ICACHE)
> -/*
> - * Flush the data cache to memory
> - *
> - * Different systems have different cache line sizes
> - * and in some cases i-cache and d-cache line sizes differ from
> - * each other.
> - */
> - 	ld	r10,PPC64_CACHES@toc(r2)
> -	lwz	r7,DCACHEL1BLOCKSIZE(r10)/* Get cache block size */
> -	addi	r5,r7,-1
> -	andc	r6,r3,r5		/* round low to line bdy */
> -	subf	r8,r6,r4		/* compute length */
> -	add	r8,r8,r5		/* ensure we get enough */
> -	lwz	r9,DCACHEL1LOGBLOCKSIZE(r10)	/* Get log-2 of cache block size */
> -	srd.	r8,r8,r9		/* compute line count */
> -	beqlr				/* nothing to do? */
> -	mtctr	r8
> -1:	dcbst	0,r6
> -	add	r6,r6,r7
> -	bdnz	1b
> -	sync
> -
> -/* Now invalidate the instruction cache */
> -	
> -	lwz	r7,ICACHEL1BLOCKSIZE(r10)	/* Get Icache block size */
> -	addi	r5,r7,-1
> -	andc	r6,r3,r5		/* round low to line bdy */
> -	subf	r8,r6,r4		/* compute length */
> -	add	r8,r8,r5
> -	lwz	r9,ICACHEL1LOGBLOCKSIZE(r10)	/* Get log-2 of Icache block size */
> -	srd.	r8,r8,r9		/* compute line count */
> -	beqlr				/* nothing to do? */
> -	mtctr	r8
> -2:	icbi	0,r6
> -	add	r6,r6,r7
> -	bdnz	2b
> -	isync
> -	blr
> -_ASM_NOKPROBE_SYMBOL(flush_icache_range)
> -EXPORT_SYMBOL(flush_icache_range)
> -
>   /*
>    * Flush a particular page from the data cache to RAM.
>    * Note: this is necessary because the instruction cache does *not*
> 
