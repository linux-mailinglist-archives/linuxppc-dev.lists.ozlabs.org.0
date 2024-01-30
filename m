Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1A5841EAD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 10:04:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPK432VxCz3cVq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 20:04:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPK3d6sVzz30Np
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 20:04:12 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DCEA139F;
	Tue, 30 Jan 2024 01:04:24 -0800 (PST)
Received: from [10.57.79.54] (unknown [10.57.79.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA66B3F738;
	Tue, 30 Jan 2024 01:03:37 -0800 (PST)
Message-ID: <075975db-a59b-483a-95d7-0990442ebe6f@arm.com>
Date: Tue, 30 Jan 2024 09:03:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/9] mm/mmu_gather: define ENCODED_PAGE_FLAG_DELAY_RMAP
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20240129143221.263763-1-david@redhat.com>
 <20240129143221.263763-7-david@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240129143221.263763-7-david@redhat.com>
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
> Nowadays, encoded pages are only used in mmu_gather handling. Let's
> update the documentation, and define ENCODED_PAGE_BIT_DELAY_RMAP. While at
> it, rename ENCODE_PAGE_BITS to ENCODED_PAGE_BITS.
> 
> If encoded page pointers would ever be used in other context again, we'd
> likely want to change the defines to reflect their context (e.g.,
> ENCODED_PAGE_FLAG_MMU_GATHER_DELAY_RMAP). For now, let's keep it simple.
> 
> This is a preparation for using the remaining spare bit to indicate that
> the next item in an array of encoded pages is a "nr_pages" argument and
> not an encoded page.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  include/linux/mm_types.h | 17 +++++++++++------
>  mm/mmu_gather.c          |  5 +++--
>  2 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 8b611e13153e..1b89eec0d6df 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -210,8 +210,8 @@ struct page {
>   *
>   * An 'encoded_page' pointer is a pointer to a regular 'struct page', but
>   * with the low bits of the pointer indicating extra context-dependent
> - * information. Not super-common, but happens in mmu_gather and mlock
> - * handling, and this acts as a type system check on that use.
> + * information. Only used in mmu_gather handling, and this acts as a type
> + * system check on that use.
>   *
>   * We only really have two guaranteed bits in general, although you could
>   * play with 'struct page' alignment (see CONFIG_HAVE_ALIGNED_STRUCT_PAGE)
> @@ -220,21 +220,26 @@ struct page {
>   * Use the supplied helper functions to endcode/decode the pointer and bits.
>   */
>  struct encoded_page;
> -#define ENCODE_PAGE_BITS 3ul
> +
> +#define ENCODED_PAGE_BITS			3ul
> +
> +/* Perform rmap removal after we have flushed the TLB. */
> +#define ENCODED_PAGE_BIT_DELAY_RMAP		1ul
> +
>  static __always_inline struct encoded_page *encode_page(struct page *page, unsigned long flags)
>  {
> -	BUILD_BUG_ON(flags > ENCODE_PAGE_BITS);
> +	BUILD_BUG_ON(flags > ENCODED_PAGE_BITS);
>  	return (struct encoded_page *)(flags | (unsigned long)page);
>  }
>  
>  static inline unsigned long encoded_page_flags(struct encoded_page *page)
>  {
> -	return ENCODE_PAGE_BITS & (unsigned long)page;
> +	return ENCODED_PAGE_BITS & (unsigned long)page;
>  }
>  
>  static inline struct page *encoded_page_ptr(struct encoded_page *page)
>  {
> -	return (struct page *)(~ENCODE_PAGE_BITS & (unsigned long)page);
> +	return (struct page *)(~ENCODED_PAGE_BITS & (unsigned long)page);
>  }
>  
>  /*
> diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
> index ac733d81b112..6540c99c6758 100644
> --- a/mm/mmu_gather.c
> +++ b/mm/mmu_gather.c
> @@ -53,7 +53,7 @@ static void tlb_flush_rmap_batch(struct mmu_gather_batch *batch, struct vm_area_
>  	for (int i = 0; i < batch->nr; i++) {
>  		struct encoded_page *enc = batch->encoded_pages[i];
>  
> -		if (encoded_page_flags(enc)) {
> +		if (encoded_page_flags(enc) & ENCODED_PAGE_BIT_DELAY_RMAP) {
>  			struct page *page = encoded_page_ptr(enc);
>  			folio_remove_rmap_pte(page_folio(page), page, vma);
>  		}
> @@ -119,6 +119,7 @@ static void tlb_batch_list_free(struct mmu_gather *tlb)
>  bool __tlb_remove_page_size(struct mmu_gather *tlb, struct page *page,
>  		bool delay_rmap, int page_size)
>  {
> +	int flags = delay_rmap ? ENCODED_PAGE_BIT_DELAY_RMAP : 0;
>  	struct mmu_gather_batch *batch;
>  
>  	VM_BUG_ON(!tlb->end);
> @@ -132,7 +133,7 @@ bool __tlb_remove_page_size(struct mmu_gather *tlb, struct page *page,
>  	 * Add the page and check if we are full. If so
>  	 * force a flush.
>  	 */
> -	batch->encoded_pages[batch->nr++] = encode_page(page, delay_rmap);
> +	batch->encoded_pages[batch->nr++] = encode_page(page, flags);
>  	if (batch->nr == batch->max) {
>  		if (!tlb_next_batch(tlb))
>  			return true;

