Return-Path: <linuxppc-dev+bounces-5958-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 304D8A2CF3A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 22:31:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqRwM4Hrkz30W9;
	Sat,  8 Feb 2025 08:30:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738963843;
	cv=none; b=j3DKnsB5/mqe2btoMXZmF0MytfRdczN6NW34N/CYJXClcnP6wTbXSw1uvSPtHtTxEJ3BkBwUE2ZdilVtLxzSTt0A4og/hUuX/w24sWXpTREq5rBgCOYd/bicNiqVEd15hA7pgBIpb0pLg//dNHaPpt0e0YTwS9udZFGe5YI4VyPsx9iYgZbR5mrDlzVgNiRB/z/83oRWgT5eM82FN1tcuuV1tKTaG5yoBtuIpM/uEDBdsSdwvkdCQDZhoMmjA47AMYA6wGNMEeuYNEqq0e64CjkxLcn2OMwpnLudbIfo9wwuiBVryzeIFpqcgshSk7WmKpEVZdu/IBm+iAnvS4qC4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738963843; c=relaxed/relaxed;
	bh=+k/JRf5Yyn3QVycUUJ57UMb1g2UcZGFkwWvnCcXMCbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HhWC94eRZiGRgGJVbY4oYeTOZILYMUbHGjiH5XREgN5guZVBLVil1ksMu2jA0jUNgr4OlkJpEkKG3KZyQvptXzm9XpKGvtpj2ns2BuWL/yFFfifP0M4qjFcW+XJ847FnBr2h+YGeGnCdksC9uuX9HTaaWWD8RJawxKnkg+21J/XxTzvQvyfCoS8SOqZaSCmWU4egKxUmU88qxAvPs5JGFPkE93oZyoH0KoVf5IdCEOC9rnKtheWhfSPAjNj9Lz53T0ajkjCLWmyV6uKKwXIzkAfRDlkwm4EN+bybo8P/HQJfD2pbUmOrLJMA5VtnbZ793bTbP3c+EOyI66v1njPAoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kNRibzA0; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kNRibzA0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqRwJ19QNz2ykc
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 08:30:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 80C41A43CF4;
	Fri,  7 Feb 2025 21:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DA76C4CEE6;
	Fri,  7 Feb 2025 21:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738963835;
	bh=nktEztgiNtX/g4rmdLEVKXUelw39pbboF7CNwlBd40Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kNRibzA0sw2Sw+B0fy2zZdwXVSxYwIYmTwqT33kjPkzxWMOTJkeCi7kZ+St1dYfJ8
	 sDsPsSvzLXHdK7tlUqACRftJt7E2CJ93vVMwrufGvdyalzrNO0up2+sN0gPyW5Bjuk
	 bq/+royUYXCZQ7BsBSVq8+G/SZ/L5oRONDOxcJNfGwws28/ZnwBbpD0jUFXJyyMbGJ
	 sMYQIW3/T7ibAELE7FzHc9n0ROzdEM5tdduEbXhUCz9oMQzTLKvi9eI2Rxjoc4faZN
	 3EUy9pC3HZ8m/nDI6FWey8qNm+N1t10AJzLBMdF3s+XseMSZjzyQDjr6Z9GPXGsJgL
	 YEZOfjytMwkow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2267DC0219D;
	Fri,  7 Feb 2025 21:30:35 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 07 Feb 2025 22:30:19 +0100
Subject: [PATCH v2 02/12] dt-bindings: ata: Convert fsl,pq-sata to YAML
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
Message-Id: <20250207-ppcyaml-v2-2-8137b0c42526@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738963832; l=3808;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=UpnIOgI342qJlYPCanJVhpXk4WK6YM5Ksj/vzI9NEeg=;
 b=IMEEL81nsnb2ijBv3LXOcNNng8dQqK5mDCiPuvJw5PIblvynwYV/YQROKecYzJSMsuTEb53Rb
 z5adZJegyg5CeBejUIlBGgfzgjd8CuS7MscsQzisoYwXCU7aFBlh0dZ
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

Convert the Freescale PowerQUICC SATA controller binding from text form
to YAML. The list of compatible strings reflects current usage.

To clarify the description, I changed it to mention "each SATA
controller" instead of each port.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

V2:
- remove unnecessary multiline marker (|)
- clarified controllers vs. ports in the description
- trim subject line (remove "binding")
---
 .../devicetree/bindings/ata/fsl,pq-sata.yaml       | 59 ++++++++++++++++++++++
 Documentation/devicetree/bindings/ata/fsl-sata.txt | 28 ----------
 2 files changed, 59 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/ata/fsl,pq-sata.yaml b/Documentation/devicetree/bindings/ata/fsl,pq-sata.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..97eea11b4fbbb773487c004abbedcb7bd290605c
--- /dev/null
+++ b/Documentation/devicetree/bindings/ata/fsl,pq-sata.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale 8xxx/3.0 Gb/s SATA nodes
+
+maintainers:
+  - J. Neuschäfer <j.ne@posteo.net>
+
+description:
+  SATA nodes are defined to describe on-chip Serial ATA controllers.
+  Each SATA controller should have its own node.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,mpc8377-sata
+              - fsl,mpc8536-sata
+              - fsl,mpc8315-sata
+              - fsl,mpc8379-sata
+          - const: fsl,pq-sata
+      - const: fsl,pq-sata-v2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  cell-index:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 3, 4]
+    description: |
+      1 for controller @ 0x18000
+      2 for controller @ 0x19000
+      3 for controller @ 0x1a000
+      4 for controller @ 0x1b000
+
+required:
+  - compatible
+  - interrupts
+  - cell-index
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    sata@18000 {
+        compatible = "fsl,mpc8379-sata", "fsl,pq-sata";
+        reg = <0x18000 0x1000>;
+        cell-index = <1>;
+        interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
+        interrupt-parent = <&ipic>;
+    };
diff --git a/Documentation/devicetree/bindings/ata/fsl-sata.txt b/Documentation/devicetree/bindings/ata/fsl-sata.txt
deleted file mode 100644
index fd63bb3becc9363c520a8fd06629fdc52c4d4299..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/ata/fsl-sata.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-* Freescale 8xxx/3.0 Gb/s SATA nodes
-
-SATA nodes are defined to describe on-chip Serial ATA controllers.
-Each SATA port should have its own node.
-
-Required properties:
-- compatible        : compatible list, contains 2 entries, first is
-		 "fsl,CHIP-sata", where CHIP is the processor
-		 (mpc8315, mpc8379, etc.) and the second is
-		 "fsl,pq-sata"
-- interrupts        : <interrupt mapping for SATA IRQ>
-- cell-index        : controller index.
-                          1 for controller @ 0x18000
-                          2 for controller @ 0x19000
-                          3 for controller @ 0x1a000
-                          4 for controller @ 0x1b000
-
-Optional properties:
-- reg               : <registers mapping>
-
-Example:
-	sata@18000 {
-		compatible = "fsl,mpc8379-sata", "fsl,pq-sata";
-		reg = <0x18000 0x1000>;
-		cell-index = <1>;
-		interrupts = <2c 8>;
-		interrupt-parent = < &ipic >;
-	};

-- 
2.48.0.rc1.219.gb6b6757d772



