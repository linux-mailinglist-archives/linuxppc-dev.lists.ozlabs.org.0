Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C9229E9F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 12:04:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMMyp6Y8NzDqcH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 22:04:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=ozlabs.ru (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMMx202lXzDqSN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 22:03:01 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09TAUUsb179735; Thu, 29 Oct 2020 07:02:13 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34f97v5raq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2020 07:02:12 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09TAw84k026772;
 Thu, 29 Oct 2020 11:02:04 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 34fpvrg569-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2020 11:02:04 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09TB21o730933466
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Oct 2020 11:02:02 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC632AE055;
 Thu, 29 Oct 2020 11:02:01 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47E94AE045;
 Thu, 29 Oct 2020 11:02:01 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 29 Oct 2020 11:02:01 +0000 (GMT)
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 72454A01DA;
 Thu, 29 Oct 2020 22:01:59 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (fstn1-p1.ozlabs.ibm.com
 [10.61.161.111])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 5D501E0104;
 Thu, 29 Oct 2020 22:01:59 +1100 (AEDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v2] irq: Add reference counting to IRQ mappings
Date: Thu, 29 Oct 2020 22:01:41 +1100
Message-Id: <20201029110141.94304-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_03:2020-10-29,
 2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1034 suspectscore=8 impostorscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010290073
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
Cc: Rob Herring <robh@kernel.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 Qian Cai <cai@lca.pw>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PCI devices share 4 legacy INTx interrupts from the same PCI host bridge.
Device drivers map/unmap hardware interrupts via irq_create_mapping()/
irq_dispose_mapping(). The problem with that these interrupts are
shared and when performing hot unplug, we need to unmap the interrupt
only when the last device is released.

This reuses already existing irq_desc::kobj for this purpose.
The refcounter is naturally 1 when the descriptor is allocated already;
this adds kobject_get() in places where already existing mapped virq
is returned.

This reorganizes irq_dispose_mapping() to release the kobj and let
the release callback do the cleanup.

Quick grep shows no sign of irq reference counting in drivers. Drivers
typically request mapping when probing and dispose it when removing;
platforms tend to dispose only if setup failed and the rest seems
calling one dispose per one mapping. Except (at least) PPC/pseries
which needs https://lkml.org/lkml/2020/10/27/259

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

What is the easiest way to get irq-hierarchical hardware?
I have a bunch of powerpc boxes (no good) but also a raspberry pi,
a bunch of 32/64bit orange pi's, an "armada" arm box,
thinkpads - is any of this good for the task?


---
Changes:
v2:
* added more get/put, including irq_domain_associate/irq_domain_disassociate
---
 kernel/irq/irqdesc.c   | 36 ++++++++++++++++++++-----------
 kernel/irq/irqdomain.c | 49 +++++++++++++++++++++++++++++-------------
 2 files changed, 58 insertions(+), 27 deletions(-)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 1a7723604399..bc8f62157ffa 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -419,20 +419,40 @@ static struct irq_desc *alloc_desc(int irq, int node, unsigned int flags,
 	return NULL;
 }
 
+static void delayed_free_desc(struct rcu_head *rhp);
 static void irq_kobj_release(struct kobject *kobj)
 {
 	struct irq_desc *desc = container_of(kobj, struct irq_desc, kobj);
+#ifdef CONFIG_IRQ_DOMAIN
+	struct irq_domain *domain;
+	unsigned int virq = desc->irq_data.irq;
 
-	free_masks(desc);
-	free_percpu(desc->kstat_irqs);
-	kfree(desc);
+	domain = desc->irq_data.domain;
+	if (domain) {
+		if (irq_domain_is_hierarchy(domain)) {
+			irq_domain_free_irqs(virq, 1);
+		} else {
+			irq_domain_disassociate(domain, virq);
+			irq_free_desc(virq);
+		}
+	}
+#endif
+	/*
+	 * We free the descriptor, masks and stat fields via RCU. That
+	 * allows demultiplex interrupts to do rcu based management of
+	 * the child interrupts.
+	 * This also allows us to use rcu in kstat_irqs_usr().
+	 */
+	call_rcu(&desc->rcu, delayed_free_desc);
 }
 
 static void delayed_free_desc(struct rcu_head *rhp)
 {
 	struct irq_desc *desc = container_of(rhp, struct irq_desc, rcu);
 
-	kobject_put(&desc->kobj);
+	free_masks(desc);
+	free_percpu(desc->kstat_irqs);
+	kfree(desc);
 }
 
 static void free_desc(unsigned int irq)
@@ -453,14 +473,6 @@ static void free_desc(unsigned int irq)
 	 */
 	irq_sysfs_del(desc);
 	delete_irq_desc(irq);
-
-	/*
-	 * We free the descriptor, masks and stat fields via RCU. That
-	 * allows demultiplex interrupts to do rcu based management of
-	 * the child interrupts.
-	 * This also allows us to use rcu in kstat_irqs_usr().
-	 */
-	call_rcu(&desc->rcu, delayed_free_desc);
 }
 
 static int alloc_descs(unsigned int start, unsigned int cnt, int node,
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index cf8b374b892d..5fb060e077e3 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -487,6 +487,7 @@ static void irq_domain_set_mapping(struct irq_domain *domain,
 
 void irq_domain_disassociate(struct irq_domain *domain, unsigned int irq)
 {
+	struct irq_desc *desc = irq_to_desc(irq);
 	struct irq_data *irq_data = irq_get_irq_data(irq);
 	irq_hw_number_t hwirq;
 
@@ -514,11 +515,14 @@ void irq_domain_disassociate(struct irq_domain *domain, unsigned int irq)
 
 	/* Clear reverse map for this hwirq */
 	irq_domain_clear_mapping(domain, hwirq);
+
+	kobject_put(&desc->kobj);
 }
 
 int irq_domain_associate(struct irq_domain *domain, unsigned int virq,
 			 irq_hw_number_t hwirq)
 {
+	struct irq_desc *desc = irq_to_desc(virq);
 	struct irq_data *irq_data = irq_get_irq_data(virq);
 	int ret;
 
@@ -530,6 +534,8 @@ int irq_domain_associate(struct irq_domain *domain, unsigned int virq,
 	if (WARN(irq_data->domain, "error: virq%i is already associated", virq))
 		return -EINVAL;
 
+	kobject_get(&desc->kobj);
+
 	mutex_lock(&irq_domain_mutex);
 	irq_data->hwirq = hwirq;
 	irq_data->domain = domain;
@@ -548,6 +554,7 @@ int irq_domain_associate(struct irq_domain *domain, unsigned int virq,
 			irq_data->domain = NULL;
 			irq_data->hwirq = 0;
 			mutex_unlock(&irq_domain_mutex);
+			kobject_put(&desc->kobj);
 			return ret;
 		}
 
@@ -638,6 +645,7 @@ unsigned int irq_create_mapping(struct irq_domain *domain,
 {
 	struct device_node *of_node;
 	int virq;
+	struct irq_desc *desc;
 
 	pr_debug("irq_create_mapping(0x%p, 0x%lx)\n", domain, hwirq);
 
@@ -655,7 +663,9 @@ unsigned int irq_create_mapping(struct irq_domain *domain,
 	/* Check if mapping already exists */
 	virq = irq_find_mapping(domain, hwirq);
 	if (virq) {
+		desc = irq_to_desc(virq);
 		pr_debug("-> existing mapping on virq %d\n", virq);
+		kobject_get(&desc->kobj);
 		return virq;
 	}
 
@@ -674,6 +684,7 @@ unsigned int irq_create_mapping(struct irq_domain *domain,
 	pr_debug("irq %lu on domain %s mapped to virtual irq %u\n",
 		hwirq, of_node_full_name(of_node), virq);
 
+	desc = irq_to_desc(virq);
 	return virq;
 }
 EXPORT_SYMBOL_GPL(irq_create_mapping);
@@ -751,6 +762,7 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 	irq_hw_number_t hwirq;
 	unsigned int type = IRQ_TYPE_NONE;
 	int virq;
+	struct irq_desc *desc;
 
 	if (fwspec->fwnode) {
 		domain = irq_find_matching_fwspec(fwspec, DOMAIN_BUS_WIRED);
@@ -787,8 +799,15 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 		 * current trigger type then we are done so return the
 		 * interrupt number.
 		 */
-		if (type == IRQ_TYPE_NONE || type == irq_get_trigger_type(virq))
+		if (type == IRQ_TYPE_NONE || type == irq_get_trigger_type(virq)) {
+			desc = irq_to_desc(virq);
+			kobject_get(&desc->kobj);
+
+			pr_err("___K___ (%u) %s %u: virq %d counter %d\n",
+				smp_processor_id(),
+			       __func__, __LINE__, virq, kref_read(&desc->kobj.kref));
 			return virq;
+		}
 
 		/*
 		 * If the trigger type has not been set yet, then set
@@ -800,6 +819,8 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 				return 0;
 
 			irqd_set_trigger_type(irq_data, type);
+			desc = irq_to_desc(virq);
+			kobject_get(&desc->kobj);
 			return virq;
 		}
 
@@ -852,22 +873,12 @@ EXPORT_SYMBOL_GPL(irq_create_of_mapping);
  */
 void irq_dispose_mapping(unsigned int virq)
 {
-	struct irq_data *irq_data = irq_get_irq_data(virq);
-	struct irq_domain *domain;
+	struct irq_desc *desc = irq_to_desc(virq);
 
-	if (!virq || !irq_data)
+	if (!virq || !desc)
 		return;
 
-	domain = irq_data->domain;
-	if (WARN_ON(domain == NULL))
-		return;
-
-	if (irq_domain_is_hierarchy(domain)) {
-		irq_domain_free_irqs(virq, 1);
-	} else {
-		irq_domain_disassociate(domain, virq);
-		irq_free_desc(virq);
-	}
+	kobject_put(&desc->kobj);
 }
 EXPORT_SYMBOL_GPL(irq_dispose_mapping);
 
@@ -1413,6 +1424,7 @@ int __irq_domain_alloc_irqs(struct irq_domain *domain, int irq_base,
 			    bool realloc, const struct irq_affinity_desc *affinity)
 {
 	int i, ret, virq;
+	bool get_ref = false;
 
 	if (domain == NULL) {
 		domain = irq_default_domain;
@@ -1422,6 +1434,7 @@ int __irq_domain_alloc_irqs(struct irq_domain *domain, int irq_base,
 
 	if (realloc && irq_base >= 0) {
 		virq = irq_base;
+		get_ref = true;
 	} else {
 		virq = irq_domain_alloc_descs(irq_base, nr_irqs, 0, node,
 					      affinity);
@@ -1453,8 +1466,14 @@ int __irq_domain_alloc_irqs(struct irq_domain *domain, int irq_base,
 		}
 	}
 	
-	for (i = 0; i < nr_irqs; i++)
+	for (i = 0; i < nr_irqs; i++) {
 		irq_domain_insert_irq(virq + i);
+		if (get_ref) {
+			struct irq_desc *desc = irq_to_desc(virq + i);
+
+			kobject_get(&desc->kobj);
+		}
+	}
 	mutex_unlock(&irq_domain_mutex);
 
 	return virq;
-- 
2.17.1

