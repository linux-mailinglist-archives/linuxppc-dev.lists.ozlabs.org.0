Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 659D8856157
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 12:20:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbCKS2ry3z3vc1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 22:20:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbCK259P8z3cFX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 22:20:06 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 400A814BF;
	Thu, 15 Feb 2024 03:20:16 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.68.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF8B73F7B4;
	Thu, 15 Feb 2024 03:19:31 -0800 (PST)
Date: Thu, 15 Feb 2024 11:19:28 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v6 08/18] arm64/mm: Convert set_pte_at() to set_ptes(...,
 1)
Message-ID: <Zc3zQPkI6AHF7ZQd@FVFF77S0Q05N>
References: <20240215103205.2607016-1-ryan.roberts@arm.com>
 <20240215103205.2607016-9-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215103205.2607016-9-ryan.roberts@arm.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 15, 2024 at 10:31:55AM +0000, Ryan Roberts wrote:
> Since set_ptes() was introduced, set_pte_at() has been implemented as a
> generic macro around set_ptes(..., 1). So this change should continue to
> generate the same code. However, making this change prepares us for the
> transparent contpte support. It means we can reroute set_ptes() to
> __set_ptes(). Since set_pte_at() is a generic macro, there will be no
> equivalent __set_pte_at() to reroute to.
> 
> Note that a couple of calls to set_pte_at() remain in the arch code.
> This is intentional, since those call sites are acting on behalf of
> core-mm and should continue to call into the public set_ptes() rather
> than the arch-private __set_ptes().
> 
> Tested-by: John Hubbard <jhubbard@nvidia.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/include/asm/pgtable.h |  2 +-
>  arch/arm64/kernel/mte.c          |  2 +-
>  arch/arm64/kvm/guest.c           |  2 +-
>  arch/arm64/mm/fault.c            |  2 +-
>  arch/arm64/mm/hugetlbpage.c      | 10 +++++-----
>  5 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index de034ca40bad..9a2df85eb493 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1084,7 +1084,7 @@ static inline void arch_swap_restore(swp_entry_t entry, struct folio *folio)
>  #endif /* CONFIG_ARM64_MTE */
>  
>  /*
> - * On AArch64, the cache coherency is handled via the set_pte_at() function.
> + * On AArch64, the cache coherency is handled via the set_ptes() function.
>   */
>  static inline void update_mmu_cache_range(struct vm_fault *vmf,
>  		struct vm_area_struct *vma, unsigned long addr, pte_t *ptep,
> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
> index a41ef3213e1e..59bfe2e96f8f 100644
> --- a/arch/arm64/kernel/mte.c
> +++ b/arch/arm64/kernel/mte.c
> @@ -67,7 +67,7 @@ int memcmp_pages(struct page *page1, struct page *page2)
>  	/*
>  	 * If the page content is identical but at least one of the pages is
>  	 * tagged, return non-zero to avoid KSM merging. If only one of the
> -	 * pages is tagged, set_pte_at() may zero or change the tags of the
> +	 * pages is tagged, set_ptes() may zero or change the tags of the
>  	 * other page via mte_sync_tags().
>  	 */
>  	if (page_mte_tagged(page1) || page_mte_tagged(page2))
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index aaf1d4939739..6e0df623c8e9 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -1072,7 +1072,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>  		} else {
>  			/*
>  			 * Only locking to serialise with a concurrent
> -			 * set_pte_at() in the VMM but still overriding the
> +			 * set_ptes() in the VMM but still overriding the
>  			 * tags, hence ignoring the return value.
>  			 */
>  			try_page_mte_tagging(page);
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index a254761fa1bd..3235e23309ec 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -205,7 +205,7 @@ static void show_pte(unsigned long addr)
>   *
>   * It needs to cope with hardware update of the accessed/dirty state by other
>   * agents in the system and can safely skip the __sync_icache_dcache() call as,
> - * like set_pte_at(), the PTE is never changed from no-exec to exec here.
> + * like set_ptes(), the PTE is never changed from no-exec to exec here.
>   *
>   * Returns whether or not the PTE actually changed.
>   */
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 2892f925ed66..27f6160890d1 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -247,12 +247,12 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>  
>  	if (!pte_present(pte)) {
>  		for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
> -			set_pte_at(mm, addr, ptep, pte);
> +			set_ptes(mm, addr, ptep, pte, 1);
>  		return;
>  	}
>  
>  	if (!pte_cont(pte)) {
> -		set_pte_at(mm, addr, ptep, pte);
> +		set_ptes(mm, addr, ptep, pte, 1);
>  		return;
>  	}
>  
> @@ -263,7 +263,7 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>  	clear_flush(mm, addr, ptep, pgsize, ncontig);
>  
>  	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
> -		set_pte_at(mm, addr, ptep, pfn_pte(pfn, hugeprot));
> +		set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
>  }
>  
>  pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
> @@ -471,7 +471,7 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  
>  	hugeprot = pte_pgprot(pte);
>  	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
> -		set_pte_at(mm, addr, ptep, pfn_pte(pfn, hugeprot));
> +		set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
>  
>  	return 1;
>  }
> @@ -500,7 +500,7 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
>  	pfn = pte_pfn(pte);
>  
>  	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
> -		set_pte_at(mm, addr, ptep, pfn_pte(pfn, hugeprot));
> +		set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
>  }
>  
>  pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
> -- 
> 2.25.1
> 
