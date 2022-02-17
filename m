Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E82DD4B9F9E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 13:04:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jztln3h1Fz3f09
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 23:04:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jztk95ppBz3cc7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 23:02:41 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Jztjv0gzqz9sST;
 Thu, 17 Feb 2022 13:02:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4sIrdZ3KSFky; Thu, 17 Feb 2022 13:02:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Jztjr3njxz9sSW;
 Thu, 17 Feb 2022 13:02:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6C3FB8B763;
 Thu, 17 Feb 2022 13:02:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mYgyWW0cS6ol; Thu, 17 Feb 2022 13:02:24 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.225])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 16F508B77C;
 Thu, 17 Feb 2022 13:02:24 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21HC2Ida400838
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 13:02:18 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21HC2I1v400837;
 Thu, 17 Feb 2022 13:02:18 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 2/4] powerpc/ftrace: Refactor ftrace_{regs_}caller
Date: Thu, 17 Feb 2022 13:01:57 +0100
Message-Id: <9d7df9e4fc98a86051489f61d3c9bc67f92f7e27.1645099283.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ec286d2cc6989668a96f14543275437d2f3f0e3a.1645099283.git.christophe.leroy@csgroup.eu>
References: <ec286d2cc6989668a96f14543275437d2f3f0e3a.1645099283.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1645099315; l=5451; s=20211009;
 h=from:subject:message-id; bh=OdP+Y3j6aeuHn4MCvrORsH5/3knyo9MY47IKuEvEvq8=;
 b=d/NDHGT3oOH9IiNRN+4tTimvJsgJ0S98qzsof8uoy/l7xvzO8jR9A9YDE7GqI8GFhcOdy4cKXgo8
 yp4E8x+NCWfsCOB70rYX9QsOYCdoDhy7z75CbGqf7KjhrgIJq0dx
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
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

ftrace_caller() and frace_regs_caller() have now a lot in common.

Refactor them using GAS macros.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/trace/ftrace_mprofile.S | 147 ++++++--------------
 1 file changed, 45 insertions(+), 102 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace_mprofile.S b/arch/powerpc/kernel/trace/ftrace_mprofile.S
index 76dab07fd8fd..630b2de9957b 100644
--- a/arch/powerpc/kernel/trace/ftrace_mprofile.S
+++ b/arch/powerpc/kernel/trace/ftrace_mprofile.S
@@ -32,7 +32,7 @@
  * Our job is to save the register state into a struct pt_regs (on the stack)
  * and then arrange for the ftrace function to be called.
  */
-_GLOBAL(ftrace_regs_caller)
+.macro	ftrace_regs_entry allregs
 	/* Save the original return address in A's stack frame */
 #ifdef CONFIG_MPROFILE_KERNEL
 	PPC_STL	r0,LRSAVE(r1)
@@ -43,7 +43,7 @@ _GLOBAL(ftrace_regs_caller)
 
 	/* Save all gprs to pt_regs */
 	SAVE_GPR(0, r1)
-	SAVE_GPRS(2, 11, r1)
+	SAVE_GPRS(3, 10, r1)
 
 #ifdef CONFIG_PPC64
 	/* Ok to continue? */
@@ -52,17 +52,29 @@ _GLOBAL(ftrace_regs_caller)
 	beq	ftrace_no_trace
 #endif
 
-	SAVE_GPRS(12, 31, r1)
+	.if \allregs == 1
+	SAVE_GPR(2, r1)
+	SAVE_GPRS(11, 31, r1)
+	.else
+#ifdef CONFIG_LIVEPATCH_64
+	SAVE_GPR(14, r1)
+#endif
+	.endif
 
 	/* Save previous stack pointer (r1) */
 	addi	r8, r1, SWITCH_FRAME_SIZE
 	PPC_STL	r8, GPR1(r1)
 
+	.if \allregs == 1
 	/* Load special regs for save below */
 	mfmsr   r8
 	mfctr   r9
 	mfxer   r10
 	mfcr	r11
+	.else
+	/* Clear MSR to flag as ftrace_caller versus frace_regs_caller */
+	li	r8, 0
+	.endif
 
 	/* Get the _mcount() call site out of LR */
 	mflr	r7
@@ -96,19 +108,17 @@ _GLOBAL(ftrace_regs_caller)
 
 	/* Save special regs */
 	PPC_STL	r8, _MSR(r1)
+	.if \allregs == 1
 	PPC_STL	r9, _CTR(r1)
 	PPC_STL	r10, _XER(r1)
 	PPC_STL	r11, _CCR(r1)
+	.endif
 
 	/* Load &pt_regs in r6 for call below */
 	addi    r6, r1, STACK_FRAME_OVERHEAD
+.endm
 
-	/* ftrace_call(r3, r4, r5, r6) */
-.globl ftrace_regs_call
-ftrace_regs_call:
-	bl	ftrace_stub
-	nop
-
+.macro	ftrace_regs_exit allregs
 	/* Load ctr with the possibly modified NIP */
 	PPC_LL	r3, _NIP(r1)
 	mtctr	r3
@@ -118,7 +128,14 @@ ftrace_regs_call:
 #endif
 
 	/* Restore gprs */
+	.if \allregs == 1
 	REST_GPRS(2, 31, r1)
+	.else
+	REST_GPRS(3, 10, r1)
+#ifdef CONFIG_LIVEPATCH_64
+	REST_GPR(14, r1)
+#endif
+	.endif
 
 	/* Restore possibly modified LR */
 	PPC_LL	r0, _LINK(r1)
@@ -137,113 +154,39 @@ ftrace_regs_call:
 	bne-	livepatch_handler
 #endif
 	bctr			/* jump after _mcount site */
+.endm
 
-_GLOBAL(ftrace_stub)
-	blr
-
-#ifdef CONFIG_PPC64
-ftrace_no_trace:
-	mflr	r3
-	mtctr	r3
-	REST_GPR(3, r1)
-	addi	r1, r1, SWITCH_FRAME_SIZE
-	mtlr	r0
-	bctr
-#endif
+_GLOBAL(ftrace_regs_caller)
+	ftrace_regs_entry 1
+	/* ftrace_call(r3, r4, r5, r6) */
+.globl ftrace_regs_call
+ftrace_regs_call:
+	bl	ftrace_stub
+	nop
+	ftrace_regs_exit 1
 
 _GLOBAL(ftrace_caller)
-	/* Save the original return address in A's stack frame */
-#ifdef CONFIG_MPROFILE_KERNEL
-	PPC_STL	r0, LRSAVE(r1)
-#endif
-
-	/* Create our stack frame + pt_regs */
-	PPC_STLU	r1, -SWITCH_FRAME_SIZE(r1)
-
-	/* Save all gprs to pt_regs */
-	SAVE_GPRS(3, 10, r1)
-
-#ifdef CONFIG_PPC64
-	lbz	r3, PACA_FTRACE_ENABLED(r13)
-	cmpdi	r3, 0
-	beq	ftrace_no_trace
-#endif
-
-	/* Save previous stack pointer (r1) */
-	addi	r8, r1, SWITCH_FRAME_SIZE
-	PPC_STL	r8, GPR1(r1)
-
-	/* Get the _mcount() call site out of LR */
-	mflr	r7
-	PPC_STL     r7, _NIP(r1)
-
-#ifdef CONFIG_PPC64
-	/* Save callee's TOC in the ABI compliant location */
-	std	r2, 24(r1)
-	ld	r2, PACATOC(r13)	/* get kernel TOC in r2 */
-
-	addis	r3, r2, function_trace_op@toc@ha
-	addi	r3, r3, function_trace_op@toc@l
-	ld	r5, 0(r3)
-#else
-	lis	r3,function_trace_op@ha
-	lwz	r5,function_trace_op@l(r3)
-#endif
-
-#ifdef CONFIG_LIVEPATCH_64
-	SAVE_GPR(14, r1)
-	mr	r14, r7		/* remember old NIP */
-#endif
-	/* Calculate ip from nip-4 into r3 for call below */
-	subi    r3, r7, MCOUNT_INSN_SIZE
-
-	/* Put the original return address in r4 as parent_ip */
-	PPC_STL	r0, _LINK(r1)
-	mr	r4, r0
-
-	/* Clear MSR to flag as ftrace_caller versus frace_regs_caller */
-	li	r8, 0
-	PPC_STL	r8, _MSR(r1)
-
-	/* Load &pt_regs in r6 for call below */
-	addi    r6, r1, STACK_FRAME_OVERHEAD
-
+	ftrace_regs_entry 0
 	/* ftrace_call(r3, r4, r5, r6) */
 .globl ftrace_call
 ftrace_call:
 	bl	ftrace_stub
 	nop
+	ftrace_regs_exit 0
 
-	PPC_LL	r3, _NIP(r1)
-	mtctr	r3
-
-#ifdef CONFIG_LIVEPATCH_64
-	cmpd	r14, r3		/* has NIP been altered? */
-	REST_GPR(14, r1)
-#endif
-
-	/* Restore gprs */
-	REST_GPRS(3, 10, r1)
+_GLOBAL(ftrace_stub)
+	blr
 
 #ifdef CONFIG_PPC64
-	/* Restore callee's TOC */
-	ld	r2, 24(r1)
-#endif
-
-	/* Restore possibly modified LR */
-	PPC_LL	r0, _LINK(r1)
-	mtlr	r0
-
-	/* Pop our stack frame */
+ftrace_no_trace:
+	mflr	r3
+	mtctr	r3
+	REST_GPR(3, r1)
 	addi	r1, r1, SWITCH_FRAME_SIZE
-
-#ifdef CONFIG_LIVEPATCH_64
-        /* Based on the cmpd above, if the NIP was altered handle livepatch */
-	bne-	livepatch_handler
+	mtlr	r0
+	bctr
 #endif
 
-	bctr			/* jump after _mcount site */
-
 #ifdef CONFIG_LIVEPATCH_64
 	/*
 	 * This function runs in the mcount context, between two functions. As
-- 
2.34.1

