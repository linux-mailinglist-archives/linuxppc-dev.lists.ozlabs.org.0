Return-Path: <linuxppc-dev+bounces-9296-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A008AD60AE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 23:08:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHdXs5Vw1z2yGM;
	Thu, 12 Jun 2025 07:07:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749676077;
	cv=none; b=MMdEB5nnoWS/pCO4x5XfLHwCOcOlF80YmaLCefEBh88F24zZP/86iZgSEFs9ehs/085V+4O816N8LG/oHYz9Hgz+oJRJXvzUEH7KjqgMxH2pkxKnhT1THV/mJa2IHcZyQb9MZiA5fkoz0E2zw8jqs/N4vy6gigWmeWgJMVOFJWrpOCD0UmsDQJ/8kZS2Z+aU8NaI6ix4znbP1Wg3DjHOTXgJUcaoVHCYieCSnxAeJRKi0f9XWt1sDfH/wDw4m5g2cYLj95NqnlUrNYOxhLXZm/DLQArt270JLQnrUcN1EpyY61FaC0QZ0VQqNKZgNaH/fAfS7RZKWe9B+pZaVB6Blg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749676077; c=relaxed/relaxed;
	bh=Mb8Un0pZMHJrUWypgv6qt72kigcfB3xGrkP0g6ZDMQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kfha55Xbk9GvfCd93JGoRfah7MqT5ruUU9hkQGIw9r7x2osx9WrfJzALQARYP/6JKziFd1imkCpi3EkCwX9rQpJbrSDFR01A60MYaI6I8KoYUXW1/F5iVFTT89jCIl3Dkj/55nTuI7s5vTHc3eJLVoTrC4ihKbD4+EbcfLOwrpgY8oD0OGz7M9DFDTtBx2uY2Foas5yDlo8U9dsbWhwFXNUe+f3n6Kcskz4dpIQv4cxyZkiUhPjNDlGJOPhuVXKDedzjoRyZO4pC0RHzI+he3mXY21ODh6bfKKj6NOiJzojq9xV7dfnh3e6XBA3MYCHf5XXKTDQpBo7oKXuCPt04ag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ojIztc+P; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ojIztc+P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHdXr5HDsz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 07:07:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DBFBCA503A7;
	Wed, 11 Jun 2025 21:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AB6CC4CEE3;
	Wed, 11 Jun 2025 21:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749676072;
	bh=YkZnxUHC6Pl47YE27YCJbGhgb6aZZ5MzUw6WcQieAqo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ojIztc+PjX/SypBj9FTuV/zD3FsFQ/FHLqOlWXPCuV7fAPnuRpqNX43PHeH6moxxI
	 AEmXNmMNzeQBofttm4s+DrWQCA40KNZkwcDBsmEFn1gGGlFB4Xo+p3DeNvbcezR6cH
	 10HCr+P+wRJSTtArrdHkC9doXEFSH0bIwFju/kQBOE2rQ8FvIpJ+w6qx6JbVl74rhY
	 f8h+oDBHHPVSrtt9pSN1VkpklyNqQ+JaWJp9of4WpC4KhM1C3zEb1RSR1/pi2gFAiU
	 sYYo+r3ZQycAamcvFzgaCyokXdrDihBdvYyEq1geTfWUmgx54vOxVbYbWkffJxooK9
	 rQPXCoOvGVMag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BFCC71136;
	Wed, 11 Jun 2025 21:07:52 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Wed, 11 Jun 2025 23:07:49 +0200
Subject: [PATCH RESEND v2] powerpc/microwatt: Fix model property in device
 tree
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
Message-Id: <20250611-microwatt-v2-1-80847bbc5f9c@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749676071; l=989;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=0awhdLFMY97nl4C5F/YShrc0qAsdI3niSehOCyjeP30=;
 b=ZMOkaTWiJOp36wFAV/SY2jnAnp+AZyYy2CRFTJPmh6K0/aofSEgV3b9vN20mTvwv9m1LN1z9J
 q8O2aN8AgxTAYFK/ucjfyFYNO1QFYmpzpBIryCvniX3UPgmg6ej1YFh
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

The standard property for the model name is called "model".

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
Changes in v2:
- Rebase on v6.15-rc1 (no changes except line numbers)
- Link to v1: https://lore.kernel.org/r/20241225-microwatt-v1-1-8e071fcfc2bd@posteo.net
---
 arch/powerpc/boot/dts/microwatt.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/microwatt.dts
index c4e4d2a9b4606a689e3f9eefd1ca5bcf1aa3395f..b7eac4e56019eaa84d8afe70c639f2112defdd7d 100644
--- a/arch/powerpc/boot/dts/microwatt.dts
+++ b/arch/powerpc/boot/dts/microwatt.dts
@@ -4,7 +4,7 @@
 / {
 	#size-cells = <0x02>;
 	#address-cells = <0x02>;
-	model-name = "microwatt";
+	model = "microwatt";
 	compatible = "microwatt-soc";
 
 	aliases {

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20241225-microwatt-d9258189aff5

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



