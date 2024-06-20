Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3328591060F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 15:32:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=IgK2q24I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4hHZ62HDz3cXD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 23:32:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=IgK2q24I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=savoirfairelinux.com (client-ip=208.88.110.44; helo=mail.savoirfairelinux.com; envelope-from=elinor.montmasson@savoirfairelinux.com; receiver=lists.ozlabs.org)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4h9245KSz3cSd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 23:26:46 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 947B69C58D7;
	Thu, 20 Jun 2024 09:26:45 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 1oN2S6fbGw84; Thu, 20 Jun 2024 09:26:44 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 9B9059C5BD0;
	Thu, 20 Jun 2024 09:26:44 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 9B9059C5BD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1718890004; bh=IxuGX0qCoVtAnpi7VYe/G+5pTn61z1lEtzCcfexjT68=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=IgK2q24IXb7GPhcc0AXJZdbrpqFrg8fNawkDMBDLfTTiyqY144SnT6HfBcyXT+yVM
	 A4mN91E7HIfYqQimjNgPrbfwJ6L0lh/sPllRbI/Bo046VxFITd3Hup1Vz/IGp0dAuP
	 Cs6zpWAiDIi+CcaC7HniH4wNVYc93/qwPgfHgcWLCsa23mf2oXSz453hsY8OPfZQdi
	 yTGynxLkrmm9h2YGmPOsZr/QW2qfnY1e5VNnbI+RjltvK/cOTB4hvXdVKUwWrYk+vV
	 UGZb74NAEhsdd2+nWbaVrAyfhu7UbZRBWrwejDmu/7QgMR61s2qQbKlAiiNnVyg00P
	 8jiQ1/WrtVOCQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 5eIRff_C5wVV; Thu, 20 Jun 2024 09:26:44 -0400 (EDT)
Received: from gerard.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id C2C489C5BCD;
	Thu, 20 Jun 2024 09:26:41 -0400 (EDT)
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
Subject: [PATCHv5 8/9] arm64: dts: imx8m: update spdif sound card node properties
Date: Thu, 20 Jun 2024 15:25:10 +0200
Message-Id: <20240620132511.4291-9-elinor.montmasson@savoirfairelinux.com>
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

Following merge of imx-spdif driver into fsl-asoc-card:
* update properties to match those used by fsl-asoc-card.
* S/PDIF in/out dummy codecs must now be declared explicitly, add and
  use them.

These modifications were tested only on an imx8mn-evk board.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 15 +++++++++---
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 15 +++++++++---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts  | 24 +++++++++++++++----
 3 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mm-evk.dtsi
index 90d1901df2b1..348855a41852 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -180,12 +180,21 @@ cpu {
 		};
 	};
=20
+	spdif_out: spdif-out {
+		#sound-dai-cells =3D <0>;
+		compatible =3D "linux,spdif-dit";
+	};
+
+	spdif_in: spdif-in {
+		#sound-dai-cells =3D <0>;
+		compatible =3D "linux,spdif-dir";
+	};
+
 	sound-spdif {
 		compatible =3D "fsl,imx-audio-spdif";
 		model =3D "imx-spdif";
-		spdif-controller =3D <&spdif1>;
-		spdif-out;
-		spdif-in;
+		audio-cpu =3D <&spdif1>;
+		audio-codec =3D <&spdif_out>, <&spdif_in>;
 	};
 };
=20
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mn-evk.dtsi
index 9e0259ddf4bc..6a47e09703a7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
@@ -124,12 +124,21 @@ sound-wm8524 {
 			"Line Out Jack", "LINEVOUTR";
 	};
=20
+	spdif_out: spdif-out {
+		#sound-dai-cells =3D <0>;
+		compatible =3D "linux,spdif-dit";
+	};
+
+	spdif_in: spdif-in {
+		#sound-dai-cells =3D <0>;
+		compatible =3D "linux,spdif-dir";
+	};
+
 	sound-spdif {
 		compatible =3D "fsl,imx-audio-spdif";
 		model =3D "imx-spdif";
-		spdif-controller =3D <&spdif1>;
-		spdif-out;
-		spdif-in;
+		audio-cpu =3D <&spdif1>;
+		audio-codec =3D <&spdif_out>, <&spdif_in>;
 	};
=20
 	sound-micfil {
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot=
/dts/freescale/imx8mq-evk.dts
index 7507548cdb16..b953865f0b46 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -125,19 +125,33 @@ link_codec: simple-audio-card,codec {
 		};
 	};
=20
+	spdif_out: spdif-out {
+		#sound-dai-cells =3D <0>;
+		compatible =3D "linux,spdif-dit";
+	};
+
+	spdif_in: spdif-in {
+		#sound-dai-cells =3D <0>;
+		compatible =3D "linux,spdif-dir";
+	};
+
 	sound-spdif {
 		compatible =3D "fsl,imx-audio-spdif";
 		model =3D "imx-spdif";
-		spdif-controller =3D <&spdif1>;
-		spdif-out;
-		spdif-in;
+		audio-cpu =3D <&spdif1>;
+		audio-codec =3D <&spdif_out>, <&spdif_in>;
+	};
+
+	hdmi_arc_in: hdmi-arc-in {
+		#sound-dai-cells =3D <0>;
+		compatible =3D "linux,spdif-dir";
 	};
=20
 	sound-hdmi-arc {
 		compatible =3D "fsl,imx-audio-spdif";
 		model =3D "imx-hdmi-arc";
-		spdif-controller =3D <&spdif2>;
-		spdif-in;
+		audio-cpu =3D <&spdif2>;
+		audio-codec =3D <&hdmi_arc_in>;
 	};
 };
=20
--=20
2.34.1

