Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8F1338D9F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 13:51:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dxm0h3cvqz3dqZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 23:51:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dxlyz2Rnnz3cWM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 23:50:15 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dxlyp1MLsz9ttBV;
 Fri, 12 Mar 2021 13:50:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id fCVlvtqJxp1q; Fri, 12 Mar 2021 13:50:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dxlyp0ZKKz9ttBS;
 Fri, 12 Mar 2021 13:50:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 067998B812;
 Fri, 12 Mar 2021 13:50:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id XLf8Lx7hTeNg; Fri, 12 Mar 2021 13:50:10 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 98EB98B764;
 Fri, 12 Mar 2021 13:50:10 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 70991675C9; Fri, 12 Mar 2021 12:50:10 +0000 (UTC)
Message-Id: <1e883e9d93fdb256853d1434c8ad77c257349b2d.1615552866.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615552866.git.christophe.leroy@csgroup.eu>
References: <cover.1615552866.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 01/41] powerpc/traps: Declare unrecoverable_exception() as
 __noreturn
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Fri, 12 Mar 2021 12:50:10 +0000 (UTC)
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

unrecoverable_exception() is never expected to return, most callers
have an infiniteloop in case it returns.

Ensure it really never returns by terminating it with a BUG(), and
declare it __no_return.

It always GCC to really simplify functions calling it. In the exemple
below, it avoids the stack frame in the likely fast path and avoids
code duplication for the exit.

With this patch:

	00000348 <interrupt_exit_kernel_prepare>:
	 348:	81 43 00 84 	lwz     r10,132(r3)
	 34c:	71 48 00 02 	andi.   r8,r10,2
	 350:	41 82 00 2c 	beq     37c <interrupt_exit_kernel_prepare+0x34>
	 354:	71 4a 40 00 	andi.   r10,r10,16384
	 358:	40 82 00 20 	bne     378 <interrupt_exit_kernel_prepare+0x30>
	 35c:	80 62 00 70 	lwz     r3,112(r2)
	 360:	74 63 00 01 	andis.  r3,r3,1
	 364:	40 82 00 28 	bne     38c <interrupt_exit_kernel_prepare+0x44>
	 368:	7d 40 00 a6 	mfmsr   r10
	 36c:	7c 11 13 a6 	mtspr   81,r0
	 370:	7c 12 13 a6 	mtspr   82,r0
	 374:	4e 80 00 20 	blr
	 378:	48 00 00 00 	b       378 <interrupt_exit_kernel_prepare+0x30>
	 37c:	94 21 ff f0 	stwu    r1,-16(r1)
	 380:	7c 08 02 a6 	mflr    r0
	 384:	90 01 00 14 	stw     r0,20(r1)
	 388:	48 00 00 01 	bl      388 <interrupt_exit_kernel_prepare+0x40>
				388: R_PPC_REL24	unrecoverable_exception
	 38c:	38 e2 00 70 	addi    r7,r2,112
	 390:	3d 00 00 01 	lis     r8,1
	 394:	7c c0 38 28 	lwarx   r6,0,r7
	 398:	7c c6 40 78 	andc    r6,r6,r8
	 39c:	7c c0 39 2d 	stwcx.  r6,0,r7
	 3a0:	40 a2 ff f4 	bne     394 <interrupt_exit_kernel_prepare+0x4c>
	 3a4:	38 60 00 01 	li      r3,1
	 3a8:	4b ff ff c0 	b       368 <interrupt_exit_kernel_prepare+0x20>

Without this patch:

	00000348 <interrupt_exit_kernel_prepare>:
	 348:	94 21 ff f0 	stwu    r1,-16(r1)
	 34c:	93 e1 00 0c 	stw     r31,12(r1)
	 350:	7c 7f 1b 78 	mr      r31,r3
	 354:	81 23 00 84 	lwz     r9,132(r3)
	 358:	71 2a 00 02 	andi.   r10,r9,2
	 35c:	41 82 00 34 	beq     390 <interrupt_exit_kernel_prepare+0x48>
	 360:	71 29 40 00 	andi.   r9,r9,16384
	 364:	40 82 00 28 	bne     38c <interrupt_exit_kernel_prepare+0x44>
	 368:	80 62 00 70 	lwz     r3,112(r2)
	 36c:	74 63 00 01 	andis.  r3,r3,1
	 370:	40 82 00 3c 	bne     3ac <interrupt_exit_kernel_prepare+0x64>
	 374:	7d 20 00 a6 	mfmsr   r9
	 378:	7c 11 13 a6 	mtspr   81,r0
	 37c:	7c 12 13 a6 	mtspr   82,r0
	 380:	83 e1 00 0c 	lwz     r31,12(r1)
	 384:	38 21 00 10 	addi    r1,r1,16
	 388:	4e 80 00 20 	blr
	 38c:	48 00 00 00 	b       38c <interrupt_exit_kernel_prepare+0x44>
	 390:	7c 08 02 a6 	mflr    r0
	 394:	90 01 00 14 	stw     r0,20(r1)
	 398:	48 00 00 01 	bl      398 <interrupt_exit_kernel_prepare+0x50>
				398: R_PPC_REL24	unrecoverable_exception
	 39c:	80 01 00 14 	lwz     r0,20(r1)
	 3a0:	81 3f 00 84 	lwz     r9,132(r31)
	 3a4:	7c 08 03 a6 	mtlr    r0
	 3a8:	4b ff ff b8 	b       360 <interrupt_exit_kernel_prepare+0x18>
	 3ac:	39 02 00 70 	addi    r8,r2,112
	 3b0:	3d 40 00 01 	lis     r10,1
	 3b4:	7c e0 40 28 	lwarx   r7,0,r8
	 3b8:	7c e7 50 78 	andc    r7,r7,r10
	 3bc:	7c e0 41 2d 	stwcx.  r7,0,r8
	 3c0:	40 a2 ff f4 	bne     3b4 <interrupt_exit_kernel_prepare+0x6c>
	 3c4:	38 60 00 01 	li      r3,1
	 3c8:	4b ff ff ac 	b       374 <interrupt_exit_kernel_prepare+0x2c>

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 2 +-
 arch/powerpc/kernel/traps.c          | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index e8d09a841373..232a4847f596 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -436,7 +436,7 @@ DECLARE_INTERRUPT_HANDLER_NMI(hmi_exception_realmode);
 
 DECLARE_INTERRUPT_HANDLER_ASYNC(TAUException);
 
-void unrecoverable_exception(struct pt_regs *regs);
+void __noreturn unrecoverable_exception(struct pt_regs *regs);
 
 void replay_system_reset(void);
 void replay_soft_interrupts(void);
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index a44a30b0688c..a1c14680ed5a 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -2170,11 +2170,14 @@ DEFINE_INTERRUPT_HANDLER(SPEFloatingPointRoundException)
  * in the MSR is 0.  This indicates that SRR0/1 are live, and that
  * we therefore lost state by taking this exception.
  */
-void unrecoverable_exception(struct pt_regs *regs)
+void __noreturn unrecoverable_exception(struct pt_regs *regs)
 {
 	pr_emerg("Unrecoverable exception %lx at %lx (msr=%lx)\n",
 		 regs->trap, regs->nip, regs->msr);
 	die("Unrecoverable exception", regs, SIGABRT);
+	/* die() should not return */
+	for (;;)
+		;
 }
 
 #if defined(CONFIG_BOOKE_WDT) || defined(CONFIG_40x)
-- 
2.25.0

