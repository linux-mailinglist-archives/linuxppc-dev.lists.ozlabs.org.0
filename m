Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8473171196
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 08:38:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Sl0K0Th3zDqlP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 18:38:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Sk582qh3zDqjl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 17:57:47 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01R6tq9P162880; Thu, 27 Feb 2020 01:57:43 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydh91yste-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 01:57:43 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01R6tpWl162845;
 Thu, 27 Feb 2020 01:57:43 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydh91yssp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 01:57:43 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01R6ujke022805;
 Thu, 27 Feb 2020 06:57:42 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 2ydcmkk96s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 06:57:42 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01R6vfNZ53150170
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Feb 2020 06:57:41 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C16B728059;
 Thu, 27 Feb 2020 06:57:41 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C70C728058;
 Thu, 27 Feb 2020 06:57:39 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.204.201.20])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Feb 2020 06:57:39 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au,
 kirill@shutemov.name
Subject: [RFC PATCH 21/21] powerpc/mm/book3s64: Avoid sending IPI on clearing
 PMD
Date: Thu, 27 Feb 2020 12:26:20 +0530
Message-Id: <20200227065620.50804-22-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227065620.50804-1-aneesh.kumar@linux.ibm.com>
References: <20200227065620.50804-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-27_01:2020-02-26,
 2020-02-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 mlxlogscore=801 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002270054
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

Now that all the lockless page table walk is careful w.r.t the PTE
address returned, we can now revert
commit: 13bd817bb884 ("powerpc/thp: Serialize pmd clear against a linux page table walk.")

This speeds up Qemu termination with large guest RAM value.

We also drop the equivalent IPI from other pte updates routines. We still keep
IPI in hash pmdp collapse and that is to take care of parallel hash page table
insert. The radix pmdp collapse flush can possibly be removed once I am sure
generic code doesn't have the any expectations around parallel gup walk.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/hash_pgtable.c  | 11 -----------
 arch/powerpc/mm/book3s64/pgtable.c       |  8 --------
 arch/powerpc/mm/book3s64/radix_pgtable.c | 20 ++++++++------------
 3 files changed, 8 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index 64733b9cb20a..64ca375278dc 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -363,17 +363,6 @@ pmd_t hash__pmdp_huge_get_and_clear(struct mm_struct *mm,
 	 * hash fault look at them.
 	 */
 	memset(pgtable, 0, PTE_FRAG_SIZE);
-	/*
-	 * Serialize against find_current_mm_pte variants which does lock-less
-	 * lookup in page tables with local interrupts disabled. For huge pages
-	 * it casts pmd_t to pte_t. Since format of pte_t is different from
-	 * pmd_t we want to prevent transit from pmd pointing to page table
-	 * to pmd pointing to huge page (and back) while interrupts are disabled.
-	 * We clear pmd to possibly replace it with page table pointer in
-	 * different code paths. So make sure we wait for the parallel
-	 * find_curren_mm_pte to finish.
-	 */
-	serialize_against_pte_lookup(mm);
 	return old_pmd;
 }
 
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 2bf7e1b4fd82..93fc3be41ed9 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -109,14 +109,6 @@ pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
 
 	old_pmd = pmd_hugepage_update(vma->vm_mm, address, pmdp, _PAGE_PRESENT, _PAGE_INVALID);
 	flush_pmd_tlb_range(vma, address, address + HPAGE_PMD_SIZE);
-	/*
-	 * This ensures that generic code that rely on IRQ disabling
-	 * to prevent a parallel THP split work as expected.
-	 *
-	 * Marking the entry with _PAGE_INVALID && ~_PAGE_PRESENT requires
-	 * a special case check in pmd_access_permitted.
-	 */
-	serialize_against_pte_lookup(vma->vm_mm);
 	return __pmd(old_pmd);
 }
 
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index dd1bea45325c..1ae77568221d 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -957,7 +957,14 @@ pmd_t radix__pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long addre
 	pmd = *pmdp;
 	pmd_clear(pmdp);
 
-	/*FIXME!!  Verify whether we need this kick below */
+	/*
+	 * pmdp collapse_flush need to ensure that there are no parallel gup
+	 * walk after this call. We can ensure that by sending IPI because
+	 * gup walk happens with IRQ disabled.
+	 * FIXME!!
+	 * At this point I am not sure why we have a comment above pmdp_collapse_flush
+	 * that a parallel gup walk should be avoided.
+	 */
 	serialize_against_pte_lookup(vma->vm_mm);
 
 	radix__flush_tlb_collapsed_pmd(vma->vm_mm, address);
@@ -1018,17 +1025,6 @@ pmd_t radix__pmdp_huge_get_and_clear(struct mm_struct *mm,
 
 	old = radix__pmd_hugepage_update(mm, addr, pmdp, ~0UL, 0);
 	old_pmd = __pmd(old);
-	/*
-	 * Serialize against find_current_mm_pte which does lock-less
-	 * lookup in page tables with local interrupts disabled. For huge pages
-	 * it casts pmd_t to pte_t. Since format of pte_t is different from
-	 * pmd_t we want to prevent transit from pmd pointing to page table
-	 * to pmd pointing to huge page (and back) while interrupts are disabled.
-	 * We clear pmd to possibly replace it with page table pointer in
-	 * different code paths. So make sure we wait for the parallel
-	 * find_current_mm_pte to finish.
-	 */
-	serialize_against_pte_lookup(mm);
 	return old_pmd;
 }
 
-- 
2.24.1

