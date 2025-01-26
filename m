Return-Path: <linuxppc-dev+bounces-5572-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C418A1CDD5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jan 2025 20:00:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yh1773Lx0z30B8;
	Mon, 27 Jan 2025 05:59:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737917955;
	cv=none; b=Y4m+hBiKVvO0+PiuVJoGSryDPx6oEMgyTuTb0NecsKVf960446OuM8OwaSwTNkLe6LfH9MvDQIgsY0tZbpIPAQOdMQYrTBW/aTLYjHWxxYB5aHG1SdmhUlAILumwTXNWDYcZ6nisjNsIv+CQVKxj6/nEUrD1w7p2d312LVcpPfnTz+V19T2Xo/4fnQptIpFwX0eQl5oqrHYojd3oIb07+GFJGY+BsE6vxLYIRdbQ/X/F/aAU0o6tgovMFGcd3CtfO7jx8KIW8WtLbU+5RAzVcojMteFn2nkfaOE1CPsNfCgusGOllCOU17RvZxWM0tyNrjsGDs/WTDz/ccCn4I8wmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737917955; c=relaxed/relaxed;
	bh=0DWKAYelXLSVQ1KWZajlwB/mnMNG5shcnhkW52A/ugg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ERxz3AOW3MZWkr97T7YHCQO+pxiGwxi1yfc5Hkb4uRaBMwdYaPTi/HTnOSjaZbcFqb8m71g1TxunrKEdPNRRRCs7/AMcFh0egx1M+O5Ho+4jWNLQbl0ixjnf1rw9VfLQ5Ur/SNVYbERBPM7hIrPDVH9/A+9MX/xedhp63Sxkm0kjN6WCWiqsHn+7C5s173nyvbKMPDOU2j00VhqaEoqRFHeMfSeRzTyx2M7LFcn+N/v3zOALlk6lBhlliLLAeHX+FKLlIyKBFCsRTQpXWTxq1M87hgwdgy2OlxAvmNpImqeAJMMKnqouTDf65RRVptFyWudNK+Pa2vtOALBqAzSHGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YS5bj54U; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YS5bj54U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yh1756sgPz304N
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 05:59:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2AF20A41020;
	Sun, 26 Jan 2025 18:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26C1EC4AF5F;
	Sun, 26 Jan 2025 18:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737917946;
	bh=besDC4D0drpNlTcCMCLHyFd/qhP9T8iaGBo3K4aN2OU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YS5bj54UueHvcLodRMthcuaK5YpHiKvBmwaJNysQBaxINp7cxgs2vtfP9bjibVfbx
	 x8jOsI6cJRQkIcnTFpQwy9BCslxThZb07BRJcNV+PdAAIXITfMdapmRdeSKjYnPP6z
	 oCttv3Uer5rMERkXnu5m0Wr22fY9/woe4YPpbKCGuykQ985dgzQoT8ienE4aU8pwvV
	 e4sjx/O8A/ZrSBePnicE4GTePpk+eJwkk2nuVTjGysbd7Oy2KtPFPxmCBw51695Xve
	 pgcR+bjc4YqV9wYcLnifUVIi3c3qPHO7jBHF+5oc8Ci+L4tQccRks8+3XYyY7dvzY7
	 l0sbZWz5/P+PQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AEB9C02190;
	Sun, 26 Jan 2025 18:59:06 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 26 Jan 2025 19:59:03 +0100
Subject: [PATCH 8/9] dt-bindings: spi: Convert Freescale SPI bindings to
 YAML
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250126-ppcyaml-v1-8-50649f51c3dd@posteo.net>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
In-Reply-To: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
To: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Scott Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737917943; l=6825;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=xDa2X5ix7Yz+uUKr7B2an+BkT3tqXXsRwdduIK9iWgc=;
 b=4QCYXX3kpPGMdIqbCZvKPP/cQo3jUJcs6wRQLhb2Owtx6YTpaYDSWzkNBanZH6Dsamu4kpkge
 fyBklNraCwfDQXDyg9Fcfu6YmzGiRTaSu2oLelsxED9beNbs3wG63u6
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

fsl-spi.txt contains the bindings for the fsl,spi and fsl,espi
contollers. Convert them to YAML.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 .../devicetree/bindings/spi/fsl,espi.yaml          | 56 +++++++++++++++++
 Documentation/devicetree/bindings/spi/fsl,spi.yaml | 71 ++++++++++++++++++++++
 Documentation/devicetree/bindings/spi/fsl-spi.txt  | 62 -------------------
 3 files changed, 127 insertions(+), 62 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/fsl,espi.yaml b/Documentation/devicetree/bindings/spi/fsl,espi.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..350275760210c5763af0c7b1e1522ccbfb97eec7
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/fsl,espi.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/fsl,espi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale eSPI (Enhanced Serial Peripheral Interface) controller
+
+maintainers:
+  - J. Neuschäfer <j.ne@posteo.net>
+
+properties:
+  compatible:
+    const: fsl,mpc8536-espi
+
+  reg:
+    maxItems: 1
+
+  interrupts: true
+
+  fsl,espi-num-chipselects:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The number of the chipselect signals.
+
+  fsl,csbef:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Chip select assertion time in bits before frame starts
+
+  fsl,csaft:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Chip select negation time in bits after frame ends
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - fsl,espi-num-chipselects
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi@110000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        compatible = "fsl,mpc8536-espi";
+        reg = <0x110000 0x1000>;
+        interrupts = <53 0x2>;
+        interrupt-parent = <&mpic>;
+        fsl,espi-num-chipselects = <4>;
+        fsl,csbef = <1>;
+        fsl,csaft = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/spi/fsl,spi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8efa971b5954a93665cb624345774f2966bb5648
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/fsl,spi.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/fsl,spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale SPI (Serial Peripheral Interface) controller
+
+maintainers:
+  - J. Neuschäfer <j.ne@posteo.net>
+
+properties:
+  compatible:
+    enum:
+      - fsl,spi
+      - aeroflexgaisler,spictrl
+
+  reg:
+    maxItems: 1
+
+  cell-index:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      QE SPI subblock index.
+      0: QE subblock SPI1
+      1: QE subblock SPI2
+
+  mode:
+    description: SPI operation mode
+    enum:
+      - cpu
+      - cpu-qe
+
+  interrupts: true
+
+  clock-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: input clock frequency to non FSL_SOC cores
+
+  cs-gpios: true
+
+  fsl,spisel_boot:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      For the MPC8306 and MPC8309, specifies that the SPISEL_BOOT signal is used
+      as chip select for a slave device. Use reg = <number of gpios> in the
+      corresponding child node, i.e. 0 if the cs-gpios property is not present.
+
+required:
+  - compatible
+  - reg
+  - mode
+  - interrupts
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi@4c0 {
+        cell-index = <0>;
+        compatible = "fsl,spi";
+        reg = <0x4c0 0x40>;
+        interrupts = <82 0>;
+        interrupt-parent = <&intc>;
+        mode = "cpu";
+        cs-gpios = <&gpio 18 1          // device reg=<0>
+                    &gpio 19 1>;        // device reg=<1>
+    };
diff --git a/Documentation/devicetree/bindings/spi/fsl-spi.txt b/Documentation/devicetree/bindings/spi/fsl-spi.txt
deleted file mode 100644
index 0654380eb7515d8bda80eea1486e77b939ac38d8..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/spi/fsl-spi.txt
+++ /dev/null
@@ -1,62 +0,0 @@
-* SPI (Serial Peripheral Interface)
-
-Required properties:
-- cell-index : QE SPI subblock index.
-		0: QE subblock SPI1
-		1: QE subblock SPI2
-- compatible : should be "fsl,spi" or "aeroflexgaisler,spictrl".
-- mode : the SPI operation mode, it can be "cpu" or "cpu-qe".
-- reg : Offset and length of the register set for the device
-- interrupts : <a b> where a is the interrupt number and b is a
-  field that represents an encoding of the sense and level
-  information for the interrupt.  This should be encoded based on
-  the information in section 2) depending on the type of interrupt
-  controller you have.
-- clock-frequency : input clock frequency to non FSL_SOC cores
-
-Optional properties:
-- cs-gpios : specifies the gpio pins to be used for chipselects.
-  The gpios will be referred to as reg = <index> in the SPI child nodes.
-  If unspecified, a single SPI device without a chip select can be used.
-- fsl,spisel_boot : for the MPC8306 and MPC8309, specifies that the
-  SPISEL_BOOT signal is used as chip select for a slave device. Use
-  reg = <number of gpios> in the corresponding child node, i.e. 0 if
-  the cs-gpios property is not present.
-
-Example:
-	spi@4c0 {
-		cell-index = <0>;
-		compatible = "fsl,spi";
-		reg = <4c0 40>;
-		interrupts = <82 0>;
-		interrupt-parent = <700>;
-		mode = "cpu";
-		cs-gpios = <&gpio 18 1		// device reg=<0>
-			    &gpio 19 1>;	// device reg=<1>
-	};
-
-
-* eSPI (Enhanced Serial Peripheral Interface)
-
-Required properties:
-- compatible : should be "fsl,mpc8536-espi".
-- reg : Offset and length of the register set for the device.
-- interrupts : should contain eSPI interrupt, the device has one interrupt.
-- fsl,espi-num-chipselects : the number of the chipselect signals.
-
-Optional properties:
-- fsl,csbef: chip select assertion time in bits before frame starts
-- fsl,csaft: chip select negation time in bits after frame ends
-
-Example:
-	spi@110000 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "fsl,mpc8536-espi";
-		reg = <0x110000 0x1000>;
-		interrupts = <53 0x2>;
-		interrupt-parent = <&mpic>;
-		fsl,espi-num-chipselects = <4>;
-		fsl,csbef = <1>;
-		fsl,csaft = <1>;
-	};

-- 
2.48.0.rc1.219.gb6b6757d772



