Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0D46A242
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 08:34:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nrGq68syzDqPc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 16:34:43 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nrDl1ShxzDqPc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 16:32:54 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6G6WObZ018274
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 02:32:52 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ts9a5g7bf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 02:32:52 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Tue, 16 Jul 2019 07:32:51 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 07:32:48 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6G6WlXH48627776
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 06:32:47 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C48811C054;
 Tue, 16 Jul 2019 06:32:47 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5ABA911C04C;
 Tue, 16 Jul 2019 06:32:46 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.85.84.146])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jul 2019 06:32:46 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/mm/radix: Fix PTE/PMD fragment count for early
 page table mappings
Date: Tue, 16 Jul 2019 12:02:42 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19071606-0020-0000-0000-00000353F096
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071606-0021-0000-0000-000021A7BAF7
Message-Id: <20190716063242.32316-1-bharata@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907160085
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

We could potentially hit the following BUG_ON when memory hotplugged
before reboot is unplugged after reboot:

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

This occurs because, during reboot-after-hotplug, the hotplugged
memory range gets initialized as regular memory and page
tables are setup using memblock allocator. This means that we
wouldn't have initialized the PMD or PTE fragment count for
those PMD or PTE pages.

This BUG_ON was hitting quite regularly until we changed the vmemmap
mapping size from 64K to 2M via the commit
'89a3496e0664 ("powerpc/mm/radix: Use the right page size for
vmemmap mapping")'

After this commit, the bug still exists but it is hard to hit now
because vmemmap array is now mapped at PMD level (level 3) and we would
have to unplug a huge amount of memory to free one PMD table.

A point to note here is that we encounter this bug only while removing
the mappings for vmemmap and not when unmapping the memory that we
are unplugging. This is because for the memory that is to be unplugged
we split the mapping into smaller 2M mappings and hence PMD and PTE
fragments will be initialized properly as it is no longer early mapping.

Fixing this includes 3 parts:

- Re-walk the init_mm page tables from mem_init() and initialize
  the PMD and PTE fragment counts appropriately. So PMD and PTE
  table pages allocated during early allocation will have a
  fragment count of 1.
- Convert the pages from memblock pages to regular pages so that
  they can be freed back to buddy allocator seamlessly. However
  we do this for only PMD and PTE pages and not for PUD pages.
  PUD pages are freed using kmem_cache_free() and we need to
  identify memblock pages and free them differently.
- When we do early memblock based allocation of PMD and PUD pages,
  allocate in PAGE_SIZE granularity so that we are sure the
  complete page is used as pagetable page. PAGE_SIZE allocations will
  have an implication on the amount of memory used for page tables,
  an example of which is shown below:

Since we now do PAGE_SIZE allocations for both PUD table and
PMD table (Note that PTE table allocation is already of PAGE_SIZE),
we end up allocating more memory for the same amount of system RAM.
Here is an example of how much more we end up allocating for
page tables in case of 64T system RAM:

1. Mapping system RAM

With each PGD entry spanning 512G, 64TB RAM would need 128 entries
and hence 128 PUD tables. We use 1G mapping at PUD level (level 2)

With default PUD_TABLE_SIZE(4K), 128*4K=512K (8 64K pages)
With PAGE_SIZE(64K) allocations, 128*64K=8192K (128 64K pages)

2. Mapping struct pages (memmap)

64T RAM would need 64G for memmap with struct page size being 64B.
Since memmap array is mapped using 64K mappings, we would need
64 PUD entries or 64 PMD tables (level 3) in total.

With default PMD_TABLE_SIZE(4K), 64*4K=256K (4 64K pages)
With PAGE_SIZE(64K) allocations, 64*64K=4096K (64 64K pages)

There is no change in PTE table (level 4) allocation requirement as
early page table allocation is already using PAGE_SIZE PTE tables.

So essentially with this change we would use 180 64K pages
more for 64T system.

Reported-by: Srikanth Aithal <sraithal@linux.vnet.ibm.com>
Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
v1: https://www.mail-archive.com/linuxppc-dev@lists.ozlabs.org/msg152511.html
Changes in v2:
- Replaced [pgd,pud,pmd]_huge() with [pgd,pud,pmd]_is_leaf()
- Updated commit description

 arch/powerpc/include/asm/book3s/64/pgalloc.h |  7 +-
 arch/powerpc/include/asm/book3s/64/radix.h   |  1 +
 arch/powerpc/include/asm/sparsemem.h         |  1 +
 arch/powerpc/mm/book3s64/pgtable.c           | 15 +++-
 arch/powerpc/mm/book3s64/radix_pgtable.c     | 79 +++++++++++++++++++-
 arch/powerpc/mm/mem.c                        |  5 ++
 6 files changed, 104 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgalloc.h b/arch/powerpc/include/asm/book3s/64/pgalloc.h
index d45e4449619f..282f6620c514 100644
--- a/arch/powerpc/include/asm/book3s/64/pgalloc.h
+++ b/arch/powerpc/include/asm/book3s/64/pgalloc.h
@@ -114,7 +114,12 @@ static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
 
 static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 {
-	kmem_cache_free(PGT_CACHE(PUD_CACHE_INDEX), pud);
+	struct page *page = virt_to_page(pud);
+
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
index 85bc81abd286..e45105a53e7e 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -190,6 +190,13 @@ int __meminit remove_section_mapping(unsigned long start, unsigned long end)
 
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
@@ -330,6 +337,8 @@ void pmd_fragment_free(unsigned long *pmd)
 
 static inline void pgtable_free(void *table, int index)
 {
+	struct page *page;
+
 	switch (index) {
 	case PTE_INDEX:
 		pte_fragment_free(table, 0);
@@ -338,7 +347,11 @@ static inline void pgtable_free(void *table, int index)
 		pmd_fragment_free(table);
 		break;
 	case PUD_INDEX:
-		kmem_cache_free(PGT_CACHE(PUD_CACHE_INDEX), table);
+		page = virt_to_page(table);
+		if (PageReserved(page))
+			free_reserved_page(page);
+		else
+			kmem_cache_free(PGT_CACHE(PUD_CACHE_INDEX), table);
 		break;
 #if defined(CONFIG_PPC_4K_PAGES) && defined(CONFIG_HUGETLB_PAGE)
 		/* 16M hugepd directory at pud level */
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index e92c6472a20c..09184c81e394 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -37,6 +37,81 @@
 unsigned int mmu_pid_bits;
 unsigned int mmu_base_pid;
 
+/*
+ * Since we know that this page is a memblock-allocated page,
+ * convert it into a normal page in addition to fixing the fragment
+ * count.
+ */
+static void fix_fragment_count(struct page *page)
+{
+	ClearPageReserved(page);
+	init_page_count(page);
+	adjust_managed_page_count(page, 1);
+	atomic_inc(&page->pt_frag_refcount);
+}
+
+static void fixup_pte_fragments(pmd_t *pmd)
+{
+	int i;
+
+	for (i = 0; i < PTRS_PER_PMD; i++, pmd++) {
+		pte_t *pte;
+
+		if (pmd_none(*pmd))
+			continue;
+		if (pmd_is_leaf(*pmd))
+			continue;
+
+		pte = pte_offset_kernel(pmd, 0);
+		if (!pte_none(*pte))
+			fix_fragment_count(virt_to_page(pte));
+	}
+}
+
+static void fixup_pmd_fragments(pud_t *pud)
+{
+	int i;
+
+	for (i = 0; i < PTRS_PER_PUD; i++, pud++) {
+		pmd_t *pmd;
+
+		if (pud_none(*pud))
+			continue;
+		if (pud_is_leaf(*pud))
+			continue;
+
+		pmd = pmd_offset(pud, 0);
+		if (!pmd_none(*pmd))
+			fix_fragment_count(virt_to_page(pmd));
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
@@ -85,7 +160,7 @@ static int early_map_kernel_page(unsigned long ea, unsigned long pa,
 
 	pgdp = pgd_offset_k(ea);
 	if (pgd_none(*pgdp)) {
-		pudp = early_alloc_pgtable(PUD_TABLE_SIZE, nid,
+		pudp = early_alloc_pgtable(PAGE_SIZE, nid,
 						region_start, region_end);
 		pgd_populate(&init_mm, pgdp, pudp);
 	}
@@ -95,7 +170,7 @@ static int early_map_kernel_page(unsigned long ea, unsigned long pa,
 		goto set_the_pte;
 	}
 	if (pud_none(*pudp)) {
-		pmdp = early_alloc_pgtable(PMD_TABLE_SIZE, nid,
+		pmdp = early_alloc_pgtable(PAGE_SIZE, nid,
 						region_start, region_end);
 		pud_populate(&init_mm, pudp, pmdp);
 	}
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 096c87836e29..dac60f4c75a9 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -56,6 +56,10 @@
 
 #include <mm/mmu_decl.h>
 
+void __weak fixup_pgtable_fragments(void)
+{
+}
+
 #ifndef CPU_FTR_COHERENT_ICACHE
 #define CPU_FTR_COHERENT_ICACHE	0	/* XXX for now */
 #define CPU_FTR_NOEXECUTE	0
@@ -282,6 +286,7 @@ void __init mem_init(void)
 	set_max_mapnr(max_pfn);
 	memblock_free_all();
 
+	fixup_pgtable_fragments();
 #ifdef CONFIG_HIGHMEM
 	{
 		unsigned long pfn, highmem_mapnr;
-- 
2.21.0

