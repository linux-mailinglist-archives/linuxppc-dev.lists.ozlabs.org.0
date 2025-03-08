Return-Path: <linuxppc-dev+bounces-6826-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BB3A57CD0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Mar 2025 19:33:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z9Bcx0Sj0z3093;
	Sun,  9 Mar 2025 05:33:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741458832;
	cv=none; b=eE4jPg1DW7fkrnnBXtBIxinEE3vvpJM35lqQu10qhMeSJ/PWBdaDWV9+BwaeDU4Cv/wBQYmhfYpi1Rm35ugYYxgGBh8VIx7+/O/AFbXhONYd6SRNA0lNFiQUEkwNGnrcXiLlKk7a2YHfiot4b0BAM9JPiZ4ilkgAkdSuNr8GB5EnkAC4dsEhgdgD5C8kTZuFnV7QNR1W7MzWRMqlPAQzag0APLc6vPaQ3zwtRx0IP6tlMybDlxtPMBSqgiOCcM/7jUgXlXbHsL2WjkxEILGkbh7UnBe7tn3Eh+usxZG448SKgaNJCOYHVw2FhFQEzOj352B/O6LXV9KUUmU02FEJSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741458832; c=relaxed/relaxed;
	bh=1KpKDOeHdpqAJUCEMON7E47nWtMWcSIX9tlSUnbhaM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EB3gr7iACfyIESo8gN10upxLi9W9r/oBK6HZz6kYtpVCY1mmBoPZjgyZH3jaZvR5U0PYLvIqpbNOuADF7hhzf6BgUQCWTyuqpnzMkQUmkiEOulZw51pY4+wfbKNiTHhBZ1bzfCAV9kTGGnf9sf1OG17D+3yTD9wGEeHF2zrQgdbxzSY/JKDHxT7fXfHBx50I0hsdYgEo8AbfSN+Ex5TPQNsjLPF7xpWYXD81a6A27QzJgKudt/9aFYsUd7z+OlY0PspfSIlOm7KtEDYnRN+5/s2mDiJdpBV3RJk0bcz6YV40gaUNNdTUauz89Ke3o3TEsG+qw5mfkxJVT3KotuCpRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JbqsaZkW; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JbqsaZkW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z9Bcv015vz2yVT
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Mar 2025 05:33:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7169DA45960;
	Sat,  8 Mar 2025 18:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E82DC4CEE0;
	Sat,  8 Mar 2025 18:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741458826;
	bh=jtOBHKyDxEY6kiI+aww7sEZvL9BXUlHdXpHVTUbYBAM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=JbqsaZkWwoagmn8o7M2vaVyodTBJhE2zuh2L9vNZqVnM0IBJlTwuoM7JNINkHfHPI
	 Peu8/BMyoflhrym2dFdpniZT7PQxioBxoryFIurrnj7hhoL5wbhqLLszTh4o5pGbP3
	 iZBl9LGK0Ub9bRONp0GZfjjMMXK3JVRK6BeU7fvLmOuvD3ZRmKSzOTOIxeXiLlGVEr
	 fDbHQmBS4msoAybMGJYGip+3kEdXXgjqOOrz76D5lRtl6t9jWcOh39erln7qv3PzP4
	 E5fTRSKUAm/CmKE15qTbS8EuH434yOAzqGvJnRGoDWJiGAMJxreHvzzuMWvIx4JPe7
	 rOlm/AGSzuCyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C6CC282EC;
	Sat,  8 Mar 2025 18:33:46 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sat, 08 Mar 2025 19:33:39 +0100
Subject: [PATCH v4] dt-bindings: dma: Convert fsl,elo*-dma to YAML
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
Message-Id: <20250308-ppcyaml-dma-v4-1-20392ea81ec6@posteo.net>
X-B4-Tracking: v=1; b=H4sIAIKNzGcC/1XMQQ6DIBCF4auYWXcahWrBVe/RuKAwVpIqBAipM
 d691KSLLv+XvG+DSMFShL7aIFC20bqlxOVUgZ7U8iS0pjSwmrU1YzV6r1c1v9DMCoU0rVRMCC0
 eUB4+0Gjfh3YfSk82JhfWA8/8u/6c7s/JHBu8Sk284bzt5HjzLiZy54USDPu+fwAdeNNTpwAAA
 A==
X-Change-ID: 20250220-ppcyaml-dma-89d59a288c8b
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741458825; l=21482;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=kUFcASeT2mMvb2+Dq4sTDgkCEwV4TvZIUdMy+H9C690=;
 b=iUiNKWSq2NeYpLgUuk7DWUhlArKsPgd6v9VFUm5nvnqu3pSme/8C2kFqFKS8GBrVG0Re+JM07
 WlRvdINldmOCzn2EwcEOpLYxdW0l6zrafZFUkt84Ib7c8gIHuf4pUo/
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

The devicetree bindings for Freescale DMA engines have so far existed as
a text file. This patch converts them to YAML, and specifies all the
compatible strings currently in use in arch/powerpc/boot/dts.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
I considered referencing dma-controller.yaml, but that requires
the #dma-cells property (via dma-common.yaml), and I'm now sure which
value it should have, if any. Therefore I did not reference
dma-controller.yaml.

V4:
- switch DMA controller node name (in examples) back to dma@ because the
  dma-controller.yaml binding is not used.

V3:
- Link: https://lore.kernel.org/r/20250226-ppcyaml-dma-v3-1-79ce3133569f@posteo.net
- split out as a single patch
- restructure "description" definitions to use "items:" as much as possible
- remove useless description of interrupts in fsl,elo3-dma
- rename DMA controller nodes to dma-controller@...
- use IRQ_TYPE_* constants in examples
- define unit address format for DMA channel nodes
- drop interrupts-parent properties from examples

V2:
- part of series [PATCH v2 00/12] YAML conversion of several Freescale/PowerPC DT bindings
  Link: https://lore.kernel.org/lkml/20250207-ppcyaml-v2-5-8137b0c42526@posteo.net/
- remove unnecessary multiline markers
- fix additionalProperties to always be false
- add description/maxItems to interrupts
- add missing #address-cells/#size-cells properties
- convert "Note on DMA channel compatible properties" to YAML by listing
  fsl,ssi-dma-channel as a valid compatible value
- fix property ordering in examples: compatible and reg come first
- add missing newlines in examples
- trim subject line (remove "bindings")
---
 .../devicetree/bindings/dma/fsl,elo-dma.yaml       | 137 ++++++++++++++
 .../devicetree/bindings/dma/fsl,elo3-dma.yaml      | 125 +++++++++++++
 .../devicetree/bindings/dma/fsl,eloplus-dma.yaml   | 132 +++++++++++++
 .../devicetree/bindings/powerpc/fsl/dma.txt        | 204 ---------------------
 4 files changed, 394 insertions(+), 204 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml b/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..92288d76d51be639ac9ca5264e5fa056e418e4d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/fsl,elo-dma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale Elo DMA Controller
+
+maintainers:
+  - J. Neuschäfer <j.ne@posteo.net>
+
+description:
+  This is a little-endian 4-channel DMA controller, used in Freescale mpc83xx
+  series chips such as mpc8315, mpc8349, mpc8379 etc.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,mpc8313-dma
+          - fsl,mpc8315-dma
+          - fsl,mpc8323-dma
+          - fsl,mpc8347-dma
+          - fsl,mpc8349-dma
+          - fsl,mpc8360-dma
+          - fsl,mpc8377-dma
+          - fsl,mpc8378-dma
+          - fsl,mpc8379-dma
+      - const: fsl,elo-dma
+
+  reg:
+    items:
+      - description:
+          DMA General Status Register, i.e. DGSR which contains status for
+          all the 4 DMA channels.
+
+  cell-index:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Controller index. 0 for controller @ 0x8100.
+
+  ranges: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  interrupts:
+    maxItems: 1
+    description: Controller interrupt.
+
+required:
+  - compatible
+  - reg
+
+patternProperties:
+  "^dma-channel@[0-9a-f]+$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        oneOf:
+          # native DMA channel
+          - items:
+              - enum:
+                  - fsl,mpc8315-dma-channel
+                  - fsl,mpc8323-dma-channel
+                  - fsl,mpc8347-dma-channel
+                  - fsl,mpc8349-dma-channel
+                  - fsl,mpc8360-dma-channel
+                  - fsl,mpc8377-dma-channel
+                  - fsl,mpc8378-dma-channel
+                  - fsl,mpc8379-dma-channel
+              - const: fsl,elo-dma-channel
+
+          # audio DMA channel, see fsl,ssi.yaml
+          - const: fsl,ssi-dma-channel
+
+      reg:
+        maxItems: 1
+
+      cell-index:
+        description: DMA channel index starts at 0.
+
+      interrupts:
+        maxItems: 1
+        description:
+          Per-channel interrupt. Only necessary if no controller interrupt has
+          been provided.
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    dma@82a8 {
+        compatible = "fsl,mpc8349-dma", "fsl,elo-dma";
+        reg = <0x82a8 4>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x8100 0x1a4>;
+        interrupts = <71 IRQ_TYPE_LEVEL_LOW>;
+        cell-index = <0>;
+
+        dma-channel@0 {
+            compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
+            reg = <0 0x80>;
+            cell-index = <0>;
+            interrupts = <71 IRQ_TYPE_LEVEL_LOW>;
+        };
+
+        dma-channel@80 {
+            compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
+            reg = <0x80 0x80>;
+            cell-index = <1>;
+            interrupts = <71 IRQ_TYPE_LEVEL_LOW>;
+        };
+
+        dma-channel@100 {
+            compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
+            reg = <0x100 0x80>;
+            cell-index = <2>;
+            interrupts = <71 IRQ_TYPE_LEVEL_LOW>;
+        };
+
+        dma-channel@180 {
+            compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
+            reg = <0x180 0x80>;
+            cell-index = <3>;
+            interrupts = <71 IRQ_TYPE_LEVEL_LOW>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/dma/fsl,elo3-dma.yaml b/Documentation/devicetree/bindings/dma/fsl,elo3-dma.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..0f5e475657a781a209587a9de1eb99c0d7077854
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/fsl,elo3-dma.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/fsl,elo3-dma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale Elo3 DMA Controller
+
+maintainers:
+  - J. Neuschäfer <j.ne@posteo.net>
+
+description:
+  DMA controller which has same function as EloPlus except that Elo3 has 8
+  channels while EloPlus has only 4, it is used in Freescale Txxx and Bxxx
+  series chips, such as t1040, t4240, b4860.
+
+properties:
+  compatible:
+    const: fsl,elo3-dma
+
+  reg:
+    items:
+      - description:
+          DMA General Status Registers starting from DGSR0, for channel 1~4
+      - description:
+          DMA General Status Registers starting from DGSR1, for channel 5~8
+
+  ranges: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  interrupts:
+    maxItems: 1
+
+patternProperties:
+  "^dma-channel@[0-9a-f]+$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        enum:
+          # native DMA channel
+          - fsl,eloplus-dma-channel
+
+          # audio DMA channel, see fsl,ssi.yaml
+          - fsl,ssi-dma-channel
+
+      reg:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+        description:
+          Per-channel interrupt. Only necessary if no controller interrupt has
+          been provided.
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    dma@100300 {
+        compatible = "fsl,elo3-dma";
+        reg = <0x100300 0x4>,
+              <0x100600 0x4>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x100100 0x500>;
+
+        dma-channel@0 {
+            compatible = "fsl,eloplus-dma-channel";
+            reg = <0x0 0x80>;
+            interrupts = <28 IRQ_TYPE_EDGE_FALLING 0 0>;
+        };
+
+        dma-channel@80 {
+            compatible = "fsl,eloplus-dma-channel";
+            reg = <0x80 0x80>;
+            interrupts = <29 IRQ_TYPE_EDGE_FALLING 0 0>;
+        };
+
+        dma-channel@100 {
+            compatible = "fsl,eloplus-dma-channel";
+            reg = <0x100 0x80>;
+            interrupts = <30 IRQ_TYPE_EDGE_FALLING 0 0>;
+        };
+
+        dma-channel@180 {
+            compatible = "fsl,eloplus-dma-channel";
+            reg = <0x180 0x80>;
+            interrupts = <31 IRQ_TYPE_EDGE_FALLING 0 0>;
+        };
+
+        dma-channel@300 {
+            compatible = "fsl,eloplus-dma-channel";
+            reg = <0x300 0x80>;
+            interrupts = <76 IRQ_TYPE_EDGE_FALLING 0 0>;
+        };
+
+        dma-channel@380 {
+            compatible = "fsl,eloplus-dma-channel";
+            reg = <0x380 0x80>;
+            interrupts = <77 IRQ_TYPE_EDGE_FALLING 0 0>;
+        };
+
+        dma-channel@400 {
+            compatible = "fsl,eloplus-dma-channel";
+            reg = <0x400 0x80>;
+            interrupts = <78 IRQ_TYPE_EDGE_FALLING 0 0>;
+        };
+
+        dma-channel@480 {
+            compatible = "fsl,eloplus-dma-channel";
+            reg = <0x480 0x80>;
+            interrupts = <79 IRQ_TYPE_EDGE_FALLING 0 0>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/dma/fsl,eloplus-dma.yaml b/Documentation/devicetree/bindings/dma/fsl,eloplus-dma.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8992f244c4db41ac13104ca64b7f8bf4b1b5c756
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/fsl,eloplus-dma.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale EloPlus DMA Controller
+
+maintainers:
+  - J. Neuschäfer <j.ne@posteo.net>
+
+description:
+  This is a 4-channel DMA controller with extended addresses and chaining,
+  mainly used in Freescale mpc85xx/86xx, Pxxx and BSC series chips, such as
+  mpc8540, mpc8641 p4080, bsc9131 etc.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,mpc8540-dma
+              - fsl,mpc8541-dma
+              - fsl,mpc8548-dma
+              - fsl,mpc8555-dma
+              - fsl,mpc8560-dma
+              - fsl,mpc8572-dma
+              - fsl,mpc8641-dma
+          - const: fsl,eloplus-dma
+      - const: fsl,eloplus-dma
+
+  reg:
+    items:
+      - description:
+          DMA General Status Register, i.e. DGSR which contains
+          status for all the 4 DMA channels
+
+  cell-index:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      controller index.  0 for controller @ 0x21000, 1 for controller @ 0xc000
+
+  ranges: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  interrupts:
+    maxItems: 1
+    description: Controller interrupt.
+
+patternProperties:
+  "^dma-channel@[0-9a-f]+$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        oneOf:
+          # native DMA channel
+          - items:
+              - enum:
+                  - fsl,mpc8540-dma-channel
+                  - fsl,mpc8541-dma-channel
+                  - fsl,mpc8548-dma-channel
+                  - fsl,mpc8555-dma-channel
+                  - fsl,mpc8560-dma-channel
+                  - fsl,mpc8572-dma-channel
+              - const: fsl,eloplus-dma-channel
+
+          # audio DMA channel, see fsl,ssi.yaml
+          - const: fsl,ssi-dma-channel
+
+      reg:
+        maxItems: 1
+
+      cell-index:
+        description: DMA channel index starts at 0.
+
+      interrupts:
+        maxItems: 1
+        description:
+          Per-channel interrupt. Only necessary if no controller interrupt has
+          been provided.
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    dma@21300 {
+        compatible = "fsl,mpc8540-dma", "fsl,eloplus-dma";
+        reg = <0x21300 4>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x21100 0x200>;
+        cell-index = <0>;
+
+        dma-channel@0 {
+            compatible = "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-channel";
+            reg = <0 0x80>;
+            cell-index = <0>;
+            interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
+        };
+
+        dma-channel@80 {
+            compatible = "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-channel";
+            reg = <0x80 0x80>;
+            cell-index = <1>;
+            interrupts = <21 IRQ_TYPE_EDGE_FALLING>;
+        };
+
+        dma-channel@100 {
+            compatible = "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-channel";
+            reg = <0x100 0x80>;
+            cell-index = <2>;
+            interrupts = <22 IRQ_TYPE_EDGE_FALLING>;
+        };
+
+        dma-channel@180 {
+            compatible = "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-channel";
+            reg = <0x180 0x80>;
+            cell-index = <3>;
+            interrupts = <23 IRQ_TYPE_EDGE_FALLING>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/dma.txt b/Documentation/devicetree/bindings/powerpc/fsl/dma.txt
deleted file mode 100644
index c11ad5c6db2190bf38c160632d9997122e169945..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/powerpc/fsl/dma.txt
+++ /dev/null
@@ -1,204 +0,0 @@
-* Freescale DMA Controllers
-
-** Freescale Elo DMA Controller
-   This is a little-endian 4-channel DMA controller, used in Freescale mpc83xx
-   series chips such as mpc8315, mpc8349, mpc8379 etc.
-
-Required properties:
-
-- compatible        : must include "fsl,elo-dma"
-- reg               : DMA General Status Register, i.e. DGSR which contains
-                      status for all the 4 DMA channels
-- ranges            : describes the mapping between the address space of the
-                      DMA channels and the address space of the DMA controller
-- cell-index        : controller index.  0 for controller @ 0x8100
-- interrupts        : interrupt specifier for DMA IRQ
-
-- DMA channel nodes:
-        - compatible        : must include "fsl,elo-dma-channel"
-                              However, see note below.
-        - reg               : DMA channel specific registers
-        - cell-index        : DMA channel index starts at 0.
-
-Optional properties:
-        - interrupts        : interrupt specifier for DMA channel IRQ
-                              (on 83xx this is expected to be identical to
-                              the interrupts property of the parent node)
-
-Example:
-	dma@82a8 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "fsl,mpc8349-dma", "fsl,elo-dma";
-		reg = <0x82a8 4>;
-		ranges = <0 0x8100 0x1a4>;
-		interrupt-parent = <&ipic>;
-		interrupts = <71 8>;
-		cell-index = <0>;
-		dma-channel@0 {
-			compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
-			cell-index = <0>;
-			reg = <0 0x80>;
-			interrupt-parent = <&ipic>;
-			interrupts = <71 8>;
-		};
-		dma-channel@80 {
-			compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
-			cell-index = <1>;
-			reg = <0x80 0x80>;
-			interrupt-parent = <&ipic>;
-			interrupts = <71 8>;
-		};
-		dma-channel@100 {
-			compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
-			cell-index = <2>;
-			reg = <0x100 0x80>;
-			interrupt-parent = <&ipic>;
-			interrupts = <71 8>;
-		};
-		dma-channel@180 {
-			compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
-			cell-index = <3>;
-			reg = <0x180 0x80>;
-			interrupt-parent = <&ipic>;
-			interrupts = <71 8>;
-		};
-	};
-
-** Freescale EloPlus DMA Controller
-   This is a 4-channel DMA controller with extended addresses and chaining,
-   mainly used in Freescale mpc85xx/86xx, Pxxx and BSC series chips, such as
-   mpc8540, mpc8641 p4080, bsc9131 etc.
-
-Required properties:
-
-- compatible        : must include "fsl,eloplus-dma"
-- reg               : DMA General Status Register, i.e. DGSR which contains
-                      status for all the 4 DMA channels
-- cell-index        : controller index.  0 for controller @ 0x21000,
-                                         1 for controller @ 0xc000
-- ranges            : describes the mapping between the address space of the
-                      DMA channels and the address space of the DMA controller
-
-- DMA channel nodes:
-        - compatible        : must include "fsl,eloplus-dma-channel"
-                              However, see note below.
-        - cell-index        : DMA channel index starts at 0.
-        - reg               : DMA channel specific registers
-        - interrupts        : interrupt specifier for DMA channel IRQ
-
-Example:
-	dma@21300 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "fsl,mpc8540-dma", "fsl,eloplus-dma";
-		reg = <0x21300 4>;
-		ranges = <0 0x21100 0x200>;
-		cell-index = <0>;
-		dma-channel@0 {
-			compatible = "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-channel";
-			reg = <0 0x80>;
-			cell-index = <0>;
-			interrupt-parent = <&mpic>;
-			interrupts = <20 2>;
-		};
-		dma-channel@80 {
-			compatible = "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-channel";
-			reg = <0x80 0x80>;
-			cell-index = <1>;
-			interrupt-parent = <&mpic>;
-			interrupts = <21 2>;
-		};
-		dma-channel@100 {
-			compatible = "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-channel";
-			reg = <0x100 0x80>;
-			cell-index = <2>;
-			interrupt-parent = <&mpic>;
-			interrupts = <22 2>;
-		};
-		dma-channel@180 {
-			compatible = "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-channel";
-			reg = <0x180 0x80>;
-			cell-index = <3>;
-			interrupt-parent = <&mpic>;
-			interrupts = <23 2>;
-		};
-	};
-
-** Freescale Elo3 DMA Controller
-   DMA controller which has same function as EloPlus except that Elo3 has 8
-   channels while EloPlus has only 4, it is used in Freescale Txxx and Bxxx
-   series chips, such as t1040, t4240, b4860.
-
-Required properties:
-
-- compatible        : must include "fsl,elo3-dma"
-- reg               : contains two entries for DMA General Status Registers,
-                      i.e. DGSR0 which includes status for channel 1~4, and
-                      DGSR1 for channel 5~8
-- ranges            : describes the mapping between the address space of the
-                      DMA channels and the address space of the DMA controller
-
-- DMA channel nodes:
-        - compatible        : must include "fsl,eloplus-dma-channel"
-        - reg               : DMA channel specific registers
-        - interrupts        : interrupt specifier for DMA channel IRQ
-
-Example:
-dma@100300 {
-	#address-cells = <1>;
-	#size-cells = <1>;
-	compatible = "fsl,elo3-dma";
-	reg = <0x100300 0x4>,
-	      <0x100600 0x4>;
-	ranges = <0x0 0x100100 0x500>;
-	dma-channel@0 {
-		compatible = "fsl,eloplus-dma-channel";
-		reg = <0x0 0x80>;
-		interrupts = <28 2 0 0>;
-	};
-	dma-channel@80 {
-		compatible = "fsl,eloplus-dma-channel";
-		reg = <0x80 0x80>;
-		interrupts = <29 2 0 0>;
-	};
-	dma-channel@100 {
-		compatible = "fsl,eloplus-dma-channel";
-		reg = <0x100 0x80>;
-		interrupts = <30 2 0 0>;
-	};
-	dma-channel@180 {
-		compatible = "fsl,eloplus-dma-channel";
-		reg = <0x180 0x80>;
-		interrupts = <31 2 0 0>;
-	};
-	dma-channel@300 {
-		compatible = "fsl,eloplus-dma-channel";
-		reg = <0x300 0x80>;
-		interrupts = <76 2 0 0>;
-	};
-	dma-channel@380 {
-		compatible = "fsl,eloplus-dma-channel";
-		reg = <0x380 0x80>;
-		interrupts = <77 2 0 0>;
-	};
-	dma-channel@400 {
-		compatible = "fsl,eloplus-dma-channel";
-		reg = <0x400 0x80>;
-		interrupts = <78 2 0 0>;
-	};
-	dma-channel@480 {
-		compatible = "fsl,eloplus-dma-channel";
-		reg = <0x480 0x80>;
-		interrupts = <79 2 0 0>;
-	};
-};
-
-Note on DMA channel compatible properties: The compatible property must say
-"fsl,elo-dma-channel" or "fsl,eloplus-dma-channel" to be used by the Elo DMA
-driver (fsldma).  Any DMA channel used by fsldma cannot be used by another
-DMA driver, such as the SSI sound drivers for the MPC8610.  Therefore, any DMA
-channel that should be used for another driver should not use
-"fsl,elo-dma-channel" or "fsl,eloplus-dma-channel".  For the SSI drivers, for
-example, the compatible property should be "fsl,ssi-dma-channel".  See ssi.txt
-for more information.

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250220-ppcyaml-dma-89d59a288c8b

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



