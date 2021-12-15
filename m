Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 893FA475E67
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 18:17:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDhkr2bsjz3cRh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 04:17:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=i6Ikjou/;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=uXGey63V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=i6Ikjou/; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=uXGey63V; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDhk91trvz2yNY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 04:16:48 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639588605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hTXOQ1FMkJ0+Ve5/rvFPORGJ7hh35Px6k1s7EMBqwmo=;
 b=i6Ikjou/b+Yv6lqIV32A3e7GrIvLIXj3odnZe3TCIDVaZVz2iBNvzwVInSKTb//rUts3UC
 JXIUPspxUbLjL9vLFCxTqkEmsPcQqa0jlRZz9J/ERXHS6IU+v5Pv+VEwjaIZfQH59cCNVG
 TqlToMkGDTbisox0dOJ/N64NarNbO3ICfcEhoFvRBVMDwbMb41vhNRSUHGUzt3KciwFYd7
 KRvqTPgAkbaRf2bOiXIaKgM/dYKSqDiHD48+e3p3RQ+gRngvixMUmQX9dMSiQcMx2hbtZI
 cHrIArstu1gEQ3/ZZ5d7srqdLoqOVYjoPAeWdZ3az2kYFP70K+iy5VdJAoq5Kg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639588605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hTXOQ1FMkJ0+Ve5/rvFPORGJ7hh35Px6k1s7EMBqwmo=;
 b=uXGey63VsKcnveGMEu+kEJG3x08mVaUqgXZXmEYNmGM1D3z+MIXuzL71XeYcsBJuZs9Whq
 rytYH1rq8fa5TmBg==
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V4 09-01/35] PCI/MSI: Decouple MSI[-X] disable from
 pcim_release()
In-Reply-To: <20211210221813.740644351@linutronix.de>
References: <20211210221642.869015045@linutronix.de>
 <20211210221813.740644351@linutronix.de>
Date: Wed, 15 Dec 2021 18:16:44 +0100
Message-ID: <87tuf9rdoj.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

The MSI core will introduce runtime allocation of MSI related data. This
data will be devres managed and has to be set up before enabling
PCI/MSI[-X]. This would introduce an ordering issue vs. pcim_release().

The setup order is:

   pcim_enable_device()
	devres_alloc(pcim_release...);
	...
	pci_irq_alloc()
	  msi_setup_device_data()
	     devres_alloc(msi_device_data_release, ...)

and once the device is released these release functions are invoked in the
opposite order:

    msi_device_data_release()
    ...
    pcim_release()
       pci_disable_msi[x]()

which is obviously wrong, because pci_disable_msi[x]() requires the MSI
data to be available to tear down the MSI[-X] interrupts.

Remove the MSI[-X] teardown from pcim_release() and add an explicit action
to be installed on the attempt of enabling PCI/MSI[-X].

This allows the MSI core data allocation to be ordered correctly in a
subsequent step.

Reported-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V4: New patch
---
 drivers/pci/msi/msi.c |   33 +++++++++++++++++++++++++++++++++
 drivers/pci/pci.c     |    5 -----
 include/linux/pci.h   |    3 ++-
 3 files changed, 35 insertions(+), 6 deletions(-)

--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -341,6 +341,31 @@ void pci_restore_msi_state(struct pci_de
 }
 EXPORT_SYMBOL_GPL(pci_restore_msi_state);
 
+static void pcim_msi_release(void *pcidev)
+{
+	struct pci_dev *dev = pcidev;
+
+	dev->is_msi_managed = false;
+	pci_free_irq_vectors(dev);
+}
+
+/*
+ * Needs to be separate from pcim_release to prevent an ordering problem
+ * vs. msi_device_data_release() in the MSI core code.
+ */
+static int pcim_setup_msi_release(struct pci_dev *dev)
+{
+	int ret;
+
+	if (!pci_is_managed(dev) || dev->is_msi_managed)
+		return 0;
+
+	ret = devm_add_action(&dev->dev, pcim_msi_release, dev);
+	if (!ret)
+		dev->is_msi_managed = true;
+	return ret;
+}
+
 static struct msi_desc *
 msi_setup_entry(struct pci_dev *dev, int nvec, struct irq_affinity *affd)
 {
@@ -884,6 +909,10 @@ static int __pci_enable_msi_range(struct
 	if (nvec > maxvec)
 		nvec = maxvec;
 
+	rc = pcim_setup_msi_release(dev);
+	if (rc)
+		return rc;
+
 	for (;;) {
 		if (affd) {
 			nvec = irq_calc_affinity_vectors(minvec, nvec, affd);
@@ -927,6 +956,10 @@ static int __pci_enable_msix_range(struc
 	if (WARN_ON_ONCE(dev->msix_enabled))
 		return -EINVAL;
 
+	rc = pcim_setup_msi_release(dev);
+	if (rc)
+		return rc;
+
 	for (;;) {
 		if (affd) {
 			nvec = irq_calc_affinity_vectors(minvec, nvec, affd);
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2024,11 +2024,6 @@ static void pcim_release(struct device *
 	struct pci_devres *this = res;
 	int i;
 
-	if (dev->msi_enabled)
-		pci_disable_msi(dev);
-	if (dev->msix_enabled)
-		pci_disable_msix(dev);
-
 	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++)
 		if (this->region_mask & (1 << i))
 			pci_release_region(dev, i);
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -425,7 +425,8 @@ struct pci_dev {
 	unsigned int	ats_enabled:1;		/* Address Translation Svc */
 	unsigned int	pasid_enabled:1;	/* Process Address Space ID */
 	unsigned int	pri_enabled:1;		/* Page Request Interface */
-	unsigned int	is_managed:1;
+	unsigned int	is_managed:1;		/* Managed via devres */
+	unsigned int	is_msi_managed:1;	/* MSI release via devres installed */
 	unsigned int	needs_freset:1;		/* Requires fundamental reset */
 	unsigned int	state_saved:1;
 	unsigned int	is_physfn:1;
