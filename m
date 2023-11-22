Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6487F539F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 23:44:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbGXS4q5Dz3dLB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 09:44:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.175; helo=mail-il1-f175.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbGWw72V5z3c8L
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 09:44:28 +1100 (AEDT)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-35942cb9ef4so913175ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 14:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700693062; x=1701297862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O2Wb9fqX5wGIqyOWlMFehAorYquofRBtljUq7UG2Sxs=;
        b=hcpXPOTraPoc0wLrgHl46avZ+TiT1ehjKHbwSUbQSd/Kpzq8DThsdXREyd93iJKLmA
         M9syVyGJzN2fLeBHiU9JvLYi/85+oQbPHaHlOTRI/eySBMbEkIRPZU5Ac3L/MP/L7F4L
         HESOnnxqLoELGioKWzwwKYnQfggxjJkSXHPKYaaBgw6tSwB/6K8gMTqQWi7pJ+BrmcYc
         LbZeY6OF/H3xnBGKlUlsQoKRAD9m25wKqf/Sj2+CX612YJ5dHyRftUSPneByVB2DZW3K
         JjutW+MuxkzSoMapiB5myy8CmqynMbipDyaTeNHpHON+oSreQCwbf7Vy6PasrQrHkvbb
         /Oew==
X-Gm-Message-State: AOJu0Ywgn96h43MA6wwPlSFuOy2nY5hyEzzkXoGC5uhnKocDXvhwFXxg
	9ictGkyvII72qgPQ4XtoLA==
X-Google-Smtp-Source: AGHT+IGFm0+j6e3UUQrpEurWryCYqQBPZdAFwcs+dwxaPeUhVSu7HXz3MZ7wxMS2VPJ2uEwMCVqw5g==
X-Received: by 2002:a92:c26c:0:b0:35b:2216:5c80 with SMTP id h12-20020a92c26c000000b0035b22165c80mr5377162ild.23.1700693062511;
        Wed, 22 Nov 2023 14:44:22 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id bl9-20020a056e0232c900b0035aa4b0d786sm179029ilb.25.2023.11.22.14.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 14:44:21 -0800 (PST)
Received: (nullmailer pid 2809435 invoked by uid 1000);
	Wed, 22 Nov 2023 22:44:20 -0000
From: Rob Herring <robh@kernel.org>
To: Li Yang <leoyang.li@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] dt-bindings: fsl,dpaa2-console: drop unneeded quotes
Date: Wed, 22 Nov 2023 15:44:19 -0700
Message-ID: <20231122224419.2809361-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Drop unneeded quotes over simple string values to fix a soon to be
enabled yamllint warning:

  [error] string value is redundantly quoted with any quotes (quoted-strings)

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml b/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml
index 8cc951feb7df..59b83ea5e05e 100644
--- a/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml
+++ b/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml
@@ -12,7 +12,7 @@ maintainers:
 
 properties:
   compatible:
-    const: "fsl,dpaa2-console"
+    const: fsl,dpaa2-console
 
   reg:
     maxItems: 1
-- 
2.42.0

