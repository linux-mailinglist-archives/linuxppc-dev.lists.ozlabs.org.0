Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADB3886717
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 07:49:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QDpJanxc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1Cbp5gG7z3vlk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 17:49:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QDpJanxc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1CWw63y2z3dfM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 17:45:48 +1100 (AEDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-512f892500cso2067080e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 23:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711089944; x=1711694744; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZod9FP10mmkUa93vUHm2PRSdkHtpevTJB03xjoBD4k=;
        b=QDpJanxcubczvPqjVkMECExWUTFO/ZVeLfScdwnyjV5MFBCGJgqzZIvtYBP8LlO+Ks
         V1ADWCY75zTtWoB6vmWF9IqjonQX2C6N8zFE9+jcxBhCCT5arQJMd9RqhqYCxGGiqV+z
         HTZKRL27tc0DYhRzgUhrt6VOvX9GjTjrCbWfJICpFUaJUX4fX7dA4/BA3UaZtaUP60Xo
         I7Sy0BDL9zYLAPDxzvRg8M/pOiLtDOOURWaCa9sCoxa0stecR23HDjivQzgNmQkZq6Nz
         1W91gO/ss3DRvjlr4AIjtjCr6jOQCSsq1J/GLRnAStMRlFZXKT2GmqWjwPaOMdxQiHUr
         5gdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711089944; x=1711694744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZod9FP10mmkUa93vUHm2PRSdkHtpevTJB03xjoBD4k=;
        b=GB2KyBbmhR50Um4oLdf7vMiyfgwi5v6XM1Z4nTEIh/u16V6pGE4QHXcbXdKRce76RO
         SOe2Jkf4C19jw0b+FW9/PBYDPtnz9YdWAHIG7nyTGEaw1ehUlP2WJwExRlZhNotFO9uV
         LuB6oZ7h2CGargoZyhLvMXOQnk+jmk6smeSgA6mLkil6EQwlHPg61BOy6ac5vQ2zTpzD
         gmYlPvj6Sbs+i2ktNJNAsksn/7HaBVGKaAzRfIgpM/41UD8D8jzCzldNwKxoqr/z6w5d
         GgvHbKpQjoKB7ZAhBxo/LtoRb+RFYGFxmWZx1NnbXycUdbCyuabfsX7mrivoFEpJt+pS
         NMMw==
X-Forwarded-Encrypted: i=1; AJvYcCV8LdPR4KljtU/ua4Xt0y/P9fCfv2P7s6AxuNOPXUYmQUP/wjsEnAbXUmmuIBhgTQH1+/xbsjdo8URdVS1FatoGH8t/ze3ULSDySQjl5g==
X-Gm-Message-State: AOJu0Yw3wCqX8tJB7bP9i0pcOD9a5ZNTGbMSBCaW71zZxQ3JSI3EReAB
	A8rdTlQtONPRulN7MuWTSSf2goHoY5viPHJIQUvh0Boyj5sgI1id
X-Google-Smtp-Source: AGHT+IEvhheqdTHLtMcisH689/ys8IMvmi721V9abnrt00Akg8dBPfthvPkOmnuHkzcXFZpwv1Uq4w==
X-Received: by 2002:a19:2d47:0:b0:513:a6a7:ac88 with SMTP id t7-20020a192d47000000b00513a6a7ac88mr1177483lft.14.1711089943870;
        Thu, 21 Mar 2024 23:45:43 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id e19-20020a170906375300b00a46bb8a44cdsm679694ejc.198.2024.03.21.23.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 23:45:43 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 22 Mar 2024 07:45:29 +0100
Subject: [PATCH v2 4/5] dt-bindings: hwmon: stts751: convert to dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240322-hwmon_dtschema-v2-4-570bee1acecb@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711089934; l=2153;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=SL6IFykbfJaWw2tZ5nEHGx/wGHJSnUvcwuO85EyOS+w=;
 b=CkO2xlSGeh8rTae0P/EWaWMHbfjClGj75C0xpe4LCm8S42cYNo4Cki3o6uosOvj7Ud+oFOnrw
 1rcW5AhWz8XAA2Wxug+GswK3/pTwD3BzJ2uSBHK9ZvC57hlShLBOKCs
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

This is a straightforward conversion with no new properties.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 .../devicetree/bindings/hwmon/st,stts751.yaml      | 41 ++++++++++++++++++++++
 .../devicetree/bindings/hwmon/stts751.txt          | 15 --------
 2 files changed, 41 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/st,stts751.yaml b/Documentation/devicetree/bindings/hwmon/st,stts751.yaml
new file mode 100644
index 000000000000..9c825adbed58
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/st,stts751.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/st,stts751.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STTS751 Thermometer
+
+maintainers:
+  - Javier Carrasco <javier.carrasco.cruz@gmail.com>
+
+properties:
+  compatible:
+    const: st,stts751
+
+  reg:
+    maxItems: 1
+
+  smbus-timeout-disable:
+    description:
+      When set, the smbus timeout function will be disabled.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        thermometer@48 {
+            compatible = "st,stts751";
+            reg = <0x48>;
+            smbus-timeout-disable;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/hwmon/stts751.txt b/Documentation/devicetree/bindings/hwmon/stts751.txt
deleted file mode 100644
index 3ee1dc30e72f..000000000000
--- a/Documentation/devicetree/bindings/hwmon/stts751.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-* STTS751 thermometer.
-
-Required node properties:
-- compatible: "stts751"
-- reg: I2C bus address of the device
-
-Optional properties:
-- smbus-timeout-disable: when set, the smbus timeout function will be disabled
-
-Example stts751 node:
-
-temp-sensor {
-	compatible = "stts751";
-	reg = <0x48>;
-}

-- 
2.40.1

