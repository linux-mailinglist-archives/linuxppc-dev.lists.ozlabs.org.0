Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE62A1A7645
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 10:38:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491f5P6QV0zDqQT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 18:38:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=gAuAF5eD; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491dgj1lgvzDqX0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 18:19:29 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 491dgZ36gfz9tydS;
 Tue, 14 Apr 2020 10:19:22 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=gAuAF5eD; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id GQ7b8-oVS1Nc; Tue, 14 Apr 2020 10:19:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 491dgZ205Zz9v1rK;
 Tue, 14 Apr 2020 10:19:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586852362; bh=4n6JdeO7/UNDaVhVybzXtbdIOIFdfilBbJgumuNl7k4=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=gAuAF5eDm8kKkljuRL21R9vnnzyagNEtSMdxk5eWPEn+fQQvUwmqgHpDdHLS8OqW0
 yYQt4kr6qEuMgFyiiErOGPoGVbRK3lS+G7+NnSu3MZLgo689ZqvRbrUrowTcMzr/tN
 M4u0PXMcB6mCzqiFW362o1f7Ney1H1J9eo++YUDk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4E72D8B798;
 Tue, 14 Apr 2020 10:19:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CVZ-d7H3_092; Tue, 14 Apr 2020 10:19:23 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D7DD78B796;
 Tue, 14 Apr 2020 10:19:22 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id AB97C6578A; Tue, 14 Apr 2020 08:19:22 +0000 (UTC)
Message-Id: <ac1b4b957df59ee71890c98300ed4de082af1b58.1586852082.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1586852082.git.christophe.leroy@c-s.fr>
References: <cover.1586852082.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 06/13] powerpc/40x: Remove WALNUT
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 michal.simek@xilinx.com, arnd@arndb.de
Date: Tue, 14 Apr 2020 08:19:22 +0000 (UTC)
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

CONFIG_WALNUT is not selected by any config and is based
on 405GP which is obsolete.

Remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/boot/Makefile                  |   5 +-
 arch/powerpc/boot/dts/walnut.dts            | 246 --------------------
 arch/powerpc/boot/treeboot-walnut.c         |  81 -------
 arch/powerpc/configs/40x/acadia_defconfig   |   1 -
 arch/powerpc/configs/40x/kilauea_defconfig  |   1 -
 arch/powerpc/configs/40x/klondike_defconfig |   1 -
 arch/powerpc/configs/40x/makalu_defconfig   |   1 -
 arch/powerpc/configs/40x/obs600_defconfig   |   1 -
 arch/powerpc/configs/ppc40x_defconfig       |   1 -
 arch/powerpc/platforms/40x/Kconfig          |  18 --
 arch/powerpc/platforms/40x/Makefile         |   2 -
 arch/powerpc/platforms/40x/walnut.c         |  65 ------
 12 files changed, 1 insertion(+), 422 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/walnut.dts
 delete mode 100644 arch/powerpc/boot/treeboot-walnut.c
 delete mode 100644 arch/powerpc/platforms/40x/walnut.c

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index d8077b7071dd..865fe2da5a4b 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -75,7 +75,6 @@ $(obj)/cuboot-hotfoot.o: BOOTCFLAGS += -mcpu=405
 $(obj)/cuboot-taishan.o: BOOTCFLAGS += -mcpu=405
 $(obj)/cuboot-katmai.o: BOOTCFLAGS += -mcpu=405
 $(obj)/cuboot-acadia.o: BOOTCFLAGS += -mcpu=405
-$(obj)/treeboot-walnut.o: BOOTCFLAGS += -mcpu=405
 $(obj)/treeboot-iss4xx.o: BOOTCFLAGS += -mcpu=405
 $(obj)/treeboot-currituck.o: BOOTCFLAGS += -mcpu=405
 $(obj)/treeboot-akebono.o: BOOTCFLAGS += -mcpu=405
@@ -132,7 +131,7 @@ src-wlib-$(CONFIG_CPM) += cpm-serial.c
 
 src-plat-y := of.c epapr.c
 src-plat-$(CONFIG_40x) += fixed-head.S ep405.c cuboot-hotfoot.c \
-				treeboot-walnut.c cuboot-acadia.c \
+				cuboot-acadia.c \
 				cuboot-kilauea.c simpleboot.c
 src-plat-$(CONFIG_44x) += treeboot-ebony.c cuboot-ebony.c treeboot-bamboo.c \
 				cuboot-bamboo.c cuboot-sam440ep.c \
@@ -276,9 +275,7 @@ image-$(CONFIG_EPAPR_BOOT)		+= zImage.epapr
 #
 
 # Board ports in arch/powerpc/platform/40x/Kconfig
-image-$(CONFIG_EP405)			+= dtbImage.ep405
 image-$(CONFIG_HOTFOOT)			+= cuImage.hotfoot
-image-$(CONFIG_WALNUT)			+= treeImage.walnut
 image-$(CONFIG_ACADIA)			+= cuImage.acadia
 image-$(CONFIG_OBS600)			+= uImage.obs600
 
diff --git a/arch/powerpc/boot/dts/walnut.dts b/arch/powerpc/boot/dts/walnut.dts
deleted file mode 100644
index 0872862c9363..000000000000
--- a/arch/powerpc/boot/dts/walnut.dts
+++ /dev/null
@@ -1,246 +0,0 @@
-/*
- * Device Tree Source for IBM Walnut
- *
- * Copyright 2007 IBM Corp.
- * Josh Boyer <jwboyer@linux.vnet.ibm.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2.  This program is licensed "as is" without
- * any warranty of any kind, whether express or implied.
- */
-
-/dts-v1/;
-
-/ {
-	#address-cells = <1>;
-	#size-cells = <1>;
-	model = "ibm,walnut";
-	compatible = "ibm,walnut";
-	dcr-parent = <&{/cpus/cpu@0}>;
-
-	aliases {
-		ethernet0 = &EMAC;
-		serial0 = &UART0;
-		serial1 = &UART1;
-	};
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu@0 {
-			device_type = "cpu";
-			model = "PowerPC,405GP";
-			reg = <0x00000000>;
-			clock-frequency = <200000000>; /* Filled in by zImage */
-			timebase-frequency = <0>; /* Filled in by zImage */
-			i-cache-line-size = <32>;
-			d-cache-line-size = <32>;
-			i-cache-size = <16384>;
-			d-cache-size = <16384>;
-			dcr-controller;
-			dcr-access-method = "native";
-		};
-	};
-
-	memory {
-		device_type = "memory";
-		reg = <0x00000000 0x00000000>; /* Filled in by zImage */
-	};
-
-	UIC0: interrupt-controller {
-		compatible = "ibm,uic";
-		interrupt-controller;
-		cell-index = <0>;
-		dcr-reg = <0x0c0 0x009>;
-		#address-cells = <0>;
-		#size-cells = <0>;
-		#interrupt-cells = <2>;
-	};
-
-	plb {
-		compatible = "ibm,plb3";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-		clock-frequency = <0>; /* Filled in by zImage */
-
-		SDRAM0: memory-controller {
-			compatible = "ibm,sdram-405gp";
-			dcr-reg = <0x010 0x002>;
-		};
-
-		MAL: mcmal {
-			compatible = "ibm,mcmal-405gp", "ibm,mcmal";
-			dcr-reg = <0x180 0x062>;
-			num-tx-chans = <1>;
-			num-rx-chans = <1>;
-			interrupt-parent = <&UIC0>;
-			interrupts = <
-				0xb 0x4 /* TXEOB */
-				0xc 0x4 /* RXEOB */
-				0xa 0x4 /* SERR */
-				0xd 0x4 /* TXDE */
-				0xe 0x4 /* RXDE */>;
-		};
-
-		POB0: opb {
-			compatible = "ibm,opb-405gp", "ibm,opb";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0xef600000 0xef600000 0x00a00000>;
-			dcr-reg = <0x0a0 0x005>;
-			clock-frequency = <0>; /* Filled in by zImage */
-
-			UART0: serial@ef600300 {
-				device_type = "serial";
-				compatible = "ns16550";
-				reg = <0xef600300 0x00000008>;
-				virtual-reg = <0xef600300>;
-				clock-frequency = <0>; /* Filled in by zImage */
-				current-speed = <9600>;
-				interrupt-parent = <&UIC0>;
-				interrupts = <0x0 0x4>;
-			};
-
-			UART1: serial@ef600400 {
-				device_type = "serial";
-				compatible = "ns16550";
-				reg = <0xef600400 0x00000008>;
-				virtual-reg = <0xef600400>;
-				clock-frequency = <0>; /* Filled in by zImage */
-				current-speed = <9600>;
-				interrupt-parent = <&UIC0>;
-				interrupts = <0x1 0x4>;
-			};
-
-			IIC: i2c@ef600500 {
-				compatible = "ibm,iic-405gp", "ibm,iic";
-				reg = <0xef600500 0x00000011>;
-				interrupt-parent = <&UIC0>;
-				interrupts = <0x2 0x4>;
-			};
-
-			GPIO: gpio@ef600700 {
-				compatible = "ibm,gpio-405gp";
-				reg = <0xef600700 0x00000020>;
-			};
-
-			EMAC: ethernet@ef600800 {
-				device_type = "network";
-				compatible = "ibm,emac-405gp", "ibm,emac";
-				interrupt-parent = <&UIC0>;
-				interrupts = <
-					0xf 0x4 /* Ethernet */
-					0x9 0x4 /* Ethernet Wake Up */>;
-				local-mac-address = [000000000000]; /* Filled in by zImage */
-				reg = <0xef600800 0x00000070>;
-				mal-device = <&MAL>;
-				mal-tx-channel = <0>;
-				mal-rx-channel = <0>;
-				cell-index = <0>;
-				max-frame-size = <1500>;
-				rx-fifo-size = <4096>;
-				tx-fifo-size = <2048>;
-				phy-mode = "rmii";
-				phy-map = <0x00000001>;
-			};
-
-		};
-
-		EBC0: ebc {
-			compatible = "ibm,ebc-405gp", "ibm,ebc";
-			dcr-reg = <0x012 0x002>;
-			#address-cells = <2>;
-			#size-cells = <1>;
-			/* The ranges property is supplied by the bootwrapper
-			 * and is based on the firmware's configuration of the
-			 * EBC bridge
-			 */
-			clock-frequency = <0>; /* Filled in by zImage */
-
-			sram@0,0 {
-				reg = <0x00000000 0x00000000 0x00080000>;
-			};
-
-			flash@0,80000 {
-				compatible = "jedec-flash";
-				bank-width = <1>;
-				reg = <0x00000000 0x00080000 0x00080000>;
-				#address-cells = <1>;
-				#size-cells = <1>;
-				partition@0 {
-					label = "OpenBIOS";
-					reg = <0x00000000 0x00080000>;
-					read-only;
-				};
-			};
-
-			nvram@1,0 {
-				/* NVRAM and RTC */
-				compatible = "ds1743-nvram";
-				#bytes = <0x2000>;
-				reg = <0x00000001 0x00000000 0x00002000>;
-			};
-
-			keyboard@2,0 {
-				compatible = "intel,82C42PC";
-				reg = <0x00000002 0x00000000 0x00000002>;
-			};
-
-			ir@3,0 {
-				compatible = "ti,TIR2000PAG";
-				reg = <0x00000003 0x00000000 0x00000010>;
-			};
-
-			fpga@7,0 {
-				compatible = "Walnut-FPGA";
-				reg = <0x00000007 0x00000000 0x00000010>;
-				virtual-reg = <0xf0300005>;
-			};
-		};
-
-		PCI0: pci@ec000000 {
-			device_type = "pci";
-			#interrupt-cells = <1>;
-			#size-cells = <2>;
-			#address-cells = <3>;
-			compatible = "ibm,plb405gp-pci", "ibm,plb-pci";
-			primary;
-			reg = <0xeec00000 0x00000008	/* Config space access */
-			       0xeed80000 0x00000004	/* IACK */
-			       0xeed80000 0x00000004	/* Special cycle */
-			       0xef480000 0x00000040>;	/* Internal registers */
-
-			/* Outbound ranges, one memory and one IO,
-			 * later cannot be changed. Chip supports a second
-			 * IO range but we don't use it for now
-			 */
-			ranges = <0x02000000 0x00000000 0x80000000 0x80000000 0x00000000 0x20000000
-				  0x01000000 0x00000000 0x00000000 0xe8000000 0x00000000 0x00010000>;
-
-			/* Inbound 2GB range starting at 0 */
-			dma-ranges = <0x42000000 0x0 0x0 0x0 0x0 0x80000000>;
-
-			/* Walnut has all 4 IRQ pins tied together per slot */
-			interrupt-map-mask = <0xf800 0x0 0x0 0x0>;
-			interrupt-map = <
-				/* IDSEL 1 */
-				0x800 0x0 0x0 0x0 &UIC0 0x1c 0x8
-
-				/* IDSEL 2 */
-				0x1000 0x0 0x0 0x0 &UIC0 0x1d 0x8
-
-				/* IDSEL 3 */
-				0x1800 0x0 0x0 0x0 &UIC0 0x1e 0x8
-
-				/* IDSEL 4 */
-				0x2000 0x0 0x0 0x0 &UIC0 0x1f 0x8
-			>;
-		};
-	};
-
-	chosen {
-		stdout-path = "/plb/opb/serial@ef600300";
-	};
-};
diff --git a/arch/powerpc/boot/treeboot-walnut.c b/arch/powerpc/boot/treeboot-walnut.c
deleted file mode 100644
index 623f58e7f7c9..000000000000
--- a/arch/powerpc/boot/treeboot-walnut.c
+++ /dev/null
@@ -1,81 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Old U-boot compatibility for Walnut
- *
- * Author: Josh Boyer <jwboyer@linux.vnet.ibm.com>
- *
- * Copyright 2007 IBM Corporation
- *   Based on cuboot-83xx.c, which is:
- * Copyright (c) 2007 Freescale Semiconductor, Inc.
- */
-
-#include "ops.h"
-#include "stdio.h"
-#include "dcr.h"
-#include "4xx.h"
-#include "io.h"
-
-BSS_STACK(4096);
-
-static void walnut_flashsel_fixup(void)
-{
-	void *devp, *sram;
-	u32 reg_flash[3] = {0x0, 0x0, 0x80000};
-	u32 reg_sram[3] = {0x0, 0x0, 0x80000};
-	u8 *fpga;
-	u8 fpga_brds1 = 0x0;
-
-	devp = finddevice("/plb/ebc/fpga");
-	if (!devp)
-		fatal("Couldn't locate FPGA node\n\r");
-
-	if (getprop(devp, "virtual-reg", &fpga, sizeof(fpga)) != sizeof(fpga))
-		fatal("no virtual-reg property\n\r");
-
-	fpga_brds1 = in_8(fpga);
-
-	devp = finddevice("/plb/ebc/flash");
-	if (!devp)
-		fatal("Couldn't locate flash node\n\r");
-
-	if (getprop(devp, "reg", reg_flash, sizeof(reg_flash)) != sizeof(reg_flash))
-		fatal("flash reg property has unexpected size\n\r");
-
-	sram = finddevice("/plb/ebc/sram");
-	if (!sram)
-		fatal("Couldn't locate sram node\n\r");
-
-	if (getprop(sram, "reg", reg_sram, sizeof(reg_sram)) != sizeof(reg_sram))
-		fatal("sram reg property has unexpected size\n\r");
-
-	if (fpga_brds1 & 0x1) {
-		reg_flash[1] ^= 0x80000;
-		reg_sram[1] ^= 0x80000;
-	}
-
-	setprop(devp, "reg", reg_flash, sizeof(reg_flash));
-	setprop(sram, "reg", reg_sram, sizeof(reg_sram));
-}
-
-#define WALNUT_OPENBIOS_MAC_OFF 0xfffffe0b
-static void walnut_fixups(void)
-{
-	ibm4xx_sdram_fixup_memsize();
-	ibm405gp_fixup_clocks(33330000, 0xa8c000);
-	ibm4xx_quiesce_eth((u32 *)0xef600800, NULL);
-	ibm4xx_fixup_ebc_ranges("/plb/ebc");
-	walnut_flashsel_fixup();
-	dt_fixup_mac_address_by_alias("ethernet0", (u8 *) WALNUT_OPENBIOS_MAC_OFF);
-}
-
-void platform_init(void)
-{
-	unsigned long end_of_ram = 0x2000000;
-	unsigned long avail_ram = end_of_ram - (unsigned long) _end;
-
-	simple_alloc_init(_end, avail_ram, 32, 32);
-	platform_ops.fixups = walnut_fixups;
-	platform_ops.exit = ibm40x_dbcr_reset;
-	fdt_init(_dtb_start);
-	serial_console_init();
-}
diff --git a/arch/powerpc/configs/40x/acadia_defconfig b/arch/powerpc/configs/40x/acadia_defconfig
index db93c117be36..25eed86ec528 100644
--- a/arch/powerpc/configs/40x/acadia_defconfig
+++ b/arch/powerpc/configs/40x/acadia_defconfig
@@ -9,7 +9,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_ACADIA=y
-# CONFIG_WALNUT is not set
 CONFIG_PCI=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/powerpc/configs/40x/kilauea_defconfig b/arch/powerpc/configs/40x/kilauea_defconfig
index edc22464dfb5..3549c9e950e8 100644
--- a/arch/powerpc/configs/40x/kilauea_defconfig
+++ b/arch/powerpc/configs/40x/kilauea_defconfig
@@ -11,7 +11,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_KILAUEA=y
-# CONFIG_WALNUT is not set
 CONFIG_PCI=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/powerpc/configs/40x/klondike_defconfig b/arch/powerpc/configs/40x/klondike_defconfig
index 579fa846839c..6a735ee75715 100644
--- a/arch/powerpc/configs/40x/klondike_defconfig
+++ b/arch/powerpc/configs/40x/klondike_defconfig
@@ -8,7 +8,6 @@ CONFIG_EMBEDDED=y
 CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-# CONFIG_WALNUT is not set
 CONFIG_APM8018X=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_MATH_EMULATION=y
diff --git a/arch/powerpc/configs/40x/makalu_defconfig b/arch/powerpc/configs/40x/makalu_defconfig
index 188789b9aa4c..4563f88acf0c 100644
--- a/arch/powerpc/configs/40x/makalu_defconfig
+++ b/arch/powerpc/configs/40x/makalu_defconfig
@@ -9,7 +9,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_MAKALU=y
-# CONFIG_WALNUT is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/arch/powerpc/configs/40x/obs600_defconfig b/arch/powerpc/configs/40x/obs600_defconfig
index 5bf6af7ef093..2a2bb3f46847 100644
--- a/arch/powerpc/configs/40x/obs600_defconfig
+++ b/arch/powerpc/configs/40x/obs600_defconfig
@@ -10,7 +10,6 @@ CONFIG_KALLSYMS_ALL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
-# CONFIG_WALNUT is not set
 CONFIG_OBS600=y
 CONFIG_MATH_EMULATION=y
 CONFIG_NET=y
diff --git a/arch/powerpc/configs/ppc40x_defconfig b/arch/powerpc/configs/ppc40x_defconfig
index 88960a72b525..25f6c91e843a 100644
--- a/arch/powerpc/configs/ppc40x_defconfig
+++ b/arch/powerpc/configs/ppc40x_defconfig
@@ -10,7 +10,6 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PPC4xx_GPIO=y
 CONFIG_ACADIA=y
-CONFIG_EP405=y
 CONFIG_HOTFOOT=y
 CONFIG_KILAUEA=y
 CONFIG_MAKALU=y
diff --git a/arch/powerpc/platforms/40x/Kconfig b/arch/powerpc/platforms/40x/Kconfig
index ca8f44650647..5d9d96e7223a 100644
--- a/arch/powerpc/platforms/40x/Kconfig
+++ b/arch/powerpc/platforms/40x/Kconfig
@@ -7,14 +7,6 @@ config ACADIA
 	help
 	  This option enables support for the AMCC 405EZ Acadia evaluation board.
 
-config EP405
-	bool "EP405/EP405PC"
-	depends on 40x
-	select 405GP
-	select FORCE_PCI
-	help
-	  This option enables support for the EP405/EP405PC boards.
-
 config HOTFOOT
 	bool "Hotfoot"
 	depends on 40x
@@ -45,16 +37,6 @@ config MAKALU
 	help
 	  This option enables support for the AMCC PPC405EX board.
 
-config WALNUT
-	bool "Walnut"
-	depends on 40x
-	default y
-	select 405GP
-	select FORCE_PCI
-	select OF_RTC
-	help
-	  This option enables support for the IBM PPC405GP evaluation board.
-
 config OBS600
 	bool "OpenBlockS 600"
 	depends on 40x
diff --git a/arch/powerpc/platforms/40x/Makefile b/arch/powerpc/platforms/40x/Makefile
index e9386deed505..122de98527c4 100644
--- a/arch/powerpc/platforms/40x/Makefile
+++ b/arch/powerpc/platforms/40x/Makefile
@@ -1,4 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_WALNUT)				+= walnut.o
-obj-$(CONFIG_EP405)				+= ep405.o
 obj-$(CONFIG_PPC40x_SIMPLE)		+= ppc40x_simple.o
diff --git a/arch/powerpc/platforms/40x/walnut.c b/arch/powerpc/platforms/40x/walnut.c
deleted file mode 100644
index e5797815e2f1..000000000000
--- a/arch/powerpc/platforms/40x/walnut.c
+++ /dev/null
@@ -1,65 +0,0 @@
-/*
- * Architecture- / platform-specific boot-time initialization code for
- * IBM PowerPC 4xx based boards. Adapted from original
- * code by Gary Thomas, Cort Dougan <cort@fsmlabs.com>, and Dan Malek
- * <dan@net4x.com>.
- *
- * Copyright(c) 1999-2000 Grant Erickson <grant@lcse.umn.edu>
- *
- * Rewritten and ported to the merged powerpc tree:
- * Copyright 2007 IBM Corporation
- * Josh Boyer <jwboyer@linux.vnet.ibm.com>
- *
- * 2002 (c) MontaVista, Software, Inc.  This file is licensed under
- * the terms of the GNU General Public License version 2.  This program
- * is licensed "as is" without any warranty of any kind, whether express
- * or implied.
- */
-
-#include <linux/init.h>
-#include <linux/of_platform.h>
-#include <linux/rtc.h>
-
-#include <asm/machdep.h>
-#include <asm/prom.h>
-#include <asm/udbg.h>
-#include <asm/time.h>
-#include <asm/uic.h>
-#include <asm/pci-bridge.h>
-#include <asm/ppc4xx.h>
-
-static const struct of_device_id walnut_of_bus[] __initconst = {
-	{ .compatible = "ibm,plb3", },
-	{ .compatible = "ibm,opb", },
-	{ .compatible = "ibm,ebc", },
-	{},
-};
-
-static int __init walnut_device_probe(void)
-{
-	of_platform_bus_probe(NULL, walnut_of_bus, NULL);
-	of_instantiate_rtc();
-
-	return 0;
-}
-machine_device_initcall(walnut, walnut_device_probe);
-
-static int __init walnut_probe(void)
-{
-	if (!of_machine_is_compatible("ibm,walnut"))
-		return 0;
-
-	pci_set_flags(PCI_REASSIGN_ALL_RSRC);
-
-	return 1;
-}
-
-define_machine(walnut) {
-	.name			= "Walnut",
-	.probe			= walnut_probe,
-	.progress		= udbg_progress,
-	.init_IRQ		= uic_init_tree,
-	.get_irq		= uic_get_irq,
-	.restart		= ppc4xx_reset_system,
-	.calibrate_decr		= generic_calibrate_decr,
-};
-- 
2.25.0

