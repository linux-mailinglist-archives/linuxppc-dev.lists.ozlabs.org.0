Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 849BE46ACB6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 23:41:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7JLV2N5zz3fPn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 09:41:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XU5P0R3+;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5xLy8ejX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=XU5P0R3+; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=5xLy8ejX; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7J3M2f4yz308v
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 09:27:59 +1100 (AEDT)
Message-ID: <20211206210224.925241961@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638829676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=FXX41Qfq2rmX4Pnl0ZDgGggJiyIMhnsIgHBe+OGHmI0=;
 b=XU5P0R3+ZvbfRzdT7eITdUZpVffQhu3mwMQxHIuYgaoigDHKPoocQDa8qE3Uaf7sAC1A9a
 Js9g6cNcn6mG5wi/DOPiYiYl3E8Zz14cSLHuVeGnH6q1kq55XyN9gRmcVHSh5M702eeuzS
 bamXvbJtwYpQ7EnWUWKX/KSbvsAjwKbfyZz1Ddew/kluJQEYrt+sgElwsfwUoFZGHB3SW5
 JWhsk59n5A4ddQt8nalxZK/oiN+HIb+DfnIB5bCE/+7f4xAhtXvdT/dZztFeYnEkP4j9ik
 qGpniZKbYB7qVDkE7feBPxpsBYMFmfBZX4PgA2J+mwXW3+TPFkwcsLvleDUFdw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638829676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=FXX41Qfq2rmX4Pnl0ZDgGggJiyIMhnsIgHBe+OGHmI0=;
 b=5xLy8ejXtHWFxftIt7uUy/JNMg6lFP0zokUkUY/UbBvVYESVtltZxcFPpywZO0EAeM6axN
 GP3uFRXwCiRvoiAg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 20/23] PCI/MSI: Move msi_lock to struct pci_dev
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:27:56 +0100 (CET)
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

It's only required for PCI/MSI. So no point in having it in every struct
device.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V2: New patch
---
 drivers/base/core.c    |    1 -
 drivers/pci/msi/msi.c  |    2 +-
 drivers/pci/probe.c    |    4 +++-
 include/linux/device.h |    2 --
 include/linux/pci.h    |    1 +
 5 files changed, 5 insertions(+), 5 deletions(-)

--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2875,7 +2875,6 @@ void device_initialize(struct device *de
 	device_pm_init(dev);
 	set_dev_node(dev, NUMA_NO_NODE);
 #ifdef CONFIG_GENERIC_MSI_IRQ
-	raw_spin_lock_init(&dev->msi_lock);
 	INIT_LIST_HEAD(&dev->msi_list);
 #endif
 	INIT_LIST_HEAD(&dev->links.consumers);
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -18,7 +18,7 @@ int pci_msi_ignore_mask;
 
 static noinline void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 set)
 {
-	raw_spinlock_t *lock = &desc->dev->msi_lock;
+	raw_spinlock_t *lock = &to_pci_dev(desc->dev)->msi_lock;
 	unsigned long flags;
 
 	if (!desc->pci.msi_attrib.can_mask)
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2311,7 +2311,9 @@ struct pci_dev *pci_alloc_dev(struct pci
 	INIT_LIST_HEAD(&dev->bus_list);
 	dev->dev.type = &pci_dev_type;
 	dev->bus = pci_bus_get(bus);
-
+#ifdef CONFIG_PCI_MSI
+	raw_spin_lock_init(&dev->msi_lock);
+#endif
 	return dev;
 }
 EXPORT_SYMBOL(pci_alloc_dev);
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -407,7 +407,6 @@ struct dev_links_info {
  * @em_pd:	device's energy model performance domain
  * @pins:	For device pin management.
  *		See Documentation/driver-api/pin-control.rst for details.
- * @msi_lock:	Lock to protect MSI mask cache and mask register
  * @msi_list:	Hosts MSI descriptors
  * @msi_domain: The generic MSI domain this device is using.
  * @numa_node:	NUMA node this device is close to.
@@ -508,7 +507,6 @@ struct device {
 	struct dev_pin_info	*pins;
 #endif
 #ifdef CONFIG_GENERIC_MSI_IRQ
-	raw_spinlock_t		msi_lock;
 	struct list_head	msi_list;
 #endif
 #ifdef CONFIG_DMA_OPS
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -474,6 +474,7 @@ struct pci_dev {
 #endif
 #ifdef CONFIG_PCI_MSI
 	void __iomem	*msix_base;
+	raw_spinlock_t	msi_lock;
 	const struct attribute_group **msi_irq_groups;
 #endif
 	struct pci_vpd	vpd;

