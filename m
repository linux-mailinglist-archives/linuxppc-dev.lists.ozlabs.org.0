Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1817F39D490
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 07:57:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fz2h53Gw5z3dcS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 15:57:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YH6+mPuY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YH6+mPuY; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fz2b35hwmz3bvP
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 15:52:47 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1575YOBH014218; Mon, 7 Jun 2021 01:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8aKpblTSzM2C2YgREh7iTE3cr9XUGzbfR66u6qL0kmw=;
 b=YH6+mPuYX5Z0xSFdou7+rcOlZwvjN+Jkx8BlSrLGLHboqLnbvuRTv/DD/X/DatSg+1sz
 LkMVe62hWIpp3A1XEi3CkpScDWnM9hxrkEi3vCRGciDMcMNLx1DAuILAJYDIhf4MGuAU
 FBahCDxKuSuCSagbH0AqJ++/n2XKvfViDCanJG5nsK8fOODQdrVsmRoGSOcTK5pGl/YK
 yn3u8rYmnYdwTJEUJsvhgu6BSwIcL0+L3yOrfNWORLEV9RawxNz82Ox+sbWwb6FScu/x
 Wnxt9sydDTeTWExnYwotNhYEMzowDnrwQk0sFNjU0aqLpsV+tccjm9x1aYGXcY2rhsNx Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 391cxdry0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 01:52:37 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1575oRmj065703;
 Mon, 7 Jun 2021 01:52:36 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 391cxdry0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 01:52:36 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1575gklb009034;
 Mon, 7 Jun 2021 05:52:36 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 3900w8mmhx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 05:52:36 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1575qZle31260950
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Jun 2021 05:52:35 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D37B028058;
 Mon,  7 Jun 2021 05:52:35 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9EBA12805A;
 Mon,  7 Jun 2021 05:52:32 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.32.129])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Jun 2021 05:52:32 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v7 10/11] powerpc/book3s64/mm: Update flush_tlb_range to flush
 page walk cache
Date: Mon,  7 Jun 2021 11:21:30 +0530
Message-Id: <20210607055131.156184-11-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607055131.156184-1-aneesh.kumar@linux.ibm.com>
References: <20210607055131.156184-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Wj2KUTbt9D_sxddP9RwSdD-A1sNg9pZN
X-Proofpoint-ORIG-GUID: cf_6TX664q26b0PLenkZ2rqQ2priHeui
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-07_03:2021-06-04,
 2021-06-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106070042
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
 Linus Torvalds <torvalds@linux-foundation.org>, npiggin@gmail.com,
 kaleshsingh@google.com, joel@joelfernandes.org,
 "Kirill A . Shutemov" <kirill@shutemov.name>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

flush_tlb_range is special in that we don't specify the page size used
for the translation. Hence when flushing TLB we flush the translation cache
for all possible page sizes. The kernel also uses the same interface when
moving page tables around. Such a move requires us to flush the page walk cache.

Instead of adding another interface to force page walk cache flush,
update flush_tlb_range to flush page walk cache if the range flushed
is more than the PMD range. A page table move will always involve an
invalidate range more than PMD_SIZE.

Running microbenchmark with mprotect and parallel memory access
didn't show any observable performance impact.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 .../include/asm/book3s/64/tlbflush-radix.h    |  2 +
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |  8 +++-
 arch/powerpc/mm/book3s64/radix_tlb.c          | 44 ++++++++++++-------
 3 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
index 8b33601cdb9d..ab9d5e535000 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
@@ -60,6 +60,8 @@ extern void radix__flush_hugetlb_tlb_range(struct vm_area_struct *vma,
 					   unsigned long start, unsigned long end);
 extern void radix__flush_tlb_range_psize(struct mm_struct *mm, unsigned long start,
 					 unsigned long end, int psize);
+void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long start,
+				      unsigned long end, int psize);
 extern void radix__flush_pmd_tlb_range(struct vm_area_struct *vma,
 				       unsigned long start, unsigned long end);
 extern void radix__flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
diff --git a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
index cb91071eef52..23d3e08911d3 100644
--- a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
@@ -32,7 +32,13 @@ void radix__flush_hugetlb_tlb_range(struct vm_area_struct *vma, unsigned long st
 	struct hstate *hstate = hstate_file(vma->vm_file);
 
 	psize = hstate_get_psize(hstate);
-	radix__flush_tlb_range_psize(vma->vm_mm, start, end, psize);
+	/*
+	 * Flush PWC even if we get PUD_SIZE hugetlb invalidate to keep this simpler.
+	 */
+	if (end - start >= PUD_SIZE)
+		radix__flush_tlb_pwc_range_psize(vma->vm_mm, start, end, psize);
+	else
+		radix__flush_tlb_range_psize(vma->vm_mm, start, end, psize);
 }
 
 /*
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 817a02ef6032..35c5eb23bfaf 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -997,14 +997,13 @@ static unsigned long tlb_local_single_page_flush_ceiling __read_mostly = POWER9_
 
 static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 					    unsigned long start, unsigned long end)
-
 {
 	unsigned long pid;
 	unsigned int page_shift = mmu_psize_defs[mmu_virtual_psize].shift;
 	unsigned long page_size = 1UL << page_shift;
 	unsigned long nr_pages = (end - start) >> page_shift;
 	bool fullmm = (end == TLB_FLUSH_ALL);
-	bool flush_pid;
+	bool flush_pid, flush_pwc = false;
 	enum tlb_flush_type type;
 
 	pid = mm->context.id;
@@ -1023,8 +1022,16 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 		flush_pid = nr_pages > tlb_single_page_flush_ceiling;
 	else
 		flush_pid = nr_pages > tlb_local_single_page_flush_ceiling;
+	/*
+	 * full pid flush already does the PWC flush. if it is not full pid
+	 * flush check the range is more than PMD and force a pwc flush
+	 * mremap() depends on this behaviour.
+	 */
+	if (!flush_pid && (end - start) >= PMD_SIZE)
+		flush_pwc = true;
 
 	if (!mmu_has_feature(MMU_FTR_GTSE) && type == FLUSH_TYPE_GLOBAL) {
+		unsigned long type = H_RPTI_TYPE_TLB;
 		unsigned long tgt = H_RPTI_TARGET_CMMU;
 		unsigned long pg_sizes = psize_to_rpti_pgsize(mmu_virtual_psize);
 
@@ -1032,19 +1039,20 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 			pg_sizes |= psize_to_rpti_pgsize(MMU_PAGE_2M);
 		if (atomic_read(&mm->context.copros) > 0)
 			tgt |= H_RPTI_TARGET_NMMU;
-		pseries_rpt_invalidate(pid, tgt, H_RPTI_TYPE_TLB, pg_sizes,
-				       start, end);
+		if (flush_pwc)
+			type |= H_RPTI_TYPE_PWC;
+		pseries_rpt_invalidate(pid, tgt, type, pg_sizes, start, end);
 	} else if (flush_pid) {
+		/*
+		 * We are now flushing a range larger than PMD size force a RIC_FLUSH_ALL
+		 */
 		if (type == FLUSH_TYPE_LOCAL) {
-			_tlbiel_pid(pid, RIC_FLUSH_TLB);
+			_tlbiel_pid(pid, RIC_FLUSH_ALL);
 		} else {
 			if (cputlb_use_tlbie()) {
-				if (mm_needs_flush_escalation(mm))
-					_tlbie_pid(pid, RIC_FLUSH_ALL);
-				else
-					_tlbie_pid(pid, RIC_FLUSH_TLB);
+				_tlbie_pid(pid, RIC_FLUSH_ALL);
 			} else {
-				_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_TLB);
+				_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_ALL);
 			}
 		}
 	} else {
@@ -1060,6 +1068,9 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 
 		if (type == FLUSH_TYPE_LOCAL) {
 			asm volatile("ptesync": : :"memory");
+			if (flush_pwc)
+				/* For PWC, only one flush is needed */
+				__tlbiel_pid(pid, 0, RIC_FLUSH_PWC);
 			__tlbiel_va_range(start, end, pid, page_size, mmu_virtual_psize);
 			if (hflush)
 				__tlbiel_va_range(hstart, hend, pid,
@@ -1067,6 +1078,8 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 			ppc_after_tlbiel_barrier();
 		} else if (cputlb_use_tlbie()) {
 			asm volatile("ptesync": : :"memory");
+			if (flush_pwc)
+				__tlbie_pid(pid, RIC_FLUSH_PWC);
 			__tlbie_va_range(start, end, pid, page_size, mmu_virtual_psize);
 			if (hflush)
 				__tlbie_va_range(hstart, hend, pid,
@@ -1074,10 +1087,10 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 			asm volatile("eieio; tlbsync; ptesync": : :"memory");
 		} else {
 			_tlbiel_va_range_multicast(mm,
-					start, end, pid, page_size, mmu_virtual_psize, false);
+					start, end, pid, page_size, mmu_virtual_psize, flush_pwc);
 			if (hflush)
 				_tlbiel_va_range_multicast(mm,
-					hstart, hend, pid, PMD_SIZE, MMU_PAGE_2M, false);
+					hstart, hend, pid, PMD_SIZE, MMU_PAGE_2M, flush_pwc);
 		}
 	}
 out:
@@ -1151,9 +1164,6 @@ void radix__flush_all_lpid_guest(unsigned int lpid)
 	_tlbie_lpid_guest(lpid, RIC_FLUSH_ALL);
 }
 
-static void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long start,
-				  unsigned long end, int psize);
-
 void radix__tlb_flush(struct mmu_gather *tlb)
 {
 	int psize = 0;
@@ -1260,8 +1270,8 @@ void radix__flush_tlb_range_psize(struct mm_struct *mm, unsigned long start,
 	return __radix__flush_tlb_range_psize(mm, start, end, psize, false);
 }
 
-static void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long start,
-				  unsigned long end, int psize)
+void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long start,
+				      unsigned long end, int psize)
 {
 	__radix__flush_tlb_range_psize(mm, start, end, psize, true);
 }
-- 
2.31.1

