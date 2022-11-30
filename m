Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B5963E5A3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:41:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMwhy4bvfz3fpf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:41:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=arinc9.com header.i=arinc.unal@arinc9.com header.a=rsa-sha256 header.s=zmail header.b=H3Et7Uoe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arinc9.com (client-ip=136.143.188.14; helo=sender4-op-o14.zoho.com; envelope-from=arinc.unal@arinc9.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=arinc9.com header.i=arinc.unal@arinc9.com header.a=rsa-sha256 header.s=zmail header.b=H3Et7Uoe;
	dkim-atps=neutral
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMhRn3CxZz3bTB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 01:29:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1669817552; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dRQSRbWBpNAmHYqKHn9SeS2Jmo1Q3++qOHfmAu+Mz4Gxdlw7lOW6DAtGWKnry9tOK6f0p9FkzsmDwZ52KlGsmSH26rEq4vA5+0NTfEJ4HhiSVP+S8YV+pHDM3xyJza09rtXhBfowydmwVgmaaTKMQoFyrDujaucBJ+6117+Rd04=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669817552; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=2B4sSRKM9H708KgEDwj/zzkG1j8ieB57hrBlaL/4VHg=; 
	b=fHzcyw/z207E0/sNkbvbnr5VH8CFGHNdweVfl7z4xFjTQzL2BJywJID5Zu9UkDfnpT4DzhEckg/rDMqkBfmfmHfiNxE2GzQxew8AqUFDwnL40RbnTIRJ/BTSj9RnOGz6+gCCsBaOBByzlNAX8onIugzm1uXmSfBVIjBwa+x/Waw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669817552;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=2B4sSRKM9H708KgEDwj/zzkG1j8ieB57hrBlaL/4VHg=;
	b=H3Et7UoeAKtG+TrCYNYtAb9aCZOLhBjNNKd5oUqhhZcZz7ckSfTuanezuZ+qgRgx
	KFe4Jj/qLLsk4yWRkmmeASCOpocjQghaP66ANrnWN3Cfz0U0ZdsEXQxSQJ0bO17w8HA
	flva0QJzM+fZI9LUjCRbSpsdAikqv5gC3lGenfh0=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1669817551034914.5728790085885; Wed, 30 Nov 2022 06:12:31 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	soc@kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Stefan Agner <stefan@agner.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Tim Harvey <tharvey@gateworks.com>,
	Peng Fan <peng.fan@nxp.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	Frank Wunderlich <frank-w@public-files.de>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Oleksij Rempel <linux@rempel-privat.de>
Subject: [PATCH 3/5] arm64: dts: remove label = "cpu" from DSA dt-binding
Date: Wed, 30 Nov 2022 17:10:38 +0300
Message-Id: <20221130141040.32447-4-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130141040.32447-1-arinc.unal@arinc9.com>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Mailman-Approved-At: Thu, 01 Dec 2022 10:32:49 +1100
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is not used by the DSA dt-binding, so remove it from all devicetrees.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts     | 1 -
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts     | 1 -
 arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi        | 1 -
 arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi   | 1 -
 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts     | 2 --
 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts       | 1 -
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 1 -
 arch/arm64/boot/dts/marvell/cn9130-crb.dtsi                | 1 -
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts   | 1 -
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts               | 1 -
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts               | 1 -
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts               | 1 -
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts         | 1 -
 13 files changed, 14 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
index 750a1f07ecb7..2b1fd70acdec 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
@@ -662,7 +662,6 @@ lan4: port@3 {
 
 			port@5 {
 				reg = <5>;
-				label = "cpu";
 				ethernet = <&fec1>;
 				phy-mode = "rgmii-id";
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
index ceeca4966fc5..7a70eb2d1275 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
@@ -546,7 +546,6 @@ lan5: port@4 {
 
 			port@5 {
 				reg = <5>;
-				label = "cpu";
 				ethernet = <&fec>;
 				phy-mode = "rgmii-id";
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
index 4e05120c62d4..efa895b2316d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
@@ -177,7 +177,6 @@ port@1 {
 
 				port@2 {
 					reg = <2>;
-					label = "cpu";
 					ethernet = <&fec1>;
 
 					fixed-link {
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi
index 5fc613d24151..21e7fb64515c 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi
@@ -159,7 +159,6 @@ ports {
 
 			switch0port0: port@0 {
 				reg = <0>;
-				label = "cpu";
 				ethernet = <&eth0>;
 				phy-mode = "rgmii-id";
 				fixed-link {
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
index ada164d423f3..d8601b188cca 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
@@ -400,7 +400,6 @@ port@8 {
 
 			port@9 {
 				reg = <0x9>;
-				label = "cpu";
 				ethernet = <&eth1>;
 				phy-mode = "2500base-x";
 				managed = "in-band-status";
@@ -485,7 +484,6 @@ port@4 {
 
 			port@5 {
 				reg = <0x5>;
-				label = "cpu";
 				phy-mode = "2500base-x";
 				managed = "in-band-status";
 				ethernet = <&eth1>;
diff --git a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
index 7ca71f2d7afb..7c65c0772208 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
+++ b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
@@ -344,7 +344,6 @@ swport4: port@4 {
 
 			port@5 {
 				reg = <5>;
-				label = "cpu";
 				ethernet = <&cp0_eth1>;
 				phy-mode = "2500base-x";
 				managed = "in-band-status";
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
index 4125202028c8..60b11eeaeb9e 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
@@ -534,7 +534,6 @@ port@4 {
 
 			port@5 {
 				reg = <5>;
-				label = "cpu";
 				ethernet = <&cp1_eth2>;
 				phy-mode = "2500base-x";
 				managed = "in-band-status";
diff --git a/arch/arm64/boot/dts/marvell/cn9130-crb.dtsi b/arch/arm64/boot/dts/marvell/cn9130-crb.dtsi
index 8e4ec243fb8f..cc4b9daf52c6 100644
--- a/arch/arm64/boot/dts/marvell/cn9130-crb.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9130-crb.dtsi
@@ -282,7 +282,6 @@ port@9 {
 
 			port@a {
 				reg = <10>;
-				label = "cpu";
 				ethernet = <&cp0_eth0>;
 			};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index af3fe61e4093..42369ca3df8a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -183,7 +183,6 @@ port@4 {
 
 				port@6 {
 					reg = <6>;
-					label = "cpu";
 					ethernet = <&gmac0>;
 					phy-mode = "2500base-x";
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index b74e774c6eba..f029198a63cd 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -156,7 +156,6 @@ port@4 {
 
 				port@6 {
 					reg = <6>;
-					label = "cpu";
 					ethernet = <&gmac0>;
 					phy-mode = "2500base-x";
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index 9b83925893b7..1e98210959e1 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -172,7 +172,6 @@ port@4 {
 
 		port@6 {
 			reg = <6>;
-			label = "cpu";
 			ethernet = <&gmac0>;
 			phy-mode = "2500base-x";
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
index 243760cd3011..6e4f349e965a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
@@ -84,7 +84,6 @@ port@4 {
 
 				port@6 {
 					reg = <6>;
-					label = "cpu";
 					ethernet = <&gmac0>;
 					phy-mode = "2500base-x";
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
index c282f6e79960..b71162d65d2e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
@@ -552,7 +552,6 @@ port@4 {
 
 			port@5 {
 				reg = <5>;
-				label = "cpu";
 				ethernet = <&gmac0>;
 				phy-mode = "rgmii";
 
-- 
2.34.1

