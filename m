Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE68A72B33B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 19:23:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QfM8m5Pyxz3cTK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 03:23:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QfM4t4k2cz2ywC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 03:19:42 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 267D59200BC; Sun, 11 Jun 2023 19:19:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 21FBD9200BB;
	Sun, 11 Jun 2023 18:19:41 +0100 (BST)
Date: Sun, 11 Jun 2023 18:19:41 +0100 (BST)
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
Subject: [PATCH v9 07/14] PCI: Export `pcie_retrain_link' for use outside
 ASPM
In-Reply-To: <alpine.DEB.2.21.2305310024400.59226@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2306110229010.64925@angie.orcam.me.uk>
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

Export `pcie_retrain_link' for link retrain needs outside ASPM.  There 
is no functional change at this point, but `struct pcie_link_state' is 
local to ASPM and not used within `pcie_retrain_link' other than to get 
at the associated PCI device, so change the operand and adjust the lone 
call site accordingly.  Document the interface.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
There's a missing full stop added in a comment in the course of the move, 
not worth mentioning in the change description IMHO and not worth its own 
change either.  This comment will go away in a subsequent change anyway.

New change in v9.
---
 drivers/pci/pci.c       |   36 ++++++++++++++++++++++++++++++++++++
 drivers/pci/pci.h       |    1 +
 drivers/pci/pcie/aspm.c |   32 +-------------------------------
 3 files changed, 38 insertions(+), 31 deletions(-)

linux-pcie-retrain-link-export.diff
Index: linux-macro/drivers/pci/pci.c
===================================================================
--- linux-macro.orig/drivers/pci/pci.c
+++ linux-macro/drivers/pci/pci.c
@@ -4912,6 +4912,42 @@ bool pcie_wait_for_link(struct pci_dev *
 	return pcie_wait_for_link_delay(pdev, active, 100);
 }
 
+/**
+ * pcie_retrain_link - Request a link retrain and wait for it to complete
+ * @pdev: Device whose link to retrain.
+ *
+ * Return TRUE if successful, or FALSE if training has not completed
+ * within PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds.
+ */
+bool pcie_retrain_link(struct pci_dev *pdev)
+{
+	unsigned long end_jiffies;
+	u16 reg16;
+
+	pcie_capability_read_word(pdev, PCI_EXP_LNKCTL, &reg16);
+	reg16 |= PCI_EXP_LNKCTL_RL;
+	pcie_capability_write_word(pdev, PCI_EXP_LNKCTL, reg16);
+	if (pdev->clear_retrain_link) {
+		/*
+		 * Due to an erratum in some devices the Retrain Link bit
+		 * needs to be cleared again manually to allow the link
+		 * training to succeed.
+		 */
+		reg16 &= ~PCI_EXP_LNKCTL_RL;
+		pcie_capability_write_word(pdev, PCI_EXP_LNKCTL, reg16);
+	}
+
+	/* Wait for link training end. Break out after waiting for timeout. */
+	end_jiffies = jiffies + msecs_to_jiffies(PCIE_LINK_RETRAIN_TIMEOUT_MS);
+	do {
+		pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &reg16);
+		if (!(reg16 & PCI_EXP_LNKSTA_LT))
+			break;
+		msleep(1);
+	} while (time_before(jiffies, end_jiffies));
+	return !(reg16 & PCI_EXP_LNKSTA_LT);
+}
+
 /*
  * Find maximum D3cold delay required by all the devices on the bus.  The
  * spec says 100 ms, but firmware can lower it and we allow drivers to
Index: linux-macro/drivers/pci/pci.h
===================================================================
--- linux-macro.orig/drivers/pci/pci.h
+++ linux-macro/drivers/pci/pci.h
@@ -561,6 +561,7 @@ pci_ers_result_t pcie_do_recovery(struct
 		pci_ers_result_t (*reset_subordinates)(struct pci_dev *pdev));
 
 bool pcie_wait_for_link(struct pci_dev *pdev, bool active);
+bool pcie_retrain_link(struct pci_dev *pdev);
 #ifdef CONFIG_PCIEASPM
 void pcie_aspm_init_link_state(struct pci_dev *pdev);
 void pcie_aspm_exit_link_state(struct pci_dev *pdev);
Index: linux-macro/drivers/pci/pcie/aspm.c
===================================================================
--- linux-macro.orig/drivers/pci/pcie/aspm.c
+++ linux-macro/drivers/pci/pcie/aspm.c
@@ -191,36 +191,6 @@ static void pcie_clkpm_cap_init(struct p
 	link->clkpm_disable = blacklist ? 1 : 0;
 }
 
-static bool pcie_retrain_link(struct pcie_link_state *link)
-{
-	struct pci_dev *parent = link->pdev;
-	unsigned long end_jiffies;
-	u16 reg16;
-
-	pcie_capability_read_word(parent, PCI_EXP_LNKCTL, &reg16);
-	reg16 |= PCI_EXP_LNKCTL_RL;
-	pcie_capability_write_word(parent, PCI_EXP_LNKCTL, reg16);
-	if (parent->clear_retrain_link) {
-		/*
-		 * Due to an erratum in some devices the Retrain Link bit
-		 * needs to be cleared again manually to allow the link
-		 * training to succeed.
-		 */
-		reg16 &= ~PCI_EXP_LNKCTL_RL;
-		pcie_capability_write_word(parent, PCI_EXP_LNKCTL, reg16);
-	}
-
-	/* Wait for link training end. Break out after waiting for timeout */
-	end_jiffies = jiffies + msecs_to_jiffies(PCIE_LINK_RETRAIN_TIMEOUT_MS);
-	do {
-		pcie_capability_read_word(parent, PCI_EXP_LNKSTA, &reg16);
-		if (!(reg16 & PCI_EXP_LNKSTA_LT))
-			break;
-		msleep(1);
-	} while (time_before(jiffies, end_jiffies));
-	return !(reg16 & PCI_EXP_LNKSTA_LT);
-}
-
 /*
  * pcie_aspm_configure_common_clock: check if the 2 ends of a link
  *   could use common clock. If they are, configure them to use the
@@ -287,7 +257,7 @@ static void pcie_aspm_configure_common_c
 		reg16 &= ~PCI_EXP_LNKCTL_CCC;
 	pcie_capability_write_word(parent, PCI_EXP_LNKCTL, reg16);
 
-	if (pcie_retrain_link(link))
+	if (pcie_retrain_link(link->pdev))
 		return;
 
 	/* Training failed. Restore common clock configurations */
