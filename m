Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C715C841E42
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 09:47:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPJgz5PTCz3vp0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 19:47:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPJZ21b9Xz3cWW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 19:42:00 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5232BDA7;
	Tue, 30 Jan 2024 00:42:13 -0800 (PST)
Received: from [10.57.79.54] (unknown [10.57.79.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E241A3F738;
	Tue, 30 Jan 2024 00:41:25 -0800 (PST)
Message-ID: <6cf5cce0-69aa-437b-a13f-4d9adeae01df@arm.com>
Date: Tue, 30 Jan 2024 08:41:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/9] mm/mmu_gather: pass "delay_rmap" instead of
 encoded page to __tlb_remove_page_size()
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20240129143221.263763-1-david@redhat.com>
 <20240129143221.263763-6-david@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240129143221.263763-6-david@redhat.com>
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
> We have two bits available in the encoded page pointer to store
> additional information. Currently, we use one bit to request delay of the
> rmap removal until after a TLB flush.
> 
> We want to make use of the remaining bit internally for batching of
> multiple pages of the same folio, specifying that the next encoded page
> pointer in an array is actually "nr_pages". So pass page + delay_rmap flag
> instead of an encoded page, to handle the encoding internally.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  arch/s390/include/asm/tlb.h | 13 ++++++-------
>  include/asm-generic/tlb.h   | 12 ++++++------
>  mm/mmu_gather.c             |  7 ++++---
>  3 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
> index d1455a601adc..48df896d5b79 100644
> --- a/arch/s390/include/asm/tlb.h
> +++ b/arch/s390/include/asm/tlb.h
> @@ -25,8 +25,7 @@
>  void __tlb_remove_table(void *_table);
>  static inline void tlb_flush(struct mmu_gather *tlb);
>  static inline bool __tlb_remove_page_size(struct mmu_gather *tlb,
> -					  struct encoded_page *page,
> -					  int page_size);
> +		struct page *page, bool delay_rmap, int page_size);
>  
>  #define tlb_flush tlb_flush
>  #define pte_free_tlb pte_free_tlb
> @@ -42,14 +41,14 @@ static inline bool __tlb_remove_page_size(struct mmu_gather *tlb,
>   * tlb_ptep_clear_flush. In both flush modes the tlb for a page cache page
>   * has already been freed, so just do free_page_and_swap_cache.
>   *
> - * s390 doesn't delay rmap removal, so there is nothing encoded in
> - * the page pointer.
> + * s390 doesn't delay rmap removal.
>   */
>  static inline bool __tlb_remove_page_size(struct mmu_gather *tlb,
> -					  struct encoded_page *page,
> -					  int page_size)
> +		struct page *page, bool delay_rmap, int page_size)
>  {
> -	free_page_and_swap_cache(encoded_page_ptr(page));
> +	VM_WARN_ON_ONCE(delay_rmap);
> +
> +	free_page_and_swap_cache(page);
>  	return false;
>  }
>  
> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
> index 129a3a759976..2eb7b0d4f5d2 100644
> --- a/include/asm-generic/tlb.h
> +++ b/include/asm-generic/tlb.h
> @@ -260,9 +260,8 @@ struct mmu_gather_batch {
>   */
>  #define MAX_GATHER_BATCH_COUNT	(10000UL/MAX_GATHER_BATCH)
>  
> -extern bool __tlb_remove_page_size(struct mmu_gather *tlb,
> -				   struct encoded_page *page,
> -				   int page_size);
> +extern bool __tlb_remove_page_size(struct mmu_gather *tlb, struct page *page,
> +		bool delay_rmap, int page_size);
>  
>  #ifdef CONFIG_SMP
>  /*
> @@ -462,13 +461,14 @@ static inline void tlb_flush_mmu_tlbonly(struct mmu_gather *tlb)
>  static inline void tlb_remove_page_size(struct mmu_gather *tlb,
>  					struct page *page, int page_size)
>  {
> -	if (__tlb_remove_page_size(tlb, encode_page(page, 0), page_size))
> +	if (__tlb_remove_page_size(tlb, page, false, page_size))
>  		tlb_flush_mmu(tlb);
>  }
>  
> -static __always_inline bool __tlb_remove_page(struct mmu_gather *tlb, struct page *page, unsigned int flags)
> +static __always_inline bool __tlb_remove_page(struct mmu_gather *tlb,
> +		struct page *page, bool delay_rmap)
>  {
> -	return __tlb_remove_page_size(tlb, encode_page(page, flags), PAGE_SIZE);
> +	return __tlb_remove_page_size(tlb, page, delay_rmap, PAGE_SIZE);
>  }
>  
>  /* tlb_remove_page
> diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
> index 604ddf08affe..ac733d81b112 100644
> --- a/mm/mmu_gather.c
> +++ b/mm/mmu_gather.c
> @@ -116,7 +116,8 @@ static void tlb_batch_list_free(struct mmu_gather *tlb)
>  	tlb->local.next = NULL;
>  }
>  
> -bool __tlb_remove_page_size(struct mmu_gather *tlb, struct encoded_page *page, int page_size)
> +bool __tlb_remove_page_size(struct mmu_gather *tlb, struct page *page,
> +		bool delay_rmap, int page_size)
>  {
>  	struct mmu_gather_batch *batch;
>  
> @@ -131,13 +132,13 @@ bool __tlb_remove_page_size(struct mmu_gather *tlb, struct encoded_page *page, i
>  	 * Add the page and check if we are full. If so
>  	 * force a flush.
>  	 */
> -	batch->encoded_pages[batch->nr++] = page;
> +	batch->encoded_pages[batch->nr++] = encode_page(page, delay_rmap);
>  	if (batch->nr == batch->max) {
>  		if (!tlb_next_batch(tlb))
>  			return true;
>  		batch = tlb->active;
>  	}
> -	VM_BUG_ON_PAGE(batch->nr > batch->max, encoded_page_ptr(page));
> +	VM_BUG_ON_PAGE(batch->nr > batch->max, page);
>  
>  	return false;
>  }

