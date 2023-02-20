Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A206669CB10
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 13:33:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PL1zW3q7Jz3cK8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 23:33:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=gy/RKRFK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.178.238; helo=mx0b-0064b401.pphosted.com; envelope-from=prvs=141586787b=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=gy/RKRFK;
	dkim-atps=neutral
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PL1xX4dxGz309T
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 23:31:26 +1100 (AEDT)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31KAoPjC000854;
	Mon, 20 Feb 2023 11:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=gGD7UA22G4R8wn90nnTBDFHaRfuj3EnmRFQ94L3AUHA=;
 b=gy/RKRFKlrMlSVM8r5nwsKnigxxldjxUZHZLtbOl+vNqckemJIbGPl6QuYFYeUHN0voI
 tRwSIaXiEym2wBIW0klrFl+jqM3h4jUo8rovYAwV2M42FZrRfQ6GCRMg4BfFQYHVkvhY
 q9dYoNFtTU/ec9A/D2eUGvl7lHBG0BAvAjC/sAKYaGWkzk+lygdQqeQ2HrPBQZuwdo7B
 CA8OFACE+hZQ6xVo/apKD8ku+IGDNdNDeAyhxvIjwRWyKmiusym5uo8uaDD0FJ2eqCzD
 4B+a4gkdZ7v22wfNOSg2p9XYLE3SxqFNP7ERiyWQEtbkmjh/JqPHoVmaDfplYzNDdJvm 7w== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpem1p50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 20 Feb 2023 11:59:48 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Mon, 20 Feb 2023 03:59:47 -0800
Received: from sc2600cp.wrs.com (128.224.56.77) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Mon, 20 Feb 2023 03:59:46 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/4] powerpc: drop MPC837x_MDS platform support
Date: Mon, 20 Feb 2023 06:59:12 -0500
Message-ID: <20230220115913.25811-4-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230220115913.25811-1-paul.gortmaker@windriver.com>
References: <20230220115913.25811-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: BnqoJNePy74ASvvjDuGD8wJN3QkUGc4J
X-Proofpoint-GUID: BnqoJNePy74ASvvjDuGD8wJN3QkUGc4J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_08,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200107
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

This next evolutionary step in the e300 family of Modular Development
System (MDS) still has, at its core component, a full length card with a
PCI edge.  No case.  Serial and network connectors were on card, so it
could optionally be fitted with plastic stand-offs and run stand-alone
off a power brick.

This is very similar to the MPC834x_MDS and MPC836x_MDS removed in the
prior commits, but with this board variant as yet another evolutionary
step.  SATA and PCI-e were now available.  But overall the form factor
and design goals were unchanged.

Like all the MDS systems, it was meant as a vehicle to get the CPU out
early to hardware OEMs so software and board development could take place
in parallel.

These were made in limited numbers and availability preference was given
to partners who were planning to make their own boards.

Given that the whole reason for existence was to assist in enabling new
board designs [not happening for 10+ years], and that they weren't
generally available, and that the hardware wasn't really hobbyist friendly
even for retro computing, it makes sense to retire the support for this
particular platform.

Cc: Scott Wood <oss@buserror.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/powerpc/boot/dts/mpc8377_mds.dts         | 505 ------------------
 arch/powerpc/boot/dts/mpc8378_mds.dts         | 489 -----------------
 arch/powerpc/boot/dts/mpc8379_mds.dts         | 455 ----------------
 .../configs/83xx/mpc837x_mds_defconfig        |  58 --
 arch/powerpc/configs/mpc83xx_defconfig        |   1 -
 arch/powerpc/configs/ppc6xx_defconfig         |   1 -
 arch/powerpc/platforms/83xx/Kconfig           |   7 -
 arch/powerpc/platforms/83xx/Makefile          |   1 -
 arch/powerpc/platforms/83xx/mpc837x_mds.c     | 103 ----
 9 files changed, 1620 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/mpc8377_mds.dts
 delete mode 100644 arch/powerpc/boot/dts/mpc8378_mds.dts
 delete mode 100644 arch/powerpc/boot/dts/mpc8379_mds.dts
 delete mode 100644 arch/powerpc/configs/83xx/mpc837x_mds_defconfig
 delete mode 100644 arch/powerpc/platforms/83xx/mpc837x_mds.c

diff --git a/arch/powerpc/boot/dts/mpc8377_mds.dts b/arch/powerpc/boot/dts/mpc8377_mds.dts
deleted file mode 100644
index 9227bce0e2f5..000000000000
--- a/arch/powerpc/boot/dts/mpc8377_mds.dts
+++ /dev/null
@@ -1,505 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MPC8377E MDS Device Tree Source
- *
- * Copyright 2007 Freescale Semiconductor Inc.
- */
-
-/dts-v1/;
-
-/ {
-	model = "fsl,mpc8377emds";
-	compatible = "fsl,mpc8377emds","fsl,mpc837xmds";
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	aliases {
-		ethernet0 = &enet0;
-		ethernet1 = &enet1;
-		serial0 = &serial0;
-		serial1 = &serial1;
-		pci0 = &pci0;
-		pci1 = &pci1;
-		pci2 = &pci2;
-	};
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		PowerPC,8377@0 {
-			device_type = "cpu";
-			reg = <0x0>;
-			d-cache-line-size = <32>;
-			i-cache-line-size = <32>;
-			d-cache-size = <32768>;
-			i-cache-size = <32768>;
-			timebase-frequency = <0>;
-			bus-frequency = <0>;
-			clock-frequency = <0>;
-		};
-	};
-
-	memory {
-		device_type = "memory";
-		reg = <0x00000000 0x20000000>;	// 512MB at 0
-	};
-
-	localbus@e0005000 {
-		#address-cells = <2>;
-		#size-cells = <1>;
-		compatible = "fsl,mpc8377-elbc", "fsl,elbc", "simple-bus";
-		reg = <0xe0005000 0x1000>;
-		interrupts = <77 0x8>;
-		interrupt-parent = <&ipic>;
-
-		// booting from NOR flash
-		ranges = <0 0x0 0xfe000000 0x02000000
-		          1 0x0 0xf8000000 0x00008000
-		          3 0x0 0xe0600000 0x00008000>;
-
-		flash@0,0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "cfi-flash";
-			reg = <0 0x0 0x2000000>;
-			bank-width = <2>;
-			device-width = <1>;
-
-			u-boot@0 {
-				reg = <0x0 0x100000>;
-				read-only;
-			};
-
-			fs@100000 {
-				reg = <0x100000 0x800000>;
-			};
-
-			kernel@1d00000 {
-				reg = <0x1d00000 0x200000>;
-			};
-
-			dtb@1f00000 {
-				reg = <0x1f00000 0x100000>;
-			};
-		};
-
-		bcsr@1,0 {
-			reg = <1 0x0 0x8000>;
-			compatible = "fsl,mpc837xmds-bcsr";
-		};
-
-		nand@3,0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,mpc8377-fcm-nand",
-			             "fsl,elbc-fcm-nand";
-			reg = <3 0x0 0x8000>;
-
-			u-boot@0 {
-				reg = <0x0 0x100000>;
-				read-only;
-			};
-
-			kernel@100000 {
-				reg = <0x100000 0x300000>;
-			};
-
-			fs@400000 {
-				reg = <0x400000 0x1c00000>;
-			};
-		};
-	};
-
-	soc@e0000000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		device_type = "soc";
-		compatible = "simple-bus";
-		ranges = <0x0 0xe0000000 0x00100000>;
-		reg = <0xe0000000 0x00000200>;
-		bus-frequency = <0>;
-
-		wdt@200 {
-			compatible = "mpc83xx_wdt";
-			reg = <0x200 0x100>;
-		};
-
-		sleep-nexus {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "simple-bus";
-			sleep = <&pmc 0x0c000000>;
-			ranges;
-
-			i2c@3000 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				cell-index = <0>;
-				compatible = "fsl-i2c";
-				reg = <0x3000 0x100>;
-				interrupts = <14 0x8>;
-				interrupt-parent = <&ipic>;
-				dfsrr;
-
-				rtc@68 {
-					compatible = "dallas,ds1374";
-					reg = <0x68>;
-					interrupts = <19 0x8>;
-					interrupt-parent = <&ipic>;
-				};
-			};
-
-			sdhci@2e000 {
-				compatible = "fsl,mpc8377-esdhc", "fsl,esdhc";
-				reg = <0x2e000 0x1000>;
-				interrupts = <42 0x8>;
-				interrupt-parent = <&ipic>;
-				sdhci,wp-inverted;
-				/* Filled in by U-Boot */
-				clock-frequency = <0>;
-			};
-		};
-
-		i2c@3100 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			cell-index = <1>;
-			compatible = "fsl-i2c";
-			reg = <0x3100 0x100>;
-			interrupts = <15 0x8>;
-			interrupt-parent = <&ipic>;
-			dfsrr;
-		};
-
-		spi@7000 {
-			cell-index = <0>;
-			compatible = "fsl,spi";
-			reg = <0x7000 0x1000>;
-			interrupts = <16 0x8>;
-			interrupt-parent = <&ipic>;
-			mode = "cpu";
-		};
-
-		usb@23000 {
-			compatible = "fsl-usb2-dr";
-			reg = <0x23000 0x1000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			interrupt-parent = <&ipic>;
-			interrupts = <38 0x8>;
-			dr_mode = "host";
-			phy_type = "ulpi";
-			sleep = <&pmc 0x00c00000>;
-		};
-
-		enet0: ethernet@24000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			cell-index = <0>;
-			device_type = "network";
-			model = "eTSEC";
-			compatible = "gianfar";
-			reg = <0x24000 0x1000>;
-			ranges = <0x0 0x24000 0x1000>;
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <32 0x8 33 0x8 34 0x8>;
-			phy-connection-type = "mii";
-			interrupt-parent = <&ipic>;
-			tbi-handle = <&tbi0>;
-			phy-handle = <&phy2>;
-			sleep = <&pmc 0xc0000000>;
-			fsl,magic-packet;
-
-			mdio@520 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,gianfar-mdio";
-				reg = <0x520 0x20>;
-
-				phy2: ethernet-phy@2 {
-					interrupt-parent = <&ipic>;
-					interrupts = <17 0x8>;
-					reg = <0x2>;
-				};
-
-				phy3: ethernet-phy@3 {
-					interrupt-parent = <&ipic>;
-					interrupts = <18 0x8>;
-					reg = <0x3>;
-				};
-
-				tbi0: tbi-phy@11 {
-					reg = <0x11>;
-					device_type = "tbi-phy";
-				};
-			};
-		};
-
-		enet1: ethernet@25000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			cell-index = <1>;
-			device_type = "network";
-			model = "eTSEC";
-			compatible = "gianfar";
-			reg = <0x25000 0x1000>;
-			ranges = <0x0 0x25000 0x1000>;
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <35 0x8 36 0x8 37 0x8>;
-			phy-connection-type = "mii";
-			interrupt-parent = <&ipic>;
-			tbi-handle = <&tbi1>;
-			phy-handle = <&phy3>;
-			sleep = <&pmc 0x30000000>;
-			fsl,magic-packet;
-
-			mdio@520 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,gianfar-tbi";
-				reg = <0x520 0x20>;
-
-				tbi1: tbi-phy@11 {
-					reg = <0x11>;
-					device_type = "tbi-phy";
-				};
-			};
-		};
-
-		serial0: serial@4500 {
-			cell-index = <0>;
-			device_type = "serial";
-			compatible = "fsl,ns16550", "ns16550";
-			reg = <0x4500 0x100>;
-			clock-frequency = <0>;
-			interrupts = <9 0x8>;
-			interrupt-parent = <&ipic>;
-		};
-
-		serial1: serial@4600 {
-			cell-index = <1>;
-			device_type = "serial";
-			compatible = "fsl,ns16550", "ns16550";
-			reg = <0x4600 0x100>;
-			clock-frequency = <0>;
-			interrupts = <10 0x8>;
-			interrupt-parent = <&ipic>;
-		};
-
-		dma@82a8 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,mpc8377-dma", "fsl,elo-dma";
-			reg = <0x82a8 4>;
-			ranges = <0 0x8100 0x1a8>;
-			interrupt-parent = <&ipic>;
-			interrupts = <0x47 8>;
-			cell-index = <0>;
-			dma-channel@0 {
-				compatible = "fsl,mpc8377-dma-channel", "fsl,elo-dma-channel";
-				reg = <0 0x80>;
-				cell-index = <0>;
-				interrupt-parent = <&ipic>;
-				interrupts = <0x47 8>;
-			};
-			dma-channel@80 {
-				compatible = "fsl,mpc8377-dma-channel", "fsl,elo-dma-channel";
-				reg = <0x80 0x80>;
-				cell-index = <1>;
-				interrupt-parent = <&ipic>;
-				interrupts = <0x47 8>;
-			};
-			dma-channel@100 {
-				compatible = "fsl,mpc8377-dma-channel", "fsl,elo-dma-channel";
-				reg = <0x100 0x80>;
-				cell-index = <2>;
-				interrupt-parent = <&ipic>;
-				interrupts = <0x47 8>;
-			};
-			dma-channel@180 {
-				compatible = "fsl,mpc8377-dma-channel", "fsl,elo-dma-channel";
-				reg = <0x180 0x28>;
-				cell-index = <3>;
-				interrupt-parent = <&ipic>;
-				interrupts = <0x47 8>;
-			};
-		};
-
-		crypto@30000 {
-			compatible = "fsl,sec3.0", "fsl,sec2.4", "fsl,sec2.2",
-				     "fsl,sec2.1", "fsl,sec2.0";
-			reg = <0x30000 0x10000>;
-			interrupts = <11 0x8>;
-			interrupt-parent = <&ipic>;
-			fsl,num-channels = <4>;
-			fsl,channel-fifo-len = <24>;
-			fsl,exec-units-mask = <0x9fe>;
-			fsl,descriptor-types-mask = <0x3ab0ebf>;
-			sleep = <&pmc 0x03000000>;
-		};
-
-		sata@18000 {
-			compatible = "fsl,mpc8379-sata", "fsl,pq-sata";
-			reg = <0x18000 0x1000>;
-			interrupts = <44 0x8>;
-			interrupt-parent = <&ipic>;
-			sleep = <&pmc 0x000000c0>;
-		};
-
-		sata@19000 {
-			compatible = "fsl,mpc8379-sata", "fsl,pq-sata";
-			reg = <0x19000 0x1000>;
-			interrupts = <45 0x8>;
-			interrupt-parent = <&ipic>;
-			sleep = <&pmc 0x00000030>;
-		};
-
-		/* IPIC
-		 * interrupts cell = <intr #, sense>
-		 * sense values match linux IORESOURCE_IRQ_* defines:
-		 * sense == 8: Level, low assertion
-		 * sense == 2: Edge, high-to-low change
-		 */
-		ipic: pic@700 {
-			compatible = "fsl,ipic";
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <2>;
-			reg = <0x700 0x100>;
-		};
-
-		pmc: power@b00 {
-			compatible = "fsl,mpc8377-pmc", "fsl,mpc8349-pmc";
-			reg = <0xb00 0x100 0xa00 0x100>;
-			interrupts = <80 0x8>;
-			interrupt-parent = <&ipic>;
-		};
-	};
-
-	pci0: pci@e0008500 {
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
-		interrupt-map = <
-
-				/* IDSEL 0x11 */
-				 0x8800 0x0 0x0 0x1 &ipic 20 0x8
-				 0x8800 0x0 0x0 0x2 &ipic 21 0x8
-				 0x8800 0x0 0x0 0x3 &ipic 22 0x8
-				 0x8800 0x0 0x0 0x4 &ipic 23 0x8
-
-				/* IDSEL 0x12 */
-				 0x9000 0x0 0x0 0x1 &ipic 22 0x8
-				 0x9000 0x0 0x0 0x2 &ipic 23 0x8
-				 0x9000 0x0 0x0 0x3 &ipic 20 0x8
-				 0x9000 0x0 0x0 0x4 &ipic 21 0x8
-
-				/* IDSEL 0x13 */
-				 0x9800 0x0 0x0 0x1 &ipic 23 0x8
-				 0x9800 0x0 0x0 0x2 &ipic 20 0x8
-				 0x9800 0x0 0x0 0x3 &ipic 21 0x8
-				 0x9800 0x0 0x0 0x4 &ipic 22 0x8
-
-				/* IDSEL 0x15 */
-				 0xa800 0x0 0x0 0x1 &ipic 20 0x8
-				 0xa800 0x0 0x0 0x2 &ipic 21 0x8
-				 0xa800 0x0 0x0 0x3 &ipic 22 0x8
-				 0xa800 0x0 0x0 0x4 &ipic 23 0x8
-
-				/* IDSEL 0x16 */
-				 0xb000 0x0 0x0 0x1 &ipic 23 0x8
-				 0xb000 0x0 0x0 0x2 &ipic 20 0x8
-				 0xb000 0x0 0x0 0x3 &ipic 21 0x8
-				 0xb000 0x0 0x0 0x4 &ipic 22 0x8
-
-				/* IDSEL 0x17 */
-				 0xb800 0x0 0x0 0x1 &ipic 22 0x8
-				 0xb800 0x0 0x0 0x2 &ipic 23 0x8
-				 0xb800 0x0 0x0 0x3 &ipic 20 0x8
-				 0xb800 0x0 0x0 0x4 &ipic 21 0x8
-
-				/* IDSEL 0x18 */
-				 0xc000 0x0 0x0 0x1 &ipic 21 0x8
-				 0xc000 0x0 0x0 0x2 &ipic 22 0x8
-				 0xc000 0x0 0x0 0x3 &ipic 23 0x8
-				 0xc000 0x0 0x0 0x4 &ipic 20 0x8>;
-		interrupt-parent = <&ipic>;
-		interrupts = <66 0x8>;
-		bus-range = <0x0 0x0>;
-		ranges = <0x02000000 0x0 0x90000000 0x90000000 0x0 0x10000000
-		          0x42000000 0x0 0x80000000 0x80000000 0x0 0x10000000
-		          0x01000000 0x0 0x00000000 0xe0300000 0x0 0x00100000>;
-		sleep = <&pmc 0x00010000>;
-		clock-frequency = <0>;
-		#interrupt-cells = <1>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		reg = <0xe0008500 0x100		/* internal registers */
-		       0xe0008300 0x8>;		/* config space access registers */
-		compatible = "fsl,mpc8349-pci";
-		device_type = "pci";
-	};
-
-	pci1: pcie@e0009000 {
-		#address-cells = <3>;
-		#size-cells = <2>;
-		#interrupt-cells = <1>;
-		device_type = "pci";
-		compatible = "fsl,mpc8377-pcie", "fsl,mpc8314-pcie";
-		reg = <0xe0009000 0x00001000>;
-		ranges = <0x02000000 0 0xa8000000 0xa8000000 0 0x10000000
-		          0x01000000 0 0x00000000 0xb8000000 0 0x00800000>;
-		bus-range = <0 255>;
-		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <0 0 0 1 &ipic 1 8
-				 0 0 0 2 &ipic 1 8
-				 0 0 0 3 &ipic 1 8
-				 0 0 0 4 &ipic 1 8>;
-		sleep = <&pmc 0x00300000>;
-		clock-frequency = <0>;
-
-		pcie@0 {
-			#address-cells = <3>;
-			#size-cells = <2>;
-			device_type = "pci";
-			reg = <0 0 0 0 0>;
-			ranges = <0x02000000 0 0xa8000000
-				  0x02000000 0 0xa8000000
-				  0 0x10000000
-				  0x01000000 0 0x00000000
-				  0x01000000 0 0x00000000
-				  0 0x00800000>;
-		};
-	};
-
-	pci2: pcie@e000a000 {
-		#address-cells = <3>;
-		#size-cells = <2>;
-		#interrupt-cells = <1>;
-		device_type = "pci";
-		compatible = "fsl,mpc8377-pcie", "fsl,mpc8314-pcie";
-		reg = <0xe000a000 0x00001000>;
-		ranges = <0x02000000 0 0xc8000000 0xc8000000 0 0x10000000
-			  0x01000000 0 0x00000000 0xd8000000 0 0x00800000>;
-		bus-range = <0 255>;
-		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <0 0 0 1 &ipic 2 8
-				 0 0 0 2 &ipic 2 8
-				 0 0 0 3 &ipic 2 8
-				 0 0 0 4 &ipic 2 8>;
-		sleep = <&pmc 0x000c0000>;
-		clock-frequency = <0>;
-
-		pcie@0 {
-			#address-cells = <3>;
-			#size-cells = <2>;
-			device_type = "pci";
-			reg = <0 0 0 0 0>;
-			ranges = <0x02000000 0 0xc8000000
-				  0x02000000 0 0xc8000000
-				  0 0x10000000
-				  0x01000000 0 0x00000000
-				  0x01000000 0 0x00000000
-				  0 0x00800000>;
-		};
-	};
-};
diff --git a/arch/powerpc/boot/dts/mpc8378_mds.dts b/arch/powerpc/boot/dts/mpc8378_mds.dts
deleted file mode 100644
index e45b25554e8c..000000000000
--- a/arch/powerpc/boot/dts/mpc8378_mds.dts
+++ /dev/null
@@ -1,489 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MPC8378E MDS Device Tree Source
- *
- * Copyright 2007 Freescale Semiconductor Inc.
- */
-
-/dts-v1/;
-
-/ {
-	model = "fsl,mpc8378emds";
-	compatible = "fsl,mpc8378emds","fsl,mpc837xmds";
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	aliases {
-		ethernet0 = &enet0;
-		ethernet1 = &enet1;
-		serial0 = &serial0;
-		serial1 = &serial1;
-		pci0 = &pci0;
-		pci1 = &pci1;
-		pci2 = &pci2;
-	};
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		PowerPC,8378@0 {
-			device_type = "cpu";
-			reg = <0x0>;
-			d-cache-line-size = <32>;
-			i-cache-line-size = <32>;
-			d-cache-size = <32768>;
-			i-cache-size = <32768>;
-			timebase-frequency = <0>;
-			bus-frequency = <0>;
-			clock-frequency = <0>;
-		};
-	};
-
-	memory {
-		device_type = "memory";
-		reg = <0x00000000 0x20000000>;	// 512MB at 0
-	};
-
-	localbus@e0005000 {
-		#address-cells = <2>;
-		#size-cells = <1>;
-		compatible = "fsl,mpc8378-elbc", "fsl,elbc", "simple-bus";
-		reg = <0xe0005000 0x1000>;
-		interrupts = <77 0x8>;
-		interrupt-parent = <&ipic>;
-
-		// booting from NOR flash
-		ranges = <0 0x0 0xfe000000 0x02000000
-		          1 0x0 0xf8000000 0x00008000
-		          3 0x0 0xe0600000 0x00008000>;
-
-		flash@0,0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "cfi-flash";
-			reg = <0 0x0 0x2000000>;
-			bank-width = <2>;
-			device-width = <1>;
-
-			u-boot@0 {
-				reg = <0x0 0x100000>;
-				read-only;
-			};
-
-			fs@100000 {
-				reg = <0x100000 0x800000>;
-			};
-
-			kernel@1d00000 {
-				reg = <0x1d00000 0x200000>;
-			};
-
-			dtb@1f00000 {
-				reg = <0x1f00000 0x100000>;
-			};
-		};
-
-		bcsr@1,0 {
-			reg = <1 0x0 0x8000>;
-			compatible = "fsl,mpc837xmds-bcsr";
-		};
-
-		nand@3,0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,mpc8378-fcm-nand",
-			             "fsl,elbc-fcm-nand";
-			reg = <3 0x0 0x8000>;
-
-			u-boot@0 {
-				reg = <0x0 0x100000>;
-				read-only;
-			};
-
-			kernel@100000 {
-				reg = <0x100000 0x300000>;
-			};
-
-			fs@400000 {
-				reg = <0x400000 0x1c00000>;
-			};
-		};
-	};
-
-	soc@e0000000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		device_type = "soc";
-		compatible = "simple-bus";
-		ranges = <0x0 0xe0000000 0x00100000>;
-		reg = <0xe0000000 0x00000200>;
-		bus-frequency = <0>;
-
-		wdt@200 {
-			compatible = "mpc83xx_wdt";
-			reg = <0x200 0x100>;
-		};
-
-		sleep-nexus {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "simple-bus";
-			sleep = <&pmc 0x0c000000>;
-			ranges;
-
-			i2c@3000 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				cell-index = <0>;
-				compatible = "fsl-i2c";
-				reg = <0x3000 0x100>;
-				interrupts = <14 0x8>;
-				interrupt-parent = <&ipic>;
-				dfsrr;
-
-				rtc@68 {
-					compatible = "dallas,ds1374";
-					reg = <0x68>;
-					interrupts = <19 0x8>;
-					interrupt-parent = <&ipic>;
-				};
-			};
-
-			sdhci@2e000 {
-				compatible = "fsl,mpc8378-esdhc", "fsl,esdhc";
-				reg = <0x2e000 0x1000>;
-				interrupts = <42 0x8>;
-				interrupt-parent = <&ipic>;
-				sdhci,wp-inverted;
-				/* Filled in by U-Boot */
-				clock-frequency = <0>;
-			};
-		};
-
-		i2c@3100 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			cell-index = <1>;
-			compatible = "fsl-i2c";
-			reg = <0x3100 0x100>;
-			interrupts = <15 0x8>;
-			interrupt-parent = <&ipic>;
-			dfsrr;
-		};
-
-		spi@7000 {
-			cell-index = <0>;
-			compatible = "fsl,spi";
-			reg = <0x7000 0x1000>;
-			interrupts = <16 0x8>;
-			interrupt-parent = <&ipic>;
-			mode = "cpu";
-		};
-
-		dma@82a8 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,mpc8378-dma", "fsl,elo-dma";
-			reg = <0x82a8 4>;
-			ranges = <0 0x8100 0x1a8>;
-			interrupt-parent = <&ipic>;
-			interrupts = <71 8>;
-			cell-index = <0>;
-			dma-channel@0 {
-				compatible = "fsl,mpc8378-dma-channel", "fsl,elo-dma-channel";
-				reg = <0 0x80>;
-				cell-index = <0>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-			dma-channel@80 {
-				compatible = "fsl,mpc8378-dma-channel", "fsl,elo-dma-channel";
-				reg = <0x80 0x80>;
-				cell-index = <1>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-			dma-channel@100 {
-				compatible = "fsl,mpc8378-dma-channel", "fsl,elo-dma-channel";
-				reg = <0x100 0x80>;
-				cell-index = <2>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-			dma-channel@180 {
-				compatible = "fsl,mpc8378-dma-channel", "fsl,elo-dma-channel";
-				reg = <0x180 0x28>;
-				cell-index = <3>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-		};
-
-		usb@23000 {
-			compatible = "fsl-usb2-dr";
-			reg = <0x23000 0x1000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			interrupt-parent = <&ipic>;
-			interrupts = <38 0x8>;
-			dr_mode = "host";
-			phy_type = "ulpi";
-			sleep = <&pmc 0x00c00000>;
-		};
-
-		enet0: ethernet@24000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			cell-index = <0>;
-			device_type = "network";
-			model = "eTSEC";
-			compatible = "gianfar";
-			reg = <0x24000 0x1000>;
-			ranges = <0x0 0x24000 0x1000>;
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <32 0x8 33 0x8 34 0x8>;
-			phy-connection-type = "mii";
-			interrupt-parent = <&ipic>;
-			tbi-handle = <&tbi0>;
-			phy-handle = <&phy2>;
-			sleep = <&pmc 0xc0000000>;
-			fsl,magic-packet;
-
-			mdio@520 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,gianfar-mdio";
-				reg = <0x520 0x20>;
-
-				phy2: ethernet-phy@2 {
-					interrupt-parent = <&ipic>;
-					interrupts = <17 0x8>;
-					reg = <0x2>;
-				};
-
-				phy3: ethernet-phy@3 {
-					interrupt-parent = <&ipic>;
-					interrupts = <18 0x8>;
-					reg = <0x3>;
-				};
-
-				tbi0: tbi-phy@11 {
-					reg = <0x11>;
-					device_type = "tbi-phy";
-				};
-			};
-		};
-
-		enet1: ethernet@25000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			cell-index = <1>;
-			device_type = "network";
-			model = "eTSEC";
-			compatible = "gianfar";
-			reg = <0x25000 0x1000>;
-			ranges = <0x0 0x25000 0x1000>;
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <35 0x8 36 0x8 37 0x8>;
-			phy-connection-type = "mii";
-			interrupt-parent = <&ipic>;
-			tbi-handle = <&tbi1>;
-			phy-handle = <&phy3>;
-			sleep = <&pmc 0x30000000>;
-			fsl,magic-packet;
-
-			mdio@520 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,gianfar-tbi";
-				reg = <0x520 0x20>;
-
-				tbi1: tbi-phy@11 {
-					reg = <0x11>;
-					device_type = "tbi-phy";
-				};
-			};
-		};
-
-		serial0: serial@4500 {
-			cell-index = <0>;
-			device_type = "serial";
-			compatible = "fsl,ns16550", "ns16550";
-			reg = <0x4500 0x100>;
-			clock-frequency = <0>;
-			interrupts = <9 0x8>;
-			interrupt-parent = <&ipic>;
-		};
-
-		serial1: serial@4600 {
-			cell-index = <1>;
-			device_type = "serial";
-			compatible = "fsl,ns16550", "ns16550";
-			reg = <0x4600 0x100>;
-			clock-frequency = <0>;
-			interrupts = <10 0x8>;
-			interrupt-parent = <&ipic>;
-		};
-
-		crypto@30000 {
-			compatible = "fsl,sec3.0", "fsl,sec2.4", "fsl,sec2.2",
-				     "fsl,sec2.1", "fsl,sec2.0";
-			reg = <0x30000 0x10000>;
-			interrupts = <11 0x8>;
-			interrupt-parent = <&ipic>;
-			fsl,num-channels = <4>;
-			fsl,channel-fifo-len = <24>;
-			fsl,exec-units-mask = <0x9fe>;
-			fsl,descriptor-types-mask = <0x3ab0ebf>;
-			sleep = <&pmc 0x03000000>;
-		};
-
-		/* IPIC
-		 * interrupts cell = <intr #, sense>
-		 * sense values match linux IORESOURCE_IRQ_* defines:
-		 * sense == 8: Level, low assertion
-		 * sense == 2: Edge, high-to-low change
-		 */
-		ipic: pic@700 {
-			compatible = "fsl,ipic";
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <2>;
-			reg = <0x700 0x100>;
-		};
-
-		pmc: power@b00 {
-			compatible = "fsl,mpc8378-pmc", "fsl,mpc8349-pmc";
-			reg = <0xb00 0x100 0xa00 0x100>;
-			interrupts = <80 0x8>;
-			interrupt-parent = <&ipic>;
-		};
-	};
-
-	pci0: pci@e0008500 {
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
-		interrupt-map = <
-
-				/* IDSEL 0x11 */
-				 0x8800 0x0 0x0 0x1 &ipic 20 0x8
-				 0x8800 0x0 0x0 0x2 &ipic 21 0x8
-				 0x8800 0x0 0x0 0x3 &ipic 22 0x8
-				 0x8800 0x0 0x0 0x4 &ipic 23 0x8
-
-				/* IDSEL 0x12 */
-				 0x9000 0x0 0x0 0x1 &ipic 22 0x8
-				 0x9000 0x0 0x0 0x2 &ipic 23 0x8
-				 0x9000 0x0 0x0 0x3 &ipic 20 0x8
-				 0x9000 0x0 0x0 0x4 &ipic 21 0x8
-
-				/* IDSEL 0x13 */
-				 0x9800 0x0 0x0 0x1 &ipic 23 0x8
-				 0x9800 0x0 0x0 0x2 &ipic 20 0x8
-				 0x9800 0x0 0x0 0x3 &ipic 21 0x8
-				 0x9800 0x0 0x0 0x4 &ipic 22 0x8
-
-				/* IDSEL 0x15 */
-				 0xa800 0x0 0x0 0x1 &ipic 20 0x8
-				 0xa800 0x0 0x0 0x2 &ipic 21 0x8
-				 0xa800 0x0 0x0 0x3 &ipic 22 0x8
-				 0xa800 0x0 0x0 0x4 &ipic 23 0x8
-
-				/* IDSEL 0x16 */
-				 0xb000 0x0 0x0 0x1 &ipic 23 0x8
-				 0xb000 0x0 0x0 0x2 &ipic 20 0x8
-				 0xb000 0x0 0x0 0x3 &ipic 21 0x8
-				 0xb000 0x0 0x0 0x4 &ipic 22 0x8
-
-				/* IDSEL 0x17 */
-				 0xb800 0x0 0x0 0x1 &ipic 22 0x8
-				 0xb800 0x0 0x0 0x2 &ipic 23 0x8
-				 0xb800 0x0 0x0 0x3 &ipic 20 0x8
-				 0xb800 0x0 0x0 0x4 &ipic 21 0x8
-
-				/* IDSEL 0x18 */
-				 0xc000 0x0 0x0 0x1 &ipic 21 0x8
-				 0xc000 0x0 0x0 0x2 &ipic 22 0x8
-				 0xc000 0x0 0x0 0x3 &ipic 23 0x8
-				 0xc000 0x0 0x0 0x4 &ipic 20 0x8>;
-		interrupt-parent = <&ipic>;
-		interrupts = <66 0x8>;
-		bus-range = <0x0 0x0>;
-		ranges = <0x02000000 0x0 0x90000000 0x90000000 0x0 0x10000000
-		          0x42000000 0x0 0x80000000 0x80000000 0x0 0x10000000
-		          0x01000000 0x0 0x00000000 0xe0300000 0x0 0x00100000>;
-		clock-frequency = <0>;
-		sleep = <&pmc 0x00010000>;
-		#interrupt-cells = <1>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		reg = <0xe0008500 0x100		/* internal registers */
-		       0xe0008300 0x8>;		/* config space access registers */
-		compatible = "fsl,mpc8349-pci";
-		device_type = "pci";
-	};
-
-	pci1: pcie@e0009000 {
-		#address-cells = <3>;
-		#size-cells = <2>;
-		#interrupt-cells = <1>;
-		device_type = "pci";
-		compatible = "fsl,mpc8378-pcie", "fsl,mpc8314-pcie";
-		reg = <0xe0009000 0x00001000>;
-		ranges = <0x02000000 0 0xa8000000 0xa8000000 0 0x10000000
-		          0x01000000 0 0x00000000 0xb8000000 0 0x00800000>;
-		bus-range = <0 255>;
-		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <0 0 0 1 &ipic 1 8
-				 0 0 0 2 &ipic 1 8
-				 0 0 0 3 &ipic 1 8
-				 0 0 0 4 &ipic 1 8>;
-		sleep = <&pmc 0x00300000>;
-		clock-frequency = <0>;
-
-		pcie@0 {
-			#address-cells = <3>;
-			#size-cells = <2>;
-			device_type = "pci";
-			reg = <0 0 0 0 0>;
-			ranges = <0x02000000 0 0xa8000000
-				  0x02000000 0 0xa8000000
-				  0 0x10000000
-				  0x01000000 0 0x00000000
-				  0x01000000 0 0x00000000
-				  0 0x00800000>;
-		};
-	};
-
-	pci2: pcie@e000a000 {
-		#address-cells = <3>;
-		#size-cells = <2>;
-		#interrupt-cells = <1>;
-		device_type = "pci";
-		compatible = "fsl,mpc8378-pcie", "fsl,mpc8314-pcie";
-		reg = <0xe000a000 0x00001000>;
-		ranges = <0x02000000 0 0xc8000000 0xc8000000 0 0x10000000
-			  0x01000000 0 0x00000000 0xd8000000 0 0x00800000>;
-		bus-range = <0 255>;
-		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <0 0 0 1 &ipic 2 8
-				 0 0 0 2 &ipic 2 8
-				 0 0 0 3 &ipic 2 8
-				 0 0 0 4 &ipic 2 8>;
-		sleep = <&pmc 0x000c0000>;
-		clock-frequency = <0>;
-
-		pcie@0 {
-			#address-cells = <3>;
-			#size-cells = <2>;
-			device_type = "pci";
-			reg = <0 0 0 0 0>;
-			ranges = <0x02000000 0 0xc8000000
-				  0x02000000 0 0xc8000000
-				  0 0x10000000
-				  0x01000000 0 0x00000000
-				  0x01000000 0 0x00000000
-				  0 0x00800000>;
-		};
-	};
-};
diff --git a/arch/powerpc/boot/dts/mpc8379_mds.dts b/arch/powerpc/boot/dts/mpc8379_mds.dts
deleted file mode 100644
index f7379a1cbb6c..000000000000
--- a/arch/powerpc/boot/dts/mpc8379_mds.dts
+++ /dev/null
@@ -1,455 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MPC8379E MDS Device Tree Source
- *
- * Copyright 2007 Freescale Semiconductor Inc.
- */
-
-/dts-v1/;
-
-/ {
-	model = "fsl,mpc8379emds";
-	compatible = "fsl,mpc8379emds","fsl,mpc837xmds";
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
-		PowerPC,8379@0 {
-			device_type = "cpu";
-			reg = <0x0>;
-			d-cache-line-size = <32>;
-			i-cache-line-size = <32>;
-			d-cache-size = <32768>;
-			i-cache-size = <32768>;
-			timebase-frequency = <0>;
-			bus-frequency = <0>;
-			clock-frequency = <0>;
-		};
-	};
-
-	memory {
-		device_type = "memory";
-		reg = <0x00000000 0x20000000>;	// 512MB at 0
-	};
-
-	localbus@e0005000 {
-		#address-cells = <2>;
-		#size-cells = <1>;
-		compatible = "fsl,mpc8379-elbc", "fsl,elbc", "simple-bus";
-		reg = <0xe0005000 0x1000>;
-		interrupts = <77 0x8>;
-		interrupt-parent = <&ipic>;
-
-		// booting from NOR flash
-		ranges = <0 0x0 0xfe000000 0x02000000
-		          1 0x0 0xf8000000 0x00008000
-		          3 0x0 0xe0600000 0x00008000>;
-
-		flash@0,0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "cfi-flash";
-			reg = <0 0x0 0x2000000>;
-			bank-width = <2>;
-			device-width = <1>;
-
-			u-boot@0 {
-				reg = <0x0 0x100000>;
-				read-only;
-			};
-
-			fs@100000 {
-				reg = <0x100000 0x800000>;
-			};
-
-			kernel@1d00000 {
-				reg = <0x1d00000 0x200000>;
-			};
-
-			dtb@1f00000 {
-				reg = <0x1f00000 0x100000>;
-			};
-		};
-
-		bcsr@1,0 {
-			reg = <1 0x0 0x8000>;
-			compatible = "fsl,mpc837xmds-bcsr";
-		};
-
-		nand@3,0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,mpc8379-fcm-nand",
-			             "fsl,elbc-fcm-nand";
-			reg = <3 0x0 0x8000>;
-
-			u-boot@0 {
-				reg = <0x0 0x100000>;
-				read-only;
-			};
-
-			kernel@100000 {
-				reg = <0x100000 0x300000>;
-			};
-
-			fs@400000 {
-				reg = <0x400000 0x1c00000>;
-			};
-		};
-	};
-
-	soc@e0000000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		device_type = "soc";
-		compatible = "simple-bus";
-		ranges = <0x0 0xe0000000 0x00100000>;
-		reg = <0xe0000000 0x00000200>;
-		bus-frequency = <0>;
-
-		wdt@200 {
-			compatible = "mpc83xx_wdt";
-			reg = <0x200 0x100>;
-		};
-
-		sleep-nexus {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "simple-bus";
-			sleep = <&pmc 0x0c000000>;
-			ranges;
-
-			i2c@3000 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				cell-index = <0>;
-				compatible = "fsl-i2c";
-				reg = <0x3000 0x100>;
-				interrupts = <14 0x8>;
-				interrupt-parent = <&ipic>;
-				dfsrr;
-
-				rtc@68 {
-					compatible = "dallas,ds1374";
-					reg = <0x68>;
-					interrupts = <19 0x8>;
-					interrupt-parent = <&ipic>;
-				};
-			};
-
-			sdhci@2e000 {
-				compatible = "fsl,mpc8379-esdhc", "fsl,esdhc";
-				reg = <0x2e000 0x1000>;
-				interrupts = <42 0x8>;
-				interrupt-parent = <&ipic>;
-				sdhci,wp-inverted;
-				/* Filled in by U-Boot */
-				clock-frequency = <0>;
-			};
-		};
-
-		i2c@3100 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			cell-index = <1>;
-			compatible = "fsl-i2c";
-			reg = <0x3100 0x100>;
-			interrupts = <15 0x8>;
-			interrupt-parent = <&ipic>;
-			dfsrr;
-		};
-
-		spi@7000 {
-			cell-index = <0>;
-			compatible = "fsl,spi";
-			reg = <0x7000 0x1000>;
-			interrupts = <16 0x8>;
-			interrupt-parent = <&ipic>;
-			mode = "cpu";
-		};
-
-		dma@82a8 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,mpc8379-dma", "fsl,elo-dma";
-			reg = <0x82a8 4>;
-			ranges = <0 0x8100 0x1a8>;
-			interrupt-parent = <&ipic>;
-			interrupts = <71 8>;
-			cell-index = <0>;
-			dma-channel@0 {
-				compatible = "fsl,mpc8379-dma-channel", "fsl,elo-dma-channel";
-				reg = <0 0x80>;
-				cell-index = <0>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-			dma-channel@80 {
-				compatible = "fsl,mpc8379-dma-channel", "fsl,elo-dma-channel";
-				reg = <0x80 0x80>;
-				cell-index = <1>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-			dma-channel@100 {
-				compatible = "fsl,mpc8379-dma-channel", "fsl,elo-dma-channel";
-				reg = <0x100 0x80>;
-				cell-index = <2>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-			dma-channel@180 {
-				compatible = "fsl,mpc8379-dma-channel", "fsl,elo-dma-channel";
-				reg = <0x180 0x28>;
-				cell-index = <3>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-		};
-
-		usb@23000 {
-			compatible = "fsl-usb2-dr";
-			reg = <0x23000 0x1000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			interrupt-parent = <&ipic>;
-			interrupts = <38 0x8>;
-			dr_mode = "host";
-			phy_type = "ulpi";
-			sleep = <&pmc 0x00c00000>;
-		};
-
-		enet0: ethernet@24000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			cell-index = <0>;
-			device_type = "network";
-			model = "eTSEC";
-			compatible = "gianfar";
-			reg = <0x24000 0x1000>;
-			ranges = <0x0 0x24000 0x1000>;
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <32 0x8 33 0x8 34 0x8>;
-			phy-connection-type = "mii";
-			interrupt-parent = <&ipic>;
-			tbi-handle = <&tbi0>;
-			phy-handle = <&phy2>;
-			sleep = <&pmc 0xc0000000>;
-			fsl,magic-packet;
-
-			mdio@520 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,gianfar-mdio";
-				reg = <0x520 0x20>;
-
-				phy2: ethernet-phy@2 {
-					interrupt-parent = <&ipic>;
-					interrupts = <17 0x8>;
-					reg = <0x2>;
-				};
-
-				phy3: ethernet-phy@3 {
-					interrupt-parent = <&ipic>;
-					interrupts = <18 0x8>;
-					reg = <0x3>;
-				};
-
-				tbi0: tbi-phy@11 {
-					reg = <0x11>;
-					device_type = "tbi-phy";
-				};
-			};
-		};
-
-		enet1: ethernet@25000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			cell-index = <1>;
-			device_type = "network";
-			model = "eTSEC";
-			compatible = "gianfar";
-			reg = <0x25000 0x1000>;
-			ranges = <0x0 0x25000 0x1000>;
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <35 0x8 36 0x8 37 0x8>;
-			phy-connection-type = "mii";
-			interrupt-parent = <&ipic>;
-			tbi-handle = <&tbi1>;
-			phy-handle = <&phy3>;
-			sleep = <&pmc 0x30000000>;
-			fsl,magic-packet;
-
-			mdio@520 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,gianfar-tbi";
-				reg = <0x520 0x20>;
-
-				tbi1: tbi-phy@11 {
-					reg = <0x11>;
-					device_type = "tbi-phy";
-				};
-			};
-		};
-
-		serial0: serial@4500 {
-			cell-index = <0>;
-			device_type = "serial";
-			compatible = "fsl,ns16550", "ns16550";
-			reg = <0x4500 0x100>;
-			clock-frequency = <0>;
-			interrupts = <9 0x8>;
-			interrupt-parent = <&ipic>;
-		};
-
-		serial1: serial@4600 {
-			cell-index = <1>;
-			device_type = "serial";
-			compatible = "fsl,ns16550", "ns16550";
-			reg = <0x4600 0x100>;
-			clock-frequency = <0>;
-			interrupts = <10 0x8>;
-			interrupt-parent = <&ipic>;
-		};
-
-		crypto@30000 {
-			compatible = "fsl,sec3.0", "fsl,sec2.4", "fsl,sec2.2",
-				     "fsl,sec2.1", "fsl,sec2.0";
-			reg = <0x30000 0x10000>;
-			interrupts = <11 0x8>;
-			interrupt-parent = <&ipic>;
-			fsl,num-channels = <4>;
-			fsl,channel-fifo-len = <24>;
-			fsl,exec-units-mask = <0x9fe>;
-			fsl,descriptor-types-mask = <0x3ab0ebf>;
-			sleep = <&pmc 0x03000000>;
-		};
-
-		sata@18000 {
-			compatible = "fsl,mpc8379-sata", "fsl,pq-sata";
-			reg = <0x18000 0x1000>;
-			interrupts = <44 0x8>;
-			interrupt-parent = <&ipic>;
-			sleep = <&pmc 0x000000c0>;
-		};
-
-		sata@19000 {
-			compatible = "fsl,mpc8379-sata", "fsl,pq-sata";
-			reg = <0x19000 0x1000>;
-			interrupts = <45 0x8>;
-			interrupt-parent = <&ipic>;
-			sleep = <&pmc 0x00000030>;
-		};
-
-		sata@1a000 {
-			compatible = "fsl,mpc8379-sata", "fsl,pq-sata";
-			reg = <0x1a000 0x1000>;
-			interrupts = <46 0x8>;
-			interrupt-parent = <&ipic>;
-			sleep = <&pmc 0x0000000c>;
-		};
-
-		sata@1b000 {
-			compatible = "fsl,mpc8379-sata", "fsl,pq-sata";
-			reg = <0x1b000 0x1000>;
-			interrupts = <47 0x8>;
-			interrupt-parent = <&ipic>;
-			sleep = <&pmc 0x00000003>;
-		};
-
-		/* IPIC
-		 * interrupts cell = <intr #, sense>
-		 * sense values match linux IORESOURCE_IRQ_* defines:
-		 * sense == 8: Level, low assertion
-		 * sense == 2: Edge, high-to-low change
-		 */
-		ipic: pic@700 {
-			compatible = "fsl,ipic";
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <2>;
-			reg = <0x700 0x100>;
-		};
-
-		pmc: power@b00 {
-			compatible = "fsl,mpc8379-pmc", "fsl,mpc8349-pmc";
-			reg = <0xb00 0x100 0xa00 0x100>;
-			interrupts = <80 0x8>;
-			interrupt-parent = <&ipic>;
-		};
-	};
-
-	pci0: pci@e0008500 {
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
-		interrupt-map = <
-
-				/* IDSEL 0x11 */
-				 0x8800 0x0 0x0 0x1 &ipic 20 0x8
-				 0x8800 0x0 0x0 0x2 &ipic 21 0x8
-				 0x8800 0x0 0x0 0x3 &ipic 22 0x8
-				 0x8800 0x0 0x0 0x4 &ipic 23 0x8
-
-				/* IDSEL 0x12 */
-				 0x9000 0x0 0x0 0x1 &ipic 22 0x8
-				 0x9000 0x0 0x0 0x2 &ipic 23 0x8
-				 0x9000 0x0 0x0 0x3 &ipic 20 0x8
-				 0x9000 0x0 0x0 0x4 &ipic 21 0x8
-
-				/* IDSEL 0x13 */
-				 0x9800 0x0 0x0 0x1 &ipic 23 0x8
-				 0x9800 0x0 0x0 0x2 &ipic 20 0x8
-				 0x9800 0x0 0x0 0x3 &ipic 21 0x8
-				 0x9800 0x0 0x0 0x4 &ipic 22 0x8
-
-				/* IDSEL 0x15 */
-				 0xa800 0x0 0x0 0x1 &ipic 20 0x8
-				 0xa800 0x0 0x0 0x2 &ipic 21 0x8
-				 0xa800 0x0 0x0 0x3 &ipic 22 0x8
-				 0xa800 0x0 0x0 0x4 &ipic 23 0x8
-
-				/* IDSEL 0x16 */
-				 0xb000 0x0 0x0 0x1 &ipic 23 0x8
-				 0xb000 0x0 0x0 0x2 &ipic 20 0x8
-				 0xb000 0x0 0x0 0x3 &ipic 21 0x8
-				 0xb000 0x0 0x0 0x4 &ipic 22 0x8
-
-				/* IDSEL 0x17 */
-				 0xb800 0x0 0x0 0x1 &ipic 22 0x8
-				 0xb800 0x0 0x0 0x2 &ipic 23 0x8
-				 0xb800 0x0 0x0 0x3 &ipic 20 0x8
-				 0xb800 0x0 0x0 0x4 &ipic 21 0x8
-
-				/* IDSEL 0x18 */
-				 0xc000 0x0 0x0 0x1 &ipic 21 0x8
-				 0xc000 0x0 0x0 0x2 &ipic 22 0x8
-				 0xc000 0x0 0x0 0x3 &ipic 23 0x8
-				 0xc000 0x0 0x0 0x4 &ipic 20 0x8>;
-		interrupt-parent = <&ipic>;
-		interrupts = <66 0x8>;
-		bus-range = <0x0 0x0>;
-		ranges = <0x02000000 0x0 0x90000000 0x90000000 0x0 0x10000000
-		          0x42000000 0x0 0x80000000 0x80000000 0x0 0x10000000
-		          0x01000000 0x0 0x00000000 0xe0300000 0x0 0x00100000>;
-		sleep = <&pmc 0x00010000>;
-		clock-frequency = <0>;
-		#interrupt-cells = <1>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		reg = <0xe0008500 0x100		/* internal registers */
-		       0xe0008300 0x8>;		/* config space access registers */
-		compatible = "fsl,mpc8349-pci";
-		device_type = "pci";
-	};
-};
diff --git a/arch/powerpc/configs/83xx/mpc837x_mds_defconfig b/arch/powerpc/configs/83xx/mpc837x_mds_defconfig
deleted file mode 100644
index 3f5e5d10789f..000000000000
--- a/arch/powerpc/configs/83xx/mpc837x_mds_defconfig
+++ /dev/null
@@ -1,58 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-CONFIG_SLAB=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_PARTITION_ADVANCED=y
-# CONFIG_PPC_CHRP is not set
-# CONFIG_PPC_PMAC is not set
-CONFIG_PPC_83xx=y
-CONFIG_MPC837x_MDS=y
-CONFIG_GEN_RTC=y
-CONFIG_PCI=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_XFRM_USER=m
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
-CONFIG_BLK_DEV_RAM_SIZE=32768
-CONFIG_BLK_DEV_SD=y
-CONFIG_CHR_DEV_SG=y
-CONFIG_ATA=y
-CONFIG_SATA_FSL=y
-CONFIG_NETDEVICES=y
-CONFIG_GIANFAR=y
-CONFIG_MARVELL_PHY=y
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-# CONFIG_HW_RANDOM is not set
-CONFIG_I2C=y
-CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_MPC=y
-CONFIG_WATCHDOG=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT4_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_NFS_FS=y
-CONFIG_NFS_V4=y
-CONFIG_ROOT_NFS=y
-CONFIG_CRC_T10DIF=y
-CONFIG_CRYPTO_ECB=m
-CONFIG_CRYPTO_PCBC=m
diff --git a/arch/powerpc/configs/mpc83xx_defconfig b/arch/powerpc/configs/mpc83xx_defconfig
index 0fa29520808f..943c2d51bb60 100644
--- a/arch/powerpc/configs/mpc83xx_defconfig
+++ b/arch/powerpc/configs/mpc83xx_defconfig
@@ -15,7 +15,6 @@ CONFIG_MPC832x_MDS=y
 CONFIG_MPC832x_RDB=y
 CONFIG_MPC834x_ITX=y
 CONFIG_MPC836x_RDK=y
-CONFIG_MPC837x_MDS=y
 CONFIG_MPC837x_RDB=y
 CONFIG_ASP834x=y
 CONFIG_QE_GPIO=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 71f5ea8f76a5..f08a7f43c629 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -48,7 +48,6 @@ CONFIG_MPC832x_MDS=y
 CONFIG_MPC832x_RDB=y
 CONFIG_MPC834x_ITX=y
 CONFIG_MPC836x_RDK=y
-CONFIG_MPC837x_MDS=y
 CONFIG_MPC837x_RDB=y
 CONFIG_ASP834x=y
 CONFIG_PPC_86xx=y
diff --git a/arch/powerpc/platforms/83xx/Kconfig b/arch/powerpc/platforms/83xx/Kconfig
index 90d0041fb8a7..978d2b12e97c 100644
--- a/arch/powerpc/platforms/83xx/Kconfig
+++ b/arch/powerpc/platforms/83xx/Kconfig
@@ -58,13 +58,6 @@ config MPC836x_RDK
 	  This option enables support for the MPC836x RDK Processor Board,
 	  also known as ZOOM PowerQUICC Kit.
 
-config MPC837x_MDS
-	bool "Freescale MPC837x MDS"
-	select DEFAULT_UIMAGE
-	select PPC_MPC837x
-	help
-	  This option enables support for the MPC837x MDS Processor Board.
-
 config MPC837x_RDB
 	bool "Freescale MPC837x RDB/WLAN"
 	select DEFAULT_UIMAGE
diff --git a/arch/powerpc/platforms/83xx/Makefile b/arch/powerpc/platforms/83xx/Makefile
index 4f979f2fc64e..0c3a5067bd77 100644
--- a/arch/powerpc/platforms/83xx/Makefile
+++ b/arch/powerpc/platforms/83xx/Makefile
@@ -11,7 +11,6 @@ obj-$(CONFIG_MPC832x_RDB)	+= mpc832x_rdb.o
 obj-$(CONFIG_MPC834x_ITX)	+= mpc834x_itx.o
 obj-$(CONFIG_MPC836x_RDK)	+= mpc836x_rdk.o
 obj-$(CONFIG_MPC832x_MDS)	+= mpc832x_mds.o
-obj-$(CONFIG_MPC837x_MDS)	+= mpc837x_mds.o
 obj-$(CONFIG_MPC837x_RDB)	+= mpc837x_rdb.o
 obj-$(CONFIG_ASP834x)		+= asp834x.o
 obj-$(CONFIG_KMETER1)		+= km83xx.o
diff --git a/arch/powerpc/platforms/83xx/mpc837x_mds.c b/arch/powerpc/platforms/83xx/mpc837x_mds.c
deleted file mode 100644
index fa3538803af7..000000000000
--- a/arch/powerpc/platforms/83xx/mpc837x_mds.c
+++ /dev/null
@@ -1,103 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * arch/powerpc/platforms/83xx/mpc837x_mds.c
- *
- * Copyright (C) 2007 Freescale Semiconductor, Inc. All rights reserved.
- *
- * MPC837x MDS board specific routines
- */
-
-#include <linux/pci.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_platform.h>
-
-#include <asm/time.h>
-#include <asm/ipic.h>
-#include <asm/udbg.h>
-#include <sysdev/fsl_pci.h>
-
-#include "mpc83xx.h"
-
-#define BCSR12_USB_SER_MASK	0x8a
-#define BCSR12_USB_SER_PIN	0x80
-#define BCSR12_USB_SER_DEVICE	0x02
-
-static int __init mpc837xmds_usb_cfg(void)
-{
-	struct device_node *np;
-	const void *phy_type, *mode;
-	void __iomem *bcsr_regs = NULL;
-	u8 bcsr12;
-	int ret;
-
-	ret = mpc837x_usb_cfg();
-	if (ret)
-		return ret;
-	/* Map BCSR area */
-	np = of_find_compatible_node(NULL, NULL, "fsl,mpc837xmds-bcsr");
-	if (np) {
-		bcsr_regs = of_iomap(np, 0);
-		of_node_put(np);
-	}
-	if (!bcsr_regs)
-		return -1;
-
-	np = of_find_node_by_name(NULL, "usb");
-	if (!np) {
-		ret = -ENODEV;
-		goto out;
-	}
-	phy_type = of_get_property(np, "phy_type", NULL);
-	if (phy_type && !strcmp(phy_type, "ulpi")) {
-		clrbits8(bcsr_regs + 12, BCSR12_USB_SER_PIN);
-	} else if (phy_type && !strcmp(phy_type, "serial")) {
-		mode = of_get_property(np, "dr_mode", NULL);
-		bcsr12 = in_8(bcsr_regs + 12) & ~BCSR12_USB_SER_MASK;
-		bcsr12 |= BCSR12_USB_SER_PIN;
-		if (mode && !strcmp(mode, "peripheral"))
-			bcsr12 |= BCSR12_USB_SER_DEVICE;
-		out_8(bcsr_regs + 12, bcsr12);
-	} else {
-		printk(KERN_ERR "USB DR: unsupported PHY\n");
-	}
-
-	of_node_put(np);
-out:
-	iounmap(bcsr_regs);
-	return ret;
-}
-
-/* ************************************************************************
- *
- * Setup the architecture
- *
- */
-static void __init mpc837x_mds_setup_arch(void)
-{
-	mpc83xx_setup_arch();
-	mpc837xmds_usb_cfg();
-}
-
-machine_device_initcall(mpc837x_mds, mpc83xx_declare_of_platform_devices);
-
-/*
- * Called very early, MMU is off, device-tree isn't unflattened
- */
-static int __init mpc837x_mds_probe(void)
-{
-	return of_machine_is_compatible("fsl,mpc837xmds");
-}
-
-define_machine(mpc837x_mds) {
-	.name			= "MPC837x MDS",
-	.probe			= mpc837x_mds_probe,
-	.setup_arch		= mpc837x_mds_setup_arch,
-	.discover_phbs  	= mpc83xx_setup_pci,
-	.init_IRQ		= mpc83xx_ipic_init_IRQ,
-	.get_irq		= ipic_get_irq,
-	.restart		= mpc83xx_restart,
-	.time_init		= mpc83xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
-};
-- 
2.17.1

