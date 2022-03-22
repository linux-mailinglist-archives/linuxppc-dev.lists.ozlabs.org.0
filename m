Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1E14E36BE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 03:37:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMwcB1cC6z3bh8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 13:36:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMwbH5D8Kz2xfh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Mar 2022 13:36:11 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D404420132D;
 Tue, 22 Mar 2022 03:28:53 +0100 (CET)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com
 [134.27.49.11])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 927DB20022E;
 Tue, 22 Mar 2022 03:28:53 +0100 (CET)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.145])
 by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id
 3A5184028F; Mon, 21 Mar 2022 19:28:52 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
To: Rob Herring <robh+dt@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: [PATCH 6/6] powerpc/fsl: update ifc node name to be memory-controller
Date: Mon, 21 Mar 2022 21:28:18 -0500
Message-Id: <20220322022818.9860-6-leoyang.li@nxp.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b
In-Reply-To: <20220322022818.9860-1-leoyang.li@nxp.com>
References: <20220322022818.9860-1-leoyang.li@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Update the node name to be align with latest binding.

Signed-off-by: Li Yang <leoyang.li@nxp.com>
---
 arch/powerpc/boot/dts/fsl/bsc9131rdb.dts    | 2 +-
 arch/powerpc/boot/dts/fsl/bsc9132qds.dts    | 2 +-
 arch/powerpc/boot/dts/fsl/c293pcie.dts      | 2 +-
 arch/powerpc/boot/dts/fsl/p1010rdb_32b.dtsi | 2 +-
 arch/powerpc/boot/dts/fsl/p1010rdb_36b.dtsi | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/bsc9131rdb.dts b/arch/powerpc/boot/dts/fsl/bsc9131rdb.dts
index 8da984251abc..0ba86a6dce1b 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9131rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/bsc9131rdb.dts
@@ -15,7 +15,7 @@ memory {
 		device_type = "memory";
 	};
 
-	board_ifc: ifc: ifc@ff71e000 {
+	board_ifc: ifc: memory-controller@ff71e000 {
 		/* NAND Flash on board */
 		ranges = <0x0 0x0 0x0 0xff800000 0x00004000>;
 		reg = <0x0 0xff71e000 0x0 0x2000>;
diff --git a/arch/powerpc/boot/dts/fsl/bsc9132qds.dts b/arch/powerpc/boot/dts/fsl/bsc9132qds.dts
index 7cb2158dfe58..ce642e879a1b 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9132qds.dts
+++ b/arch/powerpc/boot/dts/fsl/bsc9132qds.dts
@@ -15,7 +15,7 @@ memory {
 		device_type = "memory";
 	};
 
-	ifc: ifc@ff71e000 {
+	ifc: memory-controller@ff71e000 {
 		/* NOR, NAND Flash on board */
 		ranges = <0x0 0x0 0x0 0x88000000 0x08000000
 			  0x1 0x0 0x0 0xff800000 0x00010000>;
diff --git a/arch/powerpc/boot/dts/fsl/c293pcie.dts b/arch/powerpc/boot/dts/fsl/c293pcie.dts
index 5e905e0857cf..e2fdac2ed420 100644
--- a/arch/powerpc/boot/dts/fsl/c293pcie.dts
+++ b/arch/powerpc/boot/dts/fsl/c293pcie.dts
@@ -42,7 +42,7 @@ memory {
 		device_type = "memory";
 	};
 
-	ifc: ifc@fffe1e000 {
+	ifc: memory-controller@fffe1e000 {
 		reg = <0xf 0xffe1e000 0 0x2000>;
 		ranges = <0x0 0x0 0xf 0xec000000 0x04000000
 			  0x1 0x0 0xf 0xff800000 0x00010000
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb_32b.dtsi b/arch/powerpc/boot/dts/fsl/p1010rdb_32b.dtsi
index fdc19aab2f70..583a6cd05079 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb_32b.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb_32b.dtsi
@@ -36,7 +36,7 @@ memory {
 	device_type = "memory";
 };
 
-board_ifc: ifc: ifc@ffe1e000 {
+board_ifc: ifc: memory-controller@ffe1e000 {
 	/* NOR, NAND Flashes and CPLD on board */
 	ranges = <0x0 0x0 0x0 0xee000000 0x02000000
 		  0x1 0x0 0x0 0xff800000 0x00010000
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb_36b.dtsi b/arch/powerpc/boot/dts/fsl/p1010rdb_36b.dtsi
index de2fceed4f79..4d41efe0038f 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb_36b.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb_36b.dtsi
@@ -36,7 +36,7 @@ memory {
 	device_type = "memory";
 };
 
-board_ifc: ifc: ifc@fffe1e000 {
+board_ifc: ifc: memory-controller@fffe1e000 {
 	/* NOR, NAND Flashes and CPLD on board */
 	ranges = <0x0 0x0 0xf 0xee000000 0x02000000
 		  0x1 0x0 0xf 0xff800000 0x00010000
-- 
2.25.1

