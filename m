Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E434046AC44
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 23:38:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7JHJ6S4kz3dlJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 09:38:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YKghtY03;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=A1eH8lsr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=YKghtY03; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=A1eH8lsr; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7J3D4XrZz3bZj
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 09:27:52 +1100 (AEDT)
Message-ID: <20211206210224.710137730@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638829670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=ib3yuqujnroRqi+hLldSTb0C/KdcxiKhDFhBeAeajh8=;
 b=YKghtY03bcoLP8OvEUv6g9Jjx1TFo+pzmg+zViZrV9C1Zqdyd+udciNW1BVKPTuIL8Z+sh
 VkfSoebHJBGRLhECku0Xcu/1wA6jahAvvipQ9NOJi7sfSqnslLIaiWdUsi6UumMv8Ii0JT
 2DbzczPuytoquIUE4qI7a+Rs+3SZz2k8vJC78RhGv6O3a0yi2pFj1Gt6yYNlPg+9HE8EhD
 OMVLu3Q5kecJhaNaLyTGpaijaksYWeRdazPJXewvgHnUCQUGdmFPOc2DkNnsaNSCejEPc7
 IQlwWECz6/FR1cQY3Dggy4ASx4++0pFep56S/3oZez+mph5GyIICQFrfOQSrhQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638829670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=ib3yuqujnroRqi+hLldSTb0C/KdcxiKhDFhBeAeajh8=;
 b=A1eH8lsrzvvUb+UOPZHwegNVeviEvBxF3n2PgKLDm1Kz3CElL95PW6TVkRlKmYp31F7use
 sr1vtn736Uy7EoCw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 16/23] PCI/MSI: Split out CONFIG_PCI_MSI independent part
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:27:49 +0100 (CET)
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
 Ashok Raj <ashok.raj@intel.com>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
 Kevin Tian <kevin.tian@intel.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Cedric Le Goater <clg@kaod.org>,
 Kalle Valo <kvalo@codeaurora.org>, Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Marc Zygnier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These functions are required even when CONFIG_PCI_MSI is not set. Move them
to their own file.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
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
 
@@ -1493,40 +1491,3 @@ bool pci_dev_has_special_msi_domain(stru
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

