Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6C5838917
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 09:35:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tkJvRF2d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK0mF4h2gz3cSC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 19:35:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tkJvRF2d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TK0lQ260xz2xdn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 19:35:12 +1100 (AEDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-33921b8988fso3551462f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 00:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705998908; x=1706603708; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/QjaGhFynx3OiMJAeNynrRZeB0XStseOjfzkj/KuMDk=;
        b=tkJvRF2do3a/ylyFcUejIcPQcYpFJWImnBL0MNaaL1hDufXlpXx7/B/2QMk39J+Pa/
         cPp2n24rO8AAQNQQhOPerA0Oxix8H/rzmioSlYEOUGOIexBvDp3wDkcbnpADVkaTQgqi
         xV/f2W54UbpaokvL0kUqv6tb6o32dGjDZM+trI1yqEgSt9G0D1l9YDcgR4vfqaBDMNd/
         plLU44HsUxxurF9WOq7uht3EmELFT2NrEveyo1mZ5p8ABj/DwpzS+1hI/iQXHqAdXfUn
         aH5d2IGfQ25DtMxBaElVPvPlo/7lVWU/pPzZLOoJJWz7MAfidjereRccGuFQEeODPN9J
         5ETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705998908; x=1706603708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/QjaGhFynx3OiMJAeNynrRZeB0XStseOjfzkj/KuMDk=;
        b=s7peKNU6n86aQkLNa/9yV79fl/jF3iYTpRc9h5lje/6uLLPl0OfeuURqfb1Y0wor6W
         uSJzp0VcnJzPQdoMjK1ouIVDvziyg+XCfBeemDsSg5GMpnZfB9oa+L5CetoPbSOFXU73
         n6b2rhVa5WzP0q4+uqx7BG3TZaZ0Zh4RrHVLA6SQkU/W42j3hGrYvVaGK/5ADQcXQY7D
         kc/v9MickE18SVX0D63wriOhB4TIkVYF/8YAhCxSbCoq8HR2b6r2cM2QYbIPshWasE92
         jMHaefk87RiJjt8MeZniatXrX5R9vPoRkYJHo+7iHP9se6utgODtQk0qfUL+PcZwoF0T
         l6MQ==
X-Gm-Message-State: AOJu0Yyhl6R6a4HoKzisvNwE6NzPWV74ppTJz5oU7jgjz16Y9eEHYZxq
	FVoevAtKPzgoF+VoRf2KWj/kqzlsjxnpC/B4qXD9//xHhbHkeKGPeHnigUEWtzA=
X-Google-Smtp-Source: AGHT+IHsQ/BwTzppVWU2bmvX+sEXQXhfeltua0zOuRy3ttSc8+mgMhgLWY9Buv8z1Ew4rWkOP+Dnqw==
X-Received: by 2002:a05:6000:402c:b0:339:358b:b84b with SMTP id cp44-20020a056000402c00b00339358bb84bmr2342507wrb.16.1705998908142;
        Tue, 23 Jan 2024 00:35:08 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id h2-20020a5d5042000000b00337d941604bsm11506193wrt.98.2024.01.23.00.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 00:35:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: fsl: narrow regex for unit address to hex numbers
Date: Tue, 23 Jan 2024 09:35:05 +0100
Message-Id: <20240123083505.21029-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Regular expression used to match the unit address part should not allow
non-hex numbers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml        | 2 +-
 .../devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
index 397f75909b20..ce1a6505eb51 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
@@ -51,7 +51,7 @@ properties:
   ranges: true
 
 patternProperties:
-  "^clock-controller@[0-9a-z]+$":
+  "^clock-controller@[0-9a-f]+$":
     $ref: /schemas/clock/fsl,flexspi-clock.yaml#
 
 required:
diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml
index 8d088b5fe823..a6a511b00a12 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml
@@ -41,7 +41,7 @@ properties:
   ranges: true
 
 patternProperties:
-  "^interrupt-controller@[a-z0-9]+$":
+  "^interrupt-controller@[a-f0-9]+$":
     $ref: /schemas/interrupt-controller/fsl,ls-extirq.yaml#
 
 required:
-- 
2.34.1

