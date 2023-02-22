Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F6F69F71A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 15:50:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMJxS14Hdz3fdw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 01:50:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMJny0RyFz3cV7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 01:44:21 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4PMJn92wzTz9sTs;
	Wed, 22 Feb 2023 15:43:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mLG04kNAlVH9; Wed, 22 Feb 2023 15:43:41 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4PMJmx10Rxz9sTg;
	Wed, 22 Feb 2023 15:43:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 074EF8B77D;
	Wed, 22 Feb 2023 15:43:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id SmD7N2G290xu; Wed, 22 Feb 2023 15:43:28 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D8C28B78D;
	Wed, 22 Feb 2023 15:43:28 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 31MEhN7W1187137
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 15:43:23 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 31MEhNYG1187136;
	Wed, 22 Feb 2023 15:43:23 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v4 13/17] powerpc/85xx: mpc85xx_ds: Move PCI code into own file
Date: Wed, 22 Feb 2023 15:43:00 +0100
Message-Id: <f5007117d2059ee30464c8cf031c8294c99569d8.1677076552.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1677076552.git.christophe.leroy@csgroup.eu>
References: <cover.1677076552.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677076980; l=4745; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=5GddNXS+Voh7uO5Ylrv63X9sNcGsdXR7TxDUZUFFlVA=; b=PQ+svHo1viKecl1we6C1Z7F/NKp6pFpQ5Knz39L7L+BMlCLWc/jVLlD0WetAblky8OysQ1cPBhTI JY3+alO+DGy91LVFUTNO7uScZcnKz+0Ejsi6e/Zt2xnUbwpT3KmQ
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

In order to share between DS and P2020.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/85xx/Makefile      |  3 +-
 arch/powerpc/platforms/85xx/mpc85xx.h     |  6 +++
 arch/powerpc/platforms/85xx/mpc85xx_ds.c  | 32 ------------
 arch/powerpc/platforms/85xx/mpc85xx_uli.c | 64 +++++++++++++++++++++++
 4 files changed, 72 insertions(+), 33 deletions(-)
 create mode 100644 arch/powerpc/platforms/85xx/mpc85xx_uli.c

diff --git a/arch/powerpc/platforms/85xx/Makefile b/arch/powerpc/platforms/85xx/Makefile
index 0a0011e8c63c..65abd5a161c0 100644
--- a/arch/powerpc/platforms/85xx/Makefile
+++ b/arch/powerpc/platforms/85xx/Makefile
@@ -17,7 +17,8 @@ obj-$(CONFIG_MPC8560_ADS) += mpc85xx_ads.o
 obj-$(CONFIG_MPC85xx_CDS) += mpc85xx_cds.o
 obj-$(CONFIG_MPC8536_DS)  += mpc8536_ds.o
 obj8259-$(CONFIG_PPC_I8259)   += mpc85xx_8259.o
-obj-$(CONFIG_MPC85xx_DS)  += mpc85xx_ds.o p2020.o $(obj8259-y)
+objpci-$(CONFIG_PCI)   += mpc85xx_uli.o
+obj-$(CONFIG_MPC85xx_DS)  += mpc85xx_ds.o p2020.o $(obj8259-y) $(objpci-y)
 obj-$(CONFIG_MPC85xx_MDS) += mpc85xx_mds.o
 obj-$(CONFIG_MPC85xx_RDB) += mpc85xx_rdb.o p2020.o
 obj-$(CONFIG_P1010_RDB)   += p1010rdb.o
diff --git a/arch/powerpc/platforms/85xx/mpc85xx.h b/arch/powerpc/platforms/85xx/mpc85xx.h
index e792907ee3d5..b77bb9e7e79c 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx.h
+++ b/arch/powerpc/platforms/85xx/mpc85xx.h
@@ -21,6 +21,12 @@ void __init mpc85xx_8259_init(void);
 static inline void __init mpc85xx_8259_init(void) {}
 #endif
 
+#ifdef CONFIG_PCI
+void __init mpc85xx_ds_uli_init(void);
+#else
+static inline void __init mpc85xx_ds_uli_init(void) {}
+#endif
+
 void __init mpc85xx_ds_pic_init(void);
 void __init mpc85xx_ds_setup_arch(void);
 void __init mpc85xx_rdb_setup_arch(void);
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
index 011ae86d72f4..f9ac0b6022b1 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
@@ -52,38 +52,6 @@ void __init mpc85xx_ds_pic_init(void)
 	mpc85xx_8259_init();
 }
 
-static struct device_node *pci_with_uli;
-
-static int mpc85xx_exclude_device(struct pci_controller *hose,
-				   u_char bus, u_char devfn)
-{
-	if (hose->dn == pci_with_uli)
-		return uli_exclude_device(hose, bus, devfn);
-
-	return PCIBIOS_SUCCESSFUL;
-}
-
-static void __init mpc85xx_ds_uli_init(void)
-{
-	struct device_node *node;
-
-	if (!IS_ENABLED(CONFIG_PCI))
-		return;
-
-	/* See if we have a ULI under the primary */
-
-	node = of_find_node_by_name(NULL, "uli1575");
-	while ((pci_with_uli = of_get_parent(node))) {
-		of_node_put(node);
-		node = pci_with_uli;
-
-		if (pci_with_uli == fsl_pci_primary) {
-			ppc_md.pci_exclude_device = mpc85xx_exclude_device;
-			break;
-		}
-	}
-}
-
 /*
  * Setup the architecture
  */
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_uli.c b/arch/powerpc/platforms/85xx/mpc85xx_uli.c
new file mode 100644
index 000000000000..f91fe860985b
--- /dev/null
+++ b/arch/powerpc/platforms/85xx/mpc85xx_uli.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * MPC85xx PCI functions for DS Board Setup
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
+
+void __init mpc85xx_ds_uli_init(void)
+{
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
+}
-- 
2.39.1

