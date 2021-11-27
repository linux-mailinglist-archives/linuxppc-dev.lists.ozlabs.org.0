Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A2845FAE2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 02:32:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1DcY2rWYz3f4d
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 12:32:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=G06m8xMV;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=J3h+hmKr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=G06m8xMV; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=J3h+hmKr; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1DKW4HN2z3cG2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 12:19:11 +1100 (AEDT)
Message-ID: <20211126223825.205369150@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637975944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=nFqFw10FNB3YOwALwDw82lvlHKuNVaj2KNOVAS+AX+k=;
 b=G06m8xMVNgCtY4eLFjx0Gf0UEo7YHbTN3rxfoRgzMAQNjSyOhHLYWl1Ikzcx1das+1sGgR
 XlzQnk85UAa1wgbuHZfRxIv0Tptn0O6ASXyaW+XA4AtRGc5NqoXoMWrH8JyNLO1TbACyNs
 ThrpDSP5owVZnF1lPpqZ5HBhdbbP3377wrFMfqt8kSFjGYtgCoo5Htge03VxxnWqOl6VeU
 qx8+Ka4RU70TZWBrcecHxtKGEd0uRNlpAUNT2tq6ZjXX/PFES+2pneG/ehtJ3MI4dwoNkA
 8VWSPGtF+GW5n1+OGRM2a6VqtOk81cbZ+6zTHUvUBTGOgQayss65pWv38PCcLw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637975944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=nFqFw10FNB3YOwALwDw82lvlHKuNVaj2KNOVAS+AX+k=;
 b=J3h+hmKrqWBzzv5vAzWUlxB8bJHst//jw7wAG5CmDPYqR+ZozHFkbxD9VTuTA8lDv7Htjr
 HBwohK1y6ZdNv+DQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 19/22] PCI/MSI: Sanitize MSIX table map handling
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:19:04 +0100 (CET)
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

Unmapping the MSIX base mapping in the loops which allocate/free MSI
desciptors is daft and in the way of allowing runtime expansion of MSI-X
descriptors.

Store the mapping in struct pci_dev and free it after freeing the MSI-X
descriptors.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/msi.c |   18 ++++++++----------
 include/linux/pci.h   |    1 +
 2 files changed, 9 insertions(+), 10 deletions(-)

--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -241,14 +241,14 @@ static void free_msi_irqs(struct pci_dev
 	pci_msi_teardown_msi_irqs(dev);
 
 	list_for_each_entry_safe(entry, tmp, msi_list, list) {
-		if (entry->pci.msi_attrib.is_msix) {
-			if (list_is_last(&entry->list, msi_list))
-				iounmap(entry->pci.mask_base);
-		}
-
 		list_del(&entry->list);
 		free_msi_entry(entry);
 	}
+
+	if (dev->msix_base) {
+		iounmap(dev->msix_base);
+		dev->msix_base = NULL;
+	}
 }
 
 static void pci_intx_for_msi(struct pci_dev *dev, int enable)
@@ -501,10 +501,6 @@ static int msix_setup_entries(struct pci
 	for (i = 0, curmsk = masks; i < nvec; i++) {
 		entry = alloc_msi_entry(&dev->dev, 1, curmsk);
 		if (!entry) {
-			if (!i)
-				iounmap(base);
-			else
-				free_msi_irqs(dev);
 			/* No enough memory. Don't try again */
 			ret = -ENOMEM;
 			goto out;
@@ -602,12 +598,14 @@ static int msix_capability_init(struct p
 		goto out_disable;
 	}
 
+	dev->msix_base = base;
+
 	/* Ensure that all table entries are masked. */
 	msix_mask_all(base, tsize);
 
 	ret = msix_setup_entries(dev, base, entries, nvec, affd);
 	if (ret)
-		goto out_disable;
+		goto out_free;
 
 	ret = pci_msi_setup_msi_irqs(dev, nvec, PCI_CAP_ID_MSIX);
 	if (ret)
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -473,6 +473,7 @@ struct pci_dev {
 	u8		ptm_granularity;
 #endif
 #ifdef CONFIG_PCI_MSI
+	void __iomem	*msix_base;
 	const struct attribute_group **msi_irq_groups;
 #endif
 	struct pci_vpd	vpd;

