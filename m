Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB143B2598
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 05:42:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9Qtj6xdMz3bvK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 13:42:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=gUFBIaMM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=gUFBIaMM; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9QsJ5DdLz304C
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 13:41:07 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id h4so3583957pgp.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 20:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EvVNbLnwqJAIYi/oiSLioHcxV6FtIVBfZ8nguMWCTFE=;
 b=gUFBIaMMZ1d3pt0GkDSe2NiIRaSGldh05CajT4om97f0wQSzL0x8j2RMIxpLd2Us0v
 IURILWgkklaZE0j6t8K/lCQ42QWj0/9j8vXatmOsNbzRQH3UCZFs5mfL67RPu1w3gHWK
 FKQl5/txcTBPVVBgLDeooy7VhwpG+jnMWjoL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EvVNbLnwqJAIYi/oiSLioHcxV6FtIVBfZ8nguMWCTFE=;
 b=pmwjv1H9v9D2B2xlpaJ31t+ZQxfHKBzYpjp8mJXhcHJuBqRcJ7EylBVwC4u6WnwIqz
 Js7mFo8HQA5VIJSn0hLfGxOeoFGNLwLFmakeBIN18LQWrt8P0frZtsy8FL6icOjaZnm0
 jp+7fMd1b3cw5r+Trf/xA1b4mtFlRUYH8+HyX7WJtQDhAzONj2JC9VfXLJZGEhAdLH++
 3lvpOLOzTKOY9TI6vQ+BJg3FDQuYVxrb7kf8+78edTweD1blRVspfqO2XtgakB3yrKso
 2ouFCmBxiHWwjFnBASRloSoZrszTwCBsrIEuLYLVH0lNsag3qOKLkbOhI7tV+3H6iSzx
 seyA==
X-Gm-Message-State: AOAM532du62xr6YnQWxbG4N61xRHWEiZVWfj4l3uLrpkppb73Er1aGu/
 mpJCzMCAewtkeovwhaXvXKVCKQ==
X-Google-Smtp-Source: ABdhPJzmWte/VMqL+/sIhBU5wbozLQoCL7Iah3oMqjhyr7uichTCCCil0qJE2gDAROVokeV7Jiagow==
X-Received: by 2002:a63:501f:: with SMTP id e31mr2748949pgb.231.1624506064897; 
 Wed, 23 Jun 2021 20:41:04 -0700 (PDT)
Received: from localhost ([203.206.29.204])
 by smtp.gmail.com with ESMTPSA id y7sm1137228pfy.153.2021.06.23.20.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 20:41:04 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, elver@google.com, akpm@linux-foundation.org,
 andreyknvl@gmail.com
Subject: [PATCH v16 2/4] kasan: allow architectures to provide an outline
 readiness check
Date: Thu, 24 Jun 2021 13:40:48 +1000
Message-Id: <20210624034050.511391-3-dja@axtens.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624034050.511391-1-dja@axtens.net>
References: <20210624034050.511391-1-dja@axtens.net>
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Allow architectures to define a kasan_arch_is_ready() hook that bails
out of any function that's about to touch the shadow unless the arch
says that it is ready for the memory to be accessed. This is fairly
uninvasive and should have a negligible performance penalty.

This will only work in outline mode, so an arch must specify
ARCH_DISABLE_KASAN_INLINE if it requires this.

Cc: Balbir Singh <bsingharora@gmail.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Marco Elver <elver@google.com>
Signed-off-by: Daniel Axtens <dja@axtens.net>

--

Both previous RFCs for ppc64 - by 2 different people - have
needed this trick! See:
 - https://lore.kernel.org/patchwork/patch/592820/ # ppc64 hash series
 - https://patchwork.ozlabs.org/patch/795211/      # ppc radix series

Build tested on arm64 with SW_TAGS and x86 with INLINE: the error fires
if I add a kasan_arch_is_ready define.
---
 mm/kasan/common.c  | 3 +++
 mm/kasan/generic.c | 3 +++
 mm/kasan/kasan.h   | 6 ++++++
 mm/kasan/shadow.c  | 6 ++++++
 4 files changed, 18 insertions(+)

diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 10177cc26d06..2baf121fb8c5 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -331,6 +331,9 @@ static inline bool ____kasan_slab_free(struct kmem_cache *cache, void *object,
 	u8 tag;
 	void *tagged_object;
 
+	if (!kasan_arch_is_ready())
+		return false;
+
 	tag = get_tag(object);
 	tagged_object = object;
 	object = kasan_reset_tag(object);
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index 53cbf28859b5..c3f5ba7a294a 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -163,6 +163,9 @@ static __always_inline bool check_region_inline(unsigned long addr,
 						size_t size, bool write,
 						unsigned long ret_ip)
 {
+	if (!kasan_arch_is_ready())
+		return true;
+
 	if (unlikely(size == 0))
 		return true;
 
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 8f450bc28045..4dbc8def64f4 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -449,6 +449,12 @@ static inline void kasan_poison_last_granule(const void *address, size_t size) {
 
 #endif /* CONFIG_KASAN_GENERIC */
 
+#ifndef kasan_arch_is_ready
+static inline bool kasan_arch_is_ready(void)	{ return true; }
+#elif !defined(CONFIG_KASAN_GENERIC) || !defined(CONFIG_KASAN_OUTLINE)
+#error kasan_arch_is_ready only works in KASAN generic outline mode!
+#endif
+
 /*
  * Exported functions for interfaces called from assembly or from generated
  * code. Declarations here to avoid warning about missing declarations.
diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index 082ee5b6d9a1..8d95ee52d019 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -73,6 +73,9 @@ void kasan_poison(const void *addr, size_t size, u8 value, bool init)
 {
 	void *shadow_start, *shadow_end;
 
+	if (!kasan_arch_is_ready())
+		return;
+
 	/*
 	 * Perform shadow offset calculation based on untagged address, as
 	 * some of the callers (e.g. kasan_poison_object_data) pass tagged
@@ -99,6 +102,9 @@ EXPORT_SYMBOL(kasan_poison);
 #ifdef CONFIG_KASAN_GENERIC
 void kasan_poison_last_granule(const void *addr, size_t size)
 {
+	if (!kasan_arch_is_ready())
+		return;
+
 	if (size & KASAN_GRANULE_MASK) {
 		u8 *shadow = (u8 *)kasan_mem_to_shadow(addr + size);
 		*shadow = size & KASAN_GRANULE_MASK;
-- 
2.30.2

