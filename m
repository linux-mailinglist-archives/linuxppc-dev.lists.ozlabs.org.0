Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B4122BD2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 08:05:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456pKg48PWzDqLD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 16:05:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456pDk5WQtzDqHZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 16:01:24 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6052120016C;
 Mon, 20 May 2019 08:01:21 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 91E6D200188;
 Mon, 20 May 2019 08:01:15 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 39802402DF;
 Mon, 20 May 2019 14:01:08 +0800 (SGT)
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, benh@kernel.crashing.org,
 paulus@samba.org, mpe@ellerman.id.au, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 minghuan.lian@nxp.com, mingkai.hu@nxp.com, zhiqiang.hou@nxp.com,
 leoyang.li@nxp.com
Subject: [PATCH] powerpc: dts: Fix the bug that intx interrupt not work in
 P1010RDB-PB
Date: Mon, 20 May 2019 13:53:08 +0800
Message-Id: <20190520055308.43907-1-xiaowei.bao@nxp.com>
X-Mailer: git-send-email 2.14.1
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
Cc: Xiaowei Bao <xiaowei.bao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Due to the INTA is shared with the active-low PHY2 interrupt on P1010RDB-PA
board, so configure P1010RDB-PA's INTA with polarity as active-low, the
P1010RDB-PB board is used separately, so configure P1010RDB-PB's INTA with
polarity as active-high.
The INTX in P1010RDB-PB do not work because of the pcie@0 node fixup will be
overwrited by p1010si-post.dtsi file, so we move the pcie@0 node fixup to
p1010rdb-pb.dts and p1010rdb-pb_36b.dts.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
---
 arch/powerpc/boot/dts/fsl/p1010rdb-pb.dts     |   16 ++++++++++++++++
 arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts |   16 ++++++++++++++++
 arch/powerpc/boot/dts/fsl/p1010rdb.dtsi       |   16 ----------------
 3 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb-pb.dts b/arch/powerpc/boot/dts/fsl/p1010rdb-pb.dts
index 37681fd..6d75e5f 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb-pb.dts
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb-pb.dts
@@ -33,3 +33,19 @@
 };
 
 /include/ "p1010si-post.dtsi"
+
+&pci0 {
+	pcie@0 {
+		interrupt-map = <
+			/* IDSEL 0x0 */
+			/*
+			 *irq[4:5] are active-high
+			 *irq[6:7] are active-low
+			 */
+			0000 0x0 0x0 0x1 &mpic 0x4 0x2 0x0 0x0
+			0000 0x0 0x0 0x2 &mpic 0x5 0x2 0x0 0x0
+			0000 0x0 0x0 0x3 &mpic 0x6 0x1 0x0 0x0
+			0000 0x0 0x0 0x4 &mpic 0x7 0x1 0x0 0x0
+			>;
+	};
+};
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts b/arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts
index 4cf255f..8359035 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts
@@ -56,3 +56,19 @@
 };
 
 /include/ "p1010si-post.dtsi"
+
+&pci0 {
+	pcie@0 {
+		interrupt-map = <
+			/* IDSEL 0x0 */
+			/*
+			 *irq[4:5] are active-high
+			 *irq[6:7] are active-low
+			 */
+			0000 0x0 0x0 0x1 &mpic 0x4 0x2 0x0 0x0
+			0000 0x0 0x0 0x2 &mpic 0x5 0x2 0x0 0x0
+			0000 0x0 0x0 0x3 &mpic 0x6 0x1 0x0 0x0
+			0000 0x0 0x0 0x4 &mpic 0x7 0x1 0x0 0x0
+			>;
+	};
+};
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb.dtsi b/arch/powerpc/boot/dts/fsl/p1010rdb.dtsi
index 2ca9cee..ef49a7d 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb.dtsi
@@ -215,19 +215,3 @@
 		phy-connection-type = "sgmii";
 	};
 };
-
-&pci0 {
-	pcie@0 {
-		interrupt-map = <
-			/* IDSEL 0x0 */
-			/*
-			 *irq[4:5] are active-high
-			 *irq[6:7] are active-low
-			 */
-			0000 0x0 0x0 0x1 &mpic 0x4 0x2 0x0 0x0
-			0000 0x0 0x0 0x2 &mpic 0x5 0x2 0x0 0x0
-			0000 0x0 0x0 0x3 &mpic 0x6 0x1 0x0 0x0
-			0000 0x0 0x0 0x4 &mpic 0x7 0x1 0x0 0x0
-			>;
-	};
-};
-- 
1.7.1

