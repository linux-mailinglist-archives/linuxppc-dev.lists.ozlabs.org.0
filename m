Return-Path: <linuxppc-dev+bounces-9843-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7A4AEA911
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 23:53:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSsrh2p72z30KY;
	Fri, 27 Jun 2025 07:53:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750949868;
	cv=none; b=Plb/iVp7hcvdW4dTTwVajrYjJgN5VVc6bsxGSAiKFm1X8DqIQdajtVVmqhk0XCKr7sKu91MSS8SAsptNRkf1NriNYc7y6UQTDo3letSbpveqj1DO5d653WyEnpUQZVuEE1Q5xR2UO1jG7RG89RSABU5fzagb2AbFVTAOhHx158PaN1ddaLd+xuwo/DYi6H6giEj/RdQBwIvWBKS7hFtNrVTvXDOeWrqbs5sKHE94nEmtKWPbEhH4iG6Y4P2tBzJm+YxW29HPuG3uZqtDHFIobTXcs3q3pL0bcyM297ualliEBTAZ6FrqrYfv2Kdot4/1d9gCu8xDnGLDr5qGR7vI3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750949868; c=relaxed/relaxed;
	bh=3v/c6vuqeHoBrxs6oHRCTB1ZClC8Hd2O6Sdk/PzbbvM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mkoJOfgN8maie8desqC71pmsoPsY0OHhhw93jA9B7I+wNfy3u95/2G9JCc9/9+sZ1veSDPNKAXZKh5P+6vUhTPFx2f3kx2k6VQ2vIAYThP5hrpyVpGDh+nJKlsHCPGLynpfea2lxjyH8gwGPIKOdsFY2sz86k9xOAEjMz9BklJpH46oeiasN+0Ec9/E6vU+XYKUiRVbZHbWiUNHWTEp8YmJ0npgxVSyQN5u2FRXjIQpd/SVGLAhmF2ifTf/BmPwfsWNp3YnOjg5cIt4NIl9TsFYdmWiWS+WWxbbxQtA0UoY4zxCNviFIPwrMBNEncdP8UTEBzmeE+YTbJeNV3VrLJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qam1+IXN; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hcAhdUCk; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qam1+IXN;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hcAhdUCk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 577 seconds by postgrey-1.37 at boromir; Fri, 27 Jun 2025 00:57:45 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bShcn5QKkz2xJ1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 00:57:45 +1000 (AEST)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3v/c6vuqeHoBrxs6oHRCTB1ZClC8Hd2O6Sdk/PzbbvM=;
	b=qam1+IXNnXiKlEdeerzr2ZA4Baqy0zCmPCssgE1F1VhRiu4sK0y8u6RUZl81dZx8hDB5On
	n4tLZMARFTIl6xVGj1tmPi2OwaI9g9D91A9ds24/cq7jdDOQ4oEv8yx3rf6dnz4ApepdDz
	hBpHC3/AGzYYTD3vUR0RR2Ugto6qfIzh18FDx5DsHc9hjnue4WkMz8fUfiO5kApZ0J0JMt
	UeIHaRaVGJfJKoD8114NZtBMIr+m2myXddWPHaGiKVhW08+auVtjCGFJXDKpyQlPyEfIQ2
	VWR1v4K6a86Xbswu/nrIJHoCF0hX9rjzu9PHTX5r6RiGtg8aj+jQbv98Hyf0wg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3v/c6vuqeHoBrxs6oHRCTB1ZClC8Hd2O6Sdk/PzbbvM=;
	b=hcAhdUCk3OPsaaGvrBP0cedUHZgNMS01eGNbN+ZxyWSEGt3pFqBKHMkLy+rnx1AiZq1KeE
	aU+uN3clCPtd/cCQ==
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 2/3] powerpc/powernv/pci: Switch to use msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:47:41 +0200
Message-Id: <5479dd3494826f7811582f6e7156dc2ee077c181.1750861319.git.namcao@linutronix.de>
In-Reply-To: <cover.1750861319.git.namcao@linutronix.de>
References: <cover.1750861319.git.namcao@linutronix.de>
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
 arch/powerpc/platforms/powernv/Kconfig    |  1 +
 arch/powerpc/platforms/powernv/pci-ioda.c | 75 ++++++++++-------------
 2 files changed, 35 insertions(+), 41 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platform=
s/powernv/Kconfig
index 95d7ba73d43d0..b5ad7c173ef0c 100644
--- a/arch/powerpc/platforms/powernv/Kconfig
+++ b/arch/powerpc/platforms/powernv/Kconfig
@@ -9,6 +9,7 @@ config PPC_POWERNV
 	select PPC_P7_NAP
 	select FORCE_PCI
 	select PCI_MSI
+	select IRQ_MSI_LIB
 	select EPAPR_BOOT
 	select PPC_INDIRECT_PIO
 	select PPC_UDBG_16550
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platf=
orms/powernv/pci-ioda.c
index fb37098d4d58c..c2a932c6e3040 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -15,6 +15,7 @@
 #include <linux/init.h>
 #include <linux/memblock.h>
 #include <linux/irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
 #include <linux/io.h>
 #include <linux/msi.h>
 #include <linux/iommu.h>
@@ -1713,30 +1714,33 @@ static void pnv_msi_shutdown(struct irq_data *d)
 		d->chip->irq_shutdown(d);
 }
=20
-static void pnv_msi_mask(struct irq_data *d)
+static bool pnv_init_dev_msi_info(struct device *dev, struct irq_domain *d=
omain,
+				  struct irq_domain *real_parent, struct msi_domain_info *info)
 {
-	pci_msi_mask_irq(d);
-	irq_chip_mask_parent(d);
-}
+	struct irq_chip *chip =3D info->chip;
=20
-static void pnv_msi_unmask(struct irq_data *d)
-{
-	pci_msi_unmask_irq(d);
-	irq_chip_unmask_parent(d);
-}
+	if (!msi_lib_init_dev_msi_info(dev, domain, real_parent, info))
+		return false;
=20
-static struct irq_chip pnv_pci_msi_irq_chip =3D {
-	.name		=3D "PNV-PCI-MSI",
-	.irq_shutdown	=3D pnv_msi_shutdown,
-	.irq_mask	=3D pnv_msi_mask,
-	.irq_unmask	=3D pnv_msi_unmask,
-	.irq_eoi	=3D irq_chip_eoi_parent,
-};
+	chip->irq_shutdown =3D pnv_msi_shutdown;
+	return true;
+}
=20
-static struct msi_domain_info pnv_msi_domain_info =3D {
-	.flags =3D (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		  MSI_FLAG_MULTI_PCI_MSI  | MSI_FLAG_PCI_MSIX),
-	.chip  =3D &pnv_pci_msi_irq_chip,
+#define PNV_PCI_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS		| \
+				    MSI_FLAG_USE_DEF_CHIP_OPS		| \
+				    MSI_FLAG_PCI_MSI_MASK_PARENT)
+#define PNV_PCI_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK		| \
+				     MSI_FLAG_PCI_MSIX			| \
+				     MSI_FLAG_MULTI_PCI_MSI)
+
+static const struct msi_parent_ops pnv_msi_parent_ops =3D {
+	.required_flags		=3D PNV_PCI_MSI_FLAGS_REQUIRED,
+	.supported_flags	=3D PNV_PCI_MSI_FLAGS_SUPPORTED,
+	.chip_flags		=3D MSI_CHIP_FLAG_SET_EOI,
+	.bus_select_token	=3D DOMAIN_BUS_NEXUS,
+	.bus_select_mask	=3D MATCH_PCI_MSI,
+	.prefix			=3D "PNV-",
+	.init_dev_msi_info	=3D pnv_init_dev_msi_info,
 };
=20
 static void pnv_msi_compose_msg(struct irq_data *d, struct msi_msg *msg)
@@ -1855,37 +1859,26 @@ static void pnv_irq_domain_free(struct irq_domain *=
domain, unsigned int virq,
 }
=20
 static const struct irq_domain_ops pnv_irq_domain_ops =3D {
+	.select	=3D msi_lib_irq_domain_select,
 	.alloc  =3D pnv_irq_domain_alloc,
 	.free   =3D pnv_irq_domain_free,
 };
=20
 static int __init pnv_msi_allocate_domains(struct pci_controller *hose, un=
signed int count)
 {
-	struct pnv_phb *phb =3D hose->private_data;
 	struct irq_domain *parent =3D irq_get_default_domain();
-
-	hose->fwnode =3D irq_domain_alloc_named_id_fwnode("PNV-MSI", phb->opal_id=
);
-	if (!hose->fwnode)
-		return -ENOMEM;
-
-	hose->dev_domain =3D irq_domain_create_hierarchy(parent, 0, count,
-						       hose->fwnode,
-						       &pnv_irq_domain_ops, hose);
+	struct irq_domain_info info =3D {
+		.fwnode		=3D of_fwnode_handle(hose->dn),
+		.ops		=3D &pnv_irq_domain_ops,
+		.host_data	=3D hose,
+		.size		=3D count,
+		.parent		=3D parent,
+	};
+
+	hose->dev_domain =3D msi_create_parent_irq_domain(&info, &pnv_msi_parent_=
ops);
 	if (!hose->dev_domain) {
-		pr_err("PCI: failed to create IRQ domain bridge %pOF (domain %d)\n",
-		       hose->dn, hose->global_number);
-		irq_domain_free_fwnode(hose->fwnode);
-		return -ENOMEM;
-	}
-
-	hose->msi_domain =3D pci_msi_create_irq_domain(of_fwnode_handle(hose->dn),
-						     &pnv_msi_domain_info,
-						     hose->dev_domain);
-	if (!hose->msi_domain) {
 		pr_err("PCI: failed to create MSI IRQ domain bridge %pOF (domain %d)\n",
 		       hose->dn, hose->global_number);
-		irq_domain_free_fwnode(hose->fwnode);
-		irq_domain_remove(hose->dev_domain);
 		return -ENOMEM;
 	}
=20
--=20
2.39.5


