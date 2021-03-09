Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF21332543
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 13:17:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvvNs0Wt2z3gqt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 23:17:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvvCk1HHbz3cXM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 23:09:54 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DvvCd4s4xz9tyjN;
 Tue,  9 Mar 2021 13:09:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4FjtD87utoeF; Tue,  9 Mar 2021 13:09:49 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DvvCd44Lvz9tyjH;
 Tue,  9 Mar 2021 13:09:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DF2D78B800;
 Tue,  9 Mar 2021 13:09:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id r04OLEq3xoDj; Tue,  9 Mar 2021 13:09:50 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 97CF68B7FC;
 Tue,  9 Mar 2021 13:09:50 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7A66D67555; Tue,  9 Mar 2021 12:09:50 +0000 (UTC)
Message-Id: <f5493b22b4149f59aa8dd2ceec0bd97c8a19a050.1615291473.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615291471.git.christophe.leroy@csgroup.eu>
References: <cover.1615291471.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 24/43] powerpc/32: Always save non volatile registers on
 exception entry
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Mar 2021 12:09:50 +0000 (UTC)
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

In preparation of handling exception entry and exit in C,
in order to simplify the handling, always save non volatile registers
when entering an exception.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ptrace.h |  6 ++----
 arch/powerpc/kernel/entry_32.S    | 13 +------------
 arch/powerpc/kernel/head_32.h     |  3 +--
 arch/powerpc/kernel/head_booke.h  |  2 +-
 4 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 975ba260006a..0a5d8c6b13c4 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -209,16 +209,14 @@ static inline void regs_set_return_value(struct pt_regs *regs, unsigned long rc)
  */
 #define TRAP_FLAGS_MASK		0x1F
 #define TRAP(regs)		((regs)->trap & ~TRAP_FLAGS_MASK)
-#define FULL_REGS(regs)		(((regs)->trap & 1) == 0)
-#define SET_FULL_REGS(regs)	((regs)->trap |= 1)
+#define FULL_REGS(regs)		true
+#define SET_FULL_REGS(regs)	do { } while (0)
 #define IS_CRITICAL_EXC(regs)	(((regs)->trap & 2) != 0)
 #define IS_MCHECK_EXC(regs)	(((regs)->trap & 4) != 0)
 #define IS_DEBUG_EXC(regs)	(((regs)->trap & 8) != 0)
 #define NV_REG_POISON		0xdeadbeef
 #define CHECK_FULL_REGS(regs)						      \
 do {									      \
-	if ((regs)->trap & 1)						      \
-		printk(KERN_CRIT "%s: partial register set\n", __func__); \
 } while (0)
 #endif /* __powerpc64__ */
 
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index fb849ef922fb..7084289994b3 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -81,12 +81,12 @@ _ASM_NOKPROBE_SYMBOL(crit_transfer_to_handler)
  */
 	.globl	transfer_to_handler_full
 transfer_to_handler_full:
-	SAVE_NVGPRS(r11)
 _ASM_NOKPROBE_SYMBOL(transfer_to_handler_full)
 	/* fall through */
 
 	.globl	transfer_to_handler
 transfer_to_handler:
+	SAVE_NVGPRS(r11)
 	stw	r2,GPR2(r11)
 	stw	r12,_NIP(r11)
 	stw	r9,_MSR(r11)
@@ -234,10 +234,6 @@ handle_page_fault:
 	bl	do_page_fault
 	cmpwi	r3,0
 	beq+	ret_from_except
-	SAVE_NVGPRS(r1)
-	lwz	r0,_TRAP(r1)
-	clrrwi	r0,r0,1
-	stw	r0,_TRAP(r1)
 	mr	r4,r3		/* err arg for bad_page_fault */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	__bad_page_fault
@@ -810,13 +806,6 @@ recheck:
 do_user_signal:			/* r10 contains MSR_KERNEL here */
 	ori	r10,r10,MSR_EE
 	mtmsr	r10		/* hard-enable interrupts */
-	/* save r13-r31 in the exception frame, if not already done */
-	lwz	r3,_TRAP(r1)
-	andi.	r0,r3,1
-	beq	2f
-	SAVE_NVGPRS(r1)
-	rlwinm	r3,r3,0,0,30
-	stw	r3,_TRAP(r1)
 2:	addi	r3,r1,STACK_FRAME_OVERHEAD
 	mr	r4,r9
 	bl	do_notify_resume
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index e09585b88ba7..087445e45489 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -198,7 +198,7 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 			  ret_from_except_full)
 
 #define EXC_XFER_LITE(n, hdlr)		\
-	EXC_XFER_TEMPLATE(hdlr, n+1, MSR_KERNEL, transfer_to_handler, \
+	EXC_XFER_TEMPLATE(hdlr, n, MSR_KERNEL, transfer_to_handler, \
 			  ret_from_except)
 
 .macro vmap_stack_overflow_exception
@@ -215,7 +215,6 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 	lwz	r1, emergency_ctx@l(r1)
 	addi	r1, r1, THREAD_SIZE - INT_FRAME_SIZE
 	EXCEPTION_PROLOG_2 vmap_stack_overflow
-	SAVE_NVGPRS(r11)
 	addi	r3, r1, STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0, stack_overflow_exception)
 .endm
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 3707f49f0b78..b31bf9e833c0 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -331,7 +331,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 			  ret_from_except_full)
 
 #define EXC_XFER_LITE(n, hdlr)		\
-	EXC_XFER_TEMPLATE(hdlr, n+1, MSR_KERNEL, transfer_to_handler, \
+	EXC_XFER_TEMPLATE(hdlr, n, MSR_KERNEL, transfer_to_handler, \
 			  ret_from_except)
 
 /* Check for a single step debug exception while in an exception
-- 
2.25.0

