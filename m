Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA67975E28
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2019 07:09:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vxvx2C3czDqG9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2019 15:09:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bharata@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vxpd0jkwzDqQD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2019 15:04:56 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6Q51hnp020060
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2019 01:04:54 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tytbhsgbb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2019 01:04:53 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Fri, 26 Jul 2019 06:04:51 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 26 Jul 2019 06:04:48 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6Q54lSa40567148
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jul 2019 05:04:47 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3169A42047;
 Fri, 26 Jul 2019 05:04:47 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01C0842049;
 Fri, 26 Jul 2019 05:04:46 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.51.213])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jul 2019 05:04:45 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/2] powerpc/mm/radix: Fix PTE/PMD fragment count for early
 page table mappings
Date: Fri, 26 Jul 2019 10:34:39 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190726050440.24798-1-bharata@linux.ibm.com>
References: <20190726050440.24798-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19072605-0016-0000-0000-0000029653C8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072605-0017-0000-0000-000032F45226
Message-Id: <20190726050440.24798-2-bharata@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-26_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907260067
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
Cc: sraithal@linux.vnet.ibm.com, aneesh.kumar@linux.vnet.ibm.com,
 npiggin@gmail.com, Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We can hit the following BUG_ONs during memory unplug

kernel BUG at arch/powerpc/mm/pgtable-frag.c:113!
 remove_pagetable+0x594/0x6a0
 (unreliable)
 remove_pagetable+0x94/0x6a0
 vmemmap_free+0x394/0x410
 sparse_remove_one_section+0x26c/0x2e8
 __remove_pages+0x428/0x540
 arch_remove_memory+0xd0/0x170
 __remove_memory+0xd4/0x1a0
 dlpar_remove_lmb+0xbc/0x110
 dlpar_memory+0xa80/0xd20
 handle_dlpar_errorlog+0xa8/0x160
 pseries_hp_work_fn+0x2c/0x60
 process_one_work+0x46c/0x860
 worker_thread+0x364/0x5e0
 kthread+0x1b0/0x1c0
 ret_from_kernel_thread+0x5c/0x68

kernel BUG at arch/powerpc/mm/book3s64/pgtable.c:331!
 remove_pagetable+0x604/0x6a0
 (unreliable)
 remove_pagetable+0x2cc/0x6a0
 radix__remove_section_mapping+0x18/0x2c
 remove_section_mapping+0x8c/0xb0
 arch_remove_memory+0xf8/0x160
 __remove_memory+0xd4/0x190
 dlpar_remove_lmb+0xbc/0x110
 dlpar_memory+0xa90/0xd30
 handle_dlpar_errorlog+0xa8/0x160
 pseries_hp_work_fn+0x2c/0x60
 process_one_work+0x46c/0x860
 worker_thread+0x364/0x5e0
 kthread+0x1b0/0x1c0
 ret_from_kernel_thread+0x5c/0x68

These occur when unplug is attempted for such memory which has
been mapped using memblock pages as part of early kernel page
table setup. We wouldn't have initialized the PMD or PTE fragment
count for those PMD or PTE pages.

Fixing this includes 3 parts:

- Re-walk the init_mm page tables from mem_init() and initialize
  the PMD and PTE fragment count to 1.
- When freeing PUD, PMD and PTE page table pages, check explicitly
  if they come from memblock and if so free then appropriately.
- When we do early memblock based allocation of PMD and PUD pages,
  allocate in PAGE_SIZE granularity so that we are sure the
  complete page is used as pagetable page.

Since we now do PAGE_SIZE allocations for both PUD table and
PMD table (Note that PTE table allocation is already of PAGE_SIZE),
we end up allocating more memory for the same amount of system RAM.
Here is a comparision of how much more we need for a 64T and 2G
system after this patch:

1. 64T system
-------------
64T RAM would need 64G for vmemmap with struct page size being 64B.

128 PUD tables for 64T memory (1G mappings)
1 PUD table and 64 PMD tables for 64G vmemmap (2M mappings)

With default PUD[PMD]_TABLE_SIZE(4K), (128+1+64)*4K=772K
With PAGE_SIZE(64K) table allocations, (128+1+64)*64K=12352K

2. 2G system
------------
2G RAM would need 2M for vmemmap with struct page size being 64B.

1 PUD table for 2G memory (1G mapping)
1 PUD table and 1 PMD table for 2M vmemmap (2M mappings)

With default PUD[PMD]_TABLE_SIZE(4K), (1+1+1)*4K=12K
With new PAGE_SIZE(64K) table allocations, (1+1+1)*64K=192K

Reported-by: Srikanth Aithal <sraithal@linux.vnet.ibm.com>
Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
Changes in v3:
- Commit message corrections and added example to show the extra
  memory usage for a small(2G) system in addition to 64T system.
- Handle freeing of memblock allocated page table pages separately
  for PUD, PMD and PTE pages. I had earlier converted the PMD and
  PTE from reserved to normal pages during fragments fixup so that
  they can be freed w/o special casing them. However that won't work
  because there are slight differences b/n these three types of pages:
  - Kernel PTE pages don't need _dtor routines to be run
  - PMD pages need _dtor routines to be run for all pages
    (Removing _ctor setup and ptlock init for kernel PMD pages
     is an optimization that can be done separately)
  - PUD pages go to kmem_cache during free
  So in anycase these 3 types need to be handled differently.

 arch/powerpc/include/asm/book3s/64/pgalloc.h | 11 +++-
 arch/powerpc/include/asm/book3s/64/radix.h   |  1 +
 arch/powerpc/include/asm/sparsemem.h         |  1 +
 arch/powerpc/mm/book3s64/pgtable.c           | 31 ++++++++-
 arch/powerpc/mm/book3s64/radix_pgtable.c     | 68 +++++++++++++++++++-
 arch/powerpc/mm/mem.c                        |  5 ++
 arch/powerpc/mm/pgtable-frag.c               |  9 ++-
 7 files changed, 119 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgalloc.h b/arch/powerpc/include/asm/book3s/64/pgalloc.h
index d5a44912902f..84acef634d72 100644
--- a/arch/powerpc/include/asm/book3s/64/pgalloc.h
+++ b/arch/powerpc/include/asm/book3s/64/pgalloc.h
@@ -111,7 +111,16 @@ static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
 
 static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 {
-	kmem_cache_free(PGT_CACHE(PUD_CACHE_INDEX), pud);
+	struct page *page = virt_to_page(pud);
+
+	/*
+	 * Early pud pages allocated via memblock allocator
+	 * can't be directly freed to slab
+	 */
+	if (PageReserved(page))
+		free_reserved_page(page);
+	else
+		kmem_cache_free(PGT_CACHE(PUD_CACHE_INDEX), pud);
 }
 
 static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index e04a839cb5b9..a0b43e122cde 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -288,6 +288,7 @@ static inline unsigned long radix__get_tree_size(void)
 #ifdef CONFIG_MEMORY_HOTPLUG
 int radix__create_section_mapping(unsigned long start, unsigned long end, int nid);
 int radix__remove_section_mapping(unsigned long start, unsigned long end);
+void radix__fixup_pgtable_fragments(void);
 #endif /* CONFIG_MEMORY_HOTPLUG */
 #endif /* __ASSEMBLY__ */
 #endif
diff --git a/arch/powerpc/include/asm/sparsemem.h b/arch/powerpc/include/asm/sparsemem.h
index 3192d454a733..e662f9232d35 100644
--- a/arch/powerpc/include/asm/sparsemem.h
+++ b/arch/powerpc/include/asm/sparsemem.h
@@ -15,6 +15,7 @@
 #ifdef CONFIG_MEMORY_HOTPLUG
 extern int create_section_mapping(unsigned long start, unsigned long end, int nid);
 extern int remove_section_mapping(unsigned long start, unsigned long end);
+void fixup_pgtable_fragments(void);
 
 #ifdef CONFIG_PPC_BOOK3S_64
 extern int resize_hpt_for_hotplug(unsigned long new_mem_size);
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 7d0e0d0d22c4..3ef0e817d88c 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -186,6 +186,13 @@ int __meminit remove_section_mapping(unsigned long start, unsigned long end)
 
 	return hash__remove_section_mapping(start, end);
 }
+
+void fixup_pgtable_fragments(void)
+{
+	if (radix_enabled())
+		radix__fixup_pgtable_fragments();
+}
+
 #endif /* CONFIG_MEMORY_HOTPLUG */
 
 void __init mmu_partition_table_init(void)
@@ -319,13 +326,23 @@ void pmd_fragment_free(unsigned long *pmd)
 
 	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
 	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
-		pgtable_pmd_page_dtor(page);
-		__free_page(page);
+		/*
+		 * Early pmd pages allocated via memblock
+		 * allocator wouldn't have called _ctor
+		 */
+		if (PageReserved(page))
+			free_reserved_page(page);
+		else {
+			pgtable_pmd_page_dtor(page);
+			__free_page(page);
+		}
 	}
 }
 
 static inline void pgtable_free(void *table, int index)
 {
+	struct page *page;
+
 	switch (index) {
 	case PTE_INDEX:
 		pte_fragment_free(table, 0);
@@ -334,7 +351,15 @@ static inline void pgtable_free(void *table, int index)
 		pmd_fragment_free(table);
 		break;
 	case PUD_INDEX:
-		kmem_cache_free(PGT_CACHE(PUD_CACHE_INDEX), table);
+		page = virt_to_page(table);
+		/*
+		 * Early pud pages allocated via memblock
+		 * allocator need to be freed differently
+		 */
+		if (PageReserved(page))
+			free_reserved_page(page);
+		else
+			kmem_cache_free(PGT_CACHE(PUD_CACHE_INDEX), table);
 		break;
 #if defined(CONFIG_PPC_4K_PAGES) && defined(CONFIG_HUGETLB_PAGE)
 		/* 16M hugepd directory at pud level */
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index b4ca9e95e678..c440446ee00f 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -33,6 +33,70 @@
 unsigned int mmu_pid_bits;
 unsigned int mmu_base_pid;
 
+static void fixup_pte_fragments(pmd_t *pmd)
+{
+	int i;
+
+	for (i = 0; i < PTRS_PER_PMD; i++, pmd++) {
+		pte_t *pte;
+		struct page *page;
+
+		if (pmd_none(*pmd))
+			continue;
+		if (pmd_is_leaf(*pmd))
+			continue;
+
+		pte = pte_offset_kernel(pmd, 0);
+		page = virt_to_page(pte);
+		atomic_inc(&page->pt_frag_refcount);
+	}
+}
+
+static void fixup_pmd_fragments(pud_t *pud)
+{
+	int i;
+
+	for (i = 0; i < PTRS_PER_PUD; i++, pud++) {
+		pmd_t *pmd;
+		struct page *page;
+
+		if (pud_none(*pud))
+			continue;
+		if (pud_is_leaf(*pud))
+			continue;
+
+		pmd = pmd_offset(pud, 0);
+		page = virt_to_page(pmd);
+		atomic_inc(&page->pt_frag_refcount);
+		fixup_pte_fragments(pmd);
+	}
+}
+
+/*
+ * Walk the init_mm page tables and fixup the PMD and PTE fragment
+ * counts. This allows the PUD, PMD and PTE pages to be freed
+ * back to buddy allocator properly during memory unplug.
+ */
+void radix__fixup_pgtable_fragments(void)
+{
+	int i;
+	pgd_t *pgd = pgd_offset_k(0UL);
+
+	spin_lock(&init_mm.page_table_lock);
+	for (i = 0; i < PTRS_PER_PGD; i++, pgd++) {
+		pud_t *pud;
+
+		if (pgd_none(*pgd))
+			continue;
+		if (pgd_is_leaf(*pgd))
+			continue;
+
+		pud = pud_offset(pgd, 0);
+		fixup_pmd_fragments(pud);
+	}
+	spin_unlock(&init_mm.page_table_lock);
+}
+
 static int native_register_process_table(unsigned long base, unsigned long pg_sz,
 					 unsigned long table_size)
 {
@@ -81,7 +145,7 @@ static int early_map_kernel_page(unsigned long ea, unsigned long pa,
 
 	pgdp = pgd_offset_k(ea);
 	if (pgd_none(*pgdp)) {
-		pudp = early_alloc_pgtable(PUD_TABLE_SIZE, nid,
+		pudp = early_alloc_pgtable(PAGE_SIZE, nid,
 						region_start, region_end);
 		pgd_populate(&init_mm, pgdp, pudp);
 	}
@@ -91,7 +155,7 @@ static int early_map_kernel_page(unsigned long ea, unsigned long pa,
 		goto set_the_pte;
 	}
 	if (pud_none(*pudp)) {
-		pmdp = early_alloc_pgtable(PMD_TABLE_SIZE, nid,
+		pmdp = early_alloc_pgtable(PAGE_SIZE, nid,
 						region_start, region_end);
 		pud_populate(&init_mm, pudp, pmdp);
 	}
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 9259337d7374..e04ca98a74cb 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -51,6 +51,10 @@
 
 #include <mm/mmu_decl.h>
 
+void __weak fixup_pgtable_fragments(void)
+{
+}
+
 #ifndef CPU_FTR_COHERENT_ICACHE
 #define CPU_FTR_COHERENT_ICACHE	0	/* XXX for now */
 #define CPU_FTR_NOEXECUTE	0
@@ -267,6 +271,7 @@ void __init mem_init(void)
 	set_max_mapnr(max_pfn);
 	memblock_free_all();
 
+	fixup_pgtable_fragments();
 #ifdef CONFIG_HIGHMEM
 	{
 		unsigned long pfn, highmem_mapnr;
diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
index a7b05214760c..8ef6527d2c78 100644
--- a/arch/powerpc/mm/pgtable-frag.c
+++ b/arch/powerpc/mm/pgtable-frag.c
@@ -114,6 +114,13 @@ void pte_fragment_free(unsigned long *table, int kernel)
 	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
 		if (!kernel)
 			pgtable_page_dtor(page);
-		__free_page(page);
+		/*
+		 * Early pte pages allocated via memblock
+		 * allocator need to be freed differently
+		 */
+		if (PageReserved(page))
+			free_reserved_page(page);
+		else
+			__free_page(page);
 	}
 }
-- 
2.21.0

