Return-Path: <linuxppc-dev+bounces-16929-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJbiMBPElWmTUgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16929-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Feb 2026 14:52:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD193156DD0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Feb 2026 14:52:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fGHxn4Ymxz3bp1;
	Thu, 19 Feb 2026 00:52:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771422733;
	cv=none; b=DT2gTRUJe2LBWghXXLYqBS6aZiI2gVb0dXvWMD+KvkquJwUjVspjkHagCt526OC8JnDxwuhEsUEXclJwz/lb/30gQZueDcGWoQ7CLWJoBe0Opkx+sWfSwKIK/eNE3n6Ikm0BI8YR40Rv/tpOfn5t1ngBeV2pbzbX2EYv682LJ64zJDpuPOVJdVodgN+afsBRaB/h2YuEq6Man9lNxUi3co7aDycBeAkbhi+6XW9+CsXmMBHmGvTdZhCvAoGdAXUKgoYaOpC6CMm/BuvpFbJxqTeCXT9iermt8Z3ujjYPw/v77rQtwwu+49IH/aT4/0VP7vTmVeMCY8sJAoy9GwfrGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771422733; c=relaxed/relaxed;
	bh=+zMTq+x/qKbQoHspvgGkABuqqDGbC62ncSL0L2tIX/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZIt5QsOPuPmFVaY/nkCS/VPDjeCvKfX04eYjN549GZT+y91TLLl7es1dHdJ3r0tS2wwm0Z7F8EEvudLIcrHl+IpKKh5mXwWPgHW9z3bn4kWsuOg1fhJNOOI7r7B50JA/+A8FTr6YvNp7MgLxHZ5JNRVAtr+rde5xUS9AS7Og/sVixFUUIwfyo6aPPorXue+keph0KzuKF83EL+tjLqagTPKhRGp5C7YSiKJL0ygyL6UNN/bcWQl4bVvvPmGNOg40dZQbHXabU6rSS6sLXPS+QjrCp+zQHaPpHj8T8ZWzIpqHFP1djoHvge/Px2xgXmWBTCevlHeFhtKFwhIS4m1cCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nS8/T+sa; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nS8/T+sa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGHxl5hxzz309H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Feb 2026 00:52:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C456644521;
	Wed, 18 Feb 2026 13:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0D9C2BC9E;
	Wed, 18 Feb 2026 13:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771422729;
	bh=leEqpgzIkg6AHd8EgBExKzmuGWwNfSbrAEVhsD8qeCA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nS8/T+sar/AiVYi4woyXFj+JU8Ix01ANRUPENrP4DgQDLXBBHOv9ZxkWV2wpBWFvM
	 ukF+YUnqBBwwDBjCvRI5LU6yiRTYXm1uYWw4FeGhoM39WWRx5W6ysDqn0n5LiYoaqC
	 1qay7FxQxJPUhLnSZ1QHe0udEQmRYLMrZkyBnzG7t1enKjd2sOXvnV5DVIIEYg0guD
	 F7eMqcR5wdNYZkzuF+LEUx6S2alr9zeO7/vek1/OQSZk2JlRLo8w720ILPhRBvvldn
	 R1CwPqcWE7PzvsSi1PXVTsYaWrvlXjybnMAnV0Q7gYEDb8hen1XidtlGQoXchYb8hA
	 oRl7onUhnEyFQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vshyJ-0000000Bu02-2dVD;
	Wed, 18 Feb 2026 13:52:07 +0000
From: Marc Zyngier <maz@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Thomas Gleixner <tglx@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/6] fsl_mc: Remove legacy MSI implementation
Date: Wed, 18 Feb 2026 13:52:02 +0000
Message-ID: <20260218135203.2267907-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218135203.2267907-1-maz@kernel.org>
References: <20260218135203.2267907-1-maz@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: ioana.ciornei@nxp.com, tglx@kernel.org, chleroy@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ioana.ciornei@nxp.com,m:tglx@kernel.org,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16929-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maz@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: BD193156DD0
X-Rspamd-Action: no action

Get rid of the most of the fsl_mc MSI infrastructure, which is
now totally unused.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/bus/fsl-mc/fsl-mc-msi.c             | 140 +---------------
 drivers/bus/fsl-mc/fsl-mc-private.h         |   1 -
 drivers/irqchip/Kconfig                     |   6 -
 drivers/irqchip/Makefile                    |   1 -
 drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c | 168 --------------------
 include/linux/fsl/mc.h                      |   4 -
 6 files changed, 1 insertion(+), 319 deletions(-)
 delete mode 100644 drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c

diff --git a/drivers/bus/fsl-mc/fsl-mc-msi.c b/drivers/bus/fsl-mc/fsl-mc-msi.c
index c9f50969e88ce..8ee4796040a8d 100644
--- a/drivers/bus/fsl-mc/fsl-mc-msi.c
+++ b/drivers/bus/fsl-mc/fsl-mc-msi.c
@@ -15,46 +15,6 @@
 
 #include "fsl-mc-private.h"
 
-#ifdef GENERIC_MSI_DOMAIN_OPS
-/*
- * Generate a unique ID identifying the interrupt (only used within the MSI
- * irqdomain.  Combine the icid with the interrupt index.
- */
-static irq_hw_number_t fsl_mc_domain_calc_hwirq(struct fsl_mc_device *dev,
-						struct msi_desc *desc)
-{
-	/*
-	 * Make the base hwirq value for ICID*10000 so it is readable
-	 * as a decimal value in /proc/interrupts.
-	 */
-	return (irq_hw_number_t)(desc->msi_index + (dev->icid * 10000));
-}
-
-static void fsl_mc_msi_set_desc(msi_alloc_info_t *arg,
-				struct msi_desc *desc)
-{
-	arg->desc = desc;
-	arg->hwirq = fsl_mc_domain_calc_hwirq(to_fsl_mc_device(desc->dev),
-					      desc);
-}
-#else
-#define fsl_mc_msi_set_desc NULL
-#endif
-
-static void fsl_mc_msi_update_dom_ops(struct msi_domain_info *info)
-{
-	struct msi_domain_ops *ops = info->ops;
-
-	if (!ops)
-		return;
-
-	/*
-	 * set_desc should not be set by the caller
-	 */
-	if (!ops->set_desc)
-		ops->set_desc = fsl_mc_msi_set_desc;
-}
-
 static void __fsl_mc_msi_write_msg(struct fsl_mc_device *mc_bus_dev,
 				   struct fsl_mc_device_irq *mc_dev_irq,
 				   struct msi_desc *msi_desc)
@@ -125,96 +85,6 @@ static void fsl_mc_write_msi_msg(struct msi_desc *msi_desc, struct msi_msg *msg)
 	__fsl_mc_msi_write_msg(mc_bus_dev, mc_dev_irq, msi_desc);
 }
 
-/*
- * NOTE: This function is invoked with interrupts disabled
- */
-static void fsl_mc_msi_write_msg(struct irq_data *irq_data,
-				 struct msi_msg *msg)
-{
-	struct msi_desc *msi_desc = irq_data_get_msi_desc(irq_data);
-
-	fsl_mc_write_msi_msg(msi_desc, msg);
-}
-
-static void fsl_mc_msi_update_chip_ops(struct msi_domain_info *info)
-{
-	struct irq_chip *chip = info->chip;
-
-	if (!chip)
-		return;
-
-	/*
-	 * irq_write_msi_msg should not be set by the caller
-	 */
-	if (!chip->irq_write_msi_msg)
-		chip->irq_write_msi_msg = fsl_mc_msi_write_msg;
-}
-
-/**
- * fsl_mc_msi_create_irq_domain - Create a fsl-mc MSI interrupt domain
- * @fwnode:	Optional firmware node of the interrupt controller
- * @info:	MSI domain info
- * @parent:	Parent irq domain
- *
- * Updates the domain and chip ops and creates a fsl-mc MSI
- * interrupt domain.
- *
- * Returns:
- * A domain pointer or NULL in case of failure.
- */
-struct irq_domain *fsl_mc_msi_create_irq_domain(struct fwnode_handle *fwnode,
-						struct msi_domain_info *info,
-						struct irq_domain *parent)
-{
-	struct irq_domain *domain;
-
-	if (WARN_ON((info->flags & MSI_FLAG_LEVEL_CAPABLE)))
-		info->flags &= ~MSI_FLAG_LEVEL_CAPABLE;
-	if (info->flags & MSI_FLAG_USE_DEF_DOM_OPS)
-		fsl_mc_msi_update_dom_ops(info);
-	if (info->flags & MSI_FLAG_USE_DEF_CHIP_OPS)
-		fsl_mc_msi_update_chip_ops(info);
-	info->flags |= MSI_FLAG_ALLOC_SIMPLE_MSI_DESCS | MSI_FLAG_FREE_MSI_DESCS;
-
-	domain = msi_create_irq_domain(fwnode, info, parent);
-	if (domain)
-		irq_domain_update_bus_token(domain, DOMAIN_BUS_FSL_MC_MSI);
-
-	return domain;
-}
-
-struct irq_domain *fsl_mc_find_msi_domain(struct device *dev)
-{
-	struct device *root_dprc_dev;
-	struct device *bus_dev;
-	struct irq_domain *msi_domain;
-	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
-
-	fsl_mc_get_root_dprc(dev, &root_dprc_dev);
-	bus_dev = root_dprc_dev->parent;
-
-	if (bus_dev->of_node) {
-		msi_domain = of_msi_map_get_device_domain(dev,
-						  mc_dev->icid,
-						  DOMAIN_BUS_FSL_MC_MSI);
-
-		/*
-		 * if the msi-map property is missing assume that all the
-		 * child containers inherit the domain from the parent
-		 */
-		if (!msi_domain)
-
-			msi_domain = of_msi_get_domain(bus_dev,
-						bus_dev->of_node,
-						DOMAIN_BUS_FSL_MC_MSI);
-	} else {
-		msi_domain = iort_get_device_domain(dev, mc_dev->icid,
-						    DOMAIN_BUS_FSL_MC_MSI);
-	}
-
-	return msi_domain;
-}
-
 struct irq_domain *fsl_mc_get_msi_parent(struct device *dev)
 {
 	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
@@ -232,18 +102,10 @@ struct irq_domain *fsl_mc_get_msi_parent(struct device *dev)
 int fsl_mc_msi_domain_alloc_irqs(struct device *dev,  unsigned int irq_count)
 {
 	int error = msi_setup_device_data(dev);
-
 	if (error)
 		return error;
 
-	/*
-	 * NOTE: Calling this function will trigger the invocation of the
-	 * its_fsl_mc_msi_prepare() callback
-	 */
-	if (!irq_domain_is_msi_parent(dev_get_msi_domain(dev)))
-		error = msi_domain_alloc_irqs_range(dev, MSI_DEFAULT_DOMAIN, 0, irq_count - 1);
-	else
-		error = platform_device_msi_init_and_alloc_irqs(dev, irq_count, fsl_mc_write_msi_msg);
+	error = platform_device_msi_init_and_alloc_irqs(dev, irq_count, fsl_mc_write_msi_msg);
 	if (error)
 		dev_err(dev, "Failed to allocate IRQs\n");
 	return error;
diff --git a/drivers/bus/fsl-mc/fsl-mc-private.h b/drivers/bus/fsl-mc/fsl-mc-private.h
index 44868f874fd66..197edcc8cde46 100644
--- a/drivers/bus/fsl-mc/fsl-mc-private.h
+++ b/drivers/bus/fsl-mc/fsl-mc-private.h
@@ -641,7 +641,6 @@ int fsl_mc_msi_domain_alloc_irqs(struct device *dev,
 
 void fsl_mc_msi_domain_free_irqs(struct device *dev);
 
-struct irq_domain *fsl_mc_find_msi_domain(struct device *dev);
 struct irq_domain *fsl_mc_get_msi_parent(struct device *dev);
 
 int __must_check fsl_create_mc_io(struct device *dev,
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index f334f49c9791f..c1f2095400c74 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -51,12 +51,6 @@ config ARM_GIC_V3_ITS
 	default ARM_GIC_V3
 	select IRQ_MSI_IOMMU
 
-config ARM_GIC_V3_ITS_FSL_MC
-	bool
-	depends on ARM_GIC_V3_ITS
-	depends on FSL_MC_BUS
-	default ARM_GIC_V3_ITS
-
 config ARM_GIC_V5
 	bool
 	select IRQ_DOMAIN_HIERARCHY
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 6a229443efe08..900f03299d9a5 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -35,7 +35,6 @@ obj-$(CONFIG_ARM_GIC_V2M)		+= irq-gic-v2m.o
 obj-$(CONFIG_ARM_GIC_V3)		+= irq-gic-v3.o irq-gic-v3-mbi.o irq-gic-common.o
 obj-$(CONFIG_ARM_GIC_ITS_PARENT)	+= irq-gic-its-msi-parent.o
 obj-$(CONFIG_ARM_GIC_V3_ITS)		+= irq-gic-v3-its.o irq-gic-v4.o
-obj-$(CONFIG_ARM_GIC_V3_ITS_FSL_MC)	+= irq-gic-v3-its-fsl-mc-msi.o
 obj-$(CONFIG_ARM_GIC_V5)		+= irq-gic-v5.o irq-gic-v5-irs.o irq-gic-v5-its.o \
 					   irq-gic-v5-iwb.o
 obj-$(CONFIG_HISILICON_IRQ_MBIGEN)	+= irq-mbigen.o
diff --git a/drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c b/drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c
deleted file mode 100644
index b5785472765a3..0000000000000
--- a/drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c
+++ /dev/null
@@ -1,168 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Freescale Management Complex (MC) bus driver MSI support
- *
- * Copyright (C) 2015-2016 Freescale Semiconductor, Inc.
- * Author: German Rivera <German.Rivera@freescale.com>
- *
- */
-
-#include <linux/acpi.h>
-#include <linux/acpi_iort.h>
-#include <linux/irq.h>
-#include <linux/msi.h>
-#include <linux/of.h>
-#include <linux/of_irq.h>
-#include <linux/fsl/mc.h>
-
-static struct irq_chip its_msi_irq_chip = {
-	.name = "ITS-fMSI",
-	.irq_mask = irq_chip_mask_parent,
-	.irq_unmask = irq_chip_unmask_parent,
-	.irq_eoi = irq_chip_eoi_parent,
-	.irq_set_affinity = msi_domain_set_affinity
-};
-
-static u32 fsl_mc_msi_domain_get_msi_id(struct irq_domain *domain,
-					struct fsl_mc_device *mc_dev)
-{
-	struct device_node *of_node;
-	u32 out_id;
-
-	of_node = irq_domain_get_of_node(domain);
-	out_id = of_node ? of_msi_xlate(&mc_dev->dev, &of_node, mc_dev->icid) :
-			iort_msi_map_id(&mc_dev->dev, mc_dev->icid);
-
-	return out_id;
-}
-
-static int its_fsl_mc_msi_prepare(struct irq_domain *msi_domain,
-				  struct device *dev,
-				  int nvec, msi_alloc_info_t *info)
-{
-	struct fsl_mc_device *mc_bus_dev;
-	struct msi_domain_info *msi_info;
-
-	if (!dev_is_fsl_mc(dev))
-		return -EINVAL;
-
-	mc_bus_dev = to_fsl_mc_device(dev);
-	if (!(mc_bus_dev->flags & FSL_MC_IS_DPRC))
-		return -EINVAL;
-
-	/*
-	 * Set the device Id to be passed to the GIC-ITS:
-	 *
-	 * NOTE: This device id corresponds to the IOMMU stream ID
-	 * associated with the DPRC object (ICID).
-	 */
-	info->scratchpad[0].ul = fsl_mc_msi_domain_get_msi_id(msi_domain,
-							      mc_bus_dev);
-	msi_info = msi_get_domain_info(msi_domain->parent);
-
-	/* Allocate at least 32 MSIs, and always as a power of 2 */
-	nvec = max_t(int, 32, roundup_pow_of_two(nvec));
-	return msi_info->ops->msi_prepare(msi_domain->parent, dev, nvec, info);
-}
-
-static struct msi_domain_ops its_fsl_mc_msi_ops __ro_after_init = {
-	.msi_prepare = its_fsl_mc_msi_prepare,
-};
-
-static struct msi_domain_info its_fsl_mc_msi_domain_info = {
-	.flags	= (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS),
-	.ops	= &its_fsl_mc_msi_ops,
-	.chip	= &its_msi_irq_chip,
-};
-
-static const struct of_device_id its_device_id[] = {
-	{	.compatible	= "arm,gic-v3-its",	},
-	{},
-};
-
-static void __init its_fsl_mc_msi_init_one(struct fwnode_handle *handle,
-					  const char *name)
-{
-	struct irq_domain *parent;
-	struct irq_domain *mc_msi_domain;
-
-	parent = irq_find_matching_fwnode(handle, DOMAIN_BUS_NEXUS);
-	if (!parent || !msi_get_domain_info(parent)) {
-		pr_err("%s: unable to locate ITS domain\n", name);
-		return;
-	}
-
-	mc_msi_domain = fsl_mc_msi_create_irq_domain(handle,
-						&its_fsl_mc_msi_domain_info,
-						parent);
-	if (!mc_msi_domain) {
-		pr_err("%s: unable to create fsl-mc domain\n", name);
-		return;
-	}
-
-	pr_info("fsl-mc MSI: %s domain created\n", name);
-}
-
-#ifdef CONFIG_ACPI
-static int __init
-its_fsl_mc_msi_parse_madt(union acpi_subtable_headers *header,
-			  const unsigned long end)
-{
-	struct acpi_madt_generic_translator *its_entry;
-	struct fwnode_handle *dom_handle;
-	const char *node_name;
-	int err = 0;
-
-	its_entry = (struct acpi_madt_generic_translator *)header;
-	node_name = kasprintf(GFP_KERNEL, "ITS@0x%lx",
-			      (long)its_entry->base_address);
-
-	dom_handle = iort_find_domain_token(its_entry->translation_id);
-	if (!dom_handle) {
-		pr_err("%s: Unable to locate ITS domain handle\n", node_name);
-		err = -ENXIO;
-		goto out;
-	}
-
-	its_fsl_mc_msi_init_one(dom_handle, node_name);
-
-out:
-	kfree(node_name);
-	return err;
-}
-
-
-static void __init its_fsl_mc_acpi_msi_init(void)
-{
-	acpi_table_parse_madt(ACPI_MADT_TYPE_GENERIC_TRANSLATOR,
-			      its_fsl_mc_msi_parse_madt, 0);
-}
-#else
-static inline void its_fsl_mc_acpi_msi_init(void) { }
-#endif
-
-static void __init its_fsl_mc_of_msi_init(void)
-{
-	struct device_node *np;
-
-	for (np = of_find_matching_node(NULL, its_device_id); np;
-	     np = of_find_matching_node(np, its_device_id)) {
-		if (!of_device_is_available(np))
-			continue;
-		if (!of_property_read_bool(np, "msi-controller"))
-			continue;
-
-		its_fsl_mc_msi_init_one(of_fwnode_handle(np),
-					np->full_name);
-	}
-}
-
-static int __init its_fsl_mc_msi_init(void)
-{
-	its_fsl_mc_of_msi_init();
-	its_fsl_mc_acpi_msi_init();
-
-	return 0;
-}
-
-early_initcall(its_fsl_mc_msi_init);
diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
index bcc38c0fc230a..e9522233f9b57 100644
--- a/include/linux/fsl/mc.h
+++ b/include/linux/fsl/mc.h
@@ -425,10 +425,6 @@ int __must_check fsl_mc_object_allocate(struct fsl_mc_device *mc_dev,
 
 void fsl_mc_object_free(struct fsl_mc_device *mc_adev);
 
-struct irq_domain *fsl_mc_msi_create_irq_domain(struct fwnode_handle *fwnode,
-						struct msi_domain_info *info,
-						struct irq_domain *parent);
-
 int __must_check fsl_mc_allocate_irqs(struct fsl_mc_device *mc_dev);
 
 void fsl_mc_free_irqs(struct fsl_mc_device *mc_dev);
-- 
2.47.3


