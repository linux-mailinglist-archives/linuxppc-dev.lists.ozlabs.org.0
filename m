Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D37625D0F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:31:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N81N64003z3f4d
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:31:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GCdtHiG1;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eTjnEvqL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GCdtHiG1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eTjnEvqL;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80pH23Pnz3f63
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:05:11 +1100 (AEDT)
Message-ID: <20221111122015.156785224@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=sTSauIHtQe8nkxj9vWG7an7hER/OZbQ0yiXscxhOHpY=;
	b=GCdtHiG1mb1fVSYh20ExvLEgwnR3bMna0MV/l5dzAxH4jfJF15HxOOhRez2F2sTkSkN2rE
	3/uBzQAfXv8r/lDQ/bQ0HAgpcTfjq2J2UDjO3iwycl2Q+jrsyJr//OwbLU2VIZLpxn2NRN
	adFz/JEvDxevHKf15fZHh1DU3NcrOADkt9ul5zltTwQQyKC0f0k5XT9RW50IgaQfty3oc8
	cLVj/5ydTRp0JAjS0IJeJ0iYQhdlGdk+zgCWfFHvaRjCbO4kQ+2PYWABD6ZZ/bNWOeJ1hF
	rJ9JtygHZ/oYVMg2RMhjmJlSJQwzKdf5qHoW7MyVyWQ09MLE5oq2DHddS4+qTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=sTSauIHtQe8nkxj9vWG7an7hER/OZbQ0yiXscxhOHpY=;
	b=eTjnEvqLANPRFPDzNmMJb0aixvOkBMzGLcVDG/D78BrlL+s4esd4umI5YvkWIFmjtWzfxv
	1qpBSZvBZJ+hbBAg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 27/39] PCI/MSI: Move pci_disable_msix() to api.c
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:54:58 +0100 (CET)
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

Move pci_disable_msix() and make its kernel-doc comprehensive.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 drivers/pci/msi/api.c | 24 ++++++++++++++++++++++++
 drivers/pci/msi/msi.c | 14 +-------------
 drivers/pci/msi/msi.h |  1 +
 3 files changed, 26 insertions(+), 13 deletions(-)
---
diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
index 83ea38ffa116..653a61868ae6 100644
--- a/drivers/pci/msi/api.c
+++ b/drivers/pci/msi/api.c
@@ -112,6 +112,30 @@ int pci_enable_msix_range(struct pci_dev *dev, struct msix_entry *entries,
 EXPORT_SYMBOL(pci_enable_msix_range);
 
 /**
+ * pci_disable_msix() - Disable MSI-X interrupt mode on device
+ * @dev: the PCI device to operate on
+ *
+ * Legacy device driver API to disable MSI-X interrupt mode on device,
+ * free earlier-allocated interrupt vectors, and restore INTx emulation.
+ * The PCI device Linux IRQ (@dev->irq) is restored to its default pin
+ * assertion IRQ. This is the cleanup pair of pci_enable_msix_range().
+ *
+ * NOTE: The newer pci_alloc_irq_vectors() / pci_free_irq_vectors() API
+ * pair should, in general, be used instead.
+ */
+void pci_disable_msix(struct pci_dev *dev)
+{
+	if (!pci_msi_enabled() || !dev || !dev->msix_enabled)
+		return;
+
+	msi_lock_descs(&dev->dev);
+	pci_msix_shutdown(dev);
+	pci_free_msi_irqs(dev);
+	msi_unlock_descs(&dev->dev);
+}
+EXPORT_SYMBOL(pci_disable_msix);
+
+/**
  * pci_alloc_irq_vectors() - Allocate multiple device interrupt vectors
  * @dev:      the PCI device to operate on
  * @min_vecs: minimum required number of vectors (must be >= 1)
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 1226d66da992..6fa90d07d2e4 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -736,7 +736,7 @@ static int __pci_enable_msix(struct pci_dev *dev, struct msix_entry *entries,
 	return msix_capability_init(dev, entries, nvec, affd);
 }
 
-static void pci_msix_shutdown(struct pci_dev *dev)
+void pci_msix_shutdown(struct pci_dev *dev)
 {
 	struct msi_desc *desc;
 
@@ -758,18 +758,6 @@ static void pci_msix_shutdown(struct pci_dev *dev)
 	pcibios_alloc_irq(dev);
 }
 
-void pci_disable_msix(struct pci_dev *dev)
-{
-	if (!pci_msi_enable || !dev || !dev->msix_enabled)
-		return;
-
-	msi_lock_descs(&dev->dev);
-	pci_msix_shutdown(dev);
-	pci_free_msi_irqs(dev);
-	msi_unlock_descs(&dev->dev);
-}
-EXPORT_SYMBOL(pci_disable_msix);
-
 int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec,
 			   struct irq_affinity *affd)
 {
diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
index 8c4a5289432d..77e2587f7e4f 100644
--- a/drivers/pci/msi/msi.h
+++ b/drivers/pci/msi/msi.h
@@ -86,6 +86,7 @@ static inline __attribute_const__ u32 msi_multi_mask(struct msi_desc *desc)
 
 /* MSI internal functions invoked from the public APIs */
 void pci_msi_shutdown(struct pci_dev *dev);
+void pci_msix_shutdown(struct pci_dev *dev);
 void pci_free_msi_irqs(struct pci_dev *dev);
 int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec, struct irq_affinity *affd);
 int __pci_enable_msix_range(struct pci_dev *dev, struct msix_entry *entries, int minvec,

