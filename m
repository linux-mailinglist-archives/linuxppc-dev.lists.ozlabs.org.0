Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B034F841DD2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 09:33:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPJMZ51RTz3cP7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 19:32:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPJM83NwCz2yVT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 19:32:34 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04441DA7;
	Tue, 30 Jan 2024 00:32:47 -0800 (PST)
Received: from [10.57.79.54] (unknown [10.57.79.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DEEE3F738;
	Tue, 30 Jan 2024 00:32:00 -0800 (PST)
Message-ID: <40cfb242-ceb0-44c6-afe7-c1744825dc62@arm.com>
Date: Tue, 30 Jan 2024 08:31:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/9] mm/memory: further separate anon and pagecache
 folio handling in zap_present_pte()
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20240129143221.263763-1-david@redhat.com>
 <20240129143221.263763-4-david@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240129143221.263763-4-david@redhat.com>
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
> We don't need up-to-date accessed-dirty information for anon folios and can
> simply work with the ptent we already have. Also, we know the RSS counter
> we want to update.
> 
> We can safely move arch_check_zapped_pte() + tlb_remove_tlb_entry() +
> zap_install_uffd_wp_if_needed() after updating the folio and RSS.
> 
> While at it, only call zap_install_uffd_wp_if_needed() if there is even
> any chance that pte_install_uffd_wp_if_needed() would do *something*.
> That is, just don't bother if uffd-wp does not apply.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/memory.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 69502cdc0a7d..20bc13ab8db2 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1552,12 +1552,9 @@ static inline void zap_present_pte(struct mmu_gather *tlb,
>  	folio = page_folio(page);
>  	if (unlikely(!should_zap_folio(details, folio)))
>  		return;
> -	ptent = ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
> -	arch_check_zapped_pte(vma, ptent);
> -	tlb_remove_tlb_entry(tlb, pte, addr);
> -	zap_install_uffd_wp_if_needed(vma, addr, pte, details, ptent);
>  
>  	if (!folio_test_anon(folio)) {
> +		ptent = ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
>  		if (pte_dirty(ptent)) {
>  			folio_mark_dirty(folio);
>  			if (tlb_delay_rmap(tlb)) {
> @@ -1567,8 +1564,17 @@ static inline void zap_present_pte(struct mmu_gather *tlb,
>  		}
>  		if (pte_young(ptent) && likely(vma_has_recency(vma)))
>  			folio_mark_accessed(folio);
> +		rss[mm_counter(folio)]--;
> +	} else {
> +		/* We don't need up-to-date accessed/dirty bits. */
> +		ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
> +		rss[MM_ANONPAGES]--;
>  	}
> -	rss[mm_counter(folio)]--;
> +	arch_check_zapped_pte(vma, ptent);

Isn't the x86 (only) implementation of this relying on the dirty bit? So doesn't
that imply you still need get_and_clear for anon? (And in hindsight I think that
logic would apply to the previous patch too?)

Impl:

void arch_check_zapped_pte(struct vm_area_struct *vma, pte_t pte)
{
	/*
	 * Hardware before shadow stack can (rarely) set Dirty=1
	 * on a Write=0 PTE. So the below condition
	 * only indicates a software bug when shadow stack is
	 * supported by the HW. This checking is covered in
	 * pte_shstk().
	 */
	VM_WARN_ON_ONCE(!(vma->vm_flags & VM_SHADOW_STACK) &&
			pte_shstk(pte));
}

static inline bool pte_shstk(pte_t pte)
{
	return cpu_feature_enabled(X86_FEATURE_SHSTK) &&
	       (pte_flags(pte) & (_PAGE_RW | _PAGE_DIRTY)) == _PAGE_DIRTY;
}


> +	tlb_remove_tlb_entry(tlb, pte, addr);
> +	if (unlikely(userfaultfd_pte_wp(vma, ptent)))
> +		zap_install_uffd_wp_if_needed(vma, addr, pte, details, ptent);
> +
>  	if (!delay_rmap) {
>  		folio_remove_rmap_pte(folio, page, vma);
>  		if (unlikely(page_mapcount(page) < 0))

