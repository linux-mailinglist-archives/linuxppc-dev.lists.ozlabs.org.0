Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDFC3324E5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 13:11:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvvFG55KBz3ddg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 23:11:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvvCK6LYHz3bPK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 23:09:33 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DvvCF4NmTz9tyjL;
 Tue,  9 Mar 2021 13:09:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Qlje6MjzgeiT; Tue,  9 Mar 2021 13:09:29 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DvvCF3NZmz9tyjG;
 Tue,  9 Mar 2021 13:09:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5C3308B801;
 Tue,  9 Mar 2021 13:09:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FPYyl94ppFUK; Tue,  9 Mar 2021 13:09:30 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ECB808B803;
 Tue,  9 Mar 2021 13:09:29 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BCF1767555; Tue,  9 Mar 2021 12:09:29 +0000 (UTC)
Message-Id: <1d049f0330edce69349cdf48da8e226822cee368.1615291471.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615291471.git.christophe.leroy@csgroup.eu>
References: <cover.1615291471.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 04/43] powerpc/40x: Change CRITICAL_EXCEPTION_PROLOG macro
 to a gas macro
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Mar 2021 12:09:29 +0000 (UTC)
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

Change CRITICAL_EXCEPTION_PROLOG macro to a gas macro to
remove the ugly ; and \ on each line.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_40x.S | 71 +++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 383238a98f77..9cef423d574b 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -100,42 +100,43 @@ _ENTRY(saved_ksp_limit)
  * Instead we use a couple of words of memory at low physical addresses.
  * This is OK since we don't support SMP on these processors.
  */
-#define CRITICAL_EXCEPTION_PROLOG					     \
-	stw	r10,crit_r10@l(0);	/* save two registers to work with */\
-	stw	r11,crit_r11@l(0);					     \
-	mfcr	r10;			/* save CR in r10 for now	   */\
-	mfspr	r11,SPRN_SRR3;		/* check whether user or kernel    */\
-	andi.	r11,r11,MSR_PR;						     \
-	lis	r11,critirq_ctx@ha;					     \
-	tophys(r11,r11);						     \
-	lwz	r11,critirq_ctx@l(r11);					     \
-	beq	1f;							     \
-	/* COMING FROM USER MODE */					     \
-	mfspr	r11,SPRN_SPRG_THREAD;	/* if from user, start at top of   */\
-	lwz	r11,TASK_STACK-THREAD(r11); /* this thread's kernel stack */\
-1:	addi	r11,r11,THREAD_SIZE-INT_FRAME_SIZE; /* Alloc an excpt frm  */\
-	tophys(r11,r11);						     \
-	stw	r10,_CCR(r11);          /* save various registers	   */\
-	stw	r12,GPR12(r11);						     \
-	stw	r9,GPR9(r11);						     \
-	mflr	r10;							     \
-	stw	r10,_LINK(r11);						     \
-	mfspr	r12,SPRN_DEAR;		/* save DEAR and ESR in the frame  */\
-	stw	r12,_DEAR(r11);		/* since they may have had stuff   */\
-	mfspr	r9,SPRN_ESR;		/* in them at the point where the  */\
-	stw	r9,_ESR(r11);		/* exception was taken		   */\
-	mfspr	r12,SPRN_SRR2;						     \
-	stw	r1,GPR1(r11);						     \
-	mfspr	r9,SPRN_SRR3;						     \
-	stw	r1,0(r11);						     \
-	tovirt(r1,r11);							     \
-	rlwinm	r9,r9,0,14,12;		/* clear MSR_WE (necessary?)	   */\
-	stw	r0,GPR0(r11);						     \
-	lis	r10, STACK_FRAME_REGS_MARKER@ha; /* exception frame marker */\
-	addi	r10, r10, STACK_FRAME_REGS_MARKER@l;			     \
-	stw	r10, 8(r11);						     \
-	SAVE_4GPRS(3, r11);						     \
+.macro CRITICAL_EXCEPTION_PROLOG
+	stw	r10,crit_r10@l(0)	/* save two registers to work with */
+	stw	r11,crit_r11@l(0)
+	mfcr	r10			/* save CR in r10 for now	   */
+	mfspr	r11,SPRN_SRR3		/* check whether user or kernel    */
+	andi.	r11,r11,MSR_PR
+	lis	r11,critirq_ctx@ha
+	tophys(r11,r11)
+	lwz	r11,critirq_ctx@l(r11)
+	beq	1f
+	/* COMING FROM USER MODE */
+	mfspr	r11,SPRN_SPRG_THREAD	/* if from user, start at top of   */
+	lwz	r11,TASK_STACK-THREAD(r11) /* this thread's kernel stack */
+1:	addi	r11,r11,THREAD_SIZE-INT_FRAME_SIZE /* Alloc an excpt frm  */
+	tophys(r11,r11)
+	stw	r10,_CCR(r11)		/* save various registers	   */
+	stw	r12,GPR12(r11)
+	stw	r9,GPR9(r11)
+	mflr	r10
+	stw	r10,_LINK(r11)
+	mfspr	r12,SPRN_DEAR		/* save DEAR and ESR in the frame  */
+	stw	r12,_DEAR(r11)		/* since they may have had stuff   */
+	mfspr	r9,SPRN_ESR		/* in them at the point where the  */
+	stw	r9,_ESR(r11)		/* exception was taken		   */
+	mfspr	r12,SPRN_SRR2
+	stw	r1,GPR1(r11)
+	mfspr	r9,SPRN_SRR3
+	stw	r1,0(r11)
+	tovirt(r1,r11)
+	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?)	   */
+	stw	r0,GPR0(r11)
+	lis	r10, STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
+	addi	r10, r10, STACK_FRAME_REGS_MARKER@l
+	stw	r10, 8(r11)
+	SAVE_4GPRS(3, r11)
 	SAVE_2GPRS(7, r11)
+.endm
 
 	/*
 	 * State at this point:
-- 
2.25.0

