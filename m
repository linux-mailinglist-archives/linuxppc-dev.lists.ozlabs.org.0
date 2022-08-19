Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DACBB59A636
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 21:19:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8WlV5gnFz3f1T
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 05:19:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RHEdo9/T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RHEdo9/T;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8Whx712Cz2xk5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 05:17:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0D4846151C;
	Fri, 19 Aug 2022 19:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B43C43470;
	Fri, 19 Aug 2022 19:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660936622;
	bh=9wskmcd1b6KSsj/RP4PdY7DWTXMfH6bmhRk8PXBPbkQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RHEdo9/TrzA+8517sYoFVRclKoNBlPIHb2wNDXJwVMNjM8n18RcUlakoAYTd3ygye
	 lF0vK4T2lgqclgZ4yyp0aWIIgu7yICQJV2ews6ldB0yJ/9jharryaEYxg31dP0KZ4g
	 HyIiwcwI5IahKPCdPO8+JSjV0VC8LLj18oEoCVp4qgMlY13mGyepVb2KA2COxrExfb
	 khVVidZfLxEW6vDmS20slplY3XIQsrNxNVouFQxwEuZ5Nn0ImQClcte5RyCRU8lgQB
	 +yvHUhIF7MiFIF8GqhpqKG8MUmDRBO/AqZ6+LESi+Ncy7F7UBinYfFqNtBgdgRE6uY
	 8CeOBLF3oeMqw==
Received: by pali.im (Postfix)
	id BF1CD2ADB; Fri, 19 Aug 2022 21:16:59 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Scott Wood <oss@buserror.net>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Sinan Akman <sinan@writeme.com>
Subject: [PATCH 3/7] powerpc/85xx: p2020: Move all P2020 machine descriptions to p2020.c
Date: Fri, 19 Aug 2022 21:15:53 +0200
Message-Id: <20220819191557.28116-4-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220819191557.28116-1-pali@kernel.org>
References: <20220819191557.28116-1-pali@kernel.org>
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
into new p2020.c source file. This is preparation for code deduplication
and providing one unified machine description for all P2020 boards.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/platforms/85xx/Makefile          |   2 +
 arch/powerpc/platforms/85xx/mpc85xx_ds.c      |  23 ---
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c     |  44 ------
 .../platforms/85xx/{mpc85xx_ds.c => p2020.c}  | 134 ++++++++++++------
 4 files changed, 91 insertions(+), 112 deletions(-)
 copy arch/powerpc/platforms/85xx/{mpc85xx_ds.c => p2020.c} (65%)

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
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/p2020.c
similarity index 65%
copy from arch/powerpc/platforms/85xx/mpc85xx_ds.c
copy to arch/powerpc/platforms/85xx/p2020.c
index 9a6d637ef54a..d65d4c88ac47 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
+++ b/arch/powerpc/platforms/85xx/p2020.c
@@ -1,11 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * MPC85xx DS Board Setup
+ * Freescale P2020 board Setup
  *
- * Author Xianghua Xiao (x.xiao@freescale.com)
- * Roy Zang <tie-fei.zang@freescale.com>
- * 	- Add PCI/PCI Exprees support
- * Copyright 2007 Freescale Semiconductor Inc.
+ * Copyright 2007,2009,2012-2013 Freescale Semiconductor Inc.
+ * Copyright 2022 Pali Rohár <pali@kernel.org>
  */
 
 #include <linux/stddef.h>
@@ -17,6 +15,7 @@
 #include <linux/interrupt.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/fsl/guts.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
@@ -27,6 +26,8 @@
 #include <asm/i8259.h>
 #include <asm/swiotlb.h>
 
+#include <soc/fsl/qe/qe.h>
+
 #include <sysdev/fsl_soc.h>
 #include <sysdev/fsl_pci.h>
 #include "smp.h"
@@ -41,6 +42,8 @@
 #define DBG(fmt, args...)
 #endif
 
+#ifdef CONFIG_MPC85xx_DS
+
 #ifdef CONFIG_PPC_I8259
 static void mpc85xx_8259_cascade(struct irq_desc *desc)
 {
@@ -62,18 +65,11 @@ static void __init mpc85xx_ds_pic_init(void)
 	struct device_node *cascade_node = NULL;
 	int cascade_irq;
 #endif
-	if (of_machine_is_compatible("fsl,MPC8572DS-CAMP")) {
-		mpic = mpic_alloc(NULL, 0,
-			MPIC_NO_RESET |
-			MPIC_BIG_ENDIAN |
-			MPIC_SINGLE_DEST_CPU,
-			0, 256, " OpenPIC  ");
-	} else {
-		mpic = mpic_alloc(NULL, 0,
-			  MPIC_BIG_ENDIAN |
-			  MPIC_SINGLE_DEST_CPU,
-			0, 256, " OpenPIC  ");
-	}
+
+	mpic = mpic_alloc(NULL, 0,
+		  MPIC_BIG_ENDIAN |
+		  MPIC_SINGLE_DEST_CPU,
+		0, 256, " OpenPIC  ");
 
 	BUG_ON(mpic == NULL);
 	mpic_init(mpic);
@@ -142,9 +138,27 @@ static void __init mpc85xx_ds_uli_init(void)
 #endif
 }
 
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
 /*
  * Setup the architecture
  */
+#ifdef CONFIG_MPC85xx_DS
 static void __init mpc85xx_ds_setup_arch(void)
 {
 	if (ppc_md.progress)
@@ -157,38 +171,65 @@ static void __init mpc85xx_ds_setup_arch(void)
 
 	printk("MPC85xx DS board from Freescale Semiconductor\n");
 }
+#endif /* CONFIG_MPC85xx_DS */
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init mpc8544_ds_probe(void)
+#ifdef CONFIG_MPC85xx_RDB
+static void __init mpc85xx_rdb_setup_arch(void)
 {
-	return !!of_machine_is_compatible("MPC8544DS");
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
 }
+#endif /* CONFIG_MPC85xx_RDB */
 
-machine_arch_initcall(mpc8544_ds, mpc85xx_common_publish_devices);
-machine_arch_initcall(mpc8572_ds, mpc85xx_common_publish_devices);
+#ifdef CONFIG_MPC85xx_DS
 machine_arch_initcall(p2020_ds, mpc85xx_common_publish_devices);
+#endif /* CONFIG_MPC85xx_DS */
 
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init mpc8572_ds_probe(void)
-{
-	return !!of_machine_is_compatible("fsl,MPC8572DS");
-}
+#ifdef CONFIG_MPC85xx_RDB
+machine_arch_initcall(p2020_rdb, mpc85xx_common_publish_devices);
+machine_arch_initcall(p2020_rdb_pc, mpc85xx_common_publish_devices);
+#endif /* CONFIG_MPC85xx_RDB */
 
 /*
  * Called very early, device-tree isn't unflattened
  */
+#ifdef CONFIG_MPC85xx_DS
 static int __init p2020_ds_probe(void)
 {
 	return !!of_machine_is_compatible("fsl,P2020DS");
 }
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
 
-define_machine(mpc8544_ds) {
-	.name			= "MPC8544 DS",
-	.probe			= mpc8544_ds_probe,
+#ifdef CONFIG_MPC85xx_DS
+define_machine(p2020_ds) {
+	.name			= "P2020 DS",
+	.probe			= p2020_ds_probe,
 	.setup_arch		= mpc85xx_ds_setup_arch,
 	.init_IRQ		= mpc85xx_ds_pic_init,
 #ifdef CONFIG_PCI
@@ -199,12 +240,14 @@ define_machine(mpc8544_ds) {
 	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
-
-define_machine(mpc8572_ds) {
-	.name			= "MPC8572 DS",
-	.probe			= mpc8572_ds_probe,
-	.setup_arch		= mpc85xx_ds_setup_arch,
-	.init_IRQ		= mpc85xx_ds_pic_init,
+#endif /* CONFIG_MPC85xx_DS */
+
+#ifdef CONFIG_MPC85xx_RDB
+define_machine(p2020_rdb) {
+	.name			= "P2020 RDB",
+	.probe			= p2020_rdb_probe,
+	.setup_arch		= mpc85xx_rdb_setup_arch,
+	.init_IRQ		= mpc85xx_rdb_pic_init,
 #ifdef CONFIG_PCI
 	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
@@ -214,11 +257,11 @@ define_machine(mpc8572_ds) {
 	.progress		= udbg_progress,
 };
 
-define_machine(p2020_ds) {
-	.name			= "P2020 DS",
-	.probe			= p2020_ds_probe,
-	.setup_arch		= mpc85xx_ds_setup_arch,
-	.init_IRQ		= mpc85xx_ds_pic_init,
+define_machine(p2020_rdb_pc) {
+	.name			= "P2020RDB-PC",
+	.probe			= p2020_rdb_pc_probe,
+	.setup_arch		= mpc85xx_rdb_setup_arch,
+	.init_IRQ		= mpc85xx_rdb_pic_init,
 #ifdef CONFIG_PCI
 	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
 	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
@@ -227,3 +270,4 @@ define_machine(p2020_ds) {
 	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
+#endif /* CONFIG_MPC85xx_RDB */
-- 
2.20.1

