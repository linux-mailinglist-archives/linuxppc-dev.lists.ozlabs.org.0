Return-Path: <linuxppc-dev+bounces-4587-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1CE9FFE71
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 19:34:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPFgT2s8Wz30VF;
	Fri,  3 Jan 2025 05:32:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735842757;
	cv=none; b=aeyTmpUc6ZZW6wHrSABYlS9VBjHAJS78jnUymYZ4SoYSI5iAS9UCvl2f7zefnnhYo/1TSyoRS6pqsq6685N6xFcjpNERS67aPVGdbe0rk3JBomtyUaiO7wJvn0uYtUSces3y0x+4jiYW/hHUXMpaSbRGowBBT+2vIqEAR2dQdyhtYOAp+S+85cp/saaXLSNtkq7lMerwKXEBlhZDNR3ghqVAVYGbIYMd3w6175m4UKjSnvFRdwuNPdG0XwKmJsFY+Eb5EJqrzjpnsJbpYaQDoahEW0aVB7KTYCxxmkPRDzzUNsaPo5PeFmodZ+MATj4yOq7zCwxHyv2diXHJ1YGHZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735842757; c=relaxed/relaxed;
	bh=XpVjz9frqf7s/2WlPpDz+vS4C3rUcChac+jju1XGU2s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QuqmoKRikv8rQDPq4VQ2sJQJnb8ZWndAmKamIgr2jRNOk97mlMj8+IofKPopCyQxRUYdGyL3RMQfnF1b4Y0jbkf0XvnzFpGPLJeLFQolAeWMyrGr35OaVWWwtb2TcnjOVGLWKHvEqfSSE1x2/l9GIjpfGyEacxcoesg2Zj0QZOOL2hQMo9O2FFGeC59n7uU88teTB3DJWqQcwdfByo1g63pjOVhxftQ7JCOVMOMQacSLPiaG0bc9ioYASmr1rOoioXfRpTUvADVq28N0OqW7Aa08+L0OerPveiZkIFnACnEgsNT6EKYJ/OeTK6cfmlfT5LIVcprI3HRo/3EeXeGVbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hcu0Q0P/; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hcu0Q0P/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPFgL73hNz2yvn
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 05:32:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0E1515C5F7D;
	Thu,  2 Jan 2025 18:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85A52C4AF52;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=3L9qpZcgEGcLXesRfvFJOqr7gB5IE0nhAqMyMONojog=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hcu0Q0P/wBUdT6HpbQlaDCfX7bwxV8g11fqiteHBH0kbW0INFwcPYoBF1d2Jk935i
	 RkxIdbleO9GNitiLV/TYmbrmhmgRZ/9msPgC2qh/zEH1dQa2pPoA5cWOU+TyKzn2mG
	 mg2t8HOE4B6/xEC47JTSC8vPGAFlgJM05eFxvg2jUv0bx0srkCbKi9Spl1D6XN58vt
	 Itwbm9OxIBhehmO2T3g3dxZLTC6h0/Z0Bs7xbTxGDwy29X4R8K2VCtZ5V+W9JjlQ6B
	 Co+/QGBTw2QIvovH9pjxzHUW3RG10/tNTiTfyNxuhBNrt6suDo8pids1/7idtNe72Y
	 LRMT4pKiqoe3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7918BE7718B;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:55 +0100
Subject: [PATCH 14/19] powerpc: mpc83xx: Switch to of_platform_populate
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
Message-Id: <20250102-mpc83xx-v1-14-86f78ba2a7af@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=1933;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=+IqpHh5XW/bYptAKTy7ofbzqqjbf0TgTP59VXCoHzqo=;
 b=9e/ltqkhbkqoYmAvt8DHPwJqvqjwqUwV7mVFU5GYMkehfc+vd97JJq/T1F6hT+F/IFNl9WZQ3
 aOurraZE/mLDNmRzKchRUir6Kg4EjKmgIvfmKynORihXWTpBQ5uGZnh
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

Quoting from drivers/of/platform.c:

> of_platform_populate() - [...]
> Similar to of_platform_bus_probe(), this function walks the device
> tree and creates devices from nodes.  It differs in that it follows
> the modern convention of requiring all device nodes to have a
> 'compatible' property, and it is suitable for creating devices which
> are children of the root node (of_platform_bus_probe will only create
> children of the root which are selected by the @matches argument).

This is useful for new board ports because it means that the C code does
not have to anticipate every node that is placed directly under the root.

As a consequence, the of_bus_ids list can be much shorter, and I've
trimmed it to the necessary parts:

 - device-type = "soc" and compatible = "simple-bus" for the SoC bus
 - compatible = "gianfar" for the Ethernet controller (TSEC), which
   may contain an MDIO bus, which needs to be probed, as a subnode

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/platforms/83xx/misc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/misc.c b/arch/powerpc/platforms/83xx/misc.c
index 1135c1ab923cc120f377a0d98767fef686cad1fe..bf522ee007bbb1429233355f668fc8563d8ca4e2 100644
--- a/arch/powerpc/platforms/83xx/misc.c
+++ b/arch/powerpc/platforms/83xx/misc.c
@@ -94,18 +94,14 @@ void __init mpc83xx_ipic_init_IRQ(void)
 
 static const struct of_device_id of_bus_ids[] __initconst = {
 	{ .type = "soc", },
-	{ .compatible = "soc", },
 	{ .compatible = "simple-bus" },
 	{ .compatible = "gianfar" },
-	{ .compatible = "gpio-leds", },
-	{ .type = "qe", },
-	{ .compatible = "fsl,qe", },
 	{},
 };
 
 int __init mpc83xx_declare_of_platform_devices(void)
 {
-	of_platform_bus_probe(NULL, of_bus_ids, NULL);
+	of_platform_populate(NULL, of_bus_ids, NULL, NULL);
 	return 0;
 }
 

-- 
2.45.2



