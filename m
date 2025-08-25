Return-Path: <linuxppc-dev+bounces-11241-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9041B339E3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 10:50:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9PdZ70nLz3cdV;
	Mon, 25 Aug 2025 18:50:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756111842;
	cv=none; b=JgL14NRczXKzORpnDD82ov5FD0x2IBO7TqhMfb80rUzCKI8b1h9+muvUrMzmILtCYJFMSE/GHx6YjV0BRYeS2rKmFIv6DSv38DFzPKbON4Oz36/RYNlOsC/Qd1QJYXesfw5k1V0z41kjbxdmv+xV5rMWvX1CIRZuJAswdmxUoq8+QeSGbVAmyDyO1LBLqXn55ptOneJO+GA2i31A5OQw28Fvs/12OZd4URkZlILa+vmsDMWgJf0Q2aWf0cfQxTfnW4Gb35YoTGYX/cysJBpvtEmft5cKXKSrN1lFpUpO0x6KUWyJhIEutbBVFHJv6pn6AhiClKmczo57aFFnbbNthA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756111842; c=relaxed/relaxed;
	bh=CJjDuyo3mv3STrPbXMkCAXQsZcQqeXkqw2u/9y71OB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UGiXOCZ12MQT7g9k8HcKlPcQN8f+VsokqjLvkNgaQNNgjLDf1bTgjVml0OWs5i0l4uvYrK8ED7J3CtP8D77wwZOadS5gC0k/6ng6ogSLrXBOGFx4UHbH8kzIeiar6XIk6/UH7uFEKl7XbaCzgYgkUsViztEzgCrE9FjKorH1bfk3D19HqxXMsewF9i7aMzbVQOY8mpRQcWTOHoo4wUbUb7i+MRSGpGU5Juj2Kn7iR8LIqzcQfI0zGQAthKUEXUL3cV2xNEh8sMQG2JWi9gAD8V5VSKdDf3f9A24RQJh2Q9ju3Zz1HzhGtEzK3R56H1JoG475wnSDVwpL4WP9s50VDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9PdZ3d9Xz3cdD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 18:50:42 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c9M2F0wx2z9sSV;
	Mon, 25 Aug 2025 08:53:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hJtlr8MteFdI; Mon, 25 Aug 2025 08:53:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c9M2934Mjz9sSW;
	Mon, 25 Aug 2025 08:53:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 563068B775;
	Mon, 25 Aug 2025 08:53:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Le2RSoDiCK6o; Mon, 25 Aug 2025 08:53:21 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2BEC28B768;
	Mon, 25 Aug 2025 08:53:21 +0200 (CEST)
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
Subject: [PATCH v3 5/6] dt-bindings: soc: fsl: qe: Add support of IRQ in QE GPIO
Date: Mon, 25 Aug 2025 08:53:20 +0200
Message-ID: <17636607f2beac3b64c87b3bec035fa27ce8d195.1756104334.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1756104334.git.christophe.leroy@csgroup.eu>
References: <cover.1756104334.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756104796; l=2395; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=QhvZ73V/K6mLL1ZVf5apmdcoCnnEbaW/6rnCe2coUxA=; b=W6xHYsyrYOAn4BTFu+CwZUgLJqa/yIwO5E6zIlNWEvIzGbrRY/khegwiLpqlOeuIDwey/zPRe mTg+QCWpd8SCrIH7+9uDPjPAp54QDCiVPc/fZdV08anMC4132ZfjU7F
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In the QE, a few GPIOs are IRQ capable. Similarly to
commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
GPIO"), add IRQ support to QE GPIO.

Add property 'fsl,qe-gpio-irq-mask' similar to
'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.

Here is an exemple for port B of mpc8323 which has IRQs for
GPIOs PB7, PB9, PB25 and PB27.

	qe_pio_b: gpio-controller@1418 {
		compatible = "fsl,mpc8323-qe-pario-bank";
		reg = <0x1418 0x18>;
		interrupts = <4 5 6 7>;
		interrupt-parent = <&qepic>;
		gpio-controller;
		#gpio-cells = <2>;
		fsl,qe-gpio-irq-mask = <0x01400050>;
	};

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
index 09b1b05fa677..829fe9a3d70c 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
@@ -32,6 +32,15 @@ Required properties:
   "fsl,mpc8323-qe-pario-bank".
 - reg : offset to the register set and its length.
 - gpio-controller : node to identify gpio controllers.
+Optional properties:
+- fsl,qe-gpio-irq-mask : For banks having interrupt capability this item tells
+  which ports have an associated interrupt (ports are listed in the same order
+  as in QE ports registers)
+- interrupts : This property provides the list of interrupt for each GPIO having
+  one as described by the fsl,cpm1-gpio-irq-mask property. There should be as
+  many interrupts as number of ones in the mask property. The first interrupt in
+  the list corresponds to the most significant bit of the mask.
+- interrupt-parent : Parent for the above interrupt property.
 
 Example:
 	qe_pio_a: gpio-controller@1400 {
@@ -42,6 +51,16 @@ Example:
 		gpio-controller;
 	  };
 
+	qe_pio_b: gpio-controller@1418 {
+		#gpio-cells = <2>;
+		compatible = "fsl,mpc8323-qe-pario-bank";
+		reg = <0x1418 0x18>;
+		interrupts = <4 5 6 7>;
+		fsl,qe-gpio-irq-mask = <0x01400050>;
+		interrupt-parent = <&qepic>;
+		gpio-controller;
+	  };
+
 	qe_pio_e: gpio-controller@1460 {
 		#gpio-cells = <2>;
 		compatible = "fsl,mpc8360-qe-pario-bank",
-- 
2.49.0


