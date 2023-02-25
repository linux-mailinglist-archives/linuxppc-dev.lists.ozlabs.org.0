Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EF06A2BA1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Feb 2023 21:16:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PPJ1f5Gcvz3f50
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Feb 2023 07:16:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=NQ9GzTCO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.166.238; helo=mx0a-0064b401.pphosted.com; envelope-from=prvs=1420409688=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=NQ9GzTCO;
	dkim-atps=neutral
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PPHyf2QVkz3c6n
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Feb 2023 07:13:43 +1100 (AEDT)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31PK7I1f021664;
	Sat, 25 Feb 2023 12:13:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=oy0lqSH4PqJSAz7fuJumNvE+nsa1Igz1nmkwF7ACYo0=;
 b=NQ9GzTCO3u83BGvIfJIxhahC7AsH2L4VHO4V+Uv5apRjlSVYF3rSx1FRSA1vTrcHnTeI
 V5xB3kQbzmD9p4f0lWGEADSO+E0tKfPHqMaHiYRkvn0fqIa7a0SLGK8AzdT7mAX799Od
 2lEF+Te+nWGjDcdhTRlAsON7UjbIzuWQlwkjsuJs0UCpWEvNHBWm6mV8h7yVEOpZfwQp
 IoPcKIq8niiAZ6oBveq9Je/zNlUOqgE+DJt9BbIUpWCkpmpGLN1KjebC7dzzxbLNRq88
 k8X4z7rj4MqvjETwxrzW9/qBL9Gywn60QdnV19G3S+wLd9tDbmeVi1AAE+QSJRUFqRAC tg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nyjqr87ww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 25 Feb 2023 12:13:33 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Sat, 25 Feb 2023 12:13:32 -0800
Received: from sc2600cp.wrs.com (128.224.56.77) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Sat, 25 Feb 2023 12:13:31 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/3] powerpc: drop HPCD/MPC8610 evaluation platform support
Date: Sat, 25 Feb 2023 15:13:18 -0500
Message-ID: <20230225201318.3682-4-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230225201318.3682-1-paul.gortmaker@windriver.com>
References: <20230225201318.3682-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: d99qf9WnU9ZnQ0nO1O3ebG0cPUv_i_6x
X-Proofpoint-ORIG-GUID: d99qf9WnU9ZnQ0nO1O3ebG0cPUv_i_6x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-25_12,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302250170
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

This evaluation platform was essentially a single core 8641 with
integrated graphics/display support - in an effort to reduce chip count
on kiosk and similar applications.

Compared to other evaluation platforms considered for removal in other
recent commits, this platform was relatively rare.  Unlike all the other
10+ platforms, I couldn't find any documentation on it - just a link to
downloading the 2007 era BSP in "LTIB" format as was done back then.

With all that in mind, it seems prudent to remove it here in 2023.

Cc: Scott Wood <oss@buserror.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/powerpc/boot/dts/mpc8610_hpcd.dts     | 503 ---------------------
 arch/powerpc/configs/mpc86xx_base.config   |   1 -
 arch/powerpc/configs/ppc6xx_defconfig      |   1 -
 arch/powerpc/platforms/86xx/Kconfig        |   7 -
 arch/powerpc/platforms/86xx/Makefile       |   1 -
 arch/powerpc/platforms/86xx/mpc8610_hpcd.c | 333 --------------
 6 files changed, 846 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/mpc8610_hpcd.dts
 delete mode 100644 arch/powerpc/platforms/86xx/mpc8610_hpcd.c

diff --git a/arch/powerpc/boot/dts/mpc8610_hpcd.dts b/arch/powerpc/boot/dts/mpc8610_hpcd.dts
deleted file mode 100644
index 33bbe58c1ad0..000000000000
--- a/arch/powerpc/boot/dts/mpc8610_hpcd.dts
+++ /dev/null
@@ -1,503 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * MPC8610 HPCD Device Tree Source
- *
- * Copyright 2007-2008 Freescale Semiconductor Inc.
- */
-
-/dts-v1/;
-
-/ {
-	model = "MPC8610HPCD";
-	compatible = "fsl,MPC8610HPCD";
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	aliases {
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
-		PowerPC,8610@0 {
-			device_type = "cpu";
-			reg = <0>;
-			d-cache-line-size = <32>;
-			i-cache-line-size = <32>;
-			d-cache-size = <32768>;		// L1
-			i-cache-size = <32768>;		// L1
-			sleep = <&pmc 0x00008000 0	// core
-				 &pmc 0x00004000 0>;	// timebase
-			timebase-frequency = <0>;	// From uboot
-			bus-frequency = <0>;		// From uboot
-			clock-frequency = <0>;		// From uboot
-		};
-	};
-
-	memory {
-		device_type = "memory";
-		reg = <0x00000000 0x20000000>;	// 512M at 0x0
-	};
-
-	localbus@e0005000 {
-		#address-cells = <2>;
-		#size-cells = <1>;
-		compatible = "fsl,mpc8610-elbc", "fsl,elbc", "simple-bus";
-		reg = <0xe0005000 0x1000>;
-		interrupts = <19 2>;
-		interrupt-parent = <&mpic>;
-		ranges = <0 0 0xf8000000 0x08000000
-			  1 0 0xf0000000 0x08000000
-			  2 0 0xe8400000 0x00008000
-			  4 0 0xe8440000 0x00008000
-			  5 0 0xe8480000 0x00008000
-			  6 0 0xe84c0000 0x00008000
-			  3 0 0xe8000000 0x00000020>;
-		sleep = <&pmc 0x08000000 0>;
-
-		flash@0,0 {
-			compatible = "cfi-flash";
-			reg = <0 0 0x8000000>;
-			bank-width = <2>;
-			device-width = <1>;
-		};
-
-		flash@1,0 {
-			compatible = "cfi-flash";
-			reg = <1 0 0x8000000>;
-			bank-width = <2>;
-			device-width = <1>;
-		};
-
-		flash@2,0 {
-			compatible = "fsl,mpc8610-fcm-nand",
-				     "fsl,elbc-fcm-nand";
-			reg = <2 0 0x8000>;
-		};
-
-		flash@4,0 {
-			compatible = "fsl,mpc8610-fcm-nand",
-				     "fsl,elbc-fcm-nand";
-			reg = <4 0 0x8000>;
-		};
-
-		flash@5,0 {
-			compatible = "fsl,mpc8610-fcm-nand",
-				     "fsl,elbc-fcm-nand";
-			reg = <5 0 0x8000>;
-		};
-
-		flash@6,0 {
-			compatible = "fsl,mpc8610-fcm-nand",
-				     "fsl,elbc-fcm-nand";
-			reg = <6 0 0x8000>;
-		};
-
-		board-control@3,0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,fpga-pixis";
-			reg = <3 0 0x20>;
-			ranges = <0 3 0 0x20>;
-			interrupt-parent = <&mpic>;
-			interrupts = <8 8>;
-
-			sdcsr_pio: gpio-controller@a {
-				#gpio-cells = <2>;
-				compatible = "fsl,fpga-pixis-gpio-bank";
-				reg = <0xa 1>;
-				gpio-controller;
-			};
-		};
-	};
-
-	soc@e0000000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		#interrupt-cells = <2>;
-		device_type = "soc";
-		compatible = "fsl,mpc8610-immr", "simple-bus";
-		ranges = <0x0 0xe0000000 0x00100000>;
-		bus-frequency = <0>;
-
-		mcm-law@0 {
-			compatible = "fsl,mcm-law";
-			reg = <0x0 0x1000>;
-			fsl,num-laws = <10>;
-		};
-
-		mcm@1000 {
-			compatible = "fsl,mpc8610-mcm", "fsl,mcm";
-			reg = <0x1000 0x1000>;
-			interrupts = <17 2>;
-			interrupt-parent = <&mpic>;
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
-
-			cs4270:codec@4f {
-				compatible = "cirrus,cs4270";
-				reg = <0x4f>;
-				/* MCLK source is a stand-alone oscillator */
-				clock-frequency = <12288000>;
-			};
-		};
-
-		i2c@3100 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			cell-index = <1>;
-			compatible = "fsl-i2c";
-			reg = <0x3100 0x100>;
-			interrupts = <43 2>;
-			interrupt-parent = <&mpic>;
-			sleep = <&pmc 0x00000004 0>;
-			dfsrr;
-		};
-
-		serial0: serial@4500 {
-			cell-index = <0>;
-			device_type = "serial";
-			compatible = "fsl,ns16550", "ns16550";
-			reg = <0x4500 0x100>;
-			clock-frequency = <0>;
-			interrupts = <42 2>;
-			interrupt-parent = <&mpic>;
-			sleep = <&pmc 0x00000002 0>;
-		};
-
-		serial1: serial@4600 {
-			cell-index = <1>;
-			device_type = "serial";
-			compatible = "fsl,ns16550", "ns16550";
-			reg = <0x4600 0x100>;
-			clock-frequency = <0>;
-			interrupts = <42 2>;
-			interrupt-parent = <&mpic>;
-			sleep = <&pmc 0x00000008 0>;
-		};
-
-		spi@7000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "fsl,mpc8610-spi", "fsl,spi";
-			reg = <0x7000 0x40>;
-			cell-index = <0>;
-			interrupts = <59 2>;
-			interrupt-parent = <&mpic>;
-			mode = "cpu";
-			cs-gpios = <&sdcsr_pio 7 0>;
-			sleep = <&pmc 0x00000800 0>;
-
-			mmc-slot@0 {
-				compatible = "fsl,mpc8610hpcd-mmc-slot",
-					     "mmc-spi-slot";
-				reg = <0>;
-				gpios = <&sdcsr_pio 0 1   /* nCD */
-					 &sdcsr_pio 1 0>; /*  WP */
-				voltage-ranges = <3300 3300>;
-				spi-max-frequency = <50000000>;
-			};
-		};
-
-		display@2c000 {
-			compatible = "fsl,diu";
-			reg = <0x2c000 100>;
-			interrupts = <72 2>;
-			interrupt-parent = <&mpic>;
-			sleep = <&pmc 0x04000000 0>;
-		};
-
-		mpic: interrupt-controller@40000 {
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <2>;
-			reg = <0x40000 0x40000>;
-			compatible = "chrp,open-pic";
-			device_type = "open-pic";
-		};
-
-		msi@41600 {
-			compatible = "fsl,mpc8610-msi", "fsl,mpic-msi";
-			reg = <0x41600 0x80>;
-			msi-available-ranges = <0 0x100>;
-			interrupts = <
-				0xe0 0
-				0xe1 0
-				0xe2 0
-				0xe3 0
-				0xe4 0
-				0xe5 0
-				0xe6 0
-				0xe7 0>;
-			interrupt-parent = <&mpic>;
-		};
-
-		global-utilities@e0000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,mpc8610-guts";
-			reg = <0xe0000 0x1000>;
-			ranges = <0 0xe0000 0x1000>;
-			fsl,has-rstcr;
-
-			pmc: power@70 {
-				compatible = "fsl,mpc8610-pmc",
-					     "fsl,mpc8641d-pmc";
-				reg = <0x70 0x20>;
-			};
-		};
-
-		wdt@e4000 {
-			compatible = "fsl,mpc8610-wdt";
-			reg = <0xe4000 0x100>;
-		};
-
-		ssi@16000 {
-			compatible = "fsl,mpc8610-ssi";
-			cell-index = <0>;
-			reg = <0x16000 0x100>;
-			interrupt-parent = <&mpic>;
-			interrupts = <62 2>;
-			fsl,mode = "i2s-slave";
-			codec-handle = <&cs4270>;
-			fsl,playback-dma = <&dma00>;
-			fsl,capture-dma = <&dma01>;
-			fsl,fifo-depth = <8>;
-			sleep = <&pmc 0 0x08000000>;
-		};
-
-		ssi@16100 {
-			compatible = "fsl,mpc8610-ssi";
-			status = "disabled";
-			cell-index = <1>;
-			reg = <0x16100 0x100>;
-			interrupt-parent = <&mpic>;
-			interrupts = <63 2>;
-			fsl,fifo-depth = <8>;
-			sleep = <&pmc 0 0x04000000>;
-		};
-
-		dma@21300 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,mpc8610-dma", "fsl,eloplus-dma";
-			cell-index = <0>;
-			reg = <0x21300 0x4>; /* DMA general status register */
-			ranges = <0x0 0x21100 0x200>;
-			sleep = <&pmc 0x00000400 0>;
-
-			dma00: dma-channel@0 {
-				compatible = "fsl,mpc8610-dma-channel",
-					"fsl,ssi-dma-channel";
-				cell-index = <0>;
-				reg = <0x0 0x80>;
-				interrupt-parent = <&mpic>;
-				interrupts = <20 2>;
-			};
-			dma01: dma-channel@1 {
-				compatible = "fsl,mpc8610-dma-channel",
-					"fsl,ssi-dma-channel";
-				cell-index = <1>;
-				reg = <0x80 0x80>;
-				interrupt-parent = <&mpic>;
-				interrupts = <21 2>;
-			};
-			dma-channel@2 {
-				compatible = "fsl,mpc8610-dma-channel",
-					"fsl,eloplus-dma-channel";
-				cell-index = <2>;
-				reg = <0x100 0x80>;
-				interrupt-parent = <&mpic>;
-				interrupts = <22 2>;
-			};
-			dma-channel@3 {
-				compatible = "fsl,mpc8610-dma-channel",
-					"fsl,eloplus-dma-channel";
-				cell-index = <3>;
-				reg = <0x180 0x80>;
-				interrupt-parent = <&mpic>;
-				interrupts = <23 2>;
-			};
-		};
-
-		dma@c300 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,mpc8610-dma", "fsl,eloplus-dma";
-			cell-index = <1>;
-			reg = <0xc300 0x4>; /* DMA general status register */
-			ranges = <0x0 0xc100 0x200>;
-			sleep = <&pmc 0x00000200 0>;
-
-			dma-channel@0 {
-				compatible = "fsl,mpc8610-dma-channel",
-					"fsl,eloplus-dma-channel";
-				cell-index = <0>;
-				reg = <0x0 0x80>;
-				interrupt-parent = <&mpic>;
-				interrupts = <76 2>;
-			};
-			dma-channel@1 {
-				compatible = "fsl,mpc8610-dma-channel",
-					"fsl,eloplus-dma-channel";
-				cell-index = <1>;
-				reg = <0x80 0x80>;
-				interrupt-parent = <&mpic>;
-				interrupts = <77 2>;
-			};
-			dma-channel@2 {
-				compatible = "fsl,mpc8610-dma-channel",
-					"fsl,eloplus-dma-channel";
-				cell-index = <2>;
-				reg = <0x100 0x80>;
-				interrupt-parent = <&mpic>;
-				interrupts = <78 2>;
-			};
-			dma-channel@3 {
-				compatible = "fsl,mpc8610-dma-channel",
-					"fsl,eloplus-dma-channel";
-				cell-index = <3>;
-				reg = <0x180 0x80>;
-				interrupt-parent = <&mpic>;
-				interrupts = <79 2>;
-			};
-		};
-
-	};
-
-	pci0: pci@e0008000 {
-		compatible = "fsl,mpc8610-pci";
-		device_type = "pci";
-		#interrupt-cells = <1>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		reg = <0xe0008000 0x1000>;
-		bus-range = <0 0>;
-		ranges = <0x02000000 0x0 0x80000000 0x80000000 0x0 0x10000000
-			  0x01000000 0x0 0x00000000 0xe1000000 0x0 0x00100000>;
-		sleep = <&pmc 0x80000000 0>;
-		clock-frequency = <33333333>;
-		interrupt-parent = <&mpic>;
-		interrupts = <24 2>;
-		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <
-			/* IDSEL 0x11 */
-			0x8800 0 0 1 &mpic 4 1
-			0x8800 0 0 2 &mpic 5 1
-			0x8800 0 0 3 &mpic 6 1
-			0x8800 0 0 4 &mpic 7 1
-
-			/* IDSEL 0x12 */
-			0x9000 0 0 1 &mpic 5 1
-			0x9000 0 0 2 &mpic 6 1
-			0x9000 0 0 3 &mpic 7 1
-			0x9000 0 0 4 &mpic 4 1
-			>;
-	};
-
-	pci1: pcie@e000a000 {
-		compatible = "fsl,mpc8641-pcie";
-		device_type = "pci";
-		#interrupt-cells = <1>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		reg = <0xe000a000 0x1000>;
-		bus-range = <1 3>;
-		ranges = <0x02000000 0x0 0xa0000000 0xa0000000 0x0 0x10000000
-			  0x01000000 0x0 0x00000000 0xe3000000 0x0 0x00100000>;
-		sleep = <&pmc 0x40000000 0>;
-		clock-frequency = <33333333>;
-		interrupt-parent = <&mpic>;
-		interrupts = <26 2>;
-		interrupt-map-mask = <0xf800 0 0 7>;
-
-		interrupt-map = <
-			/* IDSEL 0x1b */
-			0xd800 0 0 1 &mpic 2 1
-
-			/* IDSEL 0x1c*/
-			0xe000 0 0 1 &mpic 1 1
-			0xe000 0 0 2 &mpic 1 1
-			0xe000 0 0 3 &mpic 1 1
-			0xe000 0 0 4 &mpic 1 1
-
-			/* IDSEL 0x1f */
-			0xf800 0 0 1 &mpic 3 2
-			0xf800 0 0 2 &mpic 0 1
-		>;
-
-		pcie@0 {
-			reg = <0 0 0 0 0>;
-			#size-cells = <2>;
-			#address-cells = <3>;
-			device_type = "pci";
-			ranges = <0x02000000 0x0 0xa0000000
-				  0x02000000 0x0 0xa0000000
-				  0x0 0x10000000
-				  0x01000000 0x0 0x00000000
-				  0x01000000 0x0 0x00000000
-				  0x0 0x00100000>;
-			uli1575@0 {
-				reg = <0 0 0 0 0>;
-				#size-cells = <2>;
-				#address-cells = <3>;
-				ranges = <0x02000000 0x0 0xa0000000
-					  0x02000000 0x0 0xa0000000
-					  0x0 0x10000000
-					  0x01000000 0x0 0x00000000
-					  0x01000000 0x0 0x00000000
-					  0x0 0x00100000>;
-
-				isa@1e {
-					device_type = "isa";
-					#size-cells = <1>;
-					#address-cells = <2>;
-					reg = <0xf000 0 0 0 0>;
-					ranges = <1 0 0x01000000 0 0
-						  0x00001000>;
-
-					rtc@70 {
-						compatible = "pnpPNP,b00";
-						reg = <1 0x70 2>;
-					};
-				};
-			};
-		};
-	};
-
-	pci2: pcie@e0009000 {
-		#address-cells = <3>;
-		#size-cells = <2>;
-		#interrupt-cells = <1>;
-		device_type = "pci";
-		compatible = "fsl,mpc8641-pcie";
-		reg = <0xe0009000 0x00001000>;
-		ranges = <0x02000000 0 0x90000000 0x90000000 0 0x10000000
-			  0x01000000 0 0x00000000 0xe2000000 0 0x00100000>;
-		bus-range = <0 255>;
-		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <0x0000 0 0 1 &mpic 4 1
-				 0x0000 0 0 2 &mpic 5 1
-				 0x0000 0 0 3 &mpic 6 1
-				 0x0000 0 0 4 &mpic 7 1>;
-		interrupt-parent = <&mpic>;
-		interrupts = <25 2>;
-		sleep = <&pmc 0x20000000 0>;
-		clock-frequency = <33333333>;
-	};
-};
diff --git a/arch/powerpc/configs/mpc86xx_base.config b/arch/powerpc/configs/mpc86xx_base.config
index 9f7a232c9357..632c014b122d 100644
--- a/arch/powerpc/configs/mpc86xx_base.config
+++ b/arch/powerpc/configs/mpc86xx_base.config
@@ -1,5 +1,4 @@
 CONFIG_PPC_86xx=y
-CONFIG_MPC8610_HPCD=y
 CONFIG_GEF_PPC9A=y
 CONFIG_GEF_SBC310=y
 CONFIG_GEF_SBC610=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 57f5e62992e0..3361ca800705 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -48,7 +48,6 @@ CONFIG_MPC836x_RDK=y
 CONFIG_MPC837x_RDB=y
 CONFIG_ASP834x=y
 CONFIG_PPC_86xx=y
-CONFIG_MPC8610_HPCD=y
 CONFIG_GEF_SBC610=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
diff --git a/arch/powerpc/platforms/86xx/Kconfig b/arch/powerpc/platforms/86xx/Kconfig
index 4fe385f37f3b..871fb2d50138 100644
--- a/arch/powerpc/platforms/86xx/Kconfig
+++ b/arch/powerpc/platforms/86xx/Kconfig
@@ -10,13 +10,6 @@ menuconfig PPC_86xx
 
 if PPC_86xx
 
-config MPC8610_HPCD
-	bool "Freescale MPC8610 HPCD"
-	select DEFAULT_UIMAGE
-	select FSL_ULI1575 if PCI
-	help
-	  This option enables support for the MPC8610 HPCD board.
-
 config GEF_PPC9A
 	bool "GE PPC9A"
 	select DEFAULT_UIMAGE
diff --git a/arch/powerpc/platforms/86xx/Makefile b/arch/powerpc/platforms/86xx/Makefile
index ab2c15114228..dafbc037ff42 100644
--- a/arch/powerpc/platforms/86xx/Makefile
+++ b/arch/powerpc/platforms/86xx/Makefile
@@ -5,7 +5,6 @@
 
 obj-y				:= pic.o common.o
 obj-$(CONFIG_SMP)		+= mpc86xx_smp.o
-obj-$(CONFIG_MPC8610_HPCD)	+= mpc8610_hpcd.o
 obj-$(CONFIG_GEF_SBC610)	+= gef_sbc610.o
 obj-$(CONFIG_GEF_SBC310)	+= gef_sbc310.o
 obj-$(CONFIG_GEF_PPC9A)		+= gef_ppc9a.o
diff --git a/arch/powerpc/platforms/86xx/mpc8610_hpcd.c b/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
deleted file mode 100644
index b593b9afd30a..000000000000
--- a/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
+++ /dev/null
@@ -1,333 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MPC8610 HPCD board specific routines
- *
- * Initial author: Xianghua Xiao <x.xiao@freescale.com>
- * Recode: Jason Jin <jason.jin@freescale.com>
- *         York Sun <yorksun@freescale.com>
- *
- * Rewrite the interrupt routing. remove the 8259PIC support,
- * All the integrated device in ULI use sideband interrupt.
- *
- * Copyright 2008 Freescale Semiconductor Inc.
- */
-
-#include <linux/stddef.h>
-#include <linux/kernel.h>
-#include <linux/pci.h>
-#include <linux/interrupt.h>
-#include <linux/kdev_t.h>
-#include <linux/delay.h>
-#include <linux/seq_file.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/fsl/guts.h>
-
-#include <asm/time.h>
-#include <asm/machdep.h>
-#include <asm/pci-bridge.h>
-#include <mm/mmu_decl.h>
-#include <asm/udbg.h>
-
-#include <asm/mpic.h>
-
-#include <linux/of_platform.h>
-#include <sysdev/fsl_pci.h>
-#include <sysdev/fsl_soc.h>
-
-#include "mpc86xx.h"
-
-static struct device_node *pixis_node;
-static unsigned char *pixis_bdcfg0, *pixis_arch;
-
-/* DIU Pixel Clock bits of the CLKDVDR Global Utilities register */
-#define CLKDVDR_PXCKEN		0x80000000
-#define CLKDVDR_PXCKINV		0x10000000
-#define CLKDVDR_PXCKDLY		0x06000000
-#define CLKDVDR_PXCLK_MASK	0x001F0000
-
-#ifdef CONFIG_SUSPEND
-static irqreturn_t mpc8610_sw9_irq(int irq, void *data)
-{
-	pr_debug("%s: PIXIS' event (sw9/wakeup) IRQ handled\n", __func__);
-	return IRQ_HANDLED;
-}
-
-static void __init mpc8610_suspend_init(void)
-{
-	int irq;
-	int ret;
-
-	if (!pixis_node)
-		return;
-
-	irq = irq_of_parse_and_map(pixis_node, 0);
-	if (!irq) {
-		pr_err("%s: can't map pixis event IRQ.\n", __func__);
-		return;
-	}
-
-	ret = request_irq(irq, mpc8610_sw9_irq, 0, "sw9:wakeup", NULL);
-	if (ret) {
-		pr_err("%s: can't request pixis event IRQ: %d\n",
-		       __func__, ret);
-		irq_dispose_mapping(irq);
-	}
-
-	enable_irq_wake(irq);
-}
-#else
-static inline void mpc8610_suspend_init(void) { }
-#endif /* CONFIG_SUSPEND */
-
-static const struct of_device_id mpc8610_ids[] __initconst = {
-	{ .compatible = "fsl,mpc8610-immr", },
-	{ .compatible = "fsl,mpc8610-guts", },
-	/* So that the DMA channel nodes can be probed individually: */
-	{ .compatible = "fsl,eloplus-dma", },
-	/* PCI controllers */
-	{ .compatible = "fsl,mpc8610-pci", },
-	{}
-};
-
-static int __init mpc8610_declare_of_platform_devices(void)
-{
-	/* Enable wakeup on PIXIS' event IRQ. */
-	mpc8610_suspend_init();
-
-	mpc86xx_common_publish_devices();
-
-	/* Without this call, the SSI device driver won't get probed. */
-	of_platform_bus_probe(NULL, mpc8610_ids, NULL);
-
-	return 0;
-}
-machine_arch_initcall(mpc86xx_hpcd, mpc8610_declare_of_platform_devices);
-
-#if defined(CONFIG_FB_FSL_DIU) || defined(CONFIG_FB_FSL_DIU_MODULE)
-
-/*
- * DIU Area Descriptor
- *
- * The MPC8610 reference manual shows the bits of the AD register in
- * little-endian order, which causes the BLUE_C field to be split into two
- * parts. To simplify the definition of the MAKE_AD() macro, we define the
- * fields in big-endian order and byte-swap the result.
- *
- * So even though the registers don't look like they're in the
- * same bit positions as they are on the P1022, the same value is written to
- * the AD register on the MPC8610 and on the P1022.
- */
-#define AD_BYTE_F		0x10000000
-#define AD_ALPHA_C_MASK		0x0E000000
-#define AD_ALPHA_C_SHIFT	25
-#define AD_BLUE_C_MASK		0x01800000
-#define AD_BLUE_C_SHIFT		23
-#define AD_GREEN_C_MASK		0x00600000
-#define AD_GREEN_C_SHIFT	21
-#define AD_RED_C_MASK		0x00180000
-#define AD_RED_C_SHIFT		19
-#define AD_PALETTE		0x00040000
-#define AD_PIXEL_S_MASK		0x00030000
-#define AD_PIXEL_S_SHIFT	16
-#define AD_COMP_3_MASK		0x0000F000
-#define AD_COMP_3_SHIFT		12
-#define AD_COMP_2_MASK		0x00000F00
-#define AD_COMP_2_SHIFT		8
-#define AD_COMP_1_MASK		0x000000F0
-#define AD_COMP_1_SHIFT		4
-#define AD_COMP_0_MASK		0x0000000F
-#define AD_COMP_0_SHIFT		0
-
-#define MAKE_AD(alpha, red, blue, green, size, c0, c1, c2, c3) \
-	cpu_to_le32(AD_BYTE_F | (alpha << AD_ALPHA_C_SHIFT) | \
-	(blue << AD_BLUE_C_SHIFT) | (green << AD_GREEN_C_SHIFT) | \
-	(red << AD_RED_C_SHIFT) | (c3 << AD_COMP_3_SHIFT) | \
-	(c2 << AD_COMP_2_SHIFT) | (c1 << AD_COMP_1_SHIFT) | \
-	(c0 << AD_COMP_0_SHIFT) | (size << AD_PIXEL_S_SHIFT))
-
-u32 mpc8610hpcd_get_pixel_format(enum fsl_diu_monitor_port port,
-				 unsigned int bits_per_pixel)
-{
-	static const u32 pixelformat[][3] = {
-		{
-			MAKE_AD(3, 0, 2, 1, 3, 8, 8, 8, 8),
-			MAKE_AD(4, 2, 0, 1, 2, 8, 8, 8, 0),
-			MAKE_AD(4, 0, 2, 1, 1, 5, 6, 5, 0)
-		},
-		{
-			MAKE_AD(3, 2, 0, 1, 3, 8, 8, 8, 8),
-			MAKE_AD(4, 0, 2, 1, 2, 8, 8, 8, 0),
-			MAKE_AD(4, 2, 0, 1, 1, 5, 6, 5, 0)
-		},
-	};
-	unsigned int arch_monitor;
-
-	/* The DVI port is mis-wired on revision 1 of this board. */
-	arch_monitor =
-		((*pixis_arch == 0x01) && (port == FSL_DIU_PORT_DVI)) ? 0 : 1;
-
-	switch (bits_per_pixel) {
-	case 32:
-		return pixelformat[arch_monitor][0];
-	case 24:
-		return pixelformat[arch_monitor][1];
-	case 16:
-		return pixelformat[arch_monitor][2];
-	default:
-		pr_err("fsl-diu: unsupported pixel depth %u\n", bits_per_pixel);
-		return 0;
-	}
-}
-
-void mpc8610hpcd_set_gamma_table(enum fsl_diu_monitor_port port,
-				 char *gamma_table_base)
-{
-	int i;
-	if (port == FSL_DIU_PORT_DLVDS) {
-		for (i = 0; i < 256*3; i++)
-			gamma_table_base[i] = (gamma_table_base[i] << 2) |
-					 ((gamma_table_base[i] >> 6) & 0x03);
-	}
-}
-
-#define PX_BRDCFG0_DVISEL	(1 << 3)
-#define PX_BRDCFG0_DLINK	(1 << 4)
-#define PX_BRDCFG0_DIU_MASK	(PX_BRDCFG0_DVISEL | PX_BRDCFG0_DLINK)
-
-void mpc8610hpcd_set_monitor_port(enum fsl_diu_monitor_port port)
-{
-	switch (port) {
-	case FSL_DIU_PORT_DVI:
-		clrsetbits_8(pixis_bdcfg0, PX_BRDCFG0_DIU_MASK,
-			     PX_BRDCFG0_DVISEL | PX_BRDCFG0_DLINK);
-		break;
-	case FSL_DIU_PORT_LVDS:
-		clrsetbits_8(pixis_bdcfg0, PX_BRDCFG0_DIU_MASK,
-			     PX_BRDCFG0_DLINK);
-		break;
-	case FSL_DIU_PORT_DLVDS:
-		clrbits8(pixis_bdcfg0, PX_BRDCFG0_DIU_MASK);
-		break;
-	}
-}
-
-/**
- * mpc8610hpcd_set_pixel_clock: program the DIU's clock
- *
- * @pixclock: the wavelength, in picoseconds, of the clock
- */
-void mpc8610hpcd_set_pixel_clock(unsigned int pixclock)
-{
-	struct device_node *guts_np = NULL;
-	struct ccsr_guts __iomem *guts;
-	unsigned long freq;
-	u64 temp;
-	u32 pxclk;
-
-	/* Map the global utilities registers. */
-	guts_np = of_find_compatible_node(NULL, NULL, "fsl,mpc8610-guts");
-	if (!guts_np) {
-		pr_err("mpc8610hpcd: missing global utilities device node\n");
-		return;
-	}
-
-	guts = of_iomap(guts_np, 0);
-	of_node_put(guts_np);
-	if (!guts) {
-		pr_err("mpc8610hpcd: could not map global utilities device\n");
-		return;
-	}
-
-	/* Convert pixclock from a wavelength to a frequency */
-	temp = 1000000000000ULL;
-	do_div(temp, pixclock);
-	freq = temp;
-
-	/*
-	 * 'pxclk' is the ratio of the platform clock to the pixel clock.
-	 * On the MPC8610, the value programmed into CLKDVDR is the ratio
-	 * minus one.  The valid range of values is 2-31.
-	 */
-	pxclk = DIV_ROUND_CLOSEST(fsl_get_sys_freq(), freq) - 1;
-	pxclk = clamp_t(u32, pxclk, 2, 31);
-
-	/* Disable the pixel clock, and set it to non-inverted and no delay */
-	clrbits32(&guts->clkdvdr,
-		  CLKDVDR_PXCKEN | CLKDVDR_PXCKDLY | CLKDVDR_PXCLK_MASK);
-
-	/* Enable the clock and set the pxclk */
-	setbits32(&guts->clkdvdr, CLKDVDR_PXCKEN | (pxclk << 16));
-
-	iounmap(guts);
-}
-
-enum fsl_diu_monitor_port
-mpc8610hpcd_valid_monitor_port(enum fsl_diu_monitor_port port)
-{
-	return port;
-}
-
-#endif
-
-static void __init mpc86xx_hpcd_setup_arch(void)
-{
-	struct resource r;
-	unsigned char *pixis;
-
-	if (ppc_md.progress)
-		ppc_md.progress("mpc86xx_hpcd_setup_arch()", 0);
-
-	fsl_pci_assign_primary();
-
-#if defined(CONFIG_FB_FSL_DIU) || defined(CONFIG_FB_FSL_DIU_MODULE)
-	diu_ops.get_pixel_format	= mpc8610hpcd_get_pixel_format;
-	diu_ops.set_gamma_table		= mpc8610hpcd_set_gamma_table;
-	diu_ops.set_monitor_port	= mpc8610hpcd_set_monitor_port;
-	diu_ops.set_pixel_clock		= mpc8610hpcd_set_pixel_clock;
-	diu_ops.valid_monitor_port	= mpc8610hpcd_valid_monitor_port;
-#endif
-
-	pixis_node = of_find_compatible_node(NULL, NULL, "fsl,fpga-pixis");
-	if (pixis_node) {
-		of_address_to_resource(pixis_node, 0, &r);
-		of_node_put(pixis_node);
-		pixis = ioremap(r.start, 32);
-		if (!pixis) {
-			printk(KERN_ERR "Err: can't map FPGA cfg register!\n");
-			return;
-		}
-		pixis_bdcfg0 = pixis + 8;
-		pixis_arch = pixis + 1;
-	} else
-		printk(KERN_ERR "Err: "
-				"can't find device node 'fsl,fpga-pixis'\n");
-
-	printk("MPC86xx HPCD board from Freescale Semiconductor\n");
-}
-
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init mpc86xx_hpcd_probe(void)
-{
-	if (of_machine_is_compatible("fsl,MPC8610HPCD"))
-		return 1;	/* Looks good */
-
-	return 0;
-}
-
-define_machine(mpc86xx_hpcd) {
-	.name			= "MPC86xx HPCD",
-	.probe			= mpc86xx_hpcd_probe,
-	.setup_arch		= mpc86xx_hpcd_setup_arch,
-	.init_IRQ		= mpc86xx_init_irq,
-	.get_irq		= mpic_get_irq,
-	.time_init		= mpc86xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-#endif
-};
-- 
2.17.1

