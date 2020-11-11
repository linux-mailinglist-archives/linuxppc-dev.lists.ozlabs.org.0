Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E582AED35
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 10:17:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWJyq3clszDqFH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 20:17:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baikalelectronics.ru (client-ip=94.125.187.42;
 helo=mail.baikalelectronics.ru;
 envelope-from=sergey.semin@baikalelectronics.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=baikalelectronics.ru
Received: from mail.baikalelectronics.ru (ns2.baikalelectronics.com
 [94.125.187.42])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CWJng4Y40zDqM0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 20:09:09 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 8B0B98030171;
 Wed, 11 Nov 2020 09:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TZS9AUp4z0AJ; Wed, 11 Nov 2020 12:09:03 +0300 (MSK)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 01/18] dt-bindings: usb: usb-hcd: Detach generic USB
 controller properties
Date: Wed, 11 Nov 2020 12:08:36 +0300
Message-ID: <20201111090853.14112-2-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
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
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Manu Gautam <mgautam@codeaurora.org>, Andy Gross <agross@kernel.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There can be three distinctive types of the USB controllers: USB hosts,
USB peripherals/gadgets and USB OTG, which can switch from one role to
another. In order to have that hierarchy handled in the DT binding files,
we need to collect common properties in a common DT schema and specific
properties in dedicated schemas. Seeing the usb-hcd.yaml DT schema is
dedicated for the USB host controllers only, let's move some common
properties from there into the usb.yaml schema. So the later would be
available to evaluate all currently supported types of the USB
controllers.

While at it add an explicit "additionalProperties: true" into the
usb-hcd.yaml as setting the additionalProperties/unevaluateProperties
properties is going to be get mandatory soon.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Changelog v4:
- This is a new patch created as a result of the comment left
  by Chunfeng Yun in v3
---
 .../devicetree/bindings/usb/usb-hcd.yaml      | 14 ++-------
 .../devicetree/bindings/usb/usb.yaml          | 29 +++++++++++++++++++
 2 files changed, 32 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/usb.yaml

diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
index 7263b7f2b510..81f3ad1419d8 100644
--- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
@@ -9,18 +9,10 @@ title: Generic USB Host Controller Device Tree Bindings
 maintainers:
   - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 
-properties:
-  $nodename:
-    pattern: "^usb(@.*)?"
+allOf:
+  - $ref: usb.yaml#
 
-  phys:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    description:
-      List of all the USB PHYs on this HCD
-
-  phy-names:
-    description:
-      Name specifier for the USB PHY
+additionalProperties: true
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/usb/usb.yaml b/Documentation/devicetree/bindings/usb/usb.yaml
new file mode 100644
index 000000000000..941ad59fbac5
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/usb.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/usb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic USB Controller Device Tree Bindings
+
+maintainers:
+  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+select: false
+
+properties:
+  $nodename:
+    pattern: "^usb(@.*)?"
+
+  phys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      List of all the USB PHYs on this HCD
+
+  phy-names:
+    description:
+      Name specifier for the USB PHY
+
+additionalProperties: true
+
+...
-- 
2.28.0

