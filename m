Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C04C025EB4E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Sep 2020 00:10:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BkTHj3MHPzDqCR
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Sep 2020 08:10:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=chunkeey@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BfP4P1de; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BkTCh4901zDqgr
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Sep 2020 08:06:39 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id j11so13155267ejk.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 05 Sep 2020 15:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dm+r+hKRZdZSY5p5jObjvcH8LXc+2rkrpKCGr8Z9U1Q=;
 b=BfP4P1dedduYAorS2gf0y3U30a3uBYt3buVmE4DUlQsKhQHCPONHYetxiX4/ewkciL
 PnN/QdjFalAmJKLYUD+aUZKKazx5dCEvRbWUOZVPB3XU2G5+M/KnMtPFzO2KeTXUAH6/
 8ziBgXm87uDEby5JR0/8tucvfm87YYqxfaXqwfIrHROKAq8B5AqkPvnwH5asZ6MRNSpi
 i8BJ6XXCO9ttnZG3CxCvcSkHtZZBef5iO6FwfadH6DUGUcqhzZx2Gfxo4h8zeNpeFv7i
 vb66riy7+fbPgdSSeVyHmSTk781TE/sf67Z2VMOrzKdvByJBCsdLdrnOiiwt3AXsHpQn
 r5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dm+r+hKRZdZSY5p5jObjvcH8LXc+2rkrpKCGr8Z9U1Q=;
 b=Rs4G6Z4B4aJFD2J91clUXrc8+t34sb/PxrvpG28jkL3Lc/C+QZ6ECcKmfrl+KP+C45
 HlTNHdjTqHsu4W0KhQbZR1pwkM9fMrBFpcStbVsoEJHDakWQXeSS3xtVmobarcKrTAoW
 i/oiueUgfF2MqAyhlfxWljxHhv/1TClTxAasdeHQMVP3oKifi+9eUbs88ZLthKbKiWjC
 OUkAwkOMLsxOMnA8rcD1Gx0KITpNrK1nOb7U4xc6puJccSOBMrYwr3BcYbDa20VcC/8v
 K0mtPdA+Pywq71ovLrCuEu1aghUW1r5u7OaNf4UdJAOJSS2zcQElxbDoVWycbFkr4/a8
 5xyw==
X-Gm-Message-State: AOAM5331eQWKw64HUu7tsZBSxuI8rMCp45Zxg4TvoNlv1G592OooOoya
 TVHs8r/qP8iez06GQopjHTNjZCBq55U=
X-Google-Smtp-Source: ABdhPJwMYVu6MLJ252FUB4Py7u7wBzjuQ/bwGpIV6m7B1bKWVNtKeg4eTdJJpEXfCRDXad2OyHwoxQ==
X-Received: by 2002:a17:906:2858:: with SMTP id
 s24mr13356847ejc.399.1599343596053; 
 Sat, 05 Sep 2020 15:06:36 -0700 (PDT)
Received: from debian64.daheim (pd9e292e7.dip0.t-ipconnect.de.
 [217.226.146.231])
 by smtp.gmail.com with ESMTPSA id c22sm9967736edr.70.2020.09.05.15.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 15:06:35 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.94)
 (envelope-from <chunkeey@gmail.com>)
 id 1kEgKD-000FIk-NZ; Sun, 06 Sep 2020 00:06:21 +0200
From: Christian Lamparter <chunkeey@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/5] dt-bindings: powerpc: define apm,apm82181 binding
Date: Sun,  6 Sep 2020 00:06:11 +0200
Message-Id: <aa51a2aaffcbf98c90d378f6f6c7b926989b6c27.1599343429.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1599343429.git.chunkeey@gmail.com>
References: <cover.1599343429.git.chunkeey@gmail.com>
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
Cc: Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>,
 Chris Blake <chrisrblake93@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

make a binding for the various boards based on the
AppliedMicro/APM APM82181 SoC.

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 .../bindings/powerpc/4xx/apm,apm82181.yaml    | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/powerpc/4xx/apm,apm82181.yaml

diff --git a/Documentation/devicetree/bindings/powerpc/4xx/apm,apm82181.yaml b/Documentation/devicetree/bindings/powerpc/4xx/apm,apm82181.yaml
new file mode 100644
index 000000000000..03a3c02fe920
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/4xx/apm,apm82181.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/powerpc/4xx/apm,apm82181.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: APM APM82181 device tree bindings
+
+description:
+  AppliedMicro APM82181 Wi-Fi/network SoCs based
+  on the PPC464-CPU architecture.
+
+maintainers:
+  - Christian Lamparter <chunkeey@gmail.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: APM82181 based boards
+        items:
+          - enum:
+              - apm,bluestone
+              - meraki,mr24
+              - wd,mybooklive
+          - const: amcc,apm82181
+
+...
-- 
2.28.0

