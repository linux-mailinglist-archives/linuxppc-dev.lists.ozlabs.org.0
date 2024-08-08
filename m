Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F06094B7EC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 09:33:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=lUXHDuaG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wff176wkvz3dV6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:33:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=lUXHDuaG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::226; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfdX62WzHz3dRk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 17:12:06 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id B3346C0002;
	Thu,  8 Aug 2024 07:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723101116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uob6iqJ4dxQ2dTDfxhS5GBjrRmflXRU3RjyB9muRTTI=;
	b=lUXHDuaGqkEdrGC8FVeGG+KhA8Tn99WgeR6e0wWJi+Zcq4Iwhb18Y4Iar7RTnHcYcoPURC
	jnpKgLsmuXnTAlsuiTbovXFFCyqHU5WN7flCPo8mQN/w49hdHlEtXJYjdpdrrwnVbyAQpI
	FQjiOgc8XBYDVcX5RUsZA5vjM6/ijByLTPKshxQH4AMVTWKOacKE3jzJjojnowzJOesJkH
	sGzyrUPpMcukeoYelMmOd0ShepimJqn2P7GIXRaOTiVIuD2p1ER0ICncG7ab5WIxhGi3Pr
	9IoHlE5MeOcP5xJzJBQ8HdsyKUxFpTb0pEu/YMOgBz7J+8qJlYZEc7bPdgabJA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 23/36] dt-bindings: soc: fsl: cpm_qe: Add QUICC Engine (QE) QMC controller
Date: Thu,  8 Aug 2024 09:11:16 +0200
Message-ID: <20240808071132.149251-24-herve.codina@bootlin.com>
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

Add support for the QMC (QUICC Multichannel Controller) available in
some PowerQUICC SoC that uses a QUICC Engine (QE) block such as MPC8321.

This QE QMC is similar to the CPM QMC except that it uses UCCs (Unified
Communication Controllers) instead of SCCs (Serial Communication
Controllers). Also, compared against the CPM QMC, this QE QMC does not
use a fixed area for the UCC/SCC parameters area but it uses a dynamic
area allocated and provided to the hardware at runtime.
Last point, the QE QMC can use a firmware to have the QMC working in
'soft-qmc' mode.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../soc/fsl/cpm_qe/fsl,qe-ucc-qmc.yaml        | 197 ++++++++++++++++++
 1 file changed, 197 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ucc-qmc.yaml

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ucc-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ucc-qmc.yaml
new file mode 100644
index 000000000000..71ae64cb8a4f
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ucc-qmc.yaml
@@ -0,0 +1,197 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ucc-qmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PowerQUICC QE QUICC Multichannel Controller (QMC)
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description:
+  The QMC (QUICC Multichannel Controller) emulates up to 64 channels within one
+  serial controller using the same TDM physical interface routed from TSA.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,mpc8321-ucc-qmc
+      - const: fsl,qe-ucc-qmc
+
+  reg:
+    items:
+      - description: UCC (Unified communication controller) register base
+      - description: Dual port ram base
+
+  reg-names:
+    items:
+      - const: ucc_regs
+      - const: dpram
+
+  interrupts:
+    maxItems: 1
+    description: UCC interrupt line in the QE interrupt controller
+
+  fsl,tsa-serial:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to TSA node
+          - enum: [1, 2, 3, 4, 5]
+            description: |
+              TSA serial interface (dt-bindings/soc/qe-fsl,tsa.h defines these
+              values)
+               - 1: UCC1
+               - 2: UCC2
+               - 3: UCC3
+               - 4: UCC4
+               - 5: UCC5
+    description:
+      Should be a phandle/number pair. The phandle to TSA node and the TSA
+      serial interface to use.
+
+  fsl,soft-qmc:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Soft QMC firmware name to load. If this property is omitted, no firmware
+      are used.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^channel@([0-9]|[1-5][0-9]|6[0-3])$':
+    description:
+      A channel managed by this controller
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        items:
+          - enum:
+              - fsl,mpc8321-ucc-qmc-hdlc
+          - const: fsl,qe-ucc-qmc-hdlc
+          - const: fsl,qmc-hdlc
+
+      reg:
+        minimum: 0
+        maximum: 63
+        description:
+          The channel number
+
+      fsl,operational-mode:
+        $ref: /schemas/types.yaml#/definitions/string
+        enum: [transparent, hdlc]
+        default: transparent
+        description: |
+          The channel operational mode
+            - hdlc: The channel handles HDLC frames
+            - transparent: The channel handles raw data without any processing
+
+      fsl,reverse-data:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          The bit order as seen on the channels is reversed,
+          transmitting/receiving the MSB of each octet first.
+          This flag is used only in 'transparent' mode.
+
+      fsl,tx-ts-mask:
+        $ref: /schemas/types.yaml#/definitions/uint64
+        description:
+          Channel assigned Tx time-slots within the Tx time-slots routed by the
+          TSA to this cell.
+
+      fsl,rx-ts-mask:
+        $ref: /schemas/types.yaml#/definitions/uint64
+        description:
+          Channel assigned Rx time-slots within the Rx time-slots routed by the
+          TSA to this cell.
+
+      fsl,framer:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          phandle to the framer node. The framer is in charge of an E1/T1 line
+          interface connected to the TDM bus. It can be used to get the E1/T1 line
+          status such as link up/down.
+
+    allOf:
+      - if:
+          properties:
+            compatible:
+              not:
+                contains:
+                  const: fsl,qmc-hdlc
+        then:
+          properties:
+            fsl,framer: false
+
+    required:
+      - reg
+      - fsl,tx-ts-mask
+      - fsl,rx-ts-mask
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - fsl,tsa-serial
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/qe-fsl,tsa.h>
+
+    qmc@a60 {
+        compatible = "fsl,mpc8321-ucc-qmc", "fsl,qe-ucc-qmc";
+        reg = <0x3200 0x200>,
+              <0x10000 0x1000>;
+        reg-names = "ucc_regs", "dpram";
+        interrupts = <35>;
+        interrupt-parent = <&qeic>;
+        fsl,soft-qmc = "fsl_qe_ucode_qmc_8321_11.bin";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fsl,tsa-serial = <&tsa FSL_QE_TSA_UCC4>;
+
+        channel@16 {
+            /* Ch16 : First 4 even TS from all routed from TSA */
+            reg = <16>;
+            fsl,operational-mode = "transparent";
+            fsl,reverse-data;
+            fsl,tx-ts-mask = <0x00000000 0x000000aa>;
+            fsl,rx-ts-mask = <0x00000000 0x000000aa>;
+        };
+
+        channel@17 {
+            /* Ch17 : First 4 odd TS from all routed from TSA */
+            reg = <17>;
+            fsl,operational-mode = "transparent";
+            fsl,reverse-data;
+            fsl,tx-ts-mask = <0x00000000 0x00000055>;
+            fsl,rx-ts-mask = <0x00000000 0x00000055>;
+        };
+
+        channel@19 {
+            /* Ch19 : 8 TS (TS 8..15) from all routed from TSA */
+            compatible = "fsl,mpc8321-ucc-qmc-hdlc",
+                         "fsl,qe-ucc-qmc-hdlc",
+                         "fsl,qmc-hdlc";
+            reg = <19>;
+            fsl,operational-mode = "hdlc";
+            fsl,tx-ts-mask = <0x00000000 0x0000ff00>;
+            fsl,rx-ts-mask = <0x00000000 0x0000ff00>;
+            fsl,framer = <&framer>;
+        };
+    };
-- 
2.45.0

