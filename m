Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 275976A234D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 21:54:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNhvT6l5bz3fGT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Feb 2023 07:53:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=rvEKkyK2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.178.238; helo=mx0b-0064b401.pphosted.com; envelope-from=prvs=14196aa554=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=rvEKkyK2;
	dkim-atps=neutral
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNhqT2D14z3cJK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Feb 2023 07:50:28 +1100 (AEDT)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31OJq4vm006931;
	Fri, 24 Feb 2023 20:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=vvQLtgJ1GUw0bMDVkEphRmoXdsEB+vhfu1khl/UMQxc=;
 b=rvEKkyK2ts9wh/sbGx3yk0y/1cSfsNTf03YubpO+jMesCTW1KPSYZTCZTc16f4MGGRYZ
 4wU/IbF0Ath5g8bwKT1hr6DxjPphRGSzYiR0lIF66vFNsq0iNh1Q2onifvkCxvzRXlNd
 4kOpBrrdzvYayRT/VetIkcFgyjVQtwSe3g4DYETY+Hudv2MaweVatkCPZ4uNC5eB8Lac
 0w4RbnhQRDBzYFKKq6zlkY0/F0IzHKQkaZlcu3BR4aeiV4DhisJGLJA7lpapBHXPQIYj
 8FloGgbqqFKlyn2gQPhwiNa/occ4ixsDftw0taQ6Gki+w5G7UqHvfo4WjIHgPYrPioHY +A== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpem66vb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 24 Feb 2023 20:50:13 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Fri, 24 Feb 2023 12:50:12 -0800
Received: from sc2600cp.wrs.com (128.224.56.77) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Fri, 24 Feb 2023 12:50:11 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/3] powerpc: drop MPC8272_ADS platform support
Date: Fri, 24 Feb 2023 15:49:57 -0500
Message-ID: <20230224204959.17425-2-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230224204959.17425-1-paul.gortmaker@windriver.com>
References: <20230224204959.17425-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: WUvuwSYcIy25nzNolbkIz4Yc-A25LuUI
X-Proofpoint-GUID: WUvuwSYcIy25nzNolbkIz4Yc-A25LuUI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_15,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302240165
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

The MPC8272-ADS also supported other 82xx CPU variants, had 64MB RAM,
8MB flash, and like the 85xx ADS platforms, was on a fairly large PCB
in order to have space for breakout connectors for all the features.

These 82xx platforms are two decades old, and originally made for a
small group of industry related people in order to assist in new OEM
board designs.  Given that, it makes sense to remove support today.

Cc: Scott Wood <oss@buserror.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/powerpc/boot/Makefile                 |   1 -
 arch/powerpc/boot/dts/mpc8272ads.dts       | 263 ---------------------
 arch/powerpc/configs/mpc8272_ads_defconfig |  79 -------
 arch/powerpc/configs/ppc6xx_defconfig      |   1 -
 arch/powerpc/platforms/82xx/Kconfig        |  11 -
 arch/powerpc/platforms/82xx/Makefile       |   1 -
 arch/powerpc/platforms/82xx/mpc8272_ads.c  | 213 -----------------
 7 files changed, 569 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/mpc8272ads.dts
 delete mode 100644 arch/powerpc/configs/mpc8272_ads_defconfig
 delete mode 100644 arch/powerpc/platforms/82xx/mpc8272_ads.c

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index e236ab395335..38ee7e58f8e7 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -327,7 +327,6 @@ image-$(CONFIG_PPC_LITE5200)		+= cuImage.lite5200b
 image-$(CONFIG_PPC_MEDIA5200)		+= cuImage.media5200
 
 # Board ports in arch/powerpc/platform/82xx/Kconfig
-image-$(CONFIG_MPC8272_ADS)		+= cuImage.mpc8272ads
 image-$(CONFIG_PQ2FADS)			+= cuImage.pq2fads
 image-$(CONFIG_EP8248E)			+= dtbImage.ep8248e
 
diff --git a/arch/powerpc/boot/dts/mpc8272ads.dts b/arch/powerpc/boot/dts/mpc8272ads.dts
deleted file mode 100644
index 13ec786f6adf..000000000000
--- a/arch/powerpc/boot/dts/mpc8272ads.dts
+++ /dev/null
@@ -1,263 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MPC8272 ADS Device Tree Source
- *
- * Copyright 2005,2008 Freescale Semiconductor Inc.
- */
-
-/dts-v1/;
-
-/ {
-	model = "MPC8272ADS";
-	compatible = "fsl,mpc8272ads";
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	aliases {
-		ethernet0 = &eth0;
-		ethernet1 = &eth1;
-		serial0 = &scc1;
-		serial1 = &scc4;
-	};
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		PowerPC,8272@0 {
-			device_type = "cpu";
-			reg = <0x0>;
-			d-cache-line-size = <32>;
-			i-cache-line-size = <32>;
-			d-cache-size = <16384>;
-			i-cache-size = <16384>;
-			timebase-frequency = <0>;
-			bus-frequency = <0>;
-			clock-frequency = <0>;
-		};
-	};
-
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x0>;
-	};
-
-	localbus@f0010100 {
-		compatible = "fsl,mpc8272-localbus",
-		             "fsl,pq2-localbus";
-		#address-cells = <2>;
-		#size-cells = <1>;
-		reg = <0xf0010100 0x40>;
-
-		ranges = <0x0 0x0 0xff800000 0x00800000
-		          0x1 0x0 0xf4500000 0x8000
-		          0x3 0x0 0xf8200000 0x8000>;
-
-		flash@0,0 {
-			compatible = "jedec-flash";
-			reg = <0x0 0x0 0x00800000>;
-			bank-width = <4>;
-			device-width = <1>;
-		};
-
-		board-control@1,0 {
-			reg = <0x1 0x0 0x20>;
-			compatible = "fsl,mpc8272ads-bcsr";
-		};
-
-		PCI_PIC: interrupt-controller@3,0 {
-			compatible = "fsl,mpc8272ads-pci-pic",
-			             "fsl,pq2ads-pci-pic";
-			#interrupt-cells = <1>;
-			interrupt-controller;
-			reg = <0x3 0x0 0x8>;
-			interrupt-parent = <&PIC>;
-			interrupts = <20 8>;
-		};
-	};
-
-
-	pci@f0010800 {
-		device_type = "pci";
-		reg = <0xf0010800 0x10c 0xf00101ac 0x8 0xf00101c4 0x8>;
-		compatible = "fsl,mpc8272-pci", "fsl,pq2-pci";
-		#interrupt-cells = <1>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		clock-frequency = <66666666>;
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
-		interrupt-map = <
-		                 /* IDSEL 0x16 */
-		                 0xb000 0x0 0x0 0x1 &PCI_PIC 0
-		                 0xb000 0x0 0x0 0x2 &PCI_PIC 1
-		                 0xb000 0x0 0x0 0x3 &PCI_PIC 2
-		                 0xb000 0x0 0x0 0x4 &PCI_PIC 3
-
-		                 /* IDSEL 0x17 */
-		                 0xb800 0x0 0x0 0x1 &PCI_PIC 4
-		                 0xb800 0x0 0x0 0x2 &PCI_PIC 5
-		                 0xb800 0x0 0x0 0x3 &PCI_PIC 6
-		                 0xb800 0x0 0x0 0x4 &PCI_PIC 7
-
-		                 /* IDSEL 0x18 */
-		                 0xc000 0x0 0x0 0x1 &PCI_PIC 8
-		                 0xc000 0x0 0x0 0x2 &PCI_PIC 9
-		                 0xc000 0x0 0x0 0x3 &PCI_PIC 10
-		                 0xc000 0x0 0x0 0x4 &PCI_PIC 11>;
-
-		interrupt-parent = <&PIC>;
-		interrupts = <18 8>;
-		ranges = <0x42000000 0x0 0x80000000 0x80000000 0x0 0x20000000
-		          0x2000000 0x0 0xa0000000 0xa0000000 0x0 0x20000000
-		          0x1000000 0x0 0x0 0xf6000000 0x0 0x2000000>;
-	};
-
-	soc@f0000000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		device_type = "soc";
-		compatible = "fsl,mpc8272", "fsl,pq2-soc";
-		ranges = <0x0 0xf0000000 0x53000>;
-
-		// Temporary -- will go away once kernel uses ranges for get_immrbase().
-		reg = <0xf0000000 0x53000>;
-
-		cpm@119c0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,mpc8272-cpm", "fsl,cpm2";
-			reg = <0x119c0 0x30>;
-			ranges;
-
-			muram@0 {
-				#address-cells = <1>;
-				#size-cells = <1>;
-				ranges = <0x0 0x0 0x10000>;
-
-				data@0 {
-					compatible = "fsl,cpm-muram-data";
-					reg = <0x0 0x2000 0x9800 0x800>;
-				};
-			};
-
-			brg@119f0 {
-				compatible = "fsl,mpc8272-brg",
-				             "fsl,cpm2-brg",
-				             "fsl,cpm-brg";
-				reg = <0x119f0 0x10 0x115f0 0x10>;
-			};
-
-			scc1: serial@11a00 {
-				device_type = "serial";
-				compatible = "fsl,mpc8272-scc-uart",
-				             "fsl,cpm2-scc-uart";
-				reg = <0x11a00 0x20 0x8000 0x100>;
-				interrupts = <40 8>;
-				interrupt-parent = <&PIC>;
-				fsl,cpm-brg = <1>;
-				fsl,cpm-command = <0x800000>;
-			};
-
-			scc4: serial@11a60 {
-				device_type = "serial";
-				compatible = "fsl,mpc8272-scc-uart",
-				             "fsl,cpm2-scc-uart";
-				reg = <0x11a60 0x20 0x8300 0x100>;
-				interrupts = <43 8>;
-				interrupt-parent = <&PIC>;
-				fsl,cpm-brg = <4>;
-				fsl,cpm-command = <0xce00000>;
-			};
-
-			usb@11b60 {
-				compatible = "fsl,mpc8272-cpm-usb";
-				reg = <0x11b60 0x40 0x8b00 0x100>;
-				interrupts = <11 8>;
-				interrupt-parent = <&PIC>;
-				mode = "peripheral";
-			};
-
-			mdio@10d40 {
-				compatible = "fsl,mpc8272ads-mdio-bitbang",
-				             "fsl,mpc8272-mdio-bitbang",
-				             "fsl,cpm2-mdio-bitbang";
-				reg = <0x10d40 0x14>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				fsl,mdio-pin = <18>;
-				fsl,mdc-pin = <19>;
-
-				PHY0: ethernet-phy@0 {
-					interrupt-parent = <&PIC>;
-					interrupts = <23 8>;
-					reg = <0x0>;
-				};
-
-				PHY1: ethernet-phy@1 {
-					interrupt-parent = <&PIC>;
-					interrupts = <23 8>;
-					reg = <0x3>;
-				};
-			};
-
-			eth0: ethernet@11300 {
-				device_type = "network";
-				compatible = "fsl,mpc8272-fcc-enet",
-				             "fsl,cpm2-fcc-enet";
-				reg = <0x11300 0x20 0x8400 0x100 0x11390 0x1>;
-				local-mac-address = [ 00 00 00 00 00 00 ];
-				interrupts = <32 8>;
-				interrupt-parent = <&PIC>;
-				phy-handle = <&PHY0>;
-				linux,network-index = <0>;
-				fsl,cpm-command = <0x12000300>;
-			};
-
-			eth1: ethernet@11320 {
-				device_type = "network";
-				compatible = "fsl,mpc8272-fcc-enet",
-				             "fsl,cpm2-fcc-enet";
-				reg = <0x11320 0x20 0x8500 0x100 0x113b0 0x1>;
-				local-mac-address = [ 00 00 00 00 00 00 ];
-				interrupts = <33 8>;
-				interrupt-parent = <&PIC>;
-				phy-handle = <&PHY1>;
-				linux,network-index = <1>;
-				fsl,cpm-command = <0x16200300>;
-			};
-
-			i2c@11860 {
-				compatible = "fsl,mpc8272-i2c",
-					     "fsl,cpm2-i2c";
-				reg = <0x11860 0x20 0x8afc 0x2>;
-				interrupts = <1 8>;
-				interrupt-parent = <&PIC>;
-				fsl,cpm-command = <0x29600000>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-			};
-		};
-
-		PIC: interrupt-controller@10c00 {
-			#interrupt-cells = <2>;
-			interrupt-controller;
-			reg = <0x10c00 0x80>;
-			compatible = "fsl,mpc8272-pic", "fsl,cpm2-pic";
-		};
-
-		crypto@30000 {
-			compatible = "fsl,sec1.0";
-			reg = <0x40000 0x13000>;
-			interrupts = <47 0x8>;
-			interrupt-parent = <&PIC>;
-			fsl,num-channels = <4>;
-			fsl,channel-fifo-len = <24>;
-			fsl,exec-units-mask = <0x7e>;
-			fsl,descriptor-types-mask = <0x1010415>;
-		};
-	};
-
-	chosen {
-		stdout-path = "/soc/cpm/serial@11a00";
-	};
-};
diff --git a/arch/powerpc/configs/mpc8272_ads_defconfig b/arch/powerpc/configs/mpc8272_ads_defconfig
deleted file mode 100644
index 4145ef5689ca..000000000000
--- a/arch/powerpc/configs/mpc8272_ads_defconfig
+++ /dev/null
@@ -1,79 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_EXPERT=y
-CONFIG_KALLSYMS_ALL=y
-CONFIG_PARTITION_ADVANCED=y
-# CONFIG_PPC_CHRP is not set
-# CONFIG_PPC_PMAC is not set
-CONFIG_PPC_82xx=y
-CONFIG_MPC8272_ADS=y
-CONFIG_BINFMT_MISC=y
-CONFIG_PCI=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_SYN_COOKIES=y
-CONFIG_NETFILTER=y
-# CONFIG_FW_LOADER is not set
-CONFIG_MTD=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_JEDECPROBE=y
-CONFIG_MTD_CFI_ADV_OPTIONS=y
-CONFIG_MTD_CFI_GEOMETRY=y
-# CONFIG_MTD_MAP_BANK_WIDTH_1 is not set
-# CONFIG_MTD_MAP_BANK_WIDTH_2 is not set
-# CONFIG_MTD_CFI_I1 is not set
-# CONFIG_MTD_CFI_I2 is not set
-CONFIG_MTD_CFI_I4=y
-CONFIG_MTD_CFI_INTELEXT=y
-CONFIG_MTD_PHYSMAP_OF=y
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_NETDEVICES=y
-CONFIG_TUN=y
-CONFIG_FS_ENET=y
-# CONFIG_FS_ENET_HAS_SCC is not set
-CONFIG_FS_ENET_MDIO_FCC=y
-CONFIG_DAVICOM_PHY=y
-CONFIG_PPP=y
-CONFIG_PPP_DEFLATE=y
-CONFIG_PPP_ASYNC=y
-CONFIG_PPP_SYNC_TTY=y
-CONFIG_INPUT_EVDEV=y
-# CONFIG_VT is not set
-CONFIG_SERIAL_CPM=y
-CONFIG_SERIAL_CPM_CONSOLE=y
-# CONFIG_HWMON is not set
-# CONFIG_USB_SUPPORT is not set
-CONFIG_EXT2_FS=y
-CONFIG_EXT4_FS=y
-CONFIG_AUTOFS4_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_CRAMFS=y
-CONFIG_NFS_FS=y
-CONFIG_NFS_V3_ACL=y
-CONFIG_ROOT_NFS=y
-CONFIG_NLS=y
-CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_ASCII=y
-CONFIG_NLS_ISO8859_1=y
-CONFIG_NLS_UTF8=y
-CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DETECT_HUNG_TASK=y
-CONFIG_BDI_SWITCH=y
-CONFIG_CRYPTO_CBC=y
-CONFIG_CRYPTO_ECB=y
-CONFIG_CRYPTO_PCBC=y
-CONFIG_CRYPTO_MD5=y
-CONFIG_CRYPTO_DES=y
-# CONFIG_CRYPTO_HW is not set
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index a1f6c5f39ccf..6dfe8f90228f 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -38,7 +38,6 @@ CONFIG_PPC_MPC52xx=y
 CONFIG_PPC_EFIKA=y
 CONFIG_PPC_MPC5200_BUGFIX=y
 CONFIG_PPC_82xx=y
-CONFIG_MPC8272_ADS=y
 CONFIG_PQ2FADS=y
 CONFIG_EP8248E=y
 CONFIG_MGCOGE=y
diff --git a/arch/powerpc/platforms/82xx/Kconfig b/arch/powerpc/platforms/82xx/Kconfig
index 1af81de1c4e6..6de033c82960 100644
--- a/arch/powerpc/platforms/82xx/Kconfig
+++ b/arch/powerpc/platforms/82xx/Kconfig
@@ -5,17 +5,6 @@ menuconfig PPC_82xx
 
 if PPC_82xx
 
-config MPC8272_ADS
-	bool "Freescale MPC8272 ADS"
-	select DEFAULT_UIMAGE
-	select PQ2ADS
-	select 8272
-	select 8260
-	select FSL_SOC
-	select PQ2_ADS_PCI_PIC if PCI
-	help
-	  This option enables support for the MPC8272 ADS board
-
 config PQ2FADS
 	bool "Freescale PQ2FADS"
 	select DEFAULT_UIMAGE
diff --git a/arch/powerpc/platforms/82xx/Makefile b/arch/powerpc/platforms/82xx/Makefile
index 8d713c601bf2..5426a1479006 100644
--- a/arch/powerpc/platforms/82xx/Makefile
+++ b/arch/powerpc/platforms/82xx/Makefile
@@ -2,7 +2,6 @@
 #
 # Makefile for the PowerPC 82xx linux kernel.
 #
-obj-$(CONFIG_MPC8272_ADS) += mpc8272_ads.o
 obj-$(CONFIG_CPM2) += pq2.o
 obj-$(CONFIG_PQ2_ADS_PCI_PIC) += pq2ads-pci-pic.o
 obj-$(CONFIG_PQ2FADS) += pq2fads.o
diff --git a/arch/powerpc/platforms/82xx/mpc8272_ads.c b/arch/powerpc/platforms/82xx/mpc8272_ads.c
deleted file mode 100644
index 0b5b9dec16d5..000000000000
--- a/arch/powerpc/platforms/82xx/mpc8272_ads.c
+++ /dev/null
@@ -1,213 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MPC8272 ADS board support
- *
- * Copyright 2007 Freescale Semiconductor, Inc.
- * Author: Scott Wood <scottwood@freescale.com>
- *
- * Based on code by Vitaly Bordug <vbordug@ru.mvista.com>
- * Copyright (c) 2006 MontaVista Software, Inc.
- */
-
-#include <linux/init.h>
-#include <linux/interrupt.h>
-#include <linux/fsl_devices.h>
-#include <linux/of_address.h>
-#include <linux/of_fdt.h>
-#include <linux/of_platform.h>
-#include <linux/io.h>
-
-#include <asm/cpm2.h>
-#include <asm/udbg.h>
-#include <asm/machdep.h>
-#include <asm/time.h>
-
-#include <platforms/82xx/pq2.h>
-
-#include <sysdev/fsl_soc.h>
-#include <sysdev/cpm2_pic.h>
-
-#include "pq2.h"
-
-static void __init mpc8272_ads_pic_init(void)
-{
-	struct device_node *np = of_find_compatible_node(NULL, NULL,
-	                                                 "fsl,cpm2-pic");
-	if (!np) {
-		printk(KERN_ERR "PIC init: can not find fsl,cpm2-pic node\n");
-		return;
-	}
-
-	cpm2_pic_init(np);
-	of_node_put(np);
-
-	/* Initialize stuff for the 82xx CPLD IC and install demux  */
-	pq2ads_pci_init_irq();
-}
-
-struct cpm_pin {
-	int port, pin, flags;
-};
-
-static struct cpm_pin mpc8272_ads_pins[] = {
-	/* SCC1 */
-	{3, 30, CPM_PIN_OUTPUT | CPM_PIN_SECONDARY},
-	{3, 31, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-
-	/* SCC4 */
-	{3, 21, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{3, 22, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-
-	/* FCC1 */
-	{0, 14, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{0, 15, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{0, 16, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{0, 17, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{0, 18, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{0, 19, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{0, 20, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{0, 21, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{0, 26, CPM_PIN_INPUT | CPM_PIN_SECONDARY},
-	{0, 27, CPM_PIN_INPUT | CPM_PIN_SECONDARY},
-	{0, 28, CPM_PIN_OUTPUT | CPM_PIN_SECONDARY},
-	{0, 29, CPM_PIN_OUTPUT | CPM_PIN_SECONDARY},
-	{0, 30, CPM_PIN_INPUT | CPM_PIN_SECONDARY},
-	{0, 31, CPM_PIN_INPUT | CPM_PIN_SECONDARY},
-	{2, 21, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{2, 22, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-
-	/* FCC2 */
-	{1, 18, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{1, 19, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{1, 20, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{1, 21, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{1, 22, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{1, 23, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{1, 24, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{1, 25, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{1, 26, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{1, 27, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{1, 28, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{1, 29, CPM_PIN_OUTPUT | CPM_PIN_SECONDARY},
-	{1, 30, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{1, 31, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{2, 16, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{2, 17, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-
-	/* I2C */
-	{3, 14, CPM_PIN_INPUT | CPM_PIN_SECONDARY | CPM_PIN_OPENDRAIN},
-	{3, 15, CPM_PIN_INPUT | CPM_PIN_SECONDARY | CPM_PIN_OPENDRAIN},
-
-	/* USB */
-	{2, 10, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{2, 11, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{2, 20, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{2, 24, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{3, 23, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{3, 24, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{3, 25, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-};
-
-static void __init init_ioports(void)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(mpc8272_ads_pins); i++) {
-		struct cpm_pin *pin = &mpc8272_ads_pins[i];
-		cpm2_set_pin(pin->port, pin->pin, pin->flags);
-	}
-
-	cpm2_clk_setup(CPM_CLK_SCC1, CPM_BRG1, CPM_CLK_RX);
-	cpm2_clk_setup(CPM_CLK_SCC1, CPM_BRG1, CPM_CLK_TX);
-	cpm2_clk_setup(CPM_CLK_SCC3, CPM_CLK8, CPM_CLK_RX);
-	cpm2_clk_setup(CPM_CLK_SCC3, CPM_CLK8, CPM_CLK_TX);
-	cpm2_clk_setup(CPM_CLK_SCC4, CPM_BRG4, CPM_CLK_RX);
-	cpm2_clk_setup(CPM_CLK_SCC4, CPM_BRG4, CPM_CLK_TX);
-	cpm2_clk_setup(CPM_CLK_FCC1, CPM_CLK11, CPM_CLK_RX);
-	cpm2_clk_setup(CPM_CLK_FCC1, CPM_CLK10, CPM_CLK_TX);
-	cpm2_clk_setup(CPM_CLK_FCC2, CPM_CLK15, CPM_CLK_RX);
-	cpm2_clk_setup(CPM_CLK_FCC2, CPM_CLK16, CPM_CLK_TX);
-}
-
-static void __init mpc8272_ads_setup_arch(void)
-{
-	struct device_node *np;
-	__be32 __iomem *bcsr;
-
-	if (ppc_md.progress)
-		ppc_md.progress("mpc8272_ads_setup_arch()", 0);
-
-	cpm2_reset();
-
-	np = of_find_compatible_node(NULL, NULL, "fsl,mpc8272ads-bcsr");
-	if (!np) {
-		printk(KERN_ERR "No bcsr in device tree\n");
-		return;
-	}
-
-	bcsr = of_iomap(np, 0);
-	of_node_put(np);
-	if (!bcsr) {
-		printk(KERN_ERR "Cannot map BCSR registers\n");
-		return;
-	}
-
-#define BCSR1_FETHIEN		0x08000000
-#define BCSR1_FETH_RST		0x04000000
-#define BCSR1_RS232_EN1		0x02000000
-#define BCSR1_RS232_EN2		0x01000000
-#define BCSR3_USB_nEN		0x80000000
-#define BCSR3_FETHIEN2		0x10000000
-#define BCSR3_FETH2_RST		0x08000000
-
-	clrbits32(&bcsr[1], BCSR1_RS232_EN1 | BCSR1_RS232_EN2 | BCSR1_FETHIEN);
-	setbits32(&bcsr[1], BCSR1_FETH_RST);
-
-	clrbits32(&bcsr[3], BCSR3_FETHIEN2);
-	setbits32(&bcsr[3], BCSR3_FETH2_RST);
-
-	clrbits32(&bcsr[3], BCSR3_USB_nEN);
-
-	iounmap(bcsr);
-
-	init_ioports();
-
-	if (ppc_md.progress)
-		ppc_md.progress("mpc8272_ads_setup_arch(), finish", 0);
-}
-
-static const struct of_device_id of_bus_ids[] __initconst = {
-	{ .name = "soc", },
-	{ .name = "cpm", },
-	{ .name = "localbus", },
-	{},
-};
-
-static int __init declare_of_platform_devices(void)
-{
-	/* Publish the QE devices */
-	of_platform_bus_probe(NULL, of_bus_ids, NULL);
-	return 0;
-}
-machine_device_initcall(mpc8272_ads, declare_of_platform_devices);
-
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init mpc8272_ads_probe(void)
-{
-	return of_machine_is_compatible("fsl,mpc8272ads");
-}
-
-define_machine(mpc8272_ads)
-{
-	.name = "Freescale MPC8272 ADS",
-	.probe = mpc8272_ads_probe,
-	.setup_arch = mpc8272_ads_setup_arch,
-	.discover_phbs = pq2_init_pci,
-	.init_IRQ = mpc8272_ads_pic_init,
-	.get_irq = cpm2_get_irq,
-	.calibrate_decr = generic_calibrate_decr,
-	.restart = pq2_restart,
-	.progress = udbg_progress,
-};
-- 
2.17.1

