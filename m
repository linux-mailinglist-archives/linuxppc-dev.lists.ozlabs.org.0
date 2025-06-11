Return-Path: <linuxppc-dev+bounces-9295-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F24CAD5EB9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 21:01:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHZkc3TbVz2yDH;
	Thu, 12 Jun 2025 05:01:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749668472;
	cv=none; b=dAn5ejXqCnIjSua62nW6g55tVj4qJ1CI1c+1KM3N6xI46Zi7OheixElN7RN0+oHtkihH7UtI8bu5zYo5pEvkg2gKgYsqBejYQjPyGq9iT9PvW5VY9MkPkmLUjOtNCvszJ0zsSFbYILV5Hb6TdNO7L1WP0ZHEDNZ6rClo8gUtMmzQoiYmVUtjFAMQvwQo3ok93UH0CHR7F2Kju7P7p7t7h3CyFvlCeO0psVEzDxRnLVMUddNp7FNoSFWm2vuQ+VE6t/Gjlbjm76PIF3EUdySl1LrFRKkCAv6OJ5darAXafahzETqPucOOkI1JYuPZrEmus/9k4DCzg1ERKoyK077RaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749668472; c=relaxed/relaxed;
	bh=9JqTknVBznSa5r5zkYwKn40k0FyyjT66SL/2xTuQW4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Qg+4hkTPetVAwIhS4km+L4CZ3KA87ZUSk2vzMIXmvNQvdPxUVUxrn/lbGLNCL48PryohH6BAQ2PfoSJz7cqg7hhH9w//6ajPvNtp5AmRVdhvSd5GChgnZNUH6b4gWF8UBu01NgvCtW5JBmSEOxkQ4zCK/B/DYE05BM4ExXQ2FUg55CQFPeNLoTJWgDB575Z7EH3cwdvWm86vpch+Igu3Nqaoe1w6KGfLUA9rNxUoewAexWDWzHyhG87fyxuqwXottW0/a+9ilh6PlF0YPQldbyQGiCphnDq3dZfMfVy0bSU3puZcfn4FHAV+pBN5oEiOICHRFaFnAGikyshk96SZ4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s7d89dHb; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s7d89dHb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHZkZ35Ffz2y82
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 05:01:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F166D61F1D;
	Wed, 11 Jun 2025 19:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F5D0C4CEEA;
	Wed, 11 Jun 2025 19:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749668467;
	bh=HEU4YutA9kG/s0/mba3Ytoq2491mLHZZ1L9DBov7nkM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=s7d89dHbjMDYIEd1Gn4wI/fitFyYw4wUZNjZKDx64yneWUFCGbbWUgIBliO8RBCLl
	 s+3mZuC5dTu99y8EHqyNt8pcLNhBIekbr7QiD7MkvGSPPhA3lp1R+XgewCLdpcW0en
	 PhzRiFpANFU8jm83mTp0Hi8Bl3taTUCHLlZL9HF82U9zXwhG5h9e8njw3nCtiohzCu
	 wlcU3EV2c9qR4I12+s/ho7t5CNIKd1rfO9SG69VFXa6rLpUolrkhM2xhmn856INgha
	 yKmNhwggG9t1utPlyN5XcUzbJ4T4i3QBCqclNSlRF4CZXHYSt068+2LT4Yj77g3XUF
	 HXq/tkc+MOlKw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94910C71136;
	Wed, 11 Jun 2025 19:01:07 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Wed, 11 Jun 2025 21:01:01 +0200
Subject: [PATCH RESEND] powerpc: dts: mpc8315erdb: Add GPIO controller node
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
Message-Id: <20250611-mpc-gpio-v1-1-02d1f75336e2@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749668466; l=1409;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=yIo4OMFzwIHk/Y7Ad7fIh7vacgPJLYwfWJ8zjzP38HI=;
 b=t2XtzKk2H7rwfNQdpvWOKJG4VX8BR/rxKH6Dz6UQMgVFtZru+BUuVAF8xZp/evmj28KZWpxgG
 JgO+ojw6KFlC8hwxoeHM7YdVVX7H+wqjB0xhsUl8KqDVM9xAD42Bznx
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



