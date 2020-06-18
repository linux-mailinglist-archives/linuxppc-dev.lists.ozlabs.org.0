Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A4A1FF914
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 18:19:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nnFl4yygzDrMT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 02:19:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nn2Z5F2SzDrDr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 02:09:58 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05IG7MjA193525; Thu, 18 Jun 2020 12:09:54 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31r96gcxyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 12:09:54 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05IG9r9I010451;
 Thu, 18 Jun 2020 12:09:54 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31r96gcxy0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 12:09:53 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05IG67bR003977;
 Thu, 18 Jun 2020 16:09:51 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 31qur61b91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 16:09:51 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05IG9mwb28246216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jun 2020 16:09:48 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D95B1A4054;
 Thu, 18 Jun 2020 16:09:47 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A815CA405C;
 Thu, 18 Jun 2020 16:09:46 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.46.230])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 18 Jun 2020 16:09:46 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 4/5] powerpc/mm/book3s64/radix: Off-load TLB invalidations
 to host when !GTSE
Date: Thu, 18 Jun 2020 21:39:29 +0530
Message-Id: <20200618160930.26324-5-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200618160930.26324-1-bharata@linux.ibm.com>
References: <20200618160930.26324-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-18_14:2020-06-18,
 2020-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 suspectscore=1 bulkscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 cotscore=-2147483648 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006180121
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
 arch/powerpc/include/asm/hvcall.h         | 27 ++++++-
 arch/powerpc/include/asm/plpar_wrappers.h | 52 +++++++++++++
 arch/powerpc/mm/book3s64/radix_tlb.c      | 95 +++++++++++++++++++++--
 3 files changed, 166 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index e90c073e437e..3f9bc7ad1cdd 100644
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
@@ -389,6 +390,30 @@
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
+#define H_RPTI_TYPE_PRT		0x0008	/* Invalidate Process Table Entries if H_RPTI_TYPE_NESTED is clear */
+#define H_RPTI_TYPE_PAT		0x0008	/* Invalidate Partition Table Entries if H_RPTI_TYPE_NESTED is set */
+
+/* Invalidation targets (target) */
+#define H_RPTI_TARGET_CMMU		0x01 /* All virtual processors in the partition */
+#define H_RPTI_TARGET_CMMU_LOCAL	0x02 /* Current virtual processor */
+#define H_RPTI_TARGET_NMMU		0x04 /* All nest/accelerator agents in use by the partition */
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
index 4497c8afb573..92320bb309c7 100644
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
+	unsigned long all = H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC;
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
+			all |= H_RPTI_TYPE_PAT;
+		else
+			all |= H_RPTI_TYPE_PRT;
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
index b5cc9b23cf02..733935b68f37 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -16,11 +16,25 @@
 #include <asm/tlbflush.h>
 #include <asm/trace.h>
 #include <asm/cputhreads.h>
+#include <asm/plpar_wrappers.h>
 
 #define RIC_FLUSH_TLB 0
 #define RIC_FLUSH_PWC 1
 #define RIC_FLUSH_ALL 2
 
+static inline u64 psize_to_h_rpti(unsigned long psize)
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
 /*
  * tlbiel instruction for radix, set invalidation
  * i.e., r=1 and is=01 or is=10 or is=11
@@ -694,7 +708,14 @@ void radix__flush_tlb_mm(struct mm_struct *mm)
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
@@ -727,7 +748,16 @@ static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
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
@@ -760,7 +790,19 @@ void radix__flush_tlb_page_psize(struct mm_struct *mm, unsigned long vmaddr,
 			exit_flush_lazy_tlbs(mm);
 			goto local;
 		}
-		if (cputlb_use_tlbie())
+		if (!mmu_has_feature(MMU_FTR_GTSE)) {
+			unsigned long tgt, page_sizes, size;
+
+			tgt = H_RPTI_TARGET_CMMU;
+			page_sizes = psize_to_h_rpti(psize);
+			size = 1UL << mmu_psize_to_shift(psize);
+
+			if (atomic_read(&mm->context.copros) > 0)
+				tgt |= H_RPTI_TARGET_NMMU;
+			pseries_rpt_invalidate(pid, tgt, H_RPTI_TYPE_TLB,
+					       page_sizes, vmaddr,
+					       vmaddr + size);
+		} else if (cputlb_use_tlbie())
 			_tlbie_va(vmaddr, pid, psize, RIC_FLUSH_TLB);
 		else
 			_tlbiel_va_multicast(mm, vmaddr, pid, psize, RIC_FLUSH_TLB);
@@ -810,7 +852,14 @@ static inline void _tlbiel_kernel_broadcast(void)
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
@@ -864,7 +913,17 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 				nr_pages > tlb_local_single_page_flush_ceiling);
 	}
 
-	if (full) {
+	if (!mmu_has_feature(MMU_FTR_GTSE) && !local) {
+		unsigned long tgt = H_RPTI_TARGET_CMMU;
+		unsigned long page_sizes = psize_to_h_rpti(mmu_virtual_psize);
+
+		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
+			page_sizes |= psize_to_h_rpti(MMU_PAGE_2M);
+		if (atomic_read(&mm->context.copros) > 0)
+			tgt |= H_RPTI_TARGET_NMMU;
+		pseries_rpt_invalidate(pid, tgt, H_RPTI_TYPE_TLB, page_sizes,
+				       start, end);
+	} else if (full) {
 		if (local) {
 			_tlbiel_pid(pid, RIC_FLUSH_TLB);
 		} else {
@@ -1046,7 +1105,17 @@ static __always_inline void __radix__flush_tlb_range_psize(struct mm_struct *mm,
 				nr_pages > tlb_local_single_page_flush_ceiling);
 	}
 
-	if (full) {
+	if (!mmu_has_feature(MMU_FTR_GTSE) && !local) {
+		unsigned long tgt = H_RPTI_TARGET_CMMU;
+		unsigned long type = H_RPTI_TYPE_TLB;
+		unsigned long page_sizes = psize_to_h_rpti(psize);
+
+		if (also_pwc)
+			type |= H_RPTI_TYPE_PWC;
+		if (atomic_read(&mm->context.copros) > 0)
+			tgt |= H_RPTI_TARGET_NMMU;
+		pseries_rpt_invalidate(pid, tgt, type, page_sizes, start, end);
+	} else if (full) {
 		if (local) {
 			_tlbiel_pid(pid, also_pwc ? RIC_FLUSH_ALL : RIC_FLUSH_TLB);
 		} else {
@@ -1111,7 +1180,19 @@ void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr)
 			exit_flush_lazy_tlbs(mm);
 			goto local;
 		}
-		if (cputlb_use_tlbie())
+		if (!mmu_has_feature(MMU_FTR_GTSE)) {
+			unsigned long tgt, type, page_sizes;
+
+			tgt = H_RPTI_TARGET_CMMU;
+			type = H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC |
+			       H_RPTI_TYPE_PRT;
+			page_sizes = psize_to_h_rpti(mmu_virtual_psize);
+
+			if (atomic_read(&mm->context.copros) > 0)
+				tgt |= H_RPTI_TARGET_NMMU;
+			pseries_rpt_invalidate(pid, tgt, type, page_sizes,
+					       addr, end);
+		} else if (cputlb_use_tlbie())
 			_tlbie_va_range(addr, end, pid, PAGE_SIZE, mmu_virtual_psize, true);
 		else
 			_tlbiel_va_range_multicast(mm,
-- 
2.21.3

