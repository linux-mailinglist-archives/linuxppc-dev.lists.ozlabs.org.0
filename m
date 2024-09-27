Return-Path: <linuxppc-dev+bounces-1655-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE16598877A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 16:47:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFYG273Tdz3cH9;
	Sat, 28 Sep 2024 00:47:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.130.132.48
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727441361;
	cv=none; b=GJCREOhr0MS66gTbAqLvRCIROYwBMn0Y4BgfbyxItWTbhdAGCfHSfulRPt8gXlNqc5rKjzMeb3X6SyJCaLO1od2irHSVXhWWabIyWwspyt0/BvJPOZq8RGZdjqYxyruIqxEqiq/nBTx1GkgGw0JhnYz0sH7jAi9urc37QjS55KR6K7ulKTH6r6ELNuHnYhnwQ4vL9l+2gj1yB8hjTzUboOxMAeEH7/B+NrojBmkLO27h2bqvlKzbrv2f3ANKxV9hr12Ss8u9q82/pE6bbkO82x3elw0A9c9914/eNlJcpIs3B0BeNUV5WWPtaD/+y6SHmSOXraqvfVoGu7PVHFQ2gg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727441361; c=relaxed/relaxed;
	bh=jedCfTbVxJDDyNhC8TD6NB7f84Lqffwh6KXdlFlIzI8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QiQPsfFWKqVVRu1Zi+gP7MkXKxCbIZ1EiEQ3lTuorhkC97EPC0WlxuMyGv4+YNsoJVqNVBDKHdOKvWXoHejZrPwxNvL23po8hDLXwD/3a4mU3TM75HAGYgHervqFIqSA5EuLLxjojolVvTK+VYO7H13Qof/+GXF2qABeITBkhBRnOrUka5DjgnoxMg+2nv4WkOVgKi883+rjEjur6n3fCqL1+z+2n5bsvW4SfiaLCPb/SBKZ6a/P/cSSf2FQQpe97XJdDewliu0oN454cSVX4i9VyQreLcTDrBBU9o+aWb9sbo5EyT+uesPZ22m1VCjsLNLUtOVKPxJrlvgg/fRDrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=pass (client-ip=195.130.132.48; helo=cantor.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=cantor.telenet-ops.be
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=cantor.telenet-ops.be (client-ip=195.130.132.48; helo=cantor.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 372 seconds by postgrey-1.37 at boromir; Fri, 27 Sep 2024 22:49:21 AEST
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFVf91qRbz301N
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 22:49:20 +1000 (AEST)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4XFVVv02vfz4xMgJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 14:43:03 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by xavier.telenet-ops.be with cmsmtp
	id HQic2D0093BfLyr01QicD3; Fri, 27 Sep 2024 14:43:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIj-000fPw-HG;
	Fri, 27 Sep 2024 14:42:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIp-008IDv-2h;
	Fri, 27 Sep 2024 14:42:31 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Adam Ford <aford173@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mips@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH treewide 07/11] arm64: dts: rockchip: Switch to hp-det-gpios
Date: Fri, 27 Sep 2024 14:42:22 +0200
Message-Id: <717e7c9527139c3a3e5246dd367a3ad98c5c81b6.1727438777.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727438777.git.geert+renesas@glider.be>
References: <cover.1727438777.git.geert+renesas@glider.be>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the deprecated "hp-det-gpio" property by "hp-det-gpios" in Audio
Graph Card and Realtek RT5651 Audio Codec device nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts            | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts          | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts    | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts    | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts         | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts       | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts         | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts            | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts b/arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts
index e0cc4da7f392daf9..c08687df326ddc21 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts
@@ -47,7 +47,7 @@ button-recovery {
 	analog-sound {
 		compatible = "audio-graph-card";
 		dais = <&i2s_8ch_p0>;
-		hp-det-gpio = <&gpio0 RK_PC7 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&gpio0 RK_PC7 GPIO_ACTIVE_HIGH>;
 		label = "alc5640";
 		routing = "Mic Jack", "MICBIAS1",
 			  "IN1P", "Mic Jack",
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts b/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts
index 4feb78797982baa5..8c46bee077f3cfc2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts
@@ -545,7 +545,7 @@ rt5651: audio-codec@1a {
 		reg = <0x1a>;
 		clocks = <&cru SCLK_I2S_8CH_OUT>;
 		clock-names = "mclk";
-		hp-det-gpio = <&gpio4 RK_PD4 GPIO_ACTIVE_LOW>;
+		hp-det-gpios = <&gpio4 RK_PD4 GPIO_ACTIVE_LOW>;
 		spk-con-gpio = <&gpio0 RK_PB3 GPIO_ACTIVE_HIGH>;
 		#sound-dai-cells = <0>;
 	};
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts
index 725ac3c1f6f6501d..4fc9c13dbec12390 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts
@@ -21,5 +21,5 @@ &es8316 {
 };
 
 &sound {
-	hp-det-gpio = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
+	hp-det-gpios = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts
index 682e8b7297c180b6..9c741d1a3047e758 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts
@@ -39,7 +39,7 @@ brcmf: wifi@1 {
 };
 
 &sound {
-	hp-det-gpio = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
+	hp-det-gpios = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
 };
 
 &uart0 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts
index 82ad2ca6b5c2fc92..5dc5505b58e2ee10 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts
@@ -40,7 +40,7 @@ brcmf: wifi@1 {
 };
 
 &sound {
-	hp-det-gpio = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
+	hp-det-gpios = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
 };
 
 &spi1 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
index 31ea3d0182c062ef..fdaa8472b7a72075 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
@@ -167,7 +167,7 @@ rt5651: rt5651@1a {
 		reg = <0x1a>;
 		clocks = <&cru SCLK_I2S_8CH_OUT>;
 		clock-names = "mclk";
-		hp-det-gpio = <&gpio4 RK_PC4 GPIO_ACTIVE_LOW>;
+		hp-det-gpios = <&gpio4 RK_PC4 GPIO_ACTIVE_LOW>;
 		spk-con-gpio = <&gpio0 RK_PB3 GPIO_ACTIVE_HIGH>;
 		#sound-dai-cells = <0>;
 	};
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
index c667704ba985e463..aefa0d376dd8af20 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
@@ -23,7 +23,7 @@ analog-sound {
 		compatible = "audio-graph-card";
 		dais = <&i2s0_8ch_p0>;
 		label = "rk3588-es8316";
-		hp-det-gpio = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&hp_detect>;
 		routing = "MIC2", "Mic Jack",
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index d0b922b8d67e85a0..e4e6c23c66845066 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -46,7 +46,7 @@ analog-sound {
 		compatible = "audio-graph-card";
 		label = "rk3588-es8316";
 		dais = <&i2s0_8ch_p0>;
-		hp-det-gpio = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&hp_detect>;
 		routing = "MIC2", "Mic Jack",
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index 966bbc582d89b89c..8d3bbfd996560289 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -32,7 +32,7 @@ analog-sound {
 			  "Headphones", "HPOR";
 
 		dais = <&i2s0_8ch_p0>;
-		hp-det-gpio = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&hp_detect>;
 	};
-- 
2.34.1


