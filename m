Return-Path: <linuxppc-dev+bounces-7019-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB72EA6037B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 22:36:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDLQf1znjz3cWJ;
	Fri, 14 Mar 2025 08:35:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741901754;
	cv=none; b=Bz1y4iwP22mmWqg1RsOYj8oIuumYw3mhuYl5kLjZf+RqhZT+zlplhxBORbCewvXCYLJQHHq0o/PGXdx7YOrRVcM9p0kjYE3ysbcS5HEybNBuGsGGzkS7XaZXQpimKqJDjDuAZslxaNeGbVlu1fZd/hvsT3ZH6B29hRVUu+3LMYDChAtz7IBVqRTPrW4GSRQrOEhRZTKJlLU+tefj+DYurgKTiKZZT5G2yVaikK3abfVMy/vxxPDVD0nGhppCY8gFb6nLdTmQscEBjmrSEG3XxlFfWVVt8PiJQpr7HddiMaEP07gatJe++8Dsk/xopyYL5XYEzh0ASLR8ZYBRTcq81g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741901754; c=relaxed/relaxed;
	bh=9Uq3pqkxWqjcSQrYPNIbnyt2JPSy7AXsY6DGG5JMLD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TuPntJc1AY4MJhzDlj9lg9B1k9HG3BO09b4erIPDw+1I1R8Xr+bzhPGX70u1JPfcu3WlinIFih/Z6LDt7pP8K3+8nWRZ4SGtDGf5c7xnCWoIJr84A2DJo/LQWj7vltnJslkKKT1Y95ZKTnQ25LqLs6vLxG6LMW4KCnUH/fab/Bc8yxhaLcTAvoeMprVhjo6nRsZPUZbBC3w25CBA6+AAJ9V0ulfWlvmxgR36n+ua3lJVg8S9uxyqiRr2h6qIx1LYiz9aGqySE6zs5BeafZTAdFWhOcRvWo4+62esXDEEn/YTdkZKbd6sMXCX15XG6XBOsC+4CC/v5XJyX78VYouMIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=noqCH8N/; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=noqCH8N/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDLQb4RwKz30Vy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 08:35:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 409C9A48763;
	Thu, 13 Mar 2025 21:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E616C4CEEF;
	Thu, 13 Mar 2025 21:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741901747;
	bh=N9vjOO0ppP0Y2mdFuJUbpBLs8pEFcObKLSdjXsIWfMw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=noqCH8N/bx1mUQjnBXRnaVuZD5iVgUmz18QmQBioCf0PHuKzYJbUN/DQLnWTuog2o
	 IbJfpCmRc645H/03pMaAkz2xHre1ZFt6pO9cXfeZ1ww5NgD9wFTR9Z1CExr01aNGJA
	 +e60svISAgYKnyNrt62iDXDo8zaMxb8+wX9AZkWvvFCLuav8zStJC7Halx+T7pOUU4
	 l3QeSeyPcpAsCC5KV8ruauvO3rUTmVzQogUyVkQRYvsSueXCSzVZdOF0M7+yre8KFd
	 DIJV3RmHnI/CsfSTXQsMg5C+i2jhvWTlDj+Gu68C9iuoHoUBzXn9CGg0LiWaF2ixMv
	 NBCWU5O+8raIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE7DC35FF3;
	Thu, 13 Mar 2025 21:35:47 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 13 Mar 2025 22:35:46 +0100
Subject: [PATCH v4 3/4] dt-bindings: nand: Add fsl,elbc-fcm-nand
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
Message-Id: <20250313-ppcyaml-elbc-v4-3-55903722d9ea@posteo.net>
References: <20250313-ppcyaml-elbc-v4-0-55903722d9ea@posteo.net>
In-Reply-To: <20250313-ppcyaml-elbc-v4-0-55903722d9ea@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741901745; l=3359;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=/umUf9hJGqJZQnH4lp0VYOs75H+hiudpQPeFtynlqq0=;
 b=rut2FT9YxXNoUww0z5Ik0lSdReicEKdzbFg0FYIlmovOGHWwcVanj66uf0QrEhrZv+Z7u1jeu
 6hjm8X+fciVCNioGM8E33XDtOLxgnpaaWy/0lbuwKT8QtBAFfcftpKY
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

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



