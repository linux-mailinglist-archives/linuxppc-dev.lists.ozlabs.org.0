Return-Path: <linuxppc-dev+bounces-5571-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE4AA1CDCF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jan 2025 20:00:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yh1772R7cz2yFB;
	Mon, 27 Jan 2025 05:59:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737917955;
	cv=none; b=eOmp+ZQblJffdoZKL4TSLaLVG1BNhopKHZExAgLWrWEwcavzaim58ozp472dU8Y0FpSwJe1Sv+lwe7NDJbV7ekc7fhWCvMRN7PhUSMAUvRLIkXMS8OJjjJDd29AHIZpkzDfBFxZ7fPXnu+KmzWfzrGVOyTR57QDG2BarSRtJMw8HYw3mRSjH4wzSdDvckeRobZKxcc2RqKxk6a5X4qNxyeq0w+MHCy3RH6SslXUjD7IsH762R1QctucQ9d1iAOk/oUlTl6yF6fUvUyqOUx7ylTy4USpukV4F1CAGjH/hGLkXqckLvqKtW54emnVNB7Xi2xBXy/h4rCUrVQhsUHiFMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737917955; c=relaxed/relaxed;
	bh=9MUtoNn8DGME65VKTaUp2wcnKYHAQ36NRH5Q4F8lmUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sxx41t8hIRR8WbkoXWl2k6HNm4hsbpdRbeHTVe4G7A/5D6RfZgIazC2c92AhfX2dTs9AF5cuDYiRvkYoC+Q9bqHB7RpLveUJmOHcjjihQUvHI/T+7YKjKgR2moVXGQn1OBQ7m3WwRggoavS7+tSPlgicfvuVkU5lCQEY3lUiae2VVewQzaIOAXO3HfXxnLYpXW6hkVy34QbSv2s0nvD/tn+t5WELWjw8Ha+w9+pyb3UzMXYdA56uiARfEEe/NTy1lMvWImPsZSt46PKIYFKopxaPZuX+9QjvCqcqVBjVjS/hAt3WxIGiELo50i0gyO2K5xfOv+INF5/tAO7xbV355g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VKQA9VPT; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VKQA9VPT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yh1756rw7z304C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 05:59:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 175E7A4101B;
	Sun, 26 Jan 2025 18:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11B3FC19422;
	Sun, 26 Jan 2025 18:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737917946;
	bh=r6w1TGpVSqKoSAo8UJWjBKkemEchRp94CZSpKLCcVic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VKQA9VPTPYPBXavTlj/t8VBkruGrWrint1cIPRTVYmzKcYSkLCACJ3dkx6YFGD5aF
	 I5j0anMoe7fWtO3sLpUNV/oYGmyZ6Pd/1IMgKDwtellO9zkx0HriAYlpGLEZ/hmMXU
	 X9JdBEmd63a57sa6SmidOk6bIjwFXbcLPOcE4pBEEPJRcMZE8RpbPZ0R5rRqT/aSkI
	 qLEU8dB2BSh7PNeKGe0KN7uw1wf0MLOqPex7UWVF4pcFmavGTl0z0ngohluNmDNOtz
	 xsmoello/jN78f1HAh4FwkYSl6GQEzR0w9qf1u6Zl3fdiae50NcCD6vrAii4IvLEl2
	 1iBMXM+cQuCOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F5BC0218D;
	Sun, 26 Jan 2025 18:59:06 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 26 Jan 2025 19:59:02 +0100
Subject: [PATCH 7/9] dt-bindings: watchdog: Convert mpc8xxx-wdt binding to
 YAML
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
Message-Id: <20250126-ppcyaml-v1-7-50649f51c3dd@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737917943; l=3719;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=INVkBCLHOPyRZgA3id7yu3YiJSlbpT9rkFYnjOPWGRw=;
 b=qIrd3NqNYsZmRHz4Bp4oEm0lNDz7AgiaFpCxd9WVkNnHgQgErhQ8oTpycy+6fz5u6+yLeokS7
 DjGnZr5OgjSAQorB4z4FQuYzKQmxCRJELg+Xp55lZMxlrTDHbra662w
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

Convert mpc83xx-wdt.txt to YAML to enable automatic schema validation.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 .../devicetree/bindings/watchdog/mpc8xxx-wdt.txt   | 25 ---------
 .../devicetree/bindings/watchdog/mpc8xxx-wdt.yaml  | 64 ++++++++++++++++++++++
 2 files changed, 64 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/mpc8xxx-wdt.txt b/Documentation/devicetree/bindings/watchdog/mpc8xxx-wdt.txt
deleted file mode 100644
index a384ff5b3ce8c62d813fc23d72f74e2158ff543e..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/watchdog/mpc8xxx-wdt.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-* Freescale mpc8xxx watchdog driver (For 83xx, 86xx and 8xx)
-
-Required properties:
-- compatible: Shall contain one of the following:
-	"mpc83xx_wdt" for an mpc83xx
-	"fsl,mpc8610-wdt" for an mpc86xx
-	"fsl,mpc823-wdt" for an mpc8xx
-- reg: base physical address and length of the area hosting the
-       watchdog registers.
-		On the 83xx, "Watchdog Timer Registers" area:	<0x200 0x100>
-		On the 86xx, "Watchdog Timer Registers" area:	<0xe4000 0x100>
-		On the 8xx, "General System Interface Unit" area: <0x0 0x10>
-
-Optional properties:
-- reg: additional physical address and length (4) of location of the
-       Reset Status Register (called RSTRSCR on the mpc86xx)
-		On the 83xx, it is located at offset 0x910
-		On the 86xx, it is located at offset 0xe0094
-		On the 8xx, it is located at offset 0x288
-
-Example:
-		WDT: watchdog@0 {
-		    compatible = "fsl,mpc823-wdt";
-		    reg = <0x0 0x10 0x288 0x4>;
-		};
diff --git a/Documentation/devicetree/bindings/watchdog/mpc8xxx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mpc8xxx-wdt.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c78a424388c6e30bc4656f5444e621c1b397366b
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/mpc8xxx-wdt.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/mpc8xxx-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MPC8xxx watchdog timer (For 83xx, 86xx and 8xx)
+
+maintainers:
+  - J. Neuschäfer <j.ne@posteo.net>
+
+properties:
+  compatible:
+    enum:
+      - mpc83xx_wdt       # for an mpc83xx
+      - fsl,mpc8610-wdt   # for an mpc86xx
+      - fsl,mpc823-wdt    # for an mpc8xx
+
+  device_type:
+    const: watchdog
+
+  reg:
+    minItems: 1
+    items:
+      - description: |
+          Base physical address and length of the area hosting the watchdog
+          registers.
+
+          On the 83xx, "Watchdog Timer Registers" area:     <0x200 0x100>
+          On the 86xx, "Watchdog Timer Registers" area:     <0xe4000 0x100>
+          On the 8xx, "General System Interface Unit" area: <0x0 0x10>
+
+      - description: |
+          Additional optional physical address and length (4) of location of
+          the Reset Status Register (called RSTRSCR on the mpc86xx)
+
+          On the 83xx, it is located at offset 0x910
+          On the 86xx, it is located at offset 0xe0094
+          On the 8xx, it is located at offset 0x288
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: watchdog.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    WDT: watchdog@0 {
+        compatible = "fsl,mpc823-wdt";
+        reg = <0x0 0x10 0x288 0x4>;
+    };
+
+  - |
+    wdt: watchdog@200 {
+        device_type = "watchdog";
+        compatible = "mpc83xx_wdt";
+        reg = <0x200 0x100>;
+    };
+
+...

-- 
2.48.0.rc1.219.gb6b6757d772



