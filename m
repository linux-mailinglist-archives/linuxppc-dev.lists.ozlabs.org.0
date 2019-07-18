Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F99D6C899
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 07:12:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45q2Lb5N0yzDqKv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 15:12:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 45q2Df1s46zDqbl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 15:06:58 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 18538AE800AD;
 Thu, 18 Jul 2019 01:06:20 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v4 2/2] powerpc/xive: Drop current cpu priority for
 orphaned interrupts
Date: Thu, 18 Jul 2019 15:06:04 +1000
Message-Id: <20190718050604.74233-3-aik@ozlabs.ru>
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

There is a race between releasing an irq on one cpu and fetching it
from XIVE on another cpu. When such released irq appears in a queue,
we take it from the queue but we do not change the current priority
on that cpu and since there is no handler for the irq, EOI is never
called and the cpu current priority remains elevated
(7 vs. 0xff==unmasked). If another irq is assigned to the same cpu,
then that device stops working until irq is moved to another cpu or
the device is reset.

This implements ppc_md.orphan_irq callback which is called if no irq
descriptor is found and which drops the current priority
to 0xff which effectively unmasks interrupts in a current CPU.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/sysdev/xive/common.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

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

