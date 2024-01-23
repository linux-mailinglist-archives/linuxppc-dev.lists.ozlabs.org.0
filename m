Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC22C838EA1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 13:36:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK65M5Snsz3vk7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 23:36:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK64w74BSz3cV5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 23:35:43 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2C011FB;
	Tue, 23 Jan 2024 04:35:57 -0800 (PST)
Received: from [10.57.77.165] (unknown [10.57.77.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D4703F762;
	Tue, 23 Jan 2024 04:35:08 -0800 (PST)
Message-ID: <2ed34573-2f11-485d-9d8d-224e98aa59b2@arm.com>
Date: Tue, 23 Jan 2024 12:35:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/11] mm/memory: ignore writable bit in
 folio_pte_batch()
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-12-david@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240122194200.381241-12-david@redhat.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22/01/2024 19:42, David Hildenbrand wrote:
> ... and conditionally return to the caller if any pte except the first one
> is writable. fork() has to make sure to properly write-protect in case any
> PTE is writable. Other users (e.g., page unmaping) won't care.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  mm/memory.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 341b2be845b6e..a26fd0669016b 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -955,7 +955,7 @@ static __always_inline void __copy_present_ptes(struct vm_area_struct *dst_vma,
>  
>  static inline pte_t __pte_batch_clear_ignored(pte_t pte)
>  {
> -	return pte_clear_soft_dirty(pte_mkclean(pte_mkold(pte)));
> +	return pte_wrprotect(pte_clear_soft_dirty(pte_mkclean(pte_mkold(pte))));
>  }
>  
>  /*
> @@ -963,20 +963,29 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte)
>   * pages of the same folio.
>   *
>   * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN.
> - * the accessed bit, dirty bit and soft-dirty bit.
> + * the accessed bit, dirty bit, soft-dirty bit and writable bit.
> + . If "any_writable" is set, it will indicate if any other PTE besides the
> + * first (given) PTE is writable.
>   */
>  static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
> -		pte_t *start_ptep, pte_t pte, int max_nr)
> +		pte_t *start_ptep, pte_t pte, int max_nr, bool *any_writable)
>  {
>  	unsigned long folio_end_pfn = folio_pfn(folio) + folio_nr_pages(folio);
>  	const pte_t *end_ptep = start_ptep + max_nr;
>  	pte_t expected_pte = __pte_batch_clear_ignored(pte_next_pfn(pte));
>  	pte_t *ptep = start_ptep + 1;
> +	bool writable;
> +
> +	if (any_writable)
> +		*any_writable = false;
>  
>  	VM_WARN_ON_FOLIO(!pte_present(pte), folio);
>  
>  	while (ptep != end_ptep) {
> -		pte = __pte_batch_clear_ignored(ptep_get(ptep));
> +		pte = ptep_get(ptep);
> +		if (any_writable)
> +			writable = !!pte_write(pte);
> +		pte = __pte_batch_clear_ignored(pte);
>  
>  		if (!pte_same(pte, expected_pte))
>  			break;
> @@ -989,6 +998,9 @@ static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
>  		if (pte_pfn(pte) == folio_end_pfn)
>  			break;
>  
> +		if (any_writable)
> +			*any_writable |= writable;
> +
>  		expected_pte = pte_next_pfn(expected_pte);
>  		ptep++;
>  	}
> @@ -1010,6 +1022,7 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
>  {
>  	struct page *page;
>  	struct folio *folio;
> +	bool any_writable;
>  	int err, nr;
>  
>  	page = vm_normal_page(src_vma, addr, pte);
> @@ -1024,7 +1037,8 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
>  	 * by keeping the batching logic separate.
>  	 */
>  	if (unlikely(!*prealloc && folio_test_large(folio) && max_nr != 1)) {
> -		nr = folio_pte_batch(folio, addr, src_pte, pte, max_nr);
> +		nr = folio_pte_batch(folio, addr, src_pte, pte, max_nr,
> +				     &any_writable);
>  		if (folio_test_anon(folio)) {
>  			folio_ref_add(folio, nr);
>  			if (unlikely(folio_try_dup_anon_rmap_ptes(folio, page,
> @@ -1039,6 +1053,8 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
>  			folio_dup_file_rmap_ptes(folio, page, nr);
>  			rss[mm_counter_file(page)] += nr;
>  		}
> +		if (any_writable)
> +			pte = pte_mkwrite(pte, src_vma);
>  		__copy_present_ptes(dst_vma, src_vma, dst_pte, src_pte, pte,
>  				    addr, nr);
>  		return nr;

