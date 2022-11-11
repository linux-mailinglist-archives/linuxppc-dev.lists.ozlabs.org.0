Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6C2625CD9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:22:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N819m5BjZz3fCn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:22:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=u0MBwOKf;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yM3dN0j6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=u0MBwOKf;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yM3dN0j6;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80p46cxHz3dvm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:05:00 +1100 (AEDT)
Message-ID: <20221111122015.331584998@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=17rQ88vsZDtlPmncoLd4F1WtMoDw5uG6QE6awHFzEIw=;
	b=u0MBwOKfdKIjVYsMnyfBs1VTZDXJEX6DuRpL7pKRU7BC7LYQGVWXa3TmnszJmKSgH0051K
	OtzIlEYeXodSuQoLNocXCVjSNJ+SgKfEAeXuS+64VjLc4GPurIWeeRHa/RRkj7DvlLMz63
	0E/LNoqZcMdHj7I03PLUzpPAk0nNuDtVGV0syPSnWCo1HSXjsr/Do7sHxw7mBxdBdzj41H
	zYliO7BNOl/ULvKU3DrQsE0n8X9U9rQ64Pi/Xy1uzv7lY0jO0j/y3V/2yvzS+fX30EUVaF
	iQ3hOSlA943JC+BvTCqBq/hIeuk9COv4UtayBK3AXOCrIBZBpde6Ui88XR3MVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=17rQ88vsZDtlPmncoLd4F1WtMoDw5uG6QE6awHFzEIw=;
	b=yM3dN0j6bNW9WtIT9LkNs9RYaMlN3S1D8j/YyTsQdLKC9l8Stsx3vyIB4R3Y33YnomF1gB
	ueyboCuUeHb+1ACQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 30/39] PCI/MSI: Move pci_msi_restore_state() to api.c
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:55:03 +0100 (CET)
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
    
Move pci_msi_enabled() and add kernel-doc for the function.
    
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
index ee9ed5ccd94d..8d1cf6db9bd7 100644
--- a/drivers/pci/msi/api.c
+++ b/drivers/pci/msi/api.c
@@ -308,6 +308,21 @@ void pci_free_irq_vectors(struct pci_dev *dev)
 }
 EXPORT_SYMBOL(pci_free_irq_vectors);
 
+/**
+ * pci_restore_msi_state() - Restore cached MSI(-X) state on device
+ * @dev: the PCI device to operate on
+ *
+ * Write the Linux-cached MSI(-X) state back on device. This is
+ * typically useful upon system resume, or after an error-recovery PCI
+ * adapter reset.
+ */
+void pci_restore_msi_state(struct pci_dev *dev)
+{
+	__pci_restore_msi_state(dev);
+	__pci_restore_msix_state(dev);
+}
+EXPORT_SYMBOL_GPL(pci_restore_msi_state);
+
 /**
  * pci_msi_enabled() - Are MSI(-X) interrupts enabled system-wide?
  *
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 59c33bc7fe81..a5d168c823ff 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -199,7 +199,7 @@ bool __weak arch_restore_msi_irqs(struct pci_dev *dev)
 	return true;
 }
 
-static void __pci_restore_msi_state(struct pci_dev *dev)
+void __pci_restore_msi_state(struct pci_dev *dev)
 {
 	struct msi_desc *entry;
 	u16 control;
@@ -231,7 +231,7 @@ static void pci_msix_clear_and_set_ctrl(struct pci_dev *dev, u16 clear, u16 set)
 	pci_write_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, ctrl);
 }
 
-static void __pci_restore_msix_state(struct pci_dev *dev)
+void __pci_restore_msix_state(struct pci_dev *dev)
 {
 	struct msi_desc *entry;
 	bool write_msg;
@@ -257,13 +257,6 @@ static void __pci_restore_msix_state(struct pci_dev *dev)
 	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_MASKALL, 0);
 }
 
-void pci_restore_msi_state(struct pci_dev *dev)
-{
-	__pci_restore_msi_state(dev);
-	__pci_restore_msix_state(dev);
-}
-EXPORT_SYMBOL_GPL(pci_restore_msi_state);
-
 static void pcim_msi_release(void *pcidev)
 {
 	struct pci_dev *dev = pcidev;
diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
index f3f4ede53171..8170ef2c5ad0 100644
--- a/drivers/pci/msi/msi.h
+++ b/drivers/pci/msi/msi.h
@@ -94,6 +94,8 @@ void pci_free_msi_irqs(struct pci_dev *dev);
 int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec, struct irq_affinity *affd);
 int __pci_enable_msix_range(struct pci_dev *dev, struct msix_entry *entries, int minvec,
 			    int maxvec,  struct irq_affinity *affd, int flags);
+void __pci_restore_msi_state(struct pci_dev *dev);
+void __pci_restore_msix_state(struct pci_dev *dev);
 
 /* Legacy (!IRQDOMAIN) fallbacks */
 

