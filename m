Return-Path: <linuxppc-dev+bounces-10414-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C381B12F6F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Jul 2025 14:23:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bqgjs0K7Nz3091;
	Sun, 27 Jul 2025 22:22:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753614121;
	cv=none; b=Zk/sO/UPKGViC0+w+EIaUbx0qtWuYQjSJj7OwswLexJa/h9FycEuJEnAm6/CK94gMbPvFId/0dshbV8UjPOBCM2MM2eMmU0oyTSIam+j01j9tE4dfR/XoenSg9AUvuZjDOPV+PePGPitirOLdSczwGSvHTbcA+CoTflrlVPyzjrDNvr7Gtj+slvX8mmdKM7pdj0DmRzezXYjONR8I4kDul3BoXoTLVk90cZFslYr6GGGLSJNM0LkbhnWkUb5vrfelcs5Z7KnOZBHT3hve5tLSzdKyy5c4ZEOfzT7ixTLEvdX7/raDJ/ySGnFRkqswM15ce71Ucb6wjW6pLC/8SQY2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753614121; c=relaxed/relaxed;
	bh=btSB13u4wPFzn9262B7O9imh/oQKy98Sasbk1uFPExU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DyZ5ZuMkp2iS6LqzE5/Sqk+NEGoIwd+WC1LMahJPjkF7fhrzrfS5cTR0akvJ+NEByBlqQhPNEXVPVMockBWaSkOS4Itx00THDCn5OhbQJrJz0nREHhJmzqXPFWd88V4COomVHPBBbgeWMJuzWyYgp9oUnNa84RpwvT5vPM7gZ2Zqsa5j9P/Mr3LDzCaCcrpkZDYEArQ3xcvFOYZV9DNpHqYB6X3bWd6O9nQRgJ4hu+4Q7ZlS75EkWqA4v5l0OlGj3tKPAhtCXXg2oExL2ohJ1l/7ZdK+ByYLLY5EO16jBkGH/SDurBueJXud66D1v1Rs8ZQi8lDMtWRQdWHc/5oOJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EE+nC/F4; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=vishistriker@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EE+nC/F4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=vishistriker@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bqdwR5kX5z2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Jul 2025 21:01:59 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-75ab31c426dso2835419b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Jul 2025 04:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753614116; x=1754218916; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=btSB13u4wPFzn9262B7O9imh/oQKy98Sasbk1uFPExU=;
        b=EE+nC/F4jVEqc/B4Fgljhtxv+zpXHa7oEQ437OCZEMFi38T7XCUBCHuH3R77ZhkPlL
         tKdCDNqbdLNOtHSxUa48rb1UR8OdQxxuocbYnwlkwuKO1lD+mmJnE+VMzJs0gaOTwUuK
         LTuERIeeOFKmvoE8JhV/ulfH1i6Vl9LHuRaq5v7ESMnFi9+U9tPNjDJkwHT1ZSot9r/A
         wSbB7T3/8aEOX7BWlYgvodTuA3Kx6iAl6AEqbsOSWLwItaC8PkTPI+Z+Qru3ZbcR9bVT
         9kd4r7Q2LyW58JP1g5dv5t5JX2TBz0w5fT3jOnyEIVWVkuPNb2iYIjphnDeXzl/ENP3/
         JF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753614116; x=1754218916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btSB13u4wPFzn9262B7O9imh/oQKy98Sasbk1uFPExU=;
        b=dryETXUnr05gNNdcdaT+txyLESGvsW2COPJe/D8OWbRtZi7l1xsmQUxIY7m7x9Su7B
         CI1CXVFYraHpZkZgi31/KBiL9VBGQIRejRgfrkxv5F6g56RwHF2/o/27Vw3Wpizkx+HL
         VX+YP7LXBjWl2nvlX7p9wAhAb26rahT69cR6yU9oXTIo4h7/xVGLMhQx3uLZ3egULDA8
         VNTw9Bewffc6eJKfjCJCu6IwLDLIpCspBK75+bMg1pmIK3STiQnV+CPw0khd5F4vQHLV
         RzTpXkotk6C3dVZvpeKo0m0SzuRK3YsCyXLdNLqENklJeFpMr9Sqs5esQiiR5UM+yHtp
         qE0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKfIXfGXUsQkk2oG/t9vPDRI6a7Vm+N9d+f4iDS61+Os5lZBTtaV6TaLNRTqid5H8ugi0ak9u8CWYyTho=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxmw/we+S7Lqf5DE1C2QHYJ6PxWXNObLFe7jMPIYVEbo1Q5+feS
	EeycBFBXSvWzTAT9GGjGgEx2EP9rebrqxtJaYpj+HXWasoe/r2Mi/H8V
X-Gm-Gg: ASbGncvcDvF9Y169t3q3IgE44Ondf7mPJ9+g1Coi8GSCpNbA7GgjuJiky/E14ItkW+k
	FV3NoeKlvArd04qRp94u/JbsVvYC88H4B30chvh3f0W2wTsgotV8eLBePFVXF27sCs5LDFYIg8B
	av0zglV53rb2R+EdXCy7/WvRUfyBRpYk0Xg0q1InakpDc87MqgiX/7v/eIO1/nk2UQDcZyehzGE
	KL3lgt7k/3a1FYxNGf69bcCXmClVrbK/zMHqSNLeqNkA3xQHHRAaE02pZ68ry8xhIAEixwRJ5HR
	gxmyMv1TR3qjUKzTvFbHZnSJJERzv46Shp0TyR4isskn628QUoKexqjV/uD9U8lrCZXWNHCicxp
	nrVrLZSOA3rFtBDCzCBQWK4vBMtc28qqstQGgbyc/1g==
X-Google-Smtp-Source: AGHT+IFU0mjBLKNkwAd49L2vpVk4hPTFU1XGvLShkT0HMcIwpxIrGr2cxSoSVuh4Q32firy2PXxxtw==
X-Received: by 2002:a05:6a00:896:b0:748:eedb:902a with SMTP id d2e1a72fcca58-763349b7a21mr10855469b3a.17.1753614116305;
        Sun, 27 Jul 2025 04:01:56 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d021:481c:67c7:4b27:6088:74d5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640adfe772sm3291944b3a.72.2025.07.27.04.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 04:01:55 -0700 (PDT)
From: Vishal Parmar <vishistriker@gmail.com>
To: maddy@linux.ibm.com
Cc: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	corbet@lwn.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vishal Parmar <vishistriker@gmail.com>
Subject: [PATCH] docs: powerpc: add htm.rst to toctree
Date: Sun, 27 Jul 2025 16:31:45 +0530
Message-Id: <20250727110145.839906-1-vishistriker@gmail.com>
X-Mailer: git-send-email 2.39.5
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The file Documentation/arch/powerpc/htm.rst is not included in the
index.rst toctree. This results in a warning when building the docs:

  WARNING: document isn't included in any toctree: htm.rst

Add it to the index.rst file so that it is properly included in the
PowerPC documentation TOC.

Signed-off-by: Vishal Parmar <vishistriker@gmail.com>
---
 Documentation/arch/powerpc/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
index 0560cbae5fa1..173a787b6cc3 100644
--- a/Documentation/arch/powerpc/index.rst
+++ b/Documentation/arch/powerpc/index.rst
@@ -36,6 +36,7 @@ powerpc
     vas-api
     vcpudispatch_stats
     vmemmap_dedup
+    htm
 
     features
 
-- 
2.39.5


