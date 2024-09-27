Return-Path: <linuxppc-dev+bounces-1659-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4D798877E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 16:47:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFYGj5W8jz3cKT;
	Sat, 28 Sep 2024 00:47:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.130.137.80
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727441490;
	cv=none; b=XRf1oPNJgTQxM3ndoymDgwqpzblTzlMqRxW1VAIUId/BexQMlGaYnTjRtXrgRp6PWmG4PrecVsgqf+9bhZoWVNLvpR6+KwqLb4YracneSypNrJNSfWGj6Yegq+hh9ePjhSfPA8ZnOz2s7i4V9B2P5o9mbi4xkGOQtebbY1oXdIJidHXIL8QnKgDeoWo/68sAM9ruWmNtB9tBqvtID8THQK9Droma0Iy3BS4tO2m1ZcmkuhoroQTVN/f9k7RGPPb772aeAn7Vxh/YngqXErwAt31r/+Px5GfwCTLt48VMleTraDHRpfOzkqvyU/I7ynysg58aQi9pdaggUBYZUPOgJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727441490; c=relaxed/relaxed;
	bh=8pEVAyku7Uijs/sJuSjwc2lCYvUnilSD+t79lm1ciFk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h9wHubJXn7DsUfLr+RyqTk2ZgiIJl6ZmB/jwCajXZRI7FKSUYgygLpxNNStWv+f0r8UxGFWdUqbq3JFOp8P3YFLWtSslUJX3PDDglzzxQm5u91G2yJAjPgz1X8nk4R1vb7j1hv0TOUo6br/F68V4CX5MAvPN78gmh+noFDN5o1fm+/o2D/pQhl/Eh9aOC7GHhSjRK75rZpTkogBfwmI+dyagYKQ+DKpcrIB/NxhcgcaWVbgYtRJ42ArLPYjdKGNc9fvHc3i71PTGMxnyS/LHEYQXKTEb32dME8t7/LOcHy9KGEZML94jq2EG4ck6STmE/ClrWttAhUFWWbll6Q9jtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=pass (client-ip=195.130.137.80; helo=riemann.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=riemann.telenet-ops.be
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=riemann.telenet-ops.be (client-ip=195.130.137.80; helo=riemann.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFVhf2nZVz3c7Q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 22:51:30 +1000 (AEST)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4XFVVv1N8lz4xNnw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 14:43:03 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by albert.telenet-ops.be with cmsmtp
	id HQic2D00E3BfLyr06Qiclu; Fri, 27 Sep 2024 14:43:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIj-000fPu-HI;
	Fri, 27 Sep 2024 14:42:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIp-008IDm-0M;
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
Subject: [PATCH treewide 04/11] arm64: dts: freescale: imx: Switch to simple-audio-card,hp-det-gpios
Date: Fri, 27 Sep 2024 14:42:19 +0200
Message-Id: <b38545c29d6cbf0b394ddb4747ce810c679f95d1.1727438777.git.geert+renesas@glider.be>
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

Replace the deprecated "simple-audio-card,hp-det-gpio" property by
"simple-audio-card,hp-det-gpios" in Simple Audio Card device nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
index b268ba7a0e12a3f8..9d8e7231b7c63742 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
@@ -172,7 +172,7 @@ sound {
 			"Headphones", "HP_OUT",
 			"Builtin Speaker", "Speaker Amp OUTR",
 			"Speaker Amp INR", "LINE_OUT";
-		simple-audio-card,hp-det-gpio = <&gpio3 20 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,hp-det-gpios = <&gpio3 20 GPIO_ACTIVE_HIGH>;
 
 		simple-audio-card,cpu {
 			sound-dai = <&sai2>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 1b39514d5c12aafc..bb37a32ce4616d9f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -241,7 +241,7 @@ sound {
 			"Headset Mic", "MICBIAS",
 			"IN3R", "Headset Mic",
 			"DMICDAT", "Digital Mic";
-		simple-audio-card,hp-det-gpio = <&gpio3 9 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,hp-det-gpios = <&gpio3 9 GPIO_ACTIVE_HIGH>;
 
 		simple-audio-card,cpu {
 			sound-dai = <&sai2>;
-- 
2.34.1


