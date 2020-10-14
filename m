Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3CD28E834
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 23:08:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBQ4C1hzDzDr5s
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 08:08:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baikalelectronics.ru (client-ip=94.125.187.42;
 helo=mail.baikalelectronics.ru;
 envelope-from=sergey.semin@baikalelectronics.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=baikalelectronics.ru
Received: from mail.baikalelectronics.ru (ns2.chip.baikal.ru [94.125.187.42])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CBDQL3QwdzDqpH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 00:53:14 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 049E68002547;
 Wed, 14 Oct 2020 10:14:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GqeoHrezw9FX; Wed, 14 Oct 2020 13:14:21 +0300 (MSK)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 <bcm-kernel-feedback-list@broadcom.com>, Jason Cooper <jason@lakedaemon.net>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH 19/20] arch: dts: Fix xHCI DT nodes name
Date: Wed, 14 Oct 2020 13:14:01 +0300
Message-ID: <20201014101402.18271-20-Sergey.Semin@baikalelectronics.ru>
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
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In accordance with the Generic xHCI bindings the corresponding node name
is suppose to comply with the Generic USB HCD DT schema, which requires
the USB nodes to have the name acceptable by the regexp: "^usb(@.*)?" .
Let's fix the DTS files, which have the xHCI-nodes defined with
incompatible names.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Please, test the patch out to make sure it doesn't brake the dependent DTS
files. I did only a manual grepping of the possible nodes dependencies.
---
 arch/arm/boot/dts/bcm5301x.dtsi               | 2 +-
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
index bf5656d79a55..cf89a44673c5 100644
--- a/arch/arm/boot/dts/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/bcm5301x.dtsi
@@ -314,7 +314,7 @@ usb3: usb3@23000 {
 
 			interrupt-parent = <&gic>;
 
-			xhci: xhci@23000 {
+			xhci: usb@23000 {
 				#usb-cells = <0>;
 
 				compatible = "generic-xhci";
diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
index 9dcf16beabf5..1e37ae181acf 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
@@ -275,7 +275,7 @@ CP11X_LABEL(thermal): thermal-sensor@70 {
 			};
 		};
 
-		CP11X_LABEL(usb3_0): usb3@500000 {
+		CP11X_LABEL(usb3_0): usb@500000 {
 			compatible = "marvell,armada-8k-xhci",
 			"generic-xhci";
 			reg = <0x500000 0x4000>;
@@ -287,7 +287,7 @@ CP11X_LABEL(usb3_0): usb3@500000 {
 			status = "disabled";
 		};
 
-		CP11X_LABEL(usb3_1): usb3@510000 {
+		CP11X_LABEL(usb3_1): usb@510000 {
 			compatible = "marvell,armada-8k-xhci",
 			"generic-xhci";
 			reg = <0x510000 0x4000>;
-- 
2.27.0

