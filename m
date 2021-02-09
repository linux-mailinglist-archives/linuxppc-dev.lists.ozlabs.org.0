Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B74314D32
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 11:38:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZfWD4j0VzDqbm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 21:38:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZdb43skGzDqlr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 20:56:48 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZdb02ddgz9txgL;
 Tue,  9 Feb 2021 10:56:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id aDDnlflIzwS3; Tue,  9 Feb 2021 10:56:44 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZdb01sz2z9txg8;
 Tue,  9 Feb 2021 10:56:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2F0238B7D8;
 Tue,  9 Feb 2021 10:56:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rY2GrLy16g14; Tue,  9 Feb 2021 10:56:45 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BECB98B7D6;
 Tue,  9 Feb 2021 10:56:44 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 97B2E67342; Tue,  9 Feb 2021 09:56:44 +0000 (UTC)
Message-Id: <7c064b8ee57e3bbb028e51e672133f7edfab72a9.1612864003.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612864003.git.christophe.leroy@csgroup.eu>
References: <cover.1612864003.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 20/41] powerpc/32: Provide a name to exception prolog
 continuation in virtual mode
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Feb 2021 09:56:44 +0000 (UTC)
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

Now that the prolog continuation is separated in .text, give it a name
and mark it _ASM_NOKPROBE_SYMBOL.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_32.h        | 12 +++++++-----
 arch/powerpc/kernel/head_40x.S       | 22 ++++++++++++----------
 arch/powerpc/kernel/head_8xx.S       | 10 +++++-----
 arch/powerpc/kernel/head_book3s_32.S | 14 +++++++-------
 4 files changed, 31 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 3c0aa4538514..160ebd573c37 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -10,10 +10,10 @@
  * We assume sprg3 has the physical address of the current
  * task's thread_struct.
  */
-.macro EXCEPTION_PROLOG handle_dar_dsisr=0
+.macro EXCEPTION_PROLOG		name handle_dar_dsisr=0
 	EXCEPTION_PROLOG_0	handle_dar_dsisr=\handle_dar_dsisr
 	EXCEPTION_PROLOG_1
-	EXCEPTION_PROLOG_2	handle_dar_dsisr=\handle_dar_dsisr
+	EXCEPTION_PROLOG_2	\name handle_dar_dsisr=\handle_dar_dsisr
 .endm
 
 .macro EXCEPTION_PROLOG_0 handle_dar_dsisr=0
@@ -56,7 +56,7 @@
 #endif
 .endm
 
-.macro EXCEPTION_PROLOG_2 handle_dar_dsisr=0
+.macro EXCEPTION_PROLOG_2 name handle_dar_dsisr=0
 #ifdef CONFIG_PPC_8xx
 	.if	\handle_dar_dsisr
 	li	r11, RPN_PATTERN
@@ -72,6 +72,7 @@
 	rfi
 
 	.text
+\name\()_virt:
 1:
 	stw	r11,GPR1(r1)
 	stw	r11,0(r1)
@@ -109,6 +110,7 @@
 	stw	r10,8(r11)
 	SAVE_4GPRS(3, r11)
 	SAVE_2GPRS(7, r11)
+_ASM_NOKPROBE_SYMBOL(\name\()_virt)
 .endm
 
 .macro SYSCALL_ENTRY trapno
@@ -180,7 +182,7 @@
 
 #define EXCEPTION(n, label, hdlr, xfer)		\
 	START_EXCEPTION(n, label)		\
-	EXCEPTION_PROLOG;			\
+	EXCEPTION_PROLOG label;			\
 	addi	r3,r1,STACK_FRAME_OVERHEAD;	\
 	xfer(n, hdlr)
 
@@ -212,7 +214,7 @@
 #endif
 	lwz	r1, emergency_ctx@l(r1)
 	addi	r1, r1, THREAD_SIZE - INT_FRAME_SIZE
-	EXCEPTION_PROLOG_2
+	EXCEPTION_PROLOG_2 vmap_stack_overflow
 	SAVE_NVGPRS(r11)
 	addi	r3, r1, STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0, stack_overflow_exception)
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index e7d8856714d3..86883ccb3dc5 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -104,7 +104,7 @@ _ENTRY(crit_esr)
  * Instead we use a couple of words of memory at low physical addresses.
  * This is OK since we don't support SMP on these processors.
  */
-.macro CRITICAL_EXCEPTION_PROLOG
+.macro CRITICAL_EXCEPTION_PROLOG name
 	stw	r10,crit_r10@l(0)	/* save two registers to work with */
 	stw	r11,crit_r11@l(0)
 	mfspr	r10,SPRN_SRR0
@@ -135,6 +135,7 @@ _ENTRY(crit_esr)
 
 	.text
 1:
+\name\()_virt:
 	lwz	r11,crit_r1@l(0)
 	stw	r11,GPR1(r1)
 	stw	r11,0(r1)
@@ -162,6 +163,7 @@ _ENTRY(crit_esr)
 	stw	r10, 8(r11)
 	SAVE_4GPRS(3, r11)
 	SAVE_2GPRS(7, r11)
+_ASM_NOKPROBE_SYMBOL(\name\()_virt)
 .endm
 
 	/*
@@ -182,7 +184,7 @@ _ENTRY(crit_esr)
  */
 #define CRITICAL_EXCEPTION(n, label, hdlr)			\
 	START_EXCEPTION(n, label);				\
-	CRITICAL_EXCEPTION_PROLOG;				\
+	CRITICAL_EXCEPTION_PROLOG label;				\
 	addi	r3,r1,STACK_FRAME_OVERHEAD;			\
 	EXC_XFER_TEMPLATE(hdlr, n+2, (MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)), \
 			  crit_transfer_to_handler, ret_from_crit_exc)
@@ -205,7 +207,7 @@ _ENTRY(crit_esr)
  * if they can't resolve the lightweight TLB fault.
  */
 	START_EXCEPTION(0x0300,	DataStorage)
-	EXCEPTION_PROLOG handle_dar_dsisr=1
+	EXCEPTION_PROLOG DataStorage handle_dar_dsisr=1
 	EXC_XFER_LITE(0x300, handle_page_fault)
 
 /*
@@ -213,7 +215,7 @@ _ENTRY(crit_esr)
  * This is caused by a fetch from non-execute or guarded pages.
  */
 	START_EXCEPTION(0x0400, InstructionAccess)
-	EXCEPTION_PROLOG
+	EXCEPTION_PROLOG InstructionAccess
 	li	r5,0
 	stw	r5, _ESR(r11)		/* Zero ESR */
 	stw	r12, _DEAR(r11)		/* SRR0 as DEAR */
@@ -224,13 +226,13 @@ _ENTRY(crit_esr)
 
 /* 0x0600 - Alignment Exception */
 	START_EXCEPTION(0x0600, Alignment)
-	EXCEPTION_PROLOG handle_dar_dsisr=1
+	EXCEPTION_PROLOG Alignment handle_dar_dsisr=1
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0x600, alignment_exception)
 
 /* 0x0700 - Program Exception */
 	START_EXCEPTION(0x0700, ProgramCheck)
-	EXCEPTION_PROLOG handle_dar_dsisr=1
+	EXCEPTION_PROLOG ProgramCheck handle_dar_dsisr=1
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0x700, program_check_exception)
 
@@ -450,7 +452,7 @@ _ENTRY(crit_esr)
  */
 	/* 0x2000 - Debug Exception */
 	START_EXCEPTION(0x2000, DebugTrap)
-	CRITICAL_EXCEPTION_PROLOG
+	CRITICAL_EXCEPTION_PROLOG DebugTrap
 
 	/*
 	 * If this is a single step or branch-taken exception in an
@@ -500,7 +502,7 @@ _ENTRY(crit_esr)
 	/* Programmable Interval Timer (PIT) Exception. (from 0x1000) */
 	__HEAD
 Decrementer:
-	EXCEPTION_PROLOG
+	EXCEPTION_PROLOG Decrementer
 	lis	r0,TSR_PIS@h
 	mtspr	SPRN_TSR,r0		/* Clear the PIT exception */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -509,14 +511,14 @@ Decrementer:
 	/* Fixed Interval Timer (FIT) Exception. (from 0x1010) */
 	__HEAD
 FITException:
-	EXCEPTION_PROLOG
+	EXCEPTION_PROLOG FITException
 	addi	r3,r1,STACK_FRAME_OVERHEAD;
 	EXC_XFER_STD(0x1010, unknown_exception)
 
 	/* Watchdog Timer (WDT) Exception. (from 0x1020) */
 	__HEAD
 WDTException:
-	CRITICAL_EXCEPTION_PROLOG;
+	CRITICAL_EXCEPTION_PROLOG WDTException
 	addi	r3,r1,STACK_FRAME_OVERHEAD;
 	EXC_XFER_TEMPLATE(WatchdogException, 0x1020+2,
 	                  (MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)),
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index d16d0ec71bb2..932702a38234 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -122,7 +122,7 @@ instruction_counter:
 
 /* Machine check */
 	START_EXCEPTION(0x200, MachineCheck)
-	EXCEPTION_PROLOG handle_dar_dsisr=1
+	EXCEPTION_PROLOG MachineCheck handle_dar_dsisr=1
 	addi r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0x200, machine_check_exception)
 
@@ -131,7 +131,7 @@ instruction_counter:
 
 /* Alignment exception */
 	START_EXCEPTION(0x600, Alignment)
-	EXCEPTION_PROLOG handle_dar_dsisr=1
+	EXCEPTION_PROLOG Alignment handle_dar_dsisr=1
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0x600, alignment_exception)
 
@@ -294,7 +294,7 @@ instruction_counter:
  * addresses.  There is nothing to do but handle a big time error fault.
  */
 	START_EXCEPTION(0x1300, InstructionTLBError)
-	EXCEPTION_PROLOG
+	EXCEPTION_PROLOG InstructionTLBError
 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
 	andis.	r10,r9,SRR1_ISI_NOPT@h
 	beq+	.Litlbie
@@ -316,7 +316,7 @@ instruction_counter:
 	beq-	cr1, FixupDAR	/* must be a buggy dcbX, icbi insn. */
 DARFixed:/* Return from dcbx instruction bug workaround */
 	EXCEPTION_PROLOG_1
-	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
+	EXCEPTION_PROLOG_2 DataTLBError handle_dar_dsisr=1
 	lwz	r4, _DAR(r11)
 	lwz	r5, _DSISR(r11)
 	andis.	r10,r5,DSISR_NOHPTE@h
@@ -347,7 +347,7 @@ DARFixed:/* Return from dcbx instruction bug workaround */
 	rfi
 
 1:	EXCEPTION_PROLOG_1
-	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
+	EXCEPTION_PROLOG_2 DataBreakpoint handle_dar_dsisr=1
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	mfspr	r4,SPRN_BAR
 	stw	r4,_DAR(r11)
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 56d7bc212866..24cb245e1c5b 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -266,7 +266,7 @@ __secondary_hold_acknowledge:
 	mfspr	r1, SPRN_SPRG_SCRATCH2
 #endif /* CONFIG_PPC_CHRP */
 	EXCEPTION_PROLOG_1
-7:	EXCEPTION_PROLOG_2
+7:	EXCEPTION_PROLOG_2 MachineCheck
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_CHRP
 	beq	cr1, 1f
@@ -296,7 +296,7 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_HPTE_TABLE)
 #endif
 1:	EXCEPTION_PROLOG_0 handle_dar_dsisr=1
 	EXCEPTION_PROLOG_1
-	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
+	EXCEPTION_PROLOG_2 DataAccess handle_dar_dsisr=1
 	lwz	r5, _DSISR(r11)
 	andis.	r0, r5, DSISR_DABRMATCH@h
 	bne-	1f
@@ -325,7 +325,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	andi.	r11, r11, MSR_PR
 
 	EXCEPTION_PROLOG_1
-	EXCEPTION_PROLOG_2
+	EXCEPTION_PROLOG_2 InstructionAccess
 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
 	stw	r5, _DSISR(r11)
 	stw	r12, _DAR(r11)
@@ -336,7 +336,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 
 /* Alignment exception */
 	START_EXCEPTION(0x600, Alignment)
-	EXCEPTION_PROLOG handle_dar_dsisr=1
+	EXCEPTION_PROLOG Alignment handle_dar_dsisr=1
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0x600, alignment_exception)
 
@@ -353,7 +353,7 @@ BEGIN_FTR_SECTION
  */
 	b 	ProgramCheck
 END_FTR_SECTION_IFSET(CPU_FTR_FPU_UNAVAILABLE)
-	EXCEPTION_PROLOG
+	EXCEPTION_PROLOG FPUnavailable
 	beq	1f
 	bl	load_up_fpu		/* if from user, just load it up */
 	b	fast_exception_return
@@ -713,7 +713,7 @@ fast_hash_page_return:
 
 	__HEAD
 AltiVecUnavailable:
-	EXCEPTION_PROLOG
+	EXCEPTION_PROLOG AltiVecUnavailable
 #ifdef CONFIG_ALTIVEC
 	beq	1f
 	bl	load_up_altivec		/* if from user, just load it up */
@@ -724,7 +724,7 @@ AltiVecUnavailable:
 
 	__HEAD
 PerformanceMonitor:
-	EXCEPTION_PROLOG
+	EXCEPTION_PROLOG PerformanceMonitor
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0xf00, performance_monitor_exception)
 
-- 
2.25.0

