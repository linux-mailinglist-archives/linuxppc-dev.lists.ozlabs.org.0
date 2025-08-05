Return-Path: <linuxppc-dev+bounces-10654-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F0CB1B665
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 16:26:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxG2N6n9Cz3bmy;
	Wed,  6 Aug 2025 00:26:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::131"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754403996;
	cv=none; b=ZRnah1puCHCowWE1BygAWMaaa/qI0lgX2OAAEHxHl6GofZObF1oe08VJ4HRwVx0o1fz9aupEbsybXwTT2SO+1axD20uiFFH5Iqxr4XWuwSicpXzrl1CzRb17nvMXMuY4I0iwenL9LKryRRXv+D3Btj8GhDPk75kdfMkM4j2jghEnAXvvnOhICpXi7UfTIhb0j+adqWadBEaC3U7vWtRXBRELnHm1iavDD8+AfNENErh/khh7N9C3EH7WLxnHNivAWPsXqG2XbaecSMQJoFREDNNtssR4V19qfaMZbV0ee+42RGmtukPvVVar6Yiw8Po1S95w1xhieFC1Jv/4L4PGow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754403996; c=relaxed/relaxed;
	bh=45SkqGXSprn3rZh3fzo6uRt8dTAwtmpvzDxxX6Brgt8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LYnydyYmcT6WadjrrghbStx+lkjbt1PIZYv2EPdmjMD6nh4Jajp6qqJ++ghS2/a9N5U3UFJiIRuTBQB7GxZ24JIwqsVJNqrymk/zrKFyVk3pmcaMPGNOFUMIyNVaQq5xeLsnNr74XZcmzWfoS6lY0MQy35sL3J4cqNcm1OY3l3hNCEcjhpz2rF56JtZQ2CyroLplYAdcShHwWB0YJB8VD1pR3nIEdbm8fdCUtEnd+6jIx2169qlFU3b1cInnYe17uquivC+rdqYg9ukFha6emstS1xJFFjMgCNYMXUWQ8cJE9/LJwVJ/9GppvLrzO8GfU6yPab9oKu7Zq8mX5+q0jA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NKJoZUMF; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NKJoZUMF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxG2L1wkMz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 00:26:34 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-55b96b154bdso3368203e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Aug 2025 07:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754403991; x=1755008791; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45SkqGXSprn3rZh3fzo6uRt8dTAwtmpvzDxxX6Brgt8=;
        b=NKJoZUMFV5Alpj4jy6HzrCU07DQ7BsXbh/7xlUFMxcGUvDjDOaCCfP+kMGH5wbq687
         y0N8jpyF5meYUek0yxNYHm8GPnCZLq4BqnaC1wpojViKCHzPftS5+EWEwIUQX9IQebSN
         IE8cgcbxmtsNUS9wqBFirM6fTZWlvvjVC3zFOlisM/KfbJrhlTmG4xakV0mj6ZE9mG9/
         vBNrDwQuTijw5FnHf8bd+5UAcwft3Twq3O/8KllS+m6CVAqrxkE/9QAh1LhyFzX5VijK
         XtOECpUJqA+clvhtpjVbOgrjwe5ZZabgNJ5ggRzd+uPKS08MI7jyExEX6FNK/9VqPm6r
         1rdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754403991; x=1755008791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45SkqGXSprn3rZh3fzo6uRt8dTAwtmpvzDxxX6Brgt8=;
        b=wE/xokQ7FiEAjHIqhfyD4xR9ntXNjFPX9QSsb8CtJO7DpCOFx1SmJRRp/e1aULrt8V
         gqbalKLteliINyKF0E+bHW3t+0NzcZgMCKpk/rXhr5FT5MdCIdTlL4AP3YQ9Dz+VxHwR
         C/Ss+3y+d2vPcE5GzKZLZY2kvCum3wqu0FoHGHy0hZU73cl/ZPJ5ywosGK2zgniKGkgj
         wI4kWWeEJR9SVxyCsHmMZt510vXBTTd0afr15m6dVbK1Hgp3JsjFyizb/v9M5EzywUL0
         zy7/ag4HpoDXoKLOUOUM7q/ZCOMOR990xH8H1GKJk8gtdYCwpz0QYDO2bM7M7gLaHuDT
         LjjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVROX/AvggUxsDaj+avpTdx/zvPe4ZWFqDiaTlch732bo/T52dFgtEIY0oawNa95WOk5c1g5uEHadBEsq8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzutEX5ewq8jFo5xpF53WP4Cm4shi6D0g4A5e+kguBnF2ZjVkJm
	0IFwegdCjHEcB1bbdAgY0ZYBCU7PjZgP3P4a1111wvlTjDo5Iwl8pX/4
X-Gm-Gg: ASbGnctxcPBDIRT4V+C0rKsrMfpnewdXPhX8p9NxEkCWDTQk+YiaiP+NfNzkNt+Cj6E
	LUr4dlMDkP1+VvyjZaurAafV28MejDikkT8lBQeG/3n4lRNU8GodEC4imRHVY++Eadbm/4sZXuR
	5d4A8PEmrazHG+rH2e6dC026Z1y7B3i/sExe1OQhkoSI7CFj8CoK0kDiuv4ryKTEeAFofgLAVWB
	n65+HRWIyqBF4ioedAUI3mPY0bIR/BgyFzVe1B3G0yX2uBIsll6UkSJ5uof4IBQAxs+QVwYC60f
	aApqEPh2/QF/P4aOkm7GDCmd0rlISff2VQstIW7B4tz8sYK5Qs+h7WldMgneeLVRE/zNGwfHK+m
	fuMb2SM7vgv8LNEWuw/6oHWzGZc+GXwF660NKew6cM8ILIvbTo1Q5E7zBOCjBHa0YkNzQlQ==
X-Google-Smtp-Source: AGHT+IFIhvg/qdpvjgLPKAneDjkcPEsjQxny1M9S3dqWY6ZtkwE8RY1soF6geHJvLPSqQEF+jUI1OA==
X-Received: by 2002:a05:6512:3053:b0:55b:858e:b602 with SMTP id 2adb3069b0e04-55b97b92fc6mr3295883e87.42.1754403990799;
        Tue, 05 Aug 2025 07:26:30 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a290fsm1976379e87.54.2025.08.05.07.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 07:26:30 -0700 (PDT)
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
Subject: [PATCH v4 1/9] kasan: introduce ARCH_DEFER_KASAN and unify static key across modes
Date: Tue,  5 Aug 2025 19:26:14 +0500
Message-Id: <20250805142622.560992-2-snovitoll@gmail.com>
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

Introduce CONFIG_ARCH_DEFER_KASAN to identify architectures that need
to defer KASAN initialization until shadow memory is properly set up,
and unify the static key infrastructure across all KASAN modes.

Some architectures (like PowerPC with radix MMU) need to set up their
shadow memory mappings before KASAN can be safely enabled, while others
(like s390, x86, arm) can enable KASAN much earlier or even from the
beginning.

Historically, the runtime static key kasan_flag_enabled existed only for
CONFIG_KASAN_HW_TAGS mode. Generic and SW_TAGS modes either relied on
architecture-specific kasan_arch_is_ready() implementations or evaluated
KASAN checks unconditionally, leading to code duplication.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
Changes in v4:
- Fixed HW_TAGS static key functionality (was broken in v3)
- Merged configuration and implementation for atomicity
---
 include/linux/kasan-enabled.h | 36 +++++++++++++++++++++++-------
 include/linux/kasan.h         | 42 +++++++++++++++++++++++++++--------
 lib/Kconfig.kasan             |  8 +++++++
 mm/kasan/common.c             | 18 ++++++++++-----
 mm/kasan/generic.c            | 23 +++++++++++--------
 mm/kasan/hw_tags.c            |  9 +-------
 mm/kasan/kasan.h              | 36 +++++++++++++++++++++---------
 mm/kasan/shadow.c             | 32 ++++++--------------------
 mm/kasan/sw_tags.c            |  4 +++-
 mm/kasan/tags.c               |  2 +-
 10 files changed, 133 insertions(+), 77 deletions(-)

diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enabled.h
index 6f612d69ea0..52a3909f032 100644
--- a/include/linux/kasan-enabled.h
+++ b/include/linux/kasan-enabled.h
@@ -4,32 +4,52 @@
 
 #include <linux/static_key.h>
 
-#ifdef CONFIG_KASAN_HW_TAGS
+/* Controls whether KASAN is enabled at all (compile-time check). */
+static __always_inline bool kasan_enabled(void)
+{
+	return IS_ENABLED(CONFIG_KASAN);
+}
 
+#if defined(CONFIG_ARCH_DEFER_KASAN) || defined(CONFIG_KASAN_HW_TAGS)
+/*
+ * Global runtime flag for KASAN modes that need runtime control.
+ * Used by ARCH_DEFER_KASAN architectures and HW_TAGS mode.
+ */
 DECLARE_STATIC_KEY_FALSE(kasan_flag_enabled);
 
-static __always_inline bool kasan_enabled(void)
+/*
+ * Runtime control for shadow memory initialization or HW_TAGS mode.
+ * Uses static key for architectures that need deferred KASAN or HW_TAGS.
+ */
+static __always_inline bool kasan_shadow_initialized(void)
 {
 	return static_branch_likely(&kasan_flag_enabled);
 }
 
-static inline bool kasan_hw_tags_enabled(void)
+static inline void kasan_enable(void)
+{
+	static_branch_enable(&kasan_flag_enabled);
+}
+#else
+/* For architectures that can enable KASAN early, use compile-time check. */
+static __always_inline bool kasan_shadow_initialized(void)
 {
 	return kasan_enabled();
 }
 
-#else /* CONFIG_KASAN_HW_TAGS */
+static inline void kasan_enable(void) {}
+#endif /* CONFIG_ARCH_DEFER_KASAN || CONFIG_KASAN_HW_TAGS */
 
-static inline bool kasan_enabled(void)
+#ifdef CONFIG_KASAN_HW_TAGS
+static inline bool kasan_hw_tags_enabled(void)
 {
-	return IS_ENABLED(CONFIG_KASAN);
+	return kasan_shadow_initialized();
 }
-
+#else
 static inline bool kasan_hw_tags_enabled(void)
 {
 	return false;
 }
-
 #endif /* CONFIG_KASAN_HW_TAGS */
 
 #endif /* LINUX_KASAN_ENABLED_H */
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 890011071f2..5bf05aed795 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -194,7 +194,7 @@ bool __kasan_slab_pre_free(struct kmem_cache *s, void *object,
 static __always_inline bool kasan_slab_pre_free(struct kmem_cache *s,
 						void *object)
 {
-	if (kasan_enabled())
+	if (kasan_shadow_initialized())
 		return __kasan_slab_pre_free(s, object, _RET_IP_);
 	return false;
 }
@@ -229,7 +229,7 @@ static __always_inline bool kasan_slab_free(struct kmem_cache *s,
 						void *object, bool init,
 						bool still_accessible)
 {
-	if (kasan_enabled())
+	if (kasan_shadow_initialized())
 		return __kasan_slab_free(s, object, init, still_accessible);
 	return false;
 }
@@ -237,7 +237,7 @@ static __always_inline bool kasan_slab_free(struct kmem_cache *s,
 void __kasan_kfree_large(void *ptr, unsigned long ip);
 static __always_inline void kasan_kfree_large(void *ptr)
 {
-	if (kasan_enabled())
+	if (kasan_shadow_initialized())
 		__kasan_kfree_large(ptr, _RET_IP_);
 }
 
@@ -302,7 +302,7 @@ bool __kasan_mempool_poison_pages(struct page *page, unsigned int order,
 static __always_inline bool kasan_mempool_poison_pages(struct page *page,
 						       unsigned int order)
 {
-	if (kasan_enabled())
+	if (kasan_shadow_initialized())
 		return __kasan_mempool_poison_pages(page, order, _RET_IP_);
 	return true;
 }
@@ -356,7 +356,7 @@ bool __kasan_mempool_poison_object(void *ptr, unsigned long ip);
  */
 static __always_inline bool kasan_mempool_poison_object(void *ptr)
 {
-	if (kasan_enabled())
+	if (kasan_shadow_initialized())
 		return __kasan_mempool_poison_object(ptr, _RET_IP_);
 	return true;
 }
@@ -543,6 +543,12 @@ void kasan_report_async(void);
 
 #endif /* CONFIG_KASAN_HW_TAGS */
 
+#ifdef CONFIG_KASAN_GENERIC
+void __init kasan_init_generic(void);
+#else
+static inline void kasan_init_generic(void) { }
+#endif
+
 #ifdef CONFIG_KASAN_SW_TAGS
 void __init kasan_init_sw_tags(void);
 #else
@@ -562,11 +568,29 @@ static inline void kasan_init_hw_tags(void) { }
 #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
 
 void kasan_populate_early_vm_area_shadow(void *start, unsigned long size);
-int kasan_populate_vmalloc(unsigned long addr, unsigned long size);
-void kasan_release_vmalloc(unsigned long start, unsigned long end,
+
+int __kasan_populate_vmalloc(unsigned long addr, unsigned long size);
+static inline int kasan_populate_vmalloc(unsigned long addr, unsigned long size)
+{
+	if (!kasan_shadow_initialized())
+		return 0;
+	return __kasan_populate_vmalloc(addr, size);
+}
+
+void __kasan_release_vmalloc(unsigned long start, unsigned long end,
 			   unsigned long free_region_start,
 			   unsigned long free_region_end,
 			   unsigned long flags);
+static inline void kasan_release_vmalloc(unsigned long start,
+			   unsigned long end,
+			   unsigned long free_region_start,
+			   unsigned long free_region_end,
+			   unsigned long flags)
+{
+	if (kasan_shadow_initialized())
+		__kasan_release_vmalloc(start, end, free_region_start,
+			   free_region_end, flags);
+}
 
 #else /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
 
@@ -592,7 +616,7 @@ static __always_inline void *kasan_unpoison_vmalloc(const void *start,
 						unsigned long size,
 						kasan_vmalloc_flags_t flags)
 {
-	if (kasan_enabled())
+	if (kasan_shadow_initialized())
 		return __kasan_unpoison_vmalloc(start, size, flags);
 	return (void *)start;
 }
@@ -601,7 +625,7 @@ void __kasan_poison_vmalloc(const void *start, unsigned long size);
 static __always_inline void kasan_poison_vmalloc(const void *start,
 						 unsigned long size)
 {
-	if (kasan_enabled())
+	if (kasan_shadow_initialized())
 		__kasan_poison_vmalloc(start, size);
 }
 
diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index f82889a830f..38456560c85 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -19,6 +19,14 @@ config ARCH_DISABLE_KASAN_INLINE
 	  Disables both inline and stack instrumentation. Selected by
 	  architectures that do not support these instrumentation types.
 
+config ARCH_DEFER_KASAN
+	bool
+	help
+	  Architectures should select this if they need to defer KASAN
+	  initialization until shadow memory is properly set up. This
+	  enables runtime control via static keys. Otherwise, KASAN uses
+	  compile-time constants for better performance.
+
 config CC_HAS_KASAN_GENERIC
 	def_bool $(cc-option, -fsanitize=kernel-address)
 
diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index ed4873e18c7..dff5f7bfad1 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -32,6 +32,15 @@
 #include "kasan.h"
 #include "../slab.h"
 
+#if defined(CONFIG_ARCH_DEFER_KASAN) || defined(CONFIG_KASAN_HW_TAGS)
+/*
+ * Definition of the unified static key declared in kasan-enabled.h.
+ * This provides consistent runtime enable/disable across KASAN modes.
+ */
+DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
+EXPORT_SYMBOL(kasan_flag_enabled);
+#endif
+
 struct slab *kasan_addr_to_slab(const void *addr)
 {
 	if (virt_addr_valid(addr))
@@ -250,7 +259,7 @@ static inline void poison_slab_object(struct kmem_cache *cache, void *object,
 bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
 				unsigned long ip)
 {
-	if (!kasan_arch_is_ready() || is_kfence_address(object))
+	if (is_kfence_address(object))
 		return false;
 	return check_slab_allocation(cache, object, ip);
 }
@@ -258,7 +267,7 @@ bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
 bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool init,
 		       bool still_accessible)
 {
-	if (!kasan_arch_is_ready() || is_kfence_address(object))
+	if (is_kfence_address(object))
 		return false;
 
 	poison_slab_object(cache, object, init, still_accessible);
@@ -282,9 +291,6 @@ bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool init,
 
 static inline bool check_page_allocation(void *ptr, unsigned long ip)
 {
-	if (!kasan_arch_is_ready())
-		return false;
-
 	if (ptr != page_address(virt_to_head_page(ptr))) {
 		kasan_report_invalid_free(ptr, ip, KASAN_REPORT_INVALID_FREE);
 		return true;
@@ -511,7 +517,7 @@ bool __kasan_mempool_poison_object(void *ptr, unsigned long ip)
 		return true;
 	}
 
-	if (is_kfence_address(ptr) || !kasan_arch_is_ready())
+	if (is_kfence_address(ptr))
 		return true;
 
 	slab = folio_slab(folio);
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index d54e89f8c3e..1d20b925b9d 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -36,6 +36,17 @@
 #include "kasan.h"
 #include "../slab.h"
 
+/*
+ * Initialize Generic KASAN and enable runtime checks.
+ * This should be called from arch kasan_init() once shadow memory is ready.
+ */
+void __init kasan_init_generic(void)
+{
+	kasan_enable();
+
+	pr_info("KernelAddressSanitizer initialized (generic)\n");
+}
+
 /*
  * All functions below always inlined so compiler could
  * perform better optimizations in each of __asan_loadX/__assn_storeX
@@ -165,7 +176,7 @@ static __always_inline bool check_region_inline(const void *addr,
 						size_t size, bool write,
 						unsigned long ret_ip)
 {
-	if (!kasan_arch_is_ready())
+	if (!kasan_shadow_initialized())
 		return true;
 
 	if (unlikely(size == 0))
@@ -189,13 +200,10 @@ bool kasan_check_range(const void *addr, size_t size, bool write,
 	return check_region_inline(addr, size, write, ret_ip);
 }
 
-bool kasan_byte_accessible(const void *addr)
+bool __kasan_byte_accessible(const void *addr)
 {
 	s8 shadow_byte;
 
-	if (!kasan_arch_is_ready())
-		return true;
-
 	shadow_byte = READ_ONCE(*(s8 *)kasan_mem_to_shadow(addr));
 
 	return shadow_byte >= 0 && shadow_byte < KASAN_GRANULE_SIZE;
@@ -495,9 +503,6 @@ static void release_alloc_meta(struct kasan_alloc_meta *meta)
 
 static void release_free_meta(const void *object, struct kasan_free_meta *meta)
 {
-	if (!kasan_arch_is_ready())
-		return;
-
 	/* Check if free meta is valid. */
 	if (*(u8 *)kasan_mem_to_shadow(object) != KASAN_SLAB_FREE_META)
 		return;
@@ -562,7 +567,7 @@ void kasan_save_alloc_info(struct kmem_cache *cache, void *object, gfp_t flags)
 	kasan_save_track(&alloc_meta->alloc_track, flags);
 }
 
-void kasan_save_free_info(struct kmem_cache *cache, void *object)
+void __kasan_save_free_info(struct kmem_cache *cache, void *object)
 {
 	struct kasan_free_meta *free_meta;
 
diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
index 9a6927394b5..c8289a3feab 100644
--- a/mm/kasan/hw_tags.c
+++ b/mm/kasan/hw_tags.c
@@ -45,13 +45,6 @@ static enum kasan_arg kasan_arg __ro_after_init;
 static enum kasan_arg_mode kasan_arg_mode __ro_after_init;
 static enum kasan_arg_vmalloc kasan_arg_vmalloc __initdata;
 
-/*
- * Whether KASAN is enabled at all.
- * The value remains false until KASAN is initialized by kasan_init_hw_tags().
- */
-DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
-EXPORT_SYMBOL(kasan_flag_enabled);
-
 /*
  * Whether the selected mode is synchronous, asynchronous, or asymmetric.
  * Defaults to KASAN_MODE_SYNC.
@@ -260,7 +253,7 @@ void __init kasan_init_hw_tags(void)
 	kasan_init_tags();
 
 	/* KASAN is now initialized, enable it. */
-	static_branch_enable(&kasan_flag_enabled);
+	kasan_enable();
 
 	pr_info("KernelAddressSanitizer initialized (hw-tags, mode=%s, vmalloc=%s, stacktrace=%s)\n",
 		kasan_mode_info(),
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 129178be5e6..2d67a99898e 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -398,7 +398,13 @@ depot_stack_handle_t kasan_save_stack(gfp_t flags, depot_flags_t depot_flags);
 void kasan_set_track(struct kasan_track *track, depot_stack_handle_t stack);
 void kasan_save_track(struct kasan_track *track, gfp_t flags);
 void kasan_save_alloc_info(struct kmem_cache *cache, void *object, gfp_t flags);
-void kasan_save_free_info(struct kmem_cache *cache, void *object);
+
+void __kasan_save_free_info(struct kmem_cache *cache, void *object);
+static inline void kasan_save_free_info(struct kmem_cache *cache, void *object)
+{
+	if (kasan_shadow_initialized())
+		__kasan_save_free_info(cache, object);
+}
 
 #ifdef CONFIG_KASAN_GENERIC
 bool kasan_quarantine_put(struct kmem_cache *cache, void *object);
@@ -499,6 +505,7 @@ static inline bool kasan_byte_accessible(const void *addr)
 
 #else /* CONFIG_KASAN_HW_TAGS */
 
+void __kasan_poison(const void *addr, size_t size, u8 value, bool init);
 /**
  * kasan_poison - mark the memory range as inaccessible
  * @addr: range start address, must be aligned to KASAN_GRANULE_SIZE
@@ -506,7 +513,11 @@ static inline bool kasan_byte_accessible(const void *addr)
  * @value: value that's written to metadata for the range
  * @init: whether to initialize the memory range (only for hardware tag-based)
  */
-void kasan_poison(const void *addr, size_t size, u8 value, bool init);
+static inline void kasan_poison(const void *addr, size_t size, u8 value, bool init)
+{
+	if (kasan_shadow_initialized())
+		__kasan_poison(addr, size, value, init);
+}
 
 /**
  * kasan_unpoison - mark the memory range as accessible
@@ -521,12 +532,19 @@ void kasan_poison(const void *addr, size_t size, u8 value, bool init);
  */
 void kasan_unpoison(const void *addr, size_t size, bool init);
 
-bool kasan_byte_accessible(const void *addr);
+bool __kasan_byte_accessible(const void *addr);
+static inline bool kasan_byte_accessible(const void *addr)
+{
+	if (!kasan_shadow_initialized())
+		return true;
+	return __kasan_byte_accessible(addr);
+}
 
 #endif /* CONFIG_KASAN_HW_TAGS */
 
 #ifdef CONFIG_KASAN_GENERIC
 
+void __kasan_poison_last_granule(const void *address, size_t size);
 /**
  * kasan_poison_last_granule - mark the last granule of the memory range as
  * inaccessible
@@ -536,7 +554,11 @@ bool kasan_byte_accessible(const void *addr);
  * This function is only available for the generic mode, as it's the only mode
  * that has partially poisoned memory granules.
  */
-void kasan_poison_last_granule(const void *address, size_t size);
+static inline void kasan_poison_last_granule(const void *address, size_t size)
+{
+	if (kasan_shadow_initialized())
+		__kasan_poison_last_granule(address, size);
+}
 
 #else /* CONFIG_KASAN_GENERIC */
 
@@ -544,12 +566,6 @@ static inline void kasan_poison_last_granule(const void *address, size_t size) {
 
 #endif /* CONFIG_KASAN_GENERIC */
 
-#ifndef kasan_arch_is_ready
-static inline bool kasan_arch_is_ready(void)	{ return true; }
-#elif !defined(CONFIG_KASAN_GENERIC) || !defined(CONFIG_KASAN_OUTLINE)
-#error kasan_arch_is_ready only works in KASAN generic outline mode!
-#endif
-
 #if IS_ENABLED(CONFIG_KASAN_KUNIT_TEST)
 
 void kasan_kunit_test_suite_start(void);
diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index d2c70cd2afb..90c508cad63 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -121,13 +121,10 @@ void *__hwasan_memcpy(void *dest, const void *src, ssize_t len) __alias(__asan_m
 EXPORT_SYMBOL(__hwasan_memcpy);
 #endif
 
-void kasan_poison(const void *addr, size_t size, u8 value, bool init)
+void __kasan_poison(const void *addr, size_t size, u8 value, bool init)
 {
 	void *shadow_start, *shadow_end;
 
-	if (!kasan_arch_is_ready())
-		return;
-
 	/*
 	 * Perform shadow offset calculation based on untagged address, as
 	 * some of the callers (e.g. kasan_poison_new_object) pass tagged
@@ -145,14 +142,11 @@ void kasan_poison(const void *addr, size_t size, u8 value, bool init)
 
 	__memset(shadow_start, value, shadow_end - shadow_start);
 }
-EXPORT_SYMBOL_GPL(kasan_poison);
+EXPORT_SYMBOL_GPL(__kasan_poison);
 
 #ifdef CONFIG_KASAN_GENERIC
-void kasan_poison_last_granule(const void *addr, size_t size)
+void __kasan_poison_last_granule(const void *addr, size_t size)
 {
-	if (!kasan_arch_is_ready())
-		return;
-
 	if (size & KASAN_GRANULE_MASK) {
 		u8 *shadow = (u8 *)kasan_mem_to_shadow(addr + size);
 		*shadow = size & KASAN_GRANULE_MASK;
@@ -353,7 +347,7 @@ static int ___alloc_pages_bulk(struct page **pages, int nr_pages)
 	return 0;
 }
 
-static int __kasan_populate_vmalloc(unsigned long start, unsigned long end)
+static int __kasan_populate_vmalloc_do(unsigned long start, unsigned long end)
 {
 	unsigned long nr_pages, nr_total = PFN_UP(end - start);
 	struct vmalloc_populate_data data;
@@ -385,14 +379,11 @@ static int __kasan_populate_vmalloc(unsigned long start, unsigned long end)
 	return ret;
 }
 
-int kasan_populate_vmalloc(unsigned long addr, unsigned long size)
+int __kasan_populate_vmalloc(unsigned long addr, unsigned long size)
 {
 	unsigned long shadow_start, shadow_end;
 	int ret;
 
-	if (!kasan_arch_is_ready())
-		return 0;
-
 	if (!is_vmalloc_or_module_addr((void *)addr))
 		return 0;
 
@@ -414,7 +405,7 @@ int kasan_populate_vmalloc(unsigned long addr, unsigned long size)
 	shadow_start = PAGE_ALIGN_DOWN(shadow_start);
 	shadow_end = PAGE_ALIGN(shadow_end);
 
-	ret = __kasan_populate_vmalloc(shadow_start, shadow_end);
+	ret = __kasan_populate_vmalloc_do(shadow_start, shadow_end);
 	if (ret)
 		return ret;
 
@@ -551,7 +542,7 @@ static int kasan_depopulate_vmalloc_pte(pte_t *ptep, unsigned long addr,
  * pages entirely covered by the free region, we will not run in to any
  * trouble - any simultaneous allocations will be for disjoint regions.
  */
-void kasan_release_vmalloc(unsigned long start, unsigned long end,
+void __kasan_release_vmalloc(unsigned long start, unsigned long end,
 			   unsigned long free_region_start,
 			   unsigned long free_region_end,
 			   unsigned long flags)
@@ -560,9 +551,6 @@ void kasan_release_vmalloc(unsigned long start, unsigned long end,
 	unsigned long region_start, region_end;
 	unsigned long size;
 
-	if (!kasan_arch_is_ready())
-		return;
-
 	region_start = ALIGN(start, KASAN_MEMORY_PER_SHADOW_PAGE);
 	region_end = ALIGN_DOWN(end, KASAN_MEMORY_PER_SHADOW_PAGE);
 
@@ -611,9 +599,6 @@ void *__kasan_unpoison_vmalloc(const void *start, unsigned long size,
 	 * with setting memory tags, so the KASAN_VMALLOC_INIT flag is ignored.
 	 */
 
-	if (!kasan_arch_is_ready())
-		return (void *)start;
-
 	if (!is_vmalloc_or_module_addr(start))
 		return (void *)start;
 
@@ -636,9 +621,6 @@ void *__kasan_unpoison_vmalloc(const void *start, unsigned long size,
  */
 void __kasan_poison_vmalloc(const void *start, unsigned long size)
 {
-	if (!kasan_arch_is_ready())
-		return;
-
 	if (!is_vmalloc_or_module_addr(start))
 		return;
 
diff --git a/mm/kasan/sw_tags.c b/mm/kasan/sw_tags.c
index b9382b5b6a3..51a376940ea 100644
--- a/mm/kasan/sw_tags.c
+++ b/mm/kasan/sw_tags.c
@@ -45,6 +45,8 @@ void __init kasan_init_sw_tags(void)
 
 	kasan_init_tags();
 
+	kasan_enable();
+
 	pr_info("KernelAddressSanitizer initialized (sw-tags, stacktrace=%s)\n",
 		str_on_off(kasan_stack_collection_enabled()));
 }
@@ -120,7 +122,7 @@ bool kasan_check_range(const void *addr, size_t size, bool write,
 	return true;
 }
 
-bool kasan_byte_accessible(const void *addr)
+bool __kasan_byte_accessible(const void *addr)
 {
 	u8 tag = get_tag(addr);
 	void *untagged_addr = kasan_reset_tag(addr);
diff --git a/mm/kasan/tags.c b/mm/kasan/tags.c
index d65d48b85f9..b9f31293622 100644
--- a/mm/kasan/tags.c
+++ b/mm/kasan/tags.c
@@ -142,7 +142,7 @@ void kasan_save_alloc_info(struct kmem_cache *cache, void *object, gfp_t flags)
 	save_stack_info(cache, object, flags, false);
 }
 
-void kasan_save_free_info(struct kmem_cache *cache, void *object)
+void __kasan_save_free_info(struct kmem_cache *cache, void *object)
 {
 	save_stack_info(cache, object, 0, true);
 }
-- 
2.34.1


