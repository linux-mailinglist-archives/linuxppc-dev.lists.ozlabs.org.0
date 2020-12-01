Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BE92C9847
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 08:41:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClYvS1W96zDqws
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 18:41:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4ClYs56RtVzDqwN
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 18:39:32 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id DDC39AE801FE;
 Tue,  1 Dec 2020 02:39:23 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v2] powerpc/pci: Remove LSI mappings on device teardown
Date: Tue,  1 Dec 2020 18:39:19 +1100
Message-Id: <20201201073919.5600-1-aik@ozlabs.ru>
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
 Frederic Barrat <fbarrat@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Oliver O'Halloran <oohall@gmail.com>

When a passthrough IO adapter is removed from a pseries machine using hash
MMU and the XIVE interrupt mode, the POWER hypervisor expects the guest OS
to clear all page table entries related to the adapter. If some are still
present, the RTAS call which isolates the PCI slot returns error 9001
"valid outstanding translations" and the removal of the IO adapter fails.
This is because when the PHBs are scanned, Linux maps automatically the
INTx interrupts in the Linux interrupt number space but these are never
removed.

This problem can be fixed by adding the corresponding unmap operation when
the device is removed. There's no pcibios_* hook for the remove case, but
the same effect can be achieved using a bus notifier.

Because INTx are shared among PHBs (and potentially across the system),
this adds tracking of virq to unmap them only when the last user is gone.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
[aik: added refcounter]
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---


Doing this in the generic irq code is just too much for my small brain :-/


---
 arch/powerpc/kernel/pci-common.c | 71 ++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index be108616a721..0acf17f17253 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -353,6 +353,55 @@ struct pci_controller *pci_find_controller_for_domain(int domain_nr)
 	return NULL;
 }
 
+struct pci_intx_virq {
+	int virq;
+	struct kref kref;
+	struct list_head list_node;
+};
+
+static LIST_HEAD(intx_list);
+static DEFINE_MUTEX(intx_mutex);
+
+static void ppc_pci_intx_release(struct kref *kref)
+{
+	struct pci_intx_virq *vi = container_of(kref, struct pci_intx_virq, kref);
+
+	list_del(&vi->list_node);
+	irq_dispose_mapping(vi->virq);
+	kfree(vi);
+}
+
+static int ppc_pci_unmap_irq_line(struct notifier_block *nb,
+			       unsigned long action, void *data)
+{
+	struct pci_dev *pdev = to_pci_dev(data);
+
+	if (action == BUS_NOTIFY_DEL_DEVICE) {
+		struct pci_intx_virq *vi;
+
+		mutex_lock(&intx_mutex);
+		list_for_each_entry(vi, &intx_list, list_node) {
+			if (vi->virq == pdev->irq) {
+				kref_put(&vi->kref, ppc_pci_intx_release);
+				break;
+			}
+		}
+		mutex_unlock(&intx_mutex);
+	}
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block ppc_pci_unmap_irq_notifier = {
+	.notifier_call = ppc_pci_unmap_irq_line,
+};
+
+static int ppc_pci_register_irq_notifier(void)
+{
+	return bus_register_notifier(&pci_bus_type, &ppc_pci_unmap_irq_notifier);
+}
+arch_initcall(ppc_pci_register_irq_notifier);
+
 /*
  * Reads the interrupt pin to determine if interrupt is use by card.
  * If the interrupt is used, then gets the interrupt line from the
@@ -361,6 +410,12 @@ struct pci_controller *pci_find_controller_for_domain(int domain_nr)
 static int pci_read_irq_line(struct pci_dev *pci_dev)
 {
 	int virq;
+	struct pci_intx_virq *vi, *vitmp;
+
+	/* Preallocate vi as rewind is complex if this fails after mapping */
+	vi = kzalloc(sizeof(struct pci_intx_virq), GFP_KERNEL);
+	if (!vi)
+		return -1;
 
 	pr_debug("PCI: Try to map irq for %s...\n", pci_name(pci_dev));
 
@@ -401,6 +456,22 @@ static int pci_read_irq_line(struct pci_dev *pci_dev)
 
 	pci_dev->irq = virq;
 
+	mutex_lock(&intx_mutex);
+	list_for_each_entry(vitmp, &intx_list, list_node) {
+		if (vitmp->virq == virq) {
+			kref_get(&vitmp->kref);
+			kfree(vi);
+			vi = NULL;
+			break;
+		}
+	}
+	if (vi) {
+		vi->virq = virq;
+		kref_init(&vi->kref);
+		list_add_tail(&vi->list_node, &intx_list);
+	}
+	mutex_unlock(&intx_mutex);
+
 	return 0;
 }
 
-- 
2.17.1

