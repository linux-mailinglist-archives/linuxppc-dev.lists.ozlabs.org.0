Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E9D88670C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 07:47:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q7CF7u72;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1CZ55FpVz3vfQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 17:47:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q7CF7u72;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1CWr1JtSz3dRr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 17:45:43 +1100 (AEDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a46ce2bd562so241878766b.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 23:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711089940; x=1711694740; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7MsEAz+9LEdA+n5F4viKLmE3lAJcvkoHSIBKA1QCQsw=;
        b=Q7CF7u72v9S4hFkfEVACpNck2JQwB2HDlPmx+g+/U1k16pnKcZvfLxyQVp7b/1DeYm
         WKO+zEQ63nUJtA4zkFx+8uKqlG075TrBSlAbeaxUJWjcJV/WDHhd+dHdVGpPqsJRACBf
         JKT7yCeA5du3xm8+XTI34uzwB1bk9pq7UfQxiqUfZuo4mlqHc586LlptMeFUyATnTuvc
         VA0O3B3R8qicrYZbZpDdtS965D7iltWhEDcUjgnPA4GA4zO+eLhkDuGHBm0/cYPfqYFb
         bAKChzcpUX8J6/pCOLfQLFFaciu8MjSJ/rJwYOhxKQKrSAbzvI23dSmTxFCoi1/3QYV3
         1qPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711089940; x=1711694740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7MsEAz+9LEdA+n5F4viKLmE3lAJcvkoHSIBKA1QCQsw=;
        b=Hq8eQHxOllTFOLZx+46MnXQAmo40IsmAlHJZdULeq045Uz8G52e6VKulG33g9mzkZr
         K4I6Sotaq820pMDpnCbmwW3YcwL7pqBci3e1VDNR+mnEQwhmQGAHDep1uEUNKG8TkjJT
         8dR3mZfF75VuoHO6ECvE612UaJQVQACfgoalDZvnUvs9rL+Lgdb/2dKEx1hSxRElr/F/
         6CiSiXaAarNspYPqQOX0Th1ECqX/7VIuexD/xfc7wSdbo5VTkvYe1tp2/bIO9H1l9z8q
         /L/Ri36BMXzTcEV9lynxGMmr8oL2GPU3vyVYNnMu57H6Iuxm+rjObKnJk5dFSFMaRSnQ
         PHdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpyWzHUriu25wNuzz0B/FPYW5bEJczyJQ+yuGKwwClhqqTO4ZFHx6SatmarlrG4nsPeCexMgKmsZRDDXtfNdPYVZS07T0+KVfVDjJ7ow==
X-Gm-Message-State: AOJu0Yzoz7d/oUOsP+xHRreNtBhjavIAXOkDSRscdZoXHSU4m3ihPp5n
	jkCyJh+7BjU4w4RZdfl5wEysDH+dCsggRmZKsdkQoHPGjBS8FLnz
X-Google-Smtp-Source: AGHT+IHREvj01EsbKiiQva4CdE4k+soXe/2fsiihxknRWMchMegvdTdXqeew6z0bVCcGYfQRsQaNjw==
X-Received: by 2002:a17:906:abc7:b0:a46:b764:fc81 with SMTP id kq7-20020a170906abc700b00a46b764fc81mr985691ejb.44.1711089940144;
        Thu, 21 Mar 2024 23:45:40 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id e19-20020a170906375300b00a46bb8a44cdsm679694ejc.198.2024.03.21.23.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 23:45:39 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 22 Mar 2024 07:45:27 +0100
Subject: [PATCH v2 2/5] dt-bindings: hwmon: ibmpowernv: convert to dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240322-hwmon_dtschema-v2-2-570bee1acecb@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711089934; l=2506;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=l9AcFCPvmbDmRPKHHUdkbOmNj27sBNChGiCLDfCdWFw=;
 b=NPbeHwM3uK9PZwZ1Xwi81PirJ+/H+Jea1v14E2joc98FCbHX9o0tgHW5medAhEkV3anuA2ljt
 XCnfNryadrWC0xgqMRvI7U0URTENNIqDAVxW4SqXceX6KCRmje6FUc2
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

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 .../devicetree/bindings/hwmon/ibm,powernv.yaml     | 37 ++++++++++++++++++++++
 .../devicetree/bindings/hwmon/ibmpowernv.txt       | 23 --------------
 2 files changed, 37 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ibm,powernv.yaml b/Documentation/devicetree/bindings/hwmon/ibm,powernv.yaml
new file mode 100644
index 000000000000..b26d42bce938
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

