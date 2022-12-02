Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36756640B6C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 17:57:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNzd50Rlkz3fBT
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Dec 2022 03:57:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=195.130.132.48; helo=cantor.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
X-Greylist: delayed 367 seconds by postgrey-1.36 at boromir; Sat, 03 Dec 2022 03:56:14 AEDT
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNzby3j68z3bfJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Dec 2022 03:56:14 +1100 (AEDT)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4NNzSw0S21z4x915
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 17:50:08 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2d07:19c5:4d8b:89d9])
	by laurent.telenet-ops.be with bizsmtp
	id rUpW2800G0ys3B701UpWDW; Fri, 02 Dec 2022 17:49:59 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1p19E9-002K67-IM; Fri, 02 Dec 2022 17:49:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1p19E8-006WbA-HQ; Fri, 02 Dec 2022 17:49:28 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	UNGLinuxDriver@microchip.com,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 11/11] powerpc: dts: fsl: Fix pca954x i2c-mux node names
Date: Fri,  2 Dec 2022 17:49:26 +0100
Message-Id: <6c5d86c49ac170e9d56ab121ea0602f3873849ca.1669999298.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669999298.git.geert+renesas@glider.be>
References: <cover.1669999298.git.geert+renesas@glider.be>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"make dtbs_check":

    arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: pca9546@77: $nodename:0: 'pca9546@77' does not match '^(i2c-?)?mux'
           From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
    arch/powerpc/boot/dts/fsl/t1024qds.dtb: pca9547@77: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@2', 'i2c@3' were unexpected)
           From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
    ...

Fix this by renaming pca954x nodes to "i2c-mux", to match the I2C bus
multiplexer/switch DT bindings and the Generic Names Recommendation in
the Devicetree Specification.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/powerpc/boot/dts/fsl/t1024qds.dts  | 2 +-
 arch/powerpc/boot/dts/fsl/t1024rdb.dts  | 2 +-
 arch/powerpc/boot/dts/fsl/t104xqds.dtsi | 2 +-
 arch/powerpc/boot/dts/fsl/t104xrdb.dtsi | 2 +-
 arch/powerpc/boot/dts/fsl/t208xqds.dtsi | 2 +-
 arch/powerpc/boot/dts/fsl/t208xrdb.dtsi | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/t1024qds.dts b/arch/powerpc/boot/dts/fsl/t1024qds.dts
index d6858b7cd93fb5d5..9ea7942f914e14ee 100644
--- a/arch/powerpc/boot/dts/fsl/t1024qds.dts
+++ b/arch/powerpc/boot/dts/fsl/t1024qds.dts
@@ -151,7 +151,7 @@ slic@3 {
 		};
 
 		i2c@118000 {
-			pca9547@77 {
+			i2c-mux@77 {
 				compatible = "nxp,pca9547";
 				reg = <0x77>;
 				#address-cells = <1>;
diff --git a/arch/powerpc/boot/dts/fsl/t1024rdb.dts b/arch/powerpc/boot/dts/fsl/t1024rdb.dts
index dbcd31cc35dcd2bb..270aaf631f2ab0fa 100644
--- a/arch/powerpc/boot/dts/fsl/t1024rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1024rdb.dts
@@ -165,7 +165,7 @@ rtc@68 {
 		};
 
 		i2c@118100 {
-			pca9546@77 {
+			i2c-mux@77 {
 				compatible = "nxp,pca9546";
 				reg = <0x77>;
 				#address-cells = <1>;
diff --git a/arch/powerpc/boot/dts/fsl/t104xqds.dtsi b/arch/powerpc/boot/dts/fsl/t104xqds.dtsi
index 615479732252404f..1c329f076f64f2dc 100644
--- a/arch/powerpc/boot/dts/fsl/t104xqds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t104xqds.dtsi
@@ -268,7 +268,7 @@ flash@0 {
 		};
 
 		i2c@118000 {
-			pca9547@77 {
+			i2c-mux@77 {
 				compatible = "nxp,pca9547";
 				reg = <0x77>;
 			};
diff --git a/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi b/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
index bfe1ed5be337492e..fc7bec5dcb90fc2d 100644
--- a/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
@@ -128,7 +128,7 @@ adt7461@4c {
 		};
 
 		i2c@118100 {
-			pca9546@77 {
+			i2c-mux@77 {
 				compatible = "nxp,pca9546";
 				reg = <0x77>;
 				#address-cells = <1>;
diff --git a/arch/powerpc/boot/dts/fsl/t208xqds.dtsi b/arch/powerpc/boot/dts/fsl/t208xqds.dtsi
index db4139999b28ebf4..962c99941645b965 100644
--- a/arch/powerpc/boot/dts/fsl/t208xqds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t208xqds.dtsi
@@ -135,7 +135,7 @@ flash@2 {
 		};
 
 		i2c@118000 {
-			pca9547@77 {
+			i2c-mux@77 {
 				compatible = "nxp,pca9547";
 				reg = <0x77>;
 				#address-cells = <1>;
diff --git a/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi b/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi
index ff87e67c70da4a29..ecc3e8c7394cad20 100644
--- a/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi
@@ -138,7 +138,7 @@ eeprom@50 {
 		};
 
 		i2c@118100 {
-			pca9546@77 {
+			i2c-mux@77 {
 				compatible = "nxp,pca9546";
 				reg = <0x77>;
 			};
-- 
2.25.1

