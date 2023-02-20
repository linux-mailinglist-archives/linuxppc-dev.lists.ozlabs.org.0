Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A04BB69CACB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 13:24:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PL1nJ3jpJz3cD8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 23:24:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=C1E9kzko;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.178.238; helo=mx0b-0064b401.pphosted.com; envelope-from=prvs=141586787b=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=C1E9kzko;
	dkim-atps=neutral
X-Greylist: delayed 1411 seconds by postgrey-1.36 at boromir; Mon, 20 Feb 2023 23:23:28 AEDT
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PL1mJ6Z85z3bqW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 23:23:26 +1100 (AEDT)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31KAoPjD000854;
	Mon, 20 Feb 2023 11:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=UwqI5+MhPRt04SaWjI3SwgHiE3Ius1rtUXG6sbAUov0=;
 b=C1E9kzkoAk+8CSnydwBzgKBAm3n+fQx07PvlkAWuAzsT96cCEyUZlN1K+CtpfzCUMiRH
 xS6gWtci5eTIS5eWVsWZwu5+AKt6qv3swiiDZooVgVGS3XXQYJb1V8rjyfw8r9gX9Ib7
 KgqDjc36KcBN3f2DIqI8vc9r+FClQp4TvvjGX11qT8pH1pKRqKv4r9X4Mjs0y5xlhkru
 N6jnwipNOK8cUuovtULcRPAbkC+WJ+i+ymr+QkrHtsubMG7DenD1wMw0wtylJfoQqMRg
 QIju6WQj+bvzMri12w1QCBITNm/9taAoHeWxAd+9wlKj9bQtRvWU94fskZ6RvyqoP7kR Vw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpem1p50-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 20 Feb 2023 11:59:49 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Mon, 20 Feb 2023 03:59:48 -0800
Received: from sc2600cp.wrs.com (128.224.56.77) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Mon, 20 Feb 2023 03:59:47 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 4/4] powerpc: drop MPC832x_MDS platform support
Date: Mon, 20 Feb 2023 06:59:13 -0500
Message-ID: <20230220115913.25811-5-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230220115913.25811-1-paul.gortmaker@windriver.com>
References: <20230220115913.25811-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: dGcVacrd3uHlYDgZwVKPLJHjz0hPC1WI
X-Proofpoint-GUID: dGcVacrd3uHlYDgZwVKPLJHjz0hPC1WI
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

This final variant in the e300 family of Modular Development System
(MDS) in this series was actually aimed at feature reduction - things
like floating point and ethernet were removed in order to make for a
lower power and lower cost system.

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
 arch/powerpc/boot/dts/mpc832x_mds.dts         | 436 ------------------
 .../configs/83xx/mpc832x_mds_defconfig        |  59 ---
 arch/powerpc/configs/mpc83xx_defconfig        |   1 -
 arch/powerpc/configs/ppc6xx_defconfig         |   1 -
 arch/powerpc/platforms/83xx/Kconfig           |   7 -
 arch/powerpc/platforms/83xx/Makefile          |   1 -
 arch/powerpc/platforms/83xx/mpc832x_mds.c     | 110 -----
 7 files changed, 615 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/mpc832x_mds.dts
 delete mode 100644 arch/powerpc/configs/83xx/mpc832x_mds_defconfig
 delete mode 100644 arch/powerpc/platforms/83xx/mpc832x_mds.c

diff --git a/arch/powerpc/boot/dts/mpc832x_mds.dts b/arch/powerpc/boot/dts/mpc832x_mds.dts
deleted file mode 100644
index 3af073f01e71..000000000000
--- a/arch/powerpc/boot/dts/mpc832x_mds.dts
+++ /dev/null
@@ -1,436 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MPC8323E EMDS Device Tree Source
- *
- * Copyright 2006 Freescale Semiconductor Inc.
- *
-
- * To enable external serial I/O on a Freescale MPC 8323 SYS/MDS board, do
- * this:
- *
- * 1) On chip U61, lift (disconnect) pins 21 (TXD) and 22 (RXD) from the board.
- * 2) Solder a wire from U61-21 to P19A-23.  P19 is a grid of pins on the board
- *    next to the serial ports.
- * 3) Solder a wire from U61-22 to P19K-22.
- *
- * Note that there's a typo in the schematic.  The board labels the last column
- * of pins "P19K", but in the schematic, that column is called "P19J".  So if
- * you're going by the schematic, the pin is called "P19J-K22".
- */
-
-/dts-v1/;
-
-/ {
-	model = "MPC8323EMDS";
-	compatible = "MPC8323EMDS", "MPC832xMDS", "MPC83xxMDS";
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
-		PowerPC,8323@0 {
-			device_type = "cpu";
-			reg = <0x0>;
-			d-cache-line-size = <32>;	// 32 bytes
-			i-cache-line-size = <32>;	// 32 bytes
-			d-cache-size = <16384>;		// L1, 16K
-			i-cache-size = <16384>;		// L1, 16K
-			timebase-frequency = <0>;
-			bus-frequency = <0>;
-			clock-frequency = <0>;
-		};
-	};
-
-	memory {
-		device_type = "memory";
-		reg = <0x00000000 0x08000000>;
-	};
-
-	bcsr@f8000000 {
-		compatible = "fsl,mpc8323mds-bcsr";
-		reg = <0xf8000000 0x8000>;
-	};
-
-	soc8323@e0000000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		device_type = "soc";
-		compatible = "simple-bus";
-		ranges = <0x0 0xe0000000 0x00100000>;
-		reg = <0xe0000000 0x00000200>;
-		bus-frequency = <132000000>;
-
-		wdt@200 {
-			device_type = "watchdog";
-			compatible = "mpc83xx_wdt";
-			reg = <0x200 0x100>;
-		};
-
-		pmc: power@b00 {
-			compatible = "fsl,mpc8323-pmc", "fsl,mpc8349-pmc";
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
-			compatible = "fsl,mpc8323-dma", "fsl,elo-dma";
-			reg = <0x82a8 4>;
-			ranges = <0 0x8100 0x1a8>;
-			interrupt-parent = <&ipic>;
-			interrupts = <71 8>;
-			cell-index = <0>;
-			dma-channel@0 {
-				compatible = "fsl,mpc8323-dma-channel", "fsl,elo-dma-channel";
-				reg = <0 0x80>;
-				cell-index = <0>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-			dma-channel@80 {
-				compatible = "fsl,mpc8323-dma-channel", "fsl,elo-dma-channel";
-				reg = <0x80 0x80>;
-				cell-index = <1>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-			dma-channel@100 {
-				compatible = "fsl,mpc8323-dma-channel", "fsl,elo-dma-channel";
-				reg = <0x100 0x80>;
-				cell-index = <2>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-			dma-channel@180 {
-				compatible = "fsl,mpc8323-dma-channel", "fsl,elo-dma-channel";
-				reg = <0x180 0x28>;
-				cell-index = <3>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-		};
-
-		crypto@30000 {
-			compatible = "fsl,sec2.2", "fsl,sec2.1", "fsl,sec2.0";
-			reg = <0x30000 0x10000>;
-			interrupts = <11 0x8>;
-			interrupt-parent = <&ipic>;
-			fsl,num-channels = <1>;
-			fsl,channel-fifo-len = <24>;
-			fsl,exec-units-mask = <0x4c>;
-			fsl,descriptor-types-mask = <0x0122003f>;
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
-			reg = <0x1400 0x100>;
-			device_type = "par_io";
-			num-ports = <7>;
-
-			pio3: ucc_pin@3 {
-				pio-map = <
-			/* port  pin  dir  open_drain  assignment  has_irq */
-					3  4  3  0  2  0  /* MDIO */
-					3  5  1  0  2  0  /* MDC */
-					0 13  2  0  1  0 	/* RX_CLK (CLK9) */
-					3 24  2  0  1  0 	/* TX_CLK (CLK10) */
-					1  0  1  0  1  0 	/* TxD0 */
-					1  1  1  0  1  0 	/* TxD1 */
-					1  2  1  0  1  0 	/* TxD2 */
-					1  3  1  0  1  0 	/* TxD3 */
-					1  4  2  0  1  0 	/* RxD0 */
-					1  5  2  0  1  0 	/* RxD1 */
-					1  6  2  0  1  0 	/* RxD2 */
-					1  7  2  0  1  0 	/* RxD3 */
-					1  8  2  0  1  0 	/* RX_ER */
-					1  9  1  0  1  0 	/* TX_ER */
-					1 10  2  0  1  0 	/* RX_DV */
-					1 11  2  0  1  0 	/* COL */
-					1 12  1  0  1  0 	/* TX_EN */
-					1 13  2  0  1  0>;	/* CRS */
-			};
-			pio4: ucc_pin@4 {
-				pio-map = <
-			/* port  pin  dir  open_drain  assignment  has_irq */
-					3 31  2  0  1  0 	/* RX_CLK (CLK7) */
-					3  6  2  0  1  0 	/* TX_CLK (CLK8) */
-					1 18  1  0  1  0 	/* TxD0 */
-					1 19  1  0  1  0 	/* TxD1 */
-					1 20  1  0  1  0 	/* TxD2 */
-					1 21  1  0  1  0 	/* TxD3 */
-					1 22  2  0  1  0 	/* RxD0 */
-					1 23  2  0  1  0 	/* RxD1 */
-					1 24  2  0  1  0 	/* RxD2 */
-					1 25  2  0  1  0 	/* RxD3 */
-					1 26  2  0  1  0 	/* RX_ER */
-					1 27  1  0  1  0 	/* TX_ER */
-					1 28  2  0  1  0 	/* RX_DV */
-					1 29  2  0  1  0 	/* COL */
-					1 30  1  0  1  0 	/* TX_EN */
-					1 31  2  0  1  0>;	/* CRS */
-			};
-			pio5: ucc_pin@5 {
-				pio-map = <
-				/*
-				 *    		      open       has
-				 *   port  pin  dir  drain  sel  irq
-				 */
-					2    0    1      0    2    0  /* TxD5 */
-					2    8    2      0    2    0  /* RxD5 */
-
-					2   29    2      0    0    0  /* CTS5 */
-					2   31    1      0    2    0  /* RTS5 */
-
-					2   24    2      0    0    0  /* CD */
-
-				>;
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
-		bus-frequency = <198000000>;
-		fsl,qe-num-riscs = <1>;
-		fsl,qe-num-snums = <28>;
-
-		muram@10000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,qe-muram", "fsl,cpm-muram";
-			ranges = <0x0 0x00010000 0x00004000>;
-
-			data-only@0 {
-				compatible = "fsl,qe-muram-data",
-					     "fsl,cpm-muram-data";
-				reg = <0x0 0x4000>;
-			};
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
-			compatible = "qe_udc";
-			reg = <0x6c0 0x40 0x8b00 0x100>;
-			interrupts = <11>;
-			interrupt-parent = <&qeic>;
-			mode = "slave";
-		};
-
-		enet0: ucc@2200 {
-			device_type = "network";
-			compatible = "ucc_geth";
-			cell-index = <3>;
-			reg = <0x2200 0x200>;
-			interrupts = <34>;
-			interrupt-parent = <&qeic>;
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			rx-clock-name = "clk9";
-			tx-clock-name = "clk10";
-			phy-handle = <&phy3>;
-			pio-handle = <&pio3>;
-		};
-
-		enet1: ucc@3200 {
-			device_type = "network";
-			compatible = "ucc_geth";
-			cell-index = <4>;
-			reg = <0x3200 0x200>;
-			interrupts = <35>;
-			interrupt-parent = <&qeic>;
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			rx-clock-name = "clk7";
-			tx-clock-name = "clk8";
-			phy-handle = <&phy4>;
-			pio-handle = <&pio4>;
-		};
-
-		ucc@2400 {
-			device_type = "serial";
-			compatible = "ucc_uart";
-			cell-index = <5>;	/* The UCC number, 1-7*/
-			port-number = <0>;	/* Which ttyQEx device */
-			soft-uart;		/* We need Soft-UART */
-			reg = <0x2400 0x200>;
-			interrupts = <40>;	/* From Table 18-12 */
-			interrupt-parent = < &qeic >;
-			/*
-			 * For Soft-UART, we need to set TX to 1X, which
-			 * means specifying separate clock sources.
-			 */
-			rx-clock-name = "brg5";
-			tx-clock-name = "brg6";
-			pio-handle = < &pio5 >;
-		};
-
-
-		mdio@2320 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0x2320 0x18>;
-			compatible = "fsl,ucc-mdio";
-
-			phy3: ethernet-phy@3 {
-				interrupt-parent = <&ipic>;
-				interrupts = <17 0x8>;
-				reg = <0x3>;
-			};
-			phy4: ethernet-phy@4 {
-				interrupt-parent = <&ipic>;
-				interrupts = <18 0x8>;
-				reg = <0x4>;
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
-			interrupts = <32 0x8 33 0x8>; //high:32 low:33
-			interrupt-parent = <&ipic>;
-		};
-	};
-
-	pci0: pci@e0008500 {
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
-		interrupt-map = <
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
-		bus-range = <0x0 0x0>;
-		ranges = <0x02000000 0x0 0x90000000 0x90000000 0x0 0x10000000
-			  0x42000000 0x0 0x80000000 0x80000000 0x0 0x10000000
-			  0x01000000 0x0 0x00000000 0xd0000000 0x0 0x00100000>;
-		clock-frequency = <0>;
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
diff --git a/arch/powerpc/configs/83xx/mpc832x_mds_defconfig b/arch/powerpc/configs/83xx/mpc832x_mds_defconfig
deleted file mode 100644
index e94555452fb2..000000000000
--- a/arch/powerpc/configs/83xx/mpc832x_mds_defconfig
+++ /dev/null
@@ -1,59 +0,0 @@
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
-CONFIG_MPC832x_MDS=y
-CONFIG_MATH_EMULATION=y
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
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=32768
-CONFIG_SCSI=y
-CONFIG_NETDEVICES=y
-CONFIG_UCC_GETH=y
-CONFIG_DAVICOM_PHY=y
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
index 943c2d51bb60..8779f03bced1 100644
--- a/arch/powerpc/configs/mpc83xx_defconfig
+++ b/arch/powerpc/configs/mpc83xx_defconfig
@@ -11,7 +11,6 @@ CONFIG_PARTITION_ADVANCED=y
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_83xx=y
 CONFIG_MPC831x_RDB=y
-CONFIG_MPC832x_MDS=y
 CONFIG_MPC832x_RDB=y
 CONFIG_MPC834x_ITX=y
 CONFIG_MPC836x_RDK=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index f08a7f43c629..a1f6c5f39ccf 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -44,7 +44,6 @@ CONFIG_EP8248E=y
 CONFIG_MGCOGE=y
 CONFIG_PPC_83xx=y
 CONFIG_MPC831x_RDB=y
-CONFIG_MPC832x_MDS=y
 CONFIG_MPC832x_RDB=y
 CONFIG_MPC834x_ITX=y
 CONFIG_MPC836x_RDK=y
diff --git a/arch/powerpc/platforms/83xx/Kconfig b/arch/powerpc/platforms/83xx/Kconfig
index 978d2b12e97c..d355ad40995f 100644
--- a/arch/powerpc/platforms/83xx/Kconfig
+++ b/arch/powerpc/platforms/83xx/Kconfig
@@ -25,13 +25,6 @@ config MPC831x_RDB
 	help
 	  This option enables support for the MPC8313 RDB and MPC8315 RDB boards.
 
-config MPC832x_MDS
-	bool "Freescale MPC832x MDS"
-	select DEFAULT_UIMAGE
-	select PPC_MPC832x
-	help
-	  This option enables support for the MPC832x MDS evaluation board.
-
 config MPC832x_RDB
 	bool "Freescale MPC832x RDB"
 	select DEFAULT_UIMAGE
diff --git a/arch/powerpc/platforms/83xx/Makefile b/arch/powerpc/platforms/83xx/Makefile
index 0c3a5067bd77..6b4013e01b3b 100644
--- a/arch/powerpc/platforms/83xx/Makefile
+++ b/arch/powerpc/platforms/83xx/Makefile
@@ -10,7 +10,6 @@ obj-$(CONFIG_MPC831x_RDB)	+= mpc831x_rdb.o
 obj-$(CONFIG_MPC832x_RDB)	+= mpc832x_rdb.o
 obj-$(CONFIG_MPC834x_ITX)	+= mpc834x_itx.o
 obj-$(CONFIG_MPC836x_RDK)	+= mpc836x_rdk.o
-obj-$(CONFIG_MPC832x_MDS)	+= mpc832x_mds.o
 obj-$(CONFIG_MPC837x_RDB)	+= mpc837x_rdb.o
 obj-$(CONFIG_ASP834x)		+= asp834x.o
 obj-$(CONFIG_KMETER1)		+= km83xx.o
diff --git a/arch/powerpc/platforms/83xx/mpc832x_mds.c b/arch/powerpc/platforms/83xx/mpc832x_mds.c
deleted file mode 100644
index 435344405d2c..000000000000
--- a/arch/powerpc/platforms/83xx/mpc832x_mds.c
+++ /dev/null
@@ -1,110 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright 2006 Freescale Semiconductor, Inc. All rights reserved.
- *
- * Description:
- * MPC832xE MDS board specific routines.
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
-static void __init mpc832x_sys_setup_arch(void)
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
-	}
-
-	if ((np = of_find_compatible_node(NULL, "network", "ucc_geth"))
-			!= NULL){
-		/* Reset the Ethernet PHYs */
-#define BCSR8_FETH_RST 0x50
-		clrbits8(&bcsr_regs[8], BCSR8_FETH_RST);
-		udelay(1000);
-		setbits8(&bcsr_regs[8], BCSR8_FETH_RST);
-		iounmap(bcsr_regs);
-		of_node_put(np);
-	}
-#endif				/* CONFIG_QUICC_ENGINE */
-}
-
-machine_device_initcall(mpc832x_mds, mpc83xx_declare_of_platform_devices);
-
-/*
- * Called very early, MMU is off, device-tree isn't unflattened
- */
-static int __init mpc832x_sys_probe(void)
-{
-	return of_machine_is_compatible("MPC832xMDS");
-}
-
-define_machine(mpc832x_mds) {
-	.name 		= "MPC832x MDS",
-	.probe 		= mpc832x_sys_probe,
-	.setup_arch 	= mpc832x_sys_setup_arch,
-	.discover_phbs	= mpc83xx_setup_pci,
-	.init_IRQ	= mpc83xx_ipic_init_IRQ,
-	.get_irq 	= ipic_get_irq,
-	.restart 	= mpc83xx_restart,
-	.time_init 	= mpc83xx_time_init,
-	.calibrate_decr	= generic_calibrate_decr,
-	.progress 	= udbg_progress,
-};
-- 
2.17.1

