Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 094E566948D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 11:46:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtdPY5wSpz3fT5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 21:46:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=XlOprv3Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::229; helo=relay9-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=XlOprv3Z;
	dkim-atps=neutral
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtdDt0TCgz3fCV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 21:38:37 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 069CAFF81B;
	Fri, 13 Jan 2023 10:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673606315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZqR1sbzJlEP7+ZXzooqfoTsDW4e3sPJzR7dwt0b3cSs=;
	b=XlOprv3ZimuihHQZvNbxcgHZYx3GRRS/kt8qkLz0LvmzfBkZGHV0LeXQScDykpF5WgsIgA
	q8/sJmyiBZIUk6l74Xw/l4ejMwY9VUtgzSK13vex1i25TlV0kcQfnU8PYwsE+ZCAoT7eKs
	NqZbpfcOqzCVN7Ozg21RoPdQhcHEg9G2bRTyi4etOE5eVz3ZtangySUvdVqnzadhheKqE6
	jLK/Wza3mDbkPajmXlphBWit9011Pfjsyw07xo/ruvsPhH1F+hMxz+NaxqzyhJATnYIP1r
	CyomeAJ07UihdEIpNnzot0t13kCHgFyShvQPu9dK+vqCMcrPLtjGx3jsFsMJYw==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH v3 08/10] dt-bindings: sound: Add support for QMC audio
Date: Fri, 13 Jan 2023 11:37:57 +0100
Message-Id: <20230113103759.327698-9-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113103759.327698-1-herve.codina@bootlin.com>
References: <20230113103759.327698-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The QMC (QUICC mutichannel controller) is a controller
present in some PowerQUICC SoC such as MPC885.
The QMC audio is an ASoC component that uses the QMC
controller to transfer the audio data.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../bindings/sound/fsl,qmc-audio.yaml         | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml b/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
new file mode 100644
index 000000000000..ff5cd9241941
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,qmc-audio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QMC audio
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description: |
+  The QMC audio is an ASoC component which uses QMC (QUICC Multichannel
+  Controller) channels to transfer the audio data.
+  It provides as many DAI as the number of QMC channel used.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: fsl,qmc-audio
+
+  '#address-cells':
+    const: 1
+  '#size-cells':
+    const: 0
+  '#sound-dai-cells':
+    const: 1
+
+patternProperties:
+  '^dai@([0-9]|[1-5][0-9]|6[0-3])$':
+    description:
+      A DAI managed by this controller
+    type: object
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 63
+        description:
+          The DAI number
+
+      fsl,qmc-chan:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        items:
+          - items:
+              - description: phandle to QMC node
+              - description: Channel number
+        description:
+          Should be a phandle/number pair. The phandle to QMC node and the QMC
+          channel to use for this DAI.
+
+    required:
+      - reg
+      - fsl,qmc-chan
+
+required:
+  - compatible
+  - '#address-cells'
+  - '#size-cells'
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    audio_controller: audio-controller {
+        compatible = "fsl,qmc-audio";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #sound-dai-cells = <1>;
+        dai@16 {
+            reg = <16>;
+            fsl,qmc-chan = <&qmc 16>;
+        };
+        dai@17 {
+            reg = <17>;
+            fsl,qmc-chan = <&qmc 17>;
+        };
+    };
+
+    sound {
+        compatible = "simple-audio-card";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        simple-audio-card,dai-link@0 {
+            reg = <0>;
+            format = "dsp_b";
+            cpu {
+                sound-dai = <&audio_controller 16>;
+            };
+            codec {
+                sound-dai = <&codec1>;
+                dai-tdm-slot-num = <4>;
+                dai-tdm-slot-width = <8>;
+                /* TS 3, 5, 7, 9 */
+                dai-tdm-slot-tx-mask = <0 0 0 1 0 1 0 1 0 1>;
+                dai-tdm-slot-rx-mask = <0 0 0 1 0 1 0 1 0 1>;
+            };
+        };
+        simple-audio-card,dai-link@1 {
+            reg = <1>;
+            format = "dsp_b";
+            cpu {
+                sound-dai = <&audio_controller 17>;
+            };
+            codec {
+                sound-dai = <&codec2>;
+                dai-tdm-slot-num = <4>;
+                dai-tdm-slot-width = <8>;
+                /* TS 2, 4, 6, 8 */
+                dai-tdm-slot-tx-mask = <0 0 1 0 1 0 1 0 1>;
+                dai-tdm-slot-rx-mask = <0 0 1 0 1 0 1 0 1>;
+            };
+        };
+    };
-- 
2.38.1

