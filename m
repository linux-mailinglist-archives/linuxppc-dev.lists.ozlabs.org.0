Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0669123EB72
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 12:25:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNM1v3SWNzDqC3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 20:25:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNLtY1v17zDqwt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 20:19:00 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.42])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 292D84E0201C;
 Fri,  7 Aug 2020 12:18:56 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 7 Aug 2020
 12:18:55 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G001c807eccd-1440-4d50-9d7c-d5f5a9c22940,
 9C6B65F6CFD3D723D723CC07BEDAC6F805E88D1E) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2] powerpc/pci: unmap legacy INTx interrupts when a PHB is
 removed
Date: Fri, 7 Aug 2020 12:18:54 +0200
Message-ID: <20200807101854.844619-1-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d1963246-6112-4418-b5bd-d0a690d4bc7f
X-Ovh-Tracer-Id: 3066951349154581411
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkedvgddvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefvdeutddvieekkeeuhfekudejjefggffghfetgfelgfevveefgefhvdegtdelveenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org,
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

Since some PCI adapters, like GPUs, use the "interrupt-map" property
to describe interrupt mappings other than the legacy INTx interrupts,
we can not restrict the size of the mapping array to PCI_NUM_INTX. The
number of interrupt mappings is computed from the "interrupt-map"
property and the mapping array is allocated accordingly.

Cc: "Oliver O'Halloran" <oohall@gmail.com>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 Changes since v2:

 - merged 2 patches.
 
 arch/powerpc/include/asm/pci-bridge.h |   6 ++
 arch/powerpc/kernel/pci-common.c      | 114 ++++++++++++++++++++++++++
 2 files changed, 120 insertions(+)

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
index be108616a721..deb831f0ae13 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -353,6 +353,115 @@ struct pci_controller *pci_find_controller_for_domain(int domain_nr)
 	return NULL;
 }
 
+/*
+ * Assumption is made on the interrupt parent. All interrupt-map
+ * entries are considered to have the same parent.
+ */
+static int pcibios_irq_map_count(struct pci_controller *phb)
+{
+	const __be32 *imap;
+	int imaplen;
+	struct device_node *parent;
+	u32 intsize, addrsize, parintsize, paraddrsize;
+
+	if (of_property_read_u32(phb->dn, "#interrupt-cells", &intsize))
+		return 0;
+	if (of_property_read_u32(phb->dn, "#address-cells", &addrsize))
+		return 0;
+
+	imap = of_get_property(phb->dn, "interrupt-map", &imaplen);
+	if (!imap) {
+		pr_debug("%pOF : no interrupt-map\n", phb->dn);
+		return 0;
+	}
+	imaplen /= sizeof(u32);
+	pr_debug("%pOF : imaplen=%d\n", phb->dn, imaplen);
+
+	if (imaplen < (addrsize + intsize + 1))
+		return 0;
+
+	imap += intsize + addrsize;
+	parent = of_find_node_by_phandle(be32_to_cpup(imap));
+	if (!parent) {
+		pr_debug("%pOF : no imap parent found !\n", phb->dn);
+		return 0;
+	}
+
+	if (of_property_read_u32(parent, "#interrupt-cells", &parintsize)) {
+		pr_debug("%pOF : parent lacks #interrupt-cells!\n", phb->dn);
+		return 0;
+	}
+
+	if (of_property_read_u32(parent, "#address-cells", &paraddrsize))
+		paraddrsize = 0;
+
+	return imaplen / (addrsize + intsize + 1 + paraddrsize + parintsize);
+}
+
+static void pcibios_irq_map_init(struct pci_controller *phb)
+{
+	phb->irq_count = pcibios_irq_map_count(phb);
+	if (phb->irq_count < PCI_NUM_INTX)
+		phb->irq_count = PCI_NUM_INTX;
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
@@ -401,6 +510,8 @@ static int pci_read_irq_line(struct pci_dev *pci_dev)
 
 	pci_dev->irq = virq;
 
+	/* Record all interrut mappings for later removal of a PHB */
+	pci_irq_map_register(pci_dev, virq);
 	return 0;
 }
 
@@ -1554,6 +1665,9 @@ void pcibios_scan_phb(struct pci_controller *hose)
 
 	pr_debug("PCI: Scanning PHB %pOF\n", node);
 
+	/* Allocate interrupt mappings array */
+	pcibios_irq_map_init(hose);
+
 	/* Get some IO space for the new PHB */
 	pcibios_setup_phb_io_space(hose);
 
-- 
2.25.4

