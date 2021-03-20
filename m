Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71496342CBE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 13:22:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2fzg3CL0z3042
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 23:22:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PngZRUCQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=PngZRUCQ; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2fzG3J1Tz2yht
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Mar 2021 23:22:32 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F2fzC6T62z9sS8; Sat, 20 Mar 2021 23:22:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1616242951;
 bh=TthIKDf/V9k78K7fcWWDzUpbOjV4qYH92p9ZNqkjqx8=;
 h=From:To:Cc:Subject:Date:From;
 b=PngZRUCQXNTvR/sphtMaEmMSgAMDFa0zms7P3NbKMJuGK+mk4J3wuNAXz76h8Ozdo
 cj07b4W4Ig0T5/sieDZoLonh2q6f4io0mrfodkuhhEK4KpXLhGbdZjb9UE11zuWFbO
 8OWQXQXk58A7QeuuoVRVOgjtpd5QvG6XDd3sQ6hYS8M4K6+NTW72Nr2ofifzh9E45b
 3SoJsKEa00Z6ZsRNMS0kMNH4DyRq0cPzdT1J76fyh3wu2bhcoCb9+36fYuaYC7oYJ6
 fyEgP/FmDjS0msKBQ/KM7XTtUcVmhlO/MloacViozRPXmr2GwUowYWI+yl9CBD5pwJ
 xeLaruPrOiQMw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7] powerpc/irq: Inline call_do_irq() and call_do_softirq()
Date: Sat, 20 Mar 2021 23:22:27 +1100
Message-Id: <20210320122227.345427-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

call_do_irq() and call_do_softirq() are simple enough to be
worth inlining.

Inlining them avoids an mflr/mtlr pair plus a save/reload on stack. It
also allows GCC to keep the saved ksp_limit in an nonvolatile reg.

This is inspired from S390 arch. Several other arches do more or
less the same. The way sparc arch does seems odd thought.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
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
v6:
- Rebase on top of merge-test (ca6e327fefb2).
- Remove the ksp_limit stuff as it's doesn't exist anymore.

v7:
mpe:
- Enable for 64-bit too. This all in-kernel code calling in-kernel
  code, and must use the kernel TOC.
- Use named parameters for the inline asm.
- Reformat inline asm.
- Mark as always_inline.
- Drop unused ret from call_do_softirq(), add r3 as clobbered.
---
 arch/powerpc/include/asm/irq.h |  2 --
 arch/powerpc/kernel/irq.c      | 41 ++++++++++++++++++++++++++++++++++
 arch/powerpc/kernel/misc_32.S  | 25 ---------------------
 arch/powerpc/kernel/misc_64.S  | 22 ------------------
 4 files changed, 41 insertions(+), 49 deletions(-)

diff --git a/arch/powerpc/include/asm/irq.h b/arch/powerpc/include/asm/irq.h
index f3f264e441a7..b2bd58830430 100644
--- a/arch/powerpc/include/asm/irq.h
+++ b/arch/powerpc/include/asm/irq.h
@@ -53,8 +53,6 @@ extern void *mcheckirq_ctx[NR_CPUS];
 extern void *hardirq_ctx[NR_CPUS];
 extern void *softirq_ctx[NR_CPUS];
 
-void call_do_softirq(void *sp);
-void call_do_irq(struct pt_regs *regs, void *sp);
 extern void do_IRQ(struct pt_regs *regs);
 extern void __init init_IRQ(void);
 extern void __do_irq(struct pt_regs *regs);
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 5b72abbff96c..260effc0a435 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -667,6 +667,47 @@ static inline void check_stack_overflow(void)
 	}
 }
 
+static __always_inline void call_do_softirq(const void *sp)
+{
+	/* Temporarily switch r1 to sp, call __do_softirq() then restore r1. */
+	asm volatile (
+		 PPC_STLU "	%%r1, %[offset](%[sp])	;"
+		"mr		%%r1, %[sp]		;"
+		"bl		%[callee]		;"
+		 PPC_LL "	%%r1, 0(%%r1)		;"
+		 : // Outputs
+		 : // Inputs
+		   [sp] "b" (sp), [offset] "i" (THREAD_SIZE - STACK_FRAME_OVERHEAD),
+		   [callee] "i" (__do_softirq)
+		 : // Clobbers
+		   "lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6",
+		   "cr7", "r0", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10",
+		   "r11", "r12"
+	);
+}
+
+static __always_inline void call_do_irq(struct pt_regs *regs, void *sp)
+{
+	register unsigned long r3 asm("r3") = (unsigned long)regs;
+
+	/* Temporarily switch r1 to sp, call __do_irq() then restore r1. */
+	asm volatile (
+		 PPC_STLU "	%%r1, %[offset](%[sp])	;"
+		"mr		%%r1, %[sp]		;"
+		"bl		%[callee]		;"
+		 PPC_LL "	%%r1, 0(%%r1)		;"
+		 : // Outputs
+		   "+r" (r3)
+		 : // Inputs
+		   [sp] "b" (sp), [offset] "i" (THREAD_SIZE - STACK_FRAME_OVERHEAD),
+		   [callee] "i" (__do_irq)
+		 : // Clobbers
+		   "lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6",
+		   "cr7", "r0", "r4", "r5", "r6", "r7", "r8", "r9", "r10",
+		   "r11", "r12"
+	);
+}
+
 void __do_irq(struct pt_regs *regs)
 {
 	unsigned int irq;
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index acc410043b96..6a076bef2932 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -27,31 +27,6 @@
 
 	.text
 
-_GLOBAL(call_do_softirq)
-	mflr	r0
-	stw	r0,4(r1)
-	stwu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r3)
-	mr	r1,r3
-	bl	__do_softirq
-	lwz	r1,0(r1)
-	lwz	r0,4(r1)
-	mtlr	r0
-	blr
-
-/*
- * void call_do_irq(struct pt_regs *regs, void *sp);
- */
-_GLOBAL(call_do_irq)
-	mflr	r0
-	stw	r0,4(r1)
-	stwu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r4)
-	mr	r1,r4
-	bl	__do_irq
-	lwz	r1,0(r1)
-	lwz	r0,4(r1)
-	mtlr	r0
-	blr
-
 /*
  * This returns the high 64 bits of the product of two 64-bit numbers.
  */
diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
index 070465825c21..4b761a18a74d 100644
--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@ -27,28 +27,6 @@
 
 	.text
 
-_GLOBAL(call_do_softirq)
-	mflr	r0
-	std	r0,16(r1)
-	stdu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r3)
-	mr	r1,r3
-	bl	__do_softirq
-	ld	r1,0(r1)
-	ld	r0,16(r1)
-	mtlr	r0
-	blr
-
-_GLOBAL(call_do_irq)
-	mflr	r0
-	std	r0,16(r1)
-	stdu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r4)
-	mr	r1,r4
-	bl	__do_irq
-	ld	r1,0(r1)
-	ld	r0,16(r1)
-	mtlr	r0
-	blr
-
 _GLOBAL(__bswapdi2)
 EXPORT_SYMBOL(__bswapdi2)
 	srdi	r8,r3,32
-- 
2.25.1

