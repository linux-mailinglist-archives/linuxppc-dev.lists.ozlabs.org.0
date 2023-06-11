Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E63C272B343
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 19:26:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QfMDB4xBJz3dHW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 03:26:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=2001:4190:8020::34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QfM5M6HdNz30fj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 03:20:07 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 6DEA69200CB; Sun, 11 Jun 2023 19:20:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 66A4F9200CA;
	Sun, 11 Jun 2023 18:20:06 +0100 (BST)
Date: Sun, 11 Jun 2023 18:20:06 +0100 (BST)
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
Subject: [PATCH v9 13/14] PCI: Add failed link recovery for device reset
 events
In-Reply-To: <alpine.DEB.2.21.2305310024400.59226@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2306111631050.64925@angie.orcam.me.uk>
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

Request failed link recovery with any upstream bridge where a device has 
not come back after reset within PCI_RESET_WAIT time.  Reset the polling 
interval if recovery succeeded, otherwise continue as usual.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
New change in v9, factored out from 7/7:

- Remove duplicate succesful completion report previously added (not sure 
  where it came from, possibly an unnoticed leftover from experiments).

- Make the type of `retrain' variable `bool' rather than `int' and invert
  the logic used.

- Rename `pcie_downstream_link_retrain' to `pcie_failed_link_retrain'.

- Rename `pcie_upstream_link_retrain' to `pcie_parent_link_retrain'.  Add 
  documentation.
---
 drivers/pci/pci.c |   39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

linux-pcie-dev-wait-link-retrain.diff
Index: linux-macro/drivers/pci/pci.c
===================================================================
--- linux-macro.orig/drivers/pci/pci.c
+++ linux-macro/drivers/pci/pci.c
@@ -1146,10 +1146,27 @@ void pci_resume_bus(struct pci_bus *bus)
 		pci_walk_bus(bus, pci_resume_one, NULL);
 }
 
+/**
+ * pcie_parent_link_retrain - Check and retrain link we are downstream from
+ * @dev: PCI device to handle.
+ *
+ * Return TRUE if the link was retrained, FALSE otherwise.
+ */
+static bool pcie_parent_link_retrain(struct pci_dev *dev)
+{
+	struct pci_dev *bridge;
+
+	bridge = pci_upstream_bridge(dev);
+	if (bridge)
+		return pcie_failed_link_retrain(bridge);
+	else
+		return false;
+}
+
 static int pci_dev_wait(struct pci_dev *dev, char *reset_type, int timeout)
 {
+	bool retrain = true;
 	int delay = 1;
-	u32 id;
 
 	/*
 	 * After reset, the device should not silently discard config
@@ -1163,21 +1180,33 @@ static int pci_dev_wait(struct pci_dev *
 	 * Command register instead of Vendor ID so we don't have to
 	 * contend with the CRS SV value.
 	 */
-	pci_read_config_dword(dev, PCI_COMMAND, &id);
-	while (PCI_POSSIBLE_ERROR(id)) {
+	for (;;) {
+		u32 id;
+
+		pci_read_config_dword(dev, PCI_COMMAND, &id);
+		if (!PCI_POSSIBLE_ERROR(id))
+			break;
+
 		if (delay > timeout) {
 			pci_warn(dev, "not ready %dms after %s; giving up\n",
 				 delay - 1, reset_type);
 			return -ENOTTY;
 		}
 
-		if (delay > PCI_RESET_WAIT)
+		if (delay > PCI_RESET_WAIT) {
+			if (retrain) {
+				retrain = false;
+				if (pcie_parent_link_retrain(dev)) {
+					delay = 1;
+					continue;
+				}
+			}
 			pci_info(dev, "not ready %dms after %s; waiting\n",
 				 delay - 1, reset_type);
+		}
 
 		msleep(delay);
 		delay *= 2;
-		pci_read_config_dword(dev, PCI_COMMAND, &id);
 	}
 
 	if (delay > PCI_RESET_WAIT)
