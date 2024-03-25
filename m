Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9FF889B54
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 11:50:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UDP0WqgR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V38pM0xNVz3vZ0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 21:50:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UDP0WqgR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V38ms25j8z3cN4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 21:48:43 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-513d717269fso5225643e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 03:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711363719; x=1711968519; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipt8Nni/JGxfVH6xjAHK3ADWRzeEAUH7NmYP0XN00dA=;
        b=UDP0WqgREF/qiKdFQemnw2zVleJgs5E/6gj7KaCe2DvobkydAj1Y41ki571c35fpyt
         v85wfOc+L9qQq5VfDK3nHq23m8W2tr2sBRxLpARDtbS4jhiMhrtBm+3JsJBGErn3NhGL
         qSpVJFz7h7mIyhLbvpVfVRKXx0y7OHh5puKEGmBoHiJYzC4EeAwnSbocR/+S251NunGq
         mBEHoBOC3lP9w6pAEccMfrT0Pxfirx2ESqVSnD1VpEBsQZ/JDgSAjqIBHehsrb8Qo93N
         k14TC08PpBcU+kUOAnRCsgMgRRFoGkDUOuAXe5rfZEA1YDdZxQ7XBFkmuk4VqxHzhjxB
         HqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711363719; x=1711968519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipt8Nni/JGxfVH6xjAHK3ADWRzeEAUH7NmYP0XN00dA=;
        b=HvfzUTHjQLqKr1z9oSJ1bXjK4qIpVQ9W45dbWGgiYG9NrWtRNtdQvO5U6pbuMSmpIZ
         IU7QJOQZDLPjtnjxy7c7CDnzuOU1uA/ZjQbDOpTmY5VA7vhtlquiuu0EjkHIC4qLQjkX
         T2rtS90GOaVVaLsSAjlHr8C5ZMsRUZd6WJVjpT38bNZOuFrBL99XLtloKl/n1zU9ACbn
         WjbhPjZ4AEDaNpoxVCGDmEaA0ZtQTsTYxk6UIHlC2R4AkFqYO7tLrujuQY5l8+Rvpiqi
         B4E5YavV57yQQJUCB4AD49NNccWs4p+urXQt9hx05r/P3MPFSzcUPivQH0hJp1WBDJTe
         ejXA==
X-Forwarded-Encrypted: i=1; AJvYcCUk9//CsIxG1492gEty7XrVp9t26EqUEgqC1OiFlUtKlpIeSpxoL9giIzyyEhwzZVG7sWNSRB+FX/tBA8tGffAyxO7blKqxn41IfyBl4w==
X-Gm-Message-State: AOJu0YyOZUD3zhVg7QPJw6Qf06H2H1tKxJMbWTiLZcWxjDEZxK8nRemy
	5hyV0j0Lf7sVtfIh+6RRmWbwLMdXhGSHjmg5tE0/+FS1FGqH5/myMVaZTIT3uCg=
X-Google-Smtp-Source: AGHT+IHQzqJeE/IoQzxHE7jCIJWL1TTDdd8bA1fBeZ5XLg80Uh92cwV9vAQl/+qFaFpTQrZejIynHw==
X-Received: by 2002:ac2:5dfc:0:b0:515:ab85:34c2 with SMTP id z28-20020ac25dfc000000b00515ab8534c2mr1795658lfq.29.1711363718839;
        Mon, 25 Mar 2024 03:48:38 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id df15-20020a05640230af00b00568d6a20717sm2859339edb.52.2024.03.25.03.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:48:38 -0700 (PDT)
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
Subject: [PATCH v2 2/2] dt-bindings: timer: narrow regex for unit address to hex numbers
Date: Mon, 25 Mar 2024 11:48:33 +0100
Message-Id: <20240325104833.33372-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325104833.33372-1-krzysztof.kozlowski@linaro.org>
References: <20240325104833.33372-1-krzysztof.kozlowski@linaro.org>
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
non-hex numbers.  Expect at least one hex digit as well.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

v2: Change '*' into '+' in the regex.
---
 .../devicetree/bindings/timer/arm,arch_timer_mmio.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml b/Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml
index 7a4a6ab85970..ab8f28993139 100644
--- a/Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml
+++ b/Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml
@@ -60,7 +60,7 @@ properties:
       be implemented in an always-on power domain."
 
 patternProperties:
-  '^frame@[0-9a-z]*$':
+  '^frame@[0-9a-f]+$':
     type: object
     additionalProperties: false
     description: A timer node has up to 8 frame sub-nodes, each with the following properties.
-- 
2.34.1

