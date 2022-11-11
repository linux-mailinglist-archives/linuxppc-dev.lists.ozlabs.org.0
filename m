Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8496E625C8E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:08:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N80t73qzZz3fCj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:08:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=43XNu7V6;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=r6FLcQ/X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=43XNu7V6;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=r6FLcQ/X;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80hL03BPz3dts
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:00:01 +1100 (AEDT)
Message-ID: <20221111122014.237221143@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=i6lv85ZNUn8jbTiqiaOVEezDOQ2OYDxW2lkZxbSQfPs=;
	b=43XNu7V6lxNjeSplgzaxAS44tgV1Hxus/MQ0Rod85yoWEU9uzoUV0/Gvo4MbkhRTwi9Tzn
	K+wX7sK78xcXVDD899/v4pK5j+RLz0Ao3nSp2UCpEepJa70aoQnMHmpP19VhP2+pwR4qww
	0tGVylR7vtiM38R3uV3EvetHi2nC3skf1+FL3cNo1DnnGoJtSoTvvwyivArsgTeJicRErs
	l1UHy/+fO39St2quL4Q1Hy4tm4W1uszLlCgDZRMWKSkBfgmRsWXid7/6U9QZn+s1br0VHF
	drP8Q36KtsFNrJNa9PZHRRkcIy1K7rYVmLVVutyERWy8ViXgAtWWWRTnnNlHgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=i6lv85ZNUn8jbTiqiaOVEezDOQ2OYDxW2lkZxbSQfPs=;
	b=r6FLcQ/XkDdVENpg6jrJnxOUENgvyAqRux+b2LWEAUoE54RxJtQQhVavaj2vznzl/JqrCy
	KnNE4MphZHlzBvCQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject:  [patch 11/39] genirq/irqdomain: Move bus token enum into a seperate header
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:54:32 +0100 (CET)
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

Split the bus token defines out into a seperate header file to avoid
inclusion of irqdomain.h in msi.h.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/irqdomain.h      |   22 +---------------------
 include/linux/irqdomain_defs.h |   26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 21 deletions(-)

--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -31,6 +31,7 @@
 #define _LINUX_IRQDOMAIN_H
 
 #include <linux/types.h>
+#include <linux/irqdomain_defs.h>
 #include <linux/irqhandler.h>
 #include <linux/of.h>
 #include <linux/mutex.h>
@@ -68,27 +69,6 @@ struct irq_fwspec {
 void of_phandle_args_to_fwspec(struct device_node *np, const u32 *args,
 			       unsigned int count, struct irq_fwspec *fwspec);
 
-/*
- * Should several domains have the same device node, but serve
- * different purposes (for example one domain is for PCI/MSI, and the
- * other for wired IRQs), they can be distinguished using a
- * bus-specific token. Most domains are expected to only carry
- * DOMAIN_BUS_ANY.
- */
-enum irq_domain_bus_token {
-	DOMAIN_BUS_ANY		= 0,
-	DOMAIN_BUS_WIRED,
-	DOMAIN_BUS_GENERIC_MSI,
-	DOMAIN_BUS_PCI_MSI,
-	DOMAIN_BUS_PLATFORM_MSI,
-	DOMAIN_BUS_NEXUS,
-	DOMAIN_BUS_IPI,
-	DOMAIN_BUS_FSL_MC_MSI,
-	DOMAIN_BUS_TI_SCI_INTA_MSI,
-	DOMAIN_BUS_WAKEUP,
-	DOMAIN_BUS_VMD_MSI,
-};
-
 /**
  * struct irq_domain_ops - Methods for irq_domain objects
  * @match: Match an interrupt controller device node to a host, returns
--- /dev/null
+++ b/include/linux/irqdomain_defs.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_IRQDOMAIN_DEFS_H
+#define _LINUX_IRQDOMAIN_DEFS_H
+
+/*
+ * Should several domains have the same device node, but serve
+ * different purposes (for example one domain is for PCI/MSI, and the
+ * other for wired IRQs), they can be distinguished using a
+ * bus-specific token. Most domains are expected to only carry
+ * DOMAIN_BUS_ANY.
+ */
+enum irq_domain_bus_token {
+	DOMAIN_BUS_ANY		= 0,
+	DOMAIN_BUS_WIRED,
+	DOMAIN_BUS_GENERIC_MSI,
+	DOMAIN_BUS_PCI_MSI,
+	DOMAIN_BUS_PLATFORM_MSI,
+	DOMAIN_BUS_NEXUS,
+	DOMAIN_BUS_IPI,
+	DOMAIN_BUS_FSL_MC_MSI,
+	DOMAIN_BUS_TI_SCI_INTA_MSI,
+	DOMAIN_BUS_WAKEUP,
+	DOMAIN_BUS_VMD_MSI,
+};
+
+#endif /* _LINUX_IRQDOMAIN_DEFS_H */

