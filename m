Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5525C838C60
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 11:46:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK3ff0hWdz3cX6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 21:46:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK3fC6Fgzz2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 21:45:54 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 689251FB;
	Tue, 23 Jan 2024 02:46:08 -0800 (PST)
Received: from [10.57.77.165] (unknown [10.57.77.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FFE73F5A1;
	Tue, 23 Jan 2024 02:45:19 -0800 (PST)
Message-ID: <3d6a5076-48d3-4790-a507-d3b1584e8587@arm.com>
Date: Tue, 23 Jan 2024 10:45:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/11] mm/memory: factor out copying the actual PTE in
 copy_present_pte()
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-8-david@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240122194200.381241-8-david@redhat.com>
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
> Let's prepare for further changes.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  mm/memory.c | 60 ++++++++++++++++++++++++++++-------------------------
>  1 file changed, 32 insertions(+), 28 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 7e1f4849463aa..2aa2051ee51d3 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -930,6 +930,29 @@ copy_present_page(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
>  	return 0;
>  }
>  
> +static inline void __copy_present_pte(struct vm_area_struct *dst_vma,
> +		struct vm_area_struct *src_vma, pte_t *dst_pte, pte_t *src_pte,
> +		pte_t pte, unsigned long addr)
> +{
> +	struct mm_struct *src_mm = src_vma->vm_mm;
> +
> +	/* If it's a COW mapping, write protect it both processes. */
> +	if (is_cow_mapping(src_vma->vm_flags) && pte_write(pte)) {
> +		ptep_set_wrprotect(src_mm, addr, src_pte);
> +		pte = pte_wrprotect(pte);
> +	}
> +
> +	/* If it's a shared mapping, mark it clean in the child. */
> +	if (src_vma->vm_flags & VM_SHARED)
> +		pte = pte_mkclean(pte);
> +	pte = pte_mkold(pte);
> +
> +	if (!userfaultfd_wp(dst_vma))
> +		pte = pte_clear_uffd_wp(pte);
> +
> +	set_pte_at(dst_vma->vm_mm, addr, dst_pte, pte);
> +}
> +
>  /*
>   * Copy one pte.  Returns 0 if succeeded, or -EAGAIN if one preallocated page
>   * is required to copy this pte.
> @@ -939,16 +962,16 @@ copy_present_pte(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>  		 pte_t *dst_pte, pte_t *src_pte, unsigned long addr, int *rss,
>  		 struct folio **prealloc)
>  {
> -	struct mm_struct *src_mm = src_vma->vm_mm;
> -	unsigned long vm_flags = src_vma->vm_flags;
>  	pte_t pte = ptep_get(src_pte);
>  	struct page *page;
>  	struct folio *folio;
>  
>  	page = vm_normal_page(src_vma, addr, pte);
> -	if (page)
> -		folio = page_folio(page);
> -	if (page && folio_test_anon(folio)) {
> +	if (unlikely(!page))
> +		goto copy_pte;
> +
> +	folio = page_folio(page);
> +	if (folio_test_anon(folio)) {
>  		/*
>  		 * If this page may have been pinned by the parent process,
>  		 * copy the page immediately for the child so that we'll always
> @@ -963,34 +986,15 @@ copy_present_pte(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>  						 addr, rss, prealloc, page);
>  		}
>  		rss[MM_ANONPAGES]++;
> -	} else if (page) {
> +		VM_WARN_ON_FOLIO(PageAnonExclusive(page), folio);
> +	} else {
>  		folio_get(folio);
>  		folio_dup_file_rmap_pte(folio, page);
>  		rss[mm_counter_file(page)]++;
>  	}
>  
> -	/*
> -	 * If it's a COW mapping, write protect it both
> -	 * in the parent and the child
> -	 */
> -	if (is_cow_mapping(vm_flags) && pte_write(pte)) {
> -		ptep_set_wrprotect(src_mm, addr, src_pte);
> -		pte = pte_wrprotect(pte);
> -	}
> -	VM_BUG_ON(page && folio_test_anon(folio) && PageAnonExclusive(page));
> -
> -	/*
> -	 * If it's a shared mapping, mark it clean in
> -	 * the child
> -	 */
> -	if (vm_flags & VM_SHARED)
> -		pte = pte_mkclean(pte);
> -	pte = pte_mkold(pte);
> -
> -	if (!userfaultfd_wp(dst_vma))
> -		pte = pte_clear_uffd_wp(pte);
> -
> -	set_pte_at(dst_vma->vm_mm, addr, dst_pte, pte);
> +copy_pte:
> +	__copy_present_pte(dst_vma, src_vma, dst_pte, src_pte, pte, addr);
>  	return 0;
>  }
>  

