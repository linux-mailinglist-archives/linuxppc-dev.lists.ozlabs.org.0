Return-Path: <linuxppc-dev+bounces-7455-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C44EA7BB78
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Apr 2025 13:24:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZTbpq3jJQz2yqW;
	Fri,  4 Apr 2025 22:24:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743765859;
	cv=none; b=cpP2IobK7lAkfTw4RONENbRqNmb2lzyfTPBIP2XtFFXlIe+HKbs3cGrfpnslS1sZW68m1YSZjaDRXLP5F2QDOUg9gwosjnCoICWNWxvnY5ff1SHqGU7t46ACQyNn2F4dgeoYF+ya/TSQkCeevWJXuc9qo6dHREN5I5OY4vdoFWf6RQ5wrU8r8y9QxOg/TOxk2CTrgfbavk3UtmRIzQyBr7ngVH2LZ4mq761ZdOpVG8Nf3V/4h7WXFfLAJmBY+nDWph08PW2NZqst9BmFFKQMRfOTgq/9SRGXF2SpctEjguNeRBlzfCxLZIXRnmkW2dDaiWLi/CXP3DtCGLefmQjGLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743765859; c=relaxed/relaxed;
	bh=9jUjt+XhjUvh1I0aAWgVoLBSUgPdrIuXqPuTwG7GS8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d1qdz9r8bKpGhiIxHnbmbKH3QsmvvGlpgK25i2HbbS66ClmM2a5EWFr9mGIOQNe+yp7lfOqRyi7oHkoRQKj9M1lZmSXVyYjZ1qKPGVJXpDh111KXIdW8xesdbAlf47fdFBNixubXGyrILW60X5WhN1P4D4PoAZNqnBq7rWC/OI6xxI1srFNIMUEfBlAPwJdciP4+NMuZ8dGk2j/1xWMC9ZqwgjFCqipwrJRDFIqG+Th1POUrNdutVpL+yF21RXEdorANgFkhRGhGzxypUnB0OtS18yfBoZO2WrQ3ibsP8LEiaJ5tRca9ugs2L+lWfH1tDwHzDMnvdkapBZus8Ff0pA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dji+SGK8; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dji+SGK8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZTbpn50y5z2ySP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Apr 2025 22:24:16 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3912b75c0f2so181561f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Apr 2025 04:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743765852; x=1744370652; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9jUjt+XhjUvh1I0aAWgVoLBSUgPdrIuXqPuTwG7GS8U=;
        b=dji+SGK8ScQVDJ+IdAbtkopg/FDBxLNKEBVSNdfQopx2nMMN1cyI3bjS8InFSo1WZb
         MgPBWkabkq64PlV57srg6P8aODi5UH0L2DuR2k7JI8kE8QsInCnQSd+7fvYj0wIa+Tr1
         QCwPxPX5m10pcitA+fWbuBgfouV5q9/xO2p0CZuChHsxJgOTL17AGp/Pr45EUUcKTLnP
         mIkPzGFxMJxfdJ2O8MTwYeG300Tl0dn3cjjCNxhBYzYZPG6L6f13Vm1SalpVKSpFYN7r
         wNsdO8nOxMsYP0XEvGLyKKly2pr2jvw9vJsexE2grbaAUdThKc10ttkyaaIdxl/fj74l
         Bd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743765852; x=1744370652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jUjt+XhjUvh1I0aAWgVoLBSUgPdrIuXqPuTwG7GS8U=;
        b=xFFSVAQWYD5ffI03nVFE/7MqXxbUOyMytnxSJ2XaWss9y2ygQ2RRDDqhHMij7YgH/d
         4XzMVJyUR9zYMetqmn1ds97Qct+lGMZ/1WE/BStexP2pEGR6nIOefZZalfwHhVq+rXAV
         EuMP/ivAO7iRuYvxA7W9WnOQ/1vAYQPoa22a78fKPX0reDNdtr+RReMXYyGMaTuEgdAp
         SLEjriMINjIFkOQdsb1MGKSjdpjvgvKiL6THN6srxxCywyv4oYlfAsCHu2r7WLG8kO/Z
         P1qVuKJ3WdjQ2w74LoBo77LIGDBQxJlR0+WKQu7WeL6o9m+NAFRqQ+EMOOFGw1DhTNsL
         rxYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkVicjnlU1A3howKwDaFNUrt9OCHhtfuKowZnAQeNYUPUlG4IfCq3yxb1EOs7ztkR0rHDFfA51y6QO4zE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxISPGU7ryMAglxPEi6PglHZqz4pVDknlyKeltNcuQHmNFC6MDm
	/8lWZuIp4+8Kmdfd+TEPhsKmst9kihKfPQWUV6/8Gq9kndo2HeTiILAAOYnV54Q=
X-Gm-Gg: ASbGncthKETdo8PUN0A5P426B8sT0mKCBN3m6jcObfh4K32bFU0WPh7tZ22Ao7L/OQd
	vJRJbwtWMxwPa6cn9aSeWKaoM5W931wu1L+KeklwW9ryVuIXz1piGwksjokptYfQMsPhMvvyyot
	Be4OkwCaQW9eQnelRczXD0m2SVJXgv5T/7AkRoVRKBAfrKDTlMrkHOKr/+U6JErpf3Ql0EQyDmC
	igPn1Z9rvLOq7SdkkPZONtpVnAKyMRpW4DGMgCxocr+NGi8CfCD8PK9nYBZUl6yfQ3LxpVxoKX2
	0aad3j7U7qWoJ/fKYvg1A5mnmP8OCfvKMCd6e7c8e1HrB2CjVixVtQ==
X-Google-Smtp-Source: AGHT+IH0xDqfEbADnFxB7vDYTyNme6txywLT76cZgxeW7WAkJ3R8qDIzLSJ028j7QznnYBlvsuDHag==
X-Received: by 2002:a05:6000:40c8:b0:39c:1efb:ee87 with SMTP id ffacd0b85a97d-39cba934e63mr788410f8f.12.1743765852236;
        Fri, 04 Apr 2025 04:24:12 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226b17sm4149403f8f.92.2025.04.04.04.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:24:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] soc: fsl: Do not enable DPAA2_CONSOLE by default during compile testing
Date: Fri,  4 Apr 2025 13:24:07 +0200
Message-ID: <20250404112407.255126-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Enabling the compile test should not cause automatic enabling of such
drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/fsl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/Kconfig b/drivers/soc/fsl/Kconfig
index a1e0bc8c1757..47870e29c290 100644
--- a/drivers/soc/fsl/Kconfig
+++ b/drivers/soc/fsl/Kconfig
@@ -36,7 +36,7 @@ config FSL_MC_DPIO
 config DPAA2_CONSOLE
 	tristate "QorIQ DPAA2 console driver"
 	depends on OF && (ARCH_LAYERSCAPE || COMPILE_TEST)
-	default y
+	default ARCH_LAYERSCAPE
 	help
 	  Console driver for DPAA2 platforms. Exports 2 char devices,
 	  /dev/dpaa2_mc_console and /dev/dpaa2_aiop_console,
-- 
2.45.2


