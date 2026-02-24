Return-Path: <linuxppc-dev+bounces-17104-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EH4wAAx5nWmAQAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17104-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 11:10:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 049C218524B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 11:10:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKtkV5NVSz3cPb;
	Tue, 24 Feb 2026 21:09:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771927794;
	cv=none; b=C3xHdw0Cy3iwRM/fMWhtaQTYExmwJiKyaw+B1d6FxblnszIHZnbCXN33lyUlg+eW+8x9FhsSHzCcM7Qd1wsDQqf/clF76e8Pr+m2WrU+JnxLY9lP5BadwScDxCrB+hwLsVFYuB8ICtso+DzYr7cug6bmbUUaSbAa8PcvKJFYqjMwFzddf6ED1qjI4ZX820Tv4GG8Kp/371LoEPNQOBjZF08cvDDazwachvPHK6Due54JkLGhYhVrZkB3LkeMID9b39uGAyZq3j5n2ep9wtg7cVBHaftjCpIqD18AyM38+xhJkXT0rit/WKqlLW4tSDhKxP3ittc3cJpwKB2phWEoFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771927794; c=relaxed/relaxed;
	bh=4ynkCDtmUgwOGSr9j0SqHlS2aCLCUPVhw08YrdPbl78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h7ZeoKdxvbeH6N7KWJqGOJc6TFG5CuXt10e3aVsEyEQizpIb6mkOx/E9FP7IWz2CYbzSUyf8xdo25aLR6n/if3yOAarvtUJ0XsYvHkC2nm9/Lee6ALCjCWDr+JwMpIy+CSp4SvCAg+2GT+xtQlgV2JHuBE+D++EFGu9e9Zz0gDFBS4rdRvtHmZ2QV/iYh3FoUwBCoblZ/EuQQJEzhOUgDhQAhH57CmB5FYe+LpGW39yJh2X2OvvnxsTd73xkuHj7Sk2MGV/kJl0xCYIAkMsU9W+dGW41RW5wgsjDDxRdLQHdkIcnJVefEavzU/2J8uPNvENPrBDoG0ZLux31svVy5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZFJ8xrll; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZFJ8xrll;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKtkR4RMsz3cLd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 21:09:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B7C86133A;
	Tue, 24 Feb 2026 10:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6D5C19422;
	Tue, 24 Feb 2026 10:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771927788;
	bh=R70YiYLU0di+Oce/j55iuRy5UlPh+AlF0z+vVM8NpQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZFJ8xrllbES9bLnS7dAOnLGWU6iGLum2GdfxxQiaUjejcH0IX9krKb5YD5D0DVjeH
	 t/W86EG4viDiic7lctpRRkgbT2xy+Ml/i5ozgtgWDG4KVseT5ULF8nJiqy20VejAnt
	 kTeBlba/prWh0IPr1CAKb/zGI6gIoeCsyOGWQHzrm8MAnkgx0Hns/qmBm71SA0LSeb
	 UQqX8N0PoChboiAPwX/ode22795Iwsru3dgDiCEsKSU3/hwfaGHzlFse+QAhARCujH
	 1lpsYM0A6jJlbG+DEMl1CTHTWhR9lazshv6r3k3JT8/X5ZEiNpYf8ICUlvlUJcCwec
	 CyOoVFeOE/ZlA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vupMQ-0000000DIa5-0G8S;
	Tue, 24 Feb 2026 10:09:46 +0000
From: Marc Zyngier <maz@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Thomas Gleixner <tglx@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/6] fsl-mc: Add minimal infrastructure to use platform MSI
Date: Tue, 24 Feb 2026 10:09:32 +0000
Message-ID: <20260224100936.3752303-3-maz@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-17104-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,nxp.com:email]
X-Rspamd-Queue-Id: 049C218524B
X-Rspamd-Action: no action

Add the tiny bit of infrastructure required to use platform MSI
instead of the current hack. This means providing a write_msi_msg
callback, as well as irq domain and devid retrieval helpers.

Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> # LX2160ARDB, LS2088ARDB
Tested-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/bus/fsl-mc/fsl-mc-msi.c     | 50 ++++++++++++++++++++++++-----
 drivers/bus/fsl-mc/fsl-mc-private.h |  1 +
 include/linux/fsl/mc.h              |  2 ++
 3 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-msi.c b/drivers/bus/fsl-mc/fsl-mc-msi.c
index 82cd69f7884c6..c9f50969e88ce 100644
--- a/drivers/bus/fsl-mc/fsl-mc-msi.c
+++ b/drivers/bus/fsl-mc/fsl-mc-msi.c
@@ -110,13 +110,8 @@ static void __fsl_mc_msi_write_msg(struct fsl_mc_device *mc_bus_dev,
 	}
 }
 
-/*
- * NOTE: This function is invoked with interrupts disabled
- */
-static void fsl_mc_msi_write_msg(struct irq_data *irq_data,
-				 struct msi_msg *msg)
+static void fsl_mc_write_msi_msg(struct msi_desc *msi_desc, struct msi_msg *msg)
 {
-	struct msi_desc *msi_desc = irq_data_get_msi_desc(irq_data);
 	struct fsl_mc_device *mc_bus_dev = to_fsl_mc_device(msi_desc->dev);
 	struct fsl_mc_bus *mc_bus = to_fsl_mc_bus(mc_bus_dev);
 	struct fsl_mc_device_irq *mc_dev_irq =
@@ -130,6 +125,17 @@ static void fsl_mc_msi_write_msg(struct irq_data *irq_data,
 	__fsl_mc_msi_write_msg(mc_bus_dev, mc_dev_irq, msi_desc);
 }
 
+/*
+ * NOTE: This function is invoked with interrupts disabled
+ */
+static void fsl_mc_msi_write_msg(struct irq_data *irq_data,
+				 struct msi_msg *msg)
+{
+	struct msi_desc *msi_desc = irq_data_get_msi_desc(irq_data);
+
+	fsl_mc_write_msi_msg(msi_desc, msg);
+}
+
 static void fsl_mc_msi_update_chip_ops(struct msi_domain_info *info)
 {
 	struct irq_chip *chip = info->chip;
@@ -209,6 +215,20 @@ struct irq_domain *fsl_mc_find_msi_domain(struct device *dev)
 	return msi_domain;
 }
 
+struct irq_domain *fsl_mc_get_msi_parent(struct device *dev)
+{
+	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
+	struct device *root_dprc_dev;
+	struct device *bus_dev;
+
+	fsl_mc_get_root_dprc(dev, &root_dprc_dev);
+	bus_dev = root_dprc_dev->parent;
+
+	return (bus_dev->of_node ?
+		of_msi_get_domain(bus_dev, bus_dev->of_node, DOMAIN_BUS_NEXUS) :
+		iort_get_device_domain(bus_dev, mc_dev->icid, DOMAIN_BUS_NEXUS));
+}
+
 int fsl_mc_msi_domain_alloc_irqs(struct device *dev,  unsigned int irq_count)
 {
 	int error = msi_setup_device_data(dev);
@@ -220,8 +240,10 @@ int fsl_mc_msi_domain_alloc_irqs(struct device *dev,  unsigned int irq_count)
 	 * NOTE: Calling this function will trigger the invocation of the
 	 * its_fsl_mc_msi_prepare() callback
 	 */
-	error = msi_domain_alloc_irqs_range(dev, MSI_DEFAULT_DOMAIN, 0, irq_count - 1);
-
+	if (!irq_domain_is_msi_parent(dev_get_msi_domain(dev)))
+		error = msi_domain_alloc_irqs_range(dev, MSI_DEFAULT_DOMAIN, 0, irq_count - 1);
+	else
+		error = platform_device_msi_init_and_alloc_irqs(dev, irq_count, fsl_mc_write_msi_msg);
 	if (error)
 		dev_err(dev, "Failed to allocate IRQs\n");
 	return error;
@@ -231,3 +253,15 @@ void fsl_mc_msi_domain_free_irqs(struct device *dev)
 {
 	msi_domain_free_irqs_all(dev, MSI_DEFAULT_DOMAIN);
 }
+
+u32 fsl_mc_get_msi_id(struct device *dev)
+{
+	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
+	struct device *root_dprc_dev;
+
+	fsl_mc_get_root_dprc(dev, &root_dprc_dev);
+
+	return (root_dprc_dev->parent->of_node ?
+		of_msi_xlate(dev, NULL, mc_dev->icid) :
+		iort_msi_map_id(dev, mc_dev->icid));
+}
diff --git a/drivers/bus/fsl-mc/fsl-mc-private.h b/drivers/bus/fsl-mc/fsl-mc-private.h
index beed4c53533d8..44868f874fd66 100644
--- a/drivers/bus/fsl-mc/fsl-mc-private.h
+++ b/drivers/bus/fsl-mc/fsl-mc-private.h
@@ -642,6 +642,7 @@ int fsl_mc_msi_domain_alloc_irqs(struct device *dev,
 void fsl_mc_msi_domain_free_irqs(struct device *dev);
 
 struct irq_domain *fsl_mc_find_msi_domain(struct device *dev);
+struct irq_domain *fsl_mc_get_msi_parent(struct device *dev);
 
 int __must_check fsl_create_mc_io(struct device *dev,
 				  phys_addr_t mc_portal_phys_addr,
diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
index 897d6211c1635..bcc38c0fc230a 100644
--- a/include/linux/fsl/mc.h
+++ b/include/linux/fsl/mc.h
@@ -361,9 +361,11 @@ int mc_send_command(struct fsl_mc_io *mc_io, struct fsl_mc_command *cmd);
 
 #ifdef CONFIG_FSL_MC_BUS
 #define dev_is_fsl_mc(_dev) ((_dev)->bus == &fsl_mc_bus_type)
+u32 fsl_mc_get_msi_id(struct device *dev);
 #else
 /* If fsl-mc bus is not present device cannot belong to fsl-mc bus */
 #define dev_is_fsl_mc(_dev) (0)
+#define fsl_mc_get_msi_id(_dev)	(0)
 #endif
 
 /* Macro to check if a device is a container device */
-- 
2.47.3


