Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFBD28E825
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 22:57:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBPqK6PlczDqF1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 07:57:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baikalelectronics.ru (client-ip=94.125.187.42;
 helo=mail.baikalelectronics.ru;
 envelope-from=sergey.semin@baikalelectronics.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=baikalelectronics.ru
Received: from mail.baikalelectronics.ru (mx.baikalelectronics.com
 [94.125.187.42])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CBDQJ5mQwzDqlY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 00:53:12 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 01B0C8001644;
 Wed, 14 Oct 2020 10:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jpfF5XwOlk8x; Wed, 14 Oct 2020 13:14:09 +0300 (MSK)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>
Subject: [PATCH 06/20] dt-bindings: usb: Convert xHCI bindings to DT schema
Date: Wed, 14 Oct 2020 13:13:48 +0300
Message-ID: <20201014101402.18271-7-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-Mailman-Approved-At: Thu, 15 Oct 2020 07:49:48 +1100
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

Currently the DT bindings of Generic xHCI Controllers are described by means
of the legacy text file. Since such format is deprecated in favor of the
DT schema, let's convert the Generic xHCI Controllers bindings file to the
corresponding yaml files. There will be two of them: a DT schema for the
xHCI controllers on a generic platform and a DT schema validating a generic
xHCI controllers properties. The later will be used to validate the xHCI
controllers, which aside from some vendor-specific features support the
basic xHCI functionality.

An xHCI-compatible DT node shall support the standard USB HCD properties
and custom ones like: usb2-lpm-disable, usb3-lpm-capable,
quirk-broken-port-ped and imod-interval-ns. In addition if a generic xHCI
controller is being validated against the DT schema it is also supposed to
be equipped with mandatory compatible string, single registers range,
single interrupts source, and is supposed to optionally contain up to two
reference clocks for the controller core and CSRs.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Changelog v2:
- Add explicit "additionalProperties: true" to the usb-xhci.yaml schema,
  since additionalProperties/unevaluatedProperties are going to be mandary
  for each binding.
---
 .../devicetree/bindings/usb/generic-xhci.yaml | 63 +++++++++++++++++++
 .../devicetree/bindings/usb/usb-xhci.txt      | 41 ------------
 .../devicetree/bindings/usb/usb-xhci.yaml     | 42 +++++++++++++
 3 files changed, 105 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/generic-xhci.yaml
 delete mode 100644 Documentation/devicetree/bindings/usb/usb-xhci.txt
 create mode 100644 Documentation/devicetree/bindings/usb/usb-xhci.yaml

diff --git a/Documentation/devicetree/bindings/usb/generic-xhci.yaml b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
new file mode 100644
index 000000000000..1ea1d49a8175
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: USB xHCI Controller Device Tree Bindings
+
+maintainers:
+  - Mathias Nyman <mathias.nyman@intel.com>
+
+allOf:
+  - $ref: "usb-xhci.yaml#"
+
+properties:
+  compatible:
+    oneOf:
+      - description: Generic xHCI device
+        const: generic-xhci
+      - description: Armada 37xx/375/38x/8k SoCs
+        items:
+          - enum:
+              - marvell,armada3700-xhci
+              - marvell,armada-375-xhci
+              - marvell,armada-380-xhci
+              - marvell,armada-8k-xhci
+          - const: generic-xhci
+      - description: Broadcom STB SoCs with xHCI
+        const: brcm,bcm7445-xhci
+      - description: Generic xHCI device
+        const: xhci-platform
+        deprecated: true
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: reg
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    usb@f0931000 {
+      compatible = "generic-xhci";
+      reg = <0xf0931000 0x8c8>;
+      interrupts = <0x0 0x4e 0x0>;
+    };
diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
deleted file mode 100644
index 0c5cff84a969..000000000000
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-USB xHCI controllers
-
-Required properties:
-  - compatible: should be one or more of
-
-    - "generic-xhci" for generic XHCI device
-    - "marvell,armada3700-xhci" for Armada 37xx SoCs
-    - "marvell,armada-375-xhci" for Armada 375 SoCs
-    - "marvell,armada-380-xhci" for Armada 38x SoCs
-    - "brcm,bcm7445-xhci" for Broadcom STB SoCs with XHCI
-    - "xhci-platform" (deprecated)
-
-    When compatible with the generic version, nodes must list the
-    SoC-specific version corresponding to the platform first
-    followed by the generic version.
-
-  - reg: should contain address and length of the standard XHCI
-    register set for the device.
-  - interrupts: one XHCI interrupt should be described here.
-
-Optional properties:
-  - clocks: reference to the clocks
-  - clock-names: mandatory if there is a second clock, in this case
-    the name must be "core" for the first clock and "reg" for the
-    second one
-  - usb2-lpm-disable: indicate if we don't want to enable USB2 HW LPM
-  - usb3-lpm-capable: determines if platform is USB3 LPM capable
-  - quirk-broken-port-ped: set if the controller has broken port disable mechanism
-  - imod-interval-ns: default interrupt moderation interval is 5000ns
-  - phys : see usb-hcd.yaml in the current directory
-
-additionally the properties from usb-hcd.yaml (in the current directory) are
-supported.
-
-
-Example:
-	usb@f0931000 {
-		compatible = "generic-xhci";
-		reg = <0xf0931000 0x8c8>;
-		interrupts = <0x0 0x4e 0x0>;
-	};
diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
new file mode 100644
index 000000000000..965f87fef702
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/usb-xhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic USB xHCI Controller Device Tree Bindings
+
+maintainers:
+  - Mathias Nyman <mathias.nyman@intel.com>
+
+allOf:
+  - $ref: "usb-hcd.yaml#"
+
+properties:
+  usb2-lpm-disable:
+    description: Indicates if we don't want to enable USB2 HW LPM
+    type: boolean
+
+  usb3-lpm-capable:
+    description: Determines if platform is USB3 LPM capable
+    type: boolean
+
+  quirk-broken-port-ped:
+    description: Set if the controller has broken port disable mechanism
+    type: boolean
+
+  imod-interval-ns:
+    description: Interrupt moderation interval
+    default: 5000
+
+additionalProperties: true
+
+examples:
+  - |
+    usb@f0930000 {
+      compatible = "generic-xhci";
+      reg = <0xf0930000 0x8c8>;
+      interrupts = <0x0 0x4e 0x0>;
+      usb2-lpm-disable;
+      usb3-lpm-capable;
+    };
-- 
2.27.0

