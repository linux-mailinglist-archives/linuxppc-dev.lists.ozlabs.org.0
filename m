Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBCD72B33F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 19:24:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QfM9s19y3z3cbQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 03:24:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QfM530gDgz30PW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 03:19:51 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 90AD99200C1; Sun, 11 Jun 2023 19:19:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8B5119200B3;
	Sun, 11 Jun 2023 18:19:49 +0100 (BST)
Date: Sun, 11 Jun 2023 18:19:49 +0100 (BST)
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
Subject: [PATCH v9 09/14] PCI: Factor our waiting for link training end
In-Reply-To: <alpine.DEB.2.21.2305310024400.59226@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2306111605060.64925@angie.orcam.me.uk>
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

Move code polling for the Link Training bit to clear into a function of 
its own.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
New change in v9.
---
 drivers/pci/pci.c |   37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

linux-pcie-wait-for-link-status.diff
Index: linux-macro/drivers/pci/pci.c
===================================================================
--- linux-macro.orig/drivers/pci/pci.c
+++ linux-macro/drivers/pci/pci.c
@@ -4850,6 +4850,28 @@ static int pci_pm_reset(struct pci_dev *
 }
 
 /**
+ * pcie_wait_for_link_status - Wait for link training end
+ * @pdev: Device whose link to wait for.
+ *
+ * Return TRUE if successful, or FALSE if training has not completed
+ * within PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds.
+ */
+static bool pcie_wait_for_link_status(struct pci_dev *pdev)
+{
+	unsigned long end_jiffies;
+	u16 lnksta;
+
+	end_jiffies = jiffies + msecs_to_jiffies(PCIE_LINK_RETRAIN_TIMEOUT_MS);
+	do {
+		pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta);
+		if (!(lnksta & PCI_EXP_LNKSTA_LT))
+			break;
+		msleep(1);
+	} while (time_before(jiffies, end_jiffies));
+	return !(lnksta & PCI_EXP_LNKSTA_LT);
+}
+
+/**
  * pcie_wait_for_link_delay - Wait until link is active or inactive
  * @pdev: Bridge device
  * @active: waiting for active or inactive?
@@ -4916,14 +4938,11 @@ bool pcie_wait_for_link(struct pci_dev *
  * pcie_retrain_link - Request a link retrain and wait for it to complete
  * @pdev: Device whose link to retrain.
  *
- * Return TRUE if successful, or FALSE if training has not completed
- * within PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds.
+ * Return TRUE if successful, or FALSE if training has not completed.
  */
 bool pcie_retrain_link(struct pci_dev *pdev)
 {
-	unsigned long end_jiffies;
 	u16 lnkctl;
-	u16 lnksta;
 
 	pcie_capability_read_word(pdev, PCI_EXP_LNKCTL, &lnkctl);
 	lnkctl |= PCI_EXP_LNKCTL_RL;
@@ -4938,15 +4957,7 @@ bool pcie_retrain_link(struct pci_dev *p
 		pcie_capability_write_word(pdev, PCI_EXP_LNKCTL, lnkctl);
 	}
 
-	/* Wait for link training end. Break out after waiting for timeout. */
-	end_jiffies = jiffies + msecs_to_jiffies(PCIE_LINK_RETRAIN_TIMEOUT_MS);
-	do {
-		pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta);
-		if (!(lnksta & PCI_EXP_LNKSTA_LT))
-			break;
-		msleep(1);
-	} while (time_before(jiffies, end_jiffies));
-	return !(lnksta & PCI_EXP_LNKSTA_LT);
+	return pcie_wait_for_link_status(pdev);
 }
 
 /*
