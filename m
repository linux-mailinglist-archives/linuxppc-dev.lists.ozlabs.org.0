Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC22625CD2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:19:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N816c2PpBz3f8w
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:19:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=D/KO6ish;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=agDEdkn3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=D/KO6ish;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=agDEdkn3;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80p20TRpz3fJH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:04:58 +1100 (AEDT)
Message-ID: <20221111122015.099461602@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=CkhwWSdGdGLLdzERFUfoG3NG0AhBrHuNhPbAZeB+IvI=;
	b=D/KO6ishfBlfCq11YH+Ofhy+P61hIKqceGKviXzQcvhX0F2xVoFUKMaucjWQOPHIBOtS0B
	/j/MU4IcPEAS0VdVZHkO+m3UpDZ7hTXF33/Ws3G36Ip5JRiX14aot8JnOG7L0U7Qq1Xlgj
	jjE4VymkIPiaEDau2j6yY/Sl8BqceSabP7pTCy9X4x6BTvRBxW/OT6bTntFuHWPwbPKT/V
	P1zatp5UOC1Uot6hhlrU4Qg82vOIZiBJdLZQcCmvdUdXk2TvgXRC20jIdiqB3/7836nSxW
	igL35SY8mpivrwl4VnRlxvfpssCjhZbbAJ3NJWotgixp4zcrki9BuKBYDFbLCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=CkhwWSdGdGLLdzERFUfoG3NG0AhBrHuNhPbAZeB+IvI=;
	b=agDEdkn3tqZvtSL/jqK2oB0oAy2H7vZ7hxPqegmfJc4ZGq2IGaAmYVus2CH/27QQDR0vBr
	OGs+tQD1dSzmRxCg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 26/39] PCI/MSI: Move pci_msix_vec_count() to api.c
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:54:56 +0100 (CET)
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

Move pci_msix_vec_count() and make its kernel-doc comprehensive.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 drivers/pci/msi/api.c | 20 ++++++++++++++++++++
 drivers/pci/msi/msi.c | 20 --------------------
 2 files changed, 20 insertions(+), 20 deletions(-)
---
diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
index 2ff2a9ccfc47..83ea38ffa116 100644
--- a/drivers/pci/msi/api.c
+++ b/drivers/pci/msi/api.c
@@ -60,6 +60,26 @@ void pci_disable_msi(struct pci_dev *dev)
 EXPORT_SYMBOL(pci_disable_msi);
 
 /**
+ * pci_msix_vec_count() - Get number of MSI-X interrupt vectors on device
+ * @dev: the PCI device to operate on
+ *
+ * Return: number of MSI-X interrupt vectors available on this device
+ * (i.e., the device's MSI-X capability structure "table size"), -EINVAL
+ * if the device is not MSI-X capable, other errnos otherwise.
+ */
+int pci_msix_vec_count(struct pci_dev *dev)
+{
+	u16 control;
+
+	if (!dev->msix_cap)
+		return -EINVAL;
+
+	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &control);
+	return msix_table_size(control);
+}
+EXPORT_SYMBOL(pci_msix_vec_count);
+
+/**
  * pci_enable_msix_range() - Enable MSI-X interrupt mode on device
  * @dev:     the PCI device to operate on
  * @entries: input/output parameter, array of MSI-X configuration entries
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index ed8caf5ac99f..1226d66da992 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -701,26 +701,6 @@ void pci_msi_shutdown(struct pci_dev *dev)
 	pcibios_alloc_irq(dev);
 }
 
-/**
- * pci_msix_vec_count - return the number of device's MSI-X table entries
- * @dev: pointer to the pci_dev data structure of MSI-X device function
- * This function returns the number of device's MSI-X table entries and
- * therefore the number of MSI-X vectors device is capable of sending.
- * It returns a negative errno if the device is not capable of sending MSI-X
- * interrupts.
- **/
-int pci_msix_vec_count(struct pci_dev *dev)
-{
-	u16 control;
-
-	if (!dev->msix_cap)
-		return -EINVAL;
-
-	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &control);
-	return msix_table_size(control);
-}
-EXPORT_SYMBOL(pci_msix_vec_count);
-
 static int __pci_enable_msix(struct pci_dev *dev, struct msix_entry *entries,
 			     int nvec, struct irq_affinity *affd, int flags)
 {

