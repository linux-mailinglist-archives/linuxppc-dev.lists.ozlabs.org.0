Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC02C69F723
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 15:52:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMJyn5GhRz3gBn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 01:52:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMJp63wtPz3f7m
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 01:44:30 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4PMJnC1tkPz9sTh;
	Wed, 22 Feb 2023 15:43:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sfkms4YxWzkN; Wed, 22 Feb 2023 15:43:43 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4PMJmx1FV9z9sTk;
	Wed, 22 Feb 2023 15:43:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 08D098B781;
	Wed, 22 Feb 2023 15:43:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id P_oheMDO37ac; Wed, 22 Feb 2023 15:43:28 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7AA0B8B77E;
	Wed, 22 Feb 2023 15:43:28 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 31MEhMnM1187133
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 15:43:23 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 31MEhMII1187132;
	Wed, 22 Feb 2023 15:43:22 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v4 12/17] powerpc/85xx: p2020: Move i8259 code into own function
Date: Wed, 22 Feb 2023 15:42:59 +0100
Message-Id: <6f7d71146a4da9d65e40af125616d665ec7425d2.1677076552.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1677076552.git.christophe.leroy@csgroup.eu>
References: <cover.1677076552.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677076980; l=5643; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=rZuafE0PtNaHeRlJCX+Mg+JesiTvfhb8xZ7Npg6/2uE=; b=lrvY9uS1YZfuqNQTPwZNH2/71Iuw+k+PtRJbfatTuR5PscJmI38nAan7ZBMCK5jftJIvdZLu6JFS ZHkRZhLXD02cH4sDcjWXu3+ZJBLdS8nakRdoj+TtqhDO0l649fZf
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

Splits mpic and i8259 initialization codes into separate functions.
Use 'if (IS_ENABLED(CONFIG_PPC_I8259))' instead of '#ifdef CONFIG_PPC_I8259'.

Signed-off-by: Pali Rohár <pali@kernel.org>
[chleroy: Put into own C file]
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/85xx/Makefile       |  3 +-
 arch/powerpc/platforms/85xx/mpc85xx.h      |  6 ++
 arch/powerpc/platforms/85xx/mpc85xx_8259.c | 78 ++++++++++++++++++++++
 arch/powerpc/platforms/85xx/mpc85xx_ds.c   | 46 -------------
 4 files changed, 86 insertions(+), 47 deletions(-)
 create mode 100644 arch/powerpc/platforms/85xx/mpc85xx_8259.c

diff --git a/arch/powerpc/platforms/85xx/Makefile b/arch/powerpc/platforms/85xx/Makefile
index 93451850ed83..0a0011e8c63c 100644
--- a/arch/powerpc/platforms/85xx/Makefile
+++ b/arch/powerpc/platforms/85xx/Makefile
@@ -16,7 +16,8 @@ obj-$(CONFIG_MPC8540_ADS) += mpc85xx_ads.o
 obj-$(CONFIG_MPC8560_ADS) += mpc85xx_ads.o
 obj-$(CONFIG_MPC85xx_CDS) += mpc85xx_cds.o
 obj-$(CONFIG_MPC8536_DS)  += mpc8536_ds.o
-obj-$(CONFIG_MPC85xx_DS)  += mpc85xx_ds.o p2020.o
+obj8259-$(CONFIG_PPC_I8259)   += mpc85xx_8259.o
+obj-$(CONFIG_MPC85xx_DS)  += mpc85xx_ds.o p2020.o $(obj8259-y)
 obj-$(CONFIG_MPC85xx_MDS) += mpc85xx_mds.o
 obj-$(CONFIG_MPC85xx_RDB) += mpc85xx_rdb.o p2020.o
 obj-$(CONFIG_P1010_RDB)   += p1010rdb.o
diff --git a/arch/powerpc/platforms/85xx/mpc85xx.h b/arch/powerpc/platforms/85xx/mpc85xx.h
index 8f7b37c1de87..e792907ee3d5 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx.h
+++ b/arch/powerpc/platforms/85xx/mpc85xx.h
@@ -15,6 +15,12 @@ extern void mpc85xx_qe_par_io_init(void);
 static inline void __init mpc85xx_qe_par_io_init(void) {}
 #endif
 
+#ifdef CONFIG_PPC_I8259
+void __init mpc85xx_8259_init(void);
+#else
+static inline void __init mpc85xx_8259_init(void) {}
+#endif
+
 void __init mpc85xx_ds_pic_init(void);
 void __init mpc85xx_ds_setup_arch(void);
 void __init mpc85xx_rdb_setup_arch(void);
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_8259.c b/arch/powerpc/platforms/85xx/mpc85xx_8259.c
new file mode 100644
index 000000000000..eeb541b9f4bd
--- /dev/null
+++ b/arch/powerpc/platforms/85xx/mpc85xx_8259.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * MPC85xx 8259 functions for DS Board Setup
+ *
+ * Author Xianghua Xiao (x.xiao@freescale.com)
+ * Roy Zang <tie-fei.zang@freescale.com>
+ * 	- Add PCI/PCI Exprees support
+ * Copyright 2007 Freescale Semiconductor Inc.
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
+
+#include <asm/time.h>
+#include <asm/machdep.h>
+#include <asm/pci-bridge.h>
+#include <mm/mmu_decl.h>
+#include <asm/udbg.h>
+#include <asm/mpic.h>
+#include <asm/i8259.h>
+#include <asm/swiotlb.h>
+#include <asm/ppc-pci.h>
+
+#include <sysdev/fsl_soc.h>
+#include <sysdev/fsl_pci.h>
+#include "smp.h"
+
+#include "mpc85xx.h"
+
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
+
+void __init mpc85xx_8259_init(void)
+{
+	struct device_node *np;
+	struct device_node *cascade_node = NULL;
+	int cascade_irq;
+
+	/* Initialize the i8259 controller */
+	for_each_node_by_type(np, "interrupt-controller")
+	    if (of_device_is_compatible(np, "chrp,iic")) {
+		cascade_node = np;
+		break;
+	}
+
+	if (cascade_node == NULL) {
+		pr_debug("Could not find i8259 PIC\n");
+		return;
+	}
+
+	cascade_irq = irq_of_parse_and_map(cascade_node, 0);
+	if (!cascade_irq) {
+		pr_err("Failed to map cascade interrupt\n");
+		return;
+	}
+
+	pr_debug("mpc85xxds: cascade mapped to irq %d\n", cascade_irq);
+
+	i8259_init(cascade_node, 0);
+	of_node_put(cascade_node);
+
+	irq_set_chained_handler(cascade_irq, mpc85xx_8259_cascade);
+}
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
index 8594862ab3a4..011ae86d72f4 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
@@ -34,52 +34,6 @@
 
 #include "mpc85xx.h"
 
-static void mpc85xx_8259_cascade(struct irq_desc *desc)
-{
-	struct irq_chip *chip = irq_desc_get_chip(desc);
-	unsigned int cascade_irq = i8259_irq();
-
-	if (cascade_irq) {
-		generic_handle_irq(cascade_irq);
-	}
-	chip->irq_eoi(&desc->irq_data);
-}
-
-static void __init mpc85xx_8259_init(void)
-{
-	struct device_node *np;
-	struct device_node *cascade_node = NULL;
-	int cascade_irq;
-
-	if (!IS_ENABLED(CONFIG_PPC_I8259))
-		return;
-
-	/* Initialize the i8259 controller */
-	for_each_node_by_type(np, "interrupt-controller")
-	    if (of_device_is_compatible(np, "chrp,iic")) {
-		cascade_node = np;
-		break;
-	}
-
-	if (cascade_node == NULL) {
-		pr_debug("Could not find i8259 PIC\n");
-		return;
-	}
-
-	cascade_irq = irq_of_parse_and_map(cascade_node, 0);
-	if (!cascade_irq) {
-		pr_err("Failed to map cascade interrupt\n");
-		return;
-	}
-
-	pr_debug("mpc85xxds: cascade mapped to irq %d\n", cascade_irq);
-
-	i8259_init(cascade_node, 0);
-	of_node_put(cascade_node);
-
-	irq_set_chained_handler(cascade_irq, mpc85xx_8259_cascade);
-}
-
 void __init mpc85xx_ds_pic_init(void)
 {
 	struct mpic *mpic;
-- 
2.39.1

