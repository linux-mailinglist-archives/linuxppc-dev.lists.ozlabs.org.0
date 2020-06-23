Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86ACD204B5B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 09:39:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rdTD2CQLzDqTF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 17:39:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rdNz5Z5jzDqWq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 17:35:47 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05N7WTZ2173586; Tue, 23 Jun 2020 03:35:41 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ud798j5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 03:35:40 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05N7X7if175789;
 Tue, 23 Jun 2020 03:35:38 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ud798j3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 03:35:38 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05N7UR2k012048;
 Tue, 23 Jun 2020 07:30:36 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 31sa37vp40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 07:30:36 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05N7TEI662783834
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jun 2020 07:29:14 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59611A4060;
 Tue, 23 Jun 2020 07:30:33 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FB1CA4065;
 Tue, 23 Jun 2020 07:30:30 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.54.229])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 23 Jun 2020 07:30:29 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 2/3] powerpc/mm/radix: Fix PTE/PMD fragment count for early
 page table mappings
Date: Tue, 23 Jun 2020 13:00:16 +0530
Message-Id: <20200623073017.1951-3-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200623073017.1951-1-bharata@linux.ibm.com>
References: <20200623073017.1951-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-23_04:2020-06-22,
 2020-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 cotscore=-2147483648 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 suspectscore=3 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006230055
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
Cc: aneesh.kumar@linux.ibm.com, Bharata B Rao <bharata@linux.ibm.com>,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We can hit the following BUG_ON during memory unplug:

kernel BUG at arch/powerpc/mm/book3s64/pgtable.c:342!
Oops: Exception in kernel mode, sig: 5 [#1]
LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
NIP [c000000000093308] pmd_fragment_free+0x48/0xc0
LR [c00000000147bfec] remove_pagetable+0x578/0x60c
Call Trace:
0xc000008050000000 (unreliable)
remove_pagetable+0x384/0x60c
radix__remove_section_mapping+0x18/0x2c
remove_section_mapping+0x1c/0x3c
arch_remove_memory+0x11c/0x180
try_remove_memory+0x120/0x1b0
__remove_memory+0x20/0x40
dlpar_remove_lmb+0xc0/0x114
dlpar_memory+0x8b0/0xb20
handle_dlpar_errorlog+0xc0/0x190
pseries_hp_work_fn+0x2c/0x60
process_one_work+0x30c/0x810
worker_thread+0x98/0x540
kthread+0x1c4/0x1d0
ret_from_kernel_thread+0x5c/0x74

This occurs when unplug is attempted for such memory which has
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

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pgalloc.h | 11 ++-
 arch/powerpc/include/asm/book3s/64/radix.h   |  1 +
 arch/powerpc/include/asm/sparsemem.h         |  1 +
 arch/powerpc/mm/book3s64/pgtable.c           | 31 +++++++-
 arch/powerpc/mm/book3s64/radix_pgtable.c     | 80 +++++++++++++++++++-
 arch/powerpc/mm/mem.c                        |  5 ++
 arch/powerpc/mm/pgtable-frag.c               |  9 ++-
 7 files changed, 129 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgalloc.h b/arch/powerpc/include/asm/book3s/64/pgalloc.h
index 69c5b051734f..56d695f0095c 100644
--- a/arch/powerpc/include/asm/book3s/64/pgalloc.h
+++ b/arch/powerpc/include/asm/book3s/64/pgalloc.h
@@ -109,7 +109,16 @@ static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
 
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
index 0cba794c4fb8..90f05d52f46d 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -297,6 +297,7 @@ static inline unsigned long radix__get_tree_size(void)
 int radix__create_section_mapping(unsigned long start, unsigned long end,
 				  int nid, pgprot_t prot);
 int radix__remove_section_mapping(unsigned long start, unsigned long end);
+void radix__fixup_pgtable_fragments(void);
 #endif /* CONFIG_MEMORY_HOTPLUG */
 #endif /* __ASSEMBLY__ */
 #endif
diff --git a/arch/powerpc/include/asm/sparsemem.h b/arch/powerpc/include/asm/sparsemem.h
index c89b32443cff..d0b22a937a7a 100644
--- a/arch/powerpc/include/asm/sparsemem.h
+++ b/arch/powerpc/include/asm/sparsemem.h
@@ -16,6 +16,7 @@
 extern int create_section_mapping(unsigned long start, unsigned long end,
 				  int nid, pgprot_t prot);
 extern int remove_section_mapping(unsigned long start, unsigned long end);
+void fixup_pgtable_fragments(void);
 
 #ifdef CONFIG_PPC_BOOK3S_64
 extern int resize_hpt_for_hotplug(unsigned long new_mem_size);
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index c58ad1049909..ee94a28dc6f9 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -184,6 +184,13 @@ int __meminit remove_section_mapping(unsigned long start, unsigned long end)
 
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
@@ -341,13 +348,23 @@ void pmd_fragment_free(unsigned long *pmd)
 
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
@@ -356,7 +373,15 @@ static inline void pgtable_free(void *table, int index)
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
index ffccfe00ca2a..58e42393d5e8 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -37,6 +37,71 @@
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
+		p4d_t *p4d = p4d_offset(pgd, 0UL);
+		pud_t *pud;
+
+		if (p4d_none(*p4d))
+			continue;
+		if (p4d_is_leaf(*p4d))
+			continue;
+
+		pud = pud_offset(p4d, 0);
+		fixup_pmd_fragments(pud);
+	}
+	spin_unlock(&init_mm.page_table_lock);
+}
+
 static __ref void *early_alloc_pgtable(unsigned long size, int nid,
 			unsigned long region_start, unsigned long region_end)
 {
@@ -58,6 +123,13 @@ static __ref void *early_alloc_pgtable(unsigned long size, int nid,
 	return ptr;
 }
 
+/*
+ * When allocating pud or pmd pointers, we allocate a complete page
+ * of PAGE_SIZE rather than PUD_TABLE_SIZE or PMD_TABLE_SIZE. This
+ * is to ensure that the page obtained from the memblock allocator
+ * can be completely used as page table page and can be freed
+ * correctly when the page table entries are removed.
+ */
 static int early_map_kernel_page(unsigned long ea, unsigned long pa,
 			  pgprot_t flags,
 			  unsigned int map_page_size,
@@ -74,8 +146,8 @@ static int early_map_kernel_page(unsigned long ea, unsigned long pa,
 	pgdp = pgd_offset_k(ea);
 	p4dp = p4d_offset(pgdp, ea);
 	if (p4d_none(*p4dp)) {
-		pudp = early_alloc_pgtable(PUD_TABLE_SIZE, nid,
-						region_start, region_end);
+		pudp = early_alloc_pgtable(PAGE_SIZE, nid,
+					   region_start, region_end);
 		p4d_populate(&init_mm, p4dp, pudp);
 	}
 	pudp = pud_offset(p4dp, ea);
@@ -84,8 +156,8 @@ static int early_map_kernel_page(unsigned long ea, unsigned long pa,
 		goto set_the_pte;
 	}
 	if (pud_none(*pudp)) {
-		pmdp = early_alloc_pgtable(PMD_TABLE_SIZE, nid,
-						region_start, region_end);
+		pmdp = early_alloc_pgtable(PAGE_SIZE, nid, region_start,
+					   region_end);
 		pud_populate(&init_mm, pudp, pmdp);
 	}
 	pmdp = pmd_offset(pudp, ea);
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 5f7fe13211e9..b8ea004c3ebf 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -54,6 +54,10 @@
 
 #include <mm/mmu_decl.h>
 
+void __weak fixup_pgtable_fragments(void)
+{
+}
+
 #ifndef CPU_FTR_COHERENT_ICACHE
 #define CPU_FTR_COHERENT_ICACHE	0	/* XXX for now */
 #define CPU_FTR_NOEXECUTE	0
@@ -301,6 +305,7 @@ void __init mem_init(void)
 
 	memblock_free_all();
 
+	fixup_pgtable_fragments();
 #ifdef CONFIG_HIGHMEM
 	{
 		unsigned long pfn, highmem_mapnr;
diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
index ee4bd6d38602..16213c09896a 100644
--- a/arch/powerpc/mm/pgtable-frag.c
+++ b/arch/powerpc/mm/pgtable-frag.c
@@ -114,6 +114,13 @@ void pte_fragment_free(unsigned long *table, int kernel)
 	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
 		if (!kernel)
 			pgtable_pte_page_dtor(page);
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
2.21.3

