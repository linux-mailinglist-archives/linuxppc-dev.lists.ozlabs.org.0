Return-Path: <linuxppc-dev+bounces-7803-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D7FA93E3A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 21:29:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfPvr6Mwqz3c7S;
	Sat, 19 Apr 2025 05:29:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745004552;
	cv=none; b=FTOprnAmHowJEfcWZkkkZuWSh0ts5+tJ2PcdR9LBsWOfE3s/wT+0D6Q9NGi8KY8nJYpnEvfOi2GYO5aWyV/4MfC0jYW6zCOuCYbiGwwkIh3e2ZQ4ATX2gKCYKeh09k6fj9731F82aYl7nMlXWn/qW/7cIrfUvUQcY2mXKIOdHopQpF5AspKHqyJf2xHQKAmlB0hDHQXvHUUm+CRUMMt6DSnHcWQdkpj9rp7TuaLZCFHJhlWH0m3/JeCV/+xfNulGD7U1S7S6+bQG0Vi7u5q3sT5v9b9IdYdMOlfM7EGnBXFtaK5HKobP7iNH8DHxI9D8pGReUnXcgHJo0fB/lS5l9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745004552; c=relaxed/relaxed;
	bh=qp1vDaYBoeQfmRGt3E/GsNbzIoqeu5NRCkLaSXDMq+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WCIRqZZV+1T4c1cn4gBRFt1ziguKhbw6PyCyV7RvIREy+WM+dfHCxyRurGYSOpVCXdUESbJFH5ipnCgTUllg5ffg7y8Q0+Lx/MfcjYkd4ncAHoJTxaw1dLckMoYowl6AM2IkNeyWdpGhfJ1sY8774ZcWnd+xWKYJBl0j9yFSRbIDHvRHa6PkCHF4bKGr3f7LoUpTcMZPO83n53zdLjXVDlxt49LMe/RZl2Hv5StUQTmUEG8X2V9RxUAD71aefp9jfUlv8bGymq3mRhdKOiAOV5YbTu3dv5FOvM0rMiRjSO1Uc4hg4uzLH5smH5PpWkFGFiDwfh8nIFfRVrIC4ITfRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gWm9ajRa; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gWm9ajRa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfPvq3VKZz3c5W
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Apr 2025 05:29:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 338C061138;
	Fri, 18 Apr 2025 19:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 805FAC4CEE7;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745004548;
	bh=6ClBny2hXCsMRYQ7f0lE5ORtGy+uyLBVWO/aVFXxQMw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gWm9ajRaJykk1VNCrNho4UpuXChjkTGkcuQy6Ryv9CvV2S/wJQra+KUeRtFbSGjOR
	 TyoLXZ0zcYGQ3YMPUhRh6MoyAQxEG0UFfdZ4Umgt+Oe29YJS1poQjvfjQnAOqyLlHt
	 TBvRIYHxgEqFSPMGKro1NbKN18Qa7RrRhU7R3FEMt0iBBYD4UngRauRAa3YPeIakKQ
	 h2RwcEizCWCs861PQNdX99rXCGtTcPwf+J4D3f/IsvkCxOTAuGq63iRnTi2aZ2uiqW
	 77tjGaTvIsO/0+2O3FewNQSGSC+gUbAfNrxquUYgIKYoYUKJhJ1Szm133HahVY6IEk
	 tq32UjlVRWZVQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731E2C369CB;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 18 Apr 2025 21:28:51 +0200
Subject: [PATCH 1/4] powerpc: 512x: Rename wdt@ node to watchdog@
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
Message-Id: <20250418-watchdog-v1-1-987ff2046272@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745004545; l=756;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=i9RRcgFgqG7vVmSK4gfLWPx1rqQqfqMd2ZucazKYG/I=;
 b=F1LooNULEUf7uRf+8ft+DzMgEvMttxjoQo/CjBcTZ897BrcwUTqMni/4/CpJl3ZpI1bNTsy+q
 eJkxXaXipmyBNkxJvVIDt8R1Mk0lODMfG2doascTzJ2emZYvqHgQyMz
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
 arch/powerpc/boot/dts/mpc5121.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/mpc5121.dtsi b/arch/powerpc/boot/dts/mpc5121.dtsi
index d3fc8062fbcd7b959a7edf17c8e9a28086034d69..a278fb7b9e71182582f658b30c2ea4e962edd7b7 100644
--- a/arch/powerpc/boot/dts/mpc5121.dtsi
+++ b/arch/powerpc/boot/dts/mpc5121.dtsi
@@ -112,7 +112,7 @@ ipic: interrupt-controller@c00 {
 		};
 
 		/* Watchdog timer */
-		wdt@900 {
+		watchdog@900 {
 			compatible = "fsl,mpc5121-wdt";
 			reg = <0x900 0x100>;
 		};

-- 
2.48.0.rc1.219.gb6b6757d772



