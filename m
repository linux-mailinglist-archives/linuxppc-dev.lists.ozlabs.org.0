Return-Path: <linuxppc-dev+bounces-5556-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B9EA1C296
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jan 2025 10:47:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yg8wq0wwmz2xGH;
	Sat, 25 Jan 2025 20:47:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::236"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737798443;
	cv=none; b=OhkTfCAJZkVsdL7NvE21BkogYi2Cfgv8rKv6JPUBNrPQ62TqhZ/tDsOc0shCOFUdCwEXRFvkYJZ4YNHrv1h/Xt9/4WjbtoIF1NZZSL3/eRKHXTcQ/PMywA/GRxGlAOWmenqss5UnS8Py9vDIBeM2/VQM5Ti3FhN8FfCz8iPc2/phG7nLv42rdMmK/0U9lN2WBBCVYV2pDM1wtZf4tZlm9EBnadbokPR7IsN/fmGfAp0XJuptLp/FhUDsNwurB1pTpDCl5aDM0oChgOxAaYULzu716xO0x7W9hpKghAu4ReQ0SF+SFAERLcZ1mII/KQtj+MJXCg5uNCUhO199ezPUiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737798443; c=relaxed/relaxed;
	bh=1UyTqjhS70TTifCokTO1QK5jLPp2dLBvHmXIU9cRUV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ltr9/+1FeTO4GyDi+GWoFWoMwCaAsXe8GCRC7CODidxUrT5cxQ7GiEDrXdQyBWdfCm6U/PYvKgwIYXMbiX3MUYXF7F+0RkgzMDmjeRAxI4GUONp870Zjc0AE9Je6ncmxEmOumyjWzog6eGrD/k1ZuwXxh68/dwjIxjsJCiMzOVPkzbi26gaxfswE+iga5DVUQRhzDjB+dohMIp0KXArjITkz+h+Vh35jRKj4J2SktLAH/njgoAoVuj+J0pPx/AQlbvyiSEE7zNx48IEew/s8v6PvnM3ia61EAQ267QjCNPqRHZUUgz7qrlhKpOhtsUzb4yvfsp7gm96sPiNqbqgGzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FyMoOHbj; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=kirjanov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FyMoOHbj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=kirjanov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yg8wn3LmDz2xDD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jan 2025 20:47:20 +1100 (AEDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30227ccf803so26586461fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jan 2025 01:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737798435; x=1738403235; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1UyTqjhS70TTifCokTO1QK5jLPp2dLBvHmXIU9cRUV8=;
        b=FyMoOHbjfMjqZF+tfuY7O4dytFQcE9pEJSvM5iSHhZRbZaNWVlqIlmvXsGp/HEmj/G
         VDP0pMHSyDvrr5kj2L5g0QwhVrtal+VSy10cgU90LdjGJ69wxK3oSz+s4uDaRRIVnv2r
         hvRdH331kEcLMUmxqxHi0IaLjcBTO7CUjVKXCypbNRTs/r1hDp8lQ15zf/Mew/gFnvyQ
         fLQkY/c0p5AIwYGyRifwFIctVR/y40/20bNUlCiuIEx7qmoFisUi09OXhSo/btrZzpFG
         bb+yFEY+1sl+/HqZrAElCgBp7lvQjDB4Zj+zZIF83diMkAFrcgaCqzUGqfKABvv6gmgL
         tlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737798435; x=1738403235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UyTqjhS70TTifCokTO1QK5jLPp2dLBvHmXIU9cRUV8=;
        b=mACuBuEs7Zmpc5WiRneroNM9bCvfIhWOVmzapC8lFjSPCFO5egOH1h+Etr7E90PtoK
         XZkVog02zX9GmGhCvD7f/Jc9xo5jX7cneRMy+uKnSt0Gm89eVuwqFUdlV2RYasTA5pLO
         8lbfFmv8N0SG5gFBYGOapKtX9PdbuA0KSNhIsLC+mpdggZcQOXxTDM4FTTaDoYFYbScn
         C6y3sHEF7ZtQ5M45PvyHCzD3EtTZ1CW4CAhHTM1Ro9kIGONePgmKCtcz1VIXiG9rp8fx
         gSnv6mV5vYv3c+KI70F+v2BVGalKTwSxZ5YGreegvdph85fJFJ+wzbnJ4T6SNIQ9T8im
         GJ4w==
X-Gm-Message-State: AOJu0Yxi1xTB+2vFE3mer69M9kowAaZMrD2Ju4Tz1ApOSb0ipOqukq6J
	iQ+YrBv0SaUZ4Fm1zqTZyyc7TjRUUze0ckdrUa/frBEYZ40zMn5T3JhHZDps
X-Gm-Gg: ASbGncuMe3ui1M5BEYZQ1fXj2WJCu5K1rhU6YX9OlQQ6uqEQZW/8hK8nqA9SgviM8yF
	x549Q8FqCN2Sw1HRmF01asH3or2y80ar4D6EF67Rmonusydrv8SHCB/RMOM8B6x4vh0Ywcy1iD4
	XxRGWuNcET1ADkZEWBcSG8yBplUewpu+Fzii8NW0cy/10pYj/vkKGrrbGISMqY5gx2h7YTKxEJH
	49/3ZZqjBn8V4lsK6cyYMHdu5TTyP773ZIpt4LyL70E6UcTPiOI9KxdDdczQLfbVWNuMj0AbrPy
	jNHX/hDkun3OiBY=
X-Google-Smtp-Source: AGHT+IFlkO5XlVW4dR+KTXuTvBbjL+KEsvfrNUviMfY7Lykiwt5idkjjs0uWV2r5til4wjIUnsK1HQ==
X-Received: by 2002:a2e:be9b:0:b0:302:497a:9e7d with SMTP id 38308e7fff4ca-3072ca69909mr138350841fa.14.1737798434525;
        Sat, 25 Jan 2025 01:47:14 -0800 (PST)
Received: from localhost.localdomain ([83.217.202.104])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076baef4desm6689121fa.59.2025.01.25.01.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 01:47:13 -0800 (PST)
From: Denis Kirjanov <kirjanov@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	Denis Kirjanov <kirjanov@gmail.com>
Subject: [PATCH] powerpc/powermac: Drop the unused debug macro
Date: Sat, 25 Jan 2025 04:46:51 -0500
Message-ID: <20250125094651.70708-1-kirjanov@gmail.com>
X-Mailer: git-send-email 2.47.2
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Drop the unused DBG macro

Signed-off-by: Denis Kirjanov <kirjanov@gmail.com>
---
 arch/powerpc/platforms/powermac/feature.c | 8 --------
 arch/powerpc/platforms/powermac/smp.c     | 8 --------
 arch/powerpc/platforms/powermac/time.c    | 8 --------
 3 files changed, 24 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/feature.c b/arch/powerpc/platforms/powermac/feature.c
index 2cc257f75c50..6365cea27abc 100644
--- a/arch/powerpc/platforms/powermac/feature.c
+++ b/arch/powerpc/platforms/powermac/feature.c
@@ -39,14 +39,6 @@
 
 #include "pmac.h"
 
-#undef DEBUG_FEATURE
-
-#ifdef DEBUG_FEATURE
-#define DBG(fmt...) printk(KERN_DEBUG fmt)
-#else
-#define DBG(fmt...)
-#endif
-
 #ifdef CONFIG_PPC_BOOK3S_32
 extern int powersave_lowspeed;
 #endif
diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index 09e7fe24fac1..ffd5bc96b92c 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -53,14 +53,6 @@
 
 #include "pmac.h"
 
-#undef DEBUG
-
-#ifdef DEBUG
-#define DBG(fmt...) udbg_printf(fmt)
-#else
-#define DBG(fmt...)
-#endif
-
 extern void __secondary_start_pmac_0(void);
 
 static void (*pmac_tb_freeze)(int freeze);
diff --git a/arch/powerpc/platforms/powermac/time.c b/arch/powerpc/platforms/powermac/time.c
index 8633891b7aa5..6dc16286691a 100644
--- a/arch/powerpc/platforms/powermac/time.c
+++ b/arch/powerpc/platforms/powermac/time.c
@@ -35,14 +35,6 @@
 
 #include "pmac.h"
 
-#undef DEBUG
-
-#ifdef DEBUG
-#define DBG(x...) printk(x)
-#else
-#define DBG(x...)
-#endif
-
 /*
  * Calibrate the decrementer frequency with the VIA timer 1.
  */
-- 
2.47.2


