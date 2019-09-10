Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2396AE3BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 08:31:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SFXf0J6jzDqVk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 16:30:58 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SFVs1R72zDqT5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 16:29:24 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8A6T3qg046927; Tue, 10 Sep 2019 02:29:12 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ux6hc852q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Sep 2019 02:29:12 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8A6T8pR047682;
 Tue, 10 Sep 2019 02:29:08 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ux6hc84tm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Sep 2019 02:29:06 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8A6RKFm011447;
 Tue, 10 Sep 2019 06:28:43 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 2uv4670m6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Sep 2019 06:28:43 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8A6Sg2B36241826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 06:28:42 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55D30BE04F;
 Tue, 10 Sep 2019 06:28:42 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA354BE053;
 Tue, 10 Sep 2019 06:28:39 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.41.80])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 10 Sep 2019 06:28:39 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: dan.j.williams@intel.com, mpe@ellerman.id.au, oohall@gmail.com
Subject: [PATCH 2/2] powerpc/nvdimm: Update vmemmap_populated to check
 sub-section range
Date: Tue, 10 Sep 2019 11:58:26 +0530
Message-Id: <20190910062826.10041-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910062826.10041-1-aneesh.kumar@linux.ibm.com>
References: <20190910062826.10041-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-10_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909100063
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
 linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
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
 arch/powerpc/mm/init_64.c | 45 ++++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 4e08246acd79..7710ccdc19a2 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -70,30 +70,24 @@ EXPORT_SYMBOL_GPL(kernstart_addr);
 
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
 /*
- * Given an address within the vmemmap, determine the pfn of the page that
- * represents the start of the section it is within.  Note that we have to
- * do this by hand as the proffered address may not be correctly aligned.
- * Subtraction of non-aligned pointers produces undefined results.
- */
-static unsigned long __meminit vmemmap_section_start(unsigned long page)
-{
-	unsigned long offset = page - ((unsigned long)(vmemmap));
-
-	/* Return the pfn of the start of the section. */
-	return (offset / sizeof(struct page)) & PAGE_SECTION_MASK;
-}
-
-/*
- * Check if this vmemmap page is already initialised.  If any section
+ * Check if this vmemmap page is already initialised.  If any sub section
  * which overlaps this vmemmap page is initialised then this page is
  * initialised already.
  */
-static int __meminit vmemmap_populated(unsigned long start, int page_size)
+
+static int __meminit vmemmap_populated(unsigned long start, int size)
 {
-	unsigned long end = start + page_size;
-	start = (unsigned long)(pfn_to_page(vmemmap_section_start(start)));
+	unsigned long end = start + size;
 
-	for (; start < end; start += (PAGES_PER_SECTION * sizeof(struct page)))
+	/* start is size aligned and it is always > sizeof(struct page) */
+	VM_BUG_ON(start & sizeof(struct page));
+	for (; start < end; start += sizeof(struct page))
+		/*
+		 * pfn valid check here is intended to really check
+		 * whether we have any subsection already initialized
+		 * in this range. We keep it simple by checking every
+		 * pfn in the range.
+		 */
 		if (pfn_valid(page_to_pfn((struct page *)start)))
 			return 1;
 
@@ -201,6 +195,12 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
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
 
@@ -290,9 +290,10 @@ void __ref vmemmap_free(unsigned long start, unsigned long end,
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

