Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9F08873DC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 20:25:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ED+o+Jr7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1XNb17ghz3vk8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 06:25:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ED+o+Jr7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1XMp0xJtz3vZW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 06:24:53 +1100 (AEDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a46ea03c2a5so435271366b.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 12:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711135489; x=1711740289; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0ZcSySu+KpK49bvvLZjoVLSgT/8Vz6AsAvPYvNMC5c=;
        b=ED+o+Jr7QAnpETaea5bX/PQAETax4BIXfIEiW94LxrhS0Kdc+vEGRZN2WEzAb50y2P
         ++x44vYiMY23JNLjud931YZxOtrlGOKC0WGG9Kk6iu3pC3qk79auy1yPi5hfeH0dbSQ3
         OonZEIa/kPo5c9Y7uxf+W/6bqsnOpcoCja3iWe32Aw3ajEW2lMzl2naGsJgqFrzX8pAO
         4XOCa6OxLzREGGKMVQIY5GzJM77IsIFF7MIcZB1Nlbbhsx8//g39Q6+/x3ASnqDhVmbs
         vQdjVgdq8GbTgAe6yfXIVtVF460mFuimkJDP71NAtDx86w6Lhf+mugTVCx6eRb1qNSQm
         JTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711135489; x=1711740289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0ZcSySu+KpK49bvvLZjoVLSgT/8Vz6AsAvPYvNMC5c=;
        b=d7zk3tzvR5I1tpgu+SupJ8plYlxuHO2cSaOlDvdQJ3XBRpZ5V1jn1lM4G3S0cRkPPv
         Gao0ljUKrtew1RpfFhORbIWlEHhiPL2d4RD/4KoaGS3KyXNFwbr/VhnRw0lT5CfeV285
         IM4GsoRHhyPazTe66QM/Rsv0eoRd7jYwcGUoyRbXKqOVp6jRJ4yV5pLrozXNBjOi4LMX
         AduIMDLLLOlxMY6un7X5lW+kf6ylk8ZMtXlMEy1SEvnTUlfrcLBq6VhzCKRseQTactBT
         cxVyk0aK+F5zKyKbG9IAwoE++QyKflibrn2K589VWjHuzMxnt8FNuilDP1ElP6uCGhIC
         sU1g==
X-Forwarded-Encrypted: i=1; AJvYcCWdWzJCacdWDxedXALqbiVmGbVhABSQB471IdgWX7LGsCynJTJU89m7LU86F1Qen7lescLKlTVVNqDTkINltjB/hgz8o1SFSYJqGWmXzw==
X-Gm-Message-State: AOJu0Yz81TkKWoY/kCE80m8JbZMNDr2Nz3cDMzblAoUDfvqBAbaMMrq9
	lR2ewmVH3FP9jGHMpuk45LCX1yFAwEra4I4pgV92BcT6ISogsQ3w
X-Google-Smtp-Source: AGHT+IH2yEbV6zpZDo0LYkd3n2fFTzdL0Im5jXNMEzApVu9s22IYYAjdujzEhfw0+DAGNdM8vqJYDw==
X-Received: by 2002:a17:907:940d:b0:a47:35df:3d40 with SMTP id dk13-20020a170907940d00b00a4735df3d40mr578759ejc.4.1711135488705;
        Fri, 22 Mar 2024 12:24:48 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-b7fa-7d92-6b28-0504.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:b7fa:7d92:6b28:504])
        by smtp.gmail.com with ESMTPSA id ku12-20020a170907788c00b00a46b87c32besm138572ejc.39.2024.03.22.12.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 12:24:48 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 22 Mar 2024 20:24:37 +0100
Subject: [PATCH v3 3/5] dt-bindings: hwmon: pwm-fan: drop text file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240322-hwmon_dtschema-v3-3-6697de2a8228@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711135482; l=582;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=ZcfJW77o+avPTeg2tdUvNFQMCBaJDocyWKaLWxFMj3M=;
 b=L/sFLNsHGNhO/rLBb+tChETQJOlxvloAo8fJxkna9N5FfqHJDz7Pb+FiDVWGj0Ns0klwArXB/
 pp35gYqwpowB0zH8wqWdg25xMJ5RkM6jU4rix8DnDfF8Q7bQK00/nsM
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

