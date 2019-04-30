Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2941F97C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 15:05:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44thZy2K0tzDqNw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 23:05:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="nxg+KDjr"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44th0p19vhzDqNT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 22:39:06 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44th0j5hSbz9vD36;
 Tue, 30 Apr 2019 14:39:01 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=nxg+KDjr; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id PplqtvjuJU4e; Tue, 30 Apr 2019 14:39:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44th0j4f5Mz9vD30;
 Tue, 30 Apr 2019 14:39:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556627941; bh=a3LgC/TWB61IjoKWSIc8/7TYo0QSbf2V60yzmDxaGl8=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=nxg+KDjr28i9q9sLJuxg7SO/nuWX+XOVrsn2l1XxGUlVrHkab9UEFkIDt33u051Bb
 QHGwvFrPYiN5kSmgBUuFA924WytblOQxOYcDyIa13apQxbYEuPZ37haSkv7I24W6EJ
 /gc2XfbhH6+Ty8dPYkZCxRruD5JI5mfCPJk8OOxQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0979C8B8DF;
 Tue, 30 Apr 2019 14:39:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WUV_mrps_IuE; Tue, 30 Apr 2019 14:39:02 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B5C9E8B8C2;
 Tue, 30 Apr 2019 14:39:02 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 81190666F8; Tue, 30 Apr 2019 12:39:02 +0000 (UTC)
Message-Id: <5684c7d81dd77421061340e493f436d5f09f37f3.1556627571.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1556627571.git.christophe.leroy@c-s.fr>
References: <cover.1556627571.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 13/16] powerpc/32: implement fast entry for syscalls on non
 BOOKE
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>
Date: Tue, 30 Apr 2019 12:39:02 +0000 (UTC)
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

The overall series improves null_syscall selftest by 12,5% on an 83xx
and by 17% on a 8xx.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/entry_32.S | 32 ++++++++++++++++
 arch/powerpc/kernel/head_32.S  |  3 +-
 arch/powerpc/kernel/head_32.h  | 85 ++++++++++++++++++++++++++++++++++++++++--
 arch/powerpc/kernel/head_40x.S |  3 +-
 arch/powerpc/kernel/head_8xx.S |  3 +-
 5 files changed, 116 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 0c555f9f1543..184cc1de2f37 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -342,6 +342,35 @@ stack_ovf:
 	SYNC
 	RFI
 
+#ifndef CONFIG_BOOKE	/* to be removed once BOOKE uses fast syscall entry */
+#ifdef CONFIG_TRACE_IRQFLAGS
+trace_syscall_entry_irq_off:
+	/*
+	 * Syscall shouldn't happen while interrupts are disabled,
+	 * so let's do a warning here.
+	 */
+0:	trap
+	EMIT_BUG_ENTRY 0b,__FILE__,__LINE__, BUGFLAG_WARNING
+	bl	trace_hardirqs_on
+
+	/* Now enable for real */
+	LOAD_MSR_KERNEL(r10, MSR_KERNEL | MSR_EE)
+	mtmsr	r10
+
+	REST_GPR(0, r1)
+	REST_4GPRS(3, r1)
+	REST_2GPRS(7, r1)
+	b	DoSyscall
+#endif /* CONFIG_TRACE_IRQFLAGS */
+
+	.globl	transfer_to_syscall
+transfer_to_syscall:
+#ifdef CONFIG_TRACE_IRQFLAGS
+	andi.	r12,r9,MSR_EE
+	beq-	trace_syscall_entry_irq_off
+#endif /* CONFIG_TRACE_IRQFLAGS */
+#endif /* !CONFIG_BOOKE */
+
 /*
  * Handle a system call.
  */
@@ -353,9 +382,11 @@ _GLOBAL(DoSyscall)
 	stw	r3,ORIG_GPR3(r1)
 	li	r12,0
 	stw	r12,RESULT(r1)
+#ifdef CONFIG_BOOKE	/* to be removed once BOOKE uses fast syscall entry */
 	lwz	r11,_CCR(r1)	/* Clear SO bit in CR */
 	rlwinm	r11,r11,0,4,2
 	stw	r11,_CCR(r1)
+#endif
 #ifdef CONFIG_TRACE_IRQFLAGS
 	/* Make sure interrupts are enabled */
 	mfmsr	r11
@@ -1219,6 +1250,7 @@ load_dbcr0:
 
 	.section .bss
 	.align	4
+	.global global_dbcr0
 global_dbcr0:
 	.space	8*NR_CPUS
 	.previous
diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index 2404c39373d3..f1da8fef726a 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -370,8 +370,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_FPU_UNAVAILABLE)
 	. = 0xc00
 	DO_KVM  0xc00
 SystemCall:
-	EXCEPTION_PROLOG
-	EXC_XFER_SYS(0xc00, DoSyscall)
+	SYSCALL_ENTRY	0xc00
 
 /* Single step - not used on 601 */
 	EXCEPTION(0xd00, SingleStep, single_step_exception, EXC_XFER_STD)
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 14cb0af2f494..4a692553651f 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -73,6 +73,87 @@
 	SAVE_2GPRS(7, r11)
 .endm
 
+.macro SYSCALL_ENTRY trapno
+	mfspr	r12,SPRN_SPRG_THREAD
+	mfcr	r10
+	lwz	r11,TASK_STACK-THREAD(r12)
+	mflr	r9
+	addi	r11,r11,THREAD_SIZE - INT_FRAME_SIZE
+	rlwinm	r10,r10,0,4,2	/* Clear SO bit in CR */
+	tophys(r11,r11)
+	stw	r10,_CCR(r11)		/* save registers */
+	mfspr	r10,SPRN_SRR0
+	stw	r9,_LINK(r11)
+	mfspr	r9,SPRN_SRR1
+	stw	r1,GPR1(r11)
+	stw	r1,0(r11)
+	tovirt(r1,r11)			/* set new kernel sp */
+	stw	r10,_NIP(r11)
+#ifdef CONFIG_40x
+	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
+#else
+	LOAD_MSR_KERNEL(r10, MSR_KERNEL & ~(MSR_IR|MSR_DR)) /* can take exceptions */
+	MTMSRD(r10)			/* (except for mach check in rtas) */
+#endif
+	lis	r10,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
+	stw	r2,GPR2(r11)
+	addi	r10,r10,STACK_FRAME_REGS_MARKER@l
+	stw	r9,_MSR(r11)
+	li	r2, \trapno + 1
+	stw	r10,8(r11)
+	stw	r2,_TRAP(r11)
+	SAVE_GPR(0, r11)
+	SAVE_4GPRS(3, r11)
+	SAVE_2GPRS(7, r11)
+	addi	r11,r1,STACK_FRAME_OVERHEAD
+	addi	r2,r12,-THREAD
+	stw	r11,PT_REGS(r12)
+#if defined(CONFIG_40x)
+	/* Check to see if the dbcr0 register is set up to debug.  Use the
+	   internal debug mode bit to do this. */
+	lwz	r12,THREAD_DBCR0(r12)
+	andis.	r12,r12,DBCR0_IDM@h
+#endif
+	ACCOUNT_CPU_USER_ENTRY(r2, r11, r12)
+#if defined(CONFIG_40x)
+	beq+	3f
+	/* From user and task is ptraced - load up global dbcr0 */
+	li	r12,-1			/* clear all pending debug events */
+	mtspr	SPRN_DBSR,r12
+	lis	r11,global_dbcr0@ha
+	tophys(r11,r11)
+	addi	r11,r11,global_dbcr0@l
+	lwz	r12,0(r11)
+	mtspr	SPRN_DBCR0,r12
+	lwz	r12,4(r11)
+	addi	r12,r12,-1
+	stw	r12,4(r11)
+#endif
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
+	LOAD_MSR_KERNEL(r10, MSR_KERNEL)
+	rlwimi	r10, r9, 0, MSR_EE
+#else
+	LOAD_MSR_KERNEL(r10, MSR_KERNEL | MSR_EE)
+#endif
+#if defined(CONFIG_PPC_8xx) && defined(CONFIG_PERF_EVENTS)
+	mtspr	SPRN_NRI, r0
+#endif
+	mtspr	SPRN_SRR1,r10
+	mtspr	SPRN_SRR0,r11
+	SYNC
+	RFI				/* jump to handler, enable MMU */
+.endm
+
 /*
  * Note: code which follows this uses cr0.eq (set if from kernel),
  * r11, r12 (SRR0), and r9 (SRR1).
@@ -119,8 +200,4 @@
 	EXC_XFER_TEMPLATE(hdlr, n+1, MSR_KERNEL, transfer_to_handler, \
 			  ret_from_except)
 
-#define EXC_XFER_SYS(n, hdlr)		\
-	EXC_XFER_TEMPLATE(hdlr, n+1, MSR_KERNEL | MSR_EE, transfer_to_handler, \
-			  ret_from_except)
-
 #endif /* __HEAD_32_H__ */
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index b68de183faf1..e115248edda1 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -348,8 +348,7 @@ _ENTRY(saved_ksp_limit)
 
 /* 0x0C00 - System Call Exception */
 	START_EXCEPTION(0x0C00,	SystemCall)
-	EXCEPTION_PROLOG
-	EXC_XFER_SYS(0xc00, DoSyscall)
+	SYSCALL_ENTRY	0xc00
 
 	EXCEPTION(0x0D00, Trap_0D, unknown_exception, EXC_XFER_STD)
 	EXCEPTION(0x0E00, Trap_0E, unknown_exception, EXC_XFER_STD)
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 4ebcdfdae920..a5826defad1f 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -185,8 +185,7 @@ Alignment:
 /* System call */
 	. = 0xc00
 SystemCall:
-	EXCEPTION_PROLOG
-	EXC_XFER_SYS(0xc00, DoSyscall)
+	SYSCALL_ENTRY	0xc00
 
 /* Single step - not used on 601 */
 	EXCEPTION(0xd00, SingleStep, single_step_exception, EXC_XFER_STD)
-- 
2.13.3

