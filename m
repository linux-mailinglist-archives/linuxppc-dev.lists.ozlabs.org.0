Return-Path: <linuxppc-dev+bounces-10302-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B4EB08F5C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 16:29:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjZzD1CRzz3brR;
	Fri, 18 Jul 2025 00:28:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::129"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752762504;
	cv=none; b=M2jBRvKh6lyZ2ToaCiP2aLNmFG97fTASztafKHGkDxhssOt/r2NUjDdvfSEdF+sf++NYnf0uo1tCyAUA0YdeVfmf4arIDtEHOV7SwBOxuuFbS++hbtlUuPZiqP4oRpojp0rRdeELAocwDGN9gSqJwBS52k47sUY9nVqeuv5Rf9aWD6Rds66P4PK2nkH+XXe8i+8B5sV8HmTwZ4SRCRY8BrH0XdEC3Xohs1Vx9jKj4fuAG4fonr9ZcrKQDu0V9QWCw5NfnUHnIYYEDOSL2RoaC6SGah6nTm0qF4xiREk0tCWDrHcaq8u4G3Ww1nIrGhqVq83AwzQb66TibhvPyWF0GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752762504; c=relaxed/relaxed;
	bh=f7ZdWtvjGwx1QVMejTFRuKlxOMwOJa4SlH8rLzpLr/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gm7dZCZbV4F7nXHj7bM/+ch+la8wXwK+BVd6O/NGzt5ltgt25NgbnsmafyREArbvZ1JUrl40TOiE3ieywniYkMaWVrso8RecTHMibBlOEVFgw2JiWG1qnfOP3LDj49U4Zu9jra2wmkBU6BiMdSIOIfOa3Bp6b49Fg6RQFwgpfHAgJaUj7By6AWiaitH3Hs84EZjLHq2PuAPtf3UYOWfe1z/nI5B/5qWS9Y5KiEbLy1BlvGS8BbbwDNOMOI6Sa7MB97s9LywzLhaULg5WN5hHWZPlKOkI/efe3a3+HuwMW2uLECT4BLkcuiinUfqaTUkfA0EO+ymlcyPshE614ymAnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IxonGM54; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IxonGM54;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjZzB6Nx4z3bvf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 00:28:22 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-553e5df44f8so902388e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 07:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762500; x=1753367300; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7ZdWtvjGwx1QVMejTFRuKlxOMwOJa4SlH8rLzpLr/Q=;
        b=IxonGM543RrbTzUjSILCD0ddXOEslHbF6FgvRkAcFBy4rP7gRTY/5nE1IKgjXy9snY
         dJcFf/ZitOOl0a38g+HQmSM5FoS555vpwkkLhmY8utoTdcYNoFPNX2TQtYF/blNHk7Le
         RVHKZx2t+AB7ye1y8xJnwDoq1MG2LSA66Ee+xcw+qmqGahrs9NOgopCMDrq6xfD5RI7M
         kgaqjm1V6HPET/Oe8+tvZpNdjwUQf1eDGJsr3A+4MveiE6n+VGaoJ/pTgv52nP49x6dH
         h1WU6BuaFTxyo567/G0rw2/qkdXMEOlQhV0ux9uMVM16qS0YSNz0elJjU57ibNcj8PfB
         p8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762500; x=1753367300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7ZdWtvjGwx1QVMejTFRuKlxOMwOJa4SlH8rLzpLr/Q=;
        b=bZ3AL0nNEh6Uwpsubj58/G7jC1UM4XzznX3uYYM18cI+M5511iEe+TQuUaKJm7SsIj
         WNro374+1D+uyL60ZrRqJR+/cN/n3JgQHiYMXnhhmLTlgPRbfiJ0lT1jC2x75fN7YtAt
         e1Ooxxk90waNfbWgnHh+f/MWRrVO68Tgru2q0M5Q7x4N8uw3GdDRDEGfhl1evCVLREW9
         J8iRji2fsds5YzIXuat47uDMXwyubyn8a+EtxiRyQla6Eg+UQ+af/equMCvz/kXT0p+y
         eBlpxkUHJ+0v+/MOPpFCCWox6dKOjEJq9GbTIWV9GUynur5OOVK/zOaPvfBkW1efa0oC
         msWA==
X-Forwarded-Encrypted: i=1; AJvYcCXEp0lV33fYw53n34SQ+l5hGDv6JXvSMyiwFtHVI0ah5k7OA0aprIjk3uq/9MSIau3AMbwfPDIhM9omyfc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw1zfyJsbVm3fmpAsB+heVPQsExi1uOtGqbr3WSPn43VTlgRdoW
	FZY3Yp+UhEK8vxIub5WkmIqECSa+DgBuO7hfMZ9pej5gotbT56eLQb8i
X-Gm-Gg: ASbGncvuSqXAwj0AsMWcGmoyUsR+pWr8QZwk5JSZ4xpyJLDy5H19gWXelHiDW/beczy
	yzAZ1tJXF07WLVy7Ht0y4AWuyjVkGMTy6VN17LEOypehpYEZOqxiWkQmEpH4tvmXEntyzT+eI+y
	n7S+/jQyY/nTcnwaQvaQrP5EhAtmZ8l7lTS5YpTPXK2/5UMFUOG8oG95cFSmGbijrG+NQ0RxMYL
	cZydr7ne0ofgeYh9c+DC1wSQhfy/UTDcCsU56x6YMsxQVNsCN3fhuMyXu07ThGCPMoqOOOn+n6M
	fKDSaOY0+aFUJJkzb0B6nh3u8dydnz2HcyBiARh/8b4gg1yOGlSf0R2BIvT+QajrUhduFdyg96S
	oHfKJAyYNY9AJCe8P1ulr3mDTESzmNNu5JRtNjT++H5bfVPo3/ydEwk1NbKX+sTsqnc6P
X-Google-Smtp-Source: AGHT+IGCxJLgxZY02tc8foSIT/rHsNNpSknOWUP3l3DGsuRGAuDE+1eyiieQPzZhElaS9ma13LLajg==
X-Received: by 2002:a05:6512:2345:b0:558:f7fc:87c4 with SMTP id 2adb3069b0e04-55a23f7fc98mr2461079e87.32.1752762499563;
        Thu, 17 Jul 2025 07:28:19 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:28:18 -0700 (PDT)
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
Subject: [PATCH v3 12/12] kasan: add shadow checks to wrappers and rename kasan_arch_is_ready
Date: Thu, 17 Jul 2025 19:27:32 +0500
Message-Id: <20250717142732.292822-13-snovitoll@gmail.com>
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

This patch completes:
1. Adding kasan_shadow_initialized() checks to existing wrapper functions
2. Replacing kasan_arch_is_ready() calls with kasan_shadow_initialized()
3. Creating wrapper functions for internal functions that need shadow
   readiness checks
4. Removing the kasan_arch_is_ready() fallback definition

The two-level approach is now fully implemented:
- kasan_enabled() - controls whether KASAN is enabled at all.
  (compile-time for most archs)
- kasan_shadow_initialized() - tracks shadow memory initialization
  (static key for ARCH_DEFER_KASAN archs, compile-time for others)

This provides complete elimination of kasan_arch_is_ready() calls from
KASAN implementation while moving all shadow readiness logic to
wrapper functions.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
Changes in v3:
- Addresses Andrey's feedback to move shadow checks to wrappers
- Rename kasan_arch_is_ready with kasan_shadow_initialized
- Added kasan_shadow_initialized() checks to all necessary wrapper functions
- Eliminated all remaining kasan_arch_is_ready() usage per reviewer guidance
---
 include/linux/kasan.h | 36 +++++++++++++++++++++++++++---------
 mm/kasan/common.c     |  9 +++------
 mm/kasan/generic.c    | 12 +++---------
 mm/kasan/kasan.h      | 36 ++++++++++++++++++++++++++----------
 mm/kasan/shadow.c     | 32 +++++++-------------------------
 5 files changed, 66 insertions(+), 59 deletions(-)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 51a8293d1af..292bd741d8d 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -194,7 +194,7 @@ bool __kasan_slab_pre_free(struct kmem_cache *s, void *object,
 static __always_inline bool kasan_slab_pre_free(struct kmem_cache *s,
 						void *object)
 {
-	if (kasan_enabled())
+	if (kasan_enabled() && kasan_shadow_initialized())
 		return __kasan_slab_pre_free(s, object, _RET_IP_);
 	return false;
 }
@@ -229,7 +229,7 @@ static __always_inline bool kasan_slab_free(struct kmem_cache *s,
 						void *object, bool init,
 						bool still_accessible)
 {
-	if (kasan_enabled())
+	if (kasan_enabled() && kasan_shadow_initialized())
 		return __kasan_slab_free(s, object, init, still_accessible);
 	return false;
 }
@@ -237,7 +237,7 @@ static __always_inline bool kasan_slab_free(struct kmem_cache *s,
 void __kasan_kfree_large(void *ptr, unsigned long ip);
 static __always_inline void kasan_kfree_large(void *ptr)
 {
-	if (kasan_enabled())
+	if (kasan_enabled() && kasan_shadow_initialized())
 		__kasan_kfree_large(ptr, _RET_IP_);
 }
 
@@ -302,7 +302,7 @@ bool __kasan_mempool_poison_pages(struct page *page, unsigned int order,
 static __always_inline bool kasan_mempool_poison_pages(struct page *page,
 						       unsigned int order)
 {
-	if (kasan_enabled())
+	if (kasan_enabled() && kasan_shadow_initialized())
 		return __kasan_mempool_poison_pages(page, order, _RET_IP_);
 	return true;
 }
@@ -356,7 +356,7 @@ bool __kasan_mempool_poison_object(void *ptr, unsigned long ip);
  */
 static __always_inline bool kasan_mempool_poison_object(void *ptr)
 {
-	if (kasan_enabled())
+	if (kasan_enabled() && kasan_shadow_initialized())
 		return __kasan_mempool_poison_object(ptr, _RET_IP_);
 	return true;
 }
@@ -568,11 +568,29 @@ static inline void kasan_init_hw_tags(void) { }
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
 
@@ -598,7 +616,7 @@ static __always_inline void *kasan_unpoison_vmalloc(const void *start,
 						unsigned long size,
 						kasan_vmalloc_flags_t flags)
 {
-	if (kasan_enabled())
+	if (kasan_enabled() && kasan_shadow_initialized())
 		return __kasan_unpoison_vmalloc(start, size, flags);
 	return (void *)start;
 }
@@ -607,7 +625,7 @@ void __kasan_poison_vmalloc(const void *start, unsigned long size);
 static __always_inline void kasan_poison_vmalloc(const void *start,
 						 unsigned long size)
 {
-	if (kasan_enabled())
+	if (kasan_enabled() && kasan_shadow_initialized())
 		__kasan_poison_vmalloc(start, size);
 }
 
diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index c3a6446404d..b561734767d 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -259,7 +259,7 @@ static inline void poison_slab_object(struct kmem_cache *cache, void *object,
 bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
 				unsigned long ip)
 {
-	if (!kasan_arch_is_ready() || is_kfence_address(object))
+	if (is_kfence_address(object))
 		return false;
 	return check_slab_allocation(cache, object, ip);
 }
@@ -267,7 +267,7 @@ bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
 bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool init,
 		       bool still_accessible)
 {
-	if (!kasan_arch_is_ready() || is_kfence_address(object))
+	if (is_kfence_address(object))
 		return false;
 
 	poison_slab_object(cache, object, init, still_accessible);
@@ -291,9 +291,6 @@ bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool init,
 
 static inline bool check_page_allocation(void *ptr, unsigned long ip)
 {
-	if (!kasan_arch_is_ready())
-		return false;
-
 	if (ptr != page_address(virt_to_head_page(ptr))) {
 		kasan_report_invalid_free(ptr, ip, KASAN_REPORT_INVALID_FREE);
 		return true;
@@ -520,7 +517,7 @@ bool __kasan_mempool_poison_object(void *ptr, unsigned long ip)
 		return true;
 	}
 
-	if (is_kfence_address(ptr) || !kasan_arch_is_ready())
+	if (is_kfence_address(ptr))
 		return true;
 
 	slab = folio_slab(folio);
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index 03b6d322ff6..1d20b925b9d 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -176,7 +176,7 @@ static __always_inline bool check_region_inline(const void *addr,
 						size_t size, bool write,
 						unsigned long ret_ip)
 {
-	if (!kasan_arch_is_ready())
+	if (!kasan_shadow_initialized())
 		return true;
 
 	if (unlikely(size == 0))
@@ -200,13 +200,10 @@ bool kasan_check_range(const void *addr, size_t size, bool write,
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
@@ -506,9 +503,6 @@ static void release_alloc_meta(struct kasan_alloc_meta *meta)
 
 static void release_free_meta(const void *object, struct kasan_free_meta *meta)
 {
-	if (!kasan_arch_is_ready())
-		return;
-
 	/* Check if free meta is valid. */
 	if (*(u8 *)kasan_mem_to_shadow(object) != KASAN_SLAB_FREE_META)
 		return;
@@ -573,7 +567,7 @@ void kasan_save_alloc_info(struct kmem_cache *cache, void *object, gfp_t flags)
 	kasan_save_track(&alloc_meta->alloc_track, flags);
 }
 
-void kasan_save_free_info(struct kmem_cache *cache, void *object)
+void __kasan_save_free_info(struct kmem_cache *cache, void *object)
 {
 	struct kasan_free_meta *free_meta;
 
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 129178be5e6..67a0a1095d2 100644
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
+	if (kasan_enabled() && kasan_shadow_initialized())
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
 
-- 
2.34.1


