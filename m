Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC2468B0D6
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 17:03:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8vMD5rthz3fWG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 03:03:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=<UNKNOWN>)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8vLg65xtz2ynf
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 03:03:06 +1100 (AEDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 90ECE9200C3; Sun,  5 Feb 2023 16:49:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8A5369200BF;
	Sun,  5 Feb 2023 15:49:27 +0000 (GMT)
Date: Sun, 5 Feb 2023 15:49:27 +0000 (GMT)
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
Subject: [PATCH v6 7/7] PCI: Work around PCIe link training failures
In-Reply-To: <alpine.DEB.2.21.2302022022230.45310@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2302051503570.33812@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2302022022230.45310@angie.orcam.me.uk>
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
Link: https://lore.kernel.org/lkml/alpine.DEB.2.21.2203022037020.56670@angie.orcam.me.uk/
Link: https://source.denx.de/u-boot/u-boot/-/commit/a398a51ccc68
---
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
 drivers/pci/pci.c   |  154 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 drivers/pci/pci.h   |    1 
 drivers/pci/probe.c |    2 
 3 files changed, 152 insertions(+), 5 deletions(-)

linux-pcie-asm2824-manual-retrain.diff
Index: linux-macro/drivers/pci/pci.c
===================================================================
--- linux-macro.orig/drivers/pci/pci.c
+++ linux-macro/drivers/pci/pci.c
@@ -859,6 +859,132 @@ int pci_wait_for_pending(struct pci_dev
 	return 0;
 }
 
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
+ * Return 0 if the link has been successfully retrained, otherwise -1.
+ */
+int pcie_downstream_link_retrain(struct pci_dev *dev)
+{
+	static const struct pci_device_id ids[] = {
+		{ PCI_VDEVICE(ASMEDIA, 0x2824) }, /* ASMedia ASM2824 */
+		{}
+	};
+	u16 lnksta, lnkctl2;
+
+	if (!pci_is_pcie(dev) || !pcie_downstream_port(dev) ||
+	    !pcie_cap_has_lnkctl2(dev) || !dev->link_active_reporting)
+		return -1;
+
+	pcie_capability_read_word(dev, PCI_EXP_LNKCTL2, &lnkctl2);
+	pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &lnksta);
+	if ((lnksta & (PCI_EXP_LNKSTA_LBMS | PCI_EXP_LNKSTA_DLLLA)) ==
+	    PCI_EXP_LNKSTA_LBMS) {
+		unsigned long timeout;
+		u16 lnkctl;
+
+		pci_info(dev, "broken device, retraining non-functional downstream link at 2.5GT/s\n");
+
+		pcie_capability_read_word(dev, PCI_EXP_LNKCTL, &lnkctl);
+		lnkctl |= PCI_EXP_LNKCTL_RL;
+		lnkctl2 &= ~PCI_EXP_LNKCTL2_TLS;
+		lnkctl2 |= PCI_EXP_LNKCTL2_TLS_2_5GT;
+		pcie_capability_write_word(dev, PCI_EXP_LNKCTL2, lnkctl2);
+		pcie_capability_write_word(dev, PCI_EXP_LNKCTL, lnkctl);
+		/*
+		 * Due to an erratum in some devices the Retrain Link bit
+		 * needs to be cleared again manually to allow the link
+		 * training to succeed.
+		 */
+		lnkctl &= ~PCI_EXP_LNKCTL_RL;
+		if (dev->clear_retrain_link)
+			pcie_capability_write_word(dev, PCI_EXP_LNKCTL,
+						   lnkctl);
+
+		timeout = jiffies + PCIE_LINK_RETRAIN_TIMEOUT;
+		do {
+			pcie_capability_read_word(dev, PCI_EXP_LNKSTA,
+					     &lnksta);
+			if (lnksta & PCI_EXP_LNKSTA_DLLLA)
+				break;
+			usleep_range(10000, 20000);
+		} while (time_before(jiffies, timeout));
+
+		if (!(lnksta & PCI_EXP_LNKSTA_DLLLA)) {
+			pci_info(dev, "retraining failed\n");
+			return -1;
+		}
+	}
+
+	if (IS_ENABLED(CONFIG_PCI_QUIRKS) && (lnksta & PCI_EXP_LNKSTA_DLLLA) &&
+	    (lnkctl2 & PCI_EXP_LNKCTL2_TLS) == PCI_EXP_LNKCTL2_TLS_2_5GT &&
+	    pci_match_id(ids, dev)) {
+		u32 lnkcap;
+		u16 lnkctl;
+
+		pci_info(dev, "removing 2.5GT/s downstream link speed restriction\n");
+		pcie_capability_read_dword(dev, PCI_EXP_LNKCAP, &lnkcap);
+		pcie_capability_read_word(dev, PCI_EXP_LNKCTL, &lnkctl);
+		lnkctl |= PCI_EXP_LNKCTL_RL;
+		lnkctl2 &= ~PCI_EXP_LNKCTL2_TLS;
+		lnkctl2 |= lnkcap & PCI_EXP_LNKCAP_SLS;
+		pcie_capability_write_word(dev, PCI_EXP_LNKCTL2, lnkctl2);
+		pcie_capability_write_word(dev, PCI_EXP_LNKCTL, lnkctl);
+	}
+
+	return 0;
+}
+
+/* Same as above, but called for a downstream device.  */
+static int pcie_upstream_link_retrain(struct pci_dev *dev)
+{
+	struct pci_dev *bridge;
+
+	bridge = pci_upstream_bridge(dev);
+	if (bridge)
+		return pcie_downstream_link_retrain(bridge);
+	else
+		return -1;
+}
+
 static int pci_acs_enable;
 
 /**
@@ -1148,8 +1274,8 @@ void pci_resume_bus(struct pci_bus *bus)
 
 static int pci_dev_wait(struct pci_dev *dev, char *reset_type, int timeout)
 {
+	int retrain = 0;
 	int delay = 1;
-	u32 id;
 
 	/*
 	 * After reset, the device should not silently discard config
@@ -1163,21 +1289,37 @@ static int pci_dev_wait(struct pci_dev *
 	 * Command register instead of Vendor ID so we don't have to
 	 * contend with the CRS SV value.
 	 */
-	pci_read_config_dword(dev, PCI_COMMAND, &id);
-	while (PCI_POSSIBLE_ERROR(id)) {
+	for (;;) {
+		u32 id;
+
+		pci_read_config_dword(dev, PCI_COMMAND, &id);
+		if (!PCI_POSSIBLE_ERROR(id)) {
+			if (delay > PCI_RESET_WAIT)
+				pci_info(dev, "ready %dms after %s\n",
+					 delay - 1, reset_type);
+			break;
+		}
+
 		if (delay > timeout) {
 			pci_warn(dev, "not ready %dms after %s; giving up\n",
 				 delay - 1, reset_type);
 			return -ENOTTY;
 		}
 
-		if (delay > PCI_RESET_WAIT)
+		if (delay > PCI_RESET_WAIT) {
+			if (!retrain) {
+				retrain = 1;
+				if (pcie_upstream_link_retrain(dev) == 0) {
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
@@ -4901,6 +5043,8 @@ static bool pcie_wait_for_link_delay(str
 		msleep(10);
 		timeout -= 10;
 	}
+	if (active && !ret)
+		ret = pcie_downstream_link_retrain(pdev) == 0;
 	if (active && ret)
 		msleep(delay);
 
Index: linux-macro/drivers/pci/pci.h
===================================================================
--- linux-macro.orig/drivers/pci/pci.h
+++ linux-macro/drivers/pci/pci.h
@@ -37,6 +37,7 @@ int pci_mmap_fits(struct pci_dev *pdev,
 		  enum pci_mmap_api mmap_api);
 
 bool pci_reset_supported(struct pci_dev *dev);
+int pcie_downstream_link_retrain(struct pci_dev *dev);
 void pci_init_reset_methods(struct pci_dev *dev);
 int pci_bridge_secondary_bus_reset(struct pci_dev *dev);
 int pci_bus_error_reset(struct pci_dev *dev);
Index: linux-macro/drivers/pci/probe.c
===================================================================
--- linux-macro.orig/drivers/pci/probe.c
+++ linux-macro/drivers/pci/probe.c
@@ -2546,6 +2546,8 @@ void pci_device_add(struct pci_dev *dev,
 	dma_set_max_seg_size(&dev->dev, 65536);
 	dma_set_seg_boundary(&dev->dev, 0xffffffff);
 
+	pcie_downstream_link_retrain(dev);
+
 	/* Fix up broken headers */
 	pci_fixup_device(pci_fixup_header, dev);
 
