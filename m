Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D214B22E9A8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 11:59:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFZyZ37N8zDrS7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 19:59:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFZwp2bjWzF0bG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 19:57:30 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06R9i0dY035201; Mon, 27 Jul 2020 05:57:23 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32hvj00b1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 05:57:23 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06R9t3w7018801;
 Mon, 27 Jul 2020 09:57:21 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 32gcy4j2by-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 09:57:20 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06R9vIbY27525458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 09:57:18 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B8954C046;
 Mon, 27 Jul 2020 09:57:18 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE1034C044;
 Mon, 27 Jul 2020 09:57:16 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.85.68.234])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Jul 2020 09:57:16 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/mm: Limit resize_hpt_for_hotplug() call to hash
 guests only
Date: Mon, 27 Jul 2020 15:27:04 +0530
Message-Id: <20200727095704.1432916-1-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_06:2020-07-27,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=1
 priorityscore=1501 spamscore=0 mlxscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270069
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
Cc: Bharata B Rao <bharata@linux.ibm.com>, aneesh.kumar@linux.ibm.com,
 david@gibson.dropbear.id.au, Nathan Lynch <nathanl@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

During memory hotplug and unplug, resize_hpt_for_hotplug() gets called
for both hash and radix guests but it should be called only for hash
guests. Though the call does nothing in the radix guest case, it is
cleaner to push this call into hash specific memory hotplug routines.

Reported-by: Nathan Lynch <nathanl@linux.ibm.com>
Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
Tested with memory hotplug and unplug for hash and radix KVM guests.

 arch/powerpc/include/asm/sparsemem.h  | 6 ------
 arch/powerpc/mm/book3s64/hash_utils.c | 8 +++++++-
 arch/powerpc/mm/mem.c                 | 5 -----
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/sparsemem.h b/arch/powerpc/include/asm/sparsemem.h
index c89b32443cff..1e6fa371cc38 100644
--- a/arch/powerpc/include/asm/sparsemem.h
+++ b/arch/powerpc/include/asm/sparsemem.h
@@ -17,12 +17,6 @@ extern int create_section_mapping(unsigned long start, unsigned long end,
 				  int nid, pgprot_t prot);
 extern int remove_section_mapping(unsigned long start, unsigned long end);
 
-#ifdef CONFIG_PPC_BOOK3S_64
-extern int resize_hpt_for_hotplug(unsigned long new_mem_size);
-#else
-static inline int resize_hpt_for_hotplug(unsigned long new_mem_size) { return 0; }
-#endif
-
 #ifdef CONFIG_NUMA
 extern int hot_add_scn_to_nid(unsigned long scn_addr);
 #else
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 9fdabea04990..30a4a91d9987 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -785,7 +785,7 @@ static unsigned long __init htab_get_table_size(void)
 }
 
 #ifdef CONFIG_MEMORY_HOTPLUG
-int resize_hpt_for_hotplug(unsigned long new_mem_size)
+static int resize_hpt_for_hotplug(unsigned long new_mem_size)
 {
 	unsigned target_hpt_shift;
 
@@ -819,6 +819,8 @@ int hash__create_section_mapping(unsigned long start, unsigned long end,
 		return -1;
 	}
 
+	resize_hpt_for_hotplug(memblock_phys_mem_size());
+
 	rc = htab_bolt_mapping(start, end, __pa(start),
 			       pgprot_val(prot), mmu_linear_psize,
 			       mmu_kernel_ssize);
@@ -836,6 +838,10 @@ int hash__remove_section_mapping(unsigned long start, unsigned long end)
 	int rc = htab_remove_mapping(start, end, mmu_linear_psize,
 				     mmu_kernel_ssize);
 	WARN_ON(rc < 0);
+
+	if (resize_hpt_for_hotplug(memblock_phys_mem_size()) == -ENOSPC)
+		pr_warn("Hash collision while resizing HPT\n");
+
 	return rc;
 }
 #endif /* CONFIG_MEMORY_HOTPLUG */
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index c2c11eb8dcfc..9dafc636588f 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -127,8 +127,6 @@ int __ref arch_add_memory(int nid, u64 start, u64 size,
 	unsigned long nr_pages = size >> PAGE_SHIFT;
 	int rc;
 
-	resize_hpt_for_hotplug(memblock_phys_mem_size());
-
 	start = (unsigned long)__va(start);
 	rc = create_section_mapping(start, start + size, nid,
 				    params->pgprot);
@@ -161,9 +159,6 @@ void __ref arch_remove_memory(int nid, u64 start, u64 size,
 	 * hit that section of memory
 	 */
 	vm_unmap_aliases();
-
-	if (resize_hpt_for_hotplug(memblock_phys_mem_size()) == -ENOSPC)
-		pr_warn("Hash collision while resizing HPT\n");
 }
 #endif
 
-- 
2.26.2

