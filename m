Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D11E4330FA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 10:23:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYRZY4LFVz3cRY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 19:23:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYRZ71qXkz2yMV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 19:22:37 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HYRZ1331Gz9sTD;
 Tue, 19 Oct 2021 10:22:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vyGHeFQ50GL3; Tue, 19 Oct 2021 10:22:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HYRZ11rn3z9sTB;
 Tue, 19 Oct 2021 10:22:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2508E8B778;
 Tue, 19 Oct 2021 10:22:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8GyFeGGdsjcw; Tue, 19 Oct 2021 10:22:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.83])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B8E678B763;
 Tue, 19 Oct 2021 10:22:32 +0200 (CEST)
Subject: Re: [PATCH v1 09/11] powerpc/64s: Make hash MMU code build
 configurable
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211015154624.922960-1-npiggin@gmail.com>
 <20211015154624.922960-10-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <eb342e34-8a97-a7f1-ee56-c8874b1bcd85@csgroup.eu>
Date: Tue, 19 Oct 2021 10:05:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211015154624.922960-10-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
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



Le 15/10/2021 à 17:46, Nicholas Piggin a écrit :
> Introduce a new option CONFIG_PPC_64S_HASH_MMU which allows the 64s hash
> MMU code to be compiled out if radix is selected and the minimum
> supported CPU type is POWER9 or higher, and KVM is not selected.
> 
> This saves 128kB kernel image size (90kB text) on powernv_defconfig
> minus KVM, 350kB on pseries_defconfig minus KVM, 40kB on a tiny config.

This patch is huge, it could be split in several smaller patches ?

I'm sure at least the Kconfig stuff can be do as a second step. In first 
step just make CONFIG_PPC_64S_HASH_MMU always y.

I'm wondering if we could also reduce the amount of #ifdefs in C files, 
by using IS_ENABLED() and/or stubs defined in H files.

> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/Kconfig                          |  1 +
>   arch/powerpc/include/asm/book3s/64/mmu.h      | 22 ++++++++++++++++++-
>   .../include/asm/book3s/64/tlbflush-hash.h     |  7 ++++++
>   arch/powerpc/include/asm/book3s/pgtable.h     |  4 ++++
>   arch/powerpc/include/asm/mmu.h                | 14 +++++++++---
>   arch/powerpc/include/asm/mmu_context.h        |  2 ++
>   arch/powerpc/include/asm/paca.h               |  8 +++++++
>   arch/powerpc/kernel/asm-offsets.c             |  2 ++
>   arch/powerpc/kernel/dt_cpu_ftrs.c             |  8 ++++++-
>   arch/powerpc/kernel/entry_64.S                |  4 ++--
>   arch/powerpc/kernel/exceptions-64s.S          | 16 ++++++++++++++
>   arch/powerpc/kernel/mce.c                     |  2 +-
>   arch/powerpc/kernel/mce_power.c               | 10 ++++++---
>   arch/powerpc/kernel/paca.c                    | 18 ++++++---------
>   arch/powerpc/kernel/process.c                 | 13 ++++++-----
>   arch/powerpc/kernel/prom.c                    |  2 ++
>   arch/powerpc/kernel/setup_64.c                |  4 ++++
>   arch/powerpc/kexec/core_64.c                  |  4 ++--
>   arch/powerpc/kexec/ranges.c                   |  4 ++++
>   arch/powerpc/kvm/Kconfig                      |  1 +
>   arch/powerpc/mm/book3s64/Makefile             | 17 ++++++++------
>   arch/powerpc/mm/book3s64/hash_utils.c         | 10 ---------
>   .../{hash_hugetlbpage.c => hugetlbpage.c}     |  6 +++++
>   arch/powerpc/mm/book3s64/mmu_context.c        | 16 ++++++++++++++
>   arch/powerpc/mm/book3s64/pgtable.c            | 12 ++++++++++
>   arch/powerpc/mm/book3s64/radix_pgtable.c      |  4 ++++
>   arch/powerpc/mm/copro_fault.c                 |  2 ++
>   arch/powerpc/mm/pgtable.c                     | 10 ++++++---
>   arch/powerpc/platforms/Kconfig.cputype        | 21 +++++++++++++++++-
>   arch/powerpc/platforms/cell/Kconfig           |  1 +
>   arch/powerpc/platforms/maple/Kconfig          |  1 +
>   arch/powerpc/platforms/microwatt/Kconfig      |  2 +-
>   arch/powerpc/platforms/pasemi/Kconfig         |  1 +
>   arch/powerpc/platforms/powermac/Kconfig       |  1 +
>   arch/powerpc/platforms/powernv/Kconfig        |  2 +-
>   arch/powerpc/platforms/powernv/idle.c         |  2 ++
>   arch/powerpc/platforms/powernv/setup.c        |  2 ++
>   arch/powerpc/platforms/pseries/lpar.c         | 11 ++++++++--
>   arch/powerpc/platforms/pseries/lparcfg.c      |  2 +-
>   arch/powerpc/platforms/pseries/mobility.c     |  6 +++++
>   arch/powerpc/platforms/pseries/ras.c          |  2 ++
>   arch/powerpc/platforms/pseries/reconfig.c     |  2 ++
>   arch/powerpc/platforms/pseries/setup.c        |  6 +++--
>   arch/powerpc/xmon/xmon.c                      |  8 +++++--
>   44 files changed, 233 insertions(+), 60 deletions(-)
>   rename arch/powerpc/mm/book3s64/{hash_hugetlbpage.c => hugetlbpage.c} (95%)
> 

> diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
> index 8abe8e42e045..0f89fcab834d 100644
> --- a/arch/powerpc/include/asm/mmu.h
> +++ b/arch/powerpc/include/asm/mmu.h
> @@ -157,7 +157,7 @@ DECLARE_PER_CPU(int, next_tlbcam_idx);
>   
>   enum {
>   	MMU_FTRS_POSSIBLE =
> -#if defined(CONFIG_PPC_BOOK3S_64) || defined(CONFIG_PPC_BOOK3S_604)
> +#if defined(CONFIG_PPC_BOOK3S_604)
>   		MMU_FTR_HPTE_TABLE |
>   #endif
>   #ifdef CONFIG_PPC_8xx
> @@ -184,15 +184,18 @@ enum {
>   		MMU_FTR_USE_TLBRSRV | MMU_FTR_USE_PAIRED_MAS |
>   #endif
>   #ifdef CONFIG_PPC_BOOK3S_64
> +		MMU_FTR_KERNEL_RO |
> +#ifdef CONFIG_PPC_64S_HASH_MMU
>   		MMU_FTR_NO_SLBIE_B | MMU_FTR_16M_PAGE | MMU_FTR_TLBIEL |
>   		MMU_FTR_LOCKLESS_TLBIE | MMU_FTR_CI_LARGE_PAGE |
>   		MMU_FTR_1T_SEGMENT | MMU_FTR_TLBIE_CROP_VA |
> -		MMU_FTR_KERNEL_RO | MMU_FTR_68_BIT_VA |
> +		MMU_FTR_68_BIT_VA | MMU_FTR_HPTE_TABLE |
>   #endif
>   #ifdef CONFIG_PPC_RADIX_MMU
>   		MMU_FTR_TYPE_RADIX |
>   		MMU_FTR_GTSE |
>   #endif /* CONFIG_PPC_RADIX_MMU */
> +#endif
>   #ifdef CONFIG_PPC_KUAP
>   	MMU_FTR_BOOK3S_KUAP |
>   #endif /* CONFIG_PPC_KUAP */
> @@ -223,6 +226,11 @@ enum {
>   #ifdef CONFIG_E500
>   #define MMU_FTRS_ALWAYS		MMU_FTR_TYPE_FSL_E
>   #endif
> +#ifdef CONFIG_PPC_BOOK3S_64
> +#if defined(CONFIG_PPC_RADIX_MMU) && !defined(CONFIG_PPC_64S_HASH_MMU)
> +#define MMU_FTRS_ALWAYS		MMU_FTR_TYPE_RADIX
> +#endif
> +#endif

Should you also set MMU_FTR_HPTE_TABLE in MMU_FTRS_ALWAYS when HAS_MMU 
&& !RADIX ?

>   
>   #ifndef MMU_FTRS_ALWAYS
>   #define MMU_FTRS_ALWAYS		0
> @@ -329,7 +337,7 @@ static __always_inline bool radix_enabled(void)
>   	return mmu_has_feature(MMU_FTR_TYPE_RADIX);
>   }
>   
> -static inline bool early_radix_enabled(void)
> +static __always_inline bool early_radix_enabled(void)
>   {
>   	return early_mmu_has_feature(MMU_FTR_TYPE_RADIX);
>   }

> diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
> index c10fc8a72fb3..642cabc25e99 100644
> --- a/arch/powerpc/mm/book3s64/mmu_context.c
> +++ b/arch/powerpc/mm/book3s64/mmu_context.c
> @@ -31,6 +31,7 @@ static int alloc_context_id(int min_id, int max_id)
>   	return ida_alloc_range(&mmu_context_ida, min_id, max_id, GFP_KERNEL);
>   }
>   
> +#ifdef CONFIG_PPC_64S_HASH_MMU
>   void hash__reserve_context_id(int id)
>   {
>   	int result = ida_alloc_range(&mmu_context_ida, id, id, GFP_KERNEL);
> @@ -50,7 +51,9 @@ int hash__alloc_context_id(void)
>   	return alloc_context_id(MIN_USER_CONTEXT, max);
>   }
>   EXPORT_SYMBOL_GPL(hash__alloc_context_id);
> +#endif
>   
> +#ifdef CONFIG_PPC_64S_HASH_MMU
>   static int realloc_context_ids(mm_context_t *ctx)
>   {
>   	int i, id;
> @@ -144,12 +147,15 @@ static int hash__init_new_context(struct mm_struct *mm)
>   	return index;
>   }
>   
> +void slb_setup_new_exec(void);
> +
>   void hash__setup_new_exec(void)
>   {
>   	slice_setup_new_exec();
>   
>   	slb_setup_new_exec();
>   }
> +#endif
>   
>   static int radix__init_new_context(struct mm_struct *mm)
>   {
> @@ -175,7 +181,9 @@ static int radix__init_new_context(struct mm_struct *mm)
>   	 */
>   	asm volatile("ptesync;isync" : : : "memory");
>   
> +#ifdef CONFIG_PPC_64S_HASH_MMU
>   	mm->context.hash_context = NULL;
> +#endif
>   
>   	return index;
>   }
> @@ -186,8 +194,10 @@ int init_new_context(struct task_struct *tsk, struct mm_struct *mm)
>   
>   	if (radix_enabled())
>   		index = radix__init_new_context(mm);
> +#ifdef CONFIG_PPC_64S_HASH_MMU
>   	else
>   		index = hash__init_new_context(mm);
> +#endif

I really dislike #ifdef nested in if/else.

Can you do something like

	if (radix_enabled()
		index = radix__init_new_context(mm);
	else if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
		index = hash__init_new_context(mm);


>   
>   	if (index < 0)
>   		return index;
> @@ -211,6 +221,7 @@ void __destroy_context(int context_id)
>   }
>   EXPORT_SYMBOL_GPL(__destroy_context);
>   
> +#ifdef CONFIG_PPC_64S_HASH_MMU
>   static void destroy_contexts(mm_context_t *ctx)
>   {
>   	int index, context_id;
> @@ -222,6 +233,7 @@ static void destroy_contexts(mm_context_t *ctx)
>   	}
>   	kfree(ctx->hash_context);
>   }
> +#endif
>   
>   static void pmd_frag_destroy(void *pmd_frag)
>   {
> @@ -274,7 +286,11 @@ void destroy_context(struct mm_struct *mm)
>   		process_tb[mm->context.id].prtb0 = 0;
>   	else
>   		subpage_prot_free(mm);
> +#ifdef CONFIG_PPC_64S_HASH_MMU
>   	destroy_contexts(&mm->context);
> +#else
> +	ida_free(&mmu_context_ida, mm->context.id);

Is that correct ? Was it done somewhere else before ?

> +#endif
>   	mm->context.id = MMU_NO_CONTEXT;
>   }
>   

