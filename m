Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 628374F5646
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 08:24:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYDxK2TXhz3bdg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 16:24:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYDwx3xj0z2xfP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 16:23:42 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KYDwp5FHnz9sTH;
 Wed,  6 Apr 2022 08:23:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dwLr21BLa_r6; Wed,  6 Apr 2022 08:23:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KYDwp4CXrz9sSq;
 Wed,  6 Apr 2022 08:23:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7BE978B77A;
 Wed,  6 Apr 2022 08:23:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ZEXgXqXCDtIp; Wed,  6 Apr 2022 08:23:38 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.200])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 06EB98B775;
 Wed,  6 Apr 2022 08:23:37 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2366NRXW390690
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 6 Apr 2022 08:23:27 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2366NPf7390689;
 Wed, 6 Apr 2022 08:23:25 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 1/5] powerpc/8xx: Move CPM interrupt controller into a
 dedicated file
Date: Wed,  6 Apr 2022 08:23:17 +0200
Message-Id: <d3a7dc832d905bed14b35d83410cdb69a7ba20e8.1649226186.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1649226200; l=9345; s=20211009;
 h=from:subject:message-id; bh=TRghPIZWzCEEv4kNXaEaQMRxcQG1byIVRG6jr5eKADc=;
 b=Hta5hS8mBCofEylmhhu4OfLPI4NhKQJX/TrWWgZJPjxhl0wFPcXSzmlsXMOxj8LrAE1ljFk3Y4U0
 nAxU7yBGAtNmfsXZIpoHYIL6H6PzUM0D5uyFkIOIjrkFwgeNiH7d
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CPM interrupt controller is quite standalone. Move it into a
dedicated file. It will help for next step which will change
it to a platform driver.

This is pure code move, checkpatch report is ignored at this point,
except one parenthesis alignment which would remain at the end of
the series. All other points fly away with following patches.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/8xx/Makefile  |   2 +-
 arch/powerpc/platforms/8xx/cpm1-ic.c | 151 +++++++++++++++++++++++++++
 arch/powerpc/platforms/8xx/cpm1.c    | 139 ------------------------
 3 files changed, 152 insertions(+), 140 deletions(-)
 create mode 100644 arch/powerpc/platforms/8xx/cpm1-ic.c

diff --git a/arch/powerpc/platforms/8xx/Makefile b/arch/powerpc/platforms/8xx/Makefile
index 27a7c6f828e0..5a098f7d5d31 100644
--- a/arch/powerpc/platforms/8xx/Makefile
+++ b/arch/powerpc/platforms/8xx/Makefile
@@ -3,7 +3,7 @@
 # Makefile for the PowerPC 8xx linux kernel.
 #
 obj-y			+= m8xx_setup.o machine_check.o pic.o
-obj-$(CONFIG_CPM1)		+= cpm1.o
+obj-$(CONFIG_CPM1)		+= cpm1.o cpm1-ic.o
 obj-$(CONFIG_UCODE_PATCH)	+= micropatch.o
 obj-$(CONFIG_MPC885ADS)   += mpc885ads_setup.o
 obj-$(CONFIG_MPC86XADS)   += mpc86xads_setup.o
diff --git a/arch/powerpc/platforms/8xx/cpm1-ic.c b/arch/powerpc/platforms/8xx/cpm1-ic.c
new file mode 100644
index 000000000000..d5cf0ee7c07d
--- /dev/null
+++ b/arch/powerpc/platforms/8xx/cpm1-ic.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Interrupt controller for the
+ * Communication Processor Module.
+ * Copyright (c) 1997 Dan error_act (dmalek@jlc.net)
+ */
+#include <linux/kernel.h>
+#include <linux/interrupt.h>
+#include <linux/irqdomain.h>
+#include <linux/of_irq.h>
+#include <asm/cpm1.h>
+
+static cpic8xx_t __iomem *cpic_reg;
+
+static struct irq_domain *cpm_pic_host;
+
+static void cpm_mask_irq(struct irq_data *d)
+{
+	unsigned int cpm_vec = (unsigned int)irqd_to_hwirq(d);
+
+	clrbits32(&cpic_reg->cpic_cimr, (1 << cpm_vec));
+}
+
+static void cpm_unmask_irq(struct irq_data *d)
+{
+	unsigned int cpm_vec = (unsigned int)irqd_to_hwirq(d);
+
+	setbits32(&cpic_reg->cpic_cimr, (1 << cpm_vec));
+}
+
+static void cpm_end_irq(struct irq_data *d)
+{
+	unsigned int cpm_vec = (unsigned int)irqd_to_hwirq(d);
+
+	out_be32(&cpic_reg->cpic_cisr, (1 << cpm_vec));
+}
+
+static struct irq_chip cpm_pic = {
+	.name = "CPM PIC",
+	.irq_mask = cpm_mask_irq,
+	.irq_unmask = cpm_unmask_irq,
+	.irq_eoi = cpm_end_irq,
+};
+
+int cpm_get_irq(void)
+{
+	int cpm_vec;
+
+	/*
+	 * Get the vector by setting the ACK bit and then reading
+	 * the register.
+	 */
+	out_be16(&cpic_reg->cpic_civr, 1);
+	cpm_vec = in_be16(&cpic_reg->cpic_civr);
+	cpm_vec >>= 11;
+
+	return irq_linear_revmap(cpm_pic_host, cpm_vec);
+}
+
+static int cpm_pic_host_map(struct irq_domain *h, unsigned int virq,
+			    irq_hw_number_t hw)
+{
+	pr_debug("cpm_pic_host_map(%d, 0x%lx)\n", virq, hw);
+
+	irq_set_status_flags(virq, IRQ_LEVEL);
+	irq_set_chip_and_handler(virq, &cpm_pic, handle_fasteoi_irq);
+	return 0;
+}
+
+/*
+ * The CPM can generate the error interrupt when there is a race condition
+ * between generating and masking interrupts.  All we have to do is ACK it
+ * and return.  This is a no-op function so we don't need any special
+ * tests in the interrupt handler.
+ */
+static irqreturn_t cpm_error_interrupt(int irq, void *dev)
+{
+	return IRQ_HANDLED;
+}
+
+static const struct irq_domain_ops cpm_pic_host_ops = {
+	.map = cpm_pic_host_map,
+};
+
+unsigned int __init cpm_pic_init(void)
+{
+	struct device_node *np = NULL;
+	struct resource res;
+	unsigned int sirq = 0, hwirq, eirq;
+	int ret;
+
+	pr_debug("cpm_pic_init\n");
+
+	np = of_find_compatible_node(NULL, NULL, "fsl,cpm1-pic");
+	if (np == NULL)
+		np = of_find_compatible_node(NULL, "cpm-pic", "CPM");
+	if (np == NULL) {
+		printk(KERN_ERR "CPM PIC init: can not find cpm-pic node\n");
+		return sirq;
+	}
+
+	ret = of_address_to_resource(np, 0, &res);
+	if (ret)
+		goto end;
+
+	cpic_reg = ioremap(res.start, resource_size(&res));
+	if (cpic_reg == NULL)
+		goto end;
+
+	sirq = irq_of_parse_and_map(np, 0);
+	if (!sirq)
+		goto end;
+
+	/* Initialize the CPM interrupt controller. */
+	hwirq = (unsigned int)virq_to_hw(sirq);
+	out_be32(&cpic_reg->cpic_cicr,
+	    (CICR_SCD_SCC4 | CICR_SCC_SCC3 | CICR_SCB_SCC2 | CICR_SCA_SCC1) |
+		((hwirq/2) << 13) | CICR_HP_MASK);
+
+	out_be32(&cpic_reg->cpic_cimr, 0);
+
+	cpm_pic_host = irq_domain_add_linear(np, 64, &cpm_pic_host_ops, NULL);
+	if (cpm_pic_host == NULL) {
+		printk(KERN_ERR "CPM2 PIC: failed to allocate irq host!\n");
+		sirq = 0;
+		goto end;
+	}
+
+	/* Install our own error handler. */
+	np = of_find_compatible_node(NULL, NULL, "fsl,cpm1");
+	if (np == NULL)
+		np = of_find_node_by_type(NULL, "cpm");
+	if (np == NULL) {
+		printk(KERN_ERR "CPM PIC init: can not find cpm node\n");
+		goto end;
+	}
+
+	eirq = irq_of_parse_and_map(np, 0);
+	if (!eirq)
+		goto end;
+
+	if (request_irq(eirq, cpm_error_interrupt, IRQF_NO_THREAD, "error",
+			NULL))
+		printk(KERN_ERR "Could not allocate CPM error IRQ!");
+
+	setbits32(&cpic_reg->cpic_cicr, CICR_IEN);
+
+end:
+	of_node_put(np);
+	return sirq;
+}
diff --git a/arch/powerpc/platforms/8xx/cpm1.c b/arch/powerpc/platforms/8xx/cpm1.c
index e82cb7f60151..3c69c7ceedea 100644
--- a/arch/powerpc/platforms/8xx/cpm1.c
+++ b/arch/powerpc/platforms/8xx/cpm1.c
@@ -51,145 +51,6 @@
 
 cpm8xx_t __iomem *cpmp;  /* Pointer to comm processor space */
 immap_t __iomem *mpc8xx_immr = (void __iomem *)VIRT_IMMR_BASE;
-static cpic8xx_t __iomem *cpic_reg;
-
-static struct irq_domain *cpm_pic_host;
-
-static void cpm_mask_irq(struct irq_data *d)
-{
-	unsigned int cpm_vec = (unsigned int)irqd_to_hwirq(d);
-
-	clrbits32(&cpic_reg->cpic_cimr, (1 << cpm_vec));
-}
-
-static void cpm_unmask_irq(struct irq_data *d)
-{
-	unsigned int cpm_vec = (unsigned int)irqd_to_hwirq(d);
-
-	setbits32(&cpic_reg->cpic_cimr, (1 << cpm_vec));
-}
-
-static void cpm_end_irq(struct irq_data *d)
-{
-	unsigned int cpm_vec = (unsigned int)irqd_to_hwirq(d);
-
-	out_be32(&cpic_reg->cpic_cisr, (1 << cpm_vec));
-}
-
-static struct irq_chip cpm_pic = {
-	.name = "CPM PIC",
-	.irq_mask = cpm_mask_irq,
-	.irq_unmask = cpm_unmask_irq,
-	.irq_eoi = cpm_end_irq,
-};
-
-int cpm_get_irq(void)
-{
-	int cpm_vec;
-
-	/*
-	 * Get the vector by setting the ACK bit and then reading
-	 * the register.
-	 */
-	out_be16(&cpic_reg->cpic_civr, 1);
-	cpm_vec = in_be16(&cpic_reg->cpic_civr);
-	cpm_vec >>= 11;
-
-	return irq_linear_revmap(cpm_pic_host, cpm_vec);
-}
-
-static int cpm_pic_host_map(struct irq_domain *h, unsigned int virq,
-			  irq_hw_number_t hw)
-{
-	pr_debug("cpm_pic_host_map(%d, 0x%lx)\n", virq, hw);
-
-	irq_set_status_flags(virq, IRQ_LEVEL);
-	irq_set_chip_and_handler(virq, &cpm_pic, handle_fasteoi_irq);
-	return 0;
-}
-
-/*
- * The CPM can generate the error interrupt when there is a race condition
- * between generating and masking interrupts.  All we have to do is ACK it
- * and return.  This is a no-op function so we don't need any special
- * tests in the interrupt handler.
- */
-static irqreturn_t cpm_error_interrupt(int irq, void *dev)
-{
-	return IRQ_HANDLED;
-}
-
-static const struct irq_domain_ops cpm_pic_host_ops = {
-	.map = cpm_pic_host_map,
-};
-
-unsigned int __init cpm_pic_init(void)
-{
-	struct device_node *np = NULL;
-	struct resource res;
-	unsigned int sirq = 0, hwirq, eirq;
-	int ret;
-
-	pr_debug("cpm_pic_init\n");
-
-	np = of_find_compatible_node(NULL, NULL, "fsl,cpm1-pic");
-	if (np == NULL)
-		np = of_find_compatible_node(NULL, "cpm-pic", "CPM");
-	if (np == NULL) {
-		printk(KERN_ERR "CPM PIC init: can not find cpm-pic node\n");
-		return sirq;
-	}
-
-	ret = of_address_to_resource(np, 0, &res);
-	if (ret)
-		goto end;
-
-	cpic_reg = ioremap(res.start, resource_size(&res));
-	if (cpic_reg == NULL)
-		goto end;
-
-	sirq = irq_of_parse_and_map(np, 0);
-	if (!sirq)
-		goto end;
-
-	/* Initialize the CPM interrupt controller. */
-	hwirq = (unsigned int)virq_to_hw(sirq);
-	out_be32(&cpic_reg->cpic_cicr,
-	    (CICR_SCD_SCC4 | CICR_SCC_SCC3 | CICR_SCB_SCC2 | CICR_SCA_SCC1) |
-		((hwirq/2) << 13) | CICR_HP_MASK);
-
-	out_be32(&cpic_reg->cpic_cimr, 0);
-
-	cpm_pic_host = irq_domain_add_linear(np, 64, &cpm_pic_host_ops, NULL);
-	if (cpm_pic_host == NULL) {
-		printk(KERN_ERR "CPM2 PIC: failed to allocate irq host!\n");
-		sirq = 0;
-		goto end;
-	}
-
-	/* Install our own error handler. */
-	np = of_find_compatible_node(NULL, NULL, "fsl,cpm1");
-	if (np == NULL)
-		np = of_find_node_by_type(NULL, "cpm");
-	if (np == NULL) {
-		printk(KERN_ERR "CPM PIC init: can not find cpm node\n");
-		goto end;
-	}
-
-	eirq = irq_of_parse_and_map(np, 0);
-	if (!eirq)
-		goto end;
-
-	if (request_irq(eirq, cpm_error_interrupt, IRQF_NO_THREAD, "error",
-			NULL))
-		printk(KERN_ERR "Could not allocate CPM error IRQ!");
-
-	setbits32(&cpic_reg->cpic_cicr, CICR_IEN);
-
-end:
-	of_node_put(np);
-	return sirq;
-}
 
 void __init cpm_reset(void)
 {
-- 
2.35.1

