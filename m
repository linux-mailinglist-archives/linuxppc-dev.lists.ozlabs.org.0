Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9399C838E74
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 13:26:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK5sr2trjz2yVT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 23:26:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK5sM6gsbz3cW8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 23:25:42 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69D231FB;
	Tue, 23 Jan 2024 04:25:56 -0800 (PST)
Received: from [10.57.77.165] (unknown [10.57.77.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6A213F762;
	Tue, 23 Jan 2024 04:25:05 -0800 (PST)
Message-ID: <59592b50-fe89-4b32-8490-2e6c296f972f@arm.com>
Date: Tue, 23 Jan 2024 12:25:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/11] mm/memory: ignore dirty/accessed/soft-dirty bits
 in folio_pte_batch()
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-11-david@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240122194200.381241-11-david@redhat.com>
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

On 22/01/2024 19:41, David Hildenbrand wrote:
> Let's ignore these bits: they are irrelevant for fork, and will likely
> be irrelevant for upcoming users such as page unmapping.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/memory.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index f563aec85b2a8..341b2be845b6e 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -953,24 +953,30 @@ static __always_inline void __copy_present_ptes(struct vm_area_struct *dst_vma,
>  	set_ptes(dst_vma->vm_mm, addr, dst_pte, pte, nr);
>  }
>  
> +static inline pte_t __pte_batch_clear_ignored(pte_t pte)
> +{
> +	return pte_clear_soft_dirty(pte_mkclean(pte_mkold(pte)));
> +}
> +
>  /*
>   * Detect a PTE batch: consecutive (present) PTEs that map consecutive
>   * pages of the same folio.
>   *
>   * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN.

nit: last char should be a comma (,) not a full stop (.)

> + * the accessed bit, dirty bit and soft-dirty bit.
>   */
>  static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
>  		pte_t *start_ptep, pte_t pte, int max_nr)
>  {
>  	unsigned long folio_end_pfn = folio_pfn(folio) + folio_nr_pages(folio);
>  	const pte_t *end_ptep = start_ptep + max_nr;
> -	pte_t expected_pte = pte_next_pfn(pte);
> +	pte_t expected_pte = __pte_batch_clear_ignored(pte_next_pfn(pte));
>  	pte_t *ptep = start_ptep + 1;
>  
>  	VM_WARN_ON_FOLIO(!pte_present(pte), folio);
>  
>  	while (ptep != end_ptep) {
> -		pte = ptep_get(ptep);
> +		pte = __pte_batch_clear_ignored(ptep_get(ptep));
>  
>  		if (!pte_same(pte, expected_pte))
>  			break;

I think you'll lose dirty information in the child for private mappings? If the
first pte in a batch is clean, but a subsequent page is dirty, you will end up
setting all the pages in the batch as clean in the child. Previous behavior
would preserve dirty bit for private mappings.

In my version (v3) that did arbitrary batching, I had some fun and games
tracking dirty, write and uffd_wp:
https://lore.kernel.org/linux-arm-kernel/20231204105440.61448-2-ryan.roberts@arm.com/

Also, I think you will currently either set soft dirty on all or none of the
pages in the batch, depending on the value of the first. I previously convinced
myself that the state was unimportant so always cleared it in the child to
provide consistency.



