Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 847A8302686
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 15:54:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPXvV5tpVzDqwY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 01:54:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPXmN4lWHzDqjx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 01:48:19 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DPXmC0GCvz9v0Gn;
 Mon, 25 Jan 2021 15:48:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6RnKa2gLnmOU; Mon, 25 Jan 2021 15:48:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DPXmB6bDNz9v0Gh;
 Mon, 25 Jan 2021 15:48:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 609E58B79B;
 Mon, 25 Jan 2021 15:48:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Jo92ZP7LPhm5; Mon, 25 Jan 2021 15:48:16 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 05AED8B79E;
 Mon, 25 Jan 2021 15:48:15 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E874A66AD8; Mon, 25 Jan 2021 14:48:15 +0000 (UTC)
Message-Id: <2dc1a491c32be486d96a0ed6f8979025c17bbb23.1611585031.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1611585031.git.christophe.leroy@csgroup.eu>
References: <cover.1611585031.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 03/23] powerpc/32: On syscall entry, enable instruction
 translation at the same time as data
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Mon, 25 Jan 2021 14:48:15 +0000 (UTC)
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

MSR_RI can also be set at the same time because srr0/srr1 are already
saved and r1 is set properly.

On booke, translation is always on, so at the end all PPC32
have translation on early.

This reduces null_syscall benchmark by 13 cycles on 8xx
(296 ==> 283 cycles).

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_32.h    | 26 +++++++++-----------------
 arch/powerpc/kernel/head_booke.h |  7 ++-----
 2 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index fdc07beab844..4029c51dce5d 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -125,9 +125,13 @@
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
@@ -141,9 +145,6 @@
 	stw	r10,_CCR(r11)		/* save registers */
 #ifdef CONFIG_40x
 	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
-#else
-	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL & ~MSR_IR) /* can take exceptions */
-	mtmsr	r10			/* (except for mach check in rtas) */
 #endif
 	lis	r10,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
 	stw	r2,GPR2(r11)
@@ -180,8 +181,6 @@
 #endif
 
 3:
-	lis	r11, transfer_to_syscall@h
-	ori	r11, r11, transfer_to_syscall@l
 #ifdef CONFIG_TRACE_IRQFLAGS
 	/*
 	 * If MSR is changing we need to keep interrupts disabled at this point
@@ -193,15 +192,8 @@
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
 
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 706cd9368992..b3c502c503a0 100644
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

