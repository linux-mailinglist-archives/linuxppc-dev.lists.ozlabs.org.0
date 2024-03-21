Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAAD886265
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 22:15:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dABl1mke;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0ysb4bpTz3vYm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 08:15:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dABl1mke;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0vW61dYPz3dRJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 05:44:01 +1100 (AEDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a46f0da1b4fso178435266b.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 11:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711046636; x=1711651436; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXrRijFskjj/x6bHaCTthhZrS7dvFVKx/yThbyuTabM=;
        b=dABl1mkeAonF1Eeza03PIHcD0eWsuQJOwrZQzg7yTxO325nIl85a0iq+aZCuNm5fcm
         REC8O4ZYEEnYTc0sN9XZYjlZqh02rqMUzuz68DqkEs0XQBj8+1wl9cNTiiKsULAFfOT6
         ZqAgSLHO9UDx1yZha9o7puFnrFvfXkAJhrsRnZejQSxnfKlydU+r+UPua7yO+K58V02C
         2hniL+l1QVCJccmJkZY2X5x4qhshLiIahxxxM/4geo+228hmXwqQ9cmgvwRSzNkF5Spv
         2ByfT+5S1chSVvUUA9SPmInKqEGI1GuqV430a6tC+8GpJ9vbEvgYX/bfEaWJOzgdXggV
         VDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711046636; x=1711651436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXrRijFskjj/x6bHaCTthhZrS7dvFVKx/yThbyuTabM=;
        b=dBOowtE0+HyWCHKfRzWveRyPMwA+waNUJvFXkd9t3Uye+yJJTSNGcCs8l0kWR4tO6/
         Ay4CF9L0VRJNhhaMwBGjPPxDelxVkNdnMOzkt8Da89rtVbvrV49MxGiFCYC6J4IX2Kys
         bXx1CHpKiFBwP0hlf0BkWd+nxNY4ZF2oI6Pm17nwlB0P/hxky8in0ZYvJFaa3gaYMAxj
         XW8pLWludBwsiZB2bQhBGjP0UKZqGNTEm4DVNqITPS+8w/fc6uPnQRFtGfTmoR8eLlTr
         qeK67Fu4dLOQcfuoX/TCyFjA/rQjAhLwGc2ZIoSBN5K22R+IrW54+n9hVy7NGabZehb4
         YXow==
X-Forwarded-Encrypted: i=1; AJvYcCWlGiYwgKGQ5f0rg8NhX5csWkXg4JJngCUr+J2ULjXaBM88Aut7chJ4m2XAKvtQ0d91GRK3Y+EYMbYmzimrp3McYrnCUvkMBuSDIRa6mA==
X-Gm-Message-State: AOJu0YxhDm2Ug7yk7gFHDpWcogS4kWZSPBcgi9llWc3rrfENwaCvULkv
	RRvcUHld9TVxL14LZ0N7yR2VoRI37x4TJquoyyLlfe71OmoZ+3eF
X-Google-Smtp-Source: AGHT+IG9T7BGcTdrPesGcvj83c6iEs3oewPglnZiOuu/XZQVzeB9m7qcgDvuSRwkRNXDR4GMAkeMaQ==
X-Received: by 2002:a17:906:fa92:b0:a46:d001:4ac1 with SMTP id lt18-20020a170906fa9200b00a46d0014ac1mr186929ejb.47.1711046635918;
        Thu, 21 Mar 2024 11:43:55 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-7db2-5855-2c59-b89b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:7db2:5855:2c59:b89b])
        by smtp.gmail.com with ESMTPSA id t6-20020a17090616c600b00a4576dd5a8csm188627ejd.201.2024.03.21.11.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 11:43:55 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 21 Mar 2024 19:43:42 +0100
Subject: [PATCH 1/5] dt-bindings: hwmon: as370: convert to dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240321-hwmon_dtschema-v1-1-96c3810c3930@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711046632; l=1883;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=KZoVHUkOuLwqSF6Q3U+Iq8ld3UyOQ5Eh+x0ZRakG7AY=;
 b=63I2hYN1+cDH++nFgodgGj/vcHWjnLPCypd4vLoj69cY3p4KiaCOMN8vcvrmaXuAFJb/T+8du
 i46xfcAQXp0C/JkOEosPup8wgArKbc+IndvOX04hVdlUTNQIMtAXirw
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

