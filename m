Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAD72756F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 07:25:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458dHp2MKpzDqT9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 15:25:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="dzYgAfVp"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458dCQ6jvpzDqRp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 15:21:38 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id c13so2500143pgt.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 22:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fjOaqB0oVkfbrEJKn0VoWTH231yfH85u91Z/PupfDqE=;
 b=dzYgAfVpI6NBVe4NRhIfDlvQkpAu9OpBAdYdpDoJE1/yh/CnI21iFpJOibS6Q5VMld
 RZ6Z9cFn7l6wWr4rx6nD5ZSr8YO8uRNNTe9uz601DDXlsBrf/zqANNAASekFyd8HDBTJ
 zXtOz++YRGWZkAQU/fYet8VER8EYUFalwulBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fjOaqB0oVkfbrEJKn0VoWTH231yfH85u91Z/PupfDqE=;
 b=hl8zWaSK9dlGUnU9cnC5n33DR2uQf8ibZldE+7ZeIqBhxL53g7GphcS4FXAeIEnLM7
 LW/hSYZwOjXNEziaDUl/AN+vPM895jEWGer4BK9ne6oC3W6jHPAtBtNQ9FZv21aoa4hB
 /zLgQhy1vKungzlHffbHsqiB1qsA5wDUtui8fEzQqBaFySOOIa3QKrGQlsajxv5bNro0
 0YCaCcHVf871NbpzbN5xn86xbvgnGhAvuj9SK///76qT8MZfAHiasuRsLHj0vdjZPRTV
 Ro/9kM+nn4/zzwlBxvZ7dsIM4jj+hlfROS94dm1yRA22LbjNk4jpu/7JCNsZfNHX/xjy
 f6EQ==
X-Gm-Message-State: APjAAAWaNySQymDoI9gqyWWWfVnTapMKCMnFzR/u2WZtMFPqJj7LcGiS
 y1BqHDU3JdyL2kDnHiwKpRXy7g==
X-Google-Smtp-Source: APXvYqxpM/Ts06IBhHNvKLp/eqyl352rLjhe/eO/T8Z4cP4fQO5UmvbeaD0+YB+pnjykBwt0sC7iUw==
X-Received: by 2002:a63:f44f:: with SMTP id p15mr94759765pgk.65.1558588896307; 
 Wed, 22 May 2019 22:21:36 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id k3sm11861396pgo.81.2019.05.22.22.21.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 22:21:35 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: aneesh.kumar@linux.ibm.com, christophe.leroy@c-s.fr, bsingharora@gmail.com
Subject: [RFC PATCH 2/7] kasan: allow architectures to manage the
 memory-to-shadow mapping
Date: Thu, 23 May 2019 15:21:15 +1000
Message-Id: <20190523052120.18459-3-dja@axtens.net>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190523052120.18459-1-dja@axtens.net>
References: <20190523052120.18459-1-dja@axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, shadow addresses are always addr >> shift + offset.
However, for powerpc, the virtual address space is fragmented in
ways that make this simple scheme impractical.

Allow architectures to override:
 - kasan_shadow_to_mem
 - kasan_mem_to_shadow
 - addr_has_shadow

Rename addr_has_shadow to kasan_addr_has_shadow as if it is
overridden it will be available in more places, increasing the
risk of collisions.

If architectures do not #define their own versions, the generic
code will continue to run as usual.

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 include/linux/kasan.h     | 2 ++
 mm/kasan/generic.c        | 2 +-
 mm/kasan/generic_report.c | 2 +-
 mm/kasan/kasan.h          | 6 +++++-
 mm/kasan/report.c         | 6 +++---
 mm/kasan/tags.c           | 2 +-
 6 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index b40ea104dd36..f6261840f94c 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -23,11 +23,13 @@ extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D];
 int kasan_populate_early_shadow(const void *shadow_start,
 				const void *shadow_end);
 
+#ifndef kasan_mem_to_shadow
 static inline void *kasan_mem_to_shadow(const void *addr)
 {
 	return (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT)
 		+ KASAN_SHADOW_OFFSET;
 }
+#endif
 
 /* Enable reporting bugs after kasan_disable_current() */
 extern void kasan_enable_current(void);
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index 9e5c989dab8c..a5b28e3ceacb 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -173,7 +173,7 @@ static __always_inline void check_memory_region_inline(unsigned long addr,
 	if (unlikely(size == 0))
 		return;
 
-	if (unlikely(!addr_has_shadow((void *)addr))) {
+	if (unlikely(!kasan_addr_has_shadow((void *)addr))) {
 		kasan_report(addr, size, write, ret_ip);
 		return;
 	}
diff --git a/mm/kasan/generic_report.c b/mm/kasan/generic_report.c
index 36c645939bc9..6caafd61fc3a 100644
--- a/mm/kasan/generic_report.c
+++ b/mm/kasan/generic_report.c
@@ -107,7 +107,7 @@ static const char *get_wild_bug_type(struct kasan_access_info *info)
 
 const char *get_bug_type(struct kasan_access_info *info)
 {
-	if (addr_has_shadow(info->access_addr))
+	if (kasan_addr_has_shadow(info->access_addr))
 		return get_shadow_bug_type(info);
 	return get_wild_bug_type(info);
 }
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 3ce956efa0cb..8fcbe4027929 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -110,16 +110,20 @@ struct kasan_alloc_meta *get_alloc_info(struct kmem_cache *cache,
 struct kasan_free_meta *get_free_info(struct kmem_cache *cache,
 					const void *object);
 
+#ifndef kasan_shadow_to_mem
 static inline const void *kasan_shadow_to_mem(const void *shadow_addr)
 {
 	return (void *)(((unsigned long)shadow_addr - KASAN_SHADOW_OFFSET)
 		<< KASAN_SHADOW_SCALE_SHIFT);
 }
+#endif
 
-static inline bool addr_has_shadow(const void *addr)
+#ifndef kasan_addr_has_shadow
+static inline bool kasan_addr_has_shadow(const void *addr)
 {
 	return (addr >= kasan_shadow_to_mem((void *)KASAN_SHADOW_START));
 }
+#endif
 
 void kasan_poison_shadow(const void *address, size_t size, u8 value);
 
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index 03a443579386..a713b64c232b 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -298,7 +298,7 @@ void __kasan_report(unsigned long addr, size_t size, bool is_write, unsigned lon
 	untagged_addr = reset_tag(tagged_addr);
 
 	info.access_addr = tagged_addr;
-	if (addr_has_shadow(untagged_addr))
+	if (kasan_addr_has_shadow(untagged_addr))
 		info.first_bad_addr = find_first_bad_addr(tagged_addr, size);
 	else
 		info.first_bad_addr = untagged_addr;
@@ -309,11 +309,11 @@ void __kasan_report(unsigned long addr, size_t size, bool is_write, unsigned lon
 	start_report(&flags);
 
 	print_error_description(&info);
-	if (addr_has_shadow(untagged_addr))
+	if (kasan_addr_has_shadow(untagged_addr))
 		print_tags(get_tag(tagged_addr), info.first_bad_addr);
 	pr_err("\n");
 
-	if (addr_has_shadow(untagged_addr)) {
+	if (kasan_addr_has_shadow(untagged_addr)) {
 		print_address_description(untagged_addr);
 		pr_err("\n");
 		print_shadow_for_address(info.first_bad_addr);
diff --git a/mm/kasan/tags.c b/mm/kasan/tags.c
index 87ebee0a6aea..661c23dd5340 100644
--- a/mm/kasan/tags.c
+++ b/mm/kasan/tags.c
@@ -109,7 +109,7 @@ void check_memory_region(unsigned long addr, size_t size, bool write,
 		return;
 
 	untagged_addr = reset_tag((const void *)addr);
-	if (unlikely(!addr_has_shadow(untagged_addr))) {
+	if (unlikely(!kasan_addr_has_shadow(untagged_addr))) {
 		kasan_report(addr, size, write, ret_ip);
 		return;
 	}
-- 
2.19.1

