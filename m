Return-Path: <linuxppc-dev+bounces-17598-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDYpGIsGp2k7bgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17598-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 17:04:27 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AEC1F32F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 17:04:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQLGC2PZhz3bnr;
	Wed, 04 Mar 2026 03:04:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772553859;
	cv=none; b=WidTytx9ZBzaypOZiZER326cbzp954eQGHInRxk7na2o926x4Cobl5Z9JXDQxStDAzARp7oJWh6gRqpSVIzAJT538e/CFWhFq2LMoqDZorMgDovYJ/wFwla0j1MZlR8fSkcmHzk+h1CszMCXYZkszfgTny+QMTCj8a9lMd12ahQFF8bcmPX95lRDN2zwrwz6QEuGGJhjQ20saYgSEATuOtOioWf67GezCxIIilrTq9eSIL1Zjpp8JTjt2Yuyvd1hNx43TmVbD6NVuLzsctHLKW4ClpOyLdeEZkdFlQWwCqE8W5LQqfvqwrIdmJC3KEDa2S/VJy8XVUTI6JDkKjjCTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772553859; c=relaxed/relaxed;
	bh=aEzlLPTALngth40v9vmS241fK783wnKu1C7JqgcmEN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aL5zbZa6p1vKof5rtTmfFS24eOnnMfRfyC1/8EmYsE/ONYmTiTJ7tB6lyxISB28bHmg9IusAwIevkUvZ+9oqUHTkCakPzj83GLEvwbLs1kPXBR9GKdjlY8edVrUF9nsHpac9mtOtMXcvoeMEmSlpbdFX/CYucHpyQGqJne8ULu9H4His9Xe8kW1r0QnnYycVWE1xpc0wJNyZmbWnXAqnI9K0aVhtWWvYXceVbtYXf58dTuxUMEZWqnniZxQDoH7PKGIoBzOA3Ejyyp0GipY8xvvKnyaOBmFnzgIq4fe1IWaldZAoBuaunXbCUtcMv3DBNMw0RYBr4hHxISO2mSJpJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hauh7GHh; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hauh7GHh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQLGB1pxWz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 03:04:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38CA160008;
	Tue,  3 Mar 2026 16:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4816C2BCAF;
	Tue,  3 Mar 2026 16:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772553855;
	bh=a7/rRD8QRX/T56zI93E4KvZTeQlDeftjKMb5+MtVtnA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=hauh7GHhHuzKfqsjUARNMGRhoqDc35OrIXWUOSDvsuLMt7LOflnyjb7C8UxVQpXt/
	 KVLwpolmvwjIVu+3IH+QuBt4yRMdARFr3WRAn80dSBZKBrNXt7uaPXMhgzn9OePoyO
	 0TbKSDcHM6MjFEZylr46zwcCN7rCzmM5b/k0iUKDuejJTK+AyGbMtS4FkvqTTFP4Kn
	 pdYo3yg4LM9ytUAkmDysPjK/erRX1MItjzmXjx9CmH9R3xquo0wljg0duGisjqOgI/
	 xfrjyqzvFv/ix/jg3la5PJ8qExjfykH0ohU9uAHeu6WYEeJG2p15twvZOa0kl91Wy+
	 HYGWzzp+H2Few==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF61EDA693;
	Tue,  3 Mar 2026 16:04:15 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Tue, 03 Mar 2026 17:04:08 +0100
Subject: [PATCH RESEND v5] dt-bindings: powerpc: Add Freescale/NXP MPC83xx
 SoCs
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
Message-Id: <20260303-ppcyaml-soc-v5-1-2982d5a857bc@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772553855; l=4183;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=536L63cvPpKbvFHHC4dH21r7FgAfuo5+xdMh/4DunPY=;
 b=/GGIoV2BYbJfWNeB7iMXQvs3m30g1HLFdwyLBRvTCjEAxDYYcIhsK/23tNmmoenhXWkfsxuY+
 DcKC/fwlklMDNs93mkWksuznsSlEc3TMoqPZEG/i6/qsiU5/i3vxINv
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
X-Rspamd-Queue-Id: B6AEC1F32F2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17598-lists,linuxppc-dev=lfdr.de,j.ne.posteo.net];
	FREEMAIL_TO(0.00)[buserror.net,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oss@buserror.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:naveen@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chleroy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:j.ne@posteo.net,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[e0000000:query timed out,csgroup.eu:query timed out,posteo.net:query timed out,devicetree.org:query timed out];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[j.ne@posteo.net];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linuxppc-dev@lists.ozlabs.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.net:replyto,posteo.net:email,posteo.net:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo,devicetree.org:url,csgroup.eu:email]
X-Rspamd-Action: no action

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



