Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 350C2856154
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 12:19:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbCJf1KRVz3vbS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 22:19:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbCJD43SBz3cWN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 22:19:24 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8815E1480;
	Thu, 15 Feb 2024 03:19:33 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.68.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AB723F7B4;
	Thu, 15 Feb 2024 03:18:48 -0800 (PST)
Date: Thu, 15 Feb 2024 11:18:46 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v6 07/18] arm64/mm: Convert READ_ONCE(*ptep) to
 ptep_get(ptep)
Message-ID: <Zc3zFpQtO7QxALWB@FVFF77S0Q05N>
References: <20240215103205.2607016-1-ryan.roberts@arm.com>
 <20240215103205.2607016-8-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215103205.2607016-8-ryan.roberts@arm.com>
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

On Thu, Feb 15, 2024 at 10:31:54AM +0000, Ryan Roberts wrote:
> There are a number of places in the arch code that read a pte by using
> the READ_ONCE() macro. Refactor these call sites to instead use the
> ptep_get() helper, which itself is a READ_ONCE(). Generated code should
> be the same.
> 
> This will benefit us when we shortly introduce the transparent contpte
> support. In this case, ptep_get() will become more complex so we now
> have all the code abstracted through it.
> 
> Tested-by: John Hubbard <jhubbard@nvidia.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/include/asm/pgtable.h | 12 +++++++++---
>  arch/arm64/kernel/efi.c          |  2 +-
>  arch/arm64/mm/fault.c            |  4 ++--
>  arch/arm64/mm/hugetlbpage.c      |  6 +++---
>  arch/arm64/mm/kasan_init.c       |  2 +-
>  arch/arm64/mm/mmu.c              | 12 ++++++------
>  arch/arm64/mm/pageattr.c         |  4 ++--
>  arch/arm64/mm/trans_pgd.c        |  2 +-
>  8 files changed, 25 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index b6d3e9e0a946..de034ca40bad 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -275,6 +275,12 @@ static inline void set_pte(pte_t *ptep, pte_t pte)
>  	}
>  }
>  
> +#define ptep_get ptep_get
> +static inline pte_t ptep_get(pte_t *ptep)
> +{
> +	return READ_ONCE(*ptep);
> +}
> +
>  extern void __sync_icache_dcache(pte_t pteval);
>  bool pgattr_change_is_safe(u64 old, u64 new);
>  
> @@ -302,7 +308,7 @@ static inline void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep,
>  	if (!IS_ENABLED(CONFIG_DEBUG_VM))
>  		return;
>  
> -	old_pte = READ_ONCE(*ptep);
> +	old_pte = ptep_get(ptep);
>  
>  	if (!pte_valid(old_pte) || !pte_valid(pte))
>  		return;
> @@ -904,7 +910,7 @@ static inline int __ptep_test_and_clear_young(pte_t *ptep)
>  {
>  	pte_t old_pte, pte;
>  
> -	pte = READ_ONCE(*ptep);
> +	pte = ptep_get(ptep);
>  	do {
>  		old_pte = pte;
>  		pte = pte_mkold(pte);
> @@ -986,7 +992,7 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addres
>  {
>  	pte_t old_pte, pte;
>  
> -	pte = READ_ONCE(*ptep);
> +	pte = ptep_get(ptep);
>  	do {
>  		old_pte = pte;
>  		pte = pte_wrprotect(pte);
> diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
> index 0228001347be..d0e08e93b246 100644
> --- a/arch/arm64/kernel/efi.c
> +++ b/arch/arm64/kernel/efi.c
> @@ -103,7 +103,7 @@ static int __init set_permissions(pte_t *ptep, unsigned long addr, void *data)
>  {
>  	struct set_perm_data *spd = data;
>  	const efi_memory_desc_t *md = spd->md;
> -	pte_t pte = READ_ONCE(*ptep);
> +	pte_t pte = ptep_get(ptep);
>  
>  	if (md->attribute & EFI_MEMORY_RO)
>  		pte = set_pte_bit(pte, __pgprot(PTE_RDONLY));
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 55f6455a8284..a254761fa1bd 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -191,7 +191,7 @@ static void show_pte(unsigned long addr)
>  		if (!ptep)
>  			break;
>  
> -		pte = READ_ONCE(*ptep);
> +		pte = ptep_get(ptep);
>  		pr_cont(", pte=%016llx", pte_val(pte));
>  		pte_unmap(ptep);
>  	} while(0);
> @@ -214,7 +214,7 @@ int ptep_set_access_flags(struct vm_area_struct *vma,
>  			  pte_t entry, int dirty)
>  {
>  	pteval_t old_pteval, pteval;
> -	pte_t pte = READ_ONCE(*ptep);
> +	pte_t pte = ptep_get(ptep);
>  
>  	if (pte_same(pte, entry))
>  		return 0;
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 6720ec8d50e7..2892f925ed66 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -485,7 +485,7 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
>  	size_t pgsize;
>  	pte_t pte;
>  
> -	if (!pte_cont(READ_ONCE(*ptep))) {
> +	if (!pte_cont(ptep_get(ptep))) {
>  		ptep_set_wrprotect(mm, addr, ptep);
>  		return;
>  	}
> @@ -510,7 +510,7 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>  	size_t pgsize;
>  	int ncontig;
>  
> -	if (!pte_cont(READ_ONCE(*ptep)))
> +	if (!pte_cont(ptep_get(ptep)))
>  		return ptep_clear_flush(vma, addr, ptep);
>  
>  	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
> @@ -543,7 +543,7 @@ pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr
>  		 * when the permission changes from executable to non-executable
>  		 * in cases where cpu is affected with errata #2645198.
>  		 */
> -		if (pte_user_exec(READ_ONCE(*ptep)))
> +		if (pte_user_exec(ptep_get(ptep)))
>  			return huge_ptep_clear_flush(vma, addr, ptep);
>  	}
>  	return huge_ptep_get_and_clear(vma->vm_mm, addr, ptep);
> diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> index 4c7ad574b946..c2a9f4f6c7dd 100644
> --- a/arch/arm64/mm/kasan_init.c
> +++ b/arch/arm64/mm/kasan_init.c
> @@ -113,7 +113,7 @@ static void __init kasan_pte_populate(pmd_t *pmdp, unsigned long addr,
>  			memset(__va(page_phys), KASAN_SHADOW_INIT, PAGE_SIZE);
>  		next = addr + PAGE_SIZE;
>  		set_pte(ptep, pfn_pte(__phys_to_pfn(page_phys), PAGE_KERNEL));
> -	} while (ptep++, addr = next, addr != end && pte_none(READ_ONCE(*ptep)));
> +	} while (ptep++, addr = next, addr != end && pte_none(ptep_get(ptep)));
>  }
>  
>  static void __init kasan_pmd_populate(pud_t *pudp, unsigned long addr,
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 3a27d887f7dd..343629a17042 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -173,7 +173,7 @@ static void init_pte(pmd_t *pmdp, unsigned long addr, unsigned long end,
>  
>  	ptep = pte_set_fixmap_offset(pmdp, addr);
>  	do {
> -		pte_t old_pte = READ_ONCE(*ptep);
> +		pte_t old_pte = ptep_get(ptep);
>  
>  		set_pte(ptep, pfn_pte(__phys_to_pfn(phys), prot));
>  
> @@ -182,7 +182,7 @@ static void init_pte(pmd_t *pmdp, unsigned long addr, unsigned long end,
>  		 * only allow updates to the permission attributes.
>  		 */
>  		BUG_ON(!pgattr_change_is_safe(pte_val(old_pte),
> -					      READ_ONCE(pte_val(*ptep))));
> +					      pte_val(ptep_get(ptep))));
>  
>  		phys += PAGE_SIZE;
>  	} while (ptep++, addr += PAGE_SIZE, addr != end);
> @@ -852,7 +852,7 @@ static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
>  
>  	do {
>  		ptep = pte_offset_kernel(pmdp, addr);
> -		pte = READ_ONCE(*ptep);
> +		pte = ptep_get(ptep);
>  		if (pte_none(pte))
>  			continue;
>  
> @@ -985,7 +985,7 @@ static void free_empty_pte_table(pmd_t *pmdp, unsigned long addr,
>  
>  	do {
>  		ptep = pte_offset_kernel(pmdp, addr);
> -		pte = READ_ONCE(*ptep);
> +		pte = ptep_get(ptep);
>  
>  		/*
>  		 * This is just a sanity check here which verifies that
> @@ -1004,7 +1004,7 @@ static void free_empty_pte_table(pmd_t *pmdp, unsigned long addr,
>  	 */
>  	ptep = pte_offset_kernel(pmdp, 0UL);
>  	for (i = 0; i < PTRS_PER_PTE; i++) {
> -		if (!pte_none(READ_ONCE(ptep[i])))
> +		if (!pte_none(ptep_get(&ptep[i])))
>  			return;
>  	}
>  
> @@ -1473,7 +1473,7 @@ pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte
>  		 * when the permission changes from executable to non-executable
>  		 * in cases where cpu is affected with errata #2645198.
>  		 */
> -		if (pte_user_exec(READ_ONCE(*ptep)))
> +		if (pte_user_exec(ptep_get(ptep)))
>  			return ptep_clear_flush(vma, addr, ptep);
>  	}
>  	return ptep_get_and_clear(vma->vm_mm, addr, ptep);
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 924843f1f661..73a5e8f82586 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -36,7 +36,7 @@ bool can_set_direct_map(void)
>  static int change_page_range(pte_t *ptep, unsigned long addr, void *data)
>  {
>  	struct page_change_data *cdata = data;
> -	pte_t pte = READ_ONCE(*ptep);
> +	pte_t pte = ptep_get(ptep);
>  
>  	pte = clear_pte_bit(pte, cdata->clear_mask);
>  	pte = set_pte_bit(pte, cdata->set_mask);
> @@ -245,5 +245,5 @@ bool kernel_page_present(struct page *page)
>  		return true;
>  
>  	ptep = pte_offset_kernel(pmdp, addr);
> -	return pte_valid(READ_ONCE(*ptep));
> +	return pte_valid(ptep_get(ptep));
>  }
> diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
> index 7b14df3c6477..f71ab4704cce 100644
> --- a/arch/arm64/mm/trans_pgd.c
> +++ b/arch/arm64/mm/trans_pgd.c
> @@ -33,7 +33,7 @@ static void *trans_alloc(struct trans_pgd_info *info)
>  
>  static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>  {
> -	pte_t pte = READ_ONCE(*src_ptep);
> +	pte_t pte = ptep_get(src_ptep);
>  
>  	if (pte_valid(pte)) {
>  		/*
> -- 
> 2.25.1
> 
