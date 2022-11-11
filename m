Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25710625CB8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:15:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N812b6pjsz3fRM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:15:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VRE7MeUl;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=3NdsAzuz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VRE7MeUl;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=3NdsAzuz;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80p15SZQz3fJB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:04:57 +1100 (AEDT)
Message-ID: <20221111122015.749446904@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Ih0SYkcSYwketpyalRo87sRSG9j843DJDGdjQI9dFbE=;
	b=VRE7MeUlB+cCM6U0cjMzbGN3WDIQa4HFZh7046HSLFSqzZZR+YCs/CdvdLqq6MWSGZekns
	H/dGx3if2rOBFQbosYmjXgs8H6R5QzfT4Wx9HUiK3bRvDeCd3Y2/aKwsZmLgcB2RLXpdOs
	oVkPfJgyTtJEli4A4Tu93d2MK7EdOeIEH+Y0BZTm7D17rn3qKvvsqjvAZrJgzd7vVJM1e9
	1Z0lHU2nKsnKqYI3bqO1EqiYcRaa2k7iEq2ImYpiFsxIhbdqk1xQCU1UqPFsjb5fWestXq
	04JcUcgHgsR+8pKz5h9KEtGpLzv4hoUBfbtq/MJ4c2jMIoOztbmH2Ysjx6MsoQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Ih0SYkcSYwketpyalRo87sRSG9j843DJDGdjQI9dFbE=;
	b=3NdsAzuzZxu0dT7r41E3zPAtIf/iHCijDpTpmlZOnjI92Lbu6pLEazC2N//W9XAeQ4XAqW
	7LzccZ7efW9feDBw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 37/39] PCI/MSI: Remove redundant msi_check() callback
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:55:14 +0100 (CET)
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

All these sanity checks are now done _before_ any allocation work
happens. No point in doing it twice.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/irqdomain.c |   48 --------------------------------------------
 1 file changed, 48 deletions(-)

--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -64,51 +64,6 @@ static irq_hw_number_t pci_msi_domain_ca
 		(pci_domain_nr(dev->bus) & 0xFFFFFFFF) << 27;
 }
 
-static inline bool pci_msi_desc_is_multi_msi(struct msi_desc *desc)
-{
-	return !desc->pci.msi_attrib.is_msix && desc->nvec_used > 1;
-}
-
-/**
- * pci_msi_domain_check_cap - Verify that @domain supports the capabilities
- *			      for @dev
- * @domain:	The interrupt domain to check
- * @info:	The domain info for verification
- * @dev:	The device to check
- *
- * Returns:
- *  0 if the functionality is supported
- *  1 if Multi MSI is requested, but the domain does not support it
- *  -ENOTSUPP otherwise
- */
-static int pci_msi_domain_check_cap(struct irq_domain *domain,
-				    struct msi_domain_info *info,
-				    struct device *dev)
-{
-	struct msi_desc *desc = msi_first_desc(dev, MSI_DESC_ALL);
-
-	/* Special handling to support __pci_enable_msi_range() */
-	if (pci_msi_desc_is_multi_msi(desc) &&
-	    !(info->flags & MSI_FLAG_MULTI_PCI_MSI))
-		return 1;
-
-	if (desc->pci.msi_attrib.is_msix) {
-		if (!(info->flags & MSI_FLAG_PCI_MSIX))
-			return -ENOTSUPP;
-
-		if (info->flags & MSI_FLAG_MSIX_CONTIGUOUS) {
-			unsigned int idx = 0;
-
-			/* Check for gaps in the entry indices */
-			msi_for_each_desc(desc, dev, MSI_DESC_ALL) {
-				if (desc->msi_index != idx++)
-					return -ENOTSUPP;
-			}
-		}
-	}
-	return 0;
-}
-
 static void pci_msi_domain_set_desc(msi_alloc_info_t *arg,
 				    struct msi_desc *desc)
 {
@@ -118,7 +73,6 @@ static void pci_msi_domain_set_desc(msi_
 
 static struct msi_domain_ops pci_msi_domain_ops_default = {
 	.set_desc	= pci_msi_domain_set_desc,
-	.msi_check	= pci_msi_domain_check_cap,
 };
 
 static void pci_msi_domain_update_dom_ops(struct msi_domain_info *info)
@@ -130,8 +84,6 @@ static void pci_msi_domain_update_dom_op
 	} else {
 		if (ops->set_desc == NULL)
 			ops->set_desc = pci_msi_domain_set_desc;
-		if (ops->msi_check == NULL)
-			ops->msi_check = pci_msi_domain_check_cap;
 	}
 }
 

