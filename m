Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 953B445FB6A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 02:44:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1Dtn3Vpnz3fZJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 12:44:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kiIa3Wnk;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8oE5dILf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=kiIa3Wnk; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=8oE5dILf; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1DLF0PrDz3cNv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 12:19:49 +1100 (AEDT)
Message-ID: <20211126223825.034426787@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637975986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=/hUtpZoje77D8jXpCF4dVmu6dIuQVzxr12Tf8gEZrmw=;
 b=kiIa3WnklR7w/ZeDbikmw6N61xfDMfnL6ZU/pOOseNiVV+omr9Aa6z+0BVgtzFMBCu6iMQ
 zKsikuo1zFVGhoKSmUIEASSuBkvEd3ptUL2iOJdMyQ3DpnQuo+VIo5ifVixMvFUEzvNoNu
 3f2nitVyliW8P6TzXAaFW55/Jm1WCxDf99/Fz3p6iH3FrRJBfIjc+FJfNcFSu5JrTV/hOF
 5vLWCzkgjOJjajXnssaIYKp5J8LS4aL6X2YpJXn2eqN0373MUkl/B9A8NvGWVAer6wN7Qg
 Q3WpDV96QQDz3VHeQEjDnHcYO8c9rPbBEjBtYtLeg990OTmzjYCl3GKUZdmhyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637975986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=/hUtpZoje77D8jXpCF4dVmu6dIuQVzxr12Tf8gEZrmw=;
 b=8oE5dILfIppEOM4uSmv1UhhF+8V1aTl25VsmBDW8Y6mgtC2SCQ+c3AwBH+9jTQgu7f5Oe3
 TgJGtWPMxxBhbTDQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 16/22] PCI/MSI: Split out CONFIG_PCI_MSI independent part
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:19:45 +0100 (CET)
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
Cc: linux-hyperv@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Ashok Raj <ashok.raj@intel.com>, Marc Zygnier <maz@kernel.org>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org, Kevin Tian <kevin.tian@intel.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Megha Dey <megha.dey@intel.com>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These functions are required even when CONFIG_PCI_MSI is not set. Move them
to their own file.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/Makefile     |    3 ++-
 drivers/pci/msi/msi.c        |   39 ---------------------------------------
 drivers/pci/msi/pcidev_msi.c |   43 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 40 deletions(-)

--- a/drivers/pci/msi/Makefile
+++ b/drivers/pci/msi/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for the PCI/MSI
-obj-$(CONFIG_PCI)		+= msi.o
+obj-$(CONFIG_PCI)		+= pcidev_msi.o
+obj-$(CONFIG_PCI_MSI)		+= msi.o
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -18,8 +18,6 @@
 
 #include "../pci.h"
 
-#ifdef CONFIG_PCI_MSI
-
 static int pci_msi_enable = 1;
 int pci_msi_ignore_mask;
 
@@ -1479,40 +1477,3 @@ bool pci_dev_has_special_msi_domain(stru
 }
 
 #endif /* CONFIG_PCI_MSI_IRQ_DOMAIN */
-#endif /* CONFIG_PCI_MSI */
-
-void pci_msi_init(struct pci_dev *dev)
-{
-	u16 ctrl;
-
-	/*
-	 * Disable the MSI hardware to avoid screaming interrupts
-	 * during boot.  This is the power on reset default so
-	 * usually this should be a noop.
-	 */
-	dev->msi_cap = pci_find_capability(dev, PCI_CAP_ID_MSI);
-	if (!dev->msi_cap)
-		return;
-
-	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &ctrl);
-	if (ctrl & PCI_MSI_FLAGS_ENABLE)
-		pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS,
-				      ctrl & ~PCI_MSI_FLAGS_ENABLE);
-
-	if (!(ctrl & PCI_MSI_FLAGS_64BIT))
-		dev->no_64bit_msi = 1;
-}
-
-void pci_msix_init(struct pci_dev *dev)
-{
-	u16 ctrl;
-
-	dev->msix_cap = pci_find_capability(dev, PCI_CAP_ID_MSIX);
-	if (!dev->msix_cap)
-		return;
-
-	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &ctrl);
-	if (ctrl & PCI_MSIX_FLAGS_ENABLE)
-		pci_write_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS,
-				      ctrl & ~PCI_MSIX_FLAGS_ENABLE);
-}
--- /dev/null
+++ b/drivers/pci/msi/pcidev_msi.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MSI[X} related functions which are available unconditionally.
+ */
+#include "../pci.h"
+
+/*
+ * Disable the MSI[X] hardware to avoid screaming interrupts during boot.
+ * This is the power on reset default so usually this should be a noop.
+ */
+
+void pci_msi_init(struct pci_dev *dev)
+{
+	u16 ctrl;
+
+	dev->msi_cap = pci_find_capability(dev, PCI_CAP_ID_MSI);
+	if (!dev->msi_cap)
+		return;
+
+	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &ctrl);
+	if (ctrl & PCI_MSI_FLAGS_ENABLE) {
+		pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS,
+				      ctrl & ~PCI_MSI_FLAGS_ENABLE);
+	}
+
+	if (!(ctrl & PCI_MSI_FLAGS_64BIT))
+		dev->no_64bit_msi = 1;
+}
+
+void pci_msix_init(struct pci_dev *dev)
+{
+	u16 ctrl;
+
+	dev->msix_cap = pci_find_capability(dev, PCI_CAP_ID_MSIX);
+	if (!dev->msix_cap)
+		return;
+
+	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &ctrl);
+	if (ctrl & PCI_MSIX_FLAGS_ENABLE) {
+		pci_write_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS,
+				      ctrl & ~PCI_MSIX_FLAGS_ENABLE);
+	}
+}

