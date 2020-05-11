Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C55281CDDB1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 16:51:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LP5n5QflzDqMm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 00:51:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LLZq0spnzDqLP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 22:58:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=d4+xMBM3; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49LLZn2VsTz9sRY; Mon, 11 May 2020 22:58:09 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49LLZm6cp7z9sRf; Mon, 11 May 2020 22:58:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1589201888;
 bh=DHvbL7nTkE3erBcB6nW2HSrvwX3kthwxvYBTcKDhaUg=;
 h=From:To:Cc:Subject:Date:From;
 b=d4+xMBM3WYYsLvxPLGKwsAOs2Zf3/aq95Kg43LaKzi5gCiD1YeQG8/12jTyJCqauh
 f5xwqAIfuDrFpml1mQruwYe2bm6aH2JCmfugI2l9VVNURROKrpwSDfuWEdK4C7piYK
 L0Sx7wIMAEFGNmXjCRpqVbYIoFIKlHohjciZnRYoegtTMrAwpIC9P3vMN2QsglAgpM
 voqmxT8W6kzpARONm55f9v5CNI5AzOs4ehoZjnVJCtu/dz1Y0UI85Ho5Sq+0CUapAl
 IMaazmiKzReGnJH/DCNF36nCml21O+vCENTsPy/CW6X8yQZwK3uGp9/CaTzpb2V7xb
 wX6tPRZ6k/KaQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v4 1/2] powerpc/64s/hash: Add stress_slb kernel boot option to
 increase SLB faults
Date: Mon, 11 May 2020 22:58:24 +1000
Message-Id: <20200511125825.3081305-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

This option increases the number of SLB misses by limiting the number
of kernel SLB entries, and increased flushing of cached lookaside
information. This helps stress test difficult to hit paths in the
kernel.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
[mpe: Relocate the code into arch/powerpc/mm, s/torture/stress/]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../admin-guide/kernel-parameters.txt         |   5 +
 arch/powerpc/mm/book3s64/hash_utils.c         |   6 +
 arch/powerpc/mm/book3s64/internal.h           |  16 ++
 arch/powerpc/mm/book3s64/slb.c                | 166 +++++++++++++-----
 4 files changed, 148 insertions(+), 45 deletions(-)
 create mode 100644 arch/powerpc/mm/book3s64/internal.h

v4: mpe: Relocate the code into arch/powerpc/mm, s/torture/stress/

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f2a93c8679e8..26ef1d74e642 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -871,6 +871,11 @@
 			can be useful when debugging issues that require an SLB
 			miss to occur.
 
+	stress_slb	[PPC]
+			Limits the number of kernel SLB entries, and flushes
+			them frequently to increase the rate of SLB faults
+			on kernel addresses.
+
 	disable=	[IPV6]
 			See Documentation/networking/ipv6.txt.
 
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 3d727f73a8db..622c6e8e9fa6 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -66,6 +66,9 @@
 
 #include <mm/mmu_decl.h>
 
+#include "internal.h"
+
+
 #ifdef DEBUG
 #define DBG(fmt...) udbg_printf(fmt)
 #else
@@ -870,6 +873,9 @@ static void __init htab_initialize(void)
 		printk(KERN_INFO "Using 1TB segments\n");
 	}
 
+	if (stress_slb_enabled)
+		static_branch_enable(&stress_slb_key);
+
 	/*
 	 * Calculate the required size of the htab.  We want the number of
 	 * PTEGs to equal one half the number of real pages.
diff --git a/arch/powerpc/mm/book3s64/internal.h b/arch/powerpc/mm/book3s64/internal.h
new file mode 100644
index 000000000000..7eda0d30d765
--- /dev/null
+++ b/arch/powerpc/mm/book3s64/internal.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef ARCH_POWERPC_MM_BOOK3S64_INTERNAL_H
+#define ARCH_POWERPC_MM_BOOK3S64_INTERNAL_H
+
+#include <linux/jump_label.h>
+
+extern bool stress_slb_enabled;
+
+DECLARE_STATIC_KEY_FALSE(stress_slb_key);
+
+static inline bool stress_slb(void)
+{
+	return static_branch_unlikely(&stress_slb_key);
+}
+
+#endif /* ARCH_POWERPC_MM_BOOK3S64_INTERNAL_H */
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 716204aee3da..8141e8b40ee5 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -25,6 +25,9 @@
 #include <asm/udbg.h>
 #include <asm/code-patching.h>
 
+#include "internal.h"
+
+
 enum slb_index {
 	LINEAR_INDEX	= 0, /* Kernel linear map  (0xc000000000000000) */
 	KSTACK_INDEX	= 1, /* Kernel stack map */
@@ -54,6 +57,17 @@ static inline unsigned long mk_vsid_data(unsigned long ea, int ssize,
 	return __mk_vsid_data(get_kernel_vsid(ea, ssize), ssize, flags);
 }
 
+bool stress_slb_enabled __initdata;
+
+static int __init parse_stress_slb(char *p)
+{
+	stress_slb_enabled = true;
+	return 0;
+}
+early_param("stress_slb", parse_stress_slb);
+
+__ro_after_init DEFINE_STATIC_KEY_FALSE(stress_slb_key);
+
 static void assert_slb_presence(bool present, unsigned long ea)
 {
 #ifdef CONFIG_DEBUG_VM
@@ -68,7 +82,7 @@ static void assert_slb_presence(bool present, unsigned long ea)
 	 * slbfee. requires bit 24 (PPC bit 39) be clear in RB. Hardware
 	 * ignores all other bits from 0-27, so just clear them all.
 	 */
-	ea &= ~((1UL << 28) - 1);
+	ea &= ~((1UL << SID_SHIFT) - 1);
 	asm volatile(__PPC_SLBFEE_DOT(%0, %1) : "=r"(tmp) : "r"(ea) : "cr0");
 
 	WARN_ON(present == (tmp == 0));
@@ -153,14 +167,42 @@ void slb_flush_all_realmode(void)
 	asm volatile("slbmte %0,%0; slbia" : : "r" (0));
 }
 
+static __always_inline void __slb_flush_and_restore_bolted(bool preserve_kernel_lookaside)
+{
+	struct slb_shadow *p = get_slb_shadow();
+	unsigned long ksp_esid_data, ksp_vsid_data;
+	u32 ih;
+
+	/*
+	 * SLBIA IH=1 on ISA v2.05 and newer processors may preserve lookaside
+	 * information created with Class=0 entries, which we use for kernel
+	 * SLB entries (the SLB entries themselves are still invalidated).
+	 *
+	 * Older processors will ignore this optimisation. Over-invalidation
+	 * is fine because we never rely on lookaside information existing.
+	 */
+	if (preserve_kernel_lookaside)
+		ih = 1;
+	else
+		ih = 0;
+
+	ksp_esid_data = be64_to_cpu(p->save_area[KSTACK_INDEX].esid);
+	ksp_vsid_data = be64_to_cpu(p->save_area[KSTACK_INDEX].vsid);
+
+	asm volatile(PPC_SLBIA(%0)"	\n"
+		     "slbmte	%1, %2	\n"
+		     :: "i" (ih),
+			"r" (ksp_vsid_data),
+			"r" (ksp_esid_data)
+		     : "memory");
+}
+
 /*
  * This flushes non-bolted entries, it can be run in virtual mode. Must
  * be called with interrupts disabled.
  */
 void slb_flush_and_restore_bolted(void)
 {
-	struct slb_shadow *p = get_slb_shadow();
-
 	BUILD_BUG_ON(SLB_NUM_BOLTED != 2);
 
 	WARN_ON(!irqs_disabled());
@@ -171,13 +213,10 @@ void slb_flush_and_restore_bolted(void)
 	 */
 	hard_irq_disable();
 
-	asm volatile("isync\n"
-		     "slbia\n"
-		     "slbmte  %0, %1\n"
-		     "isync\n"
-		     :: "r" (be64_to_cpu(p->save_area[KSTACK_INDEX].vsid)),
-			"r" (be64_to_cpu(p->save_area[KSTACK_INDEX].esid))
-		     : "memory");
+	isync();
+	__slb_flush_and_restore_bolted(false);
+	isync();
+
 	assert_slb_presence(true, get_paca()->kstack);
 
 	get_paca()->slb_cache_ptr = 0;
@@ -400,6 +439,30 @@ void preload_new_slb_context(unsigned long start, unsigned long sp)
 	local_irq_enable();
 }
 
+static void slb_cache_slbie_kernel(unsigned int index)
+{
+	unsigned long slbie_data = get_paca()->slb_cache[index];
+	unsigned long ksp = get_paca()->kstack;
+
+	slbie_data <<= SID_SHIFT;
+	slbie_data |= 0xc000000000000000ULL;
+	if ((ksp & slb_esid_mask(mmu_kernel_ssize)) == slbie_data)
+		return;
+	slbie_data |= mmu_kernel_ssize << SLBIE_SSIZE_SHIFT;
+
+	asm volatile("slbie %0" : : "r" (slbie_data));
+}
+
+static void slb_cache_slbie_user(unsigned int index)
+{
+	unsigned long slbie_data = get_paca()->slb_cache[index];
+
+	slbie_data <<= SID_SHIFT;
+	slbie_data |= user_segment_size(slbie_data) << SLBIE_SSIZE_SHIFT;
+	slbie_data |= SLBIE_C; /* user slbs have C=1 */
+
+	asm volatile("slbie %0" : : "r" (slbie_data));
+}
 
 /* Flush all user entries from the segment table of the current processor. */
 void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
@@ -414,8 +477,14 @@ void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
 	 * which would update the slb_cache/slb_cache_ptr fields in the PACA.
 	 */
 	hard_irq_disable();
-	asm volatile("isync" : : : "memory");
-	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
+	isync();
+	if (stress_slb()) {
+		__slb_flush_and_restore_bolted(false);
+		isync();
+		get_paca()->slb_cache_ptr = 0;
+		get_paca()->slb_kern_bitmap = (1U << SLB_NUM_BOLTED) - 1;
+
+	} else if (cpu_has_feature(CPU_FTR_ARCH_300)) {
 		/*
 		 * SLBIA IH=3 invalidates all Class=1 SLBEs and their
 		 * associated lookaside structures, which matches what
@@ -423,47 +492,29 @@ void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
 		 * cache.
 		 */
 		asm volatile(PPC_SLBIA(3));
+
 	} else {
 		unsigned long offset = get_paca()->slb_cache_ptr;
 
 		if (!mmu_has_feature(MMU_FTR_NO_SLBIE_B) &&
 		    offset <= SLB_CACHE_ENTRIES) {
-			unsigned long slbie_data = 0;
-
-			for (i = 0; i < offset; i++) {
-				unsigned long ea;
-
-				ea = (unsigned long)
-					get_paca()->slb_cache[i] << SID_SHIFT;
-				/*
-				 * Could assert_slb_presence(true) here, but
-				 * hypervisor or machine check could have come
-				 * in and removed the entry at this point.
-				 */
-
-				slbie_data = ea;
-				slbie_data |= user_segment_size(slbie_data)
-						<< SLBIE_SSIZE_SHIFT;
-				slbie_data |= SLBIE_C; /* user slbs have C=1 */
-				asm volatile("slbie %0" : : "r" (slbie_data));
-			}
+			/*
+			 * Could assert_slb_presence(true) here, but
+			 * hypervisor or machine check could have come
+			 * in and removed the entry at this point.
+			 */
+
+			for (i = 0; i < offset; i++)
+				slb_cache_slbie_user(i);
 
 			/* Workaround POWER5 < DD2.1 issue */
 			if (!cpu_has_feature(CPU_FTR_ARCH_207S) && offset == 1)
-				asm volatile("slbie %0" : : "r" (slbie_data));
+				slb_cache_slbie_user(0);
 
 		} else {
-			struct slb_shadow *p = get_slb_shadow();
-			unsigned long ksp_esid_data =
-				be64_to_cpu(p->save_area[KSTACK_INDEX].esid);
-			unsigned long ksp_vsid_data =
-				be64_to_cpu(p->save_area[KSTACK_INDEX].vsid);
-
-			asm volatile(PPC_SLBIA(1) "\n"
-				     "slbmte	%0,%1\n"
-				     "isync"
-				     :: "r"(ksp_vsid_data),
-					"r"(ksp_esid_data));
+			/* Flush but retain kernel lookaside information */
+			__slb_flush_and_restore_bolted(true);
+			isync();
 
 			get_paca()->slb_kern_bitmap = (1U << SLB_NUM_BOLTED) - 1;
 		}
@@ -503,7 +554,7 @@ void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
 	 * address accesses by the kernel (user mode won't happen until
 	 * rfid, which is safe).
 	 */
-	asm volatile("isync" : : : "memory");
+	isync();
 }
 
 void slb_set_size(u16 size)
@@ -571,6 +622,9 @@ static void slb_cache_update(unsigned long esid_data)
 	if (cpu_has_feature(CPU_FTR_ARCH_300))
 		return; /* ISAv3.0B and later does not use slb_cache */
 
+	if (stress_slb())
+		return;
+
 	/*
 	 * Now update slb cache entries
 	 */
@@ -580,7 +634,7 @@ static void slb_cache_update(unsigned long esid_data)
 		 * We have space in slb cache for optimized switch_slb().
 		 * Top 36 bits from esid_data as per ISA
 		 */
-		local_paca->slb_cache[slb_cache_index++] = esid_data >> 28;
+		local_paca->slb_cache[slb_cache_index++] = esid_data >> SID_SHIFT;
 		local_paca->slb_cache_ptr++;
 	} else {
 		/*
@@ -671,6 +725,28 @@ static long slb_insert_entry(unsigned long ea, unsigned long context,
 	 * accesses user memory before it returns to userspace with rfid.
 	 */
 	assert_slb_presence(false, ea);
+	if (stress_slb()) {
+		int slb_cache_index = local_paca->slb_cache_ptr;
+
+		/*
+		 * stress_slb() does not use slb cache, repurpose as a
+		 * cache of inserted (non-bolted) kernel SLB entries. All
+		 * non-bolted kernel entries are flushed on any user fault,
+		 * or if there are already 3 non-boled kernel entries.
+		 */
+		BUILD_BUG_ON(SLB_CACHE_ENTRIES < 3);
+		if (!kernel || slb_cache_index == 3) {
+			int i;
+
+			for (i = 0; i < slb_cache_index; i++)
+				slb_cache_slbie_kernel(i);
+			slb_cache_index = 0;
+		}
+
+		if (kernel)
+			local_paca->slb_cache[slb_cache_index++] = esid_data >> SID_SHIFT;
+		local_paca->slb_cache_ptr = slb_cache_index;
+	}
 	asm volatile("slbmte %0, %1" : : "r" (vsid_data), "r" (esid_data));
 
 	barrier();
-- 
2.25.1

