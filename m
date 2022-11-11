Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2971D625CBE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:17:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N814c0MG6z3fDG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:17:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=oC1efg0/;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VBvji6Cx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=oC1efg0/;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VBvji6Cx;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80p15gT2z3fJD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:04:57 +1100 (AEDT)
Message-ID: <20221111122014.870888193@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=r4FcKRBwb0S/6DX5J7gWRuaqhtaapFFj+24TyV6TJ3Q=;
	b=oC1efg0/7x7qL8AThd8flu4wRif16nNAbDPPmci8lhL2eADwgyBsYfEPHZSyI4yt8S+KJs
	Fly00rs/559MEIcgi9Gpww+9i6Iy4cQ3IWLL7y6p4eOn3TnfrtdrN2roLpKG6K+9zqLY4v
	g1KKU7xm4GzvZba1B8TViWnJhxeB7nJLyuymIW3Ni5ndgdwq/NUfrTUVt45sm3FKPWkwHK
	3z1dwn6Fp7VjupcerdcMuAQAoVkB3fPh1EGTAU5atc2aHrIgDue3GqFMP23kj9jVwEFGY8
	CIsWWqG23OelAGykN8OM25EcPbMu1aReKe9VPoRftrGjpfFHeLaNv3kuAzWvyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=r4FcKRBwb0S/6DX5J7gWRuaqhtaapFFj+24TyV6TJ3Q=;
	b=VBvji6CxYo3GJQJlKIkZ/fYFOTR9TrLHNIQBSnUKIR7abDARxG+AtzidhVRS0UQrQpqhJD
	8rkdL7juWBEUqVBw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 22/39] PCI/MSI: Move pci_alloc_irq_vectors() to api.c
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:54:50 +0100 (CET)
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
Cc: , linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Jason Gunthorpe <jgg@mellanox.com>, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ahmed S. Darwish <darwi@linutronix.de>

To distangle the maze in msi.c, all exported device-driver MSI APIs are
now to be grouped in one file, api.c.

Make pci_alloc_irq_vectors() a real function instead of wrapper and add
proper kernel doc to it.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 drivers/pci/msi/api.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/pci.h   | 17 +++++++++--------
 2 files changed, 42 insertions(+), 8 deletions(-)
---
diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
index d48050555d55..1714905943fb 100644
--- a/drivers/pci/msi/api.c
+++ b/drivers/pci/msi/api.c
@@ -90,3 +90,36 @@ int pci_enable_msix_range(struct pci_dev *dev, struct msix_entry *entries,
 	return __pci_enable_msix_range(dev, entries, minvec, maxvec, NULL, 0);
 }
 EXPORT_SYMBOL(pci_enable_msix_range);
+
+/**
+ * pci_alloc_irq_vectors() - Allocate multiple device interrupt vectors
+ * @dev:      the PCI device to operate on
+ * @min_vecs: minimum required number of vectors (must be >= 1)
+ * @max_vecs: maximum desired number of vectors
+ * @flags:    One or more of:
+ *            %PCI_IRQ_MSIX      Allow trying MSI-X vector allocations
+ *            %PCI_IRQ_MSI       Allow trying MSI vector allocations
+ *            %PCI_IRQ_LEGACY    Allow trying legacy INTx interrupts, if
+ *                               and only if @min_vecs == 1
+ *            %PCI_IRQ_AFFINITY  Auto-manage IRQs affinity by spreading
+ *                               the vectors around available CPUs
+ *
+ * Allocate up to @max_vecs interrupt vectors on device. MSI-X irq
+ * vector allocation has a higher precedence over plain MSI, which has a
+ * higher precedence over legacy INTx emulation.
+ *
+ * Upon a successful allocation, the caller should use pci_irq_vector()
+ * to get the Linux IRQ number to be passed to request_threaded_irq().
+ * The driver must call pci_free_irq_vectors() on cleanup.
+ *
+ * Return: number of allocated vectors (which might be smaller than
+ * @max_vecs), -ENOSPC if less than @min_vecs interrupt vectors are
+ * available, other errnos otherwise.
+ */
+int pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
+			  unsigned int max_vecs, unsigned int flags)
+{
+	return pci_alloc_irq_vectors_affinity(dev, min_vecs, max_vecs,
+					      flags, NULL);
+}
+EXPORT_SYMBOL(pci_alloc_irq_vectors);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 2bda4a4e47e8..6a356a39ba94 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1553,6 +1553,8 @@ static inline int pci_enable_msix_exact(struct pci_dev *dev,
 		return rc;
 	return 0;
 }
+int pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
+			  unsigned int max_vecs, unsigned int flags);
 int pci_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
 				   unsigned int max_vecs, unsigned int flags,
 				   struct irq_affinity *affd);
@@ -1586,6 +1588,13 @@ pci_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
 		return 1;
 	return -ENOSPC;
 }
+static inline int
+pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
+		      unsigned int max_vecs, unsigned int flags)
+{
+	return pci_alloc_irq_vectors_affinity(dev, min_vecs, max_vecs,
+					      flags, NULL);
+}
 
 static inline void pci_free_irq_vectors(struct pci_dev *dev)
 {
@@ -1900,14 +1909,6 @@ pci_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
 }
 #endif /* CONFIG_PCI */
 
-static inline int
-pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
-		      unsigned int max_vecs, unsigned int flags)
-{
-	return pci_alloc_irq_vectors_affinity(dev, min_vecs, max_vecs, flags,
-					      NULL);
-}
-
 /* Include architecture-dependent settings and functions */
 
 #include <asm/pci.h>

