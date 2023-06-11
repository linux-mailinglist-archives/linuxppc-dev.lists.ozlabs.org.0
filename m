Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6408672B340
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 19:24:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QfMBP16wvz3ckH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 03:24:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=2001:4190:8020::34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QfM564zdqz2ytd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 03:19:54 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 4E8B29200C6; Sun, 11 Jun 2023 19:19:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 4858E9200B3;
	Sun, 11 Jun 2023 18:19:53 +0100 (BST)
Date: Sun, 11 Jun 2023 18:19:53 +0100 (BST)
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
Subject: [PATCH v9 10/14] PCI: Add support for polling DLLLA to
 `pcie_retrain_link'
In-Reply-To: <alpine.DEB.2.21.2305310024400.59226@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2306110310540.64925@angie.orcam.me.uk>
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

Let the caller of `pcie_retrain_link' specify whether they want to use 
the LT bit or the DLLLA bit of the Link Status Register to determine if 
link training has completed.  It is up to the caller to verify whether 
the use of the DLLLA bit, the implementation of which is optional, is 
valid for the device requested.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
New change in v9.
---
 drivers/pci/pci.c       |   28 ++++++++++++++++++++--------
 drivers/pci/pci.h       |    2 +-
 drivers/pci/pcie/aspm.c |    2 +-
 3 files changed, 22 insertions(+), 10 deletions(-)

linux-pcie-retrain-link-use-lt.diff
Index: linux-macro/drivers/pci/pci.c
===================================================================
--- linux-macro.orig/drivers/pci/pci.c
+++ linux-macro/drivers/pci/pci.c
@@ -4850,25 +4850,32 @@ static int pci_pm_reset(struct pci_dev *
 }
 
 /**
- * pcie_wait_for_link_status - Wait for link training end
+ * pcie_wait_for_link_status - Wait for link status change
  * @pdev: Device whose link to wait for.
+ * @use_lt: Use the LT bit if TRUE, or the DLLLA bit if FALSE.
+ * @active: Waiting for active or inactive?
  *
- * Return TRUE if successful, or FALSE if training has not completed
- * within PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds.
+ * Return TRUE if successful, or FALSE if status has not changed within
+ * PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds.
  */
-static bool pcie_wait_for_link_status(struct pci_dev *pdev)
+static bool pcie_wait_for_link_status(struct pci_dev *pdev,
+				      bool use_lt, bool active)
 {
+	u16 lnksta_mask, lnksta_match;
 	unsigned long end_jiffies;
 	u16 lnksta;
 
+	lnksta_mask = use_lt ? PCI_EXP_LNKSTA_LT : PCI_EXP_LNKSTA_DLLLA;
+	lnksta_match = active ? lnksta_mask : 0;
+
 	end_jiffies = jiffies + msecs_to_jiffies(PCIE_LINK_RETRAIN_TIMEOUT_MS);
 	do {
 		pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta);
-		if (!(lnksta & PCI_EXP_LNKSTA_LT))
+		if ((lnksta & lnksta_mask) == lnksta_match)
 			break;
 		msleep(1);
 	} while (time_before(jiffies, end_jiffies));
-	return !(lnksta & PCI_EXP_LNKSTA_LT);
+	return (lnksta & lnksta_mask) == lnksta_match;
 }
 
 /**
@@ -4937,10 +4944,15 @@ bool pcie_wait_for_link(struct pci_dev *
 /**
  * pcie_retrain_link - Request a link retrain and wait for it to complete
  * @pdev: Device whose link to retrain.
+ * @use_lt: Use the LT bit if TRUE, or the DLLLA bit if FALSE, for status.
+ *
+ * Retrain completion status is retrieved from the Link Status Register
+ * according to @use_lt.  It is not verified whether the use of the DLLLA
+ * bit is valid.
  *
  * Return TRUE if successful, or FALSE if training has not completed.
  */
-bool pcie_retrain_link(struct pci_dev *pdev)
+bool pcie_retrain_link(struct pci_dev *pdev, bool use_lt)
 {
 	u16 lnkctl;
 
@@ -4957,7 +4969,7 @@ bool pcie_retrain_link(struct pci_dev *p
 		pcie_capability_write_word(pdev, PCI_EXP_LNKCTL, lnkctl);
 	}
 
-	return pcie_wait_for_link_status(pdev);
+	return pcie_wait_for_link_status(pdev, use_lt, !use_lt);
 }
 
 /*
Index: linux-macro/drivers/pci/pci.h
===================================================================
--- linux-macro.orig/drivers/pci/pci.h
+++ linux-macro/drivers/pci/pci.h
@@ -561,7 +561,7 @@ pci_ers_result_t pcie_do_recovery(struct
 		pci_ers_result_t (*reset_subordinates)(struct pci_dev *pdev));
 
 bool pcie_wait_for_link(struct pci_dev *pdev, bool active);
-bool pcie_retrain_link(struct pci_dev *pdev);
+bool pcie_retrain_link(struct pci_dev *pdev, bool use_lt);
 #ifdef CONFIG_PCIEASPM
 void pcie_aspm_init_link_state(struct pci_dev *pdev);
 void pcie_aspm_exit_link_state(struct pci_dev *pdev);
Index: linux-macro/drivers/pci/pcie/aspm.c
===================================================================
--- linux-macro.orig/drivers/pci/pcie/aspm.c
+++ linux-macro/drivers/pci/pcie/aspm.c
@@ -257,7 +257,7 @@ static void pcie_aspm_configure_common_c
 		reg16 &= ~PCI_EXP_LNKCTL_CCC;
 	pcie_capability_write_word(parent, PCI_EXP_LNKCTL, reg16);
 
-	if (pcie_retrain_link(link->pdev))
+	if (pcie_retrain_link(link->pdev, true))
 		return;
 
 	/* Training failed. Restore common clock configurations */
