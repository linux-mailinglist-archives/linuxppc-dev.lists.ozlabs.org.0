Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 590D846AC51
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 23:39:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7JJB1G5Fz3fF3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 09:39:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=yogWCLCl;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xWk0QhW9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=yogWCLCl; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=xWk0QhW9; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7J3G57TSz3c53
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 09:27:54 +1100 (AEDT)
Message-ID: <20211206210224.763574089@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638829671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=yrY1ZB0NumM3iY3b+dL6tdvji5YdLo8YZzow0Pc98K0=;
 b=yogWCLClZ5HawXr86pUvSu27UdiujY09fLCr9qODZ6WHG6tdy1jo4R5oUed+NZBlb4D+aL
 7QpxacnGafJnNFuGA3Qr4uuaCUoNpqcC0RQIn/nv2i/ZqqOPRpDk41N3evYyZcNUIORUqQ
 RmyJmVXQ4SgC9OEaoFrfssQoJ8Xwn+4ZyexyySLnXH1jXW3w7H7gjCvNcp6z/9YZb3iZef
 SnjRI8A4v1jtxW1cvkAQLxfhlEO0mCCMG5y3BXvNH9MRSgIaMFqX4JKVHvpx5vMHBoS0Bb
 XHborQKOUtJXUnqPXT77WiZSbh3UWDmLFWdvo+NEVEOm05/Ol4MBGoFkTWQRhw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638829671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=yrY1ZB0NumM3iY3b+dL6tdvji5YdLo8YZzow0Pc98K0=;
 b=xWk0QhW9rvUKaVhvOUrP23TOY6t2RbQv3eb8/ILfXzb+qQTtu1Dgw8jDLlkSfce65pUPAy
 AUFj7t7KeK1aKUCQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 17/23] PCI/MSI: Split out !IRQDOMAIN code
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:27:51 +0100 (CET)
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

Split out the non irqdomain code into its own file.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
V2: Add proper includes and fix variable name - Cedric
---
 drivers/pci/msi/Makefile |    5 ++--
 drivers/pci/msi/legacy.c |   52 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/msi/msi.c    |   46 -----------------------------------------
 3 files changed, 55 insertions(+), 48 deletions(-)

--- a/drivers/pci/msi/Makefile
+++ b/drivers/pci/msi/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for the PCI/MSI
-obj-$(CONFIG_PCI)		+= pcidev_msi.o
-obj-$(CONFIG_PCI_MSI)		+= msi.o
+obj-$(CONFIG_PCI)			+= pcidev_msi.o
+obj-$(CONFIG_PCI_MSI)			+= msi.o
+obj-$(CONFIG_PCI_MSI_ARCH_FALLBACKS)	+= legacy.o
--- /dev/null
+++ b/drivers/pci/msi/legacy.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PCI Message Signaled Interrupt (MSI).
+ *
+ * Legacy architecture specific setup and teardown mechanism.
+ */
+#include <linux/msi.h>
+#include <linux/pci.h>
+
+/* Arch hooks */
+int __weak arch_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc)
+{
+	return -EINVAL;
+}
+
+void __weak arch_teardown_msi_irq(unsigned int irq)
+{
+}
+
+int __weak arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
+{
+	struct msi_desc *desc;
+	int ret;
+
+	/*
+	 * If an architecture wants to support multiple MSI, it needs to
+	 * override arch_setup_msi_irqs()
+	 */
+	if (type == PCI_CAP_ID_MSI && nvec > 1)
+		return 1;
+
+	for_each_pci_msi_entry(desc, dev) {
+		ret = arch_setup_msi_irq(dev, desc);
+		if (ret)
+			return ret < 0 ? ret : -ENOSPC;
+	}
+
+	return 0;
+}
+
+void __weak arch_teardown_msi_irqs(struct pci_dev *dev)
+{
+	struct msi_desc *desc;
+	int i;
+
+	for_each_pci_msi_entry(desc, dev) {
+		if (desc->irq) {
+			for (i = 0; i < desc->nvec_used; i++)
+				arch_teardown_msi_irq(desc->irq + i);
+		}
+	}
+}
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -50,52 +50,6 @@ static void pci_msi_teardown_msi_irqs(st
 #define pci_msi_teardown_msi_irqs	arch_teardown_msi_irqs
 #endif
 
-#ifdef CONFIG_PCI_MSI_ARCH_FALLBACKS
-/* Arch hooks */
-int __weak arch_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc)
-{
-	return -EINVAL;
-}
-
-void __weak arch_teardown_msi_irq(unsigned int irq)
-{
-}
-
-int __weak arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
-{
-	struct msi_desc *entry;
-	int ret;
-
-	/*
-	 * If an architecture wants to support multiple MSI, it needs to
-	 * override arch_setup_msi_irqs()
-	 */
-	if (type == PCI_CAP_ID_MSI && nvec > 1)
-		return 1;
-
-	for_each_pci_msi_entry(entry, dev) {
-		ret = arch_setup_msi_irq(dev, entry);
-		if (ret < 0)
-			return ret;
-		if (ret > 0)
-			return -ENOSPC;
-	}
-
-	return 0;
-}
-
-void __weak arch_teardown_msi_irqs(struct pci_dev *dev)
-{
-	int i;
-	struct msi_desc *entry;
-
-	for_each_pci_msi_entry(entry, dev)
-		if (entry->irq)
-			for (i = 0; i < entry->nvec_used; i++)
-				arch_teardown_msi_irq(entry->irq + i);
-}
-#endif /* CONFIG_PCI_MSI_ARCH_FALLBACKS */
-
 /*
  * PCI 2.3 does not specify mask bits for each MSI interrupt.  Attempting to
  * mask all MSI interrupts by clearing the MSI enable bit does not work

