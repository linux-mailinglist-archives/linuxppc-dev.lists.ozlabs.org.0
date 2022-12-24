Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8907655B4C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Dec 2022 22:20:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NfcQZ5PKcz3f9G
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Dec 2022 08:20:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J+JXBqKJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J+JXBqKJ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NfcLH26h5z3c6Z
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Dec 2022 08:16:39 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3A36060A71;
	Sat, 24 Dec 2022 21:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B931C433F1;
	Sat, 24 Dec 2022 21:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671916596;
	bh=UU48dkbPMWSfqv33kA8+TfkcfoCpjLsskO/H+O/CHJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J+JXBqKJ/DgB9Gjt43K/ArKCpmBGKk/BpjpNZNExk7VWSMTxM2RtkMX46XrQqpOFd
	 mjP+FkvbgSxSUflrxpBL+MN3Hk0STZbF1ykBaS4JJWiTTwYhT37Neeo6QKafvjAi9V
	 RBRW6Q6CWOusTVJ9y/i3Fq6pM64CCzNpmGyzQESiJPU9MsS5N4XZIfudIQoMFnojhX
	 DK0T2Rs5KB1Jpii27beRc4U3AtLuAEb8IF8CNBxuxTrKgoR//M8m+E79Vc4J//7hRP
	 90gFTVNrPWHUtrOKXi4Gdyg/m5i58sQxH//IJ70ZrLvMtH3Z9LJKVQRT7AVml1VyNe
	 fxS0qdIqpzX0w==
Received: by pali.im (Postfix)
	id 01E679E4; Sat, 24 Dec 2022 22:16:33 +0100 (CET)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Scott Wood <oss@buserror.net>,
	Sinan Akman <sinan@writeme.com>,
	Martin Kennedy <hurricos@gmail.com>
Subject: [PATCH v2 3/8] powerpc/85xx: p2020: Move all P2020 machine descriptions to p2020.c
Date: Sat, 24 Dec 2022 22:14:20 +0100
Message-Id: <20221224211425.14983-4-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221224211425.14983-1-pali@kernel.org>
References: <20221224211425.14983-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This moves machine descriptions and all related code for all P2020 boards
into new p2020.c source file. This change also copies helper static
functions from other mpc85xx*.c files into p2020.c, which are required for
machine descriptions. This is preparation for code de-duplication and
providing one unified machine description for all P2020 boards. In
follow-up patches would be copied functions refactored and simplified to be
specific just for P2020 boards.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/platforms/85xx/Makefile      |   2 +
 arch/powerpc/platforms/85xx/mpc85xx_ds.c  |  23 --
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c |  44 ----
 arch/powerpc/platforms/85xx/p2020.c       | 273 ++++++++++++++++++++++
 4 files changed, 275 insertions(+), 67 deletions(-)
 create mode 100644 arch/powerpc/platforms/85xx/p2020.c

diff --git a/arch/powerpc/platforms/85xx/Makefile b/arch/powerpc/platforms/85xx/Makefile
index 260fbad7967b..1ad261b4eeb6 100644
--- a/arch/powerpc/platforms/85xx/Makefile
+++ b/arch/powerpc/platforms/85xx/Makefile
@@ -23,6 +23,8 @@ obj-$(CONFIG_P1010_RDB)   += p1010rdb.o
 obj-$(CONFIG_P1022_DS)    += p1022_ds.o
 obj-$(CONFIG_P1022_RDK)   += p1022_rdk.o
 obj-$(CONFIG_P1023_RDB)   += p1023_rdb.o
+obj-$(CONFIG_MPC85xx_DS)  += p2020.o
+obj-$(CONFIG_MPC85xx_RDB) += p2020.o
 obj-$(CONFIG_TWR_P102x)   += twr_p102x.o
 obj-$(CONFIG_CORENET_GENERIC)   += corenet_generic.o
 obj-$(CONFIG_FB_FSL_DIU)	+= t1042rdb_diu.o
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
index 9a6d637ef54a..05aac997b5ed 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
@@ -168,7 +168,6 @@ static int __init mpc8544_ds_probe(void)
 
 machine_arch_initcall(mpc8544_ds, mpc85xx_common_publish_devices);
 machine_arch_initcall(mpc8572_ds, mpc85xx_common_publish_devices);
-machine_arch_initcall(p2020_ds, mpc85xx_common_publish_devices);
 
 /*
  * Called very early, device-tree isn't unflattened
@@ -178,14 +177,6 @@ static int __init mpc8572_ds_probe(void)
 	return !!of_machine_is_compatible("fsl,MPC8572DS");
 }
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init p2020_ds_probe(void)
-{
-	return !!of_machine_is_compatible("fsl,P2020DS");
-}
-
 define_machine(mpc8544_ds) {
 	.name			= "MPC8544 DS",
 	.probe			= mpc8544_ds_probe,
@@ -213,17 +204,3 @@ define_machine(mpc8572_ds) {
 	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
-
-define_machine(p2020_ds) {
-	.name			= "P2020 DS",
-	.probe			= p2020_ds_probe,
-	.setup_arch		= mpc85xx_ds_setup_arch,
-	.init_IRQ		= mpc85xx_ds_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
-};
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
index b6129c148fea..05f1ed635735 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
@@ -108,8 +108,6 @@ static void __init mpc85xx_rdb_setup_arch(void)
 	printk(KERN_INFO "MPC85xx RDB board from Freescale Semiconductor\n");
 }
 
-machine_arch_initcall(p2020_rdb, mpc85xx_common_publish_devices);
-machine_arch_initcall(p2020_rdb_pc, mpc85xx_common_publish_devices);
 machine_arch_initcall(p1020_mbg_pc, mpc85xx_common_publish_devices);
 machine_arch_initcall(p1020_rdb, mpc85xx_common_publish_devices);
 machine_arch_initcall(p1020_rdb_pc, mpc85xx_common_publish_devices);
@@ -122,13 +120,6 @@ machine_arch_initcall(p1024_rdb, mpc85xx_common_publish_devices);
 /*
  * Called very early, device-tree isn't unflattened
  */
-static int __init p2020_rdb_probe(void)
-{
-	if (of_machine_is_compatible("fsl,P2020RDB"))
-		return 1;
-	return 0;
-}
-
 static int __init p1020_rdb_probe(void)
 {
 	if (of_machine_is_compatible("fsl,P1020RDB"))
@@ -153,13 +144,6 @@ static int __init p1021_rdb_pc_probe(void)
 	return 0;
 }
 
-static int __init p2020_rdb_pc_probe(void)
-{
-	if (of_machine_is_compatible("fsl,P2020RDB-PC"))
-		return 1;
-	return 0;
-}
-
 static int __init p1025_rdb_probe(void)
 {
 	return of_machine_is_compatible("fsl,P1025RDB");
@@ -180,20 +164,6 @@ static int __init p1024_rdb_probe(void)
 	return of_machine_is_compatible("fsl,P1024RDB");
 }
 
-define_machine(p2020_rdb) {
-	.name			= "P2020 RDB",
-	.probe			= p2020_rdb_probe,
-	.setup_arch		= mpc85xx_rdb_setup_arch,
-	.init_IRQ		= mpc85xx_rdb_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
-};
-
 define_machine(p1020_rdb) {
 	.name			= "P1020 RDB",
 	.probe			= p1020_rdb_probe,
@@ -222,20 +192,6 @@ define_machine(p1021_rdb_pc) {
 	.progress		= udbg_progress,
 };
 
-define_machine(p2020_rdb_pc) {
-	.name			= "P2020RDB-PC",
-	.probe			= p2020_rdb_pc_probe,
-	.setup_arch		= mpc85xx_rdb_setup_arch,
-	.init_IRQ		= mpc85xx_rdb_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
-};
-
 define_machine(p1025_rdb) {
 	.name			= "P1025 RDB",
 	.probe			= p1025_rdb_probe,
diff --git a/arch/powerpc/platforms/85xx/p2020.c b/arch/powerpc/platforms/85xx/p2020.c
new file mode 100644
index 000000000000..d65d4c88ac47
--- /dev/null
+++ b/arch/powerpc/platforms/85xx/p2020.c
@@ -0,0 +1,273 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Freescale P2020 board Setup
+ *
+ * Copyright 2007,2009,2012-2013 Freescale Semiconductor Inc.
+ * Copyright 2022 Pali Rohár <pali@kernel.org>
+ */
+
+#include <linux/stddef.h>
+#include <linux/kernel.h>
+#include <linux/pci.h>
+#include <linux/kdev_t.h>
+#include <linux/delay.h>
+#include <linux/seq_file.h>
+#include <linux/interrupt.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/fsl/guts.h>
+
+#include <asm/time.h>
+#include <asm/machdep.h>
+#include <asm/pci-bridge.h>
+#include <mm/mmu_decl.h>
+#include <asm/udbg.h>
+#include <asm/mpic.h>
+#include <asm/i8259.h>
+#include <asm/swiotlb.h>
+
+#include <soc/fsl/qe/qe.h>
+
+#include <sysdev/fsl_soc.h>
+#include <sysdev/fsl_pci.h>
+#include "smp.h"
+
+#include "mpc85xx.h"
+
+#undef DEBUG
+
+#ifdef DEBUG
+#define DBG(fmt, args...) printk(KERN_ERR "%s: " fmt, __func__, ## args)
+#else
+#define DBG(fmt, args...)
+#endif
+
+#ifdef CONFIG_MPC85xx_DS
+
+#ifdef CONFIG_PPC_I8259
+static void mpc85xx_8259_cascade(struct irq_desc *desc)
+{
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned int cascade_irq = i8259_irq();
+
+	if (cascade_irq) {
+		generic_handle_irq(cascade_irq);
+	}
+	chip->irq_eoi(&desc->irq_data);
+}
+#endif	/* CONFIG_PPC_I8259 */
+
+static void __init mpc85xx_ds_pic_init(void)
+{
+	struct mpic *mpic;
+#ifdef CONFIG_PPC_I8259
+	struct device_node *np;
+	struct device_node *cascade_node = NULL;
+	int cascade_irq;
+#endif
+
+	mpic = mpic_alloc(NULL, 0,
+		  MPIC_BIG_ENDIAN |
+		  MPIC_SINGLE_DEST_CPU,
+		0, 256, " OpenPIC  ");
+
+	BUG_ON(mpic == NULL);
+	mpic_init(mpic);
+
+#ifdef CONFIG_PPC_I8259
+	/* Initialize the i8259 controller */
+	for_each_node_by_type(np, "interrupt-controller")
+	    if (of_device_is_compatible(np, "chrp,iic")) {
+		cascade_node = np;
+		break;
+	}
+
+	if (cascade_node == NULL) {
+		printk(KERN_DEBUG "Could not find i8259 PIC\n");
+		return;
+	}
+
+	cascade_irq = irq_of_parse_and_map(cascade_node, 0);
+	if (!cascade_irq) {
+		printk(KERN_ERR "Failed to map cascade interrupt\n");
+		return;
+	}
+
+	DBG("mpc85xxds: cascade mapped to irq %d\n", cascade_irq);
+
+	i8259_init(cascade_node, 0);
+	of_node_put(cascade_node);
+
+	irq_set_chained_handler(cascade_irq, mpc85xx_8259_cascade);
+#endif	/* CONFIG_PPC_I8259 */
+}
+
+#ifdef CONFIG_PCI
+extern int uli_exclude_device(struct pci_controller *hose,
+				u_char bus, u_char devfn);
+
+static struct device_node *pci_with_uli;
+
+static int mpc85xx_exclude_device(struct pci_controller *hose,
+				   u_char bus, u_char devfn)
+{
+	if (hose->dn == pci_with_uli)
+		return uli_exclude_device(hose, bus, devfn);
+
+	return PCIBIOS_SUCCESSFUL;
+}
+#endif	/* CONFIG_PCI */
+
+static void __init mpc85xx_ds_uli_init(void)
+{
+#ifdef CONFIG_PCI
+	struct device_node *node;
+
+	/* See if we have a ULI under the primary */
+
+	node = of_find_node_by_name(NULL, "uli1575");
+	while ((pci_with_uli = of_get_parent(node))) {
+		of_node_put(node);
+		node = pci_with_uli;
+
+		if (pci_with_uli == fsl_pci_primary) {
+			ppc_md.pci_exclude_device = mpc85xx_exclude_device;
+			break;
+		}
+	}
+#endif
+}
+
+#endif /* CONFIG_MPC85xx_DS */
+
+#ifdef CONFIG_MPC85xx_RDB
+static void __init mpc85xx_rdb_pic_init(void)
+{
+	struct mpic *mpic;
+
+	mpic = mpic_alloc(NULL, 0,
+	  MPIC_BIG_ENDIAN |
+	  MPIC_SINGLE_DEST_CPU,
+	  0, 256, " OpenPIC  ");
+
+	BUG_ON(mpic == NULL);
+	mpic_init(mpic);
+}
+#endif /* CONFIG_MPC85xx_RDB */
+
+/*
+ * Setup the architecture
+ */
+#ifdef CONFIG_MPC85xx_DS
+static void __init mpc85xx_ds_setup_arch(void)
+{
+	if (ppc_md.progress)
+		ppc_md.progress("mpc85xx_ds_setup_arch()", 0);
+
+	swiotlb_detect_4g();
+	fsl_pci_assign_primary();
+	mpc85xx_ds_uli_init();
+	mpc85xx_smp_init();
+
+	printk("MPC85xx DS board from Freescale Semiconductor\n");
+}
+#endif /* CONFIG_MPC85xx_DS */
+
+#ifdef CONFIG_MPC85xx_RDB
+static void __init mpc85xx_rdb_setup_arch(void)
+{
+	if (ppc_md.progress)
+		ppc_md.progress("mpc85xx_rdb_setup_arch()", 0);
+
+	mpc85xx_smp_init();
+
+	fsl_pci_assign_primary();
+
+#ifdef CONFIG_QUICC_ENGINE
+	mpc85xx_qe_par_io_init();
+#endif	/* CONFIG_QUICC_ENGINE */
+
+	printk(KERN_INFO "MPC85xx RDB board from Freescale Semiconductor\n");
+}
+#endif /* CONFIG_MPC85xx_RDB */
+
+#ifdef CONFIG_MPC85xx_DS
+machine_arch_initcall(p2020_ds, mpc85xx_common_publish_devices);
+#endif /* CONFIG_MPC85xx_DS */
+
+#ifdef CONFIG_MPC85xx_RDB
+machine_arch_initcall(p2020_rdb, mpc85xx_common_publish_devices);
+machine_arch_initcall(p2020_rdb_pc, mpc85xx_common_publish_devices);
+#endif /* CONFIG_MPC85xx_RDB */
+
+/*
+ * Called very early, device-tree isn't unflattened
+ */
+#ifdef CONFIG_MPC85xx_DS
+static int __init p2020_ds_probe(void)
+{
+	return !!of_machine_is_compatible("fsl,P2020DS");
+}
+#endif /* CONFIG_MPC85xx_DS */
+
+#ifdef CONFIG_MPC85xx_RDB
+static int __init p2020_rdb_probe(void)
+{
+	if (of_machine_is_compatible("fsl,P2020RDB"))
+		return 1;
+	return 0;
+}
+
+static int __init p2020_rdb_pc_probe(void)
+{
+	if (of_machine_is_compatible("fsl,P2020RDB-PC"))
+		return 1;
+	return 0;
+}
+#endif /* CONFIG_MPC85xx_RDB */
+
+#ifdef CONFIG_MPC85xx_DS
+define_machine(p2020_ds) {
+	.name			= "P2020 DS",
+	.probe			= p2020_ds_probe,
+	.setup_arch		= mpc85xx_ds_setup_arch,
+	.init_IRQ		= mpc85xx_ds_pic_init,
+#ifdef CONFIG_PCI
+	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
+	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
+#endif
+	.get_irq		= mpic_get_irq,
+	.calibrate_decr		= generic_calibrate_decr,
+	.progress		= udbg_progress,
+};
+#endif /* CONFIG_MPC85xx_DS */
+
+#ifdef CONFIG_MPC85xx_RDB
+define_machine(p2020_rdb) {
+	.name			= "P2020 RDB",
+	.probe			= p2020_rdb_probe,
+	.setup_arch		= mpc85xx_rdb_setup_arch,
+	.init_IRQ		= mpc85xx_rdb_pic_init,
+#ifdef CONFIG_PCI
+	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
+	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
+#endif
+	.get_irq		= mpic_get_irq,
+	.calibrate_decr		= generic_calibrate_decr,
+	.progress		= udbg_progress,
+};
+
+define_machine(p2020_rdb_pc) {
+	.name			= "P2020RDB-PC",
+	.probe			= p2020_rdb_pc_probe,
+	.setup_arch		= mpc85xx_rdb_setup_arch,
+	.init_IRQ		= mpc85xx_rdb_pic_init,
+#ifdef CONFIG_PCI
+	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
+	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
+#endif
+	.get_irq		= mpic_get_irq,
+	.calibrate_decr		= generic_calibrate_decr,
+	.progress		= udbg_progress,
+};
+#endif /* CONFIG_MPC85xx_RDB */
-- 
2.20.1

