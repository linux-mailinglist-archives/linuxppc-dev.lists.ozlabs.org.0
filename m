Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 393B646AC28
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 23:31:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7J7Y1Bz0z3cVx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 09:31:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=faGOpwdX;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=KcSH+DBC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=faGOpwdX; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=KcSH+DBC; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7J2w1Vhfz2ywF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 09:27:36 +1100 (AEDT)
Message-ID: <20211206210224.157070464@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638829653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=TDFYojyJUnT1Pr+HD2qBTTTO8BHHsqWcbvlgAiLi1mo=;
 b=faGOpwdXacJz+kDCBSBkEhVaO4tWIE9P4Qj5ETLfpZZFSN40Jc6KRKvtUjKqzbcgr/ztKa
 qbs3AQMJ5YqDzSZ/LBJnHdYuDtL3UTT2HjTS9uDFx0+ryP9JO6T8QJqki3Nd//oVR/X9VW
 e1FjY69NA0GKaGyYgqvsTrBfJX5lElCMCyT9FX6YoUuOuuEqqOc/GLtzdgl3zj7Vtoiv7E
 DlxF1pyTqCvYRbWG64ZI7oDzx/Ar7iOdm474EVal1taH8l1XMh6ZbffomzLXz0G5zILmHX
 sQC0TNZYbr8j+7dwqKqYgzrivx/aEdj/MXodn28TIjm3ZJ1lp6FCpndDXoNOSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638829653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=TDFYojyJUnT1Pr+HD2qBTTTO8BHHsqWcbvlgAiLi1mo=;
 b=KcSH+DBC8ml3AxFwN340Wlqo3YBI/t/phMRlVFFD4wwY62x/NNn0qh9e3mmURC/L3bKGnm
 CtUH2opZXJZR53Dw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 06/23] PCI/MSI: Make pci_msi_domain_write_msg() static
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:27:33 +0100 (CET)
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

There is no point to have this function public as it is set by the PCI core
anyway when a PCI/MSI irqdomain is created.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/irqchip/irq-gic-v2m.c            |    1 -
 drivers/irqchip/irq-gic-v3-its-pci-msi.c |    1 -
 drivers/irqchip/irq-gic-v3-mbi.c         |    1 -
 drivers/pci/msi.c                        |    2 +-
 include/linux/msi.h                      |    1 -
 5 files changed, 1 insertion(+), 5 deletions(-)

--- a/drivers/irqchip/irq-gic-v2m.c
+++ b/drivers/irqchip/irq-gic-v2m.c
@@ -88,7 +88,6 @@ static struct irq_chip gicv2m_msi_irq_ch
 	.irq_mask		= gicv2m_mask_msi_irq,
 	.irq_unmask		= gicv2m_unmask_msi_irq,
 	.irq_eoi		= irq_chip_eoi_parent,
-	.irq_write_msi_msg	= pci_msi_domain_write_msg,
 };
 
 static struct msi_domain_info gicv2m_msi_domain_info = {
--- a/drivers/irqchip/irq-gic-v3-its-pci-msi.c
+++ b/drivers/irqchip/irq-gic-v3-its-pci-msi.c
@@ -28,7 +28,6 @@ static struct irq_chip its_msi_irq_chip
 	.irq_unmask		= its_unmask_msi_irq,
 	.irq_mask		= its_mask_msi_irq,
 	.irq_eoi		= irq_chip_eoi_parent,
-	.irq_write_msi_msg	= pci_msi_domain_write_msg,
 };
 
 static int its_pci_msi_vec_count(struct pci_dev *pdev, void *data)
--- a/drivers/irqchip/irq-gic-v3-mbi.c
+++ b/drivers/irqchip/irq-gic-v3-mbi.c
@@ -171,7 +171,6 @@ static struct irq_chip mbi_msi_irq_chip
 	.irq_unmask		= mbi_unmask_msi_irq,
 	.irq_eoi		= irq_chip_eoi_parent,
 	.irq_compose_msi_msg	= mbi_compose_msi_msg,
-	.irq_write_msi_msg	= pci_msi_domain_write_msg,
 };
 
 static struct msi_domain_info mbi_msi_domain_info = {
--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -1281,7 +1281,7 @@ EXPORT_SYMBOL_GPL(msi_desc_to_pci_sysdat
  * @irq_data:	Pointer to interrupt data of the MSI interrupt
  * @msg:	Pointer to the message
  */
-void pci_msi_domain_write_msg(struct irq_data *irq_data, struct msi_msg *msg)
+static void pci_msi_domain_write_msg(struct irq_data *irq_data, struct msi_msg *msg)
 {
 	struct msi_desc *desc = irq_data_get_msi_desc(irq_data);
 
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -455,7 +455,6 @@ void *platform_msi_get_host_data(struct
 #endif /* CONFIG_GENERIC_MSI_IRQ_DOMAIN */
 
 #ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
-void pci_msi_domain_write_msg(struct irq_data *irq_data, struct msi_msg *msg);
 struct irq_domain *pci_msi_create_irq_domain(struct fwnode_handle *fwnode,
 					     struct msi_domain_info *info,
 					     struct irq_domain *parent);

