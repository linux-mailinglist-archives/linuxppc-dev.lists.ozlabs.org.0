Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0EF82BA6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 08:29:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462l8n04hhzDr6l
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 16:29:13 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 462l4z28TSzDqhn
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 16:25:53 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9AFEC200005;
 Tue,  6 Aug 2019 08:25:49 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0D5F5200241;
 Tue,  6 Aug 2019 08:25:38 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id C8109402B5;
 Tue,  6 Aug 2019 14:25:24 +0800 (SGT)
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com,
 shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com,
 lorenzo.pieralisi@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 minghuan.Lian@nxp.com, mingkai.hu@nxp.com, zhiqiang.hou@nxp.com,
 roy.zang@nxp.com, kstewart@linuxfoundation.org, pombredanne@nexb.com,
 shawn.lin@rock-chips.com, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv3 2/3] arm64: dts: ls1028a: Add PCIe controller DT nodes
Date: Tue,  6 Aug 2019 14:15:52 +0800
Message-Id: <20190806061553.19934-2-xiaowei.bao@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20190806061553.19934-1-xiaowei.bao@nxp.com>
References: <20190806061553.19934-1-xiaowei.bao@nxp.com>
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
Cc: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

LS1028a implements 2 PCIe 3.0 controllers.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
v2:
 - Fix up the legacy INTx allocate failed issue.
v3:
 - no change.

 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 52 ++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index aef5b06..0b542ed 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -503,6 +503,58 @@
 			status = "disabled";
 		};
 
+		pcie@3400000 {
+			compatible = "fsl,ls1028a-pcie";
+			reg = <0x00 0x03400000 0x0 0x00100000   /* controller registers */
+			       0x80 0x00000000 0x0 0x00002000>; /* configuration space */
+			reg-names = "regs", "config";
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>; /* aer interrupt */
+			interrupt-names = "pme", "aer";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			dma-coherent;
+			num-lanes = <4>;
+			bus-range = <0x0 0xff>;
+			ranges = <0x81000000 0x0 0x00000000 0x80 0x00010000 0x0 0x00010000   /* downstream I/O */
+				  0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			msi-parent = <&its>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+					<0000 0 0 2 &gic 0 0 GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+					<0000 0 0 3 &gic 0 0 GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+					<0000 0 0 4 &gic 0 0 GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		pcie@3500000 {
+			compatible = "fsl,ls1028a-pcie";
+			reg = <0x00 0x03500000 0x0 0x00100000   /* controller registers */
+			       0x88 0x00000000 0x0 0x00002000>; /* configuration space */
+			reg-names = "regs", "config";
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pme", "aer";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			dma-coherent;
+			num-lanes = <4>;
+			bus-range = <0x0 0xff>;
+			ranges = <0x81000000 0x0 0x00000000 0x88 0x00010000 0x0 0x00010000   /* downstream I/O */
+				  0x82000000 0x0 0x40000000 0x88 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			msi-parent = <&its>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+					<0000 0 0 2 &gic 0 0 GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+					<0000 0 0 3 &gic 0 0 GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+					<0000 0 0 4 &gic 0 0 GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		pcie@1f0000000 { /* Integrated Endpoint Root Complex */
 			compatible = "pci-host-ecam-generic";
 			reg = <0x01 0xf0000000 0x0 0x100000>;
-- 
2.9.5

