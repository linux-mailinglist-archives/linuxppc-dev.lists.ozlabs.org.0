Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F252C1E32
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 07:27:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgDbX3tLLzDqSt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 17:27:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CgDNX3ML6zDqJc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 17:18:20 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id A6A2EAE80255;
 Tue, 24 Nov 2020 01:18:14 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linux-kernel@vger.kernel.org
Subject: [PATCH kernel v4 7/8] genirq/irqdomain: Reference irq_desc for
 already mapped irqs
Date: Tue, 24 Nov 2020 17:17:19 +1100
Message-Id: <20201124061720.86766-8-aik@ozlabs.ru>
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

This references an irq_desc if already mapped interrupt requested to map
again. This happends for PCI legacy interrupts where 4 interrupts are
shared among all devices on the same PCI host bus adapter.

From now on, the users shall call irq_dispose_mapping() for every
irq_create_fwspec_mapping(). Most (all?) users do not bother with
disposing though so it is not very likely to break many things.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 kernel/irq/irqdomain.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index a0a81cc6c524..07f4bde87de5 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -663,7 +663,9 @@ unsigned int irq_create_mapping(struct irq_domain *domain,
 	/* Check if mapping already exists */
 	virq = irq_find_mapping(domain, hwirq);
 	if (virq) {
+		desc = irq_to_desc(virq);
 		pr_debug("-> existing mapping on virq %d\n", virq);
+		kobject_get(&desc->kobj);
 		return virq;
 	}
 
@@ -762,6 +764,7 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 	irq_hw_number_t hwirq;
 	unsigned int type = IRQ_TYPE_NONE;
 	int virq;
+	struct irq_desc *desc;
 
 	if (fwspec->fwnode) {
 		domain = irq_find_matching_fwspec(fwspec, DOMAIN_BUS_WIRED);
@@ -798,8 +801,11 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 		 * current trigger type then we are done so return the
 		 * interrupt number.
 		 */
-		if (type == IRQ_TYPE_NONE || type == irq_get_trigger_type(virq))
+		if (type == IRQ_TYPE_NONE || type == irq_get_trigger_type(virq)) {
+			desc = irq_to_desc(virq);
+			kobject_get(&desc->kobj);
 			return virq;
+		}
 
 		/*
 		 * If the trigger type has not been set yet, then set
@@ -811,6 +817,8 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 				return 0;
 
 			irqd_set_trigger_type(irq_data, type);
+			desc = irq_to_desc(virq);
+			kobject_get(&desc->kobj);
 			return virq;
 		}
 
-- 
2.17.1

