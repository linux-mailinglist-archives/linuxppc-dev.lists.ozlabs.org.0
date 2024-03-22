Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F23688873E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 20:27:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N02JSo/C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1XQz5Hddz3w3m
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 06:27:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N02JSo/C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1XMp0qZCz3vYl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 06:24:52 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-513d4559fb4so3142966e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 12:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711135486; x=1711740286; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOSsKufZ/8yCjM1/hlvnqYOYaN3abG+vGfagOCNtt2o=;
        b=N02JSo/CcjNU711TB086d0HoLqCYqXwUx73MFd2Novw8Gm4HpSon9qnvFgCxxafcvR
         avk24iRcRGYNxEaPtfa0SNu7BoIm8ki1V9npFf6aaxno+awRSRlRSGzYBC0mFOZP39YS
         aqvS3ib6tHXFyl5vs6WL+bUdneDhCc5zraNjUe6dtH9vPiBLUYlyGX9ayIxjMdtkI6xi
         p4Bq9WLUWA5p4qVTjxnrhY7JiQc/ahg0h9gZpz5zEuGuey60YPEKLvrAMlhYaLDFxH5g
         CEwxf2ITdZ3Kydks+K5pLc9NEQURNMpmGdVWxXq/RxDoIqx7vPJc7B+6DAwvwaHsE9uh
         gsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711135486; x=1711740286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rOSsKufZ/8yCjM1/hlvnqYOYaN3abG+vGfagOCNtt2o=;
        b=QF3dbh3I2RysA6aGPvgV3aihuojAnUALihEZIbuaJ2UJVWdYSG+26JIaKNOp3gX0lc
         pZOh4/4RtqcGV9mguh3AvTdfLQyy6w4LGlpwQHEpgFEfh/O0Pvp2iTtAdCp4KtY/mQY/
         zuwF7TiutrEP8+1GaPX1QUtCRCi9Ez9g0f8bU9X9a6mAYDcY6a28KAoYGJoFmYzfPcR3
         rprn0q6bjVCeQO52TGfImtglCVdsy/8oeG89du+EcVt6uThOIDVTLZB4x0gijuqWY5k6
         3HOso30D0iQPgiuxPZ2bD2oDDywuSN4H7mGNhflL3l8RU9e4bVepKe+mXSz4pK97Kj1m
         o3mw==
X-Forwarded-Encrypted: i=1; AJvYcCWm3vuQvI+D1xaTG2PeU8jr8ZDQudX4lzE4seI4rLqHzmU7li/if353uD6TLXewHPTBZkeXijJOKrGIrMu3qOBHxbKuqZqcwPJ6MRJ5Tw==
X-Gm-Message-State: AOJu0YzM05jVgw6W2GZy5ORqBDhRRMwsJts1fDb6HVXovtp9vquwA9Zu
	j3ECBVShZhknpVFMDP9vu4LHliHhmPBwmqTvxFM7FisiPaLyXJfa
X-Google-Smtp-Source: AGHT+IHuDeX4dcgp3CoihbTxC+N3DhZXs1ducT1pLshzXnGYUwm8bzwKCXmTT9H7MVuempz6zsEdZw==
X-Received: by 2002:a05:6512:4dc:b0:512:ac3a:7f27 with SMTP id w28-20020a05651204dc00b00512ac3a7f27mr242869lfq.66.1711135485537;
        Fri, 22 Mar 2024 12:24:45 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-b7fa-7d92-6b28-0504.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:b7fa:7d92:6b28:504])
        by smtp.gmail.com with ESMTPSA id ku12-20020a170907788c00b00a46b87c32besm138572ejc.39.2024.03.22.12.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 12:24:45 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 22 Mar 2024 20:24:35 +0100
Subject: [PATCH v3 1/5] dt-bindings: hwmon: as370: convert to dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240322-hwmon_dtschema-v3-1-6697de2a8228@gmail.com>
References: <20240322-hwmon_dtschema-v3-0-6697de2a8228@gmail.com>
In-Reply-To: <20240322-hwmon_dtschema-v3-0-6697de2a8228@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711135482; l=1927;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=dydiCo7iI1NW4gSDYIevGCRXxnVvyAdCyQwXxWD9D14=;
 b=uCAp20yjInGDG8gzJ0FIAQrtzc84wwJxhwfUU7eg3Q01+/KMV2/ykxX6enHJhFF1zbBAr06Fg
 /fNFWQrMotKCbHp7vDRQHzsfqpghKPeXdhpvIC9B3qgFCAr+VI1Na47
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

