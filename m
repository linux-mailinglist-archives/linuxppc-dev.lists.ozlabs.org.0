Return-Path: <linuxppc-dev+bounces-6508-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC53A46741
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 18:02:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z313N4Tw2z3bnJ;
	Thu, 27 Feb 2025 04:01:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740589312;
	cv=none; b=HTn8BnJrnjeL9j34/r8tdtCzGcJY1WeRlA3lyre6EXazeRReDQvKvRS5QckKiaNrw2JoAb+S8HXu32rgOuw9xptSY8Q+G9+lvXKYQJn1h5DhRPWwQOPnvHlg5M2j0TMLn8D8gZ4wc+uOzsXU/fJhFqsCh+FBHLFzvLuiGeKnEDlOk0w8XkQ9alqfJy04MgvMvMxtzS7RFImPUaZuOkpnNs1IGOL1KTxNgK57qEX3cHz1gfZWcWj36IZU9437Ee90eCabbj1SowLjcNiwqxvA0njL9VLoznvlut2wttur6JroUA0K5TDw1Vl0iNOLm4BrrNx5xtVOALYfDtRS1vKv4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740589312; c=relaxed/relaxed;
	bh=qyD6j1yrjnrHNHbvb9FnvyfrlHaW5ww6Rt3ggrWgUW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BSO6XR22d7a2Go++HS2SnEEyxe21v/fKg49mVvikOY8Sw+vyEw27A+dLExBBMa+EhbGwsCwm3KRd3nhst1Dnd+kU+bYCyEHkevA94CijhWH/YaMAlydYJnVdD/IRPCFxPXDqnOvwq0ZBgF9060L92NdIMxWPaa3xYq/gcRdL7YAb0AYaVW7Kj8wnHvncOprdm10wrnNgX0axIlqWC0S+J+AQeZohhzco5oMFYr+zcY8ESBUjGpc4rGLPLG6omq5MKBX+9ZmRhPIvy4tb+ESm1zPAXJcbmYkXu/LHFm6WYydBiSfBY9GnsExhjfEDYLm969/fUtLeHcfJpEQ7FoBxlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sBZS1+L1; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sBZS1+L1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z313L5mPDz3bmc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2025 04:01:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9291D5C71DE;
	Wed, 26 Feb 2025 17:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BEDD5C4CEEC;
	Wed, 26 Feb 2025 17:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740589307;
	bh=QQwe7frkPLiG0/6yEWjwrkZeiFElFPTH1milbTP8oOg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sBZS1+L1dppR2nGEQBEW/FtdukTtTgelbWn81KiFMjJONGCsLCVfNC8RQsxhKYP1p
	 vGxOLpy2ST5YMA5FvKMiv0weD7EMYnceVngok7c92fr3Yvv6AuH43Q4SlJPAUnBiSb
	 2uxtZOnjoKbfc4wc6tHQ0sZVdJ8Ppp2CQYbmEHIpe8ppuj4vFMGM8x0miqlZrr+E+2
	 HIO1Dm4fiS4CaMiLxN2RGplCNgmuoV3DqfsWXebleHnQojuVZrco5CGo7drk89iMCb
	 YZJCIOBPNBZXPDlEqimsQEPxjHW789zaEQ5TvEw0httz2jjDcElzjTUc4bqYl7p7Dj
	 niogLi7jESYxw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE2EBC021B8;
	Wed, 26 Feb 2025 17:01:47 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Wed, 26 Feb 2025 18:01:42 +0100
Subject: [PATCH v3 3/3] dt-bindings: memory-controllers: Convert fsl,elbc
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
Message-Id: <20250226-ppcyaml-elbc-v3-3-a90ed71da838@posteo.net>
References: <20250226-ppcyaml-elbc-v3-0-a90ed71da838@posteo.net>
In-Reply-To: <20250226-ppcyaml-elbc-v3-0-a90ed71da838@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740589304; l=8353;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=g63poVaOK5CiSbGFyvvaF6alaFEpjLkgBPGFV9y2RHk=;
 b=HVHJJV6qTgqo15QM2iJ0BGM4NK6dglwow10aizwQArU7JeP94qUGwUQHekTXT5jP5Cbn07b+r
 1nQZ+GtZl5hBMTv0csrKAcUI4d8J71YfGajE0vLg7T+qg/wl+LwJ0+k
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
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



