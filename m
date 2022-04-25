Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB3F50E293
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 16:03:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kn6D91y1sz3brY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 00:03:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=EqpkE5Ht;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=176.9.125.105; helo=ssl.serverraum.org;
 envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=EqpkE5Ht; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kn6CV62TFz2yb6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 00:02:29 +1000 (AEST)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 146A022246;
 Mon, 25 Apr 2022 16:02:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1650895343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=jp57dIVExTBYOFH5u8qjTvs5w4CxGPSFpn5RQoFRCE4=;
 b=EqpkE5HtM8/VXMFbhvVPoirUhwzWMTMJAT1wrhnc+6NoVMyPk5q1oco/cfXkezkRWYofRy
 J7/TGBZna99K2MQqUFAasg+ZN9STod4oo4gGfA/aQktce/B1nosGgGw0h/SyrLXJj0ZnaA
 8cnWQHai0YuG9B2H4GaUPUljfIYxTQQ=
From: Michael Walle <michael@walle.cc>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: interrupt-controller: fsl,
 ls-extirq: convert to YAML
Date: Mon, 25 Apr 2022 16:02:13 +0200
Message-Id: <20220425140214.32448-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Michael Walle <michael@walle.cc>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Convert the fsl,ls-extirq binding to the new YAML format.

In contrast to the original binding documentation, there are three
compatibles which are used in their corresponding device trees which
have a specific compatible and the (already documented) fallback
compatible:
 - "fsl,ls1046a-extirq", "fsl,ls1043a-extirq"
 - "fsl,ls2080a-extirq", "fsl,ls1088a-extirq"
 - "fsl,lx2160a-extirq", "fsl,ls1088a-extirq"

Signed-off-by: Michael Walle <michael@walle.cc>
---
changes since v1:
 - new patch, because it's reference in patch 2/2

 .../interrupt-controller/fsl,ls-extirq.txt    | 53 -----------
 .../interrupt-controller/fsl,ls-extirq.yaml   | 88 +++++++++++++++++++
 2 files changed, 88 insertions(+), 53 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt
deleted file mode 100644
index 4d47df1a5c91..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-* Freescale Layerscape external IRQs
-
-Some Layerscape SOCs (LS1021A, LS1043A, LS1046A
-LS1088A, LS208xA, LX216xA) support inverting
-the polarity of certain external interrupt lines.
-
-The device node must be a child of the node representing the
-Supplemental Configuration Unit (SCFG).
-
-Required properties:
-- compatible: should be "fsl,<soc-name>-extirq", e.g. "fsl,ls1021a-extirq".
-  "fsl,ls1043a-extirq": for LS1043A, LS1046A.
-  "fsl,ls1088a-extirq": for LS1088A, LS208xA, LX216xA.
-- #interrupt-cells: Must be 2. The first element is the index of the
-  external interrupt line. The second element is the trigger type.
-- #address-cells: Must be 0.
-- interrupt-controller: Identifies the node as an interrupt controller
-- reg: Specifies the Interrupt Polarity Control Register (INTPCR) in
-  the SCFG or the External Interrupt Control Register (IRQCR) in
-  the ISC.
-- interrupt-map: Specifies the mapping from external interrupts to GIC
-  interrupts.
-- interrupt-map-mask: Must be <0xffffffff 0>.
-
-Example:
-	scfg: scfg@1570000 {
-		compatible = "fsl,ls1021a-scfg", "syscon";
-		reg = <0x0 0x1570000 0x0 0x10000>;
-		big-endian;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0x0 0x0 0x1570000 0x10000>;
-
-		extirq: interrupt-controller@1ac {
-			compatible = "fsl,ls1021a-extirq";
-			#interrupt-cells = <2>;
-			#address-cells = <0>;
-			interrupt-controller;
-			reg = <0x1ac 4>;
-			interrupt-map =
-				<0 0 &gic GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
-				<1 0 &gic GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
-				<2 0 &gic GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
-				<3 0 &gic GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
-				<4 0 &gic GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
-				<5 0 &gic GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-map-mask = <0xffffffff 0x0>;
-		};
-	};
-
-
-	interrupts-extended = <&gic GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
-			      <&extirq 1 IRQ_TYPE_LEVEL_LOW>;
diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.yaml
new file mode 100644
index 000000000000..39d120ad7549
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale Layerscape External Interrupt Controller
+
+maintainers:
+  - Shawn Guo <shawnguo@kernel.org>
+  - Li Yang <leoyang.li@nxp.com>
+
+description: |
+  Some Layerscape SOCs (LS1021A, LS1043A, LS1046A LS1088A, LS208xA,
+  LX216xA) support inverting the polarity of certain external interrupt
+  lines.
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - fsl,ls1021a-extirq
+          - fsl,ls1043a-extirq
+          - fsl,ls1088a-extirq
+      - items:
+          - enum:
+              - fsl,ls1046a-extirq
+          - const: fsl,ls1043a-extirq
+      - items:
+          - enum:
+              - fsl,ls2080a-extirq
+              - fsl,lx2160a-extirq
+          - const: fsl,ls1088a-extirq
+
+  '#interrupt-cells':
+    const: 2
+
+  '#address-cells':
+    const: 0
+
+  interrupt-controller: true
+
+  reg:
+    maxItems: 1
+    description:
+      Specifies the Interrupt Polarity Control Register (INTPCR) in the
+      SCFG or the External Interrupt Control Register (IRQCR) in the ISC.
+
+  interrupt-map:
+    description: Specifies the mapping from external interrupts to GIC interrupts.
+
+  interrupt-map-mask:
+    items:
+      - const: 0xffffffff
+      - const: 0
+
+required:
+  - compatible
+  - '#interrupt-cells'
+  - '#address-cells'
+  - interrupt-controller
+  - reg
+  - interrupt-map
+  - interrupt-map-mask
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    interrupt-controller@1ac {
+            compatible = "fsl,ls1021a-extirq";
+            #interrupt-cells = <2>;
+            #address-cells = <0>;
+            interrupt-controller;
+            reg = <0x1ac 4>;
+            interrupt-map =
+                    <0 0 &gic GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+                    <1 0 &gic GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+                    <2 0 &gic GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
+                    <3 0 &gic GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
+                    <4 0 &gic GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
+                    <5 0 &gic GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-map-mask = <0xffffffff 0x0>;
+    };
-- 
2.30.2

