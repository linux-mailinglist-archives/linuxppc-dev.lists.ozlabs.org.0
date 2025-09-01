Return-Path: <linuxppc-dev+bounces-11603-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DD9B3F190
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Sep 2025 02:20:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cG5xQ2lnkz305P;
	Tue,  2 Sep 2025 10:20:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756772442;
	cv=none; b=KYnZuGmc1u0C8x1x6ctWoArOrWoZyO7sxkTRvQYz9R3b82WmWzqyfbMjLmZNAO3wHxlpqYNVzMBrXmRjfXqanR+XJ86P4oX002qy/KAQ+mI+6encmvuDJQRFPn1TMF4AX78YxYu5ABKs6yeYHHJVCppl5mVn280lxrttzEXwap3vDdNQ9l4yScTjTyUIi1DR1C83l1MXvN2hVuocdtDeDCDrRmglimAheZen8saUerqL+DZA+wLIqx+dxK+02rtohMkkpdsM4E/QjfPU1tFWBUHHXuqBZ+SekU+sIYEPc+yaY9YTMKDUvL4BX210qWICnS/UBT6T5iv90Z5/dMT3vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756772442; c=relaxed/relaxed;
	bh=sRERapiSYoHPjwQWpt8qOWCUW2mbCGSleJj5U5fd4CA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DZU9VD3OfCDVZjzre/s2yWxXncJWy2HEz63y/U5zNusFhLEakY+1JaYrN7AmPj6ng9Kqsp7CNofdn2He3pVP6aOV20uof3w1pJ/y59jBn0qQ7YmZIXmgtSx3Pq3OU1MxELf/u83qaq6XtqfhCwIUIuYSO2AHQkv7g4+rUsWsrGheTNkYMNY1hB0pxYvfnQQXxgHtL/Rl/GWxNrzS+YkYVTNJtSAv597FHwJztfyyA75yW9pbLH5vttfAAbKbZItyRNyoy0Pwpj5NTNYRD0tPMaUsPD4rVeyc6EJQt0iYvWKomRYyBv+graz4GYAxBRZ139xdSx2+V2MbbLNuhtJT5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cG5xP6QcNz2y06
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 10:20:41 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cFndL0hyTz9sT8;
	Mon,  1 Sep 2025 14:05:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8chmUpmbiw-6; Mon,  1 Sep 2025 14:05:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cFndD0SFrz9sSs;
	Mon,  1 Sep 2025 14:05:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ECB808B77B;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id vyRL5fj0VNV1; Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BB70F8B78C;
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
	devicetree@vger.kernel.org
Subject: [PATCH v5 7/7] dt-bindings: soc: fsl: qe: Add support of IRQ in QE GPIO
Date: Mon,  1 Sep 2025 14:05:14 +0200
Message-ID: <4d7560f77dbd60f6297958acbc0cf412d8921856.1756727747.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756728308; l=3640; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=59wZHIxllxZcwCrUxSll7FEcA0fEA5AxS+AodcoXc0o=; b=cy9tS21IUHMGiZz2LkFhr/4YksRHLYEUvFGDBOX1axyjBo+bzEtfYV3xtcm8RSYCvbvRHjfst 3wmxkdbNoD3BJ0zgTn8FewQGYmGd3efkqIdatLK/NyqRDmBjpdLHkdM
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
v5: Changed to DT schema
---
 .../fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml | 27 +++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml
index e6ba319a75c1..80f93914c779 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml
@@ -17,6 +17,22 @@ properties:
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
@@ -28,6 +44,9 @@ properties:
   '#gpio-cells':
     const: 2
 
+  interrupts:
+    description: List of interrupts for lines of the port that trigger interrupts on change.
+
 required:
   - compatible
   - reg
@@ -39,15 +58,19 @@ additionalProperties: false
 examples:
   - |
     qe_pio_a: gpio-controller@1400 {
-        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
+        compatible = "fsl,mpc8360-qe-pario-bank-a", "fsl,mpc8323-qe-pario-bank";
         reg = <0x1400 0x18>;
         gpio-controller;
         #gpio-cells = <2>;
+        interrupts = <0 1 2 3>;
+        interrupt-parent = <&qepic>;
     };
 
     qe_pio_e: gpio-controller@1460 {
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


