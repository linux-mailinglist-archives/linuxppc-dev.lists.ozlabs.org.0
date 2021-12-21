Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAAE47B9CE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 07:01:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJ5SP0Qfwz3dr3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 17:01:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JJ5QK1tvgz3cDw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 16:59:53 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id EDE8480B64;
 Tue, 21 Dec 2021 00:59:45 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH llvm 5/6] powerpc/mm: Switch obsolete dssall to .long
Date: Tue, 21 Dec 2021 16:59:03 +1100
Message-Id: <20211221055904.555763-6-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211221055904.555763-1-aik@ozlabs.ru>
References: <20211221055904.555763-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, Alan Modra <amodra@au1.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The dssall ("Data Stream Stop All") instruction is obsolete altogether
with other Data Cache Instructions since ISA 2.03 (year 2006).

LLVM IAS does not support it but PPC970 seems to be using it.
This switches dssall to .long as there is no much point in fixing LLVM.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/include/asm/ppc-opcode.h   | 2 ++
 arch/powerpc/kernel/idle.c              | 2 +-
 arch/powerpc/mm/mmu_context.c           | 2 +-
 arch/powerpc/kernel/idle_6xx.S          | 2 +-
 arch/powerpc/kernel/l2cr_6xx.S          | 6 +++---
 arch/powerpc/kernel/swsusp_32.S         | 2 +-
 arch/powerpc/kernel/swsusp_asm64.S      | 2 +-
 arch/powerpc/platforms/powermac/cache.S | 4 ++--
 8 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index f50213e2a3e0..9fe3223e7820 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -249,6 +249,7 @@
 #define PPC_INST_COPY			0x7c20060c
 #define PPC_INST_DCBA			0x7c0005ec
 #define PPC_INST_DCBA_MASK		0xfc0007fe
+#define PPC_INST_DSSALL			0x7e00066c
 #define PPC_INST_ISEL			0x7c00001e
 #define PPC_INST_ISEL_MASK		0xfc00003e
 #define PPC_INST_LSWI			0x7c0004aa
@@ -577,6 +578,7 @@
 #define	PPC_DCBZL(a, b)		stringify_in_c(.long PPC_RAW_DCBZL(a, b))
 #define	PPC_DIVDE(t, a, b)	stringify_in_c(.long PPC_RAW_DIVDE(t, a, b))
 #define	PPC_DIVDEU(t, a, b)	stringify_in_c(.long PPC_RAW_DIVDEU(t, a, b))
+#define PPC_DSSALL		stringify_in_c(.long PPC_INST_DSSALL)
 #define PPC_LQARX(t, a, b, eh)	stringify_in_c(.long PPC_RAW_LQARX(t, a, b, eh))
 #define PPC_STQCX(t, a, b)	stringify_in_c(.long PPC_RAW_STQCX(t, a, b))
 #define PPC_MADDHD(t, a, b, c)	stringify_in_c(.long PPC_RAW_MADDHD(t, a, b, c))
diff --git a/arch/powerpc/kernel/idle.c b/arch/powerpc/kernel/idle.c
index 1f835539fda4..4ad79eb638c6 100644
--- a/arch/powerpc/kernel/idle.c
+++ b/arch/powerpc/kernel/idle.c
@@ -82,7 +82,7 @@ void power4_idle(void)
 		return;
 
 	if (cpu_has_feature(CPU_FTR_ALTIVEC))
-		asm volatile("DSSALL ; sync" ::: "memory");
+		asm volatile(PPC_DSSALL " ; sync" ::: "memory");
 
 	power4_idle_nap();
 
diff --git a/arch/powerpc/mm/mmu_context.c b/arch/powerpc/mm/mmu_context.c
index 735c36f26388..1fb9c99f8679 100644
--- a/arch/powerpc/mm/mmu_context.c
+++ b/arch/powerpc/mm/mmu_context.c
@@ -90,7 +90,7 @@ void switch_mm_irqs_off(struct mm_struct *prev, struct mm_struct *next,
 	 * context
 	 */
 	if (cpu_has_feature(CPU_FTR_ALTIVEC))
-		asm volatile ("dssall");
+		asm volatile (PPC_DSSALL);
 
 	if (!new_on_cpu)
 		membarrier_arch_switch_mm(prev, next, tsk);
diff --git a/arch/powerpc/kernel/idle_6xx.S b/arch/powerpc/kernel/idle_6xx.S
index 13cad9297d82..3c097356366b 100644
--- a/arch/powerpc/kernel/idle_6xx.S
+++ b/arch/powerpc/kernel/idle_6xx.S
@@ -129,7 +129,7 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFCLR(CPU_FTR_NO_DPM)
 	mtspr	SPRN_HID0,r4
 BEGIN_FTR_SECTION
-	DSSALL
+	PPC_DSSALL
 	sync
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	lwz	r8,TI_LOCAL_FLAGS(r2)	/* set napping bit */
diff --git a/arch/powerpc/kernel/l2cr_6xx.S b/arch/powerpc/kernel/l2cr_6xx.S
index 225511d73bef..f2e03ed423d0 100644
--- a/arch/powerpc/kernel/l2cr_6xx.S
+++ b/arch/powerpc/kernel/l2cr_6xx.S
@@ -96,7 +96,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_L2CR)
 
 	/* Stop DST streams */
 BEGIN_FTR_SECTION
-	DSSALL
+	PPC_DSSALL
 	sync
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 
@@ -292,7 +292,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_L3CR)
 	isync
 
 	/* Stop DST streams */
-	DSSALL
+	PPC_DSSALL
 	sync
 
 	/* Get the current enable bit of the L3CR into r4 */
@@ -401,7 +401,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_L3CR)
 _GLOBAL(__flush_disable_L1)
 	/* Stop pending alitvec streams and memory accesses */
 BEGIN_FTR_SECTION
-	DSSALL
+	PPC_DSSALL
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
  	sync
 
diff --git a/arch/powerpc/kernel/swsusp_32.S b/arch/powerpc/kernel/swsusp_32.S
index f73f4d72fea4..e0cbd63007f2 100644
--- a/arch/powerpc/kernel/swsusp_32.S
+++ b/arch/powerpc/kernel/swsusp_32.S
@@ -181,7 +181,7 @@ _GLOBAL(swsusp_arch_resume)
 #ifdef CONFIG_ALTIVEC
 	/* Stop pending alitvec streams and memory accesses */
 BEGIN_FTR_SECTION
-	DSSALL
+	PPC_DSSALL
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 #endif
  	sync
diff --git a/arch/powerpc/kernel/swsusp_asm64.S b/arch/powerpc/kernel/swsusp_asm64.S
index 96bb20715aa9..9f1903c7f540 100644
--- a/arch/powerpc/kernel/swsusp_asm64.S
+++ b/arch/powerpc/kernel/swsusp_asm64.S
@@ -141,7 +141,7 @@ END_FW_FTR_SECTION_IFCLR(FW_FEATURE_LPAR)
 _GLOBAL(swsusp_arch_resume)
 	/* Stop pending alitvec streams and memory accesses */
 BEGIN_FTR_SECTION
-	DSSALL
+	PPC_DSSALL
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	sync
 
diff --git a/arch/powerpc/platforms/powermac/cache.S b/arch/powerpc/platforms/powermac/cache.S
index ced225415486..b8ae56e9f414 100644
--- a/arch/powerpc/platforms/powermac/cache.S
+++ b/arch/powerpc/platforms/powermac/cache.S
@@ -48,7 +48,7 @@ flush_disable_75x:
 
 	/* Stop DST streams */
 BEGIN_FTR_SECTION
-	DSSALL
+	PPC_DSSALL
 	sync
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 
@@ -197,7 +197,7 @@ flush_disable_745x:
 	isync
 
 	/* Stop prefetch streams */
-	DSSALL
+	PPC_DSSALL
 	sync
 
 	/* Disable L2 prefetching */
-- 
2.30.2

