Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B221F75FC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 11:32:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jwVv6m8qzDqyg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 19:32:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.72.238; helo=9.mo177.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4203 seconds by postgrey-1.36 at bilbo;
 Fri, 12 Jun 2020 19:31:11 AEST
Received: from 9.mo177.mail-out.ovh.net (9.mo177.mail-out.ovh.net
 [46.105.72.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jwTC3ybyzDqxV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 19:31:08 +1000 (AEST)
Received: from player157.ha.ovh.net (unknown [10.108.35.223])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 78ED1137E7F
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 09:02:54 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id 521A3134E914D;
 Fri, 12 Jun 2020 07:02:47 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00696a6a853-e00f-427e-8b2c-59c5c682a764,EB3F143BCCF81B35F467F76D3EA0524591534A17)
 smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/pci: unmap legacy INTx interrupts when a PHB is
 removed
Date: Fri, 12 Jun 2020 09:02:45 +0200
Message-Id: <20200612070245.361114-1-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 2926495333943511985
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudeitddgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekgedtuddtueegfeevhffhvdeghfejffevvdethfekieehfffhvdffleelgedvnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduheejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a passthrough IO adapter is removed from a pseries machine using
hash MMU and the XIVE interrupt mode, the POWER hypervisor, pHyp,
expects the guest OS to have cleared all page table entries related to
the adapter. If some are still present, the RTAS call which isolates
the PCI slot returns error 9001 "valid outstanding translations" and
the removal of the IO adapter fails.

INTx interrupt numbers need special care because Linux maps the
interrupts automatically in the Linux interrupt number space. For this
purpose, record the logical interrupt number of the INTx at the PHB
level and clear these interrupts when the PCI bus is removed. This
will also clear all the page table entries of the ESB pages when using
XIVE.

Cc: "Oliver O'Halloran" <oohall@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 This deprecates patch :
 
 http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20200429075122.1216388-3-clg@kaod.org/

 Thanks,

 arch/powerpc/include/asm/pci-bridge.h |  4 +++
 arch/powerpc/kernel/pci-common.c      | 45 +++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
index b92e81b256e5..9960dd249079 100644
--- a/arch/powerpc/include/asm/pci-bridge.h
+++ b/arch/powerpc/include/asm/pci-bridge.h
@@ -48,6 +48,8 @@ struct pci_controller_ops {
 
 /*
  * Structure of a PCI controller (host bridge)
+ *
+ * @intx: legacy INTx mappings
  */
 struct pci_controller {
 	struct pci_bus *bus;
@@ -127,6 +129,8 @@ struct pci_controller {
 
 	void *private_data;
 	struct npu *npu;
+
+	unsigned int intx[PCI_NUM_INTX];
 };
 
 /* These are used for config access before all the PCI probing
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index be108616a721..8c442627f465 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -353,6 +353,49 @@ struct pci_controller *pci_find_controller_for_domain(int domain_nr)
 	return NULL;
 }
 
+static void pci_intx_register(struct pci_dev *pdev, int virq)
+{
+	struct pci_controller *phb = pci_bus_to_host(pdev->bus);
+	int i;
+
+	for (i = 0; i < PCI_NUM_INTX; i++) {
+		/*
+		 * Look for an empty or an equivalent slot, as INTx
+		 * interrupts can be shared between adapters
+		 */
+		if (phb->intx[i] == virq || !phb->intx[i]) {
+			phb->intx[i] = virq;
+			break;
+		}
+	}
+
+	if (i == PCI_NUM_INTX)
+		pr_err("PCI:%s INTx all mapped\n", pci_name(pdev));
+}
+
+/*
+ * Clearing the mapped INTx interrupts will also clear the underlying
+ * mappings of the ESB pages of the interrupts when under XIVE. It is
+ * a requirement of PowerVM to clear all memory mappings before
+ * removing a PHB.
+ */
+static void pci_intx_dispose(struct pci_bus *bus)
+{
+	struct pci_controller *phb = pci_bus_to_host(bus);
+	int i;
+
+	pr_debug("PCI: Clearing INTx for PHB %04x:%02x...\n",
+		 pci_domain_nr(bus), bus->number);
+	for (i = 0; i < PCI_NUM_INTX; i++)
+		irq_dispose_mapping(phb->intx[i]);
+}
+
+void pcibios_remove_bus(struct pci_bus *bus)
+{
+	pci_intx_dispose(bus);
+}
+EXPORT_SYMBOL_GPL(pcibios_remove_bus);
+
 /*
  * Reads the interrupt pin to determine if interrupt is use by card.
  * If the interrupt is used, then gets the interrupt line from the
@@ -401,6 +444,8 @@ static int pci_read_irq_line(struct pci_dev *pci_dev)
 
 	pci_dev->irq = virq;
 
+	/* Record all INTx mappings for later removal of a PHB */
+	pci_intx_register(pci_dev, virq);
 	return 0;
 }
 
-- 
2.25.4

