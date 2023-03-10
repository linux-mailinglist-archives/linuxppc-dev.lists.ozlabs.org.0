Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 352B76B4704
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 15:48:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PY86v0TQvz3cLC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Mar 2023 01:48:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.178; helo=mail-oi1-f178.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PY85r1YSsz3bgy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Mar 2023 01:47:12 +1100 (AEDT)
Received: by mail-oi1-f178.google.com with SMTP id bp19so4405740oib.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 06:47:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62nppyQRnwTbx3wgWlbX4dCx+e2v7PIZXu1K8ljoVy0=;
        b=ogCaiaOzsSucNEd5aqSMgAs0/qnfUujadF455k19VEY9nzmazGFnWOY9QgWXGxpX0l
         zt2/kHNMgsm3GknhAKsV5hTYtscIOnha5aevXSSu7h31pKPKUCrEZT3UxkUG0TpN0VhM
         p8j0hHWrh1ZpLIGCMp0RmoFUsM6zO5cxJhrC3D4v4uRkK2Una2WmZQuSXtljnNozGRFq
         GifHvkuNAjSgUjirGguMFy4/Gt+3AH3VNSbm8efvrcLSxr71NtL8sVVIlWLbmVFJGdl2
         FOX6sJCbB46zXENN2DdL2+vR5Pu3wPKIye7TdHA5s2LHno8xChHFI4udw5nYu0Mn0HUK
         lwjA==
X-Gm-Message-State: AO0yUKWIkFT/juNikXw/xwfWKJwSKqJpMh/bgTCxGRzFHIvK3zLZkS/L
	+tyS+q1179iSmMnhdYp5dw==
X-Google-Smtp-Source: AK7set/zNSUucPSHJLGcB1lJEh0MJfLxlVpcqojASXmUvXqBC0AH8hjXSCB+t5abzDmIwHlk+uZPGA==
X-Received: by 2002:aca:190f:0:b0:383:caf3:a30e with SMTP id l15-20020aca190f000000b00383caf3a30emr10854477oii.17.1678459629478;
        Fri, 10 Mar 2023 06:47:09 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bb40-20020a05680816a800b0037832f60518sm966060oib.14.2023.03.10.06.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:47:08 -0800 (PST)
Received: (nullmailer pid 1541204 invoked by uid 1000);
	Fri, 10 Mar 2023 14:46:59 -0000
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Anatolij Gustschin <agust@denx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH] powerpc: Use of_property_read_bool() for boolean properties
Date: Fri, 10 Mar 2023 08:46:57 -0600
Message-Id: <20230310144659.1541127-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties.
Convert reading boolean properties to to of_property_read_bool().

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/powerpc/kernel/btext.c                  |  2 +-
 arch/powerpc/kernel/legacy_serial.c          |  2 +-
 arch/powerpc/platforms/4xx/pci.c             | 18 +++++++-----------
 arch/powerpc/platforms/52xx/mpc52xx_common.c |  4 ++--
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c    |  4 ++--
 arch/powerpc/platforms/maple/setup.c         |  2 +-
 arch/powerpc/platforms/pasemi/iommu.c        |  2 +-
 arch/powerpc/platforms/powermac/feature.c    |  2 +-
 arch/powerpc/platforms/powermac/pic.c        |  4 ++--
 arch/powerpc/platforms/powermac/setup.c      |  2 +-
 arch/powerpc/platforms/powermac/smp.c        |  2 +-
 arch/powerpc/platforms/pseries/vio.c         |  2 +-
 arch/powerpc/sysdev/dcr.c                    |  2 +-
 arch/powerpc/sysdev/ehv_pic.c                |  6 +-----
 arch/powerpc/sysdev/fsl_soc.c                |  2 +-
 arch/powerpc/sysdev/mpic.c                   |  6 +++---
 arch/powerpc/sysdev/tsi108_dev.c             |  2 +-
 arch/powerpc/sysdev/xive/native.c            |  6 ++----
 18 files changed, 30 insertions(+), 40 deletions(-)

diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
index 2769889219bf..19e46fd623b0 100644
--- a/arch/powerpc/kernel/btext.c
+++ b/arch/powerpc/kernel/btext.c
@@ -235,7 +235,7 @@ int __init btext_find_display(int allow_nonstdout)
 		return rc;
 
 	for_each_node_by_type(np, "display") {
-		if (of_get_property(np, "linux,opened", NULL)) {
+		if (of_property_read_bool(np, "linux,opened")) {
 			printk("trying %pOF ...\n", np);
 			rc = btext_initialize(np);
 			printk("result: %d\n", rc);
diff --git a/arch/powerpc/kernel/legacy_serial.c b/arch/powerpc/kernel/legacy_serial.c
index 1a3b7f3513b4..c9ad12461d44 100644
--- a/arch/powerpc/kernel/legacy_serial.c
+++ b/arch/powerpc/kernel/legacy_serial.c
@@ -179,7 +179,7 @@ static int __init add_legacy_soc_port(struct device_node *np,
 		return -1;
 
 	/* if rtas uses this device, don't try to use it as well */
-	if (of_get_property(np, "used-by-rtas", NULL) != NULL)
+	if (of_property_read_bool(np, "used-by-rtas"))
 		return -1;
 
 	/* Get the address */
diff --git a/arch/powerpc/platforms/4xx/pci.c b/arch/powerpc/platforms/4xx/pci.c
index 70a055f76e5a..3638505a138c 100644
--- a/arch/powerpc/platforms/4xx/pci.c
+++ b/arch/powerpc/platforms/4xx/pci.c
@@ -348,7 +348,7 @@ static void __init ppc4xx_probe_pci_bridge(struct device_node *np)
 	}
 
 	/* Check if primary bridge */
-	if (of_property_present(np, "primary"))
+	if (of_property_read_bool(np, "primary"))
 		primary = 1;
 
 	/* Get bus range if any */
@@ -530,7 +530,7 @@ static void __init ppc4xx_probe_pcix_bridge(struct device_node *np)
 	struct pci_controller *hose = NULL;
 	void __iomem *reg = NULL;
 	const int *bus_range;
-	int big_pim = 0, msi = 0, primary = 0;
+	int big_pim, msi, primary;
 
 	/* Fetch config space registers address */
 	if (of_address_to_resource(np, 0, &rsrc_cfg)) {
@@ -546,16 +546,13 @@ static void __init ppc4xx_probe_pcix_bridge(struct device_node *np)
 	}
 
 	/* Check if it supports large PIMs (440GX) */
-	if (of_get_property(np, "large-inbound-windows", NULL))
-		big_pim = 1;
+	big_pim = of_property_read_bool(np, "large-inbound-windows");
 
 	/* Check if we should enable MSIs inbound hole */
-	if (of_get_property(np, "enable-msi-hole", NULL))
-		msi = 1;
+	msi = of_property_read_bool(np, "enable-msi-hole");
 
 	/* Check if primary bridge */
-	if (of_get_property(np, "primary", NULL))
-		primary = 1;
+	primary = of_property_read_bool(np, "primary");
 
 	/* Get bus range if any */
 	bus_range = of_get_property(np, "bus-range", NULL);
@@ -1915,14 +1912,13 @@ static void __init ppc4xx_pciex_port_setup_hose(struct ppc4xx_pciex_port *port)
 	struct resource dma_window;
 	struct pci_controller *hose = NULL;
 	const int *bus_range;
-	int primary = 0, busses;
+	int primary, busses;
 	void __iomem *mbase = NULL, *cfg_data = NULL;
 	const u32 *pval;
 	u32 val;
 
 	/* Check if primary bridge */
-	if (of_get_property(port->node, "primary", NULL))
-		primary = 1;
+	primary = of_property_read_bool(port->node, "primary");
 
 	/* Get bus range if any */
 	bus_range = of_get_property(port->node, "bus-range", NULL);
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_common.c b/arch/powerpc/platforms/52xx/mpc52xx_common.c
index 409c0ec06265..b4938e344f71 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_common.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_common.c
@@ -141,8 +141,8 @@ mpc52xx_map_common_devices(void)
 	 * on a gpt0, so check has-wdt property before mapping.
 	 */
 	for_each_matching_node(np, mpc52xx_gpt_ids) {
-		if (of_get_property(np, "fsl,has-wdt", NULL) ||
-		    of_get_property(np, "has-wdt", NULL)) {
+		if (of_property_read_bool(np, "fsl,has-wdt") ||
+		    of_property_read_bool(np, "has-wdt")) {
 			mpc52xx_wdt = of_iomap(np, 0);
 			of_node_put(np);
 			break;
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index e43e08d991ea..3fce4e1c3af6 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -735,8 +735,8 @@ static int mpc52xx_gpt_probe(struct platform_device *ofdev)
 	mutex_unlock(&mpc52xx_gpt_list_mutex);
 
 	/* check if this device could be a watchdog */
-	if (of_get_property(ofdev->dev.of_node, "fsl,has-wdt", NULL) ||
-	    of_get_property(ofdev->dev.of_node, "has-wdt", NULL)) {
+	if (of_property_read_bool(ofdev->dev.of_node, "fsl,has-wdt") ||
+	    of_property_read_bool(ofdev->dev.of_node, "has-wdt")) {
 		const u32 *on_boot_wdt;
 
 		gpt->wdt_mode = MPC52xx_GPT_CAN_WDT;
diff --git a/arch/powerpc/platforms/maple/setup.c b/arch/powerpc/platforms/maple/setup.c
index 98c8e3603064..3340dac82b65 100644
--- a/arch/powerpc/platforms/maple/setup.c
+++ b/arch/powerpc/platforms/maple/setup.c
@@ -235,7 +235,7 @@ static void __init maple_init_IRQ(void)
 	BUG_ON(openpic_addr == 0);
 
 	/* Check for a big endian MPIC */
-	if (of_get_property(np, "big-endian", NULL) != NULL)
+	if (of_property_read_bool(np, "big-endian"))
 		flags |= MPIC_BIG_ENDIAN;
 
 	/* XXX Maple specific bits */
diff --git a/arch/powerpc/platforms/pasemi/iommu.c b/arch/powerpc/platforms/pasemi/iommu.c
index 0a38663d44ed..375487cba874 100644
--- a/arch/powerpc/platforms/pasemi/iommu.c
+++ b/arch/powerpc/platforms/pasemi/iommu.c
@@ -254,7 +254,7 @@ void __init iommu_init_early_pasemi(void)
 	iommu_off = 1;
 #else
 	iommu_off = of_chosen &&
-			of_get_property(of_chosen, "linux,iommu-off", NULL);
+			of_property_read_bool(of_chosen, "linux,iommu-off");
 #endif
 	if (iommu_off)
 		return;
diff --git a/arch/powerpc/platforms/powermac/feature.c b/arch/powerpc/platforms/powermac/feature.c
index 0382d20b5619..6b1f974b074f 100644
--- a/arch/powerpc/platforms/powermac/feature.c
+++ b/arch/powerpc/platforms/powermac/feature.c
@@ -2506,7 +2506,7 @@ static int __init probe_motherboard(void)
 			int cpu_count = 1;
 
 			/* Nap mode not supported on SMP */
-			if (of_get_property(np, "flush-on-lock", NULL) ||
+			if (of_property_read_bool(np, "flush-on-lock") ||
 			    (cpu_count > 1)) {
 				powersave_nap = 0;
 				of_node_put(np);
diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
index 3425065ab22e..175f35ec4f31 100644
--- a/arch/powerpc/platforms/powermac/pic.c
+++ b/arch/powerpc/platforms/powermac/pic.c
@@ -450,7 +450,7 @@ static struct mpic * __init pmac_setup_one_mpic(struct device_node *np,
 
 	pmac_call_feature(PMAC_FTR_ENABLE_MPIC, np, 0, 0);
 
-	if (of_get_property(np, "big-endian", NULL))
+	if (of_property_read_bool(np, "big-endian"))
 		flags |= MPIC_BIG_ENDIAN;
 
 	/* Primary Big Endian means HT interrupts. This is quite dodgy
@@ -528,7 +528,7 @@ void __init pmac_pic_init(void)
 #ifdef CONFIG_PPC32
 	if (!pmac_newworld)
 		of_irq_workarounds |= OF_IMAP_OLDWORLD_MAC;
-	if (of_get_property(of_chosen, "linux,bootx", NULL) != NULL)
+	if (of_property_read_bool(of_chosen, "linux,bootx"))
 		of_irq_workarounds |= OF_IMAP_NO_PHANDLE;
 
 	/* If we don't have phandles on a newworld, then try to locate a
diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index 4f7ee885a78f..193cc9c39422 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -137,7 +137,7 @@ static void pmac_show_cpuinfo(struct seq_file *m)
 			of_get_property(np, "d-cache-size", NULL);
 		seq_printf(m, "L2 cache\t:");
 		has_l2cache = 1;
-		if (of_get_property(np, "cache-unified", NULL) && dc) {
+		if (of_property_read_bool(np, "cache-unified") && dc) {
 			seq_printf(m, " %dK unified", *dc / 1024);
 		} else {
 			if (ic)
diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index 5b26a9012d2e..8be71920e63c 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -706,7 +706,7 @@ static void __init smp_core99_setup(int ncpus)
 		struct device_node *cpus =
 			of_find_node_by_path("/cpus");
 		if (cpus &&
-		    of_get_property(cpus, "platform-cpu-timebase", NULL)) {
+		    of_property_read_bool(cpus, "platform-cpu-timebase")) {
 			pmac_tb_freeze = smp_core99_pfunc_tb_freeze;
 			printk(KERN_INFO "Processor timebase sync using"
 			       " platform function\n");
diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index d54306a936d5..a533ab3c7236 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -1381,7 +1381,7 @@ struct vio_dev *vio_register_device_node(struct device_node *of_node)
 	}
 
 	if (family == PFO) {
-		if (of_get_property(of_node, "interrupt-controller", NULL)) {
+		if (of_property_read_bool(of_node, "interrupt-controller")) {
 			pr_debug("%s: Skipping the interrupt controller %pOFn.\n",
 					__func__, of_node);
 			return NULL;
diff --git a/arch/powerpc/sysdev/dcr.c b/arch/powerpc/sysdev/dcr.c
index 3093f14111e6..70ce66eadff1 100644
--- a/arch/powerpc/sysdev/dcr.c
+++ b/arch/powerpc/sysdev/dcr.c
@@ -18,7 +18,7 @@ static struct device_node *find_dcr_parent(struct device_node *node)
 	const u32 *p;
 
 	for (par = of_node_get(node); par;) {
-		if (of_get_property(par, "dcr-controller", NULL))
+		if (of_property_read_bool(par, "dcr-controller"))
 			break;
 		p = of_get_property(par, "dcr-parent", NULL);
 		tmp = par;
diff --git a/arch/powerpc/sysdev/ehv_pic.c b/arch/powerpc/sysdev/ehv_pic.c
index 00705258ecf9..c7327b836d2b 100644
--- a/arch/powerpc/sysdev/ehv_pic.c
+++ b/arch/powerpc/sysdev/ehv_pic.c
@@ -256,7 +256,6 @@ void __init ehv_pic_init(void)
 {
 	struct device_node *np, *np2;
 	struct ehv_pic *ehv_pic;
-	int coreint_flag = 1;
 
 	np = of_find_compatible_node(NULL, NULL, "epapr,hv-pic");
 	if (!np) {
@@ -264,9 +263,6 @@ void __init ehv_pic_init(void)
 		return;
 	}
 
-	if (!of_find_property(np, "has-external-proxy", NULL))
-		coreint_flag = 0;
-
 	ehv_pic = kzalloc(sizeof(struct ehv_pic), GFP_KERNEL);
 	if (!ehv_pic) {
 		of_node_put(np);
@@ -292,7 +288,7 @@ void __init ehv_pic_init(void)
 
 	ehv_pic->hc_irq = ehv_pic_irq_chip;
 	ehv_pic->hc_irq.irq_set_affinity = ehv_pic_set_affinity;
-	ehv_pic->coreint_flag = coreint_flag;
+	ehv_pic->coreint_flag = of_property_read_bool(np, "has-external-proxy");
 
 	global_ehv_pic = ehv_pic;
 	irq_set_default_host(global_ehv_pic->irqhost);
diff --git a/arch/powerpc/sysdev/fsl_soc.c b/arch/powerpc/sysdev/fsl_soc.c
index 78118c188993..6ebbbca41065 100644
--- a/arch/powerpc/sysdev/fsl_soc.c
+++ b/arch/powerpc/sysdev/fsl_soc.c
@@ -174,7 +174,7 @@ static int __init setup_rstcr(void)
 	};
 
 	for_each_node_by_name(np, "global-utilities") {
-		if ((of_get_property(np, "fsl,has-rstcr", NULL))) {
+		if (of_property_read_bool(np, "fsl,has-rstcr")) {
 			rstcr = of_iomap(np, 0) + 0xb0;
 			if (!rstcr) {
 				printk (KERN_ERR "Error: reset control "
diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index 9a9381f102d6..ba287abcb008 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -1260,11 +1260,11 @@ struct mpic * __init mpic_alloc(struct device_node *node,
 	}
 
 	/* Read extra device-tree properties into the flags variable */
-	if (of_get_property(node, "big-endian", NULL))
+	if (of_property_read_bool(node, "big-endian"))
 		flags |= MPIC_BIG_ENDIAN;
-	if (of_get_property(node, "pic-no-reset", NULL))
+	if (of_property_read_bool(node, "pic-no-reset"))
 		flags |= MPIC_NO_RESET;
-	if (of_get_property(node, "single-cpu-affinity", NULL))
+	if (of_property_read_bool(node, "single-cpu-affinity"))
 		flags |= MPIC_SINGLE_DEST_CPU;
 	if (of_device_is_compatible(node, "fsl,mpic")) {
 		flags |= MPIC_FSL | MPIC_LARGE_VECTORS;
diff --git a/arch/powerpc/sysdev/tsi108_dev.c b/arch/powerpc/sysdev/tsi108_dev.c
index 30051397292f..bbccbe9f2b84 100644
--- a/arch/powerpc/sysdev/tsi108_dev.c
+++ b/arch/powerpc/sysdev/tsi108_dev.c
@@ -132,7 +132,7 @@ static int __init tsi108_eth_of_init(void)
 		 * driver itself to phylib and use a non-misleading
 		 * name for the workaround flag - it's not actually to
 		 * do with the model of PHY in use */
-		if (of_get_property(phy, "txc-rxc-delay-disable", NULL))
+		if (of_property_read_bool(phy, "txc-rxc-delay-disable"))
 			tsi_eth_data.phy_type = TSI108_PHY_BCM54XX;
 		of_node_put(phy);
 
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index 19d880ebc5e6..9f0af4d795d8 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -599,11 +599,9 @@ bool __init xive_native_init(void)
 	}
 
 	/* Do we support single escalation */
-	if (of_get_property(np, "single-escalation-support", NULL) != NULL)
-		xive_has_single_esc = true;
+	xive_has_single_esc = of_property_read_bool(np, "single-escalation-support");
 
-	if (of_get_property(np, "vp-save-restore", NULL))
-		xive_has_save_restore = true;
+	xive_has_save_restore = of_property_read_bool(np, "vp-save-restore");
 
 	/* Configure Thread Management areas for KVM */
 	for_each_possible_cpu(cpu)
-- 
2.39.2

