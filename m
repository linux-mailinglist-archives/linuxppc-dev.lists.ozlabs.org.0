Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F9C475E75
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 18:20:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDhpW2JPGz3cNk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 04:20:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wYhmWV2t;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lk+vW3OX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=wYhmWV2t; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=lk+vW3OX; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDhns06X7z2xth
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 04:20:00 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639588790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8dWZtEdF7LamMiNHDQtUJa+ux0BuM6MSUIqH9b+Hvyo=;
 b=wYhmWV2tAzCQfd9US7tK/sDWCnBbJEkh0toY9VDuwtDZ0a56PMo8BoccPtbLPELWo9I28H
 HKc2neisW5z7nVF58H33hQ6I3JpDjp7x8Kvp/cCgjUvnYD8QdYGH61A1BeXSEXOYr4fYH5
 DLBlYKQg7bDxik0O85eEeU6t0YgTJ460cdP5T6mA0DAEz4t2jvbnSoMRyHmCdRIsX+WU5+
 q/5iZYQod3bSNBGwjqvNjip+w8Kzgei0iFMPfqmZqeU25htKL5R6ykYiRwqQfnG6lFz+mQ
 r3FvWyI39vnZ4v4UgiVkKOdpkffYfcVyqNIiIF+3PGfZRf0ksOR9s1/A7ZSHGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639588790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8dWZtEdF7LamMiNHDQtUJa+ux0BuM6MSUIqH9b+Hvyo=;
 b=lk+vW3OXeYaf8seyWIaOrmuYBvQZ09fZDnlpC9df3JMNaqJ74ZUxSByXPFwmhYxR0MLbL9
 iLeRWTRdVJiovHBA==
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V4 09-02/35] PCI/MSI: Allocate MSI device data on first use
In-Reply-To: <87tuf9rdoj.ffs@tglx>
References: <20211210221642.869015045@linutronix.de>
 <20211210221813.740644351@linutronix.de> <87tuf9rdoj.ffs@tglx>
Date: Wed, 15 Dec 2021 18:19:49 +0100
Message-ID: <87r1adrdje.ffs@tglx>
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

Allocate MSI device data on first use, i.e. when a PCI driver invokes one
of the PCI/MSI enablement functions.

Add a wrapper function to ensure that the ordering vs. pcim_msi_release()
is correct.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V4: Adopted to ensure devres ordering
---
 drivers/pci/msi/msi.c |   17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -366,6 +366,19 @@ static int pcim_setup_msi_release(struct
 	return ret;
 }
 
+/*
+ * Ordering vs. devres: msi device data has to be installed first so that
+ * pcim_msi_release() is invoked before it on device release.
+ */
+static int pci_setup_msi_context(struct pci_dev *dev)
+{
+	int ret = msi_setup_device_data(&dev->dev);
+
+	if (!ret)
+		ret = pcim_setup_msi_release(dev);
+	return ret;
+}
+
 static struct msi_desc *
 msi_setup_entry(struct pci_dev *dev, int nvec, struct irq_affinity *affd)
 {
@@ -909,7 +922,7 @@ static int __pci_enable_msi_range(struct
 	if (nvec > maxvec)
 		nvec = maxvec;
 
-	rc = pcim_setup_msi_release(dev);
+	rc = pci_setup_msi_context(dev);
 	if (rc)
 		return rc;
 
@@ -956,7 +969,7 @@ static int __pci_enable_msix_range(struc
 	if (WARN_ON_ONCE(dev->msix_enabled))
 		return -EINVAL;
 
-	rc = pcim_setup_msi_release(dev);
+	rc = pci_setup_msi_context(dev);
 	if (rc)
 		return rc;
 
