Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC398625C6D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:06:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N80r6616kz3f3p
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:06:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Yu6U84ia;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=oM7mFTR/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Yu6U84ia;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=oM7mFTR/;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80hJ6V5Yz3ccg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:00:00 +1100 (AEDT)
Message-ID: <20221111122014.004725919@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=GAKiePxBwA26UOzSRlo0ofGhAo2Fb7Jw45XwvXqJzKU=;
	b=Yu6U84ia9FLugctorieny+7ozdDKY9K4yqqmT77rPtFmjIsYVb+xbI+H5owKByCTwabGFi
	XSUP3+twnj3K2LOXu5MGeCAk5Fqc95LTtwvoNYzKrFPOlHQMT38RZvffj79o/PUIffICyR
	Jw4JMo25Fr0VI6ucEf2SRxIGXBk5fNUjPRXoubLhcl+2CXsZWT11nLZF51xi1yvuNx3JzV
	vLMM+vvz4a8LfnKYX3C/JE+uy3X/nEjWc4GtcwLcypC9JiCo0kd0nnPqlNus4OEuGchKBA
	/pQVvyBdbBupRB6uqKjHCKGo5tVWIdNOeHLUIvsxZS9dpIQyB+6Of8k52fhTUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=GAKiePxBwA26UOzSRlo0ofGhAo2Fb7Jw45XwvXqJzKU=;
	b=oM7mFTR/BDMFIdSFauwnokPDjh6lKKffIIiPbVtB8cy6c9N5UGO9yua+3dqGd7aiCGwFmW
	BpQKABGh9Jg8x2DA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 07/39] genirq/msi: Make __msi_domain_alloc_irqs() static
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:54:25 +0100 (CET)
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

Nothing outside of the core code requires this.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/msi.h |    7 ++-----
 kernel/irq/msi.c    |    6 ++++--
 2 files changed, 6 insertions(+), 7 deletions(-)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -334,9 +334,8 @@ struct msi_domain_info;
  * MSI_FLAG_USE_DEF_DOM_OPS is not set to avoid breaking existing users and
  * because these callbacks are obviously mandatory.
  *
- * This is NOT meant to be abused, but it can be useful to build wrappers
- * for specialized MSI irq domains which need extra work before and after
- * calling __msi_domain_alloc_irqs()/__msi_domain_free_irqs().
+ * __msi_domain_free_irqs() is exposed for PPC pseries to handle extra
+ * work after all interrupts and descriptors have been freed.
  */
 struct msi_domain_ops {
 	irq_hw_number_t	(*get_hwirq)(struct msi_domain_info *info,
@@ -425,8 +424,6 @@ int msi_domain_set_affinity(struct irq_d
 struct irq_domain *msi_create_irq_domain(struct fwnode_handle *fwnode,
 					 struct msi_domain_info *info,
 					 struct irq_domain *parent);
-int __msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
-			    int nvec);
 int msi_domain_alloc_irqs_descs_locked(struct irq_domain *domain, struct device *dev,
 				       int nvec);
 int msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -462,6 +462,8 @@ static inline void msi_sysfs_remove_desc
 #endif /* !CONFIG_SYSFS */
 
 #ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
+static int __msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev, int nvec);
+
 static inline void irq_chip_write_msi_msg(struct irq_data *data,
 					  struct msi_msg *msg)
 {
@@ -852,8 +854,8 @@ static int msi_init_virq(struct irq_doma
 	return 0;
 }
 
-int __msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
-			    int nvec)
+static int __msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
+				   int nvec)
 {
 	struct msi_domain_info *info = domain->host_data;
 	struct msi_domain_ops *ops = info->ops;

