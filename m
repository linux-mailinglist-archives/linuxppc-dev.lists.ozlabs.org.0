Return-Path: <linuxppc-dev+bounces-4584-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 130589FFE6D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 19:34:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPFgS0lqRz30TY;
	Fri,  3 Jan 2025 05:32:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735842756;
	cv=none; b=mSWZ2K3q/mKZpsVTWtQhYXt4HB2oBe152Uurh9PYyq/++YyPUAWECn7Wb4+yjWRzDzh/Jje44+K+Hxr42IDGxuH+yJaHoKbUNS+Sas33X4U+ywTbOLKTDIStzPbSLVVC4bITIAMVdPIG10i5fuIp0t+K8sZDuUadvUj0sb15m05mijUpLor+DTA7l3/vrUaFxFjWxvRPb3F1uREfiCSp6h60hSA5GdxSVmNMPTx5A/fSqtPurdavj6rE4TuQ/+vYypl4oWAs+bruedTHAiF1oG3okFQSx/ftxZteySIvd9ph5dHWTTtE68Nr0WSRH520V17/mxad6K1vKO5PA3EgCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735842756; c=relaxed/relaxed;
	bh=GtNn2bgbgQ5UtxpQ8MWqmUE7l9Ds+WUc75CEBlGVVKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VxYNHIbnCXaEth15eQe79/szKXPWKkZ5yp7pjVzIZuQdR2PW5ntDil+05yLgccHWbsBeZE0FELZHGZMVdKEMNoYxnn5ejThRGHwf2inWWHGiIR7QN/UmRpSqMP6gT+3H0HCVVYgutHW9+sC5NPyd117VfnDFXkZKBx2Ev1k0vRbDoFk4Gp7JV6/DsRP/8FCQcDxmX8KuVMCvOJEZV9vUQTP9uASCX+Xpf526C37HHjghOZFtAYDw0uforXGNp1yfsZIjtJEGdJKslxD3tOXm2Bff4uSauB4xwkl3d6t/s9tNeSjb0BQ7lnqnwz69BuxN3HubBciyEmJ3VOiywBzOtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r4LV9qV8; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r4LV9qV8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPFgL5Cf4z30CD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 05:32:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B56475C5E68;
	Thu,  2 Jan 2025 18:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E70DC4CEF4;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=cRbD1xOLj/k5kb2AcJlWgFePDr45LI87NCwjMv+jncI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=r4LV9qV8BN450Yak6/1181aMEw4ByjaEBmzgubOGJUNpvXdFEdjL3YfSiYg3qbgEf
	 IYqqBxGCimTDMEsFWOcUnJUu1OjQ3fKqbh5kYYj5b2dJFqAK/zosFUW0DwJ/l1ikEP
	 NUW6SDmVq81Am1NIBTfeF68qsWMqzYNqvbzCM6USL1ueRdriFR/YAbTevr0MqdYPRf
	 nLHg7ItmBJUvyfXKkTuMQgzNjnoo971qaMlqB66g3L0iaUTxct7Y3M+KK2Jn9uWS8o
	 Bd4EgNMIVzI4+VIAmNG8CeAZUXe9Je4VqUXa2DJR+xWk7XMFq9iVm3YWWzD+UX0V59
	 x7IqLqHAyLhvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B1EE77197;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:51 +0100
Subject: [PATCH 10/19] powerpc: dts: Add MPC8314E devicetree
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
Message-Id: <20250102-mpc83xx-v1-10-86f78ba2a7af@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=700;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=iJjsNtyNoaNU2zY47Wv9zZ+eAHSNUrFXjwgqJp3n0GM=;
 b=/hziTWMuTlV1P/hE3RO9qdSuDxn2Tgq0iTXT9NLI1DfKaJCijj1zAtFX2/zROAJn+CSjfQIeV
 aVmXNG9Z377Bcy1AgtoBVBdsz5VRDJOAmy4W6DgRCvAQXW3mczS1ogD
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

The MPC8314E is a variant of the MPC8315E without SATA controllers.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/mpc8314e.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/boot/dts/mpc8314e.dtsi b/arch/powerpc/boot/dts/mpc8314e.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..65a96a485dded5d4918d96b38778399d2f348190
--- /dev/null
+++ b/arch/powerpc/boot/dts/mpc8314e.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2024 J. Neuschäfer
+#include "mpc8315e.dtsi"
+
+/* MPC8314E does not support SATA */
+/delete-node/ &sata0;
+/delete-node/ &sata1;

-- 
2.45.2



