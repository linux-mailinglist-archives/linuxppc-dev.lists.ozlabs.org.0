Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 765C410C899
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 13:20:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NxYy4pxMzDr0y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 23:20:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="kO0pFPX5"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NxT74dSczDqCZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 23:16:40 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47NxSz08lfz9tyK4;
 Thu, 28 Nov 2019 13:16:35 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=kO0pFPX5; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 3cE5LCkfSVGN; Thu, 28 Nov 2019 13:16:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47NxSy6D0Bz9tyJ9;
 Thu, 28 Nov 2019 13:16:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1574943394; bh=z1woTg6MEJ3fy0Mii159dsi5J82uSDdsZ8O152Iuous=;
 h=From:Subject:To:Cc:Date:From;
 b=kO0pFPX5Ga+VpaB+Xu7pr1Ne0NcIRQYB2XZEeOLmsWlTQK5fjBJP7vp8ZiAQkB8rc
 o/WVkeo1xdHQlOcSAYfTIIz8yTntK4iT8Y6LJoacyntLB7Mkr509OCR0KW6PLeCPL/
 MjCrV5moEQvK8eip6iPnkRU2Fa3XSE3gba2jfcsw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 21A848B889;
 Thu, 28 Nov 2019 13:16:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id f64NmaBkFnRc; Thu, 28 Nov 2019 13:16:36 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E3E2B8B87E;
 Thu, 28 Nov 2019 13:16:35 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BC2456B822; Thu, 28 Nov 2019 12:16:35 +0000 (UTC)
Message-Id: <7556683b57d8ce100855857f03d1cd3d2903d045.1574943062.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/devicetrees: Change 'gpios' to 'cs-gpios' on fsl, spi
 nodes
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mark Brown <broonie@kernel.org>
Date: Thu, 28 Nov 2019 12:16:35 +0000 (UTC)
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 0f0581b24bd0 ("spi: fsl: Convert to use CS GPIO
descriptors"), the prefered way to define chipselect GPIOs is using
'cs-gpios' property instead of the legacy 'gpios' property.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 Documentation/devicetree/bindings/spi/fsl-spi.txt | 8 ++++----
 arch/powerpc/boot/dts/mgcoge.dts                  | 2 +-
 arch/powerpc/boot/dts/mpc832x_rdb.dts             | 2 +-
 arch/powerpc/boot/dts/mpc8610_hpcd.dts            | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/fsl-spi.txt b/Documentation/devicetree/bindings/spi/fsl-spi.txt
index 411375eac54d..0654380eb751 100644
--- a/Documentation/devicetree/bindings/spi/fsl-spi.txt
+++ b/Documentation/devicetree/bindings/spi/fsl-spi.txt
@@ -15,13 +15,13 @@ Required properties:
 - clock-frequency : input clock frequency to non FSL_SOC cores
 
 Optional properties:
-- gpios : specifies the gpio pins to be used for chipselects.
+- cs-gpios : specifies the gpio pins to be used for chipselects.
   The gpios will be referred to as reg = <index> in the SPI child nodes.
   If unspecified, a single SPI device without a chip select can be used.
 - fsl,spisel_boot : for the MPC8306 and MPC8309, specifies that the
   SPISEL_BOOT signal is used as chip select for a slave device. Use
   reg = <number of gpios> in the corresponding child node, i.e. 0 if
-  the gpios property is not present.
+  the cs-gpios property is not present.
 
 Example:
 	spi@4c0 {
@@ -31,8 +31,8 @@ Example:
 		interrupts = <82 0>;
 		interrupt-parent = <700>;
 		mode = "cpu";
-		gpios = <&gpio 18 1	// device reg=<0>
-			 &gpio 19 1>;	// device reg=<1>
+		cs-gpios = <&gpio 18 1		// device reg=<0>
+			    &gpio 19 1>;	// device reg=<1>
 	};
 
 
diff --git a/arch/powerpc/boot/dts/mgcoge.dts b/arch/powerpc/boot/dts/mgcoge.dts
index a2dd5f1da621..7de068991bde 100644
--- a/arch/powerpc/boot/dts/mgcoge.dts
+++ b/arch/powerpc/boot/dts/mgcoge.dts
@@ -224,7 +224,7 @@
 				reg = <0x11a80 0x40 0x89fc 0x2>;
 				interrupts = <2 8>;
 				interrupt-parent = <&PIC>;
-				gpios = < &cpm2_pio_d 19 0>;
+				cs-gpios = < &cpm2_pio_d 19 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				ds3106@1 {
diff --git a/arch/powerpc/boot/dts/mpc832x_rdb.dts b/arch/powerpc/boot/dts/mpc832x_rdb.dts
index b6257186528e..ecebc27a2898 100644
--- a/arch/powerpc/boot/dts/mpc832x_rdb.dts
+++ b/arch/powerpc/boot/dts/mpc832x_rdb.dts
@@ -249,7 +249,7 @@
 			reg = <0x4c0 0x40>;
 			interrupts = <2>;
 			interrupt-parent = <&qeic>;
-			gpios = <&qe_pio_d 13 0>;
+			cs-gpios = <&qe_pio_d 13 0>;
 			mode = "cpu-qe";
 
 			mmc-slot@0 {
diff --git a/arch/powerpc/boot/dts/mpc8610_hpcd.dts b/arch/powerpc/boot/dts/mpc8610_hpcd.dts
index 1a8321ac105a..33bbe58c1ad0 100644
--- a/arch/powerpc/boot/dts/mpc8610_hpcd.dts
+++ b/arch/powerpc/boot/dts/mpc8610_hpcd.dts
@@ -200,7 +200,7 @@
 			interrupts = <59 2>;
 			interrupt-parent = <&mpic>;
 			mode = "cpu";
-			gpios = <&sdcsr_pio 7 0>;
+			cs-gpios = <&sdcsr_pio 7 0>;
 			sleep = <&pmc 0x00000800 0>;
 
 			mmc-slot@0 {
-- 
2.13.3

