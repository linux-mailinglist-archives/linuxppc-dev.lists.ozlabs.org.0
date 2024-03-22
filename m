Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A17E88671B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 07:49:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D6yAueBb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1Ccb5cwMz3vXr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 17:49:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D6yAueBb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1CWx5tPqz3dfM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 17:45:49 +1100 (AEDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a4715991c32so175474166b.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 23:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711089946; x=1711694746; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k0ZX0mSNtR84zaDW6QrVcacYADFhCeQmdayKmvm0d6c=;
        b=D6yAueBbxJcAabWY05Ma2qMehfurEcx5Sw3amvq/77cXFREp4MUUme69uMbwCBV7Bb
         iG1dgICUhRZGfk+0RxU420IPsQUrChNp0vwhCFJbfawJfWVg9k4/5Sth3VjYilo0yRQJ
         xr5kNlr6X50nVT1Q29pz6WeG7yLJByrRAdGRrDoS0COxLiAQAH6FAewGjSSoZML5ZQwg
         WA3BGneDz9HgphDLHizaebfaSiZkJ7eTQDSqtlfuSVbder5M67xTJ3/+UBP/rwkiVwkc
         5cQdyApY0AODpAC41m4vldsq2YUU3cKq468hEwx00pb50QWIcKMDgg40hMp7sN2afPnU
         pm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711089946; x=1711694746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0ZX0mSNtR84zaDW6QrVcacYADFhCeQmdayKmvm0d6c=;
        b=huzvVbDRn29RyCbD2xH5QWEGmAoXi0P8rQpHwSNOMCLz0Pm95EtbVIjnkp/rgZAqXM
         BksmhmQnhfVRsb48qS4kyyoxNfhbOeBdlhQKUjzwmaxaC3HdS4zOfAw3ocFrTiGIP9MO
         CasHKQgh4NVmSqHSHsS+zGqaV2xNwBq9uF0lAfrluN9K6QxcNMTcks7J4SWjzLUpz4kZ
         fYfDLpQxEuY2vXKzuXgO824tfcnHyJJSIlzleaJ0GA9WEFowKdh/xJvmg83Ori2fSF3p
         Gna6k/IN8ZcnX5eguQCoWtc6vq2GcDzPkFHgWdxIR0OKbK3DAij1N7fHmoRswPKYgMef
         XXnA==
X-Forwarded-Encrypted: i=1; AJvYcCX3AJWucysmliqLznNY7bYoq6sV3vNP6HuWvaNBDm5IaheQ6zyHqihKsfOW5bkKIjuXrV+Sxf6mdNULF5+6c9BZg99X19KcwpueS59OnQ==
X-Gm-Message-State: AOJu0YwyruXhtAiYxIcxCGBbZhOIrJJl0VSu+OsNIgvE8VGKltoPeO0c
	mTj/0q5NB3/24yKyWp6ahIUxG7qjhUuw70rBruJDiJ0fxBl1I8uw
X-Google-Smtp-Source: AGHT+IHWTwuW8UIUUoXFTdiYrzTtIrzPGEkZkGQ8lAESE+yEAIlcPzGhuzwEM7g3eVOt5C0rx4FIKQ==
X-Received: by 2002:a17:906:38d7:b0:a46:1d4b:d81 with SMTP id r23-20020a17090638d700b00a461d4b0d81mr1014632ejd.62.1711089945564;
        Thu, 21 Mar 2024 23:45:45 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id e19-20020a170906375300b00a46bb8a44cdsm679694ejc.198.2024.03.21.23.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 23:45:45 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 22 Mar 2024 07:45:30 +0100
Subject: [PATCH v2 5/5] dt-bindings: hwmon: ibm,p8-occ-hwmon: move to
 trivial devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240322-hwmon_dtschema-v2-5-570bee1acecb@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711089934; l=2051;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=4rUBSyPV6ao55dHemnHVuLdadgQFFoAi54Gb6HBKVTY=;
 b=q70/gdmXCi4RvGIZ+Icn9EMX+Srdt6GnUw1wapHGSfBb5rKgsJsBrfeEQjXEbzRQpC0yBmLNL
 yBJQ7F88FHLBJrbYbGpP85x5g38ot1Fi6LVn2jSQHMJlPTSEvepiCto
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

