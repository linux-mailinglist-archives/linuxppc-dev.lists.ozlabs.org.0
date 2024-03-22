Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9D8886713
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 07:48:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OQuO8OtT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1Cb20SB5z3vZt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 17:48:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OQuO8OtT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1CWs3XxXz3dTm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 17:45:45 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-56be0860060so385702a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 23:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711089942; x=1711694742; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0ZcSySu+KpK49bvvLZjoVLSgT/8Vz6AsAvPYvNMC5c=;
        b=OQuO8OtT7DW8ZMEez30CB+7I5jFD4POJa6vtjHxZjOLa4O6CYTq8a0QIlZOAQhUOVV
         bwb/U6SlLBORzM/M88PHo5WXSC22niFnj0GYG47EScfcg0jdL9fmc3/Wl0BWC6IOQUuE
         JPgp6RGMFRh2mXoatuoS+Vu/MgFljTYkK44IPhTltAMKPzA6DnWaoBS4WDovgMVvysso
         02S4X0jLeOyQDRubGZXN8q822tu5vNsNcCbD6u6LgBZUxFf/rYq8JnopHYJA9iV19Fcm
         6LF2kX3hzOxoVwT5Hbc/An0nlvSzbnqV+0Qmhjrkvf6IVeQj5he0DhCltbD8+flwlnml
         9ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711089942; x=1711694742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0ZcSySu+KpK49bvvLZjoVLSgT/8Vz6AsAvPYvNMC5c=;
        b=jDJljrcsGEGoA188Mda7zY5oW//EVAhbFeDqLxjXa4mjQI4e28LJidadBfJLGx8Jsx
         yVne9RsfiycRkKcueCNYnTO33fJQJbrWD7u4LzVoZTVvenptQA74tGfrAu8pdq4XZ+eF
         +L5L0uer2Xlidf1cty+5rBwNAX7RXKkisXlxqtAQJ5TsH/FVomLnZfM708iLGi4xfnj4
         +ly/oANLouA/LoMnXJzy7mAp8aHmS2/n2S8rU7B1JhZEEWdWQRTiTXGhe9vcUkqhsMG3
         NgHJOisp4pGyguKufdgIfuSNiLa9CJIBuIHjjiGKS2ga7NAiN9Zokm05/ZvYcD2dPuI9
         VSRw==
X-Forwarded-Encrypted: i=1; AJvYcCV80HQZapjtvt/KQTWHiNOZPA6KKPVV7sr6cAK7zc/QvkpBYPfFefeSqIv6TSdmO1+NrYY+RtPhzoRPfCLkMbxFVSwpRy22VgE9KMLzbw==
X-Gm-Message-State: AOJu0YyazDe7PTCd85mNR65sT+nLVeE43gZ78G2IWfenNzkrjBniOJy0
	KX7MyTHdeVQW9tL+8kjqckTjY+20TNenQfOQfFkq2hRIvkC4T2FU
X-Google-Smtp-Source: AGHT+IFIXvems84M0PI0K8RQsadDz+FM4cpWGTpn+kIb/rANJTIm6DuJ39YJNFIbiRXd8h1N/nuJBg==
X-Received: by 2002:a17:906:1cc5:b0:a47:1f9d:594f with SMTP id i5-20020a1709061cc500b00a471f9d594fmr933241ejh.45.1711089942175;
        Thu, 21 Mar 2024 23:45:42 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id e19-20020a170906375300b00a46bb8a44cdsm679694ejc.198.2024.03.21.23.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 23:45:41 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 22 Mar 2024 07:45:28 +0100
Subject: [PATCH v2 3/5] dt-bindings: hwmon: pwm-fan: drop text file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240322-hwmon_dtschema-v2-3-570bee1acecb@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711089934; l=582;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=ZcfJW77o+avPTeg2tdUvNFQMCBaJDocyWKaLWxFMj3M=;
 b=ooBwVciHMfKQ/gDnvt+gH3CzlaNb70fu8uWXmrc1NGsUHz5TUZv1NQ7muE2ALJoAXiAQA1ae6
 4Yz8w/pnt9eDDe/lDdcxJY2NPR5r2JM+9Z1+eaSoV24pIlyh/CbjN0O
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

This binding was converted to dtschema a year ago.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 Documentation/devicetree/bindings/hwmon/pwm-fan.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
deleted file mode 100644
index 48886f0ce415..000000000000
--- a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
+++ /dev/null
@@ -1 +0,0 @@
-This file has moved to pwm-fan.yaml.

-- 
2.40.1

