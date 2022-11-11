Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A34C625D0A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:29:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N81L60KzGz3fkx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:29:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ryg7ebz1;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ofJHjiRi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ryg7ebz1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ofJHjiRi;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80pD26Z4z3fKW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:05:08 +1100 (AEDT)
Message-ID: <20221111122014.640052354@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=kRlEyVKKnxgc8wl62QvRU5nn9b1AZrPtWorLrgk375w=;
	b=ryg7ebz1ONkJp0BcF1tctqW/uo0TmYwk0M6DtUb4Qn1AD8mgQ8aFowTJsj/fYjtGqjKQ6Y
	8pJ7TqZ5qm8LAYIPzt4XY2dea7aga7xIjPc/Gsr9KpqpHe2CjrS/7+ERr3KWCSzV/0A3+o
	cMavcFEzD5YtUPC6WgiK3TmqbNwhS4cWxO6S/w4fRL3w3GUHOtsmWyaoCGfI2kGsoW6Ebj
	f1zDZpAisWpCM5Vsxq+vr8maslsCRDHK1+2+7nG6eVFf93aDVuyNHvIdE5TNkzxEDun/Cc
	mU4CkGo/PQPzwlKHrGs9gY1ar04p8XRxdmoxmwkgEiyPWZeJekQ36NPz6A/4ug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=kRlEyVKKnxgc8wl62QvRU5nn9b1AZrPtWorLrgk375w=;
	b=ofJHjiRin0h7f5PMtU9l0xr54GINmGaThK/QZV+71VLlJINnxO9w97aT1aoGQ5bQKcTog+
	aFDIPBRjC7itWZBw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 18/39] PCI/MSI: Move mask and unmask helpers to msi.h
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:54:43 +0100 (CET)
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

The upcoming support for per device MSI interrupt domains needs to share
some of the inline helpers with the MSI implementation.

Move them to the header file.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 drivers/pci/msi/msi.c | 61 +--------------------------------------
 drivers/pci/msi/msi.h | 83 +++++++++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 74 insertions(+), 70 deletions(-)
---
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 160af9f01669..5c310df55d0d 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -16,7 +16,7 @@
 static int pci_msi_enable = 1;
 int pci_msi_ignore_mask;
 
-static noinline void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 set)
+void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 set)
 {
 	raw_spinlock_t *lock = &to_pci_dev(desc->dev)->msi_lock;
 	unsigned long flags;
@@ -32,65 +32,6 @@ static noinline void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 s
 	raw_spin_unlock_irqrestore(lock, flags);
 }
 
-static inline void pci_msi_mask(struct msi_desc *desc, u32 mask)
-{
-	pci_msi_update_mask(desc, 0, mask);
-}
-
-static inline void pci_msi_unmask(struct msi_desc *desc, u32 mask)
-{
-	pci_msi_update_mask(desc, mask, 0);
-}
-
-static inline void __iomem *pci_msix_desc_addr(struct msi_desc *desc)
-{
-	return desc->pci.mask_base + desc->msi_index * PCI_MSIX_ENTRY_SIZE;
-}
-
-/*
- * This internal function does not flush PCI writes to the device.  All
- * users must ensure that they read from the device before either assuming
- * that the device state is up to date, or returning out of this file.
- * It does not affect the msi_desc::msix_ctrl cache either. Use with care!
- */
-static void pci_msix_write_vector_ctrl(struct msi_desc *desc, u32 ctrl)
-{
-	void __iomem *desc_addr = pci_msix_desc_addr(desc);
-
-	if (desc->pci.msi_attrib.can_mask)
-		writel(ctrl, desc_addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
-}
-
-static inline void pci_msix_mask(struct msi_desc *desc)
-{
-	desc->pci.msix_ctrl |= PCI_MSIX_ENTRY_CTRL_MASKBIT;
-	pci_msix_write_vector_ctrl(desc, desc->pci.msix_ctrl);
-	/* Flush write to device */
-	readl(desc->pci.mask_base);
-}
-
-static inline void pci_msix_unmask(struct msi_desc *desc)
-{
-	desc->pci.msix_ctrl &= ~PCI_MSIX_ENTRY_CTRL_MASKBIT;
-	pci_msix_write_vector_ctrl(desc, desc->pci.msix_ctrl);
-}
-
-static void __pci_msi_mask_desc(struct msi_desc *desc, u32 mask)
-{
-	if (desc->pci.msi_attrib.is_msix)
-		pci_msix_mask(desc);
-	else
-		pci_msi_mask(desc, mask);
-}
-
-static void __pci_msi_unmask_desc(struct msi_desc *desc, u32 mask)
-{
-	if (desc->pci.msi_attrib.is_msix)
-		pci_msix_unmask(desc);
-	else
-		pci_msi_unmask(desc, mask);
-}
-
 /**
  * pci_msi_mask_irq - Generic IRQ chip callback to mask PCI/MSI interrupts
  * @data:	pointer to irqdata associated to that interrupt
diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
index fc92603b33e1..d8f62d911f08 100644
--- a/drivers/pci/msi/msi.h
+++ b/drivers/pci/msi/msi.h
@@ -8,21 +8,67 @@
 int pci_msi_setup_msi_irqs(struct pci_dev *dev, int nvec, int type);
 void pci_msi_teardown_msi_irqs(struct pci_dev *dev);
 
-#ifdef CONFIG_PCI_MSI_ARCH_FALLBACKS
-int pci_msi_legacy_setup_msi_irqs(struct pci_dev *dev, int nvec, int type);
-void pci_msi_legacy_teardown_msi_irqs(struct pci_dev *dev);
-#else
-static inline int pci_msi_legacy_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
+/* Mask/unmask helpers */
+void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 set);
+
+static inline void pci_msi_mask(struct msi_desc *desc, u32 mask)
 {
-	WARN_ON_ONCE(1);
-	return -ENODEV;
+	pci_msi_update_mask(desc, 0, mask);
 }
 
-static inline void pci_msi_legacy_teardown_msi_irqs(struct pci_dev *dev)
+static inline void pci_msi_unmask(struct msi_desc *desc, u32 mask)
 {
-	WARN_ON_ONCE(1);
+	pci_msi_update_mask(desc, mask, 0);
+}
+
+static inline void __iomem *pci_msix_desc_addr(struct msi_desc *desc)
+{
+	return desc->pci.mask_base + desc->msi_index * PCI_MSIX_ENTRY_SIZE;
+}
+
+/*
+ * This internal function does not flush PCI writes to the device.  All
+ * users must ensure that they read from the device before either assuming
+ * that the device state is up to date, or returning out of this file.
+ * It does not affect the msi_desc::msix_ctrl cache either. Use with care!
+ */
+static inline void pci_msix_write_vector_ctrl(struct msi_desc *desc, u32 ctrl)
+{
+	void __iomem *desc_addr = pci_msix_desc_addr(desc);
+
+	if (desc->pci.msi_attrib.can_mask)
+		writel(ctrl, desc_addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
+}
+
+static inline void pci_msix_mask(struct msi_desc *desc)
+{
+	desc->pci.msix_ctrl |= PCI_MSIX_ENTRY_CTRL_MASKBIT;
+	pci_msix_write_vector_ctrl(desc, desc->pci.msix_ctrl);
+	/* Flush write to device */
+	readl(desc->pci.mask_base);
+}
+
+static inline void pci_msix_unmask(struct msi_desc *desc)
+{
+	desc->pci.msix_ctrl &= ~PCI_MSIX_ENTRY_CTRL_MASKBIT;
+	pci_msix_write_vector_ctrl(desc, desc->pci.msix_ctrl);
+}
+
+static inline void __pci_msi_mask_desc(struct msi_desc *desc, u32 mask)
+{
+	if (desc->pci.msi_attrib.is_msix)
+		pci_msix_mask(desc);
+	else
+		pci_msi_mask(desc, mask);
+}
+
+static inline void __pci_msi_unmask_desc(struct msi_desc *desc, u32 mask)
+{
+	if (desc->pci.msi_attrib.is_msix)
+		pci_msix_unmask(desc);
+	else
+		pci_msi_unmask(desc, mask);
 }
-#endif
 
 /*
  * PCI 2.3 does not specify mask bits for each MSI interrupt.  Attempting to
@@ -37,3 +83,20 @@ static inline __attribute_const__ u32 msi_multi_mask(struct msi_desc *desc)
 		return 0xffffffff;
 	return (1 << (1 << desc->pci.msi_attrib.multi_cap)) - 1;
 }
+
+/* Legacy (!IRQDOMAIN) fallbacks */
+#ifdef CONFIG_PCI_MSI_ARCH_FALLBACKS
+int pci_msi_legacy_setup_msi_irqs(struct pci_dev *dev, int nvec, int type);
+void pci_msi_legacy_teardown_msi_irqs(struct pci_dev *dev);
+#else
+static inline int pci_msi_legacy_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
+{
+	WARN_ON_ONCE(1);
+	return -ENODEV;
+}
+
+static inline void pci_msi_legacy_teardown_msi_irqs(struct pci_dev *dev)
+{
+	WARN_ON_ONCE(1);
+}
+#endif

