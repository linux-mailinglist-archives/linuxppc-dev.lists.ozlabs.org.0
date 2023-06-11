Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD3472B31B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 19:20:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QfM5w5t14z30LQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 03:20:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
X-Greylist: delayed 298 seconds by postgrey-1.37 at boromir; Mon, 12 Jun 2023 03:19:21 AEST
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QfM4T1mjkz300q
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 03:19:21 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id B62CE9200BC; Sun, 11 Jun 2023 19:19:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id AEEC09200B3;
	Sun, 11 Jun 2023 18:19:19 +0100 (BST)
Date: Sun, 11 Jun 2023 18:19:19 +0100 (BST)
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
Subject: [PATCH v9 02/14] PCI: Export PCIe link retrain timeout
In-Reply-To: <alpine.DEB.2.21.2305310024400.59226@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2305310030280.59226@angie.orcam.me.uk>
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

Convert LINK_RETRAIN_TIMEOUT from jiffies to milliseconds, accordingly 
rename to PCIE_LINK_RETRAIN_TIMEOUT_MS, and make available via "pci.h" 
for PCI drivers to use.  Use in `pcie_wait_for_link_delay'.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
Changes from v8:

- Convert LINK_RETRAIN_TIMEOUT from jiffies to milliseconds, rename it to
  PCIE_LINK_RETRAIN_TIMEOUT_MS rather than PCIE_LINK_RETRAIN_TIMEOUT, and 
  adjust its use accordingly.

- Also replace hardcoded 1000 in `pcie_wait_for_link_delay'.

- Correct the change heading, s/PCI/PCIe/ for the link reference.

Changes from v7:

- Reorder from 1/7.

No change from v6.

No change from v5.

New change in v5.
---
 drivers/pci/pci.c       |    2 +-
 drivers/pci/pci.h       |    2 ++
 drivers/pci/pcie/aspm.c |    4 +---
 3 files changed, 4 insertions(+), 4 deletions(-)

linux-pcie-link-retrain-timeout.diff
Index: linux-macro/drivers/pci/pci.c
===================================================================
--- linux-macro.orig/drivers/pci/pci.c
+++ linux-macro/drivers/pci/pci.c
@@ -4860,7 +4860,7 @@ static int pci_pm_reset(struct pci_dev *
 static bool pcie_wait_for_link_delay(struct pci_dev *pdev, bool active,
 				     int delay)
 {
-	int timeout = 1000;
+	int timeout = PCIE_LINK_RETRAIN_TIMEOUT_MS;
 	bool ret;
 	u16 lnk_status;
 
Index: linux-macro/drivers/pci/pci.h
===================================================================
--- linux-macro.orig/drivers/pci/pci.h
+++ linux-macro/drivers/pci/pci.h
@@ -11,6 +11,8 @@
 
 #define PCI_VSEC_ID_INTEL_TBT	0x1234	/* Thunderbolt */
 
+#define PCIE_LINK_RETRAIN_TIMEOUT_MS	1000
+
 extern const unsigned char pcie_link_speed[];
 extern bool pci_early_dump;
 
Index: linux-macro/drivers/pci/pcie/aspm.c
===================================================================
--- linux-macro.orig/drivers/pci/pcie/aspm.c
+++ linux-macro/drivers/pci/pcie/aspm.c
@@ -90,8 +90,6 @@ static const char *policy_str[] = {
 	[POLICY_POWER_SUPERSAVE] = "powersupersave"
 };
 
-#define LINK_RETRAIN_TIMEOUT HZ
-
 /*
  * The L1 PM substate capability is only implemented in function 0 in a
  * multi function device.
@@ -213,7 +211,7 @@ static bool pcie_retrain_link(struct pci
 	}
 
 	/* Wait for link training end. Break out after waiting for timeout */
-	end_jiffies = jiffies + LINK_RETRAIN_TIMEOUT;
+	end_jiffies = jiffies + msecs_to_jiffies(PCIE_LINK_RETRAIN_TIMEOUT_MS);
 	do {
 		pcie_capability_read_word(parent, PCI_EXP_LNKSTA, &reg16);
 		if (!(reg16 & PCI_EXP_LNKSTA_LT))
