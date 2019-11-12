Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C795F8D4F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 11:52:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47C4Ll2GGczF55K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 21:51:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47C4Hc4rrkzF1Hf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 21:49:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="bzRParI0"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47C4Hb0DM9z9sPf;
 Tue, 12 Nov 2019 21:49:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1573555755;
 bh=92KwSyGBKrAUPj0DzXMVKUnshxTmDY1j+JHp4PzBn24=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bzRParI0nDgJ0DS8RE54TG7bpywAe1GRJWKgDI1x9j0vRoZUQWH5i9PD1hsBs0UCD
 i8di2YPDJPlD+fXVCymD1Dcnw8eTtwqpAsRSBmzqxdaB8/O3koUJzmpRBiVbG+Yyi/
 KFI7KyvLvTijFrMVwcv0vpNvRKPhVonJQUfjMmZFsMz4t6CnQCwq7uRmsbnyJkq/8Q
 4ouIBjJcrARnrflwP/HY/3AHh1uXDnnH8+fvEvenUsDKzGFm2gl8+fT4Dl4uLsvrF8
 L/XW7HinlyZbR0jq18TTfPERKMs+n6vTQ02erMN+8Y7AlzFk1KT3BF3LcdUyOGjv0n
 PC6qv6M226dhg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alastair D'Silva <alastair@au1.ibm.com>, alastair@d-silva.org
Subject: Re: [PATCH v5 4/6] powerpc: Convert flush_icache_range & friends to C
In-Reply-To: <20191104023305.9581-5-alastair@au1.ibm.com>
References: <20191104023305.9581-1-alastair@au1.ibm.com>
 <20191104023305.9581-5-alastair@au1.ibm.com>
Date: Tue, 12 Nov 2019 21:49:14 +1100
Message-ID: <87a7912wut.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Qian Cai <cai@lca.pw>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Alastair D'Silva" <alastair@au1.ibm.com> writes:
> From: Alastair D'Silva <alastair@d-silva.org>
>
> Similar to commit 22e9c88d486a
> ("powerpc/64: reuse PPC32 static inline flush_dcache_range()")
> this patch converts the following ASM symbols to C:
>     flush_icache_range()
>     __flush_dcache_icache()
>     __flush_dcache_icache_phys()
>
> This was done as we discovered a long-standing bug where the length of the
> range was truncated due to using a 32 bit shift instead of a 64 bit one.
>
> By converting these functions to C, it becomes easier to maintain.
>
> flush_dcache_icache_phys() retains a critical assembler section as we must
> ensure there are no memory accesses while the data MMU is disabled
> (authored by Christophe Leroy). Since this has no external callers, it has
> also been made static, allowing the compiler to inline it within
> flush_dcache_icache_page().
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/include/asm/cache.h      |  26 ++---
>  arch/powerpc/include/asm/cacheflush.h |  24 ++--
>  arch/powerpc/kernel/misc_32.S         | 120 --------------------
>  arch/powerpc/kernel/misc_64.S         | 102 -----------------
>  arch/powerpc/mm/mem.c                 | 151 +++++++++++++++++++++++++-
>  5 files changed, 172 insertions(+), 251 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/cache.h b/arch/powerpc/include/asm/cache.h
> index afb88754e0e0..b809095cb1ba 100644
> --- a/arch/powerpc/include/asm/cache.h
> +++ b/arch/powerpc/include/asm/cache.h
> @@ -98,20 +98,7 @@ static inline u32 l1_icache_bytes(void)
>  #endif
>  #endif /* ! __ASSEMBLY__ */
  
Because of the above ...

> -#if defined(__ASSEMBLY__)
> -/*
> - * For a snooping icache, we still need a dummy icbi to purge all the
> - * prefetched instructions from the ifetch buffers. We also need a sync
> - * before the icbi to order the the actual stores to memory that might
> - * have modified instructions with the icbi.
> - */
> -#define PURGE_PREFETCHED_INS	\
> -	sync;			\
> -	icbi	0,r3;		\
> -	sync;			\
> -	isync
> -
> -#else
> +#if !defined(__ASSEMBLY__)

And this, we now end up with two adjacent !defined(__ASSEMBLY__) blocks.
So I merged them.

>  #define __read_mostly __attribute__((__section__(".data..read_mostly")))
>  
>  #ifdef CONFIG_PPC_BOOK3S_32
> @@ -145,6 +132,17 @@ static inline void dcbst(void *addr)
>  {
>  	__asm__ __volatile__ ("dcbst 0, %0" : : "r"(addr) : "memory");
>  }
> +
> +static inline void icbi(void *addr)
> +{
> +	asm volatile ("icbi 0, %0" : : "r"(addr) : "memory");
> +}
> +
> +static inline void iccci(void *addr)
> +{
> +	asm volatile ("iccci 0, %0" : : "r"(addr) : "memory");
> +}
> +
>  #endif /* !__ASSEMBLY__ */
>  #endif /* __KERNEL__ */
>  #endif /* _ASM_POWERPC_CACHE_H */
> diff --git a/arch/powerpc/include/asm/cacheflush.h b/arch/powerpc/include/asm/cacheflush.h
> index ed57843ef452..4a1c9f0200e1 100644
> --- a/arch/powerpc/include/asm/cacheflush.h
> +++ b/arch/powerpc/include/asm/cacheflush.h
> @@ -42,24 +42,20 @@ extern void flush_dcache_page(struct page *page);
>  #define flush_dcache_mmap_lock(mapping)		do { } while (0)
>  #define flush_dcache_mmap_unlock(mapping)	do { } while (0)
>  
> -extern void flush_icache_range(unsigned long, unsigned long);
> +void flush_icache_range(unsigned long start, unsigned long stop);
>  extern void flush_icache_user_range(struct vm_area_struct *vma,
>  				    struct page *page, unsigned long addr,
>  				    int len);
> -extern void __flush_dcache_icache(void *page_va);
>  extern void flush_dcache_icache_page(struct page *page);
> -#if defined(CONFIG_PPC32) && !defined(CONFIG_BOOKE)
> -extern void __flush_dcache_icache_phys(unsigned long physaddr);
> -#else
> -static inline void __flush_dcache_icache_phys(unsigned long physaddr)
> -{
> -	BUG();
> -}
> -#endif
> -
> -/*
> - * Write any modified data cache blocks out to memory and invalidate them.
> - * Does not invalidate the corresponding instruction cache blocks.
> +void __flush_dcache_icache(void *page);
> +
> +/**
> + * flush_dcache_range(): Write any modified data cache blocks out to memory and
> + * invalidate them. Does not invalidate the corresponding instruction cache
> + * blocks.
> + *
> + * @start: the start address
> + * @stop: the stop address (exclusive)
>   */
>  static inline void flush_dcache_range(unsigned long start, unsigned long stop)
>  {
> diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
> index 82df4b09e79f..f4e4a1926a7a 100644
> --- a/arch/powerpc/kernel/misc_32.S
> +++ b/arch/powerpc/kernel/misc_32.S
> @@ -316,126 +316,6 @@ _GLOBAL(flush_instruction_cache)
>  EXPORT_SYMBOL(flush_instruction_cache)
>  #endif /* CONFIG_PPC_8xx */
>  
> -/*
> - * Write any modified data cache blocks out to memory
> - * and invalidate the corresponding instruction cache blocks.
> - * This is a no-op on the 601.
> - *
> - * flush_icache_range(unsigned long start, unsigned long stop)
> - */
> -_GLOBAL(flush_icache_range)
> -#if defined(CONFIG_PPC_BOOK3S_601) || defined(CONFIG_E200)
> -	PURGE_PREFETCHED_INS
> -	blr				/* for 601 and e200, do nothing */
> -#else
> -	rlwinm	r3,r3,0,0,31 - L1_CACHE_SHIFT
> -	subf	r4,r3,r4
> -	addi	r4,r4,L1_CACHE_BYTES - 1
> -	srwi.	r4,r4,L1_CACHE_SHIFT
> -	beqlr
> -	mtctr	r4
> -	mr	r6,r3
> -1:	dcbst	0,r3
> -	addi	r3,r3,L1_CACHE_BYTES
> -	bdnz	1b
> -	sync				/* wait for dcbst's to get to ram */
> -#ifndef CONFIG_44x
> -	mtctr	r4
> -2:	icbi	0,r6
> -	addi	r6,r6,L1_CACHE_BYTES
> -	bdnz	2b
> -#else
> -	/* Flash invalidate on 44x because we are passed kmapped addresses and
> -	   this doesn't work for userspace pages due to the virtually tagged
> -	   icache.  Sigh. */
> -	iccci	0, r0
> -#endif
> -	sync				/* additional sync needed on g4 */
> -	isync
> -	blr
> -#endif
> -_ASM_NOKPROBE_SYMBOL(flush_icache_range)
> -EXPORT_SYMBOL(flush_icache_range)
> -
> -/*
> - * Flush a particular page from the data cache to RAM.
> - * Note: this is necessary because the instruction cache does *not*
> - * snoop from the data cache.
> - * This is a no-op on the 601 and e200 which have a unified cache.
> - *
> - *	void __flush_dcache_icache(void *page)
> - */
> -_GLOBAL(__flush_dcache_icache)
> -#if defined(CONFIG_PPC_BOOK3S_601) || defined(CONFIG_E200)
> -	PURGE_PREFETCHED_INS
> -	blr
> -#else
> -	rlwinm	r3,r3,0,0,31-PAGE_SHIFT		/* Get page base address */
> -	li	r4,PAGE_SIZE/L1_CACHE_BYTES	/* Number of lines in a page */
> -	mtctr	r4
> -	mr	r6,r3
> -0:	dcbst	0,r3				/* Write line to ram */
> -	addi	r3,r3,L1_CACHE_BYTES
> -	bdnz	0b
> -	sync
> -#ifdef CONFIG_44x
> -	/* We don't flush the icache on 44x. Those have a virtual icache
> -	 * and we don't have access to the virtual address here (it's
> -	 * not the page vaddr but where it's mapped in user space). The
> -	 * flushing of the icache on these is handled elsewhere, when
> -	 * a change in the address space occurs, before returning to
> -	 * user space
> -	 */
> -BEGIN_MMU_FTR_SECTION
> -	blr
> -END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_44x)
> -#endif /* CONFIG_44x */
> -	mtctr	r4
> -1:	icbi	0,r6
> -	addi	r6,r6,L1_CACHE_BYTES
> -	bdnz	1b
> -	sync
> -	isync
> -	blr
> -#endif
> -
> -#ifndef CONFIG_BOOKE
> -/*
> - * Flush a particular page from the data cache to RAM, identified
> - * by its physical address.  We turn off the MMU so we can just use
> - * the physical address (this may be a highmem page without a kernel
> - * mapping).
> - *
> - *	void __flush_dcache_icache_phys(unsigned long physaddr)
> - */
> -_GLOBAL(__flush_dcache_icache_phys)
> -#if defined(CONFIG_PPC_BOOK3S_601) || defined(CONFIG_E200)
> -	PURGE_PREFETCHED_INS
> -	blr					/* for 601 and e200, do nothing */
> -#else
> -	mfmsr	r10
> -	rlwinm	r0,r10,0,28,26			/* clear DR */
> -	mtmsr	r0
> -	isync
> -	rlwinm	r3,r3,0,0,31-PAGE_SHIFT		/* Get page base address */
> -	li	r4,PAGE_SIZE/L1_CACHE_BYTES	/* Number of lines in a page */
> -	mtctr	r4
> -	mr	r6,r3
> -0:	dcbst	0,r3				/* Write line to ram */
> -	addi	r3,r3,L1_CACHE_BYTES
> -	bdnz	0b
> -	sync
> -	mtctr	r4
> -1:	icbi	0,r6
> -	addi	r6,r6,L1_CACHE_BYTES
> -	bdnz	1b
> -	sync
> -	mtmsr	r10				/* restore DR */
> -	isync
> -	blr
> -#endif
> -#endif /* CONFIG_BOOKE */
> -
>  /*
>   * Copy a whole page.  We use the dcbz instruction on the destination
>   * to reduce memory traffic (it eliminates the unnecessary reads of
> diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
> index 9bc0aa9aeb65..ff20c253f273 100644
> --- a/arch/powerpc/kernel/misc_64.S
> +++ b/arch/powerpc/kernel/misc_64.S
> @@ -49,108 +49,6 @@ _GLOBAL(call_do_irq)
>  	mtlr	r0
>  	blr
>  
> -	.section	".toc","aw"
> -PPC64_CACHES:
> -	.tc		ppc64_caches[TC],ppc64_caches
> -	.section	".text"
> -
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
> -/*
> - * Flush a particular page from the data cache to RAM.
> - * Note: this is necessary because the instruction cache does *not*
> - * snoop from the data cache.
> - *
> - *	void __flush_dcache_icache(void *page)
> - */
> -_GLOBAL(__flush_dcache_icache)
> -/*
> - * Flush the data cache to memory 
> - * 
> - * Different systems have different cache line sizes
> - */
> -
> -BEGIN_FTR_SECTION
> -	PURGE_PREFETCHED_INS
> -	blr
> -END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_ICACHE)
> -
> -/* Flush the dcache */
> - 	ld	r7,PPC64_CACHES@toc(r2)
> -	clrrdi	r3,r3,PAGE_SHIFT           	    /* Page align */
> -	lwz	r4,DCACHEL1BLOCKSPERPAGE(r7)	/* Get # dcache blocks per page */
> -	lwz	r5,DCACHEL1BLOCKSIZE(r7)	/* Get dcache block size */
> -	mr	r6,r3
> -	mtctr	r4
> -0:	dcbst	0,r6
> -	add	r6,r6,r5
> -	bdnz	0b
> -	sync
> -
> -/* Now invalidate the icache */	
> -
> -	lwz	r4,ICACHEL1BLOCKSPERPAGE(r7)	/* Get # icache blocks per page */
> -	lwz	r5,ICACHEL1BLOCKSIZE(r7)	/* Get icache block size */
> -	mtctr	r4
> -1:	icbi	0,r3
> -	add	r3,r3,r5
> -	bdnz	1b
> -	isync
> -	blr
> -
>  _GLOBAL(__bswapdi2)
>  EXPORT_SYMBOL(__bswapdi2)
>  	srdi	r8,r3,32
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index be941d382c8d..54d61ba15e93 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -318,6 +318,120 @@ void free_initmem(void)
>  	free_initmem_default(POISON_FREE_INITMEM);
>  }
>  
> +/**
> + * flush_coherent_icache() - if a CPU has a coherent icache, flush it
> + * @addr: The base address to use (can be any valid address, the whole cache will be flushed)
> + * Return true if the cache was flushed, false otherwise
> + */
> +static inline bool flush_coherent_icache(unsigned long addr)
> +{
> +	/*
> +	 * For a snooping icache, we still need a dummy icbi to purge all the
> +	 * prefetched instructions from the ifetch buffers. We also need a sync
> +	 * before the icbi to order the the actual stores to memory that might
> +	 * have modified instructions with the icbi.
> +	 */
> +	if (cpu_has_feature(CPU_FTR_COHERENT_ICACHE)) {
> +		mb(); /* sync */
> +		icbi((void *)addr);
> +		mb(); /* sync */
> +		isync();
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +/**
> + * invalidate_icache_range() - Flush the icache by issuing icbi across an address range
> + * @start: the start address
> + * @stop: the stop address (exclusive)
> + */
> +static void invalidate_icache_range(unsigned long start, unsigned long stop)
> +{
> +	unsigned long shift = l1_icache_shift();
> +	unsigned long bytes = l1_icache_bytes();
> +	char *addr = (char *)(start & ~(bytes - 1));
> +	unsigned long size = stop - (unsigned long)addr + (bytes - 1);
> +	unsigned long i;
> +
> +	for (i = 0; i < size >> shift; i++, addr += bytes)
> +		icbi(addr);
> +
> +	mb(); /* sync */
> +	isync();
> +}
> +
> +/**
> + * flush_icache_range: Write any modified data cache blocks out to memory
> + * and invalidate the corresponding blocks in the instruction cache
> + *
> + * Generic code will call this after writing memory, before executing from it.
> + *
> + * @start: the start address
> + * @stop: the stop address (exclusive)
> + */
> +void flush_icache_range(unsigned long start, unsigned long stop)
> +{
> +	if (flush_coherent_icache(start))
> +		return;
> +
> +	clean_dcache_range(start, stop);
> +
> +	if (IS_ENABLED(CONFIG_44x)) {
> +		/*
> +		 * Flash invalidate on 44x because we are passed kmapped
> +		 * addresses and this doesn't work for userspace pages due to
> +		 * the virtually tagged icache.
> +		 */
> +		iccci((void *)start);
> +		mb(); /* sync */
> +		isync();
> +	} else
> +		invalidate_icache_range(start, stop);
> +}
> +EXPORT_SYMBOL(flush_icache_range);
> +
> +#if !defined(CONFIG_PPC_8xx) && !defined(CONFIG_PPC64)
> +/**
> + * flush_dcache_icache_phys() - Flush a page by it's physical address
> + * @physaddr: the physical address of the page
> + */
> +static void flush_dcache_icache_phys(unsigned long physaddr)
> +{
> +	unsigned long bytes = l1_dcache_bytes();
> +	unsigned long nb = PAGE_SIZE / bytes;
> +	unsigned long addr = physaddr & PAGE_MASK;
> +	unsigned long msr, msr0;
> +	unsigned long loop1 = addr, loop2 = addr;
> +
> +	msr0 = mfmsr();
> +	msr = msr0 & ~MSR_DR;
> +	/*
> +	 * This must remain as ASM to prevent potential memory accesses
> +	 * while the data MMU is disabled
> +	 */
> +	asm volatile(
> +		"   mtctr %2;\n"
> +		"   mtmsr %3;\n"
> +		"   isync;\n"
> +		"0: dcbst   0, %0;\n"
> +		"   addi    %0, %0, %4;\n"
> +		"   bdnz    0b;\n"
> +		"   sync;\n"
> +		"   mtctr %2;\n"
> +		"1: icbi    0, %1;\n"
> +		"   addi    %1, %1, %4;\n"
> +		"   bdnz    1b;\n"
> +		"   sync;\n"
> +		"   mtmsr %5;\n"
> +		"   isync;\n"
> +		: "+&r" (loop1), "+&r" (loop2)
> +		: "r" (nb), "r" (msr), "i" (bytes), "r" (msr0)
> +		: "ctr", "memory");
> +}
> +#endif // !defined(CONFIG_PPC_8xx) && !defined(CONFIG_PPC64)
> +
>  /*
>   * This is called when a page has been modified by the kernel.
>   * It just marks the page as not i-cache clean.  We do the i-cache
> @@ -350,12 +464,47 @@ void flush_dcache_icache_page(struct page *page)
>  		__flush_dcache_icache(start);
>  		kunmap_atomic(start);
>  	} else {
> -		__flush_dcache_icache_phys(page_to_pfn(page) << PAGE_SHIFT);
> +		unsigned long addr = page_to_pfn(page) << PAGE_SHIFT;
> +
> +		if (flush_coherent_icache((void *)addr))

That's wrong:

arch/powerpc/mm/mem.c:469:29: error: passing argument 1 of 'flush_coherent_icache' makes integer from pointer without a cast [-Werror=int-conversion]
      if (flush_coherent_icache((void *)addr))

I fixed it.

> +			return;
> +		flush_dcache_icache_phys(addr);
>  	}
>  #endif
>  }
>  EXPORT_SYMBOL(flush_dcache_icache_page);
>  
> +/**
> + * __flush_dcache_icache(): Flush a particular page from the data cache to RAM.
> + * Note: this is necessary because the instruction cache does *not*
> + * snoop from the data cache.
> + *
> + * @page: the address of the page to flush
> + */
> +void __flush_dcache_icache(void *page)

I know it used to be called page, but I'd prefer we reserve that for
struct page * pointers.

So I'll rename it p.

> +{
> +	u64 addr = (u64)page;

This is wrong on 32-bit:

arch/powerpc/mm/mem.c:486:13: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
     u64 addr = (u64)page;

I fixed it to be unsigned long.

> +
> +	if (flush_coherent_icache(addr))
> +		return;
> +
> +	clean_dcache_range(addr, addr + PAGE_SIZE);
> +
> +	/*
> +	 * We don't flush the icache on 44x. Those have a virtual icache and we
> +	 * don't have access to the virtual address here (it's not the page
> +	 * vaddr but where it's mapped in user space). The flushing of the
> +	 * icache on these is handled elsewhere, when a change in the address
> +	 * space occurs, before returning to user space.
> +	 */
> +
> +	if (cpu_has_feature(MMU_FTR_TYPE_44x))
> +		return;
> +
> +	invalidate_icache_range(addr, addr + PAGE_SIZE);
> +}
> +EXPORT_SYMBOL(__flush_dcache_icache);

This was not previously exported, and doesn't need to be AFAICS, so I
dropped the export.

cheers
