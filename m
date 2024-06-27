Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C0891A197
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 10:35:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=xvEc2fRF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8sN16T5Wz3d9b
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 18:35:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=xvEc2fRF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=savoirfairelinux.com (client-ip=208.88.110.44; helo=mail.savoirfairelinux.com; envelope-from=elinor.montmasson@savoirfairelinux.com; receiver=lists.ozlabs.org)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8sHk30Nqz3d8Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 18:32:02 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7DC1C9C595F;
	Thu, 27 Jun 2024 04:32:01 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id ADoZEULVkne1; Thu, 27 Jun 2024 04:32:00 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id DB9819C5A5D;
	Thu, 27 Jun 2024 04:31:59 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com DB9819C5A5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1719477119; bh=bs2IFtz3V6z+dMhuZzoySqtETn/NGY/0j0+QPCGszp4=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=xvEc2fRFtvfSd6+vaW54fnzCWzMSzFBpfZWRJnvqnbbLNMwFytHA9rJ4iWcdx+H8E
	 Bci7YFLUIk6Q2umF0UDIgujwBaSprdNaRqHC+llOtHGGfj4RtgckAd0aP5GSbPCCl7
	 b/5amYmr03n02E5TanJXm6QYB+cIbq4xKPLKt9RYp2ieLCGSfuc2Fg4ZIlWV2Gst3I
	 byUsr7rVAs4TXAQeHkd6F7bSMU+luVr1vDlLVMZmoJyDEKZfxI8/KLkG4aZK5lN/ma
	 dPE22COhQHjxFqoaklOi58nn61rdpPZ9GxwMfzAPVrYDhx7fC3/kYMBXqDE2z85Qbt
	 PXwOBscrQSQsg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 37aekwcbSM6O; Thu, 27 Jun 2024 04:31:59 -0400 (EDT)
Received: from gerard.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id D929F9C5AAC;
	Thu, 27 Jun 2024 04:31:56 -0400 (EDT)
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
Subject: [PATCH v6 5/7] ASoC: dt-bindings: update fsl-asoc-card bindings after imx-spdif merge
Date: Thu, 27 Jun 2024 10:31:02 +0200
Message-Id: <20240627083104.123357-6-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627083104.123357-1-elinor.montmasson@savoirfairelinux.com>
References: <20240627083104.123357-1-elinor.montmasson@savoirfairelinux.com>
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

The S/PDIF audio card support with compatible "fsl,imx-audio-spdif"
was merged from imx-spdif into the fsl-asoc-card driver.
It makes possible to use an S/PDIF with an ASRC.

This merge introduces new DT bindings to use with compatible
"fsl,imx-audio-spdif" to follow the way fsl-asoc-card works:
* the "spdif-controller" property from imx-spdif is named "audio-cpu"
  in fsl-asoc-card.
* fsl-asoc-card uses codecs explicitly declared in DT
  with "audio-codec".
  With an SPDIF, codec drivers spdif_transmitter and
  spdif_receiver should be used.
  Driver imx-spdif used instead the dummy codec and a pair of
  boolean properties, "spdif-in" and "spdif-out".

In an upcoming commit, in-tree DTs will be modified to follow these new
properties:
* Property "spdif-controller" will be renamed "audio-cpu".
* spdif_transmitter and spdif_receiver nodes will be declared
  and linked to the fsl-asoc-card node with the property "audio-codec".

To keep backward compatibility with other DTs, support for
"spdif-controller", "spdif-in" and "spdif-out" properties is kept.
However, it is recommended to use the new properties if possible.
It is better to declare transmitter and/or receiver
in DT than using the dummy codec.

DTs using compatible "fsl,imx-audio-spdif" are still supported, and
fsl-asoc-card will behave the same as imx-spdif for these DTs.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
---
 .../bindings/sound/fsl,imx-audio-spdif.yaml   | 66 -------------------
 .../bindings/sound/fsl-asoc-card.yaml         | 53 +++++++++++++--
 2 files changed, 49 insertions(+), 70 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/fsl,imx-audio-s=
pdif.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-audio-spdif.ya=
ml b/Documentation/devicetree/bindings/sound/fsl,imx-audio-spdif.yaml
deleted file mode 100644
index 5fc543d02ecb..000000000000
--- a/Documentation/devicetree/bindings/sound/fsl,imx-audio-spdif.yaml
+++ /dev/null
@@ -1,66 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/fsl,imx-audio-spdif.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Freescale i.MX audio complex with S/PDIF transceiver
-
-maintainers:
-  - Shengjiu Wang <shengjiu.wang@nxp.com>
-
-properties:
-  compatible:
-    oneOf:
-      - items:
-          - enum:
-              - fsl,imx-sabreauto-spdif
-              - fsl,imx6sx-sdb-spdif
-          - const: fsl,imx-audio-spdif
-      - enum:
-          - fsl,imx-audio-spdif
-
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: User specified audio sound card name
-
-  spdif-controller:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description: The phandle of the i.MX S/PDIF controller
-
-  spdif-out:
-    type: boolean
-    description:
-      If present, the transmitting function of S/PDIF will be enabled,
-      indicating there's a physical S/PDIF out connector or jack on the
-      board or it's connecting to some other IP block, such as an HDMI
-      encoder or display-controller.
-
-  spdif-in:
-    type: boolean
-    description:
-      If present, the receiving function of S/PDIF will be enabled,
-      indicating there is a physical S/PDIF in connector/jack on the board.
-
-required:
-  - compatible
-  - model
-  - spdif-controller
-
-anyOf:
-  - required:
-      - spdif-in
-  - required:
-      - spdif-out
-
-additionalProperties: false
-
-examples:
-  - |
-    sound-spdif {
-        compatible =3D "fsl,imx-audio-spdif";
-        model =3D "imx-spdif";
-        spdif-controller =3D <&spdif>;
-        spdif-out;
-        spdif-in;
-    };
diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml b/D=
ocumentation/devicetree/bindings/sound/fsl-asoc-card.yaml
index 9922664d5ccc..92aa47ec72c7 100644
--- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml
@@ -65,6 +65,11 @@ properties:
               - fsl,imx-audio-sgtl5000
               - fsl,imx-audio-wm8960
               - fsl,imx-audio-wm8962
+      - items:
+          - enum:
+              - fsl,imx-sabreauto-spdif
+              - fsl,imx6sx-sdb-spdif
+          - const: fsl,imx-audio-spdif
       - items:
           - enum:
               - fsl,imx-audio-ac97
@@ -81,6 +86,7 @@ properties:
               - fsl,imx-audio-wm8960
               - fsl,imx-audio-wm8962
               - fsl,imx-audio-wm8958
+              - fsl,imx-audio-spdif
=20
   model:
     $ref: /schemas/types.yaml#/definitions/string
@@ -93,8 +99,15 @@ properties:
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
@@ -150,8 +163,10 @@ properties:
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
@@ -167,6 +182,27 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of an CPU DAI controller
=20
+  spdif-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    deprecated: true
+    description: The phandle of an S/PDIF CPU DAI controller.
+
+  spdif-out:
+    type: boolean
+    deprecated: true
+    description: |
+      If present, the transmitting function of S/PDIF will be enabled,
+      indicating there's a physical S/PDIF out connector or jack on the
+      board or it's connecting to some other IP block, such as an HDMI
+      encoder or display-controller.
+
+  spdif-in:
+    type: boolean
+    deprecated: true
+    description: |
+      If present, the receiving function of S/PDIF will be enabled,
+      indicating there is a physical S/PDIF in connector/jack on the board.
+
 required:
   - compatible
   - model
@@ -195,3 +231,12 @@ examples:
              "AIN2L", "Line In Jack",
              "AIN2R", "Line In Jack";
     };
+
+  - |
+    sound-spdif-asrc {
+        compatible =3D "fsl,imx-audio-spdif";
+        model =3D "spdif-asrc-audio";
+        audio-cpu =3D <&spdif>;
+        audio-asrc =3D <&easrc>;
+        audio-codec =3D <&spdifdit>, <&spdifdir>;
+    };
--=20
2.34.1

