Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 398AE7407A6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 03:34:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EIe07R24;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrPHr0ydxz3bTr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 11:34:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EIe07R24;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrPGx5RNdz2xq5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 11:33:12 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-54f87d5f1abso2689445a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 18:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687915990; x=1690507990;
        h=in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YKq6tOX35loLP2WnY1DBxuNBHc7fzn7GBrN6lMGkdr0=;
        b=EIe07R24bGBnSRl0crNE9YiM4T0iTsgSA0V4onpCkiElP+hAc1wdUFsidZ4Nd0FLBb
         PiQ7yX2dXOyHZW8Io8bwzjzMi4F/2ETCOldImlu5WKFz607Xo3H14yWH9CKLpF5cgFRJ
         JvQ5ygCQoERDnNFQVeU6bRTWC6kpgpYjRXwS1PrpnL0zK2V7CKFyKhx9KTt8ANREjEDH
         GeX4U2t9PDowDapkoqDSCs5TCJvXsXXmcnLN+kZ0NF3lWKU8s9c+ETBeLGg9TJyeV6K6
         Z5R9pfV4GVQ+gm75N+t8TNpmBjnSngAqzCIocUV1g7BOMQ1D3haIRfX+NwTDdeqn++td
         wclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687915990; x=1690507990;
        h=in-reply-to:subject:cc:to:from:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YKq6tOX35loLP2WnY1DBxuNBHc7fzn7GBrN6lMGkdr0=;
        b=a9yl8I9o96lZ7Xf5g6CzTqijew0nWayic0amlc/mRTqlT74qXZDw+ND9BpQS+EOSTD
         xfdtWsKwByJYtYWWfPflDN6QBxBM3GI08LOc8knP6XvVUdcD9NnXsPJ51cJsJUzUn3Qr
         D1o+6/d/illjCPCC21Nxvhz6KNVQ8Kg+TlL/Ch/pZnbgK/34hyyXu29seZlkXptkrxX8
         6OeKS8cx/dxartlVlf4YmfiRO5NGpEXM0GectJsWVx23AoKYXEy/bRwuquXdHRUul7za
         XMuuRKX94qzNQ/UNQbRU2JT5VgKKrosQMsDapMgtLkcCzbQVbqrTdJtlzUwy22VdKZBx
         oUog==
X-Gm-Message-State: AC+VfDxCwV6F1RcmEfnHosuVBM2+hXgb6SMzFsn0Jk4KRkxQ+7AhpUeW
	btBGshr3iavYN2BxT0SAfmc=
X-Google-Smtp-Source: ACHHUZ5v+0e9Mlbj9pLCeuqDLJckKfYWbSRyer3Vb058p8GZAgUxlVRBHgJAc/FAlhAV/RQ/62RnpQ==
X-Received: by 2002:a05:6a21:6d9e:b0:121:f3a2:3a8 with SMTP id wl30-20020a056a216d9e00b00121f3a203a8mr20491541pzb.0.1687915989681;
        Tue, 27 Jun 2023 18:33:09 -0700 (PDT)
Received: from dw-tp ([49.207.220.159])
        by smtp.gmail.com with ESMTPSA id a17-20020a62e211000000b0066ccb8e8024sm5614071pfi.30.2023.06.27.18.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 18:33:09 -0700 (PDT)
Date: Wed, 28 Jun 2023 07:03:03 +0530
Message-Id: <87r0pwnzg0.fsf@doe.com>
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH v2 14/16] powerpc/book3s64/vmemmap: Switch radix to use a different vmemmap handling function
In-Reply-To: <20230616110826.344417-15-aneesh.kumar@linux.ibm.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> This is in preparation to update radix to implement vmemmap optimization
> for devdax. Below are the rules w.r.t radix vmemmap mapping
>
> 1. First try to map things using PMD (2M)
> 2. With altmap if altmap cross-boundary check returns true, fall back to
>    PAGE_SIZE
> 3. If we can't allocate PMD_SIZE backing memory for vmemmap, fallback to
>    PAGE_SIZE
>
> On removing vmemmap mapping, check if every subsection that is using the
> vmemmap area is invalid. If found to be invalid, that implies we can safely
> free the vmemmap area. We don't use the PAGE_UNUSED pattern used by x86
> because with 64K page size, we need to do the above check even at the
> PAGE_SIZE granularity.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/radix.h |   2 +
>  arch/powerpc/include/asm/pgtable.h         |   3 +
>  arch/powerpc/mm/book3s64/radix_pgtable.c   | 319 +++++++++++++++++++--
>  arch/powerpc/mm/init_64.c                  |  26 +-
>  4 files changed, 319 insertions(+), 31 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
> index 8cdff5a05011..87d4c1e62491 100644
> --- a/arch/powerpc/include/asm/book3s/64/radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/radix.h
> @@ -332,6 +332,8 @@ extern int __meminit radix__vmemmap_create_mapping(unsigned long start,
>  					     unsigned long phys);
>  int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end,
>  				      int node, struct vmem_altmap *altmap);
> +void __ref radix__vmemmap_free(unsigned long start, unsigned long end,
> +			       struct vmem_altmap *altmap);
>  extern void radix__vmemmap_remove_mapping(unsigned long start,
>  				    unsigned long page_size);
>  
> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
> index 9972626ddaf6..6d4cd2ebae6e 100644
> --- a/arch/powerpc/include/asm/pgtable.h
> +++ b/arch/powerpc/include/asm/pgtable.h
> @@ -168,6 +168,9 @@ static inline bool is_ioremap_addr(const void *x)
>  
>  struct seq_file;
>  void arch_report_meminfo(struct seq_file *m);
> +int __meminit vmemmap_populated(unsigned long vmemmap_addr, int vmemmap_map_size);
> +bool altmap_cross_boundary(struct vmem_altmap *altmap, unsigned long start,
> +			   unsigned long page_size);
>  #endif /* CONFIG_PPC64 */
>  
>  #endif /* __ASSEMBLY__ */
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index d7e2dd3d4add..ef886fab643d 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -742,8 +742,57 @@ static void free_pud_table(pud_t *pud_start, p4d_t *p4d)
>  	p4d_clear(p4d);
>  }
>  
> +static bool __meminit vmemmap_pmd_is_unused(unsigned long addr, unsigned long end)
> +{
> +	unsigned long start = ALIGN_DOWN(addr, PMD_SIZE);
> +
> +	return !vmemmap_populated(start, PMD_SIZE);
> +}
> +
> +static bool __meminit vmemmap_page_is_unused(unsigned long addr, unsigned long end)
> +{
> +	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
> +
> +	return !vmemmap_populated(start, PAGE_SIZE);
> +
> +}
> +
> +static void __meminit free_vmemmap_pages(struct page *page,
> +					 struct vmem_altmap *altmap,
> +					 int order)
> +{
> +	unsigned int nr_pages = 1 << order;
> +
> +	if (altmap) {
> +		unsigned long alt_start, alt_end;
> +		unsigned long base_pfn = page_to_pfn(page);
> +
> +		/*
> +		 * with 1G vmemmap mmaping we can have things setup
> +		 * such that even though atlmap is specified we never
> +		 * used altmap.
> +		 */
> +		alt_start = altmap->base_pfn;
> +		alt_end = altmap->base_pfn + altmap->reserve +
> +			altmap->free + altmap->alloc + altmap->align;
> +
> +		if (base_pfn >= alt_start && base_pfn < alt_end) {
> +			vmem_altmap_free(altmap, nr_pages);
> +			return;
> +		}
> +	}
> +
> +	if (PageReserved(page)) {
> +		/* allocated from memblock */
> +		while (nr_pages--)
> +			free_reserved_page(page++);
> +	} else
> +		free_pages((unsigned long)page_address(page), order);
> +}
> +
>  static void remove_pte_table(pte_t *pte_start, unsigned long addr,
> -			     unsigned long end, bool direct)
> +			     unsigned long end, bool direct,
> +			     struct vmem_altmap *altmap)
>  {
>  	unsigned long next, pages = 0;
>  	pte_t *pte;
> @@ -757,24 +806,23 @@ static void remove_pte_table(pte_t *pte_start, unsigned long addr,
>  		if (!pte_present(*pte))
>  			continue;
>  
> -		if (!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(next)) {
> -			/*
> -			 * The vmemmap_free() and remove_section_mapping()
> -			 * codepaths call us with aligned addresses.
> -			 */
> -			WARN_ONCE(1, "%s: unaligned range\n", __func__);
> -			continue;
> +		if (PAGE_ALIGNED(addr) && PAGE_ALIGNED(next)) {
> +			if (!direct)
> +				free_vmemmap_pages(pte_page(*pte), altmap, 0);
> +			pte_clear(&init_mm, addr, pte);
> +			pages++;
> +		} else if (!direct && vmemmap_page_is_unused(addr, next)) {
> +			free_vmemmap_pages(pte_page(*pte), altmap, 0);
> +			pte_clear(&init_mm, addr, pte);
>  		}
> -
> -		pte_clear(&init_mm, addr, pte);
> -		pages++;
>  	}
>  	if (direct)
>  		update_page_count(mmu_virtual_psize, -pages);
>  }
>  
>  static void __meminit remove_pmd_table(pmd_t *pmd_start, unsigned long addr,
> -				       unsigned long end, bool direct)
> +				       unsigned long end, bool direct,
> +				       struct vmem_altmap *altmap)
>  {
>  	unsigned long next, pages = 0;
>  	pte_t *pte_base;
> @@ -788,18 +836,21 @@ static void __meminit remove_pmd_table(pmd_t *pmd_start, unsigned long addr,
>  			continue;
>  
>  		if (pmd_is_leaf(*pmd)) {
> -			if (!IS_ALIGNED(addr, PMD_SIZE) ||
> -			    !IS_ALIGNED(next, PMD_SIZE)) {
> -				WARN_ONCE(1, "%s: unaligned range\n", __func__);
> -				continue;
> +			if (IS_ALIGNED(addr, PMD_SIZE) &&
> +			    IS_ALIGNED(next, PMD_SIZE)) {
> +				if (!direct)
> +					free_vmemmap_pages(pmd_page(*pmd), altmap, get_order(PMD_SIZE));
> +				pte_clear(&init_mm, addr, (pte_t *)pmd);
> +				pages++;
> +			} else if (vmemmap_pmd_is_unused(addr, next)) {
> +				free_vmemmap_pages(pmd_page(*pmd), altmap, get_order(PMD_SIZE));
> +				pte_clear(&init_mm, addr, (pte_t *)pmd);
>  			}
> -			pte_clear(&init_mm, addr, (pte_t *)pmd);
> -			pages++;
>  			continue;
>  		}
>  
>  		pte_base = (pte_t *)pmd_page_vaddr(*pmd);
> -		remove_pte_table(pte_base, addr, next, direct);
> +		remove_pte_table(pte_base, addr, next, direct, altmap);
>  		free_pte_table(pte_base, pmd);
>  	}
>  	if (direct)
> @@ -807,7 +858,8 @@ static void __meminit remove_pmd_table(pmd_t *pmd_start, unsigned long addr,
>  }
>  
>  static void __meminit remove_pud_table(pud_t *pud_start, unsigned long addr,
> -				       unsigned long end, bool direct)
> +				       unsigned long end, bool direct,
> +				       struct vmem_altmap *altmap)
>  {
>  	unsigned long next, pages = 0;
>  	pmd_t *pmd_base;
> @@ -832,15 +884,16 @@ static void __meminit remove_pud_table(pud_t *pud_start, unsigned long addr,
>  		}
>  
>  		pmd_base = pud_pgtable(*pud);
> -		remove_pmd_table(pmd_base, addr, next, direct);
> +		remove_pmd_table(pmd_base, addr, next, direct, altmap);
>  		free_pmd_table(pmd_base, pud);
>  	}
>  	if (direct)
>  		update_page_count(MMU_PAGE_1G, -pages);
>  }
>  
> -static void __meminit remove_pagetable(unsigned long start, unsigned long end,
> -				       bool direct)
> +static void __meminit
> +remove_pagetable(unsigned long start, unsigned long end, bool direct,
> +		 struct vmem_altmap *altmap)
>  {
>  	unsigned long addr, next;
>  	pud_t *pud_base;
> @@ -869,7 +922,7 @@ static void __meminit remove_pagetable(unsigned long start, unsigned long end,
>  		}
>  
>  		pud_base = p4d_pgtable(*p4d);
> -		remove_pud_table(pud_base, addr, next, direct);
> +		remove_pud_table(pud_base, addr, next, direct, altmap);
>  		free_pud_table(pud_base, p4d);
>  	}
>  
> @@ -892,7 +945,7 @@ int __meminit radix__create_section_mapping(unsigned long start,
>  
>  int __meminit radix__remove_section_mapping(unsigned long start, unsigned long end)
>  {
> -	remove_pagetable(start, end, true);
> +	remove_pagetable(start, end, true, NULL);
>  	return 0;
>  }
>  #endif /* CONFIG_MEMORY_HOTPLUG */
> @@ -924,10 +977,224 @@ int __meminit radix__vmemmap_create_mapping(unsigned long start,
>  	return 0;
>  }
>  
> +int __meminit vmemmap_check_pmd(pmd_t *pmd, int node,
> +				unsigned long addr, unsigned long next)
> +{
> +	int large = pmd_large(*pmd);
> +
> +	if (pmd_large(*pmd))

we already got the value of pmd_large into "large" variable.
we can use just if (large) right?

> +		vmemmap_verify((pte_t *)pmd, node, addr, next);

maybe we can use pmdp_ptep() function here which we used in the 1st patch?
also shouldn't this be pmdp in the function argument instead of pmd?

> +
> +	return large;
> +}
> +
> +void __meminit vmemmap_set_pmd(pmd_t *pmdp, void *p, int node,
> +			       unsigned long addr, unsigned long next)
> +{
> +	pte_t entry;
> +	pte_t *ptep = pmdp_ptep(pmdp);
> +
> +	VM_BUG_ON(!IS_ALIGNED(addr, PMD_SIZE));
> +	entry = pfn_pte(__pa(p) >> PAGE_SHIFT, PAGE_KERNEL);
> +	set_pte_at(&init_mm, addr, ptep, entry);
> +	asm volatile("ptesync": : :"memory");
> +
> +	vmemmap_verify(ptep, node, addr, next);
> +}
> +
> +static pte_t * __meminit radix__vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
> +						     struct vmem_altmap *altmap,
> +						     struct page *reuse)
> +{
> +	pte_t *pte = pte_offset_kernel(pmd, addr);
> +
> +	if (pte_none(*pte)) {
> +		pte_t entry;
> +		void *p;
> +
> +		if (!reuse) {
> +			/*
> +			 * make sure we don't create altmap mappings
> +			 * covering things outside the device.
> +			 */
> +			if (altmap && altmap_cross_boundary(altmap, addr, PAGE_SIZE))
> +				altmap = NULL;
> +
> +			p = vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
> +			if (!p) {
> +				if (altmap)
> +					p = vmemmap_alloc_block_buf(PAGE_SIZE, node, NULL);
> +				if (!p)
> +					return NULL;
> +			}

Above if conditions are quite confusing when looking for the 1st time?
Can we do this? Did I get it right?

                if (!p && altmap)
                  p = vmemmap_alloc_block_buf(PAGE_SIZE, node, NULL);

                if (!p)
                  return NULL;

-ritesh
