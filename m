Return-Path: <linuxppc-dev+bounces-11577-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D4BB3E60A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 15:50:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFqyR6fkNz2xgp;
	Mon,  1 Sep 2025 23:50:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756734639;
	cv=none; b=acDnMDhktUfG7R1eh9No0p5FzIJV4jJaH3sx9LzwFDHEWDxVtWhQK4QCJZSrFHpHLslVup0RuDPFMcXW0/SLjeXcia2NjAnereELI4Xt6WwdAcLKelDKTmCkcZU2briaWdf1frPcTbScs1O9cVoHGZqR/f4bIRSUK+9aPooROZb+hjob0tj9ev4YY6CUn2eOI1qqWNl2jJtCxKSlnGqlKYLdkXtXSilaGwfu9jwCh5rIF+8Ic5V/Nvm5tvLO1ULSc1qvyeRsY2v7mqKLWdWBCitysjVyvfYhCrCRlflhjK9YfMpXzfmigLkBUUymAVh/ZHvNkCNkxXn4hV56PRuwkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756734639; c=relaxed/relaxed;
	bh=vVWhDqEJzhDyYpO6FXAZEmGG2kWWPpeCE8Ah+HVn9rM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JM3riPlO7LGnfASQU+4rWlweZfeS7ALQRHuvr8fZnZMWQPo4EHBn+3NfqvT5JFr3J5UjOnSpIRBJeC0HoG/LsjkC1JMmiDlm9uLWv5u41VXV6wRgDiK4wKM1WWUe1hL+n12FG93KCVGoVpiuzJZ9WHPngb2k0AQrHrXkb9QsJMOsJwdjx1L/iMCUmKec5G/NB73TZxvquBM+vmbHdeeM0IdZEB1y4Ilxy2GOOJM8vPpPVg38kQ02/YMGXbhtN0AwSiS63YbTwnvJgO3nXuirNcjdGxrpKG2/4ahQdGxjQzYXJwo8B/pqkSYrPpRIL98dVRkYMyOj4uRMuRXc5pCfSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFqyQ4BMZz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Sep 2025 23:50:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cFndJ2RLlz9sSp;
	Mon,  1 Sep 2025 14:05:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uqek8JJfWF8y; Mon,  1 Sep 2025 14:05:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cFndC5GNSz9sSq;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A3ED18B790;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id UrGKXVX00Xao; Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7B3FA8B78C;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 5/7] dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
Date: Mon,  1 Sep 2025 14:05:12 +0200
Message-ID: <b36ab796493fedd607f05287706bfa5ce22d8543.1756727747.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1756727747.git.christophe.leroy@csgroup.eu>
References: <cover.1756727747.git.christophe.leroy@csgroup.eu>
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
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756728308; l=2384; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=6GGB8fj116M7fld93yabp+Sk9w91NwwwbI5I6K0AiZU=; b=jR+31eCAFRr4bN9Eu6xmfDeciVfmvlPu9ExV5VARP8nsAOGNFwb90XySqHjMyi1lIHHu36+2y LGi6cKMqC+ICyMni+CveDj7l2leszHXF7NXGxdBQNi1fciTurQMzy/U
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The QUICC Engine provides interrupts for a few I/O ports. This is
handled via a separate interrupt ID and managed via a triplet of
dedicated registers hosted by the SoC.

Implement an interrupt driver for it for that those IRQs can then
be linked to the related GPIOs.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
new file mode 100644
index 000000000000..a356ad8b13f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale QUICC Engine I/O Ports Interrupt Controller
+
+maintainers:
+  - Christophe Leroy <christophe.leroy@csgroup.eu>
+
+description:
+  Interrupt controller for the QUICC Engine I/O ports found on some Freescale/NXP PowerQUICC and QorIQ SoCs.
+
+properties:
+  compatible:
+    enum:
+      - fsl,mpc8323-qe-ports-ic
+      - fsl,mpc8360-qe-ports-ic
+      - fsl,mpc8568-qe-ports-ic
+
+  reg:
+    maxItems: 1
+    description: Base address and size of the QE I/O Ports Interrupt Controller registers.
+
+  interrupt-controller: true
+
+  '#address-cells':
+    const: 0
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupts:
+    maxItems: 1
+    description: Interrupt line to which the QE I/O Ports controller is connected.
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#address-cells'
+  - '#interrupt-cells'
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@c00 {
+      compatible = "fsl,mpc8323-qe-ports-ic";
+      reg = <0xc00 0x18>;
+      interrupt-controller;
+      #address-cells = <0>;
+      #interrupt-cells = <1>;
+      interrupts = <74 0x8>;
+      interrupt-parent = <&ipic>;
+    };
-- 
2.49.0


