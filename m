Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6A5212F8A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 00:32:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yXs70Cz1zDr5R
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 08:32:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=2a00:1098:0:82:1000:25:2eeb:e3e3;
 helo=bhuna.collabora.co.uk; envelope-from=arnaud.ferraris@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=collabora.com
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yKzG4jSWzDqWN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 00:21:44 +1000 (AEST)
Received: from xps.home (unknown [IPv6:2a01:e35:2fb5:1510:315a:ecf0:6250:a3ed])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: aferraris)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8C01F2A5EC3;
 Thu,  2 Jul 2020 15:12:18 +0100 (BST)
From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
To: 
Subject: [PATCH 1/2] dt-bindings: sound: fsl-asoc-card: add new compatible for
 I2S slave
Date: Thu,  2 Jul 2020 16:11:14 +0200
Message-Id: <20200702141114.232688-2-arnaud.ferraris@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702141114.232688-1-arnaud.ferraris@collabora.com>
References: <20200702141114.232688-1-arnaud.ferraris@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 03 Jul 2020 08:28:34 +1000
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 kernel@collabora.com, Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

fsl-asoc-card currently doesn't support generic codecs with the SoC
acting as I2S slave.

This commit adds a new `fsl,imx-audio-i2s-slave` for this use-case, as
well as the following mandatory properties:
- `audio-codec-dai-name` for specifying the codec DAI to be used
- `audio-slot-width`

Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
---
 .../bindings/sound/fsl-asoc-card.txt          | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
index 133d7e14a4d0..694a138df462 100644
--- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
+++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
@@ -22,6 +22,8 @@ Note: The card is initially designed for those sound cards who use AC'97, I2S
 The compatible list for this generic sound card currently:
  "fsl,imx-audio-ac97"
 
+ "fsl,imx-audio-i2s-slave"
+
  "fsl,imx-audio-cs42888"
 
  "fsl,imx-audio-cs427x"
@@ -75,7 +77,13 @@ Optional unless SSI is selected as a CPU DAI:
 
   - mux-ext-port	: The external port of the i.MX audio muxer
 
-Example:
+Optional unless compatible is "fsl,imx-audio-i2s-slave":
+
+  - audio-codec-dai-name: The name of the DAI provided by the codec
+
+  - audio-slot-width	: The audio sample format
+
+Examples:
 sound-cs42888 {
 	compatible = "fsl,imx-audio-cs42888";
 	model = "cs42888-audio";
@@ -96,3 +104,16 @@ sound-cs42888 {
 		"AIN2L", "Line In Jack",
 		"AIN2R", "Line In Jack";
 };
+
+sound-bluetooth {
+	compatible = "fsl,imx-audio-i2s-slave";
+	audio-cpu = <&ssi1>;
+	audio-codec = <&codec_bluetooth>;
+	audio-codec-dai-name = "bt-sco-pcm-wb";
+	audio-slot-width = <16>;
+	audio-routing =
+		"RX", "Mic Jack",
+		"Headphone Jack", "TX";
+	mux-int-port = <1>;
+	mux-ext-port = <4>;
+};
-- 
2.27.0

