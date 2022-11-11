Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9FE625D0B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:30:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N81M56ZfVz3flj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:30:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Su8Wkdkt;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=KIGuSY4S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Su8Wkdkt;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=KIGuSY4S;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80pH0jCVz3fKS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:05:11 +1100 (AEDT)
Message-ID: <20221111122015.516946468@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=o9tkl2d2tC9egQPEBUifcDdfF9knjDTOjOdgLUksEhs=;
	b=Su8WkdktmaQZnQFe4G4U9ma1vOuBXXYDHeKzs+nJ4ypK8tbIDeDg8t6p/+iwp2yjUe4Ht2
	/IZqPBRcKzvLSqBTBkToQ1mY4FdrLYKjU4mUPBPRZkmYWS7wxcklecLp+/LDx6I692inbi
	Pib/VAL+L1e3KDQHzOZDaZQh/oyZaQw7ZJnPjVjU/EA3ZFoLLwCEMCjYytL8YLpcWgzJTS
	t4HDKCTcEHB4VWAjNHDLvB05QuEGqQq0NPv2w1YnGFMqdqAC5n7pRdANlemgsj9cTxS0Pq
	0NgymSBVP6eTSi+POjdh2sZLy0a//ARWXxQnrBVfmVehy/yDf52zIoCs24JUFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=o9tkl2d2tC9egQPEBUifcDdfF9knjDTOjOdgLUksEhs=;
	b=KIGuSY4SHqfY2xYt0UXwXFotUsRZ7MwILcY+hFirUyhfKVZQYvYuooVliEYPFYi0XbVRDs
	q/SAL05mXclgyDCw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 33/39] PCI/MSI: Sanitize MSI-X checks
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:55:07 +0100 (CET)
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

There is no point in doing the same sanity checks over and over in a loop
during MSI-X enablement. Put them in front of the loop and return early
when they fail.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/msi.c |   67 +++++++++++++++++++++++++-------------------------
 1 file changed, 34 insertions(+), 33 deletions(-)

--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -721,47 +721,31 @@ static int msix_capability_init(struct p
 	return ret;
 }
 
-static int __pci_enable_msix(struct pci_dev *dev, struct msix_entry *entries,
-			     int nvec, struct irq_affinity *affd, int flags)
+static bool pci_msix_validate_entries(struct msix_entry *entries, int nvec, int hwsize)
 {
-	int nr_entries;
 	int i, j;
 
-	if (!pci_msi_supported(dev, nvec) || dev->current_state != PCI_D0)
-		return -EINVAL;
+	if (!entries)
+		return true;
 
-	nr_entries = pci_msix_vec_count(dev);
-	if (nr_entries < 0)
-		return nr_entries;
-	if (nvec > nr_entries && !(flags & PCI_IRQ_VIRTUAL))
-		return nr_entries;
-
-	if (entries) {
-		/* Check for any invalid entries */
-		for (i = 0; i < nvec; i++) {
-			if (entries[i].entry >= nr_entries)
-				return -EINVAL;		/* invalid entry */
-			for (j = i + 1; j < nvec; j++) {
-				if (entries[i].entry == entries[j].entry)
-					return -EINVAL;	/* duplicate entry */
-			}
+	for (i = 0; i < nvec; i++) {
+		/* Entry within hardware limit? */
+		if (entries[i].entry >= hwsize)
+			return false;
+
+		/* Check for duplicate entries */
+		for (j = i + 1; j < nvec; j++) {
+			if (entries[i].entry == entries[j].entry)
+				return false;
 		}
 	}
-
-	/* Check whether driver already requested for MSI IRQ */
-	if (dev->msi_enabled) {
-		pci_info(dev, "can't enable MSI-X (MSI IRQ already assigned)\n");
-		return -EINVAL;
-	}
-	return msix_capability_init(dev, entries, nvec, affd);
+	return true;
 }
 
-int __pci_enable_msix_range(struct pci_dev *dev,
-			    struct msix_entry *entries, int minvec,
-			    int maxvec, struct irq_affinity *affd,
-			    int flags)
+int __pci_enable_msix_range(struct pci_dev *dev, struct msix_entry *entries, int minvec,
+			    int maxvec, struct irq_affinity *affd, int flags)
 {
-	int rc, nvec = maxvec;
+	int hwsize, rc, nvec = maxvec;
 
 	if (maxvec < minvec)
 		return -ERANGE;
@@ -774,6 +758,23 @@ int __pci_enable_msix_range(struct pci_d
 	if (WARN_ON_ONCE(dev->msix_enabled))
 		return -EINVAL;
 
+	if (!pci_msi_supported(dev, nvec) || dev->current_state != PCI_D0)
+		return -EINVAL;
+
+	hwsize = pci_msix_vec_count(dev);
+	if (hwsize < 0)
+		return hwsize;
+
+	if (!pci_msix_validate_entries(entries, nvec, hwsize))
+		return -EINVAL;
+
+	/* PCI_IRQ_VIRTUAL is a horrible hack! */
+	if (nvec > hwsize && !(flags & PCI_IRQ_VIRTUAL))
+		nvec = hwsize;
+
+	if (nvec < minvec)
+		return -ENOSPC;
+
 	rc = pci_setup_msi_context(dev);
 	if (rc)
 		return rc;
@@ -785,7 +786,7 @@ int __pci_enable_msix_range(struct pci_d
 				return -ENOSPC;
 		}
 
-		rc = __pci_enable_msix(dev, entries, nvec, affd, flags);
+		rc = msix_capability_init(dev, entries, nvec, affd);
 		if (rc == 0)
 			return nvec;
 

