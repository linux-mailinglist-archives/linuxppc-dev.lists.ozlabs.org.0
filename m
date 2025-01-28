Return-Path: <linuxppc-dev+bounces-5653-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A88A214A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 23:58:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjLKd2Qk8z301Y;
	Wed, 29 Jan 2025 09:57:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738105077;
	cv=none; b=YXUhhjcN4MYJ7vQp7OFV2UrFP7DB4K4RsIT1KFUQ08rmqzUd5l39VtwrhwM4hgt/Xh9RGJ5yFQ04DI3mw9uCUGN4i0/uRmjXaoSKsWr2fDSJfAk/cA2jLing1rhgvtTzpnoxr9xw8kW5RnvFwMb4RKrLHHYYkx5gDwOPuC8OeUD2FKcatSdU4cDhuWjr0x5lXqSOCoid0I9fn2iEagtoJH47Ypma/47qKpEwhhOrmTV5Lfx/qCGfGcrJ8GFs2iFPHLTJsJlIWngdCkqCQPuaIdigW8dGbbKa9+0Ua1urpPbirxriUgxhiNrtiNRCtK+yDOK/bK4ZU8L4hYJ3lZrnww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738105077; c=relaxed/relaxed;
	bh=H9eZnwW/fvqaWRmFNTucmp4hE9Ft4IXcV2fJGjGX8CI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YX+HivjNB89Gyw23WCBpDVVtX51/BEkhm7RNAER1AtEnR5k4WV/aEjEDRi6UvYEuL1Un0eJ5jcGcd1RylGsf1BIsQB4LljfV04Jx1Mv9knUsvdOC3NOfV7qV1BEk1vkGIIrWql7HOJcOX5y5vR9Kwo+kb716/CvquF4bq0JXMwl6AWhjJ/btiwSXUDxybduXQp3tRIaPzD18Af03rmMIgZFAaZXXIMOdJcNGZhkScIClNawbMZTL8iqB0Kt1oBFb6vNV+z0xgMBRBhS5W9+jA6FLi96MbbOaymfmxTCzaWKN3wIS/9J5Pvi0LUpf7ykJHcVSrjgq9lm4HyDcykCLXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=lV98Muw7; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=lV98Muw7;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjLKc145xz2yhG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 09:57:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1738105067;
	bh=H9eZnwW/fvqaWRmFNTucmp4hE9Ft4IXcV2fJGjGX8CI=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=lV98Muw7TXHHoQnfi9eDXIUwqQV9xNmkf0MkToswGqVo7b7uwivAsRcC68KJR7SNF
	 dj/8Ug7vEgtNv4VMU91mNBqaMJ5uaGUb4M9jSI/eiUBDYJTK5kP9/m3B1toQG5XZpr
	 H5OHt90iNtFg8a6TPQN2tisZrBhbCIff03lM8zNJznkNArwVurX2HYzX95xBXtQNg1
	 XIykns06+z6fqD2CmiWv4DDFiu3DFetCVPA80sJRqzig/8bMAcgCgcHVVSCYVJzZK5
	 X3U2CeVrmRJbkUOJ6avG66kCnnGq6+NG/6ib3Rv4obeFf3MkZmlWA0ghUbOYL8fYg7
	 pM13zDkIuHGIw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4YjLKR2x88z4x2g; Wed, 29 Jan 2025 09:57:47 +1100 (AEDT)
Date: Wed, 29 Jan 2025 09:52:09 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/5] powerpc/microwatt: Device-tree updates
Message-ID: <Z5lfmZtfHD7t2IvK@thinks.paulus.ozlabs.org>
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
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
In-Reply-To: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
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
---
 arch/powerpc/boot/dts/microwatt.dts | 73 ++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/microwatt.dts
index 269e930b3b0b..6e575e841a7b 100644
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
+				isa = <2070>;
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


