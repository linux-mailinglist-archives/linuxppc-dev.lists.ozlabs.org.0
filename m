Return-Path: <linuxppc-dev+bounces-12401-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A6BB874AD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 00:50:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSW7j65Trz3bvd;
	Fri, 19 Sep 2025 08:50:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758235841;
	cv=none; b=BLcPvausRlE581PvEFlFPicFs2tU8QhCEU/jHs+u+IwGurvzPaypXOQcm3TPxWtv4v3fpeQi8czKBxwkZo9VJ0GmD0IgTpcSC/4Y7tTq0elYc1qXcczU7BAz/GPoALip+XivXuGFRLO4tMr43LTQIEw79uyeua5+0j7cxdFIVY1PIPRTipqFsLnDodQnN3yYDvnA/g45mkFX+OyhHSMm0fcvmxn/u1b6mduiEiuyfd6X+xu7Tm2YCxBk6+Psgn9JKNtldMFTc0K7tbXU+/JiQYG/zX7gQdSmFvqyE3LsRHzZMXZDtWVDq7xBpk1XexWB45MtcuFy3Hdvn1g3KJhLqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758235841; c=relaxed/relaxed;
	bh=f5AXI2KmhH32gdc+xxx6tlPbsqSfBft1WVBj6XG/OZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K8A3881JAxfCQsUPoJQq3OCvHPOKSQpM9nMybTu9ZdnNosvNXsSrct9DrxdhwExd8BrMfPupmr4zVjD0ccM9r3JBicrKyzG32LEEia3Fnl55DuGKk//PZB3dgD4aLHbLuvptkS9QaPmvYEIW8Nomi3KaBmt0ZNuqsVAyN5jvWiFZ41owbHL93KbLCFnafcCrp8YY0XQ1wrtVQq8g/5hIq28fddBDZF64P9JykOvPAwALEX0jNbz1dXirtYo5eS2Nh8VwPVAHCyA7ISm7Zi/Ee0vxMHJxJx9YpvoliYOxPkLLawfv+NnlK8pEoBWI2hlRQk4oZMouyIYBk3KKa5RZGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSW7j1Lfdz2xlK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 08:50:41 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cSLY61dgCz9sg4;
	Thu, 18 Sep 2025 18:23:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bWMfx8aSixG3; Thu, 18 Sep 2025 18:23:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cSLY45WG2z9sfq;
	Thu, 18 Sep 2025 18:23:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AAACE8B767;
	Thu, 18 Sep 2025 18:23:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id cycSslAEFx8u; Thu, 18 Sep 2025 18:23:36 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EC5308B776;
	Thu, 18 Sep 2025 18:23:35 +0200 (CEST)
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
Subject: [PATCH v6 5/7] dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
Date: Thu, 18 Sep 2025 18:23:25 +0200
Message-ID: <67987bbf42344398709949cb53e3e8415260ec09.1758212309.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1758212309.git.christophe.leroy@csgroup.eu>
References: <cover.1758212309.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758212605; l=2384; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=LLw9e41r3Nu4RX42WVov9+WnfXYO1+RpidnMUsA7kyA=; b=YDDPEKiP3Ihfi8Pm7o7zYRnNRvlYkYvxNfNQKaJ78/6tLwk/gZeiVWgFd34JlEKpPkQz5YuNm 7q+0fY29QL+CIgPgMa30z7I7M2Y68WpSf6wgo9LrLQ1Iy4lQ7igZ528
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
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


