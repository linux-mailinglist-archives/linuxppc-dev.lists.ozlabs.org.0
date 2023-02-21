Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD0769E88D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 20:49:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLqcw2fDlz3cBm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 06:49:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=Lw6D6Tpa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.178.238; helo=mx0b-0064b401.pphosted.com; envelope-from=prvs=1416e03d26=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=Lw6D6Tpa;
	dkim-atps=neutral
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLqYv5FBzz3cMk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 06:47:15 +1100 (AEDT)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31LBXQvq022086;
	Tue, 21 Feb 2023 19:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=FLryS5trBgY/nmyxzNHZ6R8e+mEY/jLhoeVdbbSgbTk=;
 b=Lw6D6TparmiN0lvrw5EDfG6jn4kc7f5biI6OuRDmlIHNSQMgaBFJwDI3Of6Ov7etKuYN
 UjvauLTmVGFbc2y+bkoZbCN79FPF7o4I9tKy2nSsbkzEIb/GSd9ySYmiiiBunBDWy+oa
 SurPsxJ69LxmSmB+jayf+m8g+N1OjkI1Q5VNKdsy0iPXuaVF+iUYYm4ah/TRXWm7eld1
 ++xxWFxReIVUCTY/aup5wF7DOzRUVqJk710IxzHnXu8PLJwp7lOr6VsvnRbLTrBmF92/
 rJ/5CY7NvrhaWwndS09oDbVm9XlMWWL8pPHjGpz1padRTRLRnMQNUm8ay+lH3Hk2LSan gw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpd3u145-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 21 Feb 2023 19:46:55 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Tue, 21 Feb 2023 11:46:54 -0800
Received: from sc2600cp.wrs.com (128.224.56.77) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 21 Feb 2023 11:46:54 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/4] powerpc: drop MPC8540_ADS and MPC8560_ADS platform support
Date: Tue, 21 Feb 2023 14:46:34 -0500
Message-ID: <20230221194637.28436-2-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230221194637.28436-1-paul.gortmaker@windriver.com>
References: <20230221194637.28436-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: mXhno7FOdXzXlWZq-D8JUCTYHh_aXsj0
X-Proofpoint-ORIG-GUID: mXhno7FOdXzXlWZq-D8JUCTYHh_aXsj0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_12,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302210170
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
Cc: Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Paul Gortmaker <paul.gortmaker@windriver.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Based on the revision history in the manual(s), these e500-v1
platforms were first available around 2002.

Like a lot of evaluation boards, they attempted to provide break-out
connectors for all possible features, and that combined with four
PCI-X slots (and the age/era) meant for a considerably large board.

As I recall it, from a Linux point of view, the biggest difference
between 8540 and 8560 was in the UART implementation, and that is
reflected in a diff of the defconfigs.

In any case, these are over 20 years old, and by today's standards
only have a small amount of DDR1 memory, and were not widely available.

Given that, it makes sense to remove support from them in 2023.

Cc: Scott Wood <oss@buserror.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/powerpc/boot/Makefile                    |   2 -
 arch/powerpc/boot/dts/fsl/mpc8540ads.dts      | 355 ----------------
 arch/powerpc/boot/dts/fsl/mpc8560ads.dts      | 388 ------------------
 .../configs/85xx/mpc8540_ads_defconfig        |  47 ---
 .../configs/85xx/mpc8560_ads_defconfig        |  50 ---
 arch/powerpc/configs/mpc85xx_base.config      |   2 -
 arch/powerpc/platforms/85xx/Makefile          |   2 -
 arch/powerpc/platforms/85xx/mpc85xx_ads.c     | 171 --------
 8 files changed, 1017 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8540ads.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8560ads.dts
 delete mode 100644 arch/powerpc/configs/85xx/mpc8540_ads_defconfig
 delete mode 100644 arch/powerpc/configs/85xx/mpc8560_ads_defconfig
 delete mode 100644 arch/powerpc/platforms/85xx/mpc85xx_ads.c

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 1efe311a9ff9..4fcaf1c3f156 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -340,8 +340,6 @@ image-$(CONFIG_MPC836x_MDS)		+= cuImage.mpc836x_mds
 image-$(CONFIG_ASP834x)			+= dtbImage.asp834x-redboot
 
 # Board ports in arch/powerpc/platform/85xx/Kconfig
-image-$(CONFIG_MPC8540_ADS)		+= cuImage.mpc8540ads
-image-$(CONFIG_MPC8560_ADS)		+= cuImage.mpc8560ads
 image-$(CONFIG_MPC85xx_CDS)		+= cuImage.mpc8541cds \
 					   cuImage.mpc8548cds_32b \
 					   cuImage.mpc8555cds
diff --git a/arch/powerpc/boot/dts/fsl/mpc8540ads.dts b/arch/powerpc/boot/dts/fsl/mpc8540ads.dts
deleted file mode 100644
index e03ae130162b..000000000000
--- a/arch/powerpc/boot/dts/fsl/mpc8540ads.dts
+++ /dev/null
@@ -1,355 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MPC8540 ADS Device Tree Source
- *
- * Copyright 2006, 2008 Freescale Semiconductor Inc.
- */
-
-/dts-v1/;
-
-/include/ "e500v1_power_isa.dtsi"
-
-/ {
-	model = "MPC8540ADS";
-	compatible = "MPC8540ADS", "MPC85xxADS";
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	aliases {
-		ethernet0 = &enet0;
-		ethernet1 = &enet1;
-		ethernet2 = &enet2;
-		serial0 = &serial0;
-		serial1 = &serial1;
-		pci0 = &pci0;
-	};
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		PowerPC,8540@0 {
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
-	soc8540@e0000000 {
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
-			compatible = "fsl,mpc8540-ecm", "fsl,ecm";
-			reg = <0x1000 0x1000>;
-			interrupts = <17 2>;
-			interrupt-parent = <&mpic>;
-		};
-
-		memory-controller@2000 {
-			compatible = "fsl,mpc8540-memory-controller";
-			reg = <0x2000 0x1000>;
-			interrupt-parent = <&mpic>;
-			interrupts = <18 2>;
-		};
-
-		L2: l2-cache-controller@20000 {
-			compatible = "fsl,mpc8540-l2-cache-controller";
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
-			compatible = "fsl,mpc8540-dma", "fsl,eloplus-dma";
-			reg = <0x21300 0x4>;
-			ranges = <0x0 0x21100 0x200>;
-			cell-index = <0>;
-			dma-channel@0 {
-				compatible = "fsl,mpc8540-dma-channel",
-						"fsl,eloplus-dma-channel";
-				reg = <0x0 0x80>;
-				cell-index = <0>;
-				interrupt-parent = <&mpic>;
-				interrupts = <20 2>;
-			};
-			dma-channel@80 {
-				compatible = "fsl,mpc8540-dma-channel",
-						"fsl,eloplus-dma-channel";
-				reg = <0x80 0x80>;
-				cell-index = <1>;
-				interrupt-parent = <&mpic>;
-				interrupts = <21 2>;
-			};
-			dma-channel@100 {
-				compatible = "fsl,mpc8540-dma-channel",
-						"fsl,eloplus-dma-channel";
-				reg = <0x100 0x80>;
-				cell-index = <2>;
-				interrupt-parent = <&mpic>;
-				interrupts = <22 2>;
-			};
-			dma-channel@180 {
-				compatible = "fsl,mpc8540-dma-channel",
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
-				phy3: ethernet-phy@3 {
-					interrupt-parent = <&mpic>;
-					interrupts = <7 1>;
-					reg = <0x3>;
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
-		enet2: ethernet@26000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			cell-index = <2>;
-			device_type = "network";
-			model = "FEC";
-			compatible = "gianfar";
-			reg = <0x26000 0x1000>;
-			ranges = <0x0 0x26000 0x1000>;
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <41 2>;
-			interrupt-parent = <&mpic>;
-			tbi-handle = <&tbi2>;
-			phy-handle = <&phy3>;
-
-			mdio@520 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,gianfar-tbi";
-				reg = <0x520 0x20>;
-
-				tbi2: tbi-phy@11 {
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
-		mpic: pic@40000 {
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <2>;
-			reg = <0x40000 0x40000>;
-			compatible = "chrp,open-pic";
-			device_type = "open-pic";
-		};
-	};
-
-	pci0: pci@e0008000 {
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
-		interrupt-map = <
-
-			/* IDSEL 0x02 */
-			0x1000 0x0 0x0 0x1 &mpic 0x1 0x1
-			0x1000 0x0 0x0 0x2 &mpic 0x2 0x1
-			0x1000 0x0 0x0 0x3 &mpic 0x3 0x1
-			0x1000 0x0 0x0 0x4 &mpic 0x4 0x1
-
-			/* IDSEL 0x03 */
-			0x1800 0x0 0x0 0x1 &mpic 0x4 0x1
-			0x1800 0x0 0x0 0x2 &mpic 0x1 0x1
-			0x1800 0x0 0x0 0x3 &mpic 0x2 0x1
-			0x1800 0x0 0x0 0x4 &mpic 0x3 0x1
-
-			/* IDSEL 0x04 */
-			0x2000 0x0 0x0 0x1 &mpic 0x3 0x1
-			0x2000 0x0 0x0 0x2 &mpic 0x4 0x1
-			0x2000 0x0 0x0 0x3 &mpic 0x1 0x1
-			0x2000 0x0 0x0 0x4 &mpic 0x2 0x1
-
-			/* IDSEL 0x05 */
-			0x2800 0x0 0x0 0x1 &mpic 0x2 0x1
-			0x2800 0x0 0x0 0x2 &mpic 0x3 0x1
-			0x2800 0x0 0x0 0x3 &mpic 0x4 0x1
-			0x2800 0x0 0x0 0x4 &mpic 0x1 0x1
-
-			/* IDSEL 0x0c */
-			0x6000 0x0 0x0 0x1 &mpic 0x1 0x1
-			0x6000 0x0 0x0 0x2 &mpic 0x2 0x1
-			0x6000 0x0 0x0 0x3 &mpic 0x3 0x1
-			0x6000 0x0 0x0 0x4 &mpic 0x4 0x1
-
-			/* IDSEL 0x0d */
-			0x6800 0x0 0x0 0x1 &mpic 0x4 0x1
-			0x6800 0x0 0x0 0x2 &mpic 0x1 0x1
-			0x6800 0x0 0x0 0x3 &mpic 0x2 0x1
-			0x6800 0x0 0x0 0x4 &mpic 0x3 0x1
-
-			/* IDSEL 0x0e */
-			0x7000 0x0 0x0 0x1 &mpic 0x3 0x1
-			0x7000 0x0 0x0 0x2 &mpic 0x4 0x1
-			0x7000 0x0 0x0 0x3 &mpic 0x1 0x1
-			0x7000 0x0 0x0 0x4 &mpic 0x2 0x1
-
-			/* IDSEL 0x0f */
-			0x7800 0x0 0x0 0x1 &mpic 0x2 0x1
-			0x7800 0x0 0x0 0x2 &mpic 0x3 0x1
-			0x7800 0x0 0x0 0x3 &mpic 0x4 0x1
-			0x7800 0x0 0x0 0x4 &mpic 0x1 0x1
-
-			/* IDSEL 0x12 */
-			0x9000 0x0 0x0 0x1 &mpic 0x1 0x1
-			0x9000 0x0 0x0 0x2 &mpic 0x2 0x1
-			0x9000 0x0 0x0 0x3 &mpic 0x3 0x1
-			0x9000 0x0 0x0 0x4 &mpic 0x4 0x1
-
-			/* IDSEL 0x13 */
-			0x9800 0x0 0x0 0x1 &mpic 0x4 0x1
-			0x9800 0x0 0x0 0x2 &mpic 0x1 0x1
-			0x9800 0x0 0x0 0x3 &mpic 0x2 0x1
-			0x9800 0x0 0x0 0x4 &mpic 0x3 0x1
-
-			/* IDSEL 0x14 */
-			0xa000 0x0 0x0 0x1 &mpic 0x3 0x1
-			0xa000 0x0 0x0 0x2 &mpic 0x4 0x1
-			0xa000 0x0 0x0 0x3 &mpic 0x1 0x1
-			0xa000 0x0 0x0 0x4 &mpic 0x2 0x1
-
-			/* IDSEL 0x15 */
-			0xa800 0x0 0x0 0x1 &mpic 0x2 0x1
-			0xa800 0x0 0x0 0x2 &mpic 0x3 0x1
-			0xa800 0x0 0x0 0x3 &mpic 0x4 0x1
-			0xa800 0x0 0x0 0x4 &mpic 0x1 0x1>;
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
-		compatible = "fsl,mpc8540-pcix", "fsl,mpc8540-pci";
-		device_type = "pci";
-	};
-};
diff --git a/arch/powerpc/boot/dts/fsl/mpc8560ads.dts b/arch/powerpc/boot/dts/fsl/mpc8560ads.dts
deleted file mode 100644
index c2f9aea78b29..000000000000
--- a/arch/powerpc/boot/dts/fsl/mpc8560ads.dts
+++ /dev/null
@@ -1,388 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MPC8560 ADS Device Tree Source
- *
- * Copyright 2006, 2008 Freescale Semiconductor Inc.
- */
-
-/dts-v1/;
-
-/include/ "e500v1_power_isa.dtsi"
-
-/ {
-	model = "MPC8560ADS";
-	compatible = "MPC8560ADS", "MPC85xxADS";
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	aliases {
-		ethernet0 = &enet0;
-		ethernet1 = &enet1;
-		ethernet2 = &enet2;
-		ethernet3 = &enet3;
-		serial0 = &serial0;
-		serial1 = &serial1;
-		pci0 = &pci0;
-	};
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		PowerPC,8560@0 {
-			device_type = "cpu";
-			reg = <0x0>;
-			d-cache-line-size = <32>;	// 32 bytes
-			i-cache-line-size = <32>;	// 32 bytes
-			d-cache-size = <0x8000>;		// L1, 32K
-			i-cache-size = <0x8000>;		// L1, 32K
-			timebase-frequency = <82500000>;
-			bus-frequency = <330000000>;
-			clock-frequency = <825000000>;
-		};
-	};
-
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x10000000>;
-	};
-
-	soc8560@e0000000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		device_type = "soc";
-		compatible = "simple-bus";
-		ranges = <0x0 0xe0000000 0x100000>;
-		bus-frequency = <330000000>;
-
-		ecm-law@0 {
-			compatible = "fsl,ecm-law";
-			reg = <0x0 0x1000>;
-			fsl,num-laws = <8>;
-		};
-
-		ecm@1000 {
-			compatible = "fsl,mpc8560-ecm", "fsl,ecm";
-			reg = <0x1000 0x1000>;
-			interrupts = <17 2>;
-			interrupt-parent = <&mpic>;
-		};
-
-		memory-controller@2000 {
-			compatible = "fsl,mpc8540-memory-controller";
-			reg = <0x2000 0x1000>;
-			interrupt-parent = <&mpic>;
-			interrupts = <18 2>;
-		};
-
-		L2: l2-cache-controller@20000 {
-			compatible = "fsl,mpc8540-l2-cache-controller";
-			reg = <0x20000 0x1000>;
-			cache-line-size = <32>;	// 32 bytes
-			cache-size = <0x40000>;	// L2, 256K
-			interrupt-parent = <&mpic>;
-			interrupts = <16 2>;
-		};
-
-		dma@21300 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,mpc8560-dma", "fsl,eloplus-dma";
-			reg = <0x21300 0x4>;
-			ranges = <0x0 0x21100 0x200>;
-			cell-index = <0>;
-			dma-channel@0 {
-				compatible = "fsl,mpc8560-dma-channel",
-						"fsl,eloplus-dma-channel";
-				reg = <0x0 0x80>;
-				cell-index = <0>;
-				interrupt-parent = <&mpic>;
-				interrupts = <20 2>;
-			};
-			dma-channel@80 {
-				compatible = "fsl,mpc8560-dma-channel",
-						"fsl,eloplus-dma-channel";
-				reg = <0x80 0x80>;
-				cell-index = <1>;
-				interrupt-parent = <&mpic>;
-				interrupts = <21 2>;
-			};
-			dma-channel@100 {
-				compatible = "fsl,mpc8560-dma-channel",
-						"fsl,eloplus-dma-channel";
-				reg = <0x100 0x80>;
-				cell-index = <2>;
-				interrupt-parent = <&mpic>;
-				interrupts = <22 2>;
-			};
-			dma-channel@180 {
-				compatible = "fsl,mpc8560-dma-channel",
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
-				phy2: ethernet-phy@2 {
-					interrupt-parent = <&mpic>;
-					interrupts = <7 1>;
-					reg = <0x2>;
-				};
-				phy3: ethernet-phy@3 {
-					interrupt-parent = <&mpic>;
-					interrupts = <7 1>;
-					reg = <0x3>;
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
-			compatible = "fsl,mpc8560-cpm", "fsl,cpm2";
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
-					reg = <0x0 0x4000 0x9000 0x2000>;
-				};
-			};
-
-			brg@919f0 {
-				compatible = "fsl,mpc8560-brg",
-				             "fsl,cpm2-brg",
-				             "fsl,cpm-brg";
-				reg = <0x919f0 0x10 0x915f0 0x10>;
-				clock-frequency = <165000000>;
-			};
-
-			cpmpic: pic@90c00 {
-				interrupt-controller;
-				#address-cells = <0>;
-				#interrupt-cells = <2>;
-				interrupts = <46 2>;
-				interrupt-parent = <&mpic>;
-				reg = <0x90c00 0x80>;
-				compatible = "fsl,mpc8560-cpm-pic", "fsl,cpm2-pic";
-			};
-
-			serial0: serial@91a00 {
-				device_type = "serial";
-				compatible = "fsl,mpc8560-scc-uart",
-				             "fsl,cpm2-scc-uart";
-				reg = <0x91a00 0x20 0x88000 0x100>;
-				fsl,cpm-brg = <1>;
-				fsl,cpm-command = <0x800000>;
-				current-speed = <115200>;
-				interrupts = <40 8>;
-				interrupt-parent = <&cpmpic>;
-			};
-
-			serial1: serial@91a20 {
-				device_type = "serial";
-				compatible = "fsl,mpc8560-scc-uart",
-				             "fsl,cpm2-scc-uart";
-				reg = <0x91a20 0x20 0x88100 0x100>;
-				fsl,cpm-brg = <2>;
-				fsl,cpm-command = <0x4a00000>;
-				current-speed = <115200>;
-				interrupts = <41 8>;
-				interrupt-parent = <&cpmpic>;
-			};
-
-			enet2: ethernet@91320 {
-				device_type = "network";
-				compatible = "fsl,mpc8560-fcc-enet",
-				             "fsl,cpm2-fcc-enet";
-				reg = <0x91320 0x20 0x88500 0x100 0x913b0 0x1>;
-				local-mac-address = [ 00 00 00 00 00 00 ];
-				fsl,cpm-command = <0x16200300>;
-				interrupts = <33 8>;
-				interrupt-parent = <&cpmpic>;
-				phy-handle = <&phy2>;
-			};
-
-			enet3: ethernet@91340 {
-				device_type = "network";
-				compatible = "fsl,mpc8560-fcc-enet",
-				             "fsl,cpm2-fcc-enet";
-				reg = <0x91340 0x20 0x88600 0x100 0x913d0 0x1>;
-				local-mac-address = [ 00 00 00 00 00 00 ];
-				fsl,cpm-command = <0x1a400300>;
-				interrupts = <34 8>;
-				interrupt-parent = <&cpmpic>;
-				phy-handle = <&phy3>;
-			};
-		};
-	};
-
-	pci0: pci@e0008000 {
-		#interrupt-cells = <1>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		compatible = "fsl,mpc8540-pcix", "fsl,mpc8540-pci";
-		device_type = "pci";
-		reg = <0xe0008000 0x1000>;
-		clock-frequency = <66666666>;
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
-		interrupt-map = <
-
-				/* IDSEL 0x2 */
-				 0x1000 0x0 0x0 0x1 &mpic 0x1 0x1
-				 0x1000 0x0 0x0 0x2 &mpic 0x2 0x1
-				 0x1000 0x0 0x0 0x3 &mpic 0x3 0x1
-				 0x1000 0x0 0x0 0x4 &mpic 0x4 0x1
-
-				/* IDSEL 0x3 */
-				 0x1800 0x0 0x0 0x1 &mpic 0x4 0x1
-				 0x1800 0x0 0x0 0x2 &mpic 0x1 0x1
-				 0x1800 0x0 0x0 0x3 &mpic 0x2 0x1
-				 0x1800 0x0 0x0 0x4 &mpic 0x3 0x1
-
-				/* IDSEL 0x4 */
-				 0x2000 0x0 0x0 0x1 &mpic 0x3 0x1
-				 0x2000 0x0 0x0 0x2 &mpic 0x4 0x1
-				 0x2000 0x0 0x0 0x3 &mpic 0x1 0x1
-				 0x2000 0x0 0x0 0x4 &mpic 0x2 0x1
-
-				/* IDSEL 0x5  */
-				 0x2800 0x0 0x0 0x1 &mpic 0x2 0x1
-				 0x2800 0x0 0x0 0x2 &mpic 0x3 0x1
-				 0x2800 0x0 0x0 0x3 &mpic 0x4 0x1
-				 0x2800 0x0 0x0 0x4 &mpic 0x1 0x1
-
-				/* IDSEL 12 */
-				 0x6000 0x0 0x0 0x1 &mpic 0x1 0x1
-				 0x6000 0x0 0x0 0x2 &mpic 0x2 0x1
-				 0x6000 0x0 0x0 0x3 &mpic 0x3 0x1
-				 0x6000 0x0 0x0 0x4 &mpic 0x4 0x1
-
-				/* IDSEL 13 */
-				 0x6800 0x0 0x0 0x1 &mpic 0x4 0x1
-				 0x6800 0x0 0x0 0x2 &mpic 0x1 0x1
-				 0x6800 0x0 0x0 0x3 &mpic 0x2 0x1
-				 0x6800 0x0 0x0 0x4 &mpic 0x3 0x1
-
-				/* IDSEL 14*/
-				 0x7000 0x0 0x0 0x1 &mpic 0x3 0x1
-				 0x7000 0x0 0x0 0x2 &mpic 0x4 0x1
-				 0x7000 0x0 0x0 0x3 &mpic 0x1 0x1
-				 0x7000 0x0 0x0 0x4 &mpic 0x2 0x1
-
-				/* IDSEL 15 */
-				 0x7800 0x0 0x0 0x1 &mpic 0x2 0x1
-				 0x7800 0x0 0x0 0x2 &mpic 0x3 0x1
-				 0x7800 0x0 0x0 0x3 &mpic 0x4 0x1
-				 0x7800 0x0 0x0 0x4 &mpic 0x1 0x1
-
-				/* IDSEL 18 */
-				 0x9000 0x0 0x0 0x1 &mpic 0x1 0x1
-				 0x9000 0x0 0x0 0x2 &mpic 0x2 0x1
-				 0x9000 0x0 0x0 0x3 &mpic 0x3 0x1
-				 0x9000 0x0 0x0 0x4 &mpic 0x4 0x1
-
-				/* IDSEL 19 */
-				 0x9800 0x0 0x0 0x1 &mpic 0x4 0x1
-				 0x9800 0x0 0x0 0x2 &mpic 0x1 0x1
-				 0x9800 0x0 0x0 0x3 &mpic 0x2 0x1
-				 0x9800 0x0 0x0 0x4 &mpic 0x3 0x1
-
-				/* IDSEL 20 */
-				 0xa000 0x0 0x0 0x1 &mpic 0x3 0x1
-				 0xa000 0x0 0x0 0x2 &mpic 0x4 0x1
-				 0xa000 0x0 0x0 0x3 &mpic 0x1 0x1
-				 0xa000 0x0 0x0 0x4 &mpic 0x2 0x1
-
-				/* IDSEL 21 */
-				 0xa800 0x0 0x0 0x1 &mpic 0x2 0x1
-				 0xa800 0x0 0x0 0x2 &mpic 0x3 0x1
-				 0xa800 0x0 0x0 0x3 &mpic 0x4 0x1
-				 0xa800 0x0 0x0 0x4 &mpic 0x1 0x1>;
-
-		interrupt-parent = <&mpic>;
-		interrupts = <24 2>;
-		bus-range = <0 0>;
-		ranges = <0x2000000 0x0 0x80000000 0x80000000 0x0 0x20000000
-			  0x1000000 0x0 0x0 0xe2000000 0x0 0x1000000>;
-	};
-};
diff --git a/arch/powerpc/configs/85xx/mpc8540_ads_defconfig b/arch/powerpc/configs/85xx/mpc8540_ads_defconfig
deleted file mode 100644
index 618e03e0706d..000000000000
--- a/arch/powerpc/configs/85xx/mpc8540_ads_defconfig
+++ /dev/null
@@ -1,47 +0,0 @@
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
-CONFIG_MPC8540_ADS=y
-CONFIG_GEN_RTC=y
-CONFIG_BINFMT_MISC=y
-CONFIG_MATH_EMULATION=y
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
-CONFIG_BLK_DEV_RAM_SIZE=32768
-CONFIG_NETDEVICES=y
-CONFIG_GIANFAR=y
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
diff --git a/arch/powerpc/configs/85xx/mpc8560_ads_defconfig b/arch/powerpc/configs/85xx/mpc8560_ads_defconfig
deleted file mode 100644
index 9bc6283f2fb2..000000000000
--- a/arch/powerpc/configs/85xx/mpc8560_ads_defconfig
+++ /dev/null
@@ -1,50 +0,0 @@
-CONFIG_PPC_85xx=y
-CONFIG_SYSVIPC=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_PARTITION_ADVANCED=y
-# CONFIG_MSDOS_PARTITION is not set
-CONFIG_MPC8560_ADS=y
-CONFIG_GEN_RTC=y
-CONFIG_BINFMT_MISC=y
-CONFIG_MATH_EMULATION=y
-# CONFIG_SECCOMP is not set
-CONFIG_PCI=y
-CONFIG_PCI_DEBUG=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
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
-CONFIG_NETDEVICES=y
-CONFIG_FS_ENET=y
-# CONFIG_FS_ENET_HAS_SCC is not set
-CONFIG_GIANFAR=y
-CONFIG_E1000=y
-CONFIG_DAVICOM_PHY=y
-CONFIG_MARVELL_PHY=y
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-CONFIG_SERIAL_CPM=y
-CONFIG_SERIAL_CPM_CONSOLE=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT4_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
-CONFIG_DETECT_HUNG_TASK=y
-CONFIG_DEBUG_MUTEXES=y
diff --git a/arch/powerpc/configs/mpc85xx_base.config b/arch/powerpc/configs/mpc85xx_base.config
index 85907b776908..e13bcf83bd1d 100644
--- a/arch/powerpc/configs/mpc85xx_base.config
+++ b/arch/powerpc/configs/mpc85xx_base.config
@@ -1,7 +1,5 @@
 CONFIG_MATH_EMULATION=y
 CONFIG_MPC8536_DS=y
-CONFIG_MPC8540_ADS=y
-CONFIG_MPC8560_ADS=y
 CONFIG_MPC85xx_CDS=y
 CONFIG_MPC85xx_DS=y
 CONFIG_MPC85xx_MDS=y
diff --git a/arch/powerpc/platforms/85xx/Makefile b/arch/powerpc/platforms/85xx/Makefile
index 260fbad7967b..d618353b3c8c 100644
--- a/arch/powerpc/platforms/85xx/Makefile
+++ b/arch/powerpc/platforms/85xx/Makefile
@@ -12,8 +12,6 @@ obj-y += common.o
 obj-$(CONFIG_BSC9131_RDB) += bsc913x_rdb.o
 obj-$(CONFIG_BSC9132_QDS) += bsc913x_qds.o
 obj-$(CONFIG_C293_PCIE)   += c293pcie.o
-obj-$(CONFIG_MPC8540_ADS) += mpc85xx_ads.o
-obj-$(CONFIG_MPC8560_ADS) += mpc85xx_ads.o
 obj-$(CONFIG_MPC85xx_CDS) += mpc85xx_cds.o
 obj-$(CONFIG_MPC8536_DS)  += mpc8536_ds.o
 obj-$(CONFIG_MPC85xx_DS)  += mpc85xx_ds.o
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ads.c b/arch/powerpc/platforms/85xx/mpc85xx_ads.c
deleted file mode 100644
index a34fc037957d..000000000000
--- a/arch/powerpc/platforms/85xx/mpc85xx_ads.c
+++ /dev/null
@@ -1,171 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MPC85xx setup and early boot code plus other random bits.
- *
- * Maintained by Kumar Gala (see MAINTAINERS for contact information)
- *
- * Copyright 2005 Freescale Semiconductor Inc.
- */
-
-#include <linux/stddef.h>
-#include <linux/kernel.h>
-#include <linux/pci.h>
-#include <linux/kdev_t.h>
-#include <linux/delay.h>
-#include <linux/seq_file.h>
-#include <linux/of_platform.h>
-
-#include <asm/time.h>
-#include <asm/machdep.h>
-#include <asm/pci-bridge.h>
-#include <asm/mpic.h>
-#include <mm/mmu_decl.h>
-#include <asm/udbg.h>
-
-#include <sysdev/fsl_soc.h>
-#include <sysdev/fsl_pci.h>
-
-#ifdef CONFIG_CPM2
-#include <asm/cpm2.h>
-#include <sysdev/cpm2_pic.h>
-#endif
-
-#include "mpc85xx.h"
-
-static void __init mpc85xx_ads_pic_init(void)
-{
-	struct mpic *mpic = mpic_alloc(NULL, 0, MPIC_BIG_ENDIAN,
-			0, 256, " OpenPIC  ");
-	BUG_ON(mpic == NULL);
-	mpic_init(mpic);
-
-	mpc85xx_cpm2_pic_init();
-}
-
-/*
- * Setup the architecture
- */
-#ifdef CONFIG_CPM2
-struct cpm_pin {
-	int port, pin, flags;
-};
-
-static const struct cpm_pin mpc8560_ads_pins[] = {
-	/* SCC1 */
-	{3, 29, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{3, 30, CPM_PIN_OUTPUT | CPM_PIN_SECONDARY},
-	{3, 31, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-
-	/* SCC2 */
-	{2, 12, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{2, 13, CPM_PIN_INPUT | CPM_PIN_PRIMARY},
-	{3, 26, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
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
-	{2, 18, CPM_PIN_INPUT | CPM_PIN_PRIMARY}, /* CLK14 */
-	{2, 19, CPM_PIN_INPUT | CPM_PIN_PRIMARY}, /* CLK13 */
-
-	/* FCC3 */
-	{1, 4, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{1, 5, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-	{1, 6, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
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
-	{2, 16, CPM_PIN_INPUT | CPM_PIN_PRIMARY}, /* CLK16 */
-	{2, 17, CPM_PIN_INPUT | CPM_PIN_PRIMARY}, /* CLK15 */
-	{2, 27, CPM_PIN_OUTPUT | CPM_PIN_PRIMARY},
-};
-
-static void __init init_ioports(void)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(mpc8560_ads_pins); i++) {
-		const struct cpm_pin *pin = &mpc8560_ads_pins[i];
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
-#endif
-
-static void __init mpc85xx_ads_setup_arch(void)
-{
-	if (ppc_md.progress)
-		ppc_md.progress("mpc85xx_ads_setup_arch()", 0);
-
-#ifdef CONFIG_CPM2
-	cpm2_reset();
-	init_ioports();
-#endif
-
-	fsl_pci_assign_primary();
-}
-
-static void mpc85xx_ads_show_cpuinfo(struct seq_file *m)
-{
-	uint pvid, svid, phid1;
-
-	pvid = mfspr(SPRN_PVR);
-	svid = mfspr(SPRN_SVR);
-
-	seq_printf(m, "Vendor\t\t: Freescale Semiconductor\n");
-	seq_printf(m, "PVR\t\t: 0x%x\n", pvid);
-	seq_printf(m, "SVR\t\t: 0x%x\n", svid);
-
-	/* Display cpu Pll setting */
-	phid1 = mfspr(SPRN_HID1);
-	seq_printf(m, "PLL setting\t: 0x%x\n", ((phid1 >> 24) & 0x3f));
-}
-
-machine_arch_initcall(mpc85xx_ads, mpc85xx_common_publish_devices);
-
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init mpc85xx_ads_probe(void)
-{
-	return of_machine_is_compatible("MPC85xxADS");
-}
-
-define_machine(mpc85xx_ads) {
-	.name			= "MPC85xx ADS",
-	.probe			= mpc85xx_ads_probe,
-	.setup_arch		= mpc85xx_ads_setup_arch,
-	.init_IRQ		= mpc85xx_ads_pic_init,
-	.show_cpuinfo		= mpc85xx_ads_show_cpuinfo,
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
-};
-- 
2.17.1

