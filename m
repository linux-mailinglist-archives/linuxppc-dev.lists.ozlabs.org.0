Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 934A72133AA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 07:43:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ykQy69sszDqsK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 15:43:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ykGn0LfGzDqsQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 15:36:32 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0635X3Vb196421; Fri, 3 Jul 2020 01:36:26 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32041gkab2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 01:36:25 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0635WwOg196289;
 Fri, 3 Jul 2020 01:36:23 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32041gkaab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 01:36:23 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0635aMTg005065;
 Fri, 3 Jul 2020 05:36:22 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 321vnvg1ps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 05:36:21 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0635aJ9O48890074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Jul 2020 05:36:19 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06136A4057;
 Fri,  3 Jul 2020 05:36:19 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0FF4A4040;
 Fri,  3 Jul 2020 05:36:17 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.77.194.246])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Jul 2020 05:36:17 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 3/3] powerpc/mm/book3s64/radix: Off-load TLB invalidations
 to host when !GTSE
Date: Fri,  3 Jul 2020 11:06:08 +0530
Message-Id: <20200703053608.12884-4-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200703053608.12884-1-bharata@linux.ibm.com>
References: <20200703053608.12884-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-03_01:2020-07-02,
 2020-07-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 suspectscore=1 adultscore=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 cotscore=-2147483648 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007030040
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
Cc: aneesh.kumar@linux.ibm.com, Bharata B Rao <bharata@linux.ibm.com>,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

When platform doesn't support GTSE, let TLB invalidation requests
for radix guests be off-loaded to the host using H_RPT_INVALIDATE
hcall.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
	[hcall wrapper, error path handling and renames]
---
 .../include/asm/book3s/64/tlbflush-radix.h    | 15 ++++
 arch/powerpc/include/asm/hvcall.h             | 34 +++++++-
 arch/powerpc/include/asm/plpar_wrappers.h     | 52 ++++++++++++
 arch/powerpc/mm/book3s64/radix_tlb.c          | 82 +++++++++++++++++--
 4 files changed, 175 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
index ca8db193ae38..94439e0cefc9 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
@@ -2,10 +2,25 @@
 #ifndef _ASM_POWERPC_TLBFLUSH_RADIX_H
 #define _ASM_POWERPC_TLBFLUSH_RADIX_H
 
+#include <asm/hvcall.h>
+
 struct vm_area_struct;
 struct mm_struct;
 struct mmu_gather;
 
+static inline u64 psize_to_rpti_pgsize(unsigned long psize)
+{
+	if (psize == MMU_PAGE_4K)
+		return H_RPTI_PAGE_4K;
+	if (psize == MMU_PAGE_64K)
+		return H_RPTI_PAGE_64K;
+	if (psize == MMU_PAGE_2M)
+		return H_RPTI_PAGE_2M;
+	if (psize == MMU_PAGE_1G)
+		return H_RPTI_PAGE_1G;
+	return H_RPTI_PAGE_ALL;
+}
+
 static inline int mmu_get_ap(int psize)
 {
 	return mmu_psize_defs[psize].ap;
diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index e90c073e437e..43486e773bd6 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -305,7 +305,8 @@
 #define H_SCM_UNBIND_ALL        0x3FC
 #define H_SCM_HEALTH            0x400
 #define H_SCM_PERFORMANCE_STATS 0x418
-#define MAX_HCALL_OPCODE	H_SCM_PERFORMANCE_STATS
+#define H_RPT_INVALIDATE	0x448
+#define MAX_HCALL_OPCODE	H_RPT_INVALIDATE
 
 /* Scope args for H_SCM_UNBIND_ALL */
 #define H_UNBIND_SCOPE_ALL (0x1)
@@ -389,6 +390,37 @@
 #define PROC_TABLE_RADIX	0x04
 #define PROC_TABLE_GTSE		0x01
 
+/*
+ * Defines for
+ * H_RPT_INVALIDATE - Invalidate RPT translation lookaside information.
+ */
+
+/* Type of translation to invalidate (type) */
+#define H_RPTI_TYPE_NESTED	0x0001	/* Invalidate nested guest partition-scope */
+#define H_RPTI_TYPE_TLB		0x0002	/* Invalidate TLB */
+#define H_RPTI_TYPE_PWC		0x0004	/* Invalidate Page Walk Cache */
+/* Invalidate Process Table Entries if H_RPTI_TYPE_NESTED is clear */
+#define H_RPTI_TYPE_PRT		0x0008
+/* Invalidate Partition Table Entries if H_RPTI_TYPE_NESTED is set */
+#define H_RPTI_TYPE_PAT		0x0008
+#define H_RPTI_TYPE_ALL		(H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC | \
+				 H_RPTI_TYPE_PRT)
+#define H_RPTI_TYPE_NESTED_ALL	(H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC | \
+				 H_RPTI_TYPE_PAT)
+
+/* Invalidation targets (target) */
+#define H_RPTI_TARGET_CMMU		0x01 /* All virtual processors in the partition */
+#define H_RPTI_TARGET_CMMU_LOCAL	0x02 /* Current virtual processor */
+/* All nest/accelerator agents in use by the partition */
+#define H_RPTI_TARGET_NMMU		0x04
+
+/* Page size mask (page sizes) */
+#define H_RPTI_PAGE_4K	0x01
+#define H_RPTI_PAGE_64K	0x02
+#define H_RPTI_PAGE_2M	0x04
+#define H_RPTI_PAGE_1G	0x08
+#define H_RPTI_PAGE_ALL (-1UL)
+
 #ifndef __ASSEMBLY__
 #include <linux/types.h>
 
diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
index 4497c8afb573..4293c5d2ddf4 100644
--- a/arch/powerpc/include/asm/plpar_wrappers.h
+++ b/arch/powerpc/include/asm/plpar_wrappers.h
@@ -334,6 +334,51 @@ static inline long plpar_get_cpu_characteristics(struct h_cpu_char_result *p)
 	return rc;
 }
 
+/*
+ * Wrapper to H_RPT_INVALIDATE hcall that handles return values appropriately
+ *
+ * - Returns H_SUCCESS on success
+ * - For H_BUSY return value, we retry the hcall.
+ * - For any other hcall failures, attempt a full flush once before
+ *   resorting to BUG().
+ *
+ * Note: This hcall is expected to fail only very rarely. The correct
+ * error recovery of killing the process/guest will be eventually
+ * needed.
+ */
+static inline long pseries_rpt_invalidate(u32 pid, u64 target, u64 type,
+					  u64 page_sizes, u64 start, u64 end)
+{
+	long rc;
+	unsigned long all;
+
+	while (true) {
+		rc = plpar_hcall_norets(H_RPT_INVALIDATE, pid, target, type,
+					page_sizes, start, end);
+		if (rc == H_BUSY) {
+			cpu_relax();
+			continue;
+		} else if (rc == H_SUCCESS)
+			return rc;
+
+		/* Flush request failed, try with a full flush once */
+		if (type & H_RPTI_TYPE_NESTED)
+			all = H_RPTI_TYPE_NESTED | H_RPTI_TYPE_NESTED_ALL;
+		else
+			all = H_RPTI_TYPE_ALL;
+retry:
+		rc = plpar_hcall_norets(H_RPT_INVALIDATE, pid, target,
+					all, page_sizes, 0, -1UL);
+		if (rc == H_BUSY) {
+			cpu_relax();
+			goto retry;
+		} else if (rc == H_SUCCESS)
+			return rc;
+
+		BUG();
+	}
+}
+
 #else /* !CONFIG_PPC_PSERIES */
 
 static inline long plpar_set_ciabr(unsigned long ciabr)
@@ -346,6 +391,13 @@ static inline long plpar_pte_read_4(unsigned long flags, unsigned long ptex,
 {
 	return 0;
 }
+
+static inline long pseries_rpt_invalidate(u32 pid, u64 target, u64 type,
+					  u64 page_sizes, u64 start, u64 end)
+{
+	return 0;
+}
+
 #endif /* CONFIG_PPC_PSERIES */
 
 #endif /* _ASM_POWERPC_PLPAR_WRAPPERS_H */
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index b5cc9b23cf02..0d233763441f 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -16,6 +16,7 @@
 #include <asm/tlbflush.h>
 #include <asm/trace.h>
 #include <asm/cputhreads.h>
+#include <asm/plpar_wrappers.h>
 
 #define RIC_FLUSH_TLB 0
 #define RIC_FLUSH_PWC 1
@@ -694,7 +695,14 @@ void radix__flush_tlb_mm(struct mm_struct *mm)
 			goto local;
 		}
 
-		if (cputlb_use_tlbie()) {
+		if (!mmu_has_feature(MMU_FTR_GTSE)) {
+			unsigned long tgt = H_RPTI_TARGET_CMMU;
+
+			if (atomic_read(&mm->context.copros) > 0)
+				tgt |= H_RPTI_TARGET_NMMU;
+			pseries_rpt_invalidate(pid, tgt, H_RPTI_TYPE_TLB,
+					       H_RPTI_PAGE_ALL, 0, -1UL);
+		} else if (cputlb_use_tlbie()) {
 			if (mm_needs_flush_escalation(mm))
 				_tlbie_pid(pid, RIC_FLUSH_ALL);
 			else
@@ -727,7 +735,16 @@ static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
 				goto local;
 			}
 		}
-		if (cputlb_use_tlbie())
+		if (!mmu_has_feature(MMU_FTR_GTSE)) {
+			unsigned long tgt = H_RPTI_TARGET_CMMU;
+			unsigned long type = H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC |
+					     H_RPTI_TYPE_PRT;
+
+			if (atomic_read(&mm->context.copros) > 0)
+				tgt |= H_RPTI_TARGET_NMMU;
+			pseries_rpt_invalidate(pid, tgt, type,
+					       H_RPTI_PAGE_ALL, 0, -1UL);
+		} else if (cputlb_use_tlbie())
 			_tlbie_pid(pid, RIC_FLUSH_ALL);
 		else
 			_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_ALL);
@@ -760,7 +777,19 @@ void radix__flush_tlb_page_psize(struct mm_struct *mm, unsigned long vmaddr,
 			exit_flush_lazy_tlbs(mm);
 			goto local;
 		}
-		if (cputlb_use_tlbie())
+		if (!mmu_has_feature(MMU_FTR_GTSE)) {
+			unsigned long tgt, pg_sizes, size;
+
+			tgt = H_RPTI_TARGET_CMMU;
+			pg_sizes = psize_to_rpti_pgsize(psize);
+			size = 1UL << mmu_psize_to_shift(psize);
+
+			if (atomic_read(&mm->context.copros) > 0)
+				tgt |= H_RPTI_TARGET_NMMU;
+			pseries_rpt_invalidate(pid, tgt, H_RPTI_TYPE_TLB,
+					       pg_sizes, vmaddr,
+					       vmaddr + size);
+		} else if (cputlb_use_tlbie())
 			_tlbie_va(vmaddr, pid, psize, RIC_FLUSH_TLB);
 		else
 			_tlbiel_va_multicast(mm, vmaddr, pid, psize, RIC_FLUSH_TLB);
@@ -810,7 +839,14 @@ static inline void _tlbiel_kernel_broadcast(void)
  */
 void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
-	if (cputlb_use_tlbie())
+	if (!mmu_has_feature(MMU_FTR_GTSE)) {
+		unsigned long tgt = H_RPTI_TARGET_CMMU | H_RPTI_TARGET_NMMU;
+		unsigned long type = H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC |
+				     H_RPTI_TYPE_PRT;
+
+		pseries_rpt_invalidate(0, tgt, type, H_RPTI_PAGE_ALL,
+				       start, end);
+	} else if (cputlb_use_tlbie())
 		_tlbie_pid(0, RIC_FLUSH_ALL);
 	else
 		_tlbiel_kernel_broadcast();
@@ -864,7 +900,17 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 				nr_pages > tlb_local_single_page_flush_ceiling);
 	}
 
-	if (full) {
+	if (!mmu_has_feature(MMU_FTR_GTSE) && !local) {
+		unsigned long tgt = H_RPTI_TARGET_CMMU;
+		unsigned long pg_sizes = psize_to_rpti_pgsize(mmu_virtual_psize);
+
+		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
+			pg_sizes |= psize_to_rpti_pgsize(MMU_PAGE_2M);
+		if (atomic_read(&mm->context.copros) > 0)
+			tgt |= H_RPTI_TARGET_NMMU;
+		pseries_rpt_invalidate(pid, tgt, H_RPTI_TYPE_TLB, pg_sizes,
+				       start, end);
+	} else if (full) {
 		if (local) {
 			_tlbiel_pid(pid, RIC_FLUSH_TLB);
 		} else {
@@ -1046,7 +1092,17 @@ static __always_inline void __radix__flush_tlb_range_psize(struct mm_struct *mm,
 				nr_pages > tlb_local_single_page_flush_ceiling);
 	}
 
-	if (full) {
+	if (!mmu_has_feature(MMU_FTR_GTSE) && !local) {
+		unsigned long tgt = H_RPTI_TARGET_CMMU;
+		unsigned long type = H_RPTI_TYPE_TLB;
+		unsigned long pg_sizes = psize_to_rpti_pgsize(psize);
+
+		if (also_pwc)
+			type |= H_RPTI_TYPE_PWC;
+		if (atomic_read(&mm->context.copros) > 0)
+			tgt |= H_RPTI_TARGET_NMMU;
+		pseries_rpt_invalidate(pid, tgt, type, pg_sizes, start, end);
+	} else if (full) {
 		if (local) {
 			_tlbiel_pid(pid, also_pwc ? RIC_FLUSH_ALL : RIC_FLUSH_TLB);
 		} else {
@@ -1111,7 +1167,19 @@ void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr)
 			exit_flush_lazy_tlbs(mm);
 			goto local;
 		}
-		if (cputlb_use_tlbie())
+		if (!mmu_has_feature(MMU_FTR_GTSE)) {
+			unsigned long tgt, type, pg_sizes;
+
+			tgt = H_RPTI_TARGET_CMMU;
+			type = H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC |
+			       H_RPTI_TYPE_PRT;
+			pg_sizes = psize_to_rpti_pgsize(mmu_virtual_psize);
+
+			if (atomic_read(&mm->context.copros) > 0)
+				tgt |= H_RPTI_TARGET_NMMU;
+			pseries_rpt_invalidate(pid, tgt, type, pg_sizes,
+					       addr, end);
+		} else if (cputlb_use_tlbie())
 			_tlbie_va_range(addr, end, pid, PAGE_SIZE, mmu_virtual_psize, true);
 		else
 			_tlbiel_va_range_multicast(mm,
-- 
2.21.3

