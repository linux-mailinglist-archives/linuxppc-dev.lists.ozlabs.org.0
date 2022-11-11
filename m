Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AB9625CEC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:24:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N81Dn1cktz3fTN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:24:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cMGjLzZL;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=GqtozON3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cMGjLzZL;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=GqtozON3;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80p74t79z3fK7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:05:03 +1100 (AEDT)
Message-ID: <20221111122014.984490384@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=bxe0AjpBaoDMg06CufdaCUWamwxhkdwl4bTBiQjCzNI=;
	b=cMGjLzZLtmJIj58oYr5P3Ok8YQZLmzLoqv8TcqjtDHGQGStfIwRRz5FAYENf+XUzKGvFfS
	U1HqMwbCGOu0ahCBvnP2LQuO4FVRfi6O6k8841mBDJLItntDNq2ICHJfGF8UOnvYlFZE1u
	MX98Yle05T3N1FhK+437CoOLSQfAyuWBThsr5H67RoLT46/GqCnJG2QP2J6tNr1wDFi7CZ
	uGECO372Vzpln/6RAnJjnLmcyJnBJYPQkkFr8QpGCUaz1gFD7VWXhMt+ebnZbvAhE0jFBC
	vOwD7a/CNm1eMI6JXWXXhXxMeCiz1a0yK3djJ5QxUfmSDOqc5eODC3QC3m22Cg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=bxe0AjpBaoDMg06CufdaCUWamwxhkdwl4bTBiQjCzNI=;
	b=GqtozON3j5ddGqHse/b7ZFUeu9EaxdoXxaDKXGoeMNdAqhq3kEXBAFF/JTK28GaSU9IPnt
	NQvt0Gobxx0TOqBQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 24/39] PCI/MSI: Move pci_irq_vector() to api.c
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:54:53 +0100 (CET)
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

Move pci_irq_vector() and let its kernel-doc match the rest of the file.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 drivers/pci/msi/api.c | 23 +++++++++++++++++++++++
 drivers/pci/msi/msi.c | 24 ------------------------
 2 files changed, 23 insertions(+), 24 deletions(-)
---
diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
index 8546749afa6e..0f1ec87e3f9f 100644
--- a/drivers/pci/msi/api.c
+++ b/drivers/pci/msi/api.c
@@ -182,3 +182,26 @@ int pci_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
 	return nvecs;
 }
 EXPORT_SYMBOL(pci_alloc_irq_vectors_affinity);
+
+/**
+ * pci_irq_vector() - Get Linux IRQ number of a device interrupt vector
+ * @dev: the PCI device to operate on
+ * @nr:  device-relative interrupt vector index (0-based); has different
+ *       meanings, depending on interrupt mode
+ *         MSI-X        the index in the MSI-X vector table
+ *         MSI          the index of the enabled MSI vectors
+ *         INTx         must be 0
+ *
+ * Return: the Linux IRQ number, or -EINVAL if @nr is out of range
+ */
+int pci_irq_vector(struct pci_dev *dev, unsigned int nr)
+{
+	unsigned int irq;
+
+	if (!dev->msi_enabled && !dev->msix_enabled)
+		return !nr ? dev->irq : -EINVAL;
+
+	irq = msi_get_virq(&dev->dev, nr);
+	return irq ? irq : -EINVAL;
+}
+EXPORT_SYMBOL(pci_irq_vector);
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index a028774f438d..38ad2fe4b85c 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -900,30 +900,6 @@ void pci_free_irq_vectors(struct pci_dev *dev)
 EXPORT_SYMBOL(pci_free_irq_vectors);
 
 /**
- * pci_irq_vector - return Linux IRQ number of a device vector
- * @dev:	PCI device to operate on
- * @nr:		Interrupt vector index (0-based)
- *
- * @nr has the following meanings depending on the interrupt mode:
- *   MSI-X:	The index in the MSI-X vector table
- *   MSI:	The index of the enabled MSI vectors
- *   INTx:	Must be 0
- *
- * Return: The Linux interrupt number or -EINVAl if @nr is out of range.
- */
-int pci_irq_vector(struct pci_dev *dev, unsigned int nr)
-{
-	unsigned int irq;
-
-	if (!dev->msi_enabled && !dev->msix_enabled)
-		return !nr ? dev->irq : -EINVAL;
-
-	irq = msi_get_virq(&dev->dev, nr);
-	return irq ? irq : -EINVAL;
-}
-EXPORT_SYMBOL(pci_irq_vector);
-
-/**
  * pci_irq_get_affinity - return the affinity of a particular MSI vector
  * @dev:	PCI device to operate on
  * @nr:		device-relative interrupt vector index (0-based).

