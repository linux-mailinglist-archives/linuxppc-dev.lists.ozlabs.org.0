Return-Path: <linuxppc-dev+bounces-15117-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB87CED34E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 01 Jan 2026 18:05:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dhtVw0FNBz2yFJ;
	Fri, 02 Jan 2026 04:05:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767287127;
	cv=none; b=W0eHoxJvXOIvjdXkhMfQjuemOjGuotALFdgmwBH/+jUD3ia6dcmj5Pi38yBetyPA4D4P9iZIi6axNhp2koZ/h8kvM2fbGjoK91rT/hzL53siFIMC0ddYCgHIibBSsa9zGg2TeYwEXx81R3T/JzuCH8RIQiqiunxwv3M8TYvjioFujoOhy6rsWtdZsiYP3G/Bady1R0Ozlrkg8qt7XCZyFlTeyNPqtSeEVQCKKN3f99j3skX4f/wIH+I5jWpKhXHeLgm/SKbazSVbgehUyqfgEcfHc9/R0xWDObyHv3xnQUkevB3/ioiFX9ee5St64o6Qjc1P6pOQmBmg/EWzhfdaKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767287127; c=relaxed/relaxed;
	bh=aEzlLPTALngth40v9vmS241fK783wnKu1C7JqgcmEN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eEpzqW1pr+RGOSpIdh6osoAJuXQJ5Na4++nCCA6tTAUdLP6ErDn5tBkpJuOWxvF7KfPplO8FmGm0A/7y0cr7jZEOkHk1b2lEm70DBuF0d8o4+hnoz++JRDJNHEJBwBOaidVxC03uCD/Rht0v80g/ynhx40LvEjEdpnNaFVGukUKDzvb9B9bQnv2idUNxPNkt35L1KYvspVGyUakHr22lU+MQzsSKxdpJcX0jSf70tJj+Mh7DYUZkJs4e653sM9OnbcM+1pteZwRfMXC9X9X2idahhnM2Q1ORWikqWe8o5RCJeNH4sUEfbMPJMKp9RpxL3r3yZb3/gwH6lR6vNMyISA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jb2+03WM; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jb2+03WM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dhtVv18Zhz2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 04:05:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62380436BD;
	Thu,  1 Jan 2026 17:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27703C4CEF7;
	Thu,  1 Jan 2026 17:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767287095;
	bh=a7/rRD8QRX/T56zI93E4KvZTeQlDeftjKMb5+MtVtnA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Jb2+03WMdO6jwg2ZT/UZC5Bh+x5Gww+Aye0BFFl5w7/I5cpJdC6zpDDATe+PnxcjW
	 nfOYOeyyfM52yGU+WubNN6csOAkSprsj2+K57N1mrhBRuEat5kV742vUSNKTnIR4//
	 ddsMqEXYPgxAZxPpNXMZ78Mz7QVARbaMlnzQw96mWfZPAtEGfJeDLZFm03twAhRkAW
	 xQxgavu6k2LawP2V21ZU/+eyUzAgLX7DEgL6VpU5U+WSCrW+tE9YROisUMh//hsZI5
	 EEGmWntrftrxeNHPdTWdBe7+OT3Mox8j3LC8/zjvzPyRo22wUS6mJAJ7NfOTwu+p6e
	 TGYuux5TX3Gzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D537EED628;
	Thu,  1 Jan 2026 17:04:55 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 01 Jan 2026 18:04:45 +0100
Subject: [PATCH v5] dt-bindings: powerpc: Add Freescale/NXP MPC83xx SoCs
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260101-ppcyaml-soc-v5-1-696cb7eb5568@posteo.net>
X-B4-Tracking: v=1; b=H4sIACypVmkC/23MQQqDMBCF4atI1k1xkijalfcoXcRxUgOtCYmEi
 nj3RjdF6PI9+P6VRQqWIrsVKwuUbLRuyqO6FAxHPT2J2yFvJkpRlUKU3Htc9PvFo0OOmsCAQiO
 blmXhAxn7OWr3R96jjbMLyxFPcn//d5LkwPsG20bX0CPozrs4k7tONLM9lNQPKxBnrHY8SGVUD
 XKQcMLbtn0BtY6+7uQAAAA=
X-Change-ID: 20250220-ppcyaml-soc-cae1f14cf389
To: Scott Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Christophe Leroy <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767287094; l=4183;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=536L63cvPpKbvFHHC4dH21r7FgAfuo5+xdMh/4DunPY=;
 b=r7aOOJ2QPUoevtyPBYH27ZO7hmH+cFCsn2TNK+g5qA63ql3TpAFDmYragJMGuYSZ17sKv5RFH
 nTY5pTa/QOiDCKWr9cAJ6OY8MrntrhLEmIxBBxJQzIl1YWiSpR2YYos
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

Add a new binding for MPC83xx platforms, describing the board compatible
strings used in currently existing device trees.

Note that the SoC bus is called immr@... in many existing devicetrees,
but this contradicts the simple-bus binding.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
Changes in v5:
- Add Christophe Leroy's R-b tag
- Link to v4: https://lore.kernel.org/r/20250412-ppcyaml-soc-v4-1-bd34f4613d31@posteo.net

Changes in v4:
- Rebase on v6.15-rc1
- Try to list all existing compatible strings for MPC83xx boards
- Link to v3: https://lore.kernel.org/r/20250220-ppcyaml-soc-v3-1-b8c98a61bc1a@posteo.net

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
 .../bindings/powerpc/fsl/fsl,mpc83xx.yaml          | 93 ++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fsl,mpc83xx.yaml b/Documentation/devicetree/bindings/powerpc/fsl/fsl,mpc83xx.yaml
new file mode 100644
index 00000000000000..9e37d155c5829a
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/fsl/fsl,mpc83xx.yaml
@@ -0,0 +1,93 @@
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
+      - description: MPC8313E Reference Design Board
+        items:
+          - const: MPC8313ERDB
+          - const: MPC831xRDB
+          - const: MPC83xxRDB
+
+      - description: MPC8323E Reference Design Board
+        items:
+          - const: MPC8323ERDB
+          - const: MPC832xRDB
+          - const: MPC83xxRDB
+
+      - description: MPC8349E-mITX(-GP) Reference Design Platform
+        items:
+          - enum:
+              - MPC8349EMITX
+              - MPC8349EMITXGP
+          - const: MPC834xMITX
+          - const: MPC83xxMITX
+
+      - description: Keymile KMETER1 board
+        const: keymile,KMETER1
+
+      - description: MPC8308 P1M board
+        const: denx,mpc8308_p1m
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
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20250220-ppcyaml-soc-cae1f14cf389

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



