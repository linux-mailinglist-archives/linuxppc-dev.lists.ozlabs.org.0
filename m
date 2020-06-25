Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18289209A15
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 08:50:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49srHg2RvYzDqjN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 16:50:23 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49srBx4XRQzDqgS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 16:46:17 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05P6UqUk164138; Thu, 25 Jun 2020 02:46:12 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31uwysbfhx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 02:46:12 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05P6dkPx019070;
 Thu, 25 Jun 2020 06:46:11 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 31uurt47pk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 06:46:11 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05P6k81j12452458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Jun 2020 06:46:08 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A025278064;
 Thu, 25 Jun 2020 06:46:09 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 604457805F;
 Thu, 25 Jun 2020 06:46:07 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.47.233])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 25 Jun 2020 06:46:07 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 1/4] powerpc/mm/radix: Fix PTE/PMD fragment count for early
 page table mappings
Date: Thu, 25 Jun 2020 12:15:44 +0530
Message-Id: <20200625064547.228448-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200625064547.228448-1-aneesh.kumar@linux.ibm.com>
References: <20200625064547.228448-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-25_02:2020-06-24,
 2020-06-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 cotscore=-2147483648
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 adultscore=0 suspectscore=2 mlxscore=0 malwarescore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006250035
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Bharata B Rao <bharata@linux.ibm.com>
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
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pgalloc.h | 16 +++++++++++++++-
 arch/powerpc/mm/book3s64/pgtable.c           |  5 ++++-
 arch/powerpc/mm/book3s64/radix_pgtable.c     | 15 +++++++++++----
 arch/powerpc/mm/pgtable-frag.c               |  3 +++
 4 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgalloc.h b/arch/powerpc/include/asm/book3s/64/pgalloc.h
index 69c5b051734f..e1af0b394ceb 100644
--- a/arch/powerpc/include/asm/book3s/64/pgalloc.h
+++ b/arch/powerpc/include/asm/book3s/64/pgalloc.h
@@ -107,9 +107,23 @@ static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
 	return pud;
 }
 
+static inline void __pud_free(pud_t *pud)
+{
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
+}
+
 static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 {
-	kmem_cache_free(PGT_CACHE(PUD_CACHE_INDEX), pud);
+	return __pud_free(pud);
 }
 
 static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index c58ad1049909..85de5b574dd7 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -339,6 +339,9 @@ void pmd_fragment_free(unsigned long *pmd)
 {
 	struct page *page = virt_to_page(pmd);
 
+	if (PageReserved(page))
+		return free_reserved_page(page);
+
 	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
 	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
 		pgtable_pmd_page_dtor(page);
@@ -356,7 +359,7 @@ static inline void pgtable_free(void *table, int index)
 		pmd_fragment_free(table);
 		break;
 	case PUD_INDEX:
-		kmem_cache_free(PGT_CACHE(PUD_CACHE_INDEX), table);
+		__pud_free(table);
 		break;
 #if defined(CONFIG_PPC_4K_PAGES) && defined(CONFIG_HUGETLB_PAGE)
 		/* 16M hugepd directory at pud level */
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 8acb96de0e48..80be96d3018f 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -57,6 +57,13 @@ static __ref void *early_alloc_pgtable(unsigned long size, int nid,
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
@@ -73,8 +80,8 @@ static int early_map_kernel_page(unsigned long ea, unsigned long pa,
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
@@ -83,8 +90,8 @@ static int early_map_kernel_page(unsigned long ea, unsigned long pa,
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
diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
index ee4bd6d38602..97ae4935da79 100644
--- a/arch/powerpc/mm/pgtable-frag.c
+++ b/arch/powerpc/mm/pgtable-frag.c
@@ -110,6 +110,9 @@ void pte_fragment_free(unsigned long *table, int kernel)
 {
 	struct page *page = virt_to_page(table);
 
+	if (PageReserved(page))
+		return free_reserved_page(page);
+
 	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
 	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
 		if (!kernel)
-- 
2.26.2

