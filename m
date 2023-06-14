Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EBA730199
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 16:20:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rDmqmXQ7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qh6z73Lzwz30hw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 00:20:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rDmqmXQ7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qh6yF6hjpz2xpv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 00:20:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C2ECB610D5;
	Wed, 14 Jun 2023 14:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8CFC433C8;
	Wed, 14 Jun 2023 14:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686752403;
	bh=msIQzzbJVOpmfYjD76BXOfuKQSvBA8DkGXsTDNo7F6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rDmqmXQ7/igDzWzKHWbbYSxsjI011+Qu0wfAX+xrJpGzScpx6c+TijBp42WTBHVHg
	 NMmFssQgKjcddaqFVOPxQIHovSCNhsGM78nzLy5IbF4NK4cENbZRynU7sbyPZQ0OJ2
	 u/YLiI/yye6XVAHtU6FTIMwuBcUtFL1dW8Vds6vGnufNWMWundcXWjgqsCICj6W4Dp
	 4phecE7fv+X9AppCQNzdJLoMn5npv3j2tWHnKsD12s3s/OF7tMN1vBabdXbvjijdFZ
	 e04wiDqE9JOa0+z6hm50Ui8dV1VvUlrYxaQY9WH+tDrmbOoYiIFulWKAMNy2BNR/ES
	 9cyaCj1LKvc6w==
Date: Wed, 14 Jun 2023 17:19:24 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: Re: [PATCH v4 14/34] powerpc: Convert various functions to use
 ptdescs
Message-ID: <20230614141924.GM52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-15-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-15-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 12, 2023 at 02:04:03PM -0700, Vishal Moola (Oracle) wrote:
> In order to split struct ptdesc from struct page, convert various
> functions to use ptdescs.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/powerpc/mm/book3s64/mmu_context.c | 10 +++---
>  arch/powerpc/mm/book3s64/pgtable.c     | 32 +++++++++---------
>  arch/powerpc/mm/pgtable-frag.c         | 46 +++++++++++++-------------
>  3 files changed, 44 insertions(+), 44 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
> index c766e4c26e42..1715b07c630c 100644
> --- a/arch/powerpc/mm/book3s64/mmu_context.c
> +++ b/arch/powerpc/mm/book3s64/mmu_context.c
> @@ -246,15 +246,15 @@ static void destroy_contexts(mm_context_t *ctx)
>  static void pmd_frag_destroy(void *pmd_frag)
>  {
>  	int count;
> -	struct page *page;
> +	struct ptdesc *ptdesc;
>  
> -	page = virt_to_page(pmd_frag);
> +	ptdesc = virt_to_ptdesc(pmd_frag);
>  	/* drop all the pending references */
>  	count = ((unsigned long)pmd_frag & ~PAGE_MASK) >> PMD_FRAG_SIZE_SHIFT;
>  	/* We allow PTE_FRAG_NR fragments from a PTE page */
> -	if (atomic_sub_and_test(PMD_FRAG_NR - count, &page->pt_frag_refcount)) {
> -		pgtable_pmd_page_dtor(page);
> -		__free_page(page);
> +	if (atomic_sub_and_test(PMD_FRAG_NR - count, &ptdesc->pt_frag_refcount)) {
> +		pagetable_pmd_dtor(ptdesc);
> +		pagetable_free(ptdesc);
>  	}
>  }
>  
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index 85c84e89e3ea..1212deeabe15 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -306,22 +306,22 @@ static pmd_t *get_pmd_from_cache(struct mm_struct *mm)
>  static pmd_t *__alloc_for_pmdcache(struct mm_struct *mm)
>  {
>  	void *ret = NULL;
> -	struct page *page;
> +	struct ptdesc *ptdesc;
>  	gfp_t gfp = GFP_KERNEL_ACCOUNT | __GFP_ZERO;
>  
>  	if (mm == &init_mm)
>  		gfp &= ~__GFP_ACCOUNT;
> -	page = alloc_page(gfp);
> -	if (!page)
> +	ptdesc = pagetable_alloc(gfp, 0);
> +	if (!ptdesc)
>  		return NULL;
> -	if (!pgtable_pmd_page_ctor(page)) {
> -		__free_pages(page, 0);
> +	if (!pagetable_pmd_ctor(ptdesc)) {
> +		pagetable_free(ptdesc);
>  		return NULL;
>  	}
>  
> -	atomic_set(&page->pt_frag_refcount, 1);
> +	atomic_set(&ptdesc->pt_frag_refcount, 1);
>  
> -	ret = page_address(page);
> +	ret = ptdesc_address(ptdesc);
>  	/*
>  	 * if we support only one fragment just return the
>  	 * allocated page.
> @@ -331,12 +331,12 @@ static pmd_t *__alloc_for_pmdcache(struct mm_struct *mm)
>  
>  	spin_lock(&mm->page_table_lock);
>  	/*
> -	 * If we find pgtable_page set, we return
> +	 * If we find ptdesc_page set, we return
>  	 * the allocated page with single fragment
>  	 * count.
>  	 */
>  	if (likely(!mm->context.pmd_frag)) {
> -		atomic_set(&page->pt_frag_refcount, PMD_FRAG_NR);
> +		atomic_set(&ptdesc->pt_frag_refcount, PMD_FRAG_NR);
>  		mm->context.pmd_frag = ret + PMD_FRAG_SIZE;
>  	}
>  	spin_unlock(&mm->page_table_lock);
> @@ -357,15 +357,15 @@ pmd_t *pmd_fragment_alloc(struct mm_struct *mm, unsigned long vmaddr)
>  
>  void pmd_fragment_free(unsigned long *pmd)
>  {
> -	struct page *page = virt_to_page(pmd);
> +	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
>  
> -	if (PageReserved(page))
> -		return free_reserved_page(page);
> +	if (pagetable_is_reserved(ptdesc))
> +		return free_reserved_ptdesc(ptdesc);
>  
> -	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
> -	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
> -		pgtable_pmd_page_dtor(page);
> -		__free_page(page);
> +	BUG_ON(atomic_read(&ptdesc->pt_frag_refcount) <= 0);
> +	if (atomic_dec_and_test(&ptdesc->pt_frag_refcount)) {
> +		pagetable_pmd_dtor(ptdesc);
> +		pagetable_free(ptdesc);
>  	}
>  }
>  
> diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
> index 20652daa1d7e..8961f1540209 100644
> --- a/arch/powerpc/mm/pgtable-frag.c
> +++ b/arch/powerpc/mm/pgtable-frag.c
> @@ -18,15 +18,15 @@
>  void pte_frag_destroy(void *pte_frag)
>  {
>  	int count;
> -	struct page *page;
> +	struct ptdesc *ptdesc;
>  
> -	page = virt_to_page(pte_frag);
> +	ptdesc = virt_to_ptdesc(pte_frag);
>  	/* drop all the pending references */
>  	count = ((unsigned long)pte_frag & ~PAGE_MASK) >> PTE_FRAG_SIZE_SHIFT;
>  	/* We allow PTE_FRAG_NR fragments from a PTE page */
> -	if (atomic_sub_and_test(PTE_FRAG_NR - count, &page->pt_frag_refcount)) {
> -		pgtable_pte_page_dtor(page);
> -		__free_page(page);
> +	if (atomic_sub_and_test(PTE_FRAG_NR - count, &ptdesc->pt_frag_refcount)) {
> +		pagetable_pte_dtor(ptdesc);
> +		pagetable_free(ptdesc);
>  	}
>  }
>  
> @@ -55,25 +55,25 @@ static pte_t *get_pte_from_cache(struct mm_struct *mm)
>  static pte_t *__alloc_for_ptecache(struct mm_struct *mm, int kernel)
>  {
>  	void *ret = NULL;
> -	struct page *page;
> +	struct ptdesc *ptdesc;
>  
>  	if (!kernel) {
> -		page = alloc_page(PGALLOC_GFP | __GFP_ACCOUNT);
> -		if (!page)
> +		ptdesc = pagetable_alloc(PGALLOC_GFP | __GFP_ACCOUNT, 0);
> +		if (!ptdesc)
>  			return NULL;
> -		if (!pgtable_pte_page_ctor(page)) {
> -			__free_page(page);
> +		if (!pagetable_pte_ctor(ptdesc)) {
> +			pagetable_free(ptdesc);
>  			return NULL;
>  		}
>  	} else {
> -		page = alloc_page(PGALLOC_GFP);
> -		if (!page)
> +		ptdesc = pagetable_alloc(PGALLOC_GFP, 0);
> +		if (!ptdesc)
>  			return NULL;
>  	}
>  
> -	atomic_set(&page->pt_frag_refcount, 1);
> +	atomic_set(&ptdesc->pt_frag_refcount, 1);
>  
> -	ret = page_address(page);
> +	ret = ptdesc_address(ptdesc);
>  	/*
>  	 * if we support only one fragment just return the
>  	 * allocated page.
> @@ -82,12 +82,12 @@ static pte_t *__alloc_for_ptecache(struct mm_struct *mm, int kernel)
>  		return ret;
>  	spin_lock(&mm->page_table_lock);
>  	/*
> -	 * If we find pgtable_page set, we return
> +	 * If we find ptdesc_page set, we return
>  	 * the allocated page with single fragment
>  	 * count.
>  	 */
>  	if (likely(!pte_frag_get(&mm->context))) {
> -		atomic_set(&page->pt_frag_refcount, PTE_FRAG_NR);
> +		atomic_set(&ptdesc->pt_frag_refcount, PTE_FRAG_NR);
>  		pte_frag_set(&mm->context, ret + PTE_FRAG_SIZE);
>  	}
>  	spin_unlock(&mm->page_table_lock);
> @@ -108,15 +108,15 @@ pte_t *pte_fragment_alloc(struct mm_struct *mm, int kernel)
>  
>  void pte_fragment_free(unsigned long *table, int kernel)
>  {
> -	struct page *page = virt_to_page(table);
> +	struct ptdesc *ptdesc = virt_to_ptdesc(table);
>  
> -	if (PageReserved(page))
> -		return free_reserved_page(page);
> +	if (pagetable_is_reserved(ptdesc))
> +		return free_reserved_ptdesc(ptdesc);
>  
> -	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
> -	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
> +	BUG_ON(atomic_read(&ptdesc->pt_frag_refcount) <= 0);
> +	if (atomic_dec_and_test(&ptdesc->pt_frag_refcount)) {
>  		if (!kernel)
> -			pgtable_pte_page_dtor(page);
> -		__free_page(page);
> +			pagetable_pte_dtor(ptdesc);
> +		pagetable_free(ptdesc);
>  	}
>  }
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.
