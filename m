Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E0836476C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 17:49:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPB7l6c97z3by9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 01:49:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPB6l6XM9z2xZn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 01:48:14 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FPB6Y6hfxz9vBLl;
 Mon, 19 Apr 2021 17:48:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0s39wdQb51ZY; Mon, 19 Apr 2021 17:48:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FPB6Y5vjvz9vBLc;
 Mon, 19 Apr 2021 17:48:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BD8BA8B7C9;
 Mon, 19 Apr 2021 17:48:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qKJyktnjQU4U; Mon, 19 Apr 2021 17:48:10 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 64A868B7C6;
 Mon, 19 Apr 2021 17:48:10 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3EDA067A2A; Mon, 19 Apr 2021 15:48:10 +0000 (UTC)
Message-Id: <bd80ace67757f489fc4ecdb76dd1a71511daba94.1618847273.git.christophe.leroy@csgroup.eu>
In-Reply-To: <e1147287bf6f2fb0693048fe8db0298c7870e419.1618847273.git.christophe.leroy@csgroup.eu>
References: <e1147287bf6f2fb0693048fe8db0298c7870e419.1618847273.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 2/3] powerpc/32s: Enhance readability of trap types
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 sxwjean@gmail.com
Date: Mon, 19 Apr 2021 15:48:10 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch makes use of trap types in head_book3s_32.S

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/interrupt.h |  6 ++++
 arch/powerpc/kernel/head_book3s_32.S | 43 ++++++++++++++--------------
 2 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index cf2c5c3ae716..8970990e3b08 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -27,6 +27,7 @@
 #ifdef CONFIG_PPC_BOOK3S
 #define INTERRUPT_DOORBELL        0xa00
 #define INTERRUPT_PERFMON         0xf00
+#define INTERRUPT_ALTIVEC_UNAVAIL	0xf20
 #endif
 
 /* BookE/BookS/4xx/8xx */
@@ -57,6 +58,11 @@
 #define INTERRUPT_DATA_BREAKPOINT_8xx	0x1c00
 #define INTERRUPT_INST_BREAKPOINT_8xx	0x1d00
 
+/* 603 */
+#define INTERRUPT_INST_TLB_MISS_603		0x1000
+#define INTERRUPT_DATA_LOAD_TLB_MISS_603	0x1100
+#define INTERRUPT_DATA_STORE_TLB_MISS_603	0x1200
+
 #ifndef __ASSEMBLY__
 
 #include <linux/context_tracking.h>
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 18f4ae163f34..065178f19a3d 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -31,6 +31,7 @@
 #include <asm/kvm_book3s_asm.h>
 #include <asm/export.h>
 #include <asm/feature-fixups.h>
+#include <asm/interrupt.h>
 
 #include "head_32.h"
 
@@ -239,7 +240,7 @@ __secondary_hold_acknowledge:
 /* System reset */
 /* core99 pmac starts the seconary here by changing the vector, and
    putting it back to what it was (unknown_async_exception) when done.  */
-	EXCEPTION(0x100, Reset, unknown_async_exception)
+	EXCEPTION(INTERRUPT_SYSTEM_RESET, Reset, unknown_async_exception)
 
 /* Machine check */
 /*
@@ -255,7 +256,7 @@ __secondary_hold_acknowledge:
  * pointer when we take an exception from supervisor mode.)
  *	-- paulus.
  */
-	START_EXCEPTION(0x200, MachineCheck)
+	START_EXCEPTION(INTERRUPT_MACHINE_CHECK, MachineCheck)
 	EXCEPTION_PROLOG_0
 #ifdef CONFIG_PPC_CHRP
 	mtspr	SPRN_SPRG_SCRATCH2,r1
@@ -276,7 +277,7 @@ __secondary_hold_acknowledge:
 	b	interrupt_return
 
 /* Data access exception. */
-	START_EXCEPTION(0x300, DataAccess)
+	START_EXCEPTION(INTERRUPT_DATA_STORAGE, DataAccess)
 #ifdef CONFIG_PPC_BOOK3S_604
 BEGIN_MMU_FTR_SECTION
 	mtspr	SPRN_SPRG_SCRATCH2,r10
@@ -297,7 +298,7 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_HPTE_TABLE)
 #endif
 1:	EXCEPTION_PROLOG_0 handle_dar_dsisr=1
 	EXCEPTION_PROLOG_1
-	EXCEPTION_PROLOG_2 0x300 DataAccess handle_dar_dsisr=1
+	EXCEPTION_PROLOG_2 INTERRUPT_DATA_STORAGE DataAccess handle_dar_dsisr=1
 	prepare_transfer_to_handler
 	lwz	r5, _DSISR(r11)
 	andis.	r0, r5, DSISR_DABRMATCH@h
@@ -310,7 +311,7 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_HPTE_TABLE)
 
 
 /* Instruction access exception. */
-	START_EXCEPTION(0x400, InstructionAccess)
+	START_EXCEPTION(INTERRUPT_INST_STORAGE, InstructionAccess)
 	mtspr	SPRN_SPRG_SCRATCH0,r10
 	mtspr	SPRN_SPRG_SCRATCH1,r11
 	mfspr	r10, SPRN_SPRG_THREAD
@@ -330,7 +331,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	andi.	r11, r11, MSR_PR
 
 	EXCEPTION_PROLOG_1
-	EXCEPTION_PROLOG_2 0x400 InstructionAccess
+	EXCEPTION_PROLOG_2 INTERRUPT_INST_STORAGE InstructionAccess
 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
 	stw	r5, _DSISR(r11)
 	stw	r12, _DAR(r11)
@@ -339,19 +340,19 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	b	interrupt_return
 
 /* External interrupt */
-	EXCEPTION(0x500, HardwareInterrupt, do_IRQ)
+	EXCEPTION(INTERRUPT_EXTERNAL, HardwareInterrupt, do_IRQ)
 
 /* Alignment exception */
-	START_EXCEPTION(0x600, Alignment)
-	EXCEPTION_PROLOG 0x600 Alignment handle_dar_dsisr=1
+	START_EXCEPTION(INTERRUPT_ALIGNMENT, Alignment)
+	EXCEPTION_PROLOG INTERRUPT_ALIGNMENT Alignment handle_dar_dsisr=1
 	prepare_transfer_to_handler
 	bl	alignment_exception
 	REST_NVGPRS(r1)
 	b	interrupt_return
 
 /* Program check exception */
-	START_EXCEPTION(0x700, ProgramCheck)
-	EXCEPTION_PROLOG 0x700 ProgramCheck
+	START_EXCEPTION(INTERRUPT_PROGRAM, ProgramCheck)
+	EXCEPTION_PROLOG INTERRUPT_PROGRAM ProgramCheck
 	prepare_transfer_to_handler
 	bl	program_check_exception
 	REST_NVGPRS(r1)
@@ -367,7 +368,7 @@ BEGIN_FTR_SECTION
  */
 	b 	ProgramCheck
 END_FTR_SECTION_IFSET(CPU_FTR_FPU_UNAVAILABLE)
-	EXCEPTION_PROLOG 0x800 FPUnavailable
+	EXCEPTION_PROLOG INTERRUPT_FP_UNAVAIL FPUnavailable
 	beq	1f
 	bl	load_up_fpu		/* if from user, just load it up */
 	b	fast_exception_return
@@ -379,16 +380,16 @@ END_FTR_SECTION_IFSET(CPU_FTR_FPU_UNAVAILABLE)
 #endif
 
 /* Decrementer */
-	EXCEPTION(0x900, Decrementer, timer_interrupt)
+	EXCEPTION(INTERRUPT_DECREMENTER, Decrementer, timer_interrupt)
 
 	EXCEPTION(0xa00, Trap_0a, unknown_exception)
 	EXCEPTION(0xb00, Trap_0b, unknown_exception)
 
 /* System call */
-	START_EXCEPTION(0xc00, SystemCall)
-	SYSCALL_ENTRY	0xc00
+	START_EXCEPTION(INTERRUPT_SYSCALL, SystemCall)
+	SYSCALL_ENTRY	INTERRUPT_SYSCALL
 
-	EXCEPTION(0xd00, SingleStep, single_step_exception)
+	EXCEPTION(INTERRUPT_TRACE, SingleStep, single_step_exception)
 	EXCEPTION(0xe00, Trap_0e, unknown_exception)
 
 /*
@@ -399,10 +400,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_FPU_UNAVAILABLE)
  * non-altivec kernel running on a machine with altivec just
  * by executing an altivec instruction.
  */
-	START_EXCEPTION(0xf00, PerformanceMonitorTrap)
+	START_EXCEPTION(INTERRUPT_PERFMON, PerformanceMonitorTrap)
 	b	PerformanceMonitor
 
-	START_EXCEPTION(0xf20, AltiVecUnavailableTrap)
+	START_EXCEPTION(INTERRUPT_ALTIVEC_UNAVAIL, AltiVecUnavailableTrap)
 	b	AltiVecUnavailable
 
 	__HEAD
@@ -410,7 +411,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_FPU_UNAVAILABLE)
  * Handle TLB miss for instruction on 603/603e.
  * Note: we get an alternate set of r0 - r3 to use automatically.
  */
-	. = 0x1000
+	. = INTERRUPT_INST_TLB_MISS_603
 InstructionTLBMiss:
 /*
  * r0:	scratch
@@ -476,7 +477,7 @@ InstructionAddressInvalid:
 /*
  * Handle TLB miss for DATA Load operation on 603/603e
  */
-	. = 0x1100
+	. = INTERRUPT_DATA_LOAD_TLB_MISS_603
 DataLoadTLBMiss:
 /*
  * r0:	scratch
@@ -554,7 +555,7 @@ DataAddressInvalid:
 /*
  * Handle TLB miss for DATA Store on 603/603e
  */
-	. = 0x1200
+	. = INTERRUPT_DATA_STORE_TLB_MISS_603
 DataStoreTLBMiss:
 /*
  * r0:	scratch
-- 
2.25.0

