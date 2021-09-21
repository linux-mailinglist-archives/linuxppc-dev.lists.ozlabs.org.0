Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C83D413CE8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:48:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDZmn3fP0z3dbY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:48:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linkmauve.fr (client-ip=2a01:e0a:828:c7c0:49:5ff:fe41:d261;
 helo=luna.linkmauve.fr; envelope-from=linkmauve@linkmauve.fr;
 receiver=<UNKNOWN>)
Received: from luna.linkmauve.fr (unknown
 [IPv6:2a01:e0a:828:c7c0:49:5ff:fe41:d261])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDZb63pDXz3ccT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:40:02 +1000 (AEST)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
 id 0DF10F40B6A; Tue, 21 Sep 2021 23:39:48 +0200 (CEST)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: nintendo-aes: Document the Wii and Wii U AES
 support
Date: Tue, 21 Sep 2021 23:39:28 +0200
Message-Id: <20210921213930.10366-3-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921213930.10366-1-linkmauve@linkmauve.fr>
References: <20210921213930.10366-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Ash Logan <ash@heyquark.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Both of these consoles use the exact same AES engine, which only
supports CBC mode with 128-bit keys.

Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
 .../bindings/crypto/nintendo-aes.yaml         | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/nintendo-aes.yaml

diff --git a/Documentation/devicetree/bindings/crypto/nintendo-aes.yaml b/Documentation/devicetree/bindings/crypto/nintendo-aes.yaml
new file mode 100644
index 000000000000..e62a2bfc571c
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/nintendo-aes.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/nintendo-aes.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nintendo Wii and Wii U AES engine
+
+maintainers:
+  - Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
+
+description: |+
+  The AES engine in the Nintendo Wii and Wii U supports the following:
+  -- Advanced Encryption Standard (AES) in CBC mode, with 128-bit keys
+
+properties:
+  compatible:
+    items:
+      - const: nintendo,hollywood-aes
+      - const: nintendo,latte-aes
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: Not supported yet.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
-- 
2.33.0

