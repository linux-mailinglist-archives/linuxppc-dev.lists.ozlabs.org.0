Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C0C4188E6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Sep 2021 14:54:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HHQhl1rpzz3dcR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Sep 2021 22:54:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm2 header.b=RiGy3SiN;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=dOAooaKv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=svenpeter.dev (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev
 header.a=rsa-sha256 header.s=fm2 header.b=RiGy3SiN; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=dOAooaKv; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HHLxz4cFGz2yWH
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Sep 2021 20:05:59 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 17140580FBB;
 Sun, 26 Sep 2021 05:59:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sun, 26 Sep 2021 05:59:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=cWp5zIpWjNlKX
 lE1CaQrGZSrcDn1/ZujYfNah3kcVMs=; b=RiGy3SiNA6RI3cbllOyPHwKSVL1Bl
 vezDYajenNaEDI08pHR8v97sUkcOYK4TzaJzcCbIhTLTFHtW+tsRxguE1os8CFd3
 FM2FvXyNnl25iMqW83XMseXo8guYPHyteRq98SK0KJUPUHPEP5U152RWrxEHzARh
 HdJZzH3c3XsDNXXv+lswLm7LD9/+mTn7X6TtA5so13z+wX6ECSOZA6QeVkyIjYh8
 HHci8jNtr1TPQ6WBBn7dwJMcyLX/2+jFBK2lYK7qruoVWPxmZC0hE8MSX3iaK0Xk
 8InE98JvrS2OMt3YWOX/wUKZUlGoBv4sMMe0Y82swXwMAOAEEe/hHhHSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=cWp5zIpWjNlKXlE1CaQrGZSrcDn1/ZujYfNah3kcVMs=; b=dOAooaKv
 d1UCQiYYrQE2ROmpc0o7NXYmtaKnjpHKuFJEpXv+AZz3NSXbUADepGkrrBeOn58m
 MXUBBe2Nsa94A2pQ8IwPHqxW9Y2tWZpULcRUzCwIVNtcLUR55jIh6WLi//QPiXcY
 C0/CMcyMMXzGx0Q1tyCnGOugE8WFNYsecROLNa1THvNTChC9fZAJ+z5tTLHXXW+h
 hkGnoWL1sjjEyv9LaOXRFhlYQf3k4zGnvxIxYRQKTofneon7T4TlH+1+3tNYkDuB
 RH2bmQHL93iZLv1ryG2HbNlHCA17Zsj3AGjfNIwTLx9iTI54WpIReEV1faDIflO7
 6fa8f5ptKVX4nQ==
X-ME-Sender: <xms:jERQYSYpLf-EL8E1qCbQpB_0eA0W_k9Y_VBbe_Lc94XiywM5cWD8Tg>
 <xme:jERQYVbFMGTAQOpSr5EQ_mepv1p9wB7HB_xulcJEMZNRxyct8EmRQpfdqBIoZlS8i
 72Y2xB-TKbzOkLzGPc>
X-ME-Received: <xmr:jERQYc-ht_D7umRuv1AZn2TH33xMw8VraY2umjqPflOv56CudOyYBbJ7c6_zti8dzqCL05Z0VPvGopbDFD0K1muZnSxrYjFhMc4r_GkCGNDsInF1gEdQBWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejiedgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcu
 rfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvg
 hrnhepiedvudfftedvieevieffvdejveeiveduhfeifeegheehhedtgfehffeuheefhfel
 necuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghdpghhithhhuhgsrdgtohhmpd
 hofhhttgdrnhgvthenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:jERQYUpLR2sOUCNpQ3nGTr92Mv-FwDvotPNNPviidZqf64u55zD5_Q>
 <xmx:jERQYdpOe4v0gD3VcCBGMUaDWOmBb7Y-lOVB-YfzOcRVO_u2zT_qOA>
 <xmx:jERQYSQLN2pA-Haqq2OuRTA2pIOcQ8mjCGYi2HL8mhVrmFVeo5GN8g>
 <xmx:jURQYVat6uq2YOMw_VYIpdR2huuW2HK4r45VtIgUOlUjIKe34RjAIQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Sep 2021 05:59:38 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 01/10] dt-bindings: i2c: Add Apple I2C controller bindings
Date: Sun, 26 Sep 2021 11:58:38 +0200
Message-Id: <20210926095847.38261-2-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210926095847.38261-1-sven@svenpeter.dev>
References: <20210926095847.38261-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 26 Sep 2021 22:47:12 +1000
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Stan Skowronek <stan@corellium.com>, linuxppc-dev@lists.ozlabs.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Apple I2C controller is based on the PASemi I2C controller.
It is present on Apple SoCs such as the M1.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 .../devicetree/bindings/i2c/apple,i2c.yaml    | 61 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/apple,i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
new file mode 100644
index 000000000000..22fc8483256f
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/i2c/apple,i2c.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Apple/PASemi I2C controller
+
+maintainers:
+  - Sven Peter <sven@svenpeter.dev>
+
+description: |
+  Apple SoCs such as the M1 come with a I2C controller based on the one found
+  in machines with P. A. Semi's PWRficient processors.
+  The bus is used to communicate with e.g. USB PD chips or the speaker
+  amp.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - apple,t8103-i2c
+      - apple,i2c
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: I2C bus reference clock
+
+  interrupts:
+    maxItems: 1
+
+  clock-frequency:
+    description: |
+      Desired I2C bus clock frequency in Hz. If not specified, 100 kHz will be
+      used. This frequency is generated by dividing the reference clock.
+      Allowed values are between ref_clk/(16*4) and ref_clk/(16*255).
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@35010000 {
+      compatible = "apple,t8103-i2c";
+      reg = <0x35010000 0x4000>;
+      interrupt-parent = <&aic>;
+      interrupts = <0 627 4>;
+      clocks = <&ref_clk>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 329d3a0a9fdb..380a680db92f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1734,6 +1734,7 @@ B:	https://github.com/AsahiLinux/linux/issues
 C:	irc://irc.oftc.net/asahi-dev
 T:	git https://github.com/AsahiLinux/linux.git
 F:	Documentation/devicetree/bindings/arm/apple.yaml
+F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	arch/arm64/boot/dts/apple/
-- 
2.25.1

