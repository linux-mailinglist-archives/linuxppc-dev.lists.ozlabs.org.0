Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1196428E685
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 20:37:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBLk20NXVzDqx5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 05:37:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=lca.pw (client-ip=205.139.111.44;
 helo=us-smtp-delivery-44.mimecast.com; envelope-from=cai@lca.pw;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
X-Greylist: delayed 310 seconds by postgrey-1.36 at bilbo;
 Thu, 15 Oct 2020 05:35:17 AEDT
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBLgn649gzDqQ1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 05:35:17 +1100 (AEDT)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-7iWQC8tkOS2JSIKZ2PKgWQ-1; Wed, 14 Oct 2020 14:28:23 -0400
X-MC-Unique: 7iWQC8tkOS2JSIKZ2PKgWQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A8951007464;
 Wed, 14 Oct 2020 18:28:21 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-66-216.rdu2.redhat.com
 [10.10.66.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F10E60BF3;
 Wed, 14 Oct 2020 18:28:19 +0000 (UTC)
From: Qian Cai <cai@lca.pw>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH -next] Revert "powerpc/pci: unmap legacy INTx interrupts when
 a PHB is removed"
Date: Wed, 14 Oct 2020 14:28:11 -0400
Message-Id: <20201014182811.12027-1-cai@lca.pw>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cai@lca.pw
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lca.pw
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit 3a3181e16fbde752007759f8759d25e0ff1fc425 which
causes memory corruptions on POWER9 NV.

Signed-off-by: Qian Cai <cai@lca.pw>
---
 arch/powerpc/include/asm/pci-bridge.h |   6 --
 arch/powerpc/kernel/pci-common.c      | 114 --------------------------
 2 files changed, 120 deletions(-)

diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/a=
sm/pci-bridge.h
index d21e070352dc..d2a2a14e56f9 100644
--- a/arch/powerpc/include/asm/pci-bridge.h
+++ b/arch/powerpc/include/asm/pci-bridge.h
@@ -48,9 +48,6 @@ struct pci_controller_ops {
=20
 /*
  * Structure of a PCI controller (host bridge)
- *
- * @irq_count: number of interrupt mappings
- * @irq_map: interrupt mappings
  */
 struct pci_controller {
 =09struct pci_bus *bus;
@@ -130,9 +127,6 @@ struct pci_controller {
=20
 =09void *private_data;
 =09struct npu *npu;
-
-=09unsigned int irq_count;
-=09unsigned int *irq_map;
 };
=20
 /* These are used for config access before all the PCI probing
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-com=
mon.c
index deb831f0ae13..be108616a721 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -353,115 +353,6 @@ struct pci_controller *pci_find_controller_for_domain=
(int domain_nr)
 =09return NULL;
 }
=20
-/*
- * Assumption is made on the interrupt parent. All interrupt-map
- * entries are considered to have the same parent.
- */
-static int pcibios_irq_map_count(struct pci_controller *phb)
-{
-=09const __be32 *imap;
-=09int imaplen;
-=09struct device_node *parent;
-=09u32 intsize, addrsize, parintsize, paraddrsize;
-
-=09if (of_property_read_u32(phb->dn, "#interrupt-cells", &intsize))
-=09=09return 0;
-=09if (of_property_read_u32(phb->dn, "#address-cells", &addrsize))
-=09=09return 0;
-
-=09imap =3D of_get_property(phb->dn, "interrupt-map", &imaplen);
-=09if (!imap) {
-=09=09pr_debug("%pOF : no interrupt-map\n", phb->dn);
-=09=09return 0;
-=09}
-=09imaplen /=3D sizeof(u32);
-=09pr_debug("%pOF : imaplen=3D%d\n", phb->dn, imaplen);
-
-=09if (imaplen < (addrsize + intsize + 1))
-=09=09return 0;
-
-=09imap +=3D intsize + addrsize;
-=09parent =3D of_find_node_by_phandle(be32_to_cpup(imap));
-=09if (!parent) {
-=09=09pr_debug("%pOF : no imap parent found !\n", phb->dn);
-=09=09return 0;
-=09}
-
-=09if (of_property_read_u32(parent, "#interrupt-cells", &parintsize)) {
-=09=09pr_debug("%pOF : parent lacks #interrupt-cells!\n", phb->dn);
-=09=09return 0;
-=09}
-
-=09if (of_property_read_u32(parent, "#address-cells", &paraddrsize))
-=09=09paraddrsize =3D 0;
-
-=09return imaplen / (addrsize + intsize + 1 + paraddrsize + parintsize);
-}
-
-static void pcibios_irq_map_init(struct pci_controller *phb)
-{
-=09phb->irq_count =3D pcibios_irq_map_count(phb);
-=09if (phb->irq_count < PCI_NUM_INTX)
-=09=09phb->irq_count =3D PCI_NUM_INTX;
-
-=09pr_debug("%pOF : interrupt map #%d\n", phb->dn, phb->irq_count);
-
-=09phb->irq_map =3D kcalloc(phb->irq_count, sizeof(unsigned int),
-=09=09=09       GFP_KERNEL);
-}
-
-static void pci_irq_map_register(struct pci_dev *pdev, unsigned int virq)
-{
-=09struct pci_controller *phb =3D pci_bus_to_host(pdev->bus);
-=09int i;
-
-=09if (!phb->irq_map)
-=09=09return;
-
-=09for (i =3D 0; i < phb->irq_count; i++) {
-=09=09/*
-=09=09 * Look for an empty or an equivalent slot, as INTx
-=09=09 * interrupts can be shared between adapters.
-=09=09 */
-=09=09if (phb->irq_map[i] =3D=3D virq || !phb->irq_map[i]) {
-=09=09=09phb->irq_map[i] =3D virq;
-=09=09=09break;
-=09=09}
-=09}
-
-=09if (i =3D=3D phb->irq_count)
-=09=09pr_err("PCI:%s all platform interrupts mapped\n",
-=09=09       pci_name(pdev));
-}
-
-/*
- * Clearing the mapped interrupts will also clear the underlying
- * mappings of the ESB pages of the interrupts when under XIVE. It is
- * a requirement of PowerVM to clear all memory mappings before
- * removing a PHB.
- */
-static void pci_irq_map_dispose(struct pci_bus *bus)
-{
-=09struct pci_controller *phb =3D pci_bus_to_host(bus);
-=09int i;
-
-=09if (!phb->irq_map)
-=09=09return;
-
-=09pr_debug("PCI: Clearing interrupt mappings for PHB %04x:%02x...\n",
-=09=09 pci_domain_nr(bus), bus->number);
-=09for (i =3D 0; i < phb->irq_count; i++)
-=09=09irq_dispose_mapping(phb->irq_map[i]);
-
-=09kfree(phb->irq_map);
-}
-
-void pcibios_remove_bus(struct pci_bus *bus)
-{
-=09pci_irq_map_dispose(bus);
-}
-EXPORT_SYMBOL_GPL(pcibios_remove_bus);
-
 /*
  * Reads the interrupt pin to determine if interrupt is use by card.
  * If the interrupt is used, then gets the interrupt line from the
@@ -510,8 +401,6 @@ static int pci_read_irq_line(struct pci_dev *pci_dev)
=20
 =09pci_dev->irq =3D virq;
=20
-=09/* Record all interrut mappings for later removal of a PHB */
-=09pci_irq_map_register(pci_dev, virq);
 =09return 0;
 }
=20
@@ -1665,9 +1554,6 @@ void pcibios_scan_phb(struct pci_controller *hose)
=20
 =09pr_debug("PCI: Scanning PHB %pOF\n", node);
=20
-=09/* Allocate interrupt mappings array */
-=09pcibios_irq_map_init(hose);
-
 =09/* Get some IO space for the new PHB */
 =09pcibios_setup_phb_io_space(hose);
=20
--=20
2.28.0

