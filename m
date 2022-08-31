Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7515A7E57
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 15:12:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHl254y4Xz3c6X
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 23:11:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D3nb0al3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHl1Q4xGVz3bb2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 23:11:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D3nb0al3;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MHl1P6RBHz4x1D;
	Wed, 31 Aug 2022 23:11:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1661951481;
	bh=3ZACs6DNmFUAJ7DAy99SHR6fy5AVxPHhhni8kwkd+Ls=;
	h=From:To:Cc:Subject:Date:From;
	b=D3nb0al3yepQJMqt1kCHGrTK+isf3PhWFUHlRm7YH+P88Ca3e8A5FQEmtZWtAmLaD
	 rhfjLQT82FuvZ6GT7wOq257MjFTbS0+uNNKybtH658fbWIwaNvpX/SMD1zcOcasaP2
	 AypG4ixAyn/05Su/MwfonX9sU/cVN+qVvjwNgIVGrLxc0qsovmPMqv/aUJ8xTmZ1X2
	 Qdi2BFm9rbyLT+W3K/Q0HydRdqJkMAAsbIkK9L1ZJ7wlHZzVA6FZO9K1ovkG0MFj6K
	 bFt+KhFYmKL0KyeB0qLre9uiYUxwdxS33LbcA7ZYLb+hwffO1xrBQmlzf2Kp4Ki2CO
	 q4oTg7zvpCb+Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] Revert "powerpc/irq: Don't open code irq_soft_mask helpers"
Date: Wed, 31 Aug 2022 23:10:52 +1000
Message-Id: <20220831131052.42250-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.2
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
Cc: zhouzhouyi@gmail.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit ef5b570d3700fbb8628a58da0487486ceeb713cd.

Zhouyi reported that commit is causing crashes when running rcutorture
with KASAN enabled:

  BUG: using smp_processor_id() in preemptible [00000000] code: rcu_torture_rea/100
  caller is rcu_preempt_deferred_qs_irqrestore+0x74/0xed0
  CPU: 4 PID: 100 Comm: rcu_torture_rea Tainted: G        W          5.19.0-rc5-next-20220708-dirty #253
  Call Trace:
    dump_stack_lvl+0xbc/0x108 (unreliable)
    check_preemption_disabled+0x154/0x160
    rcu_preempt_deferred_qs_irqrestore+0x74/0xed0
    __rcu_read_unlock+0x290/0x3b0
    rcu_torture_read_unlock+0x30/0xb0
    rcutorture_one_extend+0x198/0x810
    rcu_torture_one_read+0x58c/0xc90
    rcu_torture_reader+0x12c/0x360
    kthread+0x1e8/0x220
    ret_from_kernel_thread+0x5c/0x64

KASAN will generate instrumentation instructions around the
WRITE_ONCE(local_paca->irq_soft_mask, mask):

   0xc000000000295cb0 <+0>:	addis   r2,r12,774
   0xc000000000295cb4 <+4>:	addi    r2,r2,16464
   0xc000000000295cb8 <+8>:	mflr    r0
   0xc000000000295cbc <+12>:	bl      0xc00000000008bb4c <mcount>
   0xc000000000295cc0 <+16>:	mflr    r0
   0xc000000000295cc4 <+20>:	std     r31,-8(r1)
   0xc000000000295cc8 <+24>:	addi    r3,r13,2354
   0xc000000000295ccc <+28>:	mr      r31,r13
   0xc000000000295cd0 <+32>:	std     r0,16(r1)
   0xc000000000295cd4 <+36>:	stdu    r1,-48(r1)
   0xc000000000295cd8 <+40>:	bl      0xc000000000609b98 <__asan_store1+8>
   0xc000000000295cdc <+44>:	nop
   0xc000000000295ce0 <+48>:	li      r9,1
   0xc000000000295ce4 <+52>:	stb     r9,2354(r31)
   0xc000000000295ce8 <+56>:	addi    r1,r1,48
   0xc000000000295cec <+60>:	ld      r0,16(r1)
   0xc000000000295cf0 <+64>:	ld      r31,-8(r1)
   0xc000000000295cf4 <+68>:	mtlr    r0

If there is a context switch before "stb     r9,2354(r31)", r31 may
not equal to r13, in such case, irq soft mask will not work.

The usual solution of marking the code ineligible for instrumentation
forces the code out-of-line, which we would prefer to avoid. Christophe
proposed a partial revert, but Nick raised some concerns with that. So
for now do a full revert.

Reported-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
[mpe: Construct change log based on Zhouyi's original report]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/hw_irq.h | 43 ++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 3c8cb48f88ae..983551859891 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -113,7 +113,14 @@ static inline void __hard_RI_enable(void)
 
 static inline notrace unsigned long irq_soft_mask_return(void)
 {
-	return READ_ONCE(local_paca->irq_soft_mask);
+	unsigned long flags;
+
+	asm volatile(
+		"lbz %0,%1(13)"
+		: "=r" (flags)
+		: "i" (offsetof(struct paca_struct, irq_soft_mask)));
+
+	return flags;
 }
 
 /*
@@ -140,24 +147,46 @@ static inline notrace void irq_soft_mask_set(unsigned long mask)
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 		WARN_ON(mask && !(mask & IRQS_DISABLED));
 
-	WRITE_ONCE(local_paca->irq_soft_mask, mask);
-	barrier();
+	asm volatile(
+		"stb %0,%1(13)"
+		:
+		: "r" (mask),
+		  "i" (offsetof(struct paca_struct, irq_soft_mask))
+		: "memory");
 }
 
 static inline notrace unsigned long irq_soft_mask_set_return(unsigned long mask)
 {
-	unsigned long flags = irq_soft_mask_return();
+	unsigned long flags;
 
-	irq_soft_mask_set(mask);
+#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
+	WARN_ON(mask && !(mask & IRQS_DISABLED));
+#endif
+
+	asm volatile(
+		"lbz %0,%1(13); stb %2,%1(13)"
+		: "=&r" (flags)
+		: "i" (offsetof(struct paca_struct, irq_soft_mask)),
+		  "r" (mask)
+		: "memory");
 
 	return flags;
 }
 
 static inline notrace unsigned long irq_soft_mask_or_return(unsigned long mask)
 {
-	unsigned long flags = irq_soft_mask_return();
+	unsigned long flags, tmp;
+
+	asm volatile(
+		"lbz %0,%2(13); or %1,%0,%3; stb %1,%2(13)"
+		: "=&r" (flags), "=r" (tmp)
+		: "i" (offsetof(struct paca_struct, irq_soft_mask)),
+		  "r" (mask)
+		: "memory");
 
-	irq_soft_mask_set(flags | mask);
+#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
+	WARN_ON((mask | flags) && !((mask | flags) & IRQS_DISABLED));
+#endif
 
 	return flags;
 }
-- 
2.37.2

