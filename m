Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AE335994F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 11:35:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGtKg1YLGz3brM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 19:35:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGtKJ528gz2yxl
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 19:35:29 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FGtK85pZ8z9vBLl;
 Fri,  9 Apr 2021 11:35:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id uq813t82CATX; Fri,  9 Apr 2021 11:35:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FGtK84CGyz9vBLh;
 Fri,  9 Apr 2021 11:35:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BDAA48B7E1;
 Fri,  9 Apr 2021 11:35:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wpfiCXxm5IY3; Fri,  9 Apr 2021 11:35:25 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F0BF28B7DE;
 Fri,  9 Apr 2021 11:35:24 +0200 (CEST)
Subject: Re: [PATCH v3 8/9] mm/mremap: Allow arch runtime override
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20210330060752.592769-1-aneesh.kumar@linux.ibm.com>
 <20210330060752.592769-9-aneesh.kumar@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c421c3cb-6e9a-6db0-9e4b-f7a7e9a6c1cc@csgroup.eu>
Date: Fri, 9 Apr 2021 11:35:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210330060752.592769-9-aneesh.kumar@linux.ibm.com>
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
Cc: joel@joelfernandes.org, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 kaleshsingh@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/03/2021 à 08:07, Aneesh Kumar K.V a écrit :
> Architectures like ppc64 can only support faster mremap only with radix

... only .... only ...

> translation. Hence allow a runtime check w.r.t support for fast mremap.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   arch/arc/include/asm/tlb.h     |  5 +++++
>   arch/arm64/include/asm/tlb.h   |  6 ++++++
>   arch/powerpc/include/asm/tlb.h |  6 ++++++
>   arch/x86/include/asm/tlb.h     |  5 +++++
>   mm/mremap.c                    | 14 +++++++++++++-
>   5 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arc/include/asm/tlb.h b/arch/arc/include/asm/tlb.h
> index 975b35d3738d..22b8cfb46cbf 100644
> --- a/arch/arc/include/asm/tlb.h
> +++ b/arch/arc/include/asm/tlb.h
> @@ -9,4 +9,9 @@
>   #include <linux/pagemap.h>
>   #include <asm-generic/tlb.h>
>   
> +#define arch_supports_page_tables_move arch_supports_page_tables_move
> +static inline bool arch_supports_page_tables_move(void)
> +{
> +	return true;
> +}

I can't see why ARC arch needs that. It neither selects CONFIG_HAVE_MOVE_PMD nor CONFIG_HAVE_MOVE_PUD.


>   #endif /* _ASM_ARC_TLB_H */
> diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
> index 61c97d3b58c7..fe209efc6a10 100644
> --- a/arch/arm64/include/asm/tlb.h
> +++ b/arch/arm64/include/asm/tlb.h
> @@ -94,4 +94,10 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
>   }
>   #endif
>   
> +#define arch_supports_page_tables_move arch_supports_page_tables_move
> +static inline bool arch_supports_page_tables_move(void)
> +{
> +	return true;
> +}
> +
>   #endif
> diff --git a/arch/powerpc/include/asm/tlb.h b/arch/powerpc/include/asm/tlb.h
> index 160422a439aa..058918a7cd3c 100644
> --- a/arch/powerpc/include/asm/tlb.h
> +++ b/arch/powerpc/include/asm/tlb.h
> @@ -83,5 +83,11 @@ static inline int mm_is_thread_local(struct mm_struct *mm)
>   }
>   #endif
>   
> +#define arch_supports_page_tables_move arch_supports_page_tables_move
> +static inline bool arch_supports_page_tables_move(void)
> +{
> +	return radix_enabled();
> +}
> +
>   #endif /* __KERNEL__ */
>   #endif /* __ASM_POWERPC_TLB_H */
> diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
> index 1bfe979bb9bc..62915238bb36 100644
> --- a/arch/x86/include/asm/tlb.h
> +++ b/arch/x86/include/asm/tlb.h
> @@ -37,4 +37,9 @@ static inline void __tlb_remove_table(void *table)
>   	free_page_and_swap_cache(table);
>   }
>   
> +#define arch_supports_page_tables_move arch_supports_page_tables_move
> +static inline bool arch_supports_page_tables_move(void)
> +{
> +	return true;
> +}
>   #endif /* _ASM_X86_TLB_H */
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 7ac1df8e6d51..4d812af3e44b 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -25,7 +25,7 @@
>   #include <linux/userfaultfd_k.h>
>   
>   #include <asm/cacheflush.h>
> -#include <asm/tlbflush.h>
> +#include <asm/tlb.h>
>   #include <asm/pgalloc.h>
>   
>   #include "internal.h"
> @@ -221,6 +221,14 @@ static inline void flush_pte_tlb_pwc_range(struct vm_area_struct *vma,
>   }
>   #endif
>   
> +#ifndef arch_supports_page_tables_move
> +#define arch_supports_page_tables_move arch_supports_page_tables_move
> +static inline bool arch_supports_page_tables_move(void)
> +{
> +	return false;

Can you do

	return IS_ENABLED(CONFIG_HAVE_MOVE_PMD) || IS_ENABLED(CONFIG_HAVE_MOVE_PUD);

And then remove the arch_supports_page_tables_move() you have added for arc, arm64 and x86 ?

> +}
> +#endif
> +
>   #ifdef CONFIG_HAVE_MOVE_PMD

Next step could be remove that #ifdef and the content of the matching #else
For that we'd just need a stub version of set_pmd_at() and set_pud_at().

>   static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
>   		  unsigned long new_addr, pmd_t *old_pmd, pmd_t *new_pmd)
> @@ -229,6 +237,8 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
>   	struct mm_struct *mm = vma->vm_mm;
>   	pmd_t pmd;
>   
> +	if (!arch_supports_page_tables_move())
> +		return false;
>   	/*
>   	 * The destination pmd shouldn't be established, free_pgtables()
>   	 * should have released it.
> @@ -295,6 +305,8 @@ static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
>   	struct mm_struct *mm = vma->vm_mm;
>   	pud_t pud;
>   
> +	if (!arch_supports_page_tables_move())
> +		return false;
>   	/*
>   	 * The destination pud shouldn't be established, free_pgtables()
>   	 * should have released it.
> 
