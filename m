Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C3973630F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 07:15:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=O0qJ5rDp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlZbF45c3z3bVw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 15:15:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=O0qJ5rDp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.178.238; helo=mx0b-0064b401.pphosted.com; envelope-from=prvs=5535a9ab19=paul.gortmaker@windriver.com; receiver=lists.ozlabs.org)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlZZG6jnxz30J1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 15:14:44 +1000 (AEST)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35K4Wfwq016621;
	Tue, 20 Jun 2023 04:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=StiEzOQxkV71wIVBJLSLVwofKQlvQZZ2y/vVAFArzWs=;
 b=O0qJ5rDpAn+VrO8/KK7gVHBMniT44jEP8czmRvylP3+2yzHibtIF2ivveLdFhy7MLzkM
 Mf+7+fiK9xg+mLPzlSzM2teNGSjsbC7F7auReA4a/iHP5xdctGxgMz+82FN83Xqlp23q
 LIcevKUvpSlk4MR0roNbQC+PiCVkzZ0V71Rtyvbr0KYBWdzg4UNQKMW0sXOYc7SmdCZM
 u86KmVByfAHKXQJyZjS/byqvcxICPZCWtJNIpwguS2L6/8BkauwuK4f3CIgEU/CMyjGL
 EOwU8nFCFRAjQH2I5CREsheAB1vrGQbPy6IRAsOVHPbM3pzvLPgX8F5J0Kf7nX1yteN9 HA== 
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r93t8a644-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 20 Jun 2023 04:33:11 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 19 Jun 2023 21:33:09 -0700
Received: from sc2600cp.wrs.com (128.224.56.77) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Mon, 19 Jun 2023 21:33:08 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/2] powerpc: drop MPC85xx_CDS platform support
Date: Tue, 20 Jun 2023 00:33:00 -0400
Message-ID: <20230620043300.197546-3-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230620043300.197546-1-paul.gortmaker@windriver.com>
References: <20230620043300.197546-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: W2CMWik6WMBV9BWCqq7UpK76snVaqXTy
X-Proofpoint-ORIG-GUID: W2CMWik6WMBV9BWCqq7UpK76snVaqXTy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-20_01,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306200040
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

The MPC8541/8548/8555 Configurable Development System (CDS) were the
vehicle used to provide evaluation of the 1st e500-v2 CPUs around 2007.

Similar to the earlier MPC83xx-MDS systems we removed, the "brains"
exist on a PCI-X card, but additional connectors exist to the right of
the PCI-X slot, two structural metal pins are used to provide stability
in a vertical ATX mounting, and the CPU is now on a daughter-card vs. a
clamped down BGA.

Given the extra complexity and risk of connector damage, the 8548CDS
I had access to came pre-assembled in a basic white Antec case common
for that era, and I'm inclined to assume that was the default.

Power was typical "Pentium4" 2005 ATX - the main 20 pin connector went
to the PCI ATX form factor backplane, and the 4 pin black/yellow went
to the CPU card.

Like previous evaluation boards, they attempted to provide break-out
connectors for as many features as possible, and that made for a fairly
complex looking system.

In any case, these are over 15 years old, and fairly complex systems,
originally made for a small group of industry related people, and made
for use where quiet fan operation wasn't important.  Given that, it
makes sense to remove support from them in 2023.

Cc: Scott Wood <oss@buserror.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/powerpc/boot/Makefile                    |   3 -
 arch/powerpc/boot/dts/fsl/mpc8541cds.dts      | 375 -----------------
 arch/powerpc/boot/dts/fsl/mpc8548cds.dtsi     | 302 --------------
 arch/powerpc/boot/dts/fsl/mpc8548cds_32b.dts  |  82 ----
 arch/powerpc/boot/dts/fsl/mpc8548cds_36b.dts  |  82 ----
 arch/powerpc/boot/dts/fsl/mpc8555cds.dts      | 375 -----------------
 .../configs/85xx/mpc85xx_cds_defconfig        |  52 ---
 arch/powerpc/configs/mpc85xx_base.config      |   1 -
 arch/powerpc/platforms/85xx/Makefile          |   1 -
 arch/powerpc/platforms/85xx/mpc85xx_cds.c     | 387 ------------------
 10 files changed, 1660 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8541cds.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8548cds.dtsi
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8548cds_32b.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8548cds_36b.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8555cds.dts
 delete mode 100644 arch/powerpc/configs/85xx/mpc85xx_cds_defconfig
 delete mode 100644 arch/powerpc/platforms/85xx/mpc85xx_cds.c

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index cf728cb3e9a9..968aee2025b8 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -342,9 +342,6 @@ image-$(CONFIG_MPC834x_ITX)		+= cuImage.mpc8349emitx \
 image-$(CONFIG_ASP834x)			+= dtbImage.asp834x-redboot
 
 # Board ports in arch/powerpc/platform/85xx/Kconfig
-image-$(CONFIG_MPC85xx_CDS)		+= cuImage.mpc8541cds \
-					   cuImage.mpc8548cds_32b \
-					   cuImage.mpc8555cds
 image-$(CONFIG_MPC85xx_MDS)		+= cuImage.mpc8568mds
 image-$(CONFIG_MPC85xx_DS)		+= cuImage.mpc8544ds \
 					   cuImage.mpc8572ds
diff --git a/arch/powerpc/boot/dts/fsl/mpc8541cds.dts b/arch/powerpc/boot/dts/fsl/mpc8541cds.dts
deleted file mode 100644
index a2a6c5cf852e..000000000000
--- a/arch/powerpc/boot/dts/fsl/mpc8541cds.dts
+++ /dev/null
@@ -1,375 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MPC8541 CDS Device Tree Source
- *
- * Copyright 2006, 2008 Freescale Semiconductor Inc.
- */
-
-/dts-v1/;
-
-/include/ "e500v1_power_isa.dtsi"
-
-/ {
-	model = "MPC8541CDS";
-	compatible = "MPC8541CDS", "MPC85xxCDS";
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
-	};
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		PowerPC,8541@0 {
-			device_type = "cpu";
-			reg = <0x0>;
-			d-cache-line-size = <32>;	// 32 bytes
-			i-cache-line-size = <32>;	// 32 bytes
-			d-cache-size = <0x8000>;		// L1, 32K
-			i-cache-size = <0x8000>;		// L1, 32K
-			timebase-frequency = <0>;	//  33 MHz, from uboot
-			bus-frequency = <0>;	// 166 MHz
-			clock-frequency = <0>;	// 825 MHz, from uboot
-			next-level-cache = <&L2>;
-		};
-	};
-
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x8000000>;	// 128M at 0x0
-	};
-
-	soc8541@e0000000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		device_type = "soc";
-		compatible = "simple-bus";
-		ranges = <0x0 0xe0000000 0x100000>;
-		bus-frequency = <0>;
-
-		ecm-law@0 {
-			compatible = "fsl,ecm-law";
-			reg = <0x0 0x1000>;
-			fsl,num-laws = <8>;
-		};
-
-		ecm@1000 {
-			compatible = "fsl,mpc8541-ecm", "fsl,ecm";
-			reg = <0x1000 0x1000>;
-			interrupts = <17 2>;
-			interrupt-parent = <&mpic>;
-		};
-
-		memory-controller@2000 {
-			compatible = "fsl,mpc8541-memory-controller";
-			reg = <0x2000 0x1000>;
-			interrupt-parent = <&mpic>;
-			interrupts = <18 2>;
-		};
-
-		L2: l2-cache-controller@20000 {
-			compatible = "fsl,mpc8541-l2-cache-controller";
-			reg = <0x20000 0x1000>;
-			cache-line-size = <32>;	// 32 bytes
-			cache-size = <0x40000>;	// L2, 256K
-			interrupt-parent = <&mpic>;
-			interrupts = <16 2>;
-		};
-
-		i2c@3000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			cell-index = <0>;
-			compatible = "fsl-i2c";
-			reg = <0x3000 0x100>;
-			interrupts = <43 2>;
-			interrupt-parent = <&mpic>;
-			dfsrr;
-		};
-
-		dma@21300 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,mpc8541-dma", "fsl,eloplus-dma";
-			reg = <0x21300 0x4>;
-			ranges = <0x0 0x21100 0x200>;
-			cell-index = <0>;
-			dma-channel@0 {
-				compatible = "fsl,mpc8541-dma-channel",
-						"fsl,eloplus-dma-channel";
-				reg = <0x0 0x80>;
-				cell-index = <0>;
-				interrupt-parent = <&mpic>;
-				interrupts = <20 2>;
-			};
-			dma-channel@80 {
-				compatible = "fsl,mpc8541-dma-channel",
-						"fsl,eloplus-dma-channel";
-				reg = <0x80 0x80>;
-				cell-index = <1>;
-				interrupt-parent = <&mpic>;
-				interrupts = <21 2>;
-			};
-			dma-channel@100 {
-				compatible = "fsl,mpc8541-dma-channel",
-						"fsl,eloplus-dma-channel";
-				reg = <0x100 0x80>;
-				cell-index = <2>;
-				interrupt-parent = <&mpic>;
-				interrupts = <22 2>;
-			};
-			dma-channel@180 {
-				compatible = "fsl,mpc8541-dma-channel",
-						"fsl,eloplus-dma-channel";
-				reg = <0x180 0x80>;
-				cell-index = <3>;
-				interrupt-parent = <&mpic>;
-				interrupts = <23 2>;
-			};
-		};
-
-		enet0: ethernet@24000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			cell-index = <0>;
-			device_type = "network";
-			model = "TSEC";
-			compatible = "gianfar";
-			reg = <0x24000 0x1000>;
-			ranges = <0x0 0x24000 0x1000>;
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <29 2 30 2 34 2>;
-			interrupt-parent = <&mpic>;
-			tbi-handle = <&tbi0>;
-			phy-handle = <&phy0>;
-
-			mdio@520 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,gianfar-mdio";
-				reg = <0x520 0x20>;
-
-				phy0: ethernet-phy@0 {
-					interrupt-parent = <&mpic>;
-					interrupts = <5 1>;
-					reg = <0x0>;
-				};
-				phy1: ethernet-phy@1 {
-					interrupt-parent = <&mpic>;
-					interrupts = <5 1>;
-					reg = <0x1>;
-				};
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
-			model = "TSEC";
-			compatible = "gianfar";
-			reg = <0x25000 0x1000>;
-			ranges = <0x0 0x25000 0x1000>;
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <35 2 36 2 40 2>;
-			interrupt-parent = <&mpic>;
-			tbi-handle = <&tbi1>;
-			phy-handle = <&phy1>;
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
-			reg = <0x4500 0x100>; 	// reg base, size
-			clock-frequency = <0>; 	// should we fill in in uboot?
-			interrupts = <42 2>;
-			interrupt-parent = <&mpic>;
-		};
-
-		serial1: serial@4600 {
-			cell-index = <1>;
-			device_type = "serial";
-			compatible = "fsl,ns16550", "ns16550";
-			reg = <0x4600 0x100>;	// reg base, size
-			clock-frequency = <0>; 	// should we fill in in uboot?
-			interrupts = <42 2>;
-			interrupt-parent = <&mpic>;
-		};
-
-		crypto@30000 {
-			compatible = "fsl,sec2.0";
-			reg = <0x30000 0x10000>;
-			interrupts = <45 2>;
-			interrupt-parent = <&mpic>;
-			fsl,num-channels = <4>;
-			fsl,channel-fifo-len = <24>;
-			fsl,exec-units-mask = <0x7e>;
-			fsl,descriptor-types-mask = <0x01010ebf>;
-		};
-
-		mpic: pic@40000 {
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <2>;
-			reg = <0x40000 0x40000>;
-			compatible = "chrp,open-pic";
-			device_type = "open-pic";
-		};
-
-		cpm@919c0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,mpc8541-cpm", "fsl,cpm2";
-			reg = <0x919c0 0x30>;
-			ranges;
-
-			muram@80000 {
-				#address-cells = <1>;
-				#size-cells = <1>;
-				ranges = <0x0 0x80000 0x10000>;
-
-				data@0 {
-					compatible = "fsl,cpm-muram-data";
-					reg = <0x0 0x2000 0x9000 0x1000>;
-				};
-			};
-
-			brg@919f0 {
-				compatible = "fsl,mpc8541-brg",
-				             "fsl,cpm2-brg",
-				             "fsl,cpm-brg";
-				reg = <0x919f0 0x10 0x915f0 0x10>;
-			};
-
-			cpmpic: pic@90c00 {
-				interrupt-controller;
-				#address-cells = <0>;
-				#interrupt-cells = <2>;
-				interrupts = <46 2>;
-				interrupt-parent = <&mpic>;
-				reg = <0x90c00 0x80>;
-				compatible = "fsl,mpc8541-cpm-pic", "fsl,cpm2-pic";
-			};
-		};
-	};
-
-	pci0: pci@e0008000 {
-		interrupt-map-mask = <0x1f800 0x0 0x0 0x7>;
-		interrupt-map = <
-
-			/* IDSEL 0x10 */
-			0x8000 0x0 0x0 0x1 &mpic 0x0 0x1
-			0x8000 0x0 0x0 0x2 &mpic 0x1 0x1
-			0x8000 0x0 0x0 0x3 &mpic 0x2 0x1
-			0x8000 0x0 0x0 0x4 &mpic 0x3 0x1
-
-			/* IDSEL 0x11 */
-			0x8800 0x0 0x0 0x1 &mpic 0x0 0x1
-			0x8800 0x0 0x0 0x2 &mpic 0x1 0x1
-			0x8800 0x0 0x0 0x3 &mpic 0x2 0x1
-			0x8800 0x0 0x0 0x4 &mpic 0x3 0x1
-
-			/* IDSEL 0x12 (Slot 1) */
-			0x9000 0x0 0x0 0x1 &mpic 0x0 0x1
-			0x9000 0x0 0x0 0x2 &mpic 0x1 0x1
-			0x9000 0x0 0x0 0x3 &mpic 0x2 0x1
-			0x9000 0x0 0x0 0x4 &mpic 0x3 0x1
-
-			/* IDSEL 0x13 (Slot 2) */
-			0x9800 0x0 0x0 0x1 &mpic 0x1 0x1
-			0x9800 0x0 0x0 0x2 &mpic 0x2 0x1
-			0x9800 0x0 0x0 0x3 &mpic 0x3 0x1
-			0x9800 0x0 0x0 0x4 &mpic 0x0 0x1
-
-			/* IDSEL 0x14 (Slot 3) */
-			0xa000 0x0 0x0 0x1 &mpic 0x2 0x1
-			0xa000 0x0 0x0 0x2 &mpic 0x3 0x1
-			0xa000 0x0 0x0 0x3 &mpic 0x0 0x1
-			0xa000 0x0 0x0 0x4 &mpic 0x1 0x1
-
-			/* IDSEL 0x15 (Slot 4) */
-			0xa800 0x0 0x0 0x1 &mpic 0x3 0x1
-			0xa800 0x0 0x0 0x2 &mpic 0x0 0x1
-			0xa800 0x0 0x0 0x3 &mpic 0x1 0x1
-			0xa800 0x0 0x0 0x4 &mpic 0x2 0x1
-
-			/* Bus 1 (Tundra Bridge) */
-			/* IDSEL 0x12 (ISA bridge) */
-			0x19000 0x0 0x0 0x1 &mpic 0x0 0x1
-			0x19000 0x0 0x0 0x2 &mpic 0x1 0x1
-			0x19000 0x0 0x0 0x3 &mpic 0x2 0x1
-			0x19000 0x0 0x0 0x4 &mpic 0x3 0x1>;
-		interrupt-parent = <&mpic>;
-		interrupts = <24 2>;
-		bus-range = <0 0>;
-		ranges = <0x2000000 0x0 0x80000000 0x80000000 0x0 0x20000000
-			  0x1000000 0x0 0x0 0xe2000000 0x0 0x100000>;
-		clock-frequency = <66666666>;
-		#interrupt-cells = <1>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		reg = <0xe0008000 0x1000>;
-		compatible = "fsl,mpc8540-pci";
-		device_type = "pci";
-
-		i8259@19000 {
-			interrupt-controller;
-			device_type = "interrupt-controller";
-			reg = <0x19000 0x0 0x0 0x0 0x1>;
-			#address-cells = <0>;
-			#interrupt-cells = <2>;
-			compatible = "chrp,iic";
-			interrupts = <1>;
-			interrupt-parent = <&pci0>;
-		};
-	};
-
-	pci1: pci@e0009000 {
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
-		interrupt-map = <
-
-			/* IDSEL 0x15 */
-			0xa800 0x0 0x0 0x1 &mpic 0xb 0x1
-			0xa800 0x0 0x0 0x2 &mpic 0xb 0x1
-			0xa800 0x0 0x0 0x3 &mpic 0xb 0x1
-			0xa800 0x0 0x0 0x4 &mpic 0xb 0x1>;
-		interrupt-parent = <&mpic>;
-		interrupts = <25 2>;
-		bus-range = <0 0>;
-		ranges = <0x2000000 0x0 0xa0000000 0xa0000000 0x0 0x20000000
-			  0x1000000 0x0 0x0 0xe3000000 0x0 0x100000>;
-		clock-frequency = <66666666>;
-		#interrupt-cells = <1>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		reg = <0xe0009000 0x1000>;
-		compatible = "fsl,mpc8540-pci";
-		device_type = "pci";
-	};
-};
diff --git a/arch/powerpc/boot/dts/fsl/mpc8548cds.dtsi b/arch/powerpc/boot/dts/fsl/mpc8548cds.dtsi
deleted file mode 100644
index 3bc7d4711220..000000000000
--- a/arch/powerpc/boot/dts/fsl/mpc8548cds.dtsi
+++ /dev/null
@@ -1,302 +0,0 @@
-/*
- * MPC8548CDS Device Tree Source stub (no addresses or top-level ranges)
- *
- * Copyright 2012 Freescale Semiconductor Inc.
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions are met:
- *     * Redistributions of source code must retain the above copyright
- *       notice, this list of conditions and the following disclaimer.
- *     * Redistributions in binary form must reproduce the above copyright
- *       notice, this list of conditions and the following disclaimer in the
- *       documentation and/or other materials provided with the distribution.
- *     * Neither the name of Freescale Semiconductor nor the
- *       names of its contributors may be used to endorse or promote products
- *       derived from this software without specific prior written permission.
- *
- *
- * ALTERNATIVELY, this software may be distributed under the terms of the
- * GNU General Public License ("GPL") as published by the Free Software
- * Foundation, either version 2 of that License or (at your option) any
- * later version.
- *
- * THIS SOFTWARE IS PROVIDED BY Freescale Semiconductor ``AS IS'' AND ANY
- * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
- * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
- * DISCLAIMED. IN NO EVENT SHALL Freescale Semiconductor BE LIABLE FOR ANY
- * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
- * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
- * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
- * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
- * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- */
-
-&board_lbc {
-	nor@0,0 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "cfi-flash";
-		reg = <0x0 0x0 0x01000000>;
-		bank-width = <2>;
-		device-width = <2>;
-
-		partition@0 {
-			reg = <0x0 0x0b00000>;
-			label = "ramdisk-nor";
-		};
-
-		partition@300000 {
-			reg = <0x0b00000 0x0400000>;
-			label = "kernel-nor";
-		};
-
-		partition@700000 {
-			reg = <0x0f00000 0x060000>;
-			label = "dtb-nor";
-		};
-
-		partition@760000 {
-			reg = <0x0f60000 0x020000>;
-			label = "env-nor";
-			read-only;
-		};
-
-		partition@780000 {
-			reg = <0x0f80000 0x080000>;
-			label = "u-boot-nor";
-			read-only;
-		};
-	};
-
-	board-control@1,0 {
-		compatible = "fsl,mpc8548cds-fpga";
-		reg = <0x1 0x0 0x1000>;
-	};
-};
-
-&board_soc {
-	i2c@3000 {
-		eeprom@50 {
-			compatible = "atmel,24c64";
-			reg = <0x50>;
-		};
-
-		eeprom@56 {
-			compatible = "atmel,24c64";
-			reg = <0x56>;
-		};
-
-		eeprom@57 {
-			compatible = "atmel,24c64";
-			reg = <0x57>;
-		};
-	};
-
-	i2c@3100 {
-		eeprom@50 {
-			compatible = "atmel,24c64";
-			reg = <0x50>;
-		};
-	};
-
-	enet0: ethernet@24000 {
-		tbi-handle = <&tbi0>;
-		phy-handle = <&phy0>;
-	};
-
-	mdio@24520 {
-		phy0: ethernet-phy@0 {
-			interrupts = <5 1 0 0>;
-			reg = <0x0>;
-		};
-		phy1: ethernet-phy@1 {
-			interrupts = <5 1 0 0>;
-			reg = <0x1>;
-		};
-		phy2: ethernet-phy@2 {
-			interrupts = <5 1 0 0>;
-			reg = <0x2>;
-		};
-		phy3: ethernet-phy@3 {
-			interrupts = <5 1 0 0>;
-			reg = <0x3>;
-		};
-		tbi0: tbi-phy@11 {
-			reg = <0x11>;
-			device_type = "tbi-phy";
-		};
-	};
-
-	enet1: ethernet@25000 {
-		tbi-handle = <&tbi1>;
-		phy-handle = <&phy1>;
-	};
-
-	mdio@25520 {
-		tbi1: tbi-phy@11 {
-			reg = <0x11>;
-			device_type = "tbi-phy";
-		};
-	};
-
-	enet2: ethernet@26000 {
-		tbi-handle = <&tbi2>;
-		phy-handle = <&phy2>;
-	};
-
-	mdio@26520 {
-		tbi2: tbi-phy@11 {
-			reg = <0x11>;
-			device_type = "tbi-phy";
-		};
-	};
-
-	enet3: ethernet@27000 {
-		tbi-handle = <&tbi3>;
-		phy-handle = <&phy3>;
-	};
-
-	mdio@27520 {
-		tbi3: tbi-phy@11 {
-			reg = <0x11>;
-			device_type = "tbi-phy";
-		};
-	};
-};
-
-&board_pci0 {
-	interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
-	interrupt-map = <
-		/* IDSEL 0x4 (PCIX Slot 2) */
-		0x2000 0x0 0x0 0x1 &mpic 0x0 0x1 0 0
-		0x2000 0x0 0x0 0x2 &mpic 0x1 0x1 0 0
-		0x2000 0x0 0x0 0x3 &mpic 0x2 0x1 0 0
-		0x2000 0x0 0x0 0x4 &mpic 0x3 0x1 0 0
-
-		/* IDSEL 0x5 (PCIX Slot 3) */
-		0x2800 0x0 0x0 0x1 &mpic 0x1 0x1 0 0
-		0x2800 0x0 0x0 0x2 &mpic 0x2 0x1 0 0
-		0x2800 0x0 0x0 0x3 &mpic 0x3 0x1 0 0
-		0x2800 0x0 0x0 0x4 &mpic 0x0 0x1 0 0
-
-		/* IDSEL 0x6 (PCIX Slot 4) */
-		0x3000 0x0 0x0 0x1 &mpic 0x2 0x1 0 0
-		0x3000 0x0 0x0 0x2 &mpic 0x3 0x1 0 0
-		0x3000 0x0 0x0 0x3 &mpic 0x0 0x1 0 0
-		0x3000 0x0 0x0 0x4 &mpic 0x1 0x1 0 0
-
-		/* IDSEL 0x8 (PCIX Slot 5) */
-		0x4000 0x0 0x0 0x1 &mpic 0x0 0x1 0 0
-		0x4000 0x0 0x0 0x2 &mpic 0x1 0x1 0 0
-		0x4000 0x0 0x0 0x3 &mpic 0x2 0x1 0 0
-		0x4000 0x0 0x0 0x4 &mpic 0x3 0x1 0 0
-
-		/* IDSEL 0xC (Tsi310 bridge) */
-		0x6000 0x0 0x0 0x1 &mpic 0x0 0x1 0 0
-		0x6000 0x0 0x0 0x2 &mpic 0x1 0x1 0 0
-		0x6000 0x0 0x0 0x3 &mpic 0x2 0x1 0 0
-		0x6000 0x0 0x0 0x4 &mpic 0x3 0x1 0 0
-
-		/* IDSEL 0x14 (Slot 2) */
-		0xa000 0x0 0x0 0x1 &mpic 0x0 0x1 0 0
-		0xa000 0x0 0x0 0x2 &mpic 0x1 0x1 0 0
-		0xa000 0x0 0x0 0x3 &mpic 0x2 0x1 0 0
-		0xa000 0x0 0x0 0x4 &mpic 0x3 0x1 0 0
-
-		/* IDSEL 0x15 (Slot 3) */
-		0xa800 0x0 0x0 0x1 &mpic 0x1 0x1 0 0
-		0xa800 0x0 0x0 0x2 &mpic 0x2 0x1 0 0
-		0xa800 0x0 0x0 0x3 &mpic 0x3 0x1 0 0
-		0xa800 0x0 0x0 0x4 &mpic 0x0 0x1 0 0
-
-		/* IDSEL 0x16 (Slot 4) */
-		0xb000 0x0 0x0 0x1 &mpic 0x2 0x1 0 0
-		0xb000 0x0 0x0 0x2 &mpic 0x3 0x1 0 0
-		0xb000 0x0 0x0 0x3 &mpic 0x0 0x1 0 0
-		0xb000 0x0 0x0 0x4 &mpic 0x1 0x1 0 0
-
-		/* IDSEL 0x18 (Slot 5) */
-		0xc000 0x0 0x0 0x1 &mpic 0x0 0x1 0 0
-		0xc000 0x0 0x0 0x2 &mpic 0x1 0x1 0 0
-		0xc000 0x0 0x0 0x3 &mpic 0x2 0x1 0 0
-		0xc000 0x0 0x0 0x4 &mpic 0x3 0x1 0 0
-
-		/* IDSEL 0x1C (Tsi310 bridge PCI primary) */
-		0xe000 0x0 0x0 0x1 &mpic 0x0 0x1 0 0
-		0xe000 0x0 0x0 0x2 &mpic 0x1 0x1 0 0
-		0xe000 0x0 0x0 0x3 &mpic 0x2 0x1 0 0
-		0xe000 0x0 0x0 0x4 &mpic 0x3 0x1 0 0>;
-
-	pci_bridge@1c {
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
-		interrupt-map = <
-
-			/* IDSEL 0x00 (PrPMC Site) */
-			0000 0x0 0x0 0x1 &mpic 0x0 0x1 0 0
-			0000 0x0 0x0 0x2 &mpic 0x1 0x1 0 0
-			0000 0x0 0x0 0x3 &mpic 0x2 0x1 0 0
-			0000 0x0 0x0 0x4 &mpic 0x3 0x1 0 0
-
-			/* IDSEL 0x04 (VIA chip) */
-			0x2000 0x0 0x0 0x1 &mpic 0x0 0x1 0 0
-			0x2000 0x0 0x0 0x2 &mpic 0x1 0x1 0 0
-			0x2000 0x0 0x0 0x3 &mpic 0x2 0x1 0 0
-			0x2000 0x0 0x0 0x4 &mpic 0x3 0x1 0 0
-
-			/* IDSEL 0x05 (8139) */
-			0x2800 0x0 0x0 0x1 &mpic 0x1 0x1 0 0
-
-			/* IDSEL 0x06 (Slot 6) */
-			0x3000 0x0 0x0 0x1 &mpic 0x2 0x1 0 0
-			0x3000 0x0 0x0 0x2 &mpic 0x3 0x1 0 0
-			0x3000 0x0 0x0 0x3 &mpic 0x0 0x1 0 0
-			0x3000 0x0 0x0 0x4 &mpic 0x1 0x1 0 0
-
-			/* IDESL 0x07 (Slot 7) */
-			0x3800 0x0 0x0 0x1 &mpic 0x3 0x1 0 0
-			0x3800 0x0 0x0 0x2 &mpic 0x0 0x1 0 0
-			0x3800 0x0 0x0 0x3 &mpic 0x1 0x1 0 0
-			0x3800 0x0 0x0 0x4 &mpic 0x2 0x1 0 0>;
-
-		reg = <0xe000 0x0 0x0 0x0 0x0>;
-		#interrupt-cells = <1>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		ranges = <0x2000000 0x0 0x80000000
-			  0x2000000 0x0 0x80000000
-			  0x0 0x20000000
-			  0x1000000 0x0 0x0
-			  0x1000000 0x0 0x0
-			  0x0 0x80000>;
-		clock-frequency = <33333333>;
-
-		isa@4 {
-			device_type = "isa";
-			#interrupt-cells = <2>;
-			#size-cells = <1>;
-			#address-cells = <2>;
-			reg = <0x2000 0x0 0x0 0x0 0x0>;
-			ranges = <0x1 0x0 0x1000000 0x0 0x0 0x1000>;
-			interrupt-parent = <&i8259>;
-
-			i8259: interrupt-controller@20 {
-				interrupt-controller;
-				device_type = "interrupt-controller";
-				reg = <0x1 0x20 0x2
-				       0x1 0xa0 0x2
-				       0x1 0x4d0 0x2>;
-				#address-cells = <0>;
-				#interrupt-cells = <2>;
-				compatible = "chrp,iic";
-				interrupts = <0 1 0 0>;
-				interrupt-parent = <&mpic>;
-			};
-
-			rtc@70 {
-				compatible = "pnpPNP,b00";
-				reg = <0x1 0x70 0x2>;
-			};
-		};
-	};
-};
diff --git a/arch/powerpc/boot/dts/fsl/mpc8548cds_32b.dts b/arch/powerpc/boot/dts/fsl/mpc8548cds_32b.dts
deleted file mode 100644
index f6ba4a982766..000000000000
--- a/arch/powerpc/boot/dts/fsl/mpc8548cds_32b.dts
+++ /dev/null
@@ -1,82 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MPC8548 CDS Device Tree Source (32-bit address map)
- *
- * Copyright 2006, 2008, 2011-2012 Freescale Semiconductor Inc.
- */
-
-/include/ "mpc8548si-pre.dtsi"
-
-/ {
-	model = "MPC8548CDS";
-	compatible = "MPC8548CDS", "MPC85xxCDS";
-
-	memory {
-		device_type = "memory";
-		reg = <0 0 0x0 0x8000000>;	// 128M at 0x0
-	};
-
-	board_lbc: lbc: localbus@e0005000 {
-		reg = <0 0xe0005000 0 0x1000>;
-
-		ranges = <0x0 0x0 0x0 0xff000000 0x01000000
-			  0x1 0x0 0x0 0xf8004000 0x00001000>;
-
-	};
-
-	board_soc: soc: soc8548@e0000000 {
-		ranges = <0 0x0 0xe0000000 0x100000>;
-	};
-
-	board_pci0: pci0: pci@e0008000 {
-		reg = <0 0xe0008000 0 0x1000>;
-		ranges = <0x2000000 0x0 0x80000000 0 0x80000000 0x0 0x10000000
-			  0x1000000 0x0 0x00000000 0 0xe2000000 0x0 0x800000>;
-		clock-frequency = <66666666>;
-	};
-
-	pci1: pci@e0009000 {
-		reg = <0 0xe0009000 0 0x1000>;
-		ranges = <0x2000000 0x0 0x90000000 0 0x90000000 0x0 0x10000000
-			  0x1000000 0x0 0x00000000 0 0xe2800000 0x0 0x800000>;
-		clock-frequency = <66666666>;
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
-		interrupt-map = <
-
-			/* IDSEL 0x15 */
-			0xa800 0x0 0x0 0x1 &mpic 0xb 0x1 0 0
-			0xa800 0x0 0x0 0x2 &mpic 0x1 0x1 0 0
-			0xa800 0x0 0x0 0x3 &mpic 0x2 0x1 0 0
-			0xa800 0x0 0x0 0x4 &mpic 0x3 0x1 0 0>;
-	};
-
-	pci2: pcie@e000a000 {
-		reg = <0 0xe000a000 0 0x1000>;
-		ranges = <0x2000000 0x0 0xa0000000 0 0xa0000000 0x0 0x20000000
-			  0x1000000 0x0 0x00000000 0 0xe3000000 0x0 0x100000>;
-		pcie@0 {
-			ranges = <0x2000000 0x0 0xa0000000
-				  0x2000000 0x0 0xa0000000
-				  0x0 0x20000000
-
-				  0x1000000 0x0 0x0
-				  0x1000000 0x0 0x0
-				  0x0 0x100000>;
-		};
-	};
-
-	rio: rapidio@e00c0000 {
-		reg = <0x0 0xe00c0000 0x0 0x20000>;
-		port1 {
-			ranges = <0x0 0x0 0x0 0xc0000000 0x0 0x20000000>;
-		};
-	};
-};
-
-/*
- * mpc8548cds.dtsi must be last to ensure board_pci0 overrides pci0 settings
- * for interrupt-map & interrupt-map-mask.
- */
-
-/include/ "mpc8548si-post.dtsi"
-/include/ "mpc8548cds.dtsi"
diff --git a/arch/powerpc/boot/dts/fsl/mpc8548cds_36b.dts b/arch/powerpc/boot/dts/fsl/mpc8548cds_36b.dts
deleted file mode 100644
index 32e9076375ae..000000000000
--- a/arch/powerpc/boot/dts/fsl/mpc8548cds_36b.dts
+++ /dev/null
@@ -1,82 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MPC8548 CDS Device Tree Source (36-bit address map)
- *
- * Copyright 2012 Freescale Semiconductor Inc.
- */
-
-/include/ "mpc8548si-pre.dtsi"
-
-/ {
-	model = "MPC8548CDS";
-	compatible = "MPC8548CDS", "MPC85xxCDS";
-
-	memory {
-		device_type = "memory";
-		reg = <0 0 0x0 0x8000000>;	// 128M at 0x0
-	};
-
-	board_lbc: lbc: localbus@fe0005000 {
-		reg = <0xf 0xe0005000 0 0x1000>;
-
-		ranges = <0x0 0x0 0xf 0xff000000 0x01000000
-			  0x1 0x0 0xf 0xf8004000 0x00001000>;
-
-	};
-
-	board_soc: soc: soc8548@fe0000000 {
-		ranges = <0 0xf 0xe0000000 0x100000>;
-	};
-
-	board_pci0: pci0: pci@fe0008000 {
-		reg = <0xf 0xe0008000 0 0x1000>;
-		ranges = <0x2000000 0x0 0xe0000000 0xc 0x00000000 0x0 0x10000000
-			  0x1000000 0x0 0x00000000 0xf 0xe2000000 0x0 0x800000>;
-		clock-frequency = <66666666>;
-	};
-
-	pci1: pci@fe0009000 {
-		reg = <0xf 0xe0009000 0 0x1000>;
-		ranges = <0x2000000 0x0 0xe0000000 0xc 0x10000000 0x0 0x10000000
-			  0x1000000 0x0 0x00000000 0xf 0xe2800000 0x0 0x800000>;
-		clock-frequency = <66666666>;
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
-		interrupt-map = <
-
-			/* IDSEL 0x15 */
-			0xa800 0x0 0x0 0x1 &mpic 0xb 0x1 0 0
-			0xa800 0x0 0x0 0x2 &mpic 0x1 0x1 0 0
-			0xa800 0x0 0x0 0x3 &mpic 0x2 0x1 0 0
-			0xa800 0x0 0x0 0x4 &mpic 0x3 0x1 0 0>;
-	};
-
-	pci2: pcie@fe000a000 {
-		reg = <0xf 0xe000a000 0 0x1000>;
-		ranges = <0x2000000 0x0 0xe0000000 0xc 0x20000000 0x0 0x20000000
-			  0x1000000 0x0 0x00000000 0xf 0xe3000000 0x0 0x100000>;
-		pcie@0 {
-			ranges = <0x2000000 0x0 0xa0000000
-				  0x2000000 0x0 0xa0000000
-				  0x0 0x20000000
-
-				  0x1000000 0x0 0x0
-				  0x1000000 0x0 0x0
-				  0x0 0x100000>;
-		};
-	};
-
-	rio: rapidio@fe00c0000 {
-		reg = <0xf 0xe00c0000 0x0 0x20000>;
-		port1 {
-			ranges = <0x0 0x0 0xc 0x40000000 0x0 0x20000000>;
-		};
-	};
-};
-
-/*
- * mpc8548cds.dtsi must be last to ensure board_pci0 overrides pci0 settings
- * for interrupt-map & interrupt-map-mask.
- */
-
-/include/ "mpc8548si-post.dtsi"
-/include/ "mpc8548cds.dtsi"
diff --git a/arch/powerpc/boot/dts/fsl/mpc8555cds.dts b/arch/powerpc/boot/dts/fsl/mpc8555cds.dts
deleted file mode 100644
index 901b6ff06dfb..000000000000
--- a/arch/powerpc/boot/dts/fsl/mpc8555cds.dts
+++ /dev/null
@@ -1,375 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MPC8555 CDS Device Tree Source
- *
- * Copyright 2006, 2008 Freescale Semiconductor Inc.
- */
-
-/dts-v1/;
-
-/include/ "e500v1_power_isa.dtsi"
-
-/ {
-	model = "MPC8555CDS";
-	compatible = "MPC8555CDS", "MPC85xxCDS";
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
-	};
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		PowerPC,8555@0 {
-			device_type = "cpu";
-			reg = <0x0>;
-			d-cache-line-size = <32>;	// 32 bytes
-			i-cache-line-size = <32>;	// 32 bytes
-			d-cache-size = <0x8000>;		// L1, 32K
-			i-cache-size = <0x8000>;		// L1, 32K
-			timebase-frequency = <0>;	//  33 MHz, from uboot
-			bus-frequency = <0>;	// 166 MHz
-			clock-frequency = <0>;	// 825 MHz, from uboot
-			next-level-cache = <&L2>;
-		};
-	};
-
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x8000000>;	// 128M at 0x0
-	};
-
-	soc8555@e0000000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		device_type = "soc";
-		compatible = "simple-bus";
-		ranges = <0x0 0xe0000000 0x100000>;
-		bus-frequency = <0>;
-
-		ecm-law@0 {
-			compatible = "fsl,ecm-law";
-			reg = <0x0 0x1000>;
-			fsl,num-laws = <8>;
-		};
-
-		ecm@1000 {
-			compatible = "fsl,mpc8555-ecm", "fsl,ecm";
-			reg = <0x1000 0x1000>;
-			interrupts = <17 2>;
-			interrupt-parent = <&mpic>;
-		};
-
-		memory-controller@2000 {
-			compatible = "fsl,mpc8555-memory-controller";
-			reg = <0x2000 0x1000>;
-			interrupt-parent = <&mpic>;
-			interrupts = <18 2>;
-		};
-
-		L2: l2-cache-controller@20000 {
-			compatible = "fsl,mpc8555-l2-cache-controller";
-			reg = <0x20000 0x1000>;
-			cache-line-size = <32>;	// 32 bytes
-			cache-size = <0x40000>;	// L2, 256K
-			interrupt-parent = <&mpic>;
-			interrupts = <16 2>;
-		};
-
-		i2c@3000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			cell-index = <0>;
-			compatible = "fsl-i2c";
-			reg = <0x3000 0x100>;
-			interrupts = <43 2>;
-			interrupt-parent = <&mpic>;
-			dfsrr;
-		};
-
-		dma@21300 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,mpc8555-dma", "fsl,eloplus-dma";
-			reg = <0x21300 0x4>;
-			ranges = <0x0 0x21100 0x200>;
-			cell-index = <0>;
-			dma-channel@0 {
-				compatible = "fsl,mpc8555-dma-channel",
-						"fsl,eloplus-dma-channel";
-				reg = <0x0 0x80>;
-				cell-index = <0>;
-				interrupt-parent = <&mpic>;
-				interrupts = <20 2>;
-			};
-			dma-channel@80 {
-				compatible = "fsl,mpc8555-dma-channel",
-						"fsl,eloplus-dma-channel";
-				reg = <0x80 0x80>;
-				cell-index = <1>;
-				interrupt-parent = <&mpic>;
-				interrupts = <21 2>;
-			};
-			dma-channel@100 {
-				compatible = "fsl,mpc8555-dma-channel",
-						"fsl,eloplus-dma-channel";
-				reg = <0x100 0x80>;
-				cell-index = <2>;
-				interrupt-parent = <&mpic>;
-				interrupts = <22 2>;
-			};
-			dma-channel@180 {
-				compatible = "fsl,mpc8555-dma-channel",
-						"fsl,eloplus-dma-channel";
-				reg = <0x180 0x80>;
-				cell-index = <3>;
-				interrupt-parent = <&mpic>;
-				interrupts = <23 2>;
-			};
-		};
-
-		enet0: ethernet@24000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			cell-index = <0>;
-			device_type = "network";
-			model = "TSEC";
-			compatible = "gianfar";
-			reg = <0x24000 0x1000>;
-			ranges = <0x0 0x24000 0x1000>;
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <29 2 30 2 34 2>;
-			interrupt-parent = <&mpic>;
-			tbi-handle = <&tbi0>;
-			phy-handle = <&phy0>;
-
-			mdio@520 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,gianfar-mdio";
-				reg = <0x520 0x20>;
-
-				phy0: ethernet-phy@0 {
-					interrupt-parent = <&mpic>;
-					interrupts = <5 1>;
-					reg = <0x0>;
-				};
-				phy1: ethernet-phy@1 {
-					interrupt-parent = <&mpic>;
-					interrupts = <5 1>;
-					reg = <0x1>;
-				};
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
-			model = "TSEC";
-			compatible = "gianfar";
-			reg = <0x25000 0x1000>;
-			ranges = <0x0 0x25000 0x1000>;
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <35 2 36 2 40 2>;
-			interrupt-parent = <&mpic>;
-			tbi-handle = <&tbi1>;
-			phy-handle = <&phy1>;
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
-			reg = <0x4500 0x100>; 	// reg base, size
-			clock-frequency = <0>; 	// should we fill in in uboot?
-			interrupts = <42 2>;
-			interrupt-parent = <&mpic>;
-		};
-
-		serial1: serial@4600 {
-			cell-index = <1>;
-			device_type = "serial";
-			compatible = "fsl,ns16550", "ns16550";
-			reg = <0x4600 0x100>;	// reg base, size
-			clock-frequency = <0>; 	// should we fill in in uboot?
-			interrupts = <42 2>;
-			interrupt-parent = <&mpic>;
-		};
-
-		crypto@30000 {
-			compatible = "fsl,sec2.0";
-			reg = <0x30000 0x10000>;
-			interrupts = <45 2>;
-			interrupt-parent = <&mpic>;
-			fsl,num-channels = <4>;
-			fsl,channel-fifo-len = <24>;
-			fsl,exec-units-mask = <0x7e>;
-			fsl,descriptor-types-mask = <0x01010ebf>;
-		};
-
-		mpic: pic@40000 {
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <2>;
-			reg = <0x40000 0x40000>;
-			compatible = "chrp,open-pic";
-			device_type = "open-pic";
-		};
-
-		cpm@919c0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,mpc8555-cpm", "fsl,cpm2";
-			reg = <0x919c0 0x30>;
-			ranges;
-
-			muram@80000 {
-				#address-cells = <1>;
-				#size-cells = <1>;
-				ranges = <0x0 0x80000 0x10000>;
-
-				data@0 {
-					compatible = "fsl,cpm-muram-data";
-					reg = <0x0 0x2000 0x9000 0x1000>;
-				};
-			};
-
-			brg@919f0 {
-				compatible = "fsl,mpc8555-brg",
-				             "fsl,cpm2-brg",
-				             "fsl,cpm-brg";
-				reg = <0x919f0 0x10 0x915f0 0x10>;
-			};
-
-			cpmpic: pic@90c00 {
-				interrupt-controller;
-				#address-cells = <0>;
-				#interrupt-cells = <2>;
-				interrupts = <46 2>;
-				interrupt-parent = <&mpic>;
-				reg = <0x90c00 0x80>;
-				compatible = "fsl,mpc8555-cpm-pic", "fsl,cpm2-pic";
-			};
-		};
-	};
-
-	pci0: pci@e0008000 {
-		interrupt-map-mask = <0x1f800 0x0 0x0 0x7>;
-		interrupt-map = <
-
-			/* IDSEL 0x10 */
-			0x8000 0x0 0x0 0x1 &mpic 0x0 0x1
-			0x8000 0x0 0x0 0x2 &mpic 0x1 0x1
-			0x8000 0x0 0x0 0x3 &mpic 0x2 0x1
-			0x8000 0x0 0x0 0x4 &mpic 0x3 0x1
-
-			/* IDSEL 0x11 */
-			0x8800 0x0 0x0 0x1 &mpic 0x0 0x1
-			0x8800 0x0 0x0 0x2 &mpic 0x1 0x1
-			0x8800 0x0 0x0 0x3 &mpic 0x2 0x1
-			0x8800 0x0 0x0 0x4 &mpic 0x3 0x1
-
-			/* IDSEL 0x12 (Slot 1) */
-			0x9000 0x0 0x0 0x1 &mpic 0x0 0x1
-			0x9000 0x0 0x0 0x2 &mpic 0x1 0x1
-			0x9000 0x0 0x0 0x3 &mpic 0x2 0x1
-			0x9000 0x0 0x0 0x4 &mpic 0x3 0x1
-
-			/* IDSEL 0x13 (Slot 2) */
-			0x9800 0x0 0x0 0x1 &mpic 0x1 0x1
-			0x9800 0x0 0x0 0x2 &mpic 0x2 0x1
-			0x9800 0x0 0x0 0x3 &mpic 0x3 0x1
-			0x9800 0x0 0x0 0x4 &mpic 0x0 0x1
-
-			/* IDSEL 0x14 (Slot 3) */
-			0xa000 0x0 0x0 0x1 &mpic 0x2 0x1
-			0xa000 0x0 0x0 0x2 &mpic 0x3 0x1
-			0xa000 0x0 0x0 0x3 &mpic 0x0 0x1
-			0xa000 0x0 0x0 0x4 &mpic 0x1 0x1
-
-			/* IDSEL 0x15 (Slot 4) */
-			0xa800 0x0 0x0 0x1 &mpic 0x3 0x1
-			0xa800 0x0 0x0 0x2 &mpic 0x0 0x1
-			0xa800 0x0 0x0 0x3 &mpic 0x1 0x1
-			0xa800 0x0 0x0 0x4 &mpic 0x2 0x1
-
-			/* Bus 1 (Tundra Bridge) */
-			/* IDSEL 0x12 (ISA bridge) */
-			0x19000 0x0 0x0 0x1 &mpic 0x0 0x1
-			0x19000 0x0 0x0 0x2 &mpic 0x1 0x1
-			0x19000 0x0 0x0 0x3 &mpic 0x2 0x1
-			0x19000 0x0 0x0 0x4 &mpic 0x3 0x1>;
-		interrupt-parent = <&mpic>;
-		interrupts = <24 2>;
-		bus-range = <0 0>;
-		ranges = <0x2000000 0x0 0x80000000 0x80000000 0x0 0x20000000
-			  0x1000000 0x0 0x0 0xe2000000 0x0 0x100000>;
-		clock-frequency = <66666666>;
-		#interrupt-cells = <1>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		reg = <0xe0008000 0x1000>;
-		compatible = "fsl,mpc8540-pci";
-		device_type = "pci";
-
-		i8259@19000 {
-			interrupt-controller;
-			device_type = "interrupt-controller";
-			reg = <0x19000 0x0 0x0 0x0 0x1>;
-			#address-cells = <0>;
-			#interrupt-cells = <2>;
-			compatible = "chrp,iic";
-			interrupts = <1>;
-			interrupt-parent = <&pci0>;
-		};
-	};
-
-	pci1: pci@e0009000 {
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
-		interrupt-map = <
-
-			/* IDSEL 0x15 */
-			0xa800 0x0 0x0 0x1 &mpic 0xb 0x1
-			0xa800 0x0 0x0 0x2 &mpic 0xb 0x1
-			0xa800 0x0 0x0 0x3 &mpic 0xb 0x1
-			0xa800 0x0 0x0 0x4 &mpic 0xb 0x1>;
-		interrupt-parent = <&mpic>;
-		interrupts = <25 2>;
-		bus-range = <0 0>;
-		ranges = <0x2000000 0x0 0xa0000000 0xa0000000 0x0 0x20000000
-			  0x1000000 0x0 0x0 0xe3000000 0x0 0x100000>;
-		clock-frequency = <66666666>;
-		#interrupt-cells = <1>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		reg = <0xe0009000 0x1000>;
-		compatible = "fsl,mpc8540-pci";
-		device_type = "pci";
-	};
-};
diff --git a/arch/powerpc/configs/85xx/mpc85xx_cds_defconfig b/arch/powerpc/configs/85xx/mpc85xx_cds_defconfig
deleted file mode 100644
index cea72e85ed26..000000000000
--- a/arch/powerpc/configs/85xx/mpc85xx_cds_defconfig
+++ /dev/null
@@ -1,52 +0,0 @@
-CONFIG_PPC_85xx=y
-CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_PARTITION_ADVANCED=y
-# CONFIG_MSDOS_PARTITION is not set
-CONFIG_MPC85xx_CDS=y
-CONFIG_GEN_RTC=y
-CONFIG_BINFMT_MISC=y
-CONFIG_MATH_EMULATION=y
-# CONFIG_SECCOMP is not set
-CONFIG_PCI=y
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
-CONFIG_BLK_DEV_RAM_SIZE=32768
-CONFIG_ATA=y
-CONFIG_ATA_GENERIC=y
-CONFIG_PATA_VIA=y
-CONFIG_NETDEVICES=y
-CONFIG_GIANFAR=y
-CONFIG_E1000=y
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
-CONFIG_DETECT_HUNG_TASK=y
-CONFIG_DEBUG_MUTEXES=y
diff --git a/arch/powerpc/configs/mpc85xx_base.config b/arch/powerpc/configs/mpc85xx_base.config
index e13bcf83bd1d..a1e4d72ed39d 100644
--- a/arch/powerpc/configs/mpc85xx_base.config
+++ b/arch/powerpc/configs/mpc85xx_base.config
@@ -1,6 +1,5 @@
 CONFIG_MATH_EMULATION=y
 CONFIG_MPC8536_DS=y
-CONFIG_MPC85xx_CDS=y
 CONFIG_MPC85xx_DS=y
 CONFIG_MPC85xx_MDS=y
 CONFIG_MPC85xx_RDB=y
diff --git a/arch/powerpc/platforms/85xx/Makefile b/arch/powerpc/platforms/85xx/Makefile
index 4bb473ca51b4..43c34f26f108 100644
--- a/arch/powerpc/platforms/85xx/Makefile
+++ b/arch/powerpc/platforms/85xx/Makefile
@@ -12,7 +12,6 @@ obj-y += common.o
 obj-$(CONFIG_BSC9131_RDB) += bsc913x_rdb.o
 obj-$(CONFIG_BSC9132_QDS) += bsc913x_qds.o
 obj-$(CONFIG_C293_PCIE)   += c293pcie.o
-obj-$(CONFIG_MPC85xx_CDS) += mpc85xx_cds.o
 obj-$(CONFIG_MPC8536_DS)  += mpc8536_ds.o
 obj8259-$(CONFIG_PPC_I8259)   += mpc85xx_8259.o
 obj-$(CONFIG_MPC85xx_DS)  += mpc85xx_ds.o $(obj8259-y)
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_cds.c b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
deleted file mode 100644
index 0e6964c7fdd6..000000000000
--- a/arch/powerpc/platforms/85xx/mpc85xx_cds.c
+++ /dev/null
@@ -1,387 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MPC85xx setup and early boot code plus other random bits.
- *
- * Maintained by Kumar Gala (see MAINTAINERS for contact information)
- *
- * Copyright 2005, 2011-2012 Freescale Semiconductor Inc.
- */
-
-#include <linux/stddef.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/errno.h>
-#include <linux/reboot.h>
-#include <linux/pci.h>
-#include <linux/kdev_t.h>
-#include <linux/major.h>
-#include <linux/console.h>
-#include <linux/delay.h>
-#include <linux/seq_file.h>
-#include <linux/initrd.h>
-#include <linux/interrupt.h>
-#include <linux/fsl_devices.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/of_platform.h>
-#include <linux/pgtable.h>
-
-#include <asm/page.h>
-#include <linux/atomic.h>
-#include <asm/time.h>
-#include <asm/io.h>
-#include <asm/machdep.h>
-#include <asm/ipic.h>
-#include <asm/pci-bridge.h>
-#include <asm/irq.h>
-#include <mm/mmu_decl.h>
-#include <asm/udbg.h>
-#include <asm/mpic.h>
-#include <asm/i8259.h>
-
-#include <sysdev/fsl_soc.h>
-#include <sysdev/fsl_pci.h>
-
-#include "mpc85xx.h"
-
-/*
- * The CDS board contains an FPGA/CPLD called "Cadmus", which collects
- * various logic and performs system control functions.
- * Here is the FPGA/CPLD register map.
- */
-struct cadmus_reg {
-	u8 cm_ver;		/* Board version */
-	u8 cm_csr;		/* General control/status */
-	u8 cm_rst;		/* Reset control */
-	u8 cm_hsclk;	/* High speed clock */
-	u8 cm_hsxclk;	/* High speed clock extended */
-	u8 cm_led;		/* LED data */
-	u8 cm_pci;		/* PCI control/status */
-	u8 cm_dma;		/* DMA control */
-	u8 res[248];	/* Total 256 bytes */
-};
-
-static struct cadmus_reg *cadmus;
-
-#ifdef CONFIG_PCI
-
-#define ARCADIA_HOST_BRIDGE_IDSEL	17
-#define ARCADIA_2ND_BRIDGE_IDSEL	3
-
-static int mpc85xx_exclude_device(struct pci_controller *hose,
-				  u_char bus, u_char devfn)
-{
-	/* We explicitly do not go past the Tundra 320 Bridge */
-	if ((bus == 1) && (PCI_SLOT(devfn) == ARCADIA_2ND_BRIDGE_IDSEL))
-		return PCIBIOS_DEVICE_NOT_FOUND;
-	if ((bus == 0) && (PCI_SLOT(devfn) == ARCADIA_2ND_BRIDGE_IDSEL))
-		return PCIBIOS_DEVICE_NOT_FOUND;
-	else
-		return PCIBIOS_SUCCESSFUL;
-}
-
-static int mpc85xx_cds_restart(struct notifier_block *this,
-			       unsigned long mode, void *cmd)
-{
-	struct pci_dev *dev;
-	u_char tmp;
-
-	if ((dev = pci_get_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_82C686,
-					NULL))) {
-
-		/* Use the VIA Super Southbridge to force a PCI reset */
-		pci_read_config_byte(dev, 0x47, &tmp);
-		pci_write_config_byte(dev, 0x47, tmp | 1);
-
-		/* Flush the outbound PCI write queues */
-		pci_read_config_byte(dev, 0x47, &tmp);
-
-		/*
-		 *  At this point, the hardware reset should have triggered.
-		 *  However, if it doesn't work for some mysterious reason,
-		 *  just fall through to the default reset below.
-		 */
-
-		pci_dev_put(dev);
-	}
-
-	/*
-	 *  If we can't find the VIA chip (maybe the P2P bridge is
-	 *  disabled) or the VIA chip reset didn't work, just return
-	 *  and let default reset sequence happen.
-	 */
-	return NOTIFY_DONE;
-}
-
-static int mpc85xx_cds_restart_register(void)
-{
-	static struct notifier_block restart_handler;
-
-	restart_handler.notifier_call = mpc85xx_cds_restart;
-	restart_handler.priority = 192;
-
-	return register_restart_handler(&restart_handler);
-}
-machine_arch_initcall(mpc85xx_cds, mpc85xx_cds_restart_register);
-
-
-static void __init mpc85xx_cds_pci_irq_fixup(struct pci_dev *dev)
-{
-	u_char c;
-	if (dev->vendor == PCI_VENDOR_ID_VIA) {
-		switch (dev->device) {
-		case PCI_DEVICE_ID_VIA_82C586_1:
-			/*
-			 * U-Boot does not set the enable bits
-			 * for the IDE device. Force them on here.
-			 */
-			pci_read_config_byte(dev, 0x40, &c);
-			c |= 0x03; /* IDE: Chip Enable Bits */
-			pci_write_config_byte(dev, 0x40, c);
-
-			/*
-			 * Since only primary interface works, force the
-			 * IDE function to standard primary IDE interrupt
-			 * w/ 8259 offset
-			 */
-			dev->irq = 14;
-			pci_write_config_byte(dev, PCI_INTERRUPT_LINE, dev->irq);
-			break;
-		/*
-		 * Force legacy USB interrupt routing
-		 */
-		case PCI_DEVICE_ID_VIA_82C586_2:
-		/* There are two USB controllers.
-		 * Identify them by function number
-		 */
-			if (PCI_FUNC(dev->devfn) == 3)
-				dev->irq = 11;
-			else
-				dev->irq = 10;
-			pci_write_config_byte(dev, PCI_INTERRUPT_LINE, dev->irq);
-			break;
-		default:
-			break;
-		}
-	}
-}
-
-static void skip_fake_bridge(struct pci_dev *dev)
-{
-	/* Make it an error to skip the fake bridge
-	 * in pci_setup_device() in probe.c */
-	dev->hdr_type = 0x7f;
-}
-DECLARE_PCI_FIXUP_EARLY(0x1957, 0x3fff, skip_fake_bridge);
-DECLARE_PCI_FIXUP_EARLY(0x3fff, 0x1957, skip_fake_bridge);
-DECLARE_PCI_FIXUP_EARLY(0xff3f, 0x5719, skip_fake_bridge);
-
-#define PCI_DEVICE_ID_IDT_TSI310	0x01a7
-
-/*
- * Fix Tsi310 PCI-X bridge resource.
- * Force the bridge to open a window from 0x0000-0x1fff in PCI I/O space.
- * This allows legacy I/O(i8259, etc) on the VIA southbridge to be accessed.
- */
-void mpc85xx_cds_fixup_bus(struct pci_bus *bus)
-{
-	struct pci_dev *dev = bus->self;
-	struct resource *res = bus->resource[0];
-
-	if (dev != NULL &&
-	    dev->vendor == PCI_VENDOR_ID_IBM &&
-	    dev->device == PCI_DEVICE_ID_IDT_TSI310) {
-		if (res) {
-			res->start = 0;
-			res->end   = 0x1fff;
-			res->flags = IORESOURCE_IO;
-			pr_info("mpc85xx_cds: PCI bridge resource fixup applied\n");
-			pr_info("mpc85xx_cds: %pR\n", res);
-		}
-	}
-
-	fsl_pcibios_fixup_bus(bus);
-}
-
-#ifdef CONFIG_PPC_I8259
-static void mpc85xx_8259_cascade_handler(struct irq_desc *desc)
-{
-	unsigned int cascade_irq = i8259_irq();
-
-	if (cascade_irq)
-		/* handle an interrupt from the 8259 */
-		generic_handle_irq(cascade_irq);
-
-	/* check for any interrupts from the shared IRQ line */
-	handle_fasteoi_irq(desc);
-}
-
-static irqreturn_t mpc85xx_8259_cascade_action(int irq, void *dev_id)
-{
-	return IRQ_HANDLED;
-}
-#endif /* PPC_I8259 */
-#endif /* CONFIG_PCI */
-
-static void __init mpc85xx_cds_pic_init(void)
-{
-	struct mpic *mpic;
-	mpic = mpic_alloc(NULL, 0, MPIC_BIG_ENDIAN,
-			0, 256, " OpenPIC  ");
-	BUG_ON(mpic == NULL);
-	mpic_init(mpic);
-}
-
-#if defined(CONFIG_PPC_I8259) && defined(CONFIG_PCI)
-static int mpc85xx_cds_8259_attach(void)
-{
-	int ret;
-	struct device_node *np = NULL;
-	struct device_node *cascade_node = NULL;
-	int cascade_irq;
-
-	/* Initialize the i8259 controller */
-	for_each_node_by_type(np, "interrupt-controller")
-		if (of_device_is_compatible(np, "chrp,iic")) {
-			cascade_node = np;
-			break;
-		}
-
-	if (cascade_node == NULL) {
-		printk(KERN_DEBUG "Could not find i8259 PIC\n");
-		return -ENODEV;
-	}
-
-	cascade_irq = irq_of_parse_and_map(cascade_node, 0);
-	if (!cascade_irq) {
-		printk(KERN_ERR "Failed to map cascade interrupt\n");
-		return -ENXIO;
-	}
-
-	i8259_init(cascade_node, 0);
-	of_node_put(cascade_node);
-
-	/*
-	 *  Hook the interrupt to make sure desc->action is never NULL.
-	 *  This is required to ensure that the interrupt does not get
-	 *  disabled when the last user of the shared IRQ line frees their
-	 *  interrupt.
-	 */
-	ret = request_irq(cascade_irq, mpc85xx_8259_cascade_action,
-			  IRQF_SHARED | IRQF_NO_THREAD, "8259 cascade",
-			  cascade_node);
-	if (ret) {
-		printk(KERN_ERR "Failed to setup cascade interrupt\n");
-		return ret;
-	}
-
-	/* Success. Connect our low-level cascade handler. */
-	irq_set_handler(cascade_irq, mpc85xx_8259_cascade_handler);
-
-	return 0;
-}
-machine_device_initcall(mpc85xx_cds, mpc85xx_cds_8259_attach);
-
-#endif /* CONFIG_PPC_I8259 */
-
-static void __init mpc85xx_cds_pci_assign_primary(void)
-{
-#ifdef CONFIG_PCI
-	struct device_node *np;
-
-	if (fsl_pci_primary)
-		return;
-
-	/*
-	 * MPC85xx_CDS has ISA bridge but unfortunately there is no
-	 * isa node in device tree. We now looking for i8259 node as
-	 * a workaround for such a broken device tree. This routine
-	 * is for complying to all device trees.
-	 */
-	np = of_find_node_by_name(NULL, "i8259");
-	while ((fsl_pci_primary = of_get_parent(np))) {
-		of_node_put(np);
-		np = fsl_pci_primary;
-
-		if ((of_device_is_compatible(np, "fsl,mpc8540-pci") ||
-		    of_device_is_compatible(np, "fsl,mpc8548-pcie")) &&
-		    of_device_is_available(np))
-			return;
-	}
-#endif
-}
-
-/*
- * Setup the architecture
- */
-static void __init mpc85xx_cds_setup_arch(void)
-{
-	struct device_node *np;
-	int cds_pci_slot;
-
-	if (ppc_md.progress)
-		ppc_md.progress("mpc85xx_cds_setup_arch()", 0);
-
-	np = of_find_compatible_node(NULL, NULL, "fsl,mpc8548cds-fpga");
-	if (!np) {
-		pr_err("Could not find FPGA node.\n");
-		return;
-	}
-
-	cadmus = of_iomap(np, 0);
-	of_node_put(np);
-	if (!cadmus) {
-		pr_err("Fail to map FPGA area.\n");
-		return;
-	}
-
-	if (ppc_md.progress) {
-		char buf[40];
-		cds_pci_slot = ((in_8(&cadmus->cm_csr) >> 6) & 0x3) + 1;
-		snprintf(buf, 40, "CDS Version = 0x%x in slot %d\n",
-				in_8(&cadmus->cm_ver), cds_pci_slot);
-		ppc_md.progress(buf, 0);
-	}
-
-#ifdef CONFIG_PCI
-	ppc_md.pci_irq_fixup = mpc85xx_cds_pci_irq_fixup;
-	ppc_md.pci_exclude_device = mpc85xx_exclude_device;
-#endif
-
-	mpc85xx_cds_pci_assign_primary();
-	fsl_pci_assign_primary();
-}
-
-static void mpc85xx_cds_show_cpuinfo(struct seq_file *m)
-{
-	uint pvid, svid, phid1;
-
-	pvid = mfspr(SPRN_PVR);
-	svid = mfspr(SPRN_SVR);
-
-	seq_printf(m, "Vendor\t\t: Freescale Semiconductor\n");
-	seq_printf(m, "Machine\t\t: MPC85xx CDS (0x%x)\n",
-			in_8(&cadmus->cm_ver));
-	seq_printf(m, "PVR\t\t: 0x%x\n", pvid);
-	seq_printf(m, "SVR\t\t: 0x%x\n", svid);
-
-	/* Display cpu Pll setting */
-	phid1 = mfspr(SPRN_HID1);
-	seq_printf(m, "PLL setting\t: 0x%x\n", ((phid1 >> 24) & 0x3f));
-}
-
-machine_arch_initcall(mpc85xx_cds, mpc85xx_common_publish_devices);
-
-define_machine(mpc85xx_cds) {
-	.name		= "MPC85xx CDS",
-	.compatible	= "MPC85xxCDS",
-	.setup_arch	= mpc85xx_cds_setup_arch,
-	.init_IRQ	= mpc85xx_cds_pic_init,
-	.show_cpuinfo	= mpc85xx_cds_show_cpuinfo,
-	.get_irq	= mpic_get_irq,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= mpc85xx_cds_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.progress	= udbg_progress,
-};
-- 
2.25.1

