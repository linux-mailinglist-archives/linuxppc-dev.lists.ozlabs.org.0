Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51439470E0B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 23:37:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9m4D0zjTz3g8k
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 09:37:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nf9eyrsJ;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Cgugbw7j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=nf9eyrsJ; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=Cgugbw7j; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9lgj61Vvz3cZP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 09:19:29 +1100 (AEDT)
Message-ID: <20211210221814.900929381@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639174767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=rNrzn8yRvXgsVUgYBaKAG8ZHI0uIOQ4IQLNHP2L6pxE=;
 b=nf9eyrsJJrs9ednYCFZjv8J2yY2kMTBnnjDazqRJ511KXpZJf1YcQjdYfXYm2loBQc4e51
 X1migsWpqvkVonHlgKGazqD3LQt1VEi1ONQMXlquZAUbD3bWwtHjKz6uiOhNtYIahCIAun
 mRzaRa8QncWEAJyd2oq1drpHnTqWPT1eKioZJCZmH/BKUQRxgGCPmRRh6EsC/v//nl8sL/
 boRobi4kXbHHVHnVHwhXecrQ/I8Q5OXFyHGRvTUgcBYSHxyXSCbkQ+q/m1CrmiEH4i02FY
 dX0m9VD+WaASxOutJEozXkaEXjuYirVE7txgIlds5ll8afoP9lZT4fq2oH6P3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639174767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=rNrzn8yRvXgsVUgYBaKAG8ZHI0uIOQ4IQLNHP2L6pxE=;
 b=Cgugbw7jJJgW3jPH6Q3nUfo/m4UVuVoB8e3+XhsPb07BsPv7J7QZZ/uWWrdVpdYtMpcMdt
 NSwEg+9aK1hyY+CQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 28/35] PCI/MSI: Simplify pci_irq_get_affinity()
References: <20211210221642.869015045@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Dec 2021 23:19:26 +0100 (CET)
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

Replace open coded MSI descriptor chasing and use the proper accessor
functions instead.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/pci/msi/msi.c |   26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -1061,26 +1061,20 @@ EXPORT_SYMBOL(pci_irq_vector);
  */
 const struct cpumask *pci_irq_get_affinity(struct pci_dev *dev, int nr)
 {
-	if (dev->msix_enabled) {
-		struct msi_desc *entry;
+	int irq = pci_irq_vector(dev, nr);
+	struct msi_desc *desc;
 
-		for_each_pci_msi_entry(entry, dev) {
-			if (entry->msi_index == nr)
-				return &entry->affinity->mask;
-		}
-		WARN_ON_ONCE(1);
+	if (WARN_ON_ONCE(irq <= 0))
 		return NULL;
-	} else if (dev->msi_enabled) {
-		struct msi_desc *entry = first_pci_msi_entry(dev);
 
-		if (WARN_ON_ONCE(!entry || !entry->affinity ||
-				 nr >= entry->nvec_used))
-			return NULL;
-
-		return &entry->affinity[nr].mask;
-	} else {
+	desc = irq_get_msi_desc(irq);
+	/* Non-MSI does not have the information handy */
+	if (!desc)
 		return cpu_possible_mask;
-	}
+
+	if (WARN_ON_ONCE(!desc->affinity))
+		return NULL;
+	return &desc->affinity[nr].mask;
 }
 EXPORT_SYMBOL(pci_irq_get_affinity);
 

