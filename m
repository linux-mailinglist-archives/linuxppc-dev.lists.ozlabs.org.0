Return-Path: <linuxppc-dev+bounces-9845-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB3BAEA913
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 23:54:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSssB3gv2z30Qk;
	Fri, 27 Jun 2025 07:54:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750949869;
	cv=none; b=YUdiVGGtAtvcOiuhHpSUVVn7wRjZ1dmiF41IBn8aSDRuAQDkrSfRumhkNSguF/n74PNbumI51DOUzXDH1eQfJvZq/5c55qIg7PbrQWCW5doRIMeelqKzBseGtlicIttMbJjni4giRLR5NEk4oBtk6DcgEFc4/xLdt5je1SITrGLlqg6LfqfVGO1MHq+rGrguImgk5JzyNETTirJZsORgKEeAE8+YT0vWTNvjbN9+3mk8oX1qs1KyoL2O3H9ylK8ApfwT7NT0DU3CLZOV7KOCMF1fVaNmKcAikc5xQD1JyZNDXKXzxdNeY+R8Ph5BG4IN8B/PK6X8b/YzGdCZ4fFhFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750949869; c=relaxed/relaxed;
	bh=FwgBddnfwlNgLAt//EVMoSQsReEsGfEjGj3POlgdKHE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aJBw5DwX60s3GQ0rbPB+fsFdCsLFpA04Xu2XLHx1vrJV8K5iGP6l25R+5oFlEUZcXhyAYs6uHeT+S+NG3IfEzIIuOuWQzPAYDUuPTs1t5D9fustKhbGdOP2oBXweEl65coFSB66TEmHcGDhdefwy10m1p/8QlghZOv1inweSFUqb1yPW1JuPBmAu0Bax8IQVtAWCr6dNTgiOxhTkN997lA3go7T4Y8DY5go4YckMjHx86Pa92GEiD1LNSIvmXXzH2Dh343b2Is3UWWfjvFbQGg5ueVgdYVnYgwLDSSb382X9ZsyoIivQIsppRAaq8fqCtoWVTrFy5Ppg9RTV/dOjmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UVd2GxUM; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rXtKEcMC; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UVd2GxUM;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rXtKEcMC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bShcp0JZ2z30Ff
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 00:57:45 +1000 (AEST)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FwgBddnfwlNgLAt//EVMoSQsReEsGfEjGj3POlgdKHE=;
	b=UVd2GxUMvR0idvFr3ecZ48BpH3L1zHJVTsJPhcJuHqdJo6/vokDIrCaw7aX24MQ3TdJMEi
	JD9xxq+A2SDG6Tf5pxibl7G4r7VWPYyRWfJ9ms/CqA3vJuTBwBx/ptEoLGhaZXQhL/s+IQ
	Pmza2Puv24J7xU1wc3XjCfOwERt/ZelxcyBVsnDtyTINTzYZSyN1RlPJf3/wGwbCL1NNo8
	OCyKlX/dvlHUuojLwM+00vhFscajptFtTePsxJdGDZQopOa9QIgjVvoqu5umbDqy1xsnnI
	xYzFhPQ2hyi5eHQQp+Ru/j4MMUYuvh7jTPBQCSMKfBpHbIGr108BbfL1u9wBmg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FwgBddnfwlNgLAt//EVMoSQsReEsGfEjGj3POlgdKHE=;
	b=rXtKEcMCBW7cMWjrYp7e9nJ0e+z/PmCG+c5Xwe9cvCupTK8+LiflK5WW2ZvnhY7HkHvONg
	eKJNBh0oOogfdcCw==
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 1/3] powerpc/xive: Untangle xive from child interrupt controller drivers
Date: Thu, 26 Jun 2025 16:47:40 +0200
Message-Id: <3d3098ceaae497f2c7adc833433b37b0cb675582.1750861319.git.namcao@linutronix.de>
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

xive-specific data is stored in handler_data. This creates a mess, as xive
has to rely on child interrupt controller drivers to clean up this data, as
was done by 9a014f45688 ("powerpc/pseries/pci: Add a msi_free() handler to
clear XIVE data").

Instead, store xive-specific data in chip_data and untangle the child
drivers.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/powerpc/include/asm/xive.h           |  1 -
 arch/powerpc/platforms/powernv/pci-ioda.c | 21 +-------
 arch/powerpc/platforms/pseries/msi.c      | 18 +------
 arch/powerpc/sysdev/xive/common.c         | 63 +++++++++++------------
 4 files changed, 33 insertions(+), 70 deletions(-)

diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/xiv=
e.h
index 92930b0b5d0e1..efb0f5effcc69 100644
--- a/arch/powerpc/include/asm/xive.h
+++ b/arch/powerpc/include/asm/xive.h
@@ -111,7 +111,6 @@ void xive_native_free_vp_block(u32 vp_base);
 int xive_native_populate_irq_data(u32 hw_irq,
 				  struct xive_irq_data *data);
 void xive_cleanup_irq_data(struct xive_irq_data *xd);
-void xive_irq_free_data(unsigned int virq);
 void xive_native_free_irq(u32 irq);
 int xive_native_configure_irq(u32 hw_irq, u32 target, u8 prio, u32 sw_irq);
=20
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platf=
orms/powernv/pci-ioda.c
index d8ccf2c9b98ad..fb37098d4d58c 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -37,7 +37,6 @@
 #include <asm/firmware.h>
 #include <asm/pnv-pci.h>
 #include <asm/mmzone.h>
-#include <asm/xive.h>
=20
 #include "powernv.h"
 #include "pci.h"
@@ -1707,23 +1706,6 @@ static int __pnv_pci_ioda_msi_setup(struct pnv_phb *=
phb, struct pci_dev *dev,
 	return 0;
 }
=20
-/*
- * The msi_free() op is called before irq_domain_free_irqs_top() when
- * the handler data is still available. Use that to clear the XIVE
- * controller.
- */
-static void pnv_msi_ops_msi_free(struct irq_domain *domain,
-				 struct msi_domain_info *info,
-				 unsigned int irq)
-{
-	if (xive_enabled())
-		xive_irq_free_data(irq);
-}
-
-static struct msi_domain_ops pnv_pci_msi_domain_ops =3D {
-	.msi_free	=3D pnv_msi_ops_msi_free,
-};
-
 static void pnv_msi_shutdown(struct irq_data *d)
 {
 	d =3D d->parent_data;
@@ -1754,7 +1736,6 @@ static struct irq_chip pnv_pci_msi_irq_chip =3D {
 static struct msi_domain_info pnv_msi_domain_info =3D {
 	.flags =3D (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
 		  MSI_FLAG_MULTI_PCI_MSI  | MSI_FLAG_PCI_MSIX),
-	.ops   =3D &pnv_pci_msi_domain_ops,
 	.chip  =3D &pnv_pci_msi_irq_chip,
 };
=20
@@ -1870,7 +1851,7 @@ static void pnv_irq_domain_free(struct irq_domain *do=
main, unsigned int virq,
 		 virq, d->hwirq, nr_irqs);
=20
 	msi_bitmap_free_hwirqs(&phb->msi_bmp, d->hwirq, nr_irqs);
-	/* XIVE domain is cleared through ->msi_free() */
+	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
 }
=20
 static const struct irq_domain_ops pnv_irq_domain_ops =3D {
diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/=
pseries/msi.c
index ee1c8c6898a3c..10712477938e4 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -15,7 +15,6 @@
 #include <asm/hw_irq.h>
 #include <asm/ppc-pci.h>
 #include <asm/machdep.h>
-#include <asm/xive.h>
=20
 #include "pseries.h"
=20
@@ -436,19 +435,6 @@ static int pseries_msi_ops_prepare(struct irq_domain *=
domain, struct device *dev
 	return rtas_prepare_msi_irqs(pdev, nvec, type, arg);
 }
=20
-/*
- * ->msi_free() is called before irq_domain_free_irqs_top() when the
- * handler data is still available. Use that to clear the XIVE
- * controller data.
- */
-static void pseries_msi_ops_msi_free(struct irq_domain *domain,
-				     struct msi_domain_info *info,
-				     unsigned int irq)
-{
-	if (xive_enabled())
-		xive_irq_free_data(irq);
-}
-
 /*
  * RTAS can not disable one MSI at a time. It's all or nothing. Do it
  * at the end after all IRQs have been freed.
@@ -463,7 +449,6 @@ static void pseries_msi_post_free(struct irq_domain *do=
main, struct device *dev)
=20
 static struct msi_domain_ops pseries_pci_msi_domain_ops =3D {
 	.msi_prepare	=3D pseries_msi_ops_prepare,
-	.msi_free	=3D pseries_msi_ops_msi_free,
 	.msi_post_free	=3D pseries_msi_post_free,
 };
=20
@@ -604,8 +589,7 @@ static void pseries_irq_domain_free(struct irq_domain *=
domain, unsigned int virq
 	struct pci_controller *phb =3D irq_data_get_irq_chip_data(d);
=20
 	pr_debug("%s bridge %pOF %d #%d\n", __func__, phb->dn, virq, nr_irqs);
-
-	/* XIVE domain data is cleared through ->msi_free() */
+	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
 }
=20
 static const struct irq_domain_ops pseries_irq_domain_ops =3D {
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/c=
ommon.c
index f105924050247..625361a15424e 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -317,7 +317,7 @@ int xmon_xive_get_irq_config(u32 hw_irq, struct irq_dat=
a *d)
 	if (d) {
 		char buffer[128];
=20
-		xive_irq_data_dump(irq_data_get_irq_handler_data(d),
+		xive_irq_data_dump(irq_data_get_irq_chip_data(d),
 				   buffer, sizeof(buffer));
 		xmon_printf("%s", buffer);
 	}
@@ -437,7 +437,7 @@ static void xive_do_source_eoi(struct xive_irq_data *xd)
 /* irq_chip eoi callback, called with irq descriptor lock held */
 static void xive_irq_eoi(struct irq_data *d)
 {
-	struct xive_irq_data *xd =3D irq_data_get_irq_handler_data(d);
+	struct xive_irq_data *xd =3D irq_data_get_irq_chip_data(d);
 	struct xive_cpu *xc =3D __this_cpu_read(xive_cpu);
=20
 	DBG_VERBOSE("eoi_irq: irq=3D%d [0x%lx] pending=3D%02x\n",
@@ -595,7 +595,7 @@ static int xive_pick_irq_target(struct irq_data *d,
 				const struct cpumask *affinity)
 {
 	static unsigned int fuzz;
-	struct xive_irq_data *xd =3D irq_data_get_irq_handler_data(d);
+	struct xive_irq_data *xd =3D irq_data_get_irq_chip_data(d);
 	cpumask_var_t mask;
 	int cpu =3D -1;
=20
@@ -628,7 +628,7 @@ static int xive_pick_irq_target(struct irq_data *d,
=20
 static unsigned int xive_irq_startup(struct irq_data *d)
 {
-	struct xive_irq_data *xd =3D irq_data_get_irq_handler_data(d);
+	struct xive_irq_data *xd =3D irq_data_get_irq_chip_data(d);
 	unsigned int hw_irq =3D (unsigned int)irqd_to_hwirq(d);
 	int target, rc;
=20
@@ -673,7 +673,7 @@ static unsigned int xive_irq_startup(struct irq_data *d)
 /* called with irq descriptor lock held */
 static void xive_irq_shutdown(struct irq_data *d)
 {
-	struct xive_irq_data *xd =3D irq_data_get_irq_handler_data(d);
+	struct xive_irq_data *xd =3D irq_data_get_irq_chip_data(d);
 	unsigned int hw_irq =3D (unsigned int)irqd_to_hwirq(d);
=20
 	pr_debug("%s: irq %d [0x%x] data @%p\n", __func__, d->irq, hw_irq, d);
@@ -698,7 +698,7 @@ static void xive_irq_shutdown(struct irq_data *d)
=20
 static void xive_irq_unmask(struct irq_data *d)
 {
-	struct xive_irq_data *xd =3D irq_data_get_irq_handler_data(d);
+	struct xive_irq_data *xd =3D irq_data_get_irq_chip_data(d);
=20
 	pr_debug("%s: irq %d data @%p\n", __func__, d->irq, xd);
=20
@@ -707,7 +707,7 @@ static void xive_irq_unmask(struct irq_data *d)
=20
 static void xive_irq_mask(struct irq_data *d)
 {
-	struct xive_irq_data *xd =3D irq_data_get_irq_handler_data(d);
+	struct xive_irq_data *xd =3D irq_data_get_irq_chip_data(d);
=20
 	pr_debug("%s: irq %d data @%p\n", __func__, d->irq, xd);
=20
@@ -718,7 +718,7 @@ static int xive_irq_set_affinity(struct irq_data *d,
 				 const struct cpumask *cpumask,
 				 bool force)
 {
-	struct xive_irq_data *xd =3D irq_data_get_irq_handler_data(d);
+	struct xive_irq_data *xd =3D irq_data_get_irq_chip_data(d);
 	unsigned int hw_irq =3D (unsigned int)irqd_to_hwirq(d);
 	u32 target, old_target;
 	int rc =3D 0;
@@ -776,7 +776,7 @@ static int xive_irq_set_affinity(struct irq_data *d,
=20
 static int xive_irq_set_type(struct irq_data *d, unsigned int flow_type)
 {
-	struct xive_irq_data *xd =3D irq_data_get_irq_handler_data(d);
+	struct xive_irq_data *xd =3D irq_data_get_irq_chip_data(d);
=20
 	/*
 	 * We only support these. This has really no effect other than setting
@@ -815,7 +815,7 @@ static int xive_irq_set_type(struct irq_data *d, unsign=
ed int flow_type)
=20
 static int xive_irq_retrigger(struct irq_data *d)
 {
-	struct xive_irq_data *xd =3D irq_data_get_irq_handler_data(d);
+	struct xive_irq_data *xd =3D irq_data_get_irq_chip_data(d);
=20
 	/* This should be only for MSIs */
 	if (WARN_ON(xd->flags & XIVE_IRQ_FLAG_LSI))
@@ -837,7 +837,7 @@ static int xive_irq_retrigger(struct irq_data *d)
  */
 static int xive_irq_set_vcpu_affinity(struct irq_data *d, void *state)
 {
-	struct xive_irq_data *xd =3D irq_data_get_irq_handler_data(d);
+	struct xive_irq_data *xd =3D irq_data_get_irq_chip_data(d);
 	unsigned int hw_irq =3D (unsigned int)irqd_to_hwirq(d);
 	int rc;
 	u8 pq;
@@ -951,7 +951,7 @@ static int xive_irq_set_vcpu_affinity(struct irq_data *=
d, void *state)
 static int xive_get_irqchip_state(struct irq_data *data,
 				  enum irqchip_irq_state which, bool *state)
 {
-	struct xive_irq_data *xd =3D irq_data_get_irq_handler_data(data);
+	struct xive_irq_data *xd =3D irq_data_get_irq_chip_data(data);
 	u8 pq;
=20
 	switch (which) {
@@ -1011,21 +1011,20 @@ void xive_cleanup_irq_data(struct xive_irq_data *xd)
 }
 EXPORT_SYMBOL_GPL(xive_cleanup_irq_data);
=20
-static int xive_irq_alloc_data(unsigned int virq, irq_hw_number_t hw)
+static struct xive_irq_data *xive_irq_alloc_data(unsigned int virq, irq_hw=
_number_t hw)
 {
 	struct xive_irq_data *xd;
 	int rc;
=20
 	xd =3D kzalloc(sizeof(struct xive_irq_data), GFP_KERNEL);
 	if (!xd)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 	rc =3D xive_ops->populate_irq_data(hw, xd);
 	if (rc) {
 		kfree(xd);
-		return rc;
+		return ERR_PTR(rc);
 	}
 	xd->target =3D XIVE_INVALID_TARGET;
-	irq_set_handler_data(virq, xd);
=20
 	/*
 	 * Turn OFF by default the interrupt being mapped. A side
@@ -1036,20 +1035,19 @@ static int xive_irq_alloc_data(unsigned int virq, i=
rq_hw_number_t hw)
 	 */
 	xive_esb_read(xd, XIVE_ESB_SET_PQ_01);
=20
-	return 0;
+	return xd;
 }
=20
-void xive_irq_free_data(unsigned int virq)
+static void xive_irq_free_data(unsigned int virq)
 {
-	struct xive_irq_data *xd =3D irq_get_handler_data(virq);
+	struct xive_irq_data *xd =3D irq_get_chip_data(virq);
=20
 	if (!xd)
 		return;
-	irq_set_handler_data(virq, NULL);
+	irq_set_chip_data(virq, NULL);
 	xive_cleanup_irq_data(xd);
 	kfree(xd);
 }
-EXPORT_SYMBOL_GPL(xive_irq_free_data);
=20
 #ifdef CONFIG_SMP
=20
@@ -1286,7 +1284,7 @@ void __init xive_smp_probe(void)
 static int xive_irq_domain_map(struct irq_domain *h, unsigned int virq,
 			       irq_hw_number_t hw)
 {
-	int rc;
+	struct xive_irq_data *xd;
=20
 	/*
 	 * Mark interrupts as edge sensitive by default so that resend
@@ -1294,11 +1292,12 @@ static int xive_irq_domain_map(struct irq_domain *h=
, unsigned int virq,
 	 */
 	irq_clear_status_flags(virq, IRQ_LEVEL);
=20
-	rc =3D xive_irq_alloc_data(virq, hw);
-	if (rc)
-		return rc;
+	xd =3D xive_irq_alloc_data(virq, hw);
+	if (IS_ERR(xd))
+		return PTR_ERR(xd);
=20
 	irq_set_chip_and_handler(virq, &xive_irq_chip, handle_fasteoi_irq);
+	irq_set_chip_data(virq, xd);
=20
 	return 0;
 }
@@ -1366,7 +1365,7 @@ static void xive_irq_domain_debug_show(struct seq_fil=
e *m, struct irq_domain *d,
 	seq_printf(m, "%*sXIVE:\n", ind, "");
 	ind++;
=20
-	xd =3D irq_data_get_irq_handler_data(irqd);
+	xd =3D irq_data_get_irq_chip_data(irqd);
 	if (!xd) {
 		seq_printf(m, "%*snot assigned\n", ind, "");
 		return;
@@ -1403,6 +1402,7 @@ static int xive_irq_domain_alloc(struct irq_domain *d=
omain, unsigned int virq,
 				 unsigned int nr_irqs, void *arg)
 {
 	struct irq_fwspec *fwspec =3D arg;
+	struct xive_irq_data *xd;
 	irq_hw_number_t hwirq;
 	unsigned int type =3D IRQ_TYPE_NONE;
 	int i, rc;
@@ -1423,12 +1423,11 @@ static int xive_irq_domain_alloc(struct irq_domain =
*domain, unsigned int virq,
 		irq_clear_status_flags(virq, IRQ_LEVEL);
=20
 		/* allocates and sets handler data */
-		rc =3D xive_irq_alloc_data(virq + i, hwirq + i);
-		if (rc)
-			return rc;
+		xd =3D xive_irq_alloc_data(virq + i, hwirq + i);
+		if (IS_ERR(xd))
+			return PTR_ERR(xd);
=20
-		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
-					      &xive_irq_chip, domain->host_data);
+		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i, &xive_irq_chi=
p, xd);
 		irq_set_handler(virq + i, handle_fasteoi_irq);
 	}
=20
@@ -1764,7 +1763,7 @@ static void xive_debug_show_irq(struct seq_file *m, s=
truct irq_data *d)
 	seq_printf(m, "IRQ 0x%08x : target=3D0x%x prio=3D%02x lirq=3D0x%x ",
 		   hw_irq, target, prio, lirq);
=20
-	xive_irq_data_dump(irq_data_get_irq_handler_data(d), buffer, sizeof(buffe=
r));
+	xive_irq_data_dump(irq_data_get_irq_chip_data(d), buffer, sizeof(buffer));
 	seq_puts(m, buffer);
 	seq_puts(m, "\n");
 }
--=20
2.39.5


