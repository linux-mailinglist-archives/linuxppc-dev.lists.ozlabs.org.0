Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DC51C4FDD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 10:07:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GXPh0rmPzDqwC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 18:07:04 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GWKw32pSzDqWH
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 17:18:44 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04573WVd057618; Tue, 5 May 2020 03:18:39 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s4gun348-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 03:18:39 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04573Z4Q057780;
 Tue, 5 May 2020 03:18:38 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s4gun33u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 03:18:38 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0457FIbG024843;
 Tue, 5 May 2020 07:18:37 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 30s0g6cm62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 07:18:37 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0457IacP52363576
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 May 2020 07:18:36 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F199DBE04F;
 Tue,  5 May 2020 07:18:35 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3EF3BE053;
 Tue,  5 May 2020 07:18:33 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.81.70])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  5 May 2020 07:18:33 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v4 20/22] powerpc/mm/book3s64: Avoid sending IPI on clearing
 PMD
Date: Tue,  5 May 2020 12:47:27 +0530
Message-Id: <20200505071729.54912-21-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200505071729.54912-1-aneesh.kumar@linux.ibm.com>
References: <20200505071729.54912-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-05_03:2020-05-04,
 2020-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxlogscore=933 clxscore=1015 bulkscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005050056
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that all the lockless page table walk is careful w.r.t the PTE
address returned, we can now revert
commit: 13bd817bb884 ("powerpc/thp: Serialize pmd clear against a linux page table walk.")

We also drop the equivalent IPI from other pte updates routines. We still keep
IPI in hash pmdp collapse and that is to take care of parallel hash page table
insert. The radix pmdp collapse flush can possibly be removed once I am sure
generic code doesn't have the any expectations around parallel gup walk.

This speeds up Qemu guest RAM del/unplug time as below

128 core, 496GB guest:

Without patch:
munmap start: timer = 13162 ms, PID=7684
munmap finish: timer = 95312 ms, PID=7684 - delta = 82150 ms

With patch:
munmap start: timer = 196449 ms, PID=6681
munmap finish: timer = 196488 ms, PID=6681 - delta = 39ms

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/hash_pgtable.c  | 11 -----------
 arch/powerpc/mm/book3s64/pgtable.c       |  8 --------
 arch/powerpc/mm/book3s64/radix_pgtable.c | 19 +++++++------------
 3 files changed, 7 insertions(+), 31 deletions(-)

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
index e0bb69c616e4..127325ead505 100644
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
index 8f9edf07063a..dfb9fe92aea8 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -962,7 +962,13 @@ pmd_t radix__pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long addre
 	pmd = *pmdp;
 	pmd_clear(pmdp);
 
-	/*FIXME!!  Verify whether we need this kick below */
+	/*
+	 * pmdp collapse_flush need to ensure that there are no parallel gup
+	 * walk after this call. This is needed so that we can have stable
+	 * page ref count when collapsing a page. We don't allow a collapse page
+	 * if we have gup taken on the page. We can ensure that by sending IPI
+	 * because gup walk happens with IRQ disabled.
+	 */
 	serialize_against_pte_lookup(vma->vm_mm);
 
 	radix__flush_tlb_collapsed_pmd(vma->vm_mm, address);
@@ -1023,17 +1029,6 @@ pmd_t radix__pmdp_huge_get_and_clear(struct mm_struct *mm,
 
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
2.26.2

