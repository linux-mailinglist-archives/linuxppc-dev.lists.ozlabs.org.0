Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 626F11F1712
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 12:58:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gVbv5S1bzDqSx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 20:58:35 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gVPk61YKzDqRX
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jun 2020 20:49:46 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 058AVhLu133515
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Jun 2020 06:49:43 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31gg80p9yq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jun 2020 06:49:42 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 058AVvJw134168
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Jun 2020 06:49:39 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31gg80p9wc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 06:49:38 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 058AjA2a030517;
 Mon, 8 Jun 2020 10:49:33 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 31g2s7uscn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 10:49:32 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 058AnTit57082036
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jun 2020 10:49:29 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABB134C052;
 Mon,  8 Jun 2020 10:49:29 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA2964C04A;
 Mon,  8 Jun 2020 10:49:28 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.48.183])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  8 Jun 2020 10:49:28 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v0 4/4] powerpc/mm/book3s64/radix: Off-load TLB
 invalidations to host when !GTSE
Date: Mon,  8 Jun 2020 16:19:09 +0530
Message-Id: <20200608104909.14350-5-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608104909.14350-1-bharata@linux.ibm.com>
References: <20200608104909.14350-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-08_07:2020-06-08,
 2020-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=1 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 mlxlogscore=871 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006080077
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
Cc: aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

When platform doesn't support GTSE, let TLB invalidation requests
for radix guests be off-loaded to the host using H_RPT_INVALIDATE
hcall

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 arch/powerpc/include/asm/hvcall.h         |   1 +
 arch/powerpc/include/asm/plpar_wrappers.h |  14 +++
 arch/powerpc/mm/book3s64/radix_tlb.c      | 105 ++++++++++++++++++++--
 3 files changed, 113 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index e90c073e437e..08917147415b 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -335,6 +335,7 @@
 #define H_GET_24X7_CATALOG_PAGE	0xF078
 #define H_GET_24X7_DATA		0xF07C
 #define H_GET_PERF_COUNTER_INFO	0xF080
+#define H_RPT_INVALIDATE	0xF084
 
 /* Platform-specific hcalls used for nested HV KVM */
 #define H_SET_PARTITION_TABLE	0xF800
diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
index 4497c8afb573..e952139b0e47 100644
--- a/arch/powerpc/include/asm/plpar_wrappers.h
+++ b/arch/powerpc/include/asm/plpar_wrappers.h
@@ -334,6 +334,13 @@ static inline long plpar_get_cpu_characteristics(struct h_cpu_char_result *p)
 	return rc;
 }
 
+static inline long pseries_rpt_invalidate(u32 pid, u64 target, u64 what,
+					  u64 pages, u64 start, u64 end)
+{
+	return plpar_hcall_norets(H_RPT_INVALIDATE, pid, target, what,
+				  pages, start, end);
+}
+
 #else /* !CONFIG_PPC_PSERIES */
 
 static inline long plpar_set_ciabr(unsigned long ciabr)
@@ -346,6 +353,13 @@ static inline long plpar_pte_read_4(unsigned long flags, unsigned long ptex,
 {
 	return 0;
 }
+
+static inline long pseries_rpt_invalidate(u32 pid, u64 target, u64 what,
+					  u64 pages, u64 start, u64 end)
+{
+	return 0;
+}
+
 #endif /* CONFIG_PPC_PSERIES */
 
 #endif /* _ASM_POWERPC_PLPAR_WRAPPERS_H */
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index b5cc9b23cf02..4dd1d3c75562 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -16,11 +16,39 @@
 #include <asm/tlbflush.h>
 #include <asm/trace.h>
 #include <asm/cputhreads.h>
+#include <asm/plpar_wrappers.h>
 
 #define RIC_FLUSH_TLB 0
 #define RIC_FLUSH_PWC 1
 #define RIC_FLUSH_ALL 2
 
+#define H_TLBI_TLB	0x0001
+#define H_TLBI_PWC	0x0002
+#define H_TLBI_PRS	0x0004
+
+#define H_TLBI_TARGET_CMMU	0x01
+#define H_TLBI_TARGET_CMMU_LOCAL 0x02
+#define H_TLBI_TARGET_NMMU	0x04
+
+#define H_TLBI_PAGE_ALL (-1UL)
+#define H_TLBI_PAGE_4K	0x01
+#define H_TLBI_PAGE_64K	0x02
+#define H_TLBI_PAGE_2M	0x04
+#define H_TLBI_PAGE_1G	0x08
+
+static inline u64 psize_to_h_tlbi(unsigned long psize)
+{
+	if (psize == MMU_PAGE_4K)
+		return H_TLBI_PAGE_4K;
+	if (psize == MMU_PAGE_64K)
+		return H_TLBI_PAGE_64K;
+	if (psize == MMU_PAGE_2M)
+		return H_TLBI_PAGE_2M;
+	if (psize == MMU_PAGE_1G)
+		return H_TLBI_PAGE_1G;
+	return H_TLBI_PAGE_ALL;
+}
+
 /*
  * tlbiel instruction for radix, set invalidation
  * i.e., r=1 and is=01 or is=10 or is=11
@@ -694,7 +722,14 @@ void radix__flush_tlb_mm(struct mm_struct *mm)
 			goto local;
 		}
 
-		if (cputlb_use_tlbie()) {
+		if (!mmu_has_feature(MMU_FTR_GTSE)) {
+			unsigned long targ = H_TLBI_TARGET_CMMU;
+
+			if (atomic_read(&mm->context.copros) > 0)
+				targ |= H_TLBI_TARGET_NMMU;
+			pseries_rpt_invalidate(pid, targ, H_TLBI_TLB,
+					       H_TLBI_PAGE_ALL, 0, -1UL);
+		} else if (cputlb_use_tlbie()) {
 			if (mm_needs_flush_escalation(mm))
 				_tlbie_pid(pid, RIC_FLUSH_ALL);
 			else
@@ -727,7 +762,16 @@ static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
 				goto local;
 			}
 		}
-		if (cputlb_use_tlbie())
+		if (!mmu_has_feature(MMU_FTR_GTSE)) {
+			unsigned long targ = H_TLBI_TARGET_CMMU;
+			unsigned long what = H_TLBI_TLB | H_TLBI_PWC |
+					     H_TLBI_PRS;
+
+			if (atomic_read(&mm->context.copros) > 0)
+				targ |= H_TLBI_TARGET_NMMU;
+			pseries_rpt_invalidate(pid, targ, what,
+					       H_TLBI_PAGE_ALL, 0, -1UL);
+		} else if (cputlb_use_tlbie())
 			_tlbie_pid(pid, RIC_FLUSH_ALL);
 		else
 			_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_ALL);
@@ -760,7 +804,17 @@ void radix__flush_tlb_page_psize(struct mm_struct *mm, unsigned long vmaddr,
 			exit_flush_lazy_tlbs(mm);
 			goto local;
 		}
-		if (cputlb_use_tlbie())
+		if (!mmu_has_feature(MMU_FTR_GTSE)) {
+			unsigned long targ = H_TLBI_TARGET_CMMU;
+			unsigned long pages = psize_to_h_tlbi(psize);
+			unsigned long page_size =
+					1UL << mmu_psize_to_shift(psize);
+
+			if (atomic_read(&mm->context.copros) > 0)
+				targ |= H_TLBI_TARGET_NMMU;
+			pseries_rpt_invalidate(pid, targ, H_TLBI_TLB, pages,
+					       vmaddr, vmaddr + page_size);
+		} else if (cputlb_use_tlbie())
 			_tlbie_va(vmaddr, pid, psize, RIC_FLUSH_TLB);
 		else
 			_tlbiel_va_multicast(mm, vmaddr, pid, psize, RIC_FLUSH_TLB);
@@ -810,7 +864,13 @@ static inline void _tlbiel_kernel_broadcast(void)
  */
 void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
-	if (cputlb_use_tlbie())
+	if (!mmu_has_feature(MMU_FTR_GTSE)) {
+		unsigned long targ = H_TLBI_TARGET_CMMU | H_TLBI_TARGET_NMMU;
+		unsigned long what = H_TLBI_TLB | H_TLBI_PWC | H_TLBI_PRS;
+
+		pseries_rpt_invalidate(0, targ, what, H_TLBI_PAGE_ALL,
+				       start, end);
+	} else if (cputlb_use_tlbie())
 		_tlbie_pid(0, RIC_FLUSH_ALL);
 	else
 		_tlbiel_kernel_broadcast();
@@ -864,7 +924,17 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 				nr_pages > tlb_local_single_page_flush_ceiling);
 	}
 
-	if (full) {
+	if (!mmu_has_feature(MMU_FTR_GTSE) && !local) {
+		unsigned long targ = H_TLBI_TARGET_CMMU;
+		unsigned long pages = psize_to_h_tlbi(mmu_virtual_psize);
+
+		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
+			pages |= psize_to_h_tlbi(MMU_PAGE_2M);
+		if (atomic_read(&mm->context.copros) > 0)
+			targ |= H_TLBI_TARGET_NMMU;
+		pseries_rpt_invalidate(pid, targ, H_TLBI_TLB, pages,
+				       start, end);
+	} else if (full) {
 		if (local) {
 			_tlbiel_pid(pid, RIC_FLUSH_TLB);
 		} else {
@@ -1046,7 +1116,17 @@ static __always_inline void __radix__flush_tlb_range_psize(struct mm_struct *mm,
 				nr_pages > tlb_local_single_page_flush_ceiling);
 	}
 
-	if (full) {
+	if (!mmu_has_feature(MMU_FTR_GTSE) && !local) {
+		unsigned long targ = H_TLBI_TARGET_CMMU;
+		unsigned long what = H_TLBI_TLB;
+		unsigned long pages = psize_to_h_tlbi(psize);
+
+		if (also_pwc)
+			what |= H_TLBI_PWC;
+		if (atomic_read(&mm->context.copros) > 0)
+			targ |= H_TLBI_TARGET_NMMU;
+		pseries_rpt_invalidate(pid, targ, what, pages, start, end);
+	} else if (full) {
 		if (local) {
 			_tlbiel_pid(pid, also_pwc ? RIC_FLUSH_ALL : RIC_FLUSH_TLB);
 		} else {
@@ -1111,7 +1191,18 @@ void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr)
 			exit_flush_lazy_tlbs(mm);
 			goto local;
 		}
-		if (cputlb_use_tlbie())
+		if (!mmu_has_feature(MMU_FTR_GTSE)) {
+			unsigned long targ = H_TLBI_TARGET_CMMU;
+			unsigned long what = H_TLBI_TLB | H_TLBI_PWC |
+					     H_TLBI_PRS;
+			unsigned long pages =
+					psize_to_h_tlbi(mmu_virtual_psize);
+
+			if (atomic_read(&mm->context.copros) > 0)
+				targ |= H_TLBI_TARGET_NMMU;
+			pseries_rpt_invalidate(pid, targ, what, pages,
+					       addr, end);
+		} else if (cputlb_use_tlbie())
 			_tlbie_va_range(addr, end, pid, PAGE_SIZE, mmu_virtual_psize, true);
 		else
 			_tlbiel_va_range_multicast(mm,
-- 
2.21.3

