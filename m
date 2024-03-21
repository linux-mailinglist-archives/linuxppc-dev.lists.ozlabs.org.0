Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E48886262
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 22:14:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MgYVBu/K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0yrp1XWFz3dvs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 08:14:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MgYVBu/K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0vW61k1vz3dTs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 05:44:01 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a468226e135so165773666b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 11:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711046637; x=1711651437; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxQdV0gSwFea/wvwZN65K3fXrbPQE6rK+EuyPQNgzgU=;
        b=MgYVBu/KRY9dzcXBKafut4kAx0Xic7r+uUyFTh6ChW/g9gBI5Lz01oKG+aXy2P61RE
         tLEqnLm0X2Yib15l5x3AdQIan+4PlCFO5Bk0vGbwUOvKPHShyWMum0tISlHKTr+nB3k6
         9zei3FpORELdhhFFvSpX/GHCpLMEIIPCrrMcUVTBJCeqFCXfP2cxfrd/PGEPluHnKles
         X7LdwCrIHnLp9Yx8Rh73dNhEx79C3G7V7Onk2ZkDKJHn+E/xJlPoPUL2/wKHRYMXI3pu
         J3r91DuLj87uHwnixCeusyFQUPmQOdis83cQ8mFhfiqNy+ceh82UL7zSmXWQ5scJqufI
         Oh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711046637; x=1711651437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZxQdV0gSwFea/wvwZN65K3fXrbPQE6rK+EuyPQNgzgU=;
        b=XWHAznHvYhWu5JRD0ZJMxYAoW2y59znjSB0dT//ST6qsrClYlNmcIrQbuefuJqkGu3
         nsnTPlTTpGyFeKx+UFJM8wdzplPSz6MVm7tHjn4551uMAdBsF4o6oKEe3KLY2SzKLk9Z
         jt1Qp3Jjt8iaHEmriGu5g9UEhjpWWXcZX3wb+fglJF+3APyNd87YL6YHHUzEtkSK8X7x
         JcDIAzyGvL2XZckZlUeYJHFMB+2kL9MRfDrZHBeRlqSVKWa3E6LZsQKCdZBu7Ty+m6WY
         WWXDBEilJ+ipZjT5PD5r23C4Z6qLee1Q9I7NXUJhTxNiEp+tOManvgWLGoev6RgBggBn
         Bzjw==
X-Forwarded-Encrypted: i=1; AJvYcCWtaeet8kMxepX1gq0gChfxFxUlezlQMIxSw687vsDUjbVXy8tFu8g1vhKcuEMlcY8mvUg15/tL4iqExEdzzY3exgPkOWUC73bu/LX7oA==
X-Gm-Message-State: AOJu0YxkWzzEPJ13DExDZ7C8Hqx9cBYPmBNzT9/OT8tEvcAtPC344LR9
	fXIoBZtpZ7VwFy0jczzDmBrKhAe33uWNAW4wXFjrlKfuMlM2kOzZ
X-Google-Smtp-Source: AGHT+IEG3AMGQ1osr9ItXCZUq1B19nD5/fEmokg4CRjx7D3N3zMzsZXK4cQeC/aBxwlB5SfDdpP8lg==
X-Received: by 2002:a17:906:fb06:b0:a46:b4c7:341c with SMTP id lz6-20020a170906fb0600b00a46b4c7341cmr203638ejb.58.1711046637340;
        Thu, 21 Mar 2024 11:43:57 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-7db2-5855-2c59-b89b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:7db2:5855:2c59:b89b])
        by smtp.gmail.com with ESMTPSA id t6-20020a17090616c600b00a4576dd5a8csm188627ejd.201.2024.03.21.11.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 11:43:57 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 21 Mar 2024 19:43:43 +0100
Subject: [PATCH 2/5] dt-bindings: hwmon: ibmpowernv: convert to dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240321-hwmon_dtschema-v1-2-96c3810c3930@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711046632; l=2489;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=B4z+N7ahUY9ApzqDTqzWOq9rCMknJMon3IQBcjSmS+0=;
 b=oqyia0IGym0y9rYVCkRgAlrQNxtFb7uL+qIR3kHFpYZ4LBCMWtK9h2dIytpqyKwpEpo0Nu34S
 7L5GmIk/5n3DJ6sb2wPxsv1/D2ozM6IoFmN6E47+RW9/n2CiOoHptmi
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

This is a straightforward conversion with now new properties.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 .../devicetree/bindings/hwmon/ibm,powernv.yaml     | 37 ++++++++++++++++++++++
 .../devicetree/bindings/hwmon/ibmpowernv.txt       | 23 --------------
 2 files changed, 37 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ibm,powernv.yaml b/Documentation/devicetree/bindings/hwmon/ibm,powernv.yaml
new file mode 100644
index 000000000000..27c949b94c7b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ibm,powernv.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/ibm,powernv.yaml#
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
+        compatible = "st,stts751";
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

