Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01202669485
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 11:43:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtdLK6JvFz3fHb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 21:43:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=oEwq0mwR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::229; helo=relay9-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=oEwq0mwR;
	dkim-atps=neutral
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtdDg1HyBz3fCw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 21:38:26 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 92BDDFF805;
	Fri, 13 Jan 2023 10:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673606304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A3gOwLKCbvhD9y82aQ+8CVVXVgQCqL1sYfV2qaO4J0s=;
	b=oEwq0mwR++GxfPwOyL9g/gotpNb4BJb18kxYNZqdo29VkXCw957txr1TDP4S28C0D3Z1Ck
	OtBDsMhwgkJOTHQ7+IF/53mZfL5b+Ik+F7LdLSOHlpU2zZFK8y4ZlMC7y1vGqxqe0ucE2C
	eBfmph+BIUGVPRWxMkufn3TtXfnwUsHqgEyeN2GZqgFXwdGyXM4+EycQNM2YUbHYUHmUtj
	Loizg7LqRputAm5V6siUc0eNyey2vsFdZnmfs4xO+xRqJUEegv5ats9LjjbU5+nDnaaGga
	12xyQm6++hEIxNOrvmBygua6G3bp6dELzTFn4dg7FkXKf2Fpjet66kImXRqhrQ==
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
Subject: [PATCH v3 05/10] dt-bindings: soc: fsl: cpm_qe: Add QMC controller
Date: Fri, 13 Jan 2023 11:37:54 +0100
Message-Id: <20230113103759.327698-6-herve.codina@bootlin.com>
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

Add support for the QMC (QUICC Multichannel Controller)
available in some PowerQUICC SoC such as MPC885 or MPC866.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../bindings/soc/fsl/cpm_qe/fsl,qmc.yaml      | 164 ++++++++++++++++++
 1 file changed, 164 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml
new file mode 100644
index 000000000000..3ec52f1635c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml
@@ -0,0 +1,164 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PowerQUICC CPM QUICC Multichannel Controller (QMC)
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description: |
+  The QMC (QUICC Multichannel Controller) emulates up to 64 channels within
+  one serial controller using the same TDM physical interface routed from
+  TSA.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,mpc885-scc-qmc
+          - fsl,mpc866-scc-qmc
+      - const: fsl,cpm1-scc-qmc
+
+  reg:
+    items:
+      - description: SCC (Serial communication controller) register base
+      - description: SCC parameter ram base
+      - description: Dual port ram base
+
+  reg-names:
+    items:
+      - const: scc_regs
+      - const: scc_pram
+      - const: dpram
+
+  interrupts:
+    maxItems: 1
+    description: SCC interrupt line in the CPM interrupt controller
+
+  fsl,tsa:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the TSA
+
+  fsl,tsa-cell-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 3]
+    description: |
+      TSA cell ID (dt-bindings/soc/fsl,tsa.h defines these values)
+       - 1: SCC2
+       - 2: SCC3
+       - 3: SCC4
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  '#chan-cells':
+    const: 1
+
+patternProperties:
+  '^channel@([0-9]|[1-5][0-9]|6[0-3])$':
+    description:
+      A channel managed by this controller
+    type: object
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 63
+        description:
+          The channel number
+
+      fsl,mode:
+        $ref: /schemas/types.yaml#/definitions/string
+        enum: [transparent, hdlc]
+        default: transparent
+        description: Operational mode
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
+          Channel assigned Tx time-slots within the Tx time-slots routed
+          by the TSA to this cell.
+
+      fsl,rx-ts-mask:
+        $ref: /schemas/types.yaml#/definitions/uint64
+        description:
+          Channel assigned Rx time-slots within the Rx time-slots routed
+          by the TSA to this cell.
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
+  - fsl,tsa
+  - fsl,tsa-cell-id
+  - '#address-cells'
+  - '#size-cells'
+  - '#chan-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/fsl,tsa.h>
+
+    qmc@a60 {
+        compatible = "fsl,mpc885-scc-qmc", "fsl,cpm1-scc-qmc";
+        reg = <0xa60 0x20>,
+              <0x3f00 0xc0>,
+              <0x2000 0x1000>;
+        reg-names = "scc_regs", "scc_pram", "dpram";
+        interrupts = <27>;
+        interrupt-parent = <&CPM_PIC>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #chan-cells = <1>;
+
+        fsl,tsa = <&tsa>;
+        fsl,tsa-cell-id = <FSL_CPM_TSA_SCC4>;
+
+        channel@16 {
+            /* Ch16 : First 4 even TS from all routed from TSA */
+            reg = <16>;
+            fsl,mode = "transparent";
+            fsl,reverse-data;
+            fsl,tx-ts-mask = <0x00000000 0x000000aa>;
+            fsl,rx-ts-mask = <0x00000000 0x000000aa>;
+        };
+
+        channel@17 {
+            /* Ch17 : First 4 odd TS from all routed from TSA */
+            reg = <17>;
+            fsl,mode = "transparent";
+            fsl,reverse-data;
+            fsl,tx-ts-mask = <0x00000000 0x00000055>;
+            fsl,rx-ts-mask = <0x00000000 0x00000055>;
+        };
+
+        channel@19 {
+            /* Ch19 : 8 TS (TS 8..15) from all routed from TSA */
+            reg = <19>;
+            fsl,mode = "hdlc";
+            fsl,tx-ts-mask = <0x00000000 0x0000ff00>;
+            fsl,rx-ts-mask = <0x00000000 0x0000ff00>;
+        };
+    };
-- 
2.38.1

