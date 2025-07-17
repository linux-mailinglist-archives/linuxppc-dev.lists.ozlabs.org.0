Return-Path: <linuxppc-dev+bounces-10293-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3577FB08F44
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 16:28:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjZyg0m1Wz3bnc;
	Fri, 18 Jul 2025 00:27:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752762475;
	cv=none; b=XBrXaYOnFPbA9/Hf10dnPXxpzVQiiKUqgKKHntH258m6VpwZJoePqmIDY8n5sL+rPZwx3Qp/29VyQsWakrqY5k4nJGvGg6s2E5z4V+evMDsHEI++dBE1PUD1f3bCdWmEtx9m1swvYs/GM58cd0Nmu5e/fxPEtP7n4WuJYEaU7Q/vq0GjncjE27EcyYaL9cXRZ9qT1NPZZoNjaYe17Jw3mFIkSrXVxOnNd93XmXhj7RxpzsqbbdS75XC7jBSoFogZ+vNvxi4TVYXIMNFbyczUVSlXte07XyJfCMtztZLYGtL2GXeQZiGZnmRtGYzJfIlHtFWQ1HWeZdpYhvIiyzyniw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752762475; c=relaxed/relaxed;
	bh=9U6pXPOm17QNJUh3dL0X5SvDfkuBM+kFPXcpz1Z7hWM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ClfSC6fW1Ca0eOwkjSypeZldxLW7c9pn5TzFzMesEiigHp4vBas/TrzxaXv28vS1DXZmnJhfkhI81/h8ekj/TOxV/9IlK/C7xkL09AKUPFoU9kKR5Zp3RlTQ5TL2rhx5HKFVrBXHlB+YaSAyDIAok0IdHzVyZIDfnsxDuXR+ays6qJf/Hh+MXxop7rQj9ItEa2C4fJT8D4r03vT+WVFlRmqYNhzLiX60LjnAcDL9OaQvCuO/sDRlYgdutCPzxcGfpz8KfuMjpItm/6d+c36oFLcP9IvrZRo3yTae1F+cYEiBTVVgrWoqPlFcakYtSw7J6G6ijBVwDO7jQyTrVlDzQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gKbgVX5T; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gKbgVX5T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjZyf1K7cz2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 00:27:54 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-553b5165cf5so1236391e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 07:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762471; x=1753367271; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9U6pXPOm17QNJUh3dL0X5SvDfkuBM+kFPXcpz1Z7hWM=;
        b=gKbgVX5TzZvYI28GjxHi2BXUoHe3aUGChjPKRZ0qV1FHTG9vE3nOJdZ/BHZW4ooKhT
         YjJ3mICz+59lZU2fFScy/ISNY/+OOknkn6g5NHzZyosHkirT+qwuQepHWFKW7cLFzJiz
         EmHeQQi+SwHDI1wsfG7dth/58+a0ra5PWusECWG2/CAmPeZ6aAbTb1Te0tJ2J1egwfce
         9kVBWtptvYt7vSap622Clr8/1Rk6+sBn5m7fwbz+nDkJyKBl2OGk3ssjqgy5u0f86oOD
         MCvdvsdnwXXOs9tCioOFMUwoCSYuh6uAhObqM+d40WTBMxx94pC8kf8pPF7rBtw8x4Yk
         6zZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762471; x=1753367271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9U6pXPOm17QNJUh3dL0X5SvDfkuBM+kFPXcpz1Z7hWM=;
        b=YrBAYdBl3v4u5uMcqvbwuhe0v1oZXnfVUN7Dttwu0xXt7QinsszAma39OGdT+Tn+I9
         b0mHCK+q03cdunkDwCeRC9cZJNWLuc/w614XFiMRjDjpfYbt8iuHl5XJDpEOuXCtA5nL
         fwPd2PBR4b3kfGsarcxRY43UNJ/VvEO2k/9aVW16F9crz3Hd/RsNjWc8ibsZajKTOr0o
         XqS3yDBg+2hFT8Up+iDlquSxEUO1A7Tt2IDlEqKpqt+U758nSKdIEkhmJCB07ezdUAbl
         yNlDWg+LYEw/8+5s/Zos2cQdO8posvXTQgHgOGFLz9NBWJXPHrnNlXwl+VgBHChJm3Wi
         OkSg==
X-Forwarded-Encrypted: i=1; AJvYcCUZLReS0ORcL+FDNQBnF3Rdqf7/p+bjCENGQ2coRcvmzH/fSyL4k6hDZ+4e+uysyoDxF+QOQRe3T89uo8c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yym8T7SkvpBGFJS8e6fOBZuMvuYFSBo788cSMzYauvvDWTgI+Jr
	hf5Km4E300WbQ/FdMhLEJFqeKma/q0lOtvRKaxttI695e5YZHFDeC5qN
X-Gm-Gg: ASbGncvkltZv2UhMrM6CY0y6t6KspcPvXwy+B96EJcd0lGf5B39jc2vWlh/wse/hd8X
	k5ix93TgQoogCONzCDegj4wi8A8XI9f0fmWd1lkpKOrrUo2bwi2xsohBNuJ/CFJ7t0JgxUx6JIS
	DnBk0Svc2xXxJOXRSNzfx/wHarCVBAtcOlQ30kOkSCm6kL1sqLJuWTAHaLaZSa2iItgF6Dqywlw
	BjMTeXF1XU6PejxO+Qww1CnE5bc1M7ze7rrA3mru2KBHrwa5a0cad3K5JwVMa6XMyYAkFm5VFXm
	2ZYwGV6t5abVk2akwJqMvxf/IC91jpEtWHn8Hs2Qx5ZbhSBTtEqXbgmXlGNC08fB7RdrU1JTrG3
	ZqaX+IEf2yTGZ+viVy6U0xWezKEL3mvlskYoq9cxdHUUgFKroiSnbPFtLNHDoDyzkfTmD
X-Google-Smtp-Source: AGHT+IFxg66CFuCFZcq7YEHf2jsYRpZfJ3opYk2GjZt6qN26RYtZXaN505yqdxOnxSgHLvlINQObtg==
X-Received: by 2002:a05:6512:78a:b0:553:2868:635c with SMTP id 2adb3069b0e04-55a233db5f5mr1804298e87.48.1752762470559;
        Thu, 17 Jul 2025 07:27:50 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:27:49 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org
Cc: ryabinin.a.a@gmail.com,
	glider@google.com,
	dvyukov@google.com,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH v3 03/12] kasan/powerpc: select ARCH_DEFER_KASAN and call kasan_init_generic
Date: Thu, 17 Jul 2025 19:27:23 +0500
Message-Id: <20250717142732.292822-4-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717142732.292822-1-snovitoll@gmail.com>
References: <20250717142732.292822-1-snovitoll@gmail.com>
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

PowerPC with radix MMU is the primary architecture that needs deferred
KASAN initialization, as it requires complex shadow memory setup before
KASAN can be safely enabled.

Select ARCH_DEFER_KASAN for PPC_RADIX_MMU to enable the static key
mechanism for runtime KASAN control. Other PowerPC configurations
(like book3e and 32-bit) can enable KASAN early and will use
compile-time constants instead.

Also call kasan_init_generic() which handles Generic KASAN initialization.
For PowerPC radix MMU (which selects ARCH_DEFER_KASAN), this enables
the static key. For other PowerPC variants, kasan_enable() is a no-op
and kasan_enabled() returns IS_ENABLED(CONFIG_KASAN).

Remove the PowerPC-specific static key and kasan_arch_is_ready()
implementation in favor of the unified interface.

This ensures that:
- PowerPC radix gets the runtime control it needs
- Other PowerPC variants get optimal compile-time behavior
- No unnecessary overhead is added where not needed

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Fixes: 55d77bae7342 ("kasan: fix Oops due to missing calls to kasan_arch_is_ready()")
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
Changes in v3:
- Added CONFIG_ARCH_DEFER_KASAN selection for PPC_RADIX_MMU only
- Kept ARCH_DISABLE_KASAN_INLINE selection since it's needed independently
---
 arch/powerpc/Kconfig                   |  1 +
 arch/powerpc/include/asm/kasan.h       | 12 ------------
 arch/powerpc/mm/kasan/init_32.c        |  2 +-
 arch/powerpc/mm/kasan/init_book3e_64.c |  2 +-
 arch/powerpc/mm/kasan/init_book3s_64.c |  6 +-----
 5 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c3e0cc83f12..e5a6aae6a77 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -123,6 +123,7 @@ config PPC
 	#
 	select ARCH_32BIT_OFF_T if PPC32
 	select ARCH_DISABLE_KASAN_INLINE	if PPC_RADIX_MMU
+	select ARCH_DEFER_KASAN			if PPC_RADIX_MMU
 	select ARCH_DMA_DEFAULT_COHERENT	if !NOT_COHERENT_CACHE
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
index b5bbb94c51f..957a57c1db5 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -53,18 +53,6 @@
 #endif
 
 #ifdef CONFIG_KASAN
-#ifdef CONFIG_PPC_BOOK3S_64
-DECLARE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
-
-static __always_inline bool kasan_arch_is_ready(void)
-{
-	if (static_branch_likely(&powerpc_kasan_enabled_key))
-		return true;
-	return false;
-}
-
-#define kasan_arch_is_ready kasan_arch_is_ready
-#endif
 
 void kasan_early_init(void);
 void kasan_mmu_init(void);
diff --git a/arch/powerpc/mm/kasan/init_32.c b/arch/powerpc/mm/kasan/init_32.c
index 03666d790a5..1d083597464 100644
--- a/arch/powerpc/mm/kasan/init_32.c
+++ b/arch/powerpc/mm/kasan/init_32.c
@@ -165,7 +165,7 @@ void __init kasan_init(void)
 
 	/* At this point kasan is fully initialized. Enable error messages */
 	init_task.kasan_depth = 0;
-	pr_info("KASAN init done\n");
+	kasan_init_generic();
 }
 
 void __init kasan_late_init(void)
diff --git a/arch/powerpc/mm/kasan/init_book3e_64.c b/arch/powerpc/mm/kasan/init_book3e_64.c
index 60c78aac0f6..0d3a73d6d4b 100644
--- a/arch/powerpc/mm/kasan/init_book3e_64.c
+++ b/arch/powerpc/mm/kasan/init_book3e_64.c
@@ -127,7 +127,7 @@ void __init kasan_init(void)
 
 	/* Enable error messages */
 	init_task.kasan_depth = 0;
-	pr_info("KASAN init done\n");
+	kasan_init_generic();
 }
 
 void __init kasan_late_init(void) { }
diff --git a/arch/powerpc/mm/kasan/init_book3s_64.c b/arch/powerpc/mm/kasan/init_book3s_64.c
index 7d959544c07..dcafa641804 100644
--- a/arch/powerpc/mm/kasan/init_book3s_64.c
+++ b/arch/powerpc/mm/kasan/init_book3s_64.c
@@ -19,8 +19,6 @@
 #include <linux/memblock.h>
 #include <asm/pgalloc.h>
 
-DEFINE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
-
 static void __init kasan_init_phys_region(void *start, void *end)
 {
 	unsigned long k_start, k_end, k_cur;
@@ -92,11 +90,9 @@ void __init kasan_init(void)
 	 */
 	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
 
-	static_branch_inc(&powerpc_kasan_enabled_key);
-
 	/* Enable error messages */
 	init_task.kasan_depth = 0;
-	pr_info("KASAN init done\n");
+	kasan_init_generic();
 }
 
 void __init kasan_early_init(void) { }
-- 
2.34.1


