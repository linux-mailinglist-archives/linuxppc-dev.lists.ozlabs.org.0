Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5948433254A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 13:19:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvvQP2Z3jz3gL3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 23:19:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvvCn6Zjqz3cjp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 23:09:57 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DvvCj0ZXLz9tyjK;
 Tue,  9 Mar 2021 13:09:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 7nmzgSAQV2ih; Tue,  9 Mar 2021 13:09:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DvvCh5SWFz9tyjG;
 Tue,  9 Mar 2021 13:09:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 307DE8B800;
 Tue,  9 Mar 2021 13:09:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id cZBEJX1lBFhb; Tue,  9 Mar 2021 13:09:54 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B1A8F8B7FC;
 Tue,  9 Mar 2021 13:09:53 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 8E4D367555; Tue,  9 Mar 2021 12:09:53 +0000 (UTC)
Message-Id: <0bb4f823d83015294023d409e172058f72266be5.1615291473.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615291471.git.christophe.leroy@csgroup.eu>
References: <cover.1615291471.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 27/43] powerpc/32: Call bad_page_fault() from
 do_page_fault()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Mar 2021 12:09:53 +0000 (UTC)
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

Now that non volatile registers are saved at all time, no
need to split bad_page_fault() out of do_page_fault().

Remove handle_page_fault() and use do_page_fault() directly.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/entry_32.S       | 16 ----------------
 arch/powerpc/kernel/head_40x.S       |  4 ++--
 arch/powerpc/kernel/head_8xx.S       |  4 ++--
 arch/powerpc/kernel/head_book3s_32.S |  4 ++--
 arch/powerpc/kernel/head_booke.h     |  4 ++--
 arch/powerpc/kernel/head_fsl_booke.S |  2 +-
 arch/powerpc/mm/fault.c              |  2 +-
 7 files changed, 10 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 4698fd1bd8c8..cb2fa00b8fc1 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -220,22 +220,6 @@ ret_from_kernel_thread:
 	li	r3,0
 	b	ret_from_syscall
 
-/*
- * Top-level page fault handling.
- * This is in assembler because if do_page_fault tells us that
- * it is a bad kernel page fault, we want to save the non-volatile
- * registers before calling bad_page_fault.
- */
-	.globl	handle_page_fault
-handle_page_fault:
-	bl	do_page_fault
-	cmpwi	r3,0
-	beq+	ret_from_except
-	mr	r4,r3		/* err arg for bad_page_fault */
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	__bad_page_fault
-	b	ret_from_except_full
-
 /*
  * This routine switches between two different tasks.  The process
  * state of one is saved on its kernel stack.  Then the state
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 08563d4170c6..a65778380704 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -207,7 +207,7 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
  */
 	START_EXCEPTION(0x0300,	DataStorage)
 	EXCEPTION_PROLOG DataStorage handle_dar_dsisr=1
-	EXC_XFER_LITE(0x300, handle_page_fault)
+	EXC_XFER_LITE(0x300, do_page_fault)
 
 /*
  * 0x0400 - Instruction Storage Exception
@@ -218,7 +218,7 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 	li	r5,0
 	stw	r5, _ESR(r11)		/* Zero ESR */
 	stw	r12, _DEAR(r11)		/* SRR0 as DEAR */
-	EXC_XFER_LITE(0x400, handle_page_fault)
+	EXC_XFER_LITE(0x400, do_page_fault)
 
 /* 0x0500 - External Interrupt Exception */
 	EXCEPTION(0x0500, HardwareInterrupt, do_IRQ, EXC_XFER_LITE)
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index eb1d40a8f2c4..4078d0dc2f18 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -301,7 +301,7 @@ instruction_counter:
 .Litlbie:
 	stw	r12, _DAR(r11)
 	stw	r5, _DSISR(r11)
-	EXC_XFER_LITE(0x400, handle_page_fault)
+	EXC_XFER_LITE(0x400, do_page_fault)
 
 /* This is the data TLB error on the MPC8xx.  This could be due to
  * many reasons, including a dirty update to a pte.  We bail out to
@@ -322,7 +322,7 @@ DARFixed:/* Return from dcbx instruction bug workaround */
 	tlbie	r4
 .Ldtlbie:
 	/* 0x300 is DataAccess exception, needed by bad_page_fault() */
-	EXC_XFER_LITE(0x300, handle_page_fault)
+	EXC_XFER_LITE(0x300, do_page_fault)
 
 #ifdef CONFIG_VMAP_STACK
 	vmap_stack_overflow_exception
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 626e9fbac2cc..81a6ec098dd1 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -299,7 +299,7 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_HPTE_TABLE)
 	lwz	r5, _DSISR(r11)
 	andis.	r0, r5, DSISR_DABRMATCH@h
 	bne-	1f
-	EXC_XFER_LITE(0x300, handle_page_fault)
+	EXC_XFER_LITE(0x300, do_page_fault)
 1:	EXC_XFER_STD(0x300, do_break)
 
 
@@ -328,7 +328,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
 	stw	r5, _DSISR(r11)
 	stw	r12, _DAR(r11)
-	EXC_XFER_LITE(0x400, handle_page_fault)
+	EXC_XFER_LITE(0x400, do_page_fault)
 
 /* External interrupt */
 	EXCEPTION(0x500, HardwareInterrupt, do_IRQ, EXC_XFER_LITE)
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 009a56d70d76..036a69d16605 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -462,7 +462,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	stw	r5,_ESR(r11);						      \
 	mfspr	r4,SPRN_DEAR;		/* Grab the DEAR */		      \
 	stw	r4, _DEAR(r11);						      \
-	EXC_XFER_LITE(0x0300, handle_page_fault)
+	EXC_XFER_LITE(0x0300, do_page_fault)
 
 #define INSTRUCTION_STORAGE_EXCEPTION					      \
 	START_EXCEPTION(InstructionStorage)				      \
@@ -470,7 +470,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	mfspr	r5,SPRN_ESR;		/* Grab the ESR and save it */	      \
 	stw	r5,_ESR(r11);						      \
 	stw	r12, _DEAR(r11);	/* Pass SRR0 as arg2 */		      \
-	EXC_XFER_LITE(0x0400, handle_page_fault)
+	EXC_XFER_LITE(0x0400, do_page_fault)
 
 #define ALIGNMENT_EXCEPTION						      \
 	START_EXCEPTION(Alignment)					      \
diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index f51c66f747ad..72e9aa45b99b 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -370,7 +370,7 @@ interrupt_base:
 	stw	r4, _DEAR(r11)
 	andis.	r10,r5,(ESR_ILK|ESR_DLK)@h
 	bne	1f
-	EXC_XFER_LITE(0x0300, handle_page_fault)
+	EXC_XFER_LITE(0x0300, do_page_fault)
 1:
 	EXC_XFER_LITE(0x0300, CacheLockingException)
 
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index bb368257b55c..2e54bac99a22 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -552,7 +552,7 @@ static long __do_page_fault(struct pt_regs *regs)
 	if (likely(entry)) {
 		instruction_pointer_set(regs, extable_fixup(entry));
 		return 0;
-	} else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64)) {
+	} else if (!IS_ENABLED(CONFIG_PPC_BOOK3E_64)) {
 		__bad_page_fault(regs, err);
 		return 0;
 	} else {
-- 
2.25.0

