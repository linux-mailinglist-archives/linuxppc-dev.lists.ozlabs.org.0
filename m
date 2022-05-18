Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EF452B3B0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 09:40:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L34fZ2qfkz3cJw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 17:40:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L34f94cz1z3bdP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 17:40:30 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4L34f05mRKz9snR;
 Wed, 18 May 2022 09:40:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7NB8nyYK2GVL; Wed, 18 May 2022 09:40:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4L34f04wBpz9snF;
 Wed, 18 May 2022 09:40:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 977778B77C;
 Wed, 18 May 2022 09:40:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ZBvs3ZPwmeUS; Wed, 18 May 2022 09:40:24 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7B0358B77B;
 Wed, 18 May 2022 09:40:24 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 24I7eIHw2950429
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 09:40:18 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 24I7eIfs2950427;
 Wed, 18 May 2022 09:40:18 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/2] powerpc/irq64: Remove get_irq_happened()
Date: Wed, 18 May 2022 09:40:16 +0200
Message-Id: <af511b53e4eb51f8fbc51eda7f5597175e68dce6.1652859593.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <9f1a47de80f78d3dd270a7a72f69f55f581c4054.1652859593.git.christophe.leroy@csgroup.eu>
References: <9f1a47de80f78d3dd270a7a72f69f55f581c4054.1652859593.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1652859615; l=1520; s=20211009;
 h=from:subject:message-id; bh=ki5lqa1nR6Ei2hRN9t5gh7hJJB8s3+Kwk0dFblFytvE=;
 b=TRYat2aXOZrP/KvwCM+P5QKnDEjoX/tD6mhWCL/P+e0R7jQTcuMiVgXkk22R26fs9zbcxsyVw/b8
 EWUwI2gvBgA8XmcRHUs3JI55nDqX7xzB4yA5PoJXx+7ECrsTN6U5
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

No need to open code the read of local_paca->irq_happened in
assembly, we have READ_ONCE() for doing the same.

Replace get_irq_happened() by READ_ONCE(local_paca->irq_happened).

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/irq_64.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/irq_64.c b/arch/powerpc/kernel/irq_64.c
index 488f6eb4553d..0f0e8bcb368c 100644
--- a/arch/powerpc/kernel/irq_64.c
+++ b/arch/powerpc/kernel/irq_64.c
@@ -67,16 +67,6 @@
 
 int distribute_irqs = 1;
 
-static inline notrace unsigned long get_irq_happened(void)
-{
-	unsigned long happened;
-
-	__asm__ __volatile__("lbz %0,%1(13)"
-	: "=r" (happened) : "i" (offsetof(struct paca_struct, irq_happened)));
-
-	return happened;
-}
-
 void replay_soft_interrupts(void)
 {
 	struct pt_regs regs;
@@ -233,7 +223,7 @@ notrace void arch_local_irq_restore(unsigned long mask)
 	return;
 
 happened:
-	irq_happened = get_irq_happened();
+	irq_happened = READ_ONCE(local_paca->irq_happened);
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 		WARN_ON_ONCE(!irq_happened);
 
@@ -256,7 +246,7 @@ notrace void arch_local_irq_restore(unsigned long mask)
 				 * IRQ_HARD_DIS again and warn if it is still
 				 * clear.
 				 */
-				irq_happened = get_irq_happened();
+				irq_happened = READ_ONCE(local_paca->irq_happened);
 				WARN_ON_ONCE(!(irq_happened & PACA_IRQ_HARD_DIS));
 			}
 		}
-- 
2.35.3

