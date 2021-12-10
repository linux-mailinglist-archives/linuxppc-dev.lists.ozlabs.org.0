Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6324470E07
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 23:36:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9m2p4CNzz3g3H
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 09:36:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZnOdjYsy;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=IxahGrtx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=ZnOdjYsy; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=IxahGrtx; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9lgf4JxNz3cZR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 09:19:26 +1100 (AEDT)
Message-ID: <20211210221814.780824745@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639174764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=ZEIc+hYHtGZ+R8Y42PTVzHWVlXMSBVtNMJGsH152424=;
 b=ZnOdjYsyWWWPA45DX/sEP1Hz7/N21g6u4UZdn8c1qyQRQwctj1a4i6BAp20kDLoVrj6D2s
 MbD+ZTo1q9CByKhQo2XRoN4WdhbqsWP8IhvQmO5n4QjDLb4bQeMj+tjt/r7iv7ulqjYgof
 F4ISSFlfQwvH4mj7rI3COb7fhYfIaOuZZwt6hdi7/i1KgHhxe1miuwBC9ALPHJWSgBGtAq
 Hm9GThVygPLyQUzGEUG99ih95uj7Ifn3w+/L6+ojF2urlcLuEKAYpMauAHf1+Mdai5rTl4
 6N8IRoupzCe+vvFuCq6MovD0Voro2Z7OmtZqPzl66KvGCxnWY1NqHMI0nV1/OA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639174764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=ZEIc+hYHtGZ+R8Y42PTVzHWVlXMSBVtNMJGsH152424=;
 b=IxahGrtxRlopXsWUYNpTNdhCUtnqonpOEodZ3IuQBz/DFc/KxGCheju7XzPFrWnx3hqpKg
 Kcg6g5cSFSWCRQCA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 26/35] genirq/msi: Provide interface to retrieve Linux
 interrupt number
References: <20211210221642.869015045@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Dec 2021 23:19:23 +0100 (CET)
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
Cc: Nishanth Menon <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>,
 Stuart Yoder <stuyoder@gmail.com>, Will Deacon <will@kernel.org>,
 Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Sinan Kaya <okaya@kernel.org>,
 iommu@lists.linux-foundation.org, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jason Gunthorpe <jgg@nvidia.com>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Cedric Le Goater <clg@kaod.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Megha Dey <megha.dey@intel.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Juergen Gross <jgross@suse.com>, Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>,
 Marc Zygnier <maz@kernel.org>, dmaengine@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Thomas Gleixner <tglx@linutronix.de>

This allows drivers to retrieve the Linux interrupt number instead of
fiddling with MSI descriptors.

msi_get_virq() returns the Linux interrupt number or 0 in case that there
is no entry for the given MSI index.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
V2: Simplify the implementation and let PCI deal with the PCI specialities - Marc
---
 include/linux/msi.h |    2 ++
 kernel/irq/msi.c    |   36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -153,6 +153,8 @@ struct msi_device_data {
 
 int msi_setup_device_data(struct device *dev);
 
+unsigned int msi_get_virq(struct device *dev, unsigned int index);
+
 /* Helpers to hide struct msi_desc implementation details */
 #define msi_desc_to_dev(desc)		((desc)->dev)
 #define dev_to_msi_list(dev)		(&(dev)->msi_list)
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -105,6 +105,42 @@ int msi_setup_device_data(struct device
 	return 0;
 }
 
+/**
+ * msi_get_virq - Return Linux interrupt number of a MSI interrupt
+ * @dev:	Device to operate on
+ * @index:	MSI interrupt index to look for (0-based)
+ *
+ * Return: The Linux interrupt number on success (> 0), 0 if not found
+ */
+unsigned int msi_get_virq(struct device *dev, unsigned int index)
+{
+	struct msi_desc *desc;
+	bool pcimsi;
+
+	if (!dev->msi.data)
+		return 0;
+
+	pcimsi = dev_is_pci(dev) ? to_pci_dev(dev)->msi_enabled : false;
+
+	for_each_msi_entry(desc, dev) {
+		/* PCI-MSI has only one descriptor for multiple interrupts. */
+		if (pcimsi) {
+			if (desc->irq && index < desc->nvec_used)
+				return desc->irq + index;
+			break;
+		}
+
+		/*
+		 * PCI-MSIX and platform MSI use a descriptor per
+		 * interrupt.
+		 */
+		if (desc->msi_index == index)
+			return desc->irq;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(msi_get_virq);
+
 #ifdef CONFIG_SYSFS
 static ssize_t msi_mode_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)

