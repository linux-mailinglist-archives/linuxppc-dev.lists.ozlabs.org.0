Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 407476A234C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 21:52:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNhtJ13sQz3fFq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Feb 2023 07:52:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=tJE0Yx/m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.166.238; helo=mx0a-0064b401.pphosted.com; envelope-from=prvs=14196aa554=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=tJE0Yx/m;
	dkim-atps=neutral
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNhqR6dYKz3cJY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Feb 2023 07:50:27 +1100 (AEDT)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31OJ0GPv030835;
	Fri, 24 Feb 2023 12:50:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=mSHDZMF0x7W1LpYx/HLSe7RIE7ZB2HGzlQFq/+s5Dwo=;
 b=tJE0Yx/m8OroVzCd52bHq5dOhpQQEybd07mCrrKD5eE0aqNvFEf4LjUNilwlS5ixLMkw
 KOaC6+fKP25vl00HobOzr/eg/IpJlyjlQ2lvnQN0ZFCZ1LEYo8KIzXCvw8Kw61EI9i5B
 /Nj8BIRc1hjAT8iilvn2ZFZEp+T11IiWuLLgoaDntho6vvxyIm11cb5ZqZ/FtYc/4E8A
 pxDOqw6cLwNZpay7LdpCEoEn8gJ2BJTUuqwfpi8MVSIjQWDe+Q/CaEDeBQtkbnaXl22K
 oHjzZYh0bqK9ZUjkqynLzk6xgQSebsDL2bfZD2wycQiffl811EBRGYqCzsknRgGD4LBj Uw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nty2pwwt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 24 Feb 2023 12:50:13 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Fri, 24 Feb 2023 12:50:13 -0800
Received: from sc2600cp.wrs.com (128.224.56.77) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Fri, 24 Feb 2023 12:50:12 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/3] powerpc: drop PowerQUICC II Family ADS platform support
Date: Fri, 24 Feb 2023 15:49:58 -0500
Message-ID: <20230224204959.17425-3-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230224204959.17425-1-paul.gortmaker@windriver.com>
References: <20230224204959.17425-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: zQqhcMvKGCUq5DcKpfaSfihR_GkxPmFK
X-Proofpoint-GUID: zQqhcMvKGCUq5DcKpfaSfihR_GkxPmFK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_15,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302240166
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

Based on documentation revision dates, this MPC82xx pq2fads system
predates the MPC8272-ADS variant by about a year and only has 1/2
the amount of RAM (32MB) -- largely making it useless with a modern
v6.x kernel from today.

Similar to the MPC8272-ADS the pq2fads also supported other 82xx CPU
variants, had 8MB flash, and like the 8272 ADS platform, was on a fairly
large PCB in order to have space for breakout connectors for all features.

These 82xx platforms are two decades old, and originally made for a
small group of industry related people in order to assist in new OEM
board designs.  Given that, it makes sense to remove support today.

Cc: Scott Wood <oss@buserror.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/powerpc/boot/Makefile             |   1 -
 arch/powerpc/boot/dts/pq2fads.dts      | 243 -------------------------
 arch/powerpc/configs/ppc6xx_defconfig  |   1 -
 arch/powerpc/configs/pq2fads_defconfig |  80 --------
 arch/powerpc/platforms/82xx/Kconfig    |  10 -
 arch/powerpc/platforms/82xx/Makefile   |   1 -
 arch/powerpc/platforms/82xx/pq2fads.c  | 191 -------------------
 7 files changed, 527 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/pq2fads.dts
 delete mode 100644 arch/powerpc/configs/pq2fads_defconfig
 delete mode 100644 arch/powerpc/platforms/82xx/pq2fads.c

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 38ee7e58f8e7..f8733b90fdc2 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -327,7 +327,6 @@ image-$(CONFIG_PPC_LITE5200)		+= cuImage.lite5200b
 image-$(CONFIG_PPC_MEDIA5200)		+= cuImage.media5200
 
 # Board ports in arch/powerpc/platform/82xx/Kconfig
-image-$(CONFIG_PQ2FADS)			+= cuImage.pq2fads
 image-$(CONFIG_EP8248E)			+= dtbImage.ep8248e
 
 # Board ports in arch/powerpc/platform/83xx/Kconfig
diff --git a/arch/powerpc/boot/dts/pq2fads.dts b/arch/powerpc/boot/dts/pq2fads.dts
deleted file mode 100644
index b6666215ed63..000000000000
--- a/arch/powerpc/boot/dts/pq2fads.dts
+++ /dev/null
@@ -1,243 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Device Tree for the PQ2FADS-ZU board with an MPC8280 chip.
- *
- * Copyright 2007,2008 Freescale Semiconductor Inc.
- */
-
-/dts-v1/;
-
-/ {
-	model = "pq2fads";
-	compatible = "fsl,pq2fads";
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	aliases {
-		ethernet0 = &enet0;
-		ethernet1 = &enet1;
-		serial0 = &serial0;
-		serial1 = &serial1;
-		pci0 = &pci0;
-	};
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu@0 {
-			device_type = "cpu";
-			reg = <0x0>;
-			d-cache-line-size = <32>;
-			i-cache-line-size = <32>;
-			d-cache-size = <16384>;
-			i-cache-size = <16384>;
-			timebase-frequency = <0>;
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
-		compatible = "fsl,mpc8280-localbus",
-		             "fsl,pq2-localbus";
-		#address-cells = <2>;
-		#size-cells = <1>;
-		reg = <0xf0010100 0x60>;
-
-		ranges = <0x0 0x0 0xff800000 0x800000
-		          0x1 0x0 0xf4500000 0x8000
-		          0x8 0x0 0xf8200000 0x8000>;
-
-		flash@0,0 {
-			compatible = "jedec-flash";
-			reg = <0x0 0x0 0x800000>;
-			bank-width = <4>;
-			device-width = <1>;
-		};
-
-		bcsr@1,0 {
-			reg = <0x1 0x0 0x20>;
-			compatible = "fsl,pq2fads-bcsr";
-		};
-
-		PCI_PIC: pic@8,0 {
-			#interrupt-cells = <1>;
-			interrupt-controller;
-			reg = <0x8 0x0 0x8>;
-			compatible = "fsl,pq2ads-pci-pic";
-			interrupt-parent = <&PIC>;
-			interrupts = <24 8>;
-		};
-	};
-
-	pci0: pci@f0010800 {
-		device_type = "pci";
-		reg = <0xf0010800 0x10c 0xf00101ac 0x8 0xf00101c4 0x8>;
-		compatible = "fsl,mpc8280-pci", "fsl,pq2-pci";
-		#interrupt-cells = <1>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		clock-frequency = <66000000>;
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
-		interrupt-map = <
-		                /* IDSEL 0x16 */
-		                 0xb000 0x0 0x0 0x1 &PCI_PIC 0
-		                 0xb000 0x0 0x0 0x2 &PCI_PIC 1
-		                 0xb000 0x0 0x0 0x3 &PCI_PIC 2
-		                 0xb000 0x0 0x0 0x4 &PCI_PIC 3
-
-		                /* IDSEL 0x17 */
-		                 0xb800 0x0 0x0 0x1 &PCI_PIC 4
-		                 0xb800 0x0 0x0 0x2 &PCI_PIC 5
-		                 0xb800 0x0 0x0 0x3 &PCI_PIC 6
-		                 0xb800 0x0 0x0 0x4 &PCI_PIC 7
-
-		                /* IDSEL 0x18 */
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
-		compatible = "fsl,mpc8280", "fsl,pq2-soc";
-		ranges = <0x0 0xf0000000 0x53000>;
-
-		// Temporary -- will go away once kernel uses ranges for get_immrbase().
-		reg = <0xf0000000 0x53000>;
-
-		cpm@119c0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			#interrupt-cells = <2>;
-			compatible = "fsl,mpc8280-cpm", "fsl,cpm2";
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
-				compatible = "fsl,mpc8280-brg",
-				             "fsl,cpm2-brg",
-				             "fsl,cpm-brg";
-				reg = <0x119f0 0x10 0x115f0 0x10>;
-			};
-
-			serial0: serial@11a00 {
-				device_type = "serial";
-				compatible = "fsl,mpc8280-scc-uart",
-				             "fsl,cpm2-scc-uart";
-				reg = <0x11a00 0x20 0x8000 0x100>;
-				interrupts = <40 8>;
-				interrupt-parent = <&PIC>;
-				fsl,cpm-brg = <1>;
-				fsl,cpm-command = <0x800000>;
-			};
-
-			serial1: serial@11a20 {
-				device_type = "serial";
-				compatible = "fsl,mpc8280-scc-uart",
-				             "fsl,cpm2-scc-uart";
-				reg = <0x11a20 0x20 0x8100 0x100>;
-				interrupts = <41 8>;
-				interrupt-parent = <&PIC>;
-				fsl,cpm-brg = <2>;
-				fsl,cpm-command = <0x4a00000>;
-			};
-
-			enet0: ethernet@11320 {
-				device_type = "network";
-				compatible = "fsl,mpc8280-fcc-enet",
-				             "fsl,cpm2-fcc-enet";
-				reg = <0x11320 0x20 0x8500 0x100 0x113b0 0x1>;
-				interrupts = <33 8>;
-				interrupt-parent = <&PIC>;
-				phy-handle = <&PHY0>;
-				linux,network-index = <0>;
-				fsl,cpm-command = <0x16200300>;
-			};
-
-			enet1: ethernet@11340 {
-				device_type = "network";
-				compatible = "fsl,mpc8280-fcc-enet",
-				             "fsl,cpm2-fcc-enet";
-				reg = <0x11340 0x20 0x8600 0x100 0x113d0 0x1>;
-				interrupts = <34 8>;
-				interrupt-parent = <&PIC>;
-				phy-handle = <&PHY1>;
-				linux,network-index = <1>;
-				fsl,cpm-command = <0x1a400300>;
-				local-mac-address = [00 e0 0c 00 79 01];
-			};
-
-			mdio@10d40 {
-				compatible = "fsl,pq2fads-mdio-bitbang",
-				             "fsl,mpc8280-mdio-bitbang",
-				             "fsl,cpm2-mdio-bitbang";
-				#address-cells = <1>;
-				#size-cells = <0>;
-				reg = <0x10d40 0x14>;
-				fsl,mdio-pin = <9>;
-				fsl,mdc-pin = <10>;
-
-				PHY0: ethernet-phy@0 {
-					interrupt-parent = <&PIC>;
-					interrupts = <25 2>;
-					reg = <0x0>;
-				};
-
-				PHY1: ethernet-phy@1 {
-					interrupt-parent = <&PIC>;
-					interrupts = <25 2>;
-					reg = <0x3>;
-				};
-			};
-
-			usb@11b60 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,mpc8280-usb",
-				             "fsl,cpm2-usb";
-				reg = <0x11b60 0x18 0x8b00 0x100>;
-				interrupt-parent = <&PIC>;
-				interrupts = <11 8>;
-				fsl,cpm-command = <0x2e600000>;
-			};
-		};
-
-		PIC: interrupt-controller@10c00 {
-			#interrupt-cells = <2>;
-			interrupt-controller;
-			reg = <0x10c00 0x80>;
-			compatible = "fsl,mpc8280-pic", "fsl,cpm2-pic";
-		};
-
-	};
-
-	chosen {
-		stdout-path = "/soc/cpm/serial@11a00";
-	};
-};
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 6dfe8f90228f..f6a3b87199db 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -38,7 +38,6 @@ CONFIG_PPC_MPC52xx=y
 CONFIG_PPC_EFIKA=y
 CONFIG_PPC_MPC5200_BUGFIX=y
 CONFIG_PPC_82xx=y
-CONFIG_PQ2FADS=y
 CONFIG_EP8248E=y
 CONFIG_MGCOGE=y
 CONFIG_PPC_83xx=y
diff --git a/arch/powerpc/configs/pq2fads_defconfig b/arch/powerpc/configs/pq2fads_defconfig
deleted file mode 100644
index 9d63e2e65211..000000000000
--- a/arch/powerpc/configs/pq2fads_defconfig
+++ /dev/null
@@ -1,80 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-CONFIG_KALLSYMS_ALL=y
-CONFIG_PARTITION_ADVANCED=y
-# CONFIG_PPC_CHRP is not set
-# CONFIG_PPC_PMAC is not set
-CONFIG_PPC_82xx=y
-CONFIG_PQ2FADS=y
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
-CONFIG_USB_GADGET=y
-CONFIG_USB_ETH=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT4_FS=y
-CONFIG_AUTOFS4_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_CRAMFS=y
-CONFIG_NFS_FS=y
-CONFIG_NFS_V3_ACL=y
-CONFIG_ROOT_NFS=y
-CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_ASCII=y
-CONFIG_NLS_ISO8859_1=y
-CONFIG_NLS_UTF8=y
-CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DETECT_HUNG_TASK=y
-# CONFIG_SCHED_DEBUG is not set
-CONFIG_BDI_SWITCH=y
-CONFIG_CRYPTO_CBC=y
-CONFIG_CRYPTO_ECB=y
-CONFIG_CRYPTO_PCBC=y
-CONFIG_CRYPTO_MD5=y
-CONFIG_CRYPTO_DES=y
diff --git a/arch/powerpc/platforms/82xx/Kconfig b/arch/powerpc/platforms/82xx/Kconfig
index 6de033c82960..62a057c6a356 100644
--- a/arch/powerpc/platforms/82xx/Kconfig
+++ b/arch/powerpc/platforms/82xx/Kconfig
@@ -5,16 +5,6 @@ menuconfig PPC_82xx
 
 if PPC_82xx
 
-config PQ2FADS
-	bool "Freescale PQ2FADS"
-	select DEFAULT_UIMAGE
-	select PQ2ADS
-	select 8260
-	select FSL_SOC
-	select PQ2_ADS_PCI_PIC if PCI
-	help
-	  This option enables support for the PQ2FADS board
-
 config EP8248E
 	bool "Embedded Planet EP8248E (a.k.a. CWH-PPC-8248N-VE)"
 	select 8272
diff --git a/arch/powerpc/platforms/82xx/Makefile b/arch/powerpc/platforms/82xx/Makefile
index 5426a1479006..a4257f057401 100644
--- a/arch/powerpc/platforms/82xx/Makefile
+++ b/arch/powerpc/platforms/82xx/Makefile
@@ -4,6 +4,5 @@
 #
 obj-$(CONFIG_CPM2) += pq2.o
 obj-$(CONFIG_PQ2_ADS_PCI_PIC) += pq2ads-pci-pic.o
-obj-$(CONFIG_PQ2FADS) += pq2fads.o
 obj-$(CONFIG_EP8248E) += ep8248e.o
 obj-$(CONFIG_MGCOGE) += km82xx.o
diff --git a/arch/powerpc/platforms/82xx/pq2fads.c b/arch/powerpc/platforms/82xx/pq2fads.c
deleted file mode 100644
index ac9113d524af..000000000000
--- a/arch/powerpc/platforms/82xx/pq2fads.c
+++ /dev/null
@@ -1,191 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * PQ2FADS board support
- *
- * Copyright 2007 Freescale Semiconductor, Inc.
- * Author: Scott Wood <scottwood@freescale.com>
- *
- * Loosely based on mp82xx ADS support by Vitaly Bordug <vbordug@ru.mvista.com>
- * Copyright (c) 2006 MontaVista Software, Inc.
- */
-
-#include <linux/init.h>
-#include <linux/interrupt.h>
-#include <linux/fsl_devices.h>
-#include <linux/of_address.h>
-#include <linux/of_fdt.h>
-#include <linux/of_platform.h>
-
-#include <asm/io.h>
-#include <asm/cpm2.h>
-#include <asm/udbg.h>
-#include <asm/machdep.h>
-#include <asm/time.h>
-
-#include <sysdev/fsl_soc.h>
-#include <sysdev/cpm2_pic.h>
-
-#include "pq2ads.h"
-#include "pq2.h"
-
-static void __init pq2fads_pic_init(void)
-{
-	struct device_node *np = of_find_compatible_node(NULL, NULL, "fsl,cpm2-pic");
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
-static struct cpm_pin pq2fads_pins[] = {
-	/* SCC1 */
-	{3, 30, CPM_PIN_OUTPUT | CPM_PIN_SECONDARY},
-	{3, 31, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-
-	/* SCC2 */
-	{3, 27, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{3, 28, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
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
-	{2, 18, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{2, 19, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-
-	/* FCC3 */
-	{1, 4, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{1, 5, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{1, 6, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{1, 7, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{1, 8, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{1, 9, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{1, 10, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{1, 11, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{1, 12, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{1, 13, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{1, 14, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{1, 15, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{1, 16, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{1, 17, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{2, 16, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{2, 17, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-};
-
-static void __init init_ioports(void)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(pq2fads_pins); i++) {
-		struct cpm_pin *pin = &pq2fads_pins[i];
-		cpm2_set_pin(pin->port, pin->pin, pin->flags);
-	}
-
-	cpm2_clk_setup(CPM_CLK_SCC1, CPM_BRG1, CPM_CLK_RX);
-	cpm2_clk_setup(CPM_CLK_SCC1, CPM_BRG1, CPM_CLK_TX);
-	cpm2_clk_setup(CPM_CLK_SCC2, CPM_BRG2, CPM_CLK_RX);
-	cpm2_clk_setup(CPM_CLK_SCC2, CPM_BRG2, CPM_CLK_TX);
-	cpm2_clk_setup(CPM_CLK_FCC2, CPM_CLK13, CPM_CLK_RX);
-	cpm2_clk_setup(CPM_CLK_FCC2, CPM_CLK14, CPM_CLK_TX);
-	cpm2_clk_setup(CPM_CLK_FCC3, CPM_CLK15, CPM_CLK_RX);
-	cpm2_clk_setup(CPM_CLK_FCC3, CPM_CLK16, CPM_CLK_TX);
-}
-
-static void __init pq2fads_setup_arch(void)
-{
-	struct device_node *np;
-	__be32 __iomem *bcsr;
-
-	if (ppc_md.progress)
-		ppc_md.progress("pq2fads_setup_arch()", 0);
-
-	cpm2_reset();
-
-	np = of_find_compatible_node(NULL, NULL, "fsl,pq2fads-bcsr");
-	if (!np) {
-		printk(KERN_ERR "No fsl,pq2fads-bcsr in device tree\n");
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
-	/* Enable the serial and ethernet ports */
-
-	clrbits32(&bcsr[1], BCSR1_RS232_EN1 | BCSR1_RS232_EN2 | BCSR1_FETHIEN);
-	setbits32(&bcsr[1], BCSR1_FETH_RST);
-
-	clrbits32(&bcsr[3], BCSR3_FETHIEN2);
-	setbits32(&bcsr[3], BCSR3_FETH2_RST);
-
-	iounmap(bcsr);
-
-	init_ioports();
-
-	/* Enable external IRQs */
-	clrbits32(&cpm2_immr->im_siu_conf.siu_82xx.sc_siumcr, 0x0c000000);
-
-	if (ppc_md.progress)
-		ppc_md.progress("pq2fads_setup_arch(), finish", 0);
-}
-
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init pq2fads_probe(void)
-{
-	return of_machine_is_compatible("fsl,pq2fads");
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
-machine_device_initcall(pq2fads, declare_of_platform_devices);
-
-define_machine(pq2fads)
-{
-	.name = "Freescale PQ2FADS",
-	.probe = pq2fads_probe,
-	.setup_arch = pq2fads_setup_arch,
-	.discover_phbs = pq2_init_pci,
-	.init_IRQ = pq2fads_pic_init,
-	.get_irq = cpm2_get_irq,
-	.calibrate_decr = generic_calibrate_decr,
-	.restart = pq2_restart,
-	.progress = udbg_progress,
-};
-- 
2.17.1

