Return-Path: <linuxppc-dev+bounces-15112-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5D3CED30C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 01 Jan 2026 17:58:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dhtM25Bbhz2yFJ;
	Fri, 02 Jan 2026 03:58:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767286718;
	cv=none; b=oqi8NEZMB9TydNDNJKnXILfxzk4KOGhPDNM7COpw2i+ddChRiAOM6IcdgafyUdwjl27HSuoOHfQtdVHudJNbrpfDPCAd6uJ7uBq1fSg53hYd6fGipDK3IZ8efwcFDNtoeoxiypLxcmxyy5bot0K8LVHJpKi+d37Vk8FrGHi6/nnwds0J2E2Ji6rlJkFCCUdGfy571gEsJ8IMh9NleYqjnBEQPaVeIO+/pIcyVVjF3sbxVsy/VLp+e3kx6+4mVjxQPn1VoxNGY/R/SnDcIoWQCNo8kcyy0O0A8bGPxo6gFTY5YL+bJlJ1uYM8p3HZBTl6tPjPbjjuHRgvAi24mrB4/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767286718; c=relaxed/relaxed;
	bh=1cvxKAnCO+PXwoUIjH78p+fwTIs0pr414Z/W//Om8wI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T+0JP1c3eRPyENFciGn93KnZVDDZCVLES5U17SLw3tHI1M/DR1Td/u6BlVbxwKuuijBAsroH9g6NX5Pme2jBo0Kne+9hfBclVgpW1ZP+fg1c1fBORDnGYoPZGL0pMHZKSIoO1tEhEZLy5e3PD7fXsUziuRZLzTmClqH1vKbj1Mugwxrd/7PeDaDb1c930fwNjKvuaH8WT2S97ieNdhYJdBX4ZJmRvuZhIEY2IZr5DjqwP4Puh5BZk03v+vJRS0Hqkcy8AGEGfK4JltQJ+J9IXhS8Uv1/HPsZuuS/z0oG6ui5tJnk1KJIzhzVOX5/X+bQMdjBjidSmk8SFmmlj9oHBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YdzdoozZ; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YdzdoozZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dhtM06Jdzz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 03:58:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FD22444AB;
	Thu,  1 Jan 2026 16:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39D17C16AAE;
	Thu,  1 Jan 2026 16:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767286714;
	bh=Q9LLHnvTxiDMFvAfLdjpxxShPJnvDv5Otm4KvImTOx0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YdzdoozZ7gZDIqBuUmTQ4wt1jPil4F/I1uQcfpGwWA99opcezPzb5IyTjiiuuECxj
	 3e2nS82OyrRmyllMdqyeYfl7g1nglwwWeJZiZWC5Wo38HlDGchh69UUjEVAJoWzq3r
	 EgO5IfWlAS0KOpS6cFA8tATnnfDaa8kiFk+c7DFZCItk3DW0wfEeNV//rFnux4d/lR
	 0cIiRR7kf57YQ74SyQewQDFm7fiFqffBvDQ/VVZVCr8bIjtkWJCS5UUgJqn1buQb/N
	 9nTznv6wqUN29L1Dzsv3MqF952AnDnsB0BNkCpUbOJFQb9iyv2AaIgKi7Ome19CuAv
	 ezyE0cIG8AZiw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25668EED628;
	Thu,  1 Jan 2026 16:58:34 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 01 Jan 2026 17:58:15 +0100
Subject: [PATCH RESEND v5 2/4] dt-bindings: memory-controllers: Add
 fsl,elbc-gpcm-uio
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
Message-Id: <20260101-ppcyaml-elbc-v5-2-251c7f14a06c@posteo.net>
References: <20260101-ppcyaml-elbc-v5-0-251c7f14a06c@posteo.net>
In-Reply-To: <20260101-ppcyaml-elbc-v5-0-251c7f14a06c@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Naveen N Rao <naveen@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Christophe Leroy <chleroy@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767286712; l=2396;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=bUAGbzS6p74FR6LkzbFgL5RNEAyIuDnK2zSEZn2z+XU=;
 b=2ApK1JqrIreJZ2Rl3uI4oev0BN99TTYjK1Vd/Ao9Xn5xZp5RnvxYNhV6Mpu/MblJzAYcs/61d
 ORSF2ZcDNHQD2nkrLDlFoK+inZAJcRp8ureEo9DLeANwi0lI531kXNM
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

Formalize the binding already supported by the uio_fsl_elbc_gpcm.c
driver.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

V4,V5:
- no changes

V3:
- add review tags

V2:
- split out from fsl,elbc patch
- add description
- remove "device_type" property
- move to bindings/memory-controllers
---
 .../memory-controllers/fsl,elbc-gpcm-uio.yaml      | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl,elbc-gpcm-uio.yaml b/Documentation/devicetree/bindings/memory-controllers/fsl,elbc-gpcm-uio.yaml
new file mode 100644
index 00000000000000..381584b400a0ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/fsl,elbc-gpcm-uio.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/fsl,elbc-gpcm-uio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Userspace I/O interface for Freescale eLBC devices
+
+description:
+  The Freescale Enhanced Local Bus controller (eLBC) supports flexible access
+  to memory devices, through the General-Purpose Chip-select Machine (GPCM).
+  The purpose of this binding is to designate devices attached to eLBC/GPMC for
+  use by userspace.
+
+maintainers:
+  - J. Neuschäfer <j.ne@posteo.net>
+
+properties:
+  compatible:
+    const: fsl,elbc-gpcm-uio
+
+  reg:
+    maxItems: 1
+
+  elbc-gpcm-br:
+    description: Base Register (BR) value to set
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  elbc-gpcm-or:
+    description: Option Register (OR) value to set
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  interrupts:
+    maxItems: 1
+
+  uio_name:
+    $ref: /schemas/types.yaml#/definitions/string
+
+required:
+  - compatible
+  - reg
+  - elbc-gpcm-br
+  - elbc-gpcm-or
+
+additionalProperties: false
+
+examples:
+  - |
+    localbus {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        simple-periph@2,0 {
+            compatible = "fsl,elbc-gpcm-uio";
+            reg = <0x2 0x0 0x10000>;
+            elbc-gpcm-br = <0xfd810800>;
+            elbc-gpcm-or = <0xffff09f7>;
+        };
+    };

-- 
2.51.0



