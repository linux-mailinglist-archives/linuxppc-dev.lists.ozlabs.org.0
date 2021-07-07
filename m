Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1B83BE2D7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 07:55:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GKTDP5gH2z3bjv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 15:55:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GKTD32kRlz2yM7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jul 2021 15:55:11 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GKTCw1yKhzBDR7;
 Wed,  7 Jul 2021 07:55:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0MMGcGT251sf; Wed,  7 Jul 2021 07:55:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GKTCv4qjCzBDPg;
 Wed,  7 Jul 2021 07:55:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 975948B7B9;
 Wed,  7 Jul 2021 07:55:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EmTIZnrzb-sY; Wed,  7 Jul 2021 07:55:07 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4DAE38B76E;
 Wed,  7 Jul 2021 07:55:07 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 169F266408; Wed,  7 Jul 2021 05:55:07 +0000 (UTC)
Message-Id: <028d5483b4851b01ea4334d0751e7f260419092b.1625637264.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/32: Fix critical and debug interrupts on BOOKE
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 radu.rendec@gmail.com
Date: Wed,  7 Jul 2021 05:55:07 +0000 (UTC)
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

32 bits BOOKE have special interrupts for debug and other
critical events.

When handling those interrupts, dedicated registers are saved
in the stack frame in addition to the standard registers, leading
to a shift of the pt_regs struct.

Since commit db297c3b07af ("powerpc/32: Don't save thread.regs on
interrupt entry"), the pt_regs struct is expected to be at the
same place all the time.

Instead of handling a special struct in addition to pt_regs, just
add those special registers to struct pt_regs.

Reported-by: Radu Rendec <radu.rendec@gmail.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Fixes: db297c3b07af ("powerpc/32: Don't save thread.regs on interrupt entry")
Cc: stable@vger.kernel.org
---
 arch/powerpc/include/asm/ptrace.h | 16 ++++++++++++++++
 arch/powerpc/kernel/asm-offsets.c | 31 ++++++++++++++-----------------
 arch/powerpc/kernel/head_booke.h  | 27 +++------------------------
 3 files changed, 33 insertions(+), 41 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 3e5d470a6155..14422e851494 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -70,6 +70,22 @@ struct pt_regs
 		unsigned long __pad[4];	/* Maintain 16 byte interrupt stack alignment */
 	};
 #endif
+#if defined(CONFIG_PPC32) && defined(CONFIG_BOOKE)
+	struct { /* Must be a multiple of 16 bytes */
+		unsigned long mas0;
+		unsigned long mas1;
+		unsigned long mas2;
+		unsigned long mas3;
+		unsigned long mas6;
+		unsigned long mas7;
+		unsigned long srr0;
+		unsigned long srr1;
+		unsigned long csrr0;
+		unsigned long csrr1;
+		unsigned long dsrr0;
+		unsigned long dsrr1;
+	};
+#endif
 };
 #endif
 
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index a47eefa09bcb..5bee245d832b 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -309,24 +309,21 @@ int main(void)
 	STACK_PT_REGS_OFFSET(STACK_REGS_IAMR, iamr);
 #endif
 
-#if defined(CONFIG_PPC32)
-#if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
-	DEFINE(EXC_LVL_SIZE, STACK_EXC_LVL_FRAME_SIZE);
-	DEFINE(MAS0, STACK_INT_FRAME_SIZE+offsetof(struct exception_regs, mas0));
+#if defined(CONFIG_PPC32) && defined(CONFIG_BOOKE)
+	STACK_PT_REGS_OFFSET(MAS0, mas0);
 	/* we overload MMUCR for 44x on MAS0 since they are mutually exclusive */
-	DEFINE(MMUCR, STACK_INT_FRAME_SIZE+offsetof(struct exception_regs, mas0));
-	DEFINE(MAS1, STACK_INT_FRAME_SIZE+offsetof(struct exception_regs, mas1));
-	DEFINE(MAS2, STACK_INT_FRAME_SIZE+offsetof(struct exception_regs, mas2));
-	DEFINE(MAS3, STACK_INT_FRAME_SIZE+offsetof(struct exception_regs, mas3));
-	DEFINE(MAS6, STACK_INT_FRAME_SIZE+offsetof(struct exception_regs, mas6));
-	DEFINE(MAS7, STACK_INT_FRAME_SIZE+offsetof(struct exception_regs, mas7));
-	DEFINE(_SRR0, STACK_INT_FRAME_SIZE+offsetof(struct exception_regs, srr0));
-	DEFINE(_SRR1, STACK_INT_FRAME_SIZE+offsetof(struct exception_regs, srr1));
-	DEFINE(_CSRR0, STACK_INT_FRAME_SIZE+offsetof(struct exception_regs, csrr0));
-	DEFINE(_CSRR1, STACK_INT_FRAME_SIZE+offsetof(struct exception_regs, csrr1));
-	DEFINE(_DSRR0, STACK_INT_FRAME_SIZE+offsetof(struct exception_regs, dsrr0));
-	DEFINE(_DSRR1, STACK_INT_FRAME_SIZE+offsetof(struct exception_regs, dsrr1));
-#endif
+	STACK_PT_REGS_OFFSET(MMUCR, mas0);
+	STACK_PT_REGS_OFFSET(MAS1, mas1);
+	STACK_PT_REGS_OFFSET(MAS2, mas2);
+	STACK_PT_REGS_OFFSET(MAS3, mas3);
+	STACK_PT_REGS_OFFSET(MAS6, mas6);
+	STACK_PT_REGS_OFFSET(MAS7, mas7);
+	STACK_PT_REGS_OFFSET(_SRR0, srr0);
+	STACK_PT_REGS_OFFSET(_SRR1, srr1);
+	STACK_PT_REGS_OFFSET(_CSRR0, csrr0);
+	STACK_PT_REGS_OFFSET(_CSRR1, csrr1);
+	STACK_PT_REGS_OFFSET(_DSRR0, dsrr0);
+	STACK_PT_REGS_OFFSET(_DSRR1, dsrr1);
 #endif
 
 	/* About the CPU features table */
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 87b806e8eded..e5503420b6c6 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -168,20 +168,18 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 /* only on e500mc */
 #define DBG_STACK_BASE		dbgirq_ctx
 
-#define EXC_LVL_FRAME_OVERHEAD	(THREAD_SIZE - INT_FRAME_SIZE - EXC_LVL_SIZE)
-
 #ifdef CONFIG_SMP
 #define BOOKE_LOAD_EXC_LEVEL_STACK(level)		\
 	mfspr	r8,SPRN_PIR;				\
 	slwi	r8,r8,2;				\
 	addis	r8,r8,level##_STACK_BASE@ha;		\
 	lwz	r8,level##_STACK_BASE@l(r8);		\
-	addi	r8,r8,EXC_LVL_FRAME_OVERHEAD;
+	addi	r8,r8,THREAD_SIZE - INT_FRAME_SIZE;
 #else
 #define BOOKE_LOAD_EXC_LEVEL_STACK(level)		\
 	lis	r8,level##_STACK_BASE@ha;		\
 	lwz	r8,level##_STACK_BASE@l(r8);		\
-	addi	r8,r8,EXC_LVL_FRAME_OVERHEAD;
+	addi	r8,r8,THREAD_SIZE - INT_FRAME_SIZE;
 #endif
 
 /*
@@ -208,7 +206,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	mtmsr	r11;							\
 	mfspr	r11,SPRN_SPRG_THREAD;	/* if from user, start at top of   */\
 	lwz	r11, TASK_STACK - THREAD(r11); /* this thread's kernel stack */\
-	addi	r11,r11,EXC_LVL_FRAME_OVERHEAD;	/* allocate stack frame    */\
+	addi	r11,r11,THREAD_SIZE - INT_FRAME_SIZE;	/* allocate stack frame    */\
 	beq	1f;							     \
 	/* COMING FROM USER MODE */					     \
 	stw	r9,_CCR(r11);		/* save CR			   */\
@@ -516,24 +514,5 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	bl	kernel_fp_unavailable_exception;			      \
 	b	interrupt_return
 
-#else /* __ASSEMBLY__ */
-struct exception_regs {
-	unsigned long mas0;
-	unsigned long mas1;
-	unsigned long mas2;
-	unsigned long mas3;
-	unsigned long mas6;
-	unsigned long mas7;
-	unsigned long srr0;
-	unsigned long srr1;
-	unsigned long csrr0;
-	unsigned long csrr1;
-	unsigned long dsrr0;
-	unsigned long dsrr1;
-};
-
-/* ensure this structure is always sized to a multiple of the stack alignment */
-#define STACK_EXC_LVL_FRAME_SIZE	ALIGN(sizeof (struct exception_regs), 16)
-
 #endif /* __ASSEMBLY__ */
 #endif /* __HEAD_BOOKE_H__ */
-- 
2.25.0

