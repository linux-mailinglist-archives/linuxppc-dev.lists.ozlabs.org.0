Return-Path: <linuxppc-dev+bounces-10884-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A81B23574
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 20:50:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1gYr07rhz2xS9;
	Wed, 13 Aug 2025 04:50:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755024639;
	cv=none; b=OJ4p9/Ks0SZKBpZzgDudf7XbDxnenK14Deluq1Rqv+dHinr7I7vYkmNi7Qe3k9B7DjseLf2FS5T/SBrHNCTHwdjWiE2lFIdiIYU9SvpLbFLsuPwvkArDv+SJYMeY8eG386Y0pYUZOCH46ror2Wc5HbZskpCy2/WC6B0sRRGiEAu9U/Mlo/djEa26crwOk307tqAgTDEApeefy4H+H8Guw66qkPXNxnp3X51gbBwJ8ACxlEXr/HfoYBHg8AJivkQ4aHDqliw6u2EwrBV2IrfGCle1oddFK7lSGrXJm3mvz6DUaot1/5DJIzQwvQaBVJNtS/j1bxErb0+lWiOelGKDhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755024639; c=relaxed/relaxed;
	bh=j0RfBy0B0ML64kaxdP09fhg7oili9kPFcYcwS1oIMyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nExr/aUXjrBkd59mSeCck4ScpIRMzP3G/6B/3YcN5m6RKXlFlVDfk9d7xZZW2CKoUIZS5q3S6gbBgdRoKa432jP205XRYt6ZJ1bfkI4ukU/3s4R730RhcEY6qTElgfO0rKdSx3J71IsqNLcBlRMuOHl0sMQAoX9HXWBz2f5b2NvkBnOHXKIbx5s+gW/7QiMFehYxGhucyA7ODmCmme25MwL2TcY+7O7v+k9OAxHdu0U3+vGHWpHFgkrCxjuP6JuB2eEmLVfsU5HXaOhvdDXL2eYDfa5jtJa4h5AVfIiIB00U/agmHxX27Jsj0g2fiPJ7KirbMvxKAFIgyV7A1rQdbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1gYq3vbYz2xQ0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 04:50:39 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c1TBR4kXzz9sT7;
	Tue, 12 Aug 2025 13:03:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3y8dTxRQA3KN; Tue, 12 Aug 2025 13:03:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c1TBP5hjWz9sSs;
	Tue, 12 Aug 2025 13:03:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AE0E58B763;
	Tue, 12 Aug 2025 13:03:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Qz7WChCQ-Wh5; Tue, 12 Aug 2025 13:03:09 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 20F128B764;
	Tue, 12 Aug 2025 13:03:09 +0200 (CEST)
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
	devicetree@vger.kernel.org
Subject: [PATCH 4/4] dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
Date: Tue, 12 Aug 2025 13:02:54 +0200
Message-ID: <0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1754996033.git.christophe.leroy@csgroup.eu>
References: <cover.1754996033.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754996575; l=2493; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=sBDv7vR+It1XYOsUbKJGVxht0ECRwLjzMeT3ejRDm/U=; b=BOrAHvPX1MdgLy+6wlTvGbgoypCVvvGj7lfPu6JAC3QbSLnZxuD3Vq6NaU3gedK/5SowU993K yN7/zKYS8O5AWY9thNswXKEYACGBAOQv5dd7OmZYqNex0uG2y6q4nwB
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
---
 .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
new file mode 100644
index 0000000000000..7c98706d03dd1
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+title: Freescale QUICC Engine I/O Ports Interrupt Controller
+
+maintainers:
+  - name: Christophe Leroy
+    email: christophe.leroy@csgroup.eu
+
+description: |
+  Interrupt controller for the QUICC Engine I/O ports found on some
+  Freescale/NXP PowerQUICC and QorIQ SoCs.
+
+properties:
+  compatible:
+    enum:
+      - fsl,mpc8323-qe-ports-ic
+      - fsl,mpc8360-qe-ports-ic
+      - fsl,mpc8568-qe-ports-ic
+
+  reg:
+    description: Base address and size of the QE I/O Ports Interrupt Controller registers.
+    minItems: 1
+    maxItems: 1
+
+  interrupt-controller:
+    type: boolean
+    description: Indicates this node is an interrupt controller.
+
+  '#address-cells':
+    const: 0
+    description: Must be 0.
+
+  '#interrupt-cells':
+    const: 1
+    description: Number of cells to encode an interrupt specifier.
+
+  interrupts:
+    minItems: 1
+    maxItems: 1
+    description: Interrupt line to which the QE I/O Ports controller is connected.
+
+  interrupt-parent:
+    description: Phandle to the parent interrupt controller.
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#address-cells'
+  - '#interrupt-cells'
+  - interrupts
+  - interrupt-parent
+
+examples:
+  - |
+    interrupt-controller@c00 {
+      interrupt-controller;
+      compatible = "fsl,mpc8323-qe-ports-ic";
+      #address-cells = <0>;
+      #interrupt-cells = <1>;
+      reg = <0xc00 0x18>;
+      interrupts = <74 0x8>;
+      interrupt-parent = <&ipic>;
-- 
2.49.0


