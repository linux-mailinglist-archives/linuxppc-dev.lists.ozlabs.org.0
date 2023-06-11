Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA36272B30C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 19:20:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QfM5N3gl0z2ytR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 03:20:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=2001:4190:8020::34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QfM4N43wbz2ytS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 03:19:16 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 0EA1A9200B4; Sun, 11 Jun 2023 19:19:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 0B5499200B3;
	Sun, 11 Jun 2023 18:19:15 +0100 (BST)
Date: Sun, 11 Jun 2023 18:19:14 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Bjorn Helgaas <bhelgaas@google.com>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
    Christophe Leroy <christophe.leroy@csgroup.eu>, 
    Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
    "David S. Miller" <davem@davemloft.net>, 
    Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
    Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v9 01/14] PCI: pciehp: Rely on `link_active_reporting'
In-Reply-To: <alpine.DEB.2.21.2305310024400.59226@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2305310028150.59226@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2305310024400.59226@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, David Abdurachmanov <david.abdurachmanov@gmail.com>, linux-rdma@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Lukas Wunner <lukas@wunner.de>, linux-pci@vger.kernel.org, Stefan Roese <sr@denx.de>, Jim Wilson <wilson@tuliptree.org>, netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use `link_active_reporting' to determine whether Data Link Layer Link 
Active Reporting is available rather than re-retrieving the capability.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Reviewed-by: Lukas Wunner <lukas@wunner.de>
---
NB this has been compile-tested only with PPC64LE and x86-64
configurations.

No change from v8.

Changes from v7:

- Add Reviewed-by: tag by Lukas Wunner.

- Reorder from 6/7.

No change from v6.

New change in v6.
---
 drivers/pci/hotplug/pciehp_hpc.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

linux-pcie-link-active-reporting-hpc.diff
Index: linux-macro/drivers/pci/hotplug/pciehp_hpc.c
===================================================================
--- linux-macro.orig/drivers/pci/hotplug/pciehp_hpc.c
+++ linux-macro/drivers/pci/hotplug/pciehp_hpc.c
@@ -984,7 +984,7 @@ static inline int pcie_hotplug_depth(str
 struct controller *pcie_init(struct pcie_device *dev)
 {
 	struct controller *ctrl;
-	u32 slot_cap, slot_cap2, link_cap;
+	u32 slot_cap, slot_cap2;
 	u8 poweron;
 	struct pci_dev *pdev = dev->port;
 	struct pci_bus *subordinate = pdev->subordinate;
@@ -1030,9 +1030,6 @@ struct controller *pcie_init(struct pcie
 	if (dmi_first_match(inband_presence_disabled_dmi_table))
 		ctrl->inband_presence_disabled = 1;
 
-	/* Check if Data Link Layer Link Active Reporting is implemented */
-	pcie_capability_read_dword(pdev, PCI_EXP_LNKCAP, &link_cap);
-
 	/* Clear all remaining event bits in Slot Status register. */
 	pcie_capability_write_word(pdev, PCI_EXP_SLTSTA,
 		PCI_EXP_SLTSTA_ABP | PCI_EXP_SLTSTA_PFD |
@@ -1051,7 +1048,7 @@ struct controller *pcie_init(struct pcie
 		FLAG(slot_cap, PCI_EXP_SLTCAP_EIP),
 		FLAG(slot_cap, PCI_EXP_SLTCAP_NCCS),
 		FLAG(slot_cap2, PCI_EXP_SLTCAP2_IBPD),
-		FLAG(link_cap, PCI_EXP_LNKCAP_DLLLARC),
+		FLAG(pdev->link_active_reporting, true),
 		pdev->broken_cmd_compl ? " (with Cmd Compl erratum)" : "");
 
 	/*
