Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0020841D7B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 09:21:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPJ5n46jvz3cWG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 19:21:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPJ5M3Zg1z2yVT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 19:20:38 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 923B3DA7;
	Tue, 30 Jan 2024 00:20:50 -0800 (PST)
Received: from [10.57.79.54] (unknown [10.57.79.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4FD33F738;
	Tue, 30 Jan 2024 00:20:03 -0800 (PST)
Message-ID: <7d25f28f-67fe-4bb8-b686-61f4f96471e5@arm.com>
Date: Tue, 30 Jan 2024 08:20:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/9] mm/memory: handle !page case in zap_present_pte()
 separately
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20240129143221.263763-1-david@redhat.com>
 <20240129143221.263763-3-david@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240129143221.263763-3-david@redhat.com>
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
> We don't need uptodate accessed/dirty bits, so in theory we could
> replace ptep_get_and_clear_full() by an optimized ptep_clear_full()
> function. Let's rely on the provided pte.
> 
> Further, there is no scenario where we would have to insert uffd-wp
> markers when zapping something that is not a normal page (i.e., zeropage).
> Add a sanity check to make sure this remains true.
> 
> should_zap_folio() no longer has to handle NULL pointers. This change
> replaces 2/3 "!page/!folio" checks by a single "!page" one.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  mm/memory.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 50a6c79c78fc..69502cdc0a7d 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1497,10 +1497,6 @@ static inline bool should_zap_folio(struct zap_details *details,
>  	if (should_zap_cows(details))
>  		return true;
>  
> -	/* E.g. the caller passes NULL for the case of a zero folio */
> -	if (!folio)
> -		return true;
> -
>  	/* Otherwise we should only zap non-anon folios */
>  	return !folio_test_anon(folio);
>  }
> @@ -1543,19 +1539,23 @@ static inline void zap_present_pte(struct mmu_gather *tlb,
>  	struct page *page;
>  
>  	page = vm_normal_page(vma, addr, ptent);
> -	if (page)
> -		folio = page_folio(page);
> +	if (!page) {
> +		/* We don't need up-to-date accessed/dirty bits. */
> +		ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
> +		arch_check_zapped_pte(vma, ptent);
> +		tlb_remove_tlb_entry(tlb, pte, addr);
> +		VM_WARN_ON_ONCE(userfaultfd_wp(vma));
> +		ksm_might_unmap_zero_page(mm, ptent);
> +		return;
> +	}
>  
> +	folio = page_folio(page);
>  	if (unlikely(!should_zap_folio(details, folio)))
>  		return;
>  	ptent = ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
>  	arch_check_zapped_pte(vma, ptent);
>  	tlb_remove_tlb_entry(tlb, pte, addr);
>  	zap_install_uffd_wp_if_needed(vma, addr, pte, details, ptent);
> -	if (unlikely(!page)) {
> -		ksm_might_unmap_zero_page(mm, ptent);
> -		return;
> -	}
>  
>  	if (!folio_test_anon(folio)) {
>  		if (pte_dirty(ptent)) {

