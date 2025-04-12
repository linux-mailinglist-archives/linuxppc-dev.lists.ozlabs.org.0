Return-Path: <linuxppc-dev+bounces-7629-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76655A86D72
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Apr 2025 16:10:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZZb600DMpz2yrJ;
	Sun, 13 Apr 2025 00:09:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744466983;
	cv=none; b=GimTt7Wh7da6jubEZCEZBxZeG0ztmfLvAfzeGJ7Q/kchVdps0Jz5HZTwBfJ36AbZTJDm1rQrwQmkjnK3jngYh/wqBwzOYUAam8r98GijbLx+BOuiK9KeznLM9Mb2tVpzLJhjcuqY0uCtPjslU60MPcbyxFsA85fl3hxF+YG+USqCxpUOzZQ5wFSs4naUIO0x9X7bZ3TlUSAIOkXMQoDirkPsV59rQT21FBHnMcS6gSvk/1+peiuCf8OSpzL2X0rH9vHSgw3XhAjPB4y8u6unsdorpMpLNDxMxR5MjbGgvFnyZANPU66STb4dN+VXxfVumUWN0Y1RaeeUjvkkptym4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744466983; c=relaxed/relaxed;
	bh=KSqHGdgjhz/7OCv+UxKaWvElK3c8SWb0wcdkALO57u0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KN2ezVFQ8cvB6AvhHMBxNGqQqrhJ4L/AcU09/n4b5OF3csPZFJ2zk6Db1D/jijDJf4DxGsuhEkQU/SoobM5aDwjRtSTjX26wIVqQ7NQB2Mf+P0azUrzCZ08n03mOyO7B4hvNhnXPfOn7rZrlk+eJDx1uu36Idsg4rY3lY5R6pSWF1mNEqW2Lex3Pm9jz3rED3HAz4E0xtSIzQtdz/FDPASgZ815qaAK77b5bdEQPejhgDBmPqgeQ58DZZQSyTyxDGlmpdrYYm4eI+iXRo1DnqwqqlCJVIhyluK2SQe9puAbhWagnF3HyHRtK/+rNxf53qgBghSotxoalE8q2gBo/2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WDJUvVok; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WDJUvVok;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZZb5y5pWCz2ygH
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Apr 2025 00:09:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F83A435F4;
	Sat, 12 Apr 2025 14:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26261C4CEE3;
	Sat, 12 Apr 2025 14:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744466980;
	bh=tMRlI8+sSKuu9ZmukwLQTti70ORkwjFUDohaNELHm3I=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=WDJUvVok9f1AnfhvVQLBUhea5yz4QTA0voOOM/ooZe0MuJLJ4CNm5gIPHXHksP9Zp
	 n3sb9MAMThntj/7MMO5D4uHDVa4YQayA1+v0B2UOdC4ldaq/5Lyf9iJojbzc7mYKdf
	 7DM+uCraHhbAiYQkLILG3eblkQecbZn91FZYi1EP0lmKVEex508w9L9fCoqY6QiZf2
	 1s2EnAVXrW25pj8h8p5KEFiMN6lGnqh6eOIhh2RJ9HCM7lrvydylyOUlkhEEtiqTZt
	 6Skyhp/iTJ+Qbp526jem07a2phhmg30szOHpNnPVdeChYFdUaM42s+QzYznNjgLdax
	 C/uN5kLGc1fIw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0531FC369AE;
	Sat, 12 Apr 2025 14:09:40 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sat, 12 Apr 2025 15:55:38 +0200
Subject: [PATCH v4] dt-bindings: powerpc: Add Freescale/NXP MPC83xx SoCs
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
Message-Id: <20250412-ppcyaml-soc-v4-1-bd34f4613d31@posteo.net>
X-B4-Tracking: v=1; b=H4sIANlw+mcC/23MSw7CIBSF4a00dyyGRzXUUfdhOqDXiyXRQoAQm
 4a9ix07/E9yvh0SRUcJbt0OkYpLzq8t+lMHuJj1Scw9WoPk8sKl5CwE3Mz7xZJHhoaEFT1apQd
 ojxDJus+h3afWi0vZx+3Ai/qt/52imGCzxkGbq5hRmDH4lMmfV8ow1Vq/F6KQAacAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744466978; l=4043;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=6plfv1l6lzxqkUoN3xWxPFcjS2rxaHYhhOY/zeHTkAc=;
 b=lb4ghCUhlUAhV9xnysDHjXOBUe4iE8OSsf2qv12XoN8Ph2gJR6gadDhcf5HTp1+pXe9+oWbN7
 kvkZJId0swnCiKK7IFm5AP7jtsTrexZZPorHMEM8EHVpYObW2vLUXIO
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

Add a new binding for MPC83xx platforms, describing the board compatible
strings used in currently existing device trees.

Note that the SoC bus is called immr@... in many existing devicetrees,
but this contradicts the simple-bus binding.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
Changes in v4:
- Rebase on v6.15-rc1
- Link to v3: https://lore.kernel.org/r/20250220-ppcyaml-soc-v3-1-b8c98a61bc1a@posteo.net
---

V4:
- Try to list all existing compatible strings for MPC83xx boards

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
index 0000000000000000000000000000000000000000..9e37d155c5829a652d1e4e59536b6586a58d530e
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
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250220-ppcyaml-soc-cae1f14cf389

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



