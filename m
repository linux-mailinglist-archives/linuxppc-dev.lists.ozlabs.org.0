Return-Path: <linuxppc-dev+bounces-7625-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BE8A86D37
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Apr 2025 15:16:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZZYwN1gBSz2yr3;
	Sat, 12 Apr 2025 23:16:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744463780;
	cv=none; b=DS2ZkzO0+zieRgesnxDFeWe56kUNmPl5ct488CJ+ax6586kh+1zxr0K+mf2GyM5GzYpue6/owXzxUK4ssI9S0FMIYEh26oEyu7Abp4/QVFPcLyqsECQ63HjrL8aJ2Nr0Mjt5nWjJpj2d7oMaV6+EFS5E3a/VLgpt7XwBTVC/xI4Ta5Z8dqTTK4qQzih9YVm39NSBUpz5swo6zg6lqzvf9+0gxL7ola1QcxqBM/se7zXGHGzB1Ye0MhaQbkvv8B7bKJydEY3Uu1g1sEM8pUC93Yn0+Ox5+P8TTd0kDkHlBhIN6w2i9cswsXtE8bp9jOqeF3D0Fsoha6sVnJ/qT13WqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744463780; c=relaxed/relaxed;
	bh=jSSVdz6IbJb3wVluwA3Cv636qrv4M1oprEP7wYq7ktg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JlH4qIkZdfEWPdUdnIzdjMDoJcfr3wGoWWth+8nKO1HQumk4BoL83VaSO7KSG34bZOl5wGAJukcEorGjGeNPNiG3k5D2Z0mv9BzvH5bEaUc9pGJUfNw8ux8+4Xtrvuymcp3xzGxnuRNxGbP6P2mNM/28uBtfyTeekim8UwxfVL8cGzCRb7upDVFCozdk2ISygzHA37cQMeOxB1kv2UoUJw1XKMJSy3Sm7APKBnC96P0ddxmZ1WKiCtpFJEKRTDIMljszVubuL7FVpAfq6UhJXsGiBRqc/gQj7bIuyl08POXLfNGa2tlHUj89tSHe7t4Qq64ns3ZyMqVSAhz0jXCzKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iC8a/WC4; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iC8a/WC4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZZYwL4gS8z2ylr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Apr 2025 23:16:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 395375C57E9;
	Sat, 12 Apr 2025 13:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98BD3C4CEED;
	Sat, 12 Apr 2025 13:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744463775;
	bh=tVWlsHyHnXCIGSgizl8HG7hmSOJbp84SHZlXyFf90fw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iC8a/WC4yo3UI0nR+qdj4g9mJKJuSY3KdMM/puHRci2xFEhhKn+UIA1tIihfh0Vrk
	 g87Mg2IRd0WuHbtTsf7/obAM44hE3Y21xcjLZqzSRaXU1m744l8hj8nx38fn0YpRa2
	 2Q+vRq9jZUF6eLjIqssRMVoTST99fRxF4uULxdmjbVcvqXbVYDBzrUys0CJZ9e+vYX
	 JpqbGzka1Zm4Ia2pYuArzyOo2EHFdCoH94wflhO72zL9qky6LnBWWBbsbg8WwApLQ/
	 CduuWdars4/4ub4Bp+5YlfWxUHxGwnDN4MSG/o8DGpQIvnCm9aj9Lzk6DLyFdd+zJj
	 sxX9SSrmCrrbg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED57C369AE;
	Sat, 12 Apr 2025 13:16:15 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sat, 12 Apr 2025 15:16:04 +0200
Subject: [PATCH v5 3/4] dt-bindings: nand: Add fsl,elbc-fcm-nand
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250412-ppcyaml-elbc-v5-3-03f0e577139f@posteo.net>
References: <20250412-ppcyaml-elbc-v5-0-03f0e577139f@posteo.net>
In-Reply-To: <20250412-ppcyaml-elbc-v5-0-03f0e577139f@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744463772; l=3440;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=WvJoQK0edpJeqo++ZsYt3pS+SZc6YBUbltPH3xZQKbg=;
 b=ZlwLLrnr0tnVcUvMUkmKmZgmWUTcpmFXhK0evY0sU2YAfzQ+KWPr7Ghb7DGrYHdgyVPkEjTeW
 Nl3W6FN2QgOAF2xXhTWmmHy05LriYY32Tb0O27Jash1igxQHD2JFsns
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

Formalize the binding already supported by the fsl_elbc_nand.c driver
and used in several device trees in arch/powerpc/boot/dts/.

raw-nand-chip.yaml is referenced in order to accommodate situations in
which the ECC parameters settings are set in the device tree. One such
example is in arch/powerpc/boot/dts/turris1x.dts:

	/* MT29F2G08ABAEAWP:E NAND */
	nand@1,0 {
		compatible = "fsl,p2020-fcm-nand", "fsl,elbc-fcm-nand";
		reg = <0x1 0x0 0x00040000>;
		nand-ecc-mode = "soft";
		nand-ecc-algo = "bch";

		partitions { ... };
	};

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

V5:
- add Rob's review tag

V4:
- no changes

V3:
- remove unnecessary #address/size-cells from nand node in example
- add Frank Li's review tag
- add missing end of document marker (...)
- explain choice to reference raw-nand-chip.yaml

V2:
- split out from fsl,elbc binding patch
- constrain #address-cells and #size-cells
- add a general description
- use unevaluatedProperties=false instead of additionalProperties=false
- fix property order to comply with dts coding style
- include raw-nand-chip.yaml instead of nand-chip.yaml
---
 .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml b/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..91e8f2f9ff26da0f5a3f9bf276955ed32e9e7bc6
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/fsl,elbc-fcm-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NAND flash attached to Freescale eLBC
+
+description:
+  The Freescale Enhanced Local Bus controller (eLBC) contains logic to
+  interface with NAND flash, called the NAND Flash Control Machine (FCM).
+  This binding describes flash attached to an eLBC using the FCM.
+
+maintainers:
+  - J. Neuschäfer <j.ne@posteo.net>
+
+allOf:
+  - $ref: raw-nand-chip.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,mpc8313-fcm-nand
+              - fsl,mpc8315-fcm-nand
+              - fsl,mpc8377-fcm-nand
+              - fsl,mpc8378-fcm-nand
+              - fsl,mpc8379-fcm-nand
+              - fsl,mpc8536-fcm-nand
+              - fsl,mpc8569-fcm-nand
+              - fsl,mpc8572-fcm-nand
+              - fsl,p1020-fcm-nand
+              - fsl,p1021-fcm-nand
+              - fsl,p1025-fcm-nand
+              - fsl,p2020-fcm-nand
+          - const: fsl,elbc-fcm-nand
+      - const: fsl,elbc-fcm-nand
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    localbus {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        nand@1,0 {
+            compatible = "fsl,mpc8315-fcm-nand",
+                         "fsl,elbc-fcm-nand";
+            reg = <0x1 0x0 0x2000>;
+        };
+    };
+
+...

-- 
2.48.0.rc1.219.gb6b6757d772



