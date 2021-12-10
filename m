Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E68A9470DA7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 23:21:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9lkJ6CLsz3ckB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 09:21:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pE4rQ2ru;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4a4+C7Wh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=pE4rQ2ru; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=4a4+C7Wh; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9lg203c3z2xtW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 09:18:53 +1100 (AEDT)
Message-ID: <20211210221813.434156196@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639174730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=VrU+cUwVNt/tRlW4lw+bzWjrRhpWxr0n5kAnta20rq4=;
 b=pE4rQ2ru1rC+MOxwgCFck9hIsKI0LjZICNGNwEw8ze9/meweY1qANt4dgwIHKfQOPC1beg
 yPBns7caG7PjSlQkEoMvTCi/DDid/5ijo+pcU/3ZLIE1LS+qQRJIeuxZj2Mi/GYsUgFxDG
 UfE4buF12pfMJCkH4E7kXOGXF3Tdxoadhmimlb4Oqaa6At4sxsqGTcRd4XwvSUVolW7xT/
 BZ6l4WzdOdHBFzRU8fuHCGeKVTvU3fpMB68bg/XbArySIyUaHyjLg/eiywsouAZhDcRfnk
 7ETqReSwtzm9CpcynGCRQWFvda5xRxitOgtngCsHnX2u5kMmZ6hOfaZO1ylegg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639174730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=VrU+cUwVNt/tRlW4lw+bzWjrRhpWxr0n5kAnta20rq4=;
 b=4a4+C7WhuYdeuyTtWKdNyTdvLDhhfziSubOZ+5mUXlzgk+OuqIM6rjcLPfL3/GtWFOnIFc
 gcXKQZiyuUQutAAA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 04/35] genirq/msi: Use PCI device property
References: <20211210221642.869015045@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Dec 2021 23:18:49 +0100 (CET)
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

to determine whether this is MSI or MSIX instead of consulting MSI
descriptors.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V2: Use PCI device property - Jason
---
 kernel/irq/msi.c |   17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -77,21 +77,8 @@ EXPORT_SYMBOL_GPL(get_cached_msi_msg);
 static ssize_t msi_mode_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
-	struct msi_desc *entry;
-	bool is_msix = false;
-	unsigned long irq;
-	int retval;
-
-	retval = kstrtoul(attr->attr.name, 10, &irq);
-	if (retval)
-		return retval;
-
-	entry = irq_get_msi_desc(irq);
-	if (!entry)
-		return -ENODEV;
-
-	if (dev_is_pci(dev))
-		is_msix = entry->pci.msi_attrib.is_msix;
+	/* MSI vs. MSIX is per device not per interrupt */
+	bool is_msix = dev_is_pci(dev) ? to_pci_dev(dev)->msix_enabled : false;
 
 	return sysfs_emit(buf, "%s\n", is_msix ? "msix" : "msi");
 }

