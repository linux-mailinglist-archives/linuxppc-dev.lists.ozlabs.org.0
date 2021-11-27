Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5327945FA03
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 02:26:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1DV415NFz3cXP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 12:26:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GFhJNIa1;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=MKAzpNi9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=GFhJNIa1; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=MKAzpNi9; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1DKH29gTz3cPk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 12:18:59 +1100 (AEDT)
Message-ID: <20211126223824.796031314@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637975933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=Y52GWxcz9rMhYuk4LDNfYqjI18nIR0XFpc/LxzUOn2o=;
 b=GFhJNIa1DWTIzwoppf2MtTHGy5nRuoYJ3Nvzzd+Pe+GIzulpxqzt6AUdM29ic/yYkCkYE9
 E9lS0R7Ga7X77p/X6A8piBSzwyQ5baOhJNxistuhBHSq6mKnz9rwZ9bCwtR5B5scQ6a0wP
 +V3Pdc99TzVUzvFxJ+hHo1Mj0GFiwbo0d0O7ovSJuwtuobS5e6bgeDzQhX5YZDIh+L8l3k
 HWXeeUF9t/a7JxKzsF7lzrhTcHBhJKXYUWq25inW0Ru95qov9/g0KWuRAFCZrEP39EwP34
 gDa1ug+ll63JPTvL7gg643381Ejfng1A4A6SRTu2pQ5r70SxFiMnGjyWxGW1cA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637975933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=Y52GWxcz9rMhYuk4LDNfYqjI18nIR0XFpc/LxzUOn2o=;
 b=MKAzpNi9/quT7XZcCPyXoDLeCgYbMkAXW0a49m1FLQhVaDgvUUfHL3hmovchfDc+RlxaVn
 yary+5XViXxoghCQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 12/22] PCI/MSI: Make arch_restore_msi_irqs() less horrible.
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:18:53 +0100 (CET)
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

Make arch_restore_msi_irqs() return a boolean which indicates whether the
core code should restore the MSI message or not. Get rid of the indirection
in x86.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Juergen Gross <jgross@suse.com>
Cc: x86@kernel.org
Cc: xen-devel@lists.xenproject.org
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
---
 arch/s390/pci/pci_irq.c               |    4 +-
 arch/x86/include/asm/x86_init.h       |    6 ---
 arch/x86/include/asm/xen/hypervisor.h |    8 +++++
 arch/x86/kernel/apic/msi.c            |    6 +++
 arch/x86/kernel/x86_init.c            |   12 -------
 arch/x86/pci/xen.c                    |   13 ++++----
 drivers/pci/msi.c                     |   54 +++++++++++-----------------------
 include/linux/msi.h                   |    7 +---
 8 files changed, 45 insertions(+), 65 deletions(-)

--- a/arch/s390/pci/pci_irq.c
+++ b/arch/s390/pci/pci_irq.c
@@ -387,13 +387,13 @@ void arch_teardown_msi_irqs(struct pci_d
 		airq_iv_free(zpci_ibv[0], zdev->msi_first_bit, zdev->msi_nr_irqs);
 }
 
-void arch_restore_msi_irqs(struct pci_dev *pdev)
+bool arch_restore_msi_irqs(struct pci_dev *pdev)
 {
 	struct zpci_dev *zdev = to_zpci(pdev);
 
 	if (!zdev->irqs_registered)
 		zpci_set_irq(zdev);
-	default_restore_msi_irqs(pdev);
+	return true;
 }
 
 static struct airq_struct zpci_airq = {
--- a/arch/x86/include/asm/x86_init.h
+++ b/arch/x86/include/asm/x86_init.h
@@ -289,12 +289,6 @@ struct x86_platform_ops {
 	struct x86_hyper_runtime hyper;
 };
 
-struct pci_dev;
-
-struct x86_msi_ops {
-	void (*restore_msi_irqs)(struct pci_dev *dev);
-};
-
 struct x86_apic_ops {
 	unsigned int	(*io_apic_read)   (unsigned int apic, unsigned int reg);
 	void		(*restore)(void);
--- a/arch/x86/include/asm/xen/hypervisor.h
+++ b/arch/x86/include/asm/xen/hypervisor.h
@@ -57,6 +57,14 @@ static inline bool __init xen_x2apic_par
 }
 #endif
 
+struct pci_dev;
+
+#ifdef CONFIG_XEN_DOM0
+bool xen_initdom_restore_msi(struct pci_dev *dev);
+#else
+static inline bool xen_initdom_restore_msi(struct pci_dev *dev) { return true; }
+#endif
+
 #ifdef CONFIG_HOTPLUG_CPU
 void xen_arch_register_cpu(int num);
 void xen_arch_unregister_cpu(int num);
--- a/arch/x86/kernel/apic/msi.c
+++ b/arch/x86/kernel/apic/msi.c
@@ -17,6 +17,7 @@
 #include <asm/irqdomain.h>
 #include <asm/hpet.h>
 #include <asm/hw_irq.h>
+#include <asm/hypervisor.h>
 #include <asm/apic.h>
 #include <asm/irq_remapping.h>
 
@@ -345,3 +346,8 @@ void dmar_free_hwirq(int irq)
 	irq_domain_free_irqs(irq, 1);
 }
 #endif
+
+bool arch_restore_msi_irqs(struct pci_dev *dev)
+{
+	return xen_initdom_restore_msi(dev);
+}
--- a/arch/x86/kernel/x86_init.c
+++ b/arch/x86/kernel/x86_init.c
@@ -145,18 +145,6 @@ struct x86_platform_ops x86_platform __r
 
 EXPORT_SYMBOL_GPL(x86_platform);
 
-#if defined(CONFIG_PCI_MSI)
-struct x86_msi_ops x86_msi __ro_after_init = {
-	.restore_msi_irqs	= default_restore_msi_irqs,
-};
-
-/* MSI arch specific hooks */
-void arch_restore_msi_irqs(struct pci_dev *dev)
-{
-	x86_msi.restore_msi_irqs(dev);
-}
-#endif
-
 struct x86_apic_ops x86_apic_ops __ro_after_init = {
 	.io_apic_read	= native_io_apic_read,
 	.restore	= native_restore_boot_irq_mode,
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -351,10 +351,13 @@ static int xen_initdom_setup_msi_irqs(st
 	return ret;
 }
 
-static void xen_initdom_restore_msi_irqs(struct pci_dev *dev)
+bool xen_initdom_restore_msi(struct pci_dev *dev)
 {
 	int ret = 0;
 
+	if (!xen_initial_domain())
+		return true;
+
 	if (pci_seg_supported) {
 		struct physdev_pci_device restore_ext;
 
@@ -375,10 +378,10 @@ static void xen_initdom_restore_msi_irqs
 		ret = HYPERVISOR_physdev_op(PHYSDEVOP_restore_msi, &restore);
 		WARN(ret && ret != -ENOSYS, "restore_msi -> %d\n", ret);
 	}
+	return false;
 }
 #else /* CONFIG_XEN_PV_DOM0 */
 #define xen_initdom_setup_msi_irqs	NULL
-#define xen_initdom_restore_msi_irqs	NULL
 #endif /* !CONFIG_XEN_PV_DOM0 */
 
 static void xen_teardown_msi_irqs(struct pci_dev *dev)
@@ -466,12 +469,10 @@ static __init struct irq_domain *xen_cre
 static __init void xen_setup_pci_msi(void)
 {
 	if (xen_pv_domain()) {
-		if (xen_initial_domain()) {
+		if (xen_initial_domain())
 			xen_msi_ops.setup_msi_irqs = xen_initdom_setup_msi_irqs;
-			x86_msi.restore_msi_irqs = xen_initdom_restore_msi_irqs;
-		} else {
+		else
 			xen_msi_ops.setup_msi_irqs = xen_setup_msi_irqs;
-		}
 		xen_msi_ops.teardown_msi_irqs = xen_pv_teardown_msi_irqs;
 		pci_msi_ignore_mask = 1;
 	} else if (xen_hvm_domain()) {
--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -106,29 +106,6 @@ void __weak arch_teardown_msi_irqs(struc
 }
 #endif /* CONFIG_PCI_MSI_ARCH_FALLBACKS */
 
-static void default_restore_msi_irq(struct pci_dev *dev, int irq)
-{
-	struct msi_desc *entry;
-
-	entry = NULL;
-	if (dev->msix_enabled) {
-		for_each_pci_msi_entry(entry, dev) {
-			if (irq == entry->irq)
-				break;
-		}
-	} else if (dev->msi_enabled)  {
-		entry = irq_get_msi_desc(irq);
-	}
-
-	if (entry)
-		__pci_write_msi_msg(entry, &entry->msg);
-}
-
-void __weak arch_restore_msi_irqs(struct pci_dev *dev)
-{
-	return default_restore_msi_irqs(dev);
-}
-
 /*
  * PCI 2.3 does not specify mask bits for each MSI interrupt.  Attempting to
  * mask all MSI interrupts by clearing the MSI enable bit does not work
@@ -242,14 +219,6 @@ void pci_msi_unmask_irq(struct irq_data
 }
 EXPORT_SYMBOL_GPL(pci_msi_unmask_irq);
 
-void default_restore_msi_irqs(struct pci_dev *dev)
-{
-	struct msi_desc *entry;
-
-	for_each_pci_msi_entry(entry, dev)
-		default_restore_msi_irq(dev, entry->irq);
-}
-
 void __pci_read_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
 {
 	struct pci_dev *dev = msi_desc_to_pci_dev(entry);
@@ -403,10 +372,19 @@ static void pci_msi_set_enable(struct pc
 	pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, control);
 }
 
+/*
+ * Architecture override returns true when the PCI MSI message should be
+ * written by the generic restore function.
+ */
+bool __weak arch_restore_msi_irqs(struct pci_dev *dev)
+{
+	return true;
+}
+
 static void __pci_restore_msi_state(struct pci_dev *dev)
 {
-	u16 control;
 	struct msi_desc *entry;
+	u16 control;
 
 	if (!dev->msi_enabled)
 		return;
@@ -415,7 +393,8 @@ static void __pci_restore_msi_state(stru
 
 	pci_intx_for_msi(dev, 0);
 	pci_msi_set_enable(dev, 0);
-	arch_restore_msi_irqs(dev);
+	if (arch_restore_msi_irqs(dev))
+		__pci_write_msi_msg(entry, &entry->msg);
 
 	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &control);
 	pci_msi_update_mask(entry, 0, 0);
@@ -437,6 +416,7 @@ static void pci_msix_clear_and_set_ctrl(
 static void __pci_restore_msix_state(struct pci_dev *dev)
 {
 	struct msi_desc *entry;
+	bool write_msg;
 
 	if (!dev->msix_enabled)
 		return;
@@ -447,9 +427,13 @@ static void __pci_restore_msix_state(str
 	pci_msix_clear_and_set_ctrl(dev, 0,
 				PCI_MSIX_FLAGS_ENABLE | PCI_MSIX_FLAGS_MASKALL);
 
-	arch_restore_msi_irqs(dev);
-	for_each_pci_msi_entry(entry, dev)
+	write_msg = arch_restore_msi_irqs(dev);
+
+	for_each_pci_msi_entry(entry, dev) {
+		if (write_msg)
+			__pci_write_msi_msg(entry, &entry->msg);
 		pci_msix_write_vector_ctrl(entry, entry->pci.msix_ctrl);
+	}
 
 	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_MASKALL, 0);
 }
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -272,11 +272,10 @@ static inline void arch_teardown_msi_irq
 #endif
 
 /*
- * The restore hooks are still available as they are useful even
- * for fully irq domain based setups. Courtesy to XEN/X86.
+ * The restore hook is still available even for fully irq domain based
+ * setups. Courtesy to XEN/X86.
  */
-void arch_restore_msi_irqs(struct pci_dev *dev);
-void default_restore_msi_irqs(struct pci_dev *dev);
+bool arch_restore_msi_irqs(struct pci_dev *dev);
 
 #ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
 

