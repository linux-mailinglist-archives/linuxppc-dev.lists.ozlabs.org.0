Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4217476F632
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 01:39:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=la4NSnbi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RH50f5jYcz3cLx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 09:39:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=la4NSnbi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RH4zJ1p49z2ydR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 09:38:20 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1DB3D61EA4;
	Thu,  3 Aug 2023 23:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C072AC433C7;
	Thu,  3 Aug 2023 23:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691105897;
	bh=aLQlhR8HSv2POSv3geI9bcoaAzfbwflFBUhnJPVztHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=la4NSnbiNxZ3stnWKrgOJrpkat+ogvN9qenUH8RVXH/e4czSZwcay/ddAhuE0rnue
	 SrxJ8704bIwxzR6b0vvbEjlg1AzO09WwM5YIK1nmf3BC3Q9L5hLkCCnxYXn2Fro5je
	 gAJiuHjyHDGtVoDZkyz9VAIEHwRL9YmUYQWfHOLKkXRrnqs/TohQZdlYrh04iDU7aa
	 ejvJaBtTuKcyaeGWUPMkFIY5OYJNtHL8eglm2w+mOma2MSBmxvXHz9Ya+YZMs6bPC5
	 PLr7Ns/Tc8gPKIZzSJ7S6pLtoFzM1xxGI9Nu/M1QApddPkz6G0Ut015b9OXJ7v7fGU
	 fjmdWBbdiG5AQ==
Date: Thu, 3 Aug 2023 16:38:14 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH v6 21/38] powerpc: Implement the new page table range API
Message-ID: <20230803233814.GA2515372@dev-arch.thelio-3990X>
References: <20230802151406.3735276-1-willy@infradead.org>
 <20230802151406.3735276-22-willy@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802151406.3735276-22-willy@infradead.org>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Matthew,

On Wed, Aug 02, 2023 at 04:13:49PM +0100, Matthew Wilcox (Oracle) wrote:
> Add set_ptes(), update_mmu_cache_range() and flush_dcache_folio().
> Change the PG_arch_1 (aka PG_dcache_dirty) flag from being per-page to
> per-folio.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linuxppc-dev@lists.ozlabs.org
...
> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
> index d16d80ad2ae4..b4da8514af43 100644
> --- a/arch/powerpc/include/asm/kvm_ppc.h
> +++ b/arch/powerpc/include/asm/kvm_ppc.h
> @@ -894,7 +894,7 @@ void kvmppc_init_lpid(unsigned long nr_lpids);
>  
>  static inline void kvmppc_mmu_flush_icache(kvm_pfn_t pfn)
>  {
> -	struct page *page;
> +	struct folio *folio;
>  	/*
>  	 * We can only access pages that the kernel maps
>  	 * as memory. Bail out for unmapped ones.
> @@ -903,10 +903,10 @@ static inline void kvmppc_mmu_flush_icache(kvm_pfn_t pfn)
>  		return;
>  
>  	/* Clear i-cache for new pages */
> -	page = pfn_to_page(pfn);
> -	if (!test_bit(PG_dcache_clean, &page->flags)) {
> -		flush_dcache_icache_page(page);
> -		set_bit(PG_dcache_clean, &page->flags);
> +	folio = page_folio(pfn_to_page(pfn));
> +	if (!test_bit(PG_dcache_clean, &folio->flags)) {
> +		flush_dcache_icache_folio(folio);
> +		set_bit(PG_dcache_clean, &folio->flags);
>  	}
>  }
...
> diff --git a/arch/powerpc/mm/cacheflush.c b/arch/powerpc/mm/cacheflush.c
> index 0e9b4879c0f9..8760d2223abe 100644
> --- a/arch/powerpc/mm/cacheflush.c
> +++ b/arch/powerpc/mm/cacheflush.c
> @@ -148,44 +148,30 @@ static void __flush_dcache_icache(void *p)
>  	invalidate_icache_range(addr, addr + PAGE_SIZE);
>  }
>  
> -static void flush_dcache_icache_hugepage(struct page *page)
> +void flush_dcache_icache_folio(struct folio *folio)
>  {
> -	int i;
> -	int nr = compound_nr(page);
> +	unsigned int i, nr = folio_nr_pages(folio);
>  
> -	if (!PageHighMem(page)) {
> +	if (flush_coherent_icache())
> +		return;
> +
> +	if (!folio_test_highmem(folio)) {
> +		void *addr = folio_address(folio);
>  		for (i = 0; i < nr; i++)
> -			__flush_dcache_icache(lowmem_page_address(page + i));
> -	} else {
> +			__flush_dcache_icache(addr + i * PAGE_SIZE);
> +	} else if (IS_ENABLED(CONFIG_BOOKE) || sizeof(phys_addr_t) > sizeof(void *)) {
>  		for (i = 0; i < nr; i++) {
> -			void *start = kmap_local_page(page + i);
> +			void *start = kmap_local_folio(folio, i * PAGE_SIZE);
>  
>  			__flush_dcache_icache(start);
>  			kunmap_local(start);
>  		}
> -	}
> -}
> -
> -void flush_dcache_icache_page(struct page *page)
> -{
> -	if (flush_coherent_icache())
> -		return;
> -
> -	if (PageCompound(page))
> -		return flush_dcache_icache_hugepage(page);
> -
> -	if (!PageHighMem(page)) {
> -		__flush_dcache_icache(lowmem_page_address(page));
> -	} else if (IS_ENABLED(CONFIG_BOOKE) || sizeof(phys_addr_t) > sizeof(void *)) {
> -		void *start = kmap_local_page(page);
> -
> -		__flush_dcache_icache(start);
> -		kunmap_local(start);
>  	} else {
> -		flush_dcache_icache_phys(page_to_phys(page));
> +		unsigned long pfn = folio_pfn(folio);
> +		for (i = 0; i < nr; i++)
> +			flush_dcache_icache_phys((pfn + i) * PAGE_SIZE);
>  	}
>  }
> -EXPORT_SYMBOL(flush_dcache_icache_page);

Apologies if this has already been fixed or reported, I searched lore
and did not find anything. The dropping of this export in combination
with the conversion above appears to cause ARCH=powerpc allmodconfig to
fail with:

  ERROR: modpost: "flush_dcache_icache_folio" [arch/powerpc/kvm/kvm-pr.ko] undefined!

I don't know if this should be re-exported or not but that does
obviously resolve the issue.

Cheers,
Nathan
