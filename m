Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E15F910600
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 15:31:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=a9m/sWIq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4hG05GFFz3cYh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 23:31:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=a9m/sWIq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=savoirfairelinux.com (client-ip=208.88.110.44; helo=mail.savoirfairelinux.com; envelope-from=elinor.montmasson@savoirfairelinux.com; receiver=lists.ozlabs.org)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4h8w5CNjz3cSS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 23:26:40 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B735C9C5BB5;
	Thu, 20 Jun 2024 09:26:39 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id iP3d_f_PxoSX; Thu, 20 Jun 2024 09:26:38 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id C13A19C5BB3;
	Thu, 20 Jun 2024 09:26:38 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com C13A19C5BB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1718889998; bh=WIDdP8Nhs+T0AX1bFRGBcj7z1PDp/O7FjFT/o694t9E=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=a9m/sWIqPv+3D9QIkNsZZRgbiN+vjq6Tb+ClhwW1n6JPxlnyCadOkmqpLgvUe6jJ/
	 MZXiBjuo4lsUrhDJb8fH8lcdmvjcGI/2P8PJqmn4dxM5/KiGLej1rh/lQFNcq6P4bX
	 Ldyc5IAF0v/35s4TtTrUY0eyBOVKYh129GA8hodHMUP/Ae6QQBU/kwvxlCvQtWFMjR
	 Ox8smoJytTyRjqL2nBQEhV43UEY1Giy/BcFHmrdpLKbyYW1rQBaTs7IQhKNEU+W3tV
	 +PbbdZ2hf2wV6/EvR31Y6r/okCJEO4zOF9Kqxkl+zstoWgOcGOy/6t44lnT3+Ka7qi
	 KxIaN7NBTz/Ng==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id UmrgJU7p_K7k; Thu, 20 Jun 2024 09:26:38 -0400 (EDT)
Received: from gerard.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id E5BB69C5BCD;
	Thu, 20 Jun 2024 09:26:35 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCHv5 6/9] ASoC: dt-bindings: fsl-asoc-card: add compatible string for spdif
Date: Thu, 20 Jun 2024 15:25:08 +0200
Message-Id: <20240620132511.4291-7-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com>
References: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>, Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The S/PDIF audio card support was merged from imx-spdif into the
fsl-asoc-card driver, making it possible to use an S/PDIF with an ASRC.
Add the new compatible and update properties.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
---
 .../bindings/sound/fsl-asoc-card.yaml         | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml b/D=
ocumentation/devicetree/bindings/sound/fsl-asoc-card.yaml
index 9922664d5ccc..f2e28b32808e 100644
--- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml
@@ -33,6 +33,7 @@ properties:
       - items:
           - enum:
               - fsl,imx-sgtl5000
+              - fsl,imx-sabreauto-spdif
               - fsl,imx25-pdk-sgtl5000
               - fsl,imx53-cpuvo-sgtl5000
               - fsl,imx51-babbage-sgtl5000
@@ -54,6 +55,7 @@ properties:
               - fsl,imx6q-ventana-sgtl5000
               - fsl,imx6sl-evk-wm8962
               - fsl,imx6sx-sdb-mqs
+              - fsl,imx6sx-sdb-spdif
               - fsl,imx6sx-sdb-wm8962
               - fsl,imx7d-evk-wm8960
               - karo,tx53-audio-sgtl5000
@@ -65,6 +67,7 @@ properties:
               - fsl,imx-audio-sgtl5000
               - fsl,imx-audio-wm8960
               - fsl,imx-audio-wm8962
+              - fsl,imx-audio-spdif
       - items:
           - enum:
               - fsl,imx-audio-ac97
@@ -81,6 +84,7 @@ properties:
               - fsl,imx-audio-wm8960
               - fsl,imx-audio-wm8962
               - fsl,imx-audio-wm8958
+              - fsl,imx-audio-spdif
=20
   model:
     $ref: /schemas/types.yaml#/definitions/string
@@ -93,8 +97,15 @@ properties:
       need to add ASRC support via DPCM.
=20
   audio-codec:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description: The phandle of an audio codec
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      The phandle of an audio codec.
+      With "fsl,imx-audio-spdif", either SPDIF audio codec spdif_transmitt=
er,
+      spdif_receiver or both.
+    minItems: 1
+    maxItems: 2
+    items:
+      maxItems: 1
=20
   audio-cpu:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -150,8 +161,10 @@ properties:
     description: dai-link uses bit clock inversion.
=20
   mclk-id:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description: main clock id, specific for each card configuration.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Main clock id for each codec, specific for each card conf=
iguration.
+    minItems: 1
+    maxItems: 2
=20
   mux-int-port:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -195,3 +208,12 @@ examples:
              "AIN2L", "Line In Jack",
              "AIN2R", "Line In Jack";
     };
+
+  - |
+    sound-spdif-asrc {
+      compatible =3D "fsl,imx-audio-spdif";
+      model =3D "spdif-asrc-audio";
+      audio-cpu =3D <&spdif>;
+      audio-asrc =3D <&easrc>;
+      audio-codec =3D <&spdifdit>, <&spdifdir>;
+    };
--=20
2.34.1

