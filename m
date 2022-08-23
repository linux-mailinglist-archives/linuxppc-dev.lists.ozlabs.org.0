Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACF859E78A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 18:39:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBw1n1yKqz3c7S
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 02:39:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBw1N4XWNz2x9p
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 02:39:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MBw1J6zLnz9sZY;
	Tue, 23 Aug 2022 18:39:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c51nvQHkjIqo; Tue, 23 Aug 2022 18:39:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MBw1J5fTDz9sXB;
	Tue, 23 Aug 2022 18:39:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AAB5A8B77A;
	Tue, 23 Aug 2022 18:39:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id nQogcfEClGkk; Tue, 23 Aug 2022 18:39:32 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (po17370.idsi0.si.c-s.fr [192.168.232.51])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 688698B763;
	Tue, 23 Aug 2022 18:39:32 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 27NGdMIn245000
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Aug 2022 18:39:22 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 27NGdINA244989;
	Tue, 23 Aug 2022 18:39:18 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2] powerpc: Fix irq_soft_mask_set() and irq_soft_mask_return() with sanitizer
Date: Tue, 23 Aug 2022 18:39:06 +0200
Message-Id: <c0b486e782b6695092dcdb2cd340a3d44c8c266d.1661272738.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1661272745; l=2717; s=20211009; h=from:subject:message-id; bh=qwO+LL94qOpCaFxeBV0lG7PAzQMAjf4Ij9nOISGDPlU=; b=s5gRQg1lOWoyFtbR63HiRJDdn+z8Yrdzy9jrSDBEh/aYlECEh0jI8bnXHW3bxVRMJD1z6aPkfOqE FYIoD1crAsWcmeNwf7jqz9mPDKWvXru0P7SnY+3BVZZc8+yuiAk7
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In ppc, compiler based sanitizer will generate instrument instructions
around statement WRITE_ONCE(local_paca->irq_soft_mask, mask):

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

The same problem occurs in irq_soft_mask_return() with
READ_ONCE(local_paca->irq_soft_mask).

This patch partially reverts commit ef5b570d3700 ("powerpc/irq: Don't
open code irq_soft_mask helpers") with a more modern inline assembly.

Reported-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
Fixes: ef5b570d3700 ("powerpc/irq: Don't open code irq_soft_mask helpers")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Use =m constraint for stb instead of m constraint
---
 arch/powerpc/include/asm/hw_irq.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 26ede09c521d..815420988ef3 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -113,7 +113,11 @@ static inline void __hard_RI_enable(void)
 
 static inline notrace unsigned long irq_soft_mask_return(void)
 {
-	return READ_ONCE(local_paca->irq_soft_mask);
+	unsigned long flags;
+
+	asm volatile("lbz%X1 %0,%1" : "=r" (flags) : "m" (local_paca->irq_soft_mask));
+
+	return flags;
 }
 
 /*
@@ -140,8 +144,7 @@ static inline notrace void irq_soft_mask_set(unsigned long mask)
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 		WARN_ON(mask && !(mask & IRQS_DISABLED));
 
-	WRITE_ONCE(local_paca->irq_soft_mask, mask);
-	barrier();
+	asm volatile("stb%X0 %1,%0" : "=m" (local_paca->irq_soft_mask) : "r" (mask) : "memory");
 }
 
 static inline notrace unsigned long irq_soft_mask_set_return(unsigned long mask)
-- 
2.37.1

