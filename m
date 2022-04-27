Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75851511300
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 09:55:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kp9yY2L7xz3c7t
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 17:55:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=uO9TCJkv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=176.9.125.105; helo=ssl.serverraum.org;
 envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=uO9TCJkv; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kp9xD0d0Xz2xnC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 17:53:51 +1000 (AEST)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id E55DB2224D;
 Wed, 27 Apr 2022 09:53:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1651046026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c8md0w7nTqGQ2WYhNmFqixpQ0s9YgN3QXjIFu39VBh0=;
 b=uO9TCJkvgR02p9dHf+IqBSj/GTs0FSB18noOSS5R5pUmXa9F/CkDd1wtBqpVwk4uuBq0EM
 /qPRAVeQwT86SD7HzkgVp+bcv3Kz07zr/lFy/WYLcUB5Cj7GtSfAKmkxnM2LEum0wG+nkm
 ef4VyieYBshjzDGdfwn1A7zS7fLdUEE=
From: Michael Walle <michael@walle.cc>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 3/4] dt-bindings: interrupt-controller: fsl,
 ls-extirq: convert to YAML
Date: Wed, 27 Apr 2022 09:53:37 +0200
Message-Id: <20220427075338.1156449-4-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427075338.1156449-1-michael@walle.cc>
References: <20220427075338.1156449-1-michael@walle.cc>
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

Depending on the number of the number of the external IRQs which is
usually 12 except for the LS1021A where there are only 6, the
interrupt-map-mask was reduced from 0xffffffff to 0xf and 0x7
respectively and the number of interrupt-map entries have to
match.

Signed-off-by: Michael Walle <michael@walle.cc>
---
changes since v2:
 - drop $ref to interrupt-controller.yaml
 - use a more strict interrupt-map-mask and make it conditional on SoC

changes since v1:
 - new patch

 .../interrupt-controller/fsl,ls-extirq.txt    |  53 --------
 .../interrupt-controller/fsl,ls-extirq.yaml   | 118 ++++++++++++++++++
 2 files changed, 118 insertions(+), 53 deletions(-)
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
index 000000000000..887e565b9573
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.yaml
@@ -0,0 +1,118 @@
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
+  interrupt-map-mask: true
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
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,ls1021a-extirq
+    then:
+      properties:
+        interrupt-map:
+          minItems: 6
+          maxItems: 6
+        interrupt-map-mask:
+          items:
+            - const: 0x7
+            - const: 0
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,ls1043a-extirq
+              - fsl,ls1046a-extirq
+              - fsl,ls1088a-extirq
+              - fsl,ls2080a-extirq
+              - fsl,lx2160a-extirq
+    then:
+      properties:
+        interrupt-map:
+          minItems: 12
+          maxItems: 12
+        interrupt-map-mask:
+          items:
+            - const: 0xf
+            - const: 0
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
+            interrupt-map-mask = <0x7 0x0>;
+    };
-- 
2.30.2

