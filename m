Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3393F72B344
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 19:26:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QfMDk6sqCz3dLs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 03:26:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QfM5S1CbDz30f3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 03:20:12 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 974869200CC; Sun, 11 Jun 2023 19:20:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 91D4E9200CA;
	Sun, 11 Jun 2023 18:20:10 +0100 (BST)
Date: Sun, 11 Jun 2023 18:20:10 +0100 (BST)
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
Subject: [PATCH v9 14/14] PCI: Work around PCIe link training failures
In-Reply-To: <alpine.DEB.2.21.2305310024400.59226@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2305310038540.59226@angie.orcam.me.uk>
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

Attempt to handle cases such as with a downstream port of the ASMedia 
ASM2824 PCIe switch where link training never completes and the link 
continues switching between speeds indefinitely with the data link layer 
never reaching the active state.

It has been observed with a downstream port of the ASMedia ASM2824 Gen 3 
switch wired to the upstream port of the Pericom PI7C9X2G304 Gen 2 
switch, using a Delock Riser Card PCI Express x1 > 2 x PCIe x1 device, 
P/N 41433, wired to a SiFive HiFive Unmatched board.  In this setup the 
switches are supposed to negotiate the link speed of preferably 5.0GT/s, 
falling back to 2.5GT/s.

Instead the link continues oscillating between the two speeds, at the 
rate of 34-35 times per second, with link training reported repeatedly 
active ~84% of the time.  Forcibly limiting the target link speed to 
2.5GT/s with the upstream ASM2824 device however makes the two switches 
communicate correctly.  Removing the speed restriction afterwards makes 
the two devices switch to 5.0GT/s then.

Make use of these observations then and detect the inability to train 
the link, by checking for the Data Link Layer Link Active status bit 
being off while the Link Bandwidth Management Status indicating that 
hardware has changed the link speed or width in an attempt to correct 
unreliable link operation.

Restrict the speed to 2.5GT/s then with the Target Link Speed field, 
request a retrain and wait 200ms for the data link to go up.  If this 
turns out successful, then lift the restriction, letting the devices 
negotiate a higher speed.

Also check for a 2.5GT/s speed restriction the firmware may have already 
arranged and lift it too with ports of devices known to continue working 
afterwards, currently the ASM2824 only, that already report their data 
link being up.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Link: https://lore.kernel.org/r/alpine.DEB.2.21.2203022037020.56670@angie.orcam.me.uk/
Link: https://source.denx.de/u-boot/u-boot/-/commit/a398a51ccc68
---
Changes from v8:

- Rename `pcie_downstream_link_retrain' to `pcie_failed_link_retrain', add 
  a prototype in "pci.h", moving the stub implementation under !PCI_QUIRKS 
  umbrella.

- Move back to quirks.c, though as an internal API call rather than a 
  regular quirk.

- Adjust for PCIE_LINK_RETRAIN_TIMEOUT_MS expressed in milliseconds rather 
  than jiffies.

- Use a `pcie_retrain_link' call rather than retraining inline, and also 
  use it in the restriction lift path, making it another possible failure 
  point.

No changes from v7.

Changes from v6:

- Regenerate against 6.3-rc5.

- Shorten the lore.kernel.org archive link in the change description.

Changes from v5:

- Move from a quirk into PCI core and call at device probing, hot-plug,
  reset and resume.  Keep the ASMedia part under CONFIG_PCI_QUIRKS.

- Rely on `dev->link_active_reporting' rather than re-retrieving the 
  capability.

Changes from v4:

- Remove <linux/bug.h> inclusion no longer needed.

- Make the quirk generic based on probing device features rather than 
  specific to the ASM2824 part only; take the Retrain Link bit erratum 
  into account.

- Still lift the 2.5GT/s speed restriction with the ASM2824 only.

- Increase retrain timeout from 200ms to 1s (PCIE_LINK_RETRAIN_TIMEOUT).

- Remove retrain success notification.

- Use PCIe helpers rather than generic PCI functions throughout.

- Trim down and update the wording of the change description for the 
  switch from an ASM2824-specific to a generic fixup.

Changes from v3:

- Remove the <linux/pci_ids.h> entry for the ASM2824.

Changes from v2:

- Regenerate for 5.17-rc2 for a merge conflict.

- Replace BUG_ON for a missing PCI Express capability with WARN_ON and an
  early return.

Changes from v1:

- Regenerate for a merge conflict.
---
 drivers/pci/pci.h    |    3 +
 drivers/pci/quirks.c |   93 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+), 1 deletion(-)

linux-pcie-asm2824-manual-retrain.diff
Index: linux-macro/drivers/pci/pci.h
===================================================================
--- linux-macro.orig/drivers/pci/pci.h
+++ linux-macro/drivers/pci/pci.h
@@ -539,6 +539,7 @@ void pci_acs_init(struct pci_dev *dev);
 int pci_dev_specific_acs_enabled(struct pci_dev *dev, u16 acs_flags);
 int pci_dev_specific_enable_acs(struct pci_dev *dev);
 int pci_dev_specific_disable_acs_redir(struct pci_dev *dev);
+bool pcie_failed_link_retrain(struct pci_dev *dev);
 #else
 static inline int pci_dev_specific_acs_enabled(struct pci_dev *dev,
 					       u16 acs_flags)
@@ -553,11 +554,11 @@ static inline int pci_dev_specific_disab
 {
 	return -ENOTTY;
 }
-#endif
 static inline bool pcie_failed_link_retrain(struct pci_dev *dev)
 {
 	return false;
 }
+#endif
 
 /* PCI error reporting and recovery */
 pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
Index: linux-macro/drivers/pci/quirks.c
===================================================================
--- linux-macro.orig/drivers/pci/quirks.c
+++ linux-macro/drivers/pci/quirks.c
@@ -33,6 +33,99 @@
 #include <linux/switchtec.h>
 #include "pci.h"
 
+/*
+ * Retrain the link of a downstream PCIe port by hand if necessary.
+ *
+ * This is needed at least where a downstream port of the ASMedia ASM2824
+ * Gen 3 switch is wired to the upstream port of the Pericom PI7C9X2G304
+ * Gen 2 switch, and observed with the Delock Riser Card PCI Express x1 >
+ * 2 x PCIe x1 device, P/N 41433, plugged into the SiFive HiFive Unmatched
+ * board.
+ *
+ * In such a configuration the switches are supposed to negotiate the link
+ * speed of preferably 5.0GT/s, falling back to 2.5GT/s.  However the link
+ * continues switching between the two speeds indefinitely and the data
+ * link layer never reaches the active state, with link training reported
+ * repeatedly active ~84% of the time.  Forcing the target link speed to
+ * 2.5GT/s with the upstream ASM2824 device makes the two switches talk to
+ * each other correctly however.  And more interestingly retraining with a
+ * higher target link speed afterwards lets the two successfully negotiate
+ * 5.0GT/s.
+ *
+ * With the ASM2824 we can rely on the otherwise optional Data Link Layer
+ * Link Active status bit and in the failed link training scenario it will
+ * be off along with the Link Bandwidth Management Status indicating that
+ * hardware has changed the link speed or width in an attempt to correct
+ * unreliable link operation.  For a port that has been left unconnected
+ * both bits will be clear.  So use this information to detect the problem
+ * rather than polling the Link Training bit and watching out for flips or
+ * at least the active status.
+ *
+ * Since the exact nature of the problem isn't known and in principle this
+ * could trigger where an ASM2824 device is downstream rather upstream,
+ * apply this erratum workaround to any downstream ports as long as they
+ * support Link Active reporting and have the Link Control 2 register.
+ * Restrict the speed to 2.5GT/s then with the Target Link Speed field,
+ * request a retrain and wait 200ms for the data link to go up.
+ *
+ * If this turns out successful and we know by the Vendor:Device ID it is
+ * safe to do so, then lift the restriction, letting the devices negotiate
+ * a higher speed.  Also check for a similar 2.5GT/s speed restriction the
+ * firmware may have already arranged and lift it with ports that already
+ * report their data link being up.
+ *
+ * Return TRUE if the link has been successfully retrained, otherwise FALSE.
+ */
+bool pcie_failed_link_retrain(struct pci_dev *dev)
+{
+	static const struct pci_device_id ids[] = {
+		{ PCI_VDEVICE(ASMEDIA, 0x2824) }, /* ASMedia ASM2824 */
+		{}
+	};
+	u16 lnksta, lnkctl2;
+
+	if (!pci_is_pcie(dev) || !pcie_downstream_port(dev) ||
+	    !pcie_cap_has_lnkctl2(dev) || !dev->link_active_reporting)
+		return false;
+
+	pcie_capability_read_word(dev, PCI_EXP_LNKCTL2, &lnkctl2);
+	pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &lnksta);
+	if ((lnksta & (PCI_EXP_LNKSTA_LBMS | PCI_EXP_LNKSTA_DLLLA)) ==
+	    PCI_EXP_LNKSTA_LBMS) {
+		pci_info(dev, "broken device, retraining non-functional downstream link at 2.5GT/s\n");
+
+		lnkctl2 &= ~PCI_EXP_LNKCTL2_TLS;
+		lnkctl2 |= PCI_EXP_LNKCTL2_TLS_2_5GT;
+		pcie_capability_write_word(dev, PCI_EXP_LNKCTL2, lnkctl2);
+
+		if (!pcie_retrain_link(dev, false)) {
+			pci_info(dev, "retraining failed\n");
+			return false;
+		}
+
+		pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &lnksta);
+	}
+
+	if ((lnksta & PCI_EXP_LNKSTA_DLLLA) &&
+	    (lnkctl2 & PCI_EXP_LNKCTL2_TLS) == PCI_EXP_LNKCTL2_TLS_2_5GT &&
+	    pci_match_id(ids, dev)) {
+		u32 lnkcap;
+
+		pci_info(dev, "removing 2.5GT/s downstream link speed restriction\n");
+		pcie_capability_read_dword(dev, PCI_EXP_LNKCAP, &lnkcap);
+		lnkctl2 &= ~PCI_EXP_LNKCTL2_TLS;
+		lnkctl2 |= lnkcap & PCI_EXP_LNKCAP_SLS;
+		pcie_capability_write_word(dev, PCI_EXP_LNKCTL2, lnkctl2);
+
+		if (!pcie_retrain_link(dev, false)) {
+			pci_info(dev, "retraining failed\n");
+			return false;
+		}
+	}
+
+	return true;
+}
+
 static ktime_t fixup_debug_start(struct pci_dev *dev,
 				 void (*fn)(struct pci_dev *dev))
 {
