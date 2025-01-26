Return-Path: <linuxppc-dev+bounces-5569-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9D0A1CDC5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jan 2025 19:59:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yh1761fkgz3054;
	Mon, 27 Jan 2025 05:59:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737917953;
	cv=none; b=NTmlrciSqrtJdFLasO66bILN9EdK3yZmOGHK+mq55ZKSm0TRJ0gjl/eCqz66v4a6bQBxdqQ8+9S5GDPjw32isLpCLWAJoYHO/4mvkGzNcSttsrNXkhtQd/68GCeC25Oc7in9j4peqVJvotogtLgr2c7JbfwkEaNAohB0N+e6GfELqDsnHFzUYk9fE016r7k22IRFDlkBi0xXNTLOaWFn05aKTCtfPOBqfQPbo/SY2Npg54mq1xECr9v0Fxnd98qdRQdQ4N3aibAcNcZumhNmef+jb50Az5bu/WYgjGpi93UH5hivMmr7Xti71B4VM2Q238ZBikkjRyBvW7GvT30vCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737917953; c=relaxed/relaxed;
	bh=nvZpXIT8ProfszRN6LTGGDXcQHksXNE5w/9Tp/mgkK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L2SbTGuzBIS1V1evsyJV286f2P/L5nGCtw+3itjyHWhcnYQMcnqHL7aVddobDHmro3huT4XZEvx3ohnidDy0NGCnf/0VN1mfhrurHgCTpyK1Dm6oi9lhhnvhkeDSqSZRdPk3ivo+QOxuJHD1Lgm9RXYq4Mfme5IBb3MQIPKOFxxIc+4XEHlZYrdsFZmyV332sAfqsddXw43+N1yB3errcchtiXEGWYoOOiJDRBtUu+strYFx1K9p0tnw38CjHyUk76AUsf8EOYqoeQVTr/4704d+hlMgetdlWBObjgEvDGqurO7VxNu9hndaeBwSkjHRr7ryaPjlO9ilIOu3hWDtKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=quQJIISy; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=quQJIISy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yh1726k4Jz2yFB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 05:59:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00AFDA41002;
	Sun, 26 Jan 2025 18:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3B89C4AF1B;
	Sun, 26 Jan 2025 18:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737917946;
	bh=5XCExjbd/gPubOXYpsr7rABeBjCpjSYExLXU0tOI0LY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=quQJIISy488kggkk/qUhZslV/d1ZmYFeRwALGcQEPbBi2h8W6Sm/5VO6z4kR/Et85
	 awiwKs4/D0MP7E2sSGTcR0+kJ2nQMt33AdJyeLP/TqNEkmn7kXSke/VBKc5yW1uOLa
	 kdO3UDYwEthSI6IVhJ8nGHlCEnQWtfS+py2lNy7qvx3uGROuwhkDgnFZQcOjTAxSyj
	 tqbP92gkkpqCzf/hZGhebqI4AQSglz8eX9qbjHd2exqXDFUaktnmljm0PbiR+X+8Je
	 QuYWxwV3c1jcUPoQ3KCCOY2m+Bt993vviFTXG/NLHI6p+CqVbxjbocJ0ox6FjrTLFe
	 2w1l4UX8HEzXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E2CC0218F;
	Sun, 26 Jan 2025 18:59:05 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 26 Jan 2025 19:59:01 +0100
Subject: [PATCH 6/9] dt-bindings: pci: Add fsl,mpc83xx-pcie bindings
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
Message-Id: <20250126-ppcyaml-v1-6-50649f51c3dd@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737917943; l=3075;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=FQ86ArTRbtYapZ+OdNjSwmXsUKuvNxgsJkLWcXU8vL4=;
 b=/vrsRJm6P5La8dsDwOVQ6eswy9pjJEMA+/9/xmb7cy6W3UlNGJUHTns1MgAOIJh2MnjMvbm71
 B7AFiUB9fFmCttFV7fseyezhA/JwDM7xbQO09sxNWHowpiclOJskGNT
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

Supplement Documentation/devicetree/bindings/pci/fsl,pci.txt with a more
formal binding in YAML format.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 .../devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml   | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml b/Documentation/devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..12e86a9c20dfe2362d11f085bd9ae47238c4a37f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MPC83xx PCI/PCI-X/PCIe controllers
+
+description: |
+  Binding for the PCI/PCI-X/PCIe host bridges on MPC8xxx SoCs.
+  See also: Documentation/devicetree/bindings/pci/fsl,pci.txt
+
+maintainers:
+  - J. Neuschäfer <j.neuschaefer@gmx.net>
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,mpc8308-pcie
+              - fsl,mpc8315-pcie
+              - fsl,mpc8377-pcie
+              - fsl,mpc8378-pcie
+          - const: fsl,mpc8314-pcie
+      - const: fsl,mpc8314-pcie
+      - items:
+          - const: fsl,mpc8360-pci
+          - const: fsl,mpc8349-pci
+      - const: fsl,mpc8349-pci
+      - items:
+          - const: fsl,mpc8540-pcix
+          - const: fsl,mpc8540-pci
+      - const: fsl,mpc8540-pci
+      - items:
+          - const: fsl,mpc8540-pcix
+          - const: fsl,mpc8540-pci
+      - const: fsl,mpc8548-pcie
+      - const: fsl,mpc8548-pcie
+      - const: fsl,mpc8641-pcie
+
+  reg:
+    minItems: 1
+    items:
+      - description: internal registers
+      - description: config space access registers
+
+  clock-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - reg
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pci1: pcie@e0009000 {
+        #address-cells = <3>;
+        #size-cells = <2>;
+        #interrupt-cells = <1>;
+        device_type = "pci";
+        compatible = "fsl,mpc8315-pcie", "fsl,mpc8314-pcie";
+        reg = <0xe0009000 0x00001000>;
+        ranges = <0x02000000 0 0xa0000000 0xa0000000 0 0x10000000
+                  0x01000000 0 0x00000000 0xb1000000 0 0x00800000>;
+        bus-range = <0 255>;
+        interrupt-map-mask = <0xf800 0 0 7>;
+        interrupt-map = <0 0 0 1 &ipic 1 IRQ_TYPE_LEVEL_LOW
+                         0 0 0 2 &ipic 1 IRQ_TYPE_LEVEL_LOW
+                         0 0 0 3 &ipic 1 IRQ_TYPE_LEVEL_LOW
+                         0 0 0 4 &ipic 1 IRQ_TYPE_LEVEL_LOW>;
+        clock-frequency = <0>;
+    };
+
+...

-- 
2.48.0.rc1.219.gb6b6757d772



