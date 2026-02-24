Return-Path: <linuxppc-dev+bounces-17106-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJuBLxl5nWmAQAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17106-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 11:10:33 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 943F4185262
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 11:10:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKtkW3t10z3cR4;
	Tue, 24 Feb 2026 21:09:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771927795;
	cv=none; b=Px8BBtyr/t7eg0JsgLFg7vadaFWH8ABjrvE1VstwYqyN1PJ7JmhhfIz6eoK+KkzsShpEz/vgX1H85IkadtFDolOnswgU9JmGz630IXXsnII0kdOHjed6H5Y3D924O0+q+qMZNoCi8E20oJdwVfIm7aXY0IS3qcTlItZa6wN4gIeW3doBfXJxMXvCZirITgrfGAt8dK750F54VVT3AQI90Nvcqm1XN0ZXg4kZonuTWjqU6kO1+q6HgwVWG6NzvNjhYBIxRR6V+RWtascN09WaVT/YLR8/g6P7aijstpQIbtVPq43YJZEyPOMvGsyfCJsEwS4dnEf7mvDRFiJVYx4UBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771927795; c=relaxed/relaxed;
	bh=xsbyc6xSN64IwuouCIbGm1bsxBc8Ytwp45NUUfUC4vw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jD1ElY4UbEWsEG6lxqgQBj4H2SpR59SXHYVXsHmXx/y57qi37TiiNDPB2p7Yv6HxQa3GQB9EnnX1GqzXnLlnFI4CZKBi1OmDDFH8dtvGs1SBJ3UNPkMMM9hTmnlMcvX6NG/mkFR0LEW1fksr7jf2pft2KudP6TBspKKRNzMiNn9UTHx/gPuT6qdhu4f4jTLtP6K6u1qKU7+pK0ybXgiYgt3Z36+e/1CL/C6nTCnmvsNrFNbKY/pYMe5jEEiCjxX9pIt4rY6A86qTa2xTGqYKCk4Ae9NYklF/P9KALXBYHhiFfC6C48lfHpnDddhOG2hgIx5cqklZjBHxyE0lXPg1KA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jV4DAPVy; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jV4DAPVy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKtkS4hqjz3cM4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 21:09:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C828446FF;
	Tue, 24 Feb 2026 10:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C20C19422;
	Tue, 24 Feb 2026 10:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771927789;
	bh=KNa1RmYpKJc5D6w4FHSt+0MARD+RIlYnpGxVG69oH7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jV4DAPVy8Nk+RIEc104Ct2KPj2WQWvCb6+X0y/GpbE/CeqsHEUtu+66XMNlY5CvXg
	 jRhXxQ9E217MC2GBosjaFwDPjgz7DwO8WLgxu3PJkBC1T32Pt5QDjvUJS0GxLZcbH+
	 n66BF3Ae23oWr+JMJklTA5LSVAiGv8q/aczOTSXxs2ss+lrAw2flKLq9+mcpKGI3To
	 vvkfQ94ws+QpU79L1GsGUQ2ZBAK/OAzt3we/iG8wOqCHru6zQKX7e/MiGRdSmWZUov
	 RjOHLTFI3nPNzO/7hgTcg2Bd6J/ghMb48RMcPx+J/X/1y5aotmGZernaz9hhDUpDkM
	 nU7tVs5kyJdKg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vupMQ-0000000DIa5-37bM;
	Tue, 24 Feb 2026 10:09:46 +0000
From: Marc Zyngier <maz@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Thomas Gleixner <tglx@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 5/6] fsl-mc: Remove legacy MSI implementation
Date: Tue, 24 Feb 2026 10:09:35 +0000
Message-ID: <20260224100936.3752303-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224100936.3752303-1-maz@kernel.org>
References: <20260224100936.3752303-1-maz@kernel.org>
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
X-SA-Exim-Rcpt-To: ioana.ciornei@nxp.com, tglx@kernel.org, chleroy@kernel.org, sascha.bischoff@arm.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-17106-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ioana.ciornei@nxp.com,m:tglx@kernel.org,m:chleroy@kernel.org,m:sascha.bischoff@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[maz@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,nxp.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,0xlx:email,freescale.com:email]
X-Rspamd-Queue-Id: 943F4185262
X-Rspamd-Action: no action

Get rid of most of the fsl_mc MSI infrastructure, which is now replaced
by common code.

Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> # LX2160ARDB, LS2088ARDB
Tested-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/bus/fsl-mc/fsl-mc-msi.c             | 166 +------------------
 drivers/bus/fsl-mc/fsl-mc-private.h         |   1 -
 drivers/irqchip/Kconfig                     |   6 -
 drivers/irqchip/Makefile                    |   1 -
 drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c | 168 --------------------
 include/linux/fsl/mc.h                      |   4 -
 include/linux/irqdomain_defs.h              |   1 -
 7 files changed, 8 insertions(+), 339 deletions(-)
 delete mode 100644 drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c

diff --git a/drivers/bus/fsl-mc/fsl-mc-msi.c b/drivers/bus/fsl-mc/fsl-mc-msi.c
index c9f50969e88ce..be38b43803dea 100644
--- a/drivers/bus/fsl-mc/fsl-mc-msi.c
+++ b/drivers/bus/fsl-mc/fsl-mc-msi.c
@@ -15,53 +15,16 @@
 
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
-static void __fsl_mc_msi_write_msg(struct fsl_mc_device *mc_bus_dev,
-				   struct fsl_mc_device_irq *mc_dev_irq,
-				   struct msi_desc *msi_desc)
+static void fsl_mc_write_msi_msg(struct msi_desc *msi_desc, struct msi_msg *msg)
 {
-	int error;
+	struct fsl_mc_device *mc_bus_dev = to_fsl_mc_device(msi_desc->dev);
+	struct fsl_mc_bus *mc_bus = to_fsl_mc_bus(mc_bus_dev);
+	struct fsl_mc_device_irq *mc_dev_irq = &mc_bus->irq_resources[msi_desc->msi_index];
 	struct fsl_mc_device *owner_mc_dev = mc_dev_irq->mc_dev;
 	struct dprc_irq_cfg irq_cfg;
+	int error;
+
+	msi_desc->msg = *msg;
 
 	/*
 	 * msi_desc->msg.address is 0x0 when this function is invoked in
@@ -110,111 +73,6 @@ static void __fsl_mc_msi_write_msg(struct fsl_mc_device *mc_bus_dev,
 	}
 }
 
-static void fsl_mc_write_msi_msg(struct msi_desc *msi_desc, struct msi_msg *msg)
-{
-	struct fsl_mc_device *mc_bus_dev = to_fsl_mc_device(msi_desc->dev);
-	struct fsl_mc_bus *mc_bus = to_fsl_mc_bus(mc_bus_dev);
-	struct fsl_mc_device_irq *mc_dev_irq =
-		&mc_bus->irq_resources[msi_desc->msi_index];
-
-	msi_desc->msg = *msg;
-
-	/*
-	 * Program the MSI (paddr, value) pair in the device:
-	 */
-	__fsl_mc_msi_write_msg(mc_bus_dev, mc_dev_irq, msi_desc);
-}
-
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
@@ -232,18 +90,10 @@ struct irq_domain *fsl_mc_get_msi_parent(struct device *dev)
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
index f07b00d7fef90..3e5b2040cb4ef 100644
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
index 26aa3b6ec99fd..d5a28cee0d8eb 100644
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
diff --git a/include/linux/irqdomain_defs.h b/include/linux/irqdomain_defs.h
index 36653e2ee1c92..3a03bdfeeee93 100644
--- a/include/linux/irqdomain_defs.h
+++ b/include/linux/irqdomain_defs.h
@@ -17,7 +17,6 @@ enum irq_domain_bus_token {
 	DOMAIN_BUS_PLATFORM_MSI,
 	DOMAIN_BUS_NEXUS,
 	DOMAIN_BUS_IPI,
-	DOMAIN_BUS_FSL_MC_MSI,
 	DOMAIN_BUS_TI_SCI_INTA_MSI,
 	DOMAIN_BUS_WAKEUP,
 	DOMAIN_BUS_VMD_MSI,
-- 
2.47.3


