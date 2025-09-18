Return-Path: <linuxppc-dev+bounces-12383-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47791B8619B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 18:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSM8F6Prfz2yGM;
	Fri, 19 Sep 2025 02:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758214237;
	cv=none; b=m9vzy1v14eFIV/dnYXPhj/JSaT3aFI/YfmdypmSTHQxA9b/+DWan6wNRnFsKq1j+1A0wUbAFcgVX431Tyik4kQhjF8swvPGgukNY+y8UBEPgzn9TUnTEnB94ltfDGAhFfsaKcF6dWWVeejyP6S6IjOV4OVnaSpj/voieeCZ/DILdaslLD0zsDnSD9I/gNgJIgeJraoVLBkBStC3x06yxQknf+L5WI+y9/QuuE0SEUOiLbwSso9vepoMI1lp9B0gXFJK3rNvurG49Wvja1hd+6zTaZQKhFyJzNkxHG6kN7BetrXKhmHQfyVWzwi2BVCWXqa2D0/J6wSmYY5kHgCsldA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758214237; c=relaxed/relaxed;
	bh=l4sae3VcIbk8y9qks3D5Qe5VW28dq5OkqtjE4H3CEwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oCVuWN8VbiN+GPQmtsPR5X7xhrqg5/ibvXStOJXDCxsm6A5oVgNiLb+lzi+ETK0tuwzW93j/ODincKEs4DF0g49MOFmFgaCUWonVknbUJiJ5sAUQYs68+plKgYFioMD+I8wPL7QMG1ggYZ3peumNpJHdlO76Y2JUitvVlZWLp84ZcvO/q+Fcnh1qCCAMYT9gY9yerjGquzr7n5WirB0Jt5+GoZZMtsDp5VKmQaG3buvBEgKdJTpIQkQNCU99bZkZeCRZHzm5Qg1cVn7hiSX81z47XCJJ4v1yLECzWMbKAUDmU2yt2qjdEfcjuOcWz6gixgbE0GIPhvhHU3fQhd54Aw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSM8F0Js8z2xQ1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 02:50:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cSLY82NTDz9sg9;
	Thu, 18 Sep 2025 18:23:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sEG83xOg8Ef7; Thu, 18 Sep 2025 18:23:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cSLY624WMz9sfq;
	Thu, 18 Sep 2025 18:23:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 361D48B767;
	Thu, 18 Sep 2025 18:23:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id mscD6JiKuvkZ; Thu, 18 Sep 2025 18:23:38 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 79A2C8B778;
	Thu, 18 Sep 2025 18:23:37 +0200 (CEST)
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
Subject: [PATCH v6 7/7] dt-bindings: soc: fsl: qe: Add support of IRQ in QE GPIO
Date: Thu, 18 Sep 2025 18:23:27 +0200
Message-ID: <7269082e90d20cf2cb4c11ceb61e24f0520d0154.1758212309.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758212606; l=3549; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=k3Y6MBNnl6dECpR6PnRX0K8qXjVVH4SDYF4pnM6U+5g=; b=3OSUaeiNXCSwzLz+tUKTqJNBGf6B7Ioh5bO/V4rphHE6/+9Er+qUOqScWnM/rlK+XLEXiwf1o glInwdidngzCUT7dAGGwouPmY/73WQuRgFgH5vsf+hc8S21egdBPaJM
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In the QE, a few GPIOs have an associated IRQ to notify changes.
Add IRQ support to QE GPIO.

As not all GPIOs have an associated IRQ, the driver needs to know
to which GPIO corresponds each provided IRQ. This is provided via
multiple compatible properties:

	compatible = "fsl,mpc8323-qe-pario-bank-a"
	compatible = "fsl,mpc8323-qe-pario-bank-b"
	compatible = "fsl,mpc8323-qe-pario-bank-c"

	compatible = "fsl,mpc8360-qe-pario-bank-a"
	compatible = "fsl,mpc8360-qe-pario-bank-b"
	compatible = "fsl,mpc8360-qe-pario-bank-c"
	compatible = "fsl,mpc8360-qe-pario-bank-d"
	compatible = "fsl,mpc8360-qe-pario-bank-e"
	compatible = "fsl,mpc8360-qe-pario-bank-f"
	compatible = "fsl,mpc8360-qe-pario-bank-g"

	compatible = "fsl,mpc8568-qe-pario-bank-a"
	compatible = "fsl,mpc8568-qe-pario-bank-b"
	compatible = "fsl,mpc8568-qe-pario-bank-c"
	compatible = "fsl,mpc8568-qe-pario-bank-d"
	compatible = "fsl,mpc8568-qe-pario-bank-e"
	compatible = "fsl,mpc8568-qe-pario-bank-f"

When not using IRQ and for banks having no IRQ (like bank D on mpc8323)
the origin compatible = "fsl,mpc8323-qe-pario-bank" is still valid.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 .../gpio/fsl,mpc8323-qe-pario-bank.yaml       | 27 +++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
index 0dd9c0e6ca39..c34aeea119e0 100644
--- a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
@@ -14,6 +14,22 @@ properties:
     items:
       - enum:
           - fsl,chip-qe-pario-bank
+          - fsl,mpc8323-qe-pario-bank-a
+          - fsl,mpc8323-qe-pario-bank-b
+          - fsl,mpc8323-qe-pario-bank-c
+          - fsl,mpc8360-qe-pario-bank-a
+          - fsl,mpc8360-qe-pario-bank-b
+          - fsl,mpc8360-qe-pario-bank-c
+          - fsl,mpc8360-qe-pario-bank-d
+          - fsl,mpc8360-qe-pario-bank-e
+          - fsl,mpc8360-qe-pario-bank-f
+          - fsl,mpc8360-qe-pario-bank-g
+          - fsl,mpc8568-qe-pario-bank-a
+          - fsl,mpc8568-qe-pario-bank-b
+          - fsl,mpc8568-qe-pario-bank-c
+          - fsl,mpc8568-qe-pario-bank-d
+          - fsl,mpc8568-qe-pario-bank-e
+          - fsl,mpc8568-qe-pario-bank-f
       - const: fsl,mpc8323-qe-pario-bank
 
   reg:
@@ -24,6 +40,9 @@ properties:
   '#gpio-cells':
     const: 2
 
+  interrupts:
+    description: List of interrupts for lines of the port that trigger interrupts on change.
+
 required:
   - compatible
   - reg
@@ -35,15 +54,19 @@ additionalProperties: false
 examples:
   - |
     gpio-controller@1400 {
-        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
+        compatible = "fsl,mpc8360-qe-pario-bank-a", "fsl,mpc8323-qe-pario-bank";
         reg = <0x1400 0x18>;
         gpio-controller;
         #gpio-cells = <2>;
+        interrupts = <0 1 2 3>;
+        interrupt-parent = <&qepic>;
     };
 
     gpio-controller@1460 {
-        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
+        compatible = "fsl,mpc8360-qe-pario-bank-e", "fsl,mpc8323-qe-pario-bank";
         reg = <0x1460 0x18>;
         gpio-controller;
         #gpio-cells = <2>;
+        interrupts = <19 20 21 22 23 24 25>;
+        interrupt-parent = <&qepic>;
     };
-- 
2.49.0


