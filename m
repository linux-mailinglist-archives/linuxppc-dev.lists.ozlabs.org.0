Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB3459F510
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 10:22:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCJx42Dstz3c6s
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 18:22:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=II44+XWH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mail.zeus03.de (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=II44+XWH;
	dkim-atps=neutral
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCJwP2HxDz305P
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 18:21:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=k1; bh=RRGjWF8vo1xlwr
	bsZKBJ3tvhXOYAQLg0h4JU7SAZUfs=; b=II44+XWHJEQlN51s9LtP1BH060tBWb
	KMTtI1Xccvm6+hGkZbBRAqwlKnDJMxQRq3YlVXPFSkkU9KqQW0M/J8JHoCzlN+V4
	BTFBVQGwXszwlQPdzlRdDskGTA0/WkpWdUa+fAWA+ndQHK0z69Bi6dEXDOC2GDUw
	bu/VGA5+QhxO0=
Received: (qmail 2131871 invoked from network); 24 Aug 2022 10:21:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Aug 2022 10:21:34 +0200
X-UD-Smtp-Session: l3s3148p1@MmVgXvjm7OcgAwDPXxw3AFlguiwjsjwa
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-spi@vger.kernel.org
Subject: [PATCH 2/2] powerpc/82xx: remove spidev node from mgcoge
Date: Wed, 24 Aug 2022 10:21:29 +0200
Message-Id: <20220824082130.21934-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220824082130.21934-1-wsa+renesas@sang-engineering.com>
References: <20220824082130.21934-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh+dt@kernel.org>, Holger Brunck <holger.brunck@keymile.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Schocher <hs@denx.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 956b200a846e ("spi: spidev: Warn loudly if instantiated from DT
as "spidev"") states that there should not be spidev nodes in DTs.
Remove this non-HW description. There won't be a regression because it
won't bind since 2015 anyhow.

Fixes: 5d1d67e361ea ("powerpc/82xx: add SPI support for mgcoge")
Cc: Heiko Schocher <hs@denx.de>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Please take it via your platform tree.

 arch/powerpc/boot/dts/mgcoge.dts | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/powerpc/boot/dts/mgcoge.dts b/arch/powerpc/boot/dts/mgcoge.dts
index 7de068991bde..9cefed207234 100644
--- a/arch/powerpc/boot/dts/mgcoge.dts
+++ b/arch/powerpc/boot/dts/mgcoge.dts
@@ -225,13 +225,6 @@ spi@11aa0 {
 				interrupts = <2 8>;
 				interrupt-parent = <&PIC>;
 				cs-gpios = < &cpm2_pio_d 19 0>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				ds3106@1 {
-					compatible = "gen,spidev";
-					reg = <0>;
-					spi-max-frequency = <8000000>;
-				};
 			};
 
 		};
-- 
2.35.1

