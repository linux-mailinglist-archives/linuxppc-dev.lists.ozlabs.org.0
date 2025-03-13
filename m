Return-Path: <linuxppc-dev+bounces-7018-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6209A6037A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 22:36:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDLQd5N8dz3cPb;
	Fri, 14 Mar 2025 08:35:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741901753;
	cv=none; b=RZK8tUCAz+O+RNHxIktOPWTqYQ4QsaaKhW5BWpt9m209gokZq0hL/2VtpDjWNredqGhECFupJXjFHjZ1M2KfpCjPH7k5u5pAsDbna9wyf1FZeQBeHkBzIpDX6h9wRH1ETzoMN5vI7Y5ORI7JG2VFFPT+CXaNrpI9VPcaiupKRxfM1Nx2sMNSL83zLKlxU1Awg8RYxgCO00dF87cpysVafSYcpr7Pw12EQHr3Qjal6WNzfAmvnrbi/GPdYJPMblnHNkMvsLGKSnlNE4g1WzDJNGhI2N2Jv5lASdIbEwpqKOe483FnpvyNrxWftXJ6eYe47oZ/J9OMR6wARxUHAVmvkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741901753; c=relaxed/relaxed;
	bh=EA+B82iiydaU/MlxLEgaeQ9eu+6EP3TJyISOq5ny9DA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oPV7GgnpK61IkKeQoJDT0St5Yk8F/edZeaJ95mR5VZMss2I/GCmqtXAo/aVt/TTsyKEcgmNI07PpVNO310OjalN2rJHoozkJG6qfiuvoOXX0hkTwUeRBmCU6MX6v+U9gtQL4mH6vtx97hDLLXRDfbEj4dVSIENwNQt/FO5tnk8s5J3hrSjY88Sn6e3yRUho0URrm3GEygFF7NEdOvWeIT3gIbywscyLF779vEKzJZEcxpLP4zuj44uqAvNCg7EgGxrFXXlFQTN2VHdZVwsHQdyaQ8rmrloCK9F3pp5Rivsa2kChXMZeHCAWTNAoYZnn0wgj+u9Wz6Vnw+2f+5nPhnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QW0MLg40; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QW0MLg40;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDLQb4ZzFz3blH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 08:35:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9618CA48768;
	Thu, 13 Mar 2025 21:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D90AC4CEF4;
	Thu, 13 Mar 2025 21:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741901747;
	bh=xfVlDIWb7tBNG5u+qIrOed5prmrJQ6hlz/f8edR8WxA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QW0MLg40IdheqHPcb3xjiXJ8ETQy/FY4z4AckSkbJdAwtLilGqV9gkWbk476Vzbzf
	 /v+XtBfBZu5mF3065TT59lE0+JMyg/Gb+kGrqHLv9rHuzD59NZ7sh8eAXzYgUO65HR
	 xzfFTdeYzU48LSHgi/qOF8xFb1m5fL9qxVivo5GE/dTclwgAosVrheqDjshKSzdGU5
	 hUcoLGmTbkmEah6YQ0ZfVM1RVli+M98n1m6MizkOLjmy/OB8E2qS6gK+6ReFi7V48F
	 cpZ+nTXkMgekd2psuVqrb3ijSHEQDt5SaQa7XZAiMjhJDcEMsr/ZvCXIZEjdgkITgT
	 BgZoR1FbBsdlA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C248C282DE;
	Thu, 13 Mar 2025 21:35:47 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 13 Mar 2025 22:35:47 +0100
Subject: [PATCH v4 4/4] dt-bindings: memory-controllers: Convert fsl,elbc
 to YAML
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
Message-Id: <20250313-ppcyaml-elbc-v4-4-55903722d9ea@posteo.net>
References: <20250313-ppcyaml-elbc-v4-0-55903722d9ea@posteo.net>
In-Reply-To: <20250313-ppcyaml-elbc-v4-0-55903722d9ea@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741901745; l=8374;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=8cRBcRI9qOww6+AJHQMBFzW6gxF7aVnTPI6Wpertk80=;
 b=2a9l+KHpTRc0QQI1uJ4zWN3wm+6XMRM/z34UuZ9c5W7KoqGEjSuTsnKw4zJZyDM+cFdqsZz80
 qRjCZJMOvK4Dqj8b218YyDfxnwMs8+8rUK6Rvkel0MQcuqT3rUppfpu
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

Convert the Freescale localbus controller bindings from text form to
YAML. Compared to the .txt version, the YAML binding contains a new
usage example with FCM NAND flash, and a full list of compatible strings
based on current usage in arch/powerpc/boot/dts/.

Note that the both the compatible strings and the unit address format
are kept as-is, for compatibility with existing kernels and device
trees, as well as unit address readability. This results in dts
validation warnings:

  Warning (simple_bus_reg): /example-0/localbus@f0010100/board-control@1,0:
  simple-bus unit address format error, expected "100000000"

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

V4:
- no changes

V3:
- move this patch after the GPCM/FCM patches to dtschema/dtc warnings
  due to missing bindings for fsl,elbc-gpcm-uio and fsl,elbc-fcm-nand
- add "simple-bus" again, for compatibility with existing DTs/drivers
  based on discussion with Crystal Wood and Rob Herring
- fix fsl,pq2-localbus compatible properties based on mgcoge.dts / ep8248e.dts
  (was missing "simple-bus")
- add board-control (bcsr) example again, now using the compatible
  string listed in Documentation/devicetree/bindings/board/fsl,bcsr.yaml
- remove interrupt-parent property from example
- rework the commit message

V2:
- fix order of properties in examples, according to dts coding style
- move to Documentation/devicetree/bindings/memory-controllers
- clarify the commit message a tiny bit
- remove unnecessary multiline markers (|)
- define address format in patternProperties
- trim subject line (remove "binding")
- remove use of "simple-bus", because it's technically incorrect
---
 .../bindings/memory-controllers/fsl,elbc.yaml      | 158 +++++++++++++++++++++
 .../devicetree/bindings/powerpc/fsl/lbc.txt        |  43 ------
 2 files changed, 158 insertions(+), 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl,elbc.yaml b/Documentation/devicetree/bindings/memory-controllers/fsl,elbc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..620d7e7c62df35c754a01498391d35ede03cdf87
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/fsl,elbc.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/fsl,elbc.yaml#
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
+          - enum:
+              - fsl,mpc8247-localbus
+              - fsl,mpc8248-localbus
+              - fsl,mpc8272-localbus
+          - const: fsl,pq2-localbus
+          - const: simple-bus
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
+    description:
+      The first cell is the chipselect number, and the remaining cells are the
+      offset into the chipselect.
+
+  "#size-cells":
+    enum: [1, 2]
+    description:
+      Either one or two, depending on how large each chipselect can be.
+
+  ranges:
+    description:
+      Each range corresponds to a single chipselect, and covers the entire
+      access window as configured.
+
+patternProperties:
+  # format: name@chipselect,address
+  "^.*@[0-9a-f]+,[0-9a-f]+$":
+    type: object
+
+additionalProperties: false
+
+examples:
+  - |
+    localbus@f0010100 {
+        compatible = "fsl,mpc8272-localbus",
+                     "fsl,pq2-localbus",
+                     "simple-bus";
+        reg = <0xf0010100 0x40>;
+        ranges = <0x0 0x0 0xfe000000 0x02000000
+                  0x1 0x0 0xf4500000 0x00008000
+                  0x2 0x0 0xfd810000 0x00010000>;
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        flash@0,0 {
+            compatible = "jedec-flash";
+            reg = <0x0 0x0 0x2000000>;
+            bank-width = <4>;
+            device-width = <1>;
+        };
+
+        board-control@1,0 {
+            reg = <0x1 0x0 0x20>;
+            compatible = "fsl,mpc8360mds-bcsr";
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
+        compatible = "fsl,mpc8315-elbc", "fsl,elbc", "simple-bus";
+        reg = <0xe0005000 0x1000>;
+        ranges = <0x0 0x0 0xfe000000 0x00800000
+                  0x1 0x0 0xe0600000 0x00002000
+                  0x2 0x0 0xf0000000 0x00020000
+                  0x3 0x0 0xfa000000 0x00008000>;
+        #address-cells = <2>;
+        #size-cells = <1>;
+        interrupts = <77 0x8>;
+
+        flash@0,0 {
+            compatible = "cfi-flash";
+            reg = <0x0 0x0 0x800000>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            bank-width = <2>;
+            device-width = <1>;
+        };
+
+        nand@1,0 {
+            compatible = "fsl,mpc8315-fcm-nand",
+                         "fsl,elbc-fcm-nand";
+            reg = <0x1 0x0 0x2000>;
+            #address-cells = <1>;
+            #size-cells = <1>;
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



