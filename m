Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9179066014B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jan 2023 14:33:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NpPS33RMLz3c9y
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 00:33:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ng1MnZVh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::222; helo=relay2-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ng1MnZVh;
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NpPNC0WQcz30R1
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jan 2023 00:30:17 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 03BD44000F;
	Fri,  6 Jan 2023 13:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673011810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tc73qbESSRu1g7vaGbjop2U2EOJhPqDgDpfhENFo0Ys=;
	b=ng1MnZVhkdIe1FUuS7pcET8YCv8AAbyw9I2FFxVevuh022BT0Qu6NjG8nhf/jQ6KvcLlql
	+b9yPaf6BD/yHODll3deFXLalA+Br4WwL0Puruaw6mbT+KkeCJveU7WvnNosirhw5mclQD
	E061dPsAIZjXcCE7mqtinskdnCsnoNa03UzXTde8f0NroqPxNOrWQhuMj8KXQspbrdTyvk
	BX38p7HjjtfPmfv7WVYBAMT3vODwLgBIDWBat44rt+wJmKuQBrvPhy2p1xOJgaqxVC7ASG
	+7JE6v5cS0U0hpNyi8GHfZfcj9LOfkdLptLbb3JhNOG94Yjt81WhVqb//gDw1A==
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
Subject: [PATCH 01/10] dt-bindings: soc: fsl: cpm_qe: Add TSA controller
Date: Fri,  6 Jan 2023 14:29:42 +0100
Message-Id: <20230106132951.392271-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230106132951.392271-1-herve.codina@bootlin.com>
References: <20230106132951.392271-1-herve.codina@bootlin.com>
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
 .../bindings/soc/fsl/cpm_qe/fsl,tsa.yaml      | 262 ++++++++++++++++++
 include/dt-bindings/soc/fsl-tsa.h             |  15 +
 2 files changed, 277 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.yaml
 create mode 100644 include/dt-bindings/soc/fsl-tsa.h

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.yaml
new file mode 100644
index 000000000000..7542c0fd8435
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.yaml
@@ -0,0 +1,262 @@
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
+  "^tdm@[0-1]$":
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
+          Use common pins for both transmit and receive
+
+      clocks: true
+      clock-names: true
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
+      fsl,rx-frame-sync-delay:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        default: 0
+        description: |
+          Receive frame sync delay.
+          Indicates the delay between the Rx sync and the first bit of the
+          Rx frame. 0 for no bit delay. 1, 2 or 3 for 1, 2 or 3 bits delay.
+
+      fsl,tx-frame-sync-delay:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        default: 0
+        description: |
+          Transmit frame sync delay.
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
+      fsl,grant-mode:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Grant mode enabled.
+
+      tx_ts_routes:
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        description: |
+          A list of tupple that indicates the Tx time-slots routes.
+            tx_ts_routes =
+               < 2 0 0>, /* The first 2 time slots are not used */
+               < 3 1 0>, /* The next 3 ones are route to SCC2 */
+               < 4 0 0>, /* The next 4 ones are not used */
+               < 2 2 0>; /* The nest 2 ones are route to SCC3 */
+        items:
+          items:
+            - description:
+                The number of time-slots
+              minimum: 1
+              maximum: 64
+            - description: |
+                The source serial interface (dt-bindings/soc/fsl-tsa.h
+                defines these values)
+                 - 0: No destination
+                 - 1: SCC2
+                 - 2: SCC3
+                 - 3: SCC4
+                 - 4: SMC1
+                 - 5: SMC2
+              enum: [0, 1, 2, 3, 4, 5]
+            - description:
+                The route flags (reserved)
+              const: 0
+        minItems: 1
+        maxItems: 64
+
+      rx_ts_routes:
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        description: |
+          A list of tupple that indicates the Rx time-slots routes.
+            tx_ts_routes =
+               < 2 0 0>, /* The first 2 time slots are not used */
+               < 3 1 0>, /* The next 3 ones are route from SCC2 */
+               < 4 0 0>, /* The next 4 ones are not used */
+               < 2 2 0>; /* The nest 2 ones are route from SCC3 */
+        items:
+          items:
+            - description:
+                The number of time-slots
+              minimum: 1
+              maximum: 64
+            - description: |
+                The destination serial interface (dt-bindings/soc/fsl-tsa.h
+                defines these values)
+                 - 0: No destination
+                 - 1: SCC2
+                 - 2: SCC3
+                 - 3: SCC4
+                 - 4: SMC1
+                 - 5: SMC2
+              enum: [0, 1, 2, 3, 4, 5]
+            - description:
+                The route flags (reserved)
+              const: 0
+        minItems: 1
+        maxItems: 64
+
+    allOf:
+      - if:
+          properties:
+            fsl,common-rxtx-pins:
+              type: 'null'
+        then:
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
+        else:
+          properties:
+            clocks:
+              items:
+                - description: External clock connected to L1RSYNC pin
+                - description: External clock connected to L1RCLK pin
+            clock-names:
+              items:
+                - const: l1rsync
+                - const: l1rclk
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
+    #include <dt-bindings/soc/fsl-tsa.h>
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
+            tx_ts_routes = < 2 0 0>,                 /* TS 0..1 */
+                           < 24 FSL_CPM_TSA_SCC4 0>, /* TS 2..25 */
+                           < 1 0 0>,                 /* TS 26 */
+                           < 5 FSL_CPM_TSA_SCC3 0>;  /* TS 27..31 */
+
+            rx_ts_routes = < 2 0 0>,                 /* TS 0..1 */
+                           < 24 FSL_CPM_TSA_SCC4 0>, /* 2..25 */
+                           < 1 0 0>,                 /* TS 26 */
+                           < 5 FSL_CPM_TSA_SCC3 0>;  /* TS 27..31 */
+        };
+    };
diff --git a/include/dt-bindings/soc/fsl-tsa.h b/include/dt-bindings/soc/fsl-tsa.h
new file mode 100644
index 000000000000..9d09468694a2
--- /dev/null
+++ b/include/dt-bindings/soc/fsl-tsa.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later OR MIT */
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
+#define FSL_CPM_TSA_NBCELL	6
+
+#endif
-- 
2.38.1

