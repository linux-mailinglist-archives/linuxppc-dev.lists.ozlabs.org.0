Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A68B625CD4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:20:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N817m1mbJz3fWw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:20:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Sw1lJkOU;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CEwbqwdL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Sw1lJkOU;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CEwbqwdL;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80p45MMBz3fJd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:05:00 +1100 (AEDT)
Message-ID: <20221111122015.807616900@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=643AGhyNZmR2aie2PCCrOjp31nEV6JyyeqqH5V3vLDo=;
	b=Sw1lJkOUvkZ0DIAcRPl+ie495eVa6MbYCglERsRGFe8w0Y5OR00lTVkULAo3m3suKSbjrP
	0ow0a6Nw5jI91aq9J3EGWRZoVNumWiEKlIlIXZxwTYrItsHWIo3QClO8S/4rXyABHAgyRd
	VLCJNs9QTCInxzPdTphoMGKQBBAQzQYXZZzvOmqqZ5Wydl5zhwLSMUpWma3gufRqtR7R7c
	Q7e/lmelPnuCPGVViHH7TrfQy0Chs28OJpRiQP92j/k5T4lQXPSjBLR5hGCMjSgcBdnQev
	9JltwNMmtLP7XxpQGxTpy8LoCtAOCTdKp0RybLPEIGZ6vG3MULDpIUQfdcegHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=643AGhyNZmR2aie2PCCrOjp31nEV6JyyeqqH5V3vLDo=;
	b=CEwbqwdLhlbEE3zKR1PyZBZm1Iv1k/zk7+gvTQLDniqqGqeEfGsMiJ+J0PDZl7Nx3yuYOM
	y3Rvy6Y7JuG7mMBQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 38/39] genirq/msi: Remove msi_domain_ops::msi_check()
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:55:15 +0100 (CET)
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

No more users.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/msi.h |    4 ----
 kernel/irq/msi.c    |   17 +----------------
 2 files changed, 1 insertion(+), 20 deletions(-)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -288,7 +288,6 @@ struct msi_domain_info;
  * @get_hwirq:		Retrieve the resulting hw irq number
  * @msi_init:		Domain specific init function for MSI interrupts
  * @msi_free:		Domain specific function to free a MSI interrupts
- * @msi_check:		Callback for verification of the domain/info/dev data
  * @msi_prepare:	Prepare the allocation of the interrupts in the domain
  * @set_desc:		Set the msi descriptor for an interrupt
  * @domain_alloc_irqs:	Optional function to override the default allocation
@@ -326,9 +325,6 @@ struct msi_domain_ops {
 	void		(*msi_free)(struct irq_domain *domain,
 				    struct msi_domain_info *info,
 				    unsigned int virq);
-	int		(*msi_check)(struct irq_domain *domain,
-				     struct msi_domain_info *info,
-				     struct device *dev);
 	int		(*msi_prepare)(struct irq_domain *domain,
 				       struct device *dev, int nvec,
 				       msi_alloc_info_t *arg);
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -617,17 +617,9 @@ static int msi_domain_ops_init(struct ir
 	return 0;
 }
 
-static int msi_domain_ops_check(struct irq_domain *domain,
-				struct msi_domain_info *info,
-				struct device *dev)
-{
-	return 0;
-}
-
 static struct msi_domain_ops msi_domain_ops_default = {
 	.get_hwirq		= msi_domain_ops_get_hwirq,
 	.msi_init		= msi_domain_ops_init,
-	.msi_check		= msi_domain_ops_check,
 	.msi_prepare		= msi_domain_ops_prepare,
 	.set_desc		= msi_domain_ops_set_desc,
 	.domain_alloc_irqs	= __msi_domain_alloc_irqs,
@@ -655,8 +647,6 @@ static void msi_domain_update_dom_ops(st
 		ops->get_hwirq = msi_domain_ops_default.get_hwirq;
 	if (ops->msi_init == NULL)
 		ops->msi_init = msi_domain_ops_default.msi_init;
-	if (ops->msi_check == NULL)
-		ops->msi_check = msi_domain_ops_default.msi_check;
 	if (ops->msi_prepare == NULL)
 		ops->msi_prepare = msi_domain_ops_default.msi_prepare;
 	if (ops->set_desc == NULL)
@@ -707,13 +697,8 @@ int msi_domain_prepare_irqs(struct irq_d
 {
 	struct msi_domain_info *info = domain->host_data;
 	struct msi_domain_ops *ops = info->ops;
-	int ret;
-
-	ret = ops->msi_check(domain, info, dev);
-	if (ret == 0)
-		ret = ops->msi_prepare(domain, dev, nvec, arg);
 
-	return ret;
+	return ops->msi_prepare(domain, dev, nvec, arg);
 }
 
 int msi_domain_populate_irqs(struct irq_domain *domain, struct device *dev,

