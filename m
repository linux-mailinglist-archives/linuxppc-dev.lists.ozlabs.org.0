Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB95525FBA2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 15:47:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlV3J2NB6zDqCC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 23:47:56 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlTwq1ZKLzDqKr
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Sep 2020 23:42:14 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BlTwZ0gQ1z9tyLs;
 Mon,  7 Sep 2020 15:42:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id r1NoAQYlxdyc; Mon,  7 Sep 2020 15:42:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BlTwY6QQlz9tyLn;
 Mon,  7 Sep 2020 15:42:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 57B798B77F;
 Mon,  7 Sep 2020 15:42:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ZCPvErvMyktz; Mon,  7 Sep 2020 15:42:11 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EEC5E8B79D;
 Mon,  7 Sep 2020 15:42:10 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id DBD32656F8; Mon,  7 Sep 2020 13:42:10 +0000 (UTC)
Message-Id: <8f85e8752ac5af602db7237ef53d634f4f3d3892.1599486108.git.christophe.leroy@csgroup.eu>
In-Reply-To: <a027d447022a006c9c4958ac734128e577a3c5c1.1599486108.git.christophe.leroy@csgroup.eu>
References: <a027d447022a006c9c4958ac734128e577a3c5c1.1599486108.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 2/2] powerpc/32: Fix vmap stack - Properly set r1 before
 activating MMU
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon,  7 Sep 2020 13:42:10 +0000 (UTC)
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

We need r1 to be properly set before activating MMU, otherwise any new
exception taken while saving registers into the stack in exception
prologs will use the user stack, which is wrong and will even lockup
or crash when KUAP is selected.

Do that by switching the meaning of r11 and r1 until we have saved r1
to the stack: copy r1 into r11 and setup the new stack pointer in r1.
To avoid complicating and impacting all generic and specific prolog
code (and more), copy back r1 into r11 once r11 is save onto
the stack.

We could get rid of copying r1 back and forth at the cost of
rewriting everything to use r1 instead of r11 all the way when
CONFIG_VMAP_STACK is set, but the effort is probably not worth it.

Fixes: 028474876f47 ("powerpc/32: prepare for CONFIG_VMAP_STACK")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_32.h | 43 +++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 21effebb9277..cc36998c5541 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -39,15 +39,24 @@
 .endm
 
 .macro EXCEPTION_PROLOG_1 for_rtas=0
+#ifdef CONFIG_VMAP_STACK
+	mr	r11, r1
+	subi	r1, r1, INT_FRAME_SIZE		/* use r1 if kernel */
+	beq	1f
+	mfspr	r1,SPRN_SPRG_THREAD
+	lwz	r1,TASK_STACK-THREAD(r1)
+	addi	r1, r1, THREAD_SIZE - INT_FRAME_SIZE
+#else
 	subi	r11, r1, INT_FRAME_SIZE		/* use r1 if kernel */
 	beq	1f
 	mfspr	r11,SPRN_SPRG_THREAD
 	lwz	r11,TASK_STACK-THREAD(r11)
 	addi	r11, r11, THREAD_SIZE - INT_FRAME_SIZE
+#endif
 1:
 	tophys_novmstack r11, r11
 #ifdef CONFIG_VMAP_STACK
-	mtcrf	0x7f, r11
+	mtcrf	0x7f, r1
 	bt	32 - THREAD_ALIGN_SHIFT, stack_overflow
 #endif
 .endm
@@ -62,6 +71,15 @@
 	stw	r10,_CCR(r11)		/* save registers */
 #endif
 	mfspr	r10, SPRN_SPRG_SCRATCH0
+#ifdef CONFIG_VMAP_STACK
+	stw	r11,GPR1(r1)
+	stw	r11,0(r1)
+	mr	r11, r1
+#else
+	stw	r1,GPR1(r11)
+	stw	r1,0(r11)
+	tovirt(r1, r11)		/* set new kernel sp */
+#endif
 	stw	r12,GPR12(r11)
 	stw	r9,GPR9(r11)
 	stw	r10,GPR10(r11)
@@ -89,9 +107,6 @@
 	mfspr	r12,SPRN_SRR0
 	mfspr	r9,SPRN_SRR1
 #endif
-	stw	r1,GPR1(r11)
-	stw	r1,0(r11)
-	tovirt_novmstack r1, r11	/* set new kernel sp */
 #ifdef CONFIG_40x
 	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
 #else
@@ -309,19 +324,19 @@
 .macro vmap_stack_overflow_exception
 #ifdef CONFIG_VMAP_STACK
 #ifdef CONFIG_SMP
-	mfspr	r11, SPRN_SPRG_THREAD
-	lwz	r11, TASK_CPU - THREAD(r11)
-	slwi	r11, r11, 3
-	addis	r11, r11, emergency_ctx@ha
+	mfspr	r1, SPRN_SPRG_THREAD
+	lwz	r1, TASK_CPU - THREAD(r1)
+	slwi	r1, r1, 3
+	addis	r1, r1, emergency_ctx@ha
 #else
-	lis	r11, emergency_ctx@ha
+	lis	r1, emergency_ctx@ha
 #endif
-	lwz	r11, emergency_ctx@l(r11)
-	cmpwi	cr1, r11, 0
+	lwz	r1, emergency_ctx@l(r1)
+	cmpwi	cr1, r1, 0
 	bne	cr1, 1f
-	lis	r11, init_thread_union@ha
-	addi	r11, r11, init_thread_union@l
-1:	addi	r11, r11, THREAD_SIZE - INT_FRAME_SIZE
+	lis	r1, init_thread_union@ha
+	addi	r1, r1, init_thread_union@l
+1:	addi	r1, r1, THREAD_SIZE - INT_FRAME_SIZE
 	EXCEPTION_PROLOG_2
 	SAVE_NVGPRS(r11)
 	addi	r3, r1, STACK_FRAME_OVERHEAD
-- 
2.25.0

