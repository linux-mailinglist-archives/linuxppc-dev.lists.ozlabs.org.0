Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1175D249FDE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 15:29:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWpXK29xwzDqfK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 23:29:05 +1000 (AEST)
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
 header.s=pp1 header.b=WX2gN2X4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWnyj0bRTzDqw2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 23:03:24 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07JD22PZ002129; Wed, 19 Aug 2020 09:03:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9AtpSWJA58L9/hLE98davTNN23dVxuHwiSyXCdftH0U=;
 b=WX2gN2X4w3f7Lh3GqBL3RsR7G+vRB7ack3oVkVS7bAIitbSOZTE6RXvgPPL6Ngo+jL6T
 sIdP8oPoJ6vjmyIXW8KkhPU8OETGwkxNlRogJ0PhrqYPD3/S2XLLN5Bqj6pFX10ic6/A
 8P93K02+es0SuZVAJKirtfKBTwSx72xfbJaGnx+4gVgdc8CS12Y4A//21Z4HIKnAlZWG
 W59BU6KznPdW+8Z58aK9V21k0KAJOlLC0zOoZhihyGR43WP0h3mlTH1sIQeFXpqhpdnm
 jvp7IaZV70G6NcnQb21tY6fINbfBucLKkYVyYA1YgxhzE0AWrHBkJYR5hKHq+fnugqoI rg== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 330ww94edh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 09:02:57 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JD0o7I024544;
 Wed, 19 Aug 2020 13:01:42 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 3304tkkxay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 13:01:42 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07JD1gxg51773722
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Aug 2020 13:01:42 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53EEFB205F;
 Wed, 19 Aug 2020 13:01:42 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4390CB2064;
 Wed, 19 Aug 2020 13:01:40 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.3.58])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 19 Aug 2020 13:01:39 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v2 07/13] mm/debug_vm_pgtable/set_pte/pmd/pud: Don't use
 set_*_at to update an existing pte entry
Date: Wed, 19 Aug 2020 18:31:01 +0530
Message-Id: <20200819130107.478414-8-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
References: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_04:2020-08-19,
 2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 mlxscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 mlxlogscore=383 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008190110
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
index 76f4c713e5a3..9c7e2c9cfc76 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -74,15 +74,18 @@ static void __init pte_advanced_tests(struct mm_struct *mm,
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
@@ -96,13 +99,11 @@ static void __init pte_advanced_tests(struct mm_struct *mm,
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
@@ -164,9 +165,6 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
 	pmdp_set_wrprotect(mm, vaddr, pmdp);
 	pmd = READ_ONCE(*pmdp);
 	WARN_ON(pmd_write(pmd));
-
-	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
-	set_pmd_at(mm, vaddr, pmdp, pmd);
 	pmdp_huge_get_and_clear(mm, vaddr, pmdp);
 	pmd = READ_ONCE(*pmdp);
 	WARN_ON(!pmd_none(pmd));
@@ -180,13 +178,11 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
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
@@ -283,18 +279,10 @@ static void __init pud_advanced_tests(struct mm_struct *mm,
 	WARN_ON(pud_write(pud));
 
 #ifndef __PAGETABLE_PMD_FOLDED
-
-	pud = pud_mkhuge(pfn_pud(pfn, prot));
-	set_pud_at(mm, vaddr, pudp, pud);
 	pudp_huge_get_and_clear(mm, vaddr, pudp);
 	pud = READ_ONCE(*pudp);
 	WARN_ON(!pud_none(pud));
 
-	pud = pud_mkhuge(pfn_pud(pfn, prot));
-	set_pud_at(mm, vaddr, pudp, pud);
-	pudp_huge_get_and_clear_full(mm, vaddr, pudp, 1);
-	pud = READ_ONCE(*pudp);
-	WARN_ON(!pud_none(pud));
 #endif /* __PAGETABLE_PMD_FOLDED */
 
 	pud = pud_mkhuge(pfn_pud(pfn, prot));
@@ -307,6 +295,13 @@ static void __init pud_advanced_tests(struct mm_struct *mm,
 	pud = READ_ONCE(*pudp);
 	WARN_ON(!(pud_write(pud) && pud_dirty(pud)));
 
+#ifndef __PAGETABLE_PMD_FOLDED
+	pudp_huge_get_and_clear_full(vma, vaddr, pudp, 1);
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

