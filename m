Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6719413D4C9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 08:01:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yw8g1m7XzDqVv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 18:01:23 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yvqQ2kbkzDqF1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 17:46:26 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00G6imMc003754; Thu, 16 Jan 2020 01:46:10 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xj5xb7pw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jan 2020 01:46:10 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00G6gO6t016716;
 Thu, 16 Jan 2020 06:46:09 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 2xf75mes76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jan 2020 06:46:09 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00G6k8lu43647392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jan 2020 06:46:08 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED4B46E04C;
 Thu, 16 Jan 2020 06:46:07 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F6556E050;
 Thu, 16 Jan 2020 06:46:04 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.45.56])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 16 Jan 2020 06:46:04 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: akpm@linux-foundation.org, peterz@infradead.org, will@kernel.org,
 mpe@ellerman.id.au
Subject: [PATCH v4 6/9] asm-generic/tlb: Rename HAVE_RCU_TABLE_FREE
Date: Thu, 16 Jan 2020 12:15:28 +0530
Message-Id: <20200116064531.483522-7-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200116064531.483522-1-aneesh.kumar@linux.ibm.com>
References: <20200116064531.483522-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-16_02:2020-01-16,
 2020-01-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=2
 malwarescore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001160055
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
Cc: linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Zijlstra <peterz@infradead.org>

Towards a more consistent naming scheme.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/Kconfig                    |  2 +-
 arch/arm/Kconfig                |  2 +-
 arch/arm/include/asm/tlb.h      |  2 +-
 arch/arm64/Kconfig              |  2 +-
 arch/powerpc/Kconfig            |  2 +-
 arch/s390/Kconfig               |  2 +-
 arch/sparc/Kconfig              |  2 +-
 arch/sparc/include/asm/tlb_64.h |  2 +-
 arch/x86/Kconfig                |  2 +-
 arch/x86/include/asm/tlb.h      |  4 ++--
 include/asm-generic/tlb.h       | 10 +++++-----
 mm/gup.c                        |  2 +-
 mm/mmu_gather.c                 |  8 ++++----
 13 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 5e907a954532..501d565690b5 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -393,7 +393,7 @@ config HAVE_ARCH_JUMP_LABEL
 config HAVE_ARCH_JUMP_LABEL_RELATIVE
 	bool
 
-config HAVE_RCU_TABLE_FREE
+config MMU_GATHER_RCU_TABLE_FREE
 	bool
 
 config HAVE_MMU_GATHER_PAGE_SIZE
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 96dab76da3b3..36445579243c 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -102,7 +102,7 @@ config ARM
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
-	select HAVE_RCU_TABLE_FREE if SMP && ARM_LPAE
+	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
 	select HAVE_STACKPROTECTOR
diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index 669474add486..46a21cee3442 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -37,7 +37,7 @@ static inline void __tlb_remove_table(void *_table)
 
 #include <asm-generic/tlb.h>
 
-#ifndef CONFIG_HAVE_RCU_TABLE_FREE
+#ifndef CONFIG_MMU_GATHER_RCU_TABLE_FREE
 #define tlb_remove_table(tlb, entry) tlb_remove_page(tlb, entry)
 #endif
 
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e688dfad0b72..a434f7c2438f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -162,7 +162,7 @@ config ARM64
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_FUNCTION_ARG_ACCESS_API
-	select HAVE_RCU_TABLE_FREE
+	select MMU_GATHER_RCU_TABLE_FREE
 	select HAVE_RSEQ
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index f9970f87612e..955759234776 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -222,7 +222,7 @@ config PPC
 	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENTS_NMI && !HAVE_HARDLOCKUP_DETECTOR_ARCH
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
-	select HAVE_RCU_TABLE_FREE
+	select MMU_GATHER_RCU_TABLE_FREE
 	select HAVE_MMU_GATHER_PAGE_SIZE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE		if PPC_BOOK3S_64 && CPU_LITTLE_ENDIAN
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index bc88841d335d..e2cde82a1a3c 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -169,7 +169,7 @@ config S390
 	select HAVE_OPROFILE
 	select HAVE_PCI
 	select HAVE_PERF_EVENTS
-	select HAVE_RCU_TABLE_FREE
+	select MMU_GATHER_RCU_TABLE_FREE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 18e9fb6fcf1b..c703eb6b7461 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -64,7 +64,7 @@ config SPARC64
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_KRETPROBES
 	select HAVE_KPROBES
-	select HAVE_RCU_TABLE_FREE if SMP
+	select MMU_GATHER_RCU_TABLE_FREE
 	select HAVE_MEMBLOCK_NODE_MAP
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select HAVE_DYNAMIC_FTRACE
diff --git a/arch/sparc/include/asm/tlb_64.h b/arch/sparc/include/asm/tlb_64.h
index 8cb8f3833239..6820d357581c 100644
--- a/arch/sparc/include/asm/tlb_64.h
+++ b/arch/sparc/include/asm/tlb_64.h
@@ -33,7 +33,7 @@ void flush_tlb_pending(void);
  * and therefore we don't need a TLBI when freeing page-table pages.
  */
 
-#ifdef CONFIG_HAVE_RCU_TABLE_FREE
+#ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
 #define tlb_needs_table_invalidate()	(false)
 #endif
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 5e8949953660..f809bed408dd 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -200,7 +200,7 @@ config X86
 	select HAVE_PCI
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
-	select HAVE_RCU_TABLE_FREE		if PARAVIRT
+	select MMU_GATHER_RCU_TABLE_FREE		if PARAVIRT
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE		if X86_64 && (UNWINDER_FRAME_POINTER || UNWINDER_ORC) && STACK_VALIDATION
 	select HAVE_FUNCTION_ARG_ACCESS_API
diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index f23e7aaff4cd..820082bd6880 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -29,8 +29,8 @@ static inline void tlb_flush(struct mmu_gather *tlb)
  * shootdown, enablement code for several hypervisors overrides
  * .flush_tlb_others hook in pv_mmu_ops and implements it by issuing
  * a hypercall. To keep software pagetable walkers safe in this case we
- * switch to RCU based table free (HAVE_RCU_TABLE_FREE). See the comment
- * below 'ifdef CONFIG_HAVE_RCU_TABLE_FREE' in include/asm-generic/tlb.h
+ * switch to RCU based table free (MMU_GATHER_RCU_TABLE_FREE). See the comment
+ * below 'ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE' in include/asm-generic/tlb.h
  * for more details.
  */
 static inline void __tlb_remove_table(void *table)
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 1a4cea5f95df..04a1b8f08eea 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -126,7 +126,7 @@
  *  This ensures we call tlb_flush() every time tlb_change_page_size() actually
  *  changes the size and provides mmu_gather::page_size to tlb_flush().
  *
- *  HAVE_RCU_TABLE_FREE
+ *  MMU_GATHER_RCU_TABLE_FREE
  *
  *  This provides tlb_remove_table(), to be used instead of tlb_remove_page()
  *  for page directores (__p*_free_tlb()). This provides separate freeing of
@@ -142,7 +142,7 @@
  *  Use this if your architecture lacks an efficient flush_tlb_range().
  */
 
-#ifdef CONFIG_HAVE_RCU_TABLE_FREE
+#ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
 /*
  * Semi RCU freeing of the page directories.
  *
@@ -193,10 +193,10 @@ extern void tlb_remove_table(struct mmu_gather *tlb, void *table);
 #else
 
 #ifdef tlb_needs_table_invalidate
-#error tlb_needs_table_invalidate() requires HAVE_RCU_TABLE_FREE
+#error tlb_needs_table_invalidate() requires MMU_GATHER_RCU_TABLE_FREE
 #endif
 
-#endif /* CONFIG_HAVE_RCU_TABLE_FREE */
+#endif /* CONFIG_MMU_GATHER_RCU_TABLE_FREE */
 
 
 #ifndef CONFIG_HAVE_MMU_GATHER_NO_GATHER
@@ -235,7 +235,7 @@ extern bool __tlb_remove_page_size(struct mmu_gather *tlb, struct page *page,
 struct mmu_gather {
 	struct mm_struct	*mm;
 
-#ifdef CONFIG_HAVE_RCU_TABLE_FREE
+#ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
 	struct mmu_table_batch	*batch;
 #endif
 
diff --git a/mm/gup.c b/mm/gup.c
index 7646bf993b25..789fadc011b8 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1729,7 +1729,7 @@ EXPORT_SYMBOL(get_user_pages_unlocked);
  * Before activating this code, please be aware that the following assumptions
  * are currently made:
  *
- *  *) Either HAVE_RCU_TABLE_FREE is enabled, and tlb_remove_table() is used to
+ *  *) Either MMU_GATHER_RCU_TABLE_FREE is enabled, and tlb_remove_table() is used to
  *  free pages containing page tables or TLB flushing requires IPI broadcast.
  *
  *  *) ptes can be read atomically by the architecture.
diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
index 7c1b8f67af7b..86bb2176e173 100644
--- a/mm/mmu_gather.c
+++ b/mm/mmu_gather.c
@@ -91,7 +91,7 @@ bool __tlb_remove_page_size(struct mmu_gather *tlb, struct page *page, int page_
 
 #endif /* HAVE_MMU_GATHER_NO_GATHER */
 
-#ifdef CONFIG_HAVE_RCU_TABLE_FREE
+#ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
 
 /*
  * See the comment near struct mmu_table_batch.
@@ -173,11 +173,11 @@ void tlb_remove_table(struct mmu_gather *tlb, void *table)
 		tlb_table_flush(tlb);
 }
 
-#endif /* CONFIG_HAVE_RCU_TABLE_FREE */
+#endif /* CONFIG_MMU_GATHER_RCU_TABLE_FREE */
 
 static void tlb_flush_mmu_free(struct mmu_gather *tlb)
 {
-#ifdef CONFIG_HAVE_RCU_TABLE_FREE
+#ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
 	tlb_table_flush(tlb);
 #endif
 #ifndef CONFIG_HAVE_MMU_GATHER_NO_GATHER
@@ -220,7 +220,7 @@ void tlb_gather_mmu(struct mmu_gather *tlb, struct mm_struct *mm,
 	tlb->batch_count = 0;
 #endif
 
-#ifdef CONFIG_HAVE_RCU_TABLE_FREE
+#ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
 	tlb->batch = NULL;
 #endif
 #ifdef CONFIG_HAVE_MMU_GATHER_PAGE_SIZE
-- 
2.24.1

