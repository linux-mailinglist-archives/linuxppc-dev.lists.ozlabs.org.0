Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 974B02E0B70
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 15:09:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0dWH3JMPzDqdL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 01:09:31 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0cc83LZmzDqQQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 00:28:40 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4D0cc41qBbz9v15c;
 Tue, 22 Dec 2020 14:28:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id aHnOKBynCXsu; Tue, 22 Dec 2020 14:28:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4D0cc40YxTz9v15W;
 Tue, 22 Dec 2020 14:28:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6256C8B81D;
 Tue, 22 Dec 2020 14:28:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HiuLrOXMNsaC; Tue, 22 Dec 2020 14:28:37 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 160C98B812;
 Tue, 22 Dec 2020 14:28:37 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E93F766969; Tue, 22 Dec 2020 13:28:36 +0000 (UTC)
Message-Id: <96d5c555f5b50717c655cfe10b382e9fbba9abc9.1608641533.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1608641532.git.christophe.leroy@csgroup.eu>
References: <cover.1608641532.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 14/15] powerpc/32: Use r1 directly instead of r11 in
 exception prologs on 6xx/8xx
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue, 22 Dec 2020 13:28:36 +0000 (UTC)
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

r1 and r11 are both pointing to the stack. Use r1 and free up r11.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/entry_32.S       |  4 ++++
 arch/powerpc/kernel/head_6xx_8xx.h   | 28 ++++++++++++++--------------
 arch/powerpc/kernel/head_8xx.S       | 10 +++++-----
 arch/powerpc/kernel/head_book3s_32.S |  6 +++---
 4 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 2c38106c2c93..2ec3aa712282 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -318,7 +318,11 @@ stack_ovf:
 	ori	r12,r12,_end@l
 	cmplw	r1,r12
 	ble	5b			/* r1 <= &_end is OK */
+#ifdef CONFIG_HAVE_ARCH_VMAP_STACK
+	SAVE_NVGPRS(r1)
+#else
 	SAVE_NVGPRS(r11)
+#endif
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	lis	r1,init_thread_union@ha
 	addi	r1,r1,init_thread_union@l
diff --git a/arch/powerpc/kernel/head_6xx_8xx.h b/arch/powerpc/kernel/head_6xx_8xx.h
index bedbf37c2a0c..5a90bafee536 100644
--- a/arch/powerpc/kernel/head_6xx_8xx.h
+++ b/arch/powerpc/kernel/head_6xx_8xx.h
@@ -59,34 +59,33 @@
 1:
 	stw	r11,GPR1(r1)
 	stw	r11,0(r1)
-	mr	r11, r1
-	stw	r10,_CCR(r11)		/* save registers */
-	stw	r12,GPR12(r11)
-	stw	r9,GPR9(r11)
+	stw	r10,_CCR(r1)		/* save registers */
+	stw	r12,GPR12(r1)
+	stw	r9,GPR9(r1)
 	mfspr	r10,SPRN_SPRG_SCRATCH0
 	mfspr	r12,SPRN_SPRG_SCRATCH1
-	stw	r10,GPR10(r11)
-	stw	r12,GPR11(r11)
+	stw	r10,GPR10(r1)
+	stw	r12,GPR11(r1)
 	mflr	r10
-	stw	r10,_LINK(r11)
+	stw	r10,_LINK(r1)
 	mfspr	r12, SPRN_SPRG_THREAD
 	tovirt(r12, r12)
 	.if	\handle_dar_dsisr
 	lwz	r10, DAR(r12)
-	stw	r10, _DAR(r11)
+	stw	r10, _DAR(r1)
 	lwz	r10, DSISR(r12)
-	stw	r10, _DSISR(r11)
+	stw	r10, _DSISR(r1)
 	.endif
 	lwz	r9, SRR1(r12)
 	lwz	r12, SRR0(r12)
 	li	r10, MSR_KERNEL		/* can take exceptions */
 	mtmsr	r10			/* (except for mach check in rtas) */
-	stw	r0,GPR0(r11)
+	stw	r0,GPR0(r1)
 	lis	r10,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
 	addi	r10,r10,STACK_FRAME_REGS_MARKER@l
-	stw	r10,8(r11)
-	SAVE_4GPRS(3, r11)
-	SAVE_2GPRS(7, r11)
+	stw	r10,8(r1)
+	SAVE_4GPRS(3, r1)
+	SAVE_2GPRS(7, r1)
 .endm
 
 .macro SYSCALL_ENTRY trapno
@@ -196,7 +195,8 @@
 
 #define EXC_XFER_TEMPLATE(hdlr, trap, tfer, ret)		\
 	li	r10,trap;					\
-	stw	r10,_TRAP(r11);					\
+	mr	r11, r1;					\
+	stw	r10,_TRAP(r1);					\
 	bl	tfer;						\
 	.long	hdlr;						\
 	.long	ret
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 6fa8e58c6e4c..7a078b26d24c 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -316,8 +316,8 @@ InstructionTLBError:
 	tlbie	r12
 	/* 0x400 is InstructionAccess exception, needed by bad_page_fault() */
 .Litlbie:
-	stw	r12, _DAR(r11)
-	stw	r5, _DSISR(r11)
+	stw	r12, _DAR(r1)
+	stw	r5, _DSISR(r1)
 	EXC_XFER_LITE(0x400, handle_page_fault)
 
 /* This is the data TLB error on the MPC8xx.  This could be due to
@@ -335,8 +335,8 @@ DARFixed:/* Return from dcbx instruction bug workaround */
 	mtspr	SPRN_DAR, r11	/* Tag DAR, to be used in DTLB Error */
 	EXCEPTION_PROLOG_1
 	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
-	lwz	r4, _DAR(r11)
-	lwz	r5, _DSISR(r11)
+	lwz	r4, _DAR(r1)
+	lwz	r5, _DSISR(r1)
 	andis.	r10,r5,DSISR_NOHPTE@h
 	beq+	.Ldtlbie
 	tlbie	r4
@@ -358,7 +358,7 @@ do_databreakpoint:
 	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	mfspr	r4,SPRN_BAR
-	stw	r4,_DAR(r11)
+	stw	r4,_DAR(r1)
 	EXC_XFER_STD(0x1c00, do_break)
 
 	. = 0x1c00
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 19a1ae0697fc..40ee63af84f2 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -333,8 +333,8 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	EXCEPTION_PROLOG_1
 	EXCEPTION_PROLOG_2
 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
-	stw	r12, _DAR(r11)
-	stw	r5, _DSISR(r11)
+	stw	r12, _DAR(r1)
+	stw	r5, _DSISR(r1)
 	EXC_XFER_LITE(0x400, handle_page_fault)
 
 /* External interrupt */
@@ -653,7 +653,7 @@ alignment_exception_tramp:
 
 handle_page_fault_tramp_1:
 	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
-	lwz	r5, _DSISR(r11)
+	lwz	r5, _DSISR(r1)
 	andis.	r0, r5, DSISR_DABRMATCH@h
 	bne-	1f
 	EXC_XFER_LITE(0x300, handle_page_fault)
-- 
2.25.0

