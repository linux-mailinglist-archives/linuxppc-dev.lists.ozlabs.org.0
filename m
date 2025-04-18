Return-Path: <linuxppc-dev+bounces-7801-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C89A93DCB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 20:48:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfP0q5hcnz3c4h;
	Sat, 19 Apr 2025 04:48:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745002107;
	cv=none; b=ZSB1v3lWzXjw5zwVgaN3y7a33f25LbaHww5ZZdAOlID06SE9DW+EdiX8GfeMjwRyxTWUefYse6IwXz2KviWR2red5qZuPyttQIxChCU8Ffi1vRicmCtNBn6BtRurEM7JvJlwpcg3cCpCgNhbpcm7nHCc0kcocb747rrecu+zUtggvQfK7rqQPDdm9JaLhvoQGkCog/NVQ1CnXd7PDOtxoXfBPfrmqHGoGM0rfBrpIdlcyqabxaNnLo7GzsmM6yWVIUFEk5kL4G6XnGJTeIzI5x1eYEFdkrJr/OXRJ+yXJeYbnhVXs6nHCGU1chlfG843sAK0sIe5rP5VOz9HnkiKLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745002107; c=relaxed/relaxed;
	bh=9JqTknVBznSa5r5zkYwKn40k0FyyjT66SL/2xTuQW4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DruX+isx6hXXkYup997MpC4MhuXmcLIWnoalDfKFryFVsb/L0L/eUt2uinvx8XvihTZJ+1qsjYvHO9eGJOHm3y7kVqysDGR55bzo8AsfmeltQweHVWXM2DaBjNScHSTo+Pf44mS3pXViXgOld+voAwRFuX5bnWlmWb+7o6m5/Fww4+Bft+d7w5JNDb/yfTtrzO5njL+Oi0zgdumUf7Ws38g8kPxWPFWy9ef7WjmAHwExmWKHFzbnRkLz9OIwSmllX+32++1pFQDVoOeX4E6hK2fGL5z9V/uF1j5GsrFb6nlwsmNno0aJs1pweZz+oecclSZnbjraNx14kP5JsBsyYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qDXo/Ncv; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qDXo/Ncv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfP0p3kxwz3bxM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Apr 2025 04:48:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF45D5C4348;
	Fri, 18 Apr 2025 18:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74F55C4CEE2;
	Fri, 18 Apr 2025 18:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745002103;
	bh=HEU4YutA9kG/s0/mba3Ytoq2491mLHZZ1L9DBov7nkM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=qDXo/Ncv7gRvbyUXc1P8PIjOCWAB8BXXi8u3a3c6zNMziFoRBIqe+IvYHMfEdlDJK
	 hAUYJBaIdqglqaMWnHJnZBpB/y9KeQNuAJO+QN6EYQo0ChUBCd2uXBEZyQ1I5cvL/i
	 Q1i9nDU14/8nGaA2pFMdT197bJFGyRVVoJHAWsCgSdE/82cMWQMp5ZshFm4ubqJtEk
	 UDT1rfVGEDa9Zp83jtCEbX1m6WZX2JBwZTL0pjgdHi5e6DFlpjD3+wfZp4agFU66OX
	 zAqfJFNhiFoDCFJHp37y/eKNY5KIG6UK+Qhmw8mu9tnUDtUv10L1T2yEOihjXUzxeF
	 Avnd9JJ5Joc2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF10C369AB;
	Fri, 18 Apr 2025 18:48:23 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 18 Apr 2025 20:48:14 +0200
Subject: [PATCH] powerpc: dts: mpc8315erdb: Add GPIO controller node
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
Message-Id: <20250418-mpc-gpio-v1-1-24be2365992a@posteo.net>
X-B4-Tracking: v=1; b=H4sIAG2eAmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0ML3dyCZN30gsx8XXPLlOREyzRzA1MTMyWg8oKi1LTMCrBR0bG1tQA
 w6h8oWgAAAA==
X-Change-ID: 20250418-mpc-gpio-79dca9f70546
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745002102; l=1409;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=yIo4OMFzwIHk/Y7Ad7fIh7vacgPJLYwfWJ8zjzP38HI=;
 b=MzF7If4e34vj/JrF+b0JokWfYf8Phq6bZVN/3vliB9QLi2BrnJARDvJb1SwTr4FhTogpGdi+M
 FirkRP7a6TaAqPvGZ9/xqAYQDYkFSgt9bL21NT0rt0QrvtFJl/aFXy7
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

The MPC8315E SoC and variants have a GPIO controller at IMMR + 0xc00.
This node was previously missing from the device tree.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
A version of this patch was previously part of the series "powerpc:
MPC83xx cleanup and LANCOM NWAPP2 board", but I'm splitting it out to
reduce the size of that series.
---
 arch/powerpc/boot/dts/mpc8315erdb.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/boot/dts/mpc8315erdb.dts b/arch/powerpc/boot/dts/mpc8315erdb.dts
index e09b37d7489d01bfd16a26e9786868f630fa0262..a89cb3139ca8c3d4f22e43838a4b7d2dd5109aa5 100644
--- a/arch/powerpc/boot/dts/mpc8315erdb.dts
+++ b/arch/powerpc/boot/dts/mpc8315erdb.dts
@@ -6,6 +6,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	compatible = "fsl,mpc8315erdb";
@@ -358,6 +359,15 @@ pmc: power@b00 {
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

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250418-mpc-gpio-79dca9f70546

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



