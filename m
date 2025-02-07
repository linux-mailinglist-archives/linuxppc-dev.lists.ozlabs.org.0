Return-Path: <linuxppc-dev+bounces-5956-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA4BA2CF2B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 22:31:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqRwL2QT0z30VS;
	Sat,  8 Feb 2025 08:30:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738963842;
	cv=none; b=Mo5v4N9OmsHTf9oULAKOnsEIlzlDT7fyLmnVFFOEbDt/tpkHJJYMIzyPlbSFfXTMObexfnVldCRRhb9MbFH88jS4ORyJ3Do6NCpdJhxsNpvq4IWXT0amSfbGPoVQw79hFEiLGc7Boxxx/9mLi7YqEvD3LpGvmQz1rfRiEZr4azslxB6B5/WYdCIFzijOGyS6g0Hf/SfiKB5R8eYe0NJ/dl85DuJg7OD3nDHU9P3NTON+Odod9cgR37HBxSYljml9aTjgFgf3YRugoIkkvpeIL0rozi36rFYVKXE9hoBGbtof22ZTp/ZWW6Jhv7z5J0ii4v+g6xfAq+dFPWYWIQ06fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738963842; c=relaxed/relaxed;
	bh=fGZT8Y8fr8Zq9yg5mYdeARw7GNPmBIELTw4XM5CycBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MBehNUMJsmPpYmLi/DpTOFrdKL2/6gbkxSRSrmqZlwQxL3vKZNfPy+Q9j2eVxUtIqMt1IfIpYroWDNmu8KgBK2tpMYFNHHJxC567BJ0POcNP09uKnCTHgiMyS+Q1PPgCiSXZ2RsD9X9pGmqC/79euizoMXSE/UauUV84LN3LRoK2FcXB75p/Djb+vNP89loC/Jpv8raQm6bWoIW2AftifTKLHZrPIPsb67YCxJsj0CQydoK3HXZlOFwO/sKvUbRA+dCzJ9s7KRgy4P2Dn16tgfvjSRbE7CYkWBEC7wOwO422NaWsmEg8PHcMaViMkmAOst06KM2L9jlcwO2f0C/nAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JiBlDHg6; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JiBlDHg6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqRwJ12Zkz2yjb
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 08:30:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0BF3A5C71CF;
	Fri,  7 Feb 2025 21:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2056DC4CEE4;
	Fri,  7 Feb 2025 21:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738963835;
	bh=Yko99go3545UAB2s6Emx2EMK5jUBtBhobNj/oRqGi+w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JiBlDHg6ZSDyxbhNeVBdiYDu0RTc2VmBhCvC/9Ujwk3f08unB+9u5VSyNP5fQ59+w
	 gYPjTe20zFKpi67KhwKIKAoPCLNDSRlnTW3ewUFAdPPg8bjAQ/Ma0HkbRFgHxavBeG
	 3ZSWE/0FDmdZCUjyankvfSGGR+T0BAiTRScMiHob6XcDelVXWnq9G3MJAwtEiJcGys
	 sZ8QrQU2yz7KQrm8VtXHiG73zpbiXyGkW/1a7oxgAjE1oglLwipJP3oHWRIcYUVYSS
	 gpBk4mR0xSzCmZf2b8VkVPKPeJDpBPbUZmVsri9PKVGilHnUzj+LOeGE5WtNAq9TAE
	 z6+Pq5a+E5q8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DB1C02196;
	Fri,  7 Feb 2025 21:30:35 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 07 Feb 2025 22:30:18 +0100
Subject: [PATCH v2 01/12] dt-bindings: powerpc: Add Freescale/NXP MPC83xx
 SoCs
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
Message-Id: <20250207-ppcyaml-v2-1-8137b0c42526@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738963832; l=2727;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=+DtXHVhCbOjn2pFTbqRWo5Ja3tlRCt7VFujPhHnXDOo=;
 b=54lqxy1ufYEIepdx+xHdUJx6JcOYaLxP/9DdiR0f6dmwQhVzKAJEIXbhq9mtePiM8uZ3aOyby
 Do8ItLmBFxhAnsOoEwKoXSekGVjsFNxzqD5f2ZqqDPjxCvL/6gHEYYX
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

Add a new binding for MPC83xx platforms, describing the board compatible
strings used in currently existing device trees.

Note that the SoC bus is called immr@... in many existing devicetrees,
but this contradicts the simple-bus binding.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

V2:
- trim subject line
- fix property order to comply with dts coding style
- add Rob Herrings's R-b tag
---
 .../bindings/powerpc/fsl/fsl,mpc83xx.yaml          | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fsl,mpc83xx.yaml b/Documentation/devicetree/bindings/powerpc/fsl/fsl,mpc83xx.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1d7ed67473ca447e0fd2e9b8f30d20e18c601ccf
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/fsl/fsl,mpc83xx.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpc83xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale PowerQUICC II Pro (MPC83xx) platforms
+
+maintainers:
+  - J. Neuschäfer <j.ne@posteo.net>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: MPC83xx Reference Design Boards
+        items:
+          - enum:
+              - fsl,mpc8308rdb
+              - fsl,mpc8315erdb
+              - fsl,mpc8360rdk
+              - fsl,mpc8377rdb
+              - fsl,mpc8377wlan
+              - fsl,mpc8378rdb
+              - fsl,mpc8379rdb
+
+patternProperties:
+  "^soc@.*$":
+    type: object
+    properties:
+      compatible:
+        oneOf:
+          - items:
+              - enum:
+                  - fsl,mpc8315-immr
+                  - fsl,mpc8308-immr
+              - const: simple-bus
+          - items:
+              - const: fsl,mpc8360-immr
+              - const: fsl,immr
+              - const: fsl,soc
+              - const: simple-bus
+          - const: simple-bus
+
+additionalProperties: true
+
+examples:
+  - |
+    / {
+        compatible = "fsl,mpc8315erdb";
+        model = "MPC8315E-RDB";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        soc@e0000000 {
+            compatible = "fsl,mpc8315-immr", "simple-bus";
+            reg = <0xe0000000 0x00000200>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            device_type = "soc";
+            ranges = <0 0xe0000000 0x00100000>;
+            bus-frequency = <0>;
+        };
+    };
+
+...

-- 
2.48.0.rc1.219.gb6b6757d772



