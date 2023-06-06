Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD4C72369E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 07:09:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZz6Z1tbGz3g2Q
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 15:09:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gvVKuNxZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gvVKuNxZ;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZysV05Hvz3f5l
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 14:58:05 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3564kEsw025655;
	Tue, 6 Jun 2023 04:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4s5EebXvRJIHA6/DS8tyK82oUUV+GvDXeQvgvJse3tY=;
 b=gvVKuNxZpRLHEXLZRn3Xjt0W6kLmKu25hVufAuxbDTUIGYTmqQPIDuhbWf3/jdp36h9R
 Hdto35pLkq25LtcO7RvG09oz8QiOWa6VW2w8jGRFukkson56Va283yIMzRcPSbFLmQ4W
 gMCS6MTNgusCM/HUuaSLA0T3Uu4uhih89o9FzZGkN3GYWbjSQ2FU2vh/VDu70Su3HJKE
 eVT15JlMrJhqBNJ4XebGxunh5T9SYW+7pZdT/qOgptC4zcqm9SSUR3UMYBg83GpcPnPy
 rulAXgrh7JakPmJOf68Cke3F/fBHIze61HSWUfFruWh9fZMgopiuHsPT4Kz8OyzzAdDy Ng== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r1x2n054d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 04:57:47 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3564o8Mb003182;
	Tue, 6 Jun 2023 04:57:47 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r1x2n0546-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 04:57:47 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3560xMTW012367;
	Tue, 6 Jun 2023 04:57:46 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
	by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3qyxend6bn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 04:57:46 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3564vjPZ20578570
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jun 2023 04:57:45 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39CF158067;
	Tue,  6 Jun 2023 04:57:45 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34A185804B;
	Tue,  6 Jun 2023 04:57:40 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.204.255])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Jun 2023 04:57:39 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 14/16] powerpc/book3s64/vmemmap: Switch radix to use a different vmemmap handling function
Date: Tue,  6 Jun 2023 10:26:06 +0530
Message-Id: <20230606045608.55127-15-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606045608.55127-1-aneesh.kumar@linux.ibm.com>
References: <20230606045608.55127-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KEyMVR5G0I6uKHCPydjbsgYthpJUOyYm
X-Proofpoint-ORIG-GUID: YY51vxGrhYls_JzlLZAVCLKMRXzkyykN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_02,2023-06-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060040
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
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is in preparation to update radix to implement vmemmap optimization for
devdax. Below are the rules w.r.t radix vmemmap mapping

1. First try to map things using PMD (2M)
2. With altmap if altmap cross-boundary check returns true, fall back to PAGE_SIZE
3. IF we can't allocate PMD_SIZE backing memory for vmemmap, fallback to PAGE_SIZE

On removing vmemmap mapping, check if every subsection that is using the vmemmap
area is invalid. If found to be invalid, that implies we can safely free the
vmemmap area. We don't use the PAGE_UNUSED pattern used by x86 because with 64K
page size, we need to do the above check even at the PAGE_SIZE granularity.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/radix.h |   2 +
 arch/powerpc/include/asm/pgtable.h         |   3 +
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 293 +++++++++++++++++++--
 arch/powerpc/mm/init_64.c                  |  26 +-
 4 files changed, 293 insertions(+), 31 deletions(-)

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
index d7e2dd3d4add..65de8630abcb 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -742,8 +742,57 @@ static void free_pud_table(pud_t *pud_start, p4d_t *p4d)
 	p4d_clear(p4d);
 }
 
+static bool __meminit vmemmap_pmd_is_unused(unsigned long addr, unsigned long end)
+{
+	unsigned long start = ALIGN_DOWN(addr, PMD_SIZE);
+
+	return vmemmap_populated(start, PMD_SIZE);
+}
+
+static bool __meminit vmemmap_page_is_unused(unsigned long addr, unsigned long end)
+{
+	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
+
+	return vmemmap_populated(start, PAGE_SIZE);
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
@@ -924,10 +977,198 @@ int __meminit radix__vmemmap_create_mapping(unsigned long start,
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
+			p = vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
+			if (!p)
+				return NULL;
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
+		if (pmd_none(READ_ONCE(*pmd))) {
+			void *p;
+
+			if (altmap && altmap_cross_boundary(altmap, start, PMD_SIZE)) {
+				/* make sure we don't create altmap mappings covery things outside. */
+				goto base_mapping;
+
+			}
+
+			p = vmemmap_alloc_block_buf(PMD_SIZE, node, altmap);
+			if (p) {
+				vmemmap_set_pmd(pmd, p, node, addr, next);
+				continue;
+			} else if (altmap) {
+				/*
+				 * No fallback: In any case we care about, the
+				 * altmap should be reasonably sized and aligned
+				 * such that vmemmap_alloc_block_buf() will always
+				 * succeed. For consistency with the PTE case,
+				 * return an error here as failure could indicate
+				 * a configuration issue with the size of the altmap.
+				 */
+				return -ENOMEM;
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

