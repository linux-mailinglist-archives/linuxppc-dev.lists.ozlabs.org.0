Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F0D52B523
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 10:49:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L369w4j9Sz3cCY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 18:49:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L369R49W2z3bb0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 18:49:12 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4L369J6Ppjz9srY;
 Wed, 18 May 2022 10:49:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T7bNQxdeIToW; Wed, 18 May 2022 10:49:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4L369J5bm3z9srH;
 Wed, 18 May 2022 10:49:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AD90B8B77D;
 Wed, 18 May 2022 10:49:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ajDl9ScbllcI; Wed, 18 May 2022 10:49:08 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 942678B77C;
 Wed, 18 May 2022 10:49:08 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 24I8mt5v2968122
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 10:48:55 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 24I8mtTV2968121;
 Wed, 18 May 2022 10:48:55 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/irq: remove inline assembly in hard_irq_disable macro
Date: Wed, 18 May 2022 10:48:55 +0200
Message-Id: <9f05937d8722ddd2064a7c2362d8f9000e15e1ba.1652863723.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1652863734; l=1048; s=20211009;
 h=from:subject:message-id; bh=REfAp0B2RYqKCCYWSypqG3oRXhNX7z9oD4h4eZLeFUw=;
 b=MluBCnm5RlsKVocLp/PugtJ5F31R2vFDM3x0a86lQ2NSfZuZg5rKdvCv3dpZ0neLcK54sk7oTpE0
 +kOi4vobD7PAgpm//pRX9t4qJQdgAWONeAkauAk6HGEsjPtokajc
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

Use WRITE_ONCE() instead of opencoding the saving of current
stack pointeur.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
By the way, is WRITE_ONCE() needed at all ? Could we instead do local_paca->saved_r1 = current_stack_pointer;
---
 arch/powerpc/include/asm/hw_irq.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 6efab00aa1c8..26ede09c521d 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -282,9 +282,7 @@ static inline bool pmi_irq_pending(void)
 	flags = irq_soft_mask_set_return(IRQS_ALL_DISABLED);		\
 	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;			\
 	if (!arch_irqs_disabled_flags(flags)) {				\
-		asm ("stdx %%r1, 0, %1 ;"				\
-		     : "=m" (local_paca->saved_r1)			\
-		     : "b" (&local_paca->saved_r1));			\
+		WRITE_ONCE(local_paca->saved_r1, current_stack_pointer);\
 		trace_hardirqs_off();					\
 	}								\
 } while(0)
-- 
2.35.3

