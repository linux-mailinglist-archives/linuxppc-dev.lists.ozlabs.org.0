Return-Path: <linuxppc-dev+bounces-1660-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA2298877F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 16:47:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFYGr4nxWz3cLN;
	Sat, 28 Sep 2024 00:47:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.130.132.49
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727441500;
	cv=none; b=AF4LoqYRy2gKdxxTkOvTeeOYefWSmWAzO5gld7sGfOinlEk15qqoj3Ua8UYft7x+FSqM2+p5pZqDk9YboMCJng7MT8ia7D3kIZwqOvyy/QcJR4Ggx+4jkI/zP+BEWofb/dcdcZLh6cBOd9L7uRfVJNclKa8ipHhQaaH43yQ/XwLUl91zqH3glFHjOj1emyccU/XrHXgrjZR24vK1QyCa9+LXCTEpbxqcD2o1WtJaOx2wN5YtX6VCkXQD9fXARQHEtkRImALjZn3aCi5HABKzwKDHYJeESaoSBmN0XJ26/mrErARDtNO5dumD+ktc78SQmjEfpFrebpWmXx8SICVF5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727441500; c=relaxed/relaxed;
	bh=+0+zCePXNc+rE/8h2AC/DEq4DCkjTNDcXegmOtv89q0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V4k4egqsejle0deGyyV24vaSK1n2BLPl+/y92CT8a8/OiDBtkswo5hyNNHTvnwQ/FAbDRGtYx77tKeHwuP2IGiQ7YNzfHiY+LKceA1PkmhYFdi1IzGDOfedo4YNCQ38UqF62YBamjMlggA6GbhVZPoTeXYPO6YDl0/xm8yCZLyHn9XvWam21ZDBHq081UdgFUoP2BTBjh4Z1G8ST4SkwZjtmtCaLa+o2BjT1kz4gfJ904tYmIc7oSZeHvVicUSX+MHWz+dNtaRwj1dMDSkEA/qap0PoL+7DKvJNvb4PdkIUCjlNdtMqLrntgFZK2G3ZO4Jp3kYsLNveAXOwAh20b2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=pass (client-ip=195.130.132.49; helo=gauss.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=gauss.telenet-ops.be
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=gauss.telenet-ops.be (client-ip=195.130.132.49; helo=gauss.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFVhq5Tqjz3c7Q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 22:51:39 +1000 (AEST)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4XFVVv0Kwkz4xRWs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 14:43:03 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by michel.telenet-ops.be with cmsmtp
	id HQic2D00L3BfLyr06Qicqj; Fri, 27 Sep 2024 14:43:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIj-000fPv-HG;
	Fri, 27 Sep 2024 14:42:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIo-008IDd-UI;
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
Subject: [PATCH treewide 01/11] ASoC: fsl-asoc-card: Add missing handling of {hp,mic}-dt-gpios
Date: Fri, 27 Sep 2024 14:42:16 +0200
Message-Id: <dbcb5bfea005a468ec6dc38374fe6d02bc693c22.1727438777.git.geert+renesas@glider.be>
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

The DT bindings deprecated the "hp-det-gpio" and "mic-det-gpio"
properties in favor of "hp-det-gpios" and "mic-det-gpios", but the
driver was never updated to support the latter.

Even before, there existed users of "hp-det-gpios" and "mic-det-gpios".
While this may have been handled fine by the ASoC core, this was missed
by the Freescale-specific part.

Fixes: 4189b54220e5af15 ("ASoC: dt-bindings: fsl-asoc-card: convert to YAML")
Fixes: 40ba2eda0a7b727f ("arm64: dts: imx8mm-nitrogen-r2: add audio")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Noticed accidentally.
Compile-tested only.
---
 sound/soc/fsl/fsl-asoc-card.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index f6c3aeff0d8eafd7..a0c2ce84c32b1d06 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -1033,14 +1033,15 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	}
 
 	/*
-	 * Properties "hp-det-gpio" and "mic-det-gpio" are optional, and
+	 * Properties "hp-det-gpios" and "mic-det-gpios" are optional, and
 	 * simple_util_init_jack() uses these properties for creating
 	 * Headphone Jack and Microphone Jack.
 	 *
 	 * The notifier is initialized in snd_soc_card_jack_new(), then
 	 * snd_soc_jack_notifier_register can be called.
 	 */
-	if (of_property_read_bool(np, "hp-det-gpio")) {
+	if (of_property_read_bool(np, "hp-det-gpios") ||
+	    of_property_read_bool(np, "hp-det-gpio") /* deprecated */) {
 		ret = simple_util_init_jack(&priv->card, &priv->hp_jack,
 					    1, NULL, "Headphone Jack");
 		if (ret)
@@ -1049,7 +1050,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		snd_soc_jack_notifier_register(&priv->hp_jack.jack, &hp_jack_nb);
 	}
 
-	if (of_property_read_bool(np, "mic-det-gpio")) {
+	if (of_property_read_bool(np, "mic-det-gpios") ||
+	    of_property_read_bool(np, "mic-det-gpio") /* deprecated */) {
 		ret = simple_util_init_jack(&priv->card, &priv->mic_jack,
 					    0, NULL, "Mic Jack");
 		if (ret)
-- 
2.34.1


