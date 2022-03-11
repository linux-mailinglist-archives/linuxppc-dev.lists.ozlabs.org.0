Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D68044D61AD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 13:38:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFQTg5vBFz30GN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 23:38:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFQTB73jwz2yHp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 23:38:19 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KFQT30BCwz9sS8;
 Fri, 11 Mar 2022 13:38:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XKomrJimBXhG; Fri, 11 Mar 2022 13:38:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KFQT2691Nz9sS7;
 Fri, 11 Mar 2022 13:38:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C35E18B796;
 Fri, 11 Mar 2022 13:38:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ia6w-43ynZ7o; Fri, 11 Mar 2022 13:38:14 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.87])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 75EE38B790;
 Fri, 11 Mar 2022 13:38:14 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 22BCc7Ao3854065
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 13:38:07 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 22BCc4863854064;
 Fri, 11 Mar 2022 13:38:04 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1] powerpc: Use static call for get_irq()
Date: Fri, 11 Mar 2022 13:38:04 +0100
Message-Id: <afb92085f930651d8b1063e4d4bf0396c80ebc7d.1647002274.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1647002283; l=3058; s=20211009;
 h=from:subject:message-id; bh=mCINRThVIFcTaXfGzdqc1OpQCUN3uvZOAfilNMot2os=;
 b=GnKPWvWQ03NeIAxp/0h3RNLpjj7IVDTif2xSsblE+mG97TZmkjd1Yl3gTlHDBbb9QAmmgSDZ+MsG
 xjgLn7mqCMpi0P+ADa383i1dnNddOSoD/uXjqAXX164YMKyJ4VPz
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

__do_irq() inconditionnaly calls ppc_md.get_irq()

That's definitely a hot path.

At the time being ppc_md.get_irq address is read every time
from ppc_md structure.

Replace that call by a static call, and initialise that
call after ppc_md.init_IRQ() has set ppc_md.get_irq.

Emit a warning and don't set the static call if ppc_md.init_IRQ()
is still NULL, that way the kernel won't blow up if for some
reason ppc_md.get_irq() doesn't get properly set.

With the patch:

	00000000 <__SCT__ppc_get_irq>:
	   0:	48 00 00 20 	b       20 <__static_call_return0>	<== Replaced by 'b <ppc_md.get_irq>' at runtime
...
	00000020 <__static_call_return0>:
	  20:	38 60 00 00 	li      r3,0
	  24:	4e 80 00 20 	blr
...
	00000058 <__do_irq>:
...
	  64:	48 00 00 01 	bl      64 <__do_irq+0xc>
				64: R_PPC_REL24	__SCT__ppc_get_irq
	  68:	2c 03 00 00 	cmpwi   r3,0
...

Before the patch:

	00000038 <__do_irq>:
...
	  3c:	3d 20 00 00 	lis     r9,0
				3e: R_PPC_ADDR16_HA	ppc_md+0x1c
...
	  44:	81 29 00 00 	lwz     r9,0(r9)
				46: R_PPC_ADDR16_LO	ppc_md+0x1c
...
	  4c:	7d 29 03 a6 	mtctr   r9
	  50:	4e 80 04 21 	bctrl
	  54:	2c 03 00 00 	cmpwi   r3,0
...

On PPC64 which doesn't implement static calls yet we get:

00000000000000d0 <__do_irq>:
...
      dc:	00 00 22 3d 	addis   r9,r2,0
			dc: R_PPC64_TOC16_HA	.data+0x8
...
      e4:	00 00 89 e9 	ld      r12,0(r9)
			e4: R_PPC64_TOC16_LO_DS	.data+0x8
...
      f0:	a6 03 89 7d 	mtctr   r12
      f4:	18 00 41 f8 	std     r2,24(r1)
      f8:	21 04 80 4e 	bctrl
      fc:	18 00 41 e8 	ld      r2,24(r1)
...

So on PPC64 that's similar to what we get without static calls.
But at least until ppc_md.get_irq() is set the call is to
__static_call_return0.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/irq.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 752fb182eacb..1c4715a03cd1 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -52,6 +52,7 @@
 #include <linux/of_irq.h>
 #include <linux/vmalloc.h>
 #include <linux/pgtable.h>
+#include <linux/static_call.h>
 
 #include <linux/uaccess.h>
 #include <asm/interrupt.h>
@@ -730,6 +731,8 @@ static __always_inline void call_do_irq(struct pt_regs *regs, void *sp)
 	);
 }
 
+DEFINE_STATIC_CALL_RET0(ppc_get_irq, *ppc_md.get_irq);
+
 void __do_irq(struct pt_regs *regs)
 {
 	unsigned int irq;
@@ -741,7 +744,7 @@ void __do_irq(struct pt_regs *regs)
 	 *
 	 * This will typically lower the interrupt line to the CPU
 	 */
-	irq = ppc_md.get_irq();
+	irq = static_call(ppc_get_irq)();
 
 	/* We can hard enable interrupts now to allow perf interrupts */
 	if (should_hard_irq_enable())
@@ -809,6 +812,9 @@ void __init init_IRQ(void)
 
 	if (ppc_md.init_IRQ)
 		ppc_md.init_IRQ();
+
+	if (!WARN_ON(!ppc_md.get_irq))
+		static_call_update(ppc_get_irq, ppc_md.get_irq);
 }
 
 #ifdef CONFIG_BOOKE_OR_40x
-- 
2.34.1

