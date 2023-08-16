Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8D077E505
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 17:23:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQsNF1Gzwz3cLQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 01:23:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=csgroup.eu (client-ip=90.115.179.12; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (unknown [90.115.179.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQsML0PKDz3cHT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 01:22:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RQsMH2K6jz9vL9;
	Wed, 16 Aug 2023 17:22:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5kOEcEuuu5pO; Wed, 16 Aug 2023 17:22:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RQsMH1gmgz9vKS;
	Wed, 16 Aug 2023 17:22:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 362AD8B76C;
	Wed, 16 Aug 2023 17:22:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id SQM5-JyOtWXe; Wed, 16 Aug 2023 17:22:35 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 176528B763;
	Wed, 16 Aug 2023 17:22:35 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37GFMVt3218460
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 17:22:31 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37GFMVRa218459;
	Wed, 16 Aug 2023 17:22:31 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 2/2] powerpc/83xx: Split usb.c
Date: Wed, 16 Aug 2023 17:22:17 +0200
Message-ID: <75712b54bf9cb85ab10e47cd2772cd2a098ca895.1692199324.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <2cb498f637e082a4af8032311fad3cae84d6aa5d.1692199324.git.christophe.leroy@csgroup.eu>
References: <2cb498f637e082a4af8032311fad3cae84d6aa5d.1692199324.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692199335; l=9596; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=A4BvlPMJVraAKq9MnbiUdrim0l0a49yOTS5e8kNmkfc=; b=48Rmiu+HrCWxrBJ95XhFOvHSatd+jRz+EItvSgYtXjNPuz0NrpLjlYwYv4mqBM04fg3M9mQwe pzr0+i5NR18DaoKpyg7u11SPASw/vJvV5YgbMckTjdN6r2zZUTWDjAO
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

usb.c contains three independent parts with no common part.

Split it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/83xx/Makefile          |   3 +
 .../platforms/83xx/{usb.c => usb_831x.c}      | 118 ------------------
 arch/powerpc/platforms/83xx/usb_834x.c        |  90 +++++++++++++
 arch/powerpc/platforms/83xx/usb_837x.c        |  58 +++++++++
 4 files changed, 151 insertions(+), 118 deletions(-)
 rename arch/powerpc/platforms/83xx/{usb.c => usb_831x.c} (51%)
 create mode 100644 arch/powerpc/platforms/83xx/usb_834x.c
 create mode 100644 arch/powerpc/platforms/83xx/usb_837x.c

diff --git a/arch/powerpc/platforms/83xx/Makefile b/arch/powerpc/platforms/83xx/Makefile
index 6b4013e01b3b..2590ac4dcec4 100644
--- a/arch/powerpc/platforms/83xx/Makefile
+++ b/arch/powerpc/platforms/83xx/Makefile
@@ -13,3 +13,6 @@ obj-$(CONFIG_MPC836x_RDK)	+= mpc836x_rdk.o
 obj-$(CONFIG_MPC837x_RDB)	+= mpc837x_rdb.o
 obj-$(CONFIG_ASP834x)		+= asp834x.o
 obj-$(CONFIG_KMETER1)		+= km83xx.o
+obj-$(CONFIG_PPC_MPC831x)	+= usb_831x.o
+obj-$(CONFIG_PPC_MPC834x)	+= usb_834x.o
+obj-$(CONFIG_PPC_MPC837x)	+= usb_837x.o
diff --git a/arch/powerpc/platforms/83xx/usb.c b/arch/powerpc/platforms/83xx/usb_831x.c
similarity index 51%
rename from arch/powerpc/platforms/83xx/usb.c
rename to arch/powerpc/platforms/83xx/usb_831x.c
index d5ad6cff9bd8..28c24e90f022 100644
--- a/arch/powerpc/platforms/83xx/usb.c
+++ b/arch/powerpc/platforms/83xx/usb_831x.c
@@ -17,81 +17,6 @@
 
 #include "mpc83xx.h"
 
-#ifdef CONFIG_PPC_MPC834x
-int __init mpc834x_usb_cfg(void)
-{
-	unsigned long sccr, sicrl, sicrh;
-	void __iomem *immap;
-	struct device_node *np = NULL;
-	int port0_is_dr = 0, port1_is_dr = 0;
-	const void *prop, *dr_mode;
-
-	immap = ioremap(get_immrbase(), 0x1000);
-	if (!immap)
-		return -ENOMEM;
-
-	/* Read registers */
-	/* Note: DR and MPH must use the same clock setting in SCCR */
-	sccr = in_be32(immap + MPC83XX_SCCR_OFFS) & ~MPC83XX_SCCR_USB_MASK;
-	sicrl = in_be32(immap + MPC83XX_SICRL_OFFS) & ~MPC834X_SICRL_USB_MASK;
-	sicrh = in_be32(immap + MPC83XX_SICRH_OFFS) & ~MPC834X_SICRH_USB_UTMI;
-
-	np = of_find_compatible_node(NULL, NULL, "fsl-usb2-dr");
-	if (np) {
-		sccr |= MPC83XX_SCCR_USB_DRCM_11;  /* 1:3 */
-
-		prop = of_get_property(np, "phy_type", NULL);
-		port1_is_dr = 1;
-		if (prop &&
-		    (!strcmp(prop, "utmi") || !strcmp(prop, "utmi_wide"))) {
-			sicrl |= MPC834X_SICRL_USB0 | MPC834X_SICRL_USB1;
-			sicrh |= MPC834X_SICRH_USB_UTMI;
-			port0_is_dr = 1;
-		} else if (prop && !strcmp(prop, "serial")) {
-			dr_mode = of_get_property(np, "dr_mode", NULL);
-			if (dr_mode && !strcmp(dr_mode, "otg")) {
-				sicrl |= MPC834X_SICRL_USB0 | MPC834X_SICRL_USB1;
-				port0_is_dr = 1;
-			} else {
-				sicrl |= MPC834X_SICRL_USB1;
-			}
-		} else if (prop && !strcmp(prop, "ulpi")) {
-			sicrl |= MPC834X_SICRL_USB1;
-		} else {
-			pr_warn("834x USB PHY type not supported\n");
-		}
-		of_node_put(np);
-	}
-	np = of_find_compatible_node(NULL, NULL, "fsl-usb2-mph");
-	if (np) {
-		sccr |= MPC83XX_SCCR_USB_MPHCM_11; /* 1:3 */
-
-		prop = of_get_property(np, "port0", NULL);
-		if (prop) {
-			if (port0_is_dr)
-				pr_warn("834x USB port0 can't be used by both DR and MPH!\n");
-			sicrl &= ~MPC834X_SICRL_USB0;
-		}
-		prop = of_get_property(np, "port1", NULL);
-		if (prop) {
-			if (port1_is_dr)
-				pr_warn("834x USB port1 can't be used by both DR and MPH!\n");
-			sicrl &= ~MPC834X_SICRL_USB1;
-		}
-		of_node_put(np);
-	}
-
-	/* Write back */
-	out_be32(immap + MPC83XX_SCCR_OFFS, sccr);
-	out_be32(immap + MPC83XX_SICRL_OFFS, sicrl);
-	out_be32(immap + MPC83XX_SICRH_OFFS, sicrh);
-
-	iounmap(immap);
-	return 0;
-}
-#endif /* CONFIG_PPC_MPC834x */
-
-#ifdef CONFIG_PPC_MPC831x
 int __init mpc831x_usb_cfg(void)
 {
 	u32 temp;
@@ -201,46 +126,3 @@ int __init mpc831x_usb_cfg(void)
 	of_node_put(np);
 	return ret;
 }
-#endif /* CONFIG_PPC_MPC831x */
-
-#ifdef CONFIG_PPC_MPC837x
-int __init mpc837x_usb_cfg(void)
-{
-	void __iomem *immap;
-	struct device_node *np = NULL;
-	const void *prop;
-	int ret = 0;
-
-	np = of_find_compatible_node(NULL, NULL, "fsl-usb2-dr");
-	if (!np || !of_device_is_available(np)) {
-		of_node_put(np);
-		return -ENODEV;
-	}
-	prop = of_get_property(np, "phy_type", NULL);
-
-	if (!prop || (strcmp(prop, "ulpi") && strcmp(prop, "serial"))) {
-		pr_warn("837x USB PHY type not supported\n");
-		of_node_put(np);
-		return -EINVAL;
-	}
-
-	/* Map IMMR space for pin and clock settings */
-	immap = ioremap(get_immrbase(), 0x1000);
-	if (!immap) {
-		of_node_put(np);
-		return -ENOMEM;
-	}
-
-	/* Configure clock */
-	clrsetbits_be32(immap + MPC83XX_SCCR_OFFS, MPC837X_SCCR_USB_DRCM_11,
-			MPC837X_SCCR_USB_DRCM_11);
-
-	/* Configure pin mux for ULPI/serial */
-	clrsetbits_be32(immap + MPC83XX_SICRL_OFFS, MPC837X_SICRL_USB_MASK,
-			MPC837X_SICRL_USB_ULPI);
-
-	iounmap(immap);
-	of_node_put(np);
-	return ret;
-}
-#endif /* CONFIG_PPC_MPC837x */
diff --git a/arch/powerpc/platforms/83xx/usb_834x.c b/arch/powerpc/platforms/83xx/usb_834x.c
new file mode 100644
index 000000000000..3a8d6c662d06
--- /dev/null
+++ b/arch/powerpc/platforms/83xx/usb_834x.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Freescale 83xx USB SOC setup code
+ *
+ * Copyright (C) 2007 Freescale Semiconductor, Inc.
+ * Author: Li Yang
+ */
+
+#include <linux/stddef.h>
+#include <linux/kernel.h>
+#include <linux/errno.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/io.h>
+
+#include <sysdev/fsl_soc.h>
+
+#include "mpc83xx.h"
+
+int __init mpc834x_usb_cfg(void)
+{
+	unsigned long sccr, sicrl, sicrh;
+	void __iomem *immap;
+	struct device_node *np = NULL;
+	int port0_is_dr = 0, port1_is_dr = 0;
+	const void *prop, *dr_mode;
+
+	immap = ioremap(get_immrbase(), 0x1000);
+	if (!immap)
+		return -ENOMEM;
+
+	/* Read registers */
+	/* Note: DR and MPH must use the same clock setting in SCCR */
+	sccr = in_be32(immap + MPC83XX_SCCR_OFFS) & ~MPC83XX_SCCR_USB_MASK;
+	sicrl = in_be32(immap + MPC83XX_SICRL_OFFS) & ~MPC834X_SICRL_USB_MASK;
+	sicrh = in_be32(immap + MPC83XX_SICRH_OFFS) & ~MPC834X_SICRH_USB_UTMI;
+
+	np = of_find_compatible_node(NULL, NULL, "fsl-usb2-dr");
+	if (np) {
+		sccr |= MPC83XX_SCCR_USB_DRCM_11;  /* 1:3 */
+
+		prop = of_get_property(np, "phy_type", NULL);
+		port1_is_dr = 1;
+		if (prop &&
+		    (!strcmp(prop, "utmi") || !strcmp(prop, "utmi_wide"))) {
+			sicrl |= MPC834X_SICRL_USB0 | MPC834X_SICRL_USB1;
+			sicrh |= MPC834X_SICRH_USB_UTMI;
+			port0_is_dr = 1;
+		} else if (prop && !strcmp(prop, "serial")) {
+			dr_mode = of_get_property(np, "dr_mode", NULL);
+			if (dr_mode && !strcmp(dr_mode, "otg")) {
+				sicrl |= MPC834X_SICRL_USB0 | MPC834X_SICRL_USB1;
+				port0_is_dr = 1;
+			} else {
+				sicrl |= MPC834X_SICRL_USB1;
+			}
+		} else if (prop && !strcmp(prop, "ulpi")) {
+			sicrl |= MPC834X_SICRL_USB1;
+		} else {
+			pr_warn("834x USB PHY type not supported\n");
+		}
+		of_node_put(np);
+	}
+	np = of_find_compatible_node(NULL, NULL, "fsl-usb2-mph");
+	if (np) {
+		sccr |= MPC83XX_SCCR_USB_MPHCM_11; /* 1:3 */
+
+		prop = of_get_property(np, "port0", NULL);
+		if (prop) {
+			if (port0_is_dr)
+				pr_warn("834x USB port0 can't be used by both DR and MPH!\n");
+			sicrl &= ~MPC834X_SICRL_USB0;
+		}
+		prop = of_get_property(np, "port1", NULL);
+		if (prop) {
+			if (port1_is_dr)
+				pr_warn("834x USB port1 can't be used by both DR and MPH!\n");
+			sicrl &= ~MPC834X_SICRL_USB1;
+		}
+		of_node_put(np);
+	}
+
+	/* Write back */
+	out_be32(immap + MPC83XX_SCCR_OFFS, sccr);
+	out_be32(immap + MPC83XX_SICRL_OFFS, sicrl);
+	out_be32(immap + MPC83XX_SICRH_OFFS, sicrh);
+
+	iounmap(immap);
+	return 0;
+}
diff --git a/arch/powerpc/platforms/83xx/usb_837x.c b/arch/powerpc/platforms/83xx/usb_837x.c
new file mode 100644
index 000000000000..726935bb6e2d
--- /dev/null
+++ b/arch/powerpc/platforms/83xx/usb_837x.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Freescale 83xx USB SOC setup code
+ *
+ * Copyright (C) 2007 Freescale Semiconductor, Inc.
+ * Author: Li Yang
+ */
+
+#include <linux/stddef.h>
+#include <linux/kernel.h>
+#include <linux/errno.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/io.h>
+
+#include <sysdev/fsl_soc.h>
+
+#include "mpc83xx.h"
+
+int __init mpc837x_usb_cfg(void)
+{
+	void __iomem *immap;
+	struct device_node *np = NULL;
+	const void *prop;
+	int ret = 0;
+
+	np = of_find_compatible_node(NULL, NULL, "fsl-usb2-dr");
+	if (!np || !of_device_is_available(np)) {
+		of_node_put(np);
+		return -ENODEV;
+	}
+	prop = of_get_property(np, "phy_type", NULL);
+
+	if (!prop || (strcmp(prop, "ulpi") && strcmp(prop, "serial"))) {
+		pr_warn("837x USB PHY type not supported\n");
+		of_node_put(np);
+		return -EINVAL;
+	}
+
+	/* Map IMMR space for pin and clock settings */
+	immap = ioremap(get_immrbase(), 0x1000);
+	if (!immap) {
+		of_node_put(np);
+		return -ENOMEM;
+	}
+
+	/* Configure clock */
+	clrsetbits_be32(immap + MPC83XX_SCCR_OFFS, MPC837X_SCCR_USB_DRCM_11,
+			MPC837X_SCCR_USB_DRCM_11);
+
+	/* Configure pin mux for ULPI/serial */
+	clrsetbits_be32(immap + MPC83XX_SICRL_OFFS, MPC837X_SICRL_USB_MASK,
+			MPC837X_SICRL_USB_ULPI);
+
+	iounmap(immap);
+	of_node_put(np);
+	return ret;
+}
-- 
2.41.0

