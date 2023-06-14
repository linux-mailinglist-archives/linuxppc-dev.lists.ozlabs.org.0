Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAD7730115
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 16:01:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PDvLwogG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qh6Y11k7mz3bsR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 00:01:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PDvLwogG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qh6Wb42yVz30hw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 00:00:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E28C463F79;
	Wed, 14 Jun 2023 14:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67061C433C8;
	Wed, 14 Jun 2023 14:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686751225;
	bh=uKraQGeV6CHflKMTQULlWthGg679fqUnVunPDgo/6HY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PDvLwogGgBD7itA4KpDmMOz5f6z6VH2iaHunkUOmJGb2CV9/5MwRPKrP111EYXtEb
	 UEqH+CWzIgF1Rc6XrQFIv/yMpYEmEBGoEuDURlPd52I/fGmF+q5wVqQlIl9KpU5+Uk
	 bgdwaGWMrQOsCsKhPDLR53apMHeHe+9FdmAd1a7miKQKkWiXMpItAY3NijXk99Jluh
	 Pxd9FqKP+sLyI/lOsBPezf8JoB5Fqp5Gg8oE7VA+UHq8nk2Bo7G2Cvf5IS4Aq32CvE
	 s4FZBegGotMSVk+KfyEvDwvHHiHE5HW4dc9hJuLo8yp+W1/X4mVZFqgnWQ8kmzqF33
	 SBYFIqusV7nCA==
Date: Wed, 14 Jun 2023 16:59:47 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: Re: [PATCH v4 12/34] mm: Convert ptlock_free() to use ptdescs
Message-ID: <20230614135947.GK52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-13-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-13-vishal.moola@gmail.com>
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

On Mon, Jun 12, 2023 at 02:04:01PM -0700, Vishal Moola (Oracle) wrote:
> This removes some direct accesses to struct page, working towards
> splitting out struct ptdesc from struct page.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  include/linux/mm.h | 10 +++++-----
>  mm/memory.c        |  4 ++--
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 3b54bb4c9753..a1af7983e1bd 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2826,7 +2826,7 @@ static inline void pagetable_clear(void *x)
>  #if ALLOC_SPLIT_PTLOCKS
>  void __init ptlock_cache_init(void);
>  bool ptlock_alloc(struct ptdesc *ptdesc);
> -extern void ptlock_free(struct page *page);
> +void ptlock_free(struct ptdesc *ptdesc);
>  
>  static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
>  {
> @@ -2842,7 +2842,7 @@ static inline bool ptlock_alloc(struct ptdesc *ptdesc)
>  	return true;
>  }
>  
> -static inline void ptlock_free(struct page *page)
> +static inline void ptlock_free(struct ptdesc *ptdesc)
>  {
>  }
>  
> @@ -2883,7 +2883,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
>  }
>  static inline void ptlock_cache_init(void) {}
>  static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
> -static inline void ptlock_free(struct page *page) {}
> +static inline void ptlock_free(struct ptdesc *ptdesc) {}
>  #endif /* USE_SPLIT_PTE_PTLOCKS */
>  
>  static inline bool pgtable_pte_page_ctor(struct page *page)
> @@ -2897,7 +2897,7 @@ static inline bool pgtable_pte_page_ctor(struct page *page)
>  
>  static inline void pgtable_pte_page_dtor(struct page *page)
>  {
> -	ptlock_free(page);
> +	ptlock_free(page_ptdesc(page));
>  	__ClearPageTable(page);
>  	dec_lruvec_page_state(page, NR_PAGETABLE);
>  }
> @@ -2955,7 +2955,7 @@ static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
>  #endif
> -	ptlock_free(ptdesc_page(ptdesc));
> +	ptlock_free(ptdesc);
>  }
>  
>  #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
> diff --git a/mm/memory.c b/mm/memory.c
> index ba9579117686..d4d2ea5cf0fd 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -5945,8 +5945,8 @@ bool ptlock_alloc(struct ptdesc *ptdesc)
>  	return true;
>  }
>  
> -void ptlock_free(struct page *page)
> +void ptlock_free(struct ptdesc *ptdesc)
>  {
> -	kmem_cache_free(page_ptl_cachep, page->ptl);
> +	kmem_cache_free(page_ptl_cachep, ptdesc->ptl);
>  }
>  #endif
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.
