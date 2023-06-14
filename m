Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 383A97300F0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 15:59:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lSDu5H7K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qh6VF05qVz30hf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 23:59:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lSDu5H7K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qh6TM4gkpz306B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 23:58:31 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C25E463EA8;
	Wed, 14 Jun 2023 13:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0141C433C8;
	Wed, 14 Jun 2023 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686751109;
	bh=zODqmBJZryq+bXrqw2+dO7/Egr05l6EFGh7EoAR+f5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lSDu5H7KOZKMWJOQe/RZf66XvE8x+eCZ2Ytzhs66p+GHx+ddxnclpSnPyGBBVOC05
	 kntWJ9TrG8h428EjebftgV+rAv2YXAhTb0cmqdcy2uTjvuT0Ga5hGuS9drSzCT7vEe
	 lZBUTVYDwjRpPWR0zfBUHmtTwZ2dHpcIOTvlm3uWIc27APHLBBUO1V3IJqvs3/W4hf
	 V4LiUm2GDpkcLNAf56LDxlLuEAL6oO/16Aw5vUDA8I/ZMKz2QG0XPQLr9Bk8rgf5Zl
	 R9Y5FHwwoN9JyP4cz6UUoLxJJznNWVeOmwWxNxC0W9lJyus9Kc2Q39K0WgkNq1Cbbd
	 +hjJK6ETZawtw==
Date: Wed, 14 Jun 2023 16:57:51 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: Re: [PATCH v4 10/34] mm: Convert ptlock_init() to use ptdescs
Message-ID: <20230614135751.GI52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-11-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-11-vishal.moola@gmail.com>
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

On Mon, Jun 12, 2023 at 02:03:59PM -0700, Vishal Moola (Oracle) wrote:
> This removes some direct accesses to struct page, working towards
> splitting out struct ptdesc from struct page.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  include/linux/mm.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index daecf1db6cf1..f48e626d9c98 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2857,7 +2857,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
>  	return ptlock_ptr(page_ptdesc(pmd_page(*pmd)));
>  }
>  
> -static inline bool ptlock_init(struct page *page)
> +static inline bool ptlock_init(struct ptdesc *ptdesc)
>  {
>  	/*
>  	 * prep_new_page() initialize page->private (and therefore page->ptl)
> @@ -2866,10 +2866,10 @@ static inline bool ptlock_init(struct page *page)
>  	 * It can happen if arch try to use slab for page table allocation:
>  	 * slab code uses page->slab_cache, which share storage with page->ptl.
>  	 */
> -	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
> -	if (!ptlock_alloc(page_ptdesc(page)))
> +	VM_BUG_ON_PAGE(*(unsigned long *)&ptdesc->ptl, ptdesc_page(ptdesc));
> +	if (!ptlock_alloc(ptdesc))
>  		return false;
> -	spin_lock_init(ptlock_ptr(page_ptdesc(page)));
> +	spin_lock_init(ptlock_ptr(ptdesc));
>  	return true;
>  }
>  
> @@ -2882,13 +2882,13 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
>  	return &mm->page_table_lock;
>  }
>  static inline void ptlock_cache_init(void) {}
> -static inline bool ptlock_init(struct page *page) { return true; }
> +static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
>  static inline void ptlock_free(struct page *page) {}
>  #endif /* USE_SPLIT_PTE_PTLOCKS */
>  
>  static inline bool pgtable_pte_page_ctor(struct page *page)
>  {
> -	if (!ptlock_init(page))
> +	if (!ptlock_init(page_ptdesc(page)))
>  		return false;
>  	__SetPageTable(page);
>  	inc_lruvec_page_state(page, NR_PAGETABLE);
> @@ -2947,7 +2947,7 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  	ptdesc->pmd_huge_pte = NULL;
>  #endif
> -	return ptlock_init(ptdesc_page(ptdesc));
> +	return ptlock_init(ptdesc);
>  }
>  
>  static inline void pmd_ptlock_free(struct page *page)
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.
