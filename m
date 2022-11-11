Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B48B625D16
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:32:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N81Q66zwKz3g8G
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:32:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pRX56ARt;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AJ1J3mtq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pRX56ARt;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AJ1J3mtq;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80pN3PXYz3fKx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:05:16 +1100 (AEDT)
Message-ID: <20221111122014.927531290@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=uefv1SQ/kFaCIoG5nEqNjtgMsMbRPxf/+/AfGMMS3ME=;
	b=pRX56ARtPVj6OyQEIMCqiah6CjQfsbUUjLKE1htpO78jveI+lbUJsRZyFxv6ZjkAjUyoAN
	OmuwsBOTCOZcYbdo31sYBZJJ2JMMjsySbe+r7TtEcQbauOlB6obK1AaxPUm0xLZPC4vEfj
	fcveslvLUX0yyTCArZBpUr0GgvLaxk/Zt48uV76R6Xz6gsOtk073eqv6iPhtoDfylIPEcH
	5WvyxYOkjFBFl2nOpoe9vzRcON0FKzSVhz9TXniJi/Fp6trJaG8/k4uD/ZGjZ0rqx/oUuu
	l8gSGVtbJBM/cwnAWhdq2WZdx3Vm6vpnKMcgPrP6Bm73HGnTvINn1tgoOm64CA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=uefv1SQ/kFaCIoG5nEqNjtgMsMbRPxf/+/AfGMMS3ME=;
	b=AJ1J3mtq3gNBb0E5N58gtI7ISk9ECj7NVJw8fMFn44Fh4eLBVHxpY55lAGhoZtOWr1SC8R
	peJFrH/L1nyrdiAg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 23/39] PCI/MSI: Move pci_alloc_irq_vectors_affinity() to api.c
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:54:51 +0100 (CET)
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

Move pci_alloc_irq_vectors_affinity() and let its kernel-doc reference
pci_alloc_irq_vectors() documentation added in parent commit.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 drivers/pci/msi/api.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/pci/msi/msi.c | 65 +----------------------------------------------------
 2 files changed, 59 insertions(+), 65 deletions(-)
---
diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
index 1714905943fb..8546749afa6e 100644
--- a/drivers/pci/msi/api.c
+++ b/drivers/pci/msi/api.c
@@ -123,3 +123,62 @@ int pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
 					      flags, NULL);
 }
 EXPORT_SYMBOL(pci_alloc_irq_vectors);
+
+/**
+ * pci_alloc_irq_vectors_affinity() - Allocate multiple device interrupt
+ *                                    vectors with affinity requirements
+ * @dev:      the PCI device to operate on
+ * @min_vecs: minimum required number of vectors (must be >= 1)
+ * @max_vecs: maximum desired number of vectors
+ * @flags:    allocation flags, as in pci_alloc_irq_vectors()
+ * @affd:     affinity requirements (can be %NULL).
+ *
+ * Same as pci_alloc_irq_vectors(), but with the extra @affd parameter.
+ * Check that function docs, and &struct irq_affinity, for more details.
+ */
+int pci_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
+				   unsigned int max_vecs, unsigned int flags,
+				   struct irq_affinity *affd)
+{
+	struct irq_affinity msi_default_affd = {0};
+	int nvecs = -ENOSPC;
+
+	if (flags & PCI_IRQ_AFFINITY) {
+		if (!affd)
+			affd = &msi_default_affd;
+	} else {
+		if (WARN_ON(affd))
+			affd = NULL;
+	}
+
+	if (flags & PCI_IRQ_MSIX) {
+		nvecs = __pci_enable_msix_range(dev, NULL, min_vecs, max_vecs,
+						affd, flags);
+		if (nvecs > 0)
+			return nvecs;
+	}
+
+	if (flags & PCI_IRQ_MSI) {
+		nvecs = __pci_enable_msi_range(dev, min_vecs, max_vecs, affd);
+		if (nvecs > 0)
+			return nvecs;
+	}
+
+	/* use legacy IRQ if allowed */
+	if (flags & PCI_IRQ_LEGACY) {
+		if (min_vecs == 1 && dev->irq) {
+			/*
+			 * Invoke the affinity spreading logic to ensure that
+			 * the device driver can adjust queue configuration
+			 * for the single interrupt case.
+			 */
+			if (affd)
+				irq_create_affinity_masks(1, affd);
+			pci_intx(dev, 1);
+			return 1;
+		}
+	}
+
+	return nvecs;
+}
+EXPORT_SYMBOL(pci_alloc_irq_vectors_affinity);
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 6700ef1c734e..a028774f438d 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -887,71 +887,6 @@ int __pci_enable_msix_range(struct pci_dev *dev,
 }
 
 /**
- * pci_alloc_irq_vectors_affinity - allocate multiple IRQs for a device
- * @dev:		PCI device to operate on
- * @min_vecs:		minimum number of vectors required (must be >= 1)
- * @max_vecs:		maximum (desired) number of vectors
- * @flags:		flags or quirks for the allocation
- * @affd:		optional description of the affinity requirements
- *
- * Allocate up to @max_vecs interrupt vectors for @dev, using MSI-X or MSI
- * vectors if available, and fall back to a single legacy vector
- * if neither is available.  Return the number of vectors allocated,
- * (which might be smaller than @max_vecs) if successful, or a negative
- * error code on error. If less than @min_vecs interrupt vectors are
- * available for @dev the function will fail with -ENOSPC.
- *
- * To get the Linux IRQ number used for a vector that can be passed to
- * request_irq() use the pci_irq_vector() helper.
- */
-int pci_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
-				   unsigned int max_vecs, unsigned int flags,
-				   struct irq_affinity *affd)
-{
-	struct irq_affinity msi_default_affd = {0};
-	int nvecs = -ENOSPC;
-
-	if (flags & PCI_IRQ_AFFINITY) {
-		if (!affd)
-			affd = &msi_default_affd;
-	} else {
-		if (WARN_ON(affd))
-			affd = NULL;
-	}
-
-	if (flags & PCI_IRQ_MSIX) {
-		nvecs = __pci_enable_msix_range(dev, NULL, min_vecs, max_vecs,
-						affd, flags);
-		if (nvecs > 0)
-			return nvecs;
-	}
-
-	if (flags & PCI_IRQ_MSI) {
-		nvecs = __pci_enable_msi_range(dev, min_vecs, max_vecs, affd);
-		if (nvecs > 0)
-			return nvecs;
-	}
-
-	/* use legacy IRQ if allowed */
-	if (flags & PCI_IRQ_LEGACY) {
-		if (min_vecs == 1 && dev->irq) {
-			/*
-			 * Invoke the affinity spreading logic to ensure that
-			 * the device driver can adjust queue configuration
-			 * for the single interrupt case.
-			 */
-			if (affd)
-				irq_create_affinity_masks(1, affd);
-			pci_intx(dev, 1);
-			return 1;
-		}
-	}
-
-	return nvecs;
-}
-EXPORT_SYMBOL(pci_alloc_irq_vectors_affinity);
-
-/**
  * pci_free_irq_vectors - free previously allocated IRQs for a device
  * @dev:		PCI device to operate on
  *

