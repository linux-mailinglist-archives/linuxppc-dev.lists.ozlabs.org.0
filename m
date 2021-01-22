Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E935300034
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 11:27:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMb6y0cpJzDsRY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 21:27:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMZdc04v1zDrdZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 21:05:39 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DMZdW3JZwz9vBnG;
 Fri, 22 Jan 2021 11:05:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xAuGhYkkFcp1; Fri, 22 Jan 2021 11:05:35 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DMZdW2L16z9vBml;
 Fri, 22 Jan 2021 11:05:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 803D48B818;
 Fri, 22 Jan 2021 11:05:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id kQXw0UI6kV6H; Fri, 22 Jan 2021 11:05:36 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 334C98B817;
 Fri, 22 Jan 2021 11:05:36 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0C30166AAE; Fri, 22 Jan 2021 10:05:35 +0000 (UTC)
Message-Id: <3f15863e065e2ed2441cecc126f91589882910cd.1611309841.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1611309841.git.christophe.leroy@csgroup.eu>
References: <cover.1611309841.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 12/14] powerpc/32: Enable instruction translation at the
 same time as data translation
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Fri, 22 Jan 2021 10:05:35 +0000 (UTC)
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

On 40x and 8xx, kernel text is pinned.
On book3s/32, kernel text is mapped by BATs.

Enable instruction translation at the same time as data translation, it
makes things simpler.

In syscall handler, MSR_RI can also be set at the same time because
srr0/srr1 are already saved and r1 is set properly.

On booke, translation is always on, so at the end all PPC32
have translation on early.

Also update comment in power_save_ppc32_restore().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/entry_32.S   | 44 ++++++++++----------------------
 arch/powerpc/kernel/head_32.h    | 39 ++++++++++++----------------
 arch/powerpc/kernel/head_40x.S   | 10 +++++---
 arch/powerpc/kernel/head_booke.h |  7 ++---
 4 files changed, 39 insertions(+), 61 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 8a0e5885b731..6e70c6fdfe8a 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -198,12 +198,8 @@ transfer_to_handler:
 transfer_to_handler_cont:
 3:
 	mflr	r9
-	tovirt(r9, r9)
 	lwz	r11,0(r9)		/* virtual address of handler */
 	lwz	r9,4(r9)		/* where to go when done */
-#if defined(CONFIG_PPC_8xx) && defined(CONFIG_PERF_EVENTS)
-	mtspr	SPRN_NRI, r0
-#endif
 #ifdef CONFIG_TRACE_IRQFLAGS
 	/*
 	 * When tracing IRQ state (lockdep) we enable the MMU before we call
@@ -219,13 +215,9 @@ transfer_to_handler_cont:
 
 	/* MSR isn't changing, just transition directly */
 #endif
-	mtspr	SPRN_SRR0,r11
-	mtspr	SPRN_SRR1,r10
+	mtctr	r11
 	mtlr	r9
-	rfi				/* jump to handler, enable MMU */
-#ifdef CONFIG_40x
-	b .	/* Prevent prefetch past rfi */
-#endif
+	bctr				/* jump to handler */
 
 #if defined (CONFIG_PPC_BOOK3S_32) || defined(CONFIG_E500)
 4:	rlwinm	r12,r12,0,~_TLF_NAPPING
@@ -245,21 +237,7 @@ _ASM_NOKPROBE_SYMBOL(transfer_to_handler)
 _ASM_NOKPROBE_SYMBOL(transfer_to_handler_cont)
 
 #ifdef CONFIG_TRACE_IRQFLAGS
-1:	/* MSR is changing, re-enable MMU so we can notify lockdep. We need to
-	 * keep interrupts disabled at this point otherwise we might risk
-	 * taking an interrupt before we tell lockdep they are enabled.
-	 */
-	lis	r12,reenable_mmu@h
-	ori	r12,r12,reenable_mmu@l
-	LOAD_REG_IMMEDIATE(r0, MSR_KERNEL)
-	mtspr	SPRN_SRR0,r12
-	mtspr	SPRN_SRR1,r0
-	rfi
-#ifdef CONFIG_40x
-	b .	/* Prevent prefetch past rfi */
-#endif
-
-reenable_mmu:
+1:
 	/*
 	 * We save a bunch of GPRs,
 	 * r3 can be different from GPR3(r1) at this point, r9 and r11
@@ -1334,16 +1312,20 @@ _GLOBAL(enter_rtas)
 	mtspr	SPRN_SRR1,r9
 	rfi
 1:
-	li	r0, MSR_KERNEL & ~MSR_IR	/* can take DTLB miss */
-	mtmsr	r0
-	isync
+	lis	r8, 1f@h
+	ori	r8, r8, 1f@l
+	LOAD_REG_IMMEDIATE(r9,MSR_KERNEL)
+	mtspr	SPRN_SRR0,r8
+	mtspr	SPRN_SRR1,r9
+	rfi			/* Reactivate MMU translation */
+1:
 	lwz	r8,INT_FRAME_SIZE+4(r1)	/* get return address */
 	lwz	r9,8(r1)	/* original msr value */
 	addi	r1,r1,INT_FRAME_SIZE
 	li	r0,0
 	stw	r0, THREAD + RTAS_SP(r2)
-	mtspr	SPRN_SRR0,r8
-	mtspr	SPRN_SRR1,r9
-	rfi			/* return to caller */
+	mtlr	r8
+	mtmsr	r9
+	blr			/* return to caller */
 _ASM_NOKPROBE_SYMBOL(enter_rtas)
 #endif /* CONFIG_PPC_RTAS */
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 5ba4c6391107..7209e63db366 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -57,10 +57,14 @@
 .endm
 
 .macro EXCEPTION_PROLOG_2 handle_dar_dsisr=0
-	LOAD_REG_IMMEDIATE(r11, MSR_KERNEL & ~(MSR_IR | MSR_RI)) /* can take DTLB miss */
-	mtmsr	r11
-	isync
+	LOAD_REG_IMMEDIATE(r11, MSR_KERNEL & ~MSR_RI) /* re-enable MMU */
+	mtspr	SPRN_SRR1, r11
+	lis	r11, 1f@h
+	ori	r11, r11, 1f@l
+	mtspr	SPRN_SRR0, r11
 	mfspr	r11, SPRN_SPRG_SCRATCH2
+	rfi
+1:
 	stw	r11,GPR1(r1)
 	stw	r11,0(r1)
 	mr	r11, r1
@@ -86,7 +90,7 @@
 #ifdef CONFIG_40x
 	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
 #else
-	li	r10, MSR_KERNEL & ~MSR_IR /* can take exceptions */
+	li	r10, MSR_KERNEL		/* can take exceptions */
 	mtmsr	r10			/* (except for mach check in rtas) */
 #endif
 	stw	r0,GPR0(r11)
@@ -107,9 +111,13 @@
 	lwz	r1,TASK_STACK-THREAD(r12)
 	beq-	99f
 	addi	r1, r1, THREAD_SIZE - INT_FRAME_SIZE
-	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL & ~(MSR_IR | MSR_RI)) /* can take DTLB miss */
-	mtmsr	r10
-	isync
+	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL)		/* can take exceptions */
+	mtspr	SPRN_SRR1, r10
+	lis	r10, 1f@h
+	ori	r10, r10, 1f@l
+	mtspr	SPRN_SRR0, r10
+	rfi
+1:
 	tovirt(r12, r12)
 	stw	r11,GPR1(r1)
 	stw	r11,0(r1)
@@ -123,9 +131,6 @@
 	stw	r10,_CCR(r11)		/* save registers */
 #ifdef CONFIG_40x
 	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
-#else
-	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL & ~MSR_IR) /* can take exceptions */
-	mtmsr	r10			/* (except for mach check in rtas) */
 #endif
 	lis	r10,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
 	stw	r2,GPR2(r11)
@@ -162,8 +167,6 @@
 #endif
 
 3:
-	lis	r11, transfer_to_syscall@h
-	ori	r11, r11, transfer_to_syscall@l
 #ifdef CONFIG_TRACE_IRQFLAGS
 	/*
 	 * If MSR is changing we need to keep interrupts disabled at this point
@@ -175,15 +178,8 @@
 #else
 	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL | MSR_EE)
 #endif
-#if defined(CONFIG_PPC_8xx) && defined(CONFIG_PERF_EVENTS)
-	mtspr	SPRN_NRI, r0
-#endif
-	mtspr	SPRN_SRR1,r10
-	mtspr	SPRN_SRR0,r11
-	rfi				/* jump to handler, enable MMU */
-#ifdef CONFIG_40x
-	b .	/* Prevent prefetch past rfi */
-#endif
+	mtmsr	r10
+	b	transfer_to_syscall		/* jump to handler */
 99:	b	ret_from_kernel_syscall
 .endm
 
@@ -220,7 +216,6 @@
 #define EXC_XFER_TEMPLATE(hdlr, trap, msr, tfer, ret)		\
 	li	r10,trap;					\
 	stw	r10,_TRAP(r11);					\
-	LOAD_REG_IMMEDIATE(r10, msr);				\
 	bl	tfer;						\
 	.long	hdlr;						\
 	.long	ret
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 6b23cbd7f9c5..96ec800ebf7f 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -128,9 +128,13 @@ _ENTRY(saved_ksp_limit)
 	lwz	r11,TASK_STACK-THREAD(r11) /* this thread's kernel stack */
 1:	stw	r1,crit_r1@l(0)
 	addi	r1,r11,THREAD_SIZE-INT_FRAME_SIZE /* Alloc an excpt frm  */
-	LOAD_REG_IMMEDIATE(r11,MSR_KERNEL & ~(MSR_IR | MSR_RI))
-	mtmsr	r11
-	isync
+	LOAD_REG_IMMEDIATE(r11, MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)) /* re-enable MMU */
+	mtspr	SPRN_SRR1, r11
+	lis	r11, 1f@h
+	ori	r11, r11, 1f@l
+	mtspr	SPRN_SRR0, r11
+	rfi
+1:
 	lwz	r11,crit_r1@l(0)
 	stw	r11,GPR1(r1)
 	stw	r11,0(r1)
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 5d0402c48ebc..2e3cb1cc42fb 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -157,8 +157,6 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	stw	r12,4(r11)
 
 3:
-	lis	r11, transfer_to_syscall@h
-	ori	r11, r11, transfer_to_syscall@l
 #ifdef CONFIG_TRACE_IRQFLAGS
 	/*
 	 * If MSR is changing we need to keep interrupts disabled at this point
@@ -172,9 +170,8 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	lis	r10, (MSR_KERNEL | MSR_EE)@h
 	ori	r10, r10, (MSR_KERNEL | MSR_EE)@l
 #endif
-	mtspr	SPRN_SRR1,r10
-	mtspr	SPRN_SRR0,r11
-	rfi				/* jump to handler, enable MMU */
+	mtmsr	r10
+	b	transfer_to_syscall	/* jump to handler */
 99:	b	ret_from_kernel_syscall
 .endm
 
-- 
2.25.0

