Return-Path: <linuxppc-dev+bounces-5964-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63061A2CF67
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 22:32:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqRwR0dVBz30YZ;
	Sat,  8 Feb 2025 08:30:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738963847;
	cv=none; b=hx7sVXFib8lQDS8bbyZkelrkg0gq8oiLR8FEyMav9+lsEqUnCwrg1EmSM0TIfoTjvBjZ9OdrtrHhzuMtHRUWM1k/H3QLmX1Lb7f0XVofubFqTT4xQODTAm95zmLcsdb2hRn9NgfVEuQAAT5OpjgONgb9hO9HwwXm90TLd2u2ZxW6qJmPra4fCFWIIP/YysZyFvy2XxMYhVQZDIJ49SHJ86xOIEkfmUWmSzaIvKW245W/n3n7rpd8fFcrp9mOq6mOQNM62E0GbwfzKY+a3ieQMJ0znrMBQiScRYsacbMAlkEc5GlMIIX6zMA/pH25Ch8LpCBdG9Z05nCl16h9/DbBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738963847; c=relaxed/relaxed;
	bh=9E/RWKOsAY8F0miTrhlU9orbtYEu6+Du/vRmzcH2fO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OqiFk6EIsr60fOjxbTyqLsO7ZRjuRM9AqIz5OTL5P2nkiTbB4zkTCdLJW54IRGWHgRAOI/rHCGoTggKqw9E4hgScMKkWPJttwBUsHpNpFCnFbB6yUNSr3WNZuVUhSbMZlzcQO2ct6cwVsa/KFXLjmZvyIRPWyUfjSxPFdNAbe5KPaZcAwM9+skxEN2oWh7IO5/SDeFj5dIumEsJYjI9rU3ZkRfA69DgoysShc5xLDHAPH6UtNoU79B8zvW6lT+Y+wKDhw0YUVRTiWIM8HvpPJWmSJTdOq2G/KhlMq+3cJyimUQ9jw+Tk2BOI9fZss0IXta/qB35xGmx26StIlgq74A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FBR5wURb; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FBR5wURb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqRwP3cw7z30Wc
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 08:30:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 26ADBA43DBC;
	Fri,  7 Feb 2025 21:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65FC1C32786;
	Fri,  7 Feb 2025 21:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738963836;
	bh=eMHZF1DoORYUOyj/ZZ8qW5nusClbM6PqWbv1Pix9bx8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FBR5wURbRuGofUwX3skGdx1JxCFVESLiBAv/GnH08tQfthqbiBBq4cbTUy1dehvZw
	 ht1acFtuTNTnsnM3UvNHJSl4aZzHLBiaJ7pUHx8hX6JI5lWM2Lrmcn8HOBSDrIr2A5
	 edZ7uvs9OpL38qyeXTP1JplcHBIPOcBZ/qNHev2LjJ/d2i6o33mSVAzLzQv6XDvwAe
	 yF+IXDTZDos5P3vE9uVeLHp92+rqA5b0gG+ADiHssXc8zzyG4QaUdLcy8b1OtQGXxt
	 ZyEEOVy+iScUVZLU98g9o8mx/Dm1kThZv3gbeawthjlV+QhWLIIbBfWUPJ3gpGT4qT
	 a0T24uUixoYSg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525B3C021A1;
	Fri,  7 Feb 2025 21:30:36 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 07 Feb 2025 22:30:29 +0100
Subject: [PATCH v2 12/12] dt-bindings: mtd: raw-nand-chip: Relax node name
 pattern
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
Message-Id: <20250207-ppcyaml-v2-12-8137b0c42526@posteo.net>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
In-Reply-To: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
To: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: imx@lists.linux.dev, Scott Wood <oss@buserror.net>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738963832; l=986;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=Bwo7Oi0fdIfwt2t5GuE37lozFcZAE9exVW1MqG+hZ/k=;
 b=SZzc/30AQUy3Myphn35PzhnrkOhxogqN5IKE9FSo7Vsu0rw8Ixof6uIexKpSYOqpZo3vubTfH
 x4L8/aEDHCICwoOgSwgmZwqJ/eM9pYppzwxGKFGZBkefo7Qh/p8tu1l
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

In some scenarios, such as under the Freescale eLBC bus, there are raw
NAND chips with a unit address that has a comma in it (cs,offset).
Relax the $nodename pattern in raw-nand-chip.yaml to allow such unit
addresses.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

V2:
- new patch
---
 Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml b/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
index 092448d7bfc5ccd246ca4b2341464e18722a2d51..1c9e3a40d8f9f77115525e5a6be0951aae001ae0 100644
--- a/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
+++ b/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
@@ -25,7 +25,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^nand@[a-f0-9]$"
+    pattern: "^nand@[a-f0-9](,[0-9a-f]*)?$"
 
   reg:
     description:

-- 
2.48.0.rc1.219.gb6b6757d772



