Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E2092625
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 16:08:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Bwkz3QbJzDqY4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 00:08:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="WLNKijPn"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BwVw20hGzDqkG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 23:58:15 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46BwVk41jjz9txwQ;
 Mon, 19 Aug 2019 15:58:06 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=WLNKijPn; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id p8Wca8SooVQV; Mon, 19 Aug 2019 15:58:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46BwVk2xyQz9txvq;
 Mon, 19 Aug 2019 15:58:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566223086; bh=q9fBzwKwRG06oZLfSFusUm6TSq5MWQXriWe5dwr5++c=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=WLNKijPn12Do8FV/IX6OWMhwwsbOnj31DiENPaOc0x/VfPLKuX2y0MD2xrofl1BE6
 /iULLtZQczfvBzTk+Cr/rqXUF3I6p6FpsWNtqaXrwh4ofJHUB+gn/0jxeD4F+hpgys
 s7+BUn97Gwd6rUCGTM5OB72zC6HILNC57gMMba/U=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EDACF8B7B9;
 Mon, 19 Aug 2019 15:58:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 98LYPPthgiV4; Mon, 19 Aug 2019 15:58:11 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C73198B7B7;
 Mon, 19 Aug 2019 15:58:11 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C4F6F6B70A; Mon, 19 Aug 2019 13:58:11 +0000 (UTC)
Message-Id: <2565f449255f8bca1277de1b29ea11642d362ae7.1566223054.git.christophe.leroy@c-s.fr>
In-Reply-To: <be2b971c89b1af30d680cedd14e99a83138ef40a.1566223054.git.christophe.leroy@c-s.fr>
References: <be2b971c89b1af30d680cedd14e99a83138ef40a.1566223054.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 2/3] powerpc/32: replace LOAD_MSR_KERNEL() by
 LOAD_REG_IMMEDIATE()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 segher@kernel.crashing.org
Date: Mon, 19 Aug 2019 13:58:11 +0000 (UTC)
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

LOAD_MSR_KERNEL() and LOAD_REG_IMMEDIATE() are doing the same thing
in the same way. Drop LOAD_MSR_KERNEL()

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

---
v2: no change
v3: no change
---
 arch/powerpc/kernel/entry_32.S | 18 +++++++++---------
 arch/powerpc/kernel/head_32.h  | 21 ++++-----------------
 2 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 54fab22c9a43..972b05504a0a 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -230,7 +230,7 @@ transfer_to_handler_cont:
 	 */
 	lis	r12,reenable_mmu@h
 	ori	r12,r12,reenable_mmu@l
-	LOAD_MSR_KERNEL(r0, MSR_KERNEL)
+	LOAD_REG_IMMEDIATE(r0, MSR_KERNEL)
 	mtspr	SPRN_SRR0,r12
 	mtspr	SPRN_SRR1,r0
 	SYNC
@@ -304,7 +304,7 @@ stack_ovf:
 	addi	r1,r1,THREAD_SIZE-STACK_FRAME_OVERHEAD
 	lis	r9,StackOverflow@ha
 	addi	r9,r9,StackOverflow@l
-	LOAD_MSR_KERNEL(r10,MSR_KERNEL)
+	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL)
 #if defined(CONFIG_PPC_8xx) && defined(CONFIG_PERF_EVENTS)
 	mtspr	SPRN_NRI, r0
 #endif
@@ -324,7 +324,7 @@ trace_syscall_entry_irq_off:
 	bl	trace_hardirqs_on
 
 	/* Now enable for real */
-	LOAD_MSR_KERNEL(r10, MSR_KERNEL | MSR_EE)
+	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL | MSR_EE)
 	mtmsr	r10
 
 	REST_GPR(0, r1)
@@ -394,7 +394,7 @@ ret_from_syscall:
 #endif
 	mr	r6,r3
 	/* disable interrupts so current_thread_info()->flags can't change */
-	LOAD_MSR_KERNEL(r10,MSR_KERNEL)	/* doesn't include MSR_EE */
+	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL)	/* doesn't include MSR_EE */
 	/* Note: We don't bother telling lockdep about it */
 	SYNC
 	MTMSRD(r10)
@@ -824,7 +824,7 @@ ret_from_except:
 	 * can't change between when we test it and when we return
 	 * from the interrupt. */
 	/* Note: We don't bother telling lockdep about it */
-	LOAD_MSR_KERNEL(r10,MSR_KERNEL)
+	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL)
 	SYNC			/* Some chip revs have problems here... */
 	MTMSRD(r10)		/* disable interrupts */
 
@@ -991,7 +991,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
 	 * can restart the exception exit path at the label
 	 * exc_exit_restart below.  -- paulus
 	 */
-	LOAD_MSR_KERNEL(r10,MSR_KERNEL & ~MSR_RI)
+	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL & ~MSR_RI)
 	SYNC
 	MTMSRD(r10)		/* clear the RI bit */
 	.globl exc_exit_restart
@@ -1066,7 +1066,7 @@ exc_exit_restart_end:
 	REST_NVGPRS(r1);						\
 	lwz	r3,_MSR(r1);						\
 	andi.	r3,r3,MSR_PR;						\
-	LOAD_MSR_KERNEL(r10,MSR_KERNEL);				\
+	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL);				\
 	bne	user_exc_return;					\
 	lwz	r0,GPR0(r1);						\
 	lwz	r2,GPR2(r1);						\
@@ -1236,7 +1236,7 @@ recheck:
 	 * neither. Those disable/enable cycles used to peek at
 	 * TI_FLAGS aren't advertised.
 	 */
-	LOAD_MSR_KERNEL(r10,MSR_KERNEL)
+	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL)
 	SYNC
 	MTMSRD(r10)		/* disable interrupts */
 	lwz	r9,TI_FLAGS(r2)
@@ -1329,7 +1329,7 @@ _GLOBAL(enter_rtas)
 	lwz	r4,RTASBASE(r4)
 	mfmsr	r9
 	stw	r9,8(r1)
-	LOAD_MSR_KERNEL(r0,MSR_KERNEL)
+	LOAD_REG_IMMEDIATE(r0,MSR_KERNEL)
 	SYNC			/* disable interrupts so SRR0/1 */
 	MTMSRD(r0)		/* don't get trashed */
 	li	r9,MSR_KERNEL & ~(MSR_IR|MSR_DR)
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 4a692553651f..8abc7783dbe5 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -5,19 +5,6 @@
 #include <asm/ptrace.h>	/* for STACK_FRAME_REGS_MARKER */
 
 /*
- * MSR_KERNEL is > 0x8000 on 4xx/Book-E since it include MSR_CE.
- */
-.macro __LOAD_MSR_KERNEL r, x
-.if \x >= 0x8000
-	lis \r, (\x)@h
-	ori \r, \r, (\x)@l
-.else
-	li \r, (\x)
-.endif
-.endm
-#define LOAD_MSR_KERNEL(r, x) __LOAD_MSR_KERNEL r, x
-
-/*
  * Exception entry code.  This code runs with address translation
  * turned off, i.e. using physical addresses.
  * We assume sprg3 has the physical address of the current
@@ -92,7 +79,7 @@
 #ifdef CONFIG_40x
 	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
 #else
-	LOAD_MSR_KERNEL(r10, MSR_KERNEL & ~(MSR_IR|MSR_DR)) /* can take exceptions */
+	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL & ~(MSR_IR|MSR_DR)) /* can take exceptions */
 	MTMSRD(r10)			/* (except for mach check in rtas) */
 #endif
 	lis	r10,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
@@ -140,10 +127,10 @@
 	 * otherwise we might risk taking an interrupt before we tell lockdep
 	 * they are enabled.
 	 */
-	LOAD_MSR_KERNEL(r10, MSR_KERNEL)
+	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL)
 	rlwimi	r10, r9, 0, MSR_EE
 #else
-	LOAD_MSR_KERNEL(r10, MSR_KERNEL | MSR_EE)
+	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL | MSR_EE)
 #endif
 #if defined(CONFIG_PPC_8xx) && defined(CONFIG_PERF_EVENTS)
 	mtspr	SPRN_NRI, r0
@@ -187,7 +174,7 @@
 #define EXC_XFER_TEMPLATE(hdlr, trap, msr, tfer, ret)		\
 	li	r10,trap;					\
 	stw	r10,_TRAP(r11);					\
-	LOAD_MSR_KERNEL(r10, msr);				\
+	LOAD_REG_IMMEDIATE(r10, msr);				\
 	bl	tfer;						\
 	.long	hdlr;						\
 	.long	ret
-- 
2.13.3

