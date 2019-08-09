Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEF687A54
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 14:40:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464lG21T1NzDqSx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 22:40:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464l8y4SwjzDqWN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2019 22:36:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 464l8w0FPbz9sBF;
 Fri,  9 Aug 2019 22:36:15 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Chuhong Yuan <hslester96@gmail.com>
Subject: Re: [PATCH] powerpc/mm: Use refcount_t for refcount
In-Reply-To: <20190808071808.6531-1-hslester96@gmail.com>
References: <20190808071808.6531-1-hslester96@gmail.com>
Date: Fri, 09 Aug 2019 22:36:15 +1000
Message-ID: <87y302segw.fsf@concordia.ellerman.id.au>
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
Cc: Chuhong Yuan <hslester96@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Chuhong Yuan <hslester96@gmail.com> writes:
> Reference counters are preferred to use refcount_t instead of
> atomic_t.
> This is because the implementation of refcount_t can prevent
> overflows and detect possible use-after-free.
> So convert atomic_t ref counters to refcount_t.
>
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>

Thanks.

We don't have a fast implementation of refcount_t, so I'm worried this
could cause a measurable performance regression.

Did you benchmark it at all?

cheers

> diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
> index 2d0cb5ba9a47..f836fd5a6abc 100644
> --- a/arch/powerpc/mm/book3s64/mmu_context.c
> +++ b/arch/powerpc/mm/book3s64/mmu_context.c
> @@ -231,7 +231,7 @@ static void pmd_frag_destroy(void *pmd_frag)
>  	/* drop all the pending references */
>  	count = ((unsigned long)pmd_frag & ~PAGE_MASK) >> PMD_FRAG_SIZE_SHIFT;
>  	/* We allow PTE_FRAG_NR fragments from a PTE page */
> -	if (atomic_sub_and_test(PMD_FRAG_NR - count, &page->pt_frag_refcount)) {
> +	if (refcount_sub_and_test(PMD_FRAG_NR - count, &page->pt_frag_refcount)) {
>  		pgtable_pmd_page_dtor(page);
>  		__free_page(page);
>  	}
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index 7d0e0d0d22c4..40056896ce4e 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -277,7 +277,7 @@ static pmd_t *__alloc_for_pmdcache(struct mm_struct *mm)
>  		return NULL;
>  	}
>  
> -	atomic_set(&page->pt_frag_refcount, 1);
> +	refcount_set(&page->pt_frag_refcount, 1);
>  
>  	ret = page_address(page);
>  	/*
> @@ -294,7 +294,7 @@ static pmd_t *__alloc_for_pmdcache(struct mm_struct *mm)
>  	 * count.
>  	 */
>  	if (likely(!mm->context.pmd_frag)) {
> -		atomic_set(&page->pt_frag_refcount, PMD_FRAG_NR);
> +		refcount_set(&page->pt_frag_refcount, PMD_FRAG_NR);
>  		mm->context.pmd_frag = ret + PMD_FRAG_SIZE;
>  	}
>  	spin_unlock(&mm->page_table_lock);
> @@ -317,8 +317,7 @@ void pmd_fragment_free(unsigned long *pmd)
>  {
>  	struct page *page = virt_to_page(pmd);
>  
> -	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
> -	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
> +	if (refcount_dec_and_test(&page->pt_frag_refcount)) {
>  		pgtable_pmd_page_dtor(page);
>  		__free_page(page);
>  	}
> diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
> index a7b05214760c..4ef8231b677f 100644
> --- a/arch/powerpc/mm/pgtable-frag.c
> +++ b/arch/powerpc/mm/pgtable-frag.c
> @@ -24,7 +24,7 @@ void pte_frag_destroy(void *pte_frag)
>  	/* drop all the pending references */
>  	count = ((unsigned long)pte_frag & ~PAGE_MASK) >> PTE_FRAG_SIZE_SHIFT;
>  	/* We allow PTE_FRAG_NR fragments from a PTE page */
> -	if (atomic_sub_and_test(PTE_FRAG_NR - count, &page->pt_frag_refcount)) {
> +	if (refcount_sub_and_test(PTE_FRAG_NR - count, &page->pt_frag_refcount)) {
>  		pgtable_page_dtor(page);
>  		__free_page(page);
>  	}
> @@ -71,7 +71,7 @@ static pte_t *__alloc_for_ptecache(struct mm_struct *mm, int kernel)
>  			return NULL;
>  	}
>  
> -	atomic_set(&page->pt_frag_refcount, 1);
> +	refcount_set(&page->pt_frag_refcount, 1);
>  
>  	ret = page_address(page);
>  	/*
> @@ -87,7 +87,7 @@ static pte_t *__alloc_for_ptecache(struct mm_struct *mm, int kernel)
>  	 * count.
>  	 */
>  	if (likely(!pte_frag_get(&mm->context))) {
> -		atomic_set(&page->pt_frag_refcount, PTE_FRAG_NR);
> +		refcount_set(&page->pt_frag_refcount, PTE_FRAG_NR);
>  		pte_frag_set(&mm->context, ret + PTE_FRAG_SIZE);
>  	}
>  	spin_unlock(&mm->page_table_lock);
> @@ -110,8 +110,7 @@ void pte_fragment_free(unsigned long *table, int kernel)
>  {
>  	struct page *page = virt_to_page(table);
>  
> -	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
> -	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
> +	if (refcount_dec_and_test(&page->pt_frag_refcount)) {
>  		if (!kernel)
>  			pgtable_page_dtor(page);
>  		__free_page(page);
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 3a37a89eb7a7..7fe23a3faf95 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -14,6 +14,7 @@
>  #include <linux/uprobes.h>
>  #include <linux/page-flags-layout.h>
>  #include <linux/workqueue.h>
> +#include <linux/refcount.h>
>  
>  #include <asm/mmu.h>
>  
> @@ -147,7 +148,7 @@ struct page {
>  			unsigned long _pt_pad_2;	/* mapping */
>  			union {
>  				struct mm_struct *pt_mm; /* x86 pgds only */
> -				atomic_t pt_frag_refcount; /* powerpc */
> +				refcount_t pt_frag_refcount; /* powerpc */
>  			};
>  #if ALLOC_SPLIT_PTLOCKS
>  			spinlock_t *ptl;
> -- 
> 2.20.1
