Return-Path: <linuxppc-dev+bounces-17592-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iK1pBpADp2k7bgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17592-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 16:51:44 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC361F2F7F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 16:51:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQKz23WX2z3cFM;
	Wed, 04 Mar 2026 02:51:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772553070;
	cv=none; b=DfMjZzlM5suUz7MiYzNIq93w/qPjIPIRP0l55HoaW1jmgbpGqxwPWKeOs5qDeZzAIwjoeGCDs5wXpWtt9Vik+y0OaaDp/S04bnOl83hNWcPFW8hItYHTJyrGh7nI4Dxzr9nQKFf/OQi+jxF9yoikek7tugC7eD3WvFZrEcaebYYm97/CbVUa7ALh4Va3PBkdvykHKo1wJ8MmppV1hDTWKY7lwNZdvbbZrWscATI2XDcLb/RgL1d1hay4PR4c5oZiy+RwLY9+YdUlJ2bls9SuwolIj1Llt/M+kSmiB2ZKnCzAx9Gnv6+VYEEoE+2Kj24m2m+XEBTFAn8CJcNCs76qXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772553070; c=relaxed/relaxed;
	bh=6CsIgBvTZ/aO5Cm0DQ3UQhW5Oip36QGKb+p3AazB1PI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VXRiGFqub+VJY68PW9EnGaREPP94K7lGI3B6MXf7W7ATgnZQGi1CfHe4OBjKkpR59XC9zPgIfqDXciOoDQaR47cbyM2krZ0vbmaLB7bYKX96csMwRL+KCDzij3zBCXfmlcCFUxdJsEM0aAwyhfV/QSUHi/y1DvYwwfkH7kCOO/eoezygfm7VSNkGysk5LZgDAfGi2XzlCDnLRw+YVsmdZx0ilfWW0tLFf+dqQFBOeazfopO/HIOKPKy+pZbvHnKSL9ygh0Z7Qmfr64RCxuJ7+BeR241nM/JME2v86Jshy08iCcpfS5NSVjo5A0tFH8MlVJgytaF2C1Dk43kMx8lRoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lRMcUywm; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lRMcUywm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQKyw6Zfvz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 02:51:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C219F4444C;
	Tue,  3 Mar 2026 15:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6EB26C2BCAF;
	Tue,  3 Mar 2026 15:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772553062;
	bh=My/NfxgmIvxjaFeC8OnhapcSLL8g7lHuerKBbzvT1eM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lRMcUywm2OQu5sJM1HWiku2jLm5MflI2NCmw1ySdqT3cUv0031TWY1IsC9bj+t+t0
	 Ml0ulb8Js3y2CAKrus9rjmmdNlb2l07QMpFA/P7MHOsMYzygqcABjPmnje21F8J04S
	 pqIyMIf4unMiy43Unndl+WMUkYV6lOtgdPfl808YdA8gHz7b3m8M4bLhReylAZnLqY
	 357WVMzA+k4ktFgaqGDFh/PCy3wWx/BE4p/scJ8OMibaNGkO2NTFoSBIyFfDXdVsMP
	 RGKqGtY05TrEYsNRL2AIwAearSLhBFu+e9vVA+TbMrugbQgtwuUbJTLvgc2Ay+cHB2
	 JHYAQWdsbPVqA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5DBEDA692;
	Tue,  3 Mar 2026 15:51:02 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Tue, 03 Mar 2026 16:50:52 +0100
Subject: [PATCH RESEND v2 2/5] powerpc: dts: mpc8315erdb: Use IRQ_TYPE_*
 macros
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
Message-Id: <20260303-mpc83xx-cleanup-v2-2-187d3a13effa@posteo.net>
References: <20260303-mpc83xx-cleanup-v2-0-187d3a13effa@posteo.net>
In-Reply-To: <20260303-mpc83xx-cleanup-v2-0-187d3a13effa@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772553061; l=9600;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=qJSNJfVmiDZG+g6KBxDQ/n/7zXxMj4agDbro7jKlVcE=;
 b=ymND2wyVgCEqPdnp5PV6jBJAmbFm1K5uc2E2cRilpYmgw5zbKr5w5LtSQdl4ifSycjvbHGqZi
 WdDv90KV8IvASykTqDUWih4mlWBga4cTSSRFTc4hCSybyNQ0JFROjjw
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 3CC361F2F7F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17592-lists,linuxppc-dev=lfdr.de,j.ne.posteo.net];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.ibm.com,ellerman.id.au,gmail.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:j.ne@posteo.net,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[j.ne@posteo.net];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

From: "J. Neuschäfer" <j.ne@posteo.net>

This increases readability, because "0x8" isn't very descriptive.

mpc8315erdb.dtb remains identical after this patch.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/mpc8315erdb.dts | 111 ++++++++++++++++++----------------
 1 file changed, 59 insertions(+), 52 deletions(-)

diff --git a/arch/powerpc/boot/dts/mpc8315erdb.dts b/arch/powerpc/boot/dts/mpc8315erdb.dts
index a8f68d6e50b0dd..1957b6687b2987 100644
--- a/arch/powerpc/boot/dts/mpc8315erdb.dts
+++ b/arch/powerpc/boot/dts/mpc8315erdb.dts
@@ -50,7 +50,7 @@ localbus@e0005000 {
 		#size-cells = <1>;
 		compatible = "fsl,mpc8315-elbc", "fsl,elbc", "simple-bus";
 		reg = <0xe0005000 0x1000>;
-		interrupts = <77 0x8>;
+		interrupts = <77 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&ipic>;
 
 		// CS0 and CS1 are swapped when
@@ -112,7 +112,7 @@ i2c@3000 {
 			cell-index = <0>;
 			compatible = "fsl-i2c";
 			reg = <0x3000 0x100>;
-			interrupts = <14 0x8>;
+			interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			dfsrr;
 			rtc@68 {
@@ -133,7 +133,7 @@ spi@7000 {
 			cell-index = <0>;
 			compatible = "fsl,spi";
 			reg = <0x7000 0x1000>;
-			interrupts = <16 0x8>;
+			interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			mode = "cpu";
 		};
@@ -145,35 +145,35 @@ dma@82a8 {
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
 
@@ -183,7 +183,7 @@ usb@23000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			interrupt-parent = <&ipic>;
-			interrupts = <38 0x8>;
+			interrupts = <38 IRQ_TYPE_LEVEL_LOW>;
 			phy_type = "utmi";
 		};
 
@@ -197,7 +197,9 @@ enet0: ethernet@24000 {
 			reg = <0x24000 0x1000>;
 			ranges = <0x0 0x24000 0x1000>;
 			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <32 0x8 33 0x8 34 0x8>;
+			interrupts = <32 IRQ_TYPE_LEVEL_LOW>,
+				     <33 IRQ_TYPE_LEVEL_LOW>,
+				     <34 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			tbi-handle = <&tbi0>;
 			phy-handle = < &phy0 >;
@@ -238,7 +240,9 @@ enet1: ethernet@25000 {
 			reg = <0x25000 0x1000>;
 			ranges = <0x0 0x25000 0x1000>;
 			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <35 0x8 36 0x8 37 0x8>;
+			interrupts = <35 IRQ_TYPE_LEVEL_LOW>,
+				     <36 IRQ_TYPE_LEVEL_LOW>,
+				     <37 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			tbi-handle = <&tbi1>;
 			phy-handle = < &phy1 >;
@@ -263,7 +267,7 @@ serial0: serial@4500 {
 			compatible = "fsl,ns16550", "ns16550";
 			reg = <0x4500 0x100>;
 			clock-frequency = <133333333>;
-			interrupts = <9 0x8>;
+			interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 		};
 
@@ -273,7 +277,7 @@ serial1: serial@4600 {
 			compatible = "fsl,ns16550", "ns16550";
 			reg = <0x4600 0x100>;
 			clock-frequency = <133333333>;
-			interrupts = <10 0x8>;
+			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 		};
 
@@ -282,7 +286,7 @@ crypto@30000 {
 				     "fsl,sec2.4", "fsl,sec2.2", "fsl,sec2.1",
 				     "fsl,sec2.0";
 			reg = <0x30000 0x10000>;
-			interrupts = <11 0x8>;
+			interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			fsl,num-channels = <4>;
 			fsl,channel-fifo-len = <24>;
@@ -294,7 +298,7 @@ sata@18000 {
 			compatible = "fsl,mpc8315-sata", "fsl,pq-sata";
 			reg = <0x18000 0x1000>;
 			cell-index = <1>;
-			interrupts = <44 0x8>;
+			interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 		};
 
@@ -302,14 +306,17 @@ sata@19000 {
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
@@ -317,16 +324,16 @@ gtm1: timer@500 {
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
@@ -340,14 +347,14 @@ ipic-msi@7c0 {
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
+			interrupts = <0x43 IRQ_TYPE_LEVEL_LOW
+				      0x4  IRQ_TYPE_LEVEL_LOW
+				      0x51 IRQ_TYPE_LEVEL_LOW
+				      0x52 IRQ_TYPE_LEVEL_LOW
+				      0x56 IRQ_TYPE_LEVEL_LOW
+				      0x57 IRQ_TYPE_LEVEL_LOW
+				      0x58 IRQ_TYPE_LEVEL_LOW
+				      0x59 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = < &ipic >;
 		};
 
@@ -355,7 +362,7 @@ pmc: power@b00 {
 			compatible = "fsl,mpc8315-pmc", "fsl,mpc8313-pmc",
 				     "fsl,mpc8349-pmc";
 			reg = <0xb00 0x100 0xa00 0x100>;
-			interrupts = <80 8>;
+			interrupts = <80 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			fsl,mpc8313-wakeup-timer = <&gtm1>;
 		};
@@ -374,24 +381,24 @@ pci0: pci@e0008500 {
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
@@ -417,10 +424,10 @@ pci1: pcie@e0009000 {
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
 
 		pcie@0 {
@@ -448,10 +455,10 @@ pci2: pcie@e000a000 {
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
 
 		pcie@0 {

-- 
2.51.0



