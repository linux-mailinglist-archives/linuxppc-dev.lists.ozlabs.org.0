Return-Path: <linuxppc-dev+bounces-7802-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9259A93E37
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 21:29:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfPvr51sZz3c71;
	Sat, 19 Apr 2025 05:29:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745004552;
	cv=none; b=GF2TC9pF91NvtM7OE7TMSEXS+yBUrZidzz3Cl2CiCGT2jpKce6z5XZHwaiToYVUvZbmPiDbyYbC0+Tc/CE1Dk5SYuO0XAJQvXC+Hv49HVnQM7X1TTD8qu1CSmeo8KXMzVTujAHLAhCprGkMQ8jkBgpGl9D36IP52YQyWHKDHyvUb1919mJIUR9myGGgKHcYzniEVsH9UOK2Mgkv91syP4WkFEsvS5yzVCAyhfHTObSh8OYihB0fUJLi+LECcddwXrPt3gFraCgwqPEnmXiPEI5Q2gTgpNcjiOJf/krqbWJDP9QEy6AM6+OYpyT//ZUSkxoAcGgITuQfYBfyC+B4hZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745004552; c=relaxed/relaxed;
	bh=9Q/eQ6BXEOvxutAVA5unEI6KocEZkFpoiOZ5Kqf1b+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LrpFzTIX/zGHKL9OuLeEplHS3dcO2rYoXae3HViTQI5WvCjuBT1BnE9RR/jOaEvpzjlfc5UmjL4+Rjbo0Lce/ng22a3V+16AOoC3wzw3QSdSBf/VNO/Mw3uDDXCS2oJC9h1X7cdnuy6yKMO5tFNEJDEhpayHLcfK+wKakILT0xFKqiKyWxkRbXlj9zmMfLgwyvZSgebYZxpEFtR1HLot79jxXk17xQs83QZjP8fhFccbUFTri7zzwZhNTSj+GKU0HGodO92YbN/noEYWEOAKmbCAkZQWt6OSjkamAzlT0iW4B7xwKVgqWCUlQSSDt733Gzq6BsIsPbJ3pl+G1nPr9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ih1k5E6z; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ih1k5E6z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfPvq3DYrz3c5J
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Apr 2025 05:29:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91FF54A507;
	Fri, 18 Apr 2025 19:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 926DEC4CEED;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745004548;
	bh=ZnZAZwfeohX4vsPn2M4XWG7XINcO5hBYR5CoxMYmo5Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ih1k5E6zp2leJG5YJG44SjF+l8nAQuQNuHVh7L+bQtJPApJa16OAN97KGqmC9R458
	 QSUQg3wfM9IweIE2fzHMjE3qEnfJQGj+SW+l8mP+KD70uJP9cAhKkRPsfpoVk4DWBa
	 KKVSmDhbhnTl/LY1wYqwBRNhl5BbfaZrCbr92OtGHlf0aEqSDkzIUZLMk6aVvIX5L8
	 DDnf5lvCyW/rRIu57qZFrp84DBUSGbVC2jufsIsJQSYKTWBwSJRiG2NdpxlhwEupQ3
	 7M4E7Id+zq/OzaHCrVTtUwxpS5vRvE4qzVKQ9jMGW+Q+BtP8KzXeUF/X3es2p9SIPE
	 AlfPpS0Yymauw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81962C369D1;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 18 Apr 2025 21:28:52 +0200
Subject: [PATCH 2/4] powerpc: 83xx: Rename wdt@ nodes to watchdog@
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
Message-Id: <20250418-watchdog-v1-2-987ff2046272@posteo.net>
References: <20250418-watchdog-v1-0-987ff2046272@posteo.net>
In-Reply-To: <20250418-watchdog-v1-0-987ff2046272@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745004545; l=6414;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=Yw+PaYsdSJcOkNk7dfmQFHMcmT5+YjBUrfIw+nshi9Y=;
 b=NxbUQG3EdBM7Z3W+Ww69xe2/rI7AysK8WNTRo6T8XV/4FfzOJ0S5Mm5IMFGrfdxV82CUgpCvn
 7umJsOM9UAZDDOfxreMe8mU26tAsEU0+EYt6yeVYRMlZ9Y1N/a8TnzJ
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

The watchdog.yaml schema prescribes a node name of "timer" or "watchdog"
rather than the abbreviation "wdt".

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/asp834x-redboot.dts | 2 +-
 arch/powerpc/boot/dts/mpc8313erdb.dts     | 2 +-
 arch/powerpc/boot/dts/mpc8315erdb.dts     | 2 +-
 arch/powerpc/boot/dts/mpc832x_rdb.dts     | 2 +-
 arch/powerpc/boot/dts/mpc8349emitx.dts    | 2 +-
 arch/powerpc/boot/dts/mpc8349emitxgp.dts  | 2 +-
 arch/powerpc/boot/dts/mpc836x_rdk.dts     | 2 +-
 arch/powerpc/boot/dts/mpc8377_rdb.dts     | 2 +-
 arch/powerpc/boot/dts/mpc8377_wlan.dts    | 2 +-
 arch/powerpc/boot/dts/mpc8378_rdb.dts     | 2 +-
 arch/powerpc/boot/dts/mpc8379_rdb.dts     | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/boot/dts/asp834x-redboot.dts b/arch/powerpc/boot/dts/asp834x-redboot.dts
index 52a84561c4f076ac0c4fc7af3db12f2fda06521c..33ddb17d18760df24ac8f068dce38ac60c353f32 100644
--- a/arch/powerpc/boot/dts/asp834x-redboot.dts
+++ b/arch/powerpc/boot/dts/asp834x-redboot.dts
@@ -72,7 +72,7 @@ soc8349@ff000000 {
 		reg = <0xff000000 0x00000200>;
 		bus-frequency = <0>;
 
-		wdt@200 {
+		watchdog@200 {
 			device_type = "watchdog";
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;
diff --git a/arch/powerpc/boot/dts/mpc8313erdb.dts b/arch/powerpc/boot/dts/mpc8313erdb.dts
index a8315795b2c951c5914953be0b4a5162dd471505..09508b4c8c73095bf4699e383e7841100d6d7c8f 100644
--- a/arch/powerpc/boot/dts/mpc8313erdb.dts
+++ b/arch/powerpc/boot/dts/mpc8313erdb.dts
@@ -99,7 +99,7 @@ soc8313@e0000000 {
 		reg = <0xe0000000 0x00000200>;
 		bus-frequency = <0>;
 
-		wdt@200 {
+		watchdog@200 {
 			device_type = "watchdog";
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;
diff --git a/arch/powerpc/boot/dts/mpc8315erdb.dts b/arch/powerpc/boot/dts/mpc8315erdb.dts
index e09b37d7489d01bfd16a26e9786868f630fa0262..56cf6d12c730de52d85623dc34c5987bee635f0f 100644
--- a/arch/powerpc/boot/dts/mpc8315erdb.dts
+++ b/arch/powerpc/boot/dts/mpc8315erdb.dts
@@ -99,7 +99,7 @@ immr@e0000000 {
 		reg = <0xe0000000 0x00000200>;
 		bus-frequency = <0>;
 
-		wdt@200 {
+		watchdog@200 {
 			device_type = "watchdog";
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;
diff --git a/arch/powerpc/boot/dts/mpc832x_rdb.dts b/arch/powerpc/boot/dts/mpc832x_rdb.dts
index ecebc27a289871a896121fbaf6bc878422d25101..ba7caaf98fd58f9a2b56c0aa566673c70eff2013 100644
--- a/arch/powerpc/boot/dts/mpc832x_rdb.dts
+++ b/arch/powerpc/boot/dts/mpc832x_rdb.dts
@@ -52,7 +52,7 @@ soc8323@e0000000 {
 		reg = <0xe0000000 0x00000200>;
 		bus-frequency = <0>;
 
-		wdt@200 {
+		watchdog@200 {
 			device_type = "watchdog";
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;
diff --git a/arch/powerpc/boot/dts/mpc8349emitx.dts b/arch/powerpc/boot/dts/mpc8349emitx.dts
index d4ebbb93de0b325a3bb0f5d17464f516a0e12133..13f17232ba83d50498f19e6758063cf905fbc326 100644
--- a/arch/powerpc/boot/dts/mpc8349emitx.dts
+++ b/arch/powerpc/boot/dts/mpc8349emitx.dts
@@ -53,7 +53,7 @@ soc8349@e0000000 {
 		reg = <0xe0000000 0x00000200>;
 		bus-frequency = <0>;                    // from bootloader
 
-		wdt@200 {
+		watchdog@200 {
 			device_type = "watchdog";
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;
diff --git a/arch/powerpc/boot/dts/mpc8349emitxgp.dts b/arch/powerpc/boot/dts/mpc8349emitxgp.dts
index bcf68a0a7b557e49b48563f586b1fe8441ab3c6d..eae0afd5abbc39852b8e34b2247223168ab863ca 100644
--- a/arch/powerpc/boot/dts/mpc8349emitxgp.dts
+++ b/arch/powerpc/boot/dts/mpc8349emitxgp.dts
@@ -51,7 +51,7 @@ soc8349@e0000000 {
 		reg = <0xe0000000 0x00000200>;
 		bus-frequency = <0>;                    // from bootloader
 
-		wdt@200 {
+		watchdog@200 {
 			device_type = "watchdog";
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;
diff --git a/arch/powerpc/boot/dts/mpc836x_rdk.dts b/arch/powerpc/boot/dts/mpc836x_rdk.dts
index a0cc1953484d70410f9592bdb84ffaf779ee08b4..4ff38e1a2185f85618b603e703e54c973cb97cc0 100644
--- a/arch/powerpc/boot/dts/mpc836x_rdk.dts
+++ b/arch/powerpc/boot/dts/mpc836x_rdk.dts
@@ -62,7 +62,7 @@ soc@e0000000 {
 		/* filled by u-boot */
 		bus-frequency = <0>;
 
-		wdt@200 {
+		watchdog@200 {
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;
 		};
diff --git a/arch/powerpc/boot/dts/mpc8377_rdb.dts b/arch/powerpc/boot/dts/mpc8377_rdb.dts
index 7df452efa9579a649195d2266d42bbc4b6b8de1c..f137ccb8cfdedfed98a3cf6899f5508f069834dc 100644
--- a/arch/powerpc/boot/dts/mpc8377_rdb.dts
+++ b/arch/powerpc/boot/dts/mpc8377_rdb.dts
@@ -99,7 +99,7 @@ immr@e0000000 {
 		reg = <0xe0000000 0x00000200>;
 		bus-frequency = <0>;
 
-		wdt@200 {
+		watchdog@200 {
 			device_type = "watchdog";
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;
diff --git a/arch/powerpc/boot/dts/mpc8377_wlan.dts b/arch/powerpc/boot/dts/mpc8377_wlan.dts
index d8e7d40aeae449e33ea1640a53ee4dfec7d746a4..ce254dd74dd06b19bc8e15e13f2fa9e959dd25f2 100644
--- a/arch/powerpc/boot/dts/mpc8377_wlan.dts
+++ b/arch/powerpc/boot/dts/mpc8377_wlan.dts
@@ -89,7 +89,7 @@ immr@e0000000 {
 		reg = <0xe0000000 0x00000200>;
 		bus-frequency = <0>;
 
-		wdt@200 {
+		watchdog@200 {
 			device_type = "watchdog";
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;
diff --git a/arch/powerpc/boot/dts/mpc8378_rdb.dts b/arch/powerpc/boot/dts/mpc8378_rdb.dts
index bdcfe83a561e121ed82972406e0302d84d8d0ef6..19e5473d4161b5d6be6ab84ae0ba78875fc377f8 100644
--- a/arch/powerpc/boot/dts/mpc8378_rdb.dts
+++ b/arch/powerpc/boot/dts/mpc8378_rdb.dts
@@ -99,7 +99,7 @@ immr@e0000000 {
 		reg = <0xe0000000 0x00000200>;
 		bus-frequency = <0>;
 
-		wdt@200 {
+		watchdog@200 {
 			device_type = "watchdog";
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;
diff --git a/arch/powerpc/boot/dts/mpc8379_rdb.dts b/arch/powerpc/boot/dts/mpc8379_rdb.dts
index a5f702304a353c61d6ab804765b817ec34a9582e..61519acca2280427d7237d8d9bbb8485f0c65369 100644
--- a/arch/powerpc/boot/dts/mpc8379_rdb.dts
+++ b/arch/powerpc/boot/dts/mpc8379_rdb.dts
@@ -97,7 +97,7 @@ immr@e0000000 {
 		reg = <0xe0000000 0x00000200>;
 		bus-frequency = <0>;
 
-		wdt@200 {
+		watchdog@200 {
 			device_type = "watchdog";
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;

-- 
2.48.0.rc1.219.gb6b6757d772



