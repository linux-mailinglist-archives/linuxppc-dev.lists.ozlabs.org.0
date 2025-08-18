Return-Path: <linuxppc-dev+bounces-11112-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D384B2B590
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 02:50:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5WGV1jvFz3ckL;
	Tue, 19 Aug 2025 10:50:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755564642;
	cv=none; b=BWWtbqm2FdGBeEcdm9v3ziePZGF772GSLzwCm97wRU58FG8bNOlur9qXPw27jvtjjd3KGAqGucDcWbjay/27SbjqWuxC/7cKyZI5zINPeXqIM5NoySt4i8euO855EwYPb3KYmRo3/i/N521aW2lTA/GiHeh4RhrHDpLJg0Wdeg2DRVnt3Jy77Fp/wxDdFw+edJNu8RxGUJNPm+9q+18tGSnI2HelsGoVPduUQbMJ+XHgNGhnLSIvEDTu+P4bhFfDRn7b12CqT1HHsX2zlk54u1dsLaqfNAi4alMKDbsr1f5Gcv0IrtUMLxusfjnpSKvFeDYvnhdQIGGd4tCxa/qgcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755564642; c=relaxed/relaxed;
	bh=XbftxnTdOoHxXFPvYewuEGEsvUbcKwd8zCqgiFLL/Uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ccgR4x2uyCjXIxmpcUwZ849HMOMiHdEZnhsoqontlPp8bUbtJnun0QErKNTRR3IwdQt1hJEcJ/WJV4h+xNV4tWe3SStn8AJMGnzwoTdqwSVvBPyuZgyW989bU2dfy50TQgA0BAD9JdYF7grQTRo2aWtEJMQ8GbojQx6Jf2mcMqvh4MTk/b5EJB0oU+O6tjNR3718nv0Tg6QDQ5twA5F2C0mnAF/DD40U4nZMYvgdzwA5YTvVlHlS7U+GFk0kdDKEYEcSzuTg5CZm+jEwo/f8ruon0W+550udBu3vwK1pl4WEZlZN0E6pPCzDvuQEfBeMYBxGcSFh7eYyMIerhO1aeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5WGT41gcz3cdT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 10:50:41 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55sf33SKz9sX4;
	Mon, 18 Aug 2025 10:46:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rx4zHsvHPdak; Mon, 18 Aug 2025 10:46:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55sZ1ZzKz9sWh;
	Mon, 18 Aug 2025 10:46:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 217968B763;
	Mon, 18 Aug 2025 10:46:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id giALWGHkvImb; Mon, 18 Aug 2025 10:46:10 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EDCBB8B764;
	Mon, 18 Aug 2025 10:46:09 +0200 (CEST)
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
Subject: [PATCH v2 5/5] dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
Date: Mon, 18 Aug 2025 10:45:58 +0200
Message-ID: <be8952a26d7a8d55ff96e4547f6c107094988220.1755506608.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1755506608.git.christophe.leroy@csgroup.eu>
References: <cover.1755506608.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755506759; l=2392; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=FsJjFzo97CaIj8ecmEYrlheS4JZRtCwCquhmLdyFc7U=; b=hFHnrqREIMbLuXYAIGjkJ3D28meiD7b8MHSCYawlfY+LlUHthVv1wORv0SDpFEM2Ka+xgcy44 ih8BI2ai0K2Dpx8Wvzs9qmU5X2t5EZKhQym3hoV6sJGw8lmJpxLC2XS
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
v2: Fixed problems reported by 'make dt_binding_check'
---
 .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
new file mode 100644
index 000000000000..b7c74c66347c
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
+      interrupt-controller;
+      compatible = "fsl,mpc8323-qe-ports-ic";
+      #address-cells = <0>;
+      #interrupt-cells = <1>;
+      reg = <0xc00 0x18>;
+      interrupts = <74 0x8>;
+      interrupt-parent = <&ipic>;
+    };
-- 
2.49.0


