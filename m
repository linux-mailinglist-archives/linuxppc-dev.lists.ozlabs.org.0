Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B14E1FD28D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 18:49:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49n9yZ6yNfzDqHK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 02:49:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.173.157; helo=11.mo7.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1009 seconds by postgrey-1.36 at bilbo;
 Thu, 18 Jun 2020 02:46:44 AEST
Received: from 11.mo7.mail-out.ovh.net (11.mo7.mail-out.ovh.net
 [87.98.173.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49n9vS6TgkzDqw9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 02:46:44 +1000 (AEST)
Received: from player760.ha.ovh.net (unknown [10.110.115.164])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 6A14716CACA
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 18:29:52 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player760.ha.ovh.net (Postfix) with ESMTPSA id D3716137CC678;
 Wed, 17 Jun 2020 16:29:47 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003d11073b1-ae63-4a74-95ef-4fa7bdc8620e,ABECD89738EEB0C75E5395B338997A57DB3A3EEE)
 smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 1/2] powerpc/pci: unmap legacy INTx interrupts when a PHB
 is removed
Date: Wed, 17 Jun 2020 18:29:37 +0200
Message-Id: <20200617162938.743439-2-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200617162938.743439-1-clg@kaod.org>
References: <20200617162938.743439-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4971973990631050161
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudejvddguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgfeitedvfedugeehvdevjeduiefhieetffejteejueekhffggfevudegudegudfgnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeitddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a passthrough IO adapter is removed from a pseries machine using
hash MMU and the XIVE interrupt mode, the POWER hypervisor expects the
guest OS to clear all page table entries related to the adapter. If
some are still present, the RTAS call which isolates the PCI slot
returns error 9001 "valid outstanding translations" and the removal of
the IO adapter fails. This is because when the PHBs are scanned, Linux
maps automatically the INTx interrupts in the Linux interrupt number
space but these are never removed.

To solve this problem, we introduce a PPC platform specific
pcibios_remove_bus() routine which clears all interrupt mappings when
the bus is removed. This also clears the associated page table entries
of the ESB pages when using XIVE.

For this purpose, we record the logical interrupt numbers of the
mapped interrupt under the PHB structure and let pcibios_remove_bus()
do the clean up.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/pci-bridge.h |  6 +++
 arch/powerpc/kernel/pci-common.c      | 67 +++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
index b92e81b256e5..ca75cf264ddf 100644
--- a/arch/powerpc/include/asm/pci-bridge.h
+++ b/arch/powerpc/include/asm/pci-bridge.h
@@ -48,6 +48,9 @@ struct pci_controller_ops {
 
 /*
  * Structure of a PCI controller (host bridge)
+ *
+ * @irq_count: number of interrupt mappings
+ * @irq_map: interrupt mappings
  */
 struct pci_controller {
 	struct pci_bus *bus;
@@ -127,6 +130,9 @@ struct pci_controller {
 
 	void *private_data;
 	struct npu *npu;
+
+	unsigned int irq_count;
+	unsigned int *irq_map;
 };
 
 /* These are used for config access before all the PCI probing
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index be108616a721..515480a4bac6 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -353,6 +353,68 @@ struct pci_controller *pci_find_controller_for_domain(int domain_nr)
 	return NULL;
 }
 
+static void pcibios_irq_map_init(struct pci_controller *phb)
+{
+	phb->irq_count = PCI_NUM_INTX;
+
+	pr_debug("%pOF : interrupt map #%d\n", phb->dn, phb->irq_count);
+
+	phb->irq_map = kcalloc(phb->irq_count, sizeof(unsigned int),
+			       GFP_KERNEL);
+}
+
+static void pci_irq_map_register(struct pci_dev *pdev, unsigned int virq)
+{
+	struct pci_controller *phb = pci_bus_to_host(pdev->bus);
+	int i;
+
+	if (!phb->irq_map)
+		return;
+
+	for (i = 0; i < phb->irq_count; i++) {
+		/*
+		 * Look for an empty or an equivalent slot, as INTx
+		 * interrupts can be shared between adapters.
+		 */
+		if (phb->irq_map[i] == virq || !phb->irq_map[i]) {
+			phb->irq_map[i] = virq;
+			break;
+		}
+	}
+
+	if (i == phb->irq_count)
+		pr_err("PCI:%s all platform interrupts mapped\n",
+		       pci_name(pdev));
+}
+
+/*
+ * Clearing the mapped interrupts will also clear the underlying
+ * mappings of the ESB pages of the interrupts when under XIVE. It is
+ * a requirement of PowerVM to clear all memory mappings before
+ * removing a PHB.
+ */
+static void pci_irq_map_dispose(struct pci_bus *bus)
+{
+	struct pci_controller *phb = pci_bus_to_host(bus);
+	int i;
+
+	if (!phb->irq_map)
+		return;
+
+	pr_debug("PCI: Clearing interrupt mappings for PHB %04x:%02x...\n",
+		 pci_domain_nr(bus), bus->number);
+	for (i = 0; i < phb->irq_count; i++)
+		irq_dispose_mapping(phb->irq_map[i]);
+
+	kfree(phb->irq_map);
+}
+
+void pcibios_remove_bus(struct pci_bus *bus)
+{
+	pci_irq_map_dispose(bus);
+}
+EXPORT_SYMBOL_GPL(pcibios_remove_bus);
+
 /*
  * Reads the interrupt pin to determine if interrupt is use by card.
  * If the interrupt is used, then gets the interrupt line from the
@@ -401,6 +463,8 @@ static int pci_read_irq_line(struct pci_dev *pci_dev)
 
 	pci_dev->irq = virq;
 
+	/* Record all interrut mappings for later removal of a PHB */
+	pci_irq_map_register(pci_dev, virq);
 	return 0;
 }
 
@@ -1554,6 +1618,9 @@ void pcibios_scan_phb(struct pci_controller *hose)
 
 	pr_debug("PCI: Scanning PHB %pOF\n", node);
 
+	/* Allocate interrupt mappings array */
+	pcibios_irq_map_init(hose);
+
 	/* Get some IO space for the new PHB */
 	pcibios_setup_phb_io_space(hose);
 
-- 
2.25.4

