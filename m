Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4041E91DE35
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 13:38:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=EgTc1gzy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCPFN0Thyz3dRk
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 21:38:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=EgTc1gzy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCP5d6dcDz3cRR
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 21:32:05 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 61907240002;
	Mon,  1 Jul 2024 11:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719833523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sfZG8ibbCskYBjaUkA70z76iMY7bqlElSDzCQwYJd/Q=;
	b=EgTc1gzyL3pfQ/KiFB1+225D05a2zp0EmLxLD6bIkUkfH3Wuh89+7jJMk5AQIPp/HLbD6t
	yA4E5HXwpI8PwPNBcBIjahlOB4VSB3dk2ICdAYPWgTQYbJsTuR8WzLwTevV/fxpqkyq36d
	pAI/Fz9TzxqWDGjwXHX1+64JzI9hLIb/1cQacvmIG/shvLmQXfVBH0ezFegtgf47x/5Ze6
	c/2xhoAs1Y2OnFaCi4j9lRtdaplZnBE1mJFy7j636J31Wzvpke7r8dkPPxNPURjIFEpkuL
	n13DR2gHrMhPuykXfOxu/TnsCr/b5yU1gvXhMu8dSodSiauju9bdJAwbt1VKlQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 09/10] dt-bindings: sound: fsl,qmc-audio: Add support for multiple QMC channels per DAI
Date: Mon,  1 Jul 2024 13:30:36 +0200
Message-ID: <20240701113038.55144-10-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240701113038.55144-1-herve.codina@bootlin.com>
References: <20240701113038.55144-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The QMC audio uses one QMC channel per DAI and uses this QMC channel to
transmit interleaved audio channel samples.

In order to work in non-interleave mode, a QMC audio DAI needs to use
multiple QMC channels. In that case, the DAI maps each QMC channel to
exactly one audio channel.

Allow QMC audio DAIs with multiple QMC channels attached.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/fsl,qmc-audio.yaml         | 41 ++++++++++++++++---
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml b/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
index b522ed7dcc51..a23e49198c37 100644
--- a/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
@@ -12,7 +12,9 @@ maintainers:
 description: |
   The QMC audio is an ASoC component which uses QMC (QUICC Multichannel
   Controller) channels to transfer the audio data.
-  It provides as many DAI as the number of QMC channel used.
+  It provides several DAIs. For each DAI, the DAI is working in interleaved mode
+  if only one QMC channel is used by the DAI or it is working in non-interleaved
+  mode if several QMC channels are used by the DAI.
 
 allOf:
   - $ref: dai-common.yaml#
@@ -45,12 +47,19 @@ patternProperties:
       fsl,qmc-chan:
         $ref: /schemas/types.yaml#/definitions/phandle-array
         items:
-          - items:
-              - description: phandle to QMC node
-              - description: Channel number
+          items:
+            - description: phandle to QMC node
+            - description: Channel number
+        minItems: 1
         description:
-          Should be a phandle/number pair. The phandle to QMC node and the QMC
-          channel to use for this DAI.
+          Should be a phandle/number pair list. The list of phandle to QMC node
+          and the QMC channel pair to use for this DAI.
+          If only one phandle/number pair is provided, this DAI works in
+          interleaved mode, i.e. audio channels for this DAI are interleaved in
+          the QMC channel. If more than one pair is provided, this DAI works
+          in non-interleave mode. In that case the first audio channel uses the
+          the first QMC channel, the second audio channel uses the second QMC
+          channel, etc...
 
     required:
       - reg
@@ -79,6 +88,11 @@ examples:
             reg = <17>;
             fsl,qmc-chan = <&qmc 17>;
         };
+        dai@18 {
+            reg = <18>;
+            /* Non-interleaved mode */
+            fsl,qmc-chan = <&qmc 18>, <&qmc 19>;
+        };
     };
 
     sound {
@@ -115,4 +129,19 @@ examples:
                 dai-tdm-slot-rx-mask = <0 0 1 0 1 0 1 0 1>;
             };
         };
+        simple-audio-card,dai-link@2 {
+            reg = <2>;
+            format = "dsp_b";
+            cpu {
+                sound-dai = <&audio_controller 18>;
+            };
+            codec {
+                sound-dai = <&codec3>;
+                dai-tdm-slot-num = <2>;
+                dai-tdm-slot-width = <8>;
+                /* TS 9, 10 */
+                dai-tdm-slot-tx-mask = <0 0 0 0 0 0 0 0 0 1 1>;
+                dai-tdm-slot-rx-mask = <0 0 0 0 0 0 0 0 0 1 1>;
+            };
+        };
     };
-- 
2.45.0

