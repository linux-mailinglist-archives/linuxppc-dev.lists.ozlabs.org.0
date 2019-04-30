Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3268F996
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 15:11:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44thjw2NCczDqVN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 23:11:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="vMIukiXC"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44th0s0TK3zDqNR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 22:39:08 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44th0k62myz9vD37;
 Tue, 30 Apr 2019 14:39:02 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=vMIukiXC; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id tUhmHOMnjppo; Tue, 30 Apr 2019 14:39:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44th0k52M8z9vD30;
 Tue, 30 Apr 2019 14:39:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556627942; bh=ykZQ54bmLxzUyR7pz/mohbgTwi8t0LH07F73yInp6BU=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=vMIukiXC4N3BGqjRbctfLKex+FPRF9QOlqXqp6l0BlEMBWZOqgLlIAnDjembLfLAG
 GXe4lJJ9gHoAopB6jKd39NMDf+vEnPGJNhTehTawcyTUs93xqYdhM7lpOwccmhnIs3
 UuCH9vN6VLudnnAeUKZmNEWMtRZmtjJnDAZKtxwg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 15B7A8B8DF;
 Tue, 30 Apr 2019 14:39:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YNtjAX-FxXKq; Tue, 30 Apr 2019 14:39:03 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BFC808B8C2;
 Tue, 30 Apr 2019 14:39:03 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 86F9B666F8; Tue, 30 Apr 2019 12:39:03 +0000 (UTC)
Message-Id: <3e254178a157e7eaeef48f983880f71f97d1f296.1556627571.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1556627571.git.christophe.leroy@c-s.fr>
References: <cover.1556627571.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 14/16] powerpc/32: implement fast entry for syscalls on
 BOOKE
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>
Date: Tue, 30 Apr 2019 12:39:03 +0000 (UTC)
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

This patch implements a fast entry for syscalls.

Syscalls don't have to preserve non volatile registers except LR.

This patch then implement a fast entry for syscalls, where
volatile registers get clobbered.

As this entry is dedicated to syscall it always sets MSR_EE
and warns in case MSR_EE was previously off

It also assumes that the call is always from user, system calls are
unexpected from kernel.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/entry_32.S       |   7 ---
 arch/powerpc/kernel/head_44x.S       |   3 +-
 arch/powerpc/kernel/head_booke.h     | 103 +++++++++++++++++++++++++++++++++--
 arch/powerpc/kernel/head_fsl_booke.S |   3 +-
 4 files changed, 100 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 184cc1de2f37..dc58fec51ed6 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -342,7 +342,6 @@ stack_ovf:
 	SYNC
 	RFI
 
-#ifndef CONFIG_BOOKE	/* to be removed once BOOKE uses fast syscall entry */
 #ifdef CONFIG_TRACE_IRQFLAGS
 trace_syscall_entry_irq_off:
 	/*
@@ -369,7 +368,6 @@ transfer_to_syscall:
 	andi.	r12,r9,MSR_EE
 	beq-	trace_syscall_entry_irq_off
 #endif /* CONFIG_TRACE_IRQFLAGS */
-#endif /* !CONFIG_BOOKE */
 
 /*
  * Handle a system call.
@@ -382,11 +380,6 @@ _GLOBAL(DoSyscall)
 	stw	r3,ORIG_GPR3(r1)
 	li	r12,0
 	stw	r12,RESULT(r1)
-#ifdef CONFIG_BOOKE	/* to be removed once BOOKE uses fast syscall entry */
-	lwz	r11,_CCR(r1)	/* Clear SO bit in CR */
-	rlwinm	r11,r11,0,4,2
-	stw	r11,_CCR(r1)
-#endif
 #ifdef CONFIG_TRACE_IRQFLAGS
 	/* Make sure interrupts are enabled */
 	mfmsr	r11
diff --git a/arch/powerpc/kernel/head_44x.S b/arch/powerpc/kernel/head_44x.S
index e06cb1c84951..7d73c7e39afe 100644
--- a/arch/powerpc/kernel/head_44x.S
+++ b/arch/powerpc/kernel/head_44x.S
@@ -282,8 +282,7 @@ interrupt_base:
 #endif
 	/* System Call Interrupt */
 	START_EXCEPTION(SystemCall)
-	NORMAL_EXCEPTION_PROLOG(BOOKE_INTERRUPT_SYSCALL)
-	EXC_XFER_SYS(0x0c00, DoSyscall)
+	SYSCALL_ENTRY   0xc00 BOOKE_INTERRUPT_SYSCALL
 
 	/* Auxiliary Processor Unavailable Interrupt */
 	EXCEPTION(0x2020, BOOKE_INTERRUPT_AP_UNAVAIL, \
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 56dd1341eb3d..bfeb469e8106 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -6,6 +6,8 @@
 #include <asm/kvm_asm.h>
 #include <asm/kvm_booke_hv_asm.h>
 
+#ifdef __ASSEMBLY__
+
 /*
  * Macros used for common Book-e exception handling
  */
@@ -81,6 +83,101 @@ END_BTB_FLUSH_SECTION
 	SAVE_4GPRS(3, r11);						     \
 	SAVE_2GPRS(7, r11)
 
+.macro SYSCALL_ENTRY trapno intno
+	mfspr	r10, SPRN_SPRG_THREAD
+#ifdef CONFIG_KVM_BOOKE_HV
+BEGIN_FTR_SECTION
+	mtspr	SPRN_SPRG_WSCRATCH0, r10
+	stw	r11, THREAD_NORMSAVE(0)(r10)
+	stw	r13, THREAD_NORMSAVE(2)(r10)
+	mfcr	r13			/* save CR in r13 for now	   */
+	mfspr	r11, SPRN_SRR1
+	mtocrf	0x80, r11	/* check MSR[GS] without clobbering reg */
+	bf	3, 1975f
+	b	kvmppc_handler_BOOKE_INTERRUPT_\intno\()_SPRN_SRR1
+1975:
+	mr	r12, r13
+	lwz	r13, THREAD_NORMSAVE(2)(r10)
+FTR_SECTION_ELSE
+#endif
+	mfcr	r12
+#ifdef CONFIG_KVM_BOOKE_HV
+ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
+#endif
+	BOOKE_CLEAR_BTB(r11)
+	lwz	r11, TASK_STACK - THREAD(r10)
+	rlwinm	r12,r12,0,4,2	/* Clear SO bit in CR */
+	ALLOC_STACK_FRAME(r11, THREAD_SIZE - INT_FRAME_SIZE)
+	stw	r12, _CCR(r11)		/* save various registers */
+	mflr	r12
+	stw	r12,_LINK(r11)
+	mfspr	r12,SPRN_SRR0
+	stw	r1, GPR1(r11)
+	mfspr	r9,SPRN_SRR1
+	stw	r1, 0(r11)
+	mr	r1, r11
+	stw	r12,_NIP(r11)
+	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?)	   */
+	lis	r12, STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
+	stw	r2,GPR2(r11)
+	addi	r12, r12, STACK_FRAME_REGS_MARKER@l
+	stw	r9,_MSR(r11)
+	li	r2, \trapno + 1
+	stw	r12, 8(r11)
+	stw	r2,_TRAP(r11)
+	SAVE_GPR(0, r11)
+	SAVE_4GPRS(3, r11)
+	SAVE_2GPRS(7, r11)
+
+	addi	r11,r1,STACK_FRAME_OVERHEAD
+	addi	r2,r10,-THREAD
+	stw	r11,PT_REGS(r10)
+	/* Check to see if the dbcr0 register is set up to debug.  Use the
+	   internal debug mode bit to do this. */
+	lwz	r12,THREAD_DBCR0(r10)
+	andis.	r12,r12,DBCR0_IDM@h
+	ACCOUNT_CPU_USER_ENTRY(r2, r11, r12)
+	beq+	3f
+	/* From user and task is ptraced - load up global dbcr0 */
+	li	r12,-1			/* clear all pending debug events */
+	mtspr	SPRN_DBSR,r12
+	lis	r11,global_dbcr0@ha
+	tophys(r11,r11)
+	addi	r11,r11,global_dbcr0@l
+#ifdef CONFIG_SMP
+	lwz	r9,TASK_CPU(r2)
+	slwi	r9,r9,3
+	add	r11,r11,r9
+#endif
+	lwz	r12,0(r11)
+	mtspr	SPRN_DBCR0,r12
+	lwz	r12,4(r11)
+	addi	r12,r12,-1
+	stw	r12,4(r11)
+
+3:
+	tovirt(r2, r2)			/* set r2 to current */
+	lis	r11, transfer_to_syscall@h
+	ori	r11, r11, transfer_to_syscall@l
+#ifdef CONFIG_TRACE_IRQFLAGS
+	/*
+	 * If MSR is changing we need to keep interrupts disabled at this point
+	 * otherwise we might risk taking an interrupt before we tell lockdep
+	 * they are enabled.
+	 */
+	lis	r10, MSR_KERNEL@h
+	ori	r10, r10, MSR_KERNEL@l
+	rlwimi	r10, r9, 0, MSR_EE
+#else
+	lis	r10, (MSR_KERNEL | MSR_EE)@h
+	ori	r10, r10, (MSR_KERNEL | MSR_EE)@l
+#endif
+	mtspr	SPRN_SRR1,r10
+	mtspr	SPRN_SRR0,r11
+	SYNC
+	RFI				/* jump to handler, enable MMU */
+.endm
+
 /* To handle the additional exception priority levels on 40x and Book-E
  * processors we allocate a stack per additional priority level.
  *
@@ -245,10 +342,6 @@ END_BTB_FLUSH_SECTION
 	EXC_XFER_TEMPLATE(hdlr, n+1, MSR_KERNEL, transfer_to_handler, \
 			  ret_from_except)
 
-#define EXC_XFER_SYS(n, hdlr)						\
-	EXC_XFER_TEMPLATE(hdlr, n+1, MSR_KERNEL | MSR_EE, transfer_to_handler, \
-			  ret_from_except)
-
 /* Check for a single step debug exception while in an exception
  * handler before state has been saved.  This is to catch the case
  * where an instruction that we are trying to single step causes
@@ -418,7 +511,7 @@ END_BTB_FLUSH_SECTION
 1:	addi	r3,r1,STACK_FRAME_OVERHEAD;				      \
 	EXC_XFER_STD(0x800, kernel_fp_unavailable_exception)
 
-#ifndef __ASSEMBLY__
+#else /* __ASSEMBLY__ */
 struct exception_regs {
 	unsigned long mas0;
 	unsigned long mas1;
diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index b351851dc73d..a757be4f1cb5 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -410,8 +410,7 @@ interrupt_base:
 
 	/* System Call Interrupt */
 	START_EXCEPTION(SystemCall)
-	NORMAL_EXCEPTION_PROLOG(SYSCALL)
-	EXC_XFER_SYS(0x0c00, DoSyscall)
+	SYSCALL_ENTRY   0xc00 SYSCALL
 
 	/* Auxiliary Processor Unavailable Interrupt */
 	EXCEPTION(0x2900, AP_UNAVAIL, AuxillaryProcessorUnavailable, \
-- 
2.13.3

