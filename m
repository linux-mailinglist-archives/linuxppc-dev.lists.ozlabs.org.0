Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CD812884E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 09:53:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fzsb2qc9zDqtr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 19:53:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="boXaXRjK"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fzPv4rr6zDqrM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2019 19:32:35 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47fzPl1vK9z9vBmw;
 Sat, 21 Dec 2019 09:32:27 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=boXaXRjK; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id EcwGma4AgOP2; Sat, 21 Dec 2019 09:32:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47fzPl0pJ3z9vBmv;
 Sat, 21 Dec 2019 09:32:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1576917147; bh=vGFn6Xs3VPXb1NNT2pdcceLZLNSRn0DbiBGAyHCcEBo=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=boXaXRjKAGP2Dkb8HGNhSUcNNswq8pOVqQsvwvVwful7kwP2eZPzZyr85rr4VQ74z
 w7ToT8FO9R6f9hkVuFqiPU5c/TMhzMzkfJibecZgvtjZFAA/R/aih4LTMQfNCiUMLI
 ocZq47oDGHxGwuWwuGkeE0Tiu9bFc/nKAj0iB514=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1D49F8B77C;
 Sat, 21 Dec 2019 09:32:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id E28t8NDzsFB1; Sat, 21 Dec 2019 09:32:28 +0100 (CET)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BCABA8B752;
 Sat, 21 Dec 2019 09:32:27 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 82472637B6; Sat, 21 Dec 2019 08:32:27 +0000 (UTC)
Message-Id: <a775a1fea60f190e0f63503463fb775310a2009b.1576916812.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1576916812.git.christophe.leroy@c-s.fr>
References: <cover.1576916812.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5 06/17] powerpc/32: prepare for CONFIG_VMAP_STACK
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 dja@axtens.net
Date: Sat, 21 Dec 2019 08:32:27 +0000 (UTC)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To support CONFIG_VMAP_STACK, the kernel has to activate Data MMU
Translation for accessing the stack. Before doing that it must save
SRR0, SRR1 and also DAR and DSISR when relevant, in order to not
loose them in case there is a Data TLB Miss once the translation is
reactivated.

This patch adds fields in thread struct for saving those registers.
It prepares entry_32.S to handle exception entry with
Data MMU Translation enabled and alters EXCEPTION_PROLOG macros to
save SRR0, SRR1, DAR and DSISR then reenables Data MMU.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/processor.h   |   6 ++
 arch/powerpc/include/asm/thread_info.h |   5 ++
 arch/powerpc/kernel/asm-offsets.c      |   6 ++
 arch/powerpc/kernel/entry_32.S         |   4 +-
 arch/powerpc/kernel/head_32.h          | 126 +++++++++++++++++++++++++++++----
 5 files changed, 131 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index a9993e7a443b..92c02d15f117 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -163,6 +163,12 @@ struct thread_struct {
 #if defined(CONFIG_PPC_BOOK3S_32) && defined(CONFIG_PPC_KUAP)
 	unsigned long	kuap;		/* opened segments for user access */
 #endif
+#ifdef CONFIG_VMAP_STACK
+	unsigned long	srr0;
+	unsigned long	srr1;
+	unsigned long	dar;
+	unsigned long	dsisr;
+#endif
 	/* Debug Registers */
 	struct debug_reg debug;
 	struct thread_fp_state	fp_state;
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index 8e1d0195ac36..488d5c4670ff 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -10,10 +10,15 @@
 #define _ASM_POWERPC_THREAD_INFO_H
 
 #include <asm/asm-const.h>
+#include <asm/page.h>
 
 #ifdef __KERNEL__
 
+#if defined(CONFIG_VMAP_STACK) && CONFIG_THREAD_SHIFT < PAGE_SHIFT
+#define THREAD_SHIFT		PAGE_SHIFT
+#else
 #define THREAD_SHIFT		CONFIG_THREAD_SHIFT
+#endif
 
 #define THREAD_SIZE		(1 << THREAD_SHIFT)
 
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 3d47aec7becf..bef3f7f92823 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -127,6 +127,12 @@ int main(void)
 	OFFSET(KSP_VSID, thread_struct, ksp_vsid);
 #else /* CONFIG_PPC64 */
 	OFFSET(PGDIR, thread_struct, pgdir);
+#ifdef CONFIG_VMAP_STACK
+	OFFSET(SRR0, thread_struct, srr0);
+	OFFSET(SRR1, thread_struct, srr1);
+	OFFSET(DAR, thread_struct, dar);
+	OFFSET(DSISR, thread_struct, dsisr);
+#endif
 #ifdef CONFIG_SPE
 	OFFSET(THREAD_EVR0, thread_struct, evr[0]);
 	OFFSET(THREAD_ACC, thread_struct, acc);
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 317ad9df8ba8..8f6617cf2689 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -140,6 +140,7 @@ transfer_to_handler:
 	stw	r12,_CTR(r11)
 	stw	r2,_XER(r11)
 	mfspr	r12,SPRN_SPRG_THREAD
+	tovirt_vmstack r12, r12
 	beq	2f			/* if from user, fix up THREAD.regs */
 	addi	r2, r12, -THREAD
 	addi	r11,r1,STACK_FRAME_OVERHEAD
@@ -195,7 +196,8 @@ transfer_to_handler:
 transfer_to_handler_cont:
 3:
 	mflr	r9
-	tovirt(r2, r2)			/* set r2 to current */
+	tovirt_novmstack r2, r2 	/* set r2 to current */
+	tovirt_vmstack r9, r9
 	lwz	r11,0(r9)		/* virtual address of handler */
 	lwz	r9,4(r9)		/* where to go when done */
 #if defined(CONFIG_PPC_8xx) && defined(CONFIG_PERF_EVENTS)
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index f19a1ab91fb5..d4baa063c6b4 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -10,31 +10,53 @@
  * We assume sprg3 has the physical address of the current
  * task's thread_struct.
  */
-.macro EXCEPTION_PROLOG
-	EXCEPTION_PROLOG_0
+.macro EXCEPTION_PROLOG handle_dar_dsisr=0
+	EXCEPTION_PROLOG_0	handle_dar_dsisr=\handle_dar_dsisr
 	EXCEPTION_PROLOG_1
-	EXCEPTION_PROLOG_2
+	EXCEPTION_PROLOG_2	handle_dar_dsisr=\handle_dar_dsisr
 .endm
 
-.macro EXCEPTION_PROLOG_0
+.macro EXCEPTION_PROLOG_0 handle_dar_dsisr=0
 	mtspr	SPRN_SPRG_SCRATCH0,r10
 	mtspr	SPRN_SPRG_SCRATCH1,r11
+#ifdef CONFIG_VMAP_STACK
+	mfspr	r10, SPRN_SPRG_THREAD
+	.if	\handle_dar_dsisr
+	mfspr	r11, SPRN_DAR
+	stw	r11, DAR(r10)
+	mfspr	r11, SPRN_DSISR
+	stw	r11, DSISR(r10)
+	.endif
+	mfspr	r11, SPRN_SRR0
+	stw	r11, SRR0(r10)
+#endif
 	mfspr	r11, SPRN_SRR1		/* check whether user or kernel */
+#ifdef CONFIG_VMAP_STACK
+	stw	r11, SRR1(r10)
+#endif
 	mfcr	r10
 	andi.	r11, r11, MSR_PR
 .endm
 
 .macro EXCEPTION_PROLOG_1
+#ifdef CONFIG_VMAP_STACK
+	li	r11, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
+	mtmsr	r11
+	subi	r11, r1, INT_FRAME_SIZE		/* use r1 if kernel */
+#else
 	tophys(r11,r1)			/* use tophys(r1) if kernel */
+	subi	r11, r11, INT_FRAME_SIZE	/* alloc exc. frame */
+#endif
 	beq	1f
 	mfspr	r11,SPRN_SPRG_THREAD
+	tovirt_vmstack r11, r11
 	lwz	r11,TASK_STACK-THREAD(r11)
-	addi	r11,r11,THREAD_SIZE
-	tophys(r11,r11)
-1:	subi	r11,r11,INT_FRAME_SIZE	/* alloc exc. frame */
+	addi	r11, r11, THREAD_SIZE - INT_FRAME_SIZE
+	tophys_novmstack r11, r11
+1:
 .endm
 
-.macro EXCEPTION_PROLOG_2
+.macro EXCEPTION_PROLOG_2 handle_dar_dsisr=0
 	stw	r10,_CCR(r11)		/* save registers */
 	stw	r12,GPR12(r11)
 	stw	r9,GPR9(r11)
@@ -44,15 +66,32 @@
 	stw	r12,GPR11(r11)
 	mflr	r10
 	stw	r10,_LINK(r11)
+#ifdef CONFIG_VMAP_STACK
+	mfspr	r12, SPRN_SPRG_THREAD
+	tovirt(r12, r12)
+	.if	\handle_dar_dsisr
+	lwz	r10, DAR(r12)
+	stw	r10, _DAR(r11)
+	lwz	r10, DSISR(r12)
+	stw	r10, _DSISR(r11)
+	.endif
+	lwz	r9, SRR1(r12)
+	lwz	r12, SRR0(r12)
+#else
 	mfspr	r12,SPRN_SRR0
 	mfspr	r9,SPRN_SRR1
+#endif
 	stw	r1,GPR1(r11)
 	stw	r1,0(r11)
-	tovirt(r1,r11)			/* set new kernel sp */
+	tovirt_novmstack r1, r11	/* set new kernel sp */
 #ifdef CONFIG_40x
 	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
 #else
+#ifdef CONFIG_VMAP_STACK
+	li	r10, MSR_KERNEL & ~MSR_IR /* can take exceptions */
+#else
 	li	r10,MSR_KERNEL & ~(MSR_IR|MSR_DR) /* can take exceptions */
+#endif
 	mtmsr	r10			/* (except for mach check in rtas) */
 #endif
 	stw	r0,GPR0(r11)
@@ -65,24 +104,44 @@
 
 .macro SYSCALL_ENTRY trapno
 	mfspr	r12,SPRN_SPRG_THREAD
+#ifdef CONFIG_VMAP_STACK
+	mfspr	r9, SPRN_SRR0
+	mfspr	r11, SPRN_SRR1
+	stw	r9, SRR0(r12)
+	stw	r11, SRR1(r12)
+#endif
 	mfcr	r10
 	lwz	r11,TASK_STACK-THREAD(r12)
-	mflr	r9
-	addi	r11,r11,THREAD_SIZE - INT_FRAME_SIZE
 	rlwinm	r10,r10,0,4,2	/* Clear SO bit in CR */
-	tophys(r11,r11)
+	addi	r11, r11, THREAD_SIZE - INT_FRAME_SIZE
+#ifdef CONFIG_VMAP_STACK
+	li	r9, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
+	mtmsr	r9
+#endif
+	tovirt_vmstack r12, r12
+	tophys_novmstack r11, r11
+	mflr	r9
 	stw	r10,_CCR(r11)		/* save registers */
+	stw	r9, _LINK(r11)
+#ifdef CONFIG_VMAP_STACK
+	lwz	r10, SRR0(r12)
+	lwz	r9, SRR1(r12)
+#else
 	mfspr	r10,SPRN_SRR0
-	stw	r9,_LINK(r11)
 	mfspr	r9,SPRN_SRR1
+#endif
 	stw	r1,GPR1(r11)
 	stw	r1,0(r11)
-	tovirt(r1,r11)			/* set new kernel sp */
+	tovirt_novmstack r1, r11	/* set new kernel sp */
 	stw	r10,_NIP(r11)
 #ifdef CONFIG_40x
 	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
 #else
+#ifdef CONFIG_VMAP_STACK
+	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL & ~MSR_IR) /* can take exceptions */
+#else
 	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL & ~(MSR_IR|MSR_DR)) /* can take exceptions */
+#endif
 	mtmsr	r10			/* (except for mach check in rtas) */
 #endif
 	lis	r10,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
@@ -121,7 +180,7 @@
 #endif
 
 3:
-	tovirt(r2, r2)			/* set r2 to current */
+	tovirt_novmstack r2, r2 	/* set r2 to current */
 	lis	r11, transfer_to_syscall@h
 	ori	r11, r11, transfer_to_syscall@l
 #ifdef CONFIG_TRACE_IRQFLAGS
@@ -145,14 +204,51 @@
 .endm
 
 .macro save_dar_dsisr_on_stack reg1, reg2, sp
+#ifndef CONFIG_VMAP_STACK
 	mfspr	\reg1, SPRN_DAR
 	mfspr	\reg2, SPRN_DSISR
 	stw	\reg1, _DAR(\sp)
 	stw	\reg2, _DSISR(\sp)
+#endif
 .endm
 
 .macro get_and_save_dar_dsisr_on_stack reg1, reg2, sp
+#ifdef CONFIG_VMAP_STACK
+	lwz	\reg1, _DAR(\sp)
+	lwz	\reg2, _DSISR(\sp)
+#else
 	save_dar_dsisr_on_stack \reg1, \reg2, \sp
+#endif
+.endm
+
+.macro tovirt_vmstack dst, src
+#ifdef CONFIG_VMAP_STACK
+	tovirt(\dst, \src)
+#else
+	.ifnc	\dst, \src
+	mr	\dst, \src
+	.endif
+#endif
+.endm
+
+.macro tovirt_novmstack dst, src
+#ifndef CONFIG_VMAP_STACK
+	tovirt(\dst, \src)
+#else
+	.ifnc	\dst, \src
+	mr	\dst, \src
+	.endif
+#endif
+.endm
+
+.macro tophys_novmstack dst, src
+#ifndef CONFIG_VMAP_STACK
+	tophys(\dst, \src)
+#else
+	.ifnc	\dst, \src
+	mr	\dst, \src
+	.endif
+#endif
 .endm
 
 /*
-- 
2.13.3

