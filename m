Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D8484DA30
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 07:30:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Phoix+90;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TVnD13zX8z3cBN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 17:30:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Phoix+90;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TVnCJ3yhWz2xFk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Feb 2024 17:29:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8BB1E61B29;
	Thu,  8 Feb 2024 06:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E21FC433F1;
	Thu,  8 Feb 2024 06:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707373786;
	bh=x4GCLa2xzNhu7jlHpC2LrDTqBpAccwVcIjWuUAdJzgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Phoix+90khL4IEhQ6gpSoCEIa7eKrFuowZSgj42G9vOi8dSlpe1gQK0YyWgYKp+4r
	 sPLY9+CUFb9aZvZlJVuQqwKhWZ+pa+B4zWmW6ij44vrjGh7IL5UzkD3sKKzoxbKYee
	 QNwaU30tJ0UF6MuasMfjEGa+A4FY8V6otf3jfYDzeJPTIubtszyNvCkdBsoVBCTCKZ
	 +W8z7CCvQhm6qI593PxMf1LOB8FDsoWbQ3LesFfp+jH1tSwZzvF1v7s5703XCDTQvu
	 YYI3y/4CVWlLjbUJLn8zUCRy2xy0Roln1eAOTnw74B+sWgLw7OSbGWrqA5wjWVRClH
	 ouB/3F6aDobjA==
Date: Thu, 8 Feb 2024 08:29:21 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 11/15] mm/memory: factor out copying the actual PTE in
 copy_present_pte()
Message-ID: <ZcR0waPgUzfQgyGQ@kernel.org>
References: <20240129124649.189745-1-david@redhat.com>
 <20240129124649.189745-12-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129124649.189745-12-david@redhat.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@d
 avemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 29, 2024 at 01:46:45PM +0100, David Hildenbrand wrote:
> Let's prepare for further changes.
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  mm/memory.c | 63 ++++++++++++++++++++++++++++-------------------------
>  1 file changed, 33 insertions(+), 30 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 8d14ba440929..a3bdb25f4c8d 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -930,6 +930,29 @@ copy_present_page(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
>  	return 0;
>  }
>  
> +static inline void __copy_present_pte(struct vm_area_struct *dst_vma,
> +		struct vm_area_struct *src_vma, pte_t *dst_pte, pte_t *src_pte,
> +		pte_t pte, unsigned long addr)
> +{
> +	struct mm_struct *src_mm = src_vma->vm_mm;
> +
> +	/* If it's a COW mapping, write protect it both processes. */
> +	if (is_cow_mapping(src_vma->vm_flags) && pte_write(pte)) {
> +		ptep_set_wrprotect(src_mm, addr, src_pte);
> +		pte = pte_wrprotect(pte);
> +	}
> +
> +	/* If it's a shared mapping, mark it clean in the child. */
> +	if (src_vma->vm_flags & VM_SHARED)
> +		pte = pte_mkclean(pte);
> +	pte = pte_mkold(pte);
> +
> +	if (!userfaultfd_wp(dst_vma))
> +		pte = pte_clear_uffd_wp(pte);
> +
> +	set_pte_at(dst_vma->vm_mm, addr, dst_pte, pte);
> +}
> +
>  /*
>   * Copy one pte.  Returns 0 if succeeded, or -EAGAIN if one preallocated page
>   * is required to copy this pte.
> @@ -939,23 +962,23 @@ copy_present_pte(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>  		 pte_t *dst_pte, pte_t *src_pte, unsigned long addr, int *rss,
>  		 struct folio **prealloc)
>  {
> -	struct mm_struct *src_mm = src_vma->vm_mm;
> -	unsigned long vm_flags = src_vma->vm_flags;
>  	pte_t pte = ptep_get(src_pte);
>  	struct page *page;
>  	struct folio *folio;
>  
>  	page = vm_normal_page(src_vma, addr, pte);
> -	if (page)
> -		folio = page_folio(page);
> -	if (page && folio_test_anon(folio)) {
> +	if (unlikely(!page))
> +		goto copy_pte;
> +
> +	folio = page_folio(page);
> +	folio_get(folio);
> +	if (folio_test_anon(folio)) {
>  		/*
>  		 * If this page may have been pinned by the parent process,
>  		 * copy the page immediately for the child so that we'll always
>  		 * guarantee the pinned page won't be randomly replaced in the
>  		 * future.
>  		 */
> -		folio_get(folio);
>  		if (unlikely(folio_try_dup_anon_rmap_pte(folio, page, src_vma))) {
>  			/* Page may be pinned, we have to copy. */
>  			folio_put(folio);
> @@ -963,34 +986,14 @@ copy_present_pte(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>  						 addr, rss, prealloc, page);
>  		}
>  		rss[MM_ANONPAGES]++;
> -	} else if (page) {
> -		folio_get(folio);
> +		VM_WARN_ON_FOLIO(PageAnonExclusive(page), folio);
> +	} else {
>  		folio_dup_file_rmap_pte(folio, page);
>  		rss[mm_counter_file(folio)]++;
>  	}
>  
> -	/*
> -	 * If it's a COW mapping, write protect it both
> -	 * in the parent and the child
> -	 */
> -	if (is_cow_mapping(vm_flags) && pte_write(pte)) {
> -		ptep_set_wrprotect(src_mm, addr, src_pte);
> -		pte = pte_wrprotect(pte);
> -	}
> -	VM_BUG_ON(page && folio_test_anon(folio) && PageAnonExclusive(page));
> -
> -	/*
> -	 * If it's a shared mapping, mark it clean in
> -	 * the child
> -	 */
> -	if (vm_flags & VM_SHARED)
> -		pte = pte_mkclean(pte);
> -	pte = pte_mkold(pte);
> -
> -	if (!userfaultfd_wp(dst_vma))
> -		pte = pte_clear_uffd_wp(pte);
> -
> -	set_pte_at(dst_vma->vm_mm, addr, dst_pte, pte);
> +copy_pte:
> +	__copy_present_pte(dst_vma, src_vma, dst_pte, src_pte, pte, addr);
>  	return 0;
>  }
>  
> -- 
> 2.43.0
> 
> 

-- 
Sincerely yours,
Mike.
