Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AE5625C2C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:01:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N80k717Syz3f3C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:01:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=QLffNtOU;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=REJ8yjGk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=QLffNtOU;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=REJ8yjGk;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80hF67VCz3cLW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 00:59:57 +1100 (AEDT)
Message-ID: <20221111122014.294554462@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=bJxkwerKAjiWe6cHbEqN33xS2DP9tmAemXhkKdu0gyY=;
	b=QLffNtOU+BM9Q6v/Z8H95R6LwiMPRmhfbmoj75MKEHMyuvoWkxB4RbZv0LOe8zConFdPn3
	FoUFDUYVoPhjPiUz6C+xwY6wbZBS5lKJg3/Gsu3284EwPDC+c//3QKxn3kDkoOFde3hYQC
	+pd/Xgm/h8dGs8OjV+shpssdUDGjerTJOwD/8mC4GG/L0S4ZPt/7rL+PeupLgtvUpTDE1N
	Un9QztBWeePvOOGEhy8v40+sFh0e4oCbUYoSJSn1XhDvUlTbCyxiOgkrR743ROQ9a0ADqn
	+HbdIbRhYeOip7Q6YM6FLWMKuOVt6JtuB76/8dQyT2nLcE1Cab8xY9yYhSPJGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=bJxkwerKAjiWe6cHbEqN33xS2DP9tmAemXhkKdu0gyY=;
	b=REJ8yjGkmRMaCMvX4cw1m2qo8vf54uF9WaXNDdGlD7gTrIZa0CONrZEpNhXpv0sciserxB
	AcKM8IQKL5Qmr3BQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 12/39] genirq/msi: Add bus token to struct msi_domain_info
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:54:33 +0100 (CET)
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

Add a bus token member to struct msi_domain_info and let
msi_create_irq_domain() set the bus token.

That allows to remove the bus token updates at the call sites.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/msi.h |   19 +++++++++++--------
 kernel/irq/msi.c    |    7 +++++--
 2 files changed, 16 insertions(+), 10 deletions(-)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -16,6 +16,7 @@
  * abuse. The only function which is relevant for drivers is msi_get_virq().
  */
 
+#include <linux/irqdomain_defs.h>
 #include <linux/cpumask.h>
 #include <linux/xarray.h>
 #include <linux/mutex.h>
@@ -365,6 +366,7 @@ struct msi_domain_ops {
 /**
  * struct msi_domain_info - MSI interrupt domain data
  * @flags:		Flags to decribe features and capabilities
+ * @bus_token:		The domain bus token
  * @ops:		The callback data structure
  * @chip:		Optional: associated interrupt chip
  * @chip_data:		Optional: associated interrupt chip data
@@ -374,14 +376,15 @@ struct msi_domain_ops {
  * @data:		Optional: domain specific data
  */
 struct msi_domain_info {
-	u32			flags;
-	struct msi_domain_ops	*ops;
-	struct irq_chip		*chip;
-	void			*chip_data;
-	irq_flow_handler_t	handler;
-	void			*handler_data;
-	const char		*handler_name;
-	void			*data;
+	u32				flags;
+	enum irq_domain_bus_token	bus_token;
+	struct msi_domain_ops		*ops;
+	struct irq_chip			*chip;
+	void				*chip_data;
+	irq_flow_handler_t		handler;
+	void				*handler_data;
+	const char			*handler_name;
+	void				*data;
 };
 
 /* Flags for msi_domain_info */
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -694,8 +694,11 @@ struct irq_domain *msi_create_irq_domain
 	domain = irq_domain_create_hierarchy(parent, IRQ_DOMAIN_FLAG_MSI, 0,
 					     fwnode, &msi_domain_ops, info);
 
-	if (domain && !domain->name && info->chip)
-		domain->name = info->chip->name;
+	if (domain) {
+		if (!domain->name && info->chip)
+			domain->name = info->chip->name;
+		irq_domain_update_bus_token(domain, info->bus_token);
+	}
 
 	return domain;
 }

