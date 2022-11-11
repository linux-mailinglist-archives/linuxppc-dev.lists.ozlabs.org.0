Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F50B625CFB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:27:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N81Hx2tscz3fGL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:27:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XKPL2kgf;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=U39CZCre;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XKPL2kgf;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=U39CZCre;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80pB5Lhqz3fBQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:05:06 +1100 (AEDT)
Message-ID: <20221111122015.214792769@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=gj8+JLvsSB7JkfjvtAibAPolzK16OEvGxNAST4u+PB8=;
	b=XKPL2kgfTpBrkdRq/Zqnr5TZtcoLiZS8HUTfm0kQkuYgegQYsqUwtY5csl9/CyJkrPrCEz
	A9uxOuIvrfntnY2DKbdKMXmf4ksC0QTVqS9OdMAlOAOQgCdzLXVMmX1JcCPAEBhdSB5mBf
	nhdD2+t2116iU5IqwotSXCD6AhM6aj2Y0RdnX73ut/xTahJDDpijcYHst0UpgmkbhE6eFJ
	UPSG4e0XWUziwhZY+cmfTYsgkNtc8sB9PEd/1aKnPYelYUCQtxFzSfMjWN7EeHPb0ht7Ss
	04ZIAgydyt5L4gwlXCajkYRprDuhpS7NFJtkyRCbyY3urky7Pc8pU8t+6DhEDA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=gj8+JLvsSB7JkfjvtAibAPolzK16OEvGxNAST4u+PB8=;
	b=U39CZCreXp6akmR3rKYVXRdbqs3XmuPdImd4hF/P0sSdCshaJKWtTXiiq6gHDDA3yj+rKA
	b2RkkjTtCy75QgDw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 28/39] PCI/MSI: Move pci_irq_get_affinity() to api.c
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:54:59 +0100 (CET)
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

To distangle the maze in msi.c, all exported device-driver MSI APIs are
now to be grouped in one file, api.c.

Move pci_irq_get_affinity() and let its kernel-doc match rest of the
file.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 drivers/pci/msi/api.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/msi/msi.c | 38 --------------------------------------
 2 files changed, 43 insertions(+), 38 deletions(-)
---
diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
index 653a61868ae6..473df7ba0584 100644
--- a/drivers/pci/msi/api.c
+++ b/drivers/pci/msi/api.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/irq.h>
 
 #include "msi.h"
 
@@ -251,6 +252,48 @@ int pci_irq_vector(struct pci_dev *dev, unsigned int nr)
 EXPORT_SYMBOL(pci_irq_vector);
 
 /**
+ * pci_irq_get_affinity() - Get a device interrupt vector affinity
+ * @dev: the PCI device to operate on
+ * @nr:  device-relative interrupt vector index (0-based); has different
+ *       meanings, depending on interrupt mode
+ *         MSI-X        the index in the MSI-X vector table
+ *         MSI          the index of the enabled MSI vectors
+ *         INTx         must be 0
+ *
+ * Return: MSI/MSI-X vector affinity, NULL if @nr is out of range or if
+ * the MSI(-X) vector was allocated without explicit affinity
+ * requirements (e.g., by pci_enable_msi(), pci_enable_msix_range(), or
+ * pci_alloc_irq_vectors() without the %PCI_IRQ_AFFINITY flag). Return a
+ * generic set of CPU ids representing all possible CPUs available
+ * during system boot if the device is in legacy INTx mode.
+ */
+const struct cpumask *pci_irq_get_affinity(struct pci_dev *dev, int nr)
+{
+	int idx, irq = pci_irq_vector(dev, nr);
+	struct msi_desc *desc;
+
+	if (WARN_ON_ONCE(irq <= 0))
+		return NULL;
+
+	desc = irq_get_msi_desc(irq);
+	/* Non-MSI does not have the information handy */
+	if (!desc)
+		return cpu_possible_mask;
+
+	/* MSI[X] interrupts can be allocated without affinity descriptor */
+	if (!desc->affinity)
+		return NULL;
+
+	/*
+	 * MSI has a mask array in the descriptor.
+	 * MSI-X has a single mask.
+	 */
+	idx = dev->msi_enabled ? nr : 0;
+	return &desc->affinity[idx].mask;
+}
+EXPORT_SYMBOL(pci_irq_get_affinity);
+
+/**
  * pci_free_irq_vectors() - Free previously allocated IRQs for a device
  * @dev: the PCI device to operate on
  *
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 6fa90d07d2e4..d78646d1c116 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -854,44 +854,6 @@ int __pci_enable_msix_range(struct pci_dev *dev,
 	}
 }
 
-/**
- * pci_irq_get_affinity - return the affinity of a particular MSI vector
- * @dev:	PCI device to operate on
- * @nr:		device-relative interrupt vector index (0-based).
- *
- * @nr has the following meanings depending on the interrupt mode:
- *   MSI-X:	The index in the MSI-X vector table
- *   MSI:	The index of the enabled MSI vectors
- *   INTx:	Must be 0
- *
- * Return: A cpumask pointer or NULL if @nr is out of range
- */
-const struct cpumask *pci_irq_get_affinity(struct pci_dev *dev, int nr)
-{
-	int idx, irq = pci_irq_vector(dev, nr);
-	struct msi_desc *desc;
-
-	if (WARN_ON_ONCE(irq <= 0))
-		return NULL;
-
-	desc = irq_get_msi_desc(irq);
-	/* Non-MSI does not have the information handy */
-	if (!desc)
-		return cpu_possible_mask;
-
-	/* MSI[X] interrupts can be allocated without affinity descriptor */
-	if (!desc->affinity)
-		return NULL;
-
-	/*
-	 * MSI has a mask array in the descriptor.
-	 * MSI-X has a single mask.
-	 */
-	idx = dev->msi_enabled ? nr : 0;
-	return &desc->affinity[idx].mask;
-}
-EXPORT_SYMBOL(pci_irq_get_affinity);
-
 struct pci_dev *msi_desc_to_pci_dev(struct msi_desc *desc)
 {
 	return to_pci_dev(desc->dev);

