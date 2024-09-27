Return-Path: <linuxppc-dev+bounces-1656-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 618C798877B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 16:47:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFYGC0Jjfz3cHx;
	Sat, 28 Sep 2024 00:47:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a02:1800:110:4::f00:11"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727441484;
	cv=none; b=RDlWNYQUJ2rBt7wPG4F3jhzAU0S2pdhlXKSQHAbPQoMU1euxA6OTs+4/ncT/rPkYBe7m1X0tjKUEb6q24/fPcqrs3CTNWfeGObqYFpNqiC7lBU7DZSyXiOqbhB/qxc93Gdf4nL8kCFBqrqszqPL1fN6NHmX5HA28bS2XxUIjWueFxPC5z4Wpl8tsgW4Y+1dvoxVUbbHzhZpdIRXLnUNWRaNYcdbbAeFUPCT5q6Dg04QPOK0LgA0dao8rWwMzkmker3X/GOahFtWn/t4O9RC61xS5zR7yuGbskbS0noFvF86eSkemlpTPWkAIs+5dqbZbURddZEGy4+XSMkqbG+DTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727441484; c=relaxed/relaxed;
	bh=LLBRD7cnLh/NxFA7N42FvSO0FMHn6yVpzd44nzNNW14=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C+TNEqOv7IjCt2j6HBEdGvVWOx+WcUs91KNVFd+bfmjCPYpW6tUryXsXZLiJcjQ/QTsxKxOt1APCwobMt+aUiVYHfyD41XIGFtbwuaomN44/A4Ge3ke2O9SdLSLo46NAUijF371+DwxPdHDimhwcvXuW2fFzUcdnwnvWGLrd+WOIe6AqAeD1DjoDvC7ASQr3FZxaphMKErQ1ctRoy/+G97Ss7i6KA6U9Whp1JY715PmOeXDJWvlj8CJ3PnuxWZZWbw/Zc4JMOQM0vPmY9SpoummW6iZ+UrzuWDkH8iDzVt/zGTr5N1ed2tSftBBbA9dog/7wVvuXVvhHCZ8Fki6khA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=pass (client-ip=2a02:1800:110:4::f00:11; helo=weierstrass.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=weierstrass.telenet-ops.be
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=weierstrass.telenet-ops.be (client-ip=2a02:1800:110:4::f00:11; helo=weierstrass.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 495 seconds by postgrey-1.37 at boromir; Fri, 27 Sep 2024 22:51:24 AEST
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [IPv6:2a02:1800:110:4::f00:11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFVhX2sN8z3c7Q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 22:51:23 +1000 (AEST)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4XFVVt6vykz4xMhp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 14:43:02 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by baptiste.telenet-ops.be with cmsmtp
	id HQic2D00C3BfLyr01Qicjs; Fri, 27 Sep 2024 14:43:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIj-000fPq-HD;
	Fri, 27 Sep 2024 14:42:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIo-008IDa-TV;
	Fri, 27 Sep 2024 14:42:30 +0200
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
Subject: [PATCH treewide 00/11] ASoC: Clean up {hp,mic}-det-gpio handling
Date: Fri, 27 Sep 2024 14:42:15 +0200
Message-Id: <cover.1727438777.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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

	Hi all,

The "gpio" suffix for GPIO consumers was deprecated a while ago, in
favor of the "gpios" suffix.  However, there are still several users of
the "hp-det-gpio" and "mic-det-gpio" properties, in DT bindings,
drivers, and DT source files.

Drivers that use gpiolib handle both the deprecated and new properties
transparently, but that is not the case when using of_property_*() calls
directly.

  - The first patch fixes a bug, as the Freescale Generic ASoC Sound
    driver handles only the deprecated properties, while there is
    already a user of the new variants,
  - The second patch updates the Audio Graph and Simple Audio Card DT
    bindings,
  - Patches 3-9 converts various DTS files to use the new properties,
  - The last 2 patches convert Freescale sound device nodes to use the
    new properties.

All patches can be applied independently, except for the last two, which
depend on the first patch to avoid regressions.
This series was compile-tested only.

Thanks for your comments!

Geert Uytterhoeven (11):
  ASoC: fsl-asoc-card: Add missing handling of {hp,mic}-dt-gpios
  ASoC: dt-bindings: Deprecate {hp,mic}-det-gpio
  ARM: dts: marvell: mmp2-olpc-xo-1-75: Switch to {hp,mic}-det-gpios
  arm64: dts: freescale: imx: Switch to simple-audio-card,hp-det-gpios
  arm64: dts: renesas: beacon-renesom: Switch to mic-det-gpios
  arm64: dts: rockchip: Switch to simple-audio-card,hp-det-gpios
  arm64: dts: rockchip: Switch to hp-det-gpios
  arm64: dts: uniphier: Switch to hp-det-gpios
  mips: dts: ingenic: Switch to simple-audio-card,hp-det-gpios
  ARM: dts: nxp: imx: Switch to {hp,mic}-det-gpios
  arm64: dts: freescale: imx: Switch to hp-det-gpios

 .../devicetree/bindings/sound/audio-graph.yaml       |  6 ++++++
 .../devicetree/bindings/sound/simple-card.yaml       | 12 ++++++++++++
 arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts      |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi       |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts             |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts            |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi            |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi      |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts              |  2 +-
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts     |  2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi    |  2 +-
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts         |  2 +-
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts        |  2 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts    |  2 +-
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi   |  2 +-
 .../boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi    |  2 +-
 .../arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts |  2 +-
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi   |  2 +-
 arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts      |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts    |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts  |  2 +-
 .../boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts     |  2 +-
 .../boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts     |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts   |  2 +-
 .../boot/dts/rockchip/rk3399-sapphire-excavator.dts  |  2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg-arc.dtsi    |  2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353p.dts     |  2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353ps.dts    |  2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353v.dts     |  2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353vs.dts    |  2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg503.dts      |  2 +-
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi    |  2 +-
 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts |  2 +-
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts    |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts     |  2 +-
 .../dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi   |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts     |  2 +-
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts     |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts   |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts      |  2 +-
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts      |  2 +-
 .../boot/dts/socionext/uniphier-ld11-global.dts      |  2 +-
 .../boot/dts/socionext/uniphier-ld20-global.dts      |  2 +-
 arch/mips/boot/dts/ingenic/gcw0.dts                  |  2 +-
 arch/mips/boot/dts/ingenic/rs90.dts                  |  2 +-
 sound/soc/fsl/fsl-asoc-card.c                        |  8 +++++---
 50 files changed, 72 insertions(+), 52 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

