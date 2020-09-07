Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5841325FB9A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 15:44:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlTzP40lLzDqCC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 23:44:33 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlTwq1Xh0zDqKW
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Sep 2020 23:42:14 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BlTwX6SJcz9tyLp;
 Mon,  7 Sep 2020 15:42:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Zudc7esuDMm9; Mon,  7 Sep 2020 15:42:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BlTwX5d1sz9tyLn;
 Mon,  7 Sep 2020 15:42:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 50BDB8B79F;
 Mon,  7 Sep 2020 15:42:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id B_Ys49AQDKLV; Mon,  7 Sep 2020 15:42:10 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 05BA48B77F;
 Mon,  7 Sep 2020 15:42:10 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id CE0C6656F8; Mon,  7 Sep 2020 13:42:09 +0000 (UTC)
Message-Id: <a027d447022a006c9c4958ac734128e577a3c5c1.1599486108.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/2] powerpc/32: Fix vmap stack - Do not activate MMU before
 reading task struct
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon,  7 Sep 2020 13:42:09 +0000 (UTC)
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

We need r1 to be properly set before activating MMU, so
reading task_struct->stack must be done with MMU off.

This means we need an additional register to play with MSR
bits while r11 now points to the stack. For that, move r10
back to CR (As is already done for hash MMU) and use r10.

We still don't have r1 correct yet when we activate MMU.
It is done in following patch.

Fixes: 028474876f47 ("powerpc/32: prepare for CONFIG_VMAP_STACK")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_32.S |  6 ------
 arch/powerpc/kernel/head_32.h | 31 ++++++-------------------------
 2 files changed, 6 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index f3ab94d73936..d967266d62e8 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -274,14 +274,8 @@ __secondary_hold_acknowledge:
 	DO_KVM  0x200
 MachineCheck:
 	EXCEPTION_PROLOG_0
-#ifdef CONFIG_VMAP_STACK
-	li	r11, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
-	mtmsr	r11
-	isync
-#endif
 #ifdef CONFIG_PPC_CHRP
 	mfspr	r11, SPRN_SPRG_THREAD
-	tovirt_vmstack r11, r11
 	lwz	r11, RTAS_SP(r11)
 	cmpwi	cr1, r11, 0
 	bne	cr1, 7f
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 9abec6cd099c..21effebb9277 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -39,24 +39,13 @@
 .endm
 
 .macro EXCEPTION_PROLOG_1 for_rtas=0
-#ifdef CONFIG_VMAP_STACK
-	.ifeq	\for_rtas
-	li	r11, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
-	mtmsr	r11
-	isync
-	.endif
 	subi	r11, r1, INT_FRAME_SIZE		/* use r1 if kernel */
-#else
-	tophys(r11,r1)			/* use tophys(r1) if kernel */
-	subi	r11, r11, INT_FRAME_SIZE	/* alloc exc. frame */
-#endif
 	beq	1f
 	mfspr	r11,SPRN_SPRG_THREAD
-	tovirt_vmstack r11, r11
 	lwz	r11,TASK_STACK-THREAD(r11)
 	addi	r11, r11, THREAD_SIZE - INT_FRAME_SIZE
-	tophys_novmstack r11, r11
 1:
+	tophys_novmstack r11, r11
 #ifdef CONFIG_VMAP_STACK
 	mtcrf	0x7f, r11
 	bt	32 - THREAD_ALIGN_SHIFT, stack_overflow
@@ -64,12 +53,11 @@
 .endm
 
 .macro EXCEPTION_PROLOG_2 handle_dar_dsisr=0
-#if defined(CONFIG_VMAP_STACK) && defined(CONFIG_PPC_BOOK3S)
-BEGIN_MMU_FTR_SECTION
+#ifdef CONFIG_VMAP_STACK
 	mtcr	r10
-FTR_SECTION_ELSE
-	stw	r10, _CCR(r11)
-ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_HPTE_TABLE)
+	li	r10, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
+	mtmsr	r10
+	isync
 #else
 	stw	r10,_CCR(r11)		/* save registers */
 #endif
@@ -77,11 +65,9 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_HPTE_TABLE)
 	stw	r12,GPR12(r11)
 	stw	r9,GPR9(r11)
 	stw	r10,GPR10(r11)
-#if defined(CONFIG_VMAP_STACK) && defined(CONFIG_PPC_BOOK3S)
-BEGIN_MMU_FTR_SECTION
+#ifdef CONFIG_VMAP_STACK
 	mfcr	r10
 	stw	r10, _CCR(r11)
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 #endif
 	mfspr	r12,SPRN_SPRG_SCRATCH1
 	stw	r12,GPR11(r11)
@@ -97,11 +83,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	stw	r10, _DSISR(r11)
 	.endif
 	lwz	r9, SRR1(r12)
-#if defined(CONFIG_VMAP_STACK) && defined(CONFIG_PPC_BOOK3S)
-BEGIN_MMU_FTR_SECTION
 	andi.	r10, r9, MSR_PR
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
-#endif
 	lwz	r12, SRR0(r12)
 #else
 	mfspr	r12,SPRN_SRR0
@@ -328,7 +310,6 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 #ifdef CONFIG_VMAP_STACK
 #ifdef CONFIG_SMP
 	mfspr	r11, SPRN_SPRG_THREAD
-	tovirt(r11, r11)
 	lwz	r11, TASK_CPU - THREAD(r11)
 	slwi	r11, r11, 3
 	addis	r11, r11, emergency_ctx@ha
-- 
2.25.0

