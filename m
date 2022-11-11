Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C704625CF8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:26:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N81Gn0TC3z3fVl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:26:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=fw5D8vTE;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ziGlwcK3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=fw5D8vTE;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ziGlwcK3;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80p85Cmyz3f6D
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:05:04 +1100 (AEDT)
Message-ID: <20221111122014.755178149@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=wQvlSyzCiWq4qPGjM0h6GVII+05+CelOP+QrbE9YOVQ=;
	b=fw5D8vTEf9OL/Hzxz50Ijd298/wbFchLIr8TMyRCskQnsWvuZwH85WDzYjyxa/PEEcm5S/
	jq140H9dPnla1HZ3agqexHNFjhhzevUEVMXErO41h9kt9fao5vPKasGbCjKy9taJBY6hzv
	yXdu189B1M6hsC3msYMEU/SeaOuNFVdBoPjU9PO6ZGO+f4orB+1BmljW6SgW5O74Z3rM4b
	QSHAkL0lksdoznJyZ5kTjUKaP+JCdBYlcsUUx2Evza+ALkmP6L3ImXtuKlCJSPLOwLVok0
	zz/njXuPPM0/spkdh7Z/3jQC9a2dfjIJeIQNNTOdDc1iR6SkzxFynpI0qJ0vhQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=wQvlSyzCiWq4qPGjM0h6GVII+05+CelOP+QrbE9YOVQ=;
	b=ziGlwcK3Nj4s7gB/ueyqfSNSgD74IeHz55tHp/olK9uxKE7YDq5psk3BkZY1xDx4OMxWIZ
	CVYs5Yt0p+c5FYCw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 20/39] PCI/MSI: Move pci_enable_msi() API to api.c
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:54:46 +0100 (CET)
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

To distangle the maze in msi.c all exported device-driver MSI APIs are now
to be grouped in one file, api.c.

Move pci_enable_msi() and make its kernel-doc comprehensive.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 drivers/pci/msi/api.c | 23 +++++++++++++++++++++++
 drivers/pci/msi/msi.c | 14 ++------------
 drivers/pci/msi/msi.h |  1 +
 3 files changed, 26 insertions(+), 12 deletions(-)
---
diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
index 7485942cbe5d..63d7f8f6a284 100644
--- a/drivers/pci/msi/api.c
+++ b/drivers/pci/msi/api.c
@@ -13,6 +13,29 @@
 #include "msi.h"
 
 /**
+ * pci_enable_msi() - Enable MSI interrupt mode on device
+ * @dev: the PCI device to operate on
+ *
+ * Legacy device driver API to enable MSI interrupts mode on device and
+ * allocate a single interrupt vector. On success, the allocated vector
+ * Linux IRQ will be saved at @dev->irq. The driver must invoke
+ * pci_disable_msi() on cleanup.
+ *
+ * NOTE: The newer pci_alloc_irq_vectors() / pci_free_irq_vectors() API
+ * pair should, in general, be used instead.
+ *
+ * Return: 0 on success, errno otherwise
+ */
+int pci_enable_msi(struct pci_dev *dev)
+{
+	int rc = __pci_enable_msi_range(dev, 1, 1, NULL);
+	if (rc < 0)
+		return rc;
+	return 0;
+}
+EXPORT_SYMBOL(pci_enable_msi);
+
+/**
  * pci_disable_msi() - Disable MSI interrupt mode on device
  * @dev: the PCI device to operate on
  *
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 4a1300b74518..98f07ad9af62 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -790,8 +790,8 @@ void pci_disable_msix(struct pci_dev *dev)
 }
 EXPORT_SYMBOL(pci_disable_msix);
 
-static int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec,
-				  struct irq_affinity *affd)
+int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec,
+			   struct irq_affinity *affd)
 {
 	int nvec;
 	int rc;
@@ -844,16 +844,6 @@ static int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec,
 	}
 }
 
-/* deprecated, don't use */
-int pci_enable_msi(struct pci_dev *dev)
-{
-	int rc = __pci_enable_msi_range(dev, 1, 1, NULL);
-	if (rc < 0)
-		return rc;
-	return 0;
-}
-EXPORT_SYMBOL(pci_enable_msi);
-
 static int __pci_enable_msix_range(struct pci_dev *dev,
 				   struct msix_entry *entries, int minvec,
 				   int maxvec, struct irq_affinity *affd,
diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
index 634879277349..00bb98d5bb0e 100644
--- a/drivers/pci/msi/msi.h
+++ b/drivers/pci/msi/msi.h
@@ -87,6 +87,7 @@ static inline __attribute_const__ u32 msi_multi_mask(struct msi_desc *desc)
 /* MSI internal functions invoked from the public APIs */
 void pci_msi_shutdown(struct pci_dev *dev);
 void pci_free_msi_irqs(struct pci_dev *dev);
+int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec, struct irq_affinity *affd);
 
 /* Legacy (!IRQDOMAIN) fallbacks */
 #ifdef CONFIG_PCI_MSI_ARCH_FALLBACKS

