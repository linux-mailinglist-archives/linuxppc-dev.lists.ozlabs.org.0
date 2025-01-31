Return-Path: <linuxppc-dev+bounces-5734-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E7DA2398C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 07:30:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkmGm66Xxz2ywS;
	Fri, 31 Jan 2025 17:30:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738305024;
	cv=none; b=kxSMMQmCDDB4+Fu/cjkLeFTNI+HHsX6yC2JqgBJgQ+y4C2ryLl6Cfu46n56dBH/dVx5FVb6Xziwmjt24jmfP8Vz24Jsnmr9AdQ8YBGQz+/9mDLyAOclJjPqIVjTEwv0jEI6M4xKTq2ZSpAGl84nylZ31q9kMXCtBM49/J3gFh72RbkA0GUzahu+hbKzpBbWoVJAa5gxQB8NwlsWuwyg+mJ4PdmCjZwZPfE3loBskZa8Y5ObehuFyjIaRZZRXAe/m12/ZtPuhYqDC/MI7+YP4zGfWGnjWIbBfRwP09OYUWKY6V/7WVG9w5n7A1XSLuf7Ts9wy5TkSxFcCjx0F+MG1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738305024; c=relaxed/relaxed;
	bh=/mpIwX678fPgIiopsIo5Zu/sr3xC+E5RKWOUKEybHis=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bw2s68Uhl+dfPR+4IfOZIlb9ysydRl7P/yHQbYoc/aKo3paiORNa5FUIA/d/6w8rbo3XeYneSIe5D0ZlqrlS5M7pVKdxz/9spV2qNOeFi8wHqPP1E2gRqBDkQ5SNIUd3y609DpbPJ9dJSUavS/6R9ked6pzG6n4SdSYKZN5zbyA8+b26eiFeKiAOb/+3gpfDZo7vloOltxCrP6gu1CrCleRg9Goxf54UASK4f4zBqPB6WfHltOdoKn5N9u7RLyHBMypb4lf8Lim3sYWI2blJJk/CaD+e9HNbB0VVX+mqjPU9wNwctRtB0xTudSxqnfP0tfCsXIll0l2V95zfVRZ0PA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=KPFPKVUn; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=KPFPKVUn;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YkmGl02TJz30VV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 17:30:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1738305012;
	bh=/mpIwX678fPgIiopsIo5Zu/sr3xC+E5RKWOUKEybHis=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=KPFPKVUnYXMJRILvfcsD/acjnQAiW+dOx7EVfWjl5QRu82Msx1X/9V7qY6hbxUCTX
	 xqXj5EaiIURcz2R5BmGCdAeISRIEq11G0ibjRCTy2RVEJhsv7k3PUO5A2zHes9BxlU
	 5ESpzTOtYUcvguQAKJ4EpSnMUACVEPb/L4Gbnk7NYUHvvkTcnQCw+OdOeSSzDigL9D
	 NlfGSg5aOq7bMcDSdp4TvIzM2imJtUr9fS/E6F0FAufod7S1VhUiCznk5jFZcra1v4
	 0OE3WEqkzM7ZSn/aci3GdzHCiG6unQNccIz7GMPRK5llB1Q2RKYo5rZfn944yJMS1y
	 bCHDD13OaA2cA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4YkmGX1wQ7z4x6n; Fri, 31 Jan 2025 17:30:12 +1100 (AEDT)
Date: Fri, 31 Jan 2025 17:28:04 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/5] powerpc/microwatt: Device-tree updates
Message-ID: <Z5xtdGSacrWz7swi@thinks.paulus.ozlabs.org>
References: <Z5xtIVa0y7lTDTU3@thinks.paulus.ozlabs.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5xtIVa0y7lTDTU3@thinks.paulus.ozlabs.org>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Microwatt now implements ISA v3.1 (SFFS compliancy subset), including
prefixed instructions, scv/rfscv, and the FSCR, HFSCR, TAR, and CTRL
registers.  The privileged mode of operation is now hypervisor mode
and there is no privileged non-hypervisor mode; the MSR[HV] bit is
forced to 1.

Besides updating the ibm,powerpc-cpu-features property to reflect the
above, this also makes the following changes relating to peripheral
devices:

- Add gpio controller.
- Remove high-speed property from SD controller, for the case where
  the interface is connected through 200 ohm protection resisters.
- Put an alias for the ethernet in /chosen.

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
Acked-by: Nicholas Piggin <npiggin@gmail.com>
---
v2: scv node specifies ISA v3.0

 arch/powerpc/boot/dts/microwatt.dts | 73 ++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/microwatt.dts
index 269e930b3b0b..833d22822189 100644
--- a/arch/powerpc/boot/dts/microwatt.dts
+++ b/arch/powerpc/boot/dts/microwatt.dts
@@ -1,4 +1,5 @@
 /dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	#size-cells = <0x02>;
@@ -8,6 +9,7 @@ / {
 
 	aliases {
 		serial0 = &UART0;
+		ethernet = &enet0;
 	};
 
 	reserved-memory {
@@ -35,40 +37,79 @@ cpus {
 
 		ibm,powerpc-cpu-features {
 			display-name = "Microwatt";
-			isa = <3000>;
+			isa = <3010>;
 			device_type = "cpu-features";
 			compatible = "ibm,powerpc-cpu-features";
 
 			mmu-radix {
 				isa = <3000>;
-				usable-privilege = <2>;
+				usable-privilege = <6>;
+				os-support = <0>;
 			};
 
 			little-endian {
-				isa = <2050>;
-				usable-privilege = <3>;
+				isa = <0>;
+				usable-privilege = <7>;
+				os-support = <0>;
 				hwcap-bit-nr = <1>;
 			};
 
 			cache-inhibited-large-page {
-				isa = <2040>;
-				usable-privilege = <2>;
+				isa = <0>;
+				usable-privilege = <6>;
+				os-support = <0>;
 			};
 
 			fixed-point-v3 {
 				isa = <3000>;
-				usable-privilege = <3>;
+				usable-privilege = <7>;
 			};
 
 			no-execute {
-				isa = <2010>;
+				isa = <0x00>;
 				usable-privilege = <2>;
+				os-support = <0>;
 			};
 
 			floating-point {
+				hfscr-bit-nr = <0>;
 				hwcap-bit-nr = <27>;
 				isa = <0>;
-				usable-privilege = <3>;
+				usable-privilege = <7>;
+				hv-support = <1>;
+				os-support = <0>;
+			};
+
+			prefixed-instructions {
+				hfscr-bit-nr = <13>;
+				fscr-bit-nr = <13>;
+				isa = <3010>;
+				usable-privilege = <7>;
+				os-support = <1>;
+				hv-support = <1>;
+			};
+
+			tar {
+				hfscr-bit-nr = <8>;
+				fscr-bit-nr = <8>;
+				isa = <2070>;
+				usable-privilege = <7>;
+				os-support = <1>;
+				hv-support = <1>;
+				hwcap-bit-nr = <58>;
+			};
+
+			control-register {
+				isa = <0>;
+				usable-privilege = <7>;
+			};
+
+			system-call-vectored {
+				isa = <3000>;
+				usable-privilege = <7>;
+				os-support = <1>;
+				fscr-bit-nr = <12>;
+				hwcap-bit-nr = <52>;
 			};
 		};
 
@@ -138,7 +179,18 @@ UART0: serial@2000 {
 			interrupts = <0x10 0x1>;
 		};
 
-		ethernet@8020000 {
+		gpio: gpio@7000 {
+			device_type = "gpio";
+			compatible = "faraday,ftgpio010";
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x7000 0x80>;
+			interrupts = <0x14 1>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		enet0: ethernet@8020000 {
 			compatible = "litex,liteeth";
 			reg = <0x8021000 0x100
 				0x8020800 0x100
@@ -160,7 +212,6 @@ mmc@8040000 {
 			reg-names = "phy", "core", "reader", "writer", "irq";
 			bus-width = <4>;
 			interrupts = <0x13 1>;
-			cap-sd-highspeed;
 			clocks = <&sys_clk>;
 		};
 	};
-- 
2.47.1



