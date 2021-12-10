Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C5D470DAD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 23:25:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9lp33n6gz3f1D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 09:24:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pLlvWRgJ;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fGZcqe6W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=pLlvWRgJ; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=fGZcqe6W; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9lg81gPSz3cPg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 09:19:00 +1100 (AEDT)
Message-ID: <20211210221813.740644351@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639174737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=lone/RHMXjlrVHw4SO3cyBPgNXO7SR/kjpngIvo8KXc=;
 b=pLlvWRgJJR/FozuPSZc/p3nSaSDVV9NbBY8rkEojQLKfzboZJPgEZ0QGJxryfOxb5vJXjW
 eBBPB65jIQk9+B1THMlYp0yGqF4rL2yHG62KFDRr14BUWKIF7M20mar760FwMkfrQzvRuP
 frt5N2PJ/xGqaTeQW8wTK+U8KkAFAKd4htcwQHlE2SrL5D3xqkdUSaNO3M42Mz14vtKiDQ
 1TvZXJXtRgeoEBKeHM0ubuCWIcCUGNAV2hTbvSlYDalKpRKK8q1fk2cI4lSaaA29ziMele
 UAn5OHfmJCIJKFGNS3y69IG1bpP8yT509O8M0KnFnRnGtN/0Sp9b4mWVngiMzQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639174737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=lone/RHMXjlrVHw4SO3cyBPgNXO7SR/kjpngIvo8KXc=;
 b=fGZcqe6WqEa09T04QnEG0wFvQt+EXzqvmqvVYXhxq4JPl8Xl8WUjUPXH0+2Own5rPSRrGs
 rNikqidmCczP5lBg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 09/35] PCI/MSI: Allocate MSI device data on first use
References: <20211210221642.869015045@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Dec 2021 23:18:57 +0100 (CET)
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

Allocate MSI device data on first use, i.e. when a PCI driver invokes one
of the PCI/MSI enablement functions.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/msi/msi.c |   20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -900,10 +900,12 @@ static int __pci_enable_msi_range(struct
 /* deprecated, don't use */
 int pci_enable_msi(struct pci_dev *dev)
 {
-	int rc = __pci_enable_msi_range(dev, 1, 1, NULL);
-	if (rc < 0)
-		return rc;
-	return 0;
+	int rc = msi_setup_device_data(&dev->dev);
+
+	if (!rc)
+		rc = __pci_enable_msi_range(dev, 1, 1, NULL);
+
+	return rc < 0 ? rc : 0;
 }
 EXPORT_SYMBOL(pci_enable_msi);
 
@@ -958,7 +960,11 @@ static int __pci_enable_msix_range(struc
 int pci_enable_msix_range(struct pci_dev *dev, struct msix_entry *entries,
 		int minvec, int maxvec)
 {
-	return __pci_enable_msix_range(dev, entries, minvec, maxvec, NULL, 0);
+	int ret = msi_setup_device_data(&dev->dev);
+
+	if (!ret)
+		ret = __pci_enable_msix_range(dev, entries, minvec, maxvec, NULL, 0);
+	return ret;
 }
 EXPORT_SYMBOL(pci_enable_msix_range);
 
@@ -985,8 +991,12 @@ int pci_alloc_irq_vectors_affinity(struc
 				   struct irq_affinity *affd)
 {
 	struct irq_affinity msi_default_affd = {0};
+	int ret = msi_setup_device_data(&dev->dev);
 	int nvecs = -ENOSPC;
 
+	if (ret)
+		return ret;
+
 	if (flags & PCI_IRQ_AFFINITY) {
 		if (!affd)
 			affd = &msi_default_affd;

