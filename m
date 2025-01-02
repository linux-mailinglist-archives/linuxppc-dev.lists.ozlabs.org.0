Return-Path: <linuxppc-dev+bounces-4570-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C916F9FFE34
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 19:32:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPFgG4gYLz2yys;
	Fri,  3 Jan 2025 05:32:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735842746;
	cv=none; b=l0UFD2LfFCXpr9pfPqQpTVhU5zLmnTCOR8UsXIqkXdaojqYp0gi5FX75wMfk9u4KKal8CdqPb7Jgd8ZudMEq7V2mW8qTlpd0LeM4/0mjK8rSyZ9qISdaNSvKXxHW9UYnSnfEYjHJr1hovAGuSjqvK97R/jOEOENFEBUpP11BeOfyYcbFli+Td/WqznDxRf0tuKzuEareMkBR/iJx7WSAYbJLZ7+uPwwc+pLgQF76hjVLXMDJ3YoBmgMzockDquYnO6PTmedye9coI6/HDVoJFxYtkmf+PksRvwogU5PHZjlywbhFxIcXOHiv/UkfoJB9Y98WsbAEV5blrMz2iG2NLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735842746; c=relaxed/relaxed;
	bh=WHu6KcgXtEJfBBi2MSVqL6v6UVD2oPA6er0jAuWzq5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZCNa9bkf8tKeg9qKQEC8VCoVfMcCSAc/eYZc+sv+MVdYluqLci7P+yH0VFoXfo0g0z0OIIDwZNjT0Pli9E/olxf1dSTp7UFshf2tHzucwH6faQZgFLkaq8Cb8p86eWC3S25uAJds11nZfyvLl9CIwFmx7GtuorUVQwFPnx+xFRYO0EgOsBnIP+aUkY9BYQCdos8pxa2nNzWZNO6vKHxjkjgsZ8vyQ2OvKD+b3zcE60hiFgKesdw9HoCmw2v6SL1DezMuQDmPhD0b83zJIYSuz3feYyVrzQNMFqX3aBMCYX8+hD4HTLKzv42KTrK4IMdz74WESohviqLNoQ5vkifndA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LXYNMcH2; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LXYNMcH2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPFgF2CCFz2ytQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 05:32:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A9691A4140F;
	Thu,  2 Jan 2025 18:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07B13C4CEEC;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=3IuI6Je6+KzTU4VEUrEMJiz+nfBZ75oArtG+0/qEXpA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LXYNMcH2allQiI3peCetZ4GsFekCTANyRFHBpDj4gD/wP5L2UBgCxVouf+dvwVwFK
	 Lmtj+9rIB8fuHM+lRsYN1INHzDOVB+fmfxZcFNkO8raJiLiDTRhdPvV1XYiaKBOO2n
	 xHzdvmQp9ocz552Non0szpI3wV7pR6LWJ92UHV+YQtScbxVo+s5fYrE9YrzA+Z9PNO
	 y+IPPl32S5mAO43ye4BK+8F9kFiS0AtmssDThBHndMfHEMGdgWjAG4kMUKjtgLugS5
	 uvkI3lgVmfNN1xTZozacRTl958aY3SX4HyfAJ4kskJFNvkP3yuggyDxf1+w0s1Mlpz
	 Su7x37siyUeUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B36E77197;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:48 +0100
Subject: [PATCH 07/19] powerpc: dts: mpc8315erdb: Add missing model
 property
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
Message-Id: <20250102-mpc83xx-v1-7-86f78ba2a7af@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=689;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=i2m+p125oOMi3j6Rp3j8r0hNlqhm4mTOC27OluxVi5k=;
 b=jz8B5ynuEhfVPpf7QliuUWYwuGE/+fLv6S4QEVZTSRKh9vuo7oKhx4K5ZB/3HV0XhXRxx4tyP
 owTd0RUdADtB3j8aGvSMkGCN+0FQkHxUZK5mCetV0Jkq/2JyV31JdqG
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

The mpc8315erdb devicetree did thus far not have a /model property, even
though it is required by the devicetree specification.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/mpc8315erdb.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/boot/dts/mpc8315erdb.dts b/arch/powerpc/boot/dts/mpc8315erdb.dts
index 28c06faf8ce0eb330a0108eba321b4c1127a8ae2..44e82d8b26302b72676badd70c5ab26eba3d08e4 100644
--- a/arch/powerpc/boot/dts/mpc8315erdb.dts
+++ b/arch/powerpc/boot/dts/mpc8315erdb.dts
@@ -9,6 +9,7 @@
 
 / {
 	compatible = "fsl,mpc8315erdb";
+	model = "MPC8315E-RDB";
 
 	aliases {
 		ethernet0 = &enet0;

-- 
2.45.2



