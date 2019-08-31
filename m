Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 496E6A43FC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 12:22:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46LC8q3Jq1zDr4C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 20:22:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="LMyxkAhR"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46LC3q4QnwzDrBp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 20:18:31 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46LC3k6T7dz9v4gT;
 Sat, 31 Aug 2019 12:18:26 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=LMyxkAhR; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 7ZsJx2QMlD4n; Sat, 31 Aug 2019 12:18:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46LC3k5Qwnz9v4gL;
 Sat, 31 Aug 2019 12:18:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1567246706; bh=bM1bhxAO6hwoV672zURZYT3x8jwNI0Odx6g1i8tDJqM=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=LMyxkAhRiUnOOwyqpqwMnBQ+XPu/HR9ncqEj38oQG56T5LFKuVSGaoet77J50YRji
 ZeN6UgBMuKp0wqVTU/lIn7z6M6UAory0AwZ42Yx1gkuLq2/mysV1jAJSstvojMU2Tu
 t0eZVMYVo0FPAqjOG0m1TJ4vkvaKCMqi3Zr249S4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1F7738B7B9;
 Sat, 31 Aug 2019 12:18:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id r23QE8-lricp; Sat, 31 Aug 2019 12:18:28 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C58D58B789;
 Sat, 31 Aug 2019 12:18:27 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 8A2316985C; Sat, 31 Aug 2019 10:18:27 +0000 (UTC)
Message-Id: <ff05d3b3770aae810b56fc3efa7091d2da1cd9da.1567245404.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1567245404.git.christophe.leroy@c-s.fr>
References: <cover.1567245404.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v2 03/10] powerpc/32: prepare for CONFIG_VMAP_STACK
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, dja@axtens.net
Date: Sat, 31 Aug 2019 10:18:27 +0000 (UTC)
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

To support CONFIG_VMAP_STACK, the kernel has to activate Data MMU
Translation for accessing the stack. Before doing that it must save
SRR0, SRR1 and DAR in order to not loose them in case there is a
Data TLB Miss once the translation is reactivated.

This patch defines fields in the thread struct for saving those
registers. It prepares entry_32.S to handle exception entry with
Data MMU Translation enabled and alters EXCEPTION_PROLOG macros to
save SRR0, SRR1 and DAR and reenable Data MMU.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/processor.h   |  5 +++
 arch/powerpc/include/asm/thread_info.h |  5 +++
 arch/powerpc/kernel/asm-offsets.c      |  5 +++
 arch/powerpc/kernel/entry_32.S         |  7 +++
 arch/powerpc/kernel/head_32.h          | 82 ++++++++++++++++++++++++++++++++--
 5 files changed, 101 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index a9993e7a443b..867a4e761d7a 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -163,6 +163,11 @@ struct thread_struct {
 #if defined(CONFIG_PPC_BOOK3S_32) && defined(CONFIG_PPC_KUAP)
 	unsigned long	kuap;		/* opened segments for user access */
 #endif
+#ifdef CONFIG_VMAP_STACK
+	unsigned long	dar;
+	unsigned long	srr0;
+	unsigned long	srr1;
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
index 4ccb6b3a7fbd..a2194fe8f890 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -127,6 +127,11 @@ int main(void)
 	OFFSET(KSP_VSID, thread_struct, ksp_vsid);
 #else /* CONFIG_PPC64 */
 	OFFSET(PGDIR, thread_struct, pgdir);
+#ifdef CONFIG_VMAP_STACK
+	OFFSET(SRR0, thread_struct, srr0);
+	OFFSET(SRR1, thread_struct, srr1);
+	OFFSET(DAR, thread_struct, dar);
+#endif
 #ifdef CONFIG_SPE
 	OFFSET(THREAD_EVR0, thread_struct, evr[0]);
 	OFFSET(THREAD_ACC, thread_struct, acc);
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 44716157c918..ef296572a513 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -140,6 +140,9 @@ transfer_to_handler:
 	stw	r12,_CTR(r11)
 	stw	r2,_XER(r11)
 	mfspr	r12,SPRN_SPRG_THREAD
+#ifdef CONFIG_VMAP_STACK
+	tovirt(r12, r12)
+#endif
 	beq	2f			/* if from user, fix up THREAD.regs */
 	addi	r2, r12, -THREAD
 	addi	r11,r1,STACK_FRAME_OVERHEAD
@@ -195,7 +198,11 @@ transfer_to_handler:
 transfer_to_handler_cont:
 3:
 	mflr	r9
+#ifdef CONFIG_VMAP_STACK
+	tovirt(r9, r9)
+#else
 	tovirt(r2, r2)			/* set r2 to current */
+#endif
 	lwz	r11,0(r9)		/* virtual address of handler */
 	lwz	r9,4(r9)		/* where to go when done */
 #if defined(CONFIG_PPC_8xx) && defined(CONFIG_PERF_EVENTS)
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 8e345f8d4b0e..4980babde59e 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -19,19 +19,42 @@
 .macro EXCEPTION_PROLOG_0
 	mtspr	SPRN_SPRG_SCRATCH0,r10
 	mtspr	SPRN_SPRG_SCRATCH1,r11
+#ifdef CONFIG_VMAP_STACK
+	mfspr	r10, SPRN_SPRG_THREAD
+	mfspr	r11, SPRN_SRR0
+	stw	r11, SRR0(r10)
+	mfspr	r11, SPRN_DAR
+	stw	r11, DAR(r10)
+	mfspr	r11,SPRN_SRR1		/* check whether user or kernel */
+	stw	r11, SRR1(r10)
+#endif
 	mfcr	r10
 .endm
 
 .macro EXCEPTION_PROLOG_1
+#ifndef CONFIG_VMAP_STACK
 	mfspr	r11,SPRN_SRR1		/* check whether user or kernel */
+#endif
 	andi.	r11,r11,MSR_PR
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
+#ifdef CONFIG_VMAP_STACK
+	tovirt(r11, r11)
+#endif
 	lwz	r11,TASK_STACK-THREAD(r11)
-	addi	r11,r11,THREAD_SIZE
+	addi	r11, r11, THREAD_SIZE - INT_FRAME_SIZE
+#ifndef CONFIG_VMAP_STACK
 	tophys(r11,r11)
-1:	subi	r11,r11,INT_FRAME_SIZE	/* alloc exc. frame */
+#endif
+1:
 .endm
 
 .macro EXCEPTION_PROLOG_2
@@ -42,17 +65,36 @@
 	stw	r10,GPR10(r11)
 	mfspr	r12,SPRN_SPRG_SCRATCH1
 	stw	r12,GPR11(r11)
+#ifdef CONFIG_VMAP_STACK
+	mfspr	r12, SPRN_SPRG_THREAD
+	tovirt(r12, r12)
+#endif
 	mflr	r10
 	stw	r10,_LINK(r11)
+#ifdef CONFIG_VMAP_STACK
+	lwz	r10, DAR(r12)
+	stw	r10, _DAR(r11)
+	lwz	r9, SRR1(r12)
+	lwz	r12, SRR0(r12)
+#else
 	mfspr	r12,SPRN_SRR0
 	mfspr	r9,SPRN_SRR1
+#endif
 	stw	r1,GPR1(r11)
 	stw	r1,0(r11)
+#ifdef CONFIG_VMAP_STACK
+	mr	r1, r11			/* set new kernel sp */
+#else
 	tovirt(r1,r11)			/* set new kernel sp */
+#endif
 #ifdef CONFIG_40x
 	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
 #else
+#ifdef CONFIG_VMAP_STACK
+	li	r10,MSR_KERNEL & ~MSR_IR /* can take exceptions */
+#else
 	li	r10,MSR_KERNEL & ~(MSR_IR|MSR_DR) /* can take exceptions */
+#endif
 	mtmsr	r10			/* (except for mach check in rtas) */
 #endif
 	stw	r0,GPR0(r11)
@@ -65,24 +107,56 @@
 
 .macro SYSCALL_ENTRY trapno
 	mfspr	r12,SPRN_SPRG_THREAD
+#ifdef CONFIG_VMAP_STACK
+	mfspr	r9, SPRN_SRR0
+	mfspr	r10, SPRN_DAR
+	mfspr	r11,SPRN_SRR1		/* check whether user or kernel */
+	stw	r9, SRR0(r12)
+	stw	r10, DAR(r12)
+	stw	r11, SRR1(r12)
+#endif
 	mfcr	r10
 	lwz	r11,TASK_STACK-THREAD(r12)
-	mflr	r9
 	addi	r11,r11,THREAD_SIZE - INT_FRAME_SIZE
 	rlwinm	r10,r10,0,4,2	/* Clear SO bit in CR */
+#ifdef CONFIG_VMAP_STACK
+	li	r9, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
+	mtmsr	r9			/* (except for mach check in rtas) */
+	tovirt(r12, r12)
+#else
 	tophys(r11,r11)
+#endif
+	mflr	r9
 	stw	r10,_CCR(r11)		/* save registers */
+#ifdef CONFIG_VMAP_STACK
+	lwz	r10, DAR(r12)
+	stw	r10, _DAR(r11)
+	lwz	r10, SRR0(r12)
+#else
 	mfspr	r10,SPRN_SRR0
+#endif
 	stw	r9,_LINK(r11)
+#ifdef CONFIG_VMAP_STACK
+	lwz	r9, SRR1(r12)
+#else
 	mfspr	r9,SPRN_SRR1
+#endif
 	stw	r1,GPR1(r11)
 	stw	r1,0(r11)
+#ifdef CONFIG_VMAP_STACK
+	mr	r1, r11
+#else
 	tovirt(r1,r11)			/* set new kernel sp */
+#endif
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
@@ -121,7 +195,9 @@
 #endif
 
 3:
+#ifndef CONFIG_VMAP_STACK
 	tovirt(r2, r2)			/* set r2 to current */
+#endif
 	lis	r11, transfer_to_syscall@h
 	ori	r11, r11, transfer_to_syscall@l
 #ifdef CONFIG_TRACE_IRQFLAGS
-- 
2.13.3

