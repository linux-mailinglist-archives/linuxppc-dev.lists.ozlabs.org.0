Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D504B678A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 17:54:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YPfm5QL5zF3DM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 01:54:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="ldABkDhx"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YPXD3QRczF0hy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 01:48:27 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46YPX560Jnz9vKGh;
 Wed, 18 Sep 2019 17:48:21 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ldABkDhx; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0q-5P00FC0do; Wed, 18 Sep 2019 17:48:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46YPX54s0mz9vBmq;
 Wed, 18 Sep 2019 17:48:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568821701; bh=l2des/MZrRkDizgk8eDwoORoIhNkObnn4V8wJTDfkek=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=ldABkDhxNN4lbKo1rTL8jayIr00BVB2I3K1e6RybvHtuCG+t27ro6WNOL5on2274N
 +kKTz3QM3k/HsQgP0SKsT3Pw6FJCr96BEb0wYH1vX3/p3EPgNnggvTJhD3ClgX8gf2
 l9KYw52/qAy8pNtHXVLayzA4/k5ogXxsNZiQfgCk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 453FE8B93A;
 Wed, 18 Sep 2019 17:48:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qg-mdxToSxlz; Wed, 18 Sep 2019 17:48:22 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 399458B937;
 Wed, 18 Sep 2019 17:48:21 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E7EE76B81C; Wed, 18 Sep 2019 15:48:20 +0000 (UTC)
Message-Id: <5fb4aedadbd28b9849cf2fabe13392fb3b5cd3ed.1568821668.git.christophe.leroy@c-s.fr>
In-Reply-To: <d0b002c96cfc069a1bc7bafcac28defe5d7d3643.1568821668.git.christophe.leroy@c-s.fr>
References: <d0b002c96cfc069a1bc7bafcac28defe5d7d3643.1568821668.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 2/2] powerpc/irq: inline call_do_irq() and call_do_softirq()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 segher@kernel.crashing.org, npiggin@gmail.com
Date: Wed, 18 Sep 2019 15:48:20 +0000 (UTC)
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

call_do_irq() and call_do_softirq() are quite similar on PPC32 and
PPC64 and are simple enough to be worth inlining.

Inlining them avoids an mflr/mtlr pair plus a save/reload on stack.

This is inspired from S390 arch. Several other arches do more or
less the same. The way sparc arch does seems odd thought.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

---
v2: no change.
v3: no change.
---
 arch/powerpc/include/asm/irq.h |  2 --
 arch/powerpc/kernel/irq.c      | 26 ++++++++++++++++++++++++++
 arch/powerpc/kernel/misc_32.S  | 25 -------------------------
 arch/powerpc/kernel/misc_64.S  | 22 ----------------------
 4 files changed, 26 insertions(+), 49 deletions(-)

diff --git a/arch/powerpc/include/asm/irq.h b/arch/powerpc/include/asm/irq.h
index 0c6469983c66..10476d5283dc 100644
--- a/arch/powerpc/include/asm/irq.h
+++ b/arch/powerpc/include/asm/irq.h
@@ -57,8 +57,6 @@ extern void *mcheckirq_ctx[NR_CPUS];
 extern void *hardirq_ctx[NR_CPUS];
 extern void *softirq_ctx[NR_CPUS];
 
-void call_do_softirq(void *sp);
-void call_do_irq(struct pt_regs *regs, void *sp);
 extern void do_IRQ(struct pt_regs *regs);
 extern void __init init_IRQ(void);
 extern void __do_irq(struct pt_regs *regs);
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 04204be49577..b028c49f9635 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -642,6 +642,20 @@ void __do_irq(struct pt_regs *regs)
 	irq_exit();
 }
 
+static inline void call_do_irq(struct pt_regs *regs, void *sp)
+{
+	register unsigned long r3 asm("r3") = (unsigned long)regs;
+
+	asm volatile(
+		"	"PPC_STLU"	1, %2(%1);\n"
+		"	mr		1, %1;\n"
+		"	bl		%3;\n"
+		"	"PPC_LL"	1, 0(1);\n" : "+r"(r3) :
+		"b"(sp), "i"(THREAD_SIZE - STACK_FRAME_OVERHEAD), "i"(__do_irq) :
+		"lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6", "cr7",
+		"r0", "r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12");
+}
+
 void do_IRQ(struct pt_regs *regs)
 {
 	struct pt_regs *old_regs = set_irq_regs(regs);
@@ -686,6 +700,18 @@ void *mcheckirq_ctx[NR_CPUS] __read_mostly;
 void *softirq_ctx[NR_CPUS] __read_mostly;
 void *hardirq_ctx[NR_CPUS] __read_mostly;
 
+static inline void call_do_softirq(const void *sp)
+{
+	asm volatile(
+		"	"PPC_STLU"	1, %1(%0);\n"
+		"	mr		1, %0;\n"
+		"	bl		%2;\n"
+		"	"PPC_LL"	1, 0(1);\n" : :
+		"b"(sp), "i"(THREAD_SIZE - STACK_FRAME_OVERHEAD), "i"(__do_softirq) :
+		"lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6", "cr7",
+		"r0", "r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12");
+}
+
 void do_softirq_own_stack(void)
 {
 	void *irqsp = softirq_ctx[smp_processor_id()];
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index a5422f7782b3..307307b57743 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -33,31 +33,6 @@
 
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
index b55a7b4cb543..69fd714a5236 100644
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
 	.section	".toc","aw"
 PPC64_CACHES:
 	.tc		ppc64_caches[TC],ppc64_caches
-- 
2.13.3

