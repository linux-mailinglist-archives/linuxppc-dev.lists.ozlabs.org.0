Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 348F966912
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 10:23:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lQsx4zm3zDqvV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 18:23:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 45lQqb6jDNzDqtV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 18:21:15 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 41DDFAE80001;
 Fri, 12 Jul 2019 04:20:39 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH kernel] powerpc/xive: Drop deregistered irqs
Date: Fri, 12 Jul 2019 18:20:36 +1000
Message-Id: <20190712082036.40440-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
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
 Alistair Popple <alistair@popple.id.au>, Greg Kurz <groug@kaod.org>,
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

This checks if irq is still registered, if not, it assumes no valid irq
was fetched from the loop and if there is none left, it continues to
the irq==0 case (not visible in this patch) and sets priority to 0xff
which is basically unmasking. This calls irq_to_desc() on a hot path now
which is a radix tree lookup; hopefully this won't be noticeable as
that tree is quite small.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

Found it on P9 system with:
- a host with 8 cpus online
- a boot disk on ahci with its msix on cpu#0
- a guest with 2xGPUs + 6xNVLink + 4 cpus
- GPU#0 from the guest is bound to the same cpu#0.

Killing a guest killed ahci and therefore the host because of the race.
Note that VFIO masks interrupts first and only then resets the device.

Alternatives:

1. Fix xive_irq_chip::irq_shutdown() to walk through all cpu queues and
drop deregistered irqs.

2. Exploit chip->irq_get_irqchip_state function from
62e0468650c30f0298 "genirq: Add optional hardware synchronization for shutdown".

Both require deep XIVE knowledge which I do not have.
---
 arch/powerpc/sysdev/xive/common.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index 082c7e1c20f0..65742e280337 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -148,8 +148,12 @@ static u32 xive_scan_interrupts(struct xive_cpu *xc, bool just_peek)
 		irq = xive_read_eq(&xc->queue[prio], just_peek);
 
 		/* Found something ? That's it */
-		if (irq)
-			break;
+		if (irq) {
+			/* Another CPU may have shut this irq down, check it */
+			if (irq_to_desc(irq))
+				break;
+			irq = 0;
+		}
 
 		/* Clear pending bits */
 		xc->pending_prio &= ~(1 << prio);
-- 
2.17.1

