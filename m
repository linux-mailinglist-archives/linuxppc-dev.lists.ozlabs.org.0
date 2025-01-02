Return-Path: <linuxppc-dev+bounces-4579-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 269C19FFE63
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 19:33:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPFgP0NrTz30QJ;
	Fri,  3 Jan 2025 05:32:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735842752;
	cv=none; b=CXdINLMzGmR4ZF3U/YpVd9EiZn0MyA4fFBcqr+jdlj9t1oWsizQm2YckO+ZUO3IOFANgvGwegjMefZDu4K4mEDMgUy7bCEZfzfL9YdYBVaAE/2SPDgdqK0Cc93WP4TuS2o7xgqw46eNA9lR9E9ZhzlqWcedTJUiKmbt8mj+F7lKxJsQQI9Q60P8GboDQnfMvsjxi5NQpSSXpP3PVp/qS0XfvZE7M+1oq1b01wPKHNaC67hZx7oyPisSf9gqX5Ra/0cjgp6+clb+CgNZ0Me7sjvkbBi7usVXGgXao2pZr65vygIYj8zzbcYzkSX/MN3H3KL8YiZ/Ki3MXeLBFTF0Esg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735842752; c=relaxed/relaxed;
	bh=VmV8L70dVKNvDf82eJZKg9yqPvwY/OVU0ODXD1cNBCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ErceLo5BuE/rustZCYqBmeWS0F3rN7M+MPykgJJfWa6VKUmsuxMq1sbucd+Do7R4GAIVzqIYzQvGIE+q3TO+LZNfRN+ML8Kc9twgLTxF0TfMDLOjWE6dXkemSqLFMmsA5YWs6cbmLc0U3W29jek7q5msth0vCp3IDA9k2L7CLwMvEOxAC05VsJfvAIXBYIHISNtTd/dM6qKLNyypkhwLVSalw1nrfTvXRBgc1AWxl5orQxhWCt0oWOLuUtVcf4Y2qrtu5ebU5PK7QsHzkbpwtQxMmlbdrLwSYxBGq8T4wUnYBQCxiOgRWDw5C4rBmSj3gdqflHkP9E5RD74ExXrEDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uo3yixYZ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uo3yixYZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPFgG2sfrz2ywR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 05:32:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4331C5C5D03;
	Thu,  2 Jan 2025 18:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0564C4CEDF;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842741;
	bh=mFttdxUf0zkS97qdKWAYSDQtG0SVAkS26FN4ZvrD4O8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uo3yixYZMMoVIueGO+G9SRCzblkf5+UPEV/AP1OeVZIG/WeDTGmR/ZAXM231WAgiH
	 rqWF7k++R9Ovgk8ZA2FbKJ8xu93l5QokS5U5XM7d/bXC64QwZxVL+XmHqMHt2nMiWv
	 8XqMv57EaAeHRmVAappmlVO1+wkEzxtNPR6UPtIbNyLtrrW4CUKHmhANtOwpXvMqdL
	 P13aYe8GQqDMVGCQ/UdrOwgTvPVOGyEJfaFyIY3jChX9NUqllFf+ETFwGwLI1KMfPU
	 7UC6Qtf6QdqfSbKFJd6flH0sbwRmokIIbBi/aY4xlp5pAp1l4ekTOzB5nINCS0reDg
	 pWKNhO6fuvoIw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6699E7718B;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:44 +0100
Subject: [PATCH 03/19] powerpc: dts: mpc8315e: Use IRQ_TYPE_* macros
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
Message-Id: <20250102-mpc83xx-v1-3-86f78ba2a7af@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=10387;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=27vJGZGlFwWizM+EMz5rgxyTnv087lEXb6iLZDOh3DE=;
 b=9363Ysi+0bn7S8tWB0fh1Ub3SedQBf3xmMz9WI6sCYjeYHhNuAhanngotMhu7PndyysNJ7P0a
 lqFKK9sAHo5AxNVhzQHHS8d20lltsGV001A4Puc90F4CesxY1Kukf+p
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

This increases readability, because "0x8" isn't very descriptive.

mpc8315erdb.dtb remains identical after this patch.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/mpc8315e.dtsi   | 112 ++++++++++++++++++----------------
 arch/powerpc/boot/dts/mpc8315erdb.dts |   4 +-
 2 files changed, 62 insertions(+), 54 deletions(-)

diff --git a/arch/powerpc/boot/dts/mpc8315e.dtsi b/arch/powerpc/boot/dts/mpc8315e.dtsi
index 4830c8e5cd5c6858ea3a0c25e4a1f26fa87a7111..8741482905f0f30bf893a08b2602fdc6e74c23ff 100644
--- a/arch/powerpc/boot/dts/mpc8315e.dtsi
+++ b/arch/powerpc/boot/dts/mpc8315e.dtsi
@@ -12,6 +12,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	compatible = "fsl,mpc8315e";
@@ -48,7 +49,7 @@ localbus@e0005000 {
 		#size-cells = <1>;
 		compatible = "fsl,mpc8315-elbc", "fsl,elbc", "simple-bus";
 		reg = <0xe0005000 0x1000>;
-		interrupts = <77 0x8>;
+		interrupts = <77 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&ipic>;
 	};
 
@@ -73,7 +74,7 @@ i2c@3000 {
 			cell-index = <0>;
 			compatible = "fsl-i2c";
 			reg = <0x3000 0x100>;
-			interrupts = <14 0x8>;
+			interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			dfsrr;
 		};
@@ -82,7 +83,7 @@ spi@7000 {
 			cell-index = <0>;
 			compatible = "fsl,spi";
 			reg = <0x7000 0x1000>;
-			interrupts = <16 0x8>;
+			interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			mode = "cpu";
 		};
@@ -94,35 +95,35 @@ dma@82a8 {
 			reg = <0x82a8 4>;
 			ranges = <0 0x8100 0x1a8>;
 			interrupt-parent = <&ipic>;
-			interrupts = <71 8>;
+			interrupts = <71 IRQ_TYPE_LEVEL_LOW>;
 			cell-index = <0>;
 			dma-channel@0 {
 				compatible = "fsl,mpc8315-dma-channel", "fsl,elo-dma-channel";
 				reg = <0 0x80>;
 				cell-index = <0>;
 				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
+				interrupts = <71 IRQ_TYPE_LEVEL_LOW>;
 			};
 			dma-channel@80 {
 				compatible = "fsl,mpc8315-dma-channel", "fsl,elo-dma-channel";
 				reg = <0x80 0x80>;
 				cell-index = <1>;
 				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
+				interrupts = <71 IRQ_TYPE_LEVEL_LOW>;
 			};
 			dma-channel@100 {
 				compatible = "fsl,mpc8315-dma-channel", "fsl,elo-dma-channel";
 				reg = <0x100 0x80>;
 				cell-index = <2>;
 				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
+				interrupts = <71 IRQ_TYPE_LEVEL_LOW>;
 			};
 			dma-channel@180 {
 				compatible = "fsl,mpc8315-dma-channel", "fsl,elo-dma-channel";
 				reg = <0x180 0x28>;
 				cell-index = <3>;
 				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
+				interrupts = <71 IRQ_TYPE_LEVEL_LOW>;
 			};
 		};
 
@@ -132,7 +133,7 @@ usb@23000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			interrupt-parent = <&ipic>;
-			interrupts = <38 0x8>;
+			interrupts = <38 IRQ_TYPE_LEVEL_LOW>;
 			phy_type = "utmi";
 		};
 
@@ -146,7 +147,9 @@ enet0: ethernet@24000 {
 			reg = <0x24000 0x1000>;
 			ranges = <0x0 0x24000 0x1000>;
 			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <32 0x8 33 0x8 34 0x8>;
+			interrupts = <32 IRQ_TYPE_LEVEL_LOW>,
+				     <33 IRQ_TYPE_LEVEL_LOW>,
+				     <34 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 
 			mdio@520 {
@@ -167,7 +170,9 @@ enet1: ethernet@25000 {
 			reg = <0x25000 0x1000>;
 			ranges = <0x0 0x25000 0x1000>;
 			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <35 0x8 36 0x8 37 0x8>;
+			interrupts = <35 IRQ_TYPE_LEVEL_LOW>,
+				     <36 IRQ_TYPE_LEVEL_LOW>,
+				     <37 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 
 			mdio@520 {
@@ -184,7 +189,7 @@ serial0: serial@4500 {
 			compatible = "fsl,ns16550", "ns16550";
 			reg = <0x4500 0x100>;
 			clock-frequency = <133333333>;
-			interrupts = <9 0x8>;
+			interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 		};
 
@@ -194,7 +199,7 @@ serial1: serial@4600 {
 			compatible = "fsl,ns16550", "ns16550";
 			reg = <0x4600 0x100>;
 			clock-frequency = <133333333>;
-			interrupts = <10 0x8>;
+			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 		};
 
@@ -203,7 +208,7 @@ crypto@30000 {
 				     "fsl,sec2.4", "fsl,sec2.2", "fsl,sec2.1",
 				     "fsl,sec2.0";
 			reg = <0x30000 0x10000>;
-			interrupts = <11 0x8>;
+			interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			fsl,num-channels = <4>;
 			fsl,channel-fifo-len = <24>;
@@ -215,7 +220,7 @@ sata@18000 {
 			compatible = "fsl,mpc8315-sata", "fsl,pq-sata";
 			reg = <0x18000 0x1000>;
 			cell-index = <1>;
-			interrupts = <44 0x8>;
+			interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 		};
 
@@ -223,14 +228,17 @@ sata@19000 {
 			compatible = "fsl,mpc8315-sata", "fsl,pq-sata";
 			reg = <0x19000 0x1000>;
 			cell-index = <2>;
-			interrupts = <45 0x8>;
+			interrupts = <45 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 		};
 
 		gtm1: timer@500 {
 			compatible = "fsl,mpc8315-gtm", "fsl,gtm";
 			reg = <0x500 0x100>;
-			interrupts = <90 8 78 8 84 8 72 8>;
+			interrupts = <90 IRQ_TYPE_LEVEL_LOW>,
+				     <78 IRQ_TYPE_LEVEL_LOW>,
+				     <84 IRQ_TYPE_LEVEL_LOW>,
+				     <72 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			clock-frequency = <133333333>;
 		};
@@ -238,16 +246,16 @@ gtm1: timer@500 {
 		timer@600 {
 			compatible = "fsl,mpc8315-gtm", "fsl,gtm";
 			reg = <0x600 0x100>;
-			interrupts = <91 8 79 8 85 8 73 8>;
+			interrupts = <91 IRQ_TYPE_LEVEL_LOW>,
+				     <79 IRQ_TYPE_LEVEL_LOW>,
+				     <85 IRQ_TYPE_LEVEL_LOW>,
+				     <73 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			clock-frequency = <133333333>;
 		};
 
 		/* IPIC
-		 * interrupts cell = <intr #, sense>
-		 * sense values match linux IORESOURCE_IRQ_* defines:
-		 * sense == 8: Level, low assertion
-		 * sense == 2: Edge, high-to-low change
+		 * interrupts cell = <intr #, type>
 		 */
 		ipic: interrupt-controller@700 {
 			interrupt-controller;
@@ -261,14 +269,14 @@ ipic-msi@7c0 {
 			compatible = "fsl,ipic-msi";
 			reg = <0x7c0 0x40>;
 			msi-available-ranges = <0 0x100>;
-			interrupts = <0x43 0x8
-				      0x4  0x8
-				      0x51 0x8
-				      0x52 0x8
-				      0x56 0x8
-				      0x57 0x8
-				      0x58 0x8
-				      0x59 0x8>;
+			interrupts = <0x43 IRQ_TYPE_LEVEL_LOW>,
+				     <0x4  IRQ_TYPE_LEVEL_LOW>,
+				     <0x51 IRQ_TYPE_LEVEL_LOW>,
+				     <0x52 IRQ_TYPE_LEVEL_LOW>,
+				     <0x56 IRQ_TYPE_LEVEL_LOW>,
+				     <0x57 IRQ_TYPE_LEVEL_LOW>,
+				     <0x58 IRQ_TYPE_LEVEL_LOW>,
+				     <0x59 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = < &ipic >;
 		};
 
@@ -276,7 +284,7 @@ pmc: power@b00 {
 			compatible = "fsl,mpc8315-pmc", "fsl,mpc8313-pmc",
 				     "fsl,mpc8349-pmc";
 			reg = <0xb00 0x100 0xa00 0x100>;
-			interrupts = <80 8>;
+			interrupts = <80 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			fsl,mpc8313-wakeup-timer = <&gtm1>;
 		};
@@ -286,24 +294,24 @@ pci0: pci@e0008500 {
 		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
 		interrupt-map = <
 				/* IDSEL 0x0E -mini PCI */
-				 0x7000 0x0 0x0 0x1 &ipic 18 0x8
-				 0x7000 0x0 0x0 0x2 &ipic 18 0x8
-				 0x7000 0x0 0x0 0x3 &ipic 18 0x8
-				 0x7000 0x0 0x0 0x4 &ipic 18 0x8
+				 0x7000 0x0 0x0 0x1 &ipic 18 IRQ_TYPE_LEVEL_LOW
+				 0x7000 0x0 0x0 0x2 &ipic 18 IRQ_TYPE_LEVEL_LOW
+				 0x7000 0x0 0x0 0x3 &ipic 18 IRQ_TYPE_LEVEL_LOW
+				 0x7000 0x0 0x0 0x4 &ipic 18 IRQ_TYPE_LEVEL_LOW
 
 				/* IDSEL 0x0F -mini PCI */
-				 0x7800 0x0 0x0 0x1 &ipic 17 0x8
-				 0x7800 0x0 0x0 0x2 &ipic 17 0x8
-				 0x7800 0x0 0x0 0x3 &ipic 17 0x8
-				 0x7800 0x0 0x0 0x4 &ipic 17 0x8
+				 0x7800 0x0 0x0 0x1 &ipic 17 IRQ_TYPE_LEVEL_LOW
+				 0x7800 0x0 0x0 0x2 &ipic 17 IRQ_TYPE_LEVEL_LOW
+				 0x7800 0x0 0x0 0x3 &ipic 17 IRQ_TYPE_LEVEL_LOW
+				 0x7800 0x0 0x0 0x4 &ipic 17 IRQ_TYPE_LEVEL_LOW
 
 				/* IDSEL 0x10 - PCI slot */
-				 0x8000 0x0 0x0 0x1 &ipic 48 0x8
-				 0x8000 0x0 0x0 0x2 &ipic 17 0x8
-				 0x8000 0x0 0x0 0x3 &ipic 48 0x8
-				 0x8000 0x0 0x0 0x4 &ipic 17 0x8>;
+				 0x8000 0x0 0x0 0x1 &ipic 48 IRQ_TYPE_LEVEL_LOW
+				 0x8000 0x0 0x0 0x2 &ipic 17 IRQ_TYPE_LEVEL_LOW
+				 0x8000 0x0 0x0 0x3 &ipic 48 IRQ_TYPE_LEVEL_LOW
+				 0x8000 0x0 0x0 0x4 &ipic 17 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&ipic>;
-		interrupts = <66 0x8>;
+		interrupts = <66 IRQ_TYPE_LEVEL_LOW>;
 		bus-range = <0x0 0x0>;
 		ranges = <0x02000000 0 0x90000000 0x90000000 0 0x10000000
 			  0x42000000 0 0x80000000 0x80000000 0 0x10000000
@@ -329,10 +337,10 @@ pci1: pcie@e0009000 {
 		          0x01000000 0 0x00000000 0xb1000000 0 0x00800000>;
 		bus-range = <0 255>;
 		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <0 0 0 1 &ipic 1 8
-				 0 0 0 2 &ipic 1 8
-				 0 0 0 3 &ipic 1 8
-				 0 0 0 4 &ipic 1 8>;
+		interrupt-map = <0 0 0 1 &ipic 1 IRQ_TYPE_LEVEL_LOW
+				 0 0 0 2 &ipic 1 IRQ_TYPE_LEVEL_LOW
+				 0 0 0 3 &ipic 1 IRQ_TYPE_LEVEL_LOW
+				 0 0 0 4 &ipic 1 IRQ_TYPE_LEVEL_LOW>;
 		clock-frequency = <0>;
 	};
 
@@ -347,10 +355,10 @@ pci2: pcie@e000a000 {
 			  0x01000000 0 0x00000000 0xd1000000 0 0x00800000>;
 		bus-range = <0 255>;
 		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <0 0 0 1 &ipic 2 8
-				 0 0 0 2 &ipic 2 8
-				 0 0 0 3 &ipic 2 8
-				 0 0 0 4 &ipic 2 8>;
+		interrupt-map = <0 0 0 1 &ipic 2 IRQ_TYPE_LEVEL_LOW
+				 0 0 0 2 &ipic 2 IRQ_TYPE_LEVEL_LOW
+				 0 0 0 3 &ipic 2 IRQ_TYPE_LEVEL_LOW
+				 0 0 0 4 &ipic 2 IRQ_TYPE_LEVEL_LOW>;
 		clock-frequency = <0>;
 	};
 };
diff --git a/arch/powerpc/boot/dts/mpc8315erdb.dts b/arch/powerpc/boot/dts/mpc8315erdb.dts
index b39903c8813d194c104d1e22c6167d8a9cea0076..2ea71514900131893a70b44bab7bcc0bf4d86e44 100644
--- a/arch/powerpc/boot/dts/mpc8315erdb.dts
+++ b/arch/powerpc/boot/dts/mpc8315erdb.dts
@@ -87,13 +87,13 @@ ethernet@24000 {
 			mdio@520 {
 				phy0: ethernet-phy@0 {
 					interrupt-parent = <&ipic>;
-					interrupts = <20 0x8>;
+					interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
 					reg = <0x0>;
 				};
 
 				phy1: ethernet-phy@1 {
 					interrupt-parent = <&ipic>;
-					interrupts = <19 0x8>;
+					interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
 					reg = <0x1>;
 				};
 

-- 
2.45.2



