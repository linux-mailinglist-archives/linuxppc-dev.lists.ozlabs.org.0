Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C89BE625D22
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:34:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N81SH429qz3gGT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:34:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XztcOFcD;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=0jC2qVnR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XztcOFcD;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=0jC2qVnR;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80pN4pGBz3fBQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:05:16 +1100 (AEDT)
Message-ID: <20221111122015.459089736@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=4WpT4DxJx79msSHfiBpfy36+MpLWop9m91H3PwQHhsw=;
	b=XztcOFcDxM49M45k9PTE/1k36ZiA6VNV5dpHbBjf2uXg/ah5CPVotTwa6TV93P4O+2yemV
	Syo6FMVfzyYfQWirZCviQ/nLdzJkvNLuyGXAEvUO66w3RDDPl4jPjPcSbmxHFSR5z/uML/
	y2caS967jflVd7HwOtwJN0ednEAU3jPpAwRoXWP4fYSnd/XwKn4thlMKZ/KtMiyr2wzRgA
	fcq5EIZ4CzzXGolnDwQyl84iWyypXfMxnDUqqx5UZiugUSI7QezYun3/RQKgyTfALjFXlj
	i9oICtLBfF9ecJLVQ9AawrF3OL6x99P/sR6CUhneHS/789Pi0nqvvZRzNAgtfA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=4WpT4DxJx79msSHfiBpfy36+MpLWop9m91H3PwQHhsw=;
	b=0jC2qVnRRiQ+XBJLy3wiPxQeeG3vbJUU5q7NonBcd7vZGec3mNfgtHuoxczVY/LP4H1WTx
	giOEt7HPy8YFFHAA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 32/39] PCI/MSI: Reorder functions in msi.c
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:55:06 +0100 (CET)
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Jason Gunthorpe <jgg@mellanox.com>, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ahmed S. Darwish <darwi@linutronix.de>

There is no way to navigate msi.c without banging the head against the wall
every now and then because MSI and MSI-X specific functions are
intermingled and the code flow is completely non-obvious.

Reorder everthing so common helpers, MSI and MSI-X specific functions are
grouped together.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/msi.c |  577 +++++++++++++++++++++++++-------------------------
 1 file changed, 295 insertions(+), 282 deletions(-)

--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -16,6 +16,97 @@
 int pci_msi_enable = 1;
 int pci_msi_ignore_mask;
 
+/**
+ * pci_msi_supported - check whether MSI may be enabled on a device
+ * @dev: pointer to the pci_dev data structure of MSI device function
+ * @nvec: how many MSIs have been requested?
+ *
+ * Look at global flags, the device itself, and its parent buses
+ * to determine if MSI/-X are supported for the device. If MSI/-X is
+ * supported return 1, else return 0.
+ **/
+static int pci_msi_supported(struct pci_dev *dev, int nvec)
+{
+	struct pci_bus *bus;
+
+	/* MSI must be globally enabled and supported by the device */
+	if (!pci_msi_enable)
+		return 0;
+
+	if (!dev || dev->no_msi)
+		return 0;
+
+	/*
+	 * You can't ask to have 0 or less MSIs configured.
+	 *  a) it's stupid ..
+	 *  b) the list manipulation code assumes nvec >= 1.
+	 */
+	if (nvec < 1)
+		return 0;
+
+	/*
+	 * Any bridge which does NOT route MSI transactions from its
+	 * secondary bus to its primary bus must set NO_MSI flag on
+	 * the secondary pci_bus.
+	 *
+	 * The NO_MSI flag can either be set directly by:
+	 * - arch-specific PCI host bus controller drivers (deprecated)
+	 * - quirks for specific PCI bridges
+	 *
+	 * or indirectly by platform-specific PCI host bridge drivers by
+	 * advertising the 'msi_domain' property, which results in
+	 * the NO_MSI flag when no MSI domain is found for this bridge
+	 * at probe time.
+	 */
+	for (bus = dev->bus; bus; bus = bus->parent)
+		if (bus->bus_flags & PCI_BUS_FLAGS_NO_MSI)
+			return 0;
+
+	return 1;
+}
+
+static void pcim_msi_release(void *pcidev)
+{
+	struct pci_dev *dev = pcidev;
+
+	dev->is_msi_managed = false;
+	pci_free_irq_vectors(dev);
+}
+
+/*
+ * Needs to be separate from pcim_release to prevent an ordering problem
+ * vs. msi_device_data_release() in the MSI core code.
+ */
+static int pcim_setup_msi_release(struct pci_dev *dev)
+{
+	int ret;
+
+	if (!pci_is_managed(dev) || dev->is_msi_managed)
+		return 0;
+
+	ret = devm_add_action(&dev->dev, pcim_msi_release, dev);
+	if (!ret)
+		dev->is_msi_managed = true;
+	return ret;
+}
+
+/*
+ * Ordering vs. devres: msi device data has to be installed first so that
+ * pcim_msi_release() is invoked before it on device release.
+ */
+static int pci_setup_msi_context(struct pci_dev *dev)
+{
+	int ret = msi_setup_device_data(&dev->dev);
+
+	if (!ret)
+		ret = pcim_setup_msi_release(dev);
+	return ret;
+}
+
+/*
+ * Helper functions for mask/unmask and MSI message handling
+ */
+
 void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 set)
 {
 	raw_spinlock_t *lock = &to_pci_dev(desc->dev)->msi_lock;
@@ -163,15 +254,8 @@ void pci_write_msi_msg(unsigned int irq,
 }
 EXPORT_SYMBOL_GPL(pci_write_msi_msg);
 
-void pci_free_msi_irqs(struct pci_dev *dev)
-{
-	pci_msi_teardown_msi_irqs(dev);
 
-	if (dev->msix_base) {
-		iounmap(dev->msix_base);
-		dev->msix_base = NULL;
-	}
-}
+/* PCI/MSI specific functionality */
 
 static void pci_intx_for_msi(struct pci_dev *dev, int enable)
 {
@@ -190,111 +274,6 @@ static void pci_msi_set_enable(struct pc
 	pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, control);
 }
 
-/*
- * Architecture override returns true when the PCI MSI message should be
- * written by the generic restore function.
- */
-bool __weak arch_restore_msi_irqs(struct pci_dev *dev)
-{
-	return true;
-}
-
-void __pci_restore_msi_state(struct pci_dev *dev)
-{
-	struct msi_desc *entry;
-	u16 control;
-
-	if (!dev->msi_enabled)
-		return;
-
-	entry = irq_get_msi_desc(dev->irq);
-
-	pci_intx_for_msi(dev, 0);
-	pci_msi_set_enable(dev, 0);
-	if (arch_restore_msi_irqs(dev))
-		__pci_write_msi_msg(entry, &entry->msg);
-
-	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &control);
-	pci_msi_update_mask(entry, 0, 0);
-	control &= ~PCI_MSI_FLAGS_QSIZE;
-	control |= (entry->pci.msi_attrib.multiple << 4) | PCI_MSI_FLAGS_ENABLE;
-	pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, control);
-}
-
-static void pci_msix_clear_and_set_ctrl(struct pci_dev *dev, u16 clear, u16 set)
-{
-	u16 ctrl;
-
-	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &ctrl);
-	ctrl &= ~clear;
-	ctrl |= set;
-	pci_write_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, ctrl);
-}
-
-void __pci_restore_msix_state(struct pci_dev *dev)
-{
-	struct msi_desc *entry;
-	bool write_msg;
-
-	if (!dev->msix_enabled)
-		return;
-
-	/* route the table */
-	pci_intx_for_msi(dev, 0);
-	pci_msix_clear_and_set_ctrl(dev, 0,
-				PCI_MSIX_FLAGS_ENABLE | PCI_MSIX_FLAGS_MASKALL);
-
-	write_msg = arch_restore_msi_irqs(dev);
-
-	msi_lock_descs(&dev->dev);
-	msi_for_each_desc(entry, &dev->dev, MSI_DESC_ALL) {
-		if (write_msg)
-			__pci_write_msi_msg(entry, &entry->msg);
-		pci_msix_write_vector_ctrl(entry, entry->pci.msix_ctrl);
-	}
-	msi_unlock_descs(&dev->dev);
-
-	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_MASKALL, 0);
-}
-
-static void pcim_msi_release(void *pcidev)
-{
-	struct pci_dev *dev = pcidev;
-
-	dev->is_msi_managed = false;
-	pci_free_irq_vectors(dev);
-}
-
-/*
- * Needs to be separate from pcim_release to prevent an ordering problem
- * vs. msi_device_data_release() in the MSI core code.
- */
-static int pcim_setup_msi_release(struct pci_dev *dev)
-{
-	int ret;
-
-	if (!pci_is_managed(dev) || dev->is_msi_managed)
-		return 0;
-
-	ret = devm_add_action(&dev->dev, pcim_msi_release, dev);
-	if (!ret)
-		dev->is_msi_managed = true;
-	return ret;
-}
-
-/*
- * Ordering vs. devres: msi device data has to be installed first so that
- * pcim_msi_release() is invoked before it on device release.
- */
-static int pci_setup_msi_context(struct pci_dev *dev)
-{
-	int ret = msi_setup_device_data(&dev->dev);
-
-	if (!ret)
-		ret = pcim_setup_msi_release(dev);
-	return ret;
-}
-
 static int msi_setup_msi_desc(struct pci_dev *dev, int nvec,
 			      struct irq_affinity_desc *masks)
 {
@@ -415,6 +394,149 @@ static int msi_capability_init(struct pc
 	return ret;
 }
 
+int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec,
+			   struct irq_affinity *affd)
+{
+	int nvec;
+	int rc;
+
+	if (!pci_msi_supported(dev, minvec) || dev->current_state != PCI_D0)
+		return -EINVAL;
+
+	/* Check whether driver already requested MSI-X IRQs */
+	if (dev->msix_enabled) {
+		pci_info(dev, "can't enable MSI (MSI-X already enabled)\n");
+		return -EINVAL;
+	}
+
+	if (maxvec < minvec)
+		return -ERANGE;
+
+	if (WARN_ON_ONCE(dev->msi_enabled))
+		return -EINVAL;
+
+	nvec = pci_msi_vec_count(dev);
+	if (nvec < 0)
+		return nvec;
+	if (nvec < minvec)
+		return -ENOSPC;
+
+	if (nvec > maxvec)
+		nvec = maxvec;
+
+	rc = pci_setup_msi_context(dev);
+	if (rc)
+		return rc;
+
+	for (;;) {
+		if (affd) {
+			nvec = irq_calc_affinity_vectors(minvec, nvec, affd);
+			if (nvec < minvec)
+				return -ENOSPC;
+		}
+
+		rc = msi_capability_init(dev, nvec, affd);
+		if (rc == 0)
+			return nvec;
+
+		if (rc < 0)
+			return rc;
+		if (rc < minvec)
+			return -ENOSPC;
+
+		nvec = rc;
+	}
+}
+
+/**
+ * pci_msi_vec_count - Return the number of MSI vectors a device can send
+ * @dev: device to report about
+ *
+ * This function returns the number of MSI vectors a device requested via
+ * Multiple Message Capable register. It returns a negative errno if the
+ * device is not capable sending MSI interrupts. Otherwise, the call succeeds
+ * and returns a power of two, up to a maximum of 2^5 (32), according to the
+ * MSI specification.
+ **/
+int pci_msi_vec_count(struct pci_dev *dev)
+{
+	int ret;
+	u16 msgctl;
+
+	if (!dev->msi_cap)
+		return -EINVAL;
+
+	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &msgctl);
+	ret = 1 << ((msgctl & PCI_MSI_FLAGS_QMASK) >> 1);
+
+	return ret;
+}
+EXPORT_SYMBOL(pci_msi_vec_count);
+
+/*
+ * Architecture override returns true when the PCI MSI message should be
+ * written by the generic restore function.
+ */
+bool __weak arch_restore_msi_irqs(struct pci_dev *dev)
+{
+	return true;
+}
+
+void __pci_restore_msi_state(struct pci_dev *dev)
+{
+	struct msi_desc *entry;
+	u16 control;
+
+	if (!dev->msi_enabled)
+		return;
+
+	entry = irq_get_msi_desc(dev->irq);
+
+	pci_intx_for_msi(dev, 0);
+	pci_msi_set_enable(dev, 0);
+	if (arch_restore_msi_irqs(dev))
+		__pci_write_msi_msg(entry, &entry->msg);
+
+	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &control);
+	pci_msi_update_mask(entry, 0, 0);
+	control &= ~PCI_MSI_FLAGS_QSIZE;
+	control |= (entry->pci.msi_attrib.multiple << 4) | PCI_MSI_FLAGS_ENABLE;
+	pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, control);
+}
+
+void pci_msi_shutdown(struct pci_dev *dev)
+{
+	struct msi_desc *desc;
+
+	if (!pci_msi_enable || !dev || !dev->msi_enabled)
+		return;
+
+	pci_msi_set_enable(dev, 0);
+	pci_intx_for_msi(dev, 1);
+	dev->msi_enabled = 0;
+
+	/* Return the device with MSI unmasked as initial states */
+	desc = msi_first_desc(&dev->dev, MSI_DESC_ALL);
+	if (!WARN_ON_ONCE(!desc))
+		pci_msi_unmask(desc, msi_multi_mask(desc));
+
+	/* Restore dev->irq to its default pin-assertion IRQ */
+	dev->irq = desc->pci.msi_attrib.default_irq;
+	pcibios_alloc_irq(dev);
+}
+
+/* PCI/MSI-X specific functionality */
+
+static void pci_msix_clear_and_set_ctrl(struct pci_dev *dev, u16 clear, u16 set)
+{
+	u16 ctrl;
+
+	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &ctrl);
+	ctrl &= ~clear;
+	ctrl |= set;
+	pci_write_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, ctrl);
+}
+
 static void __iomem *msix_map_region(struct pci_dev *dev,
 				     unsigned int nr_entries)
 {
@@ -599,101 +721,6 @@ static int msix_capability_init(struct p
 	return ret;
 }
 
-/**
- * pci_msi_supported - check whether MSI may be enabled on a device
- * @dev: pointer to the pci_dev data structure of MSI device function
- * @nvec: how many MSIs have been requested?
- *
- * Look at global flags, the device itself, and its parent buses
- * to determine if MSI/-X are supported for the device. If MSI/-X is
- * supported return 1, else return 0.
- **/
-static int pci_msi_supported(struct pci_dev *dev, int nvec)
-{
-	struct pci_bus *bus;
-
-	/* MSI must be globally enabled and supported by the device */
-	if (!pci_msi_enable)
-		return 0;
-
-	if (!dev || dev->no_msi)
-		return 0;
-
-	/*
-	 * You can't ask to have 0 or less MSIs configured.
-	 *  a) it's stupid ..
-	 *  b) the list manipulation code assumes nvec >= 1.
-	 */
-	if (nvec < 1)
-		return 0;
-
-	/*
-	 * Any bridge which does NOT route MSI transactions from its
-	 * secondary bus to its primary bus must set NO_MSI flag on
-	 * the secondary pci_bus.
-	 *
-	 * The NO_MSI flag can either be set directly by:
-	 * - arch-specific PCI host bus controller drivers (deprecated)
-	 * - quirks for specific PCI bridges
-	 *
-	 * or indirectly by platform-specific PCI host bridge drivers by
-	 * advertising the 'msi_domain' property, which results in
-	 * the NO_MSI flag when no MSI domain is found for this bridge
-	 * at probe time.
-	 */
-	for (bus = dev->bus; bus; bus = bus->parent)
-		if (bus->bus_flags & PCI_BUS_FLAGS_NO_MSI)
-			return 0;
-
-	return 1;
-}
-
-/**
- * pci_msi_vec_count - Return the number of MSI vectors a device can send
- * @dev: device to report about
- *
- * This function returns the number of MSI vectors a device requested via
- * Multiple Message Capable register. It returns a negative errno if the
- * device is not capable sending MSI interrupts. Otherwise, the call succeeds
- * and returns a power of two, up to a maximum of 2^5 (32), according to the
- * MSI specification.
- **/
-int pci_msi_vec_count(struct pci_dev *dev)
-{
-	int ret;
-	u16 msgctl;
-
-	if (!dev->msi_cap)
-		return -EINVAL;
-
-	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &msgctl);
-	ret = 1 << ((msgctl & PCI_MSI_FLAGS_QMASK) >> 1);
-
-	return ret;
-}
-EXPORT_SYMBOL(pci_msi_vec_count);
-
-void pci_msi_shutdown(struct pci_dev *dev)
-{
-	struct msi_desc *desc;
-
-	if (!pci_msi_enable || !dev || !dev->msi_enabled)
-		return;
-
-	pci_msi_set_enable(dev, 0);
-	pci_intx_for_msi(dev, 1);
-	dev->msi_enabled = 0;
-
-	/* Return the device with MSI unmasked as initial states */
-	desc = msi_first_desc(&dev->dev, MSI_DESC_ALL);
-	if (!WARN_ON_ONCE(!desc))
-		pci_msi_unmask(desc, msi_multi_mask(desc));
-
-	/* Restore dev->irq to its default pin-assertion IRQ */
-	dev->irq = desc->pci.msi_attrib.default_irq;
-	pcibios_alloc_irq(dev);
-}
-
 static int __pci_enable_msix(struct pci_dev *dev, struct msix_entry *entries,
 			     int nvec, struct irq_affinity *affd, int flags)
 {
@@ -729,57 +756,23 @@ static int __pci_enable_msix(struct pci_
 	return msix_capability_init(dev, entries, nvec, affd);
 }
 
-void pci_msix_shutdown(struct pci_dev *dev)
-{
-	struct msi_desc *desc;
-
-	if (!pci_msi_enable || !dev || !dev->msix_enabled)
-		return;
-
-	if (pci_dev_is_disconnected(dev)) {
-		dev->msix_enabled = 0;
-		return;
-	}
-
-	/* Return the device with MSI-X masked as initial states */
-	msi_for_each_desc(desc, &dev->dev, MSI_DESC_ALL)
-		pci_msix_mask(desc);
-
-	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_ENABLE, 0);
-	pci_intx_for_msi(dev, 1);
-	dev->msix_enabled = 0;
-	pcibios_alloc_irq(dev);
-}
-
-int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec,
-			   struct irq_affinity *affd)
+int __pci_enable_msix_range(struct pci_dev *dev,
+			    struct msix_entry *entries, int minvec,
+			    int maxvec, struct irq_affinity *affd,
+			    int flags)
 {
-	int nvec;
-	int rc;
-
-	if (!pci_msi_supported(dev, minvec) || dev->current_state != PCI_D0)
-		return -EINVAL;
-
-	/* Check whether driver already requested MSI-X IRQs */
-	if (dev->msix_enabled) {
-		pci_info(dev, "can't enable MSI (MSI-X already enabled)\n");
-		return -EINVAL;
-	}
+	int rc, nvec = maxvec;
 
 	if (maxvec < minvec)
 		return -ERANGE;
 
-	if (WARN_ON_ONCE(dev->msi_enabled))
+	if (dev->msi_enabled) {
+		pci_info(dev, "can't enable MSI-X (MSI already enabled)\n");
 		return -EINVAL;
+	}
 
-	nvec = pci_msi_vec_count(dev);
-	if (nvec < 0)
-		return nvec;
-	if (nvec < minvec)
-		return -ENOSPC;
-
-	if (nvec > maxvec)
-		nvec = maxvec;
+	if (WARN_ON_ONCE(dev->msix_enabled))
+		return -EINVAL;
 
 	rc = pci_setup_msi_context(dev);
 	if (rc)
@@ -792,7 +785,7 @@ int __pci_enable_msi_range(struct pci_de
 				return -ENOSPC;
 		}
 
-		rc = msi_capability_init(dev, nvec, affd);
+		rc = __pci_enable_msix(dev, entries, nvec, affd, flags);
 		if (rc == 0)
 			return nvec;
 
@@ -805,48 +798,68 @@ int __pci_enable_msi_range(struct pci_de
 	}
 }
 
-int __pci_enable_msix_range(struct pci_dev *dev,
-			    struct msix_entry *entries, int minvec,
-			    int maxvec, struct irq_affinity *affd,
-			    int flags)
+void __pci_restore_msix_state(struct pci_dev *dev)
 {
-	int rc, nvec = maxvec;
+	struct msi_desc *entry;
+	bool write_msg;
 
-	if (maxvec < minvec)
-		return -ERANGE;
+	if (!dev->msix_enabled)
+		return;
 
-	if (dev->msi_enabled) {
-		pci_info(dev, "can't enable MSI-X (MSI already enabled)\n");
-		return -EINVAL;
+	/* route the table */
+	pci_intx_for_msi(dev, 0);
+	pci_msix_clear_and_set_ctrl(dev, 0,
+				PCI_MSIX_FLAGS_ENABLE | PCI_MSIX_FLAGS_MASKALL);
+
+	write_msg = arch_restore_msi_irqs(dev);
+
+	msi_lock_descs(&dev->dev);
+	msi_for_each_desc(entry, &dev->dev, MSI_DESC_ALL) {
+		if (write_msg)
+			__pci_write_msi_msg(entry, &entry->msg);
+		pci_msix_write_vector_ctrl(entry, entry->pci.msix_ctrl);
 	}
+	msi_unlock_descs(&dev->dev);
 
-	if (WARN_ON_ONCE(dev->msix_enabled))
-		return -EINVAL;
+	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_MASKALL, 0);
+}
 
-	rc = pci_setup_msi_context(dev);
-	if (rc)
-		return rc;
+void pci_msix_shutdown(struct pci_dev *dev)
+{
+	struct msi_desc *desc;
 
-	for (;;) {
-		if (affd) {
-			nvec = irq_calc_affinity_vectors(minvec, nvec, affd);
-			if (nvec < minvec)
-				return -ENOSPC;
-		}
+	if (!pci_msi_enable || !dev || !dev->msix_enabled)
+		return;
 
-		rc = __pci_enable_msix(dev, entries, nvec, affd, flags);
-		if (rc == 0)
-			return nvec;
+	if (pci_dev_is_disconnected(dev)) {
+		dev->msix_enabled = 0;
+		return;
+	}
 
-		if (rc < 0)
-			return rc;
-		if (rc < minvec)
-			return -ENOSPC;
+	/* Return the device with MSI-X masked as initial states */
+	msi_for_each_desc(desc, &dev->dev, MSI_DESC_ALL)
+		pci_msix_mask(desc);
 
-		nvec = rc;
+	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_ENABLE, 0);
+	pci_intx_for_msi(dev, 1);
+	dev->msix_enabled = 0;
+	pcibios_alloc_irq(dev);
+}
+
+/* Common interfaces */
+
+void pci_free_msi_irqs(struct pci_dev *dev)
+{
+	pci_msi_teardown_msi_irqs(dev);
+
+	if (dev->msix_base) {
+		iounmap(dev->msix_base);
+		dev->msix_base = NULL;
 	}
 }
 
+/* Misc. infrastructure */
+
 struct pci_dev *msi_desc_to_pci_dev(struct msi_desc *desc)
 {
 	return to_pci_dev(desc->dev);

