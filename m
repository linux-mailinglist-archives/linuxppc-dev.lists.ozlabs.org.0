Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 737E52C1E12
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 07:22:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgDSh28FzzDqT6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 17:21:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CgDN35kLGzDq8g
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 17:17:55 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 82CBCAE8022C;
 Tue, 24 Nov 2020 01:17:40 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linux-kernel@vger.kernel.org
Subject: [PATCH kernel v4 1/8] genirq/ipi:  Simplify irq_reserve_ipi
Date: Tue, 24 Nov 2020 17:17:13 +1100
Message-Id: <20201124061720.86766-2-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201124061720.86766-1-aik@ozlabs.ru>
References: <20201124061720.86766-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Marc Zyngier <maz@kernel.org>,
 x86@kernel.org, linux-gpio@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__irq_domain_alloc_irqs() can already handle virq==-1 and free
descriptors if it failed allocating hardware interrupts so let's skip
this extra step.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 kernel/irq/ipi.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/kernel/irq/ipi.c b/kernel/irq/ipi.c
index 43e3d1be622c..1b2807318ea9 100644
--- a/kernel/irq/ipi.c
+++ b/kernel/irq/ipi.c
@@ -75,18 +75,12 @@ int irq_reserve_ipi(struct irq_domain *domain,
 		}
 	}
 
-	virq = irq_domain_alloc_descs(-1, nr_irqs, 0, NUMA_NO_NODE, NULL);
-	if (virq <= 0) {
-		pr_warn("Can't reserve IPI, failed to alloc descs\n");
-		return -ENOMEM;
-	}
-
-	virq = __irq_domain_alloc_irqs(domain, virq, nr_irqs, NUMA_NO_NODE,
-				       (void *) dest, true, NULL);
+	virq = __irq_domain_alloc_irqs(domain, -1, nr_irqs, NUMA_NO_NODE,
+				       (void *) dest, false, NULL);
 
 	if (virq <= 0) {
 		pr_warn("Can't reserve IPI, failed to alloc hw irqs\n");
-		goto free_descs;
+		return -EBUSY;
 	}
 
 	for (i = 0; i < nr_irqs; i++) {
@@ -96,10 +90,6 @@ int irq_reserve_ipi(struct irq_domain *domain,
 		irq_set_status_flags(virq + i, IRQ_NO_BALANCING);
 	}
 	return virq;
-
-free_descs:
-	irq_free_descs(virq, nr_irqs);
-	return -EBUSY;
 }
 
 /**
-- 
2.17.1

