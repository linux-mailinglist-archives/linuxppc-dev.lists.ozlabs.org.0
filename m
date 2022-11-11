Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BACD625CAF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:13:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N80zJ32ZBz3fV5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:13:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XKH6NEiB;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=DEHoveL7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XKH6NEiB;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=DEHoveL7;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80hS296tz3dvY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:00:08 +1100 (AEDT)
Message-ID: <20221111122014.179595843@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=oY+wTD07UJdZe/4apbDgNNcex5cwO56TFt4SFwForIc=;
	b=XKH6NEiB67Xn3bODoK1UFNxfG2Caz8t/SVVKnrvUY4TysvhYRo1CTn8qB9QRn9RXgGnOUn
	ZlbsPVdXWbPeRr+WmykWCafK8bLI9q2+VQe4v5gBp0//TxvsSvxCpPxquAuRMxNEgtM/2N
	FxObd8tB3rxUW6wBz7mLBiKynGG5OmxeXo5buw0kruHyiYCT7q3lsatjITlV+OIRMqapgo
	/ZgLE9xBM91qCV2tv5mSnn5R76PdySctgB00+MO+fIVUWs9O5o7hYp6u+FWK6+yL40MA1E
	eIxjf8p9VQYpJPcp119zLp2e+qHu7Ls8pywkEyFDGq1LVZW6sAQAPyCaxlhp7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=oY+wTD07UJdZe/4apbDgNNcex5cwO56TFt4SFwForIc=;
	b=DEHoveL7w/ktG5ghiwXKDZHBT8EPqXrrOFE5Ik9fSJifrawkey+Jqom1hnjX29gXiW58gk
	NcPL/Y06TjJtq6Cg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 10/39] genirq/msi: Make __msi_domain_free_irqs() static
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:54:30 +0100 (CET)
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

Now that the last user is gone, confine it to the core code.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/msi.h |    4 ----
 kernel/irq/msi.c    |    3 ++-
 2 files changed, 2 insertions(+), 5 deletions(-)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -335,9 +335,6 @@ struct msi_domain_info;
  * are set to the default implementation if NULL and even when
  * MSI_FLAG_USE_DEF_DOM_OPS is not set to avoid breaking existing users and
  * because these callbacks are obviously mandatory.
- *
- * __msi_domain_free_irqs() is exposed for PPC pseries to handle extra
- * work after all interrupts and descriptors have been freed.
  */
 struct msi_domain_ops {
 	irq_hw_number_t	(*get_hwirq)(struct msi_domain_info *info,
@@ -432,7 +429,6 @@ int msi_domain_alloc_irqs_descs_locked(s
 				       int nvec);
 int msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
 			  int nvec);
-void __msi_domain_free_irqs(struct irq_domain *domain, struct device *dev);
 void msi_domain_free_irqs_descs_locked(struct irq_domain *domain, struct device *dev);
 void msi_domain_free_irqs(struct irq_domain *domain, struct device *dev);
 struct msi_domain_info *msi_get_domain_info(struct irq_domain *domain);
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -463,6 +463,7 @@ static inline void msi_sysfs_remove_desc
 
 #ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
 static int __msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev, int nvec);
+static void __msi_domain_free_irqs(struct irq_domain *domain, struct device *dev);
 
 static inline void irq_chip_write_msi_msg(struct irq_data *data,
 					  struct msi_msg *msg)
@@ -978,7 +979,7 @@ int msi_domain_alloc_irqs(struct irq_dom
 	return ret;
 }
 
-void __msi_domain_free_irqs(struct irq_domain *domain, struct device *dev)
+static void __msi_domain_free_irqs(struct irq_domain *domain, struct device *dev)
 {
 	struct msi_domain_info *info = domain->host_data;
 	struct irq_data *irqd;

