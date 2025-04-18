Return-Path: <linuxppc-dev+bounces-7806-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA885A93E42
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 21:29:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfPvv3GQ5z3c6b;
	Sat, 19 Apr 2025 05:29:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745004555;
	cv=none; b=BL4WWJh53DlT23k3xXyVLORseHwW+9pgFPVSkHk06R0Ll8bZCGSHOMsAQ1TaHv01Rpk8bomOaK6HWycu/8cclmBpUZQbsiLa4dsdJUMt4D+yaSnqHkpLIpQ7iF3VY5HtODnxFORZs0J4QMPjMWXRyH78phg7GNbQwx2hK4ECz+B2hP5okFTHgGplQgfRyU4iJMXoekNSUCrPp6l9f0jY3Bs6v13E5XTjJstRSiGtexKEUYvYtOZzuGmvIBrtjnqj0oV/wWIs91ONVyxQ7MpRxxfZ4KjergW/aUSiUzJ1qR7G9G/FgiLt18c9ko2vPLuYaLq/6wvQ45uWzqgauzqpzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745004555; c=relaxed/relaxed;
	bh=YwyyrYZUHhmeOak2mhz+HzsezYdaHD6cOIsl+DB98e8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ICYinWL3yLDW+zAe2f6ghxjP3blo3H+fFSmi051ezfUl0XVaNI0iHan4Qt7wB3Lr8Bx1z2xJENEluvvJVo8ijUmyKbaVWKfHdYRjcIlq7/O9Q7eupnzuSOBdbz1BHRP1OzDs1Y900VWX4bw4RBD+tdRqsrYceNweL65tUOBF6PSuMwH2L3Xyc6NTyn9nCtX/c4vKXQ7sqEsSHRzutFLt2gXYrNoYaIXHXhK6b/D6QH93ERgFJfmg9CmudADETK2+Z6eEuexWsfGJ92RPtvptR7V2//a4/+4jlkAV29tRX7s8lYEXNdy+Ltc1b2LZyhg1OWV6yDabmpqW8treOfQB+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bRYiExZB; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bRYiExZB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfPvs2qg8z3c86
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Apr 2025 05:29:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E0CB3A4B5D8;
	Fri, 18 Apr 2025 19:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8DE5C4CEF2;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745004548;
	bh=NxkEtHQBRfnIH+DR0hayVIGJz1fpFnQO9qKD9GadGHo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bRYiExZBcRgk1iPuc+CbxLFS6NLTB3yQbafBzomlutwujMfFAutBTmjT22jaTqhXK
	 YQG6ziU7bX5qFpt6el/CnHTKqT33bcAuHbw5yZK2YF+bYOQ+OzTnJxsbzbkVcGScDP
	 ROEVz5WI4/jv86BbUgBhj3GP5IF/uoFLHYxeOx5brPyFk3DmKCtI8c39N30n8rLMLo
	 Hkfvy/uqKLD7A+LPLRoGujMh2AZ3k3CdmUyCLiGy49fZwuLm+7LMEtKhpTN8HriXls
	 MEDuoiwflVR/r7QX3C2ZbSu61Oxxz6NJ3Q+ngNu2e+feV0Hmc1hUmMn9HLYjHls6se
	 EiK62bS790HcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA12C369D2;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 18 Apr 2025 21:28:54 +0200
Subject: [PATCH 4/4] powerpc: p2020: Rename wdt@ nodes to watchdog@
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
Message-Id: <20250418-watchdog-v1-4-987ff2046272@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745004545; l=1065;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=Jfd85PbJEHShQtp0Z7D0ENH84wB5WrTefZVsj2LtPg4=;
 b=9Ddx++hJwjUu5ZT5RcAMKL458F4jL4oZdbNqUIm8fWLxvPqyPovL1NfQreYYdr5rYTNz/J468
 Kbeijo/OUapDOomDiJYvXXiMNPWkdWwcCjdtQrbm/WLjITPmZiWBFgf
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

The watchdog.yaml schema prescribes a node name of "timer" or "watchdog"
rather than the abbreviation "wdt".

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/fsl/ge_imp3a.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/ge_imp3a.dts b/arch/powerpc/boot/dts/fsl/ge_imp3a.dts
index da3de8e2b7d2c55cf735f3cfdef8729655979a06..9e5c01cfac2f8ad93dfa3b33d05b3ad3331b2c76 100644
--- a/arch/powerpc/boot/dts/fsl/ge_imp3a.dts
+++ b/arch/powerpc/boot/dts/fsl/ge_imp3a.dts
@@ -94,7 +94,7 @@ gef_gpio: gpio@4,400 {
 			gpio-controller;
 		};
 
-		wdt@4,800 {
+		watchdog@4,800 {
 			compatible = "ge,imp3a-fpga-wdt", "gef,fpga-wdt-1.00",
 				"gef,fpga-wdt";
 			reg = <0x4 0x800 0x8>;
@@ -103,7 +103,7 @@ wdt@4,800 {
 		};
 
 		/* Second watchdog available, driver currently supports one.
-		wdt@4,808 {
+		watchdog@4,808 {
 			compatible = "gef,imp3a-fpga-wdt", "gef,fpga-wdt-1.00",
 				"gef,fpga-wdt";
 			reg = <0x4 0x808 0x8>;

-- 
2.48.0.rc1.219.gb6b6757d772



