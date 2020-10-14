Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D72828E832
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 23:05:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBQ0X3SlLzDr27
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 08:05:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baikalelectronics.ru (client-ip=94.125.187.42;
 helo=mail.baikalelectronics.ru;
 envelope-from=sergey.semin@baikalelectronics.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=baikalelectronics.ru
Received: from mail.baikalelectronics.ru (ns2.baikalelectronics.ru
 [94.125.187.42])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CBDQL1Cg3zDqnV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 00:53:12 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id EA7D780057A8;
 Wed, 14 Oct 2020 10:14:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vflJAOCZxAbc; Wed, 14 Oct 2020 13:14:21 +0300 (MSK)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta
 <vgupta@synopsys.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 <bcm-kernel-feedback-list@broadcom.com>, Wei Xu <xuwei5@hisilicon.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Paul
 Cercueil <paul@crapouillou.net>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: [PATCH 18/20] arch: dts: Fix EHCI/OHCI DT nodes name
Date: Wed, 14 Oct 2020 13:14:00 +0300
Message-ID: <20201014101402.18271-19-Sergey.Semin@baikalelectronics.ru>
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
Cc: devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-mips@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Manu Gautam <mgautam@codeaurora.org>, Andy Gross <agross@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In accordance with the Generic EHCI/OHCI bindings the corresponding node
name is suppose to comply with the Generic USB HCD DT schema, which
requires the USB nodes to have the name acceptable by the regexp:
"^usb(@.*)?" . Let's fix the DTS files, which have the nodes defined with
incompatible names.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Please, test the patch out to make sure it doesn't brake the dependent DTS
files. I did only a manual grepping of the possible nodes dependencies.
---
 arch/arc/boot/dts/axs10x_mb.dtsi               | 4 ++--
 arch/arc/boot/dts/hsdk.dts                     | 4 ++--
 arch/arc/boot/dts/vdk_axs10x_mb.dtsi           | 2 +-
 arch/arm/boot/dts/bcm5301x.dtsi                | 4 ++--
 arch/arm/boot/dts/bcm53573.dtsi                | 4 ++--
 arch/arm/boot/dts/hisi-x5hd2.dtsi              | 4 ++--
 arch/arm/boot/dts/lpc18xx.dtsi                 | 4 ++--
 arch/arm/boot/dts/stm32mp151.dtsi              | 4 ++--
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 4 ++--
 arch/arm64/boot/dts/hisilicon/hip06.dtsi       | 4 ++--
 arch/arm64/boot/dts/hisilicon/hip07.dtsi       | 4 ++--
 arch/mips/boot/dts/ingenic/jz4740.dtsi         | 2 +-
 arch/mips/boot/dts/ingenic/jz4770.dtsi         | 2 +-
 arch/mips/boot/dts/mti/sead3.dts               | 2 +-
 arch/mips/boot/dts/ralink/mt7628a.dtsi         | 2 +-
 arch/powerpc/boot/dts/akebono.dts              | 6 +++---
 16 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index 99d3e7175bf7..b64435385304 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -87,13 +87,13 @@ gmac: ethernet@18000 {
 			mac-address = [00 00 00 00 00 00]; /* Filled in by U-Boot */
 		};
 
-		ehci@40000 {
+		usb@40000 {
 			compatible = "generic-ehci";
 			reg = < 0x40000 0x100 >;
 			interrupts = < 8 >;
 		};
 
-		ohci@60000 {
+		usb@60000 {
 			compatible = "generic-ohci";
 			reg = < 0x60000 0x100 >;
 			interrupts = < 8 >;
diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index dcaa44e408ac..fdd4f7f635d3 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -234,7 +234,7 @@ phy0: ethernet-phy@0 { /* Micrel KSZ9031 */
 			};
 		};
 
-		ohci@60000 {
+		usb@60000 {
 			compatible = "snps,hsdk-v1.0-ohci", "generic-ohci";
 			reg = <0x60000 0x100>;
 			interrupts = <15>;
@@ -242,7 +242,7 @@ ohci@60000 {
 			dma-coherent;
 		};
 
-		ehci@40000 {
+		usb@40000 {
 			compatible = "snps,hsdk-v1.0-ehci", "generic-ehci";
 			reg = <0x40000 0x100>;
 			interrupts = <15>;
diff --git a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
index cbb179770293..90a412026e64 100644
--- a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
@@ -46,7 +46,7 @@ ethernet@18000 {
 			clock-names = "stmmaceth";
 		};
 
-		ehci@40000 {
+		usb@40000 {
 			compatible = "generic-ehci";
 			reg = < 0x40000 0x100 >;
 			interrupts = < 8 >;
diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
index 0016720ce530..bf5656d79a55 100644
--- a/arch/arm/boot/dts/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/bcm5301x.dtsi
@@ -261,7 +261,7 @@ usb2: usb2@21000 {
 
 			interrupt-parent = <&gic>;
 
-			ehci: ehci@21000 {
+			ehci: usb@21000 {
 				#usb-cells = <0>;
 
 				compatible = "generic-ehci";
@@ -283,7 +283,7 @@ ehci_port2: port@2 {
 				};
 			};
 
-			ohci: ohci@22000 {
+			ohci: usb@22000 {
 				#usb-cells = <0>;
 
 				compatible = "generic-ohci";
diff --git a/arch/arm/boot/dts/bcm53573.dtsi b/arch/arm/boot/dts/bcm53573.dtsi
index 4af8e3293cff..51546fccc616 100644
--- a/arch/arm/boot/dts/bcm53573.dtsi
+++ b/arch/arm/boot/dts/bcm53573.dtsi
@@ -135,7 +135,7 @@ usb2: usb2@4000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			ehci: ehci@4000 {
+			ehci: usb@4000 {
 				compatible = "generic-ehci";
 				reg = <0x4000 0x1000>;
 				interrupt-parent = <&gic>;
@@ -155,7 +155,7 @@ ehci_port2: port@2 {
 				};
 			};
 
-			ohci: ohci@d000 {
+			ohci: usb@d000 {
 				#usb-cells = <0>;
 
 				compatible = "generic-ohci";
diff --git a/arch/arm/boot/dts/hisi-x5hd2.dtsi b/arch/arm/boot/dts/hisi-x5hd2.dtsi
index 3ee7967c202d..693b85b2cc7d 100644
--- a/arch/arm/boot/dts/hisi-x5hd2.dtsi
+++ b/arch/arm/boot/dts/hisi-x5hd2.dtsi
@@ -452,14 +452,14 @@ gmac1: ethernet@1841000 {
 			status = "disabled";
 		};
 
-		usb0: ehci@1890000 {
+		usb0: usb@1890000 {
 			compatible = "generic-ehci";
 			reg = <0x1890000 0x1000>;
 			interrupts = <0 66 4>;
 			clocks = <&clock HIX5HD2_USB_CLK>;
 		};
 
-		usb1: ohci@1880000 {
+		usb1: usb@1880000 {
 			compatible = "generic-ohci";
 			reg = <0x1880000 0x1000>;
 			interrupts = <0 67 4>;
diff --git a/arch/arm/boot/dts/lpc18xx.dtsi b/arch/arm/boot/dts/lpc18xx.dtsi
index 10b8249b8ab6..82ffd7b0ad8a 100644
--- a/arch/arm/boot/dts/lpc18xx.dtsi
+++ b/arch/arm/boot/dts/lpc18xx.dtsi
@@ -121,7 +121,7 @@ mmcsd: mmcsd@40004000 {
 			status = "disabled";
 		};
 
-		usb0: ehci@40006100 {
+		usb0: usb@40006100 {
 			compatible = "nxp,lpc1850-ehci", "generic-ehci";
 			reg = <0x40006100 0x100>;
 			interrupts = <8>;
@@ -133,7 +133,7 @@ usb0: ehci@40006100 {
 			status = "disabled";
 		};
 
-		usb1: ehci@40007100 {
+		usb1: usb@40007100 {
 			compatible = "nxp,lpc1850-ehci", "generic-ehci";
 			reg = <0x40007100 0x100>;
 			interrupts = <9>;
diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index bfe29023fbd5..576f7da564c5 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1404,7 +1404,7 @@ ethernet0: ethernet@5800a000 {
 			status = "disabled";
 		};
 
-		usbh_ohci: usbh-ohci@5800c000 {
+		usbh_ohci: usb@5800c000 {
 			compatible = "generic-ohci";
 			reg = <0x5800c000 0x1000>;
 			clocks = <&rcc USBH>;
@@ -1413,7 +1413,7 @@ usbh_ohci: usbh-ohci@5800c000 {
 			status = "disabled";
 		};
 
-		usbh_ehci: usbh-ehci@5800d000 {
+		usbh_ehci: usb@5800d000 {
 			compatible = "generic-ehci";
 			reg = <0x5800d000 0x1000>;
 			clocks = <&rcc USBH>;
diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
index 12bc1d3ed424..a4acecb75c89 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
@@ -585,7 +585,7 @@ pcie: pcie@9860000 {
 			status = "disabled";
 		};
 
-		ohci: ohci@9880000 {
+		ohci: usb@9880000 {
 			compatible = "generic-ohci";
 			reg = <0x9880000 0x10000>;
 			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
@@ -600,7 +600,7 @@ ohci: ohci@9880000 {
 			status = "disabled";
 		};
 
-		ehci: ehci@9890000 {
+		ehci: usb@9890000 {
 			compatible = "generic-ehci";
 			reg = <0x9890000 0x10000>;
 			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/hisilicon/hip06.dtsi b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
index 50ceaa959bdc..1226440d54ad 100644
--- a/arch/arm64/boot/dts/hisilicon/hip06.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
@@ -373,7 +373,7 @@ refclk: refclk {
 			#clock-cells = <0>;
 		};
 
-		usb_ohci: ohci@a7030000 {
+		usb_ohci: usb@a7030000 {
 			compatible = "generic-ohci";
 			reg = <0x0 0xa7030000 0x0 0x10000>;
 			interrupt-parent = <&mbigen_usb>;
@@ -382,7 +382,7 @@ usb_ohci: ohci@a7030000 {
 			status = "disabled";
 		};
 
-		usb_ehci: ehci@a7020000 {
+		usb_ehci: usb@a7020000 {
 			compatible = "generic-ehci";
 			reg = <0x0 0xa7020000 0x0 0x10000>;
 			interrupt-parent = <&mbigen_usb>;
diff --git a/arch/arm64/boot/dts/hisilicon/hip07.dtsi b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
index 4773a533fce5..93f99a5255ac 100644
--- a/arch/arm64/boot/dts/hisilicon/hip07.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
@@ -1253,7 +1253,7 @@ uart0: uart@602b0000 {
 			status = "disabled";
 		};
 
-		usb_ohci: ohci@a7030000 {
+		usb_ohci: usb@a7030000 {
 			compatible = "generic-ohci";
 			reg = <0x0 0xa7030000 0x0 0x10000>;
 			interrupt-parent = <&mbigen_usb>;
@@ -1262,7 +1262,7 @@ usb_ohci: ohci@a7030000 {
 			status = "disabled";
 		};
 
-		usb_ehci: ehci@a7020000 {
+		usb_ehci: usb@a7020000 {
 			compatible = "generic-ehci";
 			reg = <0x0 0xa7020000 0x0 0x10000>;
 			interrupt-parent = <&mbigen_usb>;
diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
index 1520585c235c..b989ff62ffbc 100644
--- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -281,7 +281,7 @@ dmac: dma-controller@13020000 {
 		clocks = <&cgu JZ4740_CLK_DMA>;
 	};
 
-	uhc: uhc@13030000 {
+	uhc: usb@13030000 {
 		compatible = "ingenic,jz4740-ohci", "generic-ohci";
 		reg = <0x13030000 0x1000>;
 
diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi b/arch/mips/boot/dts/ingenic/jz4770.dtsi
index fa11ac950499..e45c03038826 100644
--- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
@@ -417,7 +417,7 @@ dmac1: dma-controller@13420100 {
 		interrupts = <23>;
 	};
 
-	uhc: uhc@13430000 {
+	uhc: usb@13430000 {
 		compatible = "generic-ohci";
 		reg = <0x13430000 0x1000>;
 
diff --git a/arch/mips/boot/dts/mti/sead3.dts b/arch/mips/boot/dts/mti/sead3.dts
index 192c26ff1d3d..1cf6728af8fe 100644
--- a/arch/mips/boot/dts/mti/sead3.dts
+++ b/arch/mips/boot/dts/mti/sead3.dts
@@ -56,7 +56,7 @@ gic: interrupt-controller@1b1c0000 {
 		interrupt-parent = <&cpu_intc>;
 	};
 
-	ehci@1b200000 {
+	usb@1b200000 {
 		compatible = "generic-ehci";
 		reg = <0x1b200000 0x1000>;
 
diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
index 892e8ab863c5..45bf96a3d17a 100644
--- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
@@ -275,7 +275,7 @@ usb_phy: usb-phy@10120000 {
 		reset-names = "host", "device";
 	};
 
-	ehci@101c0000 {
+	usb@101c0000 {
 		compatible = "generic-ehci";
 		reg = <0x101c0000 0x1000>;
 
diff --git a/arch/powerpc/boot/dts/akebono.dts b/arch/powerpc/boot/dts/akebono.dts
index df18f8dc4642..343326c30380 100644
--- a/arch/powerpc/boot/dts/akebono.dts
+++ b/arch/powerpc/boot/dts/akebono.dts
@@ -126,7 +126,7 @@ SATA0: sata@30000010000 {
 			interrupts = <93 2>;
 		};
 
-		EHCI0: ehci@30010000000 {
+		EHCI0: usb@30010000000 {
 			compatible = "ibm,476gtr-ehci", "generic-ehci";
 			reg = <0x300 0x10000000 0x0 0x10000>;
 			interrupt-parent = <&MPIC>;
@@ -140,14 +140,14 @@ SD0: sd@30000000000 {
 			interrupt-parent = <&MPIC>;
 		};
 
-		OHCI0: ohci@30010010000 {
+		OHCI0: usb@30010010000 {
 			compatible = "ibm,476gtr-ohci", "generic-ohci";
 			reg = <0x300 0x10010000 0x0 0x10000>;
 			interrupt-parent = <&MPIC>;
 			interrupts = <89 1>;
 			};
 
-		OHCI1: ohci@30010020000 {
+		OHCI1: usb@30010020000 {
 			compatible = "ibm,476gtr-ohci", "generic-ohci";
 			reg = <0x300 0x10020000 0x0 0x10000>;
 			interrupt-parent = <&MPIC>;
-- 
2.27.0

