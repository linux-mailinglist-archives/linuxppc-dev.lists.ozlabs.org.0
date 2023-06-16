Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02695732FB3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 13:20:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D76h72uJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjGtD6Mtzz3cD1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:20:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D76h72uJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjGfl4pwNz3bsZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 21:10:39 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35GAkrmO002627;
	Fri, 16 Jun 2023 11:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6Jl6wriXJWVZUja7X5z0rce8AeFw3lmLCLsgACezTAQ=;
 b=D76h72uJrLLSmeAnThVzJ8wlYgIF3QKa66qwexHQawXVKixbpOaCHEmddxpVxRtyul82
 tpE3aSS82QlhpZCHDqySw9hTg/bUo/6phNeSDU0u635h/LkN49LqigrU1YfWBYMbCQKw
 reFGrAZXCMKqtIdFZoY3D1/c3WckC8bjqDV5nZxTdAX7+JcdGuM85VxhO/sehPmQDfdx
 VdMXtXKGdG7dNufYkUK8Gwp6Mr3jGsBJ5PCjUL+GSBwir7/q9Lb6cQOQ7HRCxo1NmSX+
 ijeA3u5IDx95B6iNO4IjZPwcTOZwfcbg0Sel9++X+DnnAu6CAcwz1qd/BC0w2fZ3OfFL FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8p9prj09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 11:10:20 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35GAqPGa018636;
	Fri, 16 Jun 2023 11:10:19 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8p9prhy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 11:10:19 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35G9lNgL027199;
	Fri, 16 Jun 2023 11:10:18 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3r4gt6gy5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 11:10:17 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35GBAG136423106
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jun 2023 11:10:16 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88D435805B;
	Fri, 16 Jun 2023 11:10:16 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9723858059;
	Fri, 16 Jun 2023 11:10:10 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.52.24])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jun 2023 11:10:10 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v2 14/16] powerpc/book3s64/vmemmap: Switch radix to use a different vmemmap handling function
Date: Fri, 16 Jun 2023 16:38:24 +0530
Message-Id: <20230616110826.344417-15-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
References: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Lkado8UONI6fm9TNSghPSkwV_A8dBuOg
X-Proofpoint-GUID: xPOsUBAXPrrjF3qncdH_B3fXZxk4T3mj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_06,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160099
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

This is in preparation to update radix to implement vmemmap optimization
for devdax. Below are the rules w.r.t radix vmemmap mapping

1. First try to map things using PMD (2M)
2. With altmap if altmap cross-boundary check returns true, fall back to
   PAGE_SIZE
3. If we can't allocate PMD_SIZE backing memory for vmemmap, fallback to
   PAGE_SIZE

On removing vmemmap mapping, check if every subsection that is using the
vmemmap area is invalid. If found to be invalid, that implies we can safely
free the vmemmap area. We don't use the PAGE_UNUSED pattern used by x86
because with 64K page size, we need to do the above check even at the
PAGE_SIZE granularity.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/radix.h |   2 +
 arch/powerpc/include/asm/pgtable.h         |   3 +
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 319 +++++++++++++++++++--
 arch/powerpc/mm/init_64.c                  |  26 +-
 4 files changed, 319 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index 8cdff5a05011..87d4c1e62491 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -332,6 +332,8 @@ extern int __meminit radix__vmemmap_create_mapping(unsigned long start,
 					     unsigned long phys);
 int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end,
 				      int node, struct vmem_altmap *altmap);
+void __ref radix__vmemmap_free(unsigned long start, unsigned long end,
+			       struct vmem_altmap *altmap);
 extern void radix__vmemmap_remove_mapping(unsigned long start,
 				    unsigned long page_size);
 
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 9972626ddaf6..6d4cd2ebae6e 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -168,6 +168,9 @@ static inline bool is_ioremap_addr(const void *x)
 
 struct seq_file;
 void arch_report_meminfo(struct seq_file *m);
+int __meminit vmemmap_populated(unsigned long vmemmap_addr, int vmemmap_map_size);
+bool altmap_cross_boundary(struct vmem_altmap *altmap, unsigned long start,
+			   unsigned long page_size);
 #endif /* CONFIG_PPC64 */
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index d7e2dd3d4add..ef886fab643d 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -742,8 +742,57 @@ static void free_pud_table(pud_t *pud_start, p4d_t *p4d)
 	p4d_clear(p4d);
 }
 
+static bool __meminit vmemmap_pmd_is_unused(unsigned long addr, unsigned long end)
+{
+	unsigned long start = ALIGN_DOWN(addr, PMD_SIZE);
+
+	return !vmemmap_populated(start, PMD_SIZE);
+}
+
+static bool __meminit vmemmap_page_is_unused(unsigned long addr, unsigned long end)
+{
+	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
+
+	return !vmemmap_populated(start, PAGE_SIZE);
+
+}
+
+static void __meminit free_vmemmap_pages(struct page *page,
+					 struct vmem_altmap *altmap,
+					 int order)
+{
+	unsigned int nr_pages = 1 << order;
+
+	if (altmap) {
+		unsigned long alt_start, alt_end;
+		unsigned long base_pfn = page_to_pfn(page);
+
+		/*
+		 * with 1G vmemmap mmaping we can have things setup
+		 * such that even though atlmap is specified we never
+		 * used altmap.
+		 */
+		alt_start = altmap->base_pfn;
+		alt_end = altmap->base_pfn + altmap->reserve +
+			altmap->free + altmap->alloc + altmap->align;
+
+		if (base_pfn >= alt_start && base_pfn < alt_end) {
+			vmem_altmap_free(altmap, nr_pages);
+			return;
+		}
+	}
+
+	if (PageReserved(page)) {
+		/* allocated from memblock */
+		while (nr_pages--)
+			free_reserved_page(page++);
+	} else
+		free_pages((unsigned long)page_address(page), order);
+}
+
 static void remove_pte_table(pte_t *pte_start, unsigned long addr,
-			     unsigned long end, bool direct)
+			     unsigned long end, bool direct,
+			     struct vmem_altmap *altmap)
 {
 	unsigned long next, pages = 0;
 	pte_t *pte;
@@ -757,24 +806,23 @@ static void remove_pte_table(pte_t *pte_start, unsigned long addr,
 		if (!pte_present(*pte))
 			continue;
 
-		if (!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(next)) {
-			/*
-			 * The vmemmap_free() and remove_section_mapping()
-			 * codepaths call us with aligned addresses.
-			 */
-			WARN_ONCE(1, "%s: unaligned range\n", __func__);
-			continue;
+		if (PAGE_ALIGNED(addr) && PAGE_ALIGNED(next)) {
+			if (!direct)
+				free_vmemmap_pages(pte_page(*pte), altmap, 0);
+			pte_clear(&init_mm, addr, pte);
+			pages++;
+		} else if (!direct && vmemmap_page_is_unused(addr, next)) {
+			free_vmemmap_pages(pte_page(*pte), altmap, 0);
+			pte_clear(&init_mm, addr, pte);
 		}
-
-		pte_clear(&init_mm, addr, pte);
-		pages++;
 	}
 	if (direct)
 		update_page_count(mmu_virtual_psize, -pages);
 }
 
 static void __meminit remove_pmd_table(pmd_t *pmd_start, unsigned long addr,
-				       unsigned long end, bool direct)
+				       unsigned long end, bool direct,
+				       struct vmem_altmap *altmap)
 {
 	unsigned long next, pages = 0;
 	pte_t *pte_base;
@@ -788,18 +836,21 @@ static void __meminit remove_pmd_table(pmd_t *pmd_start, unsigned long addr,
 			continue;
 
 		if (pmd_is_leaf(*pmd)) {
-			if (!IS_ALIGNED(addr, PMD_SIZE) ||
-			    !IS_ALIGNED(next, PMD_SIZE)) {
-				WARN_ONCE(1, "%s: unaligned range\n", __func__);
-				continue;
+			if (IS_ALIGNED(addr, PMD_SIZE) &&
+			    IS_ALIGNED(next, PMD_SIZE)) {
+				if (!direct)
+					free_vmemmap_pages(pmd_page(*pmd), altmap, get_order(PMD_SIZE));
+				pte_clear(&init_mm, addr, (pte_t *)pmd);
+				pages++;
+			} else if (vmemmap_pmd_is_unused(addr, next)) {
+				free_vmemmap_pages(pmd_page(*pmd), altmap, get_order(PMD_SIZE));
+				pte_clear(&init_mm, addr, (pte_t *)pmd);
 			}
-			pte_clear(&init_mm, addr, (pte_t *)pmd);
-			pages++;
 			continue;
 		}
 
 		pte_base = (pte_t *)pmd_page_vaddr(*pmd);
-		remove_pte_table(pte_base, addr, next, direct);
+		remove_pte_table(pte_base, addr, next, direct, altmap);
 		free_pte_table(pte_base, pmd);
 	}
 	if (direct)
@@ -807,7 +858,8 @@ static void __meminit remove_pmd_table(pmd_t *pmd_start, unsigned long addr,
 }
 
 static void __meminit remove_pud_table(pud_t *pud_start, unsigned long addr,
-				       unsigned long end, bool direct)
+				       unsigned long end, bool direct,
+				       struct vmem_altmap *altmap)
 {
 	unsigned long next, pages = 0;
 	pmd_t *pmd_base;
@@ -832,15 +884,16 @@ static void __meminit remove_pud_table(pud_t *pud_start, unsigned long addr,
 		}
 
 		pmd_base = pud_pgtable(*pud);
-		remove_pmd_table(pmd_base, addr, next, direct);
+		remove_pmd_table(pmd_base, addr, next, direct, altmap);
 		free_pmd_table(pmd_base, pud);
 	}
 	if (direct)
 		update_page_count(MMU_PAGE_1G, -pages);
 }
 
-static void __meminit remove_pagetable(unsigned long start, unsigned long end,
-				       bool direct)
+static void __meminit
+remove_pagetable(unsigned long start, unsigned long end, bool direct,
+		 struct vmem_altmap *altmap)
 {
 	unsigned long addr, next;
 	pud_t *pud_base;
@@ -869,7 +922,7 @@ static void __meminit remove_pagetable(unsigned long start, unsigned long end,
 		}
 
 		pud_base = p4d_pgtable(*p4d);
-		remove_pud_table(pud_base, addr, next, direct);
+		remove_pud_table(pud_base, addr, next, direct, altmap);
 		free_pud_table(pud_base, p4d);
 	}
 
@@ -892,7 +945,7 @@ int __meminit radix__create_section_mapping(unsigned long start,
 
 int __meminit radix__remove_section_mapping(unsigned long start, unsigned long end)
 {
-	remove_pagetable(start, end, true);
+	remove_pagetable(start, end, true, NULL);
 	return 0;
 }
 #endif /* CONFIG_MEMORY_HOTPLUG */
@@ -924,10 +977,224 @@ int __meminit radix__vmemmap_create_mapping(unsigned long start,
 	return 0;
 }
 
+int __meminit vmemmap_check_pmd(pmd_t *pmd, int node,
+				unsigned long addr, unsigned long next)
+{
+	int large = pmd_large(*pmd);
+
+	if (pmd_large(*pmd))
+		vmemmap_verify((pte_t *)pmd, node, addr, next);
+
+	return large;
+}
+
+void __meminit vmemmap_set_pmd(pmd_t *pmdp, void *p, int node,
+			       unsigned long addr, unsigned long next)
+{
+	pte_t entry;
+	pte_t *ptep = pmdp_ptep(pmdp);
+
+	VM_BUG_ON(!IS_ALIGNED(addr, PMD_SIZE));
+	entry = pfn_pte(__pa(p) >> PAGE_SHIFT, PAGE_KERNEL);
+	set_pte_at(&init_mm, addr, ptep, entry);
+	asm volatile("ptesync": : :"memory");
+
+	vmemmap_verify(ptep, node, addr, next);
+}
+
+static pte_t * __meminit radix__vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
+						     struct vmem_altmap *altmap,
+						     struct page *reuse)
+{
+	pte_t *pte = pte_offset_kernel(pmd, addr);
+
+	if (pte_none(*pte)) {
+		pte_t entry;
+		void *p;
+
+		if (!reuse) {
+			/*
+			 * make sure we don't create altmap mappings
+			 * covering things outside the device.
+			 */
+			if (altmap && altmap_cross_boundary(altmap, addr, PAGE_SIZE))
+				altmap = NULL;
+
+			p = vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
+			if (!p) {
+				if (altmap)
+					p = vmemmap_alloc_block_buf(PAGE_SIZE, node, NULL);
+				if (!p)
+					return NULL;
+			}
+		} else {
+			/*
+			 * When a PTE/PMD entry is freed from the init_mm
+			 * there's a free_pages() call to this page allocated
+			 * above. Thus this get_page() is paired with the
+			 * put_page_testzero() on the freeing path.
+			 * This can only called by certain ZONE_DEVICE path,
+			 * and through vmemmap_populate_compound_pages() when
+			 * slab is available.
+			 */
+			get_page(reuse);
+			p = page_to_virt(reuse);
+		}
+
+		VM_BUG_ON(!PAGE_ALIGNED(addr));
+		entry = pfn_pte(__pa(p) >> PAGE_SHIFT, PAGE_KERNEL);
+		set_pte_at(&init_mm, addr, pte, entry);
+		asm volatile("ptesync": : :"memory");
+	}
+	return pte;
+}
+
+static inline pud_t *vmemmap_pud_alloc(p4d_t *p4d, int node,
+				       unsigned long address)
+{
+	pud_t *pud;
+
+	/* All early vmemmap mapping to keep simple do it at PAGE_SIZE */
+	if (unlikely(p4d_none(*p4d))) {
+		if (unlikely(!slab_is_available())) {
+			pud = early_alloc_pgtable(PAGE_SIZE, node, 0, 0);
+			p4d_populate(&init_mm, p4d, pud);
+			/* go to the pud_offset */
+		} else
+			return pud_alloc(&init_mm, p4d, address);
+	}
+	return pud_offset(p4d, address);
+}
+
+static inline pmd_t *vmemmap_pmd_alloc(pud_t *pud, int node,
+				       unsigned long address)
+{
+	pmd_t *pmd;
+
+	/* All early vmemmap mapping to keep simple do it at PAGE_SIZE */
+	if (unlikely(pud_none(*pud))) {
+		if (unlikely(!slab_is_available())) {
+			pmd = early_alloc_pgtable(PAGE_SIZE, node, 0, 0);
+			pud_populate(&init_mm, pud, pmd);
+		} else
+			return pmd_alloc(&init_mm, pud, address);
+	}
+	return pmd_offset(pud, address);
+}
+
+static inline pte_t *vmemmap_pte_alloc(pmd_t *pmd, int node,
+				       unsigned long address)
+{
+	pte_t *pte;
+
+	/* All early vmemmap mapping to keep simple do it at PAGE_SIZE */
+	if (unlikely(pmd_none(*pmd))) {
+		if (unlikely(!slab_is_available())) {
+			pte = early_alloc_pgtable(PAGE_SIZE, node, 0, 0);
+			pmd_populate(&init_mm, pmd, pte);
+		} else
+			return pte_alloc_kernel(pmd, address);
+	}
+	return pte_offset_kernel(pmd, address);
+}
+
+
+
+int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, int node,
+				      struct vmem_altmap *altmap)
+{
+	unsigned long addr;
+	unsigned long next;
+	pgd_t *pgd;
+	p4d_t *p4d;
+	pud_t *pud;
+	pmd_t *pmd;
+	pte_t *pte;
+
+	for (addr = start; addr < end; addr = next) {
+		next = pmd_addr_end(addr, end);
+
+		pgd = pgd_offset_k(addr);
+		p4d = p4d_offset(pgd, addr);
+		pud = vmemmap_pud_alloc(p4d, node, addr);
+		if (!pud)
+			return -ENOMEM;
+		pmd = vmemmap_pmd_alloc(pud, node, addr);
+		if (!pmd)
+			return -ENOMEM;
+
+		if (pmd_none(READ_ONCE(*pmd))) {
+			void *p;
+
+			/*
+			 * keep it simple by checking addr PMD_SIZE alignment
+			 * and verifying the device boundary condition.
+			 * For us to use a pmd mapping, both addr and pfn should
+			 * be aligned. We skip if addr is not aligned and for
+			 * pfn we hope we have extra area in the altmap that
+			 * can help to find an aligned block. This can result
+			 * in altmap block allocation failures, in which case
+			 * we fallback to RAM for vmemmap allocation.
+			 */
+			if (altmap && (!IS_ALIGNED(addr, PMD_SIZE) ||
+				       altmap_cross_boundary(altmap, addr, PMD_SIZE))) {
+				/*
+				 * make sure we don't create altmap mappings
+				 * covering things outside the device.
+				 */
+				goto base_mapping;
+			}
+
+			p = vmemmap_alloc_block_buf(PMD_SIZE, node, altmap);
+			if (p) {
+				vmemmap_set_pmd(pmd, p, node, addr, next);
+				continue;
+			} else if (altmap) {
+				/*
+				 * A vmemmap block allocation can fail due to
+				 * alignment requirements and we trying to align
+				 * things aggressively there by running out of
+				 * space. Try base mapping on failure.
+				 */
+				goto base_mapping;
+			}
+		} else if (vmemmap_check_pmd(pmd, node, addr, next)) {
+			/*
+			 * If a huge mapping exist due to early call to
+			 * vmemmap_populate, let's try to use that.
+			 */
+			continue;
+		}
+base_mapping:
+		/*
+		 * Not able allocate higher order memory to back memmap
+		 * or we found a pointer to pte page. Allocate base page
+		 * size vmemmap
+		 */
+		pte = vmemmap_pte_alloc(pmd, node, addr);
+		if (!pte)
+			return -ENOMEM;
+
+		pte = radix__vmemmap_pte_populate(pmd, addr, node, altmap, NULL);
+		if (!pte)
+			return -ENOMEM;
+
+		vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
+		next = addr + PAGE_SIZE;
+	}
+	return 0;
+}
+
 #ifdef CONFIG_MEMORY_HOTPLUG
 void __meminit radix__vmemmap_remove_mapping(unsigned long start, unsigned long page_size)
 {
-	remove_pagetable(start, start + page_size, false);
+	remove_pagetable(start, start + page_size, true, NULL);
+}
+
+void __ref radix__vmemmap_free(unsigned long start, unsigned long end,
+			       struct vmem_altmap *altmap)
+{
+	remove_pagetable(start, end, false, altmap);
 }
 #endif
 #endif
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index fe1b83020e0d..5701faca39ef 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -92,7 +92,7 @@ static struct page * __meminit vmemmap_subsection_start(unsigned long vmemmap_ad
  * a page table lookup here because with the hash translation we don't keep
  * vmemmap details in linux page table.
  */
-static int __meminit vmemmap_populated(unsigned long vmemmap_addr, int vmemmap_map_size)
+int __meminit vmemmap_populated(unsigned long vmemmap_addr, int vmemmap_map_size)
 {
 	struct page *start;
 	unsigned long vmemmap_end = vmemmap_addr + vmemmap_map_size;
@@ -183,8 +183,8 @@ static __meminit int vmemmap_list_populate(unsigned long phys,
 	return 0;
 }
 
-static bool altmap_cross_boundary(struct vmem_altmap *altmap, unsigned long start,
-				unsigned long page_size)
+bool altmap_cross_boundary(struct vmem_altmap *altmap, unsigned long start,
+			   unsigned long page_size)
 {
 	unsigned long nr_pfn = page_size / sizeof(struct page);
 	unsigned long start_pfn = page_to_pfn((struct page *)start);
@@ -204,6 +204,11 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 	bool altmap_alloc;
 	unsigned long page_size = 1 << mmu_psize_defs[mmu_vmemmap_psize].shift;
 
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (radix_enabled())
+		return radix__vmemmap_populate(start, end, node, altmap);
+#endif
+
 	/* Align to the page size of the linear mapping. */
 	start = ALIGN_DOWN(start, page_size);
 
@@ -303,8 +308,8 @@ static unsigned long vmemmap_list_free(unsigned long start)
 	return vmem_back->phys;
 }
 
-void __ref vmemmap_free(unsigned long start, unsigned long end,
-		struct vmem_altmap *altmap)
+void __ref __vmemmap_free(unsigned long start, unsigned long end,
+			  struct vmem_altmap *altmap)
 {
 	unsigned long page_size = 1 << mmu_psize_defs[mmu_vmemmap_psize].shift;
 	unsigned long page_order = get_order(page_size);
@@ -362,6 +367,17 @@ void __ref vmemmap_free(unsigned long start, unsigned long end,
 		vmemmap_remove_mapping(start, page_size);
 	}
 }
+
+void __ref vmemmap_free(unsigned long start, unsigned long end,
+			struct vmem_altmap *altmap)
+{
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (radix_enabled())
+		return radix__vmemmap_free(start, end, altmap);
+#endif
+	return __vmemmap_free(start, end, altmap);
+}
+
 #endif
 void register_page_bootmem_memmap(unsigned long section_nr,
 				  struct page *start_page, unsigned long size)
-- 
2.40.1

