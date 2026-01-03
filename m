Return-Path: <linuxppc-dev+bounces-15189-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B504CF0465
	for <lists+linuxppc-dev@lfdr.de>; Sat, 03 Jan 2026 19:57:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dk8vY4r5Sz2yNJ;
	Sun, 04 Jan 2026 05:57:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767466665;
	cv=none; b=aVHFyQT8vuiF5HsagKlYCqKGSXD4+UkZguZqBQaKrNJifz8eqlc9vu/K3Eq2qVBNgg2JtvkhpdocKh92PVSQ64QKo2pNSx8cSqUF27uRGDXqKLohmAQiZvO7emUhOPYq7WbWFB4b+b8DXvf/FUgENYoN3WkDI+qiwBXVtcAqj9VUWDu82NDZyW04+Y3J9l4W8egNVsKI06lOMxyvrjOCUsBRNT5nr9aImJKcVzRwAkJze4vcKS6dRcOcusteHvkc+bsiSc27aKtmRxWneczvZvCAjG/L2YKwr8fNXdnVi9kkdSvIh7nAA9zK/Y8LMQZTMvhJry6WYYZ/DVFgDzwUOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767466665; c=relaxed/relaxed;
	bh=gs1QJX5+j7PccXzeuyqD2rhoZ/2YN8mtRQIc6xDf1YA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M1BDEBFtKfCS27fLhOBVNnd0xhbSgwlZeT/pi6TmyfVmkPQXLKDIq4kkNCkj7HgAOeq+khrd1CcjGK8g72BjOBVEFP4xypV1wBzlyqVJS8d/Jb5lPQAiPBxKbVDMrlWllvKXdcdLinzGy63BABpZ8modcu83IfRTnTfeeLW4zuiElM/kOJtFfVxHgj3xhU9HxRK/ZeomVfpBMIMDdQBE4Ew7Plt1+EVgcgYzVk5m0N23CHvymjgP8msB14ez/WWelk2FcOBC+0yaMbjGo1LbJroKVhS5zYodJjQf0D6aQdsFoFh48FvtZniH5hz3HSJ+AAyG/S6jvZ9gM4nFlBLLYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GNdgvt5N; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GNdgvt5N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dk8vX5fnlz2yKn
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Jan 2026 05:57:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA8CD44352;
	Sat,  3 Jan 2026 18:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75E55C19425;
	Sat,  3 Jan 2026 18:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767466662;
	bh=b6pLrsI/UwhsykmnJymez4U5jn32qFK8+QM/sJu1Q/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GNdgvt5NDSHiTVaFA3yt324A7X9/rj0XIXVcKjIPoI/WqMMT02pEQDmaKEe3p5gKY
	 q8o3kDzAvUEw0lMv7C7pAFLcjZosikhguK80hWPN+rkKFly0FZ9hNE4S9MSCx+Qoh8
	 FmSe3DKfTpWnO5pHE/ZH3G+yM9Ml+iTfxq9qJ9kJFNk0IemVvq2XiE/U4ak2lJorjn
	 z3lriRsu3eMDJWSKCy0Y/2pJqncIvPA3HgVcNk0mxetFaVGdEQ3e5F30L4+LURQoRX
	 NZAB1/4ZQ/CIDoQSf7La1rp6EsTLryuUwfgvChih3zi+TsqlRWKOQp/gEnmiyor8uV
	 oie/s4rfbJ/Vg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE5DFC6189;
	Sat,  3 Jan 2026 18:57:42 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sat, 03 Jan 2026 19:54:08 +0100
Subject: [PATCH v2 4/5] powerpc: dts: mpc8315erdb: Add missing #cells
 properties to SPI bus
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260103-mpc83xx-cleanup-v2-4-b2a13c0a0d63@posteo.net>
References: <20260103-mpc83xx-cleanup-v2-0-b2a13c0a0d63@posteo.net>
In-Reply-To: <20260103-mpc83xx-cleanup-v2-0-b2a13c0a0d63@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767466660; l=659;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=SOxgRreTN2XiGdnaxGDo2anyzlxFEzi5vS5RNGSUBZ4=;
 b=yHhCNJ6v87inFMoThz8AU2jQGUlfWK2+s+IXPq6W8fqn0A6PxJ5xbLuRjGRvxEElkUQ2uRF5n
 L5CNvbF6njrB2l+HfR2WNxEnS9NN8ppBDehI2MBzDy0m5mK+GPXFoy4
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

These properties are required by the spi-controller binding.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/mpc8315erdb.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/boot/dts/mpc8315erdb.dts b/arch/powerpc/boot/dts/mpc8315erdb.dts
index f4938a7292b9c8..0b087180e1815f 100644
--- a/arch/powerpc/boot/dts/mpc8315erdb.dts
+++ b/arch/powerpc/boot/dts/mpc8315erdb.dts
@@ -135,6 +135,8 @@ spi@7000 {
 			reg = <0x7000 0x1000>;
 			interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			mode = "cpu";
 		};
 

-- 
2.51.0



