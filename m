Return-Path: <linuxppc-dev+bounces-1663-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 915DA988782
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 16:48:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFYHJ3Rx6z3cMH;
	Sat, 28 Sep 2024 00:48:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.130.132.49
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727441501;
	cv=none; b=kE0deOqn+7c3wLUwqSlwNM29gDgDMW/3G1gEnHIhRTUxKuZQiaDameOrybvfj/TUtJV7S9M6Y3u9CA4wh/ZD96O5yoY3/y83/Kczg+S4RzXQC3YZFIF621ojw8H7C7WHxH64geY66Ln/Um2tytuynj0jzsIOQj2LdAg316Jwh9Ee+aI4atdesmy0boTxUqxia4Y1PL5IS1aLy4oHLSNm9jbik1iDRl2SRp1M7dHCx05e/H+UlkusgiiTZGHNADEuCHEQ8mikgRLcd4DSXXIijFcf3OBrFcG2iyA2vYsW6Z+j9Ti8wBUK0AMZaTg+Hz0S0AORuaCQstNqZe40jE5ldg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727441501; c=relaxed/relaxed;
	bh=K7pV5Y/sFhhLAO0s8NN/c0NcQ2mTLmeUO2pos349x+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T+PL4YxMI1XRFlh7xSZHFvx1P8VAampLXiAhL8Ud+J1SnkNxX5Hra4vb7QtuIEwHOh3gU3xHHXJ76oeNbdn9LWWJAEZy+o0hGrqOxqhbUiDK1XwEQr6NntY3vl6K+X4rYwRtJWMvfG6fx8Nj+fIYZ8IbX9qba4jHlBcmrxYEo/LJAE1JzXuSn5yRrvpZFXITlRZ8djwtAqwFM4WerMmQW2lTC6qoOYEqH717GfL+89AlRsFLSRhWWkaMs6C3Fz9cmG9YN/UagdCB5dBFnJxtBk2mOjUGHIkN5JhTEXoFi1QsQgBGSceFkm0gCYe+WGaaigmuzRumY7gA3VTAK5zJjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=pass (client-ip=195.130.132.49; helo=gauss.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=gauss.telenet-ops.be
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=gauss.telenet-ops.be (client-ip=195.130.132.49; helo=gauss.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFVhs1zLZz3c8H
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 22:51:41 +1000 (AEST)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4XFVVt6vJKz4x9J8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 14:43:02 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by baptiste.telenet-ops.be with cmsmtp
	id HQic2D00D3BfLyr01Qicjt; Fri, 27 Sep 2024 14:43:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIj-000fPs-HD;
	Fri, 27 Sep 2024 14:42:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIo-008IDj-Vr;
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
Subject: [PATCH treewide 03/11] ARM: dts: marvell: mmp2-olpc-xo-1-75: Switch to {hp,mic}-det-gpios
Date: Fri, 27 Sep 2024 14:42:18 +0200
Message-Id: <7b4d7d735189fb346175a95e29db33f01c8cf93d.1727438777.git.geert+renesas@glider.be>
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
"hp-det-gpios" resp. "mic-det-gpios" in Audio Graph Card device nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts b/arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts
index 55ea87870af3e039..86c425b72fa711b5 100644
--- a/arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts
+++ b/arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts
@@ -113,8 +113,8 @@ sound-card {
 			  "Headphones", "HPOR",
 			  "MIC2", "Mic Jack";
 		widgets = "Headphone", "Headphones", "Microphone", "Mic Jack";
-		hp-det-gpio = <&gpio 97 GPIO_ACTIVE_HIGH>;
-		mic-det-gpio = <&gpio 96 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&gpio 97 GPIO_ACTIVE_HIGH>;
+		mic-det-gpios = <&gpio 96 GPIO_ACTIVE_HIGH>;
 	};
 
 	soc {
-- 
2.34.1


