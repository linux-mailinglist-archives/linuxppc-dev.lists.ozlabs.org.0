Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EBB640B95
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 18:02:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNzkj5JFSz3fCT
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Dec 2022 04:02:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=195.130.137.81; helo=weierstrass.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
X-Greylist: delayed 373 seconds by postgrey-1.36 at boromir; Sat, 03 Dec 2022 03:56:23 AEDT
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNzc72dDsz3bfj
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Dec 2022 03:56:23 +1100 (AEDT)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4NNzT81SxCz4x7kB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 17:50:20 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2d07:19c5:4d8b:89d9])
	by laurent.telenet-ops.be with bizsmtp
	id rUpW280020ys3B701UpWD9; Fri, 02 Dec 2022 17:49:59 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1p19E8-002K5v-QG; Fri, 02 Dec 2022 17:49:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1p19E8-006Wa8-9B; Fri, 02 Dec 2022 17:49:28 +0100
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
Subject: [PATCH 02/11] ARM: dts: aspeed: Fix pca954x i2c-mux node names
Date: Fri,  2 Dec 2022 17:49:17 +0100
Message-Id: <8eae1e3aceba5ed15fe554c6805436c48d8a4f4e.1669999298.git.geert+renesas@glider.be>
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

    arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dtb: i2c-switch@70: $nodename:0: 'i2c-switch@70' does not match '^(i2c-?)?mux'
	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
    arm/boot/dts/aspeed-bmc-bytedance-g220a.dtb: i2c-switch@70: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
    ...

Fix this by renaming PCA954x nodes to "i2c-mux", to match the I2C bus
multiplexer/switch DT bindings and the Generic Names Recommendation in
the Devicetree Specification.

Note that a few nodes are moved, to preserve sort order.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../boot/dts/aspeed-bmc-bytedance-g220a.dts   | 18 ++++----
 .../dts/aspeed-bmc-facebook-cloudripper.dts   | 10 ++--
 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts | 46 +++++++++----------
 .../boot/dts/aspeed-bmc-facebook-elbert.dts   |  4 +-
 .../arm/boot/dts/aspeed-bmc-facebook-fuji.dts | 30 ++++++------
 .../boot/dts/aspeed-bmc-facebook-minipack.dts | 32 ++++++-------
 .../dts/aspeed-bmc-facebook-tiogapass.dts     |  8 ++--
 .../boot/dts/aspeed-bmc-facebook-wedge100.dts |  2 +-
 .../boot/dts/aspeed-bmc-facebook-wedge400.dts |  6 +--
 .../arm/boot/dts/aspeed-bmc-facebook-yamp.dts |  2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts  | 18 ++++----
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  |  8 ++--
 .../boot/dts/aspeed-bmc-inspur-fp5280g2.dts   |  4 +-
 .../boot/dts/aspeed-bmc-inspur-nf5280m6.dts   | 12 ++---
 .../dts/aspeed-bmc-inventec-transformers.dts  |  6 +--
 arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts |  4 +-
 .../boot/dts/aspeed-bmc-lenovo-hr855xg2.dts   |  4 +-
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts    |  4 +-
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts  |  6 +--
 arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts   | 10 ++--
 arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts  | 14 +++---
 arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts  | 10 ++--
 arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts  | 14 +++---
 23 files changed, 136 insertions(+), 136 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
index f75cad41ae6f644b..3f03a198a1a8fcd4 100644
--- a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
@@ -424,7 +424,7 @@ &i2c2 {
 
 &i2c3 {
 	status = "okay";
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
 		#address-cells = <1>;
@@ -471,7 +471,7 @@ &i2c5 {
 
 &i2c6 {
 	status = "okay";
-	i2c-switch@72 {
+	i2c-mux@72 {
 		compatible = "nxp,pca9548";
 		reg = <0x72>;
 		#address-cells = <1>;
@@ -524,7 +524,7 @@ channel_6_7: i2c@7 {
 		};
 	};
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
 		#address-cells = <1>;
@@ -533,7 +533,7 @@ channel_6_8: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
-			i2c-switch@71 {
+			i2c-mux@71 {
 				compatible = "nxp,pca9546";
 				reg = <0x71>;
 				#address-cells = <1>;
@@ -569,7 +569,7 @@ channel_6_9: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
-			i2c-switch@71 {
+			i2c-mux@71 {
 				compatible = "nxp,pca9546";
 				reg = <0x71>;
 				#address-cells = <1>;
@@ -605,7 +605,7 @@ channel_6_10: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
-			i2c-switch@71 {
+			i2c-mux@71 {
 				compatible = "nxp,pca9546";
 				reg = <0x71>;
 				#address-cells = <1>;
@@ -640,7 +640,7 @@ channel_6_11: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
-			i2c-switch@71 {
+			i2c-mux@71 {
 				compatible = "nxp,pca9546";
 				reg = <0x71>;
 				#address-cells = <1>;
@@ -808,7 +808,7 @@ &i2c9 {
 
 &i2c10 {
 	status = "okay";
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
 		#address-cells = <1>;
@@ -838,7 +838,7 @@ channel_10_3: i2c@3 {
 		};
 	};
 
-	i2c-switch@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9546";
 		reg = <0x71>;
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts
index 5cd060029ea97914..d49328fa487a013e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts
@@ -132,7 +132,7 @@ &i2c1 {
 	 * PCA9548 (1-0070) provides 8 channels connecting to SMB (Switch
 	 * Main Board).
 	 */
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -194,7 +194,7 @@ &i2c2 {
 	 * PCA9548 (2-0070) provides 8 channels connecting to SCM (System
 	 * Controller Module).
 	 */
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -256,7 +256,7 @@ &i2c3 {
 	 * PCA9548 (3-0070) provides 8 channels connecting to SMB (Switch
 	 * Main Board).
 	 */
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -423,7 +423,7 @@ &i2c8 {
 	 * PCA9548 (8-0070) provides 8 channels connecting to PDB (Power
 	 * Delivery Board).
 	 */
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -486,7 +486,7 @@ &i2c15 {
 	 * PCA9548 (15-0076) provides 8 channels connecting to FCM (Fan
 	 * Controller Module).
 	 */
-	i2c-switch@76 {
+	i2c-mux@76 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
index 90a3f485c67a9895..24153868cc004023 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
@@ -328,7 +328,7 @@ &i2c0 {
 &i2c1 {
 	status = "okay";
 
-	i2c-switch@77 {
+	i2c-mux@77 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -341,7 +341,7 @@ imux16: i2c@0 {
 			#size-cells = <0>;
 			reg = <0>;
 
-			i2c-switch@70 {
+			i2c-mux@70 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -390,7 +390,7 @@ imux111: i2c@7 {
 				};
 			};
 
-			i2c-switch@73 {
+			i2c-mux@73 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -446,7 +446,7 @@ imux17: i2c@1 {
 			#size-cells = <0>;
 			reg = <1>;
 
-			i2c-switch@70 {
+			i2c-mux@70 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -495,7 +495,7 @@ imux127: i2c@7 {
 				};
 			};
 
-			i2c-switch@73 {
+			i2c-mux@73 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -551,7 +551,7 @@ imux18: i2c@2 {
 			#size-cells = <0>;
 			reg = <2>;
 
-			i2c-switch@70 {
+			i2c-mux@70 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -600,7 +600,7 @@ imux47: i2c@7 {
 				};
 			};
 
-			i2c-switch@73 {
+			i2c-mux@73 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -656,7 +656,7 @@ imux19: i2c@3 {
 			#size-cells = <0>;
 			reg = <3>;
 
-			i2c-switch@70 {
+			i2c-mux@70 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -705,7 +705,7 @@ imux63: i2c@7 {
 				};
 			};
 
-			i2c-switch@73 {
+			i2c-mux@73 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -761,7 +761,7 @@ imux20: i2c@4 {
 			#size-cells = <0>;
 			reg = <4>;
 
-			i2c-switch@70 {
+			i2c-mux@70 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -810,7 +810,7 @@ imux79: i2c@7 {
 				};
 			};
 
-			i2c-switch@73 {
+			i2c-mux@73 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -866,7 +866,7 @@ imux21: i2c@5 {
 			#size-cells = <0>;
 			reg = <5>;
 
-			i2c-switch@70 {
+			i2c-mux@70 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -915,7 +915,7 @@ imux95: i2c@7 {
 				};
 			};
 
-			i2c-switch@73 {
+			i2c-mux@73 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -971,7 +971,7 @@ imux22: i2c@6 {
 			#size-cells = <0>;
 			reg = <6>;
 
-			i2c-switch@70 {
+			i2c-mux@70 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1020,7 +1020,7 @@ imux143: i2c@7 {
 				};
 			};
 
-			i2c-switch@73 {
+			i2c-mux@73 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1076,7 +1076,7 @@ imux23: i2c@7 {
 			#size-cells = <0>;
 			reg = <7>;
 
-			i2c-switch@70 {
+			i2c-mux@70 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1125,7 +1125,7 @@ imux159: i2c@7 {
 				};
 			};
 
-			i2c-switch@73 {
+			i2c-mux@73 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1183,7 +1183,7 @@ imux167: i2c@7 {
 &i2c2 {
 	status = "okay";
 
-	i2c-switch@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -1281,7 +1281,7 @@ &i2c7 {
 &i2c8 {
 	status = "okay";
 
-	i2c-switch@77 {
+	i2c-mux@77 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -1294,7 +1294,7 @@ imux32: i2c@0 {
 			#size-cells = <0>;
 			reg = <0>;
 
-			i2c-switch@70 {
+			i2c-mux@70 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1350,7 +1350,7 @@ imux33: i2c@1 {
 			#size-cells = <0>;
 			reg = <1>;
 
-			i2c-switch@70 {
+			i2c-mux@70 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1406,7 +1406,7 @@ imux34: i2c@2 {
 			#size-cells = <0>;
 			reg = <2>;
 
-			i2c-switch@70 {
+			i2c-mux@70 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1462,7 +1462,7 @@ imux35: i2c@3 {
 			#size-cells = <0>;
 			reg = <3>;
 
-			i2c-switch@70 {
+			i2c-mux@70 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
index b5cd4c7800b05928..74f3c67e0effae9d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
@@ -65,7 +65,7 @@ &kcs3 {
 };
 
 &i2c2 {
-	i2c-switch@75 {
+	i2c-mux@75 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -123,7 +123,7 @@ imux23: i2c@7 {
 };
 
 &i2c5 {
-	i2c-switch@75 {
+	i2c-mux@75 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
index 6b319f34a9b98c7f..f23c26a3441d13ab 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
@@ -233,7 +233,7 @@ &i2c2 {
 	 * PCA9548 (2-0070) provides 8 channels connecting to SCM (System
 	 * Controller Module).
 	 */
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -303,7 +303,7 @@ &i2c8 {
 	 * PCA9548 (8-0070) provides 8 channels connecting to SMB (Switch
 	 * Main Board).
 	 */
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -315,7 +315,7 @@ imux24: i2c@0 {
 			#size-cells = <0>;
 			reg = <0>;
 
-			i2c-switch@71 {
+			i2c-mux@71 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -481,7 +481,7 @@ imux25: i2c@1 {
 			#size-cells = <0>;
 			reg = <1>;
 
-			i2c-switch@72 {
+			i2c-mux@72 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -544,7 +544,7 @@ imux26: i2c@2 {
 			#size-cells = <0>;
 			reg = <2>;
 
-			i2c-switch@76 {
+			i2c-mux@76 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -615,7 +615,7 @@ imux27: i2c@3 {
 			#size-cells = <0>;
 			reg = <3>;
 
-			i2c-switch@76 {
+			i2c-mux@76 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -715,7 +715,7 @@ &i2c11 {
 	 * PCA9548 (11-0077) provides 8 channels connecting to SMB (Switch
 	 * Main Board).
 	 */
-	i2c-switch@77 {
+	i2c-mux@77 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -727,7 +727,7 @@ imux40: i2c@0 {
 			#size-cells = <0>;
 			reg = <0>;
 
-			i2c-switch@76 {
+			i2c-mux@76 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -790,7 +790,7 @@ imux41: i2c@1 {
 			#size-cells = <0>;
 			reg = <1>;
 
-			i2c-switch@76 {
+			i2c-mux@76 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -853,7 +853,7 @@ imux42: i2c@2 {
 			#size-cells = <0>;
 			reg = <2>;
 
-			i2c-switch@76 {
+			i2c-mux@76 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -916,7 +916,7 @@ imux43: i2c@3 {
 			#size-cells = <0>;
 			reg = <3>;
 
-			i2c-switch@76 {
+			i2c-mux@76 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -979,7 +979,7 @@ imux44: i2c@4 {
 			#size-cells = <0>;
 			reg = <4>;
 
-			i2c-switch@76 {
+			i2c-mux@76 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1042,7 +1042,7 @@ imux45: i2c@5 {
 			#size-cells = <0>;
 			reg = <5>;
 
-			i2c-switch@76 {
+			i2c-mux@76 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1105,7 +1105,7 @@ imux46: i2c@6 {
 			#size-cells = <0>;
 			reg = <6>;
 
-			i2c-switch@76 {
+			i2c-mux@76 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1168,7 +1168,7 @@ imux47: i2c@7 {
 			#size-cells = <0>;
 			reg = <7>;
 
-			i2c-switch@76 {
+			i2c-mux@76 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts
index 230d16cd99672796..aafd1042b6e53066 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts
@@ -344,7 +344,7 @@ &i2c2 {
 	 * I2C Switch 2-0070 is connecting to SCM (System Controller
 	 * Module).
 	 */
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -425,7 +425,7 @@ &i2c7 {
 &i2c8 {
 	status = "okay";
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -441,7 +441,7 @@ imux24: i2c@0 {
 			#size-cells = <0>;
 			reg = <0>;
 
-			i2c-switch@71 {
+			i2c-mux@71 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -507,7 +507,7 @@ imux25: i2c@1 {
 			#size-cells = <0>;
 			reg = <1>;
 
-			i2c-switch@72 {
+			i2c-mux@72 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -573,7 +573,7 @@ imux26: i2c@2 {
 			#size-cells = <0>;
 			reg = <2>;
 
-			i2c-switch@76 {
+			i2c-mux@76 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -639,7 +639,7 @@ imux27: i2c@3 {
 			#size-cells = <0>;
 			reg = <3>;
 
-			i2c-switch@76 {
+			i2c-mux@76 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -729,7 +729,7 @@ &i2c9 {
 	 * I2C Switch 9-0070 is connecting to MAC/PHY EEPROMs on SMB
 	 * (Switch Main Board).
 	 */
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -793,7 +793,7 @@ &i2c10 {
 &i2c11 {
 	status = "okay";
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -809,7 +809,7 @@ imux40: i2c@0 {
 			#size-cells = <0>;
 			reg = <0>;
 
-			i2c-switch@73 {
+			i2c-mux@73 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -875,7 +875,7 @@ imux41: i2c@1 {
 			#size-cells = <0>;
 			reg = <1>;
 
-			i2c-switch@73 {
+			i2c-mux@73 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -941,7 +941,7 @@ imux42: i2c@2 {
 			#size-cells = <0>;
 			reg = <2>;
 
-			i2c-switch@73 {
+			i2c-mux@73 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1007,7 +1007,7 @@ imux43: i2c@3 {
 			#size-cells = <0>;
 			reg = <3>;
 
-			i2c-switch@73 {
+			i2c-mux@73 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1073,7 +1073,7 @@ imux44: i2c@4 {
 			#size-cells = <0>;
 			reg = <4>;
 
-			i2c-switch@73 {
+			i2c-mux@73 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1139,7 +1139,7 @@ imux45: i2c@5 {
 			#size-cells = <0>;
 			reg = <5>;
 
-			i2c-switch@73 {
+			i2c-mux@73 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1205,7 +1205,7 @@ imux46: i2c@6 {
 			#size-cells = <0>;
 			reg = <6>;
 
-			i2c-switch@73 {
+			i2c-mux@73 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1271,7 +1271,7 @@ imux47: i2c@7 {
 			#size-cells = <0>;
 			reg = <7>;
 
-			i2c-switch@73 {
+			i2c-mux@73 {
 				compatible = "nxp,pca9548";
 				#address-cells = <1>;
 				#size-cells = <0>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
index b6b16356f571a2e9..704ee684e0fb408b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
@@ -211,7 +211,7 @@ &i2c0 {
 &i2c1 {
 	status = "okay";
 	//X24 Riser
-	i2c-switch@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9544";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -243,7 +243,7 @@ eeprom@50 {
 				pagesize = <32>;
 			};
 
-			i2c-switch@73 {
+			i2c-mux@73 {
 				compatible = "nxp,pca9546";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -303,7 +303,7 @@ eeprom@50 {
 				pagesize = <32>;
 			};
 
-			i2c-switch@73 {
+			i2c-mux@73 {
 				compatible = "nxp,pca9546";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -363,7 +363,7 @@ eeprom@50 {
 				pagesize = <32>;
 			};
 
-			i2c-switch@73 {
+			i2c-mux@73 {
 				compatible = "nxp,pca9546";
 				#address-cells = <1>;
 				#size-cells = <0>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts
index 584efa5284500763..97cd11c3d9a52458 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts
@@ -44,7 +44,7 @@ flash1@0 {
 };
 
 &i2c7 {
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
index ed305948386f220d..d1a1e8cf2028fd07 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
@@ -138,7 +138,7 @@ &i2c1 {
 &i2c2 {
 	status = "okay";
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -218,7 +218,7 @@ &i2c7 {
 &i2c8 {
 	status = "okay";
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -287,7 +287,7 @@ &i2c10 {
 &i2c11 {
 	status = "okay";
 
-	i2c-switch@76 {
+	i2c-mux@76 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts
index 5e6105874217100e..98fe0d6c8188cd6e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts
@@ -57,7 +57,7 @@ &i2c1 {
 &i2c2 {
 	status = "okay";
 
-	i2c-switch@75 {
+	i2c-mux@75 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 1448ea895be439fd..17e6424c7c8695e3 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -394,7 +394,7 @@ pca2: pca9552@65 {
 			"expander-cable-card5";
 	};
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
 		#address-cells = <1>;
@@ -539,7 +539,7 @@ pca3: pca9552@66 {
 			"expander-cable-card11";
 	};
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
 		#address-cells = <1>;
@@ -696,7 +696,7 @@ led@1 {
 &i2c6 {
 	status = "okay";
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
 		#address-cells = <1>;
@@ -1787,7 +1787,7 @@ eeprom@50 {
 		reg = <0x50>;
 	};
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
 		#address-cells = <1>;
@@ -1923,7 +1923,7 @@ ibm-panel@62 {
 		reg = <(0x62 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
 		#address-cells = <1>;
@@ -2182,7 +2182,7 @@ pca0: pca9552@61 {
 		};
 	};
 
-	i2c-switch@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9546";
 		reg = <0x71>;
 		#address-cells = <1>;
@@ -2235,7 +2235,7 @@ eeprom@50 {
 &i2c15 {
 	status = "okay";
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
 		#address-cells = <1>;
@@ -2287,7 +2287,7 @@ eeprom@53 {
 		};
 	};
 
-	i2c-switch@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9546";
 		reg = <0x71>;
 		#address-cells = <1>;
@@ -2339,7 +2339,7 @@ eeprom@53 {
 		};
 	};
 
-	i2c-switch@72 {
+	i2c-mux@72 {
 		compatible = "nxp,pca9546";
 		reg = <0x72>;
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 20ef958698ec772a..c6ce573f4b26f1a1 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -1017,7 +1017,7 @@ tmp275@4a {
 		reg = <0x4a>;
 	};
 
-	pca9546@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
 		#address-cells = <1>;
@@ -1099,7 +1099,7 @@ tmp275@49 {
 		reg = <0x49>;
 	};
 
-	pca9546@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
 		#address-cells = <1>;
@@ -1201,7 +1201,7 @@ tmp275@4b {
 		reg = <0x4b>;
 	};
 
-	pca9546@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
 		#address-cells = <1>;
@@ -2031,7 +2031,7 @@ tmp275@49 {
 		reg = <0x49>;
 	};
 
-	pca9546@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
index 208b0f094ed95f4e..0dea014e4f30f3ac 100644
--- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
@@ -348,7 +348,7 @@ tmp112@49 {
 		label = "outlet";
 	};
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
 		#address-cells = <1>;
@@ -432,7 +432,7 @@ &i2c6 {
 &i2c7 {
 	status = "okay";
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts
index b3c1e3ba583185e8..92b9b3987c92daa4 100644
--- a/arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts
@@ -215,7 +215,7 @@ tmp112@49 {
 		label = "outlet";
 	};
 
-	pca9548@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		reg = <0x70>;
 	};
@@ -224,17 +224,17 @@ pca9548@70 {
 &i2c3 {
 	status = "okay";
 
-	pca9548@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		reg = <0x70>;
 	};
 
-	pca9548@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9548";
 		reg = <0x71>;
 	};
 
-	pca9548@72 {
+	i2c-mux@72 {
 		compatible = "nxp,pca9548";
 		reg = <0x72>;
 	};
@@ -248,7 +248,7 @@ &i2c4 {
 &i2c5 {
 	status = "okay";
 
-	pca9548@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		reg = <0x70>;
 	};
@@ -257,7 +257,7 @@ pca9548@70 {
 &i2c6 {
 	status = "okay";
 
-	pca9548@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		reg = <0x70>;
 	};
diff --git a/arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts b/arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts
index caf66651e5b5db9f..c713cb7a6187012a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts
@@ -193,14 +193,14 @@ &i2c10 {
        // I2C EXPANDER
        status = "okay";
 
-       i2c-switch@71 {
+       i2c-mux@71 {
                compatible = "nxp,pca9544";
                #address-cells = <1>;
                #size-cells = <0>;
                reg = <0x71>;
        };
 
-       i2c-switch@73 {
+       i2c-mux@73 {
                compatible = "nxp,pca9544";
                #address-cells = <1>;
                #size-cells = <0>;
@@ -212,7 +212,7 @@ &i2c11 {
        // I2C EXPANDER
        status = "okay";
 
-       i2c-switch@70 {
+       i2c-mux@70 {
                compatible = "nxp,pca9544";
                #address-cells = <1>;
                #size-cells = <0>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
index 8f543cca7c21f154..ddbcbc64e2356bc8 100644
--- a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
@@ -208,7 +208,7 @@ &i2c6 {
 	 *	Slot 3
 	 */
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9545";
 		reg = <0x70>;
 		#address-cells = <1>;
@@ -249,7 +249,7 @@ &i2c7 {
 	 *	Slot 2,
 	 *	Slot 3
 	 */
-	i2c-switch@76 {
+	i2c-mux@76 {
 		compatible = "nxp,pca9546";
 		reg = <0x76>;
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
index bcc1820f5c073374..6045b60b80da8de7 100644
--- a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
@@ -175,7 +175,7 @@ &pinctrl_adc14_default
 &i2c0 {
 	status = "okay";
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9545";
 		reg = <0x70>;
 		#address-cells = <1>;
@@ -227,7 +227,7 @@ &i2c2 {
 
 &i2c3 {
 	status = "okay";
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 0cb7b20ff3ab88d7..3d2d8db73ca6601a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -231,7 +231,7 @@ ucd90160@64 {
 &i2c1 {
 	status = "okay";
 
-	i2c-switch@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9546";
 		reg = <0x71>;
 		#address-cells = <1>;
@@ -282,7 +282,7 @@ &i2c3 {
 &i2c4 {
 	status = "okay";
 
-	i2c-switch@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9546";
 		reg = <0x71>;
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index 9605e53f5bbfc0c1..fed2791f59941841 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -197,7 +197,7 @@ &i2c2 {
 	 *    Slot 6,
 	 *    Slot 7
 	 */
-	i2c-switch@74 {
+	i2c-mux@74 {
 		compatible = "nxp,pca9546";
 		reg = <0x74>;
 		#address-cells = <1>;
@@ -238,7 +238,7 @@ i2c_pcie7: i2c@3 {
 	 *    SSD 1,
 	 *    SSD 2
 	 */
-	i2c-switch@77 {
+	i2c-mux@77 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -325,7 +325,7 @@ &i2c7 {
 	 *    PSU3
 	 *    PSU2
 	 */
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts
index 46cbba6305b8f324..983853eedaefe82c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts
@@ -285,7 +285,7 @@ U35_PWR_ADC@4b {
 		reg = <0x4b>;
 	};
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
 		#address-cells = <1>;
@@ -321,7 +321,7 @@ SMB_HOST_DB800_C_SCL: i2c@3 {
 &i2c1 {
 	status = "okay";
 
-	i2c-switch@59 {
+	i2c-mux@59 {
 		compatible = "nxp,pca9848";
 		reg = <0x59>;
 		#address-cells = <1>;
@@ -393,7 +393,7 @@ SMB_FB_SCL: i2c@7 {
 			#size-cells = <0>;
 			reg = <7>;
 
-			i2c-switch@77 {
+			i2c-mux@77 {
 				compatible = "nxp,pca9546";
 				reg = <0x77>;
 				#address-cells = <1>;
@@ -490,7 +490,7 @@ &i2c5 {
 &i2c6 {
 	status = "okay";
 
-	i2c-switch@77 {
+	i2c-mux@77 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -556,7 +556,7 @@ U197_PCA9546_CH3: i2c@3 {
 &i2c7 {
 	status = "okay";
 
-	i2c-switch@75 {
+	i2c-mux@75 {
 		compatible = "nxp,pca9546";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts b/arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts
index 24319267d5508e3e..44b9853f6e632403 100644
--- a/arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts
@@ -88,16 +88,16 @@ gpio@27 {
 
 &i2c13 {
 	/* SMB_PCIE2_STBY_LVC3 */
-	mux-expa@73 {
-		compatible = "nxp,pca9545";
-		reg = <0x73>;
+	i2c-mux@71 {
+		compatible = "nxp,pca9543";
+		reg = <0x71>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 		i2c-mux-idle-disconnect;
 	};
-	mux-sata@71 {
-		compatible = "nxp,pca9543";
-		reg = <0x71>;
+	i2c-mux@73 {
+		compatible = "nxp,pca9545";
+		reg = <0x73>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 		i2c-mux-idle-disconnect;
@@ -106,7 +106,7 @@ mux-sata@71 {
 
 &i2c2 {
 	/* SMB_PCIE_STBY_LVC3 */
-	mux-expb@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9545";
 		reg = <0x71>;
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts b/arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts
index ebbb68b55559a704..b8f0b08018a3472c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts
@@ -133,7 +133,7 @@ gpio@39 {
 
 &i2c13 {
 	/* SMB_PCIE2_STBY_LVC3 */
-	mux-expa@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		reg = <0x70>;
 		#address-cells = <1>;
@@ -144,7 +144,7 @@ i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
-			rsra-mux@72 {
+			i2c-mux@72 {
 				compatible = "nxp,pca9548";
 				reg = <0x72>;
 				#address-cells = <1>;
@@ -165,7 +165,7 @@ at24@50 {
 			};
 		};
 	};
-	mux-sata@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9543";
 		reg = <0x71>;
 		#address-cells = <1>;
@@ -176,7 +176,7 @@ mux-sata@71 {
 
 &i2c2 {
 	/* SMB_PCIE_STBY_LVC3 */
-	mux-expb@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9548";
 		reg = <0x71>;
 		#address-cells = <1>;
@@ -187,7 +187,7 @@ i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
-			rsrb-mux@72 {
+			i2c-mux@72 {
 				compatible = "nxp,pca9548";
 				reg = <0x72>;
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts b/arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts
index e36ee4704994b1f7..933ca831d37529d8 100644
--- a/arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts
@@ -88,16 +88,16 @@ gpio@27 {
 
 &i2c13 {
 	/* SMB_PCIE2_STBY_LVC3 */
-	mux-expa@73 {
-		compatible = "nxp,pca9545";
-		reg = <0x73>;
+	i2c-mux@71 {
+		compatible = "nxp,pca9543";
+		reg = <0x71>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 		i2c-mux-idle-disconnect;
 	};
-	mux-sata@71 {
-		compatible = "nxp,pca9543";
-		reg = <0x71>;
+	i2c-mux@73 {
+		compatible = "nxp,pca9545";
+		reg = <0x73>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 		i2c-mux-idle-disconnect;
@@ -106,7 +106,7 @@ mux-sata@71 {
 
 &i2c2 {
 	/* SMB_PCIE_STBY_LVC3 */
-	mux-expb@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9545";
 		reg = <0x71>;
 		#address-cells = <1>;
-- 
2.25.1

