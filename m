Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3664C2425C2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 09:04:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRLKb0wwzzDqQY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 17:04:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Q0+0ot33; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRKh20Z56zDqQD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 16:35:13 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07C6W2h9103009; Wed, 12 Aug 2020 02:35:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=c/Ac+7NLl6kdjM7MoxMrVJ7TH0wF3LpYVbYsYB5RlNg=;
 b=Q0+0ot33WDyFWG3p9ITDJ6axhWIYsXThQm6oRtKhoEZ1ytTIGVLds1Bj9CoY5lWs5DTS
 mZHWVazxMRjil3dYZ22POc+W9oFlEEB9ajMvQbioDPUx7WjjBnPxB+OQlF0T6zz5N+tY
 N4DDwosAS5/H0R32DHm07fdCHHMTaIWYvj6zK4qHK1u8e3diw+mc9Ip6vPUvbZBC+kUj
 S8T9uc1mcHthJXwGwKAd5t7blelqr8dLIlP20vwcfW/tWqe6/uYItvgJiwOGOFrcuHGN
 ZIaDHx8EHLgPOCSy6jp9Boh6W+vZUshAnsfXNb0GGQlkyAjWmbV5K80GEYbyI8skFUo8 7A== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32uqp3s9a3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 02:35:04 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07C6YL5O007218;
 Wed, 12 Aug 2020 06:35:04 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 32skp97acs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 06:35:04 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07C6Yxbh48431390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Aug 2020 06:34:59 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DD29136060;
 Wed, 12 Aug 2020 06:35:03 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC90C136051;
 Wed, 12 Aug 2020 06:35:00 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.71.109])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 12 Aug 2020 06:35:00 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH 16/16] debug_vm_pgtable/ppc64: Add a variant of pfn_pte/pmd
Date: Wed, 12 Aug 2020 12:03:58 +0530
Message-Id: <20200812063358.369514-16-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-11_19:2020-08-11,
 2020-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008120044
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The tests do expect _PAGE_PTE bit set by different page table accessors.
This is not true for the kernel. Within the kernel, _PAGE_PTE bits are
usually set by set_pte_at(). To make the below tests work correctly add test
specific pfn_pte/pmd helpers that set _PAGE_PTE bit.

pte_t pte = pfn_pte(pfn, prot);
WARN_ON(!pte_devmap(pte_mkdevmap(pte)));
WARN_ON(!pte_savedwrite(pte_mk_savedwrite(pte_clear_savedwrite(pte))));

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/debug_vm_pgtable.c | 65 +++++++++++++++++++++++++++----------------
 1 file changed, 41 insertions(+), 24 deletions(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index eea62d5e503b..153c925b5273 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -31,6 +31,23 @@
 #include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 
+#ifdef CONFIG_PPC_BOOK3S_64
+static inline pte_t debug_vm_pfn_pte(unsigned long pfn, pgprot_t pgprot)
+{
+	pte_t pte = pfn_pte(pfn, pgprot);
+	return __pte(pte_val(pte) | _PAGE_PTE);
+
+}
+static inline pmd_t debug_vm_pfn_pmd(unsigned long pfn, pgprot_t pgprot)
+{
+	pmd_t pmd = pfn_pmd(pfn, pgprot);
+	return __pmd(pmd_val(pmd) | _PAGE_PTE);
+}
+#else
+#define debug_vm_pfn_pte(pfn, pgprot) pfn_pte(pfn, pgprot)
+#define debug_vm_pfn_pmd(pfn, pgprot) pfn_pmd(pfn, pgprot)
+#endif
+
 /*
  * Please refer Documentation/vm/arch_pgtable_helpers.rst for the semantics
  * expectations that are being validated here. All future changes in here
@@ -55,7 +72,7 @@
 
 static void __init pte_basic_tests(unsigned long pfn, pgprot_t prot)
 {
-	pte_t pte = pfn_pte(pfn, prot);
+	pte_t pte = debug_vm_pfn_pte(pfn, prot);
 
 	pr_debug("Validating PTE basic\n");
 	WARN_ON(!pte_same(pte, pte));
@@ -72,10 +89,10 @@ static void __init pte_advanced_tests(struct mm_struct *mm,
 				      unsigned long pfn, unsigned long vaddr,
 				      pgprot_t prot)
 {
-	pte_t pte = pfn_pte(pfn, prot);
+	pte_t pte = debug_vm_pfn_pte(pfn, prot);
 
 	pr_debug("Validating PTE advanced\n");
-	pte = pfn_pte(pfn, prot);
+	pte = debug_vm_pfn_pte(pfn, prot);
 	set_pte_at(mm, vaddr, ptep, pte);
 	ptep_set_wrprotect(mm, vaddr, ptep);
 	pte = ptep_get(ptep);
@@ -85,7 +102,7 @@ static void __init pte_advanced_tests(struct mm_struct *mm,
 	pte = ptep_get(ptep);
 	WARN_ON(!pte_none(pte));
 
-	pte = pfn_pte(pfn, prot);
+	pte = debug_vm_pfn_pte(pfn, prot);
 	pte = pte_wrprotect(pte);
 	pte = pte_mkclean(pte);
 	set_pte_at(mm, vaddr, ptep, pte);
@@ -113,7 +130,7 @@ static void __init pte_advanced_tests(struct mm_struct *mm,
 #ifdef CONFIG_NUMA_BALANCING
 static void __init pte_savedwrite_tests(unsigned long pfn, pgprot_t prot)
 {
-	pte_t pte = pfn_pte(pfn, prot);
+	pte_t pte = debug_vm_pfn_pte(pfn, prot);
 
 	pr_debug("Validating PTE saved write\n");
 	WARN_ON(!pte_savedwrite(pte_mk_savedwrite(pte_clear_savedwrite(pte))));
@@ -124,7 +141,7 @@ static void __init pte_savedwrite_tests(unsigned long pfn, pgprot_t prot)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot)
 {
-	pmd_t pmd = pfn_pmd(pfn, prot);
+	pmd_t pmd = debug_vm_pfn_pmd(pfn, prot);
 
 	if (!has_transparent_hugepage())
 		return;
@@ -160,7 +177,7 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
 
 	pgtable_trans_huge_deposit(mm, pmdp, pgtable);
 
-	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
+	pmd = pmd_mkhuge(debug_vm_pfn_pmd(pfn, prot));
 	set_pmd_at(mm, vaddr, pmdp, pmd);
 	pmdp_set_wrprotect(mm, vaddr, pmdp);
 	pmd = READ_ONCE(*pmdp);
@@ -170,7 +187,7 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
 	pmd = READ_ONCE(*pmdp);
 	WARN_ON(!pmd_none(pmd));
 
-	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
+	pmd = pmd_mkhuge(debug_vm_pfn_pmd(pfn, prot));
 	pmd = pmd_wrprotect(pmd);
 	pmd = pmd_mkclean(pmd);
 	set_pmd_at(mm, vaddr, pmdp, pmd);
@@ -184,7 +201,7 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
 	pmd = READ_ONCE(*pmdp);
 	WARN_ON(!pmd_none(pmd));
 
-	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
+	pmd = pmd_mkhuge(debug_vm_pfn_pmd(pfn, prot));
 	pmd = pmd_mkyoung(pmd);
 	set_pmd_at(mm, vaddr, pmdp, pmd);
 	pmdp_test_and_clear_young(vma, vaddr, pmdp);
@@ -198,7 +215,7 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
 
 static void __init pmd_leaf_tests(unsigned long pfn, pgprot_t prot)
 {
-	pmd_t pmd = pfn_pmd(pfn, prot);
+	pmd_t pmd = debug_vm_pfn_pmd(pfn, prot);
 
 	pr_debug("Validating PMD leaf\n");
 	/*
@@ -230,7 +247,7 @@ static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, pgprot_t prot)
 #ifdef CONFIG_NUMA_BALANCING
 static void __init pmd_savedwrite_tests(unsigned long pfn, pgprot_t prot)
 {
-	pmd_t pmd = pfn_pmd(pfn, prot);
+	pmd_t pmd = debug_vm_pfn_pmd(pfn, prot);
 
 	pr_debug("Validating PMD saved write\n");
 	WARN_ON(!pmd_savedwrite(pmd_mk_savedwrite(pmd_clear_savedwrite(pmd))));
@@ -573,7 +590,7 @@ static void __init pmd_populate_tests(struct mm_struct *mm, pmd_t *pmdp,
 
 static void __init pte_special_tests(unsigned long pfn, pgprot_t prot)
 {
-	pte_t pte = pfn_pte(pfn, prot);
+	pte_t pte = debug_vm_pfn_pte(pfn, prot);
 
 	if (!IS_ENABLED(CONFIG_ARCH_HAS_PTE_SPECIAL))
 		return;
@@ -584,7 +601,7 @@ static void __init pte_special_tests(unsigned long pfn, pgprot_t prot)
 
 static void __init pte_protnone_tests(unsigned long pfn, pgprot_t prot)
 {
-	pte_t pte = pfn_pte(pfn, prot);
+	pte_t pte = debug_vm_pfn_pte(pfn, prot);
 
 	if (!IS_ENABLED(CONFIG_NUMA_BALANCING))
 		return;
@@ -597,7 +614,7 @@ static void __init pte_protnone_tests(unsigned long pfn, pgprot_t prot)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static void __init pmd_protnone_tests(unsigned long pfn, pgprot_t prot)
 {
-	pmd_t pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
+	pmd_t pmd = pmd_mkhuge(debug_vm_pfn_pmd(pfn, prot));
 
 	if (!IS_ENABLED(CONFIG_NUMA_BALANCING))
 		return;
@@ -613,7 +630,7 @@ static void __init pmd_protnone_tests(unsigned long pfn, pgprot_t prot) { }
 #ifdef CONFIG_ARCH_HAS_PTE_DEVMAP
 static void __init pte_devmap_tests(unsigned long pfn, pgprot_t prot)
 {
-	pte_t pte = pfn_pte(pfn, prot);
+	pte_t pte = debug_vm_pfn_pte(pfn, prot);
 
 	pr_debug("Validating PTE devmap\n");
 	WARN_ON(!pte_devmap(pte_mkdevmap(pte)));
@@ -622,7 +639,7 @@ static void __init pte_devmap_tests(unsigned long pfn, pgprot_t prot)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static void __init pmd_devmap_tests(unsigned long pfn, pgprot_t prot)
 {
-	pmd_t pmd = pfn_pmd(pfn, prot);
+	pmd_t pmd = debug_vm_pfn_pmd(pfn, prot);
 
 	pr_debug("Validating PMD devmap\n");
 	WARN_ON(!pmd_devmap(pmd_mkdevmap(pmd)));
@@ -651,7 +668,7 @@ static void __init pud_devmap_tests(unsigned long pfn, pgprot_t prot) { }
 
 static void __init pte_soft_dirty_tests(unsigned long pfn, pgprot_t prot)
 {
-	pte_t pte = pfn_pte(pfn, prot);
+	pte_t pte = debug_vm_pfn_pte(pfn, prot);
 
 	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
 		return;
@@ -663,7 +680,7 @@ static void __init pte_soft_dirty_tests(unsigned long pfn, pgprot_t prot)
 
 static void __init pte_swap_soft_dirty_tests(unsigned long pfn, pgprot_t prot)
 {
-	pte_t pte = pfn_pte(pfn, prot);
+	pte_t pte = debug_vm_pfn_pte(pfn, prot);
 
 	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
 		return;
@@ -676,7 +693,7 @@ static void __init pte_swap_soft_dirty_tests(unsigned long pfn, pgprot_t prot)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static void __init pmd_soft_dirty_tests(unsigned long pfn, pgprot_t prot)
 {
-	pmd_t pmd = pfn_pmd(pfn, prot);
+	pmd_t pmd = debug_vm_pfn_pmd(pfn, prot);
 
 	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
 		return;
@@ -688,7 +705,7 @@ static void __init pmd_soft_dirty_tests(unsigned long pfn, pgprot_t prot)
 
 static void __init pmd_swap_soft_dirty_tests(unsigned long pfn, pgprot_t prot)
 {
-	pmd_t pmd = pfn_pmd(pfn, prot);
+	pmd_t pmd = debug_vm_pfn_pmd(pfn, prot);
 
 	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY) ||
 		!IS_ENABLED(CONFIG_ARCH_ENABLE_THP_MIGRATION))
@@ -711,7 +728,7 @@ static void __init pte_swap_tests(unsigned long pfn, pgprot_t prot)
 	pte_t pte;
 
 	pr_debug("Validating PTE swap\n");
-	pte = pfn_pte(pfn, prot);
+	pte = debug_vm_pfn_pte(pfn, prot);
 	swp = __pte_to_swp_entry(pte);
 	pte = __swp_entry_to_pte(swp);
 	WARN_ON(pfn != pte_pfn(pte));
@@ -724,7 +741,7 @@ static void __init pmd_swap_tests(unsigned long pfn, pgprot_t prot)
 	pmd_t pmd;
 
 	pr_debug("Validating PMD swap\n");
-	pmd = pfn_pmd(pfn, prot);
+	pmd = debug_vm_pfn_pmd(pfn, prot);
 	swp = __pmd_to_swp_entry(pmd);
 	pmd = __swp_entry_to_pmd(swp);
 	WARN_ON(pfn != pmd_pfn(pmd));
@@ -794,7 +811,7 @@ static void __init hugetlb_basic_tests(unsigned long pfn, pgprot_t prot)
 	WARN_ON(huge_pte_write(huge_pte_wrprotect(huge_pte_mkwrite(pte))));
 
 #ifdef CONFIG_ARCH_WANT_GENERAL_HUGETLB
-	pte = pfn_pte(pfn, prot);
+	pte = debug_vm_pfn_pte(pfn, prot);
 
 	WARN_ON(!pte_huge(pte_mkhuge(pte)));
 #endif /* CONFIG_ARCH_WANT_GENERAL_HUGETLB */
@@ -874,7 +891,7 @@ static void __init pmd_thp_tests(unsigned long pfn, pgprot_t prot)
 	 * needs to return true. pmd_present() should be true whenever
 	 * pmd_trans_huge() returns true.
 	 */
-	pmd = pfn_pmd(pfn, prot);
+	pmd = debug_vm_pfn_pmd(pfn, prot);
 	WARN_ON(!pmd_trans_huge(pmd_mkhuge(pmd)));
 
 #ifndef __HAVE_ARCH_PMDP_INVALIDATE
-- 
2.26.2

