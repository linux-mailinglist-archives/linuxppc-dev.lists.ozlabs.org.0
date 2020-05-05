Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1AD1C4FEA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 10:11:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GXVl55cHzDqQc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 18:11:27 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GWL15M7mzDqVV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 17:18:49 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04573WRs057617; Tue, 5 May 2020 03:18:45 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s4gun36k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 03:18:44 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04573X6W057665;
 Tue, 5 May 2020 03:18:44 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s4gun364-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 03:18:44 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0457FKmM016365;
 Tue, 5 May 2020 07:18:43 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 30s0g74jfq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 07:18:43 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0457IgCS46268718
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 May 2020 07:18:42 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3948EBE04F;
 Tue,  5 May 2020 07:18:42 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BF33BE053;
 Tue,  5 May 2020 07:18:40 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.81.70])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  5 May 2020 07:18:39 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v4 22/22] powerpc/mm/book3s64: Fix MADV_DONTNEED and parallel
 page fault race
Date: Tue,  5 May 2020 12:47:29 +0530
Message-Id: <20200505071729.54912-23-aneesh.kumar@linux.ibm.com>
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
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 mlxscore=0
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

MADV_DONTNEED holds mmap_sem in read mode and that implies a
parallel page fault is possible and the kernel can end up with a level 1 PTE
entry (THP entry) converted to a level 0 PTE entry without flushing
the THP TLB entry.

Most architectures including POWER have issues with kernel instantiating a level
0 PTE entry while holding level 1 TLB entries.

The code sequence I am looking at is

down_read(mmap_sem)                         down_read(mmap_sem)

zap_pmd_range()
 zap_huge_pmd()
  pmd lock held
  pmd_cleared
  table details added to mmu_gather
  pmd_unlock()
                                         insert a level 0 PTE entry()

tlb_finish_mmu().

Fix this by forcing a tlb flush before releasing pmd lock if this is
not a fullmm invalidate. We can safely skip this invalidate for
task exit case (fullmm invalidate) because in that case we are sure
there can be no parallel fault handlers.

This do change the Qemu guest RAM del/unplug time as below

128 core, 496GB guest:

Without patch:
munmap start: timer = 196449 ms, PID=6681
munmap finish: timer = 196488 ms, PID=6681 - delta = 39ms

With patch:
munmap start: timer = 196345 ms, PID=6879
munmap finish: timer = 196714 ms, PID=6879 - delta = 369ms

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h |  5 +++++
 arch/powerpc/mm/book3s64/pgtable.c           | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 03521a8b0292..e1f551159f7d 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1265,6 +1265,11 @@ static inline pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 }
 #define pmdp_collapse_flush pmdp_collapse_flush
 
+#define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR_FULL
+pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
+				   unsigned long addr,
+				   pmd_t *pmdp, int full);
+
 #define __HAVE_ARCH_PGTABLE_DEPOSIT
 static inline void pgtable_trans_huge_deposit(struct mm_struct *mm,
 					      pmd_t *pmdp, pgtable_t pgtable)
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 127325ead505..54b6d6d103ea 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -112,6 +112,24 @@ pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
 	return __pmd(old_pmd);
 }
 
+pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
+				   unsigned long addr, pmd_t *pmdp, int full)
+{
+	pmd_t pmd;
+	VM_BUG_ON(addr & ~HPAGE_PMD_MASK);
+	VM_BUG_ON((pmd_present(*pmdp) && !pmd_trans_huge(*pmdp) &&
+		   !pmd_devmap(*pmdp)) || !pmd_present(*pmdp));
+	pmd = pmdp_huge_get_and_clear(vma->vm_mm, addr, pmdp);
+	/*
+	 * if it not a fullmm flush, then we can possibly end up converting
+	 * this PMD pte entry to a regular level 0 PTE by a parallel page fault.
+	 * Make sure we flush the tlb in this case.
+	 */
+	if (!full)
+		flush_pmd_tlb_range(vma, addr, addr + HPAGE_PMD_SIZE);
+	return pmd;
+}
+
 static pmd_t pmd_set_protbits(pmd_t pmd, pgprot_t pgprot)
 {
 	return __pmd(pmd_val(pmd) | pgprot_val(pgprot));
-- 
2.26.2

