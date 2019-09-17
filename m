Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D92DB4E19
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 14:42:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XjRt0YcWzF400
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 22:42:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XjNY0YGpzF3HB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 22:39:24 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8HCXZ6p170296; Tue, 17 Sep 2019 08:39:09 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v0u14847s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 08:39:08 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8HCY0DA171449;
 Tue, 17 Sep 2019 08:39:05 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v0u14842a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 08:39:05 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8HCTxtQ016645;
 Tue, 17 Sep 2019 12:38:57 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 2v0t9arf41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 12:38:57 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8HCcuJ266126124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 12:38:56 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C00CC6A054;
 Tue, 17 Sep 2019 12:38:56 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 698396A04D;
 Tue, 17 Sep 2019 12:38:54 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.41.156])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 12:38:54 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au,
 dan.j.williams@intel.com
Subject: [PATCH v2] powerpc/nvdimm: Update vmemmap_populated to check
 sub-section range
Date: Tue, 17 Sep 2019 18:08:51 +0530
Message-Id: <20190917123851.22553-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170127
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
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With commit: 7cc7867fb061 ("mm/devm_memremap_pages: enable sub-section remap")
pmem namespaces are remapped in 2M chunks. On architectures like ppc64 we
can map the memmap area using 16MB hugepage size and that can cover
a memory range of 16G.

While enabling new pmem namespaces, since memory is added in sub-section chunks,
before creating a new memmap mapping, kernel should check whether there is an
existing memmap mapping covering the new pmem namespace. Currently, this is
validated by checking whether the section covering the range is already
initialized or not. Considering there can be multiple namespaces in the same
section this can result in wrong validation. Update this to check for
sub-sections in the range. This is done by checking for all pfns in the range we
are mapping.

We could optimize this by checking only just one pfn in each sub-section. But
since this is not fast-path we keep this simple.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/init_64.c | 54 +++++++++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 4e08246acd79..83d8c7122d13 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -70,31 +70,46 @@ EXPORT_SYMBOL_GPL(kernstart_addr);
 
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
 /*
- * Given an address within the vmemmap, determine the pfn of the page that
- * represents the start of the section it is within.  Note that we have to
+ * Given an address within the vmemmap, determine the page that
+ * represents the start of the subsection it is within.  Note that we have to
  * do this by hand as the proffered address may not be correctly aligned.
  * Subtraction of non-aligned pointers produces undefined results.
  */
-static unsigned long __meminit vmemmap_section_start(unsigned long page)
+static struct page * __meminit vmemmap_subsection_start(unsigned long vmemmap_addr)
 {
-	unsigned long offset = page - ((unsigned long)(vmemmap));
+	unsigned long start_pfn;
+	unsigned long offset = vmemmap_addr - ((unsigned long)(vmemmap));
 
 	/* Return the pfn of the start of the section. */
-	return (offset / sizeof(struct page)) & PAGE_SECTION_MASK;
+	start_pfn = (offset / sizeof(struct page)) & PAGE_SUBSECTION_MASK;
+	return pfn_to_page(start_pfn);
 }
 
 /*
- * Check if this vmemmap page is already initialised.  If any section
- * which overlaps this vmemmap page is initialised then this page is
- * initialised already.
+ * Since memory is added in sub-section chunks, before creating a new vmemmap
+ * mapping, the kernel should check whether there is an existing memmap mapping
+ * covering the new subsection added. This is needed because kernel can map
+ * vmemmap area using 16MB pages which will cover a memory range of 16G. Such
+ * a range covers multiple subsections (2M)
+ *
+ * If any subsection in the 16G range mapped by vmemmap is valid we consider the
+ * vmemmap populated (There is a page table entry already present). We can't do
+ * a page table lookup here because with the hash translation we don't keep
+ * vmemmap details in linux page table.
  */
-static int __meminit vmemmap_populated(unsigned long start, int page_size)
+static int __meminit vmemmap_populated(unsigned long vmemmap_addr, int vmemmap_map_size)
 {
-	unsigned long end = start + page_size;
-	start = (unsigned long)(pfn_to_page(vmemmap_section_start(start)));
+	struct page *start;
+	unsigned long vmemmap_end = vmemmap_addr + vmemmap_map_size;
+	start = vmemmap_subsection_start(vmemmap_addr);
 
-	for (; start < end; start += (PAGES_PER_SECTION * sizeof(struct page)))
-		if (pfn_valid(page_to_pfn((struct page *)start)))
+	for (; (unsigned long)start < vmemmap_end; start += PAGES_PER_SUBSECTION)
+		/*
+		 * pfn valid check here is intended to really check
+		 * whether we have any subsection already initialized
+		 * in this range.
+		 */
+		if (pfn_valid(page_to_pfn(start)))
 			return 1;
 
 	return 0;
@@ -201,6 +216,12 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 		void *p = NULL;
 		int rc;
 
+		/*
+		 * This vmemmap range is backing different subsections. If any
+		 * of that subsection is marked valid, that means we already
+		 * have initialized a page table covering this range and hence
+		 * the vmemmap range is populated.
+		 */
 		if (vmemmap_populated(start, page_size))
 			continue;
 
@@ -290,9 +311,10 @@ void __ref vmemmap_free(unsigned long start, unsigned long end,
 		struct page *page;
 
 		/*
-		 * the section has already be marked as invalid, so
-		 * vmemmap_populated() true means some other sections still
-		 * in this page, so skip it.
+		 * We have already marked the subsection we are trying to remove
+		 * invalid. So if we want to remove the vmemmap range, we
+		 * need to make sure there is no subsection marked valid
+		 * in this range.
 		 */
 		if (vmemmap_populated(start, page_size))
 			continue;
-- 
2.21.0

