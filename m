Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FF2886703
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 07:46:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DyQfTMut;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1CXW2J7Mz3vXF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 17:46:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DyQfTMut;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1CWn2NCdz3dRp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 17:45:41 +1100 (AEDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a44ad785a44so209599866b.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 23:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711089938; x=1711694738; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOSsKufZ/8yCjM1/hlvnqYOYaN3abG+vGfagOCNtt2o=;
        b=DyQfTMutAERzfPNSdZgyhPv1w5q94C8kuGwAZ1emX6/ppN8mY94T64edZCN7UKBRqc
         LoxQAchukelfbS1D8ebWsQ2IyV3B2HwOekshqqhMSQiJIv6EUdR9K5zEOb/p3wqaupXo
         mRMeNXn1naAo+treiAJECxQuO9w0T5XqtJUEJiJvhYK8FL3hKnbK5wPSpeVl/tEzyXNf
         yMaRyH5nCO6zzp/NzwOf7PpA/RcUWVwyGhMNNmC3PRGlsXTw7I4v2dWFp103M386rIsp
         L9bxFIENBEMdQYR31nMmu3KNdqm4enKg+fJjS1UJSKwzfv/b6Jpx/zaKIfEEqZq08XJc
         WVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711089938; x=1711694738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rOSsKufZ/8yCjM1/hlvnqYOYaN3abG+vGfagOCNtt2o=;
        b=va+DlZ4ytqOrL0h0eWSoCCMS3h6P8lOSCF/16y2L4Hu3tZb6tow4eG0kjUxzw8OW7c
         olNiNvgZnqGdw5CdscXIGrQ/P0Hzs/9FaD9mR3b0qDo2NzDqtTbvWvW1oCXr3/07ni7K
         X22Em3uVQ4xoFW2SzbMlM2/ByXKC1GQckBxXtUAOLByLgRvmT5e1q/3S8N0d0YJgzutb
         03lyTMDJyDyhC8KnXLcIDNIewzVM8hT2drEsVIe4asJL6dJnuRl8ebC8owBTkN8QhjG+
         2t3borVxniMLIoYpO3jOEqBvOijK3YLXKNIXihPR/9QsW7zRPuopNMTQ8z7kRrsSs+C5
         l0Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXhlwKS4U+h+Q6fmfuKPEVbmR8LRD9E2qLvbXcjyphnfg4zEiz45NQCRn4oqR7bR/rKk/PM+wOIDkGFAbhiaSDJFAu45S3NNox9Qt2N0Q==
X-Gm-Message-State: AOJu0Yy/Z09eNb/rahrClBv/INguFwjq3BMg6MJptDxAlSB6/pdAAq/b
	QHkDFP66RagHW/UUPSNeFDX8m3XwGYCW+mZxGiGXCzmMbgHn8QxC
X-Google-Smtp-Source: AGHT+IEKmV1pnUuAwpsoeuF5BAS3RVUv2sjWEX2KhGLMWJPvS465ZIZs2/H3FbqnkYNv5pNHwrmMaw==
X-Received: by 2002:a17:906:b818:b0:a46:206d:369b with SMTP id dv24-20020a170906b81800b00a46206d369bmr970238ejb.28.1711089937861;
        Thu, 21 Mar 2024 23:45:37 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id e19-20020a170906375300b00a46bb8a44cdsm679694ejc.198.2024.03.21.23.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 23:45:37 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 22 Mar 2024 07:45:26 +0100
Subject: [PATCH v2 1/5] dt-bindings: hwmon: as370: convert to dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240322-hwmon_dtschema-v2-1-570bee1acecb@gmail.com>
References: <20240322-hwmon_dtschema-v2-0-570bee1acecb@gmail.com>
In-Reply-To: <20240322-hwmon_dtschema-v2-0-570bee1acecb@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711089934; l=1927;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=dydiCo7iI1NW4gSDYIevGCRXxnVvyAdCyQwXxWD9D14=;
 b=mjJW0wmKIE4uFauQh76CG+KkMvkmn4jNOfu3ARAqE1vXWCXBI7v4NH1AJAxudwdBY+/LWT6MG
 K4pY9WZVNHmCiv/UQr95sYpl4Pf53ojlW5qCWElxZkxK1rqahIK8M7w
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Javier Carrasco <javier.carrasco.cruz@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Convert existing binding to support validation.

This is a straightforward conversion with now new properties.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 Documentation/devicetree/bindings/hwmon/as370.txt  | 11 --------
 .../devicetree/bindings/hwmon/syna,as370.yaml      | 32 ++++++++++++++++++++++
 2 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/as370.txt b/Documentation/devicetree/bindings/hwmon/as370.txt
deleted file mode 100644
index d102fe765124..000000000000
--- a/Documentation/devicetree/bindings/hwmon/as370.txt
+++ /dev/null
@@ -1,11 +0,0 @@
-Bindings for Synaptics AS370 PVT sensors
-
-Required properties:
-- compatible : "syna,as370-hwmon"
-- reg        : address and length of the register set.
-
-Example:
-	hwmon@ea0810 {
-		compatible = "syna,as370-hwmon";
-		reg = <0xea0810 0xc>;
-	};
diff --git a/Documentation/devicetree/bindings/hwmon/syna,as370.yaml b/Documentation/devicetree/bindings/hwmon/syna,as370.yaml
new file mode 100644
index 000000000000..1f7005f55247
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/syna,as370.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/syna,as370.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synaptics AS370 PVT sensors
+
+maintainers:
+  - Javier Carrasco <javier.carrasco.cruz@gmail.com>
+
+properties:
+  compatible:
+    const: syna,as370-hwmon
+
+  reg:
+    description:
+      Address and length of the register set.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    sensor@ea0810 {
+        compatible = "syna,as370-hwmon";
+        reg = <0xea0810 0xc>;
+    };

-- 
2.40.1

