Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE71628E866
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 23:29:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBQXt6vkGzDr6K
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 08:29:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baikalelectronics.ru (client-ip=94.125.187.42;
 helo=mail.baikalelectronics.ru;
 envelope-from=sergey.semin@baikalelectronics.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=baikalelectronics.ru
Received: from mail.baikalelectronics.ru (unknown [94.125.187.42])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CBFz30GlYzDqlZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 02:03:10 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 797A6803202B;
 Wed, 14 Oct 2020 10:14:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wEC0Wp42eOrV; Wed, 14 Oct 2020 13:14:06 +0300 (MSK)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>
Subject: [PATCH 01/20] dt-bindings: usb: usb-hcd: Convert generic USB
 properties to DT schema
Date: Wed, 14 Oct 2020 13:13:43 +0300
Message-ID: <20201014101402.18271-2-Sergey.Semin@baikalelectronics.ru>
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

The generic USB HCD properties have been described in the legacy bindings
text file: Documentation/devicetree/bindings/usb/generic.txt . Let's
convert it' content into the USB HCD DT schema properties so all USB DT
nodes would be validated to have them properly utilized.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Changelog v2:
- Discard '|' in all the new properties, since we don't need to preserve
  the text formatting.
- Convert abbreviated form of the "maximum-speed" enum restriction into
  the multi-lined version of the list.
- Drop quotes from around the string constants.
---
 .../devicetree/bindings/usb/generic.txt       | 57 ------------
 .../devicetree/bindings/usb/usb-hcd.yaml      | 88 +++++++++++++++++++
 2 files changed, 88 insertions(+), 57 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/generic.txt

diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
deleted file mode 100644
index ba472e7aefc9..000000000000
--- a/Documentation/devicetree/bindings/usb/generic.txt
+++ /dev/null
@@ -1,57 +0,0 @@
-Generic USB Properties
-
-Optional properties:
- - maximum-speed: tells USB controllers we want to work up to a certain
-			speed. Valid arguments are "super-speed-plus",
-			"super-speed", "high-speed", "full-speed" and
-			"low-speed". In case this isn't passed via DT, USB
-			controllers should default to their maximum HW
-			capability.
- - dr_mode: tells Dual-Role USB controllers that we want to work on a
-			particular mode. Valid arguments are "host",
-			"peripheral" and "otg". In case this attribute isn't
-			passed via DT, USB DRD controllers should default to
-			OTG.
- - phy_type: tells USB controllers that we want to configure the core to support
-			a UTMI+ PHY with an 8- or 16-bit interface if UTMI+ is
-			selected. Valid arguments are "utmi" and "utmi_wide".
-			In case this isn't passed via DT, USB controllers should
-			default to HW capability.
- - otg-rev: tells usb driver the release number of the OTG and EH supplement
-			with which the device and its descriptors are compliant,
-			in binary-coded decimal (i.e. 2.0 is 0200H). This
-			property is used if any real OTG features(HNP/SRP/ADP)
-			is enabled, if ADP is required, otg-rev should be
-			0x0200 or above.
- - companion: phandle of a companion
- - hnp-disable: tells OTG controllers we want to disable OTG HNP, normally HNP
-			is the basic function of real OTG except you want it
-			to be a srp-capable only B device.
- - srp-disable: tells OTG controllers we want to disable OTG SRP, SRP is
-			optional for OTG device.
- - adp-disable: tells OTG controllers we want to disable OTG ADP, ADP is
-			optional for OTG device.
- - usb-role-switch: boolean, indicates that the device is capable of assigning
-			the USB data role (USB host or USB device) for a given
-			USB connector, such as Type-C, Type-B(micro).
-			see connector/usb-connector.yaml.
- - role-switch-default-mode: indicating if usb-role-switch is enabled, the
-			device default operation mode of controller while usb
-			role is USB_ROLE_NONE. Valid arguments are "host" and
-			"peripheral". Defaults to "peripheral" if not
-			specified.
-
-
-This is an attribute to a USB controller such as:
-
-dwc3@4a030000 {
-	compatible = "synopsys,dwc3";
-	reg = <0x4a030000 0xcfff>;
-	interrupts = <0 92 4>
-	usb-phy = <&usb2_phy>, <&usb3,phy>;
-	maximum-speed = "super-speed";
-	dr_mode = "otg";
-	phy_type = "utmi_wide";
-	otg-rev = <0x0200>;
-	adp-disable;
-};
diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
index 7263b7f2b510..ee7ea205c71d 100644
--- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
@@ -22,9 +22,97 @@ properties:
     description:
       Name specifier for the USB PHY
 
+  maximum-speed:
+   description:
+     Tells USB controllers we want to work up to a certain speed. In case this
+     isn't passed via DT, USB controllers should default to their maximum HW
+     capability.
+   $ref: /schemas/types.yaml#/definitions/string
+   enum:
+     - low-speed
+     - full-speed
+     - high-speed
+     - super-speed
+     - super-speed-plus
+
+  dr_mode:
+    description:
+      Tells Dual-Role USB controllers that we want to work on a particular
+      mode. In case this attribute isn't passed via DT, USB DRD controllers
+      should default to OTG.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [host, peripheral, otg]
+
+  phy_type:
+    description:
+      Tells USB controllers that we want to configure the core to support a
+      UTMI+ PHY with an 8- or 16-bit interface if UTMI+ is selected. In case
+      this isn't passed via DT, USB controllers should default to HW
+      capability.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [utmi, utmi_wide]
+
+  otg-rev:
+    description:
+      Tells usb driver the release number of the OTG and EH supplement with
+      which the device and its descriptors are compliant, in binary-coded
+      decimal (i.e. 2.0 is 0200H). This property is used if any real OTG
+      features (HNP/SRP/ADP) is enabled. If ADP is required, otg-rev should be
+      0x0200 or above.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  companion:
+    description: Phandle of a companion device
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  hnp-disable:
+    description:
+      Tells OTG controllers we want to disable OTG HNP. Normally HNP is the
+      basic function of real OTG except you want it to be a srp-capable only B
+      device.
+    type: boolean
+
+  srp-disable:
+    description:
+      Tells OTG controllers we want to disable OTG SRP. SRP is optional for OTG
+      device.
+    type: boolean
+
+  adp-disable:
+    description:
+      Tells OTG controllers we want to disable OTG ADP. ADP is optional for OTG
+      device.
+    type: boolean
+
+  usb-role-switch:
+    description:
+      Indicates that the device is capable of assigning the USB data role
+      (USB host or USB device) for a given USB connector, such as Type-C,
+      Type-B(micro). See connector/usb-connector.yaml.
+
+  role-switch-default-mode:
+    description:
+      Indicates if usb-role-switch is enabled, the device default operation
+      mode of controller while usb role is USB_ROLE_NONE.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [host, peripheral]
+    default: peripheral
+
 examples:
   - |
     usb {
         phys = <&usb2_phy1>, <&usb3_phy1>;
         phy-names = "usb";
     };
+  - |
+    usb@4a030000 {
+        compatible = "snps,dwc3";
+        reg = <0x4a030000 0xcfff>;
+        interrupts = <0 92 4>;
+        usb-phy = <&usb2_phy>, <&usb3_phy>;
+        maximum-speed = "super-speed";
+        dr_mode = "otg";
+        phy_type = "utmi_wide";
+        otg-rev = <0x0200>;
+        adp-disable;
+    };
-- 
2.27.0

