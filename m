Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C16886272
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 22:18:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Qe4+yx2Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0ywm4qpCz3vfG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 08:18:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Qe4+yx2Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0vWB2Wr8z3dTw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 05:44:06 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-56bcbf40cabso1264417a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 11:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711046642; x=1711651442; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZP+gNYu/Kkn8nZAdI78yJHmmqjo52vGxGg0tHY+NoU=;
        b=Qe4+yx2Yn1ubpjKGcCyySmaGn87QR+pC3lLa2Fos7gc/0LIWzldtGdbbfNGwb7b35g
         lLYFgJ7jTKNaTn0lNsDVcbJCl9NXqllWvWulC7e3HGXqHmi08seqMaMdkD951918Fnsf
         b2/+ZqlUkASH87SOBRsaSgNJ0SnoBx/EIeqp8HVh83j91ziUCkUxIdDWVU31lCGZbInK
         fN30Ba85imy+NINFj3gHcuOGcJODKPcxXWL/DE8/6k6O9/wG/drWRE1dvFcrr4SmmsE/
         1WdgaUbyI21tcu71cHlVRf3xuuNV0OVRAL0vXLkA4cBnL84bSMHwzN1hMu6hns5eUkY5
         BW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711046642; x=1711651442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZP+gNYu/Kkn8nZAdI78yJHmmqjo52vGxGg0tHY+NoU=;
        b=t9u2jg4l6qTjm2yU2EeMA8QK2Nch1u7920P3Jy3ikTGrvhBZ/MFKbQt2D/nS2vqo0G
         dR4P8Br3KpFeIsFpg1NXetQP6feUYBdgghnQyjTtvq94jGN8YIQUor0qz8xz97x8OJqZ
         K69A8zFqqSqMq6/1Arpjp+WQrqZxj2k6/iRGODSKHjj+M9Wj4MrhZ7b/lAhTc8bPJqum
         NnKrMBK995f7otc0hoxT3J6G1znFLL2ipQPi68Vbn8AXT92XcqIroCFxDYEQqKh6c6Fz
         K4iYsS8apffws95/cqtjnnFHdB/OBr7vssSdRfToV6Bu3XIRCEGxKGtWOv0ANhcZztKE
         LZIw==
X-Forwarded-Encrypted: i=1; AJvYcCU/I6QszOJlSM1ynnkUqVpwBNRHYm2obsGzTpmJrDEEqnuPkBwIrUB/6Uq1HknrcuCiMaro1pg32ngGTGLBKYzgr6aqZdWAte2NsUogaQ==
X-Gm-Message-State: AOJu0Yz71nXOIpKzY+I/nKSK435cNorYfGo96l37aD+DYpR8Is7gs+9j
	NObItnzDXIm16BLtGq8j8QvFuFg4Yc77upIkS0Ozb83yUmckiToO
X-Google-Smtp-Source: AGHT+IF7he+6hAV9Yv95T9uxTXIAXg6hiYAdZakGXqqD9dT16Y++ep9u6yth94oazmiB/4HP9J5m+A==
X-Received: by 2002:a17:906:278e:b0:a46:f888:70b9 with SMTP id j14-20020a170906278e00b00a46f88870b9mr197252ejc.51.1711046642214;
        Thu, 21 Mar 2024 11:44:02 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-7db2-5855-2c59-b89b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:7db2:5855:2c59:b89b])
        by smtp.gmail.com with ESMTPSA id t6-20020a17090616c600b00a4576dd5a8csm188627ejd.201.2024.03.21.11.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 11:44:01 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 21 Mar 2024 19:43:46 +0100
Subject: [PATCH 5/5] dt-bindings: hwmon: ibm,p8-occ-hwmon: move to trivial
 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240321-hwmon_dtschema-v1-5-96c3810c3930@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711046632; l=2007;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=V6VzvACmmg1HSyifxT5g+gPzhNzirrHnP3f/hmF8jMU=;
 b=TXRk7ekifN2YtRLJ/Oo1oWCpa34HsD7o7GbskHBhTUhjZ/+c8V9/Lo9lAKj1cgeGDnIUGQN/h
 5eAaiamzRueCoaHV4HQTQMpkmSZUfx9tlT1/TlKltdb/wu3ufWHZaUu
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

This binding meets the requirements to be converted to dtschema
via trivial-devices.yaml.

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

