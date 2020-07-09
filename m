Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F3921A0E6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 15:30:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2cVJ5cyKzDqT4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 23:30:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2cGY2f97zDr6t
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 23:19:49 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 069D2Und010170; Thu, 9 Jul 2020 09:19:44 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 325n5xqu5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 09:19:44 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 069DFVrA022087;
 Thu, 9 Jul 2020 13:19:43 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 325k1mr17g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 13:19:43 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 069DJdFS31588672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 13:19:39 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36CB213604F;
 Thu,  9 Jul 2020 13:19:42 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B75A7136051;
 Thu,  9 Jul 2020 13:19:40 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.62.107])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jul 2020 13:19:40 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 3/4] powerpc/mm/radix: Remove split_kernel_mapping()
Date: Thu,  9 Jul 2020 18:49:24 +0530
Message-Id: <20200709131925.922266-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200709131925.922266-1-aneesh.kumar@linux.ibm.com>
References: <20200709131925.922266-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-09_07:2020-07-09,
 2020-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=2 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 spamscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007090097
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bharata B Rao <bharata@linux.ibm.com>

We split the page table mapping on memory unplug if the
linear range was mapped with huge page mapping (for ex: 1G)
The page table splitting code has a few issues:

1. Recursive locking
--------------------
Memory unplug path takes cpu_hotplug_lock and calls stop_machine()
for splitting the mappings. However stop_machine() takes
cpu_hotplug_lock again causing deadlock.

2. BUG: sleeping function called from in_atomic() context
---------------------------------------------------------
Memory unplug path (remove_pagetable) takes init_mm.page_table_lock
spinlock and later calls stop_machine() which does wait_for_completion()

3. Bad unlock unbalance
-----------------------
Memory unplug path takes init_mm.page_table_lock spinlock and calls
stop_machine(). The stop_machine thread function runs in a different
thread context (migration thread) which tries to release and reaquire
ptl. Releasing ptl from a different thread than which acquired it
causes bad unlock unbalance.

These problems can be avoided if we avoid mapping hot-plugged memory
with 1G mapping, thereby removing the need for splitting them during
unplug. The kernel always make sure the minimum unplug request is
SUBSECTION_SIZE for device memory and SECTION_SIZE for regular memory.

In preparation for such a change remove page table splitting support.

This essentially is a revert of
commit 4dd5f8a99e791 ("powerpc/mm/radix: Split linear mapping on hot-unplug")

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 95 +++++-------------------
 1 file changed, 19 insertions(+), 76 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 46ad2da3087a..d5a01b9aadc9 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -15,7 +15,6 @@
 #include <linux/mm.h>
 #include <linux/hugetlb.h>
 #include <linux/string_helpers.h>
-#include <linux/stop_machine.h>
 
 #include <asm/pgalloc.h>
 #include <asm/mmu_context.h>
@@ -722,32 +721,6 @@ static void free_pud_table(pud_t *pud_start, p4d_t *p4d)
 	p4d_clear(p4d);
 }
 
-struct change_mapping_params {
-	pte_t *pte;
-	unsigned long start;
-	unsigned long end;
-	unsigned long aligned_start;
-	unsigned long aligned_end;
-};
-
-static int __meminit stop_machine_change_mapping(void *data)
-{
-	struct change_mapping_params *params =
-			(struct change_mapping_params *)data;
-
-	if (!data)
-		return -1;
-
-	spin_unlock(&init_mm.page_table_lock);
-	pte_clear(&init_mm, params->aligned_start, params->pte);
-	create_physical_mapping(__pa(params->aligned_start),
-				__pa(params->start), -1, PAGE_KERNEL);
-	create_physical_mapping(__pa(params->end), __pa(params->aligned_end),
-				-1, PAGE_KERNEL);
-	spin_lock(&init_mm.page_table_lock);
-	return 0;
-}
-
 static void remove_pte_table(pte_t *pte_start, unsigned long addr,
 			     unsigned long end)
 {
@@ -776,52 +749,6 @@ static void remove_pte_table(pte_t *pte_start, unsigned long addr,
 	}
 }
 
-/*
- * clear the pte and potentially split the mapping helper
- */
-static void __meminit split_kernel_mapping(unsigned long addr, unsigned long end,
-				unsigned long size, pte_t *pte)
-{
-	unsigned long mask = ~(size - 1);
-	unsigned long aligned_start = addr & mask;
-	unsigned long aligned_end = addr + size;
-	struct change_mapping_params params;
-	bool split_region = false;
-
-	if ((end - addr) < size) {
-		/*
-		 * We're going to clear the PTE, but not flushed
-		 * the mapping, time to remap and flush. The
-		 * effects if visible outside the processor or
-		 * if we are running in code close to the
-		 * mapping we cleared, we are in trouble.
-		 */
-		if (overlaps_kernel_text(aligned_start, addr) ||
-			overlaps_kernel_text(end, aligned_end)) {
-			/*
-			 * Hack, just return, don't pte_clear
-			 */
-			WARN_ONCE(1, "Linear mapping %lx->%lx overlaps kernel "
-				  "text, not splitting\n", addr, end);
-			return;
-		}
-		split_region = true;
-	}
-
-	if (split_region) {
-		params.pte = pte;
-		params.start = addr;
-		params.end = end;
-		params.aligned_start = addr & ~(size - 1);
-		params.aligned_end = min_t(unsigned long, aligned_end,
-				(unsigned long)__va(memblock_end_of_DRAM()));
-		stop_machine(stop_machine_change_mapping, &params, NULL);
-		return;
-	}
-
-	pte_clear(&init_mm, addr, pte);
-}
-
 static void remove_pmd_table(pmd_t *pmd_start, unsigned long addr,
 			     unsigned long end)
 {
@@ -837,7 +764,12 @@ static void remove_pmd_table(pmd_t *pmd_start, unsigned long addr,
 			continue;
 
 		if (pmd_is_leaf(*pmd)) {
-			split_kernel_mapping(addr, end, PMD_SIZE, (pte_t *)pmd);
+			if (!IS_ALIGNED(addr, PMD_SIZE) ||
+			    !IS_ALIGNED(next, PMD_SIZE)) {
+				WARN_ONCE(1, "%s: unaligned range\n", __func__);
+				continue;
+			}
+			pte_clear(&init_mm, addr, (pte_t *)pmd);
 			continue;
 		}
 
@@ -862,7 +794,12 @@ static void remove_pud_table(pud_t *pud_start, unsigned long addr,
 			continue;
 
 		if (pud_is_leaf(*pud)) {
-			split_kernel_mapping(addr, end, PUD_SIZE, (pte_t *)pud);
+			if (!IS_ALIGNED(addr, PUD_SIZE) ||
+			    !IS_ALIGNED(next, PUD_SIZE)) {
+				WARN_ONCE(1, "%s: unaligned range\n", __func__);
+				continue;
+			}
+			pte_clear(&init_mm, addr, (pte_t *)pud);
 			continue;
 		}
 
@@ -890,7 +827,13 @@ static void __meminit remove_pagetable(unsigned long start, unsigned long end)
 			continue;
 
 		if (p4d_is_leaf(*p4d)) {
-			split_kernel_mapping(addr, end, P4D_SIZE, (pte_t *)p4d);
+			if (!IS_ALIGNED(addr, P4D_SIZE) ||
+			    !IS_ALIGNED(next, P4D_SIZE)) {
+				WARN_ONCE(1, "%s: unaligned range\n", __func__);
+				continue;
+			}
+
+			pte_clear(&init_mm, addr, (pte_t *)pgd);
 			continue;
 		}
 
-- 
2.26.2

