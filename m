Return-Path: <linuxppc-dev+bounces-4575-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 572CD9FFE56
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 19:33:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPFgL2Hz6z306S;
	Fri,  3 Jan 2025 05:32:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735842749;
	cv=none; b=fooY+p6pe7IIL7FOkMqLOXDNCVtGo52JmxPgU+jxv6uKQcGR3pu/84qv4lUeVDeNT3LWIi22VL4s2trJUckCAW0+nzrF+83kM+jZ+16ZwVfyaJsMquYw2KkK/Wq3NyM1QFa724wDKJwe4g0JZhfe8Xd/rF8kdP3NxKY2v6ZsIuiJwwZCTU+xR1uWGnNby17fVgTrrOd+j/iVR/85uzOMfSJtrNuN52tgYOgxEkPdMauKD1et0i4Qzp98ASNExWg1mgUyIWzmp9WNdb6DLW7j0bHo7c0FyDfgrwEEiJQAVUCJnycV1LASgPoTEbt/McXexWdJhDlb3VNeAG7bzyn8jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735842749; c=relaxed/relaxed;
	bh=Eucl+VYnHkSeE7QqPBr7vMF4RVw1zOXcbbDmX2nC91s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TGeu5swl4aflxfytZcYTxXx/glivNd9/1u09MsexiUeUqYHsb5T0cNoxxXOf1yASTSkgnpNp4rWsAFCx7Mn4R65mlzYroP3mnT/76qGbyoXdcq829NhD+D+G9kTwy3q1GLYd5iDN7KLd2cSJ2xU7NMUunsbdKDLfIFHUTbZ8gaPl+tZj7DLslteelUba6sDrTyHPWkNLl/kMq6Fo8/weTKYAMtiDMPeIaix4k47S19srZ71VQSlwt/Sb2C4NXuT1Dmw9n35h32aAvXrmTgUW2nEaYA89HYvf0Z157WmG1luvjYlSYRt5XtcLMks33eMtZ0HfbjxTuMOpQ04P4jZn4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JTHpoNt5; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JTHpoNt5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPFgF6LgZz2yvk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 05:32:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 549765C5DA8;
	Thu,  2 Jan 2025 18:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0705C4CEE7;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842741;
	bh=Kn3Ba2q1476jBlKRXeE8z9xsQG14quWxXA7lZRjTCi8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JTHpoNt5Nb3TB8gJV2YqDpCygbtELHgqITzOfFOuANfqMlu0vBrF4EqOrtKJymFBI
	 d1qz3/3fqpKn3FOEYTfxtkG+1IOqtBzKQI94XlU2pHpgfmFd/9bUlAaYN7MFQ1iVgg
	 Xuz03rLNBnHMqKQgq7RzZOq1ig2B7itgp3bbxFrCpoUQYYFUP3Hl2riEhn9lsZvRsu
	 JPMFPIiwcl/w8SFjwApDn+v4PTZHzBTvSCKutjqPQaONAGeOV1RRq4tgASzz+BHWhl
	 MD1GpfMIFN8rESLcw6YeZ+gWpIXXykQwVV6E9ip5Gb3YtrTwTJ/V28NqiXfDUu/Lpo
	 vCvpw8ItkN7+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D65A1E77188;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:46 +0100
Subject: [PATCH 05/19] powerpc: dts: mpc8315e: Disable peripherals by
 default
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
Message-Id: <20250102-mpc83xx-v1-5-86f78ba2a7af@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=4954;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=AV1vR3Ihm+C41mrCgb+tb12Q+MpI9SpagJ/QC+gpFGE=;
 b=wAqdmKvmfb4haqZrhf4yvl5DxXw4IUZoX/quIcvJQO27pvqD85KdryfzhT56KvFnLJJyCWpdQ
 1mLSXu6XjPqC04bSBxUiu5G7ZBCVaZiJa5DxY+VGR/xmQwAai02WvEV
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

Peripherals with a connection to the outside of the chip aren't
necessarily used on all board designs, so disable them by default,
and enable them per-board.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/mpc8315e.dtsi   | 15 +++++++++++++++
 arch/powerpc/boot/dts/mpc8315erdb.dts | 12 ++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/powerpc/boot/dts/mpc8315e.dtsi b/arch/powerpc/boot/dts/mpc8315e.dtsi
index 2531e702648f1bf922a7112c9ddaeac1c3113572..7e61a78850433fa43795a2a5fb06ce6a148bb11d 100644
--- a/arch/powerpc/boot/dts/mpc8315e.dtsi
+++ b/arch/powerpc/boot/dts/mpc8315e.dtsi
@@ -51,6 +51,7 @@ localbus: localbus@e0005000 {
 		reg = <0xe0005000 0x1000>;
 		interrupts = <77 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&ipic>;
+		status = "disabled";
 	};
 
 	immr@e0000000 {
@@ -77,6 +78,7 @@ i2c: i2c@3000 {
 			interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			dfsrr;
+			status = "disabled";
 		};
 
 		spi: spi@7000 {
@@ -86,6 +88,7 @@ spi: spi@7000 {
 			interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			mode = "cpu";
+			status = "disabled";
 		};
 
 		dma@82a8 {
@@ -135,6 +138,7 @@ usb: usb@23000 {
 			interrupt-parent = <&ipic>;
 			interrupts = <38 IRQ_TYPE_LEVEL_LOW>;
 			phy_type = "utmi";
+			status = "disabled";
 		};
 
 		enet0: ethernet@24000 {
@@ -151,12 +155,14 @@ enet0: ethernet@24000 {
 				     <33 IRQ_TYPE_LEVEL_LOW>,
 				     <34 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
+			status = "disabled";
 
 			mdio0: mdio@520 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,gianfar-mdio";
 				reg = <0x520 0x20>;
+				status = "disabled";
 			};
 		};
 
@@ -174,12 +180,14 @@ enet1: ethernet@25000 {
 				     <36 IRQ_TYPE_LEVEL_LOW>,
 				     <37 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
+			status = "disabled";
 
 			mdio1: mdio@520 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,gianfar-tbi";
 				reg = <0x520 0x20>;
+				status = "disabled";
 			};
 		};
 
@@ -191,6 +199,7 @@ serial0: serial@4500 {
 			clock-frequency = <133333333>;
 			interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
+			status = "disabled";
 		};
 
 		serial1: serial@4600 {
@@ -201,6 +210,7 @@ serial1: serial@4600 {
 			clock-frequency = <133333333>;
 			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
+			status = "disabled";
 		};
 
 		security: crypto@30000 {
@@ -222,6 +232,7 @@ sata0: sata@18000 {
 			cell-index = <1>;
 			interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
+			status = "disabled";
 		};
 
 		sata1: sata@19000 {
@@ -230,6 +241,7 @@ sata1: sata@19000 {
 			cell-index = <2>;
 			interrupts = <45 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
+			status = "disabled";
 		};
 
 		gtm1: timer@500 {
@@ -324,6 +336,7 @@ pci0: pci@e0008500 {
 		       0xe0008300 0x8>;		/* config space access registers */
 		compatible = "fsl,mpc8349-pci";
 		device_type = "pci";
+		status = "disabled";
 	};
 
 	pci1: pcie@e0009000 {
@@ -342,6 +355,7 @@ pci1: pcie@e0009000 {
 				 0 0 0 3 &ipic 1 IRQ_TYPE_LEVEL_LOW
 				 0 0 0 4 &ipic 1 IRQ_TYPE_LEVEL_LOW>;
 		clock-frequency = <0>;
+		status = "disabled";
 	};
 
 	pci2: pcie@e000a000 {
@@ -360,5 +374,6 @@ pci2: pcie@e000a000 {
 				 0 0 0 3 &ipic 2 IRQ_TYPE_LEVEL_LOW
 				 0 0 0 4 &ipic 2 IRQ_TYPE_LEVEL_LOW>;
 		clock-frequency = <0>;
+		status = "disabled";
 	};
 };
diff --git a/arch/powerpc/boot/dts/mpc8315erdb.dts b/arch/powerpc/boot/dts/mpc8315erdb.dts
index 2ea71514900131893a70b44bab7bcc0bf4d86e44..28c06faf8ce0eb330a0108eba321b4c1127a8ae2 100644
--- a/arch/powerpc/boot/dts/mpc8315erdb.dts
+++ b/arch/powerpc/boot/dts/mpc8315erdb.dts
@@ -25,6 +25,8 @@ memory {
 	};
 
 	localbus@e0005000 {
+		status = "okay";
+
 		// CS0 and CS1 are swapped when
 		// booting from nand, but the
 		// addresses are the same.
@@ -83,8 +85,11 @@ ethernet@24000 {
 			tbi-handle = <&tbi0>;
 			phy-handle = < &phy0 >;
 			fsl,magic-packet;
+			status = "okay";
 
 			mdio@520 {
+				status = "okay";
+
 				phy0: ethernet-phy@0 {
 					interrupt-parent = <&ipic>;
 					interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
@@ -108,8 +113,11 @@ ethernet@25000 {
 			tbi-handle = <&tbi1>;
 			phy-handle = < &phy1 >;
 			fsl,magic-packet;
+			status = "okay";
 
 			mdio@520 {
+				status = "okay";
+
 				tbi1: tbi-phy@11 {
 					reg = <0x11>;
 					device_type = "tbi-phy";
@@ -119,6 +127,8 @@ tbi1: tbi-phy@11 {
 	};
 
 	pcie@e0009000 {
+		status = "okay";
+
 		pcie@0 {
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -134,6 +144,8 @@ pcie@0 {
 	};
 
 	pcie@e000a000 {
+		status = "okay";
+
 		pcie@0 {
 			#address-cells = <3>;
 			#size-cells = <2>;

-- 
2.45.2



