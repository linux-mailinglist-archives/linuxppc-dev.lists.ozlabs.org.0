Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCD6625CE9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:23:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N81Cn2NQzz3fL7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:23:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KgXVLrX3;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+iwkwvNE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KgXVLrX3;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+iwkwvNE;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80p603Jjz3fJk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:05:02 +1100 (AEDT)
Message-ID: <20221111122015.574339988@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Msjel7aC5+Im+aQvsAthw2RuYInXdUWBTW//73XVYm0=;
	b=KgXVLrX3pE/nIoqiS99qR5s9yOIMz/R1VaPvfyv2loIU5hDglv67gRX6pyou1DtK60H8cv
	9GpmCDddO9kcF85adqjHiYF1bQ5d87zXTRgP0UgAlqGixa7Beb5iGb+pdp3Q4PG+f1toDz
	X83uOxv0BEfIdDiW+VJKmP5sHOk9JHA4UYsiIbRMhD1dFrLSv8FyNxH9l8a1jx+W7F1ES2
	mgqX8q8gvQYFh0AjANuSBzI/kXzbuI16QPGuQiCAWc2j/5+ePYMfVnyMFOtmr8uagWYcXr
	mb6yiiUo1myYYM3ShslmbhVM3mpnldYVdu78xh8u5sdNukY35Vk1Ij8AFOxhaw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Msjel7aC5+Im+aQvsAthw2RuYInXdUWBTW//73XVYm0=;
	b=+iwkwvNEn54tR9xz7jcZGiqa+56HiFP8TiLT8JYtzPWGMO6Z8uVywQslTWiMPsVIVC4Jkm
	pdv9Nt05hulH8fCQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 34/39] PCI/MSI: Reject multi-MSI early
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:55:09 +0100 (CET)
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

When hierarchical MSI interrupt domains are enabled then there is no point
to do tons of work and detect the missing support for multi-MSI late in the
allocation path.

Just query the domain feature flags right away. The query function is going
to be used for other purposes later and has a mode argument which influences
the result:

  ALLOW_LEGACY returns true when:
     - there is no irq domain attached (legacy support)
     - there is a irq domain attached which has the feature flag set

  DENY_LEGACY returns only true when:
     - there is a irq domain attached which has the feature flag set

This allows to use the function universally without ifdeffery in the
calling code.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/irqdomain.c |   22 ++++++++++++++++++++++
 drivers/pci/msi/msi.c       |    4 ++++
 drivers/pci/msi/msi.h       |    9 +++++++++
 3 files changed, 35 insertions(+)

--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -187,6 +187,28 @@ struct irq_domain *pci_msi_create_irq_do
 }
 EXPORT_SYMBOL_GPL(pci_msi_create_irq_domain);
 
+/**
+ * pci_msi_domain_supports - Check for support of a particular feature flag
+ * @pdev:		The PCI device to operate on
+ * @feature_mask:	The feature mask to check for (full match)
+ * @mode:		If ALLOW_LEGACY this grants the feature when there is no irq domain
+ *			associated to the device. If DENY_LEGACY the lack of an irq domain
+ *			makes the feature unsupported
+ */
+bool pci_msi_domain_supports(struct pci_dev *pdev, unsigned int feature_mask,
+			     enum support_mode mode)
+{
+	struct msi_domain_info *info;
+	struct irq_domain *domain;
+
+	domain = dev_get_msi_domain(&pdev->dev);
+
+	if (!domain || !irq_domain_is_hierarchy(domain))
+		return mode == ALLOW_LEGACY;
+	info = domain->host_data;
+	return (info->flags & feature_mask) == feature_mask;
+}
+
 /*
  * Users of the generic MSI infrastructure expect a device to have a single ID,
  * so with DMA aliases we have to pick the least-worst compromise. Devices with
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -347,6 +347,10 @@ static int msi_capability_init(struct pc
 	struct msi_desc *entry;
 	int ret;
 
+	/* Reject multi-MSI early on irq domain enabled architectures */
+	if (nvec > 1 && !pci_msi_domain_supports(dev, MSI_FLAG_MULTI_PCI_MSI, ALLOW_LEGACY))
+		return 1;
+
 	/*
 	 * Disable MSI during setup in the hardware, but mark it enabled
 	 * so that setup code can evaluate it.
--- a/drivers/pci/msi/msi.h
+++ b/drivers/pci/msi/msi.h
@@ -97,6 +97,15 @@ int __pci_enable_msix_range(struct pci_d
 void __pci_restore_msi_state(struct pci_dev *dev);
 void __pci_restore_msix_state(struct pci_dev *dev);
 
+/* irq_domain related functionality */
+
+enum support_mode {
+	ALLOW_LEGACY,
+	DENY_LEGACY,
+};
+
+bool pci_msi_domain_supports(struct pci_dev *dev, unsigned int feature_mask, enum support_mode mode);
+
 /* Legacy (!IRQDOMAIN) fallbacks */
 
 #ifdef CONFIG_PCI_MSI_ARCH_FALLBACKS

