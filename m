Return-Path: <linuxppc-dev+bounces-15185-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F550CF03E9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 03 Jan 2026 19:08:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dk7p41FpTz2yK7;
	Sun, 04 Jan 2026 05:07:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767463676;
	cv=none; b=jYfQ1mMBQs4GYkmP6XWMc2nFGnhs/CAM1yRnyfqxrjPQmpVOU2/DthFx4TK1BowFqLyxCP3bjU+Mh+3kRaC1+kbQHLXF1iCLLzwqAnbNJTj48h8aO5G74uuff3ct0EomvIfhdkVsJbW/ZXbCWbcO2RZgIE7fvBf8dvpRTEApBDam0U3YLZ6yXhqrXgpXsC9jDJzwRusKfDGqrRu48a97S9XzisPV/qSiDdxINDp2mq7qBnUe3XwHsjo3/PP9yRsr/X6mK7e2QsOn5DQkmmmgXDL42BP7BDQgB8xIGQlSwhhZzDJ9mJevgTYKkRsNXaWPO29ANGz7HmbHu0sq5DYfkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767463676; c=relaxed/relaxed;
	bh=YB7W/b1VQn0kvNgrqs3UC9ByQmqXrG7dIuJcfO3um30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lwxiPt7b3CjY1Ms+CnX4FtervHD3ouIL1G+RkwBiKqm3rQ8bJWPrSXldIgekwZdboft36AEKAs7NhXcVoRT/Lnd3MNMUW8meUkai+GSnsjcFt5tMC/JwQt2NCLOy5lARfknfXpHoZcoVb8vWQYLjqiYBMq8JvMpdtnxCdKIGX2Iu8fXk1wQCxY4SmJm9R4QJ4GScEq0M6U9tyGeI7vVjb94t9zzEQU/p2mhl6mWUR1Wxl0Hjqa5rebbm/26/e5J3PF8uPWKbWt07F55EPc0jQRC5hnSVl5c2WVE/0Q9trmmX1I+U0oYA35I/+C4cM0zYNrafqcawQZj/zzG4EdDR6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rFnMyNDR; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rFnMyNDR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dk7p23Twjz2yGq
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Jan 2026 05:07:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 909F060017;
	Sat,  3 Jan 2026 18:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1429CC113D0;
	Sat,  3 Jan 2026 18:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767463671;
	bh=R4w6+sdSTrHVY71plBapF63HN9oGwBYSt5kWxnbsngU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=rFnMyNDRFlcI/lialH+mfL/RI3VGqwNIriD+IFJEzfosiGi+v1kYfWYaSX1bdQNAl
	 3tZ7heGvD6lzZqLIRe1OcNpUsRH2+NnY7xSXIYJDXwRwJRsKVnxVJanOX3zgI6dfr9
	 yuhDjYsisQhGVahFe4gjB6856chyIfZGxw9eG+wWecseXK4698WfnB/ke8E5vwGzHF
	 c1ONhMPKTJjQxwq4n3dFojuuA3MIR85kGEkDi5TSOsHXLM/PwMKchDjxgTwQhIc0mF
	 UtOnGS3b667WPBraaB0zgU3+ba3bDi7zY8F1I6z/7WLTS1wxiIUEjKLIDE+EUjzz2k
	 eO9AyIZ/G7FoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023C7FC617F;
	Sat,  3 Jan 2026 18:07:50 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sat, 03 Jan 2026 19:07:41 +0100
Subject: [PATCH] powerpc: Move GameCube/Wii options under EMBEDDED6xx
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
Message-Id: <20260103-gcwii-kconfig-v1-1-9c56518190a5@posteo.net>
X-B4-Tracking: v=1; b=H4sIAOxaWWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQwNj3fTk8sxM3ezk/Ly0zHRdg6RE0yQTQ9MkS8skJaCegqLUtMwKsHn
 RsbW1AGWNClJfAAAA
X-Change-ID: 20260103-gcwii-kconfig-0ba5b415b99b
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767463670; l=2106;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=Xmi3nHsOpx0ZMFbJp+lFFK0uM65XCmoMsN2vzb2RwRI=;
 b=y7w/FrbhG2XQSxdrDNab1OL+gCa5EyXqlWW0/7hcczAE1Dkgw80QeFKV0NE4cHWv8NXZP/Jln
 fVeQRSXewVgDIy+ncRV4XbkrlAAts4Gw7fdaOn8Ba6+wnKMNeRrwCd/
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



