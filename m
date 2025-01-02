Return-Path: <linuxppc-dev+bounces-4573-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FA39FFE49
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 19:32:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPFgJ5zMtz304f;
	Fri,  3 Jan 2025 05:32:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735842748;
	cv=none; b=OAVD3LTEnWI+/nD2drpSabRy105oLNNfOc96YSx7+91JpZhZ1l3wp5wdU/J2le0/Pv3KIHzQWaWidr09Sfz1OaSgMqsflaPSKdQdA7Q/IZn0vxNAaLZApjt52AlfYLnWaunAOJQJI8w4uNA+R6++oJihHBfRzokbJsQauW05E6PcWJPvfwBtt839vOYgfpZQF5WbLU6oXY57SDLjKtM2TY4SsAFX2QT4jRxYZ6zUxCrCpu9u668ow1C0gemrngxkuKe8QOer+LIfnGYV8mwFG6+jcqWtekqdrU4dxk79NbWQ1fMq2R4r/jOPQAJs0xo5OmhzmI7PFOu5hCtQ7/Vz0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735842748; c=relaxed/relaxed;
	bh=TJqqZKfP2pmz+AjTwn3D4i31AhcPaw0GpnsQYlcn6jI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UyZcFId8I1QbfUldL/s+eCWZ0F5wG7oSfbmj+qsQ1QQpLke0oCzgd8x05K3K1mUt013Iv9bAYZqqmnFCj2eoKxVIKXXsayt1NCVvZgQlchHfpmEWsEUn9EX+c1MDUN9UADcBlbc7UDh5nktVcOFqHRoaixiCKUy4xVxgSP14xFi0MObaDL5mt7ZWtovFMt6yfN1cE4Ukxdy4jIw21LsDiEoLIMbC14+eA2VvjMUEdYlZm+BgiuIogsrg6Gvrw29PMmHJOmbgnzPoodLcvnBkErC+Gtha5MRQZm8+gDV+xI5xermhqhKhIQTiYWksXVYtiRwqzbtXA1G8OUQGwSL8PA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fwn6LLgK; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fwn6LLgK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPFgF0sj8z2ypD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 05:32:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 73C6AA413F7;
	Thu,  2 Jan 2025 18:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D08AFC4CEE2;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842741;
	bh=uKfNfVP6XmqzHjSsBcS7L5uKeA8oa6n0HRjVDMnFaZc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fwn6LLgKg01/hqH7sPS4jtXvtaMUCs8dvliKSR3MQ4fPYQAUrx0AFcX/vglEjBvQb
	 /wMyPIMsBSIbwTZk4P6O3WF8upbNqRrIJN25awp0SkhZNUmiUWRGpOW0ZeSOeitWaF
	 DEBo08YtczPPrFrK+r5Gn24r45zgUCKo3z0Q48zJW+ko5jYBOQMDTWQXLO2Fpn9Z4H
	 6PPGx0z+8VYGgOmerceAbhLtykRsAf3AaCV3e1T7rn0J7s5125yGlQ1Bb16iy429fe
	 dLwYuYTc4WZki3mnnFnaufk+rYjQyM5kJIocU80TwrkmLKiZEynmdGGFRIfzfPEUGu
	 FsJWWs0qZrBng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C774AE77194;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:45 +0100
Subject: [PATCH 04/19] powerpc: dts: mpc8315e: Add labels to peripherals
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
Message-Id: <20250102-mpc83xx-v1-4-86f78ba2a7af@posteo.net>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=2746;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=JWG24yKk9tKJztiNlXB5Hna42dBR5XCLmCda3s4BqBY=;
 b=Fqpu6KOl1IDStHphfeNxyTVjxQMUqH96DufHMXOAJgSY48bPEprSxuxfwuayggOiI9f8hAsrn
 QtlDpQcen04AYKtIDo3uRqnWQR11t8Z30E826BlCY42QKv++IhxX/ns
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

Labels can be used in board-specific devicetrees to refer to nodes more
conveniently.

mpc8315erdb.dtb remains identical after this patch.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/mpc8315e.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/boot/dts/mpc8315e.dtsi b/arch/powerpc/boot/dts/mpc8315e.dtsi
index 8741482905f0f30bf893a08b2602fdc6e74c23ff..2531e702648f1bf922a7112c9ddaeac1c3113572 100644
--- a/arch/powerpc/boot/dts/mpc8315e.dtsi
+++ b/arch/powerpc/boot/dts/mpc8315e.dtsi
@@ -44,7 +44,7 @@ memory {
 		reg = <0 0>;
 	};
 
-	localbus@e0005000 {
+	localbus: localbus@e0005000 {
 		#address-cells = <2>;
 		#size-cells = <1>;
 		compatible = "fsl,mpc8315-elbc", "fsl,elbc", "simple-bus";
@@ -62,13 +62,13 @@ immr@e0000000 {
 		reg = <0xe0000000 0x00000200>;
 		bus-frequency = <0>;
 
-		wdt@200 {
+		wdt: wdt@200 {
 			device_type = "watchdog";
 			compatible = "mpc83xx_wdt";
 			reg = <0x200 0x100>;
 		};
 
-		i2c@3000 {
+		i2c: i2c@3000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			cell-index = <0>;
@@ -79,7 +79,7 @@ i2c@3000 {
 			dfsrr;
 		};
 
-		spi@7000 {
+		spi: spi@7000 {
 			cell-index = <0>;
 			compatible = "fsl,spi";
 			reg = <0x7000 0x1000>;
@@ -127,7 +127,7 @@ dma-channel@180 {
 			};
 		};
 
-		usb@23000 {
+		usb: usb@23000 {
 			compatible = "fsl-usb2-dr";
 			reg = <0x23000 0x1000>;
 			#address-cells = <1>;
@@ -152,7 +152,7 @@ enet0: ethernet@24000 {
 				     <34 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 
-			mdio@520 {
+			mdio0: mdio@520 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,gianfar-mdio";
@@ -175,7 +175,7 @@ enet1: ethernet@25000 {
 				     <37 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 
-			mdio@520 {
+			mdio1: mdio@520 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,gianfar-tbi";
@@ -203,7 +203,7 @@ serial1: serial@4600 {
 			interrupt-parent = <&ipic>;
 		};
 
-		crypto@30000 {
+		security: crypto@30000 {
 			compatible = "fsl,sec3.3", "fsl,sec3.1", "fsl,sec3.0",
 				     "fsl,sec2.4", "fsl,sec2.2", "fsl,sec2.1",
 				     "fsl,sec2.0";
@@ -216,7 +216,7 @@ crypto@30000 {
 			fsl,descriptor-types-mask = <0x3a30abf>;
 		};
 
-		sata@18000 {
+		sata0: sata@18000 {
 			compatible = "fsl,mpc8315-sata", "fsl,pq-sata";
 			reg = <0x18000 0x1000>;
 			cell-index = <1>;
@@ -224,7 +224,7 @@ sata@18000 {
 			interrupt-parent = <&ipic>;
 		};
 
-		sata@19000 {
+		sata1: sata@19000 {
 			compatible = "fsl,mpc8315-sata", "fsl,pq-sata";
 			reg = <0x19000 0x1000>;
 			cell-index = <2>;

-- 
2.45.2



