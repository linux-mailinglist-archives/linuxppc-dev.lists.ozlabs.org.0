Return-Path: <linuxppc-dev+bounces-4581-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A39029FFE66
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 19:33:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPFgP5M2Nz30Sv;
	Fri,  3 Jan 2025 05:32:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735842753;
	cv=none; b=OaFPDXx4yhXuLlO3jyh3uczNiSYjmD6jHfPaIhppYLg6G2KcctClPHtltfszG3kczn7FjYG3k0b7Lul6qN0rGZFZD9+oph5k52Tgu2yWPnIUBe/8EMOO77XOM1lXCAGI7pcfgyyf2xPVgnn5uzFm+mVElQnDQ7KI0Ip88iQWWMdLGIEDEZ53hmR3j09K7FjnV7uS0n8WGEoU78bbqDZXfSUCjbpIde/qr38EKeEB/hJhU2rT7rjw1D6K+UrRffRD/AfHYfx6lFUS4KbOADkhhMvV/Zvpw0wXuBOA5SQXRVK9dJpsrPa23gQFwU6dEXSlHA2v3v3ELyAVsE9JHjdG8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735842753; c=relaxed/relaxed;
	bh=4jKAzGIo6GBRtYE31huckX0HQ8g9redipamvjFKHJh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Et/vqbSwyeTa0jPEMCvMdrL3hBczfIIlhP6DHQexr9mQin6zFsqNAYgcGhz1XVijhiNe0sjFqxUlQTPOyptXdGyFGwW8F8FwPPZMOyKoesdZ3joxNPE7jDZ8LLOGeE8k7udR6pEr4oIsMh+ynslx2sN5Pl1ADHL62Ywl8ieRV2DnNhPR9McV/xvJQPe/dT+wB8/4qcBrPxgIoXqxttMJTFuKnRCsKJcCz4pl9kYRlnATECWl469VhD7OKNI4OA+ZO8b8CymAsKpjjIVX8snnrw9GIixBnMbp9isiYniCGYh5Shx6zqB+3hXZcZR2FoqMIOjqQE02JXgv6JWFTsb84g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qhpM50aC; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qhpM50aC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPFgL3KsQz306x
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 05:32:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AE3995C5E18;
	Thu,  2 Jan 2025 18:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61F68C4CEDD;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=N9t8aAgpI8PU3Jfgn2dC8EX23k9PWRvKXnQA/lsH/3s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qhpM50aCPBwNI13gJd+k7lW7C9YqwsPrTPnx/zCNeDIwsiBh09I6zrtgfRjj5gmoL
	 xjW96fGK/Ex8zfYiN/sytPOaRsxslSC1mRWPGEEWlEfdP7sY1ElVI9HyAw3xLF3cWu
	 ddzSuc9mm22QvnfI03E0silU/BiHB2yhYEghWOyOhTOu6vux5r2k9ZUkMT9awQp3MU
	 UprO7T9Av2QsxT97QLl67XnoTm/5Eq2mC61Jlu4EU+nYt7kjNWu2kvbK/97CajZl1P
	 lK1RRhduXpycsMCDeqf1G9Jmincqt6ekj6DmNINNrJZtkBc5xeIuIB4Oi0yRdceRyY
	 nk+FMbJxC+Pkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D94E77197;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:53 +0100
Subject: [PATCH 12/19] powerpc: dts: mpc8315e: Add GPIO controller node
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
Message-Id: <20250102-mpc83xx-v1-12-86f78ba2a7af@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=867;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=53IPkv/+qKgm0/DViEM4D8nVx9tPgdRG/PC4lnN6+fc=;
 b=grga97ENyMGY97nIZwfxEfbacZt96cEOsFzwdrvwrUslDs8ieVW4MRzpzYExkcZ8F3W/eVin6
 JigBllwbn/YDXqHVrrZjnesI72P8Hf5rc+QgiKZ0KM9ibGG5RuJEr76
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

This node das previously missing from the device tree.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/mpc8315e.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/boot/dts/mpc8315e.dtsi b/arch/powerpc/boot/dts/mpc8315e.dtsi
index f9d1b48b08799822d33f5e7606030019a19b4743..ad6131d913fd45ec5b693d85e031ec520fb28b2f 100644
--- a/arch/powerpc/boot/dts/mpc8315e.dtsi
+++ b/arch/powerpc/boot/dts/mpc8315e.dtsi
@@ -302,6 +302,15 @@ pmc: power@b00 {
 			interrupt-parent = <&ipic>;
 			fsl,mpc8313-wakeup-timer = <&gtm1>;
 		};
+
+		gpio: gpio-controller@c00 {
+			compatible = "fsl,mpc8314-gpio";
+			reg = <0xc00 0x100>;
+			interrupts = <74 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-parent = <&ipic>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
 	};
 
 	pci0: pci@e0008500 {

-- 
2.45.2



