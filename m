Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2B7E2BA0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 10:00:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zKRC3KWZzDqSV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 19:00:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zKP52G4jzDqQv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 18:58:16 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9O7vll6109075; Thu, 24 Oct 2019 03:58:10 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vu71qa39x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2019 03:58:09 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x9O7w9ZU110866;
 Thu, 24 Oct 2019 03:58:09 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vu71qa397-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2019 03:58:08 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9O7sUvS007705;
 Thu, 24 Oct 2019 07:58:08 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 2vqt47y1y6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2019 07:58:08 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9O7w7fY49349076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2019 07:58:08 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1576124054;
 Thu, 24 Oct 2019 07:58:07 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F805124052;
 Thu, 24 Oct 2019 07:58:06 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.124.35.127])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 24 Oct 2019 07:58:06 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au
Subject: [PATCH v1 1/3] mm/powerpc/book3s64/radix: Remove unused code.
Date: Thu, 24 Oct 2019 13:27:59 +0530
Message-Id: <20191024075801.22434-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-24_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910240076
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

mm_tlb_flush_nested change was added in the mmu gather tlb flush to handle
the case of parallel pte invalidate happening with mmap_sem held in read
mode. This fix was done by commit: 02390f66bd23 ("powerpc/64s/radix: Fix
MADV_[FREE|DONTNEED] TLB flush miss problem with THP") and the problem is
explained in detail in commit: 99baac21e458 ("mm: fix MADV_[FREE|DONTNEED] TLB
flush miss problem")

This was later updated by commit: 7a30df49f63a ("mm: mmu_gather: remove
__tlb_reset_range() for force flush") to do a full mm flush rather than
a range flush. By commit: dd2283f2605e ("mm: mmap: zap pages with read mmap_sem
in munmap") we are also now allowing a page table free in mmap_sem read mode
which means we should do a PWC flush too. Our current full mm flush imply
a PWC flush.

With all the above change the mm_tlb_flush_nested(mm) branch in radix__tlb_flush
will never be taken because for the nested case we would have taken the
if (tlb->fullmm) branch. This patch removes the unused code. Also, remove the
gflush change in __radix__flush_tlb_range that was added to handle the range tlb
flush code. We only check for THP there because hugetlb is flushed via a
different code path where page size is explicitly specified

This is a partial revert of commit: 02390f66bd23 ("powerpc/64s/radix: Fix
MADV_[FREE|DONTNEED] TLB flush miss problem with THP")

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 66 +++-------------------------
 1 file changed, 6 insertions(+), 60 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 67af871190c6..24d1f30556e0 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -832,8 +832,7 @@ static unsigned long tlb_single_page_flush_ceiling __read_mostly = 33;
 static unsigned long tlb_local_single_page_flush_ceiling __read_mostly = POWER9_TLB_SETS_RADIX * 2;
 
 static inline void __radix__flush_tlb_range(struct mm_struct *mm,
-					unsigned long start, unsigned long end,
-					bool flush_all_sizes)
+					    unsigned long start, unsigned long end)
 
 {
 	unsigned long pid;
@@ -879,26 +878,16 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 			}
 		}
 	} else {
-		bool hflush = flush_all_sizes;
-		bool gflush = flush_all_sizes;
+		bool hflush = false;
 		unsigned long hstart, hend;
-		unsigned long gstart, gend;
 
-		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
-			hflush = true;
-
-		if (hflush) {
+		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
 			hstart = (start + PMD_SIZE - 1) & PMD_MASK;
 			hend = end & PMD_MASK;
 			if (hstart == hend)
 				hflush = false;
-		}
-
-		if (gflush) {
-			gstart = (start + PUD_SIZE - 1) & PUD_MASK;
-			gend = end & PUD_MASK;
-			if (gstart == gend)
-				gflush = false;
+			else
+				hflush = true;
 		}
 
 		if (local) {
@@ -907,9 +896,6 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 			if (hflush)
 				__tlbiel_va_range(hstart, hend, pid,
 						PMD_SIZE, MMU_PAGE_2M);
-			if (gflush)
-				__tlbiel_va_range(gstart, gend, pid,
-						PUD_SIZE, MMU_PAGE_1G);
 			asm volatile("ptesync": : :"memory");
 		} else if (cputlb_use_tlbie()) {
 			asm volatile("ptesync": : :"memory");
@@ -917,10 +903,6 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 			if (hflush)
 				__tlbie_va_range(hstart, hend, pid,
 						PMD_SIZE, MMU_PAGE_2M);
-			if (gflush)
-				__tlbie_va_range(gstart, gend, pid,
-						PUD_SIZE, MMU_PAGE_1G);
-
 			asm volatile("eieio; tlbsync; ptesync": : :"memory");
 		} else {
 			_tlbiel_va_range_multicast(mm,
@@ -928,9 +910,6 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 			if (hflush)
 				_tlbiel_va_range_multicast(mm,
 					hstart, hend, pid, PMD_SIZE, MMU_PAGE_2M, false);
-			if (gflush)
-				_tlbiel_va_range_multicast(mm,
-					gstart, gend, pid, PUD_SIZE, MMU_PAGE_1G, false);
 		}
 	}
 	preempt_enable();
@@ -945,7 +924,7 @@ void radix__flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		return radix__flush_hugetlb_tlb_range(vma, start, end);
 #endif
 
-	__radix__flush_tlb_range(vma->vm_mm, start, end, false);
+	__radix__flush_tlb_range(vma->vm_mm, start, end);
 }
 EXPORT_SYMBOL(radix__flush_tlb_range);
 
@@ -1023,39 +1002,6 @@ void radix__tlb_flush(struct mmu_gather *tlb)
 	 */
 	if (tlb->fullmm) {
 		__flush_all_mm(mm, true);
-#if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_HUGETLB_PAGE)
-	} else if (mm_tlb_flush_nested(mm)) {
-		/*
-		 * If there is a concurrent invalidation that is clearing ptes,
-		 * then it's possible this invalidation will miss one of those
-		 * cleared ptes and miss flushing the TLB. If this invalidate
-		 * returns before the other one flushes TLBs, that can result
-		 * in it returning while there are still valid TLBs inside the
-		 * range to be invalidated.
-		 *
-		 * See mm/memory.c:tlb_finish_mmu() for more details.
-		 *
-		 * The solution to this is ensure the entire range is always
-		 * flushed here. The problem for powerpc is that the flushes
-		 * are page size specific, so this "forced flush" would not
-		 * do the right thing if there are a mix of page sizes in
-		 * the range to be invalidated. So use __flush_tlb_range
-		 * which invalidates all possible page sizes in the range.
-		 *
-		 * PWC flush probably is not be required because the core code
-		 * shouldn't free page tables in this path, but accounting
-		 * for the possibility makes us a bit more robust.
-		 *
-		 * need_flush_all is an uncommon case because page table
-		 * teardown should be done with exclusive locks held (but
-		 * after locks are dropped another invalidate could come
-		 * in), it could be optimized further if necessary.
-		 */
-		if (!tlb->need_flush_all)
-			__radix__flush_tlb_range(mm, start, end, true);
-		else
-			radix__flush_all_mm(mm);
-#endif
 	} else if ( (psize = radix_get_mmu_psize(page_size)) == -1) {
 		if (!tlb->need_flush_all)
 			radix__flush_tlb_mm(mm);
-- 
2.21.0

