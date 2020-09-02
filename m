Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 919D925AAA9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 13:58:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhMsl6D3NzDqsq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 21:58:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=biiKmAdI; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhMWX0bT5zDqr6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 21:43:03 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 082BVati075753; Wed, 2 Sep 2020 07:42:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kOuRQC8EmqKi7rOWpSD3AfPZT91eOze/YrHNuttE16k=;
 b=biiKmAdIntEBq+yWiGF+O5HqtpDxMvLn2p63ImCOYvdqnIVz0iAUSFVdtztWsEMIY2Qs
 l38bExdKwbjKgq8YYs43w5Fc7/Wpb4tykeQYK0+xyLrVdT9Rz5UwcuNMWIuiawexWPBP
 uGoa1Pz+Bbb4W18TRE87co91elny5mSwLjakEC+7FtB0+SD1uOC4OeLA90RiSEm3Kidh
 V5kBIaZRFPdQvybTlPc3TmP351mCHUNSCDh5RElTFgc8gwKRtfdclAQbNHEdAqazEg0O
 CuFaXuJEVBESoOJBqhkrltkXI4cdQhcJhaAsFjnASEt9RzT0f8Fqo/E999SmG2ukzXzC kA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33aaae0t4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 07:42:53 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 082BbHRY013969;
 Wed, 2 Sep 2020 11:42:52 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 337en9ffbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 11:42:52 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 082Bgqn148365952
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Sep 2020 11:42:52 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2106BB2065;
 Wed,  2 Sep 2020 11:42:52 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD38FB2064;
 Wed,  2 Sep 2020 11:42:49 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.61.124])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  2 Sep 2020 11:42:49 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v4 07/13] mm/debug_vm_pgtable/set_pte/pmd/pud: Don't use
 set_*_at to update an existing pte entry
Date: Wed,  2 Sep 2020 17:12:16 +0530
Message-Id: <20200902114222.181353-8-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_03:2020-09-02,
 2020-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 mlxlogscore=362 mlxscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009020105
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

set_pte_at() should not be used to set a pte entry at locations that
already holds a valid pte entry. Architectures like ppc64 don't do TLB
invalidate in set_pte_at() and hence expect it to be used to set locations
that are not a valid PTE.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/debug_vm_pgtable.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 9cafed39c236..de333871f407 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -79,15 +79,18 @@ static void __init pte_advanced_tests(struct mm_struct *mm,
 {
 	pte_t pte = pfn_pte(pfn, prot);
 
+	/*
+	 * Architectures optimize set_pte_at by avoiding TLB flush.
+	 * This requires set_pte_at to be not used to update an
+	 * existing pte entry. Clear pte before we do set_pte_at
+	 */
+
 	pr_debug("Validating PTE advanced\n");
 	pte = pfn_pte(pfn, prot);
 	set_pte_at(mm, vaddr, ptep, pte);
 	ptep_set_wrprotect(mm, vaddr, ptep);
 	pte = ptep_get(ptep);
 	WARN_ON(pte_write(pte));
-
-	pte = pfn_pte(pfn, prot);
-	set_pte_at(mm, vaddr, ptep, pte);
 	ptep_get_and_clear(mm, vaddr, ptep);
 	pte = ptep_get(ptep);
 	WARN_ON(!pte_none(pte));
@@ -101,13 +104,11 @@ static void __init pte_advanced_tests(struct mm_struct *mm,
 	ptep_set_access_flags(vma, vaddr, ptep, pte, 1);
 	pte = ptep_get(ptep);
 	WARN_ON(!(pte_write(pte) && pte_dirty(pte)));
-
-	pte = pfn_pte(pfn, prot);
-	set_pte_at(mm, vaddr, ptep, pte);
 	ptep_get_and_clear_full(mm, vaddr, ptep, 1);
 	pte = ptep_get(ptep);
 	WARN_ON(!pte_none(pte));
 
+	pte = pfn_pte(pfn, prot);
 	pte = pte_mkyoung(pte);
 	set_pte_at(mm, vaddr, ptep, pte);
 	ptep_test_and_clear_young(vma, vaddr, ptep);
@@ -169,9 +170,6 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
 	pmdp_set_wrprotect(mm, vaddr, pmdp);
 	pmd = READ_ONCE(*pmdp);
 	WARN_ON(pmd_write(pmd));
-
-	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
-	set_pmd_at(mm, vaddr, pmdp, pmd);
 	pmdp_huge_get_and_clear(mm, vaddr, pmdp);
 	pmd = READ_ONCE(*pmdp);
 	WARN_ON(!pmd_none(pmd));
@@ -185,13 +183,11 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
 	pmdp_set_access_flags(vma, vaddr, pmdp, pmd, 1);
 	pmd = READ_ONCE(*pmdp);
 	WARN_ON(!(pmd_write(pmd) && pmd_dirty(pmd)));
-
-	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
-	set_pmd_at(mm, vaddr, pmdp, pmd);
 	pmdp_huge_get_and_clear_full(vma, vaddr, pmdp, 1);
 	pmd = READ_ONCE(*pmdp);
 	WARN_ON(!pmd_none(pmd));
 
+	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
 	pmd = pmd_mkyoung(pmd);
 	set_pmd_at(mm, vaddr, pmdp, pmd);
 	pmdp_test_and_clear_young(vma, vaddr, pmdp);
@@ -292,17 +288,9 @@ static void __init pud_advanced_tests(struct mm_struct *mm,
 	WARN_ON(pud_write(pud));
 
 #ifndef __PAGETABLE_PMD_FOLDED
-	pud = pud_mkhuge(pfn_pud(pfn, prot));
-	set_pud_at(mm, vaddr, pudp, pud);
 	pudp_huge_get_and_clear(mm, vaddr, pudp);
 	pud = READ_ONCE(*pudp);
 	WARN_ON(!pud_none(pud));
-
-	pud = pud_mkhuge(pfn_pud(pfn, prot));
-	set_pud_at(mm, vaddr, pudp, pud);
-	pudp_huge_get_and_clear_full(mm, vaddr, pudp, 1);
-	pud = READ_ONCE(*pudp);
-	WARN_ON(!pud_none(pud));
 #endif /* __PAGETABLE_PMD_FOLDED */
 
 	pud = pud_mkhuge(pfn_pud(pfn, prot));
@@ -315,6 +303,13 @@ static void __init pud_advanced_tests(struct mm_struct *mm,
 	pud = READ_ONCE(*pudp);
 	WARN_ON(!(pud_write(pud) && pud_dirty(pud)));
 
+#ifndef __PAGETABLE_PMD_FOLDED
+	pudp_huge_get_and_clear_full(mm, vaddr, pudp, 1);
+	pud = READ_ONCE(*pudp);
+	WARN_ON(!pud_none(pud));
+#endif /* __PAGETABLE_PMD_FOLDED */
+
+	pud = pud_mkhuge(pfn_pud(pfn, prot));
 	pud = pud_mkyoung(pud);
 	set_pud_at(mm, vaddr, pudp, pud);
 	pudp_test_and_clear_young(vma, vaddr, pudp);
-- 
2.26.2

