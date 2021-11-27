Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D9545FB5F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 02:40:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1Dp90g22z3gPt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 12:40:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0FZtYJO2;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=GERv7Vjf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=0FZtYJO2; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=GERv7Vjf; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1DL41cH3z3c7g
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 12:19:40 +1100 (AEDT)
Message-ID: <20211126223824.679247706@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637975977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=4rnzffhngGnxTe5PEkZvVRK1c33wDUixOezkjXJ0tvw=;
 b=0FZtYJO2OH8gJx4JCRiRb5ysEqXyYyFst3+pIK7Gc8CK0X5Exi5sDZPWJoCgV2e22q0Heg
 IKWxvbgPXCglCosgVZl5uYK7q+WN1TPlnnHWKAVhKN+OXknQBWZX4L9Q6xpswjgFzBMHIm
 DlNH5CvkNFWwHp/ZbpEEwPeaCV9GJxbmq2A8Rkfy9Ve1ZZZM3/7FUZkOlj2cZvY/4o2CWA
 0foZomanYUcIjyZr0T2CYvJGcn1fumpPH3ziHS+5nulrHpkbbBjsvffZy9/1EopTXeoXf9
 oxmyJZhcFq8PU8/oYuuxAe8xvtWzkk6SxgSMQ/BIT5g2VjoeRfcZ08+VaNCUow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637975977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=4rnzffhngGnxTe5PEkZvVRK1c33wDUixOezkjXJ0tvw=;
 b=GERv7VjfkWTmleoQukMYggUIIc29SIlgdGnxl5y0v1AocWf0SmwaeXK8X9+QQ6lv19ZGZi
 ow3EQgeiBx8QoQCQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 10/22] genirq/msi,
 treewide: Use a named struct for PCI/MSI attributes
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:19:36 +0100 (CET)
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

The unnamed struct sucks and is in the way of further cleanups. Stick the
PCI related MSI data into a real data structure and cleanup all users.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: sparclinux@vger.kernel.org
Cc: x86@kernel.org
Cc: xen-devel@lists.xenproject.org
Cc: ath11k@lists.infradead.org
---
 arch/powerpc/platforms/cell/axon_msi.c    |    2 
 arch/powerpc/platforms/powernv/pci-ioda.c |    4 -
 arch/powerpc/platforms/pseries/msi.c      |    6 -
 arch/sparc/kernel/pci_msi.c               |    4 -
 arch/x86/kernel/apic/msi.c                |    2 
 arch/x86/pci/xen.c                        |    6 -
 drivers/net/wireless/ath/ath11k/pci.c     |    2 
 drivers/pci/msi.c                         |  116 +++++++++++++++---------------
 drivers/pci/xen-pcifront.c                |    2 
 include/linux/msi.h                       |   84 ++++++++++-----------
 kernel/irq/msi.c                          |    4 -
 11 files changed, 115 insertions(+), 117 deletions(-)

--- a/arch/powerpc/platforms/cell/axon_msi.c
+++ b/arch/powerpc/platforms/cell/axon_msi.c
@@ -212,7 +212,7 @@ static int setup_msi_msg_address(struct
 	entry = first_pci_msi_entry(dev);
 
 	for (; dn; dn = of_get_next_parent(dn)) {
-		if (entry->msi_attrib.is_64) {
+		if (entry->pci.msi_attrib.is_64) {
 			prop = of_get_property(dn, "msi-address-64", &len);
 			if (prop)
 				break;
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2154,10 +2154,10 @@ static void pnv_msi_compose_msg(struct i
 	int rc;
 
 	rc = __pnv_pci_ioda_msi_setup(phb, pdev, d->hwirq,
-				      entry->msi_attrib.is_64, msg);
+				      entry->pci.msi_attrib.is_64, msg);
 	if (rc)
 		dev_err(&pdev->dev, "Failed to setup %s-bit MSI #%ld : %d\n",
-			entry->msi_attrib.is_64 ? "64" : "32", d->hwirq, rc);
+			entry->pci.msi_attrib.is_64 ? "64" : "32", d->hwirq, rc);
 }
 
 /*
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -332,7 +332,7 @@ static int check_msix_entries(struct pci
 
 	expected = 0;
 	for_each_pci_msi_entry(entry, pdev) {
-		if (entry->msi_attrib.entry_nr != expected) {
+		if (entry->pci.msi_attrib.entry_nr != expected) {
 			pr_debug("rtas_msi: bad MSI-X entries.\n");
 			return -EINVAL;
 		}
@@ -449,7 +449,7 @@ static int pseries_msi_ops_prepare(struc
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct msi_desc *desc = first_pci_msi_entry(pdev);
-	int type = desc->msi_attrib.is_msix ? PCI_CAP_ID_MSIX : PCI_CAP_ID_MSI;
+	int type = desc->pci.msi_attrib.is_msix ? PCI_CAP_ID_MSIX : PCI_CAP_ID_MSI;
 
 	return rtas_prepare_msi_irqs(pdev, nvec, type, arg);
 }
@@ -580,7 +580,7 @@ static int pseries_irq_domain_alloc(stru
 	int hwirq;
 	int i, ret;
 
-	hwirq = rtas_query_irq_number(pci_get_pdn(pdev), desc->msi_attrib.entry_nr);
+	hwirq = rtas_query_irq_number(pci_get_pdn(pdev), desc->pci.msi_attrib.entry_nr);
 	if (hwirq < 0) {
 		dev_err(&pdev->dev, "Failed to query HW IRQ: %d\n", hwirq);
 		return hwirq;
--- a/arch/sparc/kernel/pci_msi.c
+++ b/arch/sparc/kernel/pci_msi.c
@@ -146,13 +146,13 @@ static int sparc64_setup_msi_irq(unsigne
 	msiqid = pick_msiq(pbm);
 
 	err = ops->msi_setup(pbm, msiqid, msi,
-			     (entry->msi_attrib.is_64 ? 1 : 0));
+			     (entry->pci.msi_attrib.is_64 ? 1 : 0));
 	if (err)
 		goto out_msi_free;
 
 	pbm->msi_irq_table[msi - pbm->msi_first] = *irq_p;
 
-	if (entry->msi_attrib.is_64) {
+	if (entry->pci.msi_attrib.is_64) {
 		msg.address_hi = pbm->msi64_start >> 32;
 		msg.address_lo = pbm->msi64_start & 0xffffffff;
 	} else {
--- a/arch/x86/kernel/apic/msi.c
+++ b/arch/x86/kernel/apic/msi.c
@@ -163,7 +163,7 @@ int pci_msi_prepare(struct irq_domain *d
 	struct msi_desc *desc = first_pci_msi_entry(pdev);
 
 	init_irq_alloc_info(arg, NULL);
-	if (desc->msi_attrib.is_msix) {
+	if (desc->pci.msi_attrib.is_msix) {
 		arg->type = X86_IRQ_ALLOC_TYPE_PCI_MSIX;
 	} else {
 		arg->type = X86_IRQ_ALLOC_TYPE_PCI_MSI;
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -306,7 +306,7 @@ static int xen_initdom_setup_msi_irqs(st
 				return -EINVAL;
 
 			map_irq.table_base = pci_resource_start(dev, bir);
-			map_irq.entry_nr = msidesc->msi_attrib.entry_nr;
+			map_irq.entry_nr = msidesc->pci.msi_attrib.entry_nr;
 		}
 
 		ret = -EINVAL;
@@ -398,7 +398,7 @@ static void xen_pv_teardown_msi_irqs(str
 {
 	struct msi_desc *msidesc = first_pci_msi_entry(dev);
 
-	if (msidesc->msi_attrib.is_msix)
+	if (msidesc->pci.msi_attrib.is_msix)
 		xen_pci_frontend_disable_msix(dev);
 	else
 		xen_pci_frontend_disable_msi(dev);
@@ -414,7 +414,7 @@ static int xen_msi_domain_alloc_irqs(str
 	if (WARN_ON_ONCE(!dev_is_pci(dev)))
 		return -EINVAL;
 
-	if (first_msi_entry(dev)->msi_attrib.is_msix)
+	if (first_msi_entry(dev)->pci.msi_attrib.is_msix)
 		type = PCI_CAP_ID_MSIX;
 	else
 		type = PCI_CAP_ID_MSI;
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -911,7 +911,7 @@ static int ath11k_pci_alloc_msi(struct a
 	}
 
 	ab_pci->msi_ep_base_data = msi_desc->msg.data;
-	if (msi_desc->msi_attrib.is_64)
+	if (msi_desc->pci.msi_attrib.is_64)
 		set_bit(ATH11K_PCI_FLAG_IS_MSI_64, &ab_pci->flags);
 
 	ath11k_dbg(ab, ATH11K_DBG_PCI, "msi base data is %d\n", ab_pci->msi_ep_base_data);
--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -138,9 +138,9 @@ void __weak arch_restore_msi_irqs(struct
 static inline __attribute_const__ u32 msi_multi_mask(struct msi_desc *desc)
 {
 	/* Don't shift by >= width of type */
-	if (desc->msi_attrib.multi_cap >= 5)
+	if (desc->pci.msi_attrib.multi_cap >= 5)
 		return 0xffffffff;
-	return (1 << (1 << desc->msi_attrib.multi_cap)) - 1;
+	return (1 << (1 << desc->pci.msi_attrib.multi_cap)) - 1;
 }
 
 static noinline void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 set)
@@ -148,14 +148,14 @@ static noinline void pci_msi_update_mask
 	raw_spinlock_t *lock = &desc->dev->msi_lock;
 	unsigned long flags;
 
-	if (!desc->msi_attrib.can_mask)
+	if (!desc->pci.msi_attrib.can_mask)
 		return;
 
 	raw_spin_lock_irqsave(lock, flags);
-	desc->msi_mask &= ~clear;
-	desc->msi_mask |= set;
-	pci_write_config_dword(msi_desc_to_pci_dev(desc), desc->mask_pos,
-			       desc->msi_mask);
+	desc->pci.msi_mask &= ~clear;
+	desc->pci.msi_mask |= set;
+	pci_write_config_dword(msi_desc_to_pci_dev(desc), desc->pci.mask_pos,
+			       desc->pci.msi_mask);
 	raw_spin_unlock_irqrestore(lock, flags);
 }
 
@@ -171,7 +171,7 @@ static inline void pci_msi_unmask(struct
 
 static inline void __iomem *pci_msix_desc_addr(struct msi_desc *desc)
 {
-	return desc->mask_base + desc->msi_attrib.entry_nr * PCI_MSIX_ENTRY_SIZE;
+	return desc->pci.mask_base + desc->pci.msi_attrib.entry_nr * PCI_MSIX_ENTRY_SIZE;
 }
 
 /*
@@ -184,27 +184,27 @@ static void pci_msix_write_vector_ctrl(s
 {
 	void __iomem *desc_addr = pci_msix_desc_addr(desc);
 
-	if (desc->msi_attrib.can_mask)
+	if (desc->pci.msi_attrib.can_mask)
 		writel(ctrl, desc_addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
 }
 
 static inline void pci_msix_mask(struct msi_desc *desc)
 {
-	desc->msix_ctrl |= PCI_MSIX_ENTRY_CTRL_MASKBIT;
-	pci_msix_write_vector_ctrl(desc, desc->msix_ctrl);
+	desc->pci.msix_ctrl |= PCI_MSIX_ENTRY_CTRL_MASKBIT;
+	pci_msix_write_vector_ctrl(desc, desc->pci.msix_ctrl);
 	/* Flush write to device */
-	readl(desc->mask_base);
+	readl(desc->pci.mask_base);
 }
 
 static inline void pci_msix_unmask(struct msi_desc *desc)
 {
-	desc->msix_ctrl &= ~PCI_MSIX_ENTRY_CTRL_MASKBIT;
-	pci_msix_write_vector_ctrl(desc, desc->msix_ctrl);
+	desc->pci.msix_ctrl &= ~PCI_MSIX_ENTRY_CTRL_MASKBIT;
+	pci_msix_write_vector_ctrl(desc, desc->pci.msix_ctrl);
 }
 
 static void __pci_msi_mask_desc(struct msi_desc *desc, u32 mask)
 {
-	if (desc->msi_attrib.is_msix)
+	if (desc->pci.msi_attrib.is_msix)
 		pci_msix_mask(desc);
 	else
 		pci_msi_mask(desc, mask);
@@ -212,7 +212,7 @@ static void __pci_msi_mask_desc(struct m
 
 static void __pci_msi_unmask_desc(struct msi_desc *desc, u32 mask)
 {
-	if (desc->msi_attrib.is_msix)
+	if (desc->pci.msi_attrib.is_msix)
 		pci_msix_unmask(desc);
 	else
 		pci_msi_unmask(desc, mask);
@@ -256,10 +256,10 @@ void __pci_read_msi_msg(struct msi_desc
 
 	BUG_ON(dev->current_state != PCI_D0);
 
-	if (entry->msi_attrib.is_msix) {
+	if (entry->pci.msi_attrib.is_msix) {
 		void __iomem *base = pci_msix_desc_addr(entry);
 
-		if (WARN_ON_ONCE(entry->msi_attrib.is_virtual))
+		if (WARN_ON_ONCE(entry->pci.msi_attrib.is_virtual))
 			return;
 
 		msg->address_lo = readl(base + PCI_MSIX_ENTRY_LOWER_ADDR);
@@ -271,7 +271,7 @@ void __pci_read_msi_msg(struct msi_desc
 
 		pci_read_config_dword(dev, pos + PCI_MSI_ADDRESS_LO,
 				      &msg->address_lo);
-		if (entry->msi_attrib.is_64) {
+		if (entry->pci.msi_attrib.is_64) {
 			pci_read_config_dword(dev, pos + PCI_MSI_ADDRESS_HI,
 					      &msg->address_hi);
 			pci_read_config_word(dev, pos + PCI_MSI_DATA_64, &data);
@@ -289,12 +289,12 @@ void __pci_write_msi_msg(struct msi_desc
 
 	if (dev->current_state != PCI_D0 || pci_dev_is_disconnected(dev)) {
 		/* Don't touch the hardware now */
-	} else if (entry->msi_attrib.is_msix) {
+	} else if (entry->pci.msi_attrib.is_msix) {
 		void __iomem *base = pci_msix_desc_addr(entry);
-		u32 ctrl = entry->msix_ctrl;
+		u32 ctrl = entry->pci.msix_ctrl;
 		bool unmasked = !(ctrl & PCI_MSIX_ENTRY_CTRL_MASKBIT);
 
-		if (entry->msi_attrib.is_virtual)
+		if (entry->pci.msi_attrib.is_virtual)
 			goto skip;
 
 		/*
@@ -323,12 +323,12 @@ void __pci_write_msi_msg(struct msi_desc
 
 		pci_read_config_word(dev, pos + PCI_MSI_FLAGS, &msgctl);
 		msgctl &= ~PCI_MSI_FLAGS_QSIZE;
-		msgctl |= entry->msi_attrib.multiple << 4;
+		msgctl |= entry->pci.msi_attrib.multiple << 4;
 		pci_write_config_word(dev, pos + PCI_MSI_FLAGS, msgctl);
 
 		pci_write_config_dword(dev, pos + PCI_MSI_ADDRESS_LO,
 				       msg->address_lo);
-		if (entry->msi_attrib.is_64) {
+		if (entry->pci.msi_attrib.is_64) {
 			pci_write_config_dword(dev, pos + PCI_MSI_ADDRESS_HI,
 					       msg->address_hi);
 			pci_write_config_word(dev, pos + PCI_MSI_DATA_64,
@@ -376,9 +376,9 @@ static void free_msi_irqs(struct pci_dev
 	pci_msi_teardown_msi_irqs(dev);
 
 	list_for_each_entry_safe(entry, tmp, msi_list, list) {
-		if (entry->msi_attrib.is_msix) {
+		if (entry->pci.msi_attrib.is_msix) {
 			if (list_is_last(&entry->list, msi_list))
-				iounmap(entry->mask_base);
+				iounmap(entry->pci.mask_base);
 		}
 
 		list_del(&entry->list);
@@ -420,7 +420,7 @@ static void __pci_restore_msi_state(stru
 	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &control);
 	pci_msi_update_mask(entry, 0, 0);
 	control &= ~PCI_MSI_FLAGS_QSIZE;
-	control |= (entry->msi_attrib.multiple << 4) | PCI_MSI_FLAGS_ENABLE;
+	control |= (entry->pci.msi_attrib.multiple << 4) | PCI_MSI_FLAGS_ENABLE;
 	pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, control);
 }
 
@@ -449,7 +449,7 @@ static void __pci_restore_msix_state(str
 
 	arch_restore_msi_irqs(dev);
 	for_each_pci_msi_entry(entry, dev)
-		pci_msix_write_vector_ctrl(entry, entry->msix_ctrl);
+		pci_msix_write_vector_ctrl(entry, entry->pci.msix_ctrl);
 
 	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_MASKALL, 0);
 }
@@ -481,24 +481,24 @@ msi_setup_entry(struct pci_dev *dev, int
 	if (dev->dev_flags & PCI_DEV_FLAGS_HAS_MSI_MASKING)
 		control |= PCI_MSI_FLAGS_MASKBIT;
 
-	entry->msi_attrib.is_msix	= 0;
-	entry->msi_attrib.is_64		= !!(control & PCI_MSI_FLAGS_64BIT);
-	entry->msi_attrib.is_virtual    = 0;
-	entry->msi_attrib.entry_nr	= 0;
-	entry->msi_attrib.can_mask	= !pci_msi_ignore_mask &&
+	entry->pci.msi_attrib.is_msix	= 0;
+	entry->pci.msi_attrib.is_64		= !!(control & PCI_MSI_FLAGS_64BIT);
+	entry->pci.msi_attrib.is_virtual    = 0;
+	entry->pci.msi_attrib.entry_nr	= 0;
+	entry->pci.msi_attrib.can_mask	= !pci_msi_ignore_mask &&
 					  !!(control & PCI_MSI_FLAGS_MASKBIT);
-	entry->msi_attrib.default_irq	= dev->irq;	/* Save IOAPIC IRQ */
-	entry->msi_attrib.multi_cap	= (control & PCI_MSI_FLAGS_QMASK) >> 1;
-	entry->msi_attrib.multiple	= ilog2(__roundup_pow_of_two(nvec));
+	entry->pci.msi_attrib.default_irq	= dev->irq;	/* Save IOAPIC IRQ */
+	entry->pci.msi_attrib.multi_cap	= (control & PCI_MSI_FLAGS_QMASK) >> 1;
+	entry->pci.msi_attrib.multiple	= ilog2(__roundup_pow_of_two(nvec));
 
 	if (control & PCI_MSI_FLAGS_64BIT)
-		entry->mask_pos = dev->msi_cap + PCI_MSI_MASK_64;
+		entry->pci.mask_pos = dev->msi_cap + PCI_MSI_MASK_64;
 	else
-		entry->mask_pos = dev->msi_cap + PCI_MSI_MASK_32;
+		entry->pci.mask_pos = dev->msi_cap + PCI_MSI_MASK_32;
 
 	/* Save the initial mask status */
-	if (entry->msi_attrib.can_mask)
-		pci_read_config_dword(dev, entry->mask_pos, &entry->msi_mask);
+	if (entry->pci.msi_attrib.can_mask)
+		pci_read_config_dword(dev, entry->pci.mask_pos, &entry->pci.msi_mask);
 
 out:
 	kfree(masks);
@@ -630,26 +630,26 @@ static int msix_setup_entries(struct pci
 			goto out;
 		}
 
-		entry->msi_attrib.is_msix	= 1;
-		entry->msi_attrib.is_64		= 1;
+		entry->pci.msi_attrib.is_msix	= 1;
+		entry->pci.msi_attrib.is_64	= 1;
 
 		if (entries)
-			entry->msi_attrib.entry_nr = entries[i].entry;
+			entry->pci.msi_attrib.entry_nr = entries[i].entry;
 		else
-			entry->msi_attrib.entry_nr = i;
+			entry->pci.msi_attrib.entry_nr = i;
 
-		entry->msi_attrib.is_virtual =
-			entry->msi_attrib.entry_nr >= vec_count;
+		entry->pci.msi_attrib.is_virtual =
+			entry->pci.msi_attrib.entry_nr >= vec_count;
 
-		entry->msi_attrib.can_mask	= !pci_msi_ignore_mask &&
-						  !entry->msi_attrib.is_virtual;
+		entry->pci.msi_attrib.can_mask	= !pci_msi_ignore_mask &&
+						  !entry->pci.msi_attrib.is_virtual;
 
-		entry->msi_attrib.default_irq	= dev->irq;
-		entry->mask_base		= base;
+		entry->pci.msi_attrib.default_irq	= dev->irq;
+		entry->pci.mask_base			= base;
 
-		if (entry->msi_attrib.can_mask) {
+		if (entry->pci.msi_attrib.can_mask) {
 			addr = pci_msix_desc_addr(entry);
-			entry->msix_ctrl = readl(addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
+			entry->pci.msix_ctrl = readl(addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
 		}
 
 		list_add_tail(&entry->list, dev_to_msi_list(&dev->dev));
@@ -874,7 +874,7 @@ static void pci_msi_shutdown(struct pci_
 	pci_msi_unmask(desc, msi_multi_mask(desc));
 
 	/* Restore dev->irq to its default pin-assertion IRQ */
-	dev->irq = desc->msi_attrib.default_irq;
+	dev->irq = desc->pci.msi_attrib.default_irq;
 	pcibios_alloc_irq(dev);
 }
 
@@ -1196,7 +1196,7 @@ int pci_irq_vector(struct pci_dev *dev,
 		struct msi_desc *entry;
 
 		for_each_pci_msi_entry(entry, dev) {
-			if (entry->msi_attrib.entry_nr == nr)
+			if (entry->pci.msi_attrib.entry_nr == nr)
 				return entry->irq;
 		}
 		WARN_ON_ONCE(1);
@@ -1228,7 +1228,7 @@ const struct cpumask *pci_irq_get_affini
 		struct msi_desc *entry;
 
 		for_each_pci_msi_entry(entry, dev) {
-			if (entry->msi_attrib.entry_nr == nr)
+			if (entry->pci.msi_attrib.entry_nr == nr)
 				return &entry->affinity->mask;
 		}
 		WARN_ON_ONCE(1);
@@ -1281,14 +1281,14 @@ static irq_hw_number_t pci_msi_domain_ca
 {
 	struct pci_dev *dev = msi_desc_to_pci_dev(desc);
 
-	return (irq_hw_number_t)desc->msi_attrib.entry_nr |
+	return (irq_hw_number_t)desc->pci.msi_attrib.entry_nr |
 		pci_dev_id(dev) << 11 |
 		(pci_domain_nr(dev->bus) & 0xFFFFFFFF) << 27;
 }
 
 static inline bool pci_msi_desc_is_multi_msi(struct msi_desc *desc)
 {
-	return !desc->msi_attrib.is_msix && desc->nvec_used > 1;
+	return !desc->pci.msi_attrib.is_msix && desc->nvec_used > 1;
 }
 
 /**
@@ -1312,7 +1312,7 @@ int pci_msi_domain_check_cap(struct irq_
 	if (pci_msi_desc_is_multi_msi(desc) &&
 	    !(info->flags & MSI_FLAG_MULTI_PCI_MSI))
 		return 1;
-	else if (desc->msi_attrib.is_msix && !(info->flags & MSI_FLAG_PCI_MSIX))
+	else if (desc->pci.msi_attrib.is_msix && !(info->flags & MSI_FLAG_PCI_MSIX))
 		return -ENOTSUPP;
 
 	return 0;
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -263,7 +263,7 @@ static int pci_frontend_enable_msix(stru
 
 	i = 0;
 	for_each_pci_msi_entry(entry, dev) {
-		op.msix_entries[i].entry = entry->msi_attrib.entry_nr;
+		op.msix_entries[i].entry = entry->pci.msi_attrib.entry_nr;
 		/* Vector is useless at this point. */
 		op.msix_entries[i].vector = -1;
 		i++;
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -68,6 +68,42 @@ typedef void (*irq_write_msi_msg_t)(stru
 				    struct msi_msg *msg);
 
 /**
+ * pci_msi_desc - PCI/MSI specific MSI descriptor data
+ *
+ * @msi_mask:	[PCI MSI]   MSI cached mask bits
+ * @msix_ctrl:	[PCI MSI-X] MSI-X cached per vector control bits
+ * @is_msix:	[PCI MSI/X] True if MSI-X
+ * @multiple:	[PCI MSI/X] log2 num of messages allocated
+ * @multi_cap:	[PCI MSI/X] log2 num of messages supported
+ * @can_mask:	[PCI MSI/X] Masking supported?
+ * @is_64:	[PCI MSI/X] Address size: 0=32bit 1=64bit
+ * @entry_nr:	[PCI MSI/X] Entry which is described by this descriptor
+ * @default_irq:[PCI MSI/X] The default pre-assigned non-MSI irq
+ * @mask_pos:	[PCI MSI]   Mask register position
+ * @mask_base:	[PCI MSI-X] Mask register base address
+ */
+struct pci_msi_desc {
+	union {
+		u32 msi_mask;
+		u32 msix_ctrl;
+	};
+	struct {
+		u8	is_msix		: 1;
+		u8	multiple	: 3;
+		u8	multi_cap	: 3;
+		u8	can_mask	: 1;
+		u8	is_64		: 1;
+		u8	is_virtual	: 1;
+		u16	entry_nr;
+		unsigned default_irq;
+	} msi_attrib;
+	union {
+		u8	mask_pos;
+		void __iomem *mask_base;
+	};
+};
+
+/**
  * platform_msi_desc - Platform device specific msi descriptor data
  * @msi_priv_data:	Pointer to platform private data
  * @msi_index:		The index of the MSI descriptor for multi MSI
@@ -106,17 +142,7 @@ struct ti_sci_inta_msi_desc {
  *			address or data changes
  * @write_msi_msg_data:	Data parameter for the callback.
  *
- * @msi_mask:	[PCI MSI]   MSI cached mask bits
- * @msix_ctrl:	[PCI MSI-X] MSI-X cached per vector control bits
- * @is_msix:	[PCI MSI/X] True if MSI-X
- * @multiple:	[PCI MSI/X] log2 num of messages allocated
- * @multi_cap:	[PCI MSI/X] log2 num of messages supported
- * @maskbit:	[PCI MSI/X] Mask-Pending bit supported?
- * @is_64:	[PCI MSI/X] Address size: 0=32bit 1=64bit
- * @entry_nr:	[PCI MSI/X] Entry which is described by this descriptor
- * @default_irq:[PCI MSI/X] The default pre-assigned non-MSI irq
- * @mask_pos:	[PCI MSI]   Mask register position
- * @mask_base:	[PCI MSI-X] Mask register base address
+ * @pci:	[PCI]	    PCI speficic msi descriptor data
  * @platform:	[platform]  Platform device specific msi descriptor data
  * @fsl_mc:	[fsl-mc]    FSL MC device specific msi descriptor data
  * @inta:	[INTA]	    TISCI based INTA specific msi descriptor data
@@ -137,38 +163,10 @@ struct msi_desc {
 	void *write_msi_msg_data;
 
 	union {
-		/* PCI MSI/X specific data */
-		struct {
-			union {
-				u32 msi_mask;
-				u32 msix_ctrl;
-			};
-			struct {
-				u8	is_msix		: 1;
-				u8	multiple	: 3;
-				u8	multi_cap	: 3;
-				u8	can_mask	: 1;
-				u8	is_64		: 1;
-				u8	is_virtual	: 1;
-				u16	entry_nr;
-				unsigned default_irq;
-			} msi_attrib;
-			union {
-				u8	mask_pos;
-				void __iomem *mask_base;
-			};
-		};
-
-		/*
-		 * Non PCI variants add their data structure here. New
-		 * entries need to use a named structure. We want
-		 * proper name spaces for this. The PCI part is
-		 * anonymous for now as it would require an immediate
-		 * tree wide cleanup.
-		 */
-		struct platform_msi_desc platform;
-		struct fsl_mc_msi_desc fsl_mc;
-		struct ti_sci_inta_msi_desc inta;
+		struct pci_msi_desc		pci;
+		struct platform_msi_desc	platform;
+		struct fsl_mc_msi_desc		fsl_mc;
+		struct ti_sci_inta_msi_desc	inta;
 	};
 };
 
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -91,7 +91,7 @@ static ssize_t msi_mode_show(struct devi
 		return -ENODEV;
 
 	if (dev_is_pci(dev))
-		is_msix = entry->msi_attrib.is_msix;
+		is_msix = entry->pci.msi_attrib.is_msix;
 
 	return sysfs_emit(buf, "%s\n", is_msix ? "msix" : "msi");
 }
@@ -535,7 +535,7 @@ static bool msi_check_reservation_mode(s
 	 * masking and MSI does so when the can_mask attribute is set.
 	 */
 	desc = first_msi_entry(dev);
-	return desc->msi_attrib.is_msix || desc->msi_attrib.can_mask;
+	return desc->pci.msi_attrib.is_msix || desc->pci.msi_attrib.can_mask;
 }
 
 int __msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,

