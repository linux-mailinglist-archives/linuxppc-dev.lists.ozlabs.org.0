Return-Path: <linuxppc-dev+bounces-7805-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F41A93E41
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 21:29:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfPvt2qkRz3c9k;
	Sat, 19 Apr 2025 05:29:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745004554;
	cv=none; b=F6vFlN7aQaieqsGN/4675vFJGjsu8+vsgnvZEIpB41wHN+HzbuSHhBtrdCRPeGynEy/H3p9z343NnFfCKLMdlBa0meGXeuL7ThIdYmIrjgH3OpXARipD/Dryj4Vigteg3GAsHvFNiL8PXjzxy3wdVtghyIIGa+BkO+6vmPVVZZo7nEufDYveg93KIq/nF3QnuS2mHTTiMfSCFUV4/YLONtCE/ejApmGb0x8Wf3vr6YjCxakyW7YQ/7A2Ss1qPf9S+VbQVw3aU/GjRsi/X/U+zyUKyuQececDkhN1PKm/s6S7hvy3nYJ5H98tQJc7ywbY6QOCwJPgEXzqlX/NIFvpuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745004554; c=relaxed/relaxed;
	bh=IF++4P7+EcwDCt83Y6TmVzEMbooNQihhFljrnfvwYpQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AtJ0iloOLbousRTho0V5MR5fpVu9xL3W5BcSy8WJIwXYT+9EUz9xACHNmEmtEu73y+N6B7S/GrGVCEMCrz0usSy4pHtihVioyKBOt7nnRxmZlLLrnkSf+vMf9xKVofitNqXM07epBL2+IyFK8ALtxsIvCD8wOhgCFYyi4PfRF7iVf+Z2af35OogO9YD8IR7hMk8kNzD/paYFEvpfY2Gzgzwnu6gv3iRRAXclHo96Y6Uh4vCy0/ZWOQP67D24WxDDgPBIWfB3zPpZajnEq57aqztVF7EF1MVOxrxuxcu5ITLyFiOb87smzMjmvJOGObX7ZU8vOIesnuyYJdocH+9odQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B/WICEO5; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B/WICEO5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfPvq3h3hz3c6b
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Apr 2025 05:29:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5DF5A61146;
	Fri, 18 Apr 2025 19:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A479DC4CEF0;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745004548;
	bh=RP1N5bHXz63rpt8m5IOjX9qLsKGVIyvS42DszAO2ijA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=B/WICEO57KnQkp0UzRW9IVGB8V74zRVW4YF/d46Dr9UmssNl9zSVf94ehpX7fQG1s
	 PQDXEWO2udvvpXG639JbHPjkMSdeCGg4mjw2+ublGbZQLzqV0C8dr7EMLAFJRheY2Q
	 RBk4s81d10u6ojBAjRlV8bhSHivWTYmA1TZ4Ysm4YK0w4YHV7n1V8oTIp3cTu9ZGta
	 +v2qDlMj9c4AAHqKqwo/StvaM6OARw1NNDoBBQVnJyq3alQjwVX6buGQtuGHWTJeCW
	 vHv04gvjgtKOrCK28k+f3ta9/RGzsm/052YJTm0QmKexawMltG5S0xu7//LTtg4rHc
	 NJljhoyRpP5Ag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F373C369C9;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 18 Apr 2025 21:28:53 +0200
Subject: [PATCH 3/4] powerpc: 86xx: Rename wdt@ nodes to watchdog@
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
Message-Id: <20250418-watchdog-v1-3-987ff2046272@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745004545; l=2682;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=rZMd++6lrdOvQcrT6pf6xOYPM6SAtU5WeGJhAq64EIk=;
 b=tf93aCaOdy1EsZyU9FYVRQHK9ZP9v8Ml4xUXSUXJ5nNXpjBRmV+1T7Wmr5lcS0c2kGNGLJL9f
 sEDGXlRy+WHAh+988Co+paUGx0tza3RDe8ZISXSuTmWBhgH7dOd7pUa
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
 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts  | 4 ++--
 arch/powerpc/boot/dts/fsl/gef_sbc310.dts | 4 ++--
 arch/powerpc/boot/dts/fsl/gef_sbc610.dts | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/gef_ppc9a.dts b/arch/powerpc/boot/dts/fsl/gef_ppc9a.dts
index fc92bb032c517a543d6e1e498ab903f1937414f8..48a81430a8a31fc29b53fba03986b2fb984b66c1 100644
--- a/arch/powerpc/boot/dts/fsl/gef_ppc9a.dts
+++ b/arch/powerpc/boot/dts/fsl/gef_ppc9a.dts
@@ -82,7 +82,7 @@ fpga@4,0 {
 			reg = <0x4 0x0 0x40>;
 		};
 
-		wdt@4,2000 {
+		watchdog@4,2000 {
 			compatible = "gef,ppc9a-fpga-wdt", "gef,fpga-wdt-1.00",
 				"gef,fpga-wdt";
 			reg = <0x4 0x2000 0x8>;
@@ -90,7 +90,7 @@ wdt@4,2000 {
 			interrupt-parent = <&gef_pic>;
 		};
 		/* Second watchdog available, driver currently supports one.
-		wdt@4,2010 {
+		watchdog@4,2010 {
 			compatible = "gef,ppc9a-fpga-wdt", "gef,fpga-wdt-1.00",
 				"gef,fpga-wdt";
 			reg = <0x4 0x2010 0x8>;
diff --git a/arch/powerpc/boot/dts/fsl/gef_sbc310.dts b/arch/powerpc/boot/dts/fsl/gef_sbc310.dts
index 47ae85c34635bb0165004e52d15df92542406b15..8eb254b1738dde7327d5e3fc07b4bbba137b4d9c 100644
--- a/arch/powerpc/boot/dts/fsl/gef_sbc310.dts
+++ b/arch/powerpc/boot/dts/fsl/gef_sbc310.dts
@@ -79,7 +79,7 @@ fpga@4,0 {
 			reg = <0x4 0x0 0x40>;
 		};
 
-		wdt@4,2000 {
+		watchdog@4,2000 {
 			compatible = "gef,sbc310-fpga-wdt", "gef,fpga-wdt-1.00",
 				"gef,fpga-wdt";
 			reg = <0x4 0x2000 0x8>;
@@ -87,7 +87,7 @@ wdt@4,2000 {
 			interrupt-parent = <&gef_pic>;
 		};
 /*
-		wdt@4,2010 {
+		watchdog@4,2010 {
 			compatible = "gef,sbc310-fpga-wdt", "gef,fpga-wdt-1.00",
 				"gef,fpga-wdt";
 			reg = <0x4 0x2010 0x8>;
diff --git a/arch/powerpc/boot/dts/fsl/gef_sbc610.dts b/arch/powerpc/boot/dts/fsl/gef_sbc610.dts
index 5322be44b62e78bebac0fa92c0de05094b186dde..02edbb262b8f00279dea024700eebf874501f6d5 100644
--- a/arch/powerpc/boot/dts/fsl/gef_sbc610.dts
+++ b/arch/powerpc/boot/dts/fsl/gef_sbc610.dts
@@ -82,14 +82,14 @@ fpga@4,0 {
 			reg = <0x4 0x0 0x40>;
 		};
 
-		wdt@4,2000 {
+		watchdog@4,2000 {
 			compatible = "gef,fpga-wdt";
 			reg = <0x4 0x2000 0x8>;
 			interrupts = <0x1a 0x4>;
 			interrupt-parent = <&gef_pic>;
 		};
 		/* Second watchdog available, driver currently supports one.
-		wdt@4,2010 {
+		watchdog@4,2010 {
 			compatible = "gef,fpga-wdt";
 			reg = <0x4 0x2010 0x8>;
 			interrupts = <0x1b 0x4>;

-- 
2.48.0.rc1.219.gb6b6757d772



