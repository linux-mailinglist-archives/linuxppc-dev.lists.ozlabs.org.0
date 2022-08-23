Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EBD59E76F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 18:37:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBvyf1rjgz3c8h
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 02:37:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBvyF6NYhz2x9p
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 02:36:52 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MBvy83Ksyz9sZY;
	Tue, 23 Aug 2022 18:36:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZWOjktcaMbNv; Tue, 23 Aug 2022 18:36:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MBvy82XQdz9sXB;
	Tue, 23 Aug 2022 18:36:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 47DEE8B77A;
	Tue, 23 Aug 2022 18:36:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id HbVMPEyK4SSm; Tue, 23 Aug 2022 18:36:48 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (po17370.idsi0.si.c-s.fr [192.168.232.51])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1CBF08B763;
	Tue, 23 Aug 2022 18:36:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 27NGabPW242982
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Aug 2022 18:36:37 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 27NGaaIs242981;
	Tue, 23 Aug 2022 18:36:36 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc: Fix hard_irq_disable() with sanitizer
Date: Tue, 23 Aug 2022 18:36:35 +0200
Message-Id: <a8298991b3df049a54ee8e558838e34265812014.1661272586.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1661272593; l=1135; s=20211009; h=from:subject:message-id; bh=1t5HIaMLeYA++0rVBzTlWX4uhYtioV/mAywsDNdSRQI=; b=0HJEDFtxLltDwj+bnfOadrZxhQJaIWuYCJ+lJTGuLjpaBgY7Q7cLBrBvasbAYt1ZMqB/Cnw6SV7t csagP4l9AZL6qE+V7Psi9UyiK72HgW76WXTq/cLfQXV3fvCR/5BH
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

As reported by Zhouyi Zhou, WRITE_ONCE() is not atomic
as expected when KASAN or KCSAN are compiled in.

Fix it by re-implementing it using inline assembly.

Reported-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
Fixes: 077fc62b2b66 ("powerpc/irq: remove inline assembly in hard_irq_disable macro")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/hw_irq.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 8a7b0b78a80e..83ab6668387b 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -285,7 +285,8 @@ static inline bool pmi_irq_pending(void)
 	flags = irq_soft_mask_set_return(IRQS_ALL_DISABLED);		\
 	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;			\
 	if (!arch_irqs_disabled_flags(flags)) {				\
-		WRITE_ONCE(local_paca->saved_r1, current_stack_pointer);\
+		asm volatile("std%X0 %1,%0" : "=m" (local_paca->saved_r1) \
+					    : "r" (current_stack_pointer)); \
 		trace_hardirqs_off();					\
 	}								\
 } while(0)
-- 
2.37.1

