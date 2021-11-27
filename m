Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C94DB45FAA7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 02:30:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1DZ44pp3z3f0F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 12:30:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YXrvDdji;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=RvZm8oUX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=YXrvDdji; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=RvZm8oUX; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1DKP0yTdz3c7h
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 12:19:05 +1100 (AEDT)
Message-ID: <20211126223825.093887718@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637975941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=Fm5t3j//2ZJWIAwQC/lUTYq1h7igaXJ6yKKmISA8BnE=;
 b=YXrvDdjinCV1yBjHyHLHh4kbucu2LHURHR+t0zVJv5Iwe67q0LFuruaQh3vkwbzQtPwio7
 pprtMrfRvledbc2Kp38dfn11v4y5Inu453zNnn62UbDXbEMDnzTVB2lG+F7/o751ne62V0
 wuLwIsQnEtadtEUUBTR+POd7nVjDpAaMG5nsqWghfqGryom7R0YB/K06iimvmxsJ5KiFpB
 JPV3B+r8CqqTRE3oo30uaAVzGJqzMsu2Bz/vPrVyNZToyYv3yqNeZE81QSacrNZkpZTNFS
 XGAAgWOht7wVhoHHI0patyvWHbhFxyJn+zFlcFj6JBZ8L2lsCdtihTsPXR9eTg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637975941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=Fm5t3j//2ZJWIAwQC/lUTYq1h7igaXJ6yKKmISA8BnE=;
 b=RvZm8oUXbruNEue8m0QI5IgMFXDCNY3ru8yRX0pyG3paqWiHR2a2l+sKosxSZ9wf0ryS/Q
 OiKV6WwXAMjbYnDg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 17/22] PCI/MSI: Split out !IRQDOMAIN code
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:19:01 +0100 (CET)
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

Split out the non irqdomain code into its own file.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/Makefile |    5 ++--
 drivers/pci/msi/legacy.c |   51 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/msi/msi.c    |   46 ------------------------------------------
 3 files changed, 54 insertions(+), 48 deletions(-)

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
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PCI Message Signaled Interrupt (MSI).
+ *
+ * Legacy architecture specific setup and teardown mechanism.
+ */
+#include "msi.h"
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
+			for (i = 0; i < entry->nvec_used; i++)
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

