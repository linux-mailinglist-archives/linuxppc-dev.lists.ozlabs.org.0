Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACE44B4AC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 11:08:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TJyw5WZszDqnM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 19:08:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TJx74914zDqKq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 19:07:06 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5J8wrOm131515
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 05:07:02 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t7hkh9svy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 05:07:02 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Wed, 19 Jun 2019 10:07:00 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 19 Jun 2019 10:06:58 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5J96v0t29819238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 09:06:57 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32ACEA4051;
 Wed, 19 Jun 2019 09:06:57 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E676A4059;
 Wed, 19 Jun 2019 09:06:56 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.124.35.222])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 Jun 2019 09:06:56 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH v0] powerpc: Fix BUG_ON during memory unplug on radix
In-Reply-To: <20190619074545.11761-1-bharata@linux.ibm.com>
References: <20190619074545.11761-1-bharata@linux.ibm.com>
Date: Wed, 19 Jun 2019 14:36:54 +0530
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19061909-0008-0000-0000-000002F5114A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061909-0009-0000-0000-000022622BFE
Message-Id: <87tvcm0wr5.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906190074
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
Cc: aneesh.kumar@linux.vnet.ibm.com, npiggin@gmail.com,
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bharata B Rao <bharata@linux.ibm.com> writes:

> We hit the following BUG_ON when memory hotplugged before reboot
> is unplugged after reboot:
>
> kernel BUG at arch/powerpc/mm/pgtable-frag.c:113!
>
>  remove_pagetable+0x594/0x6a0
>  (unreliable)
>  remove_pagetable+0x94/0x6a0
>  vmemmap_free+0x394/0x410
>  sparse_remove_one_section+0x26c/0x2e8
>  __remove_pages+0x428/0x540
>  arch_remove_memory+0xd0/0x170
>  __remove_memory+0xd4/0x1a0
>  dlpar_remove_lmb+0xbc/0x110
>  dlpar_memory+0xa80/0xd20
>  handle_dlpar_errorlog+0xa8/0x160
>  pseries_hp_work_fn+0x2c/0x60
>  process_one_work+0x46c/0x860
>  worker_thread+0x364/0x5e0
>  kthread+0x1b0/0x1c0
>  ret_from_kernel_thread+0x5c/0x68
>
> This occurs because, during reboot-after-hotplug, the hotplugged
> memory range gets initialized as regular memory and page
> tables are setup using memblock allocator. This means that we
> wouldn't have initialized the PMD or PTE fragment count for
> those PMD or PTE pages.
>
> Fixing this includes 3 aspects:
>
> - Walk the init_mm page tables from mem_init() and initialize
>   the PMD and PTE fragment counts appropriately.
> - When we do early allocation of PMD (and PGD as well) pages,
>   allocate in page size PAGE_SIZE granularity so that we are
>   sure that the complete page is available for us to set the
>   fragment count which is part of struct page.


That is an important change now. For early page table we now allocate
PAGE_SIZE tables and hencec we consider then as pages with fragment
count 1. You also may want to explain here why. I guess the challenge is
due to the fact that we can't clearly control how the rest of the page
will get used and we are not sure they all will be allocated for backing
page table pages.

> - When PMD or PTE page is freed, check if it comes from memblock
>   allocator and free it appropriately.
>
> Reported-by: Srikanth Aithal <sraithal@linux.vnet.ibm.com>
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/radix.h |  1 +
>  arch/powerpc/include/asm/sparsemem.h       |  1 +
>  arch/powerpc/mm/book3s64/pgtable.c         | 12 +++-
>  arch/powerpc/mm/book3s64/radix_pgtable.c   | 67 +++++++++++++++++++++-
>  arch/powerpc/mm/mem.c                      |  5 ++
>  arch/powerpc/mm/pgtable-frag.c             |  5 +-
>  6 files changed, 87 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
> index 574eca33f893..4320f2790e8d 100644
> --- a/arch/powerpc/include/asm/book3s/64/radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/radix.h
> @@ -285,6 +285,7 @@ static inline unsigned long radix__get_tree_size(void)
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
> index 01bc9663360d..7efe9cc16b39 100644
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
> @@ -320,7 +327,10 @@ void pmd_fragment_free(unsigned long *pmd)
>  	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
>  	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
>  		pgtable_pmd_page_dtor(page);
> -		__free_page(page);
> +		if (PageReserved(page))
> +			free_reserved_page(page);
> +		else
> +			__free_page(page);
>  	}
>  }
>
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 273ae66a9a45..402e8da28cab 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -32,6 +32,69 @@
>  unsigned int mmu_pid_bits;
>  unsigned int mmu_base_pid;
>
> +static void fixup_pmd_fragments(pmd_t *pmd)
> +{
> +	int i;
> +
> +	for (i = 0; i < PTRS_PER_PMD; i++, pmd++) {
> +		pte_t *pte;
> +		struct page *page;
> +
> +		if (pmd_none(*pmd))
> +			continue;
> +		if (pmd_huge(*pmd))
> +			continue;
> +
> +		pte = pte_offset_kernel(pmd, 0);
> +		if (!pte_none(*pte)) {
> +			page = virt_to_page(pte);
> +			atomic_inc(&page->pt_frag_refcount);
> +		}
> +	}
> +}


That naming is confusing. You are fixing up fragemts used for level 4
table here. I would call them pte fragments? 


> +
> +static void fixup_pud_fragments(pud_t *pud)
> +{
> +	int i;
> +
> +	for (i = 0; i < PTRS_PER_PUD; i++, pud++) {
> +		pmd_t *pmd;
> +		struct page *page;
> +
> +		if (pud_none(*pud))
> +			continue;
> +		if (pud_huge(*pud))
> +			continue;
> +
> +		pmd = pmd_offset(pud, 0);
> +		if (!pmd_none(*pmd)) {
> +			page = virt_to_page(pmd);
> +			atomic_inc(&page->pt_frag_refcount);
> +		}
> +		fixup_pmd_fragments(pmd);
> +	}
> +}
> +


How do we handle pud table free. That is going to be tricky for general
allocation they are allocated out of slab and we free them back to slab.
With pages allocated out of memblock, we need to special case them? 


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
> +		if (pgd_huge(*pgd))
> +			continue;
> +
> +		pud = pud_offset(pgd, 0);
> +		fixup_pud_fragments(pud);
> +	}
> +	spin_unlock(&init_mm.page_table_lock);
> +}
> +
>  static int native_register_process_table(unsigned long base, unsigned long pg_sz,
>  					 unsigned long table_size)
>  {
> @@ -80,7 +143,7 @@ static int early_map_kernel_page(unsigned long ea, unsigned long pa,
>
>  	pgdp = pgd_offset_k(ea);
>  	if (pgd_none(*pgdp)) {
> -		pudp = early_alloc_pgtable(PUD_TABLE_SIZE, nid,
> +		pudp = early_alloc_pgtable(PAGE_SIZE, nid,
>  						region_start, region_end);
>  		pgd_populate(&init_mm, pgdp, pudp);
>  	}
> @@ -90,7 +153,7 @@ static int early_map_kernel_page(unsigned long ea, unsigned long pa,
>  		goto set_the_pte;
>  	}
>  	if (pud_none(*pudp)) {
> -		pmdp = early_alloc_pgtable(PMD_TABLE_SIZE, nid,
> +		pmdp = early_alloc_pgtable(PAGE_SIZE, nid,
>  						region_start, region_end);
>  		pud_populate(&init_mm, pudp, pmdp);
>  	}
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index cba29131bccc..a8788b404266 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -51,6 +51,10 @@
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
> @@ -276,6 +280,7 @@ void __init mem_init(void)
>  	set_max_mapnr(max_pfn);
>  	memblock_free_all();
>
> +	fixup_pgtable_fragments();
>  #ifdef CONFIG_HIGHMEM
>  	{
>  		unsigned long pfn, highmem_mapnr;
> diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
> index a7b05214760c..694de7c731aa 100644
> --- a/arch/powerpc/mm/pgtable-frag.c
> +++ b/arch/powerpc/mm/pgtable-frag.c
> @@ -114,6 +114,9 @@ void pte_fragment_free(unsigned long *table, int kernel)
>  	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
>  		if (!kernel)
>  			pgtable_page_dtor(page);
> -		__free_page(page);
> +		if (PageReserved(page))
> +			free_reserved_page(page);
> +		else
> +			__free_page(page);
>  	}
>  }
> -- 
> 2.17.1

