Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F5B6B46E2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 15:47:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PY86K4GxPz3f4b
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Mar 2023 01:47:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.179; helo=mail-oi1-f179.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PY85l5PPTz3bgy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Mar 2023 01:47:07 +1100 (AEDT)
Received: by mail-oi1-f179.google.com with SMTP id bg11so4398286oib.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 06:47:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OU4f74//gf53K1vpd3AhvqfwdLrPYxnig4GEUDiaPjU=;
        b=lf2PyLpiI3y4nKENVPiTZ3VljAyDtsbakzrY67Jlnnaxjv3/GQd+2fXZPQRC9by2xx
         oWcY8E0Gk/noOip90Xs8rbyLT9Rd3LJtzd9U7Wg8irlF1C8KnFXuLnAIhhFFZNwqbtme
         z86BjfSlR9Zc3LDjNfdDYXYHMt9pWoHqv8ZHSAKzmB2a75vpkOrGQ4gZ2s+luxN/VegW
         VeDwUHTbaz33uNnBkz3EaPnnhUkNfcBdgzlXs76GPwZP2pX6hNfu6E36QnD27XSnoHVK
         bBxsf1kHQ0sXxziZT9n6dL+mnt3oAYB19tlk3FpQfMYAgxdjx+FaTSZLDjBGj7+AwndL
         cMSw==
X-Gm-Message-State: AO0yUKW8m+9e7tJp3fIsEHyG5flcUJJ9Kzl3AD9GPB7MtV2FuQzVKBzz
	YcEBzS5qqORUFJCixHnsvQ==
X-Google-Smtp-Source: AK7set8g5ChVrvUrZVHWfS/XFQBwmKXT9a/z9iAqAnF49+v0LC/ZY5BRlngv8dMqE01moV4WJ/Ypwg==
X-Received: by 2002:a05:6808:357:b0:378:9fca:e5da with SMTP id j23-20020a056808035700b003789fcae5damr12060606oie.53.1678459623345;
        Fri, 10 Mar 2023 06:47:03 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bl14-20020a056808308e00b00383e12bedebsm961933oib.9.2023.03.10.06.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:47:02 -0800 (PST)
Received: (nullmailer pid 1541066 invoked by uid 1000);
	Fri, 10 Mar 2023 14:46:57 -0000
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Arnd Bergmann <arnd@arndb.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH] powerpc: Use of_property_present() for testing DT property presence
Date: Fri, 10 Mar 2023 08:46:56 -0600
Message-Id: <20230310144657.1541039-1-robh@kernel.org>
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
of_get_property/of_find_property functions for reading properties. As
part of this, convert of_get_property/of_find_property calls to the
recently added of_property_present() helper when we just want to test
for presence of a property and nothing more.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/powerpc/kernel/legacy_serial.c          | 8 ++++----
 arch/powerpc/platforms/44x/iss4xx.c          | 2 +-
 arch/powerpc/platforms/44x/ppc476.c          | 2 +-
 arch/powerpc/platforms/4xx/pci.c             | 2 +-
 arch/powerpc/platforms/cell/spu_manage.c     | 2 +-
 arch/powerpc/platforms/powermac/pic.c        | 2 +-
 arch/powerpc/platforms/powernv/opal-lpc.c    | 2 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 2 +-
 arch/powerpc/platforms/pseries/vio.c         | 2 +-
 arch/powerpc/sysdev/mpic_msgr.c              | 2 +-
 10 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/legacy_serial.c b/arch/powerpc/kernel/legacy_serial.c
index f048c424c525..1a3b7f3513b4 100644
--- a/arch/powerpc/kernel/legacy_serial.c
+++ b/arch/powerpc/kernel/legacy_serial.c
@@ -171,11 +171,11 @@ static int __init add_legacy_soc_port(struct device_node *np,
 	/* We only support ports that have a clock frequency properly
 	 * encoded in the device-tree.
 	 */
-	if (of_get_property(np, "clock-frequency", NULL) == NULL)
+	if (!of_property_present(np, "clock-frequency"))
 		return -1;
 
 	/* if reg-offset don't try to use it */
-	if ((of_get_property(np, "reg-offset", NULL) != NULL))
+	if (of_property_present(np, "reg-offset"))
 		return -1;
 
 	/* if rtas uses this device, don't try to use it as well */
@@ -237,7 +237,7 @@ static int __init add_legacy_isa_port(struct device_node *np,
 	 * Note: Don't even try on P8 lpc, we know it's not directly mapped
 	 */
 	if (!of_device_is_compatible(isa_brg, "ibm,power8-lpc") ||
-	    of_get_property(isa_brg, "ranges", NULL)) {
+	    of_property_present(isa_brg, "ranges")) {
 		taddr = of_translate_address(np, reg);
 		if (taddr == OF_BAD_ADDR)
 			taddr = 0;
@@ -268,7 +268,7 @@ static int __init add_legacy_pci_port(struct device_node *np,
 	 * compatible UARTs on PCI need all sort of quirks (port offsets
 	 * etc...) that this code doesn't know about
 	 */
-	if (of_get_property(np, "clock-frequency", NULL) == NULL)
+	if (!of_property_present(np, "clock-frequency"))
 		return -1;
 
 	/* Get the PCI address. Assume BAR 0 */
diff --git a/arch/powerpc/platforms/44x/iss4xx.c b/arch/powerpc/platforms/44x/iss4xx.c
index c5f82591408c..812765cf0632 100644
--- a/arch/powerpc/platforms/44x/iss4xx.c
+++ b/arch/powerpc/platforms/44x/iss4xx.c
@@ -52,7 +52,7 @@ static void __init iss4xx_init_irq(void)
 
 	/* Find top level interrupt controller */
 	for_each_node_with_property(np, "interrupt-controller") {
-		if (of_get_property(np, "interrupts", NULL) == NULL)
+		if (!of_property_present(np, "interrupts"))
 			break;
 	}
 	if (np == NULL)
diff --git a/arch/powerpc/platforms/44x/ppc476.c b/arch/powerpc/platforms/44x/ppc476.c
index 7c91ac5a5241..70556fd10f6b 100644
--- a/arch/powerpc/platforms/44x/ppc476.c
+++ b/arch/powerpc/platforms/44x/ppc476.c
@@ -122,7 +122,7 @@ static void __init ppc47x_init_irq(void)
 
 	/* Find top level interrupt controller */
 	for_each_node_with_property(np, "interrupt-controller") {
-		if (of_get_property(np, "interrupts", NULL) == NULL)
+		if (!of_property_present(np, "interrupts"))
 			break;
 	}
 	if (np == NULL)
diff --git a/arch/powerpc/platforms/4xx/pci.c b/arch/powerpc/platforms/4xx/pci.c
index ca5dd7a5842a..70a055f76e5a 100644
--- a/arch/powerpc/platforms/4xx/pci.c
+++ b/arch/powerpc/platforms/4xx/pci.c
@@ -348,7 +348,7 @@ static void __init ppc4xx_probe_pci_bridge(struct device_node *np)
 	}
 
 	/* Check if primary bridge */
-	if (of_get_property(np, "primary", NULL))
+	if (of_property_present(np, "primary"))
 		primary = 1;
 
 	/* Get bus range if any */
diff --git a/arch/powerpc/platforms/cell/spu_manage.c b/arch/powerpc/platforms/cell/spu_manage.c
index f1ac4c742069..74567b32c48c 100644
--- a/arch/powerpc/platforms/cell/spu_manage.c
+++ b/arch/powerpc/platforms/cell/spu_manage.c
@@ -402,7 +402,7 @@ static int __init of_has_vicinity(void)
 	struct device_node *dn;
 
 	for_each_node_by_type(dn, "spe") {
-		if (of_find_property(dn, "vicinity", NULL))  {
+		if (of_property_present(dn, "vicinity"))  {
 			of_node_put(dn);
 			return 1;
 		}
diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
index 8c8d8e0a7d13..3425065ab22e 100644
--- a/arch/powerpc/platforms/powermac/pic.c
+++ b/arch/powerpc/platforms/powermac/pic.c
@@ -476,7 +476,7 @@ static int __init pmac_pic_probe_mpic(void)
 	/* We can have up to 2 MPICs cascaded */
 	for_each_node_by_type(np, "open-pic") {
 		if (master == NULL &&
-		    of_get_property(np, "interrupts", NULL) == NULL)
+		    !of_property_present(np, "interrupts"))
 			master = of_node_get(np);
 		else if (slave == NULL)
 			slave = of_node_get(np);
diff --git a/arch/powerpc/platforms/powernv/opal-lpc.c b/arch/powerpc/platforms/powernv/opal-lpc.c
index d129d6d45a50..a16f07cdab26 100644
--- a/arch/powerpc/platforms/powernv/opal-lpc.c
+++ b/arch/powerpc/platforms/powernv/opal-lpc.c
@@ -403,7 +403,7 @@ void __init opal_lpc_init(void)
 		return;
 
 	/* Does it support direct mapping ? */
-	if (of_get_property(np, "ranges", NULL)) {
+	if (of_property_present(np, "ranges")) {
 		pr_info("OPAL: Found memory mapped LPC bus on chip %d\n",
 			opal_lpc_chip_id);
 		isa_bridge_init_non_pci(np);
diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index 982e5e4b5e06..1a3cb313976a 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -493,7 +493,7 @@ static bool valid_cpu_drc_index(struct device_node *parent, u32 drc_index)
 	bool found = false;
 	int rc, index;
 
-	if (of_find_property(parent, "ibm,drc-info", NULL))
+	if (of_property_present(parent, "ibm,drc-info"))
 		return drc_info_valid_index(parent, drc_index);
 
 	/* Note that the format of the ibm,drc-indexes array is
diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index 770df9351aaa..d54306a936d5 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -1440,7 +1440,7 @@ struct vio_dev *vio_register_device_node(struct device_node *of_node)
 	viodev->dev.bus = &vio_bus_type;
 	viodev->dev.release = vio_dev_release;
 
-	if (of_get_property(viodev->dev.of_node, "ibm,my-dma-window", NULL)) {
+	if (of_property_present(viodev->dev.of_node, "ibm,my-dma-window")) {
 		if (firmware_has_feature(FW_FEATURE_CMO))
 			vio_cmo_set_dma_ops(viodev);
 		else
diff --git a/arch/powerpc/sysdev/mpic_msgr.c b/arch/powerpc/sysdev/mpic_msgr.c
index d75064fb7d12..1a3ac0b5dd89 100644
--- a/arch/powerpc/sysdev/mpic_msgr.c
+++ b/arch/powerpc/sysdev/mpic_msgr.c
@@ -116,7 +116,7 @@ static unsigned int mpic_msgr_number_of_blocks(void)
 
 		for (;;) {
 			snprintf(buf, sizeof(buf), "mpic-msgr-block%d", count);
-			if (!of_find_property(aliases, buf, NULL))
+			if (!of_property_present(aliases, buf))
 				break;
 
 			count += 1;
-- 
2.39.2

