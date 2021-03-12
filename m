Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1500338DEB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 13:56:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dxm6M64dCz3gP5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 23:56:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxlzD162sz3dJn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 23:50:32 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dxlz85TQYz9ttBT;
 Fri, 12 Mar 2021 13:50:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id QsrkOJp3gOSy; Fri, 12 Mar 2021 13:50:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dxlz84jc3z9ttDF;
 Fri, 12 Mar 2021 13:50:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9DCAF8B812;
 Fri, 12 Mar 2021 13:50:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4GZE74XQfytK; Fri, 12 Mar 2021 13:50:29 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 499FF8B764;
 Fri, 12 Mar 2021 13:50:29 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 22CB2675C9; Fri, 12 Mar 2021 12:50:29 +0000 (UTC)
Message-Id: <38b31ca4bc782a4985bc7952a675404d7ff27c24.1615552867.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615552866.git.christophe.leroy@csgroup.eu>
References: <cover.1615552866.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 19/41] powerpc/32: Move exception prolog code into .text
 once MMU is back on
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Fri, 12 Mar 2021 12:50:29 +0000 (UTC)
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

The space in the head section is rather constrained by the fact that
exception vectors are spread every 0x100 bytes and sometimes we
need to have "out of line" code because it doesn't fit.

Now that we are enabling MMU early in the prolog, take that opportunity
to jump somewhere else in the .text section where we don't have any
space constraint.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_32.h        |  5 ++++
 arch/powerpc/kernel/head_40x.S       |  6 +++++
 arch/powerpc/kernel/head_8xx.S       | 25 ++++++++------------
 arch/powerpc/kernel/head_book3s_32.S | 34 ++++++++++++----------------
 4 files changed, 36 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index d97ec94b34da..3c0aa4538514 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -70,6 +70,8 @@
 	mtspr	SPRN_SRR0, r11
 	mfspr	r11, SPRN_SPRG_SCRATCH2
 	rfi
+
+	.text
 1:
 	stw	r11,GPR1(r1)
 	stw	r11,0(r1)
@@ -163,12 +165,14 @@
  */
 #ifdef CONFIG_PPC_BOOK3S
 #define	START_EXCEPTION(n, label)		\
+	__HEAD;					\
 	. = n;					\
 	DO_KVM n;				\
 label:
 
 #else
 #define	START_EXCEPTION(n, label)		\
+	__HEAD;					\
 	. = n;					\
 label:
 
@@ -196,6 +200,7 @@
 			  ret_from_except)
 
 .macro vmap_stack_overflow_exception
+	__HEAD
 vmap_stack_overflow:
 #ifdef CONFIG_SMP
 	mfspr	r1, SPRN_SPRG_THREAD
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index c14a71e0d6d3..e7d8856714d3 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -132,6 +132,8 @@ _ENTRY(crit_esr)
 	ori	r11, r11, 1f@l
 	mtspr	SPRN_SRR0, r11
 	rfi
+
+	.text
 1:
 	lwz	r11,crit_r1@l(0)
 	stw	r11,GPR1(r1)
@@ -496,6 +498,7 @@ _ENTRY(crit_esr)
 		crit_transfer_to_handler, ret_from_crit_exc)
 
 	/* Programmable Interval Timer (PIT) Exception. (from 0x1000) */
+	__HEAD
 Decrementer:
 	EXCEPTION_PROLOG
 	lis	r0,TSR_PIS@h
@@ -504,12 +507,14 @@ Decrementer:
 	EXC_XFER_LITE(0x1000, timer_interrupt)
 
 	/* Fixed Interval Timer (FIT) Exception. (from 0x1010) */
+	__HEAD
 FITException:
 	EXCEPTION_PROLOG
 	addi	r3,r1,STACK_FRAME_OVERHEAD;
 	EXC_XFER_STD(0x1010, unknown_exception)
 
 	/* Watchdog Timer (WDT) Exception. (from 0x1020) */
+	__HEAD
 WDTException:
 	CRITICAL_EXCEPTION_PROLOG;
 	addi	r3,r1,STACK_FRAME_OVERHEAD;
@@ -523,6 +528,7 @@ WDTException:
  * reserved.
  */
 
+	__HEAD
 	/* Damn, I came up one instruction too many to fit into the
 	 * exception space :-).  Both the instruction and data TLB
 	 * miss get to this point to load the TLB.
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 11789a077d76..d16d0ec71bb2 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -133,7 +133,7 @@ instruction_counter:
 	START_EXCEPTION(0x600, Alignment)
 	EXCEPTION_PROLOG handle_dar_dsisr=1
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	b	.Lalignment_exception_ool
+	EXC_XFER_STD(0x600, alignment_exception)
 
 /* Program check exception */
 	EXCEPTION(0x700, ProgramCheck, program_check_exception, EXC_XFER_STD)
@@ -141,11 +141,6 @@ instruction_counter:
 /* Decrementer */
 	EXCEPTION(0x900, Decrementer, timer_interrupt, EXC_XFER_LITE)
 
-	/* With VMAP_STACK there's not enough room for this at 0x600 */
-	. = 0xa00
-.Lalignment_exception_ool:
-	EXC_XFER_STD(0x600, alignment_exception)
-
 /* System call */
 	START_EXCEPTION(0xc00, SystemCall)
 	SYSCALL_ENTRY	0xc00
@@ -339,26 +334,25 @@ DARFixed:/* Return from dcbx instruction bug workaround */
  * support of breakpoints and such.  Someday I will get around to
  * using them.
  */
-do_databreakpoint:
-	EXCEPTION_PROLOG_1
-	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	mfspr	r4,SPRN_BAR
-	stw	r4,_DAR(r11)
-	EXC_XFER_STD(0x1c00, do_break)
-
 	START_EXCEPTION(0x1c00, DataBreakpoint)
 	EXCEPTION_PROLOG_0 handle_dar_dsisr=1
 	mfspr	r11, SPRN_SRR0
 	cmplwi	cr1, r11, (.Ldtlbie - PAGE_OFFSET)@l
 	cmplwi	cr7, r11, (.Litlbie - PAGE_OFFSET)@l
 	cror	4*cr1+eq, 4*cr1+eq, 4*cr7+eq
-	bne	cr1, do_databreakpoint
+	bne	cr1, 1f
 	mtcr	r10
 	mfspr	r10, SPRN_SPRG_SCRATCH0
 	mfspr	r11, SPRN_SPRG_SCRATCH1
 	rfi
 
+1:	EXCEPTION_PROLOG_1
+	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	mfspr	r4,SPRN_BAR
+	stw	r4,_DAR(r11)
+	EXC_XFER_STD(0x1c00, do_break)
+
 #ifdef CONFIG_PERF_EVENTS
 	START_EXCEPTION(0x1d00, InstructionBreakpoint)
 	mtspr	SPRN_SPRG_SCRATCH0, r10
@@ -376,6 +370,7 @@ do_databreakpoint:
 	EXCEPTION(0x1e00, Trap_1e, unknown_exception, EXC_XFER_STD)
 	EXCEPTION(0x1f00, Trap_1f, unknown_exception, EXC_XFER_STD)
 
+	__HEAD
 	. = 0x2000
 
 /* This is the procedure to calculate the data EA for buggy dcbx,dcbi instructions
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 17510c99802d..4a74bbe7462b 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -269,11 +269,10 @@ __secondary_hold_acknowledge:
 7:	EXCEPTION_PROLOG_2
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_CHRP
-	beq	cr1, machine_check_tramp
+	beq	cr1, 1f
 	twi	31, 0, 0
-#else
-	b	machine_check_tramp
 #endif
+1:	EXC_XFER_STD(0x200, machine_check_exception)
 
 /* Data access exception. */
 	START_EXCEPTION(0x300, DataAccess)
@@ -297,7 +296,13 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_HPTE_TABLE)
 #endif
 1:	EXCEPTION_PROLOG_0 handle_dar_dsisr=1
 	EXCEPTION_PROLOG_1
-	b	handle_page_fault_tramp_1
+	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
+	lwz	r5, _DSISR(r11)
+	andis.	r0, r5, DSISR_DABRMATCH@h
+	bne-	1f
+	EXC_XFER_LITE(0x300, handle_page_fault)
+1:	EXC_XFER_STD(0x300, do_break)
+
 
 /* Instruction access exception. */
 	START_EXCEPTION(0x400, InstructionAccess)
@@ -333,7 +338,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	START_EXCEPTION(0x600, Alignment)
 	EXCEPTION_PROLOG handle_dar_dsisr=1
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	b	alignment_exception_tramp
+	EXC_XFER_STD(0x600, alignment_exception)
 
 /* Program check exception */
 	EXCEPTION(0x700, ProgramCheck, program_check_exception, EXC_XFER_STD)
@@ -385,6 +390,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_FPU_UNAVAILABLE)
 	START_EXCEPTION(0xf20, AltiVecUnavailableTrap)
 	b	AltiVecUnavailable
 
+	__HEAD
 /*
  * Handle TLB miss for instruction on 603/603e.
  * Note: we get an alternate set of r0 - r3 to use automatically.
@@ -627,22 +633,9 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_NEED_DTLB_SW_LRU)
 	EXCEPTION(0x2e00, Trap_2e, unknown_exception, EXC_XFER_STD)
 	EXCEPTION(0x2f00, Trap_2f, unknown_exception, EXC_XFER_STD)
 
+	__HEAD
 	. = 0x3000
 
-machine_check_tramp:
-	EXC_XFER_STD(0x200, machine_check_exception)
-
-alignment_exception_tramp:
-	EXC_XFER_STD(0x600, alignment_exception)
-
-handle_page_fault_tramp_1:
-	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
-	lwz	r5, _DSISR(r11)
-	andis.	r0, r5, DSISR_DABRMATCH@h
-	bne-	1f
-	EXC_XFER_LITE(0x300, handle_page_fault)
-1:	EXC_XFER_STD(0x300, do_break)
-
 #ifdef CONFIG_PPC_BOOK3S_604
 .macro save_regs_thread		thread
 	stw	r0, THR0(\thread)
@@ -721,6 +714,7 @@ fast_hash_page_return:
 	vmap_stack_overflow_exception
 #endif
 
+	__HEAD
 AltiVecUnavailable:
 	EXCEPTION_PROLOG
 #ifdef CONFIG_ALTIVEC
@@ -731,12 +725,14 @@ AltiVecUnavailable:
 1:	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_LITE(0xf20, altivec_unavailable_exception)
 
+	__HEAD
 PerformanceMonitor:
 	EXCEPTION_PROLOG
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0xf00, performance_monitor_exception)
 
 
+	__HEAD
 /*
  * This code is jumped to from the startup code to copy
  * the kernel image to physical address PHYSICAL_START.
-- 
2.25.0

