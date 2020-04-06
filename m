Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D0A19EF9D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 05:58:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wcGZ3Xx7zDr4F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 13:58:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wc465KNkzDqpg
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 13:49:42 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0363XauB138944
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 5 Apr 2020 23:49:40 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 306p7snqdp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 23:49:40 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Mon, 6 Apr 2020 04:49:17 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 6 Apr 2020 04:49:16 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0363naHk44302644
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Apr 2020 03:49:36 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5271C11C058;
 Mon,  6 Apr 2020 03:49:36 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41E1111C04A;
 Mon,  6 Apr 2020 03:49:35 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.79.179.162])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Apr 2020 03:49:35 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v0 5/5] powerpc/mm/radix: Remove split_kernel_mapping()
Date: Mon,  6 Apr 2020 09:19:25 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200406034925.22586-1-bharata@linux.ibm.com>
References: <20200406034925.22586-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20040603-0016-0000-0000-000002FF197F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040603-0017-0000-0000-00003362EE20
Message-Id: <20200406034925.22586-6-bharata@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-05_11:2020-04-03,
 2020-04-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=999 bulkscore=0 spamscore=0 suspectscore=3
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004060025
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
Cc: leonardo@linux.ibm.com, aneesh.kumar@linux.vnet.ibm.com, npiggin@gmail.com,
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With hot-plugged memory getting mapped with 2M mappings always,
there will be no need to split any mappings during unplug.

Hence remove split_kernel_mapping() and associated code. This
essentially is a revert of
commit 4dd5f8a99e791 ("powerpc/mm/radix: Split linear mapping on hot-unplug")

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 93 +++++-------------------
 1 file changed, 19 insertions(+), 74 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 0d9ef3277579..56f2c698deac 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -15,7 +15,6 @@
 #include <linux/mm.h>
 #include <linux/hugetlb.h>
 #include <linux/string_helpers.h>
-#include <linux/stop_machine.h>
 #include <linux/memory.h>
 
 #include <asm/pgtable.h>
@@ -782,30 +781,6 @@ static void free_pud_table(pud_t *pud_start, pgd_t *pgd)
 	pgd_clear(pgd);
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
-	create_physical_mapping(__pa(params->aligned_start), __pa(params->start), -1);
-	create_physical_mapping(__pa(params->end), __pa(params->aligned_end), -1);
-	spin_lock(&init_mm.page_table_lock);
-	return 0;
-}
-
 static void remove_pte_table(pte_t *pte_start, unsigned long addr,
 			     unsigned long end)
 {
@@ -834,52 +809,6 @@ static void remove_pte_table(pte_t *pte_start, unsigned long addr,
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
@@ -895,7 +824,12 @@ static void remove_pmd_table(pmd_t *pmd_start, unsigned long addr,
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
 
@@ -920,7 +854,12 @@ static void remove_pud_table(pud_t *pud_start, unsigned long addr,
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
 
@@ -946,7 +885,13 @@ static void __meminit remove_pagetable(unsigned long start, unsigned long end)
 			continue;
 
 		if (pgd_is_leaf(*pgd)) {
-			split_kernel_mapping(addr, end, PGDIR_SIZE, (pte_t *)pgd);
+			if (!IS_ALIGNED(addr, PGDIR_SIZE) ||
+			    !IS_ALIGNED(next, PGDIR_SIZE)) {
+				WARN_ONCE(1, "%s: unaligned range\n", __func__);
+				continue;
+			}
+
+			pte_clear(&init_mm, addr, (pte_t *)pgd);
 			continue;
 		}
 
-- 
2.21.0

