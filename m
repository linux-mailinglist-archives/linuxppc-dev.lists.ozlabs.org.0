Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCDE69CB18
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 13:34:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PL20X5Y2lz3f33
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 23:34:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=RcnnxpJN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.166.238; helo=mx0a-0064b401.pphosted.com; envelope-from=prvs=141586787b=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=RcnnxpJN;
	dkim-atps=neutral
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PL1xZ1SbYz309T
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 23:31:29 +1100 (AEDT)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31KBes6m017902;
	Mon, 20 Feb 2023 03:59:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=1vfI3mLWG0bgm1mBEnRq2++9usTPCwW0wJov04Hf9kM=;
 b=RcnnxpJNithDnevIW11j2cyl1+5YTGdTkvxC+410y7nzW9AxW0PwYfDyI3E8AZ6xgTo8
 OUpzCQ9Bu+ojT4X7NkumRi8CPlW+WnGOpUZEbyE38cxHzfZ/H/eRPW5L/5kplI9d/uFq
 LsOWc5pFU2AOhM6lS3MAR1WJidmOjxoqRlRL4Cyr4r73NsdKIq9e9S3pKvLTSpgqwUQZ
 bHjKyxeGMaLl57YeZ4usTKDCrqiRsN+x+YURpXcIkt+5uyB316Fy65aXSqmEV03aV+lJ
 n9tdPdCvSDRjgLjS6nCjW76BjmbA7W7jXAo4oKJT0PSEvzX4yZ/9ocq57lgjR1OmWRha ew== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nty2psch7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 20 Feb 2023 03:59:46 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Mon, 20 Feb 2023 03:59:45 -0800
Received: from sc2600cp.wrs.com (128.224.56.77) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Mon, 20 Feb 2023 03:59:44 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/4] powerpc: drop MPC834x_MDS platform support
Date: Mon, 20 Feb 2023 06:59:10 -0500
Message-ID: <20230220115913.25811-2-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230220115913.25811-1-paul.gortmaker@windriver.com>
References: <20230220115913.25811-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: AaW6BPH1krs26myfHKez-3wdx_BGFzWd
X-Proofpoint-GUID: AaW6BPH1krs26myfHKez-3wdx_BGFzWd
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

This 2006 era Modular Development System (MDS) has, at its core
component, a full length card with a PCI-64 edge.  No case.  Serial
and network connectors were on card, so it could optionally be fitted
with plastic stand-offs and run stand-alone off a power brick.

Like all the MDS systems, it was meant as a vehicle to get the CPU
out early to hardware OEMs so software and board development could
take place in parallel.

To that end, the BGA CPU was held in place with a mechanical spring
loaded pressure assembly (vs. solder) so that early rev silicon could
be replaced in the field.  Not for COTS deployment!

These were made in limited numbers and availability preference was
given to partners who were planning to make their own boards, like
our WR SBC8349 [since retired in v4.18 (2017, commit 3bc6cf5a86e5)]

Given that the whole reason for existence was to assist in enabling
new board designs [not happening for 10+ years], and that they weren't
generally available, and that the hardware wasn't really hobbyist
friendly even for retro computing, it makes sense to retire the
support for this platform.

Cc: Scott Wood <oss@buserror.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/powerpc/boot/Makefile                    |   1 -
 arch/powerpc/boot/dts/mpc834x_mds.dts         | 403 ------------------
 .../configs/83xx/mpc834x_mds_defconfig        |  58 ---
 arch/powerpc/configs/mpc83xx_defconfig        |   1 -
 arch/powerpc/configs/ppc6xx_defconfig         |   1 -
 arch/powerpc/platforms/83xx/Kconfig           |  12 -
 arch/powerpc/platforms/83xx/Makefile          |   1 -
 arch/powerpc/platforms/83xx/mpc834x_mds.c     | 101 -----
 8 files changed, 578 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/mpc834x_mds.dts
 delete mode 100644 arch/powerpc/configs/83xx/mpc834x_mds_defconfig
 delete mode 100644 arch/powerpc/platforms/83xx/mpc834x_mds.c

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 295f76df13b5..1efe311a9ff9 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -336,7 +336,6 @@ image-$(CONFIG_MPC832x_MDS)		+= cuImage.mpc832x_mds
 image-$(CONFIG_MPC832x_RDB)		+= cuImage.mpc832x_rdb
 image-$(CONFIG_MPC834x_ITX)		+= cuImage.mpc8349emitx \
 					   cuImage.mpc8349emitxgp
-image-$(CONFIG_MPC834x_MDS)		+= cuImage.mpc834x_mds
 image-$(CONFIG_MPC836x_MDS)		+= cuImage.mpc836x_mds
 image-$(CONFIG_ASP834x)			+= dtbImage.asp834x-redboot
 
diff --git a/arch/powerpc/boot/dts/mpc834x_mds.dts b/arch/powerpc/boot/dts/mpc834x_mds.dts
deleted file mode 100644
index 6c8cb859c55f..000000000000
--- a/arch/powerpc/boot/dts/mpc834x_mds.dts
+++ /dev/null
@@ -1,403 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MPC8349E MDS Device Tree Source
- *
- * Copyright 2005, 2006 Freescale Semiconductor Inc.
- */
-
-/dts-v1/;
-
-/ {
-	model = "MPC8349EMDS";
-	compatible = "MPC8349EMDS", "MPC834xMDS", "MPC83xxMDS";
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
-		PowerPC,8349@0 {
-			device_type = "cpu";
-			reg = <0x0>;
-			d-cache-line-size = <32>;
-			i-cache-line-size = <32>;
-			d-cache-size = <32768>;
-			i-cache-size = <32768>;
-			timebase-frequency = <0>;	// from bootloader
-			bus-frequency = <0>;		// from bootloader
-			clock-frequency = <0>;		// from bootloader
-		};
-	};
-
-	memory {
-		device_type = "memory";
-		reg = <0x00000000 0x10000000>;	// 256MB at 0
-	};
-
-	bcsr@e2400000 {
-		compatible = "fsl,mpc8349mds-bcsr";
-		reg = <0xe2400000 0x8000>;
-	};
-
-	soc8349@e0000000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		device_type = "soc";
-		compatible = "simple-bus";
-		ranges = <0x0 0xe0000000 0x00100000>;
-		reg = <0xe0000000 0x00000200>;
-		bus-frequency = <0>;
-
-		wdt@200 {
-			device_type = "watchdog";
-			compatible = "mpc83xx_wdt";
-			reg = <0x200 0x100>;
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
-			compatible = "fsl,mpc8349-dma", "fsl,elo-dma";
-			reg = <0x82a8 4>;
-			ranges = <0 0x8100 0x1a8>;
-			interrupt-parent = <&ipic>;
-			interrupts = <71 8>;
-			cell-index = <0>;
-			dma-channel@0 {
-				compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
-				reg = <0 0x80>;
-				cell-index = <0>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-			dma-channel@80 {
-				compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
-				reg = <0x80 0x80>;
-				cell-index = <1>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-			dma-channel@100 {
-				compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
-				reg = <0x100 0x80>;
-				cell-index = <2>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-			dma-channel@180 {
-				compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
-				reg = <0x180 0x28>;
-				cell-index = <3>;
-				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
-			};
-		};
-
-		/* phy type (ULPI or SERIAL) are only types supported for MPH */
-		/* port = 0 or 1 */
-		usb@22000 {
-			compatible = "fsl-usb2-mph";
-			reg = <0x22000 0x1000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			interrupt-parent = <&ipic>;
-			interrupts = <39 0x8>;
-			phy_type = "ulpi";
-			port0;
-		};
-		/* phy type (ULPI, UTMI, UTMI_WIDE, SERIAL) */
-		usb@23000 {
-			compatible = "fsl-usb2-dr";
-			reg = <0x23000 0x1000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			interrupt-parent = <&ipic>;
-			interrupts = <38 0x8>;
-			dr_mode = "otg";
-			phy_type = "ulpi";
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
-			interrupts = <32 0x8 33 0x8 34 0x8>;
-			interrupt-parent = <&ipic>;
-			tbi-handle = <&tbi0>;
-			phy-handle = <&phy0>;
-			linux,network-index = <0>;
-
-			mdio@520 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,gianfar-mdio";
-				reg = <0x520 0x20>;
-
-				phy0: ethernet-phy@0 {
-					interrupt-parent = <&ipic>;
-					interrupts = <17 0x8>;
-					reg = <0x0>;
-				};
-
-				phy1: ethernet-phy@1 {
-					interrupt-parent = <&ipic>;
-					interrupts = <18 0x8>;
-					reg = <0x1>;
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
-			model = "TSEC";
-			compatible = "gianfar";
-			reg = <0x25000 0x1000>;
-			ranges = <0x0 0x25000 0x1000>;
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <35 0x8 36 0x8 37 0x8>;
-			interrupt-parent = <&ipic>;
-			tbi-handle = <&tbi1>;
-			phy-handle = <&phy1>;
-			linux,network-index = <1>;
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
-			compatible = "fsl,sec2.0";
-			reg = <0x30000 0x10000>;
-			interrupts = <11 0x8>;
-			interrupt-parent = <&ipic>;
-			fsl,num-channels = <4>;
-			fsl,channel-fifo-len = <24>;
-			fsl,exec-units-mask = <0x7e>;
-			fsl,descriptor-types-mask = <0x01010ebf>;
-		};
-
-		/* IPIC
-		 * interrupts cell = <intr #, sense>
-		 * sense values match linux IORESOURCE_IRQ_* defines:
-		 * sense == 8: Level, low assertion
-		 * sense == 2: Edge, high-to-low change
-		 */
-		ipic: pic@700 {
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <2>;
-			reg = <0x700 0x100>;
-			device_type = "ipic";
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
-		bus-range = <0 0>;
-		ranges = <0x02000000 0x0 0x90000000 0x90000000 0x0 0x10000000
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
-	};
-
-	pci1: pci@e0008600 {
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
-		interrupts = <67 0x8>;
-		bus-range = <0 0>;
-		ranges = <0x02000000 0x0 0xb0000000 0xb0000000 0x0 0x10000000
-			  0x42000000 0x0 0xa0000000 0xa0000000 0x0 0x10000000
-			  0x01000000 0x0 0x00000000 0xe2100000 0x0 0x00100000>;
-		clock-frequency = <66666666>;
-		#interrupt-cells = <1>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		reg = <0xe0008600 0x100		/* internal registers */
-		       0xe0008380 0x8>;		/* config space access registers */
-		compatible = "fsl,mpc8349-pci";
-		device_type = "pci";
-	};
-};
diff --git a/arch/powerpc/configs/83xx/mpc834x_mds_defconfig b/arch/powerpc/configs/83xx/mpc834x_mds_defconfig
deleted file mode 100644
index e2ff684d8792..000000000000
--- a/arch/powerpc/configs/83xx/mpc834x_mds_defconfig
+++ /dev/null
@@ -1,58 +0,0 @@
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
-CONFIG_MPC834x_MDS=y
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
-CONFIG_NETDEVICES=y
-CONFIG_GIANFAR=y
-CONFIG_E100=y
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
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_DS1374=y
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
index 95d43f8a3869..03f6a478d0cf 100644
--- a/arch/powerpc/configs/mpc83xx_defconfig
+++ b/arch/powerpc/configs/mpc83xx_defconfig
@@ -13,7 +13,6 @@ CONFIG_PPC_83xx=y
 CONFIG_MPC831x_RDB=y
 CONFIG_MPC832x_MDS=y
 CONFIG_MPC832x_RDB=y
-CONFIG_MPC834x_MDS=y
 CONFIG_MPC834x_ITX=y
 CONFIG_MPC836x_MDS=y
 CONFIG_MPC836x_RDK=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 110258277959..513696fd5f9e 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -46,7 +46,6 @@ CONFIG_PPC_83xx=y
 CONFIG_MPC831x_RDB=y
 CONFIG_MPC832x_MDS=y
 CONFIG_MPC832x_RDB=y
-CONFIG_MPC834x_MDS=y
 CONFIG_MPC834x_ITX=y
 CONFIG_MPC836x_MDS=y
 CONFIG_MPC836x_RDK=y
diff --git a/arch/powerpc/platforms/83xx/Kconfig b/arch/powerpc/platforms/83xx/Kconfig
index bee119725f61..1ca0ba3b0f1c 100644
--- a/arch/powerpc/platforms/83xx/Kconfig
+++ b/arch/powerpc/platforms/83xx/Kconfig
@@ -39,18 +39,6 @@ config MPC832x_RDB
 	help
 	  This option enables support for the MPC8323 RDB board.
 
-config MPC834x_MDS
-	bool "Freescale MPC834x MDS"
-	select DEFAULT_UIMAGE
-	select PPC_MPC834x
-	help
-	  This option enables support for the MPC 834x MDS evaluation board.
-
-	  Be aware that PCI buses can only function when MDS board is plugged
-	  into the PIB (Platform IO Board) board from Freescale which provide
-	  3 PCI slots.  The PIBs PCI initialization is the bootloader's
-	  responsibility.
-
 config MPC834x_ITX
 	bool "Freescale MPC834x ITX"
 	select DEFAULT_UIMAGE
diff --git a/arch/powerpc/platforms/83xx/Makefile b/arch/powerpc/platforms/83xx/Makefile
index 41cb5f842eff..5697b70492b8 100644
--- a/arch/powerpc/platforms/83xx/Makefile
+++ b/arch/powerpc/platforms/83xx/Makefile
@@ -8,7 +8,6 @@ obj-$(CONFIG_MCU_MPC8349EMITX)	+= mcu_mpc8349emitx.o
 obj-$(CONFIG_MPC830x_RDB)	+= mpc830x_rdb.o
 obj-$(CONFIG_MPC831x_RDB)	+= mpc831x_rdb.o
 obj-$(CONFIG_MPC832x_RDB)	+= mpc832x_rdb.o
-obj-$(CONFIG_MPC834x_MDS)	+= mpc834x_mds.o
 obj-$(CONFIG_MPC834x_ITX)	+= mpc834x_itx.o
 obj-$(CONFIG_MPC836x_MDS)	+= mpc836x_mds.o
 obj-$(CONFIG_MPC836x_RDK)	+= mpc836x_rdk.o
diff --git a/arch/powerpc/platforms/83xx/mpc834x_mds.c b/arch/powerpc/platforms/83xx/mpc834x_mds.c
deleted file mode 100644
index 7dde5a75332b..000000000000
--- a/arch/powerpc/platforms/83xx/mpc834x_mds.c
+++ /dev/null
@@ -1,101 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * arch/powerpc/platforms/83xx/mpc834x_mds.c
- *
- * MPC834x MDS board specific routines
- *
- * Maintainer: Kumar Gala <galak@kernel.crashing.org>
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
-#include <linux/of_address.h>
-#include <linux/of_platform.h>
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
-
-#include "mpc83xx.h"
-
-#define BCSR5_INT_USB		0x02
-static int __init mpc834xemds_usb_cfg(void)
-{
-	struct device_node *np;
-	void __iomem *bcsr_regs = NULL;
-	u8 bcsr5;
-
-	mpc834x_usb_cfg();
-	/* Map BCSR area */
-	np = of_find_node_by_name(NULL, "bcsr");
-	if (np) {
-		struct resource res;
-
-		of_address_to_resource(np, 0, &res);
-		bcsr_regs = ioremap(res.start, resource_size(&res));
-		of_node_put(np);
-	}
-	if (!bcsr_regs)
-		return -1;
-
-	/*
-	 * if Processor Board is plugged into PIB board,
-	 * force to use the PHY on Processor Board
-	 */
-	bcsr5 = in_8(bcsr_regs + 5);
-	if (!(bcsr5 & BCSR5_INT_USB))
-		out_8(bcsr_regs + 5, (bcsr5 | BCSR5_INT_USB));
-	iounmap(bcsr_regs);
-	return 0;
-}
-
-/* ************************************************************************
- *
- * Setup the architecture
- *
- */
-static void __init mpc834x_mds_setup_arch(void)
-{
-	mpc83xx_setup_arch();
-
-	mpc834xemds_usb_cfg();
-}
-
-machine_device_initcall(mpc834x_mds, mpc83xx_declare_of_platform_devices);
-
-/*
- * Called very early, MMU is off, device-tree isn't unflattened
- */
-static int __init mpc834x_mds_probe(void)
-{
-	return of_machine_is_compatible("MPC834xMDS");
-}
-
-define_machine(mpc834x_mds) {
-	.name			= "MPC834x MDS",
-	.probe			= mpc834x_mds_probe,
-	.setup_arch		= mpc834x_mds_setup_arch,
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

