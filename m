Return-Path: <linuxppc-dev+bounces-15188-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFA0CF045A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 03 Jan 2026 19:57:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dk8vY2phqz2yMB;
	Sun, 04 Jan 2026 05:57:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767466665;
	cv=none; b=UpDd7r6bps6rwJUJ/xlRHwrQNws0j6SErd6RiZbmBSCRtbDl4yn3PPjMhKwIduSEA9Z2qcxW0LIn3FPTu/8y4mWKUDsiZoBVVz6jkv1LXOA+YbTDEQxFyVErw0wWhSSh7Sk/58QsDOYCuKtkmrweTN5X+n1khwS3TVytat2qsOdSGfjr6E0CviZMKYhlv77gN1hOkmsVCfi7RHOU71ohBRc+ib//3opg1w7IkUjV4O1EybtMsrfkqXPdK5ucmZ43Ux/G6Zlc+eEp16PwlB3oNRKR37bspLMZ5ZS3aEA8jzMCN3NHBQnTZhKWVhQqtrOhRtCgBZWPOEQUyk6LqMWtQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767466665; c=relaxed/relaxed;
	bh=/UV34nFyTwfACchD9F0rIWB7W2BkONB/4u9MCq2juso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cpEX6YSXPaeBezT1h/rb7eCNG3t3RikWnQvm8RsGcMV+jTkLO0LnJ8gKENsUs5w1ASbKIJVDvoXCoaVM+guA8WHX/BysG13XVkprkdhRA9NIAbWsHasdRTALxGR9yHl3Z+DzfYHvlRxBm+PoXQQ2vsEGtpSXXi2pHV5epVuC+xJLSbqXSWXbv93ZVrOmaFQCdRuwOyGKyptK/bNo4d7NiE6XcR/4KASOBeNxYbEEWNHiSCH01ei26DUMmpFsn9Yl2HFcRrqApPguJNvuPJ6EbouhCJdVwfWAlJ3yOpJbm/cFvGtKyM3lYKBJnyrqJ2AE6MY3sf1NSXk9IQmBH7s2sQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DmTr6Ayj; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DmTr6Ayj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dk8vX2Vrjz2yHD
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Jan 2026 05:57:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88B5043A19;
	Sat,  3 Jan 2026 18:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51B01C16AAE;
	Sat,  3 Jan 2026 18:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767466662;
	bh=OOfjCSWCBhLL6glOZ14lpz0laPBiOBBCOoLk3MYrsHE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DmTr6AyjVNKPjqmYJv90wYt2Ict5/uyR/6+UAzXOVD81xaEEccboO4yOuv4KU7lCl
	 W4cDv9OF2Is/uD3mlIQK3GY3g+L6bB8PrBb0WWdkRoLBDoSlmJD3cYlI8olRzUNRjy
	 BRjcf/W+jgGHD5JQMRTodB+a4GzBCPUkEQDgtRrefqZalLK2CSqfrtrbFPDp2dydIo
	 euyuASMA/GSVTXnJjMNFsn6uhGqslXpMpOuZcD/YEfAep1Qocv6f+Jb/586vix7zck
	 YmxX9SaAGB+joc1QRll5A0Jai+NsCOLC+WF0FsDjGFS5r01pVzrmCBw88UcPOWSALQ
	 G1+lJ25ZqKPGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BDBFC6160;
	Sat,  3 Jan 2026 18:57:42 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sat, 03 Jan 2026 19:54:05 +0100
Subject: [PATCH v2 1/5] powerpc: dts: mpc8313erdb: Use IRQ_TYPE_* macros
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
Message-Id: <20260103-mpc83xx-cleanup-v2-1-b2a13c0a0d63@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767466660; l=7074;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=YzhWn94y98dBRxKxgWEVSW5w8DI1UwZxNQXS2Dk695w=;
 b=ERbeDjckZvzeHPrE/3PDGa1o6emsaZ1+n1hZABmA8mx6snDA4+S2Z3CUG7nDSdH4+g8d2jXc4
 ljMjJfKA5O+Afe9bLu4YEM4dsA9Jf12lNRqBCjVE1SWP+2ux+sy+VYS
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

This increases readability, because "0x8" isn't very descriptive.

mpc8313erdb.dtb remains identical after this patch.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/mpc8313erdb.dts | 59 ++++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/boot/dts/mpc8313erdb.dts b/arch/powerpc/boot/dts/mpc8313erdb.dts
index 09508b4c8c7309..137217d377e91b 100644
--- a/arch/powerpc/boot/dts/mpc8313erdb.dts
+++ b/arch/powerpc/boot/dts/mpc8313erdb.dts
@@ -6,6 +6,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "MPC8313ERDB";
@@ -48,7 +49,7 @@ localbus@e0005000 {
 		#size-cells = <1>;
 		compatible = "fsl,mpc8313-elbc", "fsl,elbc", "simple-bus";
 		reg = <0xe0005000 0x1000>;
-		interrupts = <77 0x8>;
+		interrupts = <77 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&ipic>;
 
 		// CS0 and CS1 are swapped when
@@ -118,7 +119,7 @@ i2c@3000 {
 				cell-index = <0>;
 				compatible = "fsl-i2c";
 				reg = <0x3000 0x100>;
-				interrupts = <14 0x8>;
+				interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
 				interrupt-parent = <&ipic>;
 				dfsrr;
 				rtc@68 {
@@ -131,7 +132,7 @@ crypto@30000 {
 				compatible = "fsl,sec2.2", "fsl,sec2.1",
 				             "fsl,sec2.0";
 				reg = <0x30000 0x10000>;
-				interrupts = <11 0x8>;
+				interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 				interrupt-parent = <&ipic>;
 				fsl,num-channels = <1>;
 				fsl,channel-fifo-len = <24>;
@@ -146,7 +147,7 @@ i2c@3100 {
 			cell-index = <1>;
 			compatible = "fsl-i2c";
 			reg = <0x3100 0x100>;
-			interrupts = <15 0x8>;
+			interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			dfsrr;
 		};
@@ -155,7 +156,7 @@ spi@7000 {
 			cell-index = <0>;
 			compatible = "fsl,spi";
 			reg = <0x7000 0x1000>;
-			interrupts = <16 0x8>;
+			interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			mode = "cpu";
 		};
@@ -167,7 +168,7 @@ usb@23000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			interrupt-parent = <&ipic>;
-			interrupts = <38 0x8>;
+			interrupts = <38 IRQ_TYPE_LEVEL_LOW>;
 			phy_type = "utmi_wide";
 			sleep = <&pmc 0x00300000>;
 		};
@@ -175,7 +176,8 @@ usb@23000 {
 		ptp_clock@24E00 {
 			compatible = "fsl,etsec-ptp";
 			reg = <0x24E00 0xB0>;
-			interrupts = <12 0x8 13 0x8>;
+			interrupts = <12 IRQ_TYPE_LEVEL_LOW>,
+				     <13 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = < &ipic >;
 			fsl,tclk-period = <10>;
 			fsl,tmr-prsc    = <100>;
@@ -197,7 +199,9 @@ enet0: ethernet@24000 {
 			compatible = "gianfar";
 			reg = <0x24000 0x1000>;
 			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <37 0x8 36 0x8 35 0x8>;
+			interrupts = <37 IRQ_TYPE_LEVEL_LOW>,
+				     <36 IRQ_TYPE_LEVEL_LOW>,
+				     <35 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			tbi-handle = < &tbi0 >;
 			/* Vitesse 7385 isn't on the MDIO bus */
@@ -211,7 +215,7 @@ mdio@520 {
 				reg = <0x520 0x20>;
 				phy4: ethernet-phy@4 {
 					interrupt-parent = <&ipic>;
-					interrupts = <20 0x8>;
+					interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
 					reg = <0x4>;
 				};
 				tbi0: tbi-phy@11 {
@@ -231,7 +235,9 @@ enet1: ethernet@25000 {
 			reg = <0x25000 0x1000>;
 			ranges = <0x0 0x25000 0x1000>;
 			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <34 0x8 33 0x8 32 0x8>;
+			interrupts = <34 IRQ_TYPE_LEVEL_LOW>,
+				     <33 IRQ_TYPE_LEVEL_LOW>,
+				     <32 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			tbi-handle = < &tbi1 >;
 			phy-handle = < &phy4 >;
@@ -259,7 +265,7 @@ serial0: serial@4500 {
 			compatible = "fsl,ns16550", "ns16550";
 			reg = <0x4500 0x100>;
 			clock-frequency = <0>;
-			interrupts = <9 0x8>;
+			interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 		};
 
@@ -269,15 +275,12 @@ serial1: serial@4600 {
 			compatible = "fsl,ns16550", "ns16550";
 			reg = <0x4600 0x100>;
 			clock-frequency = <0>;
-			interrupts = <10 0x8>;
+			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 		};
 
 		/* IPIC
-		 * interrupts cell = <intr #, sense>
-		 * sense values match linux IORESOURCE_IRQ_* defines:
-		 * sense == 8: Level, low assertion
-		 * sense == 2: Edge, high-to-low change
+		 * interrupts cell = <intr #, type>
 		 */
 		ipic: pic@700 {
 			interrupt-controller;
@@ -290,7 +293,7 @@ ipic: pic@700 {
 		pmc: power@b00 {
 			compatible = "fsl,mpc8313-pmc", "fsl,mpc8349-pmc";
 			reg = <0xb00 0x100 0xa00 0x100>;
-			interrupts = <80 8>;
+			interrupts = <80 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			fsl,mpc8313-wakeup-timer = <&gtm1>;
 
@@ -306,14 +309,20 @@ pmc: power@b00 {
 		gtm1: timer@500 {
 			compatible = "fsl,mpc8313-gtm", "fsl,gtm";
 			reg = <0x500 0x100>;
-			interrupts = <90 8 78 8 84 8 72 8>;
+			interrupts = <90 IRQ_TYPE_LEVEL_LOW>,
+				     <78 IRQ_TYPE_LEVEL_LOW>,
+				     <84 IRQ_TYPE_LEVEL_LOW>,
+				     <72 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 		};
 
 		timer@600 {
 			compatible = "fsl,mpc8313-gtm", "fsl,gtm";
 			reg = <0x600 0x100>;
-			interrupts = <91 8 79 8 85 8 73 8>;
+			interrupts = <91 IRQ_TYPE_LEVEL_LOW>,
+				     <79 IRQ_TYPE_LEVEL_LOW>,
+				     <85 IRQ_TYPE_LEVEL_LOW>,
+				     <73 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 		};
 	};
@@ -341,7 +350,7 @@ pci0: pci@e0008500 {
 					 0x7800 0x0 0x0 0x3 &ipic 17 0x8
 					 0x7800 0x0 0x0 0x4 &ipic 18 0x8>;
 			interrupt-parent = <&ipic>;
-			interrupts = <66 0x8>;
+			interrupts = <66 IRQ_TYPE_LEVEL_LOW>;
 			bus-range = <0x0 0x0>;
 			ranges = <0x02000000 0x0 0x90000000 0x90000000 0x0 0x10000000
 				  0x42000000 0x0 0x80000000 0x80000000 0x0 0x10000000
@@ -363,14 +372,14 @@ dma@82a8 {
 			reg = <0xe00082a8 4>;
 			ranges = <0 0xe0008100 0x1a8>;
 			interrupt-parent = <&ipic>;
-			interrupts = <71 8>;
+			interrupts = <71 IRQ_TYPE_LEVEL_LOW>;
 
 			dma-channel@0 {
 				compatible = "fsl,mpc8313-dma-channel",
 				             "fsl,elo-dma-channel";
 				reg = <0 0x28>;
 				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
+				interrupts = <71 IRQ_TYPE_LEVEL_LOW>;
 				cell-index = <0>;
 			};
 
@@ -379,7 +388,7 @@ dma-channel@80 {
 				             "fsl,elo-dma-channel";
 				reg = <0x80 0x28>;
 				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
+				interrupts = <71 IRQ_TYPE_LEVEL_LOW>;
 				cell-index = <1>;
 			};
 
@@ -388,7 +397,7 @@ dma-channel@100 {
 				             "fsl,elo-dma-channel";
 				reg = <0x100 0x28>;
 				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
+				interrupts = <71 IRQ_TYPE_LEVEL_LOW>;
 				cell-index = <2>;
 			};
 
@@ -397,7 +406,7 @@ dma-channel@180 {
 				             "fsl,elo-dma-channel";
 				reg = <0x180 0x28>;
 				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
+				interrupts = <71 IRQ_TYPE_LEVEL_LOW>;
 				cell-index = <3>;
 			};
 		};

-- 
2.51.0



