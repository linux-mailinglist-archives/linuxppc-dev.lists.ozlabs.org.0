Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A18291A7651
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 10:42:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491f9k6Xq4zDqXl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 18:42:02 +1000 (AEST)
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
 header.s=mail header.b=k43YqIGw; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491dgj4FVlzDqcl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 18:19:29 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 491dgb3wvMz9tydV;
 Tue, 14 Apr 2020 10:19:23 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=k43YqIGw; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id AOA6k5vyWOK1; Tue, 14 Apr 2020 10:19:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 491dgb2smrz9tydT;
 Tue, 14 Apr 2020 10:19:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586852363; bh=09+8MjYqSPG2oQWUJ/D589b20QQstXxvlY6nY00g22M=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=k43YqIGwK+qc+ihabYkQm+YdZyCDaW/82ZbF0AuhhPmsKSPVCWcFLmUhYMI9avKWB
 8am84mNuvSQ8OCgVoxhMxgBuZ0lqxWT3z4bdK3Xg5inueet9mLHM4b8DD/lezdHpT8
 hUGxnCAZAML3wRzfORNB7qGEq7E3stEu8nWrOpkk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 605BC8B797;
 Tue, 14 Apr 2020 10:19:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 03wZ5jPPcxUk; Tue, 14 Apr 2020 10:19:24 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E27EE8B796;
 Tue, 14 Apr 2020 10:19:23 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id B5ADC6578A; Tue, 14 Apr 2020 08:19:23 +0000 (UTC)
Message-Id: <73e120a058a5b8df7fbeb86fdee7559fdefc1f95.1586852082.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1586852082.git.christophe.leroy@c-s.fr>
References: <cover.1586852082.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 07/13] powerpc/40x: Remove EP405
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 michal.simek@xilinx.com, arnd@arndb.de
Date: Tue, 14 Apr 2020 08:19:23 +0000 (UTC)
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

EP405 is an old type of board based on a 405GP which is obsolete.

Remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/boot/Makefile               |   2 +-
 arch/powerpc/boot/dts/ep405.dts          | 230 -----------------------
 arch/powerpc/boot/ep405.c                |  71 -------
 arch/powerpc/configs/40x/ep405_defconfig |  62 ------
 arch/powerpc/platforms/40x/ep405.c       | 123 ------------
 5 files changed, 1 insertion(+), 487 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/ep405.dts
 delete mode 100644 arch/powerpc/boot/ep405.c
 delete mode 100644 arch/powerpc/configs/40x/ep405_defconfig
 delete mode 100644 arch/powerpc/platforms/40x/ep405.c

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 865fe2da5a4b..63d7456b9518 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -130,7 +130,7 @@ src-wlib-$(CONFIG_EMBEDDED6xx) += ugecon.c fsl-soc.c
 src-wlib-$(CONFIG_CPM) += cpm-serial.c
 
 src-plat-y := of.c epapr.c
-src-plat-$(CONFIG_40x) += fixed-head.S ep405.c cuboot-hotfoot.c \
+src-plat-$(CONFIG_40x) += fixed-head.S cuboot-hotfoot.c \
 				cuboot-acadia.c \
 				cuboot-kilauea.c simpleboot.c
 src-plat-$(CONFIG_44x) += treeboot-ebony.c cuboot-ebony.c treeboot-bamboo.c \
diff --git a/arch/powerpc/boot/dts/ep405.dts b/arch/powerpc/boot/dts/ep405.dts
deleted file mode 100644
index 4ac9c5ab6e6b..000000000000
--- a/arch/powerpc/boot/dts/ep405.dts
+++ /dev/null
@@ -1,230 +0,0 @@
-/*
- * Device Tree Source for EP405
- *
- * Copyright 2007 IBM Corp.
- * Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
-	model = "ep405";
-	compatible = "ep405";
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
-				linux,network-index = <0x0>;
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
-				phy-map = <0x00000000>;
-			};
-
-		};
-
-		EBC0: ebc {
-			compatible = "ibm,ebc-405gp", "ibm,ebc";
-			dcr-reg = <0x012 0x002>;
-			#address-cells = <2>;
-			#size-cells = <1>;
-
-
-			/* The ranges property is supplied by the bootwrapper
-			 * and is based on the firmware's configuration of the
-			 * EBC bridge
-			 */
-			clock-frequency = <0>; /* Filled in by zImage */
-
-			/* NVRAM and RTC */
-			nvrtc@4,200000 {
-				compatible = "ds1742";
-				reg = <0x00000004 0x00200000 0x00000000>; /* size fixed up by zImage */
-			};
-
-			/* "BCSR" CPLD contains a PCI irq controller */
-			bcsr@4,0 {
-				compatible = "ep405-bcsr";
-				reg = <0x00000004 0x00000000 0x00000010>;
-				interrupt-controller;
-				/* Routing table */
-				irq-routing = [	00	/* SYSERR */
-						01	/* STTM */
-						01	/* RTC */
-						01	/* FENET */
-						02	/* NB PCIIRQ mux ? */
-						03	/* SB Winbond 8259 ? */
-						04	/* Serial Ring */
-						05	/* USB (ep405pc) */
-						06	/* XIRQ 0 */
-						06	/* XIRQ 1 */
-						06	/* XIRQ 2 */
-						06	/* XIRQ 3 */
-						06	/* XIRQ 4 */
-						06	/* XIRQ 5 */
-						06	/* XIRQ 6 */
-						07];	/* Reserved */
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
-			/* That's all I know about IRQs on that thing ... */
-			interrupt-map-mask = <0xf800 0x0 0x0 0x0>;
-			interrupt-map = <
-				/* USB */
-				0x7000 0x0 0x0 0x0 &UIC0 0x1e 0x8 /* IRQ5 */
-			>;
-		};
-	};
-
-	chosen {
-		stdout-path = "/plb/opb/serial@ef600300";
-	};
-};
diff --git a/arch/powerpc/boot/ep405.c b/arch/powerpc/boot/ep405.c
deleted file mode 100644
index f9ad1e6a844e..000000000000
--- a/arch/powerpc/boot/ep405.c
+++ /dev/null
@@ -1,71 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Embedded Planet EP405 with PlanetCore firmware
- *
- * (c) Benjamin Herrenschmidt <benh@kernel.crashing.org>, IBM Corp,\
- *
- * Based on ep88xc.c by
- *
- * Scott Wood <scottwood@freescale.com>
- *
- * Copyright (c) 2007 Freescale Semiconductor, Inc.
- */
-
-#include "ops.h"
-#include "stdio.h"
-#include "planetcore.h"
-#include "dcr.h"
-#include "4xx.h"
-#include "io.h"
-
-static char *table;
-static u64 mem_size;
-
-static void platform_fixups(void)
-{
-	u64 val;
-	void *nvrtc;
-
-	dt_fixup_memory(0, mem_size);
-	planetcore_set_mac_addrs(table);
-
-	if (!planetcore_get_decimal(table, PLANETCORE_KEY_CRYSTAL_HZ, &val)) {
-		printf("No PlanetCore crystal frequency key.\r\n");
-		return;
-	}
-	ibm405gp_fixup_clocks(val, 0xa8c000);
-	ibm4xx_quiesce_eth((u32 *)0xef600800, NULL);
-	ibm4xx_fixup_ebc_ranges("/plb/ebc");
-
-	if (!planetcore_get_decimal(table, PLANETCORE_KEY_KB_NVRAM, &val)) {
-		printf("No PlanetCore NVRAM size key.\r\n");
-		return;
-	}
-	nvrtc = finddevice("/plb/ebc/nvrtc@4,200000");
-	if (nvrtc != NULL) {
-		u32 reg[3] = { 4, 0x200000, 0};
-		getprop(nvrtc, "reg", reg, 3);
-		reg[2] = (val << 10) & 0xffffffff;
-		setprop(nvrtc, "reg", reg, 3);
-	}
-}
-
-void platform_init(unsigned long r3, unsigned long r4, unsigned long r5,
-		   unsigned long r6, unsigned long r7)
-{
-	table = (char *)r3;
-	planetcore_prepare_table(table);
-
-	if (!planetcore_get_decimal(table, PLANETCORE_KEY_MB_RAM, &mem_size))
-		return;
-
-	mem_size *= 1024 * 1024;
-	simple_alloc_init(_end, mem_size - (unsigned long)_end, 32, 64);
-
-	fdt_init(_dtb_start);
-
-	planetcore_set_stdout_path(table);
-
-	serial_console_init();
-	platform_ops.fixups = platform_fixups;
-}
diff --git a/arch/powerpc/configs/40x/ep405_defconfig b/arch/powerpc/configs/40x/ep405_defconfig
deleted file mode 100644
index a3854cf65f8d..000000000000
--- a/arch/powerpc/configs/40x/ep405_defconfig
+++ /dev/null
@@ -1,62 +0,0 @@
-CONFIG_40x=y
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-CONFIG_KALLSYMS_ALL=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_EP405=y
-# CONFIG_WALNUT is not set
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-# CONFIG_IPV6 is not set
-CONFIG_CONNECTOR=y
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_BLOCK=m
-CONFIG_MTD_CFI=y
-CONFIG_MTD_JEDECPROBE=y
-CONFIG_MTD_CFI_AMDSTD=y
-CONFIG_MTD_PHYSMAP_OF=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=35000
-CONFIG_NETDEVICES=y
-CONFIG_IBM_EMAC=y
-# CONFIG_INPUT is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_EXTENDED=y
-CONFIG_SERIAL_8250_SHARE_IRQ=y
-CONFIG_SERIAL_OF_PLATFORM=y
-# CONFIG_HW_RANDOM is not set
-# CONFIG_HWMON is not set
-CONFIG_THERMAL=y
-CONFIG_USB=y
-CONFIG_USB_MON=y
-CONFIG_USB_OHCI_HCD=y
-CONFIG_USB_OHCI_HCD_PPC_OF_BE=y
-CONFIG_USB_OHCI_HCD_PPC_OF_LE=y
-CONFIG_EXT2_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_CRAMFS=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
-CONFIG_DEBUG_FS=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DETECT_HUNG_TASK=y
-CONFIG_CRYPTO_CBC=y
-CONFIG_CRYPTO_ECB=y
-CONFIG_CRYPTO_PCBC=y
-CONFIG_CRYPTO_MD5=y
-CONFIG_CRYPTO_DES=y
diff --git a/arch/powerpc/platforms/40x/ep405.c b/arch/powerpc/platforms/40x/ep405.c
deleted file mode 100644
index 1c8aec6e9bb7..000000000000
--- a/arch/powerpc/platforms/40x/ep405.c
+++ /dev/null
@@ -1,123 +0,0 @@
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
- * Adapted to EP405 by Ben. Herrenschmidt <benh@kernel.crashing.org>
- *
- * TODO: Wire up the PCI IRQ mux and the southbridge interrupts
- *
- * 2002 (c) MontaVista, Software, Inc.  This file is licensed under
- * the terms of the GNU General Public License version 2.  This program
- * is licensed "as is" without any warranty of any kind, whether express
- * or implied.
- */
-
-#include <linux/init.h>
-#include <linux/of_platform.h>
-
-#include <asm/machdep.h>
-#include <asm/prom.h>
-#include <asm/udbg.h>
-#include <asm/time.h>
-#include <asm/uic.h>
-#include <asm/pci-bridge.h>
-#include <asm/ppc4xx.h>
-
-static struct device_node *bcsr_node;
-static void __iomem *bcsr_regs;
-
-/* BCSR registers  */
-#define BCSR_ID			0
-#define BCSR_PCI_CTRL	       	1
-#define BCSR_FLASH_NV_POR_CTRL	2
-#define BCSR_FENET_UART_CTRL	3
-#define BCSR_PCI_IRQ		4
-#define BCSR_XIRQ_SELECT	5
-#define BCSR_XIRQ_ROUTING	6
-#define BCSR_XIRQ_STATUS	7
-#define BCSR_XIRQ_STATUS2	8
-#define BCSR_SW_STAT_LED_CTRL	9
-#define BCSR_GPIO_IRQ_PAR_CTRL	10
-/* there's more, can't be bothered typing them tho */
-
-
-static const struct of_device_id ep405_of_bus[] __initconst = {
-	{ .compatible = "ibm,plb3", },
-	{ .compatible = "ibm,opb", },
-	{ .compatible = "ibm,ebc", },
-	{},
-};
-
-static int __init ep405_device_probe(void)
-{
-	of_platform_bus_probe(NULL, ep405_of_bus, NULL);
-
-	return 0;
-}
-machine_device_initcall(ep405, ep405_device_probe);
-
-static void __init ep405_init_bcsr(void)
-{
-	const u8 *irq_routing;
-	int i;
-
-	/* Find the bloody thing & map it */
-	bcsr_node = of_find_compatible_node(NULL, NULL, "ep405-bcsr");
-	if (bcsr_node == NULL) {
-		printk(KERN_ERR "EP405 BCSR not found !\n");
-		return;
-	}
-	bcsr_regs = of_iomap(bcsr_node, 0);
-	if (bcsr_regs == NULL) {
-		printk(KERN_ERR "EP405 BCSR failed to map !\n");
-		return;
-	}
-
-	/* Get the irq-routing property and apply the routing to the CPLD */
-	irq_routing = of_get_property(bcsr_node, "irq-routing", NULL);
-	if (irq_routing == NULL)
-		return;
-	for (i = 0; i < 16; i++) {
-		u8 irq = irq_routing[i];
-		out_8(bcsr_regs + BCSR_XIRQ_SELECT, i);
-		out_8(bcsr_regs + BCSR_XIRQ_ROUTING, irq);
-	}
-	in_8(bcsr_regs + BCSR_XIRQ_SELECT);
-	mb();
-	out_8(bcsr_regs + BCSR_GPIO_IRQ_PAR_CTRL, 0xfe);
-}
-
-static void __init ep405_setup_arch(void)
-{
-	/* Find & init the BCSR CPLD */
-	ep405_init_bcsr();
-
-	pci_set_flags(PCI_REASSIGN_ALL_RSRC);
-}
-
-static int __init ep405_probe(void)
-{
-	if (!of_machine_is_compatible("ep405"))
-		return 0;
-
-	return 1;
-}
-
-define_machine(ep405) {
-	.name			= "EP405",
-	.probe			= ep405_probe,
-	.setup_arch		= ep405_setup_arch,
-	.progress		= udbg_progress,
-	.init_IRQ		= uic_init_tree,
-	.get_irq		= uic_get_irq,
-	.restart		= ppc4xx_reset_system,
-	.calibrate_decr		= generic_calibrate_decr,
-};
-- 
2.25.0

