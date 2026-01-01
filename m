Return-Path: <linuxppc-dev+bounces-15118-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE7FCED357
	for <lists+linuxppc-dev@lfdr.de>; Thu, 01 Jan 2026 18:10:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dhtc605T2z2xqr;
	Fri, 02 Jan 2026 04:09:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767287397;
	cv=none; b=cU9+s8ADnwlMefPOa+2WcTivANWpGvHfrFwNCiEdqcH3YhD5Y5tb8dtCF74xJ1A7t0EkF1xAparY+StxBBXR16FpyrYr7xiU0uGtCzDeiGfeokVa1A8ktIvPfyg9jKijS7vUu23RvGXie9P7V4S3Sp+ETKl+m+br5ytrdQybsgO31Vr2FH9v5/EEEcA+girruw9bqcrSIWNBZ/VOe3ynuAKcbzKaum6oQXxXeLlq5bviYKRsWTkzZJQvf7RErq/BnMCMmjFbgUowgJiZEnAP3mvlp/W86umxoNbQzR1EGmpom3nB3zTPveO8/ekyNHjoE0m5nKUdwwba39TWtMF+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767287397; c=relaxed/relaxed;
	bh=B4BwMR4oD6CjLgpJw/2L0XIBssousKZKCcfS5hnzO3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EDK99SgtgXr3/pvH8kqOr/VhvTw11oEfeNjZTZtic9XyTiOIogFN/U/IomGmmNqyqUQaKB5LiqIJ8Q8YZjYBlq9ipFjGvjaPhK2huG368KjQDiWjwpTm2t6EymIvSzLFBbKlQvA8tCCwwJPKj2SArVIH/XDI2nOxWorfuvB+cya5tdCBOMQAI9S2vztqkhgs2ZqkoNTH7fEG7sb0w2ai8iWf8I75It+RGHm5sDFSnekwJ4Gvmg4sgp93pdFYkwuuZzREf3bkszYNdCiLFRD5PhKVppYY8m40WE9qYykZ0TyUpTkp8Q50wsBrg555kW7DBpb/Y5sDgYZQO1WSe+8lhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N5VXkK2C; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N5VXkK2C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dhtc51NM7z2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 04:09:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A24443CAA;
	Thu,  1 Jan 2026 17:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D553C4CEF7;
	Thu,  1 Jan 2026 17:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767287395;
	bh=I3C57r6azO48yZzyNuNe6/kxRiFpeGaZXr+2V6WEkW0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=N5VXkK2CHJbn9UhLJ40jV1k4kpHWbQWlBvTKWq7AjitLOHY9Vm70wEtlELsndB4Ze
	 Ek6XxkNtt4FoJL/lTcHOTM4GB9TAMzXVvq/+Xs1tMTLgNd2MrdpH+uxPPjgeIXpahU
	 XCYVMchocehn1VzImJgy73nn0umw6OLZ9wm1M1ZJXEx+rUk0yQLpFasPQDw+gx3z1K
	 l9C15515E+ciitIbvgR6pOEC5y3kuQSuWZNUQKCcfXt4EAFbS62SClI3RyjY2t+Bf7
	 DdjXrl7cYj6/u7U5C0aRF8SYRP5iv9lvELLQlwbDLW4EGIQeeBi/Ubbut9Ip3PxHRe
	 +fj876zZGyeZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BAFDEED626;
	Thu,  1 Jan 2026 17:09:55 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 01 Jan 2026 18:09:46 +0100
Subject: [PATCH] powerpc: DTS: mpc8313erdb: Add timer@*/clock-frequency
 properties
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
Message-Id: <20260101-timer-clock-v1-1-8e467b48648e@posteo.net>
X-B4-Tracking: v=1; b=H4sIAFmqVmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyNT3ZLM3NQi3eSc/ORs3VQD47REy1QLY9NkCyWgjoKi1LTMCrBp0bG
 1tQDr05SDXQAAAA==
X-Change-ID: 20250625-timer-clock-e03fa9e835c8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767287394; l=1719;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=wToNi3p+7oH/fZkL7rybDw1OVJ8Mht3DHd2zANSoxwc=;
 b=EuOs6G8MKKfgu4iOPLtXislVo3FJEGSi9IB1l8K9O7U84ug/zPMUzxDSWQFrh3p3EQFb2QC5U
 3yLS4hvMjyfBzNYMATEHlpwrNtHC4IUl+05foxoqqCqynh1udKzEJnW
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

The recent formalization of the fsl,gtm schema has shown that
mpc8313erdb.dts doesn't provide the clock-frequency property on timer
nodes. A few different expectations collide here:

 - Both the binding and the driver for the Freescale global timer module
   (GTM) have always required clock-frequency, since their addition in
   2008 (v2.6.26-rc5-236-g83ff9dcf375c41).
 - mpc8313erdb.dts never had the timer@*/clock-frequency property, since
   the timer nodes were added in 2008 (v2.6.26-3343-g574366128db29e)

I suspect the way this worked was that the bootloader filled these
values when booting on an MPC8313 board.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505300136.HOpO5P6y-lkp@intel.com/
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/mpc8313erdb.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/boot/dts/mpc8313erdb.dts b/arch/powerpc/boot/dts/mpc8313erdb.dts
index 09508b4c8c7309..0bddc3be9e62f8 100644
--- a/arch/powerpc/boot/dts/mpc8313erdb.dts
+++ b/arch/powerpc/boot/dts/mpc8313erdb.dts
@@ -308,6 +308,7 @@ gtm1: timer@500 {
 			reg = <0x500 0x100>;
 			interrupts = <90 8 78 8 84 8 72 8>;
 			interrupt-parent = <&ipic>;
+			clock-frequency = <0>; /* filled by bootloader */
 		};
 
 		timer@600 {
@@ -315,6 +316,7 @@ timer@600 {
 			reg = <0x600 0x100>;
 			interrupts = <91 8 79 8 85 8 73 8>;
 			interrupt-parent = <&ipic>;
+			clock-frequency = <0>; /* filled by bootloader */
 		};
 	};
 

---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20250625-timer-clock-e03fa9e835c8

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



