Return-Path: <linuxppc-dev+bounces-5573-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C21A3A1CDDD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jan 2025 20:00:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yh17812zGz304N;
	Mon, 27 Jan 2025 05:59:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737917956;
	cv=none; b=RG22ipy8B/sVZ6QyjlAe/r3qftxOsTUePbMZCgR+lU2Z3ZiC5JRulMa0/4XqiSss7PYfSv6F7qAGBChqE4xdEvsMH184opoVoO7/Ax3vDJxG8Ec0hhg4sGkL+CGRXpE1reaMskVK8B1J0+b68npDjn6WBYLBOyy9Vg4UmA988vZxlE2TU0pUeNSEvxOk4VyCDt3Z6y3xzEis64y6tKXa+UtCTjM8p6kEAC7j59O0S5ZN8l8lqQdON3EWdi+FNbI0Ox7PllhNYqPT1PN02mszDfJXTPYQtvWi2/RyGSJAUNSOTAnPseOG3PvEn9c9Ft2GHi6zpHUqxoct5Xdees/QkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737917956; c=relaxed/relaxed;
	bh=a3gP9hrHRe1YZvlFd4RGEc/Gc1qPjZG5p8h85tWwAus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LHJyRg7NDg3bK1cKRwpU4ZFtFKhc4tslciky1DX23+fW5F8nMt9GPQv07GDeANnkPugj4xt6t3FHxnha9Aei7amW49Qa+S6yekoRHLjnVkzQxfo5LODkyzDt3luOzVtZ8lCuV+yYTBiyYXb62ztZs48Jvk2m8FKIfnBXoM4zkfebbgtfPaYWA6pQuLEKQIYWuL8KzDxjoCyE1c3qyYLxr5nz3biiz9MCNKFZJx9woEDvK+vQ0ytuo9wfZ3X4KQYfT79Ae7mQOOn47FG9rGX/laK67Tt8NzzFsUezEaprlNKr9ROgnQdEtEQPp3x+pyhCe+IdZME5m8JqhYRkPlnROA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=be1UuuLS; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=be1UuuLS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yh1772gx5z309h
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 05:59:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 68B93A41046;
	Sun, 26 Jan 2025 18:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E311C2BCAF;
	Sun, 26 Jan 2025 18:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737917946;
	bh=H4kNC/jXXBRPCf2MDF72WL9TzgWFC509BK+SO50HqC8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=be1UuuLSdxJmaARXIWcOv1jzKsdpeyWnnyCKPnxMkUviru2KALZpHpLYhcUKeSlr0
	 wCsVPF1gVfr918Hg5wFk5U0UEvS87EjDMeHmgPEz1Px0iZaPqQpQjEiTnWHQg55sDw
	 aY61xNTr6inkmTRWxAqtbij1UdWSaWa3KVJ4ifXMedX5MjL/+BqyBh1OIfpjvy1yrG
	 1wb3W2t8mSU+jyHEapgWKa/is6vJ5igNoubPpL/2cQ3X7FaeVqNUQ+0o5xW12iqayB
	 xyYpQqjOiDwt1PqedTDAyfi7j0B+Ltvpp2TQPfIV+COlHEZ7Mb2ioKgDvcnxLGMJ32
	 z7Ky3d2R51ZDg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E71C0218D;
	Sun, 26 Jan 2025 18:59:06 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 26 Jan 2025 19:59:04 +0100
Subject: [PATCH RFC 9/9] dt-bindings: nand: Convert fsl,elbc bindings to
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
Message-Id: <20250126-ppcyaml-v1-9-50649f51c3dd@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737917943; l=10572;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=lxtaXbwhrZfRbbjWoXllHChabX+zDomEeja/97bPnL0=;
 b=4aHykToIcBDXPGJ4bhvg4QsblNaqpXDo2KbDwaI7EygVFW6vPbQRY8lCXd2Tlmc0rlkGyz3CJ
 FGZGUHURdauBMOVkTRZNGh9QWkVU1QrFwlAZO8xPuP/eHiakmJMZj2Y
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

Convert the Freescale localbus controller bindings from text form to
YAML. The list of compatible strings reflects current usage.

Changes compared to the txt version:
 - removed the board-control (fsl,mpc8272ads-bcsr) node because it only
   appears in this example and nowhere else
 - added a new example with NAND flash

Remaining issues:
 - The localbus is not really a simple-bus: Unit addresses are not simply
   addresses on a memory bus. Instead, they have a format: The first cell
   is a chip select number, the remaining one or two cells are bus
   addresses.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml |  61 +++++++++
 .../bindings/powerpc/fsl/fsl,elbc-gpcm-uio.yaml    |  55 ++++++++
 .../devicetree/bindings/powerpc/fsl/fsl,elbc.yaml  | 150 +++++++++++++++++++++
 .../devicetree/bindings/powerpc/fsl/lbc.txt        |  43 ------
 4 files changed, 266 insertions(+), 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml b/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..127f164443972bbaf50fd9daa80c504577ddd7bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/fsl,elbc-fcm-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NAND flash attached to Freescale eLBC
+
+maintainers:
+  - J. Neuschäfer <j.ne@posteo.net>
+
+allOf:
+  - $ref: nand-chip.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,mpc8313-fcm-nand
+              - fsl,mpc8315-fcm-nand
+              - fsl,mpc8377-fcm-nand
+              - fsl,mpc8378-fcm-nand
+              - fsl,mpc8379-fcm-nand
+              - fsl,mpc8536-fcm-nand
+              - fsl,mpc8569-fcm-nand
+              - fsl,mpc8572-fcm-nand
+              - fsl,p1020-fcm-nand
+              - fsl,p1021-fcm-nand
+              - fsl,p1025-fcm-nand
+              - fsl,p2020-fcm-nand
+          - const: fsl,elbc-fcm-nand
+      - const: fsl,elbc-fcm-nand
+
+  reg:
+    maxItems: 1
+
+  "#address-cells": true
+
+  "#size-cells": true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    localbus {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        nand@1,0 {
+            #address-cells = <1>;
+            #size-cells = <1>;
+            compatible = "fsl,mpc8315-fcm-nand",
+                         "fsl,elbc-fcm-nand";
+            reg = <0x1 0x0 0x2000>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc-gpcm-uio.yaml b/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc-gpcm-uio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..60f849b79c11a4060f2fa4ab163f9fa9317df130
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc-gpcm-uio.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/powerpc/fsl/fsl,elbc-gpcm-uio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Userspace I/O interface for Freescale eLBC devices
+
+maintainers:
+  - J. Neuschäfer <j.ne@posteo.net>
+
+properties:
+  compatible:
+    const: fsl,elbc-gpcm-uio
+
+  reg:
+    maxItems: 1
+
+  elbc-gpcm-br:
+    description: Base Register (BR) value to set
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  elbc-gpcm-or:
+    description: Option Register (OR) value to set
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  device_type: true
+
+  interrupts:
+    maxItems: 1
+
+  uio_name:
+    $ref: /schemas/types.yaml#/definitions/string
+
+required:
+  - compatible
+  - reg
+  - elbc-gpcm-br
+  - elbc-gpcm-or
+
+additionalProperties: false
+
+examples:
+  - |
+    localbus {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        simple-periph@2,0 {
+            compatible = "fsl,elbc-gpcm-uio";
+            reg = <0x2 0x0 0x10000>;
+            elbc-gpcm-br = <0xfd810800>;
+            elbc-gpcm-or = <0xffff09f7>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc.yaml b/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6bbceb82c77826499abe85879e9189b18d396eea
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc.yaml
@@ -0,0 +1,150 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/powerpc/fsl/fsl,elbc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale Enhanced Local Bus Controller
+
+maintainers:
+  - J. Neuschäfer <j.ne@posteo.net>
+
+properties:
+  $nodename:
+    pattern: "^localbus@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,mpc8313-elbc
+              - fsl,mpc8315-elbc
+              - fsl,mpc8377-elbc
+              - fsl,mpc8378-elbc
+              - fsl,mpc8379-elbc
+              - fsl,mpc8536-elbc
+              - fsl,mpc8569-elbc
+              - fsl,mpc8572-elbc
+              - fsl,p1020-elbc
+              - fsl,p1021-elbc
+              - fsl,p1023-elbc
+              - fsl,p2020-elbc
+              - fsl,p2041-elbc
+              - fsl,p3041-elbc
+              - fsl,p4080-elbc
+              - fsl,p5020-elbc
+              - fsl,p5040-elbc
+          - const: fsl,elbc
+          - const: simple-bus
+
+      - items:
+          - const: fsl,mpc8272-localbus
+          - const: fsl,pq2-localbus
+
+      - items:
+          - enum:
+              - fsl,mpc8247-localbus
+              - fsl,mpc8248-localbus
+              - fsl,mpc8360-localbus
+          - const: fsl,pq2pro-localbus
+          - const: simple-bus
+
+      - items:
+          - enum:
+              - fsl,mpc8540-localbus
+              - fsl,mpc8544-lbc
+              - fsl,mpc8544-localbus
+              - fsl,mpc8548-lbc
+              - fsl,mpc8548-localbus
+              - fsl,mpc8560-localbus
+              - fsl,mpc8568-localbus
+          - const: fsl,pq3-localbus
+          - const: simple-bus
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#address-cells":
+    enum: [2, 3]
+    description: |
+      The first cell is the chipselect number, and the remaining cells are the
+      offset into the chipselect.
+
+  "#size-cells":
+    enum: [1, 2]
+    description: |
+      Either one or two, depending on how large each chipselect can be.
+
+  ranges:
+    description: |
+      Each range corresponds to a single chipselect, and covers the entire
+      access window as configured.
+
+patternProperties:
+  "^.*@.*$":
+    type: object
+
+additionalProperties: false
+
+examples:
+  - |
+    localbus@f0010100 {
+        compatible = "fsl,mpc8272-localbus",
+                     "fsl,pq2-localbus";
+        #address-cells = <2>;
+        #size-cells = <1>;
+        reg = <0xf0010100 0x40>;
+
+        ranges = <0x0 0x0 0xfe000000 0x02000000
+                  0x1 0x0 0xf4500000 0x00008000
+                  0x2 0x0 0xfd810000 0x00010000>;
+
+        flash@0,0 {
+            compatible = "jedec-flash";
+            reg = <0x0 0x0 0x2000000>;
+            bank-width = <4>;
+            device-width = <1>;
+        };
+
+        simple-periph@2,0 {
+            compatible = "fsl,elbc-gpcm-uio";
+            reg = <0x2 0x0 0x10000>;
+            elbc-gpcm-br = <0xfd810800>;
+            elbc-gpcm-or = <0xffff09f7>;
+        };
+    };
+
+  - |
+    localbus@e0005000 {
+        #address-cells = <2>;
+        #size-cells = <1>;
+        compatible = "fsl,mpc8315-elbc", "fsl,elbc", "simple-bus";
+        reg = <0xe0005000 0x1000>;
+        interrupts = <77 0x8>;
+        interrupt-parent = <&ipic>;
+
+        ranges = <0x0 0x0 0xfe000000 0x00800000
+                  0x1 0x0 0xe0600000 0x00002000
+                  0x2 0x0 0xf0000000 0x00020000
+                  0x3 0x0 0xfa000000 0x00008000>;
+
+        flash@0,0 {
+            #address-cells = <1>;
+            #size-cells = <1>;
+            compatible = "cfi-flash";
+            reg = <0x0 0x0 0x800000>;
+            bank-width = <2>;
+            device-width = <1>;
+        };
+
+        nand@1,0 {
+            #address-cells = <1>;
+            #size-cells = <1>;
+            compatible = "fsl,mpc8315-fcm-nand",
+                         "fsl,elbc-fcm-nand";
+            reg = <0x1 0x0 0x2000>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/lbc.txt b/Documentation/devicetree/bindings/powerpc/fsl/lbc.txt
deleted file mode 100644
index 1c80fcedebb52049721fbd61c4dd4c57133bd47c..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/powerpc/fsl/lbc.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-* Chipselect/Local Bus
-
-Properties:
-- name : Should be localbus
-- #address-cells : Should be either two or three.  The first cell is the
-                   chipselect number, and the remaining cells are the
-                   offset into the chipselect.
-- #size-cells : Either one or two, depending on how large each chipselect
-                can be.
-- ranges : Each range corresponds to a single chipselect, and cover
-           the entire access window as configured.
-
-Example:
-	localbus@f0010100 {
-		compatible = "fsl,mpc8272-localbus",
-			   "fsl,pq2-localbus";
-		#address-cells = <2>;
-		#size-cells = <1>;
-		reg = <0xf0010100 0x40>;
-
-		ranges = <0x0 0x0 0xfe000000 0x02000000
-			  0x1 0x0 0xf4500000 0x00008000
-			  0x2 0x0 0xfd810000 0x00010000>;
-
-		flash@0,0 {
-			compatible = "jedec-flash";
-			reg = <0x0 0x0 0x2000000>;
-			bank-width = <4>;
-			device-width = <1>;
-		};
-
-		board-control@1,0 {
-			reg = <0x1 0x0 0x20>;
-			compatible = "fsl,mpc8272ads-bcsr";
-		};
-
-		simple-periph@2,0 {
-			compatible = "fsl,elbc-gpcm-uio";
-			reg = <0x2 0x0 0x10000>;
-			elbc-gpcm-br = <0xfd810800>;
-			elbc-gpcm-or = <0xffff09f7>;
-		};
-	};

-- 
2.48.0.rc1.219.gb6b6757d772



