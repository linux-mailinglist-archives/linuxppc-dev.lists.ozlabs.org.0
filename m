Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC50F52B4A8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 10:33:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L35pm6Jtjz3cL0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 18:33:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L35pN4DFNz2xm2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 18:32:42 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4L35pH42jSz9srH;
 Wed, 18 May 2022 10:32:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HMCf16Pr1Z1M; Wed, 18 May 2022 10:32:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4L35pG56pWz9srY;
 Wed, 18 May 2022 10:32:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C71E8B77C;
 Wed, 18 May 2022 10:32:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id E3jlTJhOfF0Y; Wed, 18 May 2022 10:32:38 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 854168B763;
 Wed, 18 May 2022 10:32:38 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 24I8WTkO2962120
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 10:32:29 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 24I8WTXa2962119;
 Wed, 18 May 2022 10:32:29 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/2] powerpc/irq: Don't open code irq_soft_mask helpers
Date: Wed, 18 May 2022 10:32:27 +0200
Message-Id: <e2454434992cc932a5a34b695ae981c0b2f4c28e.1652862729.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1652862747; l=2320; s=20211009;
 h=from:subject:message-id; bh=X8ypGLidc9Ld56ViHNF6ENtra1vjlh8aweG5rIJZaw4=;
 b=/9IqEfZeKBHtjVq5+XohFVjap2G23Hxm274hZ5E0E3ahyR6OmW/ES/4Bij1BSY8St+QldzRW7FM/
 +ovtTNP4BxJkQ3+Bbi21G11TqdckONqOReIf2LneOX3El67t9hDS
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

Use READ_ONCE() and WRITE_ONCE() instead of open coding
read and write of local PACA irq_soft_mask.

For the write, add a barrier to keep the memory clobber
that was there previously.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/hw_irq.h | 43 +++++--------------------------
 1 file changed, 7 insertions(+), 36 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 674e5aaafcbd..edc569481faf 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -113,14 +113,7 @@ static inline void __hard_RI_enable(void)
 
 static inline notrace unsigned long irq_soft_mask_return(void)
 {
-	unsigned long flags;
-
-	asm volatile(
-		"lbz %0,%1(13)"
-		: "=r" (flags)
-		: "i" (offsetof(struct paca_struct, irq_soft_mask)));
-
-	return flags;
+	return READ_ONCE(local_paca->irq_soft_mask);
 }
 
 /*
@@ -148,46 +141,24 @@ static inline notrace void irq_soft_mask_set(unsigned long mask)
 	WARN_ON(mask && !(mask & IRQS_DISABLED));
 #endif
 
-	asm volatile(
-		"stb %0,%1(13)"
-		:
-		: "r" (mask),
-		  "i" (offsetof(struct paca_struct, irq_soft_mask))
-		: "memory");
+	WRITE_ONCE(local_paca->irq_soft_mask, mask);
+	barrier();
 }
 
 static inline notrace unsigned long irq_soft_mask_set_return(unsigned long mask)
 {
-	unsigned long flags;
-
-#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
-	WARN_ON(mask && !(mask & IRQS_DISABLED));
-#endif
+	unsigned long flags = irq_soft_mask_return();
 
-	asm volatile(
-		"lbz %0,%1(13); stb %2,%1(13)"
-		: "=&r" (flags)
-		: "i" (offsetof(struct paca_struct, irq_soft_mask)),
-		  "r" (mask)
-		: "memory");
+	irq_soft_mask_set(mask);
 
 	return flags;
 }
 
 static inline notrace unsigned long irq_soft_mask_or_return(unsigned long mask)
 {
-	unsigned long flags, tmp;
-
-	asm volatile(
-		"lbz %0,%2(13); or %1,%0,%3; stb %1,%2(13)"
-		: "=&r" (flags), "=r" (tmp)
-		: "i" (offsetof(struct paca_struct, irq_soft_mask)),
-		  "r" (mask)
-		: "memory");
+	unsigned long flags = irq_soft_mask_return();
 
-#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
-	WARN_ON((mask | flags) && !((mask | flags) & IRQS_DISABLED));
-#endif
+	irq_soft_mask_set(flags | mask);
 
 	return flags;
 }
-- 
2.35.3

