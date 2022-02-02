Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D7A4A6B9A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 07:19:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpWph3Nbsz3cN8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 17:19:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ss+pnyK4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ss+pnyK4; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpWp22M90z2yJv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 17:18:34 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A70961731;
 Wed,  2 Feb 2022 06:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469CBC004E1;
 Wed,  2 Feb 2022 06:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643782710;
 bh=fyAh/Tr2vBYttRq/UCJ3W5krrQh0GFSRmsyVq06/+GE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ss+pnyK4k44OeYCpVJ06NQqNBMvi2TOZjv3jly77ZFHvQ7ye5c4RvZ+8/1d3rLWPU
 1x7reSL74jYawegH+02waosLcgTaYqBQEfTkL6Z3t4eVBlmzKukcJEPGENb0AmJEAK
 iHc6KJ9gXQlvUEWk3PzYesdmUMcEKg+BAnW1P8bv2nFOwHK4v0tjP6BvjZnV8Xd2je
 mvSxOkRksMS4NG7HS2NkAgy5rWZDgj6VQjERSUnKecTaumH9zQczBCeMsexit0CPo7
 OCYetr9Iko+LAUJTMo5C/mHq6NPh+mCCAKd7EmqO0Q9A8fw5/9WLiP68SA4QuJFOiY
 gW4gQp3irsFgA==
Date: Wed, 2 Feb 2022 08:18:21 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH] mm: Merge pte_mkhuge() call into arch_make_huge_pte()
Message-ID: <YfoiLdboxJAxKi6Y@kernel.org>
References: <1643780286-18798-1-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1643780286-18798-1-git-send-email-anshuman.khandual@arm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Catalin Marinas <catalin.marinas@arm.com>, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 02, 2022 at 11:08:06AM +0530, Anshuman Khandual wrote:
> Each call into pte_mkhuge() is invariably followed by arch_make_huge_pte().
> Instead arch_make_huge_pte() can accommodate pte_mkhuge() at the beginning.
> This updates generic fallback stub for arch_make_huge_pte() and available
> platforms definitions. This makes huge pte creation much cleaner and easier
> to follow.

Won't it break architectures that don't define arch_make_huge_pte()?
 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/mm/hugetlbpage.c                      | 1 +
>  arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h | 1 +
>  arch/sparc/mm/hugetlbpage.c                      | 1 +
>  include/linux/hugetlb.h                          | 2 +-
>  mm/hugetlb.c                                     | 3 +--
>  mm/vmalloc.c                                     | 1 -
>  6 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index ffb9c229610a..228226c5fa80 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -347,6 +347,7 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
>  {
>  	size_t pagesize = 1UL << shift;
>  
> +	entry = pte_mkhuge(entry);
>  	if (pagesize == CONT_PTE_SIZE) {
>  		entry = pte_mkcont(entry);
>  	} else if (pagesize == CONT_PMD_SIZE) {
> diff --git a/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h b/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
> index 64b6c608eca4..e41e095158c7 100644
> --- a/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
> +++ b/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
> @@ -70,6 +70,7 @@ static inline pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags
>  {
>  	size_t size = 1UL << shift;
>  
> +	entry = pte_mkhuge(entry);
>  	if (size == SZ_16K)
>  		return __pte(pte_val(entry) & ~_PAGE_HUGE);
>  	else
> diff --git a/arch/sparc/mm/hugetlbpage.c b/arch/sparc/mm/hugetlbpage.c
> index 0f49fada2093..d8e0e3c7038d 100644
> --- a/arch/sparc/mm/hugetlbpage.c
> +++ b/arch/sparc/mm/hugetlbpage.c
> @@ -181,6 +181,7 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
>  {
>  	pte_t pte;
>  
> +	entry = pte_mkhuge(entry);
>  	pte = hugepage_shift_to_tte(entry, shift);
>  
>  #ifdef CONFIG_SPARC64
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index d1897a69c540..52c462390aee 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -754,7 +754,7 @@ static inline void arch_clear_hugepage_flags(struct page *page) { }
>  static inline pte_t arch_make_huge_pte(pte_t entry, unsigned int shift,
>  				       vm_flags_t flags)
>  {
> -	return entry;
> +	return pte_mkhuge(entry);
>  }
>  #endif
>  
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 61895cc01d09..5ca253c1b4e4 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -4637,7 +4637,6 @@ static pte_t make_huge_pte(struct vm_area_struct *vma, struct page *page,
>  					   vma->vm_page_prot));
>  	}
>  	entry = pte_mkyoung(entry);
> -	entry = pte_mkhuge(entry);
>  	entry = arch_make_huge_pte(entry, shift, vma->vm_flags);
>  
>  	return entry;
> @@ -6172,7 +6171,7 @@ unsigned long hugetlb_change_protection(struct vm_area_struct *vma,
>  			unsigned int shift = huge_page_shift(hstate_vma(vma));
>  
>  			old_pte = huge_ptep_modify_prot_start(vma, address, ptep);
> -			pte = pte_mkhuge(huge_pte_modify(old_pte, newprot));
> +			pte = huge_pte_modify(old_pte, newprot);
>  			pte = arch_make_huge_pte(pte, shift, vma->vm_flags);
>  			huge_ptep_modify_prot_commit(vma, address, ptep, old_pte, pte);
>  			pages++;
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 4165304d3547..d0b14dd73adc 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -118,7 +118,6 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  		if (size != PAGE_SIZE) {
>  			pte_t entry = pfn_pte(pfn, prot);
>  
> -			entry = pte_mkhuge(entry);
>  			entry = arch_make_huge_pte(entry, ilog2(size), 0);
>  			set_huge_pte_at(&init_mm, addr, pte, entry);
>  			pfn += PFN_DOWN(size);
> -- 
> 2.25.1
> 
> 

-- 
Sincerely yours,
Mike.
