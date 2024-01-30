Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC273841E52
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 09:49:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPJkH6gM2z3w5C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 19:49:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPJj54Ypcz3vyJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 19:48:09 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E3AA139F;
	Tue, 30 Jan 2024 00:48:21 -0800 (PST)
Received: from [10.57.79.54] (unknown [10.57.79.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF4953F738;
	Tue, 30 Jan 2024 00:47:34 -0800 (PST)
Message-ID: <e85fafb6-dd72-46c7-aa2c-2fa149f927d1@arm.com>
Date: Tue, 30 Jan 2024 08:47:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/9] mm/memory: factor out zapping folio pte into
 zap_present_folio_pte()
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20240129143221.263763-1-david@redhat.com>
 <20240129143221.263763-5-david@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240129143221.263763-5-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Vasily Gorbik <gor@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Nick Piggin <npiggin@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29/01/2024 14:32, David Hildenbrand wrote:
> Let's prepare for further changes by factoring it out into a separate
> function.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  mm/memory.c | 53 ++++++++++++++++++++++++++++++++---------------------
>  1 file changed, 32 insertions(+), 21 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 20bc13ab8db2..a2190d7cfa74 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1528,30 +1528,14 @@ zap_install_uffd_wp_if_needed(struct vm_area_struct *vma,
>  	pte_install_uffd_wp_if_needed(vma, addr, pte, pteval);
>  }
>  
> -static inline void zap_present_pte(struct mmu_gather *tlb,
> -		struct vm_area_struct *vma, pte_t *pte, pte_t ptent,
> -		unsigned long addr, struct zap_details *details,
> -		int *rss, bool *force_flush, bool *force_break)
> +static inline void zap_present_folio_pte(struct mmu_gather *tlb,
> +		struct vm_area_struct *vma, struct folio *folio,
> +		struct page *page, pte_t *pte, pte_t ptent, unsigned long addr,
> +		struct zap_details *details, int *rss, bool *force_flush,
> +		bool *force_break)
>  {
>  	struct mm_struct *mm = tlb->mm;
>  	bool delay_rmap = false;
> -	struct folio *folio;
> -	struct page *page;
> -
> -	page = vm_normal_page(vma, addr, ptent);
> -	if (!page) {
> -		/* We don't need up-to-date accessed/dirty bits. */
> -		ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
> -		arch_check_zapped_pte(vma, ptent);
> -		tlb_remove_tlb_entry(tlb, pte, addr);
> -		VM_WARN_ON_ONCE(userfaultfd_wp(vma));
> -		ksm_might_unmap_zero_page(mm, ptent);
> -		return;
> -	}
> -
> -	folio = page_folio(page);
> -	if (unlikely(!should_zap_folio(details, folio)))
> -		return;
>  
>  	if (!folio_test_anon(folio)) {
>  		ptent = ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
> @@ -1586,6 +1570,33 @@ static inline void zap_present_pte(struct mmu_gather *tlb,
>  	}
>  }
>  
> +static inline void zap_present_pte(struct mmu_gather *tlb,
> +		struct vm_area_struct *vma, pte_t *pte, pte_t ptent,
> +		unsigned long addr, struct zap_details *details,
> +		int *rss, bool *force_flush, bool *force_break)
> +{
> +	struct mm_struct *mm = tlb->mm;
> +	struct folio *folio;
> +	struct page *page;
> +
> +	page = vm_normal_page(vma, addr, ptent);
> +	if (!page) {
> +		/* We don't need up-to-date accessed/dirty bits. */
> +		ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
> +		arch_check_zapped_pte(vma, ptent);
> +		tlb_remove_tlb_entry(tlb, pte, addr);
> +		VM_WARN_ON_ONCE(userfaultfd_wp(vma));
> +		ksm_might_unmap_zero_page(mm, ptent);
> +		return;
> +	}
> +
> +	folio = page_folio(page);
> +	if (unlikely(!should_zap_folio(details, folio)))
> +		return;
> +	zap_present_folio_pte(tlb, vma, folio, page, pte, ptent, addr, details,
> +			      rss, force_flush, force_break);
> +}
> +
>  static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  				struct vm_area_struct *vma, pmd_t *pmd,
>  				unsigned long addr, unsigned long end,

