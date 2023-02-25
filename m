Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D126A2BA3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Feb 2023 21:17:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PPJ2h55xXz3fBn
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Feb 2023 07:17:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=b/pp8syo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.178.238; helo=mx0b-0064b401.pphosted.com; envelope-from=prvs=1420409688=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=b/pp8syo;
	dkim-atps=neutral
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PPHyf2Tffz3c71
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Feb 2023 07:13:44 +1100 (AEDT)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31PKDV3u002291;
	Sat, 25 Feb 2023 20:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=MQCvMr/SCtZB+aLQw6Hydu8/qcMWkduc6IM9G6f5kSM=;
 b=b/pp8syojGhadwwRucS1J0DCqVoR+0rfXUlxmp8k8CuYBSrQ4fLwaO+eCzOqwUmDw3D9
 vYSJpWMaGuHtTBF0NjUMrnzIpwR0IxyWci6mZJMgivA7xrppOHOBLiWVlo6eQGzS8+Ig
 tJNmDyrdhnGeqiq62/NF3O2Kl/BE9aPngcnmRx2a7YG+cKUsBcStb0qZsq5QOlBj1HFE
 LMGoswClYNnohPg2HMAf/SrhaOCXPb/l1g4moQO8GS9dZFkUP3kCEAL0pJoNs+QuTK/8
 TBCKwZIQeBe9FxiJfxgxau1VI5/sbk0Oi3di24p93iVxpBN1H7Hy0S8gLHUycaBN+E/S kQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybmk8gs1-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 25 Feb 2023 20:13:31 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Sat, 25 Feb 2023 12:13:31 -0800
Received: from sc2600cp.wrs.com (128.224.56.77) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Sat, 25 Feb 2023 12:13:30 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/3] powerpc: drop HPC-NET/MPC8641D evaluation platform support
Date: Sat, 25 Feb 2023 15:13:17 -0500
Message-ID: <20230225201318.3682-3-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230225201318.3682-1-paul.gortmaker@windriver.com>
References: <20230225201318.3682-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: gJNhONwHgyqu00tZcWz5gi_60n-e2zsT
X-Proofpoint-ORIG-GUID: gJNhONwHgyqu00tZcWz5gi_60n-e2zsT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-25_12,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302250170
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

There is no denying that this was an interesting platform in its day.
Access to a SMP powerpc platform became a bit more obtainable for folks
in the the BSP industry in the 2007 era, thanks to this platform.

Add to that the move to the black Antec case vs. the generic white 2005
era case of the MPC8548CDS or the retro 1950s 1/2 height horizontal case
of the HPC II, and it was pretty interesting to people like myself then.

However, like all the other evaluation platforms, the overall system
was complex out of necessity, as it tried to showcase all possible
features and use-cases.  That included an AMP option, where you could run
two bootloaders and two kernels over two serial consoles.  Peripheral
sharing got a bit more tricky when you got to the hard disk and similar.

In any case we still have the same circumstance.  A relatively rare and
expensive evaluation platform that is now 15+ years old and not out there
in large numbers in the general public.  Removal in 2023 just makes sense.

Cc: Scott Wood <oss@buserror.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/powerpc/boot/dts/fsl/mpc8641_hpcn.dts    | 394 ------------------
 .../powerpc/boot/dts/fsl/mpc8641_hpcn_36b.dts | 337 ---------------
 arch/powerpc/configs/mpc86xx_base.config      |   1 -
 arch/powerpc/configs/ppc6xx_defconfig         |   1 -
 arch/powerpc/platforms/86xx/Kconfig           |  12 +-
 arch/powerpc/platforms/86xx/Makefile          |   1 -
 arch/powerpc/platforms/86xx/mpc86xx_hpcn.c    | 127 ------
 7 files changed, 1 insertion(+), 872 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8641_hpcn.dts
 delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8641_hpcn_36b.dts
 delete mode 100644 arch/powerpc/platforms/86xx/mpc86xx_hpcn.c

diff --git a/arch/powerpc/boot/dts/fsl/mpc8641_hpcn.dts b/arch/powerpc/boot/dts/fsl/mpc8641_hpcn.dts
deleted file mode 100644
index f7a2430d6629..000000000000
--- a/arch/powerpc/boot/dts/fsl/mpc8641_hpcn.dts
+++ /dev/null
@@ -1,394 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MPC8641 HPCN Device Tree Source
- *
- * Copyright 2006 Freescale Semiconductor Inc.
- */
-
-/include/ "mpc8641si-pre.dtsi"
-
-/ {
-	model = "MPC8641HPCN";
-	compatible = "fsl,mpc8641hpcn";
-
-	memory {
-		device_type = "memory";
-		reg = <0x00000000 0x40000000>;	// 1G at 0x0
-	};
-
-	lbc: localbus@ffe05000 {
-		reg = <0xffe05000 0x1000>;
-
-		ranges = <0 0 0xef800000 0x00800000
-			  2 0 0xffdf8000 0x00008000
-			  3 0 0xffdf0000 0x00008000>;
-
-		flash@0,0 {
-			compatible = "cfi-flash";
-			reg = <0 0 0x00800000>;
-			bank-width = <2>;
-			device-width = <2>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			partition@0 {
-				label = "kernel";
-				reg = <0x00000000 0x00300000>;
-			};
-			partition@300000 {
-				label = "firmware b";
-				reg = <0x00300000 0x00100000>;
-				read-only;
-			};
-			partition@400000 {
-				label = "fs";
-				reg = <0x00400000 0x00300000>;
-			};
-			partition@700000 {
-				label = "firmware a";
-				reg = <0x00700000 0x00100000>;
-				read-only;
-			};
-		};
-	};
-
-	soc: soc8641@ffe00000 {
-		ranges = <0x00000000 0xffe00000 0x00100000>;
-
-		enet0: ethernet@24000 {
-			tbi-handle = <&tbi0>;
-			phy-handle = <&phy0>;
-			phy-connection-type = "rgmii-id";
-		};
-
-		mdio@24520 {
-			phy0: ethernet-phy@0 {
-				interrupts = <10 1 0 0>;
-				reg = <0>;
-			};
-			phy1: ethernet-phy@1 {
-				interrupts = <10 1 0 0>;
-				reg = <1>;
-			};
-			phy2: ethernet-phy@2 {
-				interrupts = <10 1 0 0>;
-				reg = <2>;
-			};
-			phy3: ethernet-phy@3 {
-				interrupts = <10 1 0 0>;
-				reg = <3>;
-			};
-			tbi0: tbi-phy@11 {
-				reg = <0x11>;
-				device_type = "tbi-phy";
-			};
-		};
-
-		enet1: ethernet@25000 {
-			tbi-handle = <&tbi1>;
-			phy-handle = <&phy1>;
-			phy-connection-type = "rgmii-id";
-		};
-
-		mdio@25520 {
-			tbi1: tbi-phy@11 {
-				reg = <0x11>;
-				device_type = "tbi-phy";
-			};
-		};
-		
-		enet2: ethernet@26000 {
-			tbi-handle = <&tbi2>;
-			phy-handle = <&phy2>;
-			phy-connection-type = "rgmii-id";
-		};
-
-		mdio@26520 {
-			tbi2: tbi-phy@11 {
-				reg = <0x11>;
-				device_type = "tbi-phy";
-			};
-		};
-
-		enet3: ethernet@27000 {
-			tbi-handle = <&tbi3>;
-			phy-handle = <&phy3>;
-			phy-connection-type = "rgmii-id";
-		};
-
-		mdio@27520 {
-			tbi3: tbi-phy@11 {
-				reg = <0x11>;
-				device_type = "tbi-phy";
-			};
-		};
-
-		rmu: rmu@d3000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,srio-rmu";
-			reg = <0xd3000 0x500>;
-			ranges = <0x0 0xd3000 0x500>;
-
-			message-unit@0 {
-				compatible = "fsl,srio-msg-unit";
-				reg = <0x0 0x100>;
-				interrupts = <
-					53 2 0 0  /* msg1_tx_irq */
-					54 2 0 0>;/* msg1_rx_irq */
-			};
-			message-unit@100 {
-				compatible = "fsl,srio-msg-unit";
-				reg = <0x100 0x100>;
-				interrupts = <
-					55 2 0 0  /* msg2_tx_irq */
-					56 2 0 0>;/* msg2_rx_irq */
-			};
-			doorbell-unit@400 {
-				compatible = "fsl,srio-dbell-unit";
-				reg = <0x400 0x80>;
-				interrupts = <
-					49 2 0 0  /* bell_outb_irq */
-					50 2 0 0>;/* bell_inb_irq */
-			};
-			port-write-unit@4e0 {
-				compatible = "fsl,srio-port-write-unit";
-				reg = <0x4e0 0x20>;
-				interrupts = <48 2 0 0>;
-			};
-		};
-	};
-
-	pci0: pcie@ffe08000 {
-		reg = <0xffe08000 0x1000>;
-		ranges = <0x02000000 0x0 0x80000000 0x80000000 0x0 0x20000000
-			  0x01000000 0x0 0x00000000 0xffc00000 0x0 0x00010000>;
-		interrupt-map-mask = <0xff00 0 0 7>;
-		interrupt-map = <
-			/* IDSEL 0x11 func 0 - PCI slot 1 */
-			0x8800 0 0 1 &mpic 2 1 0 0
-			0x8800 0 0 2 &mpic 3 1 0 0
-			0x8800 0 0 3 &mpic 4 1 0 0
-			0x8800 0 0 4 &mpic 1 1 0 0
-
-			/* IDSEL 0x11 func 1 - PCI slot 1 */
-			0x8900 0 0 1 &mpic 2 1 0 0
-			0x8900 0 0 2 &mpic 3 1 0 0
-			0x8900 0 0 3 &mpic 4 1 0 0
-			0x8900 0 0 4 &mpic 1 1 0 0
-
-			/* IDSEL 0x11 func 2 - PCI slot 1 */
-			0x8a00 0 0 1 &mpic 2 1 0 0
-			0x8a00 0 0 2 &mpic 3 1 0 0
-			0x8a00 0 0 3 &mpic 4 1 0 0
-			0x8a00 0 0 4 &mpic 1 1 0 0
-
-			/* IDSEL 0x11 func 3 - PCI slot 1 */
-			0x8b00 0 0 1 &mpic 2 1 0 0
-			0x8b00 0 0 2 &mpic 3 1 0 0
-			0x8b00 0 0 3 &mpic 4 1 0 0
-			0x8b00 0 0 4 &mpic 1 1 0 0
-
-			/* IDSEL 0x11 func 4 - PCI slot 1 */
-			0x8c00 0 0 1 &mpic 2 1 0 0
-			0x8c00 0 0 2 &mpic 3 1 0 0
-			0x8c00 0 0 3 &mpic 4 1 0 0
-			0x8c00 0 0 4 &mpic 1 1 0 0
-
-			/* IDSEL 0x11 func 5 - PCI slot 1 */
-			0x8d00 0 0 1 &mpic 2 1 0 0
-			0x8d00 0 0 2 &mpic 3 1 0 0
-			0x8d00 0 0 3 &mpic 4 1 0 0
-			0x8d00 0 0 4 &mpic 1 1 0 0
-
-			/* IDSEL 0x11 func 6 - PCI slot 1 */
-			0x8e00 0 0 1 &mpic 2 1 0 0
-			0x8e00 0 0 2 &mpic 3 1 0 0
-			0x8e00 0 0 3 &mpic 4 1 0 0
-			0x8e00 0 0 4 &mpic 1 1 0 0
-
-			/* IDSEL 0x11 func 7 - PCI slot 1 */
-			0x8f00 0 0 1 &mpic 2 1 0 0
-			0x8f00 0 0 2 &mpic 3 1 0 0
-			0x8f00 0 0 3 &mpic 4 1 0 0
-			0x8f00 0 0 4 &mpic 1 1 0 0
-
-			/* IDSEL 0x12 func 0 - PCI slot 2 */
-			0x9000 0 0 1 &mpic 3 1 0 0
-			0x9000 0 0 2 &mpic 4 1 0 0
-			0x9000 0 0 3 &mpic 1 1 0 0
-			0x9000 0 0 4 &mpic 2 1 0 0
-
-			/* IDSEL 0x12 func 1 - PCI slot 2 */
-			0x9100 0 0 1 &mpic 3 1 0 0
-			0x9100 0 0 2 &mpic 4 1 0 0
-			0x9100 0 0 3 &mpic 1 1 0 0
-			0x9100 0 0 4 &mpic 2 1 0 0
-
-			/* IDSEL 0x12 func 2 - PCI slot 2 */
-			0x9200 0 0 1 &mpic 3 1 0 0
-			0x9200 0 0 2 &mpic 4 1 0 0
-			0x9200 0 0 3 &mpic 1 1 0 0
-			0x9200 0 0 4 &mpic 2 1 0 0
-
-			/* IDSEL 0x12 func 3 - PCI slot 2 */
-			0x9300 0 0 1 &mpic 3 1 0 0
-			0x9300 0 0 2 &mpic 4 1 0 0
-			0x9300 0 0 3 &mpic 1 1 0 0
-			0x9300 0 0 4 &mpic 2 1 0 0
-
-			/* IDSEL 0x12 func 4 - PCI slot 2 */
-			0x9400 0 0 1 &mpic 3 1 0 0
-			0x9400 0 0 2 &mpic 4 1 0 0
-			0x9400 0 0 3 &mpic 1 1 0 0
-			0x9400 0 0 4 &mpic 2 1 0 0
-
-			/* IDSEL 0x12 func 5 - PCI slot 2 */
-			0x9500 0 0 1 &mpic 3 1 0 0
-			0x9500 0 0 2 &mpic 4 1 0 0
-			0x9500 0 0 3 &mpic 1 1 0 0
-			0x9500 0 0 4 &mpic 2 1 0 0
-
-			/* IDSEL 0x12 func 6 - PCI slot 2 */
-			0x9600 0 0 1 &mpic 3 1 0 0
-			0x9600 0 0 2 &mpic 4 1 0 0
-			0x9600 0 0 3 &mpic 1 1 0 0
-			0x9600 0 0 4 &mpic 2 1 0 0
-
-			/* IDSEL 0x12 func 7 - PCI slot 2 */
-			0x9700 0 0 1 &mpic 3 1 0 0
-			0x9700 0 0 2 &mpic 4 1 0 0
-			0x9700 0 0 3 &mpic 1 1 0 0
-			0x9700 0 0 4 &mpic 2 1 0 0
-
-			// IDSEL 0x1c  USB
-			0xe000 0 0 1 &i8259 12 2
-			0xe100 0 0 2 &i8259 9 2
-			0xe200 0 0 3 &i8259 10 2
-			0xe300 0 0 4 &i8259 11 2
-
-			// IDSEL 0x1d  Audio
-			0xe800 0 0 1 &i8259 6 2
-
-			// IDSEL 0x1e Legacy
-			0xf000 0 0 1 &i8259 7 2
-			0xf100 0 0 1 &i8259 7 2
-
-			// IDSEL 0x1f IDE/SATA
-			0xf800 0 0 1 &i8259 14 2
-			0xf900 0 0 1 &i8259 5 2
-			>;
-
-		pcie@0 {
-			ranges = <0x02000000 0x0 0x80000000
-				  0x02000000 0x0 0x80000000
-				  0x0 0x20000000
-
-				  0x01000000 0x0 0x00000000
-				  0x01000000 0x0 0x00000000
-				  0x0 0x00010000>;
-			uli1575@0 {
-				reg = <0 0 0 0 0>;
-				#size-cells = <2>;
-				#address-cells = <3>;
-				ranges = <0x02000000 0x0 0x80000000
-					  0x02000000 0x0 0x80000000
-					  0x0 0x20000000
-					  0x01000000 0x0 0x00000000
-					  0x01000000 0x0 0x00000000
-					  0x0 0x00010000>;
-				isa@1e {
-					device_type = "isa";
-					#size-cells = <1>;
-					#address-cells = <2>;
-					reg = <0xf000 0 0 0 0>;
-					ranges = <1 0 0x01000000 0 0
-						  0x00001000>;
-					interrupt-parent = <&i8259>;
-
-					i8259: interrupt-controller@20 {
-						reg = <1 0x20 2
-						       1 0xa0 2
-						       1 0x4d0 2>;
-						interrupt-controller;
-						device_type = "interrupt-controller";
-						#address-cells = <0>;
-						#interrupt-cells = <2>;
-						compatible = "chrp,iic";
-						interrupts = <9 2 0 0>;
-					};
-
-					i8042@60 {
-						#size-cells = <0>;
-						#address-cells = <1>;
-						reg = <1 0x60 1 1 0x64 1>;
-						interrupts = <1 3 12 3>;
-						interrupt-parent = <&i8259>;
-
-						keyboard@0 {
-							reg = <0>;
-							compatible = "pnpPNP,303";
-						};
-
-						mouse@1 {
-							reg = <1>;
-							compatible = "pnpPNP,f03";
-						};
-					};
-
-					rtc@70 {
-						compatible =
-							"pnpPNP,b00";
-						reg = <1 0x70 2>;
-					};
-
-					gpio@400 {
-						reg = <1 0x400 0x80>;
-					};
-				};
-			};
-		};
-
-	};
-
-	pci1: pcie@ffe09000 {
-		reg = <0xffe09000 0x1000>;
-		ranges = <0x02000000 0x0 0xa0000000 0xa0000000 0x0 0x20000000
-			  0x01000000 0x0 0x00000000 0xffc10000 0x0 0x00010000>;
-
-		pcie@0 {
-			ranges = <0x02000000 0x0 0xa0000000
-				  0x02000000 0x0 0xa0000000
-				  0x0 0x20000000
-
-				  0x01000000 0x0 0x00000000
-				  0x01000000 0x0 0x00000000
-				  0x0 0x00010000>;
-		};
-	};
-/*
- * Only one of Rapid IO or PCI can be present due to HW limitations and
- * due to the fact that the 2 now share address space in the new memory
- * map.  The most likely case is that we have PCI, so comment out the
- * rapidio node.  Leave it here for reference.
-
-	rapidio@ffec0000 {
-		reg = <0xffec0000 0x11000>;
-		compatible = "fsl,srio";
-		interrupts = <48 2 0 0>;
-		#address-cells = <2>;
-		#size-cells = <2>;
-		fsl,srio-rmu-handle = <&rmu>;
-		ranges;
-
-		port1 {
-			#address-cells = <2>;
-			#size-cells = <2>;
-			cell-index = <1>;
-			ranges = <0 0 0x80000000 0 0x20000000>;
-		};
-	};
-*/
-
-};
-
-/include/ "mpc8641si-post.dtsi"
diff --git a/arch/powerpc/boot/dts/fsl/mpc8641_hpcn_36b.dts b/arch/powerpc/boot/dts/fsl/mpc8641_hpcn_36b.dts
deleted file mode 100644
index 3f5f7a99b9ea..000000000000
--- a/arch/powerpc/boot/dts/fsl/mpc8641_hpcn_36b.dts
+++ /dev/null
@@ -1,337 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MPC8641 HPCN Device Tree Source
- *
- * Copyright 2008-2009 Freescale Semiconductor Inc.
- */
-
-/include/ "mpc8641si-pre.dtsi"
-
-/ {
-	model = "MPC8641HPCN";
-	compatible = "fsl,mpc8641hpcn";
-	#address-cells = <2>;
-	#size-cells = <2>;
-
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x00000000 0x0 0x40000000>;	// 1G at 0x0
-	};
-
-	lbc: localbus@fffe05000 {
-		reg = <0x0f 0xffe05000 0x0 0x1000>;
-
-		ranges = <0 0 0xf 0xef800000 0x00800000
-			  2 0 0xf 0xffdf8000 0x00008000
-			  3 0 0xf 0xffdf0000 0x00008000>;
-
-		flash@0,0 {
-			compatible = "cfi-flash";
-			reg = <0 0 0x00800000>;
-			bank-width = <2>;
-			device-width = <2>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			partition@0 {
-				label = "kernel";
-				reg = <0x00000000 0x00300000>;
-			};
-			partition@300000 {
-				label = "firmware b";
-				reg = <0x00300000 0x00100000>;
-				read-only;
-			};
-			partition@400000 {
-				label = "fs";
-				reg = <0x00400000 0x00300000>;
-			};
-			partition@700000 {
-				label = "firmware a";
-				reg = <0x00700000 0x00100000>;
-				read-only;
-			};
-		};
-	};
-
-	soc: soc8641@fffe00000 {
-		ranges = <0x00000000 0x0f 0xffe00000 0x00100000>;
-
-		enet0: ethernet@24000 {
-			tbi-handle = <&tbi0>;
-			phy-handle = <&phy0>;
-			phy-connection-type = "rgmii-id";
-		};
-
-		mdio@24520 {
-			phy0: ethernet-phy@0 {
-				interrupts = <10 1 0 0>;
-				reg = <0>;
-			};
-			phy1: ethernet-phy@1 {
-				interrupts = <10 1 0 0>;
-				reg = <1>;
-			};
-			phy2: ethernet-phy@2 {
-				interrupts = <10 1 0 0>;
-				reg = <2>;
-			};
-			phy3: ethernet-phy@3 {
-				interrupts = <10 1 0 0>;
-				reg = <3>;
-			};
-			tbi0: tbi-phy@11 {
-				reg = <0x11>;
-				device_type = "tbi-phy";
-			};
-		};
-
-		enet1: ethernet@25000 {
-			tbi-handle = <&tbi1>;
-			phy-handle = <&phy1>;
-			phy-connection-type = "rgmii-id";
-		};
-
-		mdio@25520 {
-			tbi1: tbi-phy@11 {
-				reg = <0x11>;
-				device_type = "tbi-phy";
-			};
-		};
-
-		enet2: ethernet@26000 {
-			tbi-handle = <&tbi2>;
-			phy-handle = <&phy2>;
-			phy-connection-type = "rgmii-id";
-		};
-
-		mdio@26520 {
-			tbi2: tbi-phy@11 {
-				reg = <0x11>;
-				device_type = "tbi-phy";
-			};
-		};
-
-		enet3: ethernet@27000 {
-			tbi-handle = <&tbi3>;
-			phy-handle = <&phy3>;
-			phy-connection-type = "rgmii-id";
-		};
-
-		mdio@27520 {
-			tbi3: tbi-phy@11 {
-				reg = <0x11>;
-				device_type = "tbi-phy";
-			};
-		};
-	};
-
-	pci0: pcie@fffe08000 {
-		reg = <0x0f 0xffe08000 0x0 0x1000>;
-		ranges = <0x02000000 0x0 0xe0000000 0x0c 0x00000000 0x0 0x20000000
-			  0x01000000 0x0 0x00000000 0x0f 0xffc00000 0x0 0x00010000>;
-		interrupt-map-mask = <0xff00 0 0 7>;
-		interrupt-map = <
-			/* IDSEL 0x11 func 0 - PCI slot 1 */
-			0x8800 0 0 1 &mpic 2 1 0 0
-			0x8800 0 0 2 &mpic 3 1 0 0
-			0x8800 0 0 3 &mpic 4 1 0 0
-			0x8800 0 0 4 &mpic 1 1 0 0
-
-			/* IDSEL 0x11 func 1 - PCI slot 1 */
-			0x8900 0 0 1 &mpic 2 1 0 0
-			0x8900 0 0 2 &mpic 3 1 0 0
-			0x8900 0 0 3 &mpic 4 1 0 0
-			0x8900 0 0 4 &mpic 1 1 0 0
-
-			/* IDSEL 0x11 func 2 - PCI slot 1 */
-			0x8a00 0 0 1 &mpic 2 1 0 0
-			0x8a00 0 0 2 &mpic 3 1 0 0
-			0x8a00 0 0 3 &mpic 4 1 0 0
-			0x8a00 0 0 4 &mpic 1 1 0 0
-
-			/* IDSEL 0x11 func 3 - PCI slot 1 */
-			0x8b00 0 0 1 &mpic 2 1 0 0
-			0x8b00 0 0 2 &mpic 3 1 0 0
-			0x8b00 0 0 3 &mpic 4 1 0 0
-			0x8b00 0 0 4 &mpic 1 1 0 0
-
-			/* IDSEL 0x11 func 4 - PCI slot 1 */
-			0x8c00 0 0 1 &mpic 2 1 0 0
-			0x8c00 0 0 2 &mpic 3 1 0 0
-			0x8c00 0 0 3 &mpic 4 1 0 0
-			0x8c00 0 0 4 &mpic 1 1 0 0
-
-			/* IDSEL 0x11 func 5 - PCI slot 1 */
-			0x8d00 0 0 1 &mpic 2 1 0 0
-			0x8d00 0 0 2 &mpic 3 1 0 0
-			0x8d00 0 0 3 &mpic 4 1 0 0
-			0x8d00 0 0 4 &mpic 1 1 0 0
-
-			/* IDSEL 0x11 func 6 - PCI slot 1 */
-			0x8e00 0 0 1 &mpic 2 1 0 0
-			0x8e00 0 0 2 &mpic 3 1 0 0
-			0x8e00 0 0 3 &mpic 4 1 0 0
-			0x8e00 0 0 4 &mpic 1 1 0 0
-
-			/* IDSEL 0x11 func 7 - PCI slot 1 */
-			0x8f00 0 0 1 &mpic 2 1 0 0
-			0x8f00 0 0 2 &mpic 3 1 0 0
-			0x8f00 0 0 3 &mpic 4 1 0 0
-			0x8f00 0 0 4 &mpic 1 1 0 0
-
-			/* IDSEL 0x12 func 0 - PCI slot 2 */
-			0x9000 0 0 1 &mpic 3 1 0 0
-			0x9000 0 0 2 &mpic 4 1 0 0
-			0x9000 0 0 3 &mpic 1 1 0 0
-			0x9000 0 0 4 &mpic 2 1 0 0
-
-			/* IDSEL 0x12 func 1 - PCI slot 2 */
-			0x9100 0 0 1 &mpic 3 1 0 0
-			0x9100 0 0 2 &mpic 4 1 0 0
-			0x9100 0 0 3 &mpic 1 1 0 0
-			0x9100 0 0 4 &mpic 2 1 0 0
-
-			/* IDSEL 0x12 func 2 - PCI slot 2 */
-			0x9200 0 0 1 &mpic 3 1 0 0
-			0x9200 0 0 2 &mpic 4 1 0 0
-			0x9200 0 0 3 &mpic 1 1 0 0
-			0x9200 0 0 4 &mpic 2 1 0 0
-
-			/* IDSEL 0x12 func 3 - PCI slot 2 */
-			0x9300 0 0 1 &mpic 3 1 0 0
-			0x9300 0 0 2 &mpic 4 1 0 0
-			0x9300 0 0 3 &mpic 1 1 0 0
-			0x9300 0 0 4 &mpic 2 1 0 0
-
-			/* IDSEL 0x12 func 4 - PCI slot 2 */
-			0x9400 0 0 1 &mpic 3 1 0 0
-			0x9400 0 0 2 &mpic 4 1 0 0
-			0x9400 0 0 3 &mpic 1 1 0 0
-			0x9400 0 0 4 &mpic 2 1 0 0
-
-			/* IDSEL 0x12 func 5 - PCI slot 2 */
-			0x9500 0 0 1 &mpic 3 1 0 0
-			0x9500 0 0 2 &mpic 4 1 0 0
-			0x9500 0 0 3 &mpic 1 1 0 0
-			0x9500 0 0 4 &mpic 2 1 0 0
-
-			/* IDSEL 0x12 func 6 - PCI slot 2 */
-			0x9600 0 0 1 &mpic 3 1 0 0
-			0x9600 0 0 2 &mpic 4 1 0 0
-			0x9600 0 0 3 &mpic 1 1 0 0
-			0x9600 0 0 4 &mpic 2 1 0 0
-
-			/* IDSEL 0x12 func 7 - PCI slot 2 */
-			0x9700 0 0 1 &mpic 3 1 0 0
-			0x9700 0 0 2 &mpic 4 1 0 0
-			0x9700 0 0 3 &mpic 1 1 0 0
-			0x9700 0 0 4 &mpic 2 1 0 0
-
-			// IDSEL 0x1c  USB
-			0xe000 0 0 1 &i8259 12 2
-			0xe100 0 0 2 &i8259 9 2
-			0xe200 0 0 3 &i8259 10 2
-			0xe300 0 0 4 &i8259 11 2
-
-			// IDSEL 0x1d  Audio
-			0xe800 0 0 1 &i8259 6 2
-
-			// IDSEL 0x1e Legacy
-			0xf000 0 0 1 &i8259 7 2
-			0xf100 0 0 1 &i8259 7 2
-
-			// IDSEL 0x1f IDE/SATA
-			0xf800 0 0 1 &i8259 14 2
-			0xf900 0 0 1 &i8259 5 2
-			>;
-
-		pcie@0 {
-			ranges = <0x02000000 0x0 0xe0000000
-				  0x02000000 0x0 0xe0000000
-				  0x0 0x20000000
-
-				  0x01000000 0x0 0x00000000
-				  0x01000000 0x0 0x00000000
-				  0x0 0x00010000>;
-			uli1575@0 {
-				reg = <0 0 0 0 0>;
-				#size-cells = <2>;
-				#address-cells = <3>;
-				ranges = <0x02000000 0x0 0xe0000000
-					  0x02000000 0x0 0xe0000000
-					  0x0 0x20000000
-					  0x01000000 0x0 0x00000000
-					  0x01000000 0x0 0x00000000
-					  0x0 0x00010000>;
-				isa@1e {
-					device_type = "isa";
-					#size-cells = <1>;
-					#address-cells = <2>;
-					reg = <0xf000 0 0 0 0>;
-					ranges = <1 0 0x01000000 0 0
-						  0x00001000>;
-					interrupt-parent = <&i8259>;
-
-					i8259: interrupt-controller@20 {
-						reg = <1 0x20 2
-						       1 0xa0 2
-						       1 0x4d0 2>;
-						interrupt-controller;
-						device_type = "interrupt-controller";
-						#address-cells = <0>;
-						#interrupt-cells = <2>;
-						compatible = "chrp,iic";
-						interrupts = <9 2 0 0>;
-					};
-
-					i8042@60 {
-						#size-cells = <0>;
-						#address-cells = <1>;
-						reg = <1 0x60 1 1 0x64 1>;
-						interrupts = <1 3 12 3>;
-						interrupt-parent = <&i8259>;
-
-						keyboard@0 {
-							reg = <0>;
-							compatible = "pnpPNP,303";
-						};
-
-						mouse@1 {
-							reg = <1>;
-							compatible = "pnpPNP,f03";
-						};
-					};
-
-					rtc@70 {
-						compatible =
-							"pnpPNP,b00";
-						reg = <1 0x70 2>;
-					};
-
-					gpio@400 {
-						reg = <1 0x400 0x80>;
-					};
-				};
-			};
-		};
-
-	};
-
-	pci1: pcie@fffe09000 {
-		reg = <0x0f 0xffe09000 0x0 0x1000>;
-		ranges = <0x02000000 0x0 0xe0000000 0x0c 0x20000000 0x0 0x20000000
-			  0x01000000 0x0 0x00000000 0x0f 0xffc10000 0x0 0x00010000>;
-
-		pcie@0 {
-			ranges = <0x02000000 0x0 0xe0000000
-				  0x02000000 0x0 0xe0000000
-				  0x0 0x20000000
-
-				  0x01000000 0x0 0x00000000
-				  0x01000000 0x0 0x00000000
-				  0x0 0x00010000>;
-		};
-	};
-};
-
-/include/ "mpc8641si-post.dtsi"
diff --git a/arch/powerpc/configs/mpc86xx_base.config b/arch/powerpc/configs/mpc86xx_base.config
index 588870e6af3b..9f7a232c9357 100644
--- a/arch/powerpc/configs/mpc86xx_base.config
+++ b/arch/powerpc/configs/mpc86xx_base.config
@@ -1,5 +1,4 @@
 CONFIG_PPC_86xx=y
-CONFIG_MPC8641_HPCN=y
 CONFIG_MPC8610_HPCD=y
 CONFIG_GEF_PPC9A=y
 CONFIG_GEF_SBC310=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index f6a3b87199db..57f5e62992e0 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -48,7 +48,6 @@ CONFIG_MPC836x_RDK=y
 CONFIG_MPC837x_RDB=y
 CONFIG_ASP834x=y
 CONFIG_PPC_86xx=y
-CONFIG_MPC8641_HPCN=y
 CONFIG_MPC8610_HPCD=y
 CONFIG_GEF_SBC610=y
 CONFIG_CPU_FREQ=y
diff --git a/arch/powerpc/platforms/86xx/Kconfig b/arch/powerpc/platforms/86xx/Kconfig
index be867abebc83..4fe385f37f3b 100644
--- a/arch/powerpc/platforms/86xx/Kconfig
+++ b/arch/powerpc/platforms/86xx/Kconfig
@@ -10,16 +10,6 @@ menuconfig PPC_86xx
 
 if PPC_86xx
 
-config MPC8641_HPCN
-	bool "Freescale MPC8641 HPCN"
-	select PPC_I8259
-	select DEFAULT_UIMAGE
-	select FSL_ULI1575 if PCI
-	select HAVE_RAPIDIO
-	select SWIOTLB
-	help
-	  This option enables support for the MPC8641 HPCN board.
-
 config MPC8610_HPCD
 	bool "Freescale MPC8610 HPCD"
 	select DEFAULT_UIMAGE
@@ -68,7 +58,7 @@ config MPC8641
 	select FSL_PCI if PCI
 	select PPC_UDBG_16550
 	select MPIC
-	default y if MPC8641_HPCN || GEF_SBC610 || GEF_SBC310 || GEF_PPC9A \
+	default y if GEF_SBC610 || GEF_SBC310 || GEF_PPC9A \
 			|| MVME7100
 
 config MPC8610
diff --git a/arch/powerpc/platforms/86xx/Makefile b/arch/powerpc/platforms/86xx/Makefile
index 5bbe1475bf26..ab2c15114228 100644
--- a/arch/powerpc/platforms/86xx/Makefile
+++ b/arch/powerpc/platforms/86xx/Makefile
@@ -5,7 +5,6 @@
 
 obj-y				:= pic.o common.o
 obj-$(CONFIG_SMP)		+= mpc86xx_smp.o
-obj-$(CONFIG_MPC8641_HPCN)	+= mpc86xx_hpcn.o
 obj-$(CONFIG_MPC8610_HPCD)	+= mpc8610_hpcd.o
 obj-$(CONFIG_GEF_SBC610)	+= gef_sbc610.o
 obj-$(CONFIG_GEF_SBC310)	+= gef_sbc310.o
diff --git a/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c b/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
deleted file mode 100644
index 5294394c9c07..000000000000
--- a/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
+++ /dev/null
@@ -1,127 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * MPC86xx HPCN board specific routines
- *
- * Recode: ZHANG WEI <wei.zhang@freescale.com>
- * Initial author: Xianghua Xiao <x.xiao@freescale.com>
- *
- * Copyright 2006 Freescale Semiconductor Inc.
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
-#include <mm/mmu_decl.h>
-#include <asm/udbg.h>
-#include <asm/swiotlb.h>
-
-#include <asm/mpic.h>
-
-#include <sysdev/fsl_pci.h>
-#include <sysdev/fsl_soc.h>
-
-#include "mpc86xx.h"
-
-#undef DEBUG
-
-#ifdef DEBUG
-#define DBG(fmt...) do { printk(KERN_ERR fmt); } while(0)
-#else
-#define DBG(fmt...) do { } while(0)
-#endif
-
-#ifdef CONFIG_PCI
-extern int uli_exclude_device(struct pci_controller *hose,
-				u_char bus, u_char devfn);
-
-static int mpc86xx_exclude_device(struct pci_controller *hose,
-				   u_char bus, u_char devfn)
-{
-	if (hose->dn == fsl_pci_primary)
-		return uli_exclude_device(hose, bus, devfn);
-
-	return PCIBIOS_SUCCESSFUL;
-}
-#endif /* CONFIG_PCI */
-
-
-static void __init
-mpc86xx_hpcn_setup_arch(void)
-{
-	if (ppc_md.progress)
-		ppc_md.progress("mpc86xx_hpcn_setup_arch()", 0);
-
-#ifdef CONFIG_PCI
-	ppc_md.pci_exclude_device = mpc86xx_exclude_device;
-#endif
-
-	printk("MPC86xx HPCN board from Freescale Semiconductor\n");
-
-#ifdef CONFIG_SMP
-	mpc86xx_smp_init();
-#endif
-
-	fsl_pci_assign_primary();
-
-	swiotlb_detect_4g();
-}
-
-
-static void
-mpc86xx_hpcn_show_cpuinfo(struct seq_file *m)
-{
-	uint svid = mfspr(SPRN_SVR);
-
-	seq_printf(m, "Vendor\t\t: Freescale Semiconductor\n");
-
-	seq_printf(m, "SVR\t\t: 0x%x\n", svid);
-}
-
-
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init mpc86xx_hpcn_probe(void)
-{
-	if (of_machine_is_compatible("fsl,mpc8641hpcn"))
-		return 1;	/* Looks good */
-
-	return 0;
-}
-
-static const struct of_device_id of_bus_ids[] __initconst = {
-	{ .compatible = "fsl,srio", },
-	{},
-};
-
-static int __init declare_of_platform_devices(void)
-{
-	mpc86xx_common_publish_devices();
-	of_platform_bus_probe(NULL, of_bus_ids, NULL);
-
-	return 0;
-}
-machine_arch_initcall(mpc86xx_hpcn, declare_of_platform_devices);
-
-define_machine(mpc86xx_hpcn) {
-	.name			= "MPC86xx HPCN",
-	.probe			= mpc86xx_hpcn_probe,
-	.setup_arch		= mpc86xx_hpcn_setup_arch,
-	.init_IRQ		= mpc86xx_init_irq,
-	.show_cpuinfo		= mpc86xx_hpcn_show_cpuinfo,
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

