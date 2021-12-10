Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94695470E09
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 23:36:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9m3W3lbvz3g5s
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 09:36:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=z6iPEnfV;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ClMHqdNE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=z6iPEnfV; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=ClMHqdNE; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9lgh2BTlz3cTK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 09:19:28 +1100 (AEDT)
Message-ID: <20211210221814.841243231@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639174765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=ja9fbkTMChiYC+RHKTG35XzzVDvmaXMgaMrb6WY3XeQ=;
 b=z6iPEnfVAgwlW1Qbnq1nCFWwA6bNapErKquzAi3fk6aQqeO9o4U4iwQjv+EebRfvLnwN8n
 e63ahKnp4QuQIaqzvffdsynbWgeJGaK4CvS+c+uMgRBceXI7VODqOegmQe3L/CvghbDhuO
 LN91tjaF0S12KexgZs8cR5/oZ2rSgoo7wgdZrtLgJvkHGW3yStep1fiuvR7g41IWJCZNnu
 Rdmmg97HfnTylsxqpzgAYVzZaMeXvWfNQQ5rvNFbwpEWwzgtXnQ4/DZTiIX/XN8OvdQ75p
 NdflsNWb6DcWnXBSu0XhAKL30N7MQvosu7Eo61JG6PvjMi8bgOFzC5eVez11kQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639174765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=ja9fbkTMChiYC+RHKTG35XzzVDvmaXMgaMrb6WY3XeQ=;
 b=ClMHqdNEhBqMOb1sVFaSm0KweWWAEZJCgeJM/hGJMp5ROj9kquAcj3PJfKxxeM3i7GOxBS
 FHUfoC+s+JX7GLDA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 27/35] PCI/MSI: Use __msi_get_virq() in pci_get_vector()
References: <20211210221642.869015045@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Dec 2021 23:19:25 +0100 (CET)
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

Use msi_get_vector() and handle the return value to be compatible.

No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
V2: Handle the INTx case directly instead of trying to be overly smart - Marc
---
 drivers/pci/msi/msi.c |   25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -1037,28 +1037,13 @@ EXPORT_SYMBOL(pci_free_irq_vectors);
  */
 int pci_irq_vector(struct pci_dev *dev, unsigned int nr)
 {
-	if (dev->msix_enabled) {
-		struct msi_desc *entry;
+	unsigned int irq;
 
-		for_each_pci_msi_entry(entry, dev) {
-			if (entry->msi_index == nr)
-				return entry->irq;
-		}
-		WARN_ON_ONCE(1);
-		return -EINVAL;
-	}
+	if (!dev->msi_enabled && !dev->msix_enabled)
+		return !nr ? dev->irq : -EINVAL;
 
-	if (dev->msi_enabled) {
-		struct msi_desc *entry = first_pci_msi_entry(dev);
-
-		if (WARN_ON_ONCE(nr >= entry->nvec_used))
-			return -EINVAL;
-	} else {
-		if (WARN_ON_ONCE(nr > 0))
-			return -EINVAL;
-	}
-
-	return dev->irq + nr;
+	irq = msi_get_virq(&dev->dev, nr);
+	return irq ? irq : -EINVAL;
 }
 EXPORT_SYMBOL(pci_irq_vector);
 

