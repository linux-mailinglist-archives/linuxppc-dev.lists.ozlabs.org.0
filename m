Return-Path: <linuxppc-dev+bounces-1661-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E49E988780
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 16:47:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFYH10FMgz3cLr;
	Sat, 28 Sep 2024 00:47:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.130.132.49
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727441500;
	cv=none; b=E0EqhmN0h7nhN5xkYEkBs5E70FdJqqUB+Qf9OTShZhvqwEw3v2xCBtsbjYBFFQ43e+orWSltdkx+DskbhSPpdU53iYOJQ42OMPGCflLhboAL5ATN0s+Lysd3gD0VJc5XIB7+j1Xoke8oBw3LGrlKFwgxIJe/JXake3mFfDdKQ/QN5iOOqBvReHOYAAiHMLwjYUO80fGDQFmDWqDklg+Crn6WDUOlFhW+TTlmAe/OAAvN9BSfEYXw+suC6g91F5KEh6lKLXe+uH2J42rAOj/PyRQ88XTa1EukL6VdrI88oH1snp8o4Qojb6JKl7DHymTnPqZOlxO+/4UuihsABa6tng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727441500; c=relaxed/relaxed;
	bh=iDIsAwKZVHiVkHRPHnLoc0igoRvck38/kdLZbYWCEAY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=garLdfotOsgfBJj82SRXp/G6ZMS/1lV1aGuTZ7I2m8auEDFMRGQoH66BFvKsqVA5ut4tC/j1SriMgJK9+VoS5nPHVwx2FDOVFHtIqEwsb++1kXjYwZiPXpFP3jP8zZBAGXKBQ29p5pDjdvYVt9wnHGlxpXdNrQHYjyfBxfG/BQ0TzUdAgbSK6oV+pHBH6ZElnNkbvb5tyiCBLnsKj97VKnlKb4SvMrQCAPboZJRLsHhgdF3eci+HlqMTCQcDzT00aOtvqeDelJ687TRGvLD6epmDXzvSvJibjb6NsPW5cP/wcx1TJP3M+Cad9Rx4O9NBk6i+8/hafiXse6relOCzRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=pass (client-ip=195.130.132.49; helo=gauss.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=gauss.telenet-ops.be
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=gauss.telenet-ops.be (client-ip=195.130.132.49; helo=gauss.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFVhr4BmWz3c7Q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 22:51:40 +1000 (AEST)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4XFVVv14YYz4x40F
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 14:43:03 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by andre.telenet-ops.be with cmsmtp
	id HQic2D0053BfLyr01Qicif; Fri, 27 Sep 2024 14:43:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIj-000fQB-JD;
	Fri, 27 Sep 2024 14:42:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIp-008IED-5c;
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
Subject: [PATCH treewide 10/11] ARM: dts: nxp: imx: Switch to {hp,mic}-det-gpios
Date: Fri, 27 Sep 2024 14:42:25 +0200
Message-Id: <7ff1bfb73a6d6fc71f3d751dbb7133b045853f64.1727438777.git.geert+renesas@glider.be>
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

Replace the deprecated "hp-det-gpio" and "mic-det-gpio" properties by
"hp-det-gpios" resp. "mic-det-gpios" in Freescale Generic ASoC Sound
Card device nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This has a run-time dependency on "ASoC: fsl-asoc-card: Add missing
handling of {hp,mic}-dt-gpios".
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi  | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts        | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts         | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
index 8f4f5fba68cc5f4f..86a86dc370c4a9fb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
@@ -113,8 +113,8 @@ sound {
 			"DMICDAT", "DMIC";
 		mux-int-port = <2>;
 		mux-ext-port = <3>;
-		hp-det-gpio = <&gpio7 8 GPIO_ACTIVE_LOW>;
-		mic-det-gpio = <&gpio1 9 GPIO_ACTIVE_LOW>;
+		hp-det-gpios = <&gpio7 8 GPIO_ACTIVE_LOW>;
+		mic-det-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 	};
 
 	backlight_lvds: backlight-lvds {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts b/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts
index 7c899291ab0dada4..542d633651f24575 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts
@@ -108,7 +108,7 @@ sound {
 			"IN3R", "AMIC";
 		mux-int-port = <2>;
 		mux-ext-port = <3>;
-		hp-det-gpio = <&gpio4 19 GPIO_ACTIVE_LOW>;
+		hp-det-gpios = <&gpio4 19 GPIO_ACTIVE_LOW>;
 	};
 
 	panel {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts b/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
index febc2dd9967de69e..c5383158e25c959b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
@@ -157,7 +157,7 @@ sound {
 			"IN3R", "AMIC";
 		mux-int-port = <2>;
 		mux-ext-port = <3>;
-		hp-det-gpio = <&gpio4 24 GPIO_ACTIVE_LOW>;
+		hp-det-gpios = <&gpio4 24 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
index 277a6e039045b575..ddd01b6dee5a9976 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
@@ -167,7 +167,7 @@ sound {
 			"IN3R", "AMIC";
 		mux-int-port = <2>;
 		mux-ext-port = <6>;
-		hp-det-gpio = <&gpio1 17 GPIO_ACTIVE_LOW>;
+		hp-det-gpios = <&gpio1 17 GPIO_ACTIVE_LOW>;
 	};
 
 	panel {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
index b74ee8948a781762..0e839bbfea082140 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
@@ -68,7 +68,7 @@ sound-wm8960 {
 		audio-cpu = <&sai2>;
 		audio-codec = <&codec>;
 		audio-asrc = <&asrc>;
-		hp-det-gpio = <&gpio5 4 0>;
+		hp-det-gpios = <&gpio5 4 0>;
 		audio-routing =
 			"Headphone Jack", "HP_L",
 			"Headphone Jack", "HP_R",
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
index f712537fca161ab9..6cde84636900bb00 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
@@ -169,7 +169,7 @@ sound {
 		model = "wm8960-audio";
 		audio-cpu = <&sai1>;
 		audio-codec = <&codec>;
-		hp-det-gpio = <&gpio2 28 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
 		audio-routing =
 			"Headphone Jack", "HP_L",
 			"Headphone Jack", "HP_R",
-- 
2.34.1


