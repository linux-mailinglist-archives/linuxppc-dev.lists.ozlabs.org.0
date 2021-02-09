Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E562314D1C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 11:34:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZfR42jZhzDshM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 21:34:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZdb16lLbzDqZx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 20:56:45 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZdZy0r7Lz9txgJ;
 Tue,  9 Feb 2021 10:56:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 8RdQud9Dq9HS; Tue,  9 Feb 2021 10:56:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZdZy032Xz9txg8;
 Tue,  9 Feb 2021 10:56:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F35608B7D7;
 Tue,  9 Feb 2021 10:56:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id uqYTq8RuU0sP; Tue,  9 Feb 2021 10:56:42 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A83F58B7D6;
 Tue,  9 Feb 2021 10:56:42 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7EFF167342; Tue,  9 Feb 2021 09:56:42 +0000 (UTC)
Message-Id: <228837f56456cac656d4600dc06e445a956200cc.1612864003.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612864003.git.christophe.leroy@csgroup.eu>
References: <cover.1612864003.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 18/41] powerpc/32: Use START_EXCEPTION() as much as
 possible
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Feb 2021 09:56:42 +0000 (UTC)
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

Everywhere where it is possible, use START_EXCEPTION().

This will help for proper exception init in future patches.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_40x.S       | 12 +++++------
 arch/powerpc/kernel/head_8xx.S       | 27 +++++++++----------------
 arch/powerpc/kernel/head_book3s_32.S | 30 ++++++++--------------------
 3 files changed, 22 insertions(+), 47 deletions(-)

diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 55fa99c5085c..c14a71e0d6d3 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -247,17 +247,15 @@ _ENTRY(crit_esr)
 	EXCEPTION(0x0F00, Trap_0F, unknown_exception, EXC_XFER_STD)
 
 /* 0x1000 - Programmable Interval Timer (PIT) Exception */
-	. = 0x1000
+	START_EXCEPTION(0x1000, DecrementerTrap)
 	b Decrementer
 
-/* 0x1010 - Fixed Interval Timer (FIT) Exception
-*/
-	. = 0x1010
+/* 0x1010 - Fixed Interval Timer (FIT) Exception */
+	START_EXCEPTION(0x1010, FITExceptionTrap)
 	b FITException
 
-/* 0x1020 - Watchdog Timer (WDT) Exception
-*/
-	. = 0x1020
+/* 0x1020 - Watchdog Timer (WDT) Exception */
+	START_EXCEPTION(0x1020, WDTExceptionTrap)
 	b WDTException
 
 /* 0x1100 - Data TLB Miss Exception
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index b63445c55f4d..11789a077d76 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -121,8 +121,7 @@ instruction_counter:
 	EXCEPTION(0x100, Reset, system_reset_exception, EXC_XFER_STD)
 
 /* Machine check */
-	. = 0x200
-MachineCheck:
+	START_EXCEPTION(0x200, MachineCheck)
 	EXCEPTION_PROLOG handle_dar_dsisr=1
 	addi r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0x200, machine_check_exception)
@@ -131,8 +130,7 @@ MachineCheck:
 	EXCEPTION(0x500, HardwareInterrupt, do_IRQ, EXC_XFER_LITE)
 
 /* Alignment exception */
-	. = 0x600
-Alignment:
+	START_EXCEPTION(0x600, Alignment)
 	EXCEPTION_PROLOG handle_dar_dsisr=1
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	b	.Lalignment_exception_ool
@@ -149,8 +147,7 @@ Alignment:
 	EXC_XFER_STD(0x600, alignment_exception)
 
 /* System call */
-	. = 0xc00
-SystemCall:
+	START_EXCEPTION(0xc00, SystemCall)
 	SYSCALL_ENTRY	0xc00
 
 /* Single step - not used on 601 */
@@ -161,7 +158,6 @@ SystemCall:
  */
 	EXCEPTION(0x1000, SoftEmu, emulation_assist_interrupt, EXC_XFER_STD)
 
-	. = 0x1100
 /*
  * For the MPC8xx, this is a software tablewalk to load the instruction
  * TLB.  The task switch loads the M_TWB register with the pointer to the first
@@ -183,7 +179,7 @@ SystemCall:
 #define INVALIDATE_ADJACENT_PAGES_CPU15(addr, tmp)
 #endif
 
-InstructionTLBMiss:
+	START_EXCEPTION(0x1100, InstructionTLBMiss)
 	mtspr	SPRN_SPRG_SCRATCH2, r10
 	mtspr	SPRN_M_TW, r11
 
@@ -239,8 +235,7 @@ InstructionTLBMiss:
 	rfi
 #endif
 
-	. = 0x1200
-DataStoreTLBMiss:
+	START_EXCEPTION(0x1200, DataStoreTLBMiss)
 	mtspr	SPRN_SPRG_SCRATCH2, r10
 	mtspr	SPRN_M_TW, r11
 	mfcr	r11
@@ -303,8 +298,7 @@ DataStoreTLBMiss:
  * to many reasons, such as executing guarded memory or illegal instruction
  * addresses.  There is nothing to do but handle a big time error fault.
  */
-	. = 0x1300
-InstructionTLBError:
+	START_EXCEPTION(0x1300, InstructionTLBError)
 	EXCEPTION_PROLOG
 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
 	andis.	r10,r9,SRR1_ISI_NOPT@h
@@ -320,8 +314,7 @@ InstructionTLBError:
  * many reasons, including a dirty update to a pte.  We bail out to
  * a higher level function that can handle it.
  */
-	. = 0x1400
-DataTLBError:
+	START_EXCEPTION(0x1400, DataTLBError)
 	EXCEPTION_PROLOG_0 handle_dar_dsisr=1
 	mfspr	r11, SPRN_DAR
 	cmpwi	cr1, r11, RPN_PATTERN
@@ -354,8 +347,7 @@ do_databreakpoint:
 	stw	r4,_DAR(r11)
 	EXC_XFER_STD(0x1c00, do_break)
 
-	. = 0x1c00
-DataBreakpoint:
+	START_EXCEPTION(0x1c00, DataBreakpoint)
 	EXCEPTION_PROLOG_0 handle_dar_dsisr=1
 	mfspr	r11, SPRN_SRR0
 	cmplwi	cr1, r11, (.Ldtlbie - PAGE_OFFSET)@l
@@ -368,8 +360,7 @@ DataBreakpoint:
 	rfi
 
 #ifdef CONFIG_PERF_EVENTS
-	. = 0x1d00
-InstructionBreakpoint:
+	START_EXCEPTION(0x1d00, InstructionBreakpoint)
 	mtspr	SPRN_SPRG_SCRATCH0, r10
 	lwz	r10, (instruction_counter - PAGE_OFFSET)@l(0)
 	addi	r10, r10, -1
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 9dc05890477d..8f5c8c8da63d 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -255,9 +255,7 @@ __secondary_hold_acknowledge:
  * pointer when we take an exception from supervisor mode.)
  *	-- paulus.
  */
-	. = 0x200
-	DO_KVM  0x200
-MachineCheck:
+	START_EXCEPTION(0x200, MachineCheck)
 	EXCEPTION_PROLOG_0
 #ifdef CONFIG_PPC_CHRP
 	mtspr	SPRN_SPRG_SCRATCH2,r1
@@ -278,9 +276,7 @@ MachineCheck:
 #endif
 
 /* Data access exception. */
-	. = 0x300
-	DO_KVM  0x300
-DataAccess:
+	START_EXCEPTION(0x300, DataAccess)
 #ifdef CONFIG_PPC_BOOK3S_604
 BEGIN_MMU_FTR_SECTION
 	mtspr	SPRN_SPRG_SCRATCH2,r10
@@ -304,9 +300,7 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_HPTE_TABLE)
 	b	handle_page_fault_tramp_1
 
 /* Instruction access exception. */
-	. = 0x400
-	DO_KVM  0x400
-InstructionAccess:
+	START_EXCEPTION(0x400, InstructionAccess)
 	mtspr	SPRN_SPRG_SCRATCH0,r10
 	mtspr	SPRN_SPRG_SCRATCH1,r11
 	mfspr	r10, SPRN_SPRG_THREAD
@@ -336,9 +330,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	EXCEPTION(0x500, HardwareInterrupt, do_IRQ, EXC_XFER_LITE)
 
 /* Alignment exception */
-	. = 0x600
-	DO_KVM  0x600
-Alignment:
+	START_EXCEPTION(0x600, Alignment)
 	EXCEPTION_PROLOG handle_dar_dsisr=1
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	b	alignment_exception_tramp
@@ -347,9 +339,7 @@ Alignment:
 	EXCEPTION(0x700, ProgramCheck, program_check_exception, EXC_XFER_STD)
 
 /* Floating-point unavailable */
-	. = 0x800
-	DO_KVM  0x800
-FPUnavailable:
+	START_EXCEPTION(0x800, FPUnavailable)
 #ifdef CONFIG_PPC_FPU
 BEGIN_FTR_SECTION
 /*
@@ -375,9 +365,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_FPU_UNAVAILABLE)
 	EXCEPTION(0xb00, Trap_0b, unknown_exception, EXC_XFER_STD)
 
 /* System call */
-	. = 0xc00
-	DO_KVM  0xc00
-SystemCall:
+	START_EXCEPTION(0xc00, SystemCall)
 	SYSCALL_ENTRY	0xc00
 
 	EXCEPTION(0xd00, SingleStep, single_step_exception, EXC_XFER_STD)
@@ -391,12 +379,10 @@ SystemCall:
  * non-altivec kernel running on a machine with altivec just
  * by executing an altivec instruction.
  */
-	. = 0xf00
-	DO_KVM  0xf00
+	START_EXCEPTION(0xf00, PerformanceMonitorTrap)
 	b	PerformanceMonitor
 
-	. = 0xf20
-	DO_KVM  0xf20
+	START_EXCEPTION(0xf20, AltiVecUnavailableTrap)
 	b	AltiVecUnavailable
 
 /*
-- 
2.25.0

