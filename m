Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5343A725C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 01:09:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3nGM2wLyz3dfb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 09:09:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=ia8xH/D6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=ia8xH/D6; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3n9h2kpYz2ymS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 09:05:44 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G3n9b1crdz9sWM; Tue, 15 Jun 2021 09:05:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4G3n9b11Mkz9sW7; Tue, 15 Jun 2021 09:05:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1623711939; bh=20Sf6OPC13wSHbmqwXXCHdVOiZKK4g1GAEVKxUCRmG8=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=ia8xH/D6cL1bf7Z6J2ZDhnTmV4lwkUb0ZzsSjR42MP2ERfR9ZKsWGrFUYc/gjozOG
 frChdzofy/q4Z+wtPMrElUmN1tsX6lVJz1sE8AzTO+0owEJogtmwltyJ4wlbLYGzaA
 S6iA5TTlnHoPwQnllsgG4HpqvxcXRoJvqdUYEmsb2HNHSiOEXtsXqYTGiVTwJF4fph
 TI4VaqiAU3aR+8DXrueNLNei7PIR3A9zDFv2YCmJ5zU/cwEydrADC6rV2A2LMaLGl2
 oETpIV+ph6y4el6kYWB35Pl0mGVwX6xk2QzMexFMOueH5jCoTEDdilXVHbg9EIFt6s
 0FWYPXOvm7jCQ==
Date: Tue, 15 Jun 2021 09:00:43 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 05/11] powerpc/xics: Add a native ICS backend for microwatt
Message-ID: <YMffmxSzUAJxl8d1@thinks.paulus.ozlabs.org>
References: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Benjamin Herrenschmidt <benh@kernel.crashing.org>

This is a simple native ICS backend that matches the layout of
the Microwatt implementation of ICS.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 arch/powerpc/boot/dts/microwatt.dts      |  18 ++
 arch/powerpc/platforms/microwatt/Kconfig |   2 +
 arch/powerpc/platforms/microwatt/setup.c |   8 +
 arch/powerpc/sysdev/xics/Kconfig         |   3 +
 arch/powerpc/sysdev/xics/Makefile        |   1 +
 arch/powerpc/sysdev/xics/ics-native.c    | 257 +++++++++++++++++++++++
 arch/powerpc/sysdev/xics/xics-common.c   |   2 +
 7 files changed, 291 insertions(+)
 create mode 100644 arch/powerpc/sysdev/xics/ics-native.c

diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/microwatt.dts
index a72177e5041d..2e75600320e8 100644
--- a/arch/powerpc/boot/dts/microwatt.dts
+++ b/arch/powerpc/boot/dts/microwatt.dts
@@ -106,7 +106,25 @@ soc@c0000000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
+		interrupt-parent = <&ICS>;
 
 		ranges = <0 0 0xc0000000 0x40000000>;
+
+		interrupt-controller@4000 {
+			compatible = "openpower,xics-presentation", "ibm,ppc-xicp";
+			ibm,interrupt-server-ranges = <0x0 0x1>;
+			reg = <0x4000 0x100>;
+		};
+
+		ICS: interrupt-controller@5000 {
+			compatible = "openpower,xics-sources";
+			interrupt-controller;
+			interrupt-ranges = <0x10 0x10>;
+			reg = <0x5000 0x100>;
+			#address-cells = <0>;
+			#size-cells = <0>;
+			#interrupt-cells = <2>;
+		};
+
 	};
 };
diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
index 3be01e78ce57..b52c869c0eb8 100644
--- a/arch/powerpc/platforms/microwatt/Kconfig
+++ b/arch/powerpc/platforms/microwatt/Kconfig
@@ -3,6 +3,8 @@ config PPC_MICROWATT
 	depends on PPC_BOOK3S_64 && !SMP
 	bool "Microwatt SoC platform"
 	select PPC_XICS
+	select PPC_ICS_NATIVE
+	select PPC_ICP_NATIVE
 	select PPC_NATIVE
 	help
           This option enables support for FPGA-based Microwatt implementations.
diff --git a/arch/powerpc/platforms/microwatt/setup.c b/arch/powerpc/platforms/microwatt/setup.c
index 5af4adf881bc..1c1b7791fa57 100644
--- a/arch/powerpc/platforms/microwatt/setup.c
+++ b/arch/powerpc/platforms/microwatt/setup.c
@@ -10,8 +10,15 @@
 #include <linux/init.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+
 #include <asm/machdep.h>
 #include <asm/time.h>
+#include <asm/xics.h>
+
+static void __init microwatt_init_IRQ(void)
+{
+	xics_init();
+}
 
 static int __init microwatt_probe(void)
 {
@@ -27,5 +34,6 @@ machine_arch_initcall(microwatt, microwatt_populate);
 define_machine(microwatt) {
 	.name			= "microwatt",
 	.probe			= microwatt_probe,
+	.init_IRQ		= microwatt_init_IRQ,
 	.calibrate_decr		= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/sysdev/xics/Kconfig b/arch/powerpc/sysdev/xics/Kconfig
index 304614c920aa..063d9195891f 100644
--- a/arch/powerpc/sysdev/xics/Kconfig
+++ b/arch/powerpc/sysdev/xics/Kconfig
@@ -12,3 +12,6 @@ config PPC_ICP_HV
 
 config PPC_ICS_RTAS
 	def_bool n
+
+config PPC_ICS_NATIVE
+	def_bool n
diff --git a/arch/powerpc/sysdev/xics/Makefile b/arch/powerpc/sysdev/xics/Makefile
index ba1e3117b1c0..747063927c6c 100644
--- a/arch/powerpc/sysdev/xics/Makefile
+++ b/arch/powerpc/sysdev/xics/Makefile
@@ -4,4 +4,5 @@ obj-y				+= xics-common.o
 obj-$(CONFIG_PPC_ICP_NATIVE)	+= icp-native.o
 obj-$(CONFIG_PPC_ICP_HV)	+= icp-hv.o
 obj-$(CONFIG_PPC_ICS_RTAS)	+= ics-rtas.o
+obj-$(CONFIG_PPC_ICS_NATIVE)	+= ics-native.o
 obj-$(CONFIG_PPC_POWERNV)	+= ics-opal.o icp-opal.o
diff --git a/arch/powerpc/sysdev/xics/ics-native.c b/arch/powerpc/sysdev/xics/ics-native.c
new file mode 100644
index 000000000000..d450502f4053
--- /dev/null
+++ b/arch/powerpc/sysdev/xics/ics-native.c
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * ICS backend for OPAL managed interrupts.
+ *
+ * Copyright 2011 IBM Corp.
+ */
+
+//#define DEBUG
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/irq.h>
+#include <linux/smp.h>
+#include <linux/interrupt.h>
+#include <linux/init.h>
+#include <linux/cpu.h>
+#include <linux/of.h>
+#include <linux/spinlock.h>
+#include <linux/msi.h>
+#include <linux/list.h>
+
+#include <asm/prom.h>
+#include <asm/smp.h>
+#include <asm/machdep.h>
+#include <asm/irq.h>
+#include <asm/errno.h>
+#include <asm/xics.h>
+#include <asm/opal.h>
+#include <asm/firmware.h>
+
+struct ics_native {
+	struct ics		ics;
+	struct device_node	*node;
+	void __iomem    	*base;
+	u32             	ibase;
+	u32             	icount;
+};
+#define to_ics_native(_ics)     container_of(_ics, struct ics_native, ics)
+
+static void __iomem *ics_native_xive(struct ics_native *in, unsigned int vec)
+{
+	return in->base + 0x800 + ((vec - in->ibase) << 2);
+}
+
+static void ics_native_unmask_irq(struct irq_data *d)
+{
+	unsigned int vec = (unsigned int)irqd_to_hwirq(d);
+	struct ics *ics = irq_data_get_irq_chip_data(d);
+	struct ics_native *in = to_ics_native(ics);
+	unsigned int server;
+
+	pr_devel("ics-native: unmask virq %d [hw 0x%x]\n", d->irq, vec);
+
+	if (vec < in->ibase || vec >= (in->ibase + in->icount))
+		return;
+
+	server = xics_get_irq_server(d->irq, irq_data_get_affinity_mask(d), 0);
+	out_be32(ics_native_xive(in, vec), (server << 8) | DEFAULT_PRIORITY);
+}
+
+static unsigned int ics_native_startup(struct irq_data *d)
+{
+#ifdef CONFIG_PCI_MSI
+	/*
+	 * The generic MSI code returns with the interrupt disabled on the
+	 * card, using the MSI mask bits. Firmware doesn't appear to unmask
+	 * at that level, so we do it here by hand.
+	 */
+	if (irq_data_get_msi_desc(d))
+		pci_msi_unmask_irq(d);
+#endif
+
+	/* unmask it */
+	ics_native_unmask_irq(d);
+	return 0;
+}
+
+static void ics_native_do_mask(struct ics_native *in, unsigned int vec)
+{
+	out_be32(ics_native_xive(in, vec), 0xff);
+}
+
+static void ics_native_mask_irq(struct irq_data *d)
+{
+	unsigned int vec = (unsigned int)irqd_to_hwirq(d);
+	struct ics *ics = irq_data_get_irq_chip_data(d);
+	struct ics_native *in = to_ics_native(ics);
+
+	pr_devel("ics-native: mask virq %d [hw 0x%x]\n", d->irq, vec);
+
+	if (vec < in->ibase || vec >= (in->ibase + in->icount))
+		return;
+	ics_native_do_mask(in, vec);
+}
+
+static int ics_native_set_affinity(struct irq_data *d,
+				   const struct cpumask *cpumask,
+				   bool force)
+{
+	unsigned int vec = (unsigned int)irqd_to_hwirq(d);
+	struct ics *ics = irq_data_get_irq_chip_data(d);
+	struct ics_native *in = to_ics_native(ics);
+	int server;
+	u32 xive;
+
+	if (vec < in->ibase || vec >= (in->ibase + in->icount))
+		return -EINVAL;
+
+	server = xics_get_irq_server(d->irq, cpumask, 1);
+	if (server == -1) {
+		pr_warn("%s: No online cpus in the mask %*pb for irq %d\n",
+			__func__, cpumask_pr_args(cpumask), d->irq);
+		return -1;
+	}
+
+	xive = in_be32(ics_native_xive(in, vec));
+	xive = (xive & 0xff) | (server << 8);
+	out_be32(ics_native_xive(in, vec), xive);
+
+	return IRQ_SET_MASK_OK;
+}
+
+static struct irq_chip ics_native_irq_chip = {
+	.name = "ICS",
+	.irq_startup		= ics_native_startup,
+	.irq_mask		= ics_native_mask_irq,
+	.irq_unmask		= ics_native_unmask_irq,
+	.irq_eoi		= NULL, /* Patched at init time */
+	.irq_set_affinity 	= ics_native_set_affinity,
+	.irq_set_type		= xics_set_irq_type,
+	.irq_retrigger		= xics_retrigger,
+};
+
+static int ics_native_map(struct ics *ics, unsigned int virq)
+{
+	unsigned int vec = (unsigned int)virq_to_hw(virq);
+	struct ics_native *in = to_ics_native(ics);
+
+	pr_devel("%s: vec=0x%x\n", __func__, vec);
+
+	if (vec < in->ibase || vec >= (in->ibase + in->icount))
+		return -EINVAL;
+
+	irq_set_chip_and_handler(virq, &ics_native_irq_chip, handle_fasteoi_irq);
+	irq_set_chip_data(virq, ics);
+
+	return 0;
+}
+
+static void ics_native_mask_unknown(struct ics *ics, unsigned long vec)
+{
+	struct ics_native *in = to_ics_native(ics);
+
+	if (vec < in->ibase || vec >= (in->ibase + in->icount))
+		return;
+
+	ics_native_do_mask(in, vec);
+}
+
+static long ics_native_get_server(struct ics *ics, unsigned long vec)
+{
+	struct ics_native *in = to_ics_native(ics);
+	u32 xive;
+
+	if (vec < in->ibase || vec >= (in->ibase + in->icount))
+		return -EINVAL;
+
+	xive = in_be32(ics_native_xive(in, vec));
+	return (xive >> 8) & 0xfff;
+}
+
+static int ics_native_host_match(struct ics *ics, struct device_node *node)
+{
+	struct ics_native *in = to_ics_native(ics);
+
+	return in->node == node;
+}
+
+static struct ics ics_native_template = {
+	.map		= ics_native_map,
+	.mask_unknown	= ics_native_mask_unknown,
+	.get_server	= ics_native_get_server,
+	.host_match	= ics_native_host_match,
+};
+
+static int __init ics_native_add_one(struct device_node *np)
+{
+	struct ics_native *ics;
+	u32 ranges[2];
+	int rc, count;
+
+	ics = kzalloc(sizeof(struct ics_native), GFP_KERNEL);
+	if (!ics)
+		return -ENOMEM;
+	ics->node = of_node_get(np);
+	memcpy(&ics->ics, &ics_native_template, sizeof(struct ics));
+
+	ics->base = of_iomap(np, 0);
+	if (!ics->base) {
+		pr_err("Failed to map %pOFP\n", np);
+		rc = -ENOMEM;
+		goto fail;
+	}
+
+	count = of_property_count_u32_elems(np, "interrupt-ranges");
+	if (count < 2 || count & 1) {
+		pr_err("Failed to read interrupt-ranges of %pOFP\n", np);
+		rc = -EINVAL;
+		goto fail;
+	}
+	if (count > 2) {
+		pr_warn("ICS %pOFP has %d ranges, only one supported\n",
+			np, count >> 1);
+	}
+	rc = of_property_read_u32_array(np, "interrupt-ranges",
+					ranges, 2);
+	if (rc) {
+		pr_err("Failed to read interrupt-ranges of %pOFP\n", np);
+		goto fail;
+	}
+	ics->ibase = ranges[0];
+	ics->icount = ranges[1];
+
+	pr_info("ICS native initialized for sources %d..%d\n",
+		ics->ibase, ics->ibase + ics->icount - 1);
+
+	/* Register ourselves */
+	xics_register_ics(&ics->ics);
+
+	return 0;
+fail:
+	of_node_put(ics->node);
+	kfree(ics);
+	return rc;
+}
+
+int __init ics_native_init(void)
+{
+	struct device_node *ics;
+	bool found_one = false;
+
+	/* We need to patch our irq chip's EOI to point to the
+	 * right ICP
+	 */
+	ics_native_irq_chip.irq_eoi = icp_ops->eoi;
+
+	/* Find native ICS in the device-tree */
+	for_each_compatible_node(ics, NULL, "openpower,xics-sources") {
+		if (ics_native_add_one(ics) == 0)
+			found_one = true;
+	}
+
+	if (found_one)
+		pr_info("ICS native backend registered\n");
+
+	return found_one ? 0 : -ENODEV;
+}
diff --git a/arch/powerpc/sysdev/xics/xics-common.c b/arch/powerpc/sysdev/xics/xics-common.c
index 7e4305c01bac..de41ab91f793 100644
--- a/arch/powerpc/sysdev/xics/xics-common.c
+++ b/arch/powerpc/sysdev/xics/xics-common.c
@@ -476,6 +476,8 @@ void __init xics_init(void)
 	rc = ics_rtas_init();
 	if (rc < 0)
 		rc = ics_opal_init();
+	if (rc < 0)
+		rc = ics_native_init();
 	if (rc < 0)
 		pr_warn("XICS: Cannot find a Source Controller !\n");
 
-- 
2.31.1

