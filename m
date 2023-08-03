Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA4B76EB9E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 16:01:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGrB94m7xz3fL4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 00:01:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGr5L3P90z3cTl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 23:57:42 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RGr4r0bY7z9t4M;
	Thu,  3 Aug 2023 15:57:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hKPqEZ46o4_5; Thu,  3 Aug 2023 15:57:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RGr4m01Qtz9t3r;
	Thu,  3 Aug 2023 15:57:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F068B8B773;
	Thu,  3 Aug 2023 15:57:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id rtP7P-yA6_dj; Thu,  3 Aug 2023 15:57:11 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.144])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C04B8B763;
	Thu,  3 Aug 2023 15:57:11 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 373Dv3A2494197
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 3 Aug 2023 15:57:03 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 373Dv3Vx494196;
	Thu, 3 Aug 2023 15:57:03 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Timur Tabi <timur@kernel.org>
Subject: [PATCH v1 08/12] serial: cpm_uart: Refactor cpm_uart_[un]map_pram()
Date: Thu,  3 Aug 2023 15:56:49 +0200
Message-ID: <44a266106c421319aa8e700c2db52d5dcd652c0f.1691068700.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691068700.git.christophe.leroy@csgroup.eu>
References: <cover.1691068700.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691071001; l=8278; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=28TMaYNg/wuam2YMhRwXHhITAluBiIelYQ4EfteMINs=; b=c4GE1AZBOq4J+DsReWNHsw7bxtwt8JqAV81wvuEQ1UWvm5bNkVtmTdTMB7Z4yLpggCLSTVn8c 86kNZeCSNRmDmF4NK7QzzeXD/rb+9lH/XoBEcWNbwBPoZftNJECN+p/
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cpm_uart_map_pram() and cpm_uart_unmap_pram() are very
similar for CPM1 and CPM2.

On CPM1 cpm_uart_map_pram() uses of_iomap() while CPM2 uses
of_address_to_resource()/ioremap(). CPM2 version will also
work on CPM1.

On CPM2 cpm_uart_map_pram() and cpm_uart_unmap_pram() has a special
handling for SMC. Just gate it by an IS_ENABLED(CONFIG_CPM2).

So move the CPM2 version into cpm_uart_core.c which is the only
user of those two fonctions and refactor to also handle CPM1 as
mentionned above.

PROFF_SMC_SIZE is only defined for SMC2 and used only there. To make
it simple, just use the numerical value 64, this is the only place
it is used and anyway there's already the same numerical value for
the alignment.

Use cpm_muram_alloc() instead of cpm_dpalloc() macro.

Then cpm_uart_cpm1.c and cpm_uart_cpm2.c are now empty and go away.

Replace printk(KERN_WARN by pr_warn( to make checkpatch happier.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/tty/serial/cpm_uart/Makefile        |  8 +-
 drivers/tty/serial/cpm_uart/cpm_uart.h      |  5 --
 drivers/tty/serial/cpm_uart/cpm_uart_core.c | 48 ++++++++++++
 drivers/tty/serial/cpm_uart/cpm_uart_cpm1.c | 48 ------------
 drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c | 82 ---------------------
 5 files changed, 49 insertions(+), 142 deletions(-)
 delete mode 100644 drivers/tty/serial/cpm_uart/cpm_uart_cpm1.c
 delete mode 100644 drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c

diff --git a/drivers/tty/serial/cpm_uart/Makefile b/drivers/tty/serial/cpm_uart/Makefile
index 3f3a6ed02ed4..91f202fa5251 100644
--- a/drivers/tty/serial/cpm_uart/Makefile
+++ b/drivers/tty/serial/cpm_uart/Makefile
@@ -3,10 +3,4 @@
 # Makefile for the Motorola 8xx FEC ethernet controller
 #
 
-obj-$(CONFIG_SERIAL_CPM) += cpm_uart.o
-
-# Select the correct platform objects.
-cpm_uart-objs-$(CONFIG_CPM2)	+= cpm_uart_cpm2.o
-cpm_uart-objs-$(CONFIG_CPM1)	+= cpm_uart_cpm1.o
-
-cpm_uart-objs	:= cpm_uart_core.o $(cpm_uart-objs-y)
+obj-$(CONFIG_SERIAL_CPM) += cpm_uart_core.o
diff --git a/drivers/tty/serial/cpm_uart/cpm_uart.h b/drivers/tty/serial/cpm_uart/cpm_uart.h
index 6d6046d45bec..37bb6e976e03 100644
--- a/drivers/tty/serial/cpm_uart/cpm_uart.h
+++ b/drivers/tty/serial/cpm_uart/cpm_uart.h
@@ -75,11 +75,6 @@ struct uart_cpm_port {
 	struct gpio_desc	*gpios[NUM_GPIOS];
 };
 
-/* these are located in their respective files */
-void __iomem *cpm_uart_map_pram(struct uart_cpm_port *port,
-				struct device_node *np);
-void cpm_uart_unmap_pram(struct uart_cpm_port *port, void __iomem *pram);
-
 /*
    virtual to phys transtalion
 */
diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_core.c b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
index fa5466518536..626423022d62 100644
--- a/drivers/tty/serial/cpm_uart/cpm_uart_core.c
+++ b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
@@ -1207,6 +1207,54 @@ static const struct uart_ops cpm_uart_pops = {
 
 static struct uart_cpm_port cpm_uart_ports[UART_NR];
 
+static void __iomem *cpm_uart_map_pram(struct uart_cpm_port *port,
+				       struct device_node *np)
+{
+	void __iomem *pram;
+	unsigned long offset;
+	struct resource res;
+	resource_size_t len;
+
+	/* Don't remap parameter RAM if it has already been initialized
+	 * during console setup.
+	 */
+	if (IS_SMC(port) && port->smcup)
+		return port->smcup;
+	else if (!IS_SMC(port) && port->sccup)
+		return port->sccup;
+
+	if (of_address_to_resource(np, 1, &res))
+		return NULL;
+
+	len = resource_size(&res);
+	pram = ioremap(res.start, len);
+	if (!pram)
+		return NULL;
+
+	if (!IS_ENABLED(CONFIG_CPM2) || !IS_SMC(port))
+		return pram;
+
+	if (len != 2) {
+		pr_warn("cpm_uart[%d]: device tree references "
+			"SMC pram, using boot loader/wrapper pram mapping. "
+			"Please fix your device tree to reference the pram "
+			"base register instead.\n",
+			port->port.line);
+		return pram;
+	}
+
+	offset = cpm_muram_alloc(64, 64);
+	out_be16(pram, offset);
+	iounmap(pram);
+	return cpm_muram_addr(offset);
+}
+
+static void cpm_uart_unmap_pram(struct uart_cpm_port *port, void __iomem *pram)
+{
+	if (!IS_ENABLED(CONFIG_CPM2) || !IS_SMC(port))
+		iounmap(pram);
+}
+
 static int cpm_uart_init_port(struct device_node *np,
                               struct uart_cpm_port *pinfo)
 {
diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_cpm1.c b/drivers/tty/serial/cpm_uart/cpm_uart_cpm1.c
deleted file mode 100644
index 3fe436dc2f95..000000000000
--- a/drivers/tty/serial/cpm_uart/cpm_uart_cpm1.c
+++ /dev/null
@@ -1,48 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- *  Driver for CPM (SCC/SMC) serial ports; CPM1 definitions
- *
- *  Maintainer: Kumar Gala (galak@kernel.crashing.org) (CPM2)
- *              Pantelis Antoniou (panto@intracom.gr) (CPM1)
- *
- *  Copyright (C) 2004 Freescale Semiconductor, Inc.
- *            (C) 2004 Intracom, S.A.
- *            (C) 2006 MontaVista Software, Inc.
- *		Vitaly Bordug <vbordug@ru.mvista.com>
- */
-
-#include <linux/module.h>
-#include <linux/tty.h>
-#include <linux/gfp.h>
-#include <linux/ioport.h>
-#include <linux/serial.h>
-#include <linux/console.h>
-#include <linux/sysrq.h>
-#include <linux/device.h>
-#include <linux/memblock.h>
-#include <linux/dma-mapping.h>
-
-#include <asm/io.h>
-#include <asm/irq.h>
-#include <asm/fs_pd.h>
-
-#include <linux/serial_core.h>
-#include <linux/kernel.h>
-
-#include <linux/of.h>
-#include <linux/of_address.h>
-
-#include "cpm_uart.h"
-
-/**************************************************************/
-
-void __iomem *cpm_uart_map_pram(struct uart_cpm_port *port,
-				struct device_node *np)
-{
-	return of_iomap(np, 1);
-}
-
-void cpm_uart_unmap_pram(struct uart_cpm_port *port, void __iomem *pram)
-{
-	iounmap(pram);
-}
diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c b/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
deleted file mode 100644
index 09d46255aa9d..000000000000
--- a/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
+++ /dev/null
@@ -1,82 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- *  Driver for CPM (SCC/SMC) serial ports; CPM2 definitions
- *
- *  Maintainer: Kumar Gala (galak@kernel.crashing.org) (CPM2)
- *              Pantelis Antoniou (panto@intracom.gr) (CPM1)
- *
- *  Copyright (C) 2004 Freescale Semiconductor, Inc.
- *            (C) 2004 Intracom, S.A.
- *            (C) 2006 MontaVista Software, Inc.
- *		Vitaly Bordug <vbordug@ru.mvista.com>
- */
-
-#include <linux/module.h>
-#include <linux/tty.h>
-#include <linux/ioport.h>
-#include <linux/slab.h>
-#include <linux/serial.h>
-#include <linux/console.h>
-#include <linux/sysrq.h>
-#include <linux/device.h>
-#include <linux/memblock.h>
-#include <linux/dma-mapping.h>
-
-#include <asm/io.h>
-#include <asm/irq.h>
-#include <asm/fs_pd.h>
-
-#include <linux/serial_core.h>
-#include <linux/kernel.h>
-
-#include "cpm_uart.h"
-
-/**************************************************************/
-
-void __iomem *cpm_uart_map_pram(struct uart_cpm_port *port,
-				struct device_node *np)
-{
-	void __iomem *pram;
-	unsigned long offset;
-	struct resource res;
-	resource_size_t len;
-
-	/* Don't remap parameter RAM if it has already been initialized
-	 * during console setup.
-	 */
-	if (IS_SMC(port) && port->smcup)
-		return port->smcup;
-	else if (!IS_SMC(port) && port->sccup)
-		return port->sccup;
-
-	if (of_address_to_resource(np, 1, &res))
-		return NULL;
-
-	len = resource_size(&res);
-	pram = ioremap(res.start, len);
-	if (!pram)
-		return NULL;
-
-	if (!IS_SMC(port))
-		return pram;
-
-	if (len != 2) {
-		printk(KERN_WARNING "cpm_uart[%d]: device tree references "
-			"SMC pram, using boot loader/wrapper pram mapping. "
-			"Please fix your device tree to reference the pram "
-			"base register instead.\n",
-			port->port.line);
-		return pram;
-	}
-
-	offset = cpm_dpalloc(PROFF_SMC_SIZE, 64);
-	out_be16(pram, offset);
-	iounmap(pram);
-	return cpm_muram_addr(offset);
-}
-
-void cpm_uart_unmap_pram(struct uart_cpm_port *port, void __iomem *pram)
-{
-	if (!IS_SMC(port))
-		iounmap(pram);
-}
-- 
2.41.0

