Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4738873E3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 20:26:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OYFAM8oR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1XPN6qfhz3vm7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 06:26:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OYFAM8oR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1XMp07l8z3vXF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 06:24:52 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-512f892500cso3030492e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 12:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711135487; x=1711740287; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZnGroDIqCF/lMVS0ApuLGPQdgg2yOe6mXFPk44TpZc=;
        b=OYFAM8oRBwy2m/HYwRZLUH4e28eCSFAbDMvhW1Bu0/bN9o0PVckO6dXdi4nxL0B4nu
         YhVQO0taf3nQPL7JycaeP63fTkA7d2355dHXEg1yTEwJ11gHRs7f8qV21lmRetj1deE4
         pg0WzKTljH/r2ARKJi1f75N2WU1D53N+nRNQJ0Uo+jxAJ5atT4cxtQ0il9MQLYxf9YXw
         ObSzzE6iuJ8WErSk0A7GAeaxHc9gx6cEgB4bFGfpYIjKy3zKgJwvpSPGPfy2kCp+wb3Z
         2C2NbWgrakYLCmKHFP9zfbUktZ95eX4H6HHsQlLwRZBHB9GeeL6/zYV8m5u9Uoafkacz
         ik3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711135487; x=1711740287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZnGroDIqCF/lMVS0ApuLGPQdgg2yOe6mXFPk44TpZc=;
        b=Z7yd6yVh2F0nvFQAo+az3S6nn8Zsd01EJ2pEjKae301vqiOjjp0MU8UmNOZZ+oMK9T
         x06Z+hd42f3tH7GKqTDqIlve2K0ZcROcy2lpC4TLnK6U4sIEwpUcgmtQIHoKfcfhHDkF
         iM45VWnUOuF7tIPQpf85Nrh8p7Ng44ynCI8evniFmdGycNu2sr/s4jCnuM8fADstN4RT
         mFsPPQGoeEdrrcMytIls9Z3f5lWKYsZuRlGomZtWSsGsL5ZMk1asD3i+wjPFoGeg9jn8
         RxQcLgGWQopUP0fmDIKoVy/KdTO+TEUC1X8Psimant0RJSGnigyL0SQhzv3sos6pA/ra
         XkDg==
X-Forwarded-Encrypted: i=1; AJvYcCXgsu/yiFvsuHBR+FQxwTSOydWyH3n1GozcdsdR77Nvtqs6yzILC5dkT63Gd1riPDC3opaIoowXDHmNGlCRy9adR+Ll1b4mBueH90TefA==
X-Gm-Message-State: AOJu0YyaAXKGFc6YoHGYeHZe/YBuRul2Udu8HdfK4gdyO1riNFEUsbDA
	m1aviVMcgsvSYPv390QD2a2uBH2IU+Mv5wJeAPNGBvljkNTbOy8w
X-Google-Smtp-Source: AGHT+IGGyVKkxeA1Y0HyiM85CqmDIq34jH74s4IHJuZKr9P3A15+SZzTvwvPnoi9mUIq67umtHs1TQ==
X-Received: by 2002:a19:4344:0:b0:513:e14d:15e1 with SMTP id m4-20020a194344000000b00513e14d15e1mr312698lfj.57.1711135487059;
        Fri, 22 Mar 2024 12:24:47 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-b7fa-7d92-6b28-0504.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:b7fa:7d92:6b28:504])
        by smtp.gmail.com with ESMTPSA id ku12-20020a170907788c00b00a46b87c32besm138572ejc.39.2024.03.22.12.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 12:24:46 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 22 Mar 2024 20:24:36 +0100
Subject: [PATCH v3 2/5] dt-bindings: hwmon: ibmpowernv: convert to dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240322-hwmon_dtschema-v3-2-6697de2a8228@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711135482; l=2606;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=O6ZF8AixVLf2eRm+20VlkeyMfauGenKZYfdBbtHsutY=;
 b=0k3y3yB8td836Vv0vjh5jj1vLP7hRXi8mtoE4bgIlJu48ClDtv2TlLskejv4mugvbWVAsoSym
 8fJI9TnfeZsBcncWzvR/6JvN1F+4wJpDnSGIc76J95Uw/RNE6fKayFL
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

The binding has been renamed to match its compatible strings, with no
further additions.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 .../devicetree/bindings/hwmon/ibm,opal-sensor.yaml | 37 ++++++++++++++++++++++
 .../devicetree/bindings/hwmon/ibmpowernv.txt       | 23 --------------
 2 files changed, 37 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ibm,opal-sensor.yaml b/Documentation/devicetree/bindings/hwmon/ibm,opal-sensor.yaml
new file mode 100644
index 000000000000..376ee7f1cdb7
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ibm,opal-sensor.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/ibm,opal-sensor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IBM POWERNV platform sensors
+
+maintainers:
+  - Javier Carrasco <javier.carrasco.cruz@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - ibm,opal-sensor-cooling-fan
+      - ibm,opal-sensor-amb-temp
+      - ibm,opal-sensor-power-supply
+      - ibm,opal-sensor-power
+
+  sensor-id:
+    description:
+      An opaque id provided by the firmware to the kernel, identifies a
+      given sensor and its attribute data.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - sensor-id
+
+additionalProperties: false
+
+examples:
+  - |
+    sensor {
+        compatible = "ibm,opal-sensor-cooling-fan";
+        sensor-id = <0x7052107>;
+    };
diff --git a/Documentation/devicetree/bindings/hwmon/ibmpowernv.txt b/Documentation/devicetree/bindings/hwmon/ibmpowernv.txt
deleted file mode 100644
index f93242be60a1..000000000000
--- a/Documentation/devicetree/bindings/hwmon/ibmpowernv.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-IBM POWERNV platform sensors
-----------------------------
-
-Required node properties:
-- compatible: must be one of
-		"ibm,opal-sensor-cooling-fan"
-		"ibm,opal-sensor-amb-temp"
-		"ibm,opal-sensor-power-supply"
-		"ibm,opal-sensor-power"
-- sensor-id: an opaque id provided by the firmware to the kernel, identifies a
-	     given sensor and its attribute data
-
-Example sensors node:
-
-cooling-fan#8-data {
-	sensor-id = <0x7052107>;
-	compatible = "ibm,opal-sensor-cooling-fan";
-};
-
-amb-temp#1-thrs {
-	sensor-id = <0x5096000>;
-	compatible = "ibm,opal-sensor-amb-temp";
-};

-- 
2.40.1

