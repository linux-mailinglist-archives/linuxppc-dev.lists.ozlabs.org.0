Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 314206AC782
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 17:17:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVkJN00sjz3cV8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 03:17:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qgIC+66x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qgIC+66x;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVkHT0Q5sz3blY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 03:17:08 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 326FqQlW005341;
	Mon, 6 Mar 2023 16:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=BTJFZUSxiEWggn1zMTH9DiLoAKpycnCu/7ed6LXGAvk=;
 b=qgIC+66xyQksuyboaCTNGdaBk1/QigzHYhhF4+0tJh4kTCDJG8Jgg5PxZuOe5ZNaaCaZ
 890Iq6HqEAjbgUfkOXy5qj7LIinS5Mhlkteqk18rRyJ9lyM7fJ+MeNIWSrRGTePRH+xk
 AOhcX94RqcLxx/42kIivrrd/v6n33QotwUDd8kw0kXSq47sI5PbUnw3f461cITYiPn9V
 dUREg6rswV9PZVTOaizAEA9/iwmmvQHttTsY23CU7XDw76mpNJJcRpFE/6OmsEGho0bl
 mXaqZ6a5N7qu+hjk146cD1KDeIHditdAK26vK4kn7hMjRZL3EkspibjkjZ2V1zn3+3bT yA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p50n48eac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 16:16:19 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 326Bw5Lc029579;
	Mon, 6 Mar 2023 16:16:18 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p50n48e9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 16:16:18 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3265XPh5030498;
	Mon, 6 Mar 2023 16:16:16 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3p417q2by5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 16:16:16 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 326GGCjG38142264
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Mar 2023 16:16:13 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C811420049;
	Mon,  6 Mar 2023 16:16:12 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A9EC20040;
	Mon,  6 Mar 2023 16:16:12 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Mar 2023 16:16:12 +0000 (GMT)
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] mm: add PTE pointer parameter to flush_tlb_fix_spurious_fault()
Date: Mon,  6 Mar 2023 17:15:48 +0100
Message-Id: <20230306161548.661740-1-gerald.schaefer@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8La9G2yLPVsHgQLa6GKGur7yIvPNIJqC
X-Proofpoint-GUID: DeAjCU7ZGi5ehOrbeAqu-0KrsMqfJwxv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_08,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303060142
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
Cc: linux-x86 <x86@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, David Hildenbrand <david@redhat.com>, linux-mips <linux-mips@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-power <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

s390 can do more fine-grained handling of spurious TLB protection faults,
when there also is the PTE pointer available.

Therefore, pass on the PTE pointer to flush_tlb_fix_spurious_fault() as
an additional parameter.

This will add no functional change to other architectures, but those with
private flush_tlb_fix_spurious_fault() implementations need to be made
aware of the new parameter.

Reviewed-by: Alexander Gordeev <agordeev@linux.ibm.com>
Signed-off-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
---
 arch/arm64/include/asm/pgtable.h              |  2 +-
 arch/mips/include/asm/pgtable.h               |  3 ++-
 arch/powerpc/include/asm/book3s/64/tlbflush.h |  3 ++-
 arch/s390/include/asm/pgtable.h               | 12 +++++++-----
 arch/x86/include/asm/pgtable.h                |  2 +-
 include/linux/pgtable.h                       |  2 +-
 mm/memory.c                                   |  3 ++-
 mm/pgtable-generic.c                          |  2 +-
 8 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index b6ba466e2e8a..0bd18de9fd97 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -57,7 +57,7 @@ static inline bool arch_thp_swp_supported(void)
  * fault on one CPU which has been handled concurrently by another CPU
  * does not need to perform additional invalidation.
  */
-#define flush_tlb_fix_spurious_fault(vma, address) do { } while (0)
+#define flush_tlb_fix_spurious_fault(vma, address, ptep) do { } while (0)
 
 /*
  * ZERO_PAGE is a global shared page that is always zero: used
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 791389bf3c12..574fa14ac8b2 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -469,7 +469,8 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
 }
 
 static inline void flush_tlb_fix_spurious_fault(struct vm_area_struct *vma,
-						unsigned long address)
+						unsigned long address,
+						pte_t *ptep)
 {
 }
 
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index 2bbc0fcce04a..ff7f0ee179e5 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -121,7 +121,8 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
 
 #define flush_tlb_fix_spurious_fault flush_tlb_fix_spurious_fault
 static inline void flush_tlb_fix_spurious_fault(struct vm_area_struct *vma,
-						unsigned long address)
+						unsigned long address,
+						pte_t *ptep)
 {
 	/*
 	 * Book3S 64 does not require spurious fault flushes because the PTE
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 2c70b4d1263d..c1f6b46ec555 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1239,7 +1239,8 @@ static inline int pte_allow_rdp(pte_t old, pte_t new)
 }
 
 static inline void flush_tlb_fix_spurious_fault(struct vm_area_struct *vma,
-						unsigned long address)
+						unsigned long address,
+						pte_t *ptep)
 {
 	/*
 	 * RDP might not have propagated the PTE protection reset to all CPUs,
@@ -1247,11 +1248,12 @@ static inline void flush_tlb_fix_spurious_fault(struct vm_area_struct *vma,
 	 * NOTE: This will also be called when a racing pagetable update on
 	 * another thread already installed the correct PTE. Both cases cannot
 	 * really be distinguished.
-	 * Therefore, only do the local TLB flush when RDP can be used, to avoid
-	 * unnecessary overhead.
+	 * Therefore, only do the local TLB flush when RDP can be used, and the
+	 * PTE does not have _PAGE_PROTECT set, to avoid unnecessary overhead.
+	 * A local RDP can be used to do the flush.
 	 */
-	if (MACHINE_HAS_RDP)
-		asm volatile("ptlb" : : : "memory");
+	if (MACHINE_HAS_RDP && !(pte_val(*ptep) & _PAGE_PROTECT))
+		__ptep_rdp(address, ptep, 0, 0, 1);
 }
 #define flush_tlb_fix_spurious_fault flush_tlb_fix_spurious_fault
 
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 7425f32e5293..15ae4d6ba476 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1097,7 +1097,7 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm,
 	clear_bit(_PAGE_BIT_RW, (unsigned long *)&ptep->pte);
 }
 
-#define flush_tlb_fix_spurious_fault(vma, address) do { } while (0)
+#define flush_tlb_fix_spurious_fault(vma, address, ptep) do { } while (0)
 
 #define mk_pmd(page, pgprot)   pfn_pmd(page_to_pfn(page), (pgprot))
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 9dc936bc77d1..c5a51481bbb9 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -817,7 +817,7 @@ static inline void arch_swap_restore(swp_entry_t entry, struct folio *folio)
 #endif
 
 #ifndef flush_tlb_fix_spurious_fault
-#define flush_tlb_fix_spurious_fault(vma, address) flush_tlb_page(vma, address)
+#define flush_tlb_fix_spurious_fault(vma, address, ptep) flush_tlb_page(vma, address)
 #endif
 
 /*
diff --git a/mm/memory.c b/mm/memory.c
index 0adf23ea5416..7ca7951adcf5 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4956,7 +4956,8 @@ static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
 		 * with threads.
 		 */
 		if (vmf->flags & FAULT_FLAG_WRITE)
-			flush_tlb_fix_spurious_fault(vmf->vma, vmf->address);
+			flush_tlb_fix_spurious_fault(vmf->vma, vmf->address,
+						     vmf->pte);
 	}
 unlock:
 	pte_unmap_unlock(vmf->pte, vmf->ptl);
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 90ab721a12a8..d2fc52bffafc 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -69,7 +69,7 @@ int ptep_set_access_flags(struct vm_area_struct *vma,
 	int changed = !pte_same(*ptep, entry);
 	if (changed) {
 		set_pte_at(vma->vm_mm, address, ptep, entry);
-		flush_tlb_fix_spurious_fault(vma, address);
+		flush_tlb_fix_spurious_fault(vma, address, ptep);
 	}
 	return changed;
 }
-- 
2.37.2

