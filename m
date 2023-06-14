Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB1F7300D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 15:53:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Pvu46WaE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qh6MX03hmz3bWW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 23:53:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Pvu46WaE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qh6LB3PClz30hJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 23:52:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B94836426A;
	Wed, 14 Jun 2023 13:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C7AC433CB;
	Wed, 14 Jun 2023 13:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686750736;
	bh=VwaE4ixu2oYgT8bWCqZd/sCxt5Vr7LA6FKY2uA7+iKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pvu46WaEl54YKxvYrg17S6Us5Z+6jc6ZyxloGDXNG3sVbWCAn8khJSWsZ739VwfPP
	 KwSYnW5Cb22U/hoqAU+3FM5yWaAmL/GvAe5O+LdrEw3/pZtxxI5c7cLPpLdtEqXk8T
	 Fbh9NCB++t1sBODF7SprarK+tEpzTtUTE1tfwFFFrABefWFeIYBfx1eKkeOd7kHivF
	 njsBTw00M7iYLOdiQBjB3A+VyNpSzWxaS2T8NQnbhp/VhP28ksnHBcMgphMjijMkdr
	 wBr5rhU0/C9m5DU9+5BLMiU/dcdSlTsxTG9cV+YRjI8bVXWZYj/RDtOKkEZB/GxHIp
	 Of8H4nZJFOgvQ==
Date: Wed, 14 Jun 2023 16:51:38 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: Re: [PATCH v4 07/34] mm: Convert ptlock_alloc() to use ptdescs
Message-ID: <20230614135138.GF52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-8-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-8-vishal.moola@gmail.com>
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

On Mon, Jun 12, 2023 at 02:03:56PM -0700, Vishal Moola (Oracle) wrote:
> This removes some direct accesses to struct page, working towards
> splitting out struct ptdesc from struct page.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  include/linux/mm.h | 6 +++---
>  mm/memory.c        | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 088b7664f897..e6f1be2a405e 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2825,7 +2825,7 @@ static inline void pagetable_clear(void *x)
>  #if USE_SPLIT_PTE_PTLOCKS
>  #if ALLOC_SPLIT_PTLOCKS
>  void __init ptlock_cache_init(void);
> -extern bool ptlock_alloc(struct page *page);
> +bool ptlock_alloc(struct ptdesc *ptdesc);
>  extern void ptlock_free(struct page *page);
>  
>  static inline spinlock_t *ptlock_ptr(struct page *page)
> @@ -2837,7 +2837,7 @@ static inline void ptlock_cache_init(void)
>  {
>  }
>  
> -static inline bool ptlock_alloc(struct page *page)
> +static inline bool ptlock_alloc(struct ptdesc *ptdesc)
>  {
>  	return true;
>  }
> @@ -2867,7 +2867,7 @@ static inline bool ptlock_init(struct page *page)
>  	 * slab code uses page->slab_cache, which share storage with page->ptl.
>  	 */
>  	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
> -	if (!ptlock_alloc(page))
> +	if (!ptlock_alloc(page_ptdesc(page)))
>  		return false;
>  	spin_lock_init(ptlock_ptr(page));
>  	return true;
> diff --git a/mm/memory.c b/mm/memory.c
> index 80ce9dda2779..ba9579117686 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -5934,14 +5934,14 @@ void __init ptlock_cache_init(void)
>  			SLAB_PANIC, NULL);
>  }
>  
> -bool ptlock_alloc(struct page *page)
> +bool ptlock_alloc(struct ptdesc *ptdesc)
>  {
>  	spinlock_t *ptl;
>  
>  	ptl = kmem_cache_alloc(page_ptl_cachep, GFP_KERNEL);
>  	if (!ptl)
>  		return false;
> -	page->ptl = ptl;
> +	ptdesc->ptl = ptl;
>  	return true;
>  }
>  
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.
