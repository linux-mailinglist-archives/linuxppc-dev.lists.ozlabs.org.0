Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A22C470E1B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 23:41:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9m9X6vTRz3fQd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 09:41:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Uy0NC+Qn;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rCtZG1LY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=Uy0NC+Qn; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=rCtZG1LY; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9lgw4fmcz3ccR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 09:19:40 +1100 (AEDT)
Message-ID: <20211210221815.329792721@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639174778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=El+H3F4NXV3E+px9T1PJDDlrE0XW8D36UmPAiNafE8w=;
 b=Uy0NC+QniJEawZ4yuuEFtqIMzw9PFLBgpx0HDrRUo2md8XUl4SS73Nl7EfE819E5PtpbVc
 LAz+1cPwMJ/P73wMT+BU/i9qA4amhAWgAueMd0/fC606btT7duSv4NvM14w5Glhzh8MMt6
 Vf8SrpkxfuLKYwgK8ZgtU7FQjNQoMGjZqRjEQAW68HIHWKLNXxWyDiwhGs8MAwuo+Mw6+1
 gNzbkVQZh77bKcaEtUEDOtwWMdTwvsOeTeAuHpf0qQRNTFrf+/FLo1BbMBzYXFZsIbop/R
 ssapnQMEEzj69/QY+0rBqrGI4rNejNtgJBDAT+PK0tQBj3vgRF91DKkGdlcQHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639174778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=El+H3F4NXV3E+px9T1PJDDlrE0XW8D36UmPAiNafE8w=;
 b=rCtZG1LYH0eCoa6arIPeivQCBnZ/C7/60VDfvadqZFSQ6CFg6eVTEQvW1V/zkV59EqrcH/
 ZMdJiiA2xvl8beBw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 35/35] dmaengine: qcom_hidma: Cleanup MSI handling
References: <20211210221642.869015045@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Dec 2021 23:19:37 +0100 (CET)
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

There is no reason to walk the MSI descriptors to retrieve the interrupt
number for a device. Use msi_get_virq() instead.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Acked-by: Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org
---
 drivers/dma/qcom/hidma.c |   42 ++++++++++++++++++------------------------
 1 file changed, 18 insertions(+), 24 deletions(-)

--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -678,11 +678,13 @@ static void hidma_free_msis(struct hidma
 {
 #ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
 	struct device *dev = dmadev->ddev.dev;
-	struct msi_desc *desc;
+	int i, virq;
 
-	/* free allocated MSI interrupts above */
-	for_each_msi_entry(desc, dev)
-		devm_free_irq(dev, desc->irq, &dmadev->lldev);
+	for (i = 0; i < HIDMA_MSI_INTS; i++) {
+		virq = msi_get_virq(dev, i);
+		if (virq)
+			devm_free_irq(dev, virq, &dmadev->lldev);
+	}
 
 	platform_msi_domain_free_irqs(dev);
 #endif
@@ -692,45 +694,37 @@ static int hidma_request_msi(struct hidm
 			     struct platform_device *pdev)
 {
 #ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
-	int rc;
-	struct msi_desc *desc;
-	struct msi_desc *failed_desc = NULL;
+	int rc, i, virq;
 
 	rc = platform_msi_domain_alloc_irqs(&pdev->dev, HIDMA_MSI_INTS,
 					    hidma_write_msi_msg);
 	if (rc)
 		return rc;
 
-	for_each_msi_entry(desc, &pdev->dev) {
-		if (!desc->msi_index)
-			dmadev->msi_virqbase = desc->irq;
-
-		rc = devm_request_irq(&pdev->dev, desc->irq,
+	for (i = 0; i < HIDMA_MSI_INTS; i++) {
+		virq = msi_get_virq(&pdev->dev, i);
+		rc = devm_request_irq(&pdev->dev, virq,
 				       hidma_chirq_handler_msi,
 				       0, "qcom-hidma-msi",
 				       &dmadev->lldev);
-		if (rc) {
-			failed_desc = desc;
+		if (rc)
 			break;
-		}
+		if (!i)
+			dmadev->msi_virqbase = virq;
 	}
 
 	if (rc) {
 		/* free allocated MSI interrupts above */
-		for_each_msi_entry(desc, &pdev->dev) {
-			if (desc == failed_desc)
-				break;
-			devm_free_irq(&pdev->dev, desc->irq,
-				      &dmadev->lldev);
+		for (--i; i >= 0; i--) {
+			virq = msi_get_virq(&pdev->dev, i);
+			devm_free_irq(&pdev->dev, virq, &dmadev->lldev);
 		}
+		dev_warn(&pdev->dev,
+			 "failed to request MSI irq, falling back to wired IRQ\n");
 	} else {
 		/* Add callback to free MSIs on teardown */
 		hidma_ll_setup_irq(dmadev->lldev, true);
-
 	}
-	if (rc)
-		dev_warn(&pdev->dev,
-			 "failed to request MSI irq, falling back to wired IRQ\n");
 	return rc;
 #else
 	return -EINVAL;

