Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB8F46ACE6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 23:41:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7JMC4LkWz3cmq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 09:41:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=jwThvHAR;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=WWO0wDP1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=jwThvHAR; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=WWO0wDP1; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7J3N677Xz305c
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 09:28:00 +1100 (AEDT)
Message-ID: <20211206210224.980989243@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638829678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=YWBvF5zXcDfRUfEoyBk4Kk35zgLL7tyJ9PWeow343Hs=;
 b=jwThvHARsPXTlMHIlndJwa10LjHcshFU6NoML8SG2JGecBMWy4JPiHuWFnGcP7i4Q1Ibj9
 8/eowhkrx1wKGYm2Yxrw7xrDhLIewEAHBE8layal+21UsPmPoYAdbuy3jJUREs5PCuecye
 7m+VUQ/rPIgBX30eS2stYDrLVHUftcTe2LN/Q1eeUdPqRiMNfed020JM797KQYT7nPIA/z
 TmSwV/cB5rCcOQB4kL1Ge9QBNfhiTLnud2sKQVAEnQK9z3iC+nzZSzw4bFmLKQuIgKUo7a
 vIALLKQRlHw2SJH97tyJGigjR7KCwlJGJTEagLbQtpMSi36ZAkynmCJEolc1UQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638829678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=YWBvF5zXcDfRUfEoyBk4Kk35zgLL7tyJ9PWeow343Hs=;
 b=WWO0wDP12OPjmI9cLbgeixKjE+ylewjJ4EqqGA8strpjub+l5CYlIKtxJmN+Pp2T3jnqE9
 pSxUKy0jh2EVgdBQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 21/23] PCI/MSI: Make pci_msi_domain_check_cap() static
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:27:57 +0100 (CET)
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

No users outside of that file.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/pci/msi/irqdomain.c |    5 +++--
 include/linux/msi.h         |    2 --
 2 files changed, 3 insertions(+), 4 deletions(-)

--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -79,8 +79,9 @@ static inline bool pci_msi_desc_is_multi
  *  1 if Multi MSI is requested, but the domain does not support it
  *  -ENOTSUPP otherwise
  */
-int pci_msi_domain_check_cap(struct irq_domain *domain,
-			     struct msi_domain_info *info, struct device *dev)
+static int pci_msi_domain_check_cap(struct irq_domain *domain,
+				    struct msi_domain_info *info,
+				    struct device *dev)
 {
 	struct msi_desc *desc = first_pci_msi_entry(to_pci_dev(dev));
 
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -439,8 +439,6 @@ void *platform_msi_get_host_data(struct
 struct irq_domain *pci_msi_create_irq_domain(struct fwnode_handle *fwnode,
 					     struct msi_domain_info *info,
 					     struct irq_domain *parent);
-int pci_msi_domain_check_cap(struct irq_domain *domain,
-			     struct msi_domain_info *info, struct device *dev);
 u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev);
 struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev);
 bool pci_dev_has_special_msi_domain(struct pci_dev *pdev);

