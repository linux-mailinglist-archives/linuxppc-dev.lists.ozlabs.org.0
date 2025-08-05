Return-Path: <linuxppc-dev+bounces-10655-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F344DB1B666
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 16:26:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxG2P5lXQz2xnM;
	Wed,  6 Aug 2025 00:26:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754403997;
	cv=none; b=MeqRuoyFC5vDzsCRhW060AlaIvKhEuVo6KRglLGIpANK5xUYByyXahcsNJ3wGf1qJgo4e0tnD6CU/fPpQlyZA7ag4i2YxxiN+TXj2DcZXZ7fbdRvFLm68pQJcisTRbU0jvIHEittW+maW1KwhFajbfhyvPQkd0QvWkAEwKnkJxW+RWmC626kL7gt1nknvLw7y0siJzIdQ5+z7Sws18JO/VkzBxHY37uwczGG6pSSFC1OHDs2kz6t6cVVrDXVdYoO22dNYzSng6q1L0nuHBzOkend1A/XMcZEeEzlwWv/6BCPHD9fKaAwJhxu1ERXv8Ezr5AyGAieHX//CRZoWgEiNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754403997; c=relaxed/relaxed;
	bh=44Cef9kvp87sJdDYN0I0T3XW3v08YaC6etU0qwyWC00=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y8nt+38a+CFCqwYqRervIjh44m2z4uI05Fe0X/a5oHK4BZv32ooFEf4x+E1tZRTjp17/rNjxROzsfexBEiOy9u5uoc6QD63RHZVWCmlNnBpW6L0DR4M/N0CDt6dUM0VOl8IGeYhebQDycJCB3BAyelCMeT8XdNAz33nQ8eviaUe91t9f/NBeIWKAmOQHsZ2wgM89H8T+V96oUiDFNBwKZ9q2AXqOuUnFb/A4hNUrOAzjqUyXg3OShRqDrE0mS4zoqauwBjL4+WE+9z0PTTWW0cvEgWygB/D9FBWuJih7lW3B5UsIMUyNCfv8tKF0WWwrzOscQ+2bQ3L4vaiM+uYYSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Tnp5q+kK; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Tnp5q+kK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxG2N6Fy6z3bmc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 00:26:36 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-55b859545c3so6105035e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Aug 2025 07:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754403994; x=1755008794; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44Cef9kvp87sJdDYN0I0T3XW3v08YaC6etU0qwyWC00=;
        b=Tnp5q+kKMJVnRiCviIE0d8nmAjs0F9pMRM2uPYNKb0mMH1t5uKnHww+xlvUPL282+Y
         0hDuCAosBWrrh2HfGyALHDO2GDmqgGBd75BfUlGjYV5/3jZSz+IuGfLIknI8IgMwNMff
         DIK7cZqoCfI2ei2Yxrha458q2xb4DcAZRZx0qvnzv/xKk/ie9Tm4V9sRpB5w7yy5zl+J
         mRrq58ONl3gY4qIkPI4kpqOdrW3yp5SDJuabPAJIG5JNuUcOQyIQuHtBHA7bqDPFqbc9
         xtPTgqKgDdLIN9amoUyavNhm10I8XZ2+3aotf7jx4lIbAA7qEtlMDoBZ6/vTl9rc0dVL
         J/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754403994; x=1755008794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44Cef9kvp87sJdDYN0I0T3XW3v08YaC6etU0qwyWC00=;
        b=Ll5/d4sB9bgg58B0yYRoZCiO/9c97No37KFbP0Z8gHOYeYloNeAYG3jAuUXo/aEQnJ
         5RJixNyzexKpwpZWJump5/cYFvr6miWgF58ww/Uh57gPTbqo+LvEND6/GHQzE90+2leI
         u9GvFccmQEYH5KVgjA4PeaEBGnX2N1cwv85qGpmpGR9VmNDP3iBQU0fveHVa6SRQGAIg
         D/w71UeswBsi94DxD64bzx16uMEn+xY/o51y3ibPdIOvaLIdOBYh80LHh5wl/xNgB1Wh
         U1y2JViN42d9s3dbMSOIujH89cXRPyqc94o4zYCGTJQVqzGhQ1u+HarXEfXzpBB5ldxh
         BNwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvDYZLtzuQHYfGOmrQchYJQh998RPZxrsnMU6qrJq2I+icg+gzwDbxD2my2BFaU5+KaQmp9S0FD7d1hq4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxGtrYnNQHcfHviNYTsAe0j2svbezCpz6F1DBEnpj55eTvLqCWA
	omox7ise1vvrDupuAJx9lfM7996ZhGvuOQzDwAjh1QLhI+6/9/strBc+
X-Gm-Gg: ASbGncuLr7X9z7KZkru9gwitbu+Cb+iR1p06ZfOnz8o6N0fpWSC2dBbLLiQZ1vvFMmH
	jG7CKv6/bMoaKCen8aTTOEB2QsGRjB0WjLBxJpS/wJjJmLUrUrvvkRKrTNfOBjp9wi6gmNjo6Dk
	czlyZM8cu8TgQUmO9RorLIGbHDHVFSWNHeZKe0ategKNbDSkLMsU4PTV4UaW4jfSwNiUfDRsJsZ
	Rav/ej+r+zgxiZGq2haKfIagPWDLGZ7kt2q+eicau7I7BwEKXyU6yezZMQ5jxXy7DheNXf1YM30
	jyfRGI3IF0tfU3wiik/YqE7w8VKnrmAtw8uOclfOSiZo7trz9VlJUhBTA++TryGLuxVRo8LzPP8
	v6Py+h6MznXztAPVF1op+K+71X53lyJVeWZ/lY1VzVsvoTDxQAUfHRmxMUd1xqz70hXAHaw==
X-Google-Smtp-Source: AGHT+IG3IvKFDzWW1UJXkvwSM56EKK5Kb8nNkpLL/WnL+raFeiYW6aZ7Xti28XnaNJYqXW0SrOWKyA==
X-Received: by 2002:a05:6512:4023:b0:55b:81de:3576 with SMTP id 2adb3069b0e04-55bab40c2d5mr1298432e87.24.1754403993514;
        Tue, 05 Aug 2025 07:26:33 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a290fsm1976379e87.54.2025.08.05.07.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 07:26:33 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	zhangqing@loongson.cn,
	chenhuacai@loongson.cn,
	trishalfonso@google.com,
	davidgow@google.com
Cc: glider@google.com,
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
Subject: [PATCH v4 2/9] kasan/powerpc: select ARCH_DEFER_KASAN and call kasan_init_generic
Date: Tue,  5 Aug 2025 19:26:15 +0500
Message-Id: <20250805142622.560992-3-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805142622.560992-1-snovitoll@gmail.com>
References: <20250805142622.560992-1-snovitoll@gmail.com>
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

Remove the PowerPC-specific static key and kasan_arch_is_ready()
implementation in favor of the unified interface.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Fixes: 55d77bae7342 ("kasan: fix Oops due to missing calls to kasan_arch_is_ready()")
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/powerpc/Kconfig                   |  1 +
 arch/powerpc/include/asm/kasan.h       | 12 ------------
 arch/powerpc/mm/kasan/init_32.c        |  2 +-
 arch/powerpc/mm/kasan/init_book3e_64.c |  2 +-
 arch/powerpc/mm/kasan/init_book3s_64.c |  6 +-----
 5 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 93402a1d9c9..11c8ef2d88e 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -122,6 +122,7 @@ config PPC
 	# Please keep this list sorted alphabetically.
 	#
 	select ARCH_32BIT_OFF_T if PPC32
+	select ARCH_DEFER_KASAN			if PPC_RADIX_MMU
 	select ARCH_DISABLE_KASAN_INLINE	if PPC_RADIX_MMU
 	select ARCH_DMA_DEFAULT_COHERENT	if !NOT_COHERENT_CACHE
 	select ARCH_ENABLE_MEMORY_HOTPLUG
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


