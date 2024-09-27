Return-Path: <linuxppc-dev+bounces-1662-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C12988781
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 16:48:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFYH86LQhz3cM8;
	Sat, 28 Sep 2024 00:48:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.130.132.49
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727441501;
	cv=none; b=mfYZHd0WNDOSCuJi/2+hvP6vss8udzMMBlvNW8jYwI5rSmNcDM1LacvZJMArf9DCZSmrzUsOsd38hrprBZvZ5P/0MxMgC3LuGQ6o23kta7rzwWvq+PeUmIGYi6OiUu9EVQHmi6/Qt01ntlwRsqEMaj3PUbpZdmoPX+X9kjbNfUA0PanA9qUCARjU59Kr+etseivO3tJ9dDyEefaVfiUKihZERZVADbo3odYt6ceCDOMy7gW6+uORb95cZEAA37xy8Bo5uAnQfjX3Mad0OnQBGFHhlA8zYcJW0A5RKbQCBgxCaRrIv4Oq6558I/hOoYirtD18B7qR6/0V78fOw+B5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727441501; c=relaxed/relaxed;
	bh=XN/S71njyCwGtb3vMxvlLndIhvPpqasINxbHDyGejq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OKIRqGsCbQnhkDEbbhjIPJFmhEtK4YaYA98dIJpxRLNLoTqLfhn89BHs+NfZdmkN2A5JDTO9dRFFXeZraKbtFZ6QY+dToVGDAGKTA9yRR72tj4rKFyYS7zu50Zh/ZSTRVpmrnZq4P7RzzUytRnb6aEVkJUtX2U75qoAABAeczjA401OjYUHEESqE6YIghqhaGiqOziskEIHga53dgirXQC6puPA0j2zcIyo7LwFSqTYMUqEjfhi0mInYJXuSLWK+PqqNrKZ2RWfO+NODJV1bKO83WyJwKeL+J/ITLHy4KwsxwOoVZH9iGjwZp8imAyYETkRv7Qoa4xuW3ZzgrDXR/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=pass (client-ip=195.130.132.49; helo=gauss.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=gauss.telenet-ops.be
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=gauss.telenet-ops.be (client-ip=195.130.132.49; helo=gauss.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFVhs1ytKz3c7Q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 22:51:41 +1000 (AEST)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4XFVVt6vRHz4xQGp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 14:43:02 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by baptiste.telenet-ops.be with cmsmtp
	id HQic2D00E3BfLyr01Qicjw; Fri, 27 Sep 2024 14:43:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIj-000fPr-HE;
	Fri, 27 Sep 2024 14:42:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIo-008IDg-V7;
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
Subject: [PATCH treewide 02/11] ASoC: dt-bindings: Deprecate {hp,mic}-det-gpio
Date: Fri, 27 Sep 2024 14:42:17 +0200
Message-Id: <833d5d9560339bf39a125914225c9a0930e134cc.1727438777.git.geert+renesas@glider.be>
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

Commit 2071d0968e564b4b ("Documentation: gpio: guidelines for bindings")
deprecated the "gpio" suffix for GPIO consumers in favor of the "gpios"
suffix.  Update the Audio Graph and Simple Audio Card DT bindings to
reflect this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
No driver changes needed, as gpiod_get_optional() as called from
simple_util_init_jack() tries all suffixes.
---
 .../devicetree/bindings/sound/audio-graph.yaml       |  6 ++++++
 .../devicetree/bindings/sound/simple-card.yaml       | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph.yaml b/Documentation/devicetree/bindings/sound/audio-graph.yaml
index 71f52f7e55f6ce72..9899d9d1958d9d93 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph.yaml
@@ -37,8 +37,14 @@ properties:
   pa-gpios:
     maxItems: 1
   hp-det-gpio:
+    deprecated: true
+    maxItems: 1
+  hp-det-gpios:
     maxItems: 1
   mic-det-gpio:
+    deprecated: true
+    maxItems: 1
+  mic-det-gpios:
     maxItems: 1
 
 required:
diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 59ac2d1d1ccfa4ce..533d0a1da56e34eb 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -207,8 +207,14 @@ properties:
   simple-audio-card,pin-switches:
     $ref: "#/definitions/pin-switches"
   simple-audio-card,hp-det-gpio:
+    deprecated: true
+    maxItems: 1
+  simple-audio-card,hp-det-gpios:
     maxItems: 1
   simple-audio-card,mic-det-gpio:
+    deprecated: true
+    maxItems: 1
+  simple-audio-card,mic-det-gpios:
     maxItems: 1
 
 patternProperties:
@@ -256,8 +262,14 @@ patternProperties:
       pin-switches:
         $ref: "#/definitions/pin-switches"
       hp-det-gpio:
+        deprecated: true
+        maxItems: 1
+      hp-det-gpios:
         maxItems: 1
       mic-det-gpio:
+        deprecated: true
+        maxItems: 1
+      mic-det-gpios:
         maxItems: 1
 
     patternProperties:
-- 
2.34.1


