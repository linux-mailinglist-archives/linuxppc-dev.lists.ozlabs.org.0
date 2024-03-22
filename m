Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDF28873E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 20:28:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=le6kDbzE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1XRn1TB8z3vjq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 06:28:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=le6kDbzE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1XMp5dhXz3vZh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 06:24:54 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-56829f41f81so3010822a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 12:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711135490; x=1711740290; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z0qn6EG3GrsHqpOB936k/w8hIJUCfUQFAV2vkGQLEp0=;
        b=le6kDbzE0tyk5XifcULqMGScSW5TpZpgy3FV+rJFWLSGN5ZszvXJC2SQVnFLF1QXyM
         xoCnXqK4aqjWixDrmWQqtSv/ue+BrYCUDw2SkLhlKgOZoGC+mDdZvw8haiQ9LL/YzFys
         622skHp4r4IkVxJvzcbNbBjvz8Ss0TMCL6EGRJVt2ivRJesoHMXvNtVuYKL+6ZVWEQcw
         71Ny/uAX7mdICPqePyjA/njRGJS5goVKHILECBc1mzQai96aDKAYSP5XqI2RBomMFTEt
         wXNEeJQqxwoJKUMlZhdKzM4Z4B4uVtdeylWqzZRohRhbHzSasvwyq5WGRsNGfdQZpDIq
         P9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711135490; x=1711740290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0qn6EG3GrsHqpOB936k/w8hIJUCfUQFAV2vkGQLEp0=;
        b=fKyFvqBE93wyp/uqULhiPLmbg/IMCuFvBerJ+Nd+JBBLrpsDoNBADaEcbXmoeWv8xk
         VGtCCeBvqpQUVwdrMeWoCvnVp1dJsd1a/3UA7aXtsp0/LvO/2zVWjiS0pbSu1xbiyh0k
         7DC5B9W21ds5kwTmPBpWYiAQuyNN4UsqecXtJCDsv15BAhq2AoCm8rQVg5gKaq9/E1ch
         9C/q2not41hDXwa2gyg5EIaOd2ySYatZ9T8LCb9bzMm7mlSKVfXrGE0IiDKhSJG8S0zh
         XiZQ4wF3LenLFo6EXIcOyVsDIx5EPzSBjW66Z6mJg2rUQOa03djldjNoIebfgbtSI0VI
         erJw==
X-Forwarded-Encrypted: i=1; AJvYcCUaPNgrCkjirszjbgCdX4t9bSdaUzazazq/E4m3Sis0lCe9/e2giDKJHiA2V1w0hpZ353mYVBkiiNdM0QuYyZssfFurY3vUQpyAw/OJcg==
X-Gm-Message-State: AOJu0YzbXA6DXEaEoU04B/LvwS+Gpakj6X+A9Z8NapQKtL7Pd06BAbxP
	w5vxtg5DfZoq0ayjdPuwKRf3WXIJotx01sCk6nG42VNEdHwHAgp6
X-Google-Smtp-Source: AGHT+IEjIVI8QESvEO3Htw539vsXNX9NF9f9TsDBWTJfZ9q1LVdbqw2eP58R/0i0gyBR9SJ655scjw==
X-Received: by 2002:a17:906:4ece:b0:a47:345f:de7b with SMTP id i14-20020a1709064ece00b00a47345fde7bmr451135ejv.59.1711135490502;
        Fri, 22 Mar 2024 12:24:50 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-b7fa-7d92-6b28-0504.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:b7fa:7d92:6b28:504])
        by smtp.gmail.com with ESMTPSA id ku12-20020a170907788c00b00a46b87c32besm138572ejc.39.2024.03.22.12.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 12:24:50 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 22 Mar 2024 20:24:38 +0100
Subject: [PATCH v3 4/5] dt-bindings: hwmon: stts751: convert to dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240322-hwmon_dtschema-v3-4-6697de2a8228@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711135482; l=2209;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=wUpWMU2bOBD6Qwu6TCUYfBngziKtHdkpYGHrXVf6ZaI=;
 b=NDqKnaT/P4mE/GWz2eFqSnF/44C8crtro+gdf4XptGUjavRzlNzPjgh5R2GTrCig2NzJwwhYo
 3im3lgjC6v7DXBDTYrIV58QXRPfgrhNMZzY21LtvQ9erQSMTYj7P1RE
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Convert existing binding to support validation.

This is a straightforward conversion with no new properties.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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

