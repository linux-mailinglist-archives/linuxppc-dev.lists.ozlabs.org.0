Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB89625CAC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:12:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N80yH6Z0dz3cMP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:12:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cquks9wv;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=upJdg7cK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cquks9wv;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=upJdg7cK;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80hS1nzPz3cPg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:00:08 +1100 (AEDT)
Message-ID: <20221111122014.352437595@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=SR+JTKB3rKiZ73e/G+mgOLVXr9oQkVaEjTjLGttb2Gk=;
	b=cquks9wvdwGZvfTVGMseDqonmMru5Jvd1Wp80d+QA7r+OPUBjVQ33nkUC2zM/Xj1+O8fPG
	vtb671Sgwa26sjZk08mR0d6Khag9L+dcgpdaaiX3gijScukZ+VHAfliD2IMtv3iaBOUF0H
	z/MslAY6PXFpX332pOy1ThF73fCI+4dA58/e9E/htDuO/wELj5pOCP8hkEbevCn9g05Q6e
	Dc8lugCbNGIQGIngKhOUPod5JqprevnRQk8hF+mBQQn/l8M/1bzTmQzN7g8pOmzecptGGk
	/UJmMPp34YQm20YaIUWb6Ef0Mc9mjvia3FKyyNDWpMCxHg3It/xaV2cgV2oHEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=SR+JTKB3rKiZ73e/G+mgOLVXr9oQkVaEjTjLGttb2Gk=;
	b=upJdg7cKT2Y7T72CwaobIKCBWj/eDCRfZapw31fhp5ESPdWoHIOrAME2ohvtTWo1VMweL7
	27ljumxd1t7PlDBA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 13/39] PCI/MSI: Use msi_domain_info::bus_token
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:54:35 +0100 (CET)
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

Set the bus token in the msi_domain_info structure and let the core code
handle the update.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/irqdomain.c |   11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -162,8 +162,6 @@ struct irq_domain *pci_msi_create_irq_do
 					     struct msi_domain_info *info,
 					     struct irq_domain *parent)
 {
-	struct irq_domain *domain;
-
 	if (WARN_ON(info->flags & MSI_FLAG_LEVEL_CAPABLE))
 		info->flags &= ~MSI_FLAG_LEVEL_CAPABLE;
 
@@ -178,13 +176,10 @@ struct irq_domain *pci_msi_create_irq_do
 
 	/* PCI-MSI is oneshot-safe */
 	info->chip->flags |= IRQCHIP_ONESHOT_SAFE;
+	/* Let the core update the bus token */
+	info->bus_token = DOMAIN_BUS_PCI_MSI;
 
-	domain = msi_create_irq_domain(fwnode, info, parent);
-	if (!domain)
-		return NULL;
-
-	irq_domain_update_bus_token(domain, DOMAIN_BUS_PCI_MSI);
-	return domain;
+	return msi_create_irq_domain(fwnode, info, parent);
 }
 EXPORT_SYMBOL_GPL(pci_msi_create_irq_domain);
 

