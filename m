Return-Path: <linuxppc-dev+bounces-15388-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF64CFEFAA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 18:01:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmZ7r2sC7z2xlF;
	Thu, 08 Jan 2026 04:01:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767805304;
	cv=none; b=Dh1h0nrZSpFFXWge2DMToNqeakZtyKqjXX2ElPLShSA6qm39BqYI0edUGZcRX8cMz7iHIQRckrEk97DX4C+QM6mh22nYhVu2oaFZj/bhISFyhZQ6RUy5iCiA6RLcYT87OdGb7MjIoA5QIJ4TKJOi0enYAhYg7jSZHrkx1tn1iry5xPLd+BEKWJOVO4lLSgb+F8amGW5/Gc7Ttijw7ouYrebUCKzvgqm9Z/CV1WKAdPP0H2rKS+d5BIsQhYZ6ivzV4mn2adGe/K6o0Gn+kzRmQH4fjYNXf5ofRJzt3A1pNiE+Qq7XzL41LzL+lfdwftOFL6ooPD+d8/GtZqV/NZt6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767805304; c=relaxed/relaxed;
	bh=/0iHqrG/fSpsyvxbDBih5rtjZl9joKUHq9DpgYqHUFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HfzLaoBRITcWPcCQvcFShQFbRceO6H2ZXvKZ9eEbO8aQIFyIxT3X9fR9l//YvTlFbNrqjgA982ugMkLHwBqwshYAcZ6koJMO/XIEuWFIX9e26TLVvai9EbOT8Y3KOSsp4UklO5wdad9qrpUeSy7KnkztoHGt0+Pq4eQ19uKrAmBtnT63aC8mcdX989iPlawInbbHPVe3z7PXt9ivRcuGBsgEGGfumYbhswIA9kU7+cJXi15yDDiAL61HzchvZKqB/q83a0limPAEUNQas1EGnn9lVJ7Hts3L8mHv+CuGlNkdLvdsVoduRHQj48kWJotKfPQt/pAU+YQ4595CA/8L/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MVNEKDSb; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MVNEKDSb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmZ7q0WRlz2xZK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 04:01:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 171B660007;
	Wed,  7 Jan 2026 17:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4993C19423;
	Wed,  7 Jan 2026 17:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767805300;
	bh=6uEVhzlmhQI9tsyOAY16BpmJz+ZIZQnfbzuT3IRizoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MVNEKDSbcRXzlWQNGU3FsWplI+O0TVIBENkGefy9VbrMVJTgkJKa7+2XSkNzjERSb
	 j6FT0CoXVEjEpqktyD7MFWdDQCP7i2+NvOkMQyxc4/81zI5L5DE/PeLFAygQ9IgPo4
	 apWHXNQTxlp7uiL+KU0Sbge3suAfAd6YAe8WxmQYtPfL0tmLcfXOaJw+ocoUPy+jYc
	 9idbEy8AglaqdZBQHRnqHyQuxCVEAWI0fIuq47trnVFaU23ZRjRDVWs6Kmx3whtxu/
	 gU/N7ZcBaZVoYfkuBSBNsDEkq4emf2GDSKkwblyS468zzWZXdvpRfqmH8B/ZghF8Cb
	 V0T/nquDfeswA==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 2/2] dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
Date: Wed,  7 Jan 2026 17:59:10 +0100
Message-ID: <7708243d6cca21004de8b3da87369c06dbee3848.1767804922.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <63f19db21a91729d91b3df336a56a7eb4206e561.1767804922.git.chleroy@kernel.org>
References: <63f19db21a91729d91b3df336a56a7eb4206e561.1767804922.git.chleroy@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2014; i=chleroy@kernel.org; h=from:subject:message-id; bh=6uEVhzlmhQI9tsyOAY16BpmJz+ZIZQnfbzuT3IRizoQ=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWTGTXi0ZH6ii/rF5Gv3G3auNtvOxcIRaz75soCefUC1U G7CofPTO0pZGMS4GGTFFFmO/+feNaPrS2r+1F36MHNYmUCGMHBxCsBEJngxMsyR+cnV+dJpxkmF 6MBDbNOsLnznKOoIymac3rr2/K/PsdMY/vD9MQ9fVOrMVnOn5PVeLut76aE/T638rj3hg6/P9gO f/jMCAA==
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The QUICC Engine provides interrupts for a few I/O ports. This is
handled via a separate interrupt ID and managed via a triplet of
dedicated registers hosted by the SoC.

Implement an interrupt driver for it so that those IRQs can then
be linked to the related GPIOs.

Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
new file mode 100644
index 0000000000000..1f3c652b1569d
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale QUICC Engine I/O Ports Interrupt Controller
+
+maintainers:
+  - Christophe Leroy (CS GROUP) <chleroy@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - fsl,mpc8323-qe-ports-ic
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#address-cells':
+    const: 0
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#address-cells'
+  - '#interrupt-cells'
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@c00 {
+      compatible = "fsl,mpc8323-qe-ports-ic";
+      reg = <0xc00 0x18>;
+      interrupt-controller;
+      #address-cells = <0>;
+      #interrupt-cells = <1>;
+      interrupts = <74 0x8>;
+      interrupt-parent = <&ipic>;
+    };
-- 
2.49.0


