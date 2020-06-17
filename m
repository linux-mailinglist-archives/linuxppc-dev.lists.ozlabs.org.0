Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A871FD32E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 19:11:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nBRP6lGxzDqsX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 03:10:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.251.8; helo=13.mo4.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 2366 seconds by postgrey-1.36 at bilbo;
 Thu, 18 Jun 2020 03:09:28 AEST
Received: from 13.mo4.mail-out.ovh.net (13.mo4.mail-out.ovh.net [178.33.251.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nBPh3S9zzDqsX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 03:09:25 +1000 (AEST)
Received: from player760.ha.ovh.net (unknown [10.108.54.13])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id CFD7E23B27D
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 18:29:56 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player760.ha.ovh.net (Postfix) with ESMTPSA id 222CD137CC6BC;
 Wed, 17 Jun 2020 16:29:52 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00348ef34b6-1737-4fc5-8c5d-321e34a98843,ABECD89738EEB0C75E5395B338997A57DB3A3EEE)
 smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 2/2] powerpc/pci: unmap all interrupts when a PHB is removed
Date: Wed, 17 Jun 2020 18:29:38 +0200
Message-Id: <20200617162938.743439-3-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200617162938.743439-1-clg@kaod.org>
References: <20200617162938.743439-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4973099891372362673
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

Some PCI adapters, like GPUs, use the "interrupt-map" property to
describe interrupt mappings other than the legacy INTx interrupts.
There can be more than 4 mappings.

To clear all interrupts when a PHB is removed, we need to increase the
'irq_map' array in which mappings are recorded. Compute the number of
interrupt mappings from the "interrupt-map" property and allocate a
bigger 'irq_map' array.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/kernel/pci-common.c | 49 +++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index 515480a4bac6..deb831f0ae13 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -353,9 +353,56 @@ struct pci_controller *pci_find_controller_for_domain(int domain_nr)
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
 static void pcibios_irq_map_init(struct pci_controller *phb)
 {
-	phb->irq_count = PCI_NUM_INTX;
+	phb->irq_count = pcibios_irq_map_count(phb);
+	if (phb->irq_count < PCI_NUM_INTX)
+		phb->irq_count = PCI_NUM_INTX;
 
 	pr_debug("%pOF : interrupt map #%d\n", phb->dn, phb->irq_count);
 
-- 
2.25.4

