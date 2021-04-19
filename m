Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8436C364769
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 17:48:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPB745NtZz30MK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 01:48:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPB6l6VZ7z2xZf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 01:48:13 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FPB6Y1CDZz9vBLd;
 Mon, 19 Apr 2021 17:48:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 8DR7VV2JdXfN; Mon, 19 Apr 2021 17:48:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FPB6Y0QZNz9vBLc;
 Mon, 19 Apr 2021 17:48:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0B4888B7CB;
 Mon, 19 Apr 2021 17:48:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id H3FWIUzolcst; Mon, 19 Apr 2021 17:48:09 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 881A08B7C6;
 Mon, 19 Apr 2021 17:48:09 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3CBEA67A2A; Mon, 19 Apr 2021 15:48:09 +0000 (UTC)
Message-Id: <e1147287bf6f2fb0693048fe8db0298c7870e419.1618847273.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/3] powerpc/8xx: Enhance readability of trap types
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 sxwjean@gmail.com
Date: Mon, 19 Apr 2021 15:48:09 +0000 (UTC)
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

This patch makes use of trap types in head_8xx.S

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/interrupt.h | 29 ++++++++++++----
 arch/powerpc/kernel/head_8xx.S       | 49 ++++++++++++++--------------
 2 files changed, 47 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index ed2c4042c3d1..cf2c5c3ae716 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -2,13 +2,6 @@
 #ifndef _ASM_POWERPC_INTERRUPT_H
 #define _ASM_POWERPC_INTERRUPT_H
 
-#include <linux/context_tracking.h>
-#include <linux/hardirq.h>
-#include <asm/cputime.h>
-#include <asm/ftrace.h>
-#include <asm/kprobes.h>
-#include <asm/runlatch.h>
-
 /* BookE/4xx */
 #define INTERRUPT_CRITICAL_INPUT  0x100
 
@@ -39,9 +32,11 @@
 /* BookE/BookS/4xx/8xx */
 #define INTERRUPT_DATA_STORAGE    0x300
 #define INTERRUPT_INST_STORAGE    0x400
+#define INTERRUPT_EXTERNAL		0x500
 #define INTERRUPT_ALIGNMENT       0x600
 #define INTERRUPT_PROGRAM         0x700
 #define INTERRUPT_SYSCALL         0xc00
+#define INTERRUPT_TRACE			0xd00
 
 /* BookE/BookS/44x */
 #define INTERRUPT_FP_UNAVAIL      0x800
@@ -53,6 +48,24 @@
 #define INTERRUPT_PERFMON         0x0
 #endif
 
+/* 8xx */
+#define INTERRUPT_SOFT_EMU_8xx		0x1000
+#define INTERRUPT_INST_TLB_MISS_8xx	0x1100
+#define INTERRUPT_DATA_TLB_MISS_8xx	0x1200
+#define INTERRUPT_INST_TLB_ERROR_8xx	0x1300
+#define INTERRUPT_DATA_TLB_ERROR_8xx	0x1400
+#define INTERRUPT_DATA_BREAKPOINT_8xx	0x1c00
+#define INTERRUPT_INST_BREAKPOINT_8xx	0x1d00
+
+#ifndef __ASSEMBLY__
+
+#include <linux/context_tracking.h>
+#include <linux/hardirq.h>
+#include <asm/cputime.h>
+#include <asm/ftrace.h>
+#include <asm/kprobes.h>
+#include <asm/runlatch.h>
+
 static inline void nap_adjust_return(struct pt_regs *regs)
 {
 #ifdef CONFIG_PPC_970_NAP
@@ -514,4 +527,6 @@ static inline void interrupt_cond_local_irq_enable(struct pt_regs *regs)
 		local_irq_enable();
 }
 
+#endif /* __ASSEMBLY__ */
+
 #endif /* _ASM_POWERPC_INTERRUPT_H */
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index e3b066703eab..7d445e4342c0 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -29,6 +29,7 @@
 #include <asm/ptrace.h>
 #include <asm/export.h>
 #include <asm/code-patching-asm.h>
+#include <asm/interrupt.h>
 
 /*
  * Value for the bits that have fixed value in RPN entries.
@@ -118,49 +119,49 @@ instruction_counter:
 #endif
 
 /* System reset */
-	EXCEPTION(0x100, Reset, system_reset_exception)
+	EXCEPTION(INTERRUPT_SYSTEM_RESET, Reset, system_reset_exception)
 
 /* Machine check */
-	START_EXCEPTION(0x200, MachineCheck)
-	EXCEPTION_PROLOG 0x200 MachineCheck handle_dar_dsisr=1
+	START_EXCEPTION(INTERRUPT_MACHINE_CHECK, MachineCheck)
+	EXCEPTION_PROLOG INTERRUPT_MACHINE_CHECK MachineCheck handle_dar_dsisr=1
 	prepare_transfer_to_handler
 	bl	machine_check_exception
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
 	b	interrupt_return
 
 /* Decrementer */
-	EXCEPTION(0x900, Decrementer, timer_interrupt)
+	EXCEPTION(INTERRUPT_DECREMENTER, Decrementer, timer_interrupt)
 
 /* System call */
-	START_EXCEPTION(0xc00, SystemCall)
-	SYSCALL_ENTRY	0xc00
+	START_EXCEPTION(INTERRUPT_SYSCALL, SystemCall)
+	SYSCALL_ENTRY	INTERRUPT_SYSCALL
 
 /* Single step - not used on 601 */
-	EXCEPTION(0xd00, SingleStep, single_step_exception)
+	EXCEPTION(INTERRUPT_TRACE, SingleStep, single_step_exception)
 
 /* On the MPC8xx, this is a software emulation interrupt.  It occurs
  * for all unimplemented and illegal instructions.
  */
-	START_EXCEPTION(0x1000, SoftEmu)
-	EXCEPTION_PROLOG 0x1000 SoftEmu
+	START_EXCEPTION(INTERRUPT_SOFT_EMU_8xx, SoftEmu)
+	EXCEPTION_PROLOG INTERRUPT_SOFT_EMU_8xx SoftEmu
 	prepare_transfer_to_handler
 	bl	emulation_assist_interrupt
 	REST_NVGPRS(r1)
@@ -187,7 +188,7 @@ instruction_counter:
 #define INVALIDATE_ADJACENT_PAGES_CPU15(addr, tmp)
 #endif
 
-	START_EXCEPTION(0x1100, InstructionTLBMiss)
+	START_EXCEPTION(INTERRUPT_INST_TLB_MISS_8xx, InstructionTLBMiss)
 	mtspr	SPRN_SPRG_SCRATCH2, r10
 	mtspr	SPRN_M_TW, r11
 
@@ -243,7 +244,7 @@ instruction_counter:
 	rfi
 #endif
 
-	START_EXCEPTION(0x1200, DataStoreTLBMiss)
+	START_EXCEPTION(INTERRUPT_DATA_TLB_MISS_8xx, DataStoreTLBMiss)
 	mtspr	SPRN_SPRG_SCRATCH2, r10
 	mtspr	SPRN_M_TW, r11
 	mfcr	r11
@@ -306,9 +307,9 @@ instruction_counter:
  * to many reasons, such as executing guarded memory or illegal instruction
  * addresses.  There is nothing to do but handle a big time error fault.
  */
-	START_EXCEPTION(0x1300, InstructionTLBError)
+	START_EXCEPTION(INTERRUPT_INST_TLB_ERROR_8xx, InstructionTLBError)
 	/* 0x400 is InstructionAccess exception, needed by bad_page_fault() */
-	EXCEPTION_PROLOG 0x400 InstructionTLBError
+	EXCEPTION_PROLOG INTERRUPT_INST_STORAGE InstructionTLBError
 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
 	andis.	r10,r9,SRR1_ISI_NOPT@h
 	beq+	.Litlbie
@@ -324,7 +325,7 @@ instruction_counter:
  * many reasons, including a dirty update to a pte.  We bail out to
  * a higher level function that can handle it.
  */
-	START_EXCEPTION(0x1400, DataTLBError)
+	START_EXCEPTION(INTERRUPT_DATA_TLB_ERROR_8xx, DataTLBError)
 	EXCEPTION_PROLOG_0 handle_dar_dsisr=1
 	mfspr	r11, SPRN_DAR
 	cmpwi	cr1, r11, RPN_PATTERN
@@ -332,7 +333,7 @@ instruction_counter:
 DARFixed:/* Return from dcbx instruction bug workaround */
 	EXCEPTION_PROLOG_1
 	/* 0x300 is DataAccess exception, needed by bad_page_fault() */
-	EXCEPTION_PROLOG_2 0x300 DataTLBError handle_dar_dsisr=1
+	EXCEPTION_PROLOG_2 INTERRUPT_DATA_STORAGE DataTLBError handle_dar_dsisr=1
 	lwz	r4, _DAR(r11)
 	lwz	r5, _DSISR(r11)
 	andis.	r10,r5,DSISR_NOHPTE@h
@@ -351,7 +352,7 @@ DARFixed:/* Return from dcbx instruction bug workaround */
  * support of breakpoints and such.  Someday I will get around to
  * using them.
  */
-	START_EXCEPTION(0x1c00, DataBreakpoint)
+	START_EXCEPTION(INTERRUPT_DATA_BREAKPOINT_8xx, DataBreakpoint)
 	EXCEPTION_PROLOG_0 handle_dar_dsisr=1
 	mfspr	r11, SPRN_SRR0
 	cmplwi	cr1, r11, (.Ldtlbie - PAGE_OFFSET)@l
@@ -364,7 +365,7 @@ DARFixed:/* Return from dcbx instruction bug workaround */
 	rfi
 
 1:	EXCEPTION_PROLOG_1
-	EXCEPTION_PROLOG_2 0x1c00 DataBreakpoint handle_dar_dsisr=1
+	EXCEPTION_PROLOG_2 INTERRUPT_DATA_BREAKPOINT_8xx DataBreakpoint handle_dar_dsisr=1
 	mfspr	r4,SPRN_BAR
 	stw	r4,_DAR(r11)
 	prepare_transfer_to_handler
@@ -373,7 +374,7 @@ DARFixed:/* Return from dcbx instruction bug workaround */
 	b	interrupt_return
 
 #ifdef CONFIG_PERF_EVENTS
-	START_EXCEPTION(0x1d00, InstructionBreakpoint)
+	START_EXCEPTION(INTERRUPT_INST_BREAKPOINT_8xx, InstructionBreakpoint)
 	mtspr	SPRN_SPRG_SCRATCH0, r10
 	lwz	r10, (instruction_counter - PAGE_OFFSET)@l(0)
 	addi	r10, r10, -1
@@ -384,7 +385,7 @@ DARFixed:/* Return from dcbx instruction bug workaround */
 	mfspr	r10, SPRN_SPRG_SCRATCH0
 	rfi
 #else
-	EXCEPTION(0x1d00, Trap_1d, unknown_exception)
+	EXCEPTION(INTERRUPT_INST_BREAKPOINT_8xx, Trap_1d, unknown_exception)
 #endif
 	EXCEPTION(0x1e00, Trap_1e, unknown_exception)
 	EXCEPTION(0x1f00, Trap_1f, unknown_exception)
-- 
2.25.0

