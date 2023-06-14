Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7CC7300D7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 15:54:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WTLFY5L6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qh6NV62bnz3bX7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 23:54:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WTLFY5L6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qh6Lj4g9Fz30gw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 23:52:45 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0070864287;
	Wed, 14 Jun 2023 13:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA10DC433C0;
	Wed, 14 Jun 2023 13:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686750763;
	bh=Jr1CjE7x6zZhqlD+PrxSeOCGxWprISw499VNjITcty4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WTLFY5L6mnlqfGDyFTiH9jqq2FKHmRtqRnjsTj1RSarSSy3AxLfMgUgjr8wGlmHBW
	 ZIyTwYSaSC1laCUlNWdYFX2P0Vpo5Cygx+gCIcavFIbmFA7gdFkAZSMhEGMMgWmRbu
	 2PIwOB+Zm2qIyVb3o5W9j04IHSX7uWkmLNNjNW4pTo0Uj3+m7MBHT7TUhTgbQveuQG
	 8Y13PY2/OBFLWcieHZ12iDoM6RLDamAU84EbiDa/rEeH2lt3RpONvk9+fHWXJncK7b
	 7pIkWK95aM9sq+JHpbXwyxHzzP/N7RDgJmdalD7vC2ycKfkQ6ox4Zo04K9yfj/x21h
	 HrE7P9YKzVHGQ==
Date: Wed, 14 Jun 2023 16:52:05 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: Re: [PATCH v4 08/34] mm: Convert ptlock_ptr() to use ptdescs
Message-ID: <20230614135205.GG52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-9-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-9-vishal.moola@gmail.com>
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

On Mon, Jun 12, 2023 at 02:03:57PM -0700, Vishal Moola (Oracle) wrote:
> This removes some direct accesses to struct page, working towards
> splitting out struct ptdesc from struct page.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/x86/xen/mmu_pv.c |  2 +-
>  include/linux/mm.h    | 14 +++++++-------
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> index b3b8d289b9ab..f469862e3ef4 100644
> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -651,7 +651,7 @@ static spinlock_t *xen_pte_lock(struct page *page, struct mm_struct *mm)
>  	spinlock_t *ptl = NULL;
>  
>  #if USE_SPLIT_PTE_PTLOCKS
> -	ptl = ptlock_ptr(page);
> +	ptl = ptlock_ptr(page_ptdesc(page));
>  	spin_lock_nest_lock(ptl, &mm->page_table_lock);
>  #endif
>  
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index e6f1be2a405e..bb934d51390f 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2828,9 +2828,9 @@ void __init ptlock_cache_init(void);
>  bool ptlock_alloc(struct ptdesc *ptdesc);
>  extern void ptlock_free(struct page *page);
>  
> -static inline spinlock_t *ptlock_ptr(struct page *page)
> +static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
>  {
> -	return page->ptl;
> +	return ptdesc->ptl;
>  }
>  #else /* ALLOC_SPLIT_PTLOCKS */
>  static inline void ptlock_cache_init(void)
> @@ -2846,15 +2846,15 @@ static inline void ptlock_free(struct page *page)
>  {
>  }
>  
> -static inline spinlock_t *ptlock_ptr(struct page *page)
> +static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
>  {
> -	return &page->ptl;
> +	return &ptdesc->ptl;
>  }
>  #endif /* ALLOC_SPLIT_PTLOCKS */
>  
>  static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
>  {
> -	return ptlock_ptr(pmd_page(*pmd));
> +	return ptlock_ptr(page_ptdesc(pmd_page(*pmd)));
>  }
>  
>  static inline bool ptlock_init(struct page *page)
> @@ -2869,7 +2869,7 @@ static inline bool ptlock_init(struct page *page)
>  	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
>  	if (!ptlock_alloc(page_ptdesc(page)))
>  		return false;
> -	spin_lock_init(ptlock_ptr(page));
> +	spin_lock_init(ptlock_ptr(page_ptdesc(page)));
>  	return true;
>  }
>  
> @@ -2939,7 +2939,7 @@ static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
>  
>  static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
>  {
> -	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
> +	return ptlock_ptr(pmd_ptdesc(pmd));
>  }
>  
>  static inline bool pmd_ptlock_init(struct page *page)
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.
