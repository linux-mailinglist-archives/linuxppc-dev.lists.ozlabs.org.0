Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCB4313862
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 16:46:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZ9NQ5gyyzDqnF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 02:45:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZ8bf2r2CzDrh9
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 02:10:38 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZ8bT6fWNzB09ZH;
 Mon,  8 Feb 2021 16:10:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id k_jGyOKY9R3r; Mon,  8 Feb 2021 16:10:29 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZ8bT5t4dzB09ZC;
 Mon,  8 Feb 2021 16:10:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A0878B7B2;
 Mon,  8 Feb 2021 16:10:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id p3AFaVxZowSO; Mon,  8 Feb 2021 16:10:35 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E426E8B7BA;
 Mon,  8 Feb 2021 16:10:34 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id D9F8E6733E; Mon,  8 Feb 2021 15:10:34 +0000 (UTC)
Message-Id: <1eddb42cb12092b1e3d72608d182c365db3da41d.1612796617.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612796617.git.christophe.leroy@csgroup.eu>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v5 15/22] powerpc/32: Remove verification of MSR_PR on syscall
 in the ASM entry
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Mon,  8 Feb 2021 15:10:34 +0000 (UTC)
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

system_call_exception() checks MSR_PR and BUGs if a syscall
is issued from kernel mode.

No need to handle it anymore from the ASM entry code.

null_syscall reduction 2 cycles (348 => 346 cycles)

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/entry_32.S   | 30 ------------------------------
 arch/powerpc/kernel/head_32.h    |  3 ---
 arch/powerpc/kernel/head_booke.h |  3 ---
 3 files changed, 36 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index bbf7ecea6fe0..cffe58e63356 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -421,36 +421,6 @@ ret_from_kernel_thread:
 	li	r3,0
 	b	ret_from_syscall
 
-	/*
-	 * System call was called from kernel. We get here with SRR1 in r9.
-	 * Mark the exception as recoverable once we have retrieved SRR0,
-	 * trap a warning and return ENOSYS with CR[SO] set.
-	 */
-	.globl	ret_from_kernel_syscall
-ret_from_kernel_syscall:
-	mfspr	r9, SPRN_SRR0
-	mfspr	r10, SPRN_SRR1
-#if !defined(CONFIG_4xx) && !defined(CONFIG_BOOKE)
-	LOAD_REG_IMMEDIATE(r11, MSR_KERNEL & ~(MSR_IR|MSR_DR))
-	mtmsr	r11
-#endif
-
-0:	trap
-	EMIT_BUG_ENTRY 0b,__FILE__,__LINE__, BUGFLAG_WARNING
-
-	li	r3, ENOSYS
-	crset	so
-#if defined(CONFIG_PPC_8xx) && defined(CONFIG_PERF_EVENTS)
-	mtspr	SPRN_NRI, r0
-#endif
-	mtspr	SPRN_SRR0, r9
-	mtspr	SPRN_SRR1, r10
-	rfi
-#ifdef CONFIG_40x
-	b .	/* Prevent prefetch past rfi */
-#endif
-_ASM_NOKPROBE_SYMBOL(ret_from_kernel_syscall)
-
 /*
  * Top-level page fault handling.
  * This is in assembler because if do_page_fault tells us that
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index fea7fe00a690..282d8fd443a9 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -118,8 +118,6 @@
 .macro SYSCALL_ENTRY trapno
 	mfspr	r9, SPRN_SRR1
 	mfspr	r10, SPRN_SRR0
-	andi.	r11, r9, MSR_PR
-	beq-	99f
 	LOAD_REG_IMMEDIATE(r11, MSR_KERNEL)		/* can take exceptions */
 	lis	r12, 1f@h
 	ori	r12, r12, 1f@l
@@ -174,7 +172,6 @@
 3:
 #endif
 	b	transfer_to_syscall		/* jump to handler */
-99:	b	ret_from_kernel_syscall
 .endm
 
 .macro save_dar_dsisr_on_stack reg1, reg2, sp
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index db931f1167aa..bfbd240cc8a2 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -106,10 +106,8 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 #endif
 	mfspr	r9, SPRN_SRR1
 	BOOKE_CLEAR_BTB(r11)
-	andi.	r11, r9, MSR_PR
 	lwz	r11, TASK_STACK - THREAD(r10)
 	rlwinm	r12,r12,0,4,2	/* Clear SO bit in CR */
-	beq-	99f
 	ALLOC_STACK_FRAME(r11, THREAD_SIZE - INT_FRAME_SIZE)
 	stw	r12, _CCR(r11)		/* save various registers */
 	mflr	r12
@@ -155,7 +153,6 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 
 3:
 	b	transfer_to_syscall	/* jump to handler */
-99:	b	ret_from_kernel_syscall
 .endm
 
 /* To handle the additional exception priority levels on 40x and Book-E
-- 
2.25.0

