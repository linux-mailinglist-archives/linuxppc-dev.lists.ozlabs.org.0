Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DE9625CD5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:21:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N818m0YXjz3flJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:21:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qtOLrPfL;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9t/bFWqC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qtOLrPfL;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9t/bFWqC;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80p45Rydz3fJh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:05:00 +1100 (AEDT)
Message-ID: <20221111122015.271447896@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=uSFXy88Ws6eNkV/cYwDRULmA+6GRqcWIzt5ADLcbTDw=;
	b=qtOLrPfLAgkAZVy6NU1Qu4bTgTB43Bj44kvSwwsRH2ZnPNV8dgX7HwnPsn22qu8w9m7yL2
	A97svlVBbgwk1Kouj39B9/00uFrvjnNmfsSosW6KlZXHE8ipZjQ0zh2qu2h4JEOniktLvM
	DdJLcXVpW+4EUh71Wah1RWNgffLHTJmi70jycylYYTUnXe5mTgu11BanYjAsDqbjHjh5Cj
	jNVdIefLpB/Et84Tmy/wCrmUO2sDcrVo8lhj8nIcgrZW5QGFV0eKkEMimQbvvAjsRl/0w+
	VdXkapfyi/PEEHMzxyAKo9mdYdwp3K4g/p7Prgjc0/kxGJjy/daFCUOg+YK/3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=uSFXy88Ws6eNkV/cYwDRULmA+6GRqcWIzt5ADLcbTDw=;
	b=9t/bFWqCfq8f0C3vQmoP3/db8s/pcp6OGrpaut5YexKKU5gS1ZtJ1Y4TbyTmvAad70QZt8
	pyB9AsmnH5FIAdCA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 29/39] PCI/MSI: Move pci_msi_enabled() to api.c
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:55:01 +0100 (CET)
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

From: Ahmed S. Darwish <darwi@linutronix.de>

To distangle the maze in msi.c, all exported device-driver MSI APIs are
now to be grouped in one file, api.c.

Move pci_msi_enabled() and make its kernel-doc comprehensive.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 drivers/pci/msi/api.c | 12 ++++++++++++
 drivers/pci/msi/msi.c | 14 +-------------
 drivers/pci/msi/msi.h |  3 +++
 3 files changed, 16 insertions(+), 13 deletions(-)
---
diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
index 473df7ba0584..ee9ed5ccd94d 100644
--- a/drivers/pci/msi/api.c
+++ b/drivers/pci/msi/api.c
@@ -307,3 +307,15 @@ void pci_free_irq_vectors(struct pci_dev *dev)
 	pci_disable_msi(dev);
 }
 EXPORT_SYMBOL(pci_free_irq_vectors);
+
+/**
+ * pci_msi_enabled() - Are MSI(-X) interrupts enabled system-wide?
+ *
+ * Return: true if MSI has not been globally disabled through ACPI FADT,
+ * PCI bridge quirks, or the "pci=nomsi" kernel command-line option.
+ */
+int pci_msi_enabled(void)
+{
+	return pci_msi_enable;
+}
+EXPORT_SYMBOL(pci_msi_enabled);
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index d78646d1c116..59c33bc7fe81 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -13,7 +13,7 @@
 #include "../pci.h"
 #include "msi.h"
 
-static int pci_msi_enable = 1;
+int pci_msi_enable = 1;
 int pci_msi_ignore_mask;
 
 void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 set)
@@ -864,15 +864,3 @@ void pci_no_msi(void)
 {
 	pci_msi_enable = 0;
 }
-
-/**
- * pci_msi_enabled - is MSI enabled?
- *
- * Returns true if MSI has not been disabled by the command-line option
- * pci=nomsi.
- **/
-int pci_msi_enabled(void)
-{
-	return pci_msi_enable;
-}
-EXPORT_SYMBOL(pci_msi_enabled);
diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
index 77e2587f7e4f..f3f4ede53171 100644
--- a/drivers/pci/msi/msi.h
+++ b/drivers/pci/msi/msi.h
@@ -84,6 +84,9 @@ static inline __attribute_const__ u32 msi_multi_mask(struct msi_desc *desc)
 	return (1 << (1 << desc->pci.msi_attrib.multi_cap)) - 1;
 }
 
+/* Subsystem variables */
+extern int pci_msi_enable;
+
 /* MSI internal functions invoked from the public APIs */
 void pci_msi_shutdown(struct pci_dev *dev);
 void pci_msix_shutdown(struct pci_dev *dev);

