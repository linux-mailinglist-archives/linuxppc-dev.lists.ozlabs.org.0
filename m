Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7082069CB0C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 13:32:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PL1yT2PTvz3cFT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 23:32:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=O8BudxKy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.166.238; helo=mx0a-0064b401.pphosted.com; envelope-from=prvs=141586787b=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=O8BudxKy;
	dkim-atps=neutral
X-Greylist: delayed 1891 seconds by postgrey-1.36 at boromir; Mon, 20 Feb 2023 23:31:28 AEDT
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PL1xX3TZCz2yZv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 23:31:27 +1100 (AEDT)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31K9CRc1026793;
	Mon, 20 Feb 2023 03:59:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=AJ8MYtM0ELyIf6a4LC9JA9sHkckZhdD/hgFYl6bmQso=;
 b=O8BudxKyTNC7u+ZsHNwLDrP/Nf7wItWyxfEbjqmC1W4obBWuScnIQJJP2cLyhXHBmNkU
 /U7/PD7APqfHOE3VEZfdg8QUG6aMR8qdgfMGbaoU/b4PDs2kT6Bpo0W8P3+4EbcS4NjC
 4S/tHMyI0uIU91tvX715jn6fCleJ63LX+1IDFuRBGSh9h9pBLdSUyUmJzTOZRZuQ2DKQ
 Rq75p+ix84HniLbbd1J6xI0DcO96i/zRUourbu0gkcg56YH+72oYLN3H3POpB1G8enMn
 sl4o+6OpoLaSYZXqy/GwVFKdkgBxYGPEUgbDHik0CzBulbfIEEYMsen2EAq750c4JkTd tg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nty2psch8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 20 Feb 2023 03:59:47 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Mon, 20 Feb 2023 03:59:46 -0800
Received: from sc2600cp.wrs.com (128.224.56.77) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Mon, 20 Feb 2023 03:59:45 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/4] powerpc: drop MPC836x_MDS platform support
Date: Mon, 20 Feb 2023 06:59:11 -0500
Message-ID: <20230220115913.25811-3-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230220115913.25811-1-paul.gortmaker@windriver.com>
References: <20230220115913.25811-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 2KDsp9W1_ROY4yiHLwpgU7Okq7Oxo11b
X-Proofpoint-GUID: 2KDsp9W1_ROY4yiHLwpgU7Okq7Oxo11b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_09,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200108
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

This 2006 era Modular Development System (MDS) has, at its core component,
a full length card with a PCI edge.  No case.  Serial and network
connectors were on card, so it could optionally be fitted with plastic
stand-offs and run stand-alone off a power brick.

This is very similar to the MPC834x_MDS removed in the prior commit, but
with this board variant as an evolutionary step.  DDR2 was now an option,
and the card edge was revised down to PCI-32 as PCI-64 never got traction.
But overall the form factor and design goals were unchanged.

Like all the MDS systems, it was meant as a vehicle to get the CPU out
early to hardware OEMs so software and board development could take place
in parallel.

To that end, the BGA CPU was held in place with a mechanical spring loaded
pressure assembly (vs. solder) so that early rev silicon could be replaced
in the field.  Not for COTS deployment!

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
 arch/powerpc/boot/dts/mpc836x_mds.dts         | 481 ------------------
 .../configs/83xx/mpc836x_mds_defconfig        |  64 ---
 arch/powerpc/configs/mpc83xx_defconfig        |   1 -
 arch/powerpc/configs/ppc6xx_defconfig         |   1 -
 arch/powerpc/platforms/83xx/Kconfig           |   6 -
 arch/powerpc/platforms/83xx/Makefile          |   1 -
 arch/powerpc/platforms/83xx/mpc836x_mds.c     | 210 --------
 7 files changed, 764 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/mpc836x_mds.dts
 delete mode 100644 arch/powerpc/configs/83xx/mpc836x_mds_defconfig
 delete mode 100644 arch/powerpc/platforms/83xx/mpc836x_mds.c

diff --git a/arch/powerpc/boot/dts/mpc836x_mds.dts b/arch/powerpc/boot/dts/mpc836x_mds.dts
deleted file mode 100644
index f4ca12ec57f1..000000000000
--- a/arch/powerpc/boot/dts/mpc836x_mds.dts
+++ /dev/null
@@ -1,481 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MPC8360E EMDS Device Tree Source
- *
- * Copyright 2006 Freescale Semiconductor Inc.
- */
-
-
-/*
-/memreserve/	00000000 1000000;
-*/
-
-/dts-v1/;
-
-/ {
-	model = "MPC8360MDS";
-	compatible = "MPC8360EMDS", "MPC836xMDS", "MPC83xxMDS";
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
-		PowerPC,8360@0 {
-			device_type = "cpu";
-			reg = <0x0>;
-			d-cache-line-size = <32>;	// 32 bytes
-			i-cache-line-size = <32>;	// 32 bytes
-			d-cache-size = <32768>;		// L1, 32K
-			i-cache-size = <32768>;		// L1, 32K
-			timebase-frequency = <66000000>;
-			bus-frequency = <264000000>;
-			clock-frequency = <528000000>;
-		};
-	};
-
-	memory {
-		device_type = "memory";
-		reg = <0x00000000 0x10000000>;
-	};
-
-	localbus@e0005000 {
-		#address-cells = <2>;
-		#size-cells = <1>;
-		compatible = "fsl,mpc8360-localbus", "fsl,pq2pro-localbus",
-			     "simple-bus";
-		reg = <0xe0005000 0xd8>;
-		ranges = <0 0 0xfe000000 0x02000000
-		          1 0 0xf8000000 0x00008000>;
-
-		flash@0,0 {
-			compatible = "cfi-flash";
-			reg = <0 0 0x2000000>;
-			bank-width = <2>;
-			device-width = <1>;
-		};
-
-		bcsr@1,0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
- 			compatible = "fsl,mpc8360mds-bcsr";
-			reg = <1 0 0x8000>;
-			ranges = <0 1 0 0x8000>;
-
-			bcsr13: gpio-controller@d {
-				#gpio-cells = <2>;
-				compatible = "fsl,mpc8360mds-bcsr-gpio";
-				reg = <0xd 1>;
-				gpio-controller;
-			};
-		};
-	};
-
-	soc8360@e0000000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		device_type = "soc";
-		compatible = "simple-bus";
-		ranges = <0x0 0xe0000000 0x00100000>;
-		reg = <0xe0000000 0x00000200>;
-		bus-frequency = <264000000>;
-
-		wdt@200 {
-			device_type = "watchdog";
-			compatible = "mpc83xx_wdt";
-			reg = <0x200 0x100>;
-		};
-
-		pmc: power@b00 {
-			compatible = "fsl,mpc8360-pmc", "fsl,mpc8349-pmc";
-			reg = <0xb00 0x100 0xa00 0x100>;
-			interrupts = <80 0x8>;
-			interrupt-parent = <&ipic>;
-		};
-
-		i2c@3000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			cell-index = <0>;
-			compatible = "fsl-i2c";
-			reg = <0x3000 0x100>;
-			interrupts = <14 0x8>;
-			interrupt-parent = <&ipic>;
-			dfsrr;
-
-			rtc@68 {
-				compatible = "dallas,ds1374";
-				reg = <0x68>;
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
-		serial0: serial@4500 {
-			cell-index = <0>;
-			device_type = "serial";
-			compatible = "fsl,ns16550", "ns16550";
-			reg = <0x4500 0x100>;
-			clock-frequency = <264000000>;
-			interrupts = <9 0x8>;
-			interrupt-parent = <&ipic>;
-		};
-
-		serial1: serial@4600 {
-			cell-index = <1>;
-			device_type = "serial";
-			compatible = "fsl,ns16550", "ns16550";
-			reg = <0x4600 0x100>;
-			clock-frequency = <264000000>;
-			interrupts = <10 0x8>;
-			interrupt-parent = <&ipic>;
-		};
-
-		dma@82a8 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,mpc8360-dma", "fsl,elo-dma";
-			reg = <0x82a8 4>;
-			ranges = <0 0x8100 0x1a8>;
-			interrupt-parent = <&ipic>;
-			interrupts = <71 8>;
-			cell-index = <0>;
-			dma-channel@0 {
-				compatible = "fsl,mpc8360-dma-channel", "fsl,elo-dma-channel";
-				reg = <0 0x80>;
-				cell-index = <0>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-			dma-channel@80 {
-				compatible = "fsl,mpc8360-dma-channel", "fsl,elo-dma-channel";
-				reg = <0x80 0x80>;
-				cell-index = <1>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-			dma-channel@100 {
-				compatible = "fsl,mpc8360-dma-channel", "fsl,elo-dma-channel";
-				reg = <0x100 0x80>;
-				cell-index = <2>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-			dma-channel@180 {
-				compatible = "fsl,mpc8360-dma-channel", "fsl,elo-dma-channel";
-				reg = <0x180 0x28>;
-				cell-index = <3>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-		};
-
-		crypto@30000 {
-			compatible = "fsl,sec2.0";
-			reg = <0x30000 0x10000>;
-			interrupts = <11 0x8>;
-			interrupt-parent = <&ipic>;
-			fsl,num-channels = <4>;
-			fsl,channel-fifo-len = <24>;
-			fsl,exec-units-mask = <0x7e>;
-			fsl,descriptor-types-mask = <0x01010ebf>;
-			sleep = <&pmc 0x03000000>;
-		};
-
-		ipic: pic@700 {
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <2>;
-			reg = <0x700 0x100>;
-			device_type = "ipic";
-		};
-
-		par_io@1400 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			reg = <0x1400 0x100>;
-			ranges = <0 0x1400 0x100>;
-			device_type = "par_io";
-			num-ports = <7>;
-
-			qe_pio_b: gpio-controller@18 {
-				#gpio-cells = <2>;
-				compatible = "fsl,mpc8360-qe-pario-bank",
-					     "fsl,mpc8323-qe-pario-bank";
-				reg = <0x18 0x18>;
-				gpio-controller;
-			};
-
-			pio1: ucc_pin@1 {
-				pio-map = <
-			/* port  pin  dir  open_drain  assignment  has_irq */
-					0  3  1  0  1  0 	/* TxD0 */
-					0  4  1  0  1  0 	/* TxD1 */
-					0  5  1  0  1  0 	/* TxD2 */
-					0  6  1  0  1  0 	/* TxD3 */
-					1  6  1  0  3  0 	/* TxD4 */
-					1  7  1  0  1  0 	/* TxD5 */
-					1  9  1  0  2  0 	/* TxD6 */
-					1  10 1  0  2  0 	/* TxD7 */
-					0  9  2  0  1  0 	/* RxD0 */
-					0  10 2  0  1  0 	/* RxD1 */
-					0  11 2  0  1  0 	/* RxD2 */
-					0  12 2  0  1  0 	/* RxD3 */
-					0  13 2  0  1  0 	/* RxD4 */
-					1  1  2  0  2  0 	/* RxD5 */
-					1  0  2  0  2  0 	/* RxD6 */
-					1  4  2  0  2  0 	/* RxD7 */
-					0  7  1  0  1  0 	/* TX_EN */
-					0  8  1  0  1  0 	/* TX_ER */
-					0  15 2  0  1  0 	/* RX_DV */
-					0  16 2  0  1  0 	/* RX_ER */
-					0  0  2  0  1  0 	/* RX_CLK */
-					2  9  1  0  3  0 	/* GTX_CLK - CLK10 */
-					2  8  2  0  1  0>;	/* GTX125 - CLK9 */
-			};
-			pio2: ucc_pin@2 {
-				pio-map = <
-			/* port  pin  dir  open_drain  assignment  has_irq */
-					0  17 1  0  1  0   /* TxD0 */
-					0  18 1  0  1  0   /* TxD1 */
-					0  19 1  0  1  0   /* TxD2 */
-					0  20 1  0  1  0   /* TxD3 */
-					1  2  1  0  1  0   /* TxD4 */
-					1  3  1  0  2  0   /* TxD5 */
-					1  5  1  0  3  0   /* TxD6 */
-					1  8  1  0  3  0   /* TxD7 */
-					0  23 2  0  1  0   /* RxD0 */
-					0  24 2  0  1  0   /* RxD1 */
-					0  25 2  0  1  0   /* RxD2 */
-					0  26 2  0  1  0   /* RxD3 */
-					0  27 2  0  1  0   /* RxD4 */
-					1  12 2  0  2  0   /* RxD5 */
-					1  13 2  0  3  0   /* RxD6 */
-					1  11 2  0  2  0   /* RxD7 */
-					0  21 1  0  1  0   /* TX_EN */
-					0  22 1  0  1  0   /* TX_ER */
-					0  29 2  0  1  0   /* RX_DV */
-					0  30 2  0  1  0   /* RX_ER */
-					0  31 2  0  1  0   /* RX_CLK */
-					2  2  1  0  2  0   /* GTX_CLK - CLK10 */
-					2  3  2  0  1  0   /* GTX125 - CLK4 */
-					0  1  3  0  2  0   /* MDIO */
-					0  2  1  0  1  0>; /* MDC */
-			};
-
-		};
-	};
-
-	qe@e0100000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		device_type = "qe";
-		compatible = "fsl,qe";
-		ranges = <0x0 0xe0100000 0x00100000>;
-		reg = <0xe0100000 0x480>;
-		brg-frequency = <0>;
-		bus-frequency = <396000000>;
-		fsl,qe-num-riscs = <2>;
-		fsl,qe-num-snums = <28>;
-
-		muram@10000 {
- 			#address-cells = <1>;
- 			#size-cells = <1>;
-			compatible = "fsl,qe-muram", "fsl,cpm-muram";
-			ranges = <0x0 0x00010000 0x0000c000>;
-
-			data-only@0 {
-				compatible = "fsl,qe-muram-data",
-					     "fsl,cpm-muram-data";
-				reg = <0x0 0xc000>;
-			};
-		};
-
-		timer@440 {
-			compatible = "fsl,mpc8360-qe-gtm",
-				     "fsl,qe-gtm", "fsl,gtm";
-			reg = <0x440 0x40>;
-			clock-frequency = <132000000>;
-			interrupts = <12 13 14 15>;
-			interrupt-parent = <&qeic>;
-		};
-
-		spi@4c0 {
-			cell-index = <0>;
-			compatible = "fsl,spi";
-			reg = <0x4c0 0x40>;
-			interrupts = <2>;
-			interrupt-parent = <&qeic>;
-			mode = "cpu";
-		};
-
-		spi@500 {
-			cell-index = <1>;
-			compatible = "fsl,spi";
-			reg = <0x500 0x40>;
-			interrupts = <1>;
-			interrupt-parent = <&qeic>;
-			mode = "cpu";
-		};
-
-		usb@6c0 {
-			compatible = "fsl,mpc8360-qe-usb",
-				     "fsl,mpc8323-qe-usb";
-			reg = <0x6c0 0x40 0x8b00 0x100>;
-			interrupts = <11>;
-			interrupt-parent = <&qeic>;
-			fsl,fullspeed-clock = "clk21";
-			fsl,lowspeed-clock = "brg9";
-			gpios = <&qe_pio_b  2 0   /* USBOE */
-				 &qe_pio_b  3 0   /* USBTP */
-				 &qe_pio_b  8 0   /* USBTN */
-				 &qe_pio_b  9 0   /* USBRP */
-				 &qe_pio_b 11 0   /* USBRN */
-				 &bcsr13    5 0   /* SPEED */
-				 &bcsr13    4 1>; /* POWER */
-		};
-
-		enet0: ucc@2000 {
-			device_type = "network";
-			compatible = "ucc_geth";
-			cell-index = <1>;
-			reg = <0x2000 0x200>;
-			interrupts = <32>;
-			interrupt-parent = <&qeic>;
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			rx-clock-name = "none";
-			tx-clock-name = "clk9";
-			phy-handle = <&phy0>;
-			phy-connection-type = "rgmii-id";
-			pio-handle = <&pio1>;
-		};
-
-		enet1: ucc@3000 {
-			device_type = "network";
-			compatible = "ucc_geth";
-			cell-index = <2>;
-			reg = <0x3000 0x200>;
-			interrupts = <33>;
-			interrupt-parent = <&qeic>;
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			rx-clock-name = "none";
-			tx-clock-name = "clk4";
-			phy-handle = <&phy1>;
-			phy-connection-type = "rgmii-id";
-			pio-handle = <&pio2>;
-		};
-
-		mdio@2120 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0x2120 0x18>;
-			compatible = "fsl,ucc-mdio";
-
-			phy0: ethernet-phy@0 {
-				interrupt-parent = <&ipic>;
-				interrupts = <17 0x8>;
-				reg = <0x0>;
-			};
-			phy1: ethernet-phy@1 {
-				interrupt-parent = <&ipic>;
-				interrupts = <18 0x8>;
-				reg = <0x1>;
-			};
-			tbi-phy@2 {
-				device_type = "tbi-phy";
-				reg = <0x2>;
-			};
-		};
-
-		qeic: interrupt-controller@80 {
-			interrupt-controller;
-			compatible = "fsl,qe-ic";
-			#address-cells = <0>;
-			#interrupt-cells = <1>;
-			reg = <0x80 0x80>;
-			big-endian;
-			interrupts = <32 0x8 33 0x8>; // high:32 low:33
-			interrupt-parent = <&ipic>;
-		};
-	};
-
-	pci0: pci@e0008500 {
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
-		interrupt-map = <
-
-				/* IDSEL 0x11 AD17 */
-				 0x8800 0x0 0x0 0x1 &ipic 20 0x8
-				 0x8800 0x0 0x0 0x2 &ipic 21 0x8
-				 0x8800 0x0 0x0 0x3 &ipic 22 0x8
-				 0x8800 0x0 0x0 0x4 &ipic 23 0x8
-
-				/* IDSEL 0x12 AD18 */
-				 0x9000 0x0 0x0 0x1 &ipic 22 0x8
-				 0x9000 0x0 0x0 0x2 &ipic 23 0x8
-				 0x9000 0x0 0x0 0x3 &ipic 20 0x8
-				 0x9000 0x0 0x0 0x4 &ipic 21 0x8
-
-				/* IDSEL 0x13 AD19 */
-				 0x9800 0x0 0x0 0x1 &ipic 23 0x8
-				 0x9800 0x0 0x0 0x2 &ipic 20 0x8
-				 0x9800 0x0 0x0 0x3 &ipic 21 0x8
-				 0x9800 0x0 0x0 0x4 &ipic 22 0x8
-
-				/* IDSEL 0x15 AD21*/
-				 0xa800 0x0 0x0 0x1 &ipic 20 0x8
-				 0xa800 0x0 0x0 0x2 &ipic 21 0x8
-				 0xa800 0x0 0x0 0x3 &ipic 22 0x8
-				 0xa800 0x0 0x0 0x4 &ipic 23 0x8
-
-				/* IDSEL 0x16 AD22*/
-				 0xb000 0x0 0x0 0x1 &ipic 23 0x8
-				 0xb000 0x0 0x0 0x2 &ipic 20 0x8
-				 0xb000 0x0 0x0 0x3 &ipic 21 0x8
-				 0xb000 0x0 0x0 0x4 &ipic 22 0x8
-
-				/* IDSEL 0x17 AD23*/
-				 0xb800 0x0 0x0 0x1 &ipic 22 0x8
-				 0xb800 0x0 0x0 0x2 &ipic 23 0x8
-				 0xb800 0x0 0x0 0x3 &ipic 20 0x8
-				 0xb800 0x0 0x0 0x4 &ipic 21 0x8
-
-				/* IDSEL 0x18 AD24*/
-				 0xc000 0x0 0x0 0x1 &ipic 21 0x8
-				 0xc000 0x0 0x0 0x2 &ipic 22 0x8
-				 0xc000 0x0 0x0 0x3 &ipic 23 0x8
-				 0xc000 0x0 0x0 0x4 &ipic 20 0x8>;
-		interrupt-parent = <&ipic>;
-		interrupts = <66 0x8>;
-		bus-range = <0 0>;
-		ranges = <0x02000000 0x0 0xa0000000 0xa0000000 0x0 0x10000000
-			  0x42000000 0x0 0x80000000 0x80000000 0x0 0x10000000
-			  0x01000000 0x0 0x00000000 0xe2000000 0x0 0x00100000>;
-		clock-frequency = <66666666>;
-		#interrupt-cells = <1>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		reg = <0xe0008500 0x100		/* internal registers */
-		       0xe0008300 0x8>;		/* config space access registers */
-		compatible = "fsl,mpc8349-pci";
-		device_type = "pci";
-		sleep = <&pmc 0x00010000>;
-	};
-};
diff --git a/arch/powerpc/configs/83xx/mpc836x_mds_defconfig b/arch/powerpc/configs/83xx/mpc836x_mds_defconfig
deleted file mode 100644
index 3eceb6db2982..000000000000
--- a/arch/powerpc/configs/83xx/mpc836x_mds_defconfig
+++ /dev/null
@@ -1,64 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-# CONFIG_KALLSYMS is not set
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_PARTITION_ADVANCED=y
-# CONFIG_MSDOS_PARTITION is not set
-# CONFIG_PPC_CHRP is not set
-# CONFIG_PPC_PMAC is not set
-CONFIG_PPC_83xx=y
-CONFIG_MPC836x_MDS=y
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
-# CONFIG_IPV6 is not set
-# CONFIG_FW_LOADER is not set
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_CFI=y
-CONFIG_MTD_CFI_AMDSTD=y
-CONFIG_MTD_PHYSMAP_OF=y
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=32768
-CONFIG_SCSI=y
-CONFIG_NETDEVICES=y
-CONFIG_UCC_GETH=y
-CONFIG_MARVELL_PHY=y
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_HW_RANDOM=y
-CONFIG_I2C=y
-CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_MPC=y
-CONFIG_WATCHDOG=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_DS1374=y
-CONFIG_QUICC_ENGINE=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT4_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_NFS_FS=y
-CONFIG_NFS_V4=y
-CONFIG_ROOT_NFS=y
-CONFIG_CRYPTO_ECB=m
-CONFIG_CRYPTO_PCBC=m
diff --git a/arch/powerpc/configs/mpc83xx_defconfig b/arch/powerpc/configs/mpc83xx_defconfig
index 03f6a478d0cf..0fa29520808f 100644
--- a/arch/powerpc/configs/mpc83xx_defconfig
+++ b/arch/powerpc/configs/mpc83xx_defconfig
@@ -14,7 +14,6 @@ CONFIG_MPC831x_RDB=y
 CONFIG_MPC832x_MDS=y
 CONFIG_MPC832x_RDB=y
 CONFIG_MPC834x_ITX=y
-CONFIG_MPC836x_MDS=y
 CONFIG_MPC836x_RDK=y
 CONFIG_MPC837x_MDS=y
 CONFIG_MPC837x_RDB=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 513696fd5f9e..71f5ea8f76a5 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -47,7 +47,6 @@ CONFIG_MPC831x_RDB=y
 CONFIG_MPC832x_MDS=y
 CONFIG_MPC832x_RDB=y
 CONFIG_MPC834x_ITX=y
-CONFIG_MPC836x_MDS=y
 CONFIG_MPC836x_RDK=y
 CONFIG_MPC837x_MDS=y
 CONFIG_MPC837x_RDB=y
diff --git a/arch/powerpc/platforms/83xx/Kconfig b/arch/powerpc/platforms/83xx/Kconfig
index 1ca0ba3b0f1c..90d0041fb8a7 100644
--- a/arch/powerpc/platforms/83xx/Kconfig
+++ b/arch/powerpc/platforms/83xx/Kconfig
@@ -49,12 +49,6 @@ config MPC834x_ITX
 	  Be aware that PCI initialization is the bootloader's
 	  responsibility.
 
-config MPC836x_MDS
-	bool "Freescale MPC836x MDS"
-	select DEFAULT_UIMAGE
-	help
-	  This option enables support for the MPC836x MDS Processor Board.
-
 config MPC836x_RDK
 	bool "Freescale/Logic MPC836x RDK"
 	select DEFAULT_UIMAGE
diff --git a/arch/powerpc/platforms/83xx/Makefile b/arch/powerpc/platforms/83xx/Makefile
index 5697b70492b8..4f979f2fc64e 100644
--- a/arch/powerpc/platforms/83xx/Makefile
+++ b/arch/powerpc/platforms/83xx/Makefile
@@ -9,7 +9,6 @@ obj-$(CONFIG_MPC830x_RDB)	+= mpc830x_rdb.o
 obj-$(CONFIG_MPC831x_RDB)	+= mpc831x_rdb.o
 obj-$(CONFIG_MPC832x_RDB)	+= mpc832x_rdb.o
 obj-$(CONFIG_MPC834x_ITX)	+= mpc834x_itx.o
-obj-$(CONFIG_MPC836x_MDS)	+= mpc836x_mds.o
 obj-$(CONFIG_MPC836x_RDK)	+= mpc836x_rdk.o
 obj-$(CONFIG_MPC832x_MDS)	+= mpc832x_mds.o
 obj-$(CONFIG_MPC837x_MDS)	+= mpc837x_mds.o
diff --git a/arch/powerpc/platforms/83xx/mpc836x_mds.c b/arch/powerpc/platforms/83xx/mpc836x_mds.c
deleted file mode 100644
index b1e6665be5d3..000000000000
--- a/arch/powerpc/platforms/83xx/mpc836x_mds.c
+++ /dev/null
@@ -1,210 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright 2006 Freescale Semiconductor, Inc. All rights reserved.
- *
- * Author: Li Yang <LeoLi@freescale.com>
- *	   Yin Olivia <Hong-hua.Yin@freescale.com>
- *
- * Description:
- * MPC8360E MDS board specific routines.
- *
- * Changelog:
- * Jun 21, 2006	Initial version
- */
-
-#include <linux/stddef.h>
-#include <linux/kernel.h>
-#include <linux/compiler.h>
-#include <linux/init.h>
-#include <linux/errno.h>
-#include <linux/reboot.h>
-#include <linux/pci.h>
-#include <linux/kdev_t.h>
-#include <linux/major.h>
-#include <linux/console.h>
-#include <linux/delay.h>
-#include <linux/seq_file.h>
-#include <linux/root_dev.h>
-#include <linux/initrd.h>
-#include <linux/of_platform.h>
-#include <linux/of_device.h>
-
-#include <linux/atomic.h>
-#include <asm/time.h>
-#include <asm/io.h>
-#include <asm/machdep.h>
-#include <asm/ipic.h>
-#include <asm/irq.h>
-#include <asm/udbg.h>
-#include <sysdev/fsl_soc.h>
-#include <sysdev/fsl_pci.h>
-#include <soc/fsl/qe/qe.h>
-
-#include "mpc83xx.h"
-
-#undef DEBUG
-#ifdef DEBUG
-#define DBG(fmt...) udbg_printf(fmt)
-#else
-#define DBG(fmt...)
-#endif
-
-/* ************************************************************************
- *
- * Setup the architecture
- *
- */
-static void __init mpc836x_mds_setup_arch(void)
-{
-	struct device_node *np;
-	u8 __iomem *bcsr_regs = NULL;
-
-	mpc83xx_setup_arch();
-
-	/* Map BCSR area */
-	np = of_find_node_by_name(NULL, "bcsr");
-	if (np) {
-		struct resource res;
-
-		of_address_to_resource(np, 0, &res);
-		bcsr_regs = ioremap(res.start, resource_size(&res));
-		of_node_put(np);
-	}
-
-#ifdef CONFIG_QUICC_ENGINE
-	if ((np = of_find_node_by_name(NULL, "par_io")) != NULL) {
-		par_io_init(np);
-		of_node_put(np);
-
-		for_each_node_by_name(np, "ucc")
-			par_io_of_config(np);
-#ifdef CONFIG_QE_USB
-		/* Must fixup Par IO before QE GPIO chips are registered. */
-		par_io_config_pin(1,  2, 1, 0, 3, 0); /* USBOE  */
-		par_io_config_pin(1,  3, 1, 0, 3, 0); /* USBTP  */
-		par_io_config_pin(1,  8, 1, 0, 1, 0); /* USBTN  */
-		par_io_config_pin(1, 10, 2, 0, 3, 0); /* USBRXD */
-		par_io_config_pin(1,  9, 2, 1, 3, 0); /* USBRP  */
-		par_io_config_pin(1, 11, 2, 1, 3, 0); /* USBRN  */
-		par_io_config_pin(2, 20, 2, 0, 1, 0); /* CLK21  */
-#endif /* CONFIG_QE_USB */
-	}
-
-	if ((np = of_find_compatible_node(NULL, "network", "ucc_geth"))
-			!= NULL){
-		uint svid;
-
-		/* Reset the Ethernet PHY */
-#define BCSR9_GETHRST 0x20
-		clrbits8(&bcsr_regs[9], BCSR9_GETHRST);
-		udelay(1000);
-		setbits8(&bcsr_regs[9], BCSR9_GETHRST);
-
-		/* handle mpc8360ea rev.2.1 erratum 2: RGMII Timing */
-		svid = mfspr(SPRN_SVR);
-		if (svid == 0x80480021) {
-			void __iomem *immap;
-
-			immap = ioremap(get_immrbase() + 0x14a8, 8);
-
-			/*
-			 * IMMR + 0x14A8[4:5] = 11 (clk delay for UCC 2)
-			 * IMMR + 0x14A8[18:19] = 11 (clk delay for UCC 1)
-			 */
-			setbits32(immap, 0x0c003000);
-
-			/*
-			 * IMMR + 0x14AC[20:27] = 10101010
-			 * (data delay for both UCC's)
-			 */
-			clrsetbits_be32(immap + 4, 0xff0, 0xaa0);
-
-			iounmap(immap);
-		}
-
-		iounmap(bcsr_regs);
-		of_node_put(np);
-	}
-#endif				/* CONFIG_QUICC_ENGINE */
-}
-
-machine_device_initcall(mpc836x_mds, mpc83xx_declare_of_platform_devices);
-
-#ifdef CONFIG_QE_USB
-static int __init mpc836x_usb_cfg(void)
-{
-	u8 __iomem *bcsr;
-	struct device_node *np;
-	const char *mode;
-	int ret = 0;
-
-	np = of_find_compatible_node(NULL, NULL, "fsl,mpc8360mds-bcsr");
-	if (!np)
-		return -ENODEV;
-
-	bcsr = of_iomap(np, 0);
-	of_node_put(np);
-	if (!bcsr)
-		return -ENOMEM;
-
-	np = of_find_compatible_node(NULL, NULL, "fsl,mpc8323-qe-usb");
-	if (!np) {
-		ret = -ENODEV;
-		goto err;
-	}
-
-#define BCSR8_TSEC1M_MASK	(0x3 << 6)
-#define BCSR8_TSEC1M_RGMII	(0x0 << 6)
-#define BCSR8_TSEC2M_MASK	(0x3 << 4)
-#define BCSR8_TSEC2M_RGMII	(0x0 << 4)
-	/*
-	 * Default is GMII (2), but we should set it to RGMII (0) if we use
-	 * USB (Eth PHY is in RGMII mode anyway).
-	 */
-	clrsetbits_8(&bcsr[8], BCSR8_TSEC1M_MASK | BCSR8_TSEC2M_MASK,
-			       BCSR8_TSEC1M_RGMII | BCSR8_TSEC2M_RGMII);
-
-#define BCSR13_USBMASK	0x0f
-#define BCSR13_nUSBEN	0x08 /* 1 - Disable, 0 - Enable			*/
-#define BCSR13_USBSPEED	0x04 /* 1 - Full, 0 - Low			*/
-#define BCSR13_USBMODE	0x02 /* 1 - Host, 0 - Function			*/
-#define BCSR13_nUSBVCC	0x01 /* 1 - gets VBUS, 0 - supplies VBUS 	*/
-
-	clrsetbits_8(&bcsr[13], BCSR13_USBMASK, BCSR13_USBSPEED);
-
-	mode = of_get_property(np, "mode", NULL);
-	if (mode && !strcmp(mode, "peripheral")) {
-		setbits8(&bcsr[13], BCSR13_nUSBVCC);
-		qe_usb_clock_set(QE_CLK21, 48000000);
-	} else {
-		setbits8(&bcsr[13], BCSR13_USBMODE);
-	}
-
-	of_node_put(np);
-err:
-	iounmap(bcsr);
-	return ret;
-}
-machine_arch_initcall(mpc836x_mds, mpc836x_usb_cfg);
-#endif /* CONFIG_QE_USB */
-
-/*
- * Called very early, MMU is off, device-tree isn't unflattened
- */
-static int __init mpc836x_mds_probe(void)
-{
-	return of_machine_is_compatible("MPC836xMDS");
-}
-
-define_machine(mpc836x_mds) {
-	.name		= "MPC836x MDS",
-	.probe		= mpc836x_mds_probe,
-	.setup_arch	= mpc836x_mds_setup_arch,
-	.discover_phbs  = mpc83xx_setup_pci,
-	.init_IRQ	= mpc83xx_ipic_init_IRQ,
-	.get_irq	= ipic_get_irq,
-	.restart	= mpc83xx_restart,
-	.time_init	= mpc83xx_time_init,
-	.calibrate_decr	= generic_calibrate_decr,
-	.progress	= udbg_progress,
-};
-- 
2.17.1

