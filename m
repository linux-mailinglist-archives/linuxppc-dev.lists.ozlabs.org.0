Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0010E69F6F4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 15:46:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMJqq6dzGz3cdx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 01:45:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMJnD4FY6z3cMk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 01:43:44 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4PMJn066llz9sTJ;
	Wed, 22 Feb 2023 15:43:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6q3ZA31B1M0O; Wed, 22 Feb 2023 15:43:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4PMJmw6vXjz9sTQ;
	Wed, 22 Feb 2023 15:43:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DA14B8B796;
	Wed, 22 Feb 2023 15:43:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9Lfg7obgQvSE; Wed, 22 Feb 2023 15:43:28 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9104B8B788;
	Wed, 22 Feb 2023 15:43:28 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 31MEhMVT1187125
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 15:43:22 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 31MEhMPL1187124;
	Wed, 22 Feb 2023 15:43:22 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v4 10/17] powerpc/85xx: p2020: Move all P2020 DS machine descriptions to p2020.c
Date: Wed, 22 Feb 2023 15:42:57 +0100
Message-Id: <22c431f139b205527920fcfe4022432409fdb6f6.1677076552.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1677076552.git.christophe.leroy@csgroup.eu>
References: <cover.1677076552.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677076980; l=5462; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=RhbfMxmAEQR9W3sTeOv71BYFTCTQBU8uKEjkMHP7+TU=; b=DuP9Mzxn4wcR2Ziq3Qp6/BG8BFnJtBvPPI/G1OmoSPFYcUJmsGZ6zaGUwmSWGxtNsQbnFZe6BH97 tcGe6rHxDOT7fKQyj4UWCxUphvNtIhgzWd2PEFkDeWj1U5IM4ZCZ
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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

From: Pali Rohár <pali@kernel.org>

This moves machine descriptions and all related code for all P2020 boards
into new p2020.c source file.
This is preparation for code de-duplication and
providing one unified machine description for all P2020 boards. In
follow-up patches would be copied functions refactored and simplified to be
specific just for P2020 boards.

Signed-off-by: Pali Rohár <pali@kernel.org>
[chleroy: Split in two patches: one for DS, one for RDB and keep helpers out]
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/85xx/Makefile     |  2 +-
 arch/powerpc/platforms/85xx/mpc85xx.h    |  3 ++
 arch/powerpc/platforms/85xx/mpc85xx_ds.c | 25 +---------
 arch/powerpc/platforms/85xx/p2020.c      | 59 ++++++++++++++++++++++++
 4 files changed, 64 insertions(+), 25 deletions(-)
 create mode 100644 arch/powerpc/platforms/85xx/p2020.c

diff --git a/arch/powerpc/platforms/85xx/Makefile b/arch/powerpc/platforms/85xx/Makefile
index 260fbad7967b..1f54623db9b7 100644
--- a/arch/powerpc/platforms/85xx/Makefile
+++ b/arch/powerpc/platforms/85xx/Makefile
@@ -16,7 +16,7 @@ obj-$(CONFIG_MPC8540_ADS) += mpc85xx_ads.o
 obj-$(CONFIG_MPC8560_ADS) += mpc85xx_ads.o
 obj-$(CONFIG_MPC85xx_CDS) += mpc85xx_cds.o
 obj-$(CONFIG_MPC8536_DS)  += mpc8536_ds.o
-obj-$(CONFIG_MPC85xx_DS)  += mpc85xx_ds.o
+obj-$(CONFIG_MPC85xx_DS)  += mpc85xx_ds.o p2020.o
 obj-$(CONFIG_MPC85xx_MDS) += mpc85xx_mds.o
 obj-$(CONFIG_MPC85xx_RDB) += mpc85xx_rdb.o
 obj-$(CONFIG_P1010_RDB)   += p1010rdb.o
diff --git a/arch/powerpc/platforms/85xx/mpc85xx.h b/arch/powerpc/platforms/85xx/mpc85xx.h
index cb84c5c56c36..ca8b39e6b05a 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx.h
+++ b/arch/powerpc/platforms/85xx/mpc85xx.h
@@ -15,4 +15,7 @@ extern void mpc85xx_qe_par_io_init(void);
 static inline void __init mpc85xx_qe_par_io_init(void) {}
 #endif
 
+void __init mpc85xx_ds_pic_init(void);
+void __init mpc85xx_ds_setup_arch(void);
+
 #endif
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
index 2b3e9aecb3ad..8594862ab3a4 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
@@ -133,7 +133,7 @@ static void __init mpc85xx_ds_uli_init(void)
 /*
  * Setup the architecture
  */
-static void __init mpc85xx_ds_setup_arch(void)
+void __init mpc85xx_ds_setup_arch(void)
 {
 	if (ppc_md.progress)
 		ppc_md.progress("mpc85xx_ds_setup_arch()", 0);
@@ -156,7 +156,6 @@ static int __init mpc8544_ds_probe(void)
 
 machine_arch_initcall(mpc8544_ds, mpc85xx_common_publish_devices);
 machine_arch_initcall(mpc8572_ds, mpc85xx_common_publish_devices);
-machine_arch_initcall(p2020_ds, mpc85xx_common_publish_devices);
 
 /*
  * Called very early, device-tree isn't unflattened
@@ -166,14 +165,6 @@ static int __init mpc8572_ds_probe(void)
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
@@ -201,17 +192,3 @@ define_machine(mpc8572_ds) {
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
diff --git a/arch/powerpc/platforms/85xx/p2020.c b/arch/powerpc/platforms/85xx/p2020.c
new file mode 100644
index 000000000000..2dfd150c6375
--- /dev/null
+++ b/arch/powerpc/platforms/85xx/p2020.c
@@ -0,0 +1,59 @@
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
+machine_arch_initcall(p2020_ds, mpc85xx_common_publish_devices);
+
+/*
+ * Called very early, device-tree isn't unflattened
+ */
+static int __init p2020_ds_probe(void)
+{
+	return !!of_machine_is_compatible("fsl,P2020DS");
+}
+
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
-- 
2.39.1

