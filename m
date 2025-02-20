Return-Path: <linuxppc-dev+bounces-6367-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B08A3D8B0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2025 12:31:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YzB173Hycz30TM;
	Thu, 20 Feb 2025 22:31:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740051099;
	cv=none; b=JK8eAISQalXOW4Wx04Un3OdP0kD/nOSPLbHsqWzm/eQPWnXK5h4z5xqC7fykPJPCtI+cU3lDuuXaJ4hEJtixt2e/6aT1XZxoAvO1xiPYYloOWxmfAoQUeUO+QtF9dxFiJlHLkpNKe1d8G6Al89JiqzX6/6JLEr9dAshRbgldVX+Tt7wzkAnxA02TREedhOmt/GvVs0hUavbHPxGTiKJmV6cT50VondmPqx9OFJJ0yl18hEHzHHiM2Mr99Vu7x+o5evnt4/GaGP9bHCn6cHEbLA7WDU/VGATMxrLKg6/9ufVkGWaSsL/lw82oaHh2i30FhiDUgCqrUYgSEEppIMMRng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740051099; c=relaxed/relaxed;
	bh=VddOkoHauXIjsSo2mrwgZLzKhXWRQXwBDZvwOTWOtf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=E9jcZihafJ1YLUVI5644kPl5waYHWsh/Kbyrp/e7l6Xo5T1f4D/095uEGnUDKjYDgnuuPLQ4rZQ0lFjxHRQbyTWuTdFyylJFi8LIBOYYWz3XdNq+0nHIeAOP0oUJp/y3o0ZeT41SAdANsErrip7+5z9Awu7J5wifjCs4i6fsaSTTODoLZeuddsbzIqsBhLcqNA+LCEDHnvw6e8gI4sAW58ltSQwG997elYAcuypqtFznf+IX2QxdVbksBVv8IQFJc61gCNC77MUgyFzKMGcnsuK1SX4NQw/Sfeq3Qatt079TRpnN12JG5ftxsm39eXfdg2l3axzsmjOJlpTO9pxF9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EZRVPLJt; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EZRVPLJt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YzB162shwz2y92
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2025 22:31:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 40D675C5C58;
	Thu, 20 Feb 2025 11:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DEAEC4CED1;
	Thu, 20 Feb 2025 11:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740051095;
	bh=+YgQGxrFni52QVQyqbITt31UYjErObaKrGzH0GffrDo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=EZRVPLJt89KCMZlV/Q7ROznbkUOrvVVBTWrH+qBdptgHGXAFZBLPAJto1YCGPi8mB
	 UWyVm5nkfWIc3p6aCytgsgarzOOxhvmQc1hKPrAl/wIE7TatmkfBHBGeiykUAJY5EJ
	 orJ1pKuWYi3XdMaka2rOWH2RH/xyrc+2MO3tRZx6JpnTEgSSH5xgG2rHFEwcThY3zA
	 Jupl3d3fn13c4BSmLHsEzD6j5qZP0matBx6WdFtvNLalAltI1gsbZB6J55Owhb3tzX
	 Grq6cyYQH0+Oizt3yycThUzNV/8vBOS3EI3ylmCq14wgitPz6eLs7b//kaff+HXWbh
	 OyZjWdgZsUuww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE01AC021B1;
	Thu, 20 Feb 2025 11:31:34 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 20 Feb 2025 12:31:24 +0100
Subject: [PATCH v3] dt-bindings: powerpc: Add Freescale/NXP MPC83xx SoCs
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
Message-Id: <20250220-ppcyaml-soc-v3-1-b8c98a61bc1a@posteo.net>
X-B4-Tracking: v=1; b=H4sIAIsSt2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMD3YKC5MrE3Bzd4vxk3eTEVMM0Q5PkNGMLSyWgjoKi1LTMCrBp0bG
 1tQDQw/PdXQAAAA==
X-Change-ID: 20250220-ppcyaml-soc-cae1f14cf389
To: Scott Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740051094; l=3092;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=NAj+Jqp8KPeLt4L556NresRK/7mtlfJD3BTkH6XEDfQ=;
 b=svr6EYY1rL3k+PY+Cs6q2u237DnQIj+3pXfKA5mT8jlrXmGEKRocbcBDlYHRe97Q4p7MfMFu1
 S0bDZ6K3hzaBbFzQJovWtbkKg34hQmOcP9jjL5yXQ+iLk3a+XHakeX/
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

Add a new binding for MPC83xx platforms, describing the board compatible
strings used in currently existing device trees.

Note that the SoC bus is called immr@... in many existing devicetrees,
but this contradicts the simple-bus binding.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
V3:
- split out as a single patch
- otherwise no changes

V2:
- part of series [PATCH v2 00/12] YAML conversion of several Freescale/PowerPC DT bindings
  Link: https://lore.kernel.org/lkml/20250207-ppcyaml-v2-1-8137b0c42526@posteo.net/
- trim subject line
- fix property order to comply with dts coding style
- add Rob Herrings's R-b tag
---
 .../bindings/powerpc/fsl/fsl,mpc83xx.yaml          | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fsl,mpc83xx.yaml b/Documentation/devicetree/bindings/powerpc/fsl/fsl,mpc83xx.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1d7ed67473ca447e0fd2e9b8f30d20e18c601ccf
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/fsl/fsl,mpc83xx.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpc83xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale PowerQUICC II Pro (MPC83xx) platforms
+
+maintainers:
+  - J. Neuschäfer <j.ne@posteo.net>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: MPC83xx Reference Design Boards
+        items:
+          - enum:
+              - fsl,mpc8308rdb
+              - fsl,mpc8315erdb
+              - fsl,mpc8360rdk
+              - fsl,mpc8377rdb
+              - fsl,mpc8377wlan
+              - fsl,mpc8378rdb
+              - fsl,mpc8379rdb
+
+patternProperties:
+  "^soc@.*$":
+    type: object
+    properties:
+      compatible:
+        oneOf:
+          - items:
+              - enum:
+                  - fsl,mpc8315-immr
+                  - fsl,mpc8308-immr
+              - const: simple-bus
+          - items:
+              - const: fsl,mpc8360-immr
+              - const: fsl,immr
+              - const: fsl,soc
+              - const: simple-bus
+          - const: simple-bus
+
+additionalProperties: true
+
+examples:
+  - |
+    / {
+        compatible = "fsl,mpc8315erdb";
+        model = "MPC8315E-RDB";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        soc@e0000000 {
+            compatible = "fsl,mpc8315-immr", "simple-bus";
+            reg = <0xe0000000 0x00000200>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            device_type = "soc";
+            ranges = <0 0xe0000000 0x00100000>;
+            bus-frequency = <0>;
+        };
+    };
+
+...

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250220-ppcyaml-soc-cae1f14cf389

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



