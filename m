Return-Path: <linuxppc-dev+bounces-5570-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F83A1CDC1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jan 2025 19:59:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yh1761wyxz3057;
	Mon, 27 Jan 2025 05:59:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737917953;
	cv=none; b=cqgLRfBDO0RujlL4LZu8nEYXuLvDKSFZen7H2x+ehHjlJDGuCUbVPmgHYivVD1LG+MtOBQOwHYXvsnYLSJPo6iuL3tSGMq0HGLd5hpZOKD6OE/psTUVi+kYv3FA+Y9KBsqB33bLhoNEVrdPAZ2r+didJuCegPB5tpi1TmppONGaBH2LnQ+aX4hA2gK73f9X7rV2Xa23ITThNnswtmmID5TtRcfA3+tyRWzfMKxjXv5zYeb6qCiiQWFJr6vEQgTiD43h8L/EIiZa2OAuBU3kx56ll0RE9JD/5KbuNnOvQ9uSaQ+uqBpNKWGCYz8g1BmmBRux7n9S85ayo0gXKpfFm3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737917953; c=relaxed/relaxed;
	bh=PQsn4H1PLRsYWOi2apT4h6Ue5V1YbpkKf0IlIPde6hU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bBjeW7YcArYTfODzZn3acNcKuLHCB7R7zdLYrvMeT6VUX7rxbkX6nxF14J6KNZb2suh43XGx888Wif4kVueBjT6wYtMslR/iukJeY0sdnTY0jgY9JRTx9id4qutktAZlBlP1BmB4BigD34xwyWiWHIJZu+D5Zn4RU3/Ohd6+0HpzuSoln/1g7ed61YIO4mkJFFybSmshWfQ1WyTQ1NFhSM7p0tkr35UrWzVkPI1QahPZYK+6OoDXXUGCC4BxbdK+JydUfrkSVhoZDBMsXRQfnXJsgV2EEKZjEUwUN5s/Q1X0RjdVc6qugWF7ObAiHRCozYnjPf0YMdFl6LyAv1vCZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MXzfr+Tz; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MXzfr+Tz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yh1730MrMz2yGC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 05:59:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9D42AA40FE0;
	Sun, 26 Jan 2025 18:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBBB6C4AF10;
	Sun, 26 Jan 2025 18:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737917945;
	bh=kdEy1mfULIpKzXm5eLphJofVfiUx8H2JQ4v42STBzbM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MXzfr+Tz8P9f6KUPhM0SxXHW0PqAxYpOGJCU4HMSLPyge1rxSylBFUrq+MNJVdHkG
	 IJVtgMmki/D5T1vnikZCw6Aq5PTLS7kfvlxlpKorDH5zFz9B/1e7/JgLB2VgMJZKH4
	 hqs8T354VkqpxYGXgv3EM/Icqe7mKRl1WxZZZChajsy10kfzTRY0iBtCc//yLWuP39
	 M8LUXKowx0JdvEl97VIiPb6VzfcNTTEpFTWFpRmcXstKxD7ygR2/aq2t5VGmvj3g/U
	 Eviey5yM16QoLEeuOJ7z2A0I/agegL1Kb9jPTRUhN8PzxOVREHQUKQyb3ysgYLtfzQ
	 RV92qF27kEwew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2CFC02190;
	Sun, 26 Jan 2025 18:59:05 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 26 Jan 2025 19:58:59 +0100
Subject: [PATCH 4/9] dt-bindings: mfd: Convert fsl,mcu-mpc8349emitx binding
 to YAML
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
Message-Id: <20250126-ppcyaml-v1-4-50649f51c3dd@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737917943; l=2828;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=Zs0qjqUn7j/PQS1DXYIjUgL76exzKlYYjv7eRLN8FW0=;
 b=X4UkPsnyhkPYNIFxPFYHZl/RaHmhkgyUlhH0nyS5nFtXhN07sT2qCw1iRrJR3NsSF3JvEDjxA
 t46J6h9PuZpAd2nDnX/8n4skfmikScso7OeLtftI+2fmvAKvGoDR8aF
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

Convert mcu-mpc8349emitx.txt to YAML and list the compatible strings
currently in use.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 .../bindings/mfd/fsl,mcu-mpc8349emitx.yaml         | 53 ++++++++++++++++++++++
 .../bindings/powerpc/fsl/mcu-mpc8349emitx.txt      | 17 -------
 2 files changed, 53 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/fsl,mcu-mpc8349emitx.yaml b/Documentation/devicetree/bindings/mfd/fsl,mcu-mpc8349emitx.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8beb2ed9edb745f513deb5755d6802309b069f46
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/fsl,mcu-mpc8349emitx.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/fsl,mcu-mpc8349emitx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MPC8349E-mITX-compatible Power Management Micro Controller Unit (MCU)
+
+maintainers:
+  - J. Neuschäfer <j.ne@posteo.net>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,mc9s08qg8-mpc8315erdb
+              - fsl,mc9s08qg8-mpc8349emitx
+              - fsl,mc9s08qg8-mpc8377erdb
+              - fsl,mc9s08qg8-mpc8378erdb
+              - fsl,mc9s08qg8-mpc8379erdb
+          - const: fsl,mcu-mpc8349emitx
+
+  reg:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - gpio-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mcu@a {
+            #gpio-cells = <2>;
+            compatible = "fsl,mc9s08qg8-mpc8349emitx",
+                         "fsl,mcu-mpc8349emitx";
+            reg = <0x0a>;
+            gpio-controller;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/mcu-mpc8349emitx.txt b/Documentation/devicetree/bindings/powerpc/fsl/mcu-mpc8349emitx.txt
deleted file mode 100644
index 37f91fa576545aa245d893c24248bdbb2c0fcc07..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/powerpc/fsl/mcu-mpc8349emitx.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Freescale MPC8349E-mITX-compatible Power Management Micro Controller Unit (MCU)
-
-Required properties:
-- compatible : "fsl,<mcu-chip>-<board>", "fsl,mcu-mpc8349emitx".
-- reg : should specify I2C address (0x0a).
-- #gpio-cells : should be 2.
-- gpio-controller : should be present.
-
-Example:
-
-mcu@a {
-	#gpio-cells = <2>;
-	compatible = "fsl,mc9s08qg8-mpc8349emitx",
-		     "fsl,mcu-mpc8349emitx";
-	reg = <0x0a>;
-	gpio-controller;
-};

-- 
2.48.0.rc1.219.gb6b6757d772



