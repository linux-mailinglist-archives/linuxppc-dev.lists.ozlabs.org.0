Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 421B7203756
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 14:56:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49r8Y157jWzDqXX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 22:56:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49r8VN4NQ1zDqTq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 22:53:48 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05MCWBig124866
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 08:53:45 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31sj0btwdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 08:53:45 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05MCWln0127882
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 08:53:45 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31sj0btwdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 08:53:45 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05MCpDl4015863;
 Mon, 22 Jun 2020 12:53:44 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 31sa38kgsj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 12:53:44 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05MCrhBv50790742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Jun 2020 12:53:43 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A145D124053;
 Mon, 22 Jun 2020 12:53:43 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B060B124052;
 Mon, 22 Jun 2020 12:53:41 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.79.210.147])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 22 Jun 2020 12:53:41 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH v0 3/5] powerpc/mm/radix: Fix PTE/PMD fragment count
 for early page table mappings
In-Reply-To: <20200406034925.22586-4-bharata@linux.ibm.com>
References: <20200406034925.22586-1-bharata@linux.ibm.com>
 <20200406034925.22586-4-bharata@linux.ibm.com>
Date: Mon, 22 Jun 2020 18:23:39 +0530
Message-ID: <87ftan45yk.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-22_04:2020-06-22,
 2020-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=2 mlxscore=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 cotscore=-2147483648
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006220091
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
Cc: leonardo@linux.ibm.com, aneesh.kumar@linux.vnet.ibm.com, npiggin@gmail.com,
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bharata B Rao <bharata@linux.ibm.com> writes:

> We can hit the following BUG_ON during memory unplug
>
> kernel BUG at arch/powerpc/mm/book3s64/pgtable.c:344!
> Oops: Exception in kernel mode, sig: 5 [#1]
> LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> NIP [c000000000097d48] pmd_fragment_free+0x48/0xd0
> LR [c0000000016aaefc] remove_pagetable+0x494/0x530
> Call Trace:
> _raw_spin_lock+0x54/0x80 (unreliable)
> remove_pagetable+0x2b0/0x530
> radix__remove_section_mapping+0x18/0x2c
> remove_section_mapping+0x38/0x5c
> arch_remove_memory+0x124/0x190
> try_remove_memory+0xd0/0x1c0
> __remove_memory+0x20/0x40
> dlpar_remove_lmb+0xbc/0x110
> dlpar_memory+0xa90/0xd40
> handle_dlpar_errorlog+0xa8/0x160
> pseries_hp_work_fn+0x2c/0x60
> process_one_work+0x47c/0x870
> worker_thread+0x364/0x5e0
> kthread+0x1b4/0x1c0
> ret_from_kernel_thread+0x5c/0x74
>
> This occurs when unplug is attempted for such memory which has
> been mapped using memblock pages as part of early kernel page
> table setup. We wouldn't have initialized the PMD or PTE fragment
> count for those PMD or PTE pages.
>
> Fixing this includes 3 parts:
>
> - Re-walk the init_mm page tables from mem_init() and initialize
>   the PMD and PTE fragment count to 1.
> - When freeing PUD, PMD and PTE page table pages, check explicitly
>   if they come from memblock and if so free then appropriately.
> - When we do early memblock based allocation of PMD and PUD pages,
>   allocate in PAGE_SIZE granularity so that we are sure the
>   complete page is used as pagetable page.
>
> Since we now do PAGE_SIZE allocations for both PUD table and
> PMD table (Note that PTE table allocation is already of PAGE_SIZE),
> we end up allocating more memory for the same amount of system RAM.
> Here is a comparision of how much more we need for a 64T and 2G
> system after this patch:
>
> 1. 64T system
> -------------
> 64T RAM would need 64G for vmemmap with struct page size being 64B.
>
> 128 PUD tables for 64T memory (1G mappings)
> 1 PUD table and 64 PMD tables for 64G vmemmap (2M mappings)
>
> With default PUD[PMD]_TABLE_SIZE(4K), (128+1+64)*4K=772K
> With PAGE_SIZE(64K) table allocations, (128+1+64)*64K=12352K
>
> 2. 2G system
> ------------
> 2G RAM would need 2M for vmemmap with struct page size being 64B.
>
> 1 PUD table for 2G memory (1G mapping)
> 1 PUD table and 1 PMD table for 2M vmemmap (2M mappings)
>
> With default PUD[PMD]_TABLE_SIZE(4K), (1+1+1)*4K=12K
> With new PAGE_SIZE(64K) table allocations, (1+1+1)*64K=192K
>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/pgalloc.h | 11 ++-
>  arch/powerpc/include/asm/book3s/64/radix.h   |  1 +
>  arch/powerpc/include/asm/sparsemem.h         |  1 +
>  arch/powerpc/mm/book3s64/pgtable.c           | 31 ++++++++-
>  arch/powerpc/mm/book3s64/radix_pgtable.c     | 72 ++++++++++++++++++--
>  arch/powerpc/mm/mem.c                        |  5 ++
>  arch/powerpc/mm/pgtable-frag.c               |  9 ++-
>  7 files changed, 121 insertions(+), 9 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/pgalloc.h b/arch/powerpc/include/asm/book3s/64/pgalloc.h
> index a41e91bd0580..e96572fb2871 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgalloc.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgalloc.h
> @@ -109,7 +109,16 @@ static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
>  
>  static inline void pud_free(struct mm_struct *mm, pud_t *pud)
>  {
> -	kmem_cache_free(PGT_CACHE(PUD_CACHE_INDEX), pud);
> +	struct page *page = virt_to_page(pud);
> +
> +	/*
> +	 * Early pud pages allocated via memblock allocator
> +	 * can't be directly freed to slab
> +	 */
> +	if (PageReserved(page))
> +		free_reserved_page(page);
> +	else
> +		kmem_cache_free(PGT_CACHE(PUD_CACHE_INDEX), pud);
>  }
>  
>  static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
> diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
> index d97db3ad9aae..0aff8750181a 100644
> --- a/arch/powerpc/include/asm/book3s/64/radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/radix.h
> @@ -291,6 +291,7 @@ static inline unsigned long radix__get_tree_size(void)
>  #ifdef CONFIG_MEMORY_HOTPLUG
>  int radix__create_section_mapping(unsigned long start, unsigned long end, int nid);
>  int radix__remove_section_mapping(unsigned long start, unsigned long end);
> +void radix__fixup_pgtable_fragments(void);
>  #endif /* CONFIG_MEMORY_HOTPLUG */
>  #endif /* __ASSEMBLY__ */
>  #endif
> diff --git a/arch/powerpc/include/asm/sparsemem.h b/arch/powerpc/include/asm/sparsemem.h
> index 3192d454a733..e662f9232d35 100644
> --- a/arch/powerpc/include/asm/sparsemem.h
> +++ b/arch/powerpc/include/asm/sparsemem.h
> @@ -15,6 +15,7 @@
>  #ifdef CONFIG_MEMORY_HOTPLUG
>  extern int create_section_mapping(unsigned long start, unsigned long end, int nid);
>  extern int remove_section_mapping(unsigned long start, unsigned long end);
> +void fixup_pgtable_fragments(void);
>  
>  #ifdef CONFIG_PPC_BOOK3S_64
>  extern int resize_hpt_for_hotplug(unsigned long new_mem_size);
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index 2bf7e1b4fd82..be7aa8786747 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -186,6 +186,13 @@ int __meminit remove_section_mapping(unsigned long start, unsigned long end)
>  
>  	return hash__remove_section_mapping(start, end);
>  }
> +
> +void fixup_pgtable_fragments(void)
> +{
> +	if (radix_enabled())
> +		radix__fixup_pgtable_fragments();
> +}
> +
>  #endif /* CONFIG_MEMORY_HOTPLUG */
>  
>  void __init mmu_partition_table_init(void)
> @@ -343,13 +350,23 @@ void pmd_fragment_free(unsigned long *pmd)
>  
>  	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
>  	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
> -		pgtable_pmd_page_dtor(page);
> -		__free_page(page);
> +		/*
> +		 * Early pmd pages allocated via memblock
> +		 * allocator wouldn't have called _ctor
> +		 */
> +		if (PageReserved(page))
> +			free_reserved_page(page);
> +		else {
> +			pgtable_pmd_page_dtor(page);
> +			__free_page(page);
> +		}
>  	}
>  }
>  
>  static inline void pgtable_free(void *table, int index)
>  {
> +	struct page *page;
> +
>  	switch (index) {
>  	case PTE_INDEX:
>  		pte_fragment_free(table, 0);
> @@ -358,7 +375,15 @@ static inline void pgtable_free(void *table, int index)
>  		pmd_fragment_free(table);
>  		break;
>  	case PUD_INDEX:
> -		kmem_cache_free(PGT_CACHE(PUD_CACHE_INDEX), table);
> +		page = virt_to_page(table);
> +		/*
> +		 * Early pud pages allocated via memblock
> +		 * allocator need to be freed differently
> +		 */
> +		if (PageReserved(page))
> +			free_reserved_page(page);
> +		else
> +			kmem_cache_free(PGT_CACHE(PUD_CACHE_INDEX), table);
>  		break;
>  #if defined(CONFIG_PPC_4K_PAGES) && defined(CONFIG_HUGETLB_PAGE)
>  		/* 16M hugepd directory at pud level */
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 4a4fb30f6c3d..e675c0bbf9a4 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -36,6 +36,70 @@
>  unsigned int mmu_pid_bits;
>  unsigned int mmu_base_pid;
>  
> +static void fixup_pte_fragments(pmd_t *pmd)
> +{
> +	int i;
> +
> +	for (i = 0; i < PTRS_PER_PMD; i++, pmd++) {
> +		pte_t *pte;
> +		struct page *page;
> +
> +		if (pmd_none(*pmd))
> +			continue;
> +		if (pmd_is_leaf(*pmd))
> +			continue;
> +
> +		pte = pte_offset_kernel(pmd, 0);
> +		page = virt_to_page(pte);
> +		atomic_inc(&page->pt_frag_refcount);
> +	}
> +}
> +
> +static void fixup_pmd_fragments(pud_t *pud)
> +{
> +	int i;
> +
> +	for (i = 0; i < PTRS_PER_PUD; i++, pud++) {
> +		pmd_t *pmd;
> +		struct page *page;
> +
> +		if (pud_none(*pud))
> +			continue;
> +		if (pud_is_leaf(*pud))
> +			continue;
> +
> +		pmd = pmd_offset(pud, 0);
> +		page = virt_to_page(pmd);
> +		atomic_inc(&page->pt_frag_refcount);
> +		fixup_pte_fragments(pmd);
> +	}
> +}
> +
> +/*
> + * Walk the init_mm page tables and fixup the PMD and PTE fragment
> + * counts. This allows the PUD, PMD and PTE pages to be freed
> + * back to buddy allocator properly during memory unplug.
> + */
> +void radix__fixup_pgtable_fragments(void)
> +{
> +	int i;
> +	pgd_t *pgd = pgd_offset_k(0UL);
> +
> +	spin_lock(&init_mm.page_table_lock);
> +	for (i = 0; i < PTRS_PER_PGD; i++, pgd++) {
> +		pud_t *pud;
> +
> +		if (pgd_none(*pgd))
> +			continue;
> +		if (pgd_is_leaf(*pgd))
> +			continue;
> +
> +		pud = pud_offset(pgd, 0);
> +		fixup_pmd_fragments(pud);
> +	}
> +	spin_unlock(&init_mm.page_table_lock);
> +}
> +
>  static __ref void *early_alloc_pgtable(unsigned long size, int nid,
>  			unsigned long region_start, unsigned long region_end)
>  {
> @@ -71,8 +135,8 @@ static int early_map_kernel_page(unsigned long ea, unsigned long pa,
>  
>  	pgdp = pgd_offset_k(ea);
>  	if (pgd_none(*pgdp)) {
> -		pudp = early_alloc_pgtable(PUD_TABLE_SIZE, nid,
> -						region_start, region_end);
> +		pudp = early_alloc_pgtable(PAGE_SIZE, nid, region_start,
> +					   region_end);
>  		pgd_populate(&init_mm, pgdp, pudp);
>  	}
>  	pudp = pud_offset(pgdp, ea);
> @@ -81,8 +145,8 @@ static int early_map_kernel_page(unsigned long ea, unsigned long pa,
>  		goto set_the_pte;
>  	}
>  	if (pud_none(*pudp)) {
> -		pmdp = early_alloc_pgtable(PMD_TABLE_SIZE, nid,
> -						region_start, region_end);
> +		pmdp = early_alloc_pgtable(PAGE_SIZE, nid, region_start,
> +					   region_end);
>  		pud_populate(&init_mm, pudp, pmdp);
>  	}
>  	pmdp = pmd_offset(pudp, ea);
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index 1c07d5a3f543..d43ad701f693 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -53,6 +53,10 @@
>  
>  #include <mm/mmu_decl.h>
>  
> +void __weak fixup_pgtable_fragments(void)
> +{
> +}
> +
>  #ifndef CPU_FTR_COHERENT_ICACHE
>  #define CPU_FTR_COHERENT_ICACHE	0	/* XXX for now */
>  #define CPU_FTR_NOEXECUTE	0
> @@ -307,6 +311,7 @@ void __init mem_init(void)
>  
>  	memblock_free_all();
>  
> +	fixup_pgtable_fragments();
>  #ifdef CONFIG_HIGHMEM
>  	{
>  		unsigned long pfn, highmem_mapnr;
> diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
> index ee4bd6d38602..16213c09896a 100644
> --- a/arch/powerpc/mm/pgtable-frag.c
> +++ b/arch/powerpc/mm/pgtable-frag.c
> @@ -114,6 +114,13 @@ void pte_fragment_free(unsigned long *table, int kernel)
>  	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
>  		if (!kernel)
>  			pgtable_pte_page_dtor(page);
> -		__free_page(page);
> +		/*
> +		 * Early pte pages allocated via memblock
> +		 * allocator need to be freed differently
> +		 */
> +		if (PageReserved(page))
> +			free_reserved_page(page);
> +		else
> +			__free_page(page);
>  	}
>  }
> -- 
> 2.21.0
