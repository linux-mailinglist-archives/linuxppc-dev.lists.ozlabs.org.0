Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C43AE5BDD82
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 08:42:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWsRC3GC9z3c1v
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 16:42:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWsQj1H72z3c63
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 16:41:48 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MWsQc72myz9skc;
	Tue, 20 Sep 2022 08:41:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WNKj4NCcytQc; Tue, 20 Sep 2022 08:41:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MWsQb6Jzxz9skB;
	Tue, 20 Sep 2022 08:41:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C8AFC8B76D;
	Tue, 20 Sep 2022 08:41:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 8k7mSurLH5to; Tue, 20 Sep 2022 08:41:43 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.12])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9FEE88B764;
	Tue, 20 Sep 2022 08:41:43 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 28K6fYVN1607407
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Sep 2022 08:41:34 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 28K6fY7T1607404;
	Tue, 20 Sep 2022 08:41:34 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/irq: Modernise inline assembly in irq_soft_mask_{set,return}
Date: Tue, 20 Sep 2022 08:41:28 +0200
Message-Id: <178f30ff62c0317061f019b3dbbc079073f104c3.1663656058.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1663656086; l=1658; s=20211009; h=from:subject:message-id; bh=9GEx36HJ5/FfDi1dx6YvjaaoBbioX39W24JCLk5Suh0=; b=+0srDpNF4WhGQedCfhlunENf/K/k6Gr6nhlJ8mzBeINfIeztz2JrkXSV0SBg37WT6uD3skB8fNjR K9D8xoquDCpL7LOjHGDPMkiQ+BdQwXsCe3UXQCYTXCoca/PA5BLl
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

local_paca is declared as global register asm("r13"), it is therefore
garantied to always ever be r13.

It is therefore not required to opencode r13 in the assembly, use
a reference to local_paca->irq_soft_mask instead.

This also allows removing the 'memory' clobber in irq_soft_mask_set()
as GCC now knows what is being modified in memory.

Using %X modifier will give GCC a bit more flexibility on the code
generation.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/hw_irq.h | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index e8de249339d8..dbe037ff4474 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -115,10 +115,7 @@ static inline notrace unsigned long irq_soft_mask_return(void)
 {
 	unsigned long flags;
 
-	asm volatile(
-		"lbz %0,%1(13)"
-		: "=r" (flags)
-		: "i" (offsetof(struct paca_struct, irq_soft_mask)));
+	asm volatile("lbz%X1 %0,%1" : "=r" (flags) : "m" (local_paca->irq_soft_mask));
 
 	return flags;
 }
@@ -147,12 +144,7 @@ static inline notrace void irq_soft_mask_set(unsigned long mask)
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 		WARN_ON(mask && !(mask & IRQS_DISABLED));
 
-	asm volatile(
-		"stb %0,%1(13)"
-		:
-		: "r" (mask),
-		  "i" (offsetof(struct paca_struct, irq_soft_mask))
-		: "memory");
+	asm volatile("stb%X0 %1,%0" : "=m" (local_paca->irq_soft_mask) : "r" (mask));
 }
 
 static inline notrace unsigned long irq_soft_mask_set_return(unsigned long mask)
-- 
2.37.1

