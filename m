Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DF146ACEF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 23:43:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7JNg0HWtz3cT0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 09:42:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tUgqDZDZ;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=MCrfZbg7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=tUgqDZDZ; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=MCrfZbg7; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7J3S0M1jz3c7h
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 09:28:04 +1100 (AEDT)
Message-ID: <20211206210225.101336873@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638829681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=DA21nVmLDiBI7abTCMjgj20KY6xV+oZ7nL3Tb95GpzU=;
 b=tUgqDZDZ/EiCdKplAETvDx9zP2J7lXVbAOyLOoBuYDH6TGhvuPG60E8xxxj2easlDQNPkn
 zTUdmJbnIRjdW2jZn22BV2YC4f0v6JUg4B85PNY0gmnqpQ/sN1zmKIaFOZKwqGTNC8Cwta
 Zuzg0fNd26HEMDHArMjtG0lzJFq888jFDvle1JTBYdcc+inM3sPjBJytAfcyCtrn23O2UA
 KEo+a2AtJrT7M4ZyZw3GWFzmCrk8w7SJ8if/eriSWmpCeXjmWpgB3652GOnCNeZesHt7bK
 srYzZDxpjI6VQFY1vaT/mjtrbyNnxnAjKtFj8+UQL1Hs+wIUbfpLlFZD9d5QMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638829681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=DA21nVmLDiBI7abTCMjgj20KY6xV+oZ7nL3Tb95GpzU=;
 b=MCrfZbg73639x4t4CYmepEMeEst8qlRnGzxNB/5IvDcEPSsvluAaurSvCLQW1KB8HRZ02F
 1dXwMChHv9TjP5Cw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 23/23] PCI/MSI: Move descriptor counting on allocation fail
 to the legacy code
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:28:00 +0100 (CET)
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

The irqdomain code already returns the information. Move the loop to the
legacy code.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/pci/msi/legacy.c |   20 +++++++++++++++++++-
 drivers/pci/msi/msi.c    |   19 +------------------
 2 files changed, 20 insertions(+), 19 deletions(-)

--- a/drivers/pci/msi/legacy.c
+++ b/drivers/pci/msi/legacy.c
@@ -50,9 +50,27 @@ void __weak arch_teardown_msi_irqs(struc
 	}
 }
 
+static int pci_msi_setup_check_result(struct pci_dev *dev, int type, int ret)
+{
+	struct msi_desc *entry;
+	int avail = 0;
+
+	if (type != PCI_CAP_ID_MSIX || ret >= 0)
+		return ret;
+
+	/* Scan the MSI descriptors for successfully allocated ones. */
+	for_each_pci_msi_entry(entry, dev) {
+		if (entry->irq != 0)
+			avail++;
+	}
+	return avail ? avail : ret;
+}
+
 int pci_msi_legacy_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
 {
-	return arch_setup_msi_irqs(dev, nvec, type);
+	int ret = arch_setup_msi_irqs(dev, nvec, type);
+
+	return pci_msi_setup_check_result(dev, type, ret);
 }
 
 void pci_msi_legacy_teardown_msi_irqs(struct pci_dev *dev)
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -609,7 +609,7 @@ static int msix_capability_init(struct p
 
 	ret = pci_msi_setup_msi_irqs(dev, nvec, PCI_CAP_ID_MSIX);
 	if (ret)
-		goto out_avail;
+		goto out_free;
 
 	/* Check if all MSI entries honor device restrictions */
 	ret = msi_verify_entries(dev);
@@ -634,23 +634,6 @@ static int msix_capability_init(struct p
 	pcibios_free_irq(dev);
 	return 0;
 
-out_avail:
-	if (ret < 0) {
-		/*
-		 * If we had some success, report the number of IRQs
-		 * we succeeded in setting up.
-		 */
-		struct msi_desc *entry;
-		int avail = 0;
-
-		for_each_pci_msi_entry(entry, dev) {
-			if (entry->irq != 0)
-				avail++;
-		}
-		if (avail != 0)
-			ret = avail;
-	}
-
 out_free:
 	free_msi_irqs(dev);
 

