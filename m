Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BB55BDD7F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 08:41:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWsQm5YyMz3c7D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 16:41:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWsQL5DJDz3010
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 16:41:28 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MWsQC5ydxz9skT;
	Tue, 20 Sep 2022 08:41:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y7y0dhBDeTkw; Tue, 20 Sep 2022 08:41:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MWsQC53cNz9skB;
	Tue, 20 Sep 2022 08:41:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9AA838B76D;
	Tue, 20 Sep 2022 08:41:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id GDGpb6lyvrn6; Tue, 20 Sep 2022 08:41:23 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.12])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 730008B764;
	Tue, 20 Sep 2022 08:41:23 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 28K6fGkK1607373
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Sep 2022 08:41:16 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 28K6fErf1607369;
	Tue, 20 Sep 2022 08:41:14 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/irq: Refactor irq_soft_mask_{set,or}_return()
Date: Tue, 20 Sep 2022 08:41:08 +0200
Message-Id: <18473da42362ee8f07bce36b9caef8ba77d7633f.1663656054.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1663656068; l=1880; s=20211009; h=from:subject:message-id; bh=xfaNeT6yuYfKEL0UY6ZAyg1nr6Q9IyFxFzM006OhTos=; b=T0CHkHta4cs88ufxFa7Hqa2zatSAGWDdHMFWq3YtJvVzRp99MgCHXbcOIPF1gflMUyAKu/3ANxP3 RFpHJBrECLNl7PMHmh/D5MBoxOsfTRASe/t6kSShDi1DhPasbs2D
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This partialy reapply commit ef5b570d3700 ("powerpc/irq: Don't
open code irq_soft_mask helpers") which was reverted by
commit 684c68d92e2e ("Revert "powerpc/irq: Don't open code
irq_soft_mask helpers"")

irq_soft_mask_set_return() and irq_soft_mask_or_return()
are overset of irq_soft_mask_set().

Have them use irq_soft_mask_set() instead of duplicating it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/hw_irq.h | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 983551859891..e8de249339d8 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -157,36 +157,18 @@ static inline notrace void irq_soft_mask_set(unsigned long mask)
 
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
+	unsigned long flags = irq_soft_mask_return();
 
-	asm volatile(
-		"lbz %0,%2(13); or %1,%0,%3; stb %1,%2(13)"
-		: "=&r" (flags), "=r" (tmp)
-		: "i" (offsetof(struct paca_struct, irq_soft_mask)),
-		  "r" (mask)
-		: "memory");
-
-#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
-	WARN_ON((mask | flags) && !((mask | flags) & IRQS_DISABLED));
-#endif
+	irq_soft_mask_set(flags | mask);
 
 	return flags;
 }
-- 
2.37.1

