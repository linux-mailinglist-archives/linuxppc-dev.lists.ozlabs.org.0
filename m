Return-Path: <linuxppc-dev+bounces-10793-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F5EB20390
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 11:29:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0q8T4zr4z3chS;
	Mon, 11 Aug 2025 19:29:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754904553;
	cv=none; b=UMIrfbCQjD3XrIxz6/GJDimtgrOtO07s2o41G9AxS4pbctPGVlZBVQBBXMcPIbE392sk5h5mnIsgtWtIbBnAdezM0Y6sfdTkckPhizWamAELzTzkClo/xlzmOKU+TR+e+efy84uFWvMV9Up1GzjYyFBnrJrC7jWDOkFRd/r6H6eFJ28Y6Lf7Z6I7v4jm84E2fR7Rk2WnuRIVKTpUz/zoNSHW9Etu0q19tqdrsIIK1pbVnUIC3c8fZ9uvxOdGhuafeqyn9v+QDbOMjSEBvid0heYCCt/AluZNL+ZZG7NkLYe1r5cttJYonBgLuetp/yjZ61uQccNcHBpZ+/VficIQfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754904553; c=relaxed/relaxed;
	bh=o1nZtiw0Ye3ybc0i6zjBCyyaQcqnd1yxvsfwvT7j5S0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fOZGzg5raS5Cp7HndW0IeuDdGETr9Rv2pK2BQVO8RuVgogLuoQamwAioto+JZ1BflI1RE6ZosjObgHItMs8UHq+BnTBA3EIJJ631KN4Sm02BYQKUnBEroQ30335ZLFxkftNfORYEZOdx9WiN2Iwm8R0AKzqFhkHZ0KIY0/X3JX0wkBkDT4nxmqs0rrSjqUUpTLMkUIC8rzk8R8nRcmdO44q1mnKllsiSKXHx/nVM7wb8bm0I+lugQgWnxv+0w/5Q9BHKckFyxBg5llSKCNpWL106ttkusAkbejIb9ufeiFRfWiXJlw7y1oRED3D+75AEV1ikjKojNwUd65W5J2Hgfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=I45gjItm; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=PX2Ru60j; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=I45gjItm;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=PX2Ru60j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0q8T0Qxrz3cht
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 19:29:13 +1000 (AEST)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754904543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o1nZtiw0Ye3ybc0i6zjBCyyaQcqnd1yxvsfwvT7j5S0=;
	b=I45gjItmGz0E3EwboiTQfPADQd//2Ghz1CtQ3IjRiMNjHwHuz55Rwv4OUvDH+nHykXD+I6
	402bHjOfQd5H0q82wiIjvoadkhjq2IqMNaX2jB/G6n5TyyjwzW66QNmpMK/wiXV9JoiXgb
	GIwuGlZLu61Mvjy75GWAyW4cW2MbgWagnZTG64la31wbB+JAe1O8P8YPGyrBWBrzKhlrMU
	bwrAosPd8NoyLfeRoA4xEw1s7GchYt30n2tYUj9B0rpfgK6tx2Ry2Ks4L5I+QPIFItBt/r
	NCbp3gs9i39DNSvz+qO9i5WRVjgMQ0L/Ws3HnbY/zWuMbVUcPWCG4AEvgsiQiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754904543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o1nZtiw0Ye3ybc0i6zjBCyyaQcqnd1yxvsfwvT7j5S0=;
	b=PX2Ru60jsn00nGrVZVAjjpQEe9giQ07k/m+7UUzIYAX0OkV3S4tgoSdcLvbbNUQTrmKf3r
	Z0/A/QEO4WDJbkAw==
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Gautam Menghani <gautam@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH v2 3/3] powerpc/pseries/msi: Switch to msi_create_parent_irq_domain()
Date: Mon, 11 Aug 2025 11:28:56 +0200
Message-Id: <c7a6d8f27fd217021dea4daad777e81a525ae460.1754903590.git.namcao@linutronix.de>
In-Reply-To: <cover.1754903590.git.namcao@linutronix.de>
References: <cover.1754903590.git.namcao@linutronix.de>
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
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Move away from the legacy MSI domain setup, switch to use
msi_create_parent_irq_domain().

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
v2: Use msi_teardown() instead of msi_post_free() to fix boot issue with
    NVMe
---
 arch/powerpc/include/asm/pci-bridge.h  |   2 -
 arch/powerpc/platforms/pseries/Kconfig |   1 +
 arch/powerpc/platforms/pseries/msi.c   | 114 +++++++++++--------------
 3 files changed, 49 insertions(+), 68 deletions(-)

diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/a=
sm/pci-bridge.h
index 2aa3a091ef20..1dae53130782 100644
--- a/arch/powerpc/include/asm/pci-bridge.h
+++ b/arch/powerpc/include/asm/pci-bridge.h
@@ -133,8 +133,6 @@ struct pci_controller {
=20
 	/* IRQ domain hierarchy */
 	struct irq_domain	*dev_domain;
-	struct irq_domain	*msi_domain;
-	struct fwnode_handle	*fwnode;
=20
 	/* iommu_ops support */
 	struct iommu_device	iommu;
diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platform=
s/pseries/Kconfig
index fa3c2fff082a..3e042218d6cd 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -7,6 +7,7 @@ config PPC_PSERIES
 	select OF_DYNAMIC
 	select FORCE_PCI
 	select PCI_MSI
+	select IRQ_MSI_LIB
 	select GENERIC_ALLOCATOR
 	select PPC_XICS
 	select PPC_XIVE_SPAPR
diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/=
pseries/msi.c
index 10712477938e..7da142dd5baa 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -7,6 +7,7 @@
 #include <linux/crash_dump.h>
 #include <linux/device.h>
 #include <linux/irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqdomain.h>
 #include <linux/msi.h>
 #include <linux/seq_file.h>
@@ -429,8 +430,9 @@ static int rtas_prepare_msi_irqs(struct pci_dev *pdev, =
int nvec_in, int type,
 static int pseries_msi_ops_prepare(struct irq_domain *domain, struct devic=
e *dev,
 				   int nvec, msi_alloc_info_t *arg)
 {
+	struct msi_domain_info *info =3D domain->host_data;
 	struct pci_dev *pdev =3D to_pci_dev(dev);
-	int type =3D pdev->msix_enabled ? PCI_CAP_ID_MSIX : PCI_CAP_ID_MSI;
+	int type =3D (info->flags & MSI_FLAG_PCI_MSIX) ? PCI_CAP_ID_MSIX : PCI_CA=
P_ID_MSI;
=20
 	return rtas_prepare_msi_irqs(pdev, nvec, type, arg);
 }
@@ -439,19 +441,14 @@ static int pseries_msi_ops_prepare(struct irq_domain =
*domain, struct device *dev
  * RTAS can not disable one MSI at a time. It's all or nothing. Do it
  * at the end after all IRQs have been freed.
  */
-static void pseries_msi_post_free(struct irq_domain *domain, struct device=
 *dev)
+static void pseries_msi_ops_teardown(struct irq_domain *domain, msi_alloc_=
info_t *arg)
 {
-	if (WARN_ON_ONCE(!dev_is_pci(dev)))
-		return;
+	struct msi_desc *desc =3D arg->desc;
+	struct pci_dev *pdev =3D msi_desc_to_pci_dev(desc);
=20
-	rtas_disable_msi(to_pci_dev(dev));
+	rtas_disable_msi(pdev);
 }
=20
-static struct msi_domain_ops pseries_pci_msi_domain_ops =3D {
-	.msi_prepare	=3D pseries_msi_ops_prepare,
-	.msi_post_free	=3D pseries_msi_post_free,
-};
-
 static void pseries_msi_shutdown(struct irq_data *d)
 {
 	d =3D d->parent_data;
@@ -459,18 +456,6 @@ static void pseries_msi_shutdown(struct irq_data *d)
 		d->chip->irq_shutdown(d);
 }
=20
-static void pseries_msi_mask(struct irq_data *d)
-{
-	pci_msi_mask_irq(d);
-	irq_chip_mask_parent(d);
-}
-
-static void pseries_msi_unmask(struct irq_data *d)
-{
-	pci_msi_unmask_irq(d);
-	irq_chip_unmask_parent(d);
-}
-
 static void pseries_msi_write_msg(struct irq_data *data, struct msi_msg *m=
sg)
 {
 	struct msi_desc *entry =3D irq_data_get_msi_desc(data);
@@ -485,27 +470,39 @@ static void pseries_msi_write_msg(struct irq_data *da=
ta, struct msi_msg *msg)
 	entry->msg =3D *msg;
 }
=20
-static struct irq_chip pseries_pci_msi_irq_chip =3D {
-	.name		=3D "pSeries-PCI-MSI",
-	.irq_shutdown	=3D pseries_msi_shutdown,
-	.irq_mask	=3D pseries_msi_mask,
-	.irq_unmask	=3D pseries_msi_unmask,
-	.irq_eoi	=3D irq_chip_eoi_parent,
-	.irq_write_msi_msg	=3D pseries_msi_write_msg,
-};
+static bool pseries_init_dev_msi_info(struct device *dev, struct irq_domai=
n *domain,
+				      struct irq_domain *real_parent, struct msi_domain_info *info)
+{
+	struct irq_chip *chip =3D info->chip;
=20
+	if (!msi_lib_init_dev_msi_info(dev, domain, real_parent, info))
+		return false;
=20
-/*
- * Set MSI_FLAG_MSIX_CONTIGUOUS as there is no way to express to
- * firmware to request a discontiguous or non-zero based range of
- * MSI-X entries. Core code will reject such setup attempts.
- */
-static struct msi_domain_info pseries_msi_domain_info =3D {
-	.flags =3D (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		  MSI_FLAG_MULTI_PCI_MSI  | MSI_FLAG_PCI_MSIX |
-		  MSI_FLAG_MSIX_CONTIGUOUS),
-	.ops   =3D &pseries_pci_msi_domain_ops,
-	.chip  =3D &pseries_pci_msi_irq_chip,
+	chip->irq_shutdown =3D pseries_msi_shutdown;
+	chip->irq_write_msi_msg	=3D pseries_msi_write_msg;
+
+	info->ops->msi_prepare =3D pseries_msi_ops_prepare;
+	info->ops->msi_teardown =3D pseries_msi_ops_teardown;
+
+	return true;
+}
+
+#define PSERIES_PCI_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS	| \
+					MSI_FLAG_USE_DEF_CHIP_OPS	| \
+					MSI_FLAG_PCI_MSI_MASK_PARENT)
+#define PSERIES_PCI_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK		| \
+					 MSI_FLAG_PCI_MSIX		| \
+					 MSI_FLAG_MSIX_CONTIGUOUS	| \
+					 MSI_FLAG_MULTI_PCI_MSI)
+
+static const struct msi_parent_ops pseries_msi_parent_ops =3D {
+	.required_flags		=3D PSERIES_PCI_MSI_FLAGS_REQUIRED,
+	.supported_flags	=3D PSERIES_PCI_MSI_FLAGS_SUPPORTED,
+	.chip_flags		=3D MSI_CHIP_FLAG_SET_EOI,
+	.bus_select_token	=3D DOMAIN_BUS_NEXUS,
+	.bus_select_mask	=3D MATCH_PCI_MSI,
+	.prefix			=3D "pSeries-",
+	.init_dev_msi_info	=3D pseries_init_dev_msi_info,
 };
=20
 static void pseries_msi_compose_msg(struct irq_data *data, struct msi_msg =
*msg)
@@ -593,6 +590,7 @@ static void pseries_irq_domain_free(struct irq_domain *=
domain, unsigned int virq
 }
=20
 static const struct irq_domain_ops pseries_irq_domain_ops =3D {
+	.select	=3D msi_lib_irq_domain_select,
 	.alloc  =3D pseries_irq_domain_alloc,
 	.free   =3D pseries_irq_domain_free,
 };
@@ -601,30 +599,18 @@ static int __pseries_msi_allocate_domains(struct pci_=
controller *phb,
 					  unsigned int count)
 {
 	struct irq_domain *parent =3D irq_get_default_domain();
-
-	phb->fwnode =3D irq_domain_alloc_named_id_fwnode("pSeries-MSI",
-						       phb->global_number);
-	if (!phb->fwnode)
-		return -ENOMEM;
-
-	phb->dev_domain =3D irq_domain_create_hierarchy(parent, 0, count,
-						      phb->fwnode,
-						      &pseries_irq_domain_ops, phb);
+	struct irq_domain_info info =3D {
+		.fwnode		=3D of_fwnode_handle(phb->dn),
+		.ops		=3D &pseries_irq_domain_ops,
+		.host_data	=3D phb,
+		.size		=3D count,
+		.parent		=3D parent,
+	};
+
+	phb->dev_domain =3D msi_create_parent_irq_domain(&info, &pseries_msi_pare=
nt_ops);
 	if (!phb->dev_domain) {
-		pr_err("PCI: failed to create IRQ domain bridge %pOF (domain %d)\n",
-		       phb->dn, phb->global_number);
-		irq_domain_free_fwnode(phb->fwnode);
-		return -ENOMEM;
-	}
-
-	phb->msi_domain =3D pci_msi_create_irq_domain(of_fwnode_handle(phb->dn),
-						    &pseries_msi_domain_info,
-						    phb->dev_domain);
-	if (!phb->msi_domain) {
 		pr_err("PCI: failed to create MSI IRQ domain bridge %pOF (domain %d)\n",
 		       phb->dn, phb->global_number);
-		irq_domain_free_fwnode(phb->fwnode);
-		irq_domain_remove(phb->dev_domain);
 		return -ENOMEM;
 	}
=20
@@ -646,12 +632,8 @@ int pseries_msi_allocate_domains(struct pci_controller=
 *phb)
=20
 void pseries_msi_free_domains(struct pci_controller *phb)
 {
-	if (phb->msi_domain)
-		irq_domain_remove(phb->msi_domain);
 	if (phb->dev_domain)
 		irq_domain_remove(phb->dev_domain);
-	if (phb->fwnode)
-		irq_domain_free_fwnode(phb->fwnode);
 }
=20
 static void rtas_msi_pci_irq_fixup(struct pci_dev *pdev)
--=20
2.39.5


