Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5BD83915B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 15:28:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK8bW4pvGz3cX4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 01:28:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK8b44r7zz30QJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jan 2024 01:28:31 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B78CB1FB;
	Tue, 23 Jan 2024 06:28:45 -0800 (PST)
Received: from [10.57.77.165] (unknown [10.57.77.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 707653F762;
	Tue, 23 Jan 2024 06:27:56 -0800 (PST)
Message-ID: <7db13538-20b9-4c12-b333-d197c4b2846d@arm.com>
Date: Tue, 23 Jan 2024 14:27:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/11] mm/memory: ignore dirty/accessed/soft-dirty bits
 in folio_pte_batch()
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-11-david@redhat.com>
 <59592b50-fe89-4b32-8490-2e6c296f972f@arm.com>
 <76740e33-9b52-4e23-b407-8ae38bac15ec@redhat.com>
 <94d33a07-c59a-4315-9c64-8b4d959ca1f4@arm.com>
 <c92c2460-c66a-46c7-b84f-0732965dcf73@redhat.com>
 <8eb5db8e-33cc-4cbf-a1bf-0da7af230fab@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <8eb5db8e-33cc-4cbf-a1bf-0da7af230fab@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 23/01/2024 14:13, David Hildenbrand wrote:
>>> Although now I'm wondering if there is a race here... What happens if a page in
>>> the parent becomes dirty after you have checked it but before you write protect
>>> it? Isn't that already a problem with the current non-batched version? Why do we
>>> even to preserve dirty in the child for private mappings?
>>
>> I suspect, because the parent could zap the anon folio. If the folio is
>> clean, but the PTE dirty, I suspect that we could lose data of the child
>> if we were to evict that clean folio (swapout).
>>
>> So I assume we simply copy the dirty PTE bit, so the system knows that
>> that folio is actually dirty, because one PTE is dirty.
> 
> Oh, and regarding your race concern: it's undefined which page state
> would see if some write is racing with fork, so it also doesn't matter
> if we would copy the PTE dirty bit or not, if it gets set in a racy fashion.

Ahh that makes sense. Thanks.

> 
> I'll not experiment with:

Looks good as long as its still performant.

> 
> From 14e83ff2a422a96ce5701f9c8454a49f9ed947e3 Mon Sep 17 00:00:00 2001
> From: David Hildenbrand <david@redhat.com>
> Date: Sat, 30 Dec 2023 12:54:35 +0100
> Subject: [PATCH] mm/memory: ignore dirty/accessed/soft-dirty bits in
>  folio_pte_batch()
> 
> Let's always ignore the accessed/young bit: we'll always mark the PTE
> as old in our child process during fork, and upcoming users will
> similarly not care.
> 
> Ignore the dirty bit only if we don't want to duplicate the dirty bit
> into the child process during fork. Maybe, we could just set all PTEs
> in the child dirty if any PTE is dirty. For now, let's keep the behavior
> unchanged.
> 
> Ignore the soft-dirty bit only if the bit doesn't have any meaning in
> the src vma.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/memory.c | 34 ++++++++++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 7690994929d26..9aba1b0e871ca 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -953,24 +953,44 @@ static __always_inline void __copy_present_ptes(struct
> vm_area_struct *dst_vma,
>      set_ptes(dst_vma->vm_mm, addr, dst_pte, pte, nr);
>  }
>  
> +/* Flags for folio_pte_batch(). */
> +typedef int __bitwise fpb_t;
> +
> +/* Compare PTEs after pte_mkclean(), ignoring the dirty bit. */
> +#define FPB_IGNORE_DIRTY        ((__force fpb_t)BIT(0))
> +
> +/* Compare PTEs after pte_clear_soft_dirty(), ignoring the soft-dirty bit. */
> +#define FPB_IGNORE_SOFT_DIRTY        ((__force fpb_t)BIT(1))
> +
> +static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
> +{
> +    if (flags & FPB_IGNORE_DIRTY)
> +        pte = pte_mkclean(pte);
> +    if (likely(flags & FPB_IGNORE_SOFT_DIRTY))
> +        pte = pte_clear_soft_dirty(pte);
> +    return pte_mkold(pte);
> +}
> +
>  /*
>   * Detect a PTE batch: consecutive (present) PTEs that map consecutive
>   * pages of the same folio.
>   *
>   * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN.
> + * the accessed bit, dirty bit (with FPB_IGNORE_DIRTY) and soft-dirty bit
> + * (with FPB_IGNORE_SOFT_DIRTY).
>   */
>  static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
> -        pte_t *start_ptep, pte_t pte, int max_nr)
> +        pte_t *start_ptep, pte_t pte, int max_nr, fpb_t flags)
>  {
>      unsigned long folio_end_pfn = folio_pfn(folio) + folio_nr_pages(folio);
>      const pte_t *end_ptep = start_ptep + max_nr;
> -    pte_t expected_pte = pte_next_pfn(pte);
> +    pte_t expected_pte = __pte_batch_clear_ignored(pte_next_pfn(pte), flags);
>      pte_t *ptep = start_ptep + 1;
>  
>      VM_WARN_ON_FOLIO(!pte_present(pte), folio);
>  
>      while (ptep != end_ptep) {
> -        pte = ptep_get(ptep);
> +        pte = __pte_batch_clear_ignored(ptep_get(ptep), flags);
>  
>          if (!pte_same(pte, expected_pte))
>              break;
> @@ -1004,6 +1024,7 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct
> vm_area_struct *src_vma
>  {
>      struct page *page;
>      struct folio *folio;
> +    fpb_t flags = 0;
>      int err, nr;
>  
>      page = vm_normal_page(src_vma, addr, pte);
> @@ -1018,7 +1039,12 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct
> vm_area_struct *src_vma
>       * by keeping the batching logic separate.
>       */
>      if (unlikely(!*prealloc && folio_test_large(folio) && max_nr != 1)) {
> -        nr = folio_pte_batch(folio, addr, src_pte, pte, max_nr);
> +        if (src_vma->vm_flags & VM_SHARED)
> +            flags |= FPB_IGNORE_DIRTY;
> +        if (!vma_soft_dirty_enabled(src_vma))
> +            flags |= FPB_IGNORE_SOFT_DIRTY;
> +
> +        nr = folio_pte_batch(folio, addr, src_pte, pte, max_nr, flags);
>          folio_ref_add(folio, nr);
>          if (folio_test_anon(folio)) {
>              if (unlikely(folio_try_dup_anon_rmap_ptes(folio, page,

