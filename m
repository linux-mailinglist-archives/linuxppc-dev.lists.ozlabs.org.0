Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 707A8886271
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 22:17:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S0y2jcUF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0yvz1f8Kz3vhr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 08:17:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S0y2jcUF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0vW938rMz3dTw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 05:44:05 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-513d3746950so1661232e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 11:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711046641; x=1711651441; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZod9FP10mmkUa93vUHm2PRSdkHtpevTJB03xjoBD4k=;
        b=S0y2jcUFudn0jmjRHnhH1mdr4n4K/8OLeLhIJO2nhiuIYSvIFy0SYWOVf9cMeKqQca
         Q6df8B1gqJQclvKjjlz9uGVCybqcSig+gI3ZZFtuqPuVj83WS3CLbem75vqAJs0yWdhy
         /rQjGXaD+myBZX25bNfy52EtX83SYxYgUDMlCDUAkB5J3CrfnAsAlHW8/LAnbCTTk/CD
         aM56AT7a7QaRZ1lwAojFKoVc0D7OF1w2xMJ7GZIOimGTW/NbWTclh5MHDHcxa6r5Pl2C
         ItWbn3kB0wSjMcVYm6iYXIOrNn7/XOvNPB+ZY0ppaPQhVFzgHGgSdeP9R0HjdWJIIzHb
         D4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711046641; x=1711651441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZod9FP10mmkUa93vUHm2PRSdkHtpevTJB03xjoBD4k=;
        b=Gc6bjQsAnUC6redR3lZKfaInAkaLWmPYsWbMkxkIPS5XgPFm/AoKLxIN7thGrGoBb8
         Ut7h9bsaOD1oXi4R16kYP8u5OtvhTr2Atxs4gdXa6DVeddAxnlg6UYqWcMsB+Fxw5Pq7
         t4kgvoz1LzlITD8REaY6/IgPDAbDlPpsgYoEol0DozRAiaYlRkCCiRheOoHG5Tk/dOMM
         pmTFsntRlWdy3iTPbFe4oJnujYBSWSm66sXUKzP921CO+EnE2pnOoncbtYnieif2gxgz
         o1pwn0U8GpMoT9qss7o3XzKwQxGL9qw/drusUSd2VfoFLtxhZScR86+huexZX2a0qoa2
         Ertw==
X-Forwarded-Encrypted: i=1; AJvYcCVWoaT69x3VnD1Tz0yaWjMcCQxU/EbgIXxmNjZs66+Y0qi4ZIsxC4GByuqTSB7/ozd+RK1rFumbNsQMgtpBZ3dJD5qfoNNtJKI2xU0S6w==
X-Gm-Message-State: AOJu0Yy8SZDWeydabWzkumbUZk68irzpnPaNN+Ba+uTONGZ42F/7swko
	LWcVmUqo1GC0Bt2gZ2BsVGcqDZysF9ldgcful+HgqD9K+gYGrEgx
X-Google-Smtp-Source: AGHT+IFm+lPaPah3aU9llD7EleeYDcjEK0aQBz65oztMXNAemS6XipbJkF1x1Cl8Q/EmmxGIB6bBkQ==
X-Received: by 2002:a19:5e55:0:b0:513:c60a:5fc0 with SMTP id z21-20020a195e55000000b00513c60a5fc0mr192787lfi.0.1711046640578;
        Thu, 21 Mar 2024 11:44:00 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-7db2-5855-2c59-b89b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:7db2:5855:2c59:b89b])
        by smtp.gmail.com with ESMTPSA id t6-20020a17090616c600b00a4576dd5a8csm188627ejd.201.2024.03.21.11.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 11:44:00 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 21 Mar 2024 19:43:45 +0100
Subject: [PATCH 4/5] dt-bindings: hwmon: stts751: convert to dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240321-hwmon_dtschema-v1-4-96c3810c3930@gmail.com>
References: <20240321-hwmon_dtschema-v1-0-96c3810c3930@gmail.com>
In-Reply-To: <20240321-hwmon_dtschema-v1-0-96c3810c3930@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711046632; l=2153;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=SL6IFykbfJaWw2tZ5nEHGx/wGHJSnUvcwuO85EyOS+w=;
 b=vuGSNmDWCGBI3R/HkrLqvea2y0JsHVO8pRszHqQINVTNy0Mz5yoK4xwonUQ5ZhBdIJrOy+5Sv
 34YVfNecs3wABT2e0Vzp0zo17fwdU9eiJP+87R2dm0QCJU/BopLOpjG
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-Mailman-Approved-At: Fri, 22 Mar 2024 08:13:59 +1100
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

