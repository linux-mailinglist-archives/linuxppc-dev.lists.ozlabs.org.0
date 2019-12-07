Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 457C8115DBF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 18:21:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Vbq25sGjzDqTR
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Dec 2019 04:21:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="M+x2cjaW"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Vbn83Zs8zDqTN
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Dec 2019 04:20:10 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47Vbmz65Bwz9vBLP;
 Sat,  7 Dec 2019 18:20:03 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=M+x2cjaW; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id IWhZ83DmAviw; Sat,  7 Dec 2019 18:20:03 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47Vbmz4WTnz9vBLM;
 Sat,  7 Dec 2019 18:20:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1575739203; bh=wGJwZeRsClNhRcvPcTvmKeYbUIim15sV8rYIdLlEYjE=;
 h=From:Subject:To:Cc:Date:From;
 b=M+x2cjaWxqN4gPz82Gm0NQGkLddH8L8Fxp54s2uZ9RC/Y/A7Mr5SbaQ/KYpI+ixiQ
 dy3n1Wd1EzRmsohwZiaOJCGZM2gtQEk+79CKv9C3I1lw6xjH/X6klmRjHRru3sSy9L
 YOgETHy8kRIG2wjXdIq8SB8OQpzzLSh6afRW/Wh4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4E78B8B7AC;
 Sat,  7 Dec 2019 18:20:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gw4CgMiQ6qPD; Sat,  7 Dec 2019 18:20:05 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 02DB28B772;
 Sat,  7 Dec 2019 18:20:05 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 756A463154; Sat,  7 Dec 2019 17:20:04 +0000 (UTC)
Message-Id: <72a6cd86137b2a7ab835213cf5c74df6ed2f6ea7.1575739197.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5] powerpc/irq: inline call_do_irq() and call_do_softirq() on
 PPC32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sat,  7 Dec 2019 17:20:04 +0000 (UTC)
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

call_do_irq() and call_do_softirq() are simple enough to be
worth inlining.

Inlining them avoids an mflr/mtlr pair plus a save/reload on stack.
It also allows GCC to keep the saved ksp_limit in an nonvolatile reg.

This is inspired from S390 arch. Several other arches do more or
less the same. The way sparc arch does seems odd thought.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>

---
v2: no change.
v3: no change.
v4:
- comment reminding the purpose of the inline asm block.
- added r2 as clobbered reg
v5:
- Limiting the change to PPC32 for now.
- removed r2 from the clobbered regs list (on PPC32 r2 points to current all the time)
- Removed patch 1 and merged ksp_limit handling in here.
---
 arch/powerpc/include/asm/irq.h |  2 ++
 arch/powerpc/kernel/irq.c      | 48 ++++++++++++++++++++++++++++++++++++++++++
 arch/powerpc/kernel/misc_32.S  | 39 ----------------------------------
 3 files changed, 50 insertions(+), 39 deletions(-)

diff --git a/arch/powerpc/include/asm/irq.h b/arch/powerpc/include/asm/irq.h
index 814dfab7e392..e4a92f0b4ad4 100644
--- a/arch/powerpc/include/asm/irq.h
+++ b/arch/powerpc/include/asm/irq.h
@@ -56,8 +56,10 @@ extern void *mcheckirq_ctx[NR_CPUS];
 extern void *hardirq_ctx[NR_CPUS];
 extern void *softirq_ctx[NR_CPUS];
 
+#ifdef CONFIG_PPC64
 void call_do_softirq(void *sp);
 void call_do_irq(struct pt_regs *regs, void *sp);
+#endif
 extern void do_IRQ(struct pt_regs *regs);
 extern void __init init_IRQ(void);
 extern void __do_irq(struct pt_regs *regs);
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 5645bc9cbc09..240eca12c71d 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -611,6 +611,54 @@ static inline void check_stack_overflow(void)
 #endif
 }
 
+#ifdef CONFIG_PPC32
+static inline void call_do_softirq(const void *sp)
+{
+	register unsigned long ret asm("r3");
+	unsigned long limit = current->thread.ksp_limit;
+
+	/* Adjust the stack limit */
+	current->thread.ksp_limit = (unsigned long)sp;
+
+	/* Temporarily switch r1 to sp, call __do_softirq() then restore r1. */
+	asm volatile(
+		"	"PPC_STLU"	1, %2(%1);\n"
+		"	mr		1, %1;\n"
+		"	bl		%3;\n"
+		"	"PPC_LL"	1, 0(1);\n" :
+		"=r"(ret) :
+		"b"(sp), "i"(THREAD_SIZE - STACK_FRAME_OVERHEAD), "i"(__do_softirq) :
+		"lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6", "cr7",
+		"r0", "r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12");
+
+	/* Restore stack limit */
+	current->thread.ksp_limit = limit;
+}
+
+static inline void call_do_irq(struct pt_regs *regs, void *sp)
+{
+	register unsigned long r3 asm("r3") = (unsigned long)regs;
+	unsigned long limit = current->thread.ksp_limit;
+
+	/* Adjust the stack limit */
+	current->thread.ksp_limit = (unsigned long)sp;
+
+	/* Temporarily switch r1 to sp, call __do_irq() then restore r1 */
+	asm volatile(
+		"	"PPC_STLU"	1, %2(%1);\n"
+		"	mr		1, %1;\n"
+		"	bl		%3;\n"
+		"	"PPC_LL"	1, 0(1);\n" :
+		"+r"(r3) :
+		"b"(sp), "i"(THREAD_SIZE - STACK_FRAME_OVERHEAD), "i"(__do_irq) :
+		"lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6", "cr7",
+		"r0", "r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12");
+
+	/* Restore stack limit */
+	current->thread.ksp_limit = limit;
+}
+#endif
+
 void __do_irq(struct pt_regs *regs)
 {
 	unsigned int irq;
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index d80212be8698..341a3cd199cb 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -28,45 +28,6 @@
 	.text
 
 /*
- * We store the saved ksp_limit in the unused part
- * of the STACK_FRAME_OVERHEAD
- */
-_GLOBAL(call_do_softirq)
-	mflr	r0
-	stw	r0,4(r1)
-	lwz	r10,THREAD+KSP_LIMIT(r2)
-	stw	r3, THREAD+KSP_LIMIT(r2)
-	stwu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r3)
-	mr	r1,r3
-	stw	r10,8(r1)
-	bl	__do_softirq
-	lwz	r10,8(r1)
-	lwz	r1,0(r1)
-	lwz	r0,4(r1)
-	stw	r10,THREAD+KSP_LIMIT(r2)
-	mtlr	r0
-	blr
-
-/*
- * void call_do_irq(struct pt_regs *regs, void *sp);
- */
-_GLOBAL(call_do_irq)
-	mflr	r0
-	stw	r0,4(r1)
-	lwz	r10,THREAD+KSP_LIMIT(r2)
-	stw	r4, THREAD+KSP_LIMIT(r2)
-	stwu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r4)
-	mr	r1,r4
-	stw	r10,8(r1)
-	bl	__do_irq
-	lwz	r10,8(r1)
-	lwz	r1,0(r1)
-	lwz	r0,4(r1)
-	stw	r10,THREAD+KSP_LIMIT(r2)
-	mtlr	r0
-	blr
-
-/*
  * This returns the high 64 bits of the product of two 64-bit numbers.
  */
 _GLOBAL(mulhdu)
-- 
2.13.3

