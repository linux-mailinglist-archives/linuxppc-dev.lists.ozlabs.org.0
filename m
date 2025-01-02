Return-Path: <linuxppc-dev+bounces-4578-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C210F9FFE64
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 19:33:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPFgN5hC2z30Pp;
	Fri,  3 Jan 2025 05:32:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735842752;
	cv=none; b=Ko+qcADhz/aOlMZYwgQi7eCHMtB1UTk1vHgvvm1D7W3dNLmyXOn5lkUwLFe1cBQI0l3JKyFIakn3+izd3PWnRvk8OqVgB/3JOMh6hxTN94Ex1SAPKUiR6FaHPKwhQOpUeCgdMw2yVHTVQ4TvHD9R1cxN2nF4ATQXHmMHWFoZrQjKB1Oe3tNuJUjABmSgrDY6PnVBQbJkDaXrEZgY0Rih/qYDT4hkMGtb7TFjBMpU84+6piuM763rCF8hy/4IaC4glmZlTPYjLyM7NitfdgfRoYBVHn6a62mlww4xRoj0jaIYdxQWqagBN0MfxQ8ncNNdqxgrSK78yh4eIuOKxnH4aA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735842752; c=relaxed/relaxed;
	bh=AhxPcn8bM+2wGEPMcnjTf7B+pXViwsA2fhA6CZcYhJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aPc3kaQ7NIZ+AgbiBJfbrQ6d7muRLeOyrTZzvHsxfU8wg2+Dm+jZJs/llfC0UcK+AnW8ANHdxnh2Cn2BSoP9+sfaYwgajZVx1FJX7mPl6wYo6kNRwizn9i7+qlKgyAZnlhEwLkldColXWax89+LT9cZNWOQLHsIdz1IWDh9+LkmbUW5KCcXOZXMs6eBkHFKfRS4BM5C2EjGHi+sfirWibzR8CgEj3RLo812BRPjl8gL1Y39O+auHBdHsNC5NVCZj2tuGp3iRFCspqofWr7ZbsJgCtEYsPViHxv7ux5FAPKMtVksozss5gd+vyzpVdAquawjaBpebEXsFygV3hK3c9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DGNIlX5w; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DGNIlX5w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPFgG41ykz2yyT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 05:32:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B7C1CA41411;
	Thu,  2 Jan 2025 18:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49296C4CEF8;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=QivrMCISY/M9jftEcOcP9Vtuv5+lW7TayYL2Dl6/xKc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DGNIlX5wlhBPP4C1I4SH/xY3eU37ehaVXY6HvbRfNw3N7SklIKwT5KCeOhJN7y076
	 /TzS64bDz/7zRHqy7u1hLqx7y+/Hbd7esAtMYfdV+Yk8i9CaTMgAQsD/9jJtO6dhb/
	 hlihu/opJR5diiXlT8aI68aS6Qh4AE2QlVkEiHNrRtUFZ0/CIOnn4Mu0l/pn42r5LO
	 eqTA6CinKBLAdEOWarCTfRZIS//ZN466IBoifPEgQEHXV14a9uOA3g6sFkJC7BJ+o2
	 PH0K/Qpn8O7v17SFIpJu8qBFXzBzkS9Oxc2yShc5xxFiNlh013UspMzBzcuJVf43Ls
	 qFy5mkoNSODbw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B03E77188;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:52 +0100
Subject: [PATCH 11/19] dt-bindings: gpio: fsl,qoriq-gpio: Add compatible
 string fsl,mpc8314-gpio
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
Message-Id: <20250102-mpc83xx-v1-11-86f78ba2a7af@posteo.net>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=808;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=kQbjf8yyMIMYDlp9Ljafq6qH6mq2lFyMb6vI0TaGZAs=;
 b=6WNaCpNbcbNLwRTLw2myVEFq6VrIiHRNr0CdOsGX97lbFkdnQDEHvS2wyUJij1FgVkdkVkiMq
 Uonk+3ZBOeDCWPZf3mcIL66HurU56+XDeg9abRg9o6/0x9Ds3gipzGs
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

This is for the MPC831{4,5}{,E} SoCs.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
index 84fd82291ee4031a55f704977ee0db084caef08a..f1b60ab3f356b99f936d7d8bd5e03f9ffabd0f93 100644
--- a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
@@ -15,6 +15,7 @@ properties:
       - enum:
           - fsl,mpc5121-gpio
           - fsl,mpc5125-gpio
+          - fsl,mpc8314-gpio
           - fsl,mpc8349-gpio
           - fsl,mpc8572-gpio
           - fsl,mpc8610-gpio

-- 
2.45.2



