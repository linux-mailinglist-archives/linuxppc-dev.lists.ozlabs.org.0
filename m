Return-Path: <linuxppc-dev+bounces-5957-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9AEA2CF35
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 22:31:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqRwM2Lpfz30W7;
	Sat,  8 Feb 2025 08:30:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738963843;
	cv=none; b=VB52ftuCnlzeTQclTUWbKArI3lHAGGycIZeh3YyIUZppmBOmS7HQiYnDWWN0XWNnzLHyF8d0zZG8U1sI8aokxhLAP0XZUh69LaS1JSu6LhS/7Yl7wyI+GwuLc7O9pU06TnGOBpDmawzQ6/FFSpKTAxLywx7bc6C7Fjw0Udz83SK+vw+nu6dfWNdwnhT7BccP0hgh25AXSrm1baF5QSbe/vkYUwE7Lg9OTqYQkDlLkVZ6x2wz1BJVqMNx90VIBVNHHxApao/UB+r2yj7L/qMv6zXO3EaMk5bzOBT2cY85mEKw5jBVEh710uXoUUqVL76nkwZUtcDhOYMjwf/UWEs9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738963843; c=relaxed/relaxed;
	bh=Cr3phd2Li2vDbGmofpKl+4CZj0Rn7FSKiIVrUspCNBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RLxw+mlcwOrAapAl7uQEhXAhMotwuRQryfchx0t2oXKckHybPF8KcUX+AZG8QzDq6g1r2hiS3M6cDOaPENLL65RM2hnQ5BfvKEsVRQbGsu55Plak/Qrv3nBkTAOe0XEwALRlIXvsGJO3j4GZsz6SZVwy5ASqYpbsW0BvaAxdlooADmHQvo+uoLDEMToYyjfg1bqwUc2DNnLYFiaPqX8tEDrdI2aGrUyEetqfbDsb7IdcFjYfNnqUgXSjNtutoMvAEiOnO/F8QT+LsNE5vcC81LyJCkkRbl3ZA3JpnmA3YIAsO2jPvBU9uoQioqjbpfGAWjv16TERhjOxqnAiJl8eVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=htVJpOej; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=htVJpOej;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqRwJ3KKVz2xrb
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 08:30:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 532535C71FD;
	Fri,  7 Feb 2025 21:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EB13C4AF10;
	Fri,  7 Feb 2025 21:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738963836;
	bh=RuAkLHcNPzAoRdo6BpE9kwkQgXaZNQeVgfwDORycGBA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=htVJpOejbXQWhe8jHGJAWKpyPz60TBThljZn9O7eII5mG/tHuyQw3AAVP6bnG4OBW
	 N7TMJID2KXI6LpFSP3IOheld8gdP+cAzxN/XCJ6c+ALuWgdHzgNleFP2YUE1dT1eoc
	 7id0urMFXjBD61eQ69fa76RFvE7fLaWi4yiRrCqThGrExM9L/uUwwkouMtWLK13KGs
	 jTL+0qXLrrjfiuuGUF3zoU85mGpItVNANt7iMIxv2cO0DIbVvBOmg+F2bL+5ZMPlaQ
	 JWxJwyTqiSLNKjeJhfZq3/gkFx1sUQJn2HOeZkOCEyfPXtKecp8jpkvfmR2fVEU+u8
	 kmHpjT/ZN1Umg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC49C0219E;
	Fri,  7 Feb 2025 21:30:36 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 07 Feb 2025 22:30:27 +0100
Subject: [PATCH v2 10/12] dt-bindings: memory-controllers: Add
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250207-ppcyaml-v2-10-8137b0c42526@posteo.net>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
In-Reply-To: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
To: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: imx@lists.linux.dev, Scott Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738963832; l=2327;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=LkemF+iJaT/609rtTCAj5OV7UUDgDJnkAiLlT9aG8EE=;
 b=IGiyO3zCvC30tHqbSQpswM01pqy9M52ANeFq4lodtrLUuOkaxDX7czh8YTYt1oGe4ku3Ffnah
 NTVhcN7NU36DyvvlburD8XDK2p3cgpWfPmuP85hC3kYOHiKRAnrQG3g
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

Formalize the binding already supported by the uio_fsl_elbc_gpcm.c
driver.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

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
index 0000000000000000000000000000000000000000..381584b400a0ad98c6d9e0b38f2877d44603ed84
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
2.48.0.rc1.219.gb6b6757d772



