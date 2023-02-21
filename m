Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF3269E889
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 20:49:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLqbt1NNgz3c8W
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 06:48:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=EV6e4V1/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.178.238; helo=mx0b-0064b401.pphosted.com; envelope-from=prvs=1416e03d26=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=EV6e4V1/;
	dkim-atps=neutral
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLqYw0hlNz3cMn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 06:47:15 +1100 (AEDT)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31LIqeGQ007370;
	Tue, 21 Feb 2023 19:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=PPS06212021;
 bh=WwDFeIi3VU5V8eUKksqIfVJqyfehTUCqsoxUpf1ToXA=;
 b=EV6e4V1/d2IFIL3qNzFvB2KKQGNEKG8L55mfZ/atGE3ngIDdFdgKhtWzM5OQ2Y4oEuyS
 uTdFKcYt2Jo5vPKrTheN/g8E/3Duqo8j9fK+GD3IPn/xMa0P+wDjdzHPE5T3Z5gQf6d/
 R1/vgIKoU3RH19dYf92tO8iZYq+bhZMP6tOQACiOqNbyo2rBoZLxNG+dtAqRGcgGkSte
 cMXO895fqI7YkEukLzvfVMrpAWgw/MzSACqYO6l/CPgCx7caz0Pg0JeOICmFWmq1OE6A
 YjDpCNXz+YWPlF0a3Mt4g/OLKBsRCCu5rB+aWah4aM2A5ma7pSxI5yS/6cdF83OACIIX AA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpem319s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 21 Feb 2023 19:46:58 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 21 Feb 2023 11:46:57 -0800
Received: from sc2600cp.wrs.com (128.224.56.77) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 21 Feb 2023 11:46:56 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/4] powerpc: drop MPC8568_MDS / P1021_MDS platform support
Date: Tue, 21 Feb 2023 14:46:36 -0500
Message-ID: <20230221194637.28436-4-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230221194637.28436-1-paul.gortmaker@windriver.com>
References: <20230221194637.28436-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WqQYzMpp1FdVu5DM4SHeJkplY8G0rWFn
X-Proofpoint-GUID: WqQYzMpp1FdVu5DM4SHeJkplY8G0rWFn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_12,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The MPC8568-MDS just might have been the 2nd last in the MDS line that
was similar to the MPC83xx-MDS in general form factor.  However, as can
be seen in the 8568MDS User Guide picture, the PCI/PCI-X card edge has
been deleted.

A recent change in the Kconfig descriptions, in commit d20c96deb3e2
("powerpc/85xx: Fix description of MPC85xx and P1/P2 boards options") made
it clear some of the MPC8568-MDS support is shared/reused by the next gen
processor family evaluation -- the QorIQ P1021/P1012 MDS platforms.

The P1021/P1012 MDS platforms add a PCI-e card edge where the
MPC8568-MDS had none.  But they retained the basic MDS form factor and
overall goals of enabling hardware designs.

Given that, we also include the P1021/P1012 MDS removal in this commit,
so that we can remove the MPC85xx_MDS Kconfig option and anything
relying on it.

Like previous evaluation boards, both systems attempted to provide
break-out connectors for as many features as possible, and that made for
a fairly complex looking system that isn't really "hobbyist" friendly.

In any case, these are over a decade old, and originally made for a
small group of industry related people.  Given that, it makes sense to
remove support from them here in 2023.

Cc: Scott Wood <oss@buserror.net>
Cc: Pali Rohár <pali@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/powerpc/boot/dts/fsl/mpc8568mds.dts      | 310 --------------
 arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi | 270 ------------
 arch/powerpc/boot/dts/fsl/mpc8568si-pre.dtsi  |  68 ---
 arch/powerpc/boot/dts/fsl/p1021mds.dts        | 319 --------------
 arch/powerpc/platforms/85xx/mpc85xx_mds.c     | 398 ------------------
 5 files changed, 1365 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8568mds.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8568si-pre.dtsi
 delete mode 100644 arch/powerpc/boot/dts/fsl/p1021mds.dts
 delete mode 100644 arch/powerpc/platforms/85xx/mpc85xx_mds.c

diff --git a/arch/powerpc/boot/dts/fsl/mpc8568mds.dts b/arch/powerpc/boot/dts/fsl/mpc8568mds.dts
deleted file mode 100644
index 3603b5ae1230..000000000000
--- a/arch/powerpc/boot/dts/fsl/mpc8568mds.dts
+++ /dev/null
@@ -1,310 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MPC8568E MDS Device Tree Source
- *
- * Copyright 2007, 2008 Freescale Semiconductor Inc.
- */
-
-/include/ "mpc8568si-pre.dtsi"
-
-/ {
-	model = "MPC8568EMDS";
-	compatible = "MPC8568EMDS", "MPC85xxMDS";
-
-	aliases {
-		pci0 = &pci0;
-		pci1 = &pci1;
-		rapidio0 = &rio;
-	};
-
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x0 0x0 0x0>;
-	};
-
-	lbc: localbus@e0005000 {
-		reg = <0x0 0xe0005000 0x0 0x1000>;
-		ranges = <0x0 0x0 0xfe000000 0x02000000
-			  0x1 0x0 0xf8000000 0x00008000
-			  0x2 0x0 0xf0000000 0x04000000
-			  0x4 0x0 0xf8008000 0x00008000
-			  0x5 0x0 0xf8010000 0x00008000>;
-
-		nor@0,0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "cfi-flash";
-			reg = <0x0 0x0 0x02000000>;
-			bank-width = <2>;
-			device-width = <2>;
-		};
-
-		bcsr@1,0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,mpc8568mds-bcsr";
-			reg = <1 0 0x8000>;
-			ranges = <0 1 0 0x8000>;
-
-			bcsr5: gpio-controller@11 {
-				#gpio-cells = <2>;
-				compatible = "fsl,mpc8568mds-bcsr-gpio";
-				reg = <0x5 0x1>;
-				gpio-controller;
-			};
-		};
-
-		pib@4,0 {
-			compatible = "fsl,mpc8568mds-pib";
-			reg = <4 0 0x8000>;
-		};
-
-		pib@5,0 {
-			compatible = "fsl,mpc8568mds-pib";
-			reg = <5 0 0x8000>;
-		};
-	};
-
-	soc: soc8568@e0000000 {
-		ranges = <0x0 0x0 0xe0000000 0x100000>;
-
-		i2c-sleep-nexus {
-			i2c@3000 {
-				rtc@68 {
-					compatible = "dallas,ds1374";
-					reg = <0x68>;
-					interrupts = <3 1 0 0>;
-				};
-			};
-		};
-
-		enet0: ethernet@24000 {
-			tbi-handle = <&tbi0>;
-			phy-handle = <&phy2>;
-		};
-
-		mdio@24520 {
-			phy0: ethernet-phy@7 {
-				interrupts = <1 1 0 0>;
-				reg = <0x7>;
-			};
-			phy1: ethernet-phy@1 {
-				interrupts = <2 1 0 0>;
-				reg = <0x1>;
-			};
-			phy2: ethernet-phy@2 {
-				interrupts = <1 1 0 0>;
-				reg = <0x2>;
-			};
-			phy3: ethernet-phy@3 {
-				interrupts = <2 1 0 0>;
-				reg = <0x3>;
-			};
-			tbi0: tbi-phy@11 {
-				reg = <0x11>;
-				device_type = "tbi-phy";
-			};
-		};
-
-		enet1: ethernet@25000 {
-			tbi-handle = <&tbi1>;
-			phy-handle = <&phy3>;
-			sleep = <&pmc 0x00000040>;
-		};
-
-		mdio@25520 {
-			tbi1: tbi-phy@11 {
-				reg = <0x11>;
-				device_type = "tbi-phy";
-			};
-		};
-
-		par_io@e0100 {
-			num-ports = <7>;
-
-			pio1: ucc_pin@1 {
-				pio-map = <
-			/* port  pin  dir  open_drain  assignment  has_irq */
-					0x4  0xa  0x1  0x0  0x2  0x0 	/* TxD0 */
-					0x4  0x9  0x1  0x0  0x2  0x0 	/* TxD1 */
-					0x4  0x8  0x1  0x0  0x2  0x0 	/* TxD2 */
-					0x4  0x7  0x1  0x0  0x2  0x0 	/* TxD3 */
-					0x4  0x17  0x1  0x0  0x2  0x0 	/* TxD4 */
-					0x4  0x16  0x1  0x0  0x2  0x0 	/* TxD5 */
-					0x4  0x15  0x1  0x0  0x2  0x0 	/* TxD6 */
-					0x4  0x14  0x1  0x0  0x2  0x0 	/* TxD7 */
-					0x4  0xf  0x2  0x0  0x2  0x0 	/* RxD0 */
-					0x4  0xe  0x2  0x0  0x2  0x0 	/* RxD1 */
-					0x4  0xd  0x2  0x0  0x2  0x0 	/* RxD2 */
-					0x4  0xc  0x2  0x0  0x2  0x0 	/* RxD3 */
-					0x4  0x1d  0x2  0x0  0x2  0x0 	/* RxD4 */
-					0x4  0x1c  0x2  0x0  0x2  0x0 	/* RxD5 */
-					0x4  0x1b  0x2  0x0  0x2  0x0 	/* RxD6 */
-					0x4  0x1a  0x2  0x0  0x2  0x0 	/* RxD7 */
-					0x4  0xb  0x1  0x0  0x2  0x0 	/* TX_EN */
-					0x4  0x18  0x1  0x0  0x2  0x0 	/* TX_ER */
-					0x4  0x10  0x2  0x0  0x2  0x0 	/* RX_DV */
-					0x4  0x1e  0x2  0x0  0x2  0x0 	/* RX_ER */
-					0x4  0x11  0x2  0x0  0x2  0x0 	/* RX_CLK */
-					0x4  0x13  0x1  0x0  0x2  0x0 	/* GTX_CLK */
-					0x1  0x1f  0x2  0x0  0x3  0x0>;	/* GTX125 */
-			};
-
-			pio2: ucc_pin@2 {
-				pio-map = <
-			/* port  pin  dir  open_drain  assignment  has_irq */
-					0x5  0xa 0x1  0x0  0x2  0x0   /* TxD0 */
-					0x5  0x9 0x1  0x0  0x2  0x0   /* TxD1 */
-					0x5  0x8 0x1  0x0  0x2  0x0   /* TxD2 */
-					0x5  0x7 0x1  0x0  0x2  0x0   /* TxD3 */
-					0x5  0x17 0x1  0x0  0x2  0x0   /* TxD4 */
-					0x5  0x16 0x1  0x0  0x2  0x0   /* TxD5 */
-					0x5  0x15 0x1  0x0  0x2  0x0   /* TxD6 */
-					0x5  0x14 0x1  0x0  0x2  0x0   /* TxD7 */
-					0x5  0xf 0x2  0x0  0x2  0x0   /* RxD0 */
-					0x5  0xe 0x2  0x0  0x2  0x0   /* RxD1 */
-					0x5  0xd 0x2  0x0  0x2  0x0   /* RxD2 */
-					0x5  0xc 0x2  0x0  0x2  0x0   /* RxD3 */
-					0x5  0x1d 0x2  0x0  0x2  0x0   /* RxD4 */
-					0x5  0x1c 0x2  0x0  0x2  0x0   /* RxD5 */
-					0x5  0x1b 0x2  0x0  0x2  0x0   /* RxD6 */
-					0x5  0x1a 0x2  0x0  0x2  0x0   /* RxD7 */
-					0x5  0xb 0x1  0x0  0x2  0x0   /* TX_EN */
-					0x5  0x18 0x1  0x0  0x2  0x0   /* TX_ER */
-					0x5  0x10 0x2  0x0  0x2  0x0   /* RX_DV */
-					0x5  0x1e 0x2  0x0  0x2  0x0   /* RX_ER */
-					0x5  0x11 0x2  0x0  0x2  0x0   /* RX_CLK */
-					0x5  0x13 0x1  0x0  0x2  0x0   /* GTX_CLK */
-					0x1  0x1f 0x2  0x0  0x3  0x0   /* GTX125 */
-					0x4  0x6 0x3  0x0  0x2  0x0   /* MDIO */
-					0x4  0x5 0x1  0x0  0x2  0x0>; /* MDC */
-			};
-		};
-	};
-
-	qe: qe@e0080000 {
-		ranges = <0x0 0x0 0xe0080000 0x40000>;
-		reg = <0x0 0xe0080000 0x0 0x480>;
-
-		spi@4c0 {
-			mode = "cpu";
-		};
-
-		spi@500 {
-			mode = "cpu";
-		};
-
-		enet2: ucc@2000 {
-			device_type = "network";
-			compatible = "ucc_geth";
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			rx-clock-name = "none";
-			tx-clock-name = "clk16";
-			pio-handle = <&pio1>;
-			phy-handle = <&phy0>;
-			phy-connection-type = "rgmii-id";
-		};
-
-		enet3: ucc@3000 {
-			device_type = "network";
-			compatible = "ucc_geth";
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			rx-clock-name = "none";
-			tx-clock-name = "clk16";
-			pio-handle = <&pio2>;
-			phy-handle = <&phy1>;
-			phy-connection-type = "rgmii-id";
-		};
-
-		mdio@2120 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0x2120 0x18>;
-			compatible = "fsl,ucc-mdio";
-
-			/* These are the same PHYs as on
-			 * gianfar's MDIO bus */
-			qe_phy0: ethernet-phy@7 {
-				interrupt-parent = <&mpic>;
-				interrupts = <1 1 0 0>;
-				reg = <0x7>;
-			};
-			qe_phy1: ethernet-phy@1 {
-				interrupt-parent = <&mpic>;
-				interrupts = <2 1 0 0>;
-				reg = <0x1>;
-			};
-			qe_phy2: ethernet-phy@2 {
-				interrupt-parent = <&mpic>;
-				interrupts = <1 1 0 0>;
-				reg = <0x2>;
-			};
-			qe_phy3: ethernet-phy@3 {
-				interrupt-parent = <&mpic>;
-				interrupts = <2 1 0 0>;
-				reg = <0x3>;
-			};
-		};
-	};
-
-	pci0: pci@e0008000 {
-		reg = <0x0 0xe0008000 0x0 0x1000>;
-		ranges = <0x2000000 0x0 0x80000000 0x0 0x80000000 0x0 0x20000000
-			  0x1000000 0x0 0x00000000 0x0 0xe2000000 0x0 0x800000>;
-		clock-frequency = <66666666>;
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
-		interrupt-map = <
-			/* IDSEL 0x12 AD18 */
-			0x9000 0x0 0x0 0x1 &mpic 0x5 0x1 0 0
-			0x9000 0x0 0x0 0x2 &mpic 0x6 0x1 0 0
-			0x9000 0x0 0x0 0x3 &mpic 0x7 0x1 0 0
-			0x9000 0x0 0x0 0x4 &mpic 0x4 0x1 0 0
-
-			/* IDSEL 0x13 AD19 */
-			0x9800 0x0 0x0 0x1 &mpic 0x6 0x1 0 0
-			0x9800 0x0 0x0 0x2 &mpic 0x7 0x1 0 0
-			0x9800 0x0 0x0 0x3 &mpic 0x4 0x1 0 0
-			0x9800 0x0 0x0 0x4 &mpic 0x5 0x1 0 0>;
-	};
-
-	/* PCI Express */
-	pci1: pcie@e000a000 {
-		ranges = <0x2000000 0x0 0xa0000000 0x0 0xa0000000 0x0 0x10000000
-			  0x1000000 0x0 0x00000000 0x0 0xe2800000 0x0 0x800000>;
-		reg = <0x0 0xe000a000 0x0 0x1000>;
-		pcie@0 {
-			ranges = <0x2000000 0x0 0xa0000000
-				  0x2000000 0x0 0xa0000000
-				  0x0 0x10000000
-
-				  0x1000000 0x0 0x0
-				  0x1000000 0x0 0x0
-				  0x0 0x800000>;
-		};
-	};
-
-	rio: rapidio@e00c00000 {
-		reg = <0x0 0xe00c0000 0x0 0x20000>;
-		port1 {
-			ranges = <0x0 0x0 0x0 0xc0000000 0x0 0x20000000>;
-		};
-	};
-
-	leds {
-		compatible = "gpio-leds";
-
-		green {
-			gpios = <&bcsr5 1 0>;
-		};
-
-		amber {
-			gpios = <&bcsr5 2 0>;
-		};
-
-		red {
-			gpios = <&bcsr5 3 0>;
-		};
-	};
-};
-
-/include/ "mpc8568si-post.dtsi"
diff --git a/arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi b/arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi
deleted file mode 100644
index 64e7075a9cd4..000000000000
--- a/arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi
+++ /dev/null
@@ -1,270 +0,0 @@
-/*
- * MPC8568 Silicon/SoC Device Tree Source (post include)
- *
- * Copyright 2011 Freescale Semiconductor Inc.
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
-&lbc {
-	#address-cells = <2>;
-	#size-cells = <1>;
-	compatible = "fsl,mpc8568-localbus", "fsl,pq3-localbus", "simple-bus";
-	interrupts = <19 2 0 0>;
-	sleep = <&pmc 0x08000000>;
-};
-
-/* controller at 0x8000 */
-&pci0 {
-	compatible = "fsl,mpc8540-pci";
-	device_type = "pci";
-	interrupts = <24 0x2 0 0>;
-	bus-range = <0 0xff>;
-	#interrupt-cells = <1>;
-	#size-cells = <2>;
-	#address-cells = <3>;
-	sleep = <&pmc 0x80000000>;
-};
-
-/* controller at 0xa000 */
-&pci1 {
-	compatible = "fsl,mpc8548-pcie";
-	device_type = "pci";
-	#size-cells = <2>;
-	#address-cells = <3>;
-	bus-range = <0 255>;
-	clock-frequency = <33333333>;
-	interrupts = <26 2 0 0>;
-	sleep = <&pmc 0x20000000>;
-
-	pcie@0 {
-		reg = <0 0 0 0 0>;
-		#interrupt-cells = <1>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		device_type = "pci";
-		interrupts = <26 2 0 0>;
-		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <
-			/* IDSEL 0x0 */
-			0000 0x0 0x0 0x1 &mpic 0x0 0x1 0x0 0x0
-			0000 0x0 0x0 0x2 &mpic 0x1 0x1 0x0 0x0
-			0000 0x0 0x0 0x3 &mpic 0x2 0x1 0x0 0x0
-			0000 0x0 0x0 0x4 &mpic 0x3 0x1 0x0 0x0
-			>;
-	};
-};
-
-&rio {
-	compatible = "fsl,srio";
-	interrupts = <48 2 0 0>;
-	#address-cells = <2>;
-	#size-cells = <2>;
-	fsl,srio-rmu-handle = <&rmu>;
-	sleep = <&pmc 0x00080000>;
-	ranges;
-
-	port1 {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		cell-index = <1>;
-	};
-};
-
-&soc {
-	#address-cells = <1>;
-	#size-cells = <1>;
-	device_type = "soc";
-	compatible = "fsl,mpc8568-immr", "simple-bus";
-	bus-frequency = <0>;		// Filled out by uboot.
-
-	ecm-law@0 {
-		compatible = "fsl,ecm-law";
-		reg = <0x0 0x1000>;
-		fsl,num-laws = <10>;
-	};
-
-	ecm@1000 {
-		compatible = "fsl,mpc8568-ecm", "fsl,ecm";
-		reg = <0x1000 0x1000>;
-		interrupts = <17 2 0 0>;
-	};
-
-	memory-controller@2000 {
-		compatible = "fsl,mpc8568-memory-controller";
-		reg = <0x2000 0x1000>;
-		interrupts = <18 2 0 0>;
-	};
-
-	i2c-sleep-nexus {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "simple-bus";
-		sleep = <&pmc 0x00000004>;
-		ranges;
-
-/include/ "pq3-i2c-0.dtsi"
-/include/ "pq3-i2c-1.dtsi"
-
-	};
-
-	duart-sleep-nexus {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "simple-bus";
-		sleep = <&pmc 0x00000002>;
-		ranges;
-
-/include/ "pq3-duart-0.dtsi"
-
-	};
-
-	L2: l2-cache-controller@20000 {
-		compatible = "fsl,mpc8568-l2-cache-controller";
-		reg = <0x20000 0x1000>;
-		cache-line-size = <32>;	// 32 bytes
-		cache-size = <0x80000>; // L2, 512K
-		interrupts = <16 2 0 0>;
-	};
-
-/include/ "pq3-dma-0.dtsi"
-	dma@21300 {
-		sleep = <&pmc 0x00000400>;
-	};
-
-/include/ "pq3-etsec1-0.dtsi"
-	ethernet@24000 {
-		sleep = <&pmc 0x00000080>;
-	};
-
-/include/ "pq3-etsec1-1.dtsi"
-	ethernet@25000 {
-		sleep = <&pmc 0x00000040>;
-	};
-
-	par_io@e0100 {
-		reg = <0xe0100 0x100>;
-		device_type = "par_io";
-	};
-
-/include/ "pq3-sec2.1-0.dtsi"
-	crypto@30000 {
-		sleep = <&pmc 0x01000000>;
-	};
-
-/include/ "pq3-mpic.dtsi"
-/include/ "pq3-rmu-0.dtsi"
-	rmu@d3000 {
-		sleep = <&pmc 0x00040000>;
-	};
-
-	global-utilities@e0000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "fsl,mpc8568-guts", "fsl,mpc8548-guts";
-		reg = <0xe0000 0x1000>;
-		ranges = <0 0xe0000 0x1000>;
-		fsl,has-rstcr;
-
-		pmc: power@70 {
-			compatible = "fsl,mpc8568-pmc",
-				     "fsl,mpc8548-pmc";
-			reg = <0x70 0x20>;
-		};
-	};
-};
-
-&qe {
-	#address-cells = <1>;
-	#size-cells = <1>;
-	device_type = "qe";
-	compatible = "fsl,qe";
-	sleep = <&pmc 0x00000800>;
-	brg-frequency = <0>;
-	bus-frequency = <396000000>;
-	fsl,qe-num-riscs = <2>;
-	fsl,qe-num-snums = <28>;
-
-	qeic: interrupt-controller@80 {
-		interrupt-controller;
-		compatible = "fsl,qe-ic";
-		#address-cells = <0>;
-		#interrupt-cells = <1>;
-		reg = <0x80 0x80>;
-		interrupts = <46 2 0 0 46 2 0 0>; //high:30 low:30
-		interrupt-parent = <&mpic>;
-	};
-
-	spi@4c0 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "fsl,spi";
-		reg = <0x4c0 0x40>;
-		cell-index = <0>;
-		interrupts = <2>;
-		interrupt-parent = <&qeic>;
-	};
-
-	spi@500 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		cell-index = <1>;
-		compatible = "fsl,spi";
-		reg = <0x500 0x40>;
-		interrupts = <1>;
-		interrupt-parent = <&qeic>;
-	};
-
-	ucc@2000 {
-		cell-index = <1>;
-		reg = <0x2000 0x200>;
-		interrupts = <32>;
-		interrupt-parent = <&qeic>;
-	};
-
-	ucc@3000 {
-		cell-index = <2>;
-		reg = <0x3000 0x200>;
-		interrupts = <33>;
-		interrupt-parent = <&qeic>;
-	};
-
-	muram@10000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "fsl,qe-muram", "fsl,cpm-muram";
-		ranges = <0x0 0x10000 0x10000>;
-
-		data-only@0 {
-			compatible = "fsl,qe-muram-data",
-				     "fsl,cpm-muram-data";
-			reg = <0x0 0x10000>;
-		};
-	};
-};
diff --git a/arch/powerpc/boot/dts/fsl/mpc8568si-pre.dtsi b/arch/powerpc/boot/dts/fsl/mpc8568si-pre.dtsi
deleted file mode 100644
index 122ca3bd0b03..000000000000
--- a/arch/powerpc/boot/dts/fsl/mpc8568si-pre.dtsi
+++ /dev/null
@@ -1,68 +0,0 @@
-/*
- * MPC8568 Silicon/SoC Device Tree Source (pre include)
- *
- * Copyright 2011 Freescale Semiconductor Inc.
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
-/dts-v1/;
-
-/include/ "e500v2_power_isa.dtsi"
-
-/ {
-	compatible = "fsl,MPC8568";
-	#address-cells = <2>;
-	#size-cells = <2>;
-	interrupt-parent = <&mpic>;
-
-	aliases {
-		serial0 = &serial0;
-		serial1 = &serial1;
-		ethernet0 = &enet0;
-		ethernet1 = &enet1;
-		ethernet2 = &enet2;
-		ethernet3 = &enet3;
-		pci0 = &pci0;
-		pci1 = &pci1;
-	};
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		PowerPC,8568@0 {
-			device_type = "cpu";
-			reg = <0x0>;
-			next-level-cache = <&L2>;
-			sleep = <&pmc 0x00008000	// core
-				 &pmc 0x00004000>;	// timebase
-		};
-	};
-};
diff --git a/arch/powerpc/boot/dts/fsl/p1021mds.dts b/arch/powerpc/boot/dts/fsl/p1021mds.dts
deleted file mode 100644
index 54af8de53371..000000000000
--- a/arch/powerpc/boot/dts/fsl/p1021mds.dts
+++ /dev/null
@@ -1,319 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * P1021 MDS Device Tree Source
- *
- * Copyright 2010,2012 Freescale Semiconductor Inc.
- */
-
-/include/ "p1021si-pre.dtsi"
-/ {
-	model = "fsl,P1021";
-	compatible = "fsl,P1021MDS";
-
-	aliases {
-		ethernet3 = &enet3;
-		ethernet4 = &enet4;
-	};
-
-	memory {
-		device_type = "memory";
-	};
-
-	lbc: localbus@ffe05000 {
-		reg = <0x0 0xffe05000 0x0 0x1000>;
-
-		/* NAND Flash, BCSR, PMC0/1*/
-		ranges = <0x0 0x0 0x0 0xfc000000 0x02000000
-			  0x1 0x0 0x0 0xf8000000 0x00008000
-			  0x2 0x0 0x0 0xf8010000 0x00020000
-			  0x3 0x0 0x0 0xf8020000 0x00020000>;
-
-		nand@0,0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,p1021-fcm-nand",
-				     "fsl,elbc-fcm-nand";
-			reg = <0x0 0x0 0x40000>;
-
-			partition@0 {
-				/* This location must not be altered  */
-				/* 1MB for u-boot Bootloader Image */
-				reg = <0x0 0x00100000>;
-				label = "NAND (RO) U-Boot Image";
-				read-only;
-			};
-
-			partition@100000 {
-				/* 1MB for DTB Image */
-				reg = <0x00100000 0x00100000>;
-				label = "NAND (RO) DTB Image";
-				read-only;
-			};
-
-			partition@200000 {
-				/* 4MB for Linux Kernel Image */
-				reg = <0x00200000 0x00400000>;
-				label = "NAND (RO) Linux Kernel Image";
-				read-only;
-			};
-
-			partition@600000 {
-				/* 5MB for Compressed Root file System Image */
-				reg = <0x00600000 0x00500000>;
-				label = "NAND (RO) Compressed RFS Image";
-				read-only;
-			};
-
-			partition@b00000 {
-				/* 6MB for JFFS2 based Root file System */
-				reg = <0x00a00000 0x00600000>;
-				label = "NAND (RW) JFFS2 Root File System";
-			};
-
-			partition@1100000 {
-				/* 14MB for JFFS2 based Root file System */
-				reg = <0x01100000 0x00e00000>;
-				label = "NAND (RW) Writable User area";
-			};
-
-			partition@1f00000 {
-				/* 1MB for microcode */
-				reg = <0x01f00000 0x00100000>;
-				label = "NAND (RO) QE Ucode";
-				read-only;
-			};
-		};
-
-		bcsr@1,0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,p1021mds-bcsr";
-			reg = <1 0 0x8000>;
-			ranges = <0 1 0 0x8000>;
-		};
-
-		pib@2,0 {
-			compatible = "fsl,p1021mds-pib";
-			reg = <2 0 0x10000>;
-		};
-
-		pib@3,0 {
-			compatible = "fsl,p1021mds-pib";
-			reg = <3 0 0x10000>;
-		};
-	};
-
-	soc: soc@ffe00000 {
-		compatible = "fsl,p1021-immr", "simple-bus";
-		ranges = <0x0 0x0 0xffe00000 0x100000>;
-
-		i2c@3000 {
-			rtc@68 {
-				compatible = "dallas,ds1374";
-				reg = <0x68>;
-			};
-		};
-
-		spi@7000 {
-
-			flash@0 {
-				#address-cells = <1>;
-				#size-cells = <1>;
-				compatible = "spansion,s25sl12801", "jedec,spi-nor";
-				reg = <0>;
-				spi-max-frequency = <40000000>; /* input clock */
-
-				partition@u-boot {
-					label = "u-boot-spi";
-					reg = <0x00000000 0x00100000>;
-					read-only;
-				};
-				partition@kernel {
-					label = "kernel-spi";
-					reg = <0x00100000 0x00500000>;
-					read-only;
-				};
-				partition@dtb {
-					label = "dtb-spi";
-					reg = <0x00600000 0x00100000>;
-					read-only;
-				};
-				partition@fs {
-					label = "file system-spi";
-					reg = <0x00700000 0x00900000>;
-				};
-			};
-		};
-
-		usb@22000 {
-			phy_type = "ulpi";
-			dr_mode = "host";
-		};
-
-		mdio@24000 {
-			phy0: ethernet-phy@0 {
-				interrupts = <1 1 0 0>;
-				reg = <0x0>;
-			};
-			phy1: ethernet-phy@1 {
-				interrupts = <2 1 0 0>;
-				reg = <0x1>;
-			};
-			phy4: ethernet-phy@4 {
-				reg = <0x4>;
-			};
-			tbi-phy@5 {
-				device_type = "tbi-phy";
-				reg = <0x5>;
-			};
-		};
-
-		mdio@25000 {
-			tbi0: tbi-phy@11 {
-				reg = <0x11>;
-				device_type = "tbi-phy";
-			};
-		};
-
-		ethernet@b0000 {
-			phy-handle = <&phy0>;
-			phy-connection-type = "rgmii-id";
-		};
-
-		ethernet@b1000 {
-			phy-handle = <&phy4>;
-			tbi-handle = <&tbi0>;
-			phy-connection-type = "sgmii";
-		};
-
-		ethernet@b2000 {
-			phy-handle = <&phy1>;
-			phy-connection-type = "rgmii-id";
-		};
-
-		par_io@e0100 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			reg = <0xe0100 0x60>;
-			ranges = <0x0 0xe0100 0x60>;
-			device_type = "par_io";
-			num-ports = <3>;
-			pio1: ucc_pin@1 {
-				pio-map = <
-			/* port  pin  dir  open_drain  assignment  has_irq */
-					0x1  0x13 0x1  0x0  0x1  0x0    /* QE_MUX_MDC */
-					0x1  0x14 0x3  0x0  0x1  0x0    /* QE_MUX_MDIO */
-					0x0  0x17 0x2  0x0  0x2  0x0    /* CLK12 */
-					0x0  0x18 0x2  0x0  0x1  0x0    /* CLK9 */
-					0x0  0x7  0x1  0x0  0x2  0x0    /* ENET1_TXD0_SER1_TXD0 */
-					0x0  0x9  0x1  0x0  0x2  0x0    /* ENET1_TXD1_SER1_TXD1 */
-					0x0  0xb  0x1  0x0  0x2  0x0    /* ENET1_TXD2_SER1_TXD2 */
-					0x0  0xc  0x1  0x0  0x2  0x0    /* ENET1_TXD3_SER1_TXD3 */
-					0x0  0x6  0x2  0x0  0x2  0x0    /* ENET1_RXD0_SER1_RXD0 */
-					0x0  0xa  0x2  0x0  0x2  0x0    /* ENET1_RXD1_SER1_RXD1 */
-					0x0  0xe  0x2  0x0  0x2  0x0    /* ENET1_RXD2_SER1_RXD2 */
-					0x0  0xf  0x2  0x0  0x2  0x0    /* ENET1_RXD3_SER1_RXD3 */
-					0x0  0x5  0x1  0x0  0x2  0x0    /* ENET1_TX_EN_SER1_RTS_B */
-					0x0  0xd  0x1  0x0  0x2  0x0    /* ENET1_TX_ER */
-					0x0  0x4  0x2  0x0  0x2  0x0    /* ENET1_RX_DV_SER1_CTS_B */
-					0x0  0x8  0x2  0x0  0x2  0x0    /* ENET1_RX_ER_SER1_CD_B */
-					0x0  0x11 0x2  0x0  0x2  0x0    /* ENET1_CRS */
-					0x0  0x10 0x2  0x0  0x2  0x0>;    /* ENET1_COL */
-			};
-
-			pio2: ucc_pin@2 {
-				pio-map = <
-			/* port  pin  dir  open_drain  assignment  has_irq */
-					0x1  0x13 0x1  0x0  0x1  0x0    /* QE_MUX_MDC */
-					0x1  0x14 0x3  0x0  0x1  0x0    /* QE_MUX_MDIO */
-					0x1  0xb  0x2  0x0  0x1  0x0    /* CLK13 */
-					0x1  0x7  0x1  0x0  0x2  0x0    /* ENET5_TXD0_SER5_TXD0 */
-					0x1  0xa  0x1  0x0  0x2  0x0    /* ENET5_TXD1_SER5_TXD1 */
-					0x1  0x6  0x2  0x0  0x2  0x0    /* ENET5_RXD0_SER5_RXD0 */
-					0x1  0x9  0x2  0x0  0x2  0x0    /* ENET5_RXD1_SER5_RXD1 */
-					0x1  0x5  0x1  0x0  0x2  0x0    /* ENET5_TX_EN_SER5_RTS_B */
-					0x1  0x4  0x2  0x0  0x2  0x0    /* ENET5_RX_DV_SER5_CTS_B */
-					0x1  0x8  0x2  0x0  0x2  0x0>;    /* ENET5_RX_ER_SER5_CD_B */
-			};
-		};
-	};
-
-	pci0: pcie@ffe09000 {
-		reg = <0 0xffe09000 0 0x1000>;
-		ranges = <0x2000000 0x0 0xa0000000 0 0xa0000000 0x0 0x20000000
-			  0x1000000 0x0 0x00000000 0 0xffc10000 0x0 0x10000>;
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
-	pci1: pcie@ffe0a000 {
-		reg = <0 0xffe0a000 0 0x1000>;
-		ranges = <0x2000000 0x0 0xc0000000 0 0xc0000000 0x0 0x20000000
-			  0x1000000 0x0 0x00000000 0 0xffc20000 0x0 0x10000>;
-		pcie@0 {
-			ranges = <0x2000000 0x0 0xc0000000
-				  0x2000000 0x0 0xc0000000
-				  0x0 0x20000000
-
-				  0x1000000 0x0 0x0
-				  0x1000000 0x0 0x0
-				  0x0 0x100000>;
-		};
-	};
-
-	qe: qe@ffe80000 {
-		ranges = <0x0 0x0 0xffe80000 0x40000>;
-		reg = <0 0xffe80000 0 0x480>;
-		brg-frequency = <0>;
-		bus-frequency = <0>;
-		status = "disabled"; /* no firmware loaded */
-
-		enet3: ucc@2000 {
-			device_type = "network";
-			compatible = "ucc_geth";
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			rx-clock-name = "clk12";
-			tx-clock-name = "clk9";
-			pio-handle = <&pio1>;
-			phy-handle = <&qe_phy0>;
-			phy-connection-type = "mii";
-		};
-
-		mdio@2120 {
-			qe_phy0: ethernet-phy@0 {
-				interrupt-parent = <&mpic>;
-				interrupts = <4 1 0 0>;
-				reg = <0x0>;
-			};
-			qe_phy1: ethernet-phy@3 {
-				interrupt-parent = <&mpic>;
-				interrupts = <5 1 0 0>;
-				reg = <0x3>;
-			};
-			tbi-phy@11 {
-				reg = <0x11>;
-				device_type = "tbi-phy";
-			};
-		};
-
-		enet4: ucc@2400 {
-			device_type = "network";
-			compatible = "ucc_geth";
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			rx-clock-name = "none";
-			tx-clock-name = "clk13";
-			pio-handle = <&pio2>;
-			phy-handle = <&qe_phy1>;
-			phy-connection-type = "rmii";
-		};
-	};
-};
-
-/include/ "p1021si-post.dtsi"
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_mds.c b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
deleted file mode 100644
index 3a2ac410af18..000000000000
--- a/arch/powerpc/platforms/85xx/mpc85xx_mds.c
+++ /dev/null
@@ -1,398 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2006-2010, 2012-2013 Freescale Semiconductor, Inc.
- * All rights reserved.
- *
- * Author: Andy Fleming <afleming@freescale.com>
- *
- * Based on 83xx/mpc8360e_pb.c by:
- *	   Li Yang <LeoLi@freescale.com>
- *	   Yin Olivia <Hong-hua.Yin@freescale.com>
- *
- * Description:
- * MPC85xx MDS board specific routines.
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
-#include <linux/fsl_devices.h>
-#include <linux/of_platform.h>
-#include <linux/of_device.h>
-#include <linux/phy.h>
-#include <linux/memblock.h>
-#include <linux/fsl/guts.h>
-
-#include <linux/atomic.h>
-#include <asm/time.h>
-#include <asm/io.h>
-#include <asm/machdep.h>
-#include <asm/pci-bridge.h>
-#include <asm/irq.h>
-#include <mm/mmu_decl.h>
-#include <asm/udbg.h>
-#include <sysdev/fsl_soc.h>
-#include <sysdev/fsl_pci.h>
-#include <soc/fsl/qe/qe.h>
-#include <asm/mpic.h>
-#include <asm/swiotlb.h>
-#include "smp.h"
-
-#include "mpc85xx.h"
-
-#undef DEBUG
-#ifdef DEBUG
-#define DBG(fmt...) udbg_printf(fmt)
-#else
-#define DBG(fmt...)
-#endif
-
-#if IS_BUILTIN(CONFIG_PHYLIB)
-
-#define MV88E1111_SCR	0x10
-#define MV88E1111_SCR_125CLK	0x0010
-static int mpc8568_fixup_125_clock(struct phy_device *phydev)
-{
-	int scr;
-	int err;
-
-	/* Workaround for the 125 CLK Toggle */
-	scr = phy_read(phydev, MV88E1111_SCR);
-
-	if (scr < 0)
-		return scr;
-
-	err = phy_write(phydev, MV88E1111_SCR, scr & ~(MV88E1111_SCR_125CLK));
-
-	if (err)
-		return err;
-
-	err = phy_write(phydev, MII_BMCR, BMCR_RESET);
-
-	if (err)
-		return err;
-
-	scr = phy_read(phydev, MV88E1111_SCR);
-
-	if (scr < 0)
-		return scr;
-
-	err = phy_write(phydev, MV88E1111_SCR, scr | 0x0008);
-
-	return err;
-}
-
-static int mpc8568_mds_phy_fixups(struct phy_device *phydev)
-{
-	int temp;
-	int err;
-
-	/* Errata */
-	err = phy_write(phydev,29, 0x0006);
-
-	if (err)
-		return err;
-
-	temp = phy_read(phydev, 30);
-
-	if (temp < 0)
-		return temp;
-
-	temp = (temp & (~0x8000)) | 0x4000;
-	err = phy_write(phydev,30, temp);
-
-	if (err)
-		return err;
-
-	err = phy_write(phydev,29, 0x000a);
-
-	if (err)
-		return err;
-
-	temp = phy_read(phydev, 30);
-
-	if (temp < 0)
-		return temp;
-
-	temp = phy_read(phydev, 30);
-
-	if (temp < 0)
-		return temp;
-
-	temp &= ~0x0020;
-
-	err = phy_write(phydev,30,temp);
-
-	if (err)
-		return err;
-
-	/* Disable automatic MDI/MDIX selection */
-	temp = phy_read(phydev, 16);
-
-	if (temp < 0)
-		return temp;
-
-	temp &= ~0x0060;
-	err = phy_write(phydev,16,temp);
-
-	return err;
-}
-
-#endif
-
-/* ************************************************************************
- *
- * Setup the architecture
- *
- */
-#ifdef CONFIG_QUICC_ENGINE
-static void __init mpc85xx_mds_reset_ucc_phys(void)
-{
-	struct device_node *np;
-	static u8 __iomem *bcsr_regs;
-
-	/* Map BCSR area */
-	np = of_find_node_by_name(NULL, "bcsr");
-	if (!np)
-		return;
-
-	bcsr_regs = of_iomap(np, 0);
-	of_node_put(np);
-	if (!bcsr_regs)
-		return;
-
-	if (machine_is(mpc8568_mds)) {
-#define BCSR_UCC1_GETH_EN	(0x1 << 7)
-#define BCSR_UCC2_GETH_EN	(0x1 << 7)
-#define BCSR_UCC1_MODE_MSK	(0x3 << 4)
-#define BCSR_UCC2_MODE_MSK	(0x3 << 0)
-
-		/* Turn off UCC1 & UCC2 */
-		clrbits8(&bcsr_regs[8], BCSR_UCC1_GETH_EN);
-		clrbits8(&bcsr_regs[9], BCSR_UCC2_GETH_EN);
-
-		/* Mode is RGMII, all bits clear */
-		clrbits8(&bcsr_regs[11], BCSR_UCC1_MODE_MSK |
-					 BCSR_UCC2_MODE_MSK);
-
-		/* Turn UCC1 & UCC2 on */
-		setbits8(&bcsr_regs[8], BCSR_UCC1_GETH_EN);
-		setbits8(&bcsr_regs[9], BCSR_UCC2_GETH_EN);
-	} else if (machine_is(mpc8569_mds)) {
-#define BCSR7_UCC12_GETHnRST	(0x1 << 2)
-#define BCSR8_UEM_MARVELL_RST	(0x1 << 1)
-#define BCSR_UCC_RGMII		(0x1 << 6)
-#define BCSR_UCC_RTBI		(0x1 << 5)
-		/*
-		 * U-Boot mangles interrupt polarity for Marvell PHYs,
-		 * so reset built-in and UEM Marvell PHYs, this puts
-		 * the PHYs into their normal state.
-		 */
-		clrbits8(&bcsr_regs[7], BCSR7_UCC12_GETHnRST);
-		setbits8(&bcsr_regs[8], BCSR8_UEM_MARVELL_RST);
-
-		setbits8(&bcsr_regs[7], BCSR7_UCC12_GETHnRST);
-		clrbits8(&bcsr_regs[8], BCSR8_UEM_MARVELL_RST);
-
-		for_each_compatible_node(np, "network", "ucc_geth") {
-			const unsigned int *prop;
-			int ucc_num;
-
-			prop = of_get_property(np, "cell-index", NULL);
-			if (prop == NULL)
-				continue;
-
-			ucc_num = *prop - 1;
-
-			prop = of_get_property(np, "phy-connection-type", NULL);
-			if (prop == NULL)
-				continue;
-
-			if (strcmp("rtbi", (const char *)prop) == 0)
-				clrsetbits_8(&bcsr_regs[7 + ucc_num],
-					BCSR_UCC_RGMII, BCSR_UCC_RTBI);
-		}
-	} else if (machine_is(p1021_mds)) {
-#define BCSR11_ENET_MICRST     (0x1 << 5)
-		/* Reset Micrel PHY */
-		clrbits8(&bcsr_regs[11], BCSR11_ENET_MICRST);
-		setbits8(&bcsr_regs[11], BCSR11_ENET_MICRST);
-	}
-
-	iounmap(bcsr_regs);
-}
-
-static void __init mpc85xx_mds_qe_init(void)
-{
-	struct device_node *np;
-
-	mpc85xx_qe_par_io_init();
-	mpc85xx_mds_reset_ucc_phys();
-
-	if (machine_is(p1021_mds)) {
-
-		struct ccsr_guts __iomem *guts;
-
-		np = of_find_node_by_name(NULL, "global-utilities");
-		if (np) {
-			guts = of_iomap(np, 0);
-			if (!guts)
-				pr_err("mpc85xx-rdb: could not map global utilities register\n");
-			else{
-			/* P1021 has pins muxed for QE and other functions. To
-			 * enable QE UEC mode, we need to set bit QE0 for UCC1
-			 * in Eth mode, QE0 and QE3 for UCC5 in Eth mode, QE9
-			 * and QE12 for QE MII management signals in PMUXCR
-			 * register.
-			 */
-				setbits32(&guts->pmuxcr, MPC85xx_PMUXCR_QE(0) |
-						  MPC85xx_PMUXCR_QE(3) |
-						  MPC85xx_PMUXCR_QE(9) |
-						  MPC85xx_PMUXCR_QE(12));
-				iounmap(guts);
-			}
-			of_node_put(np);
-		}
-
-	}
-}
-
-#else
-static void __init mpc85xx_mds_qe_init(void) { }
-#endif	/* CONFIG_QUICC_ENGINE */
-
-static void __init mpc85xx_mds_setup_arch(void)
-{
-	if (ppc_md.progress)
-		ppc_md.progress("mpc85xx_mds_setup_arch()", 0);
-
-	mpc85xx_smp_init();
-
-	mpc85xx_mds_qe_init();
-
-	fsl_pci_assign_primary();
-
-	swiotlb_detect_4g();
-}
-
-#if IS_BUILTIN(CONFIG_PHYLIB)
-
-static int __init board_fixups(void)
-{
-	char phy_id[20];
-	char *compstrs[2] = {"fsl,gianfar-mdio", "fsl,ucc-mdio"};
-	struct device_node *mdio;
-	struct resource res;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(compstrs); i++) {
-		mdio = of_find_compatible_node(NULL, NULL, compstrs[i]);
-
-		of_address_to_resource(mdio, 0, &res);
-		snprintf(phy_id, sizeof(phy_id), "%llx:%02x",
-			(unsigned long long)res.start, 1);
-
-		phy_register_fixup_for_id(phy_id, mpc8568_fixup_125_clock);
-		phy_register_fixup_for_id(phy_id, mpc8568_mds_phy_fixups);
-
-		/* Register a workaround for errata */
-		snprintf(phy_id, sizeof(phy_id), "%llx:%02x",
-			(unsigned long long)res.start, 7);
-		phy_register_fixup_for_id(phy_id, mpc8568_mds_phy_fixups);
-
-		of_node_put(mdio);
-	}
-
-	return 0;
-}
-
-machine_arch_initcall(mpc8568_mds, board_fixups);
-machine_arch_initcall(mpc8569_mds, board_fixups);
-
-#endif
-
-static int __init mpc85xx_publish_devices(void)
-{
-	return mpc85xx_common_publish_devices();
-}
-
-machine_arch_initcall(mpc8568_mds, mpc85xx_publish_devices);
-machine_arch_initcall(mpc8569_mds, mpc85xx_publish_devices);
-machine_arch_initcall(p1021_mds, mpc85xx_common_publish_devices);
-
-static void __init mpc85xx_mds_pic_init(void)
-{
-	struct mpic *mpic = mpic_alloc(NULL, 0, MPIC_BIG_ENDIAN |
-			MPIC_SINGLE_DEST_CPU,
-			0, 256, " OpenPIC  ");
-	BUG_ON(mpic == NULL);
-
-	mpic_init(mpic);
-}
-
-static int __init mpc85xx_mds_probe(void)
-{
-	return of_machine_is_compatible("MPC85xxMDS");
-}
-
-define_machine(mpc8568_mds) {
-	.name		= "MPC8568 MDS",
-	.probe		= mpc85xx_mds_probe,
-	.setup_arch	= mpc85xx_mds_setup_arch,
-	.init_IRQ	= mpc85xx_mds_pic_init,
-	.get_irq	= mpic_get_irq,
-	.calibrate_decr	= generic_calibrate_decr,
-	.progress	= udbg_progress,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-};
-
-static int __init mpc8569_mds_probe(void)
-{
-	return of_machine_is_compatible("fsl,MPC8569EMDS");
-}
-
-define_machine(mpc8569_mds) {
-	.name		= "MPC8569 MDS",
-	.probe		= mpc8569_mds_probe,
-	.setup_arch	= mpc85xx_mds_setup_arch,
-	.init_IRQ	= mpc85xx_mds_pic_init,
-	.get_irq	= mpic_get_irq,
-	.calibrate_decr	= generic_calibrate_decr,
-	.progress	= udbg_progress,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-};
-
-static int __init p1021_mds_probe(void)
-{
-	return of_machine_is_compatible("fsl,P1021MDS");
-
-}
-
-define_machine(p1021_mds) {
-	.name		= "P1021 MDS",
-	.probe		= p1021_mds_probe,
-	.setup_arch	= mpc85xx_mds_setup_arch,
-	.init_IRQ	= mpc85xx_mds_pic_init,
-	.get_irq	= mpic_get_irq,
-	.calibrate_decr	= generic_calibrate_decr,
-	.progress	= udbg_progress,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-};
-- 
2.17.1

