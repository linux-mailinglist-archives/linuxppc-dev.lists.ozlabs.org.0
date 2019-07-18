Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A03C66C897
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 07:10:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45q2JC1Z7TzDq9T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 15:10:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 45q2Dc4X7YzDqZL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 15:06:56 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 60682AE80053;
 Thu, 18 Jul 2019 01:06:19 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v4 1/2] powerpc: Add handler for orphaned interrupts
Date: Thu, 18 Jul 2019 15:06:03 +1000
Message-Id: <20190718050604.74233-2-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190718050604.74233-1-aik@ozlabs.ru>
References: <20190718050604.74233-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The test on generic_handle_irq() catches interrupt events that
were served on a target CPU while the source interrupt was being
shutdown on another CPU. This may lead to a blocked interrupt queue
on a target CPU so if there is another assigned irq on that CPU, that
device stops working.

This adds necessary infrastructure to allow platform to deal with it.
The next patch implements it for XIVE.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/include/asm/machdep.h | 3 +++
 arch/powerpc/kernel/irq.c          | 9 ++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index c43d6eca9edd..6cc14e28e89a 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -59,6 +59,9 @@ struct machdep_calls {
 	/* Return an irq, or 0 to indicate there are none pending. */
 	unsigned int	(*get_irq)(void);
 
+	/* Drops irq if it does not have a valid descriptor */
+	void		(*orphan_irq)(unsigned int irq);
+
 	/* PCI stuff */
 	/* Called after allocating resources */
 	void		(*pcibios_fixup)(void);
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 5645bc9cbc09..e0689dcb17f0 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -632,10 +632,13 @@ void __do_irq(struct pt_regs *regs)
 	may_hard_irq_enable();
 
 	/* And finally process it */
-	if (unlikely(!irq))
+	if (unlikely(!irq)) {
 		__this_cpu_inc(irq_stat.spurious_irqs);
-	else
-		generic_handle_irq(irq);
+	} else if (generic_handle_irq(irq)) {
+		if (ppc_md.orphan_irq)
+			ppc_md.orphan_irq(irq);
+		__this_cpu_inc(irq_stat.spurious_irqs);
+	}
 
 	trace_irq_exit(regs);
 
-- 
2.17.1

