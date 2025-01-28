Return-Path: <linuxppc-dev+bounces-5620-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 631B9A20728
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 10:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj09y5ZBXz2ysv;
	Tue, 28 Jan 2025 20:20:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738056006;
	cv=none; b=SbWNoMQGzHxZAdQm0qzAB6QutQ6w3dJ0UG6Uyhc8lu7oHSrqRj2K09DUJylJhBqNVh68nlmcY0q59TByQJALIG1PETQhfJrHE9N8ojPepmSeElsdmtZTCTJ4CNRKHTWOEzcA85I+c+ytvBqjI5XgZxCE2HUpgonkOXA8nMx0J7lUNRgN6z2SZzLinmdVZRFFeB9BzeLQq2UlomqR+u/pnI+Bj02kSoTyxybiBfRTECs0LE/qSt/FRd9aamUVjjGBqAhp68y3ftVGrLqlrw5qHUwdKeMd+J7lFjTDYUwwGHO+LVBv66N5UrTojrMBzFmvkO1xHos4+lyEswBZ4WfYRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738056006; c=relaxed/relaxed;
	bh=BVyhC7QSA0G8BV/1ANXQcYrxJUmRXT/TD12BTyXAE2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X/AQzBTCR/FNPFKFe0/bTFLu5CqBvTeo75v828RPDT6bWQR6K8bvSBN28bF9F7MA37tJN+j5ZJd7qB9tu10o/ebT4BUMOCkpj2i6Bggs9ZdJU62x1ymYiY2/smWxc9mrw4AkvNEchXyFvhOGntXa93Wyc+0n4kRWI0LXlJjf+0OKzAGck3WFp1BuH6rCQOkAOcvxZHkdr+opGVGrvAvGNDY1uMvXmp8m6R8XmC59y3QoQSDGy+9lsXSjNqVZ+/7/JMrxvVVxF1LlR2KieXmyTLaZDBWIDrn9VwtRd2kWd6d7hk4grxF7oc51KPa+VccIP8B+ILVDXIBWU9E/YQY0aQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj09x5NtMz2yZN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 20:20:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Yhzdk4zHCz9sSZ;
	Tue, 28 Jan 2025 09:55:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bUOlSg6jBUTm; Tue, 28 Jan 2025 09:55:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Yhzdk3m2lz9sSX;
	Tue, 28 Jan 2025 09:55:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7126F8B76C;
	Tue, 28 Jan 2025 09:55:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 7ESIVIMdKw33; Tue, 28 Jan 2025 09:55:38 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BA8DE8B763;
	Tue, 28 Jan 2025 09:55:37 +0100 (CET)
Message-ID: <c961cc1e-897d-4b86-b123-b12a0c27f91a@csgroup.eu>
Date: Tue, 28 Jan 2025 09:55:37 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 27/27] mm/hugetlb: enable bootmem allocation from CMA
 areas
To: Frank van der Linden <fvdl@google.com>, akpm@linux-foundation.org,
 muchun.song@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usama.arif@bytedance.com, joao.m.martins@oracle.com,
 roman.gushchin@linux.dev, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20250127232207.3888640-1-fvdl@google.com>
 <20250127232207.3888640-28-fvdl@google.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250127232207.3888640-28-fvdl@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 28/01/2025 à 00:22, Frank van der Linden a écrit :
> If hugetlb_cma_only is enabled, we know that hugetlb pages
> can only be allocated from CMA. Now that there is an interface
> to do early reservations from a CMA area (returning memblock
> memory), it can be used to allocate hugetlb pages from CMA.
> 
> This also allows for doing pre-HVO on these pages (if enabled).
> 
> Make sure to initialize the page structures and associated data
> correctly. Create a flag to signal that a hugetlb page has been
> allocated from CMA to make things a little easier.
> 
> Some configurations of powerpc have a special hugetlb bootmem
> allocator, so introduce a boolean arch_specific_huge_bootmem_alloc
> that returns true if such an allocator is present. In that case,
> CMA bootmem allocations can't be used, so check that function
> before trying.
> 
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Frank van der Linden <fvdl@google.com>
> ---
>   arch/powerpc/mm/hugetlbpage.c |   5 ++
>   include/linux/hugetlb.h       |   7 ++
>   mm/hugetlb.c                  | 135 +++++++++++++++++++++++++---------
>   3 files changed, 114 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
> index d3c1b749dcfc..e53e4b4c8ef6 100644
> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -121,6 +121,11 @@ bool __init hugetlb_node_alloc_supported(void)
>   {
>   	return false;
>   }
> +
> +bool __init arch_specific_huge_bootmem_alloc(struct hstate *h)
> +{
> +	return (firmware_has_feature(FW_FEATURE_LPAR) && !radix_enabled());
> +}
>   #endif
>   
>   
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 2512463bca49..bca3052fb175 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -591,6 +591,7 @@ enum hugetlb_page_flags {
>   	HPG_freed,
>   	HPG_vmemmap_optimized,
>   	HPG_raw_hwp_unreliable,
> +	HPG_cma,
>   	__NR_HPAGEFLAGS,
>   };
>   
> @@ -650,6 +651,7 @@ HPAGEFLAG(Temporary, temporary)
>   HPAGEFLAG(Freed, freed)
>   HPAGEFLAG(VmemmapOptimized, vmemmap_optimized)
>   HPAGEFLAG(RawHwpUnreliable, raw_hwp_unreliable)
> +HPAGEFLAG(Cma, cma)
>   
>   #ifdef CONFIG_HUGETLB_PAGE
>   
> @@ -678,14 +680,18 @@ struct hstate {
>   	char name[HSTATE_NAME_LEN];
>   };
>   
> +struct cma;
> +
>   struct huge_bootmem_page {
>   	struct list_head list;
>   	struct hstate *hstate;
>   	unsigned long flags;
> +	struct cma *cma;
>   };
>   
>   #define HUGE_BOOTMEM_HVO		0x0001
>   #define HUGE_BOOTMEM_ZONES_VALID	0x0002
> +#define HUGE_BOOTMEM_CMA		0x0004
>   
>   bool hugetlb_bootmem_page_zones_valid(int nid, struct huge_bootmem_page *m);
>   
> @@ -711,6 +717,7 @@ bool __init hugetlb_node_alloc_supported(void);
>   
>   void __init hugetlb_add_hstate(unsigned order);
>   bool __init arch_hugetlb_valid_size(unsigned long size);
> +bool __init arch_specific_huge_bootmem_alloc(struct hstate *h);

Why adding 'specific' in the name ? Prefixing a function name with arch_ 
is usually enough to denote an architecture specific function.

>   struct hstate *size_to_hstate(unsigned long size);
>   
>   #ifndef HUGE_MAX_HSTATE
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 32ebde9039e2..183e8d0c2fb4 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -61,7 +61,7 @@ static struct cma *hugetlb_cma[MAX_NUMNODES];
>   static unsigned long hugetlb_cma_size_in_node[MAX_NUMNODES] __initdata;
>   #endif
>   static bool hugetlb_cma_only;
> -static unsigned long hugetlb_cma_size __initdata;
> +static unsigned long hugetlb_cma_size;

Why remove __initdata ? As far as I can see it is used only in 
hugetlb_early_cma() and hugetlb_hstate_alloc_pages() which are __init 
functions.

>   
>   __initdata struct list_head huge_boot_pages[MAX_NUMNODES];
>   __initdata unsigned long hstate_boot_nrinvalid[HUGE_MAX_HSTATE];
> @@ -132,8 +132,10 @@ static void hugetlb_free_folio(struct folio *folio)
>   #ifdef CONFIG_CMA
>   	int nid = folio_nid(folio);
>   
> -	if (cma_free_folio(hugetlb_cma[nid], folio))
> +	if (folio_test_hugetlb_cma(folio)) {
> +		WARN_ON(!cma_free_folio(hugetlb_cma[nid], folio));

Is that WARN_ON() needed ? See 
https://docs.kernel.org/process/coding-style.html#do-not-crash-the-kernel


>   		return;
> +	}
>   #endif
>   	folio_put(folio);
>   }
> @@ -1509,6 +1511,9 @@ static struct folio *alloc_gigantic_folio(struct hstate *h, gfp_t gfp_mask,
>   					break;
>   			}
>   		}
> +
> +		if (folio)
> +			folio_set_hugetlb_cma(folio);
>   	}
>   #endif
>   	if (!folio) {
> @@ -3175,6 +3180,63 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
>   	return ERR_PTR(-ENOSPC);
>   }
>   
> +/*
> + * Some architectures do their own bootmem allocation, so they can't use
> + * early CMA allocation. So, allow for this function to be redefined.
> + */
> +bool __init __attribute((weak))

Can't you use __weak ?

By the way, do we really need a weak function here ? Can't it be a 
static inline helper that gets waived by a macro defined by the arch, 
something like:

#ifndef arch_huge_bootmem_alloc
static inline arch_huge_bootmem_alloc(struct hstate *h)
{
	return false;
}
#endif

Then powerpc does:

#define arch_huge_bootmem_alloc arch_huge_bootmem_alloc
static inline arch_huge_bootmem_alloc(struct hstate *h)
{
	return (firmware_has_feature(FW_FEATURE_LPAR) && !radix_enabled());
}


But why is struct hstate *h parameter needed ? Seems like noone uses it.

> +arch_specific_huge_bootmem_alloc(struct hstate *h)
> +{
> +	return false;
> +}
> +
> +static bool __init hugetlb_early_cma(struct hstate *h)
> +{
> +	if (arch_specific_huge_bootmem_alloc(h))
> +		return false;
> +
> +	return (hstate_is_gigantic(h) && hugetlb_cma_size && hugetlb_cma_only);
> +}
> +
> +static __init void *alloc_bootmem(struct hstate *h, int nid)
> +{
> +	struct huge_bootmem_page *m;
> +	unsigned long flags;
> +	struct cma *cma;
> +
> +#ifdef CONFIG_CMA

  #ifdefs in C files should be avoided, see 
https://docs.kernel.org/process/coding-style.html#conditional-compilation

> +	if (hugetlb_early_cma(h)) {
> +		flags = HUGE_BOOTMEM_CMA;
> +		cma = hugetlb_cma[nid];
> +		m = cma_reserve_early(cma, huge_page_size(h));
> +	} else
> +#endif

This kind of if/else construct in uggly, should be avoided.

> +	{
> +		flags = 0;
> +		cma = NULL;
> +		m = memblock_alloc_try_nid_raw(huge_page_size(h),
> +			huge_page_size(h), 0, MEMBLOCK_ALLOC_ACCESSIBLE, nid);
> +	}
> +
> +	if (m) {
> +		/*
> +		 * Use the beginning of the huge page to store the
> +		 * huge_bootmem_page struct (until gather_bootmem
> +		 * puts them into the mem_map).
> +		 *
> +		 * Put them into a private list first because mem_map
> +		 * is not up yet.
> +		 */
> +		INIT_LIST_HEAD(&m->list);
> +		list_add(&m->list, &huge_boot_pages[nid]);
> +		m->hstate = h;
> +		m->flags = flags;
> +		m->cma = cma;
> +	}
> +
> +	return m;
> +}
> +
>   int alloc_bootmem_huge_page(struct hstate *h, int nid)
>   	__attribute__ ((weak, alias("__alloc_bootmem_huge_page")));
>   int __alloc_bootmem_huge_page(struct hstate *h, int nid)
> @@ -3184,17 +3246,14 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
>   
>   	/* do node specific alloc */
>   	if (nid != NUMA_NO_NODE) {
> -		m = memblock_alloc_try_nid_raw(huge_page_size(h), huge_page_size(h),
> -				0, MEMBLOCK_ALLOC_ACCESSIBLE, nid);
> +		m = alloc_bootmem(h, node);
>   		if (!m)
>   			return 0;
>   		goto found;
>   	}
>   	/* allocate from next node when distributing huge pages */
>   	for_each_node_mask_to_alloc(&h->next_nid_to_alloc, nr_nodes, node, &node_states[N_ONLINE]) {
> -		m = memblock_alloc_try_nid_raw(
> -				huge_page_size(h), huge_page_size(h),
> -				0, MEMBLOCK_ALLOC_ACCESSIBLE, node);
> +		m = alloc_bootmem(h, node);
>   		if (m)
>   			break;
>   	}
> @@ -3203,7 +3262,6 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
>   		return 0;
>   
>   found:
> -
>   	/*
>   	 * Only initialize the head struct page in memmap_init_reserved_pages,
>   	 * rest of the struct pages will be initialized by the HugeTLB
> @@ -3213,18 +3271,6 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
>   	 */
>   	memblock_reserved_mark_noinit(virt_to_phys((void *)m + PAGE_SIZE),
>   		huge_page_size(h) - PAGE_SIZE);
> -	/*
> -	 * Use the beginning of the huge page to store the
> -	 * huge_bootmem_page struct (until gather_bootmem
> -	 * puts them into the mem_map).
> -	 *
> -	 * Put them into a private list first because mem_map
> -	 * is not up yet.
> -	 */
> -	INIT_LIST_HEAD(&m->list);
> -	list_add(&m->list, &huge_boot_pages[node]);
> -	m->hstate = h;
> -	m->flags = 0;
>   	return 1;
>   }
>   
> @@ -3265,13 +3311,25 @@ static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
>   	prep_compound_head((struct page *)folio, huge_page_order(h));
>   }
>   
> +static bool __init hugetlb_bootmem_page_prehvo(struct huge_bootmem_page *m)
> +{
> +	return (m->flags & HUGE_BOOTMEM_HVO);

Parenthesis are superflous

> +}
> +
> +static bool __init hugetlb_bootmem_page_earlycma(struct huge_bootmem_page *m)
> +{
> +	return (m->flags & HUGE_BOOTMEM_CMA);

Parenthesis are superflous

> +}
> +
>   /*
>    * memblock-allocated pageblocks might not have the migrate type set
>    * if marked with the 'noinit' flag. Set it to the default (MIGRATE_MOVABLE)
> - * here.
> + * here, or MIGRATE_CMA if this was a page allocated through an early CMA
> + * reservation.
>    *
> - * Note that this will not write the page struct, it is ok (and necessary)
> - * to do this on vmemmap optimized folios.
> + * In case of vmemmap optimized folios, the tail vmemmap pages are mapped
> + * read-only, but that's ok - for sparse vmemmap this does not write to
> + * the page structure.
>    */
>   static void __init hugetlb_bootmem_init_migratetype(struct folio *folio,
>   							  struct hstate *h)
> @@ -3280,9 +3338,13 @@ static void __init hugetlb_bootmem_init_migratetype(struct folio *folio,
>   
>   	WARN_ON_ONCE(!pageblock_aligned(folio_pfn(folio)));
>   
> -	for (i = 0; i < nr_pages; i += pageblock_nr_pages)
> -		set_pageblock_migratetype(folio_page(folio, i),
> +	for (i = 0; i < nr_pages; i += pageblock_nr_pages) {
> +		if (folio_test_hugetlb_cma(folio))
> +			init_cma_pageblock(folio_page(folio, i));
> +		else
> +			set_pageblock_migratetype(folio_page(folio, i),
>   					  MIGRATE_MOVABLE);
> +	}
>   }
>   
>   static void __init prep_and_add_bootmem_folios(struct hstate *h,
> @@ -3319,7 +3381,7 @@ bool __init hugetlb_bootmem_page_zones_valid(int nid,
>   					     struct huge_bootmem_page *m)
>   {
>   	unsigned long start_pfn;
> -	bool valid;
> +	bool valid = false;

Why do you need that, I can't see any path to reach out: without setting 
'valid'.

>   
>   	if (m->flags & HUGE_BOOTMEM_ZONES_VALID) {
>   		/*
> @@ -3328,10 +3390,16 @@ bool __init hugetlb_bootmem_page_zones_valid(int nid,
>   		return true;
>   	}
>   
> +	if (hugetlb_bootmem_page_earlycma(m)) {
> +		valid = cma_validate_zones(m->cma);
> +		goto out;
> +	}
> +
>   	start_pfn = virt_to_phys(m) >> PAGE_SHIFT;
>   
>   	valid = !pfn_range_intersects_zones(nid, start_pfn,
>   			pages_per_huge_page(m->hstate));
> +out:
>   	if (!valid)
>   		hstate_boot_nrinvalid[hstate_index(m->hstate)]++;
>   
> @@ -3360,11 +3428,6 @@ static void __init hugetlb_bootmem_free_invalid_page(int nid, struct page *page,
>   	}
>   }
>   
> -static bool __init hugetlb_bootmem_page_prehvo(struct huge_bootmem_page *m)
> -{
> -	return (m->flags & HUGE_BOOTMEM_HVO);
> -}
> -
>   /*
>    * Put bootmem huge pages into the standard lists after mem_map is up.
>    * Note: This only applies to gigantic (order > MAX_PAGE_ORDER) pages.
> @@ -3414,6 +3477,9 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
>   			 */
>   			folio_set_hugetlb_vmemmap_optimized(folio);
>   
> +		if (hugetlb_bootmem_page_earlycma(m))
> +			folio_set_hugetlb_cma(folio);
> +
>   		list_add(&folio->lru, &folio_list);
>   
>   		/*
> @@ -3606,8 +3672,11 @@ static void __init hugetlb_hstate_alloc_pages(struct hstate *h)
>   {
>   	unsigned long allocated;
>   
> -	/* skip gigantic hugepages allocation if hugetlb_cma enabled */
> -	if (hstate_is_gigantic(h) && hugetlb_cma_size) {
> +	/*
> +	 * Skip gigantic hugepages allocation if early CMA
> +	 * reservations are not available.
> +	 */
> +	if (hstate_is_gigantic(h) && hugetlb_cma_size && !hugetlb_early_cma(h)) {
>   		pr_warn_once("HugeTLB: hugetlb_cma is enabled, skip boot time allocation\n");
>   		return;
>   	}


