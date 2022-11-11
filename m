Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AA6625CF0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:25:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N81Fn2SzJz3fsr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:25:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OeXI2uBL;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9etn11z1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OeXI2uBL;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9etn11z1;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80p76HNsz3f7L
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:05:03 +1100 (AEDT)
Message-ID: <20221111122015.042870570@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=P/dAsiB53NJ/9QiJ4hqH6W6Pskq4afAJG9tsk8AaX0Q=;
	b=OeXI2uBL1i4cCBWgCLDCjfWVrO+TGW/TKKoqPVlW6nRd7XuB0IylCLK2nnOS3JJqj3KGI3
	woLnfcgLSwYHZfNTtZFOEzz/OUe8qmGOn1D/90O9/tMmcrTFbaxgcOkimW4wca31nX+6fC
	rNZqtK0XNoFRelFd/wWbFk4E84e8ezV7r/WBQN9qW/AlngbQicYTjPhvAEphKERN1UITqk
	j90JU0Ss2QQmTZzYyKyHXqECZWoRbVTbL4m6uUzQvH8hti+SyK0UoTlWAK8oD9ZKR1gLpM
	Rx1OR7SPtFM+tzdG9IJzLGeX4uVZOyPbm8AegMk+Ao7r2WOjtMa2HgjIieasKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=P/dAsiB53NJ/9QiJ4hqH6W6Pskq4afAJG9tsk8AaX0Q=;
	b=9etn11z13NPR3uOdAi/jxOseLod+YzmlXXfbgUMng69yMTgPSyiR5PWQM9MtTrhncoBb0J
	HEo73bvyvg7D2UBg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 25/39] PCI/MSI: Move pci_free_irq_vectors() to api.c
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:54:54 +0100 (CET)
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

Move pci_free_irq_vectors() and make its kernel-doc comprehensive.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 drivers/pci/msi/api.c | 15 +++++++++++++++
 drivers/pci/msi/msi.c | 13 -------------
 2 files changed, 15 insertions(+), 13 deletions(-)
---
diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
index 0f1ec87e3f9f..2ff2a9ccfc47 100644
--- a/drivers/pci/msi/api.c
+++ b/drivers/pci/msi/api.c
@@ -205,3 +205,18 @@ int pci_irq_vector(struct pci_dev *dev, unsigned int nr)
 	return irq ? irq : -EINVAL;
 }
 EXPORT_SYMBOL(pci_irq_vector);
+
+/**
+ * pci_free_irq_vectors() - Free previously allocated IRQs for a device
+ * @dev: the PCI device to operate on
+ *
+ * Undo the interrupt vector allocations and possible device MSI/MSI-X
+ * enablement earlier done through pci_alloc_irq_vectors_affinity() or
+ * pci_alloc_irq_vectors().
+ */
+void pci_free_irq_vectors(struct pci_dev *dev)
+{
+	pci_disable_msix(dev);
+	pci_disable_msi(dev);
+}
+EXPORT_SYMBOL(pci_free_irq_vectors);
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 38ad2fe4b85c..ed8caf5ac99f 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -887,19 +887,6 @@ int __pci_enable_msix_range(struct pci_dev *dev,
 }
 
 /**
- * pci_free_irq_vectors - free previously allocated IRQs for a device
- * @dev:		PCI device to operate on
- *
- * Undoes the allocations and enabling in pci_alloc_irq_vectors().
- */
-void pci_free_irq_vectors(struct pci_dev *dev)
-{
-	pci_disable_msix(dev);
-	pci_disable_msi(dev);
-}
-EXPORT_SYMBOL(pci_free_irq_vectors);
-
-/**
  * pci_irq_get_affinity - return the affinity of a particular MSI vector
  * @dev:	PCI device to operate on
  * @nr:		device-relative interrupt vector index (0-based).

