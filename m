Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FC76A2B9F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Feb 2023 21:14:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PPHzc2V5Bz3f36
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Feb 2023 07:14:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=Ctm2T7Se;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.178.238; helo=mx0b-0064b401.pphosted.com; envelope-from=prvs=1420409688=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=Ctm2T7Se;
	dkim-atps=neutral
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PPHyf17Hkz3bhL
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Feb 2023 07:13:44 +1100 (AEDT)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31PKDV3t002291;
	Sat, 25 Feb 2023 20:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=FecT1/68NhnRt0eM1qd4YBExe+aXK0uM6tM9VWjuuG0=;
 b=Ctm2T7Se8jYaR7n5rnpUL4DmzxrEJlWa82l/9PAt5cDwS4auCTmN/2NnOibTgQJ8HmzK
 7/RnO6BJ/CaeoXi1Bcmkpjf9aBOL9da//buHy4l7vOzh8dzs9ic6A+cQ8FtCS6f6nkqt
 SduPh3tbJ7ckyLzc/2VulXcOFzeN54E8+PZh1Ile5rpxUtUiKaa70gkkCVIsvIQ7dfSh
 BgK5yahJXRLxs9MoY/OeswLEoTJbBOBztsKminIeur+v+qLdn6wOR95r4EcXyb5WjrOB
 Wpg9+UgyFPyr6VlTqwW1Zw++B+SSRdf12vU3lcLNUFGGJ2aGyqLk/K4wEQw9df8JfzvM 4w== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybmk8gs1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 25 Feb 2023 20:13:31 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Sat, 25 Feb 2023 12:13:30 -0800
Received: from sc2600cp.wrs.com (128.224.56.77) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Sat, 25 Feb 2023 12:13:29 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/3] powerpc: drop HPC II (MPC7448) evaluation platform support.
Date: Sat, 25 Feb 2023 15:13:16 -0500
Message-ID: <20230225201318.3682-2-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230225201318.3682-1-paul.gortmaker@windriver.com>
References: <20230225201318.3682-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: C2VvIsjfzbi93XuwLD2fS9ZQEHFVlWgX
X-Proofpoint-ORIG-GUID: C2VvIsjfzbi93XuwLD2fS9ZQEHFVlWgX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-25_12,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302250170
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
Cc: Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Paul Gortmaker <paul.gortmaker@windriver.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This was an interesting platform - it was the 1st instance of a
respin of earlier 130nm 74xx CPUs on 90nm and systems using MPC7448
were positioned as a rack server platform solution.

Given that, the evaluation platform (at least the one I had) was shipped
in a horizontal 1/2 height Antec desktop case with retro styling and
colours, despite the fact the docs explicitly stated that the HPC II is
not a desktop machine (noting it had no gfx or legacy PC I/O support).

Historic trivia aside, this was the 1st introduction of the e600
procfam as an evolution from the earlier G4.

However even with the claim to being "1st e600" it seems the 2005+
era was turning its attention to multicore support and from my memory
this poor guy was quickly overshadowed by the dual core MPC8641D.

All that aside, we are once again looking at 15+ year old evaluation
platforms that were not widely distributed, so 2023 removal makes sense.

Cc: Scott Wood <oss@buserror.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/powerpc/boot/Makefile                    |   3 +-
 arch/powerpc/boot/cuboot-mpc7448hpc2.c        |  43 ----
 arch/powerpc/boot/dts/mpc7448hpc2.dts         | 192 -----------------
 arch/powerpc/configs/mpc7448_hpc2_defconfig   |  54 -----
 arch/powerpc/platforms/embedded6xx/Kconfig    |  10 -
 arch/powerpc/platforms/embedded6xx/Makefile   |   1 -
 .../platforms/embedded6xx/mpc7448_hpc2.c      | 198 ------------------
 7 files changed, 1 insertion(+), 500 deletions(-)
 delete mode 100644 arch/powerpc/boot/cuboot-mpc7448hpc2.c
 delete mode 100644 arch/powerpc/boot/dts/mpc7448hpc2.dts
 delete mode 100644 arch/powerpc/configs/mpc7448_hpc2_defconfig
 delete mode 100644 arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index d386b80ce43b..ee4bc6621f2f 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -164,7 +164,7 @@ src-plat-$(CONFIG_PPC_MPC52xx) += cuboot-52xx.c
 src-plat-$(CONFIG_PPC_82xx) += cuboot-pq2.c fixed-head.S ep8248e.c cuboot-824x.c
 src-plat-$(CONFIG_PPC_83xx) += cuboot-83xx.c fixed-head.S redboot-83xx.c
 src-plat-$(CONFIG_FSL_SOC_BOOKE) += cuboot-85xx.c cuboot-85xx-cpm2.c
-src-plat-$(CONFIG_EMBEDDED6xx) += cuboot-pq2.c cuboot-mpc7448hpc2.c \
+src-plat-$(CONFIG_EMBEDDED6xx) += cuboot-pq2.c \
 					gamecube-head.S gamecube.c \
 					wii-head.S wii.c holly.c \
 					fixed-head.S mvme5100.c
@@ -350,7 +350,6 @@ image-$(CONFIG_MVME7100)                += dtbImage.mvme7100
 
 # Board ports in arch/powerpc/platform/embedded6xx/Kconfig
 image-$(CONFIG_STORCENTER)		+= cuImage.storcenter
-image-$(CONFIG_MPC7448HPC2)		+= cuImage.mpc7448hpc2
 image-$(CONFIG_GAMECUBE)		+= dtbImage.gamecube
 image-$(CONFIG_WII)			+= dtbImage.wii
 image-$(CONFIG_MVME5100)		+= dtbImage.mvme5100
diff --git a/arch/powerpc/boot/cuboot-mpc7448hpc2.c b/arch/powerpc/boot/cuboot-mpc7448hpc2.c
deleted file mode 100644
index 335fb65212e7..000000000000
--- a/arch/powerpc/boot/cuboot-mpc7448hpc2.c
+++ /dev/null
@@ -1,43 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2007 Freescale Semiconductor, Inc. All rights reserved.
- *
- * Author: Roy Zang <tie-fei.zang@freescale.com>
- *
- * Description:
- * Old U-boot compatibility for mpc7448hpc2 board
- * Based on the code of Scott Wood <scottwood@freescale.com>
- * for 83xx and 85xx.
- */
-
-#include "ops.h"
-#include "stdio.h"
-#include "cuboot.h"
-
-#define TARGET_HAS_ETH1
-#include "ppcboot.h"
-
-static bd_t bd;
-extern char _dtb_start[], _dtb_end[];
-
-static void platform_fixups(void)
-{
-	void *tsi;
-
-	dt_fixup_memory(bd.bi_memstart, bd.bi_memsize);
-	dt_fixup_mac_addresses(bd.bi_enetaddr, bd.bi_enet1addr);
-	dt_fixup_cpu_clocks(bd.bi_intfreq, bd.bi_busfreq / 4, bd.bi_busfreq);
-	tsi = find_node_by_devtype(NULL, "tsi-bridge");
-	if (tsi)
-		setprop(tsi, "bus-frequency", &bd.bi_busfreq,
-			sizeof(bd.bi_busfreq));
-}
-
-void platform_init(unsigned long r3, unsigned long r4, unsigned long r5,
-		unsigned long r6, unsigned long r7)
-{
-	CUBOOT_INIT();
-	fdt_init(_dtb_start);
-	serial_console_init();
-	platform_ops.fixups = platform_fixups;
-}
diff --git a/arch/powerpc/boot/dts/mpc7448hpc2.dts b/arch/powerpc/boot/dts/mpc7448hpc2.dts
deleted file mode 100644
index 9494af160e95..000000000000
--- a/arch/powerpc/boot/dts/mpc7448hpc2.dts
+++ /dev/null
@@ -1,192 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MPC7448HPC2 (Taiga) board Device Tree Source
- *
- * Copyright 2006, 2008 Freescale Semiconductor Inc.
- * 2006 Roy Zang <Roy Zang at freescale.com>.
- */
-
-/dts-v1/;
-
-/ {
-	model = "mpc7448hpc2";
-	compatible = "mpc74xx";
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	aliases {
-		ethernet0 = &enet0;
-		ethernet1 = &enet1;
-
-		serial0 = &serial0;
-		serial1 = &serial1;
-
-		pci0 = &pci0;
-	};
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells =<0>;
-				
-		PowerPC,7448@0 {
-			device_type = "cpu";
-			reg = <0x0>;
-			d-cache-line-size = <32>;	// 32 bytes
-			i-cache-line-size = <32>;	// 32 bytes
-			d-cache-size = <0x8000>;		// L1, 32K bytes
-			i-cache-size = <0x8000>;		// L1, 32K bytes
-			timebase-frequency = <0>;	// 33 MHz, from uboot
-			clock-frequency = <0>;		// From U-Boot
-			bus-frequency = <0>;		// From U-Boot
-		};
-	};
-
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x20000000	// DDR2   512M at 0
-		       >;
-	};
-
-  	tsi108@c0000000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		device_type = "tsi-bridge";
-		ranges = <0x0 0xc0000000 0x10000>;
-		reg = <0xc0000000 0x10000>;
-		bus-frequency = <0>;
-
-		i2c@7000 {
-			interrupt-parent = <&mpic>;
-			interrupts = <14 0>;
-			reg = <0x7000 0x400>;
-			device_type = "i2c";
-			compatible  = "tsi108-i2c";
-		};
-
-		MDIO: mdio@6000 {
-			compatible = "tsi108-mdio";
-			reg = <0x6000 0x50>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			phy8: ethernet-phy@8 {
-				interrupt-parent = <&mpic>;
-				interrupts = <2 1>;
-				reg = <0x8>;
-			};
-
-			phy9: ethernet-phy@9 {
-				interrupt-parent = <&mpic>;
-				interrupts = <2 1>;
-				reg = <0x9>;
-			};
-
-		};
-
-		enet0: ethernet@6200 {
-			linux,network-index = <0>;
-			#size-cells = <0>;
-			device_type = "network";
-			compatible = "tsi108-ethernet";
-			reg = <0x6000 0x200>;
-			address = [ 00 06 D2 00 00 01 ];
-			interrupts = <16 2>;
-			interrupt-parent = <&mpic>;
-			mdio-handle = <&MDIO>;
-			phy-handle = <&phy8>;
-		};
-
-		enet1: ethernet@6600 {
-			linux,network-index = <1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			device_type = "network";
-			compatible = "tsi108-ethernet";
-			reg = <0x6400 0x200>;
-			address = [ 00 06 D2 00 00 02 ];
-			interrupts = <17 2>;
-			interrupt-parent = <&mpic>;
-			mdio-handle = <&MDIO>;
-			phy-handle = <&phy9>;
-		};
-
-		serial0: serial@7808 {
-			device_type = "serial";
-			compatible = "ns16550";
-			reg = <0x7808 0x200>;
-			clock-frequency = <1064000000>;
-			interrupts = <12 0>;
-			interrupt-parent = <&mpic>;
-		};
-
-		serial1: serial@7c08 {
-			device_type = "serial";
-			compatible = "ns16550";
-			reg = <0x7c08 0x200>;
-			clock-frequency = <1064000000>;
-			interrupts = <13 0>;
-			interrupt-parent = <&mpic>;
-		};
-
-	  	mpic: pic@7400 {
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <2>;
-			reg = <0x7400 0x400>;
-			compatible = "chrp,open-pic";
-			device_type = "open-pic";
-		};
-		pci0: pci@1000 {
-			compatible = "tsi108-pci";
-			device_type = "pci";
-			#interrupt-cells = <1>;
-			#size-cells = <2>;
-			#address-cells = <3>;
-			reg = <0x1000 0x1000>;
-			bus-range = <0 0>;
-			ranges = <0x2000000 0x0 0xe0000000 0xe0000000 0x0 0x1a000000	
-				  0x1000000 0x0 0x0 0xfa000000 0x0 0x10000>;
-			clock-frequency = <133333332>;
-			interrupt-parent = <&mpic>;
-			interrupts = <23 2>;
-			interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
-			interrupt-map = <
-
-				/* IDSEL 0x11 */
-				0x800 0x0 0x0 0x1 &RT0 0x24 0x0
-				0x800 0x0 0x0 0x2 &RT0 0x25 0x0
-				0x800 0x0 0x0 0x3 &RT0 0x26 0x0
-				0x800 0x0 0x0 0x4 &RT0 0x27 0x0
-
-				/* IDSEL 0x12 */
-				0x1000 0x0 0x0 0x1 &RT0 0x25 0x0
-				0x1000 0x0 0x0 0x2 &RT0 0x26 0x0
-				0x1000 0x0 0x0 0x3 &RT0 0x27 0x0
-				0x1000 0x0 0x0 0x4 &RT0 0x24 0x0
-
-				/* IDSEL 0x13 */
-				0x1800 0x0 0x0 0x1 &RT0 0x26 0x0
-				0x1800 0x0 0x0 0x2 &RT0 0x27 0x0
-				0x1800 0x0 0x0 0x3 &RT0 0x24 0x0
-				0x1800 0x0 0x0 0x4 &RT0 0x25 0x0
-
-				/* IDSEL 0x14 */
-				0x2000 0x0 0x0 0x1 &RT0 0x27 0x0
-				0x2000 0x0 0x0 0x2 &RT0 0x24 0x0
-				0x2000 0x0 0x0 0x3 &RT0 0x25 0x0
-				0x2000 0x0 0x0 0x4 &RT0 0x26 0x0
-				>;
-
-			RT0: router@1180 {
-				clock-frequency = <0>;
-				interrupt-controller;
-				device_type = "pic-router";
-				#address-cells = <0>;
-				#interrupt-cells = <2>;
-				big-endian;
-				interrupts = <23 2>;
-				interrupt-parent = <&mpic>;
-			};
-		};
-	};
-};
diff --git a/arch/powerpc/configs/mpc7448_hpc2_defconfig b/arch/powerpc/configs/mpc7448_hpc2_defconfig
deleted file mode 100644
index 19406a6c2648..000000000000
--- a/arch/powerpc/configs/mpc7448_hpc2_defconfig
+++ /dev/null
@@ -1,54 +0,0 @@
-CONFIG_ALTIVEC=y
-CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_PARTITION_ADVANCED=y
-# CONFIG_PPC_CHRP is not set
-# CONFIG_PPC_PMAC is not set
-CONFIG_EMBEDDED6xx=y
-CONFIG_MPC7448HPC2=y
-CONFIG_GEN_RTC=y
-CONFIG_BINFMT_MISC=y
-# CONFIG_SECCOMP is not set
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_XFRM_USER=y
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_SYN_COOKIES=y
-# CONFIG_IPV6 is not set
-# CONFIG_FW_LOADER is not set
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=131072
-CONFIG_BLK_DEV_SD=y
-CONFIG_ATA=y
-CONFIG_SATA_MV=y
-CONFIG_NETDEVICES=y
-CONFIG_E100=y
-CONFIG_8139TOO=y
-# CONFIG_8139TOO_PIO is not set
-CONFIG_TSI108_ETH=y
-CONFIG_PHYLIB=y
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-# CONFIG_HW_RANDOM is not set
-CONFIG_EXT2_FS=y
-CONFIG_EXT4_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
-CONFIG_CRC_T10DIF=y
diff --git a/arch/powerpc/platforms/embedded6xx/Kconfig b/arch/powerpc/platforms/embedded6xx/Kconfig
index c54786f8461e..a57424d6ef20 100644
--- a/arch/powerpc/platforms/embedded6xx/Kconfig
+++ b/arch/powerpc/platforms/embedded6xx/Kconfig
@@ -29,16 +29,6 @@ config STORCENTER
 	  Select STORCENTER if configuring for the iomega StorCenter
 	  with an 8241 CPU in it.
 
-config MPC7448HPC2
-	bool "Freescale MPC7448HPC2(Taiga)"
-	depends on EMBEDDED6xx
-	select TSI108_BRIDGE
-	select DEFAULT_UIMAGE
-	select PPC_UDBG_16550
-	help
-	  Select MPC7448HPC2 if configuring for Freescale MPC7448HPC2 (Taiga)
-	  platform
-
 config PPC_HOLLY
 	bool "PPC750GX/CL with TSI10x bridge (Hickory/Holly)"
 	depends on EMBEDDED6xx
diff --git a/arch/powerpc/platforms/embedded6xx/Makefile b/arch/powerpc/platforms/embedded6xx/Makefile
index e656ae9f23c6..7f2a8154e5a0 100644
--- a/arch/powerpc/platforms/embedded6xx/Makefile
+++ b/arch/powerpc/platforms/embedded6xx/Makefile
@@ -2,7 +2,6 @@
 #
 # Makefile for the 6xx/7xx/7xxxx linux kernel.
 #
-obj-$(CONFIG_MPC7448HPC2)	+= mpc7448_hpc2.o
 obj-$(CONFIG_LINKSTATION)	+= linkstation.o ls_uart.o
 obj-$(CONFIG_STORCENTER)	+= storcenter.o
 obj-$(CONFIG_PPC_HOLLY)		+= holly.o
diff --git a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
deleted file mode 100644
index ddf0c652af80..000000000000
--- a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
+++ /dev/null
@@ -1,198 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * mpc7448_hpc2.c
- *
- * Board setup routines for the Freescale mpc7448hpc2(taiga) platform
- *
- * Author: Jacob Pan
- *	 jacob.pan@freescale.com
- * Author: Xianghua Xiao
- *       x.xiao@freescale.com
- * Maintainer: Roy Zang <tie-fei.zang@freescale.com>
- * 	Add Flat Device Tree support fot mpc7448hpc2 board
- *
- * Copyright 2004-2006 Freescale Semiconductor, Inc.
- */
-
-#include <linux/stddef.h>
-#include <linux/kernel.h>
-#include <linux/pci.h>
-#include <linux/kdev_t.h>
-#include <linux/console.h>
-#include <linux/extable.h>
-#include <linux/delay.h>
-#include <linux/irq.h>
-#include <linux/seq_file.h>
-#include <linux/root_dev.h>
-#include <linux/serial.h>
-#include <linux/tty.h>
-#include <linux/serial_core.h>
-#include <linux/of_irq.h>
-
-#include <asm/time.h>
-#include <asm/machdep.h>
-#include <asm/udbg.h>
-#include <asm/tsi108.h>
-#include <asm/pci-bridge.h>
-#include <asm/reg.h>
-#include <mm/mmu_decl.h>
-#include <asm/tsi108_pci.h>
-#include <asm/tsi108_irq.h>
-#include <asm/mpic.h>
-
-#undef DEBUG
-#ifdef DEBUG
-#define DBG(fmt...) do { printk(fmt); } while(0)
-#else
-#define DBG(fmt...) do { } while(0)
-#endif
-
-#define MPC7448HPC2_PCI_CFG_PHYS 0xfb000000
-
-int mpc7448_hpc2_exclude_device(struct pci_controller *hose,
-				u_char bus, u_char devfn)
-{
-	if (bus == 0 && PCI_SLOT(devfn) == 0)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-	else
-		return PCIBIOS_SUCCESSFUL;
-}
-
-static void __init mpc7448_hpc2_setup_pci(void)
-{
-#ifdef CONFIG_PCI
-	struct device_node *np;
-	if (ppc_md.progress)
-		ppc_md.progress("mpc7448_hpc2_setup_pci():set_bridge", 0);
-
-	/* setup PCI host bridge */
-	for_each_compatible_node(np, "pci", "tsi108-pci")
-		tsi108_setup_pci(np, MPC7448HPC2_PCI_CFG_PHYS, 0);
-
-	ppc_md.pci_exclude_device = mpc7448_hpc2_exclude_device;
-	if (ppc_md.progress)
-		ppc_md.progress("tsi108: resources set", 0x100);
-#endif
-}
-
-static void __init mpc7448_hpc2_setup_arch(void)
-{
-	tsi108_csr_vir_base = get_vir_csrbase();
-
-	printk(KERN_INFO "MPC7448HPC2 (TAIGA) Platform\n");
-	printk(KERN_INFO
-	       "Jointly ported by Freescale and Tundra Semiconductor\n");
-	printk(KERN_INFO
-	       "Enabling L2 cache then enabling the HID0 prefetch engine.\n");
-}
-
-/*
- * Interrupt setup and service.  Interrupts on the mpc7448_hpc2 come
- * from the four external INT pins, PCI interrupts are routed via
- * PCI interrupt control registers, it generates internal IRQ23
- *
- * Interrupt routing on the Taiga Board:
- * TSI108:PB_INT[0] -> CPU0:INT#
- * TSI108:PB_INT[1] -> CPU0:MCP#
- * TSI108:PB_INT[2] -> N/C
- * TSI108:PB_INT[3] -> N/C
- */
-static void __init mpc7448_hpc2_init_IRQ(void)
-{
-	struct mpic *mpic;
-#ifdef CONFIG_PCI
-	unsigned int cascade_pci_irq;
-	struct device_node *tsi_pci;
-	struct device_node *cascade_node = NULL;
-#endif
-
-	mpic = mpic_alloc(NULL, 0, MPIC_BIG_ENDIAN |
-			MPIC_SPV_EOI | MPIC_NO_PTHROU_DIS | MPIC_REGSET_TSI108,
-			24, 0,
-			"Tsi108_PIC");
-
-	BUG_ON(mpic == NULL);
-
-	mpic_assign_isu(mpic, 0, mpic->paddr + 0x100);
-
-	mpic_init(mpic);
-
-#ifdef CONFIG_PCI
-	tsi_pci = of_find_node_by_type(NULL, "pci");
-	if (tsi_pci == NULL) {
-		printk("%s: No tsi108 pci node found !\n", __func__);
-		return;
-	}
-	cascade_node = of_find_node_by_type(NULL, "pic-router");
-	if (cascade_node == NULL) {
-		printk("%s: No tsi108 pci cascade node found !\n", __func__);
-		return;
-	}
-
-	cascade_pci_irq = irq_of_parse_and_map(tsi_pci, 0);
-	DBG("%s: tsi108 cascade_pci_irq = 0x%x\n", __func__,
-	    (u32) cascade_pci_irq);
-	tsi108_pci_int_init(cascade_node);
-	irq_set_handler_data(cascade_pci_irq, mpic);
-	irq_set_chained_handler(cascade_pci_irq, tsi108_irq_cascade);
-
-	of_node_put(tsi_pci);
-	of_node_put(cascade_node);
-#endif
-	/* Configure MPIC outputs to CPU0 */
-	tsi108_write_reg(TSI108_MPIC_OFFSET + 0x30c, 0);
-}
-
-void mpc7448_hpc2_show_cpuinfo(struct seq_file *m)
-{
-	seq_printf(m, "vendor\t\t: Freescale Semiconductor\n");
-}
-
-static void __noreturn mpc7448_hpc2_restart(char *cmd)
-{
-	local_irq_disable();
-
-	/* Set exception prefix high - to the firmware */
-	mtmsr(mfmsr() | MSR_IP);
-	isync();
-
-	for (;;) ;		/* Spin until reset happens */
-}
-
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init mpc7448_hpc2_probe(void)
-{
-	if (!of_machine_is_compatible("mpc74xx"))
-		return 0;
-	return 1;
-}
-
-static int mpc7448_machine_check_exception(struct pt_regs *regs)
-{
-	const struct exception_table_entry *entry;
-
-	/* Are we prepared to handle this fault */
-	if ((entry = search_exception_tables(regs->nip)) != NULL) {
-		tsi108_clear_pci_cfg_error();
-		regs_set_recoverable(regs);
-		regs_set_return_ip(regs, extable_fixup(entry));
-		return 1;
-	}
-	return 0;
-}
-
-define_machine(mpc7448_hpc2){
-	.name 			= "MPC7448 HPC2",
-	.probe 			= mpc7448_hpc2_probe,
-	.setup_arch 		= mpc7448_hpc2_setup_arch,
-	.discover_phbs		= mpc7448_hpc2_setup_pci,
-	.init_IRQ 		= mpc7448_hpc2_init_IRQ,
-	.show_cpuinfo 		= mpc7448_hpc2_show_cpuinfo,
-	.get_irq 		= mpic_get_irq,
-	.restart 		= mpc7448_hpc2_restart,
-	.calibrate_decr 	= generic_calibrate_decr,
-	.machine_check_exception= mpc7448_machine_check_exception,
-	.progress 		= udbg_progress,
-};
-- 
2.17.1

