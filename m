Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDB82C1E43
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 07:33:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgDk71dsVzDqMp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 17:33:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CgDP16nH5zDqMp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 17:18:44 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id D511EAE80253;
 Tue, 24 Nov 2020 01:18:08 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linux-kernel@vger.kernel.org
Subject: [PATCH kernel v4 6/8] genirq/irqdomain: Move hierarchical IRQ cleanup
 to kobject_release
Date: Tue, 24 Nov 2020 17:17:18 +1100
Message-Id: <20201124061720.86766-7-aik@ozlabs.ru>
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

This moves hierarchical domain's irqs cleanup into the kobject release
hook to make irq_domain_free_irqs() as simple as kobject_put.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 kernel/irq/irqdomain.c | 43 +++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 4779d912bb86..a0a81cc6c524 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -863,21 +863,9 @@ EXPORT_SYMBOL_GPL(irq_create_of_mapping);
  */
 void irq_dispose_mapping(unsigned int virq)
 {
-	struct irq_data *irq_data = irq_get_irq_data(virq);
-	struct irq_domain *domain;
+	struct irq_desc *desc = irq_to_desc(virq);
 
-	if (!virq || !irq_data)
-		return;
-
-	domain = irq_data->domain;
-	if (WARN_ON(domain == NULL))
-		return;
-
-	if (irq_domain_is_hierarchy(domain)) {
-		irq_domain_free_irqs(virq, 1);
-	} else {
-		irq_free_desc(virq);
-	}
+	kobject_put(&desc->kobj);
 }
 EXPORT_SYMBOL_GPL(irq_dispose_mapping);
 
@@ -1396,6 +1384,19 @@ int irq_domain_alloc_irqs_hierarchy(struct irq_domain *domain,
 	return domain->ops->alloc(domain, irq_base, nr_irqs, arg);
 }
 
+static void irq_domain_hierarchy_free_desc(struct irq_desc *desc)
+{
+	unsigned int virq = desc->irq_data.irq;
+	struct irq_data *data = irq_get_irq_data(virq);
+
+	mutex_lock(&irq_domain_mutex);
+	irq_domain_remove_irq(virq);
+	irq_domain_free_irqs_hierarchy(data->domain, virq, 1);
+	mutex_unlock(&irq_domain_mutex);
+
+	irq_domain_free_irq_data(virq, 1);
+}
+
 int __irq_domain_alloc_irqs_data(struct irq_domain *domain, int virq,
 				 unsigned int nr_irqs, int node, void *arg,
 				 const struct irq_affinity_desc *affinity)
@@ -1430,7 +1431,10 @@ int __irq_domain_alloc_irqs_data(struct irq_domain *domain, int virq,
 	}
 
 	for (i = 0; i < nr_irqs; i++) {
+		struct irq_desc *desc = irq_to_desc(virq + i);
+
 		irq_domain_insert_irq(virq + i);
+		desc->free_irq = irq_domain_hierarchy_free_desc;
 	}
 	mutex_unlock(&irq_domain_mutex);
 
@@ -1675,14 +1679,11 @@ void irq_domain_free_irqs(unsigned int virq, unsigned int nr_irqs)
 		 "NULL pointer, cannot free irq\n"))
 		return;
 
-	mutex_lock(&irq_domain_mutex);
-	for (i = 0; i < nr_irqs; i++)
-		irq_domain_remove_irq(virq + i);
-	irq_domain_free_irqs_hierarchy(data->domain, virq, nr_irqs);
-	mutex_unlock(&irq_domain_mutex);
+	for (i = 0; i < nr_irqs; i++) {
+		struct irq_desc *desc = irq_to_desc(virq + i);
 
-	irq_domain_free_irq_data(virq, nr_irqs);
-	irq_free_descs(virq, nr_irqs);
+		kobject_put(&desc->kobj);
+	}
 }
 
 /**
-- 
2.17.1

