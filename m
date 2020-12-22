Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C40292E0B2F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 14:56:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0dDD612TzDqHh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 00:56:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0cc51Nh0zDqQW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 00:28:37 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4D0cby5DFKz9v15X;
 Tue, 22 Dec 2020 14:28:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id IVXqj7w2CYrr; Tue, 22 Dec 2020 14:28:30 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4D0cby0MrPz9v1wP;
 Tue, 22 Dec 2020 14:28:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5A9A88B81D;
 Tue, 22 Dec 2020 14:28:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9Wa1BpsaBYLs; Tue, 22 Dec 2020 14:28:31 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DAB548B812;
 Tue, 22 Dec 2020 14:28:30 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B9F8E66969; Tue, 22 Dec 2020 13:28:30 +0000 (UTC)
Message-Id: <68e2b6a56d13276c85b7ae6e9521215634c29376.1608641533.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1608641532.git.christophe.leroy@csgroup.eu>
References: <cover.1608641532.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 08/15] powerpc/32: Split head_32.h into head_40x.h and
 head_6xx_8xx.h
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue, 22 Dec 2020 13:28:30 +0000 (UTC)
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

book3s/32 (aka 6xx) and 8xx head will be reworked to re-enable MMU
earlier.

Split 40x head.h out so that we can keep 40x as is until it
is phased out.

There is no plan to implement VMAP stack on 40x on the near future
so remove everything related.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/entry_32.S                |   6 +-
 arch/powerpc/kernel/head_40x.S                |   2 +-
 arch/powerpc/kernel/{head_32.h => head_40x.h} | 185 +-----------------
 .../kernel/{head_32.h => head_6xx_8xx.h}      |  39 +---
 arch/powerpc/kernel/head_8xx.S                |   2 +-
 arch/powerpc/kernel/head_book3s_32.S          |   4 +-
 6 files changed, 18 insertions(+), 220 deletions(-)
 copy arch/powerpc/kernel/{head_32.h => head_40x.h} (52%)
 rename arch/powerpc/kernel/{head_32.h => head_6xx_8xx.h} (89%)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 05904334c0ff..c1687f3cd0ca 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -33,7 +33,11 @@
 #include <asm/kup.h>
 #include <asm/bug.h>
 
-#include "head_32.h"
+#ifdef CONFIG_40x
+#include "head_40x.h"
+#else
+#include "head_6xx_8xx.h"
+#endif
 
 /*
  * powerpc relies on return from interrupt/syscall being context synchronising
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 16dc0eecbdf9..050b5fdc0438 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -37,7 +37,7 @@
 #include <asm/ptrace.h>
 #include <asm/export.h>
 
-#include "head_32.h"
+#include "head_40x.h"
 
 /* As with the other PowerPC ports, it is expected that when code
  * execution begins here, the following registers contain valid, yet
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_40x.h
similarity index 52%
copy from arch/powerpc/kernel/head_32.h
copy to arch/powerpc/kernel/head_40x.h
index a2f72c966baf..9e27c07f5f2b 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_40x.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __HEAD_32_H__
-#define __HEAD_32_H__
+#ifndef __HEAD_40x_H__
+#define __HEAD_40x_H__
 
 #include <asm/ptrace.h>	/* for STACK_FRAME_REGS_MARKER */
 
@@ -10,69 +10,21 @@
  * We assume sprg3 has the physical address of the current
  * task's thread_struct.
  */
-.macro EXCEPTION_PROLOG handle_dar_dsisr=0
-	EXCEPTION_PROLOG_0	handle_dar_dsisr=\handle_dar_dsisr
-	EXCEPTION_PROLOG_1
-	EXCEPTION_PROLOG_2	handle_dar_dsisr=\handle_dar_dsisr
-.endm
-
-.macro EXCEPTION_PROLOG_0 handle_dar_dsisr=0
+.macro EXCEPTION_PROLOG
 	mtspr	SPRN_SPRG_SCRATCH0,r10
 	mtspr	SPRN_SPRG_SCRATCH1,r11
-#ifdef CONFIG_VMAP_STACK
-	mfspr	r10, SPRN_SPRG_THREAD
-	.if	\handle_dar_dsisr
-	mfspr	r11, SPRN_DAR
-	stw	r11, DAR(r10)
-	mfspr	r11, SPRN_DSISR
-	stw	r11, DSISR(r10)
-	.endif
-	mfspr	r11, SPRN_SRR0
-	stw	r11, SRR0(r10)
-#endif
 	mfspr	r11, SPRN_SRR1		/* check whether user or kernel */
-#ifdef CONFIG_VMAP_STACK
-	stw	r11, SRR1(r10)
-#endif
 	mfcr	r10
 	andi.	r11, r11, MSR_PR
-.endm
-
-.macro EXCEPTION_PROLOG_1 for_rtas=0
-#ifdef CONFIG_VMAP_STACK
-	mtspr	SPRN_SPRG_SCRATCH2,r1
-	subi	r1, r1, INT_FRAME_SIZE		/* use r1 if kernel */
-	beq	1f
-	mfspr	r1,SPRN_SPRG_THREAD
-	lwz	r1,TASK_STACK-THREAD(r1)
-	addi	r1, r1, THREAD_SIZE - INT_FRAME_SIZE
-1:
-	mtcrf	0x7f, r1
-	bt	32 - THREAD_ALIGN_SHIFT, stack_overflow
-#else
 	subi	r11, r1, INT_FRAME_SIZE		/* use r1 if kernel */
 	beq	1f
 	mfspr	r11,SPRN_SPRG_THREAD
 	lwz	r11,TASK_STACK-THREAD(r11)
 	addi	r11, r11, THREAD_SIZE - INT_FRAME_SIZE
 1:	tophys(r11, r11)
-#endif
-.endm
-
-.macro EXCEPTION_PROLOG_2 handle_dar_dsisr=0
-#ifdef CONFIG_VMAP_STACK
-	li	r11, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
-	mtmsr	r11
-	isync
-	mfspr	r11, SPRN_SPRG_SCRATCH2
-	stw	r11,GPR1(r1)
-	stw	r11,0(r1)
-	mr	r11, r1
-#else
 	stw	r1,GPR1(r11)
 	stw	r1,0(r11)
 	tovirt(r1, r11)		/* set new kernel sp */
-#endif
 	stw	r10,_CCR(r11)		/* save registers */
 	stw	r12,GPR12(r11)
 	stw	r9,GPR9(r11)
@@ -82,31 +34,9 @@
 	stw	r12,GPR11(r11)
 	mflr	r10
 	stw	r10,_LINK(r11)
-#ifdef CONFIG_VMAP_STACK
-	mfspr	r12, SPRN_SPRG_THREAD
-	tovirt(r12, r12)
-	.if	\handle_dar_dsisr
-	lwz	r10, DAR(r12)
-	stw	r10, _DAR(r11)
-	lwz	r10, DSISR(r12)
-	stw	r10, _DSISR(r11)
-	.endif
-	lwz	r9, SRR1(r12)
-	lwz	r12, SRR0(r12)
-#else
 	mfspr	r12,SPRN_SRR0
 	mfspr	r9,SPRN_SRR1
-#endif
-#ifdef CONFIG_40x
 	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
-#else
-#ifdef CONFIG_VMAP_STACK
-	li	r10, MSR_KERNEL & ~MSR_IR /* can take exceptions */
-#else
-	li	r10,MSR_KERNEL & ~(MSR_IR|MSR_DR) /* can take exceptions */
-#endif
-	mtmsr	r10			/* (except for mach check in rtas) */
-#endif
 	stw	r0,GPR0(r11)
 	lis	r10,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
 	addi	r10,r10,STACK_FRAME_REGS_MARKER@l
@@ -118,22 +48,6 @@
 .macro SYSCALL_ENTRY trapno
 	mfspr	r12,SPRN_SPRG_THREAD
 	mfspr	r9, SPRN_SRR1
-#ifdef CONFIG_VMAP_STACK
-	mfspr	r11, SPRN_SRR0
-	mtctr	r11
-	andi.	r11, r9, MSR_PR
-	mr	r11, r1
-	lwz	r1,TASK_STACK-THREAD(r12)
-	beq-	99f
-	addi	r1, r1, THREAD_SIZE - INT_FRAME_SIZE
-	li	r10, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
-	mtmsr	r10
-	isync
-	tovirt(r12, r12)
-	stw	r11,GPR1(r1)
-	stw	r11,0(r1)
-	mr	r11, r1
-#else
 	andi.	r11, r9, MSR_PR
 	lwz	r11,TASK_STACK-THREAD(r12)
 	beq-	99f
@@ -142,28 +56,14 @@
 	stw	r1,GPR1(r11)
 	stw	r1,0(r11)
 	tovirt(r1, r11)		/* set new kernel sp */
-#endif
 	mflr	r10
 	stw	r10, _LINK(r11)
-#ifdef CONFIG_VMAP_STACK
-	mfctr	r10
-#else
 	mfspr	r10,SPRN_SRR0
-#endif
 	stw	r10,_NIP(r11)
 	mfcr	r10
 	rlwinm	r10,r10,0,4,2	/* Clear SO bit in CR */
 	stw	r10,_CCR(r11)		/* save registers */
-#ifdef CONFIG_40x
 	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
-#else
-#ifdef CONFIG_VMAP_STACK
-	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL & ~MSR_IR) /* can take exceptions */
-#else
-	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL & ~(MSR_IR|MSR_DR)) /* can take exceptions */
-#endif
-	mtmsr	r10			/* (except for mach check in rtas) */
-#endif
 	lis	r10,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
 	stw	r2,GPR2(r11)
 	addi	r10,r10,STACK_FRAME_REGS_MARKER@l
@@ -177,14 +77,11 @@
 	addi	r11,r1,STACK_FRAME_OVERHEAD
 	addi	r2,r12,-THREAD
 	stw	r11,PT_REGS(r12)
-#if defined(CONFIG_40x)
 	/* Check to see if the dbcr0 register is set up to debug.  Use the
 	   internal debug mode bit to do this. */
 	lwz	r12,THREAD_DBCR0(r12)
 	andis.	r12,r12,DBCR0_IDM@h
-#endif
 	ACCOUNT_CPU_USER_ENTRY(r2, r11, r12)
-#if defined(CONFIG_40x)
 	beq+	3f
 	/* From user and task is ptraced - load up global dbcr0 */
 	li	r12,-1			/* clear all pending debug events */
@@ -197,10 +94,9 @@
 	lwz	r12,4(r11)
 	addi	r12,r12,-1
 	stw	r12,4(r11)
-#endif
 
 3:
-	tovirt_novmstack r2, r2 	/* set r2 to current */
+	tovirt(r2, r2)	 	/* set r2 to current */
 	lis	r11, transfer_to_syscall@h
 	ori	r11, r11, transfer_to_syscall@l
 #ifdef CONFIG_TRACE_IRQFLAGS
@@ -213,65 +109,26 @@
 	rlwimi	r10, r9, 0, MSR_EE
 #else
 	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL | MSR_EE)
-#endif
-#if defined(CONFIG_PPC_8xx) && defined(CONFIG_PERF_EVENTS)
-	mtspr	SPRN_NRI, r0
 #endif
 	mtspr	SPRN_SRR1,r10
 	mtspr	SPRN_SRR0,r11
 	rfi				/* jump to handler, enable MMU */
-#ifdef CONFIG_40x
 	b .	/* Prevent prefetch past rfi */
-#endif
 99:	b	ret_from_kernel_syscall
 .endm
 
-.macro save_dar_dsisr_on_stack reg1, reg2, sp
-#ifndef CONFIG_VMAP_STACK
-	mfspr	\reg1, SPRN_DAR
-	mfspr	\reg2, SPRN_DSISR
-	stw	\reg1, _DAR(\sp)
-	stw	\reg2, _DSISR(\sp)
-#endif
-.endm
-
-.macro get_and_save_dar_dsisr_on_stack reg1, reg2, sp
-#ifdef CONFIG_VMAP_STACK
-	lwz	\reg1, _DAR(\sp)
-	lwz	\reg2, _DSISR(\sp)
-#else
-	save_dar_dsisr_on_stack \reg1, \reg2, \sp
-#endif
-.endm
-
 .macro tovirt_vmstack dst, src
-#ifdef CONFIG_VMAP_STACK
-	tovirt(\dst, \src)
-#else
 	.ifnc	\dst, \src
 	mr	\dst, \src
 	.endif
-#endif
 .endm
 
 .macro tovirt_novmstack dst, src
-#ifndef CONFIG_VMAP_STACK
 	tovirt(\dst, \src)
-#else
-	.ifnc	\dst, \src
-	mr	\dst, \src
-	.endif
-#endif
 .endm
 
 .macro tophys_novmstack dst, src
-#ifndef CONFIG_VMAP_STACK
 	tophys(\dst, \src)
-#else
-	.ifnc	\dst, \src
-	mr	\dst, \src
-	.endif
-#endif
 .endm
 
 /*
@@ -285,18 +142,10 @@
 /*
  * Exception vectors.
  */
-#ifdef CONFIG_PPC_BOOK3S
-#define	START_EXCEPTION(n, label)		\
-	. = n;					\
-	DO_KVM n;				\
-label:
-
-#else
 #define	START_EXCEPTION(n, label)		\
 	. = n;					\
 label:
 
-#endif
 
 #define EXCEPTION(n, label, hdlr, xfer)		\
 	START_EXCEPTION(n, label)		\
@@ -319,28 +168,4 @@
 #define EXC_XFER_LITE(n, hdlr)		\
 	EXC_XFER_TEMPLATE(hdlr, n+1, MSR_KERNEL, transfer_to_handler, \
 			  ret_from_except)
-
-.macro vmap_stack_overflow_exception
-#ifdef CONFIG_VMAP_STACK
-#ifdef CONFIG_SMP
-	mfspr	r1, SPRN_SPRG_THREAD
-	lwz	r1, TASK_CPU - THREAD(r1)
-	slwi	r1, r1, 3
-	addis	r1, r1, emergency_ctx@ha
-#else
-	lis	r1, emergency_ctx@ha
-#endif
-	lwz	r1, emergency_ctx@l(r1)
-	cmpwi	cr1, r1, 0
-	bne	cr1, 1f
-	lis	r1, init_thread_union@ha
-	addi	r1, r1, init_thread_union@l
-1:	addi	r1, r1, THREAD_SIZE - INT_FRAME_SIZE
-	EXCEPTION_PROLOG_2
-	SAVE_NVGPRS(r11)
-	addi	r3, r1, STACK_FRAME_OVERHEAD
-	EXC_XFER_STD(0, stack_overflow_exception)
-#endif
-.endm
-
-#endif /* __HEAD_32_H__ */
+#endif /* __HEAD_40x_H__ */
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_6xx_8xx.h
similarity index 89%
rename from arch/powerpc/kernel/head_32.h
rename to arch/powerpc/kernel/head_6xx_8xx.h
index a2f72c966baf..0e4ce6746443 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_6xx_8xx.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __HEAD_32_H__
-#define __HEAD_32_H__
+#ifndef __HEAD_6xx_8xx_H__
+#define __HEAD_6xx_8xx_H__
 
 #include <asm/ptrace.h>	/* for STACK_FRAME_REGS_MARKER */
 
@@ -38,7 +38,7 @@
 	andi.	r11, r11, MSR_PR
 .endm
 
-.macro EXCEPTION_PROLOG_1 for_rtas=0
+.macro EXCEPTION_PROLOG_1
 #ifdef CONFIG_VMAP_STACK
 	mtspr	SPRN_SPRG_SCRATCH2,r1
 	subi	r1, r1, INT_FRAME_SIZE		/* use r1 if kernel */
@@ -97,16 +97,12 @@
 	mfspr	r12,SPRN_SRR0
 	mfspr	r9,SPRN_SRR1
 #endif
-#ifdef CONFIG_40x
-	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
-#else
 #ifdef CONFIG_VMAP_STACK
 	li	r10, MSR_KERNEL & ~MSR_IR /* can take exceptions */
 #else
 	li	r10,MSR_KERNEL & ~(MSR_IR|MSR_DR) /* can take exceptions */
 #endif
 	mtmsr	r10			/* (except for mach check in rtas) */
-#endif
 	stw	r0,GPR0(r11)
 	lis	r10,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
 	addi	r10,r10,STACK_FRAME_REGS_MARKER@l
@@ -154,16 +150,12 @@
 	mfcr	r10
 	rlwinm	r10,r10,0,4,2	/* Clear SO bit in CR */
 	stw	r10,_CCR(r11)		/* save registers */
-#ifdef CONFIG_40x
-	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
-#else
 #ifdef CONFIG_VMAP_STACK
 	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL & ~MSR_IR) /* can take exceptions */
 #else
 	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL & ~(MSR_IR|MSR_DR)) /* can take exceptions */
 #endif
 	mtmsr	r10			/* (except for mach check in rtas) */
-#endif
 	lis	r10,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
 	stw	r2,GPR2(r11)
 	addi	r10,r10,STACK_FRAME_REGS_MARKER@l
@@ -177,27 +169,7 @@
 	addi	r11,r1,STACK_FRAME_OVERHEAD
 	addi	r2,r12,-THREAD
 	stw	r11,PT_REGS(r12)
-#if defined(CONFIG_40x)
-	/* Check to see if the dbcr0 register is set up to debug.  Use the
-	   internal debug mode bit to do this. */
-	lwz	r12,THREAD_DBCR0(r12)
-	andis.	r12,r12,DBCR0_IDM@h
-#endif
 	ACCOUNT_CPU_USER_ENTRY(r2, r11, r12)
-#if defined(CONFIG_40x)
-	beq+	3f
-	/* From user and task is ptraced - load up global dbcr0 */
-	li	r12,-1			/* clear all pending debug events */
-	mtspr	SPRN_DBSR,r12
-	lis	r11,global_dbcr0@ha
-	tophys(r11,r11)
-	addi	r11,r11,global_dbcr0@l
-	lwz	r12,0(r11)
-	mtspr	SPRN_DBCR0,r12
-	lwz	r12,4(r11)
-	addi	r12,r12,-1
-	stw	r12,4(r11)
-#endif
 
 3:
 	tovirt_novmstack r2, r2 	/* set r2 to current */
@@ -220,9 +192,6 @@
 	mtspr	SPRN_SRR1,r10
 	mtspr	SPRN_SRR0,r11
 	rfi				/* jump to handler, enable MMU */
-#ifdef CONFIG_40x
-	b .	/* Prevent prefetch past rfi */
-#endif
 99:	b	ret_from_kernel_syscall
 .endm
 
@@ -343,4 +312,4 @@
 #endif
 .endm
 
-#endif /* __HEAD_32_H__ */
+#endif /* __HEAD_6xx_8xx_H__ */
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 7dce277c8a2a..9124ae889f9f 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -30,7 +30,7 @@
 #include <asm/export.h>
 #include <asm/code-patching-asm.h>
 
-#include "head_32.h"
+#include "head_6xx_8xx.h"
 
 .macro compare_to_kernel_boundary scratch, addr
 #if CONFIG_TASK_SIZE <= 0x80000000 && CONFIG_PAGE_OFFSET >= 0x80000000
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 0133a02d1d47..ccc691d67b0c 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -32,7 +32,7 @@
 #include <asm/export.h>
 #include <asm/feature-fixups.h>
 
-#include "head_32.h"
+#include "head_6xx_8xx.h"
 
 #define LOAD_BAT(n, reg, RA, RB)	\
 	/* see the comment for clear_bats() -- Cort */ \
@@ -272,7 +272,7 @@ MachineCheck:
 #endif
 	bne	cr1, 7f
 #endif /* CONFIG_PPC_CHRP */
-	EXCEPTION_PROLOG_1 for_rtas=1
+	EXCEPTION_PROLOG_1
 7:	EXCEPTION_PROLOG_2
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_CHRP
-- 
2.25.0

