Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A586528E845
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 23:16:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBQGG1r0yzDqQJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 08:16:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baikalelectronics.ru (client-ip=94.125.187.42;
 helo=mail.baikalelectronics.ru;
 envelope-from=sergey.semin@baikalelectronics.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=baikalelectronics.ru
Received: from mail.baikalelectronics.ru (mx.chip.baikal.ru [94.125.187.42])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CBDQM4wJRzDqlJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 00:53:15 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id F3C45800254C;
 Wed, 14 Oct 2020 10:14:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h6oEBL6k3q-d; Wed, 14 Oct 2020 13:14:22 +0300 (MSK)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn
 <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Kukjin Kim <kgene@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Santosh Shilimkar
 <ssantosh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, =?UTF-8?q?Beno=C3=AEt=20Cousson?=
 <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Patrice Chotard
 <patrice.chotard@st.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Wei Xu <xuwei5@hisilicon.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
Date: Wed, 14 Oct 2020 13:14:02 +0300
Message-ID: <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-Mailman-Approved-At: Thu, 15 Oct 2020 07:49:49 +1100
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-mips@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Manu Gautam <mgautam@codeaurora.org>, linux-omap@vger.kernel.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-arm-msm@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In accordance with the DWC USB3 bindings the corresponding node name is
suppose to comply with Generic USB HCD DT schema, which requires the USB
nodes to have the name acceptable by the regexp: "^usb(@.*)?" . But a lot
of the DWC USB3-compatible nodes defined in the ARM/ARM64 DTS files have
name as "^dwc3@.*" or "^usb[1-3]@.*" or even "^dwusb@.*", which will cause
the dtbs_check procedure failure. Let's fix the nodes naming to be
compatible with the DWC USB3 DT schema to make dtbs_check happy.

Note we don't change the DWC USB3-compatible nodes names of
arch/arm64/boot/dts/apm/{apm-storm.dtsi,apm-shadowcat.dtsi} since the
in-source comment says that the nodes name need to be preserved as
"^dwusb@.*" for some backward compatibility.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Please, test the patch out to make sure it doesn't brake the dependent DTS
files. I did only a manual grepping of the possible nodes dependencies.
---
 arch/arm/boot/dts/armada-375.dtsi              | 2 +-
 arch/arm/boot/dts/exynos5250.dtsi              | 2 +-
 arch/arm/boot/dts/exynos54xx.dtsi              | 4 ++--
 arch/arm/boot/dts/keystone-k2e.dtsi            | 4 ++--
 arch/arm/boot/dts/keystone.dtsi                | 2 +-
 arch/arm/boot/dts/ls1021a.dtsi                 | 2 +-
 arch/arm/boot/dts/omap5-l4.dtsi                | 2 +-
 arch/arm/boot/dts/stih407-family.dtsi          | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi   | 2 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi     | 4 ++--
 arch/arm64/boot/dts/exynos/exynos7.dtsi        | 2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 6 +++---
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 4 ++--
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi      | 2 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi   | 4 ++--
 arch/arm64/boot/dts/qcom/ipq8074.dtsi          | 4 ++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi          | 4 ++--
 arch/arm64/boot/dts/qcom/msm8998.dtsi          | 2 +-
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi       | 2 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi           | 4 ++--
 arch/arm64/boot/dts/qcom/sc7180.dtsi           | 2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi           | 4 ++--
 arch/arm64/boot/dts/qcom/sm8150.dtsi           | 2 +-
 25 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/arch/arm/boot/dts/armada-375.dtsi b/arch/arm/boot/dts/armada-375.dtsi
index 9805e507c695..7f2f24a29e6c 100644
--- a/arch/arm/boot/dts/armada-375.dtsi
+++ b/arch/arm/boot/dts/armada-375.dtsi
@@ -426,7 +426,7 @@ usb1: usb@54000 {
 				status = "disabled";
 			};
 
-			usb2: usb3@58000 {
+			usb2: usb@58000 {
 				compatible = "marvell,armada-375-xhci";
 				reg = <0x58000 0x20000>,<0x5b880 0x80>;
 				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index e3dbe4166836..ebcf8b40ea81 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -629,7 +629,7 @@ usb_dwc3 {
 			#size-cells = <1>;
 			ranges;
 
-			usbdrd_dwc3: dwc3@12000000 {
+			usbdrd_dwc3: usb@12000000 {
 				compatible = "synopsys,dwc3";
 				reg = <0x12000000 0x10000>;
 				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index 8aa5117e58ce..339243d19a80 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -148,7 +148,7 @@ usbdrd3_0: usb3-0 {
 			#size-cells = <1>;
 			ranges;
 
-			usbdrd_dwc3_0: dwc3@12000000 {
+			usbdrd_dwc3_0: usb@12000000 {
 				compatible = "snps,dwc3";
 				reg = <0x12000000 0x10000>;
 				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
@@ -170,7 +170,7 @@ usbdrd3_1: usb3-1 {
 			#size-cells = <1>;
 			ranges;
 
-			usbdrd_dwc3_1: dwc3@12400000 {
+			usbdrd_dwc3_1: usb@12400000 {
 				compatible = "snps,dwc3";
 				reg = <0x12400000 0x10000>;
 				phys = <&usbdrd_phy1 0>, <&usbdrd_phy1 1>;
diff --git a/arch/arm/boot/dts/keystone-k2e.dtsi b/arch/arm/boot/dts/keystone-k2e.dtsi
index 2d94faf31fab..d625ad10cfad 100644
--- a/arch/arm/boot/dts/keystone-k2e.dtsi
+++ b/arch/arm/boot/dts/keystone-k2e.dtsi
@@ -52,7 +52,7 @@ &soc0 {
 
 		usb: usb@2680000 {
 			interrupts = <GIC_SPI 152 IRQ_TYPE_EDGE_RISING>;
-			dwc3@2690000 {
+			usb@2690000 {
 				interrupts = <GIC_SPI 152 IRQ_TYPE_EDGE_RISING>;
 			};
 		};
@@ -78,7 +78,7 @@ keystone_usb1: usb@25000000 {
 			dma-ranges;
 			status = "disabled";
 
-			usb1: dwc3@25010000 {
+			usb1: usb@25010000 {
 				compatible = "synopsys,dwc3";
 				reg = <0x25010000 0x70000>;
 				interrupts = <GIC_SPI 414 IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
index c298675a29a5..6f9748349f09 100644
--- a/arch/arm/boot/dts/keystone.dtsi
+++ b/arch/arm/boot/dts/keystone.dtsi
@@ -217,7 +217,7 @@ keystone_usb0: usb@2680000 {
 			dma-ranges;
 			status = "disabled";
 
-			usb0: dwc3@2690000 {
+			usb0: usb@2690000 {
 				compatible = "synopsys,dwc3";
 				reg = <0x2690000 0x70000>;
 				interrupts = <GIC_SPI 393 IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 827373ef1a54..5c4104d301f1 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -874,7 +874,7 @@ usb2: usb@8600000 {
 			phy_type = "ulpi";
 		};
 
-		usb3: usb3@3100000 {
+		usb3: usb@3100000 {
 			compatible = "snps,dwc3";
 			reg = <0x0 0x3100000 0x0 0x10000>;
 			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/omap5-l4.dtsi b/arch/arm/boot/dts/omap5-l4.dtsi
index f3d3a16b7c64..887b3359dd5a 100644
--- a/arch/arm/boot/dts/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/omap5-l4.dtsi
@@ -194,7 +194,7 @@ usb3: omap_dwc3@0 {
 				#size-cells = <1>;
 				utmi-mode = <2>;
 				ranges = <0 0 0x20000>;
-				dwc3: dwc3@10000 {
+				dwc3: usb@10000 {
 					compatible = "snps,dwc3";
 					reg = <0x10000 0x10000>;
 					interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 23a1746f3baa..2352f76b5a69 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -681,7 +681,7 @@ st_dwc3: dwc3@8f94000 {
 
 			status = "disabled";
 
-			dwc3: dwc3@9900000 {
+			dwc3: usb@9900000 {
 				compatible	= "snps,dwc3";
 				reg		= <0x09900000 0x100000>;
 				interrupts	= <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 9ce78a7b117d..7d1bbff25294 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -679,7 +679,7 @@ ohci0: usb@5101400 {
 			status = "disabled";
 		};
 
-		dwc3: dwc3@5200000 {
+		dwc3: usb@5200000 {
 			compatible = "snps,dwc3";
 			reg = <0x05200000 0x10000>;
 			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 74ac4ac75865..3320e596cb3f 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1651,7 +1651,7 @@ usbdrd30: usbdrd {
 			ranges;
 			status = "disabled";
 
-			usbdrd_dwc3: dwc3@15400000 {
+			usbdrd_dwc3: usb@15400000 {
 				compatible = "snps,dwc3";
 				clocks = <&cmu_fsys CLK_SCLK_USBDRD30>,
 					<&cmu_fsys CLK_ACLK_USBDRD30>,
@@ -1704,7 +1704,7 @@ usbhost30: usbhost {
 			ranges;
 			status = "disabled";
 
-			usbhost_dwc3: dwc3@15a00000 {
+			usbhost_dwc3: usb@15a00000 {
 				compatible = "snps,dwc3";
 				clocks = <&cmu_fsys CLK_SCLK_USBHOST30>,
 					<&cmu_fsys CLK_ACLK_USBHOST30>,
diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index b9ed6a33e290..48cd3a04fd07 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -654,7 +654,7 @@ usbdrd3 {
 			#size-cells = <1>;
 			ranges;
 
-			dwc3@15400000 {
+			usb@15400000 {
 				compatible = "snps,dwc3";
 				reg = <0x15400000 0x10000>;
 				interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
index ff19ec415b60..06dac6be67e9 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
@@ -453,7 +453,7 @@ edma0: edma@2c00000 {
 				 <&clockgen 4 3>;
 		};
 
-		usb0: usb3@2f00000 {
+		usb0: usb@2f00000 {
 			compatible = "snps,dwc3";
 			reg = <0x0 0x2f00000 0x0 0x10000>;
 			interrupts = <0 60 0x4>;
@@ -474,7 +474,7 @@ sata: sata@3200000 {
 			status = "disabled";
 		};
 
-		usb1: usb2@8600000 {
+		usb1: usb@8600000 {
 			compatible = "fsl-usb2-dr-v2.5", "fsl-usb2-dr";
 			reg = <0x0 0x8600000 0x0 0x1000>;
 			interrupts = <0 139 0x4>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index 5c2e370f6316..1f45fa32e57b 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -750,7 +750,7 @@ edma0: edma@2c00000 {
 				 <&clockgen 4 0>;
 		};
 
-		usb0: usb3@2f00000 {
+		usb0: usb@2f00000 {
 			compatible = "snps,dwc3";
 			reg = <0x0 0x2f00000 0x0 0x10000>;
 			interrupts = <0 60 0x4>;
@@ -761,7 +761,7 @@ usb0: usb3@2f00000 {
 			status = "disabled";
 		};
 
-		usb1: usb3@3000000 {
+		usb1: usb@3000000 {
 			compatible = "snps,dwc3";
 			reg = <0x0 0x3000000 0x0 0x10000>;
 			interrupts = <0 61 0x4>;
@@ -772,7 +772,7 @@ usb1: usb3@3000000 {
 			status = "disabled";
 		};
 
-		usb2: usb3@3100000 {
+		usb2: usb@3100000 {
 			compatible = "snps,dwc3";
 			reg = <0x0 0x3100000 0x0 0x10000>;
 			interrupts = <0 63 0x4>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index 169f4742ae3b..96723b53a4e9 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -402,7 +402,7 @@ esdhc: esdhc@2140000 {
 			status = "disabled";
 		};
 
-		usb0: usb3@3100000 {
+		usb0: usb@3100000 {
 			compatible = "snps,dwc3";
 			reg = <0x0 0x3100000 0x0 0x10000>;
 			interrupts = <0 80 IRQ_TYPE_LEVEL_HIGH>;
@@ -413,7 +413,7 @@ usb0: usb3@3100000 {
 			status = "disabled";
 		};
 
-		usb1: usb3@3110000 {
+		usb1: usb@3110000 {
 			compatible = "snps,dwc3";
 			reg = <0x0 0x3110000 0x0 0x10000>;
 			interrupts = <0 81 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index 41102dacc2e1..d356ec2beee3 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -737,7 +737,7 @@ sata1: sata@3210000 {
 			dma-coherent;
 		};
 
-		usb0: usb3@3100000 {
+		usb0: usb@3100000 {
 			status = "disabled";
 			compatible = "snps,dwc3";
 			reg = <0x0 0x3100000 0x0 0x10000>;
@@ -748,7 +748,7 @@ usb0: usb3@3100000 {
 			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
 		};
 
-		usb1: usb3@3110000 {
+		usb1: usb@3110000 {
 			status = "disabled";
 			compatible = "snps,dwc3";
 			reg = <0x0 0x3110000 0x0 0x10000>;
diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index d25aac5e0bf8..aea3800029b5 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -1166,7 +1166,7 @@ usb_phy: usb-phy {
 			};
 		};
 
-		dwc3: dwc3@ff100000 {
+		dwc3: usb@ff100000 {
 			compatible = "snps,dwc3";
 			reg = <0x0 0xff100000 0x0 0x100000>;
 
diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index defcbd15edf9..34e97da98270 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -1064,7 +1064,7 @@ &usb2 {
 	status = "okay";
 	extcon = <&usb2_id>;
 
-	dwc3@7600000 {
+	usb@7600000 {
 		extcon = <&usb2_id>;
 		dr_mode = "otg";
 		maximum-speed = "high-speed";
@@ -1075,7 +1075,7 @@ &usb3 {
 	status = "okay";
 	extcon = <&usb3_id>;
 
-	dwc3@6a00000 {
+	usb@6a00000 {
 		extcon = <&usb3_id>;
 		dr_mode = "otg";
 	};
diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 96a5ec89b5f0..1129062a4ca1 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -427,7 +427,7 @@ usb_0: usb@8af8800 {
 			resets = <&gcc GCC_USB0_BCR>;
 			status = "disabled";
 
-			dwc_0: dwc3@8a00000 {
+			dwc_0: usb@8a00000 {
 				compatible = "snps,dwc3";
 				reg = <0x8a00000 0xcd00>;
 				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
@@ -468,7 +468,7 @@ usb_1: usb@8cf8800 {
 			resets = <&gcc GCC_USB1_BCR>;
 			status = "disabled";
 
-			dwc_1: dwc3@8c00000 {
+			dwc_1: usb@8c00000 {
 				compatible = "snps,dwc3";
 				reg = <0x8c00000 0xcd00>;
 				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 9951286db775..66b6d2f0a093 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1767,7 +1767,7 @@ usb3: usb@6af8800 {
 			power-domains = <&gcc USB30_GDSC>;
 			status = "disabled";
 
-			dwc3@6a00000 {
+			usb@6a00000 {
 				compatible = "snps,dwc3";
 				reg = <0x06a00000 0xcc00>;
 				interrupts = <0 131 IRQ_TYPE_LEVEL_HIGH>;
@@ -1978,7 +1978,7 @@ usb2: usb@76f8800 {
 			power-domains = <&gcc USB30_GDSC>;
 			status = "disabled";
 
-			dwc3@7600000 {
+			usb@7600000 {
 				compatible = "snps,dwc3";
 				reg = <0x07600000 0xcc00>;
 				interrupts = <0 138 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index c45870600909..7cc7897e7b83 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1678,7 +1678,7 @@ usb3: usb@a8f8800 {
 
 			resets = <&gcc GCC_USB_30_BCR>;
 
-			usb3_dwc3: dwc3@a800000 {
+			usb3_dwc3: usb@a800000 {
 				compatible = "snps,dwc3";
 				reg = <0x0a800000 0xcd00>;
 				interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 6422cf9d5855..88d7b7a53743 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -337,7 +337,7 @@ &usb2_phy_sec {
 &usb3 {
 	status = "okay";
 
-	dwc3@7580000 {
+	usb@7580000 {
 		dr_mode = "host";
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index b654b802e95c..f6ef17553064 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -544,7 +544,7 @@ usb3: usb@7678800 {
 			assigned-clock-rates = <19200000>, <200000000>;
 			status = "disabled";
 
-			dwc3@7580000 {
+			usb@7580000 {
 				compatible = "snps,dwc3";
 				reg = <0x07580000 0xcd00>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
@@ -573,7 +573,7 @@ usb2: usb@79b8800 {
 			assigned-clock-rates = <19200000>, <133333333>;
 			status = "disabled";
 
-			dwc3@78c0000 {
+			usb@78c0000 {
 				compatible = "snps,dwc3";
 				reg = <0x078c0000 0xcc00>;
 				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index d46b3833e52f..bbc9a2b5c570 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2673,7 +2673,7 @@ usb_1: usb@a6f8800 {
 					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_USB3>;
 			interconnect-names = "usb-ddr", "apps-usb";
 
-			usb_1_dwc3: dwc3@a600000 {
+			usb_1_dwc3: usb@a600000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a600000 0 0xe000>;
 				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 2884577dcb77..ca20e4e91f61 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3573,7 +3573,7 @@ usb_1: usb@a6f8800 {
 					<&gladiator_noc MASTER_APPSS_PROC &config_noc SLAVE_USB3_0>;
 			interconnect-names = "usb-ddr", "apps-usb";
 
-			usb_1_dwc3: dwc3@a600000 {
+			usb_1_dwc3: usb@a600000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a600000 0 0xcd00>;
 				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
@@ -3621,7 +3621,7 @@ usb_2: usb@a8f8800 {
 					<&gladiator_noc MASTER_APPSS_PROC &config_noc SLAVE_USB3_1>;
 			interconnect-names = "usb-ddr", "apps-usb";
 
-			usb_2_dwc3: dwc3@a800000 {
+			usb_2_dwc3: usb@a800000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a800000 0 0xcd00>;
 				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index b86a7ead3006..167d14dda974 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -846,7 +846,7 @@ usb_1: usb@a6f8800 {
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
-			usb_1_dwc3: dwc3@a600000 {
+			usb_1_dwc3: usb@a600000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a600000 0 0xcd00>;
 				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.27.0

