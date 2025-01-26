Return-Path: <linuxppc-dev+bounces-5565-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 204B8A1CD9E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jan 2025 19:59:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yh17400bpz2yNn;
	Mon, 27 Jan 2025 05:59:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737917951;
	cv=none; b=NfOzgqH+n0QpnhmsYiqZqS29/wHnpG+s14Fsl9Hcvocqc9bC1CxrUPoXqerkccta44o2hHtBJUzFvM+NoNbXKDaJT7DPh9yfgCw2PEFlgFLtUn6q7X9VcJO43D3I9v41ARBHzCT4Bu3qlYxwan5bk2eqc9Fqv9CxmYGdhlIYG+lO8BnNGlQAflm4SzIVlmUKaS2YKCbHjm2D9FF1He2hho64Q5CnStT2gjW7Xw6SrL5lz4QrpMLQK+k0vxvNmCm0mG+b4+bM/Q1Kso3njNhbRqR0bR54TOtV7bYxMIEeV4EIck6oPMjBUshit49fZuJAfDKYS14IBA9O1XsI4DmOCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737917951; c=relaxed/relaxed;
	bh=L9Nioaf5VP8wazTNEbvD3+J2ibQsKbyT1X1yY9Eq7hI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=arejIWTVDpZifWVdcTzLL00lD63vunzhVPk52modcUwazSiIFVAD9Pb7SXaqD20TTgJk50u1Az05WwRopUszCdnbnZwodY7fJpJkrVzNlkA6zEjQrWCCXcFLl4AfsvQUSv2twrBp95qLf7l5pLDfw9n1smrm56P10sXsXU6H+7/DhlWw9HmjUc96y1HNFCI8IrCNj8wbMY7IFIvJdXl9IAOXQqUSfBeUMJzxr6Qm+Ot9ushBH4qpkBVFz8Bn7zchrMdq0WbVievA4HxOYM1sfZ6Br/HaFPgzR8B18edMQ8Gw76YuG7X2b5L1XUHDlrDGLmvMLdVDRn3ofrLMS0jZHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oQP0SWpa; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oQP0SWpa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yh1716vTkz2y8P
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 05:59:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9BFE9A40FDF;
	Sun, 26 Jan 2025 18:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE3ACC4CEEC;
	Sun, 26 Jan 2025 18:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737917945;
	bh=o7jhNyscn3Pm4JhS6vP183CLB8QHHLogflpUvt4Mc6o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oQP0SWpa5MdY/TljyOkjIeaWQYtHJ5RprIQ98cxcyLRTqTndA5b4mC+chazVf2l3E
	 oO8VUI52+pxyjKVct+5Eqhk8tFCzPkBINiaB3GKBId7cbSIJj01pFNzAUTgtUXYnzN
	 KVxcxUCQEYZiksB8iqC9vtRL2ZbnGWa9/nt0XvzbfqAzZQqH397FTV6SPnsmsDkT93
	 Sc2O2MIz1kQW62Evffe2xVFUUXDebVoaPY7c00c6D2/IYzXUj2hpGkhw/skM4YKO9R
	 IpVQurdmLv2xpKEPmBHtjDRS7vjU99Mmg0GGBgajAH6lExWK34+SPlKnvtDqaHKqjN
	 /5md2QKCJ5n7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA222C02181;
	Sun, 26 Jan 2025 18:59:05 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 26 Jan 2025 19:58:58 +0100
Subject: [PATCH 3/9] dt-bindings: crypto: Convert fsl,sec-2.0 binding to
 YAML
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
Message-Id: <20250126-ppcyaml-v1-3-50649f51c3dd@posteo.net>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
In-Reply-To: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
To: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Scott Wood <oss@buserror.net>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737917943; l=9001;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=VuKZobngmGKB8eeYhzOACw9r9WKNsafw5qCcGq+aZKI=;
 b=vN1jl9emxv1uwCj8Z5ZFgm0z0SMh3aUHRcOxQoz75+tAAAcYM4po+3r+Nh2GOXowbE+pwx4lI
 e/0jGLqgWhrAXhj8i6wxcVSPeamPzfC1etq1H1ixtWh9aYV7zjj4e4u
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

Convert the Freescale security engine (crypto accelerator) binding from
text form to YAML. The list of compatible strings reflects what was
previously described in prose; not all combinations occur in existing
devicetrees.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 .../devicetree/bindings/crypto/fsl,sec2.0.yaml     | 139 +++++++++++++++++++++
 .../devicetree/bindings/crypto/fsl-sec2.txt        |  65 ----------
 2 files changed, 139 insertions(+), 65 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/fsl,sec2.0.yaml b/Documentation/devicetree/bindings/crypto/fsl,sec2.0.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5ae593e60987e175413c3a082c9466f09f642bc4
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/fsl,sec2.0.yaml
@@ -0,0 +1,139 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale SoC SEC Security Engines versions 1.x-2.x-3.x
+
+maintainers:
+  - J. Neuschäfer <j.ne@posteo.net.
+
+properties:
+  compatible:
+    description: |
+      Should contain entries for this and backward compatible SEC versions,
+      high to low. Warning: SEC1 and SEC2 are mutually exclusive.
+    oneOf:
+      - items:
+          - const: fsl,sec3.3
+          - const: fsl,sec3.1
+          - const: fsl,sec3.0
+          - const: fsl,sec2.4
+          - const: fsl,sec2.2
+          - const: fsl,sec2.1
+          - const: fsl,sec2.0
+      - items:
+          - const: fsl,sec3.1
+          - const: fsl,sec3.0
+          - const: fsl,sec2.4
+          - const: fsl,sec2.2
+          - const: fsl,sec2.1
+          - const: fsl,sec2.0
+      - items:
+          - const: fsl,sec3.0
+          - const: fsl,sec2.4
+          - const: fsl,sec2.2
+          - const: fsl,sec2.1
+          - const: fsl,sec2.0
+      - items:
+          - const: fsl,sec2.4
+          - const: fsl,sec2.2
+          - const: fsl,sec2.1
+          - const: fsl,sec2.0
+      - items:
+          - const: fsl,sec2.2
+          - const: fsl,sec2.1
+          - const: fsl,sec2.0
+      - items:
+          - const: fsl,sec2.1
+          - const: fsl,sec2.0
+      - items:
+          - const: fsl,sec2.0
+      - items:
+          - const: fsl,sec1.2
+          - const: fsl,sec1.0
+      - items:
+          - const: fsl,sec1.0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  fsl,num-channels:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: An integer representing the number of channels available.
+
+  fsl,channel-fifo-len:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      An integer representing the number of descriptor pointers each channel
+      fetch fifo can hold.
+
+  fsl,exec-units-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The bitmask representing what execution units (EUs) are available.
+      EU information should be encoded following the SEC's Descriptor Header
+      Dword EU_SEL0 field documentation, i.e. as follows:
+
+        bit 0  = reserved - should be 0
+        bit 1  = set if SEC has the ARC4 EU (AFEU)
+        bit 2  = set if SEC has the DES/3DES EU (DEU)
+        bit 3  = set if SEC has the message digest EU (MDEU/MDEU-A)
+        bit 4  = set if SEC has the random number generator EU (RNG)
+        bit 5  = set if SEC has the public key EU (PKEU)
+        bit 6  = set if SEC has the AES EU (AESU)
+        bit 7  = set if SEC has the Kasumi EU (KEU)
+        bit 8  = set if SEC has the CRC EU (CRCU)
+        bit 11 = set if SEC has the message digest EU extended alg set (MDEU-B)
+
+      remaining bits are reserved for future SEC EUs.
+
+  fsl,descriptor-types-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The bitmask representing what descriptors are available. Descriptor type
+      information should be encoded following the SEC's Descriptor Header Dword
+      DESC_TYPE field documentation, i.e. as follows:
+
+        bit 0  = set if SEC supports the aesu_ctr_nonsnoop desc. type
+        bit 1  = set if SEC supports the ipsec_esp descriptor type
+        bit 2  = set if SEC supports the common_nonsnoop desc. type
+        bit 3  = set if SEC supports the 802.11i AES ccmp desc. type
+        bit 4  = set if SEC supports the hmac_snoop_no_afeu desc. type
+        bit 5  = set if SEC supports the srtp descriptor type
+        bit 6  = set if SEC supports the non_hmac_snoop_no_afeu desc.type
+        bit 7  = set if SEC supports the pkeu_assemble descriptor type
+        bit 8  = set if SEC supports the aesu_key_expand_output desc.type
+        bit 9  = set if SEC supports the pkeu_ptmul descriptor type
+        bit 10 = set if SEC supports the common_nonsnoop_afeu desc. type
+        bit 11 = set if SEC supports the pkeu_ptadd_dbl descriptor type
+
+      ..and so on and so forth.
+
+required:
+  - compatible
+  - reg
+  - fsl,num-channels
+  - fsl,channel-fifo-len
+  - fsl,exec-units-mask
+  - fsl,descriptor-types-mask
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    /* MPC8548E */
+    crypto@30000 {
+        compatible = "fsl,sec2.1", "fsl,sec2.0";
+        reg = <0x30000 0x10000>;
+        interrupts = <29 2>;
+        interrupt-parent = <&mpic>;
+        fsl,num-channels = <4>;
+        fsl,channel-fifo-len = <24>;
+        fsl,exec-units-mask = <0xfe>;
+        fsl,descriptor-types-mask = <0x12b0ebf>;
+    };
diff --git a/Documentation/devicetree/bindings/crypto/fsl-sec2.txt b/Documentation/devicetree/bindings/crypto/fsl-sec2.txt
deleted file mode 100644
index 125f155d00d052eec7d5093b5c5076cbe720417f..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/crypto/fsl-sec2.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-Freescale SoC SEC Security Engines versions 1.x-2.x-3.x
-
-Required properties:
-
-- compatible : Should contain entries for this and backward compatible
-  SEC versions, high to low, e.g., "fsl,sec2.1", "fsl,sec2.0" (SEC2/3)
-                             e.g., "fsl,sec1.2", "fsl,sec1.0" (SEC1)
-    warning: SEC1 and SEC2 are mutually exclusive
-- reg : Offset and length of the register set for the device
-- interrupts : the SEC's interrupt number
-- fsl,num-channels : An integer representing the number of channels
-  available.
-- fsl,channel-fifo-len : An integer representing the number of
-  descriptor pointers each channel fetch fifo can hold.
-- fsl,exec-units-mask : The bitmask representing what execution units
-  (EUs) are available. It's a single 32-bit cell. EU information
-  should be encoded following the SEC's Descriptor Header Dword
-  EU_SEL0 field documentation, i.e. as follows:
-
-	bit 0  = reserved - should be 0
-	bit 1  = set if SEC has the ARC4 EU (AFEU)
-	bit 2  = set if SEC has the DES/3DES EU (DEU)
-	bit 3  = set if SEC has the message digest EU (MDEU/MDEU-A)
-	bit 4  = set if SEC has the random number generator EU (RNG)
-	bit 5  = set if SEC has the public key EU (PKEU)
-	bit 6  = set if SEC has the AES EU (AESU)
-	bit 7  = set if SEC has the Kasumi EU (KEU)
-	bit 8  = set if SEC has the CRC EU (CRCU)
-	bit 11 = set if SEC has the message digest EU extended alg set (MDEU-B)
-
-remaining bits are reserved for future SEC EUs.
-
-- fsl,descriptor-types-mask : The bitmask representing what descriptors
-  are available. It's a single 32-bit cell. Descriptor type information
-  should be encoded following the SEC's Descriptor Header Dword DESC_TYPE
-  field documentation, i.e. as follows:
-
-	bit 0  = set if SEC supports the aesu_ctr_nonsnoop desc. type
-	bit 1  = set if SEC supports the ipsec_esp descriptor type
-	bit 2  = set if SEC supports the common_nonsnoop desc. type
-	bit 3  = set if SEC supports the 802.11i AES ccmp desc. type
-	bit 4  = set if SEC supports the hmac_snoop_no_afeu desc. type
-	bit 5  = set if SEC supports the srtp descriptor type
-	bit 6  = set if SEC supports the non_hmac_snoop_no_afeu desc.type
-	bit 7  = set if SEC supports the pkeu_assemble descriptor type
-	bit 8  = set if SEC supports the aesu_key_expand_output desc.type
-	bit 9  = set if SEC supports the pkeu_ptmul descriptor type
-	bit 10 = set if SEC supports the common_nonsnoop_afeu desc. type
-	bit 11 = set if SEC supports the pkeu_ptadd_dbl descriptor type
-
-  ..and so on and so forth.
-
-Example:
-
-	/* MPC8548E */
-	crypto@30000 {
-		compatible = "fsl,sec2.1", "fsl,sec2.0";
-		reg = <0x30000 0x10000>;
-		interrupts = <29 2>;
-		interrupt-parent = <&mpic>;
-		fsl,num-channels = <4>;
-		fsl,channel-fifo-len = <24>;
-		fsl,exec-units-mask = <0xfe>;
-		fsl,descriptor-types-mask = <0x12b0ebf>;
-	};

-- 
2.48.0.rc1.219.gb6b6757d772



