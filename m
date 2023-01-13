Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA735669479
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 11:40:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtdHF4PTBz3fH5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 21:40:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=jS1gu5zv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::229; helo=relay9-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=jS1gu5zv;
	dkim-atps=neutral
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtdDT3t21z3fB8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 21:38:17 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 36677FF812;
	Fri, 13 Jan 2023 10:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673606289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e9+cZzguFSROPV4tCZLD7SaeW4MY38Tng5UQywdd1Oo=;
	b=jS1gu5zvJRx9adaZfWf64nRyetSxBLADYSnm1YSic+J+cl+2Vz+aILzoDS+QEqraJBobg1
	O9jX1WxQrV4+Gc33rnj2RNubSIAyKoKK+7EKRXFizUBWWb7Jo+YXgae/HkPJCwPjAE0o9/
	lMhSvev9094xq5e747WPtNp2Oh4qCOUENIzTfqr/KIr381ttlNaYkmlKnZlHzTX0+Bm738
	xqza2VCN2rdRWHLBYdWHeqpjyS+ylHZqBgmcI01X6l0g0dUUhafOgNwjlQug8wx42/aoVp
	DFHxEggGylNZ+yxM+KxwzTKrmuxluVmqd3TbcVB74lTEVwDrFP/VPXHjY75+VA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH v3 01/10] dt-bindings: soc: fsl: cpm_qe: Add TSA controller
Date: Fri, 13 Jan 2023 11:37:50 +0100
Message-Id: <20230113103759.327698-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113103759.327698-1-herve.codina@bootlin.com>
References: <20230113103759.327698-1-herve.codina@bootlin.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for the time slot assigner (TSA)
available in some PowerQUICC SoC such as MPC885
or MPC866.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../bindings/soc/fsl/cpm_qe/fsl,tsa.yaml      | 260 ++++++++++++++++++
 include/dt-bindings/soc/fsl,tsa.h             |  13 +
 2 files changed, 273 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.yaml
 create mode 100644 include/dt-bindings/soc/fsl,tsa.h

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.yaml
new file mode 100644
index 000000000000..eb17b6119abd
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.yaml
@@ -0,0 +1,260 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,tsa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PowerQUICC CPM Time-slot assigner (TSA) controller
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description: |
+  The TSA is the time-slot assigner that can be found on some
+  PowerQUICC SoC.
+  Its purpose is to route some TDM time-slots to other internal
+  serial controllers.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,mpc885-tsa
+          - fsl,mpc866-tsa
+      - const: fsl,cpm1-tsa
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
+  '^tdm@[0-1]$':
+    description:
+      The TDM managed by this controller
+    type: object
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 1
+        description:
+          The TDM number for this TDM, 0 for TDMa and 1 for TDMb
+
+      fsl,common-rxtx-pins:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          The hardware can use four dedicated pins for Tx clock,
+          Tx sync, Rx clock and Rx sync or use only two pins,
+          Tx/Rx clock and Rx/Rx sync.
+          Without the 'fsl,common-rxtx-pins' property, the four
+          pins are used. With the 'fsl,common-rxtx-pins' property,
+          two pins are used.
+
+      clocks:
+        minItems: 2
+        maxItems: 4
+
+      clock-names:
+        minItems: 2
+        maxItems: 4
+
+      fsl,mode:
+        $ref: /schemas/types.yaml#/definitions/string
+        enum: [normal, echo, internal-loopback, control-loopback]
+        default: normal
+        description: |
+          Operational mode:
+            - normal:
+                Normal operation
+            - echo:
+                Automatic echo. Rx data is resent on Tx
+            - internal-loopback:
+                The TDM transmitter is connected to the receiver.
+                Data appears on Tx pin.
+            - control-loopback:
+                The TDM transmitter is connected to the receiver.
+                The Tx pin is disconnected.
+
+      fsl,rx-frame-sync-delay-bits:
+        enum: [0, 1, 2, 3]
+        default: 0
+        description: |
+          Receive frame sync delay in number of bits.
+          Indicates the delay between the Rx sync and the first bit of the
+          Rx frame. 0 for no bit delay. 1, 2 or 3 for 1, 2 or 3 bits delay.
+
+      fsl,tx-frame-sync-delay-bits:
+        enum: [0, 1, 2, 3]
+        default: 0
+        description: |
+          Transmit frame sync delay in number of bits.
+          Indicates the delay between the Tx sync and the first bit of the
+          Tx frame. 0 for no bit delay. 1, 2 or 3 for 1, 2 or 3 bits delay.
+
+      fsl,clock-falling-edge:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: |
+          Data is sent on falling edge of the clock (and received on the
+          rising edge).
+          If 'clock-falling-edge' is not present, data is sent on the
+          rising edge (and received on the falling edge).
+
+      fsl,fsync-rising-edge:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Frame sync pulses are sampled with the rising edge of the channel
+          clock. If 'fsync-rising-edge' is not present, pulses are sample
+          with e falling edge.
+
+      fsl,double-speed-clock:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          The channel clock is twice the data rate.
+
+      fsl,tx-ts-routes:
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        description: |
+          A list of tupple that indicates the Tx time-slots routes.
+            tx_ts_routes =
+               < 2 0 >, /* The first 2 time slots are not used */
+               < 3 1 >, /* The next 3 ones are route to SCC2 */
+               < 4 0 >, /* The next 4 ones are not used */
+               < 2 2 >; /* The nest 2 ones are route to SCC3 */
+        items:
+          items:
+            - description:
+                The number of time-slots
+              minimum: 1
+              maximum: 64
+            - description: |
+                The source serial interface (dt-bindings/soc/fsl,tsa.h
+                defines these values)
+                 - 0: No destination
+                 - 1: SCC2
+                 - 2: SCC3
+                 - 3: SCC4
+                 - 4: SMC1
+                 - 5: SMC2
+              enum: [0, 1, 2, 3, 4, 5]
+        minItems: 1
+        maxItems: 64
+
+      fsl,rx-ts-routes:
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        description: |
+          A list of tupple that indicates the Rx time-slots routes.
+            tx_ts_routes =
+               < 2 0 >, /* The first 2 time slots are not used */
+               < 3 1 >, /* The next 3 ones are route from SCC2 */
+               < 4 0 >, /* The next 4 ones are not used */
+               < 2 2 >; /* The nest 2 ones are route from SCC3 */
+        items:
+          items:
+            - description:
+                The number of time-slots
+              minimum: 1
+              maximum: 64
+            - description: |
+                The destination serial interface (dt-bindings/soc/fsl,tsa.h
+                defines these values)
+                 - 0: No destination
+                 - 1: SCC2
+                 - 2: SCC3
+                 - 3: SCC4
+                 - 4: SMC1
+                 - 5: SMC2
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
+              items:
+                - description: External clock connected to L1RSYNC pin
+                - description: External clock connected to L1RCLK pin
+            clock-names:
+              items:
+                - const: l1rsync
+                - const: l1rclk
+        else:
+          properties:
+            clocks:
+              items:
+                - description: External clock connected to L1RSYNC pin
+                - description: External clock connected to L1RCLK pin
+                - description: External clock connected to L1TSYNC pin
+                - description: External clock connected to L1TCLK pin
+            clock-names:
+              items:
+                - const: l1rsync
+                - const: l1rclk
+                - const: l1tsync
+                - const: l1tclk
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
+    #include <dt-bindings/soc/fsl,tsa.h>
+
+    tsa@ae0 {
+        compatible = "fsl,mpc885-tsa", "fsl,cpm1-tsa";
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
+            clock-names = "l1rsync", "l1rclk";
+
+            fsl,common-rxtx-pins;
+            fsl,fsync-rising-edge;
+
+            fsl,tx-ts-routes = < 2 0 >,             /* TS 0..1 */
+                           < 24 FSL_CPM_TSA_SCC4 >, /* TS 2..25 */
+                           < 1 0 >,                 /* TS 26 */
+                           < 5 FSL_CPM_TSA_SCC3 >;  /* TS 27..31 */
+
+            fsl,rx-ts-routes = < 2 0 >,             /* TS 0..1 */
+                           < 24 FSL_CPM_TSA_SCC4 >, /* 2..25 */
+                           < 1 0 >,                 /* TS 26 */
+                           < 5 FSL_CPM_TSA_SCC3 >;  /* TS 27..31 */
+        };
+    };
diff --git a/include/dt-bindings/soc/fsl,tsa.h b/include/dt-bindings/soc/fsl,tsa.h
new file mode 100644
index 000000000000..2cc44e867dbe
--- /dev/null
+++ b/include/dt-bindings/soc/fsl,tsa.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+
+#ifndef __DT_BINDINGS_SOC_FSL_TSA_H
+#define __DT_BINDINGS_SOC_FSL_TSA_H
+
+#define FSL_CPM_TSA_NU		0	/* Pseuso Cell Id for not used item */
+#define FSL_CPM_TSA_SCC2	1
+#define FSL_CPM_TSA_SCC3	2
+#define FSL_CPM_TSA_SCC4	3
+#define FSL_CPM_TSA_SMC1	4
+#define FSL_CPM_TSA_SMC2	5
+
+#endif
-- 
2.38.1

