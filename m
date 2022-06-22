Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EFA554AB8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 15:14:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSkPM282zz3fLY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 23:14:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=heyquark.com (client-ip=2001:4b98:dc4:8::229; helo=relay9-d.mail.gandi.net; envelope-from=ash@heyquark.com; receiver=<UNKNOWN>)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSkLK3cWnz3drY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 23:11:53 +1000 (AEST)
Received: (Authenticated sender: ash@heyquark.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 96795FF809;
	Wed, 22 Jun 2022 13:11:40 +0000 (UTC)
From: Ash Logan <ash@heyquark.com>
To: paulus@samba.org,
	mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu,
	robh+dt@kernel.org,
	benh@kernel.crashing.org
Subject: [PATCH v2 08/12] powerpc: wiiu: latte interrupt controller support
Date: Wed, 22 Jun 2022 23:10:33 +1000
Message-Id: <20220622131037.57604-9-ash@heyquark.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622131037.57604-1-ash@heyquark.com>
References: <20220302044406.63401-1-ash@heyquark.com>
 <20220622131037.57604-1-ash@heyquark.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linkmauve@linkmauve.fr, linux-kernel@vger.kernel.org, rw-r-r-0644@protonmail.com, linuxppc-dev@lists.ozlabs.org, j.ne@posteo.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for the "Latte" interrupt controller in the Nintendo Wii U.
This controller is used for the entire SoC and is wired to a cascade
interrupt on the Espresso controller.

Signed-off-by: Ash Logan <ash@heyquark.com>
Co-developed-by: Roberto Van Eeden <rw-r-r-0644@protonmail.com>
Signed-off-by: Roberto Van Eeden <rw-r-r-0644@protonmail.com>
---
 arch/powerpc/platforms/wiiu/Kconfig     |   1 +
 arch/powerpc/platforms/wiiu/Makefile    |   2 +-
 arch/powerpc/platforms/wiiu/latte-pic.c | 259 ++++++++++++++++++++++++
 arch/powerpc/platforms/wiiu/latte-pic.h |  23 +++
 4 files changed, 284 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/platforms/wiiu/latte-pic.c
 create mode 100644 arch/powerpc/platforms/wiiu/latte-pic.h

diff --git a/arch/powerpc/platforms/wiiu/Kconfig b/arch/powerpc/platforms/wiiu/Kconfig
index fa86cbc33d5e..5e062536ca58 100644
--- a/arch/powerpc/platforms/wiiu/Kconfig
+++ b/arch/powerpc/platforms/wiiu/Kconfig
@@ -3,6 +3,7 @@
 config WIIU
 	bool "Nintendo Wii U"
 	depends on PPC_BOOK3S_32
+	select IRQ_DOMAIN_HIERARCHY
 
 config LATTEIPC_UDBG
 	bool "Chipset IPC udbg console for the Nintendo Wii U"
diff --git a/arch/powerpc/platforms/wiiu/Makefile b/arch/powerpc/platforms/wiiu/Makefile
index aabf4b43e806..fa16c60261e6 100644
--- a/arch/powerpc/platforms/wiiu/Makefile
+++ b/arch/powerpc/platforms/wiiu/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_WIIU) += espresso-pic.o
+obj-$(CONFIG_WIIU) += espresso-pic.o latte-pic.o
 obj-$(CONFIG_LATTEIPC_UDBG) += udbg_latteipc.o
diff --git a/arch/powerpc/platforms/wiiu/latte-pic.c b/arch/powerpc/platforms/wiiu/latte-pic.c
new file mode 100644
index 000000000000..d16e0c2de2b0
--- /dev/null
+++ b/arch/powerpc/platforms/wiiu/latte-pic.c
@@ -0,0 +1,259 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Nintendo Wii U "Latte" interrupt controller support.
+ * This is the controller for all the SoC devices, and has a cascade interrupt for the Espresso
+ * CPU interrupt controller.
+ *
+ * Copyright (C) 2022 The linux-wiiu Team
+ *
+ * Based on hlwd-pic.c
+ * Copyright (C) 2009 The GameCube Linux Team
+ * Copyright (C) 2009 Albert Herranz
+ */
+
+#define DRV_MODULE_NAME "latte-pic"
+#define pr_fmt(fmt) DRV_MODULE_NAME ": " fmt
+
+#include <linux/kernel.h>
+#include <linux/irq.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/io.h>
+#include "latte-pic.h"
+
+static DEFINE_PER_CPU(struct lt_pic *, lt_pic_cpu);
+
+/*
+ * IRQ chip operations
+ * These handle both AHBALL and AHBLT IRQs, with AHBLT mapped above 32
+ */
+
+static void latte_pic_mask_and_ack(struct irq_data *d)
+{
+	struct lt_pic *pic = *this_cpu_ptr(&lt_pic_cpu);
+	u32 irq = irqd_to_hwirq(d);
+
+	if (irq < LATTE_AHBALL_NR_IRQS) {
+		u32 mask = 1 << irq;
+
+		out_be32(&pic->ahball_icr, mask);
+		clrbits32(&pic->ahball_imr, mask);
+	} else {
+		u32 mask = 1 << (irq - 32);
+
+		out_be32(&pic->ahblt_icr, mask);
+		clrbits32(&pic->ahblt_imr, mask);
+	}
+}
+
+static void latte_pic_ack(struct irq_data *d)
+{
+	struct lt_pic *pic = *this_cpu_ptr(&lt_pic_cpu);
+	u32 irq = irqd_to_hwirq(d);
+
+	if (irq < LATTE_AHBALL_NR_IRQS) {
+		u32 mask = 1 << irq;
+
+		out_be32(&pic->ahball_icr, mask);
+	} else {
+		u32 mask = 1 << (irq - 32);
+
+		out_be32(&pic->ahblt_icr, mask);
+	}
+}
+
+static void latte_pic_mask(struct irq_data *d)
+{
+	struct lt_pic *pic = *this_cpu_ptr(&lt_pic_cpu);
+	u32 irq = irqd_to_hwirq(d);
+
+	if (irq < LATTE_AHBALL_NR_IRQS) {
+		u32 mask = 1 << irq;
+
+		clrbits32(&pic->ahball_imr, mask);
+	} else {
+		u32 mask = 1 << (irq - 32);
+
+		clrbits32(&pic->ahblt_imr, mask);
+	}
+}
+
+static void latte_pic_unmask(struct irq_data *d)
+{
+	struct lt_pic *pic = *this_cpu_ptr(&lt_pic_cpu);
+	u32 irq = irqd_to_hwirq(d);
+
+	if (irq < LATTE_AHBALL_NR_IRQS) {
+		u32 mask = 1 << irq;
+
+		setbits32(&pic->ahball_imr, mask);
+	} else {
+		u32 mask = 1 << (irq - 32);
+
+		setbits32(&pic->ahblt_imr, mask);
+	}
+}
+
+static struct irq_chip latte_pic = {
+	.name = "latte-pic",
+	.irq_ack = latte_pic_ack,
+	.irq_mask_ack = latte_pic_mask_and_ack,
+	.irq_mask = latte_pic_mask,
+	.irq_unmask = latte_pic_unmask,
+};
+
+/*
+ * Domain ops
+ */
+
+static int latte_pic_match(struct irq_domain *h, struct device_node *node,
+			   enum irq_domain_bus_token bus_token)
+{
+	if (h->fwnode == &node->fwnode) {
+		pr_debug("%s IRQ matches with this driver\n", node->name);
+		return 1;
+	}
+	return 0;
+}
+
+static int latte_pic_alloc(struct irq_domain *h, unsigned int virq,
+			   unsigned int nr_irqs, void *arg)
+{
+	unsigned int i;
+	struct irq_fwspec *fwspec = arg;
+	irq_hw_number_t hwirq = fwspec->param[0];
+
+	for (i = 0; i < nr_irqs; i++) {
+		irq_set_chip_data(virq + i, h->host_data);
+		irq_set_status_flags(virq + i, IRQ_LEVEL);
+		irq_set_chip_and_handler(virq + i, &latte_pic,
+					 handle_level_irq);
+		irq_domain_set_hwirq_and_chip(h, virq + i, hwirq + i,
+					      &latte_pic, h->host_data);
+	}
+	return 0;
+}
+
+static void latte_pic_free(struct irq_domain *h, unsigned int virq,
+			   unsigned int nr_irqs)
+{
+	pr_debug("free\n");
+}
+
+const struct irq_domain_ops latte_pic_ops = {
+	.match = latte_pic_match,
+	.alloc = latte_pic_alloc,
+	.free = latte_pic_free,
+};
+
+/*
+ * Determinate if there are interrupts pending
+ * Checks AHBALL (0-32) and AHBLT (32-64)
+ */
+unsigned int latte_pic_get_irq(struct irq_domain *h)
+{
+	struct lt_pic *pic = *this_cpu_ptr(&lt_pic_cpu);
+	u32 irq_status, irq;
+
+	/* Check AHBALL first */
+	irq_status = in_be32(&pic->ahball_icr) & in_be32(&pic->ahball_imr);
+
+	if (irq_status == 0) {
+		/* Try AHBLT */
+		irq_status =
+			in_be32(&pic->ahblt_icr) & in_be32(&pic->ahblt_imr);
+		if (irq_status == 0)
+			return 0; /* No IRQs pending */
+
+		/* AHBLT is mapped above 32 (LATTE_AHBALL_NR_IRQS) */
+		irq = __ffs(irq_status) + LATTE_AHBALL_NR_IRQS;
+		return irq_linear_revmap(h, irq);
+	}
+
+	irq = __ffs(irq_status);
+	return irq_linear_revmap(h, irq);
+}
+
+/*
+ * Cascade IRQ handler
+ */
+static void latte_irq_cascade(struct irq_desc *desc)
+{
+	struct irq_domain *irq_domain = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned int virq;
+
+	raw_spin_lock(&desc->lock);
+	chip->irq_mask(&desc->irq_data); /* IRQ_LEVEL */
+	raw_spin_unlock(&desc->lock);
+
+	virq = latte_pic_get_irq(irq_domain);
+	if (virq)
+		generic_handle_irq(virq);
+	else
+		pr_err("spurious interrupt!\n");
+
+	raw_spin_lock(&desc->lock);
+	chip->irq_ack(&desc->irq_data); /* IRQ_LEVEL */
+	if (!irqd_irq_disabled(&desc->irq_data) && chip->irq_unmask)
+		chip->irq_unmask(&desc->irq_data);
+	raw_spin_unlock(&desc->lock);
+}
+
+void __init latte_pic_init(void)
+{
+	struct device_node *np =
+		of_find_compatible_node(NULL, NULL, "nintendo,latte-pic");
+	struct irq_domain *host;
+	struct resource res;
+	int irq_cascade;
+	void __iomem *regbase;
+	unsigned int cpu;
+
+	if (!np) {
+		pr_err("could not find device node\n");
+		return;
+	}
+	if (!of_get_property(np, "interrupts", NULL)) {
+		pr_err("could not find cascade interrupt!\n");
+		goto out;
+	}
+
+	if (of_address_to_resource(np, 0, &res)) {
+		pr_err("could not find resource address\n");
+		goto out;
+	}
+
+	regbase = ioremap(res.start, resource_size(&res));
+	if (IS_ERR(regbase)) {
+		pr_err("could not map controller\n");
+		goto out;
+	}
+
+	for_each_present_cpu(cpu) {
+		struct lt_pic **pic = per_cpu_ptr(&lt_pic_cpu, cpu);
+
+		/* Compute pic address */
+		*pic = regbase + (sizeof(struct lt_pic) * cpu);
+
+		/* Mask and Ack CPU IRQs */
+		out_be32(&(*pic)->ahball_imr, 0);
+		out_be32(&(*pic)->ahball_icr, 0xFFFFFFFF);
+	}
+
+	host = irq_domain_add_linear(np,
+				     LATTE_AHBALL_NR_IRQS + LATTE_AHBLT_NR_IRQS,
+				     &latte_pic_ops, NULL);
+	if (!host) {
+		pr_err("failed to allocate irq_domain\n");
+		goto out;
+	}
+
+	irq_cascade = irq_of_parse_and_map(np, 0);
+	irq_set_chained_handler_and_data(irq_cascade, latte_irq_cascade, host);
+
+out:
+	of_node_put(np);
+}
diff --git a/arch/powerpc/platforms/wiiu/latte-pic.h b/arch/powerpc/platforms/wiiu/latte-pic.h
new file mode 100644
index 000000000000..7021d9497d35
--- /dev/null
+++ b/arch/powerpc/platforms/wiiu/latte-pic.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Nintendo Wii U "Latte" interrupt controller support
+ *
+ * Copyright (C) 2022 The linux-wiiu Team
+ */
+
+#ifndef __LATTE_PIC_H
+#define __LATTE_PIC_H
+
+struct lt_pic {
+	__be32 ahball_icr;	/* Triggered AHB IRQs (all) */
+	__be32 ahblt_icr;	/* Triggered AHB IRQs (latte only) */
+	__be32 ahball_imr;	/* Allowed AHB IRQs (all) */
+	__be32 ahblt_imr;	/* Allowed AHB IRQs (latte only) */
+} __packed;
+
+#define LATTE_AHBALL_NR_IRQS    32
+#define LATTE_AHBLT_NR_IRQS     32
+
+void latte_pic_init(void);
+
+#endif
-- 
2.36.1

