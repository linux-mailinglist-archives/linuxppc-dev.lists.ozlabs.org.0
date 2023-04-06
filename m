Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A33ED6D8BC5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 02:23:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsMfc4JQcz3fjC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 10:23:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=<UNKNOWN>)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsMcH2Kwvz3fKh
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 10:21:19 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 142389200B4; Thu,  6 Apr 2023 02:21:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 0D3A392009B;
	Thu,  6 Apr 2023 01:21:18 +0100 (BST)
Date: Thu, 6 Apr 2023 01:21:17 +0100 (BST)
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
Subject: [PATCH v8 4/7] PCI: Initialize `link_active_reporting' earlier
In-Reply-To: <alpine.DEB.2.21.2304060100160.13659@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2304060113220.13659@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2304060100160.13659@angie.orcam.me.uk>
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

Determine whether Data Link Layer Link Active Reporting is available 
ahead of calling any fixups so that the cached value can be used there 
and later on.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
Changes from v7:

- Reorder from 3/7.

Changes from v6:

- Regenerate against 6.3-rc5.

New change in v6.
---
 drivers/pci/probe.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

linux-pcie-link-active-reporting-early.diff
Index: linux-macro/drivers/pci/probe.c
===================================================================
--- linux-macro.orig/drivers/pci/probe.c
+++ linux-macro/drivers/pci/probe.c
@@ -820,7 +820,6 @@ static void pci_set_bus_speed(struct pci
 
 		pcie_capability_read_dword(bridge, PCI_EXP_LNKCAP, &linkcap);
 		bus->max_bus_speed = pcie_link_speed[linkcap & PCI_EXP_LNKCAP_SLS];
-		bridge->link_active_reporting = !!(linkcap & PCI_EXP_LNKCAP_DLLLARC);
 
 		pcie_capability_read_word(bridge, PCI_EXP_LNKSTA, &linksta);
 		pcie_update_link_speed(bus, linksta);
@@ -1829,6 +1828,7 @@ int pci_setup_device(struct pci_dev *dev
 	int pos = 0;
 	struct pci_bus_region region;
 	struct resource *res;
+	u32 linkcap;
 
 	hdr_type = pci_hdr_type(dev);
 
@@ -1876,6 +1876,10 @@ int pci_setup_device(struct pci_dev *dev
 	/* "Unknown power state" */
 	dev->current_state = PCI_UNKNOWN;
 
+	/* Set it early to make it available to fixups, etc.  */
+	pcie_capability_read_dword(dev, PCI_EXP_LNKCAP, &linkcap);
+	dev->link_active_reporting = !!(linkcap & PCI_EXP_LNKCAP_DLLLARC);
+
 	/* Early fixups, before probing the BARs */
 	pci_fixup_device(pci_fixup_early, dev);
 
