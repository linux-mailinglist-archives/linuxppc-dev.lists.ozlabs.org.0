Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8C794B747
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 09:13:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=JfJJZbmR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfdYx2J3Fz30V1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:13:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=JfJJZbmR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.198; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfdWk3cFxz3dFS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 17:11:46 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 46F02C0013;
	Thu,  8 Aug 2024 07:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723101103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O51zc97GTHWxplwmFL6UetG7Pd9xJzEuVM/G68/5Omw=;
	b=JfJJZbmRF1XsdMo/57V4LJaVyayOuPQroTM0IscItx1UKyZnYREE+tBZSJBHpVd//qvXeK
	IbTrKaDw4P4PRrvXBMo0ZS/SCzCZcDSEyHyjB9DNxNQakS9ipx/8wQgPytKhDY14OBgL+f
	v22imp+Qn4o5YU4Ehu8RZW93XsGsocrDF4dia0PaAd5BEZjS95PJOtYRrBGXwXQBQN4Bg4
	n0jEVSuPf+gnimHd+te8sY1b9h9hGHyalyBhl7QhkaTAIkHWRq/Gwd+8zluqIjYfI+L7R0
	RdYHft7hQ4973ImNnKfHoMzeS8/c2r5tcLopwxBr2pg4r87Psgvc7U1lrO2tTQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 07/36] dt-bindings: soc: fsl: cpm_qe: Add QUICC Engine (QE) TSA controller
Date: Thu,  8 Aug 2024 09:11:00 +0200
Message-ID: <20240808071132.149251-8-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240808071132.149251-1-herve.codina@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for the time slot assigner (TSA) available in some
PowerQUICC SoC that uses a QUICC Engine (QE) block such as MPC8321.

This QE TSA is similar to the CPM TSA except that it uses UCCs (Unified
Communication Controllers) instead of SCCs (Serial Communication
Controllers). Also, compared against the CPM TSA, this QE TSA can handle
up to 4 TDMs instead of 2 and allows to configure the logic level of
sync signals.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml   | 210 ++++++++++++++++++
 include/dt-bindings/soc/qe-fsl,tsa.h          |  13 ++
 2 files changed, 223 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml
 create mode 100644 include/dt-bindings/soc/qe-fsl,tsa.h

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml
new file mode 100644
index 000000000000..3b50e0a003ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml
@@ -0,0 +1,210 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-tsa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PowerQUICC QE Time-slot assigner (TSA) controller
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description:
+  The TSA is the time-slot assigner that can be found on some PowerQUICC SoC.
+  Its purpose is to route some TDM time-slots to other internal serial
+  controllers.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,mpc8321-tsa
+      - const: fsl,qe-tsa
+
+  reg:
+    items:
+      - description: SI (Serial Interface) register base
+      - description: SI RAM base
+
+  reg-names:
+    items:
+      - const: si_regs
+      - const: si_ram
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^tdm@[0-3]$':
+    description:
+      The TDM managed by this controller
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 3
+        description:
+          The TDM number for this TDM, 0 for TDMa, 1 for TDMb, 2 for TDMc and 3
+          for TDMd.
+
+      fsl,common-rxtx-pins:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          The hardware can use four dedicated pins for Tx clock, Tx sync, Rx
+          clock and Rx sync or use only two pins, Tx/Rx clock and Tx/Rx sync.
+          Without the 'fsl,common-rxtx-pins' property, the four pins are used.
+          With the 'fsl,common-rxtx-pins' property, two pins are used.
+
+      clocks:
+        minItems: 2
+        items:
+          - description: Receive sync clock
+          - description: Receive data clock
+          - description: Transmit sync clock
+          - description: Transmit data clock
+
+      clock-names:
+        minItems: 2
+        items:
+          - const: rsync
+          - const: rclk
+          - const: tsync
+          - const: tclk
+
+      fsl,rx-frame-sync-delay-bits:
+        enum: [0, 1, 2, 3]
+        default: 0
+        description: |
+          Receive frame sync delay in number of bits.
+          Indicates the delay between the Rx sync and the first bit of the Rx
+          frame.
+
+      fsl,tx-frame-sync-delay-bits:
+        enum: [0, 1, 2, 3]
+        default: 0
+        description: |
+          Transmit frame sync delay in number of bits.
+          Indicates the delay between the Tx sync and the first bit of the Tx
+          frame.
+
+      fsl,clock-falling-edge:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Data is sent on falling edge of the clock (and received on the rising
+          edge). If not present, data is sent on the rising edge (and received
+          on the falling edge).
+
+      fsl,fsync-rising-edge:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Frame sync pulses are sampled with the rising edge of the channel
+          clock. If not present, pulses are sampled with the falling edge.
+
+      fsl,fsync-active-low:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Frame sync signals are active on low logic level.
+          If not present, sync signals are active on high level.
+
+      fsl,double-speed-clock:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          The channel clock is twice the data rate.
+
+    patternProperties:
+      '^fsl,[rt]x-ts-routes$':
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        description: |
+          A list of tuple that indicates the Tx or Rx time-slots routes.
+        items:
+          items:
+            - description:
+                The number of time-slots
+              minimum: 1
+              maximum: 64
+            - description: |
+                The source (Tx) or destination (Rx) serial interface
+                (dt-bindings/soc/qe-fsl,tsa.h defines these values)
+                 - 0: No destination
+                 - 1: UCC1
+                 - 2: UCC2
+                 - 3: UCC3
+                 - 4: UCC4
+                 - 5: UCC5
+              enum: [0, 1, 2, 3, 4, 5]
+        minItems: 1
+        maxItems: 64
+
+    allOf:
+      # If fsl,common-rxtx-pins is present, only 2 clocks are needed.
+      # Else, the 4 clocks must be present.
+      - if:
+          required:
+            - fsl,common-rxtx-pins
+        then:
+          properties:
+            clocks:
+              maxItems: 2
+            clock-names:
+              maxItems: 2
+        else:
+          properties:
+            clocks:
+              minItems: 4
+            clock-names:
+              minItems: 4
+
+    required:
+      - reg
+      - clocks
+      - clock-names
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/qe-fsl,tsa.h>
+
+    tsa@ae0 {
+        compatible = "fsl,mpc8321-tsa", "fsl,qe-tsa";
+        reg = <0xae0 0x10>,
+              <0xc00 0x200>;
+        reg-names = "si_regs", "si_ram";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        tdm@0 {
+            /* TDMa */
+            reg = <0>;
+
+            clocks = <&clk_l1rsynca>, <&clk_l1rclka>;
+            clock-names = "rsync", "rclk";
+
+            fsl,common-rxtx-pins;
+            fsl,fsync-rising-edge;
+
+            fsl,tx-ts-routes = <2 0>,             /* TS 0..1 */
+                           <24 FSL_QE_TSA_UCC4>, /* TS 2..25 */
+                           <1 0>,                 /* TS 26 */
+                           <5 FSL_QE_TSA_UCC3>;  /* TS 27..31 */
+
+            fsl,rx-ts-routes = <2 0>,             /* TS 0..1 */
+                           <24 FSL_QE_TSA_UCC4>, /* 2..25 */
+                           <1 0>,                 /* TS 26 */
+                           <5 FSL_QE_TSA_UCC3>;  /* TS 27..31 */
+        };
+    };
diff --git a/include/dt-bindings/soc/qe-fsl,tsa.h b/include/dt-bindings/soc/qe-fsl,tsa.h
new file mode 100644
index 000000000000..3cf3df9c0968
--- /dev/null
+++ b/include/dt-bindings/soc/qe-fsl,tsa.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+
+#ifndef __DT_BINDINGS_SOC_FSL_QE_TSA_H
+#define __DT_BINDINGS_SOC_FSL_QE_TSA_H
+
+#define FSL_QE_TSA_NU		0
+#define FSL_QE_TSA_UCC1		1
+#define FSL_QE_TSA_UCC2		2
+#define FSL_QE_TSA_UCC3		3
+#define FSL_QE_TSA_UCC4		4
+#define FSL_QE_TSA_UCC5		5
+
+#endif
-- 
2.45.0

