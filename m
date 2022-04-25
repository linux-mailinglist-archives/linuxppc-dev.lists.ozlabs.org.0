Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B6E50E294
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 16:03:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kn6Dr6J2Sz3c8M
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 00:03:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=JkkjRENv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=2a01:4f8:151:8464::1:2;
 helo=ssl.serverraum.org; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=JkkjRENv; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kn6CY3mFNz2yb6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 00:02:33 +1000 (AEST)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 267B922248;
 Mon, 25 Apr 2022 16:02:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1650895344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zxpt+P2/TjbAsFLFo9zxjw6TUQFtzK8CrPo1AAgUn9I=;
 b=JkkjRENvmm37PQILYRfSyk3KDcHOWnCUw5+wVDLkhGMfxR6Y6u2E3IyftnpRInVgLgHLlg
 +clgR21tFwJOaOIaTOTFC6/UKeFJnAn1qdoBZ0o1kDr31Mjkvv6YjXRCbfay3ng3YaIEBI
 wAtoYTC69BMGtZY4z9GCKQoLwupZNUY=
From: Michael Walle <michael@walle.cc>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 2/2] dt-bindings: fsl: convert fsl,layerscape-scfg to YAML
Date: Mon, 25 Apr 2022 16:02:14 +0200
Message-Id: <20220425140214.32448-2-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220425140214.32448-1-michael@walle.cc>
References: <20220425140214.32448-1-michael@walle.cc>
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

Convert the fsl,layerscape-scfg binding to the new YAML format.

In the device trees, the device node always have a "syscon"
compatible, which wasn't mentioned in the previous binding.

Also added, compared to the original binding, is the
interrupt-controller subnode as used in arch/arm/boot/dts/ls1021a.dtsi
as well as the litte-endian and big-endian properties.

Signed-off-by: Michael Walle <michael@walle.cc>
---
changes since v1:
 - moved to soc/fsl/fsl,layerscape-scfg.yaml
 - generic name for node in example
 - mention added "syscon" compatible in commit message
 - reference specific interrupt controller

 .../arm/freescale/fsl,layerscape-scfg.txt     | 19 ------
 .../bindings/soc/fsl/fsl,layerscape-scfg.yaml | 58 +++++++++++++++++++
 2 files changed, 58 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,layerscape-scfg.txt
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,layerscape-scfg.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,layerscape-scfg.txt
deleted file mode 100644
index 0ab67b0b216d..000000000000
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,layerscape-scfg.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-Freescale SCFG
-
-SCFG is the supplemental configuration unit, that provides SoC specific
-configuration and status registers for the chip. Such as getting PEX port
-status.
-
-Required properties:
-  - compatible: Should contain a chip-specific compatible string,
-	Chip-specific strings are of the form "fsl,<chip>-scfg",
-	The following <chip>s are known to be supported:
-	ls1012a, ls1021a, ls1043a, ls1046a, ls2080a.
-
-  - reg: should contain base address and length of SCFG memory-mapped registers
-
-Example:
-	scfg: scfg@1570000 {
-		compatible = "fsl,ls1021a-scfg";
-		reg = <0x0 0x1570000 0x0 0x10000>;
-	};
diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml
new file mode 100644
index 000000000000..8d088b5fe823
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale Layerscape Supplemental Configuration Unit
+
+maintainers:
+  - Shawn Guo <shawnguo@kernel.org>
+  - Li Yang <leoyang.li@nxp.com>
+
+description: |
+  SCFG is the supplemental configuration unit, that provides SoC specific
+  configuration and status registers for the chip. Such as getting PEX port
+  status.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,ls1012a-scfg
+          - fsl,ls1021a-scfg
+          - fsl,ls1028a-scfg
+          - fsl,ls1043a-scfg
+          - fsl,ls1046a-scfg
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  little-endian: true
+  big-endian: true
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^interrupt-controller@[a-z0-9]+$":
+    $ref: /schemas/interrupt-controller/fsl,ls-extirq.yaml#
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@1570000 {
+        compatible = "fsl,ls1021a-scfg", "syscon";
+        reg = <0x1570000 0x10000>;
+    };
-- 
2.30.2

