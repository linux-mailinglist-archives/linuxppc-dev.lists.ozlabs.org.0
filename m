Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BA56B5B9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 07:02:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pQBH445rzDqML
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 15:02:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 45pQ8J2VcNzDqMh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 15:01:04 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 62416AE80032;
 Wed, 17 Jul 2019 01:00:26 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v3] powerpc/xive: Drop deregistered irqs
Date: Wed, 17 Jul 2019 15:00:28 +1000
Message-Id: <20190717050028.85926-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Alistair Popple <alistair@popple.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is a race between releasing an irq on one cpu and fetching it
from XIVE on another cpu as there does not seem to be any locking between
these, probably because xive_irq_chip::irq_shutdown() is supposed to
remove the irq from all queues in the system which it does not do.

As a result, when such released irq appears in a queue, we take it
from the queue but we do not change the current priority on that cpu and
since there is no handler for the irq, EOI is never called and the cpu
current priority remains elevated (7 vs. 0xff==unmasked). If another irq
is assigned to the same cpu, then that device stops working until irq
is moved to another cpu or the device is reset.

This adds a new ppc_md.orphan_irq callback which is called if no irq
descriptor is found. The XIVE implementation drops the current priority
to 0xff which effectively unmasks interrupts in a current CPU.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
Changes:
v3:
* added a comment above xive_orphan_irq()

v2:
* added ppc_md.orphan_irq
---
 arch/powerpc/include/asm/machdep.h |  3 +++
 arch/powerpc/kernel/irq.c          |  9 ++++++---
 arch/powerpc/sysdev/xive/common.c  | 18 ++++++++++++++++++
 3 files changed, 27 insertions(+), 3 deletions(-)

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
index bc68c53af67c..b4e06d05bdba 100644
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
 
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index 082c7e1c20f0..17e696b2d71b 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -283,6 +283,23 @@ static unsigned int xive_get_irq(void)
 	return irq;
 }
 
+/*
+ * Handles the case when a target CPU catches an interrupt which is being shut
+ * down on another CPU. generic_handle_irq() returns an error in such case
+ * and then the orphan_irq() handler restores the CPPR to reenable interrupts.
+ *
+ * Without orphan_irq() and valid irq_desc, there is no other way to restore
+ * the CPPR. This executes on a CPU which caught the interrupt.
+ */
+static void xive_orphan_irq(unsigned int irq)
+{
+	struct xive_cpu *xc = __this_cpu_read(xive_cpu);
+
+	xc->cppr = 0xff;
+	out_8(xive_tima + xive_tima_offset + TM_CPPR, 0xff);
+	DBG_VERBOSE("orphan_irq: irq %d, adjusting CPPR to 0xff\n", irq);
+}
+
 /*
  * After EOI'ing an interrupt, we need to re-check the queue
  * to see if another interrupt is pending since multiple
@@ -1419,6 +1436,7 @@ bool __init xive_core_init(const struct xive_ops *ops, void __iomem *area, u32 o
 	xive_irq_priority = max_prio;
 
 	ppc_md.get_irq = xive_get_irq;
+	ppc_md.orphan_irq = xive_orphan_irq;
 	__xive_enabled = true;
 
 	pr_devel("Initializing host..\n");
-- 
2.17.1

