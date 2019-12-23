Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DE312984A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2019 16:32:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hNdx0HDSzDqGZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 02:32:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="W7SgfJGU"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hNVJ23k1zDqKJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 02:26:16 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47hNV76KKKz9vJyr;
 Mon, 23 Dec 2019 16:26:07 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=W7SgfJGU; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id uBkPgpjjLKGe; Mon, 23 Dec 2019 16:26:07 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47hNV75JZfz9vJyn;
 Mon, 23 Dec 2019 16:26:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1577114767; bh=KTrdL1MpYjw3SKZf3TvRf76WtXnCC4CV0j92AK8y8Fw=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=W7SgfJGUE7yQSHzMgsEsSUtqMKrXmHkBCaqW6J/B/xJIOCdNaqLywiSricvj4mFOG
 kuH0PmX7ZWEwg+nlUxqzoLDznH7mAiEA+LcrlmKCGyK6/ks0C0J6gFdh/4k1cenCI6
 mNMi4Drzj2gc5Titv5ApxeCxRzHwnZyUwuPXDDKQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E555C8B7AB;
 Mon, 23 Dec 2019 16:26:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id dxyHmnVTVHn5; Mon, 23 Dec 2019 16:26:12 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C104C8B7A1;
 Mon, 23 Dec 2019 16:26:12 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id CBAD2637D8; Mon, 23 Dec 2019 15:26:12 +0000 (UTC)
Message-Id: <075b56d1ef9ff0556916684029e8006123a1ca09.1577114567.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1577114567.git.christophe.leroy@c-s.fr>
References: <cover.1577114567.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH 2/8] powerpc/irq: inline call_do_irq() and
 call_do_softirq() on PPC32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 23 Dec 2019 15:26:12 +0000 (UTC)
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
v6:
- rebased after removal of ksp_limit
---
 arch/powerpc/include/asm/irq.h |  2 ++
 arch/powerpc/kernel/irq.c      | 34 ++++++++++++++++++++++++++++++++++
 arch/powerpc/kernel/misc_32.S  | 25 -------------------------
 3 files changed, 36 insertions(+), 25 deletions(-)

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
index add67498c126..4690e5270806 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -611,6 +611,40 @@ static inline void check_stack_overflow(void)
 #endif
 }
 
+#ifdef CONFIG_PPC32
+static inline void call_do_softirq(const void *sp)
+{
+	register unsigned long ret asm("r3");
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
+}
+
+static inline void call_do_irq(struct pt_regs *regs, void *sp)
+{
+	register unsigned long r3 asm("r3") = (unsigned long)regs;
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
+}
+#endif
+
 void __do_irq(struct pt_regs *regs)
 {
 	unsigned int irq;
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index bb5995fa6884..341a3cd199cb 100644
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
-- 
2.13.3

