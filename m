Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C9D732FB8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 13:21:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H8PCBWz1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjGvD31d1z3cTR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:21:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H8PCBWz1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjGfq3FVqz3c2r
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 21:10:43 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35GB89Qj015550;
	Fri, 16 Jun 2023 11:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WEhl9BlLPzmq+efvwpqyCzmDovFQwSils+63Z9z9AmY=;
 b=H8PCBWz1MuXGcJCfl/P2EpbD5PA960goxF6h+WOLDqBRL1RRp4a/Fkyu9zEOQdnDHt9V
 QVevji5LoC8O2Pp4E+25Rgu+oDAbR/ew7khkfiFp7ZVQ5QeNK+Vj85Mc55oS2pWdzk2p
 TUYxszk6ihCFNYJvFDHE3esbNUoP+Q9J45mvL/alzCo4phHjuBurVB/pKIlSOw2cTjBf
 H+8ANCfp5graGMESMRccrm3z5G0eEGBQgp+AEkls4x+AxnYnPVBQg53SpSH9Nu6p3jw1
 vmZyBsRZNDg8rVl2bHba4aoB1dzY6BjOO8ZJlcgODXdmo6Hx5tA7Jy6nCFZO3ZTchfN9 ew== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8p9m8b00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 11:10:26 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35GB9WPo020221;
	Fri, 16 Jun 2023 11:10:25 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8p9m8aym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 11:10:25 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35G8vEu8012044;
	Fri, 16 Jun 2023 11:10:24 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3r4gt6s37x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 11:10:24 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35GBANhu36242142
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jun 2023 11:10:23 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 25ABB5805D;
	Fri, 16 Jun 2023 11:10:23 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C9E258059;
	Fri, 16 Jun 2023 11:10:17 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.52.24])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jun 2023 11:10:16 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v2 15/16] powerpc/book3s64/radix: Add support for vmemmap optimization for radix
Date: Fri, 16 Jun 2023 16:38:25 +0530
Message-Id: <20230616110826.344417-16-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
References: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xJJVcIDsEMLH2maCfqpkSczvf5cJZrdd
X-Proofpoint-ORIG-GUID: ZObC27QUMOBmiQVGplfYRc_seUr5PVGZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_07,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

With 2M PMD-level mapping, we require 32 struct pages and a single vmemmap
page can contain 1024 struct pages (PAGE_SIZE/sizeof(struct page)). Hence
with 64K page size, we don't use vmemmap deduplication for PMD-level
mapping.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 Documentation/mm/vmemmap_dedup.rst         |   1 +
 Documentation/powerpc/index.rst            |   1 +
 Documentation/powerpc/vmemmap_dedup.rst    | 101 ++++++++++
 arch/powerpc/Kconfig                       |   1 +
 arch/powerpc/include/asm/book3s/64/radix.h |   8 +
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 203 +++++++++++++++++++++
 6 files changed, 315 insertions(+)
 create mode 100644 Documentation/powerpc/vmemmap_dedup.rst

diff --git a/Documentation/mm/vmemmap_dedup.rst b/Documentation/mm/vmemmap_dedup.rst
index a4b12ff906c4..c573e08b5043 100644
--- a/Documentation/mm/vmemmap_dedup.rst
+++ b/Documentation/mm/vmemmap_dedup.rst
@@ -210,6 +210,7 @@ the device (altmap).
 
 The following page sizes are supported in DAX: PAGE_SIZE (4K on x86_64),
 PMD_SIZE (2M on x86_64) and PUD_SIZE (1G on x86_64).
+For powerpc equivalent details see Documentation/powerpc/vmemmap_dedup.rst
 
 The differences with HugeTLB are relatively minor.
 
diff --git a/Documentation/powerpc/index.rst b/Documentation/powerpc/index.rst
index 85e80e30160b..1b7d943ae8f3 100644
--- a/Documentation/powerpc/index.rst
+++ b/Documentation/powerpc/index.rst
@@ -35,6 +35,7 @@ powerpc
     ultravisor
     vas-api
     vcpudispatch_stats
+    vmemmap_dedup
 
     features
 
diff --git a/Documentation/powerpc/vmemmap_dedup.rst b/Documentation/powerpc/vmemmap_dedup.rst
new file mode 100644
index 000000000000..dc4db59fdf87
--- /dev/null
+++ b/Documentation/powerpc/vmemmap_dedup.rst
@@ -0,0 +1,101 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========
+Device DAX
+==========
+
+The device-dax interface uses the tail deduplication technique explained in
+Documentation/mm/vmemmap_dedup.rst
+
+On powerpc, vmemmap deduplication is only used with radix MMU translation. Also
+with a 64K page size, only the devdax namespace with 1G alignment uses vmemmap
+deduplication.
+
+With 2M PMD level mapping, we require 32 struct pages and a single 64K vmemmap
+page can contain 1024 struct pages (64K/sizeof(struct page)). Hence there is no
+vmemmap deduplication possible.
+
+With 1G PUD level mapping, we require 16384 struct pages and a single 64K
+vmemmap page can contain 1024 struct pages (64K/sizeof(struct page)). Hence we
+require 16 64K pages in vmemmap to map the struct page for 1G PUD level mapping.
+
+Here's how things look like on device-dax after the sections are populated::
+ +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
+ |           |                     |     0     | -------------> |     0     |
+ |           |                     +-----------+                +-----------+
+ |           |                     |     1     | -------------> |     1     |
+ |           |                     +-----------+                +-----------+
+ |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
+ |           |                     +-----------+                   | | | | |
+ |           |                     |     3     | ------------------+ | | | |
+ |           |                     +-----------+                     | | | |
+ |           |                     |     4     | --------------------+ | | |
+ |    PUD    |                     +-----------+                       | | |
+ |   level   |                     |     .     | ----------------------+ | |
+ |  mapping  |                     +-----------+                         | |
+ |           |                     |     .     | ------------------------+ |
+ |           |                     +-----------+                           |
+ |           |                     |     15    | --------------------------+
+ |           |                     +-----------+
+ |           |
+ |           |
+ |           |
+ +-----------+
+
+
+With 4K page size, 2M PMD level mapping requires 512 struct pages and a single
+4K vmemmap page contains 64 struct pages(4K/sizeof(struct page)). Hence we
+require 8 4K pages in vmemmap to map the struct page for 2M pmd level mapping.
+
+Here's how things look like on device-dax after the sections are populated::
+
+ +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
+ |           |                     |     0     | -------------> |     0     |
+ |           |                     +-----------+                +-----------+
+ |           |                     |     1     | -------------> |     1     |
+ |           |                     +-----------+                +-----------+
+ |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
+ |           |                     +-----------+                   | | | | |
+ |           |                     |     3     | ------------------+ | | | |
+ |           |                     +-----------+                     | | | |
+ |           |                     |     4     | --------------------+ | | |
+ |    PMD    |                     +-----------+                       | | |
+ |   level   |                     |     5     | ----------------------+ | |
+ |  mapping  |                     +-----------+                         | |
+ |           |                     |     6     | ------------------------+ |
+ |           |                     +-----------+                           |
+ |           |                     |     7     | --------------------------+
+ |           |                     +-----------+
+ |           |
+ |           |
+ |           |
+ +-----------+
+
+With 1G PUD level mapping, we require 262144 struct pages and a single 4K
+vmemmap page can contain 64 struct pages (4K/sizeof(struct page)). Hence we
+require 4096 4K pages in vmemmap to map the struct pages for 1G PUD level
+mapping.
+
+Here's how things look like on device-dax after the sections are populated::
+
+ +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
+ |           |                     |     0     | -------------> |     0     |
+ |           |                     +-----------+                +-----------+
+ |           |                     |     1     | -------------> |     1     |
+ |           |                     +-----------+                +-----------+
+ |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
+ |           |                     +-----------+                   | | | | |
+ |           |                     |     3     | ------------------+ | | | |
+ |           |                     +-----------+                     | | | |
+ |           |                     |     4     | --------------------+ | | |
+ |    PUD    |                     +-----------+                       | | |
+ |   level   |                     |     .     | ----------------------+ | |
+ |  mapping  |                     +-----------+                         | |
+ |           |                     |     .     | ------------------------+ |
+ |           |                     +-----------+                           |
+ |           |                     |   4095    | --------------------------+
+ |           |                     +-----------+
+ |           |
+ |           |
+ |           |
+ +-----------+
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index bff5820b7cda..6bd9ca6f2448 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -175,6 +175,7 @@ config PPC
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	select ARCH_WANT_LD_ORPHAN_WARN
+	select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP	if PPC_RADIX_MMU
 	select ARCH_WANTS_MODULES_DATA_IN_VMALLOC	if PPC_BOOK3S_32 || PPC_8xx
 	select ARCH_WEAK_RELEASE_ACQUIRE
 	select BINFMT_ELF
diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index 87d4c1e62491..3195f268ed7f 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -364,5 +364,13 @@ int radix__remove_section_mapping(unsigned long start, unsigned long end);
 
 void radix__kernel_map_pages(struct page *page, int numpages, int enable);
 
+#define vmemmap_can_optimize vmemmap_can_optimize
+bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
+
+#define vmemmap_populate_compound_pages vmemmap_populate_compound_pages
+int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
+					      unsigned long start,
+					      unsigned long end, int node,
+					      struct dev_pagemap *pgmap);
 #endif /* __ASSEMBLY__ */
 #endif
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index ef886fab643d..f0527eebe012 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -977,6 +977,15 @@ int __meminit radix__vmemmap_create_mapping(unsigned long start,
 	return 0;
 }
 
+
+bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
+{
+	if (radix_enabled())
+		return __vmemmap_can_optimize(altmap, pgmap);
+
+	return false;
+}
+
 int __meminit vmemmap_check_pmd(pmd_t *pmd, int node,
 				unsigned long addr, unsigned long next)
 {
@@ -1185,6 +1194,200 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	return 0;
 }
 
+static pte_t * __meminit radix__vmemmap_populate_address(unsigned long addr, int node,
+							 struct vmem_altmap *altmap,
+							 struct page *reuse)
+{
+	pgd_t *pgd;
+	p4d_t *p4d;
+	pud_t *pud;
+	pmd_t *pmd;
+	pte_t *pte;
+
+	pgd = pgd_offset_k(addr);
+	p4d = p4d_offset(pgd, addr);
+	pud = vmemmap_pud_alloc(p4d, node, addr);
+	if (!pud)
+		return NULL;
+	pmd = vmemmap_pmd_alloc(pud, node, addr);
+	if (!pmd)
+		return NULL;
+	if (pmd_leaf(*pmd))
+		/*
+		 * The second page is mapped as a hugepage due to a nearby request.
+		 * Force our mapping to page size without deduplication
+		 */
+		return NULL;
+	pte = vmemmap_pte_alloc(pmd, node, addr);
+	if (!pte)
+		return NULL;
+	radix__vmemmap_pte_populate(pmd, addr, node, NULL, NULL);
+	vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
+
+	return pte;
+}
+
+static pte_t * __meminit vmemmap_compound_tail_page(unsigned long addr,
+						    unsigned long pfn_offset, int node)
+{
+	pgd_t *pgd;
+	p4d_t *p4d;
+	pud_t *pud;
+	pmd_t *pmd;
+	pte_t *pte;
+	unsigned long map_addr;
+
+	/* the second vmemmap page which we use for duplication */
+	map_addr = addr - pfn_offset * sizeof(struct page) + PAGE_SIZE;
+	pgd = pgd_offset_k(map_addr);
+	p4d = p4d_offset(pgd, map_addr);
+	pud = vmemmap_pud_alloc(p4d, node, map_addr);
+	if (!pud)
+		return NULL;
+	pmd = vmemmap_pmd_alloc(pud, node, map_addr);
+	if (!pmd)
+		return NULL;
+	if (pmd_leaf(*pmd))
+		/*
+		 * The second page is mapped as a hugepage due to a nearby request.
+		 * Force our mapping to page size without deduplication
+		 */
+		return NULL;
+	pte = vmemmap_pte_alloc(pmd, node, map_addr);
+	if (!pte)
+		return NULL;
+	/*
+	 * Check if there exist a mapping to the left
+	 */
+	if (pte_none(*pte)) {
+		/*
+		 * Populate the head page vmemmap page.
+		 * It can fall in different pmd, hence
+		 * vmemmap_populate_address()
+		 */
+		pte = radix__vmemmap_populate_address(map_addr - PAGE_SIZE, node, NULL, NULL);
+		if (!pte)
+			return NULL;
+		/*
+		 * Populate the tail pages vmemmap page
+		 */
+		pte = radix__vmemmap_pte_populate(pmd, map_addr, node, NULL, NULL);
+		if (!pte)
+			return NULL;
+		vmemmap_verify(pte, node, map_addr, map_addr + PAGE_SIZE);
+		return pte;
+	}
+	return pte;
+}
+
+int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
+					      unsigned long start,
+					      unsigned long end, int node,
+					      struct dev_pagemap *pgmap)
+{
+	/*
+	 * we want to map things as base page size mapping so that
+	 * we can save space in vmemmap. We could have huge mapping
+	 * covering out both edges.
+	 */
+	unsigned long addr;
+	unsigned long addr_pfn = start_pfn;
+	unsigned long next;
+	pgd_t *pgd;
+	p4d_t *p4d;
+	pud_t *pud;
+	pmd_t *pmd;
+	pte_t *pte;
+
+	for (addr = start; addr < end; addr = next) {
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
+		if (pmd_leaf(READ_ONCE(*pmd))) {
+			/* existing huge mapping. Skip the range */
+			addr_pfn += (PMD_SIZE >> PAGE_SHIFT);
+			next = pmd_addr_end(addr, end);
+			continue;
+		}
+		pte = vmemmap_pte_alloc(pmd, node, addr);
+		if (!pte)
+			return -ENOMEM;
+		if (!pte_none(*pte)) {
+			/*
+			 * This could be because we already have a compound
+			 * page whose VMEMMAP_RESERVE_NR pages were mapped and
+			 * this request fall in those pages.
+			 */
+			addr_pfn += 1;
+			next = addr + PAGE_SIZE;
+			continue;
+		} else {
+			unsigned long nr_pages = pgmap_vmemmap_nr(pgmap);
+			unsigned long pfn_offset = addr_pfn - ALIGN_DOWN(addr_pfn, nr_pages);
+			pte_t *tail_page_pte;
+
+			/*
+			 * if the address is aligned to huge page size it is the
+			 * head mapping.
+			 */
+			if (pfn_offset == 0) {
+				/* Populate the head page vmemmap page */
+				pte = radix__vmemmap_pte_populate(pmd, addr, node, NULL, NULL);
+				if (!pte)
+					return -ENOMEM;
+				vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
+
+				/*
+				 * Populate the tail pages vmemmap page
+				 * It can fall in different pmd, hence
+				 * vmemmap_populate_address()
+				 */
+				pte = radix__vmemmap_populate_address(addr + PAGE_SIZE, node, NULL, NULL);
+				if (!pte)
+					return -ENOMEM;
+
+				addr_pfn += 2;
+				next = addr + 2 * PAGE_SIZE;
+				continue;
+			}
+			/*
+			 * get the 2nd mapping details
+			 * Also create it if that doesn't exist
+			 */
+			tail_page_pte = vmemmap_compound_tail_page(addr, pfn_offset, node);
+			if (!tail_page_pte) {
+
+				pte = radix__vmemmap_pte_populate(pmd, addr, node, NULL, NULL);
+				if (!pte)
+					return -ENOMEM;
+				vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
+
+				addr_pfn += 1;
+				next = addr + PAGE_SIZE;
+				continue;
+			}
+
+			pte = radix__vmemmap_pte_populate(pmd, addr, node, NULL, pte_page(*tail_page_pte));
+			if (!pte)
+				return -ENOMEM;
+			vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
+
+			addr_pfn += 1;
+			next = addr + PAGE_SIZE;
+			continue;
+		}
+	}
+	return 0;
+}
+
+
 #ifdef CONFIG_MEMORY_HOTPLUG
 void __meminit radix__vmemmap_remove_mapping(unsigned long start, unsigned long page_size)
 {
-- 
2.40.1

