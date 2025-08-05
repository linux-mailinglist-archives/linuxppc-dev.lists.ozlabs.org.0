Return-Path: <linuxppc-dev+bounces-10658-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29163B1B66E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 16:27:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxG2X44hlz3bnr;
	Wed,  6 Aug 2025 00:26:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754404004;
	cv=none; b=kYWQufaaYYYHcuX5LY3MYURJC+jAcMsP4TSY4HTK6O5moltBMAC0GZ7SjiZovUVaLmLbXihD/dSSZFRwozKuwprNu+R4uGK913EgnEcdaULpKHECMO3C4nI8gr3wbEZw291UVswPH/YTcf+qbLh4ko1lDSzlzbYvYN30vUCN00AaCW3Kq3b7QGnt5U3IhCE4Ypfq8QQXRJCbZYYZ1Euvl0sgnp12VPGnf9hG0HoXqYC9QIShgnB884gsCtVJdqV4OsvTfivD91/WO4Em3tUwQiPXj34ggbMsoqJaiwm63DwyfRzxt5hxsFxaNIcLAQbNcbwFP3m5EAn1F/Z9ykMJGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754404004; c=relaxed/relaxed;
	bh=DndoJEoEU+djai/jF18bii/cwZvYONRQ0C6xs3DhJyU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SnFa6gLzrIwtyOVJGTCAp/3yKISKwzeo+yn1B6FXGCBYGr1DIUpq/V+mn7uiohrq7hq1HSGWGQSs7+DDJ2RjtMpoJmFzgWKlaSD86IFmGshPnO0NL16P2lHqszlDqhs5X27cFbJKEM5RSoeR9I8McDZJxdJoV25RtDOx3BiPDsVMbN0RqTVmJTzmifMbMcFMsb+QGjVpLzauXfR86KndJSgTAKjPiiYPaIDlIDu7IsFRX7eRfSB8Zb98qSDjygl+4GxQ1g2eo8t+qptiBPepscmsgej6rHSE8CD9+lhFBZdxS+UMbatHe3ZVhS5dAuLcVoANGj5LE60AgnyA6bIVvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SX4rfoTf; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SX4rfoTf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxG2W555yz3bmS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 00:26:43 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-55b827aba01so3852346e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Aug 2025 07:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754404000; x=1755008800; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DndoJEoEU+djai/jF18bii/cwZvYONRQ0C6xs3DhJyU=;
        b=SX4rfoTfKBwoLWYpgsQADsaap9d/l5YcfbOj+i9sl+qtLqPdEEYSKBbVsi/TPm887L
         RPYkqfJiKgzV6ddkCyyqCdocEY3IrUzuKRUCskEwIyye805CGBqehVZ+5BgVRhQS8qfc
         d/69AMoYzQvVOqsV4y1Ou/GqVMxGZQCe+NyxxPXMBphNgZV8R3mb9AORQaREetTT5OTB
         HYOsEKPDmMoFyM6JrrP4dV1rU5mJacAh8htuJlGA7Y+uGCK5zzxfDb1ldLvhas5sH98p
         /bqX+wI//fzTvyvqtZLUvv5/WMW7zT+PcPNV2upY+uR2+GW2vFN9VKQz8z4EgdXPiisT
         +PQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754404000; x=1755008800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DndoJEoEU+djai/jF18bii/cwZvYONRQ0C6xs3DhJyU=;
        b=viqxtDKhHCpS9D/1NbM9HW6iLBcRVHbmYI8U90Rfo5K10BvxmiNCm3cs5Akhfa2jMs
         SpZrlaYIsQFTfbpMeSULTmGln+LcqHLLVUC2Bv8f3iOD6gRiYb68kKOdX6/XH+MlVydc
         KGE5xsk/JpMKV4gQMx0s4HJTMu9ZURIyJzq2RPnzkPKwDLN9iYTdvqsaKVW/pEt4y06E
         EMA2Y2NrsOGuA//h9/WlGLbGsC3YQjvqWtIiTt1P1U225HbIDx/R5Tae5Lzo4YblyVq/
         3KD6P+tYQGxS5UxPqJYxXnZSR8lm4fX3lBM9JWRHHoMpLn+5TS88LrOBznjsrvBjYIZN
         SZSg==
X-Forwarded-Encrypted: i=1; AJvYcCUxJxMn4mHX4AhIaUVrrlyW5m3uZyUKtNGl192CFx5p4AVSGYAy58JY/Lb3WxdJM6J23dMrV2p6wQhLTl0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywjr2CHik658981MHTyYcVGXOLKewzLR/dg8XBbRX+kraTVrBqv
	pB1+uY/dNbpYh7fxGsFMolTtPSuDVDqao4sr0+esLs998qWfsjTjY1xl
X-Gm-Gg: ASbGncuWAUuNHfCI9U3J1nN+puo5U9ce576BrQDmQ0sxzoL3UcQrRdR+w/qqJMPxak8
	JdKsy62ueayXeUgqZY4HtWRHtxNM6SQ9l63SVSulHOuQqeHsiF/ueqLw8o4sax8kjg6/PGkDIAj
	eRqKlfQq7OuViwjRYQmmKGurEvr0ezcJNJW0sqwJ0uFFTENA/4JYx0LhNI5s/S1PjFYqt6un8fi
	cu7Poi4E6WiMs8MgZ/URfq9LjSwpYwUF1QIEwL+z3uvLp3pPicefFA7RuOzVSw1iO1nOWWiu/Dr
	iwtIEvZBAhhbkVm360P5H+MB6hsPoVc90UYWYVLd9dCzGrH31wMMpLjkbNJgDukNM5jGCsh8x8L
	vXy9SAuVB6ziiXuHFCg5Ta/DjPQO9PLaIg7oMdmdn6fYHZI20JhhIuPdqjhdT/xW+3KRO/w==
X-Google-Smtp-Source: AGHT+IG8YXFpsfEvWLWpJ0j6eFW8/n9npKWJxSkpHVdxT2hyDgxCfNXo+mPOdolEzpL3+MkF6IOdvw==
X-Received: by 2002:a05:6512:1387:b0:553:25f4:695c with SMTP id 2adb3069b0e04-55b97bc54b1mr4200362e87.50.1754404000307;
        Tue, 05 Aug 2025 07:26:40 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a290fsm1976379e87.54.2025.08.05.07.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 07:26:39 -0700 (PDT)
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
Subject: [PATCH v4 5/9] kasan/loongarch: select ARCH_DEFER_KASAN and call kasan_init_generic
Date: Tue,  5 Aug 2025 19:26:18 +0500
Message-Id: <20250805142622.560992-6-snovitoll@gmail.com>
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

LoongArch needs deferred KASAN initialization as it has a custom
kasan_arch_is_ready() implementation that tracks shadow memory
readiness via the kasan_early_stage flag.

Select ARCH_DEFER_KASAN to enable the unified static key mechanism
for runtime KASAN control. Call kasan_init_generic() which handles
Generic KASAN initialization and enables the static key.

Replace kasan_arch_is_ready() with kasan_enabled() and delete the
flag kasan_early_stage in favor of the unified kasan_enabled()
interface.

Note that init_task.kasan_depth = 0 is called after kasan_init_generic(),
which is different than in other arch kasan_init(). This is left
unchanged as it cannot be tested.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
Changes in v4:
- Replaced !kasan_enabled() with !kasan_shadow_initialized() in
  loongarch which selects ARCH_DEFER_KASAN (Andrey Ryabinin)
---
 arch/loongarch/Kconfig             | 1 +
 arch/loongarch/include/asm/kasan.h | 7 -------
 arch/loongarch/mm/kasan_init.c     | 8 ++------
 3 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index f0abc38c40a..f6304c073ec 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -9,6 +9,7 @@ config LOONGARCH
 	select ACPI_PPTT if ACPI
 	select ACPI_SYSTEM_POWER_STATES_SUPPORT	if ACPI
 	select ARCH_BINFMT_ELF_STATE
+	select ARCH_DEFER_KASAN
 	select ARCH_DISABLE_KASAN_INLINE
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
diff --git a/arch/loongarch/include/asm/kasan.h b/arch/loongarch/include/asm/kasan.h
index 62f139a9c87..0e50e5b5e05 100644
--- a/arch/loongarch/include/asm/kasan.h
+++ b/arch/loongarch/include/asm/kasan.h
@@ -66,7 +66,6 @@
 #define XKPRANGE_WC_SHADOW_OFFSET	(KASAN_SHADOW_START + XKPRANGE_WC_KASAN_OFFSET)
 #define XKVRANGE_VC_SHADOW_OFFSET	(KASAN_SHADOW_START + XKVRANGE_VC_KASAN_OFFSET)
 
-extern bool kasan_early_stage;
 extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
 
 #define kasan_mem_to_shadow kasan_mem_to_shadow
@@ -75,12 +74,6 @@ void *kasan_mem_to_shadow(const void *addr);
 #define kasan_shadow_to_mem kasan_shadow_to_mem
 const void *kasan_shadow_to_mem(const void *shadow_addr);
 
-#define kasan_arch_is_ready kasan_arch_is_ready
-static __always_inline bool kasan_arch_is_ready(void)
-{
-	return !kasan_early_stage;
-}
-
 #define addr_has_metadata addr_has_metadata
 static __always_inline bool addr_has_metadata(const void *addr)
 {
diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasan_init.c
index d2681272d8f..57fb6e98376 100644
--- a/arch/loongarch/mm/kasan_init.c
+++ b/arch/loongarch/mm/kasan_init.c
@@ -40,11 +40,9 @@ static pgd_t kasan_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 #define __pte_none(early, pte) (early ? pte_none(pte) : \
 ((pte_val(pte) & _PFN_MASK) == (unsigned long)__pa(kasan_early_shadow_page)))
 
-bool kasan_early_stage = true;
-
 void *kasan_mem_to_shadow(const void *addr)
 {
-	if (!kasan_arch_is_ready()) {
+	if (!kasan_shadow_initialized()) {
 		return (void *)(kasan_early_shadow_page);
 	} else {
 		unsigned long maddr = (unsigned long)addr;
@@ -298,8 +296,6 @@ void __init kasan_init(void)
 	kasan_populate_early_shadow(kasan_mem_to_shadow((void *)VMALLOC_START),
 					kasan_mem_to_shadow((void *)KFENCE_AREA_END));
 
-	kasan_early_stage = false;
-
 	/* Populate the linear mapping */
 	for_each_mem_range(i, &pa_start, &pa_end) {
 		void *start = (void *)phys_to_virt(pa_start);
@@ -329,5 +325,5 @@ void __init kasan_init(void)
 
 	/* At this point kasan is fully initialized. Enable error messages */
 	init_task.kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized.\n");
+	kasan_init_generic();
 }
-- 
2.34.1


