Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 175033A90E2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 06:59:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4XzF5Pdcz3dbD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 14:59:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sYSonI5U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sYSonI5U; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4Xxs6jq3z3cDL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 14:58:09 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15G4YHf0059297; Wed, 16 Jun 2021 00:57:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=iBUHYnBQTZr8eBJ/olTHBaH0Epunv028Cq4oJo4MIp4=;
 b=sYSonI5Ufq6qOvXw5MiqOkfzdV5+UTOsLgzJveeecuKfs4PaN7NjzvJS0BrBzofU8iL3
 yiekQ4Igeibw5mB/EMdb8lfVVrBrqwlKOxc39y63P5f3DTvH3Swc/Hihxum571nOjwVF
 EbskxLuDGV6zgoKyi8jrpdUpFQd3Fvkz6hsXXzJemTc/9sTapOsHZFfR0i/5Zkza5Awe
 uT+fJHwD1PYMf93jEgcLXbeS/iAC3NC8NEiCrXc8LhtzALmvh9k7+WfjW3LAHW/dWV4H
 CXc9bZ8ik1x405E8vkwNh0QU5OSRT4Ow9acQ96u+GW3784fz81TR6BcYb/20apmB8Ets +A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 397ad18cs8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 00:57:55 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15G4v9NX011714;
 Wed, 16 Jun 2021 00:57:55 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 397ad18cru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 00:57:54 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15G4vNoJ001082;
 Wed, 16 Jun 2021 04:57:53 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 3954gk8xp4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 04:57:53 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15G4vrkd37880268
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 04:57:53 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A948B2066;
 Wed, 16 Jun 2021 04:57:53 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CADBDB2065;
 Wed, 16 Jun 2021 04:57:49 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.71.33])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 16 Jun 2021 04:57:49 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v8 2/3] powerpc/book3s64/mm: Update flush_tlb_range to flush
 page walk cache
Date: Wed, 16 Jun 2021 10:27:34 +0530
Message-Id: <20210616045735.374532-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616045735.374532-1-aneesh.kumar@linux.ibm.com>
References: <20210616045735.374532-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: k9FNA7H7HV1FrR7DXt6ws08piY0k22oq
X-Proofpoint-GUID: awzPzZ-ulbMuOpB_sRBFqWDSVa4dFS1J
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_09:2021-06-15,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106160027
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
index 409e61210789..9f1a177f6bb6 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -989,14 +989,13 @@ static unsigned long tlb_local_single_page_flush_ceiling __read_mostly = POWER9_
 
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
@@ -1015,8 +1014,16 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
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
 
@@ -1024,19 +1031,20 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
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
@@ -1052,6 +1060,9 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 
 		if (type == FLUSH_TYPE_LOCAL) {
 			asm volatile("ptesync": : :"memory");
+			if (flush_pwc)
+				/* For PWC, only one flush is needed */
+				__tlbiel_pid(pid, 0, RIC_FLUSH_PWC);
 			__tlbiel_va_range(start, end, pid, page_size, mmu_virtual_psize);
 			if (hflush)
 				__tlbiel_va_range(hstart, hend, pid,
@@ -1059,6 +1070,8 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 			ppc_after_tlbiel_barrier();
 		} else if (cputlb_use_tlbie()) {
 			asm volatile("ptesync": : :"memory");
+			if (flush_pwc)
+				__tlbie_pid(pid, RIC_FLUSH_PWC);
 			__tlbie_va_range(start, end, pid, page_size, mmu_virtual_psize);
 			if (hflush)
 				__tlbie_va_range(hstart, hend, pid,
@@ -1066,10 +1079,10 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
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
@@ -1143,9 +1156,6 @@ void radix__flush_all_lpid_guest(unsigned int lpid)
 	_tlbie_lpid_guest(lpid, RIC_FLUSH_ALL);
 }
 
-static void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long start,
-				  unsigned long end, int psize);
-
 void radix__tlb_flush(struct mmu_gather *tlb)
 {
 	int psize = 0;
@@ -1252,8 +1262,8 @@ void radix__flush_tlb_range_psize(struct mm_struct *mm, unsigned long start,
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

