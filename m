Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E678F8873EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 20:29:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ijd4Xjc9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1XSZ4v5kz3w9J
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 06:29:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ijd4Xjc9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1XMr4knxz3vZX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 06:24:56 +1100 (AEDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a46ce2bd562so360635966b.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 12:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711135492; x=1711740292; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k0ZX0mSNtR84zaDW6QrVcacYADFhCeQmdayKmvm0d6c=;
        b=Ijd4Xjc9qr/3+nyc/lKvphp3uUlB96ZbRkb5so9OgfUagQ0bl4vSoHp9SF+dg0Ay3+
         23GsSiSldbfK8GfVEmx5lTRobbjpbfmA8i5vnlpkTHzQ13f+mlVjjZYO2lwBSL3LVTo3
         m0wcIW4wwGs8kzbOgqynBopfh1pbzvzlmN002iDbCgS4La540++tOBKr8feZblGvxCBV
         CyT4+GpE0E3xMh5tHQyGe71J6dFPvFbnAE6vlWwJAx26w7cQSsQbmEVdT73+3o+QkcEZ
         WvIcWZl/DYD57I2zOv4jxuu2e4svCfEcoCzogluiKj5VBhWzQGwLUp/p4+l3E3/WX051
         Ltcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711135492; x=1711740292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0ZX0mSNtR84zaDW6QrVcacYADFhCeQmdayKmvm0d6c=;
        b=UQYSdwgopD/kzMsZpcQfqBJvY455MZX+78ySR+rQErIKNjZ3NF+9A45qzD2KDGa+JE
         D5gk4mzYp+giz25svl+eT+RAcLY6++CLoZsmq87abvqddpcy61XCYDXAa0itKXXQggLF
         r/ZFFI+BecwXHtdwMyFsbXIaoXXDp9iZrbxS+MMzn8+SGQnA/a/K/91FrpnvkcKeqjqC
         BpYQS7phOP1m3jURUZZDHxmacs5a+lMMBOjIYy3KRYw+scQXtxT/wvQtnHiY98ywfHoQ
         QfkthYYr4xZGoOxYtK+MfIXyZO9or5aqOCebxEpKcY6ZnTQ7XjI2Oi13ya2MZYl1RRU4
         Yo3w==
X-Forwarded-Encrypted: i=1; AJvYcCUwcQ55vRPyqgYgpotO+DXb/UsuqgSHXGzUT7pVYAi7oqsKPrUkLJse+j5eD46aCZS36cEjEWG6X+wkb1gjST+/AX0iB4yUhajDucQF0A==
X-Gm-Message-State: AOJu0Yw9/RT7/fnHC74nwE63vuppvL5W9wIir9LObpLXuqTuuzuirI/3
	lci4KGcVEirKKbJcqIa6sh8ylIDlrXPIpzU6xv1HESwnIGsd54Ws
X-Google-Smtp-Source: AGHT+IELHgSsJUpsN7yw8plhcYvSHv3xoFGdy2OWmwfX2zWELl6zDgevNE+MyEEhH8Jiec/NFjsrXQ==
X-Received: by 2002:a17:906:3e19:b0:a46:c0dd:88f7 with SMTP id k25-20020a1709063e1900b00a46c0dd88f7mr483888eji.17.1711135492177;
        Fri, 22 Mar 2024 12:24:52 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-b7fa-7d92-6b28-0504.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:b7fa:7d92:6b28:504])
        by smtp.gmail.com with ESMTPSA id ku12-20020a170907788c00b00a46b87c32besm138572ejc.39.2024.03.22.12.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 12:24:51 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 22 Mar 2024 20:24:39 +0100
Subject: [PATCH v3 5/5] dt-bindings: hwmon: ibm,p8-occ-hwmon: move to
 trivial devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240322-hwmon_dtschema-v3-5-6697de2a8228@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711135482; l=2051;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=4rUBSyPV6ao55dHemnHVuLdadgQFFoAi54Gb6HBKVTY=;
 b=zWmOM6kGKZqUQ+f1L0py3IV+XS117E9ltKUW8/tcaqs7l9b5mKAT/Kh5w3bCFk7xCLyks7s5q
 vIrcv2/ZrWaA8uTw6J+NgLLb4IsEFsI7ut1VFEDUJXGbiYLtBxiUPms
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

This binding meets the requirements to be converted to dtschema
via trivial-devices.yaml.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 .../devicetree/bindings/hwmon/ibm,p8-occ-hwmon.txt | 25 ----------------------
 .../devicetree/bindings/trivial-devices.yaml       |  2 ++
 2 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ibm,p8-occ-hwmon.txt b/Documentation/devicetree/bindings/hwmon/ibm,p8-occ-hwmon.txt
deleted file mode 100644
index 5dc5d2e2573d..000000000000
--- a/Documentation/devicetree/bindings/hwmon/ibm,p8-occ-hwmon.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Device-tree bindings for I2C-based On-Chip Controller hwmon device
-------------------------------------------------------------------
-
-Required properties:
- - compatible = "ibm,p8-occ-hwmon";
- - reg = <I2C address>;			: I2C bus address
-
-Examples:
-
-    i2c-bus@100 {
-        #address-cells = <1>;
-        #size-cells = <0>;
-        clock-frequency = <100000>;
-        < more properties >
-
-        occ-hwmon@1 {
-            compatible = "ibm,p8-occ-hwmon";
-            reg = <0x50>;
-        };
-
-        occ-hwmon@2 {
-            compatible = "ibm,p8-occ-hwmon";
-            reg = <0x51>;
-        };
-    };
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index e07be7bf8395..87b0dd9b0734 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -126,6 +126,8 @@ properties:
           - ibm,cffps1
             # IBM Common Form Factor Power Supply Versions 2
           - ibm,cffps2
+            # IBM On-Chip Controller hwmon device
+          - ibm,p8-occ-hwmon
             # Infineon barometric pressure and temperature sensor
           - infineon,dps310
             # Infineon IR36021 digital POL buck controller

-- 
2.40.1

