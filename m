Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B644640B98
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 18:02:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNzlL16BCz3fNK
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Dec 2022 04:02:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=2a02:1800:110:4::f00:11; helo=weierstrass.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [IPv6:2a02:1800:110:4::f00:11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNzcB4Kg1z3bbh
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Dec 2022 03:56:26 +1100 (AEDT)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4NNzSt0rQxz4x7rw
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 17:50:06 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2d07:19c5:4d8b:89d9])
	by andre.telenet-ops.be with bizsmtp
	id rUpW2800P0ys3B701UpWZY; Fri, 02 Dec 2022 17:50:05 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1p19E9-002K62-4s; Fri, 02 Dec 2022 17:49:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1p19E8-006Wap-Es; Fri, 02 Dec 2022 17:49:28 +0100
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
Subject: [PATCH 08/11] arm64: dts: marvell: Fix pca954x i2c-mux node names
Date: Fri,  2 Dec 2022 17:49:23 +0100
Message-Id: <8fef7bb60e820cf961eb57e9be47a5f36f3f4916.1669999298.git.geert+renesas@glider.be>
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

    arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: i2c-switch@70: $nodename:0: 'i2c-switch@70' does not match '^(i2c-?)?mux'
	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
    arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: i2c-switch@70: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2' were unexpected)
	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
    ...

Fix this by renaming PCA954x nodes to "i2c-mux", to match the I2C bus
multiplexer/switch DT bindings and the Generic Names Recommendation in
the Devicetree Specification.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi      | 2 +-
 arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
index ca1aeb69a8929931..c864df9ec84d1b6f 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
@@ -135,7 +135,7 @@ &cp0_i2c1 {
 	pinctrl-0 = <&cp0_i2c1_pins>;
 	status = "okay";
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
index eb04735039362373..42a60f3dd5d142fc 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
@@ -285,7 +285,7 @@ &cp0_i2c1 {
 	pinctrl-0 = <&cp0_i2c1_pins>;
 	status = "okay";
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9544";
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.25.1

