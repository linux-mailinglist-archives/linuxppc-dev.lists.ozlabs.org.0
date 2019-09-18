Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E15DB5A37
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 06:02:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Y5sC5sfQzF4Dj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 14:02:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="R36EQn4/"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Y5lv3KsjzF42d
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 13:57:30 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46Y5lp1CYsz9txbD;
 Wed, 18 Sep 2019 05:57:26 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=R36EQn4/; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id J9iZYsVCWtsb; Wed, 18 Sep 2019 05:57:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46Y5lp09CTz9txbB;
 Wed, 18 Sep 2019 05:57:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568779046; bh=gmwzwNBmbgLQUoNO8iWqOoZD/2/k9hvbGKy++vc6twA=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=R36EQn4/AGZQXQlLQMP4WDwtc5Mw2FT72VMVJQ20BapsxLfF/nJ4ZRyNfQWkNEaGV
 Ds1Y00urQRv1E5hu9ovs7CqySY3Scl1d9rd1nv/nPoLWT+zfuKojQXii/10yAHLUyw
 xA/252+jN1ORvAXOHJfbU9T41QlWUM9BS4LSzCXI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ABEBA8B7B4;
 Wed, 18 Sep 2019 05:57:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YpaIuwbc2CFQ; Wed, 18 Sep 2019 05:57:26 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6C82E8B7B0;
 Wed, 18 Sep 2019 05:57:26 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 2F33969881; Wed, 18 Sep 2019 03:57:26 +0000 (UTC)
Message-Id: <6f9628f94976a659904863d6916db86405320872.1568778945.git.christophe.leroy@c-s.fr>
In-Reply-To: <54e363e268a5b391ed69ca71ee01403d186d37a6.1568778945.git.christophe.leroy@c-s.fr>
References: <54e363e268a5b391ed69ca71ee01403d186d37a6.1568778945.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 2/2] powerpc/irq: inline call_do_irq() and call_do_softirq()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 segher@kernel.crashing.org, npiggin@gmail.com
Date: Wed, 18 Sep 2019 03:57:26 +0000 (UTC)
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
---
 arch/powerpc/include/asm/irq.h |  2 --
 arch/powerpc/kernel/irq.c      | 26 ++++++++++++++++++++++++++
 arch/powerpc/kernel/misc_32.S  | 25 -------------------------
 arch/powerpc/kernel/misc_64.S  | 22 ----------------------
 4 files changed, 26 insertions(+), 49 deletions(-)

diff --git a/arch/powerpc/include/asm/irq.h b/arch/powerpc/include/asm/irq.h
index 70922661450e..86e8dbaecb7d 100644
--- a/arch/powerpc/include/asm/irq.h
+++ b/arch/powerpc/include/asm/irq.h
@@ -56,8 +56,6 @@ extern void *mcheckirq_ctx[NR_CPUS];
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

