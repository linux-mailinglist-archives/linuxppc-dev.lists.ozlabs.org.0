Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB68889B4D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 11:49:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=E8DDr+Ad;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V38nZ2gFjz3vXF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 21:49:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=E8DDr+Ad;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V38ms3JCfz3cQm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 21:48:43 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-512b3b04995so2149558e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 03:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711363717; x=1711968517; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GdyAlHz63fHy0CpLlEnn3btu6ypzjd0jIMH561mJYbY=;
        b=E8DDr+AdyohdEcpdrU+GmR9Ck+VMcsCR+Kwt1AME1kOLSVEDevG/ClHQ+QXGfYd/T5
         agIfEWAn/q6VJkwS1Whj+4BYRVXnHiMxfVlwcLwwqduBF80iuTq798q2PRYxpHVbPi51
         mjlT7P3Dmme+lFE+ircPRSodETpYERNtwStsS2ohr5SpHqAN3t63F/TR/MeL2Prp53tS
         AA8NH581rwoV0DG1crbcqj6iRQKHW3HZeieEwzwH7YaMsgpPjNq2ikmWlju2fchCoM6D
         OzFg0RhUq8yPs92iNmr1fZpjg4yhxbU4Hc0dfTEmg2MzBOtZ//UGyveow0slT05K6IVe
         pBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711363717; x=1711968517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GdyAlHz63fHy0CpLlEnn3btu6ypzjd0jIMH561mJYbY=;
        b=ZJBNm+H+gjbUp90qHm3SOYQmUyB9yVdjXIUnRZfrsHaAfQwr3lGxmoXKauQJnyl+KZ
         hyP+fJecC9ZAMHjNs8SZ1FK03DSa6ZvKq9h7Xqy3uSiKnHmrFwX2k4cVXj9U4NHVx78O
         pBPAgSWvxlXArjZC8jtQIlF+Ub2UdVy4NsavSdYR2fon92aPFfcCj4q+8JYamE1R3YRB
         GEtiIEce6ErGTCjxjtS9zYhsXLyRZ8FLZG1uQv+M91EKp0IQipvKniVGDlTZGZb723lY
         K9SEsfV/ife9CA2Y6Y9HQz/eUReG5SgGqk3FidEfeywWAAfMiW9WpKEODVZ6v0h+uihS
         sXOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVoWW/mRi4Cwt/t9LHk0TdeuPMhrOJvkTi0XLQ2bJvxH6rxyh9SWzru15WjB/2niGe5RduFVkGMG3ccmPkkb4xM9+9Zt+LIUtYvaKIIg==
X-Gm-Message-State: AOJu0YzPlIz+i6DjIA1MMvvn0xxpRAxiwdcJCAgEmbrfSntEya4X1PEf
	ZJg17T9AywoLHJ1R+kX65ZSXnZNsODTce2yBfg73blh4O42C6D5Sler+b1SOtvE=
X-Google-Smtp-Source: AGHT+IEtwhIbYV6Dwdb3Hs6WgP/TgyCYhQ1U7xeEJW156UNlPksk5MnUlGzwXG2IL7SeXUvQg/yLUQ==
X-Received: by 2002:a19:8c56:0:b0:513:c9ea:67 with SMTP id i22-20020a198c56000000b00513c9ea0067mr4160794lfj.24.1711363717293;
        Mon, 25 Mar 2024 03:48:37 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id df15-20020a05640230af00b00568d6a20717sm2859339edb.52.2024.03.25.03.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:48:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: soc: fsl: narrow regex for unit address to hex numbers
Date: Mon, 25 Mar 2024 11:48:32 +0100
Message-Id: <20240325104833.33372-1-krzysztof.kozlowski@linaro.org>
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

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

v2: No changes
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

