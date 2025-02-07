Return-Path: <linuxppc-dev+bounces-5954-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7B7A2CF1B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 22:30:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqRwJ5PR6z30NF;
	Sat,  8 Feb 2025 08:30:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738963840;
	cv=none; b=cYWEwNPhZz0THQISwSVSyruLlZWTlZe7BXaBbxIQI7E2pknK+aZk8WrMFY/dr70muvP0lyDpWLNRLt/P1oUb8PD7MDyrYBLU83UjZeU63kV0Wneyw4f6lKXYRJcTw715kP8dlH4yh/06yvYIjlcibc8C78o43ckkCAe20FGBbPnCEDW90YnysuussfOsi6Z0/iRDoTNv7U3Lv9WLvuCxUClivb/0Rl9oxvURBcu7bMNgiqYT6sZyyVHaqsrfr2hG8tphXgMMLOIwI/dh9hxO5GdrcaqZe/rnLZPKob9Cvw583wzUV3nyuKT7s/s8iPZSatQijdF2AvbsWkz68tfMnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738963840; c=relaxed/relaxed;
	bh=IFYABayod3k9c6Ta2e97QlPNs5gGr0IXeGK7zi3XkmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hDVXNzAj4H1cxtpTcTxb251tklByO3RDBGUCDcrx0cQwyHuHP5rDo+5egTZ8FCTgk47Ci9jmHQh+LiHbJGKzwtggXT6Yu43HhLIyZqAXW00pWb/FhbQP+/6J7v2bRyTZTIjsKhrWuVlULMsLooCaRzBON49VRmR3+uqtaB8PNJ+vN5QLNmmTCzls295lZ0bYNYoHENis67IbPx4rQyG44RmuktIDSy1ayUmpwHI9r5qLtvK1w8gJds6DesrxJdms6y5mi23P9JoOZEdbMenvC5EBq4rIvYOxq39hVyhO3kd4c+G5HsX6bQRsPe8szoLqRwZQqrnH0MczzDuHox97Nw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oM70wMCb; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oM70wMCb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqRwH1zKpz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 08:30:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 98D5BA43D0A;
	Fri,  7 Feb 2025 21:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F2F6C4CEF1;
	Fri,  7 Feb 2025 21:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738963835;
	bh=VDKy0G4btahVEWRST+u5g6rVWKGNcsy17PizxiolF6c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oM70wMCbm8HWkBH6z7oKM1NUTfn70hHgBbUHq/YjJzO/mUBDv64r+HuhEsfCBYc2F
	 iAAbrZrZryeZ9y8SvQwRAyXqbNHsGMLN9mcmvElMEsIiUfq8KorF3t49jyEVCsg3rw
	 SYenBMNYx9Y4lV3BOZXh0qdhXrVWXhA2CPD5ZgBzuRg8ZblSNd1/siDeehl0uFVDwK
	 DSB0qa9hwYW4bBFO3Q6YuRhZ4fljDodOalRcZwvpqegMK654OTH07R9Kl8P3hznWRh
	 XMzykbNRbT9GIPDWK/l5G/ZoWgUUM5OAZSRB9Vd6eCT+bzP10hWmxkdQ1hHKShCp9v
	 cXo+yopl3mY+w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E52EC0219E;
	Fri,  7 Feb 2025 21:30:35 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 07 Feb 2025 22:30:21 +0100
Subject: [PATCH v2 04/12] dt-bindings: mfd: Convert fsl,mcu-mpc8349emitx to
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
Message-Id: <20250207-ppcyaml-v2-4-8137b0c42526@posteo.net>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
In-Reply-To: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
To: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: imx@lists.linux.dev, Scott Wood <oss@buserror.net>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738963832; l=2984;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=uDy6u7+vjMysytDO3zWjx3Kn3oUqiW3GteoXfkCwZKA=;
 b=iFXGU+mNZUpUqA9uza05gJYMsMBoJdg86aLQh1PgURVUwU/03DcfeAfebz0wdehh60plhBbPb
 sqQK+Qjx2SFBGdyjhZLJG40nneXpeIDU6GM+y26pfUBo0zsE2hF9wE4
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

Convert mcu-mpc8349emitx.txt to YAML and list the compatible strings
currently in use.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

V2:
- trim subject line (remove "binding")
- fix property order to comply with dts coding style
---
 .../bindings/mfd/fsl,mcu-mpc8349emitx.yaml         | 53 ++++++++++++++++++++++
 .../bindings/powerpc/fsl/mcu-mpc8349emitx.txt      | 17 -------
 2 files changed, 53 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/fsl,mcu-mpc8349emitx.yaml b/Documentation/devicetree/bindings/mfd/fsl,mcu-mpc8349emitx.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d20de7a4142546c95f65814a3f1b03dd0949cffb
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/fsl,mcu-mpc8349emitx.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/fsl,mcu-mpc8349emitx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MPC8349E-mITX-compatible Power Management Micro Controller Unit (MCU)
+
+maintainers:
+  - J. Neuschäfer <j.ne@posteo.net>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,mc9s08qg8-mpc8315erdb
+              - fsl,mc9s08qg8-mpc8349emitx
+              - fsl,mc9s08qg8-mpc8377erdb
+              - fsl,mc9s08qg8-mpc8378erdb
+              - fsl,mc9s08qg8-mpc8379erdb
+          - const: fsl,mcu-mpc8349emitx
+
+  reg:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - gpio-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mcu@a {
+            compatible = "fsl,mc9s08qg8-mpc8349emitx",
+                         "fsl,mcu-mpc8349emitx";
+            reg = <0x0a>;
+            #gpio-cells = <2>;
+            gpio-controller;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/mcu-mpc8349emitx.txt b/Documentation/devicetree/bindings/powerpc/fsl/mcu-mpc8349emitx.txt
deleted file mode 100644
index 37f91fa576545aa245d893c24248bdbb2c0fcc07..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/powerpc/fsl/mcu-mpc8349emitx.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Freescale MPC8349E-mITX-compatible Power Management Micro Controller Unit (MCU)
-
-Required properties:
-- compatible : "fsl,<mcu-chip>-<board>", "fsl,mcu-mpc8349emitx".
-- reg : should specify I2C address (0x0a).
-- #gpio-cells : should be 2.
-- gpio-controller : should be present.
-
-Example:
-
-mcu@a {
-	#gpio-cells = <2>;
-	compatible = "fsl,mc9s08qg8-mpc8349emitx",
-		     "fsl,mcu-mpc8349emitx";
-	reg = <0x0a>;
-	gpio-controller;
-};

-- 
2.48.0.rc1.219.gb6b6757d772



