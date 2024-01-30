Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A51E841D55
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 09:14:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPHyX2Vl8z3cWF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 19:14:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPHy53jYyz2yVT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 19:14:18 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02A1DDA7;
	Tue, 30 Jan 2024 00:14:28 -0800 (PST)
Received: from [10.57.79.54] (unknown [10.57.79.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A6013F738;
	Tue, 30 Jan 2024 00:13:39 -0800 (PST)
Message-ID: <40e87333-4da9-4497-a117-9885986e376a@arm.com>
Date: Tue, 30 Jan 2024 08:13:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/9] mm/memory: factor out zapping of present pte into
 zap_present_pte()
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20240129143221.263763-1-david@redhat.com>
 <20240129143221.263763-2-david@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240129143221.263763-2-david@redhat.com>
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
> Let's prepare for further changes by factoring out processing of present
> PTEs.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/memory.c | 92 ++++++++++++++++++++++++++++++-----------------------
>  1 file changed, 52 insertions(+), 40 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index b05fd28dbce1..50a6c79c78fc 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1532,13 +1532,61 @@ zap_install_uffd_wp_if_needed(struct vm_area_struct *vma,
>  	pte_install_uffd_wp_if_needed(vma, addr, pte, pteval);
>  }
>  
> +static inline void zap_present_pte(struct mmu_gather *tlb,
> +		struct vm_area_struct *vma, pte_t *pte, pte_t ptent,
> +		unsigned long addr, struct zap_details *details,
> +		int *rss, bool *force_flush, bool *force_break)
> +{
> +	struct mm_struct *mm = tlb->mm;
> +	bool delay_rmap = false;
> +	struct folio *folio;

You need to init this to NULL otherwise its a random value when calling
should_zap_folio() if vm_normal_page() returns NULL.

> +	struct page *page;
> +
> +	page = vm_normal_page(vma, addr, ptent);
> +	if (page)
> +		folio = page_folio(page);
> +
> +	if (unlikely(!should_zap_folio(details, folio)))
> +		return;
> +	ptent = ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
> +	arch_check_zapped_pte(vma, ptent);
> +	tlb_remove_tlb_entry(tlb, pte, addr);
> +	zap_install_uffd_wp_if_needed(vma, addr, pte, details, ptent);
> +	if (unlikely(!page)) {
> +		ksm_might_unmap_zero_page(mm, ptent);
> +		return;
> +	}
> +
> +	if (!folio_test_anon(folio)) {
> +		if (pte_dirty(ptent)) {
> +			folio_mark_dirty(folio);
> +			if (tlb_delay_rmap(tlb)) {
> +				delay_rmap = true;
> +				*force_flush = true;
> +			}
> +		}
> +		if (pte_young(ptent) && likely(vma_has_recency(vma)))
> +			folio_mark_accessed(folio);
> +	}
> +	rss[mm_counter(folio)]--;
> +	if (!delay_rmap) {
> +		folio_remove_rmap_pte(folio, page, vma);
> +		if (unlikely(page_mapcount(page) < 0))
> +			print_bad_pte(vma, addr, ptent, page);
> +	}
> +	if (unlikely(__tlb_remove_page(tlb, page, delay_rmap))) {
> +		*force_flush = true;
> +		*force_break = true;
> +	}
> +}
> +
>  static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  				struct vm_area_struct *vma, pmd_t *pmd,
>  				unsigned long addr, unsigned long end,
>  				struct zap_details *details)
>  {
> +	bool force_flush = false, force_break = false;
>  	struct mm_struct *mm = tlb->mm;
> -	int force_flush = 0;
>  	int rss[NR_MM_COUNTERS];
>  	spinlock_t *ptl;
>  	pte_t *start_pte;
> @@ -1565,45 +1613,9 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  			break;
>  
>  		if (pte_present(ptent)) {
> -			unsigned int delay_rmap;
> -
> -			page = vm_normal_page(vma, addr, ptent);
> -			if (page)
> -				folio = page_folio(page);
> -
> -			if (unlikely(!should_zap_folio(details, folio)))
> -				continue;
> -			ptent = ptep_get_and_clear_full(mm, addr, pte,
> -							tlb->fullmm);
> -			arch_check_zapped_pte(vma, ptent);
> -			tlb_remove_tlb_entry(tlb, pte, addr);
> -			zap_install_uffd_wp_if_needed(vma, addr, pte, details,
> -						      ptent);
> -			if (unlikely(!page)) {
> -				ksm_might_unmap_zero_page(mm, ptent);
> -				continue;
> -			}
> -
> -			delay_rmap = 0;
> -			if (!folio_test_anon(folio)) {
> -				if (pte_dirty(ptent)) {
> -					folio_mark_dirty(folio);
> -					if (tlb_delay_rmap(tlb)) {
> -						delay_rmap = 1;
> -						force_flush = 1;
> -					}
> -				}
> -				if (pte_young(ptent) && likely(vma_has_recency(vma)))
> -					folio_mark_accessed(folio);
> -			}
> -			rss[mm_counter(folio)]--;
> -			if (!delay_rmap) {
> -				folio_remove_rmap_pte(folio, page, vma);
> -				if (unlikely(page_mapcount(page) < 0))
> -					print_bad_pte(vma, addr, ptent, page);
> -			}
> -			if (unlikely(__tlb_remove_page(tlb, page, delay_rmap))) {
> -				force_flush = 1;
> +			zap_present_pte(tlb, vma, pte, ptent, addr, details,
> +					rss, &force_flush, &force_break);
> +			if (unlikely(force_break)) {
>  				addr += PAGE_SIZE;
>  				break;
>  			}

