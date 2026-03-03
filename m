Return-Path: <linuxppc-dev+bounces-17583-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDQtC8X5pmk7bgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17583-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 16:09:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5E31F2197
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 16:09:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQK3P6T09z3btf;
	Wed, 04 Mar 2026 02:09:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772550593;
	cv=none; b=VNkm5GxK/+i0fl3ZWWMTSVT1Q2pw+rlAZbV18paMjy/tpPSuCoxQKwAP2SBsxLs6kzfex94k3XXvwIAHaIQ4UgWCftvx6vF2wrmdYLfoQyHs7J8u9XjtUjnp2wdiv6RVKAFCXBmP1wciyufXYcNPgtuiZt58grRsHvffAgp1JFZnId3R8wWnyNxGuNkPlMXPDq+46qT2g2L6Odf4+7zgiuHQfbrEM/okXE/qyAZb5HaIS+Mh60WASuJSaAUZ4CkHM2qhysrmHD4BNF8jRRlYr7ycdIko7uYds4v/MW8ZXB3MUZ3g10TM2Q3881bRwD8QkHAkXBtliOhPzlXjXYvq+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772550593; c=relaxed/relaxed;
	bh=YB7W/b1VQn0kvNgrqs3UC9ByQmqXrG7dIuJcfO3um30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PdQmpXvV1lkGrg94nyU/7w3tTOOK8uEOdmE43hoC0ZgOD6wox6uSuCaAZtS/G1ImFvNIlULsFRVDNPby9fYIlSOy87FhGiBLphJwXWmsLtGt3mSSopmDPdAanB2DuHBlxHd8w+rWof3Ipcuuq+aWu7Ls4kaBFDSJRy5jeFjpvYoVdUfTCH0J8f9ioF4/uNnvbuzzZfbl5Q9BwPkQ1X6A8iHmZu7p0dOprGW31RfbKRN1De3/gdtRFBkY2vXQpz1YbheUgr4dVx3oBCfYpQxVbql/JMe2lLd/iW4LhYIANwCM9CsIMDIaTrNaWc9U2BCBLt6BRQDA5971oEY1BIk7Pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oEpXkRsB; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oEpXkRsB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQK3P0cp3z3bt1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 02:09:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 83D9443D60;
	Tue,  3 Mar 2026 15:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5ED17C2BC9E;
	Tue,  3 Mar 2026 15:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772550591;
	bh=R4w6+sdSTrHVY71plBapF63HN9oGwBYSt5kWxnbsngU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=oEpXkRsB9wHnAYPpdRbFWfJ+0ZcSWIzbZwV2CJQIwkoh/EUfyJtVoFwFUsftB5nYg
	 q8nfngUgi8DqRYrEEL8Y61rNZqBJNCMPo0qW0Fif8OLKSQ7hTB20d1u3KMFD64c/95
	 mev4GiezNk6CR4TaNcT5pv32za6syzyoGp0WZFiZan2v6qkR+jGbvytBbktAr1o+BM
	 Mt4XV+BrmiastrjT9OCFkHKl7lbMhbW9XRfpnQ838RI/r58Ak/OaGMNSY/Yb7zgVCa
	 97YQ/EymVY5ogIDKnfK/IQltYtfJo+AQu+EWyKaD2xRe8Q0EVciBAG/SwAE0yJPDdh
	 70vVHGoO4YbNQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43DAAEDA683;
	Tue,  3 Mar 2026 15:09:51 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Tue, 03 Mar 2026 16:09:49 +0100
Subject: [PATCH RESEND] powerpc: Move GameCube/Wii options under
 EMBEDDED6xx
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
Message-Id: <20260303-gcwii-kconfig-v1-1-636b288e7270@posteo.net>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Link Mauve <linkmauve@linkmauve.fr>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772550590; l=2106;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=Xmi3nHsOpx0ZMFbJp+lFFK0uM65XCmoMsN2vzb2RwRI=;
 b=yiVBUQtZ+yjf3Bem6jDqzzZEFCyn8pmHnGrNQO0JTMrDNAXZgUUARRgjKbUoOBuq37W6WFgTu
 ewBssZJw5itAmj1Yd8mt/ux4HTcB8xa6N9MEisBWh1vemIWhMLc+/Wf
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
X-Rspamd-Queue-Id: 5A5E31F2197
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17583-lists,linuxppc-dev=lfdr.de,j.ne.posteo.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linkmauve@linkmauve.fr,m:j.ne@posteo.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	HAS_REPLYTO(0.00)[j.ne@posteo.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,posteo.net:replyto,posteo.net:email,posteo.net:mid]
X-Rspamd-Action: no action

From: "J. Neuschäfer" <j.ne@posteo.net>

Move CONFIG_GAMECUBE and CONFIG_WII directly below other embedded6xx
boards, and above options such as TSI108_BRIDGE. This has two
advantages for the GC/Wii options:

 - They won't be moved around by USBGECKO_UDBG appearing or disappearing
 - They will be intendented in menuconfig/nconfig, to make it clear they
   are part of the embedded6xx platforms

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/platforms/embedded6xx/Kconfig | 31 +++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/platforms/embedded6xx/Kconfig b/arch/powerpc/platforms/embedded6xx/Kconfig
index c6adff216fe633..f406b3c7936b23 100644
--- a/arch/powerpc/platforms/embedded6xx/Kconfig
+++ b/arch/powerpc/platforms/embedded6xx/Kconfig
@@ -51,6 +51,22 @@ config MVME5100
 	  This option enables support for the Motorola (now Emerson) MVME5100
 	  board.
 
+config GAMECUBE
+	bool "Nintendo-GameCube"
+	depends on EMBEDDED6xx
+	select GAMECUBE_COMMON
+	help
+	  Select GAMECUBE if configuring for the Nintendo GameCube.
+	  More information at: <http://gc-linux.sourceforge.net/>
+
+config WII
+	bool "Nintendo-Wii"
+	depends on EMBEDDED6xx
+	select GAMECUBE_COMMON
+	help
+	  Select WII if configuring for the Nintendo Wii.
+	  More information at: <http://gc-linux.sourceforge.net/>
+
 config TSI108_BRIDGE
 	bool
 	select FORCE_PCI
@@ -77,18 +93,3 @@ config USBGECKO_UDBG
 
 	  If in doubt, say N here.
 
-config GAMECUBE
-	bool "Nintendo-GameCube"
-	depends on EMBEDDED6xx
-	select GAMECUBE_COMMON
-	help
-	  Select GAMECUBE if configuring for the Nintendo GameCube.
-	  More information at: <http://gc-linux.sourceforge.net/>
-
-config WII
-	bool "Nintendo-Wii"
-	depends on EMBEDDED6xx
-	select GAMECUBE_COMMON
-	help
-	  Select WII if configuring for the Nintendo Wii.
-	  More information at: <http://gc-linux.sourceforge.net/>

---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20260103-gcwii-kconfig-0ba5b415b99b

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



