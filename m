Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDD730DBA1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 14:47:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW2zQ5tSRzF46G
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 00:46:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=UoQyeBPg; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW0Jw1LJVzDwx1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:46:48 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id o7so17207876pgl.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Feb 2021 03:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=Mo+S7c1d6Db+7hFm0Zrt1D/hAN6B6Q5z4DnED36YrYs=;
 b=UoQyeBPgFHkRe3lCoRLwowDphJC8q5mNgshbMs5i8mbOpsbZV3m7VUL85hGeJ8vNtM
 vEqjfPnAAannwKbrdk5XUh9uEoOrvITJxpgVXoYIHbhbgX9Fjk7whCxqMvahaTM7R4/+
 TaLR4svsiZXLoFL6cswWWLYJ37OGHQw3pcV2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Mo+S7c1d6Db+7hFm0Zrt1D/hAN6B6Q5z4DnED36YrYs=;
 b=O99ZOm0P9DsD1Y4h5YffxMc5ZacatJeWZkvpLDKeGsX5iHE+dMT3DnF4Yyd1v0ph5i
 3gR+6v39+SA9Kqjd2N97We9MEWQ6ibUFMscUHld2sWQ19gCEEb+GIUpifryw7RGfvRYO
 f1l6KiQsHM7X//mCkFUM7BO7c4XUheEOwY/NDYKodTfcATuh6+1uPK7fI2ibYT65/0rC
 O9DavuFsooBshgr/ML3kxYJ6UC9FU0mwZhknE5Wv5RoW91LEFVd7oDJRHKiZrmZnfU8A
 4Q5/jjlieF8DIPUuMqkiIKKuN3COErN9E45aFmJAuHZX13DTaa50qXjVGEBYko32PpgP
 6hrg==
X-Gm-Message-State: AOAM5300bvV24AmgFLkLn36UHlA0zdJkrz209BVoaQbKga8ITgnFgtlH
 rk36EAqoBJDimvtG+hRVnxNqKw==
X-Google-Smtp-Source: ABdhPJxvzKd+Hz3WH2hGruwRpnDldV2FCuFnGmJwe3SWH4JD6x4CJE2mXTANdGJisq+N6cueX7Jvkw==
X-Received: by 2002:a62:794f:0:b029:1b4:59d1:df8d with SMTP id
 u76-20020a62794f0000b02901b459d1df8dmr2724614pfc.14.1612352803952; 
 Wed, 03 Feb 2021 03:46:43 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-1c59-4eca-f876-fd51.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:1c59:4eca:f876:fd51])
 by smtp.gmail.com with ESMTPSA id z2sm2533103pgl.49.2021.02.03.03.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 03:46:43 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: Re: [PATCH v9 6/6] powerpc: Book3S 64-bit outline-only KASAN support
In-Reply-To: <251530bd-49ab-4d6e-13bc-03f97edafcc4@csgroup.eu>
References: <20201201161632.1234753-1-dja@axtens.net>
 <20201201161632.1234753-7-dja@axtens.net>
 <251530bd-49ab-4d6e-13bc-03f97edafcc4@csgroup.eu>
Date: Wed, 03 Feb 2021 22:46:39 +1100
Message-ID: <878s85wezk.fsf@dja-thinkpad.axtens.net>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

>>   	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
>>   	select HAVE_ARCH_JUMP_LABEL
>>   	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
>> -	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <= 14
>> +	select HAVE_ARCH_KASAN			if PPC_BOOK3S_64 && PPC_RADIX_MMU
>
> PPC_RADIX_MMU already depends on PPC_BOOK3S_64 so 'if PPC_RADIX_MMU' would be enough

Done.

>> +	select HAVE_ARCH_NO_KASAN_INLINE	if PPC_BOOK3S_64 && PPC_RADIX_MMU
>
> This list must respect Alphabetical order.

Fixed.

>
>> +	select HAVE_ARCH_KASAN_VMALLOC		if HAVE_ARCH_KASAN
>>   	select HAVE_ARCH_KGDB
>>   	select HAVE_ARCH_MMAP_RND_BITS
>>   	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
>> diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
>> index b88900f4832f..60c1bba72a6f 100644
>> --- a/arch/powerpc/Kconfig.debug
>> +++ b/arch/powerpc/Kconfig.debug
>> @@ -396,5 +396,5 @@ config PPC_FAST_ENDIAN_SWITCH
>>   
>>   config KASAN_SHADOW_OFFSET
>>   	hex
>> -	depends on KASAN
>> +	depends on KASAN && PPC32
>>   	default 0xe0000000
>
> Instead of the above, why not doing:
>
> 	default 0xe0000000 if PPC32
> 	default 0xa80e000000000000 is PPC_BOOK3S_64

Done. I just used PPC64.

>
>> diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
>> index 73ad038ed10b..105b90594a8a 100644
>> --- a/arch/powerpc/include/asm/book3s/64/hash.h
>> +++ b/arch/powerpc/include/asm/book3s/64/hash.h
>> @@ -18,6 +18,10 @@
>>   #include <asm/book3s/64/hash-4k.h>
>>   #endif
>>   
>> +#define H_PTRS_PER_PTE		(1 << H_PTE_INDEX_SIZE)
>> +#define H_PTRS_PER_PMD		(1 << H_PMD_INDEX_SIZE)
>> +#define H_PTRS_PER_PUD		(1 << H_PUD_INDEX_SIZE)
>> +
>>   /* Bits to set in a PMD/PUD/PGD entry valid bit*/
>>   #define HASH_PMD_VAL_BITS		(0x8000000000000000UL)
>>   #define HASH_PUD_VAL_BITS		(0x8000000000000000UL)
>> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> index a39886681629..767e239d75e3 100644
>> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> @@ -230,6 +230,13 @@ extern unsigned long __pmd_frag_size_shift;
>>   #define PTRS_PER_PUD	(1 << PUD_INDEX_SIZE)
>>   #define PTRS_PER_PGD	(1 << PGD_INDEX_SIZE)
>>   
>> +#define MAX_PTRS_PER_PTE	((H_PTRS_PER_PTE > R_PTRS_PER_PTE) ? \
>> +				  H_PTRS_PER_PTE : R_PTRS_PER_PTE)
>
> Nowadays we allow 100 chars per line. Could this fit on a single line ?

Yes, so long as we drop the tab between the name and the definition and
replace it with a single space.

>> +#define MAX_PTRS_PER_PMD	((H_PTRS_PER_PMD > R_PTRS_PER_PMD) ? \
>> +				  H_PTRS_PER_PMD : R_PTRS_PER_PMD)
>> +#define MAX_PTRS_PER_PUD	((H_PTRS_PER_PUD > R_PTRS_PER_PUD) ? \
>> +				  H_PTRS_PER_PUD : R_PTRS_PER_PUD)
>> +
>>   /* PMD_SHIFT determines what a second-level page table entry can map */
>>   #define PMD_SHIFT	(PAGE_SHIFT + PTE_INDEX_SIZE)
>>   #define PMD_SIZE	(1UL << PMD_SHIFT)

>> +#ifdef CONFIG_PPC32
>>   #define KASAN_SHADOW_END	(-(-KASAN_SHADOW_START >> KASAN_SHADOW_SCALE_SHIFT))
>> +#endif
>> +
>> +#ifdef CONFIG_PPC_BOOK3S_64
>> +/*
>> + * We define the  offset such that the shadow of the linear map lives
>> + * at the end of vmemmap space, that is, we choose offset such that
>> + * shadow(c000_0000_0000_0000) = c00e_0000_0000_0000. This gives:
>> + * c00e000000000000 - c000000000000000 >> 3 = a80e000000000000
>> + */
>> +#define KASAN_SHADOW_OFFSET ASM_CONST(0xa80e000000000000)
>
> Why can't you use CONFIG_KASAN_SHADOW_OFFSET ?

I didn't do this earlier due to some interesting interactions in the
generic configuration. The generic Kconfig/Makefile will turn on stack
instrumentation if CONFIG_KASAN_SHADOW_OFFSET is set. This, however,
creates a bunch of inline code that crashes on ppc64 when it runs
translations off.

I've made changes to the patch that introduces ARCH_DISABLE_KASAN_INLINE
to fix this, and converted to using CONFIG_KASAN_SHADOW_OFFSET.

>> +
>> +/*
>> + * The shadow ends before the highest accessible address
>> + * because we don't need a shadow for the shadow. Instead:
>> + * c00e000000000000 << 3 + a80e000000000000000 = c00fc00000000000
>> + */
>> +#define KASAN_SHADOW_END 0xc00fc00000000000UL
>
> I think we should be able to have a common formula for PPC32 and PPC64.
>

Perhaps, but I can't figure out what it would be. For PPC64,
end = start + (size of kernel space + vmalloc space + ioremap space + vmemmap space) >> 3
For PPC32, AIUI you don't have vmemmap space so I'm not sure how to
calculate it.

>> +
>> +DECLARE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
>> +
>> +static inline bool kasan_arch_is_ready_ppc64(void)
>
> I'd make it __always_inline

Done.

>> +{
>> +	if (static_branch_likely(&powerpc_kasan_enabled_key))
>> +		return true;
>> +	return false;
>> +}
>> +
>> +#define kasan_arch_is_ready kasan_arch_is_ready_ppc64
>
> Usually we keep the generic name, you don't need to have an arch specific name.

Done.

>> +#endif
>>   
>>   #ifdef CONFIG_KASAN
>>   void kasan_early_init(void);
>> @@ -47,5 +79,5 @@ void kasan_update_early_region(unsigned long k_start, unsigned long k_end, pte_t
>>   int kasan_init_shadow_page_tables(unsigned long k_start, unsigned long k_end);
>>   int kasan_init_region(void *start, size_t size);
>>   
>> -#endif /* __ASSEMBLY */
>> +#endif /* !__ASSEMBLY__ */
>
> This patch is already big. Is that worth it ?

Fair enough. Dropped.

>>   #endif
>> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
>> index fe2ef598e2ea..cd58202459dd 100644
>> --- a/arch/powerpc/kernel/Makefile
>> +++ b/arch/powerpc/kernel/Makefile
>> @@ -32,6 +32,11 @@ KASAN_SANITIZE_early_32.o := n
>>   KASAN_SANITIZE_cputable.o := n
>>   KASAN_SANITIZE_prom_init.o := n
>>   KASAN_SANITIZE_btext.o := n
>> +KASAN_SANITIZE_paca.o := n
>> +KASAN_SANITIZE_setup_64.o := n
>
> The entire setup_64 ?
> Can you split things out into an early_64.o like was done for ppc32 ?

setup_64.c contains around 40 functions, of which about half are not __init:

cpu_ready_for_interrupts

smp setup/maintenance functions:
 early_setup_secondary
 panic_smp_self_stop
 use_spinloop
 smp_release_cpus
(Some of these we couldn't instrument anyway as they use real addresses.)

Functions which AFAICT should be marked __init, as they're static and
only called from __init functions:
 init_cache_info
 pcpu_cpu_distance

Tiny functions:
 memory_block_size_bytes
 hw_nmi_get_sample_period

Flush maintenance:
 do_nothing (an empty function)
 init_fallback_flush
 setup_{rfi,entry,uaccess}_flush (3 functions)
 {rfi,entry,uaccess}_flush_{get,set,enable} (9 functions)

We don't really get much value from instrumenting any of these, but we
could split out at least the flush maintenance ones if we really wanted
to.

I'd say there isn't enough value in moving them to justify the churn but
I'm happy to move them if people feel differently.

>> +KASAN_SANITIZE_mce.o := n
>> +KASAN_SANITIZE_traps.o := n
>
> Why ? ppc32 doesn't need that.

Some of that code runs with translations off. If we try to access the
shadow region with translations off, things will crash. This is part of
what I gave up in order to be able to have the one kernel binary work
regardless of the quantity of physical memory.

Only traps.c is compiled for ppc32, I'll wrap it so that it's still
instrumented there.

> +KASAN_SANITIZE_mce_power.o := n
>>   
>>   ifdef CONFIG_KASAN
>>   CFLAGS_early_32.o += -DDISABLE_BRANCH_PROFILING

>> +
>> +	va = memblock_alloc(k_end - k_start, PAGE_SIZE);
>> +	for (k_cur = k_start; k_cur < k_end; k_cur += PAGE_SIZE) {
>> +		map_kernel_page(k_cur, __pa(va), PAGE_KERNEL);
>> +		va += PAGE_SIZE;
>> +	}
>
> What about:
>
> 	for (k_cur = k_start; k_cur < k_end; k_cur += PAGE_SIZE, va += PAGE_SIZE)
> 		map_kernel_page(k_cur, __pa(va), PAGE_KERNEL);
>

Done.

>> +}
>> +
>> +void __init kasan_init(void)
>> +{
>> +	/*
>> +	 * We want to do the following things:
>> +	 *  1) Map real memory into the shadow for all physical memblocks
>> +	 *     This takes us from c000... to c008...
>> +	 *  2) Leave a hole over the shadow of vmalloc space. KASAN_VMALLOC
>> +	 *     will manage this for us.
>> +	 *     This takes us from c008... to c00a...
>> +	 *  3) Map the 'early shadow'/zero page over iomap and vmemmap space.
>> +	 *     This takes us up to where we start at c00e...
>> +	 */
>> +
>> +	void *k_start = kasan_mem_to_shadow((void *)RADIX_VMALLOC_END);
>> +	void *k_end = kasan_mem_to_shadow((void *)RADIX_VMEMMAP_END);
>> +	phys_addr_t start, end;
>> +	u64 i;
>> +	pte_t zero_pte = pfn_pte(virt_to_pfn(kasan_early_shadow_page), PAGE_KERNEL);
>> +
>> +	if (!early_radix_enabled())
>> +		panic("KASAN requires radix!");
>> +
>> +	for_each_mem_range(i, &start, &end) {
>> +		kasan_init_phys_region((void *)start, (void *)end);
>> +	}
>
> No need of { } for single line loops. Check the kernel codyign stype

Fixed.

>> +
>> +	for (i = 0; i < PTRS_PER_PTE; i++)
>> +		__set_pte_at(&init_mm, (unsigned long)kasan_early_shadow_page,
>> +			     &kasan_early_shadow_pte[i], zero_pte, 0);
>> +
>> +	for (i = 0; i < PTRS_PER_PMD; i++)
>> +		pmd_populate_kernel(&init_mm, &kasan_early_shadow_pmd[i],
>> +				    kasan_early_shadow_pte);
>> +
>> +	for (i = 0; i < PTRS_PER_PUD; i++)
>> +		pud_populate(&init_mm, &kasan_early_shadow_pud[i],
>> +			     kasan_early_shadow_pmd);
>> +
>> +	/* map the early shadow over the iomap and vmemmap space */
>> +	kasan_populate_early_shadow(k_start, k_end);
>> +
>> +	/* mark early shadow region as RO and wipe it */
>> +	zero_pte = pfn_pte(virt_to_pfn(kasan_early_shadow_page), PAGE_KERNEL_RO);
>> +	for (i = 0; i < PTRS_PER_PTE; i++)
>> +		__set_pte_at(&init_mm, (unsigned long)kasan_early_shadow_page,
>> +			     &kasan_early_shadow_pte[i], zero_pte, 0);
>> +
>> +	/*
>> +	 * clear_page relies on some cache info that hasn't been set up yet.
>> +	 * It ends up looping ~forever and blows up other data.
>> +	 * Use memset instead.
>> +	 */
>> +	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
>> +
>> +	static_branch_inc(&powerpc_kasan_enabled_key);
>> +
>> +	/* Enable error messages */
>> +	init_task.kasan_depth = 0;
>> +	pr_info("KASAN init done (64-bit Book3S)\n");
>> +}
>> +
>> +void __init kasan_late_init(void) { }
>> diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
>> index aca354fb670b..63672aa656e8 100644
>> --- a/arch/powerpc/mm/ptdump/ptdump.c
>> +++ b/arch/powerpc/mm/ptdump/ptdump.c
>> @@ -20,6 +20,7 @@
>>   #include <linux/seq_file.h>
>>   #include <asm/fixmap.h>
>>   #include <linux/const.h>
>> +#include <linux/kasan.h>
>>   #include <asm/page.h>
>>   #include <asm/hugetlb.h>
>>   
>> @@ -317,6 +318,23 @@ static void walk_pud(struct pg_state *st, p4d_t *p4d, unsigned long start)
>>   	unsigned long addr;
>>   	unsigned int i;
>>   
>> +#if defined(CONFIG_KASAN) && defined(CONFIG_PPC_BOOK3S_64)
>> +	/*
>> +	 * On radix + KASAN, we want to check for the KASAN "early" shadow
>> +	 * which covers huge quantities of memory with the same set of
>> +	 * read-only PTEs. If it is, we want to note the first page (to see
>> +	 * the status change), and then note the last page. This gives us good
>> +	 * results without spending ages noting the exact same PTEs over 100s of
>> +	 * terabytes of memory.
>> +	 */
>> +	if (p4d_page(*p4d) == virt_to_page(lm_alias(kasan_early_shadow_pud))) {
>> +		walk_pmd(st, pud, start);
>> +		addr = start + (PTRS_PER_PUD - 1) * PUD_SIZE;
>> +		walk_pmd(st, pud, addr);
>> +		return;
>> +	}
>> +#endif
>
> Why do you need that ? When PTEs are all pointing to the same page, it shoud already appear in a 
> single line into []

It would eventually be printed as one line, but first you have to
traverse ~7.5 billion PTEs. It's the process of walking that that takes
too long, not the printing.

Thanks for the review, I'll have a new spin out soon.

Kind regards,
Daniel
