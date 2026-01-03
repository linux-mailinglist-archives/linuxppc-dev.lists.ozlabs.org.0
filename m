Return-Path: <linuxppc-dev+bounces-15187-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E80DCF0459
	for <lists+linuxppc-dev@lfdr.de>; Sat, 03 Jan 2026 19:57:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dk8vY2SQxz2yLg;
	Sun, 04 Jan 2026 05:57:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767466665;
	cv=none; b=H9bml7nfvIvYt3UFVvieD2NmmQA/DKfQ8WvP0YifDKxhxavvVZyQoMzLJn68Q6j5SoOpIRZlhipslxb+nMQMoIftLjgwf7BzfBirVH67icTul1RXl9H6vfAfgZGi1/qyBzCI+jykETc5G/u/NNTepqGgueyfIJoFKmXppJMIVNhnCMPWbMQzRvDC5ZG09fqRf3hzUHB/rfnb15sbyWGHqI3XbNAhd3oQT6oQUqOmj1HYbwiq8gB6g3dZcfLG7/p6JHwEFz/y1uAZ2Ulipodlezn29dIitcFH6u/PiiCOAq92HgybNDOvjJVUEivk2YzhRJh/mBcXoJb8viUg+6S6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767466665; c=relaxed/relaxed;
	bh=HswkjtKly7wEVHnjeezB2BZ8aVwltyhyWIeuHzRO+wE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aI/xhI3UJuaDoY01xlRqmB79lOjXfibKpGEUvzcJ8rSVpvtUmxVHiVSXPKtMh6Js39p3DGMArPqpFcGh/sW/lyKE5NOUWTGajU31pbcJhv14ETDih1EQaANBTECl0DTVaZFQZ2HAkDiij7pI6gM/r3rjReruZG7ZgMnAflMaEu5TrwTc8o0a+atN4Zl0EcythTShlEiUrRDO/KOqjJzWs6e19cSHMKOj0vzVxuIG4cYACRnFJiS7YUT/pD5LQw9YW2foEy97LWRiJCgToAqqBmXAKf5lhxv5h55WlTlkCypj8Zad0k0rhjUHcd8pA030u3UVekhOl7hcArtxTS4pVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sWymTSqz; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sWymTSqz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dk8vX4ShJz2yK7
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Jan 2026 05:57:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B0F7444314;
	Sat,  3 Jan 2026 18:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C4D2C19422;
	Sat,  3 Jan 2026 18:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767466662;
	bh=qYFS2rlOpk9olbd80sCn3U0gRL4PIsZ3YtXzt7AFweM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sWymTSqzYR0XoAWnKIRD95d3g8WIrOVNbTzl1jFGy45L3DRZsxCGD24Hb3IDw3BK8
	 CagA+prO2yhhOES9nUhieMsPp6+q26yVMfuuDp4a3mCWIWrVrWYioBQNIXFC1uLX8N
	 Y1dDqo7xmDw1nPOnNPMWKwEKVEdoHGPCXbZvqVkHHWnfa+4uvQOTq73vntqnJ9ldc6
	 uuFH+ya+QmQyAICmQpoCseopTNFSBH97xLxQNY7AQWDNcpZWYntsw2rvprZlTsNz8W
	 TXM/uDZEM4NQWWFLSugFvPIwPXVTJOk+dZWDZfbM9O+DRKX8nhdk0ndAEy341oin77
	 B9sP0InWBLvvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F627FC618A;
	Sat,  3 Jan 2026 18:57:42 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sat, 03 Jan 2026 19:54:07 +0100
Subject: [PATCH v2 3/5] powerpc: dts: mpc8315erdb: Rename LED nodes to
 comply with schema
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
Message-Id: <20260103-mpc83xx-cleanup-v2-3-b2a13c0a0d63@posteo.net>
References: <20260103-mpc83xx-cleanup-v2-0-b2a13c0a0d63@posteo.net>
In-Reply-To: <20260103-mpc83xx-cleanup-v2-0-b2a13c0a0d63@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767466660; l=775;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=+puBlr+iszGhT8EEZ37X0Zo4jHGzrX+grKkdaghOCjU=;
 b=G9mH27yMmR07rQUU5RgrqmcRweVRcGx6DotKo8WMyvnjXbH3hS3dK6vUC8XalsxiRd81+LkmG
 VnPYnRFFon9CHP4MJ3DTJLhAtGE+HqqoLzAmTC0jWyxrnssYYRLX03G
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

The leds-gpio.yaml schema requires that GPIO LED nodes contain "led",
and preferably start with "led-"

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/mpc8315erdb.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/dts/mpc8315erdb.dts b/arch/powerpc/boot/dts/mpc8315erdb.dts
index 1957b6687b2987..f4938a7292b9c8 100644
--- a/arch/powerpc/boot/dts/mpc8315erdb.dts
+++ b/arch/powerpc/boot/dts/mpc8315erdb.dts
@@ -478,12 +478,12 @@ pcie@0 {
 	leds {
 		compatible = "gpio-leds";
 
-		pwr {
+		led-pwr {
 			gpios = <&mcu_pio 0 0>;
 			default-state = "on";
 		};
 
-		hdd {
+		led-hdd {
 			gpios = <&mcu_pio 1 0>;
 			linux,default-trigger = "disk-activity";
 		};

-- 
2.51.0



