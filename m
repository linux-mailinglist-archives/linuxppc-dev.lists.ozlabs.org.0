Return-Path: <linuxppc-dev+bounces-9751-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6E7AE855B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 15:59:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS3Mc372tz30Pg;
	Wed, 25 Jun 2025 23:59:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::234"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750845181;
	cv=none; b=Wk0GZlDTVHn7z0+YqEdadarTTlDZ+eLJYRdNBf5MDLfCeo9U9WQcWtEf3O2l5+vrDPowktOaCLE8oc5zJwEXj5HfWYLB5b/48A14y1md8hJgMuCP0K7DZu55BaKKzvScmdSciknSGVGModn3ShJMtSt/DUIsGgS8oWXRYllds4Py/AQPYZhR+nO4bIeeyErTBk9NiZcMmkV9dMxU/3VFYZFB+EVjOtY4zzfuQi3A1XzidB/g0zrFet8sHqaBAWykNquekQLCrVQiNxXWij4oROhuN75+JZMHZkh7buSdS/gSq6zWjKAaUSq3Df5KMJawXTk70kYB5Twlar7vOAid4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750845181; c=relaxed/relaxed;
	bh=spnPWYrTCugBtv3C0I1/Y7oTbF6XlJIePRXoFmRkZ78=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T+2GiaWjOUtkGebnq5dkDap1hwR2EPNdKYUF+8+YT7kfJ7E3Bcgq9aC7F5+6Ld1fOAocedJBWZ3aXXvqN0WfB4+KBj9J9xY1HZ1wJG5a91R+B8EPm2CzHxF/doVAmd4MCtImOgOGMrxo2pXCvUumCrQAL1BjIbX87LY0pNjN3MOwaoulp/0C9NuKRtGr9XcABth4bhWzgBW5rE7imKbSmOkx3wz4n5s01NKdCpuEV5NOteE9Hgc1lLQXT0WRvFz+PcvJIbVYpVNQOrcI8f7u4wL1CeZzRF6/uk2xEHhVxhNnF2UiaFkCTPXC5bw7I1iLbAjr9BPeEeXCSJk6mu6mnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bU3LSkM5; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bU3LSkM5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRxvc5TZXz2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 19:53:00 +1000 (AEST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-32add56e9ddso52457891fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 02:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750845177; x=1751449977; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spnPWYrTCugBtv3C0I1/Y7oTbF6XlJIePRXoFmRkZ78=;
        b=bU3LSkM5D8m6J5AWgRn8y9QUM2APBbpy7GW3dpcQ1u8vIz7Ab9BwwzPCQF5jkrUIiI
         Kqq26KClfESJqXQJLq6HsUC31xE4Sq6uLy65l8GJQn2iSiAR7N27bM4tbuH0RynoJeTo
         igF5PUieRxNyDbLqMMi1Kt91RjH9ojup0dLK4uQ3N7w/wYhmab8itn1EQ1AG5zvV5Jgk
         EyldkoH7F3BI3CGMMcArxkBtb7CwUu27RGv/7UtrBzhWQTHFHY/OeDNHUdLnO1jR77ka
         qHYia0rg9/337/RruoQQ2XHGGsfXkPnrY3HiEdwdEU1509BGqGk8QVZslq3qhLkfhhQV
         9l/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845177; x=1751449977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spnPWYrTCugBtv3C0I1/Y7oTbF6XlJIePRXoFmRkZ78=;
        b=L4tbQttpXQHVckBnGO5taOgfXH+xxTq0RmnN0WKgSAJpITKXTySu/PKntI9jqRRQcQ
         tQoWXKddEP801+jfQlZSJaw7XmWhQYa7arwvWVqZ8hxwVY+ly5sPQ42/HWdEMaCNDeCy
         ueDswrNa73atvCYOY9oD9XnO0TArwzkNl89+uD4bq2wVm8KrieNYdbxAg76s4DX2YM/o
         8VNfaddpiTeBNNGk2cYKj6PxaUGwfPA/YTPvaktZhxVFdBIxcWTBqcG//xFTfIf5wVsR
         2IL5BfA4oyquEPkiQN67z0IBonGSB+58cYoWsMnBMjcVaGqwDze4aPCbINi0Kh4ZudOb
         dCcw==
X-Forwarded-Encrypted: i=1; AJvYcCXKp2Sh6SiNgM5C4B+nP30yq29qUVnckFqW7ot9SCKxLGS8pJmAkw6BtTALnYFQ/WW3KB2x65jmq2ayQl0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx+O527gbU9bXpvdcgdLkF8F+CMwo187PZ9aMpSNG1/tsbrSuIS
	x3yKHM+5Fw8ahV2q7w60Sd1tGcAVbXiMQK3B3iUntYJ2RSbqoasnsf4h
X-Gm-Gg: ASbGncv6FcEVdHc4ATIFh2Hbj0LQcYuKnyuYtfKziC43BZRMHHA68W6UExn30ZnPAH+
	xaDgLdVjgh5+JIwM+VNlljS7nDyDPYxWCVKqklNxUtECu7FPTajIeaxFpGFxQ+liVWLsCiMphg7
	nrYgw9OW17ZujpI63G69yBA/LJKNJv3V5mC5Ae+jg0gmfbNiqJ0EfO9LkoecCloCuzC4Ivj7UlL
	hJCmCFGnjuMY54kxIegsR0dcJWKkChEcysez7oPdPGM0oSMlKfYUSXg7++8ipZdc36XAVDbs33G
	Qq+mZhA57KwPjbgxQn97Ql06I7yatTkfw1w5MNIkbwLKgOspO8AuGc1Fv+tHXkCpRqUvMoPTFW/
	ws2imqdayP2btFIsAullVWFcNA4mvpw==
X-Google-Smtp-Source: AGHT+IF6eiwi1xoALYtMAE1ncL4ibtGAQqo+HifrEVfcQXGb5lhuCkRcCK0fus3Knli+XAnux0nRaA==
X-Received: by 2002:a2e:7806:0:b0:32c:a709:80ee with SMTP id 38308e7fff4ca-32cc6582a2emr4097091fa.39.1750845177105;
        Wed, 25 Jun 2025 02:52:57 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980a36c0sm19311851fa.62.2025.06.25.02.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:52:56 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	akpm@linux-foundation.org
Cc: guoweikang.kernel@gmail.com,
	geert@linux-m68k.org,
	rppt@kernel.org,
	tiwei.btw@antgroup.com,
	richard.weiyang@gmail.com,
	benjamin.berg@intel.com,
	kevin.brodsky@arm.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH 2/9] kasan: replace kasan_arch_is_ready with kasan_enabled
Date: Wed, 25 Jun 2025 14:52:17 +0500
Message-Id: <20250625095224.118679-3-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625095224.118679-1-snovitoll@gmail.com>
References: <20250625095224.118679-1-snovitoll@gmail.com>
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

Replace the existing kasan_arch_is_ready() calls with kasan_enabled().
Drop checks where the caller is already under kasan_enabled() condition.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 mm/kasan/common.c  |  8 ++++----
 mm/kasan/generic.c |  6 +++---
 mm/kasan/kasan.h   |  6 ------
 mm/kasan/shadow.c  | 15 +++------------
 4 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 525194da25f..0f3648335a6 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -257,7 +257,7 @@ static inline void poison_slab_object(struct kmem_cache *cache, void *object,
 bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
 				unsigned long ip)
 {
-	if (!kasan_arch_is_ready() || is_kfence_address(object))
+	if (!kasan_enabled() || is_kfence_address(object))
 		return false;
 	return check_slab_allocation(cache, object, ip);
 }
@@ -265,7 +265,7 @@ bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
 bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool init,
 		       bool still_accessible)
 {
-	if (!kasan_arch_is_ready() || is_kfence_address(object))
+	if (!kasan_enabled() || is_kfence_address(object))
 		return false;
 
 	poison_slab_object(cache, object, init, still_accessible);
@@ -289,7 +289,7 @@ bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool init,
 
 static inline bool check_page_allocation(void *ptr, unsigned long ip)
 {
-	if (!kasan_arch_is_ready())
+	if (!kasan_enabled())
 		return false;
 
 	if (ptr != page_address(virt_to_head_page(ptr))) {
@@ -518,7 +518,7 @@ bool __kasan_mempool_poison_object(void *ptr, unsigned long ip)
 		return true;
 	}
 
-	if (is_kfence_address(ptr) || !kasan_arch_is_ready())
+	if (is_kfence_address(ptr) || !kasan_enabled())
 		return true;
 
 	slab = folio_slab(folio);
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index ab9ab30caf4..af2f2077a45 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -176,7 +176,7 @@ static __always_inline bool check_region_inline(const void *addr,
 						size_t size, bool write,
 						unsigned long ret_ip)
 {
-	if (!kasan_arch_is_ready())
+	if (!kasan_enabled())
 		return true;
 
 	if (unlikely(size == 0))
@@ -204,7 +204,7 @@ bool kasan_byte_accessible(const void *addr)
 {
 	s8 shadow_byte;
 
-	if (!kasan_arch_is_ready())
+	if (!kasan_enabled())
 		return true;
 
 	shadow_byte = READ_ONCE(*(s8 *)kasan_mem_to_shadow(addr));
@@ -506,7 +506,7 @@ static void release_alloc_meta(struct kasan_alloc_meta *meta)
 
 static void release_free_meta(const void *object, struct kasan_free_meta *meta)
 {
-	if (!kasan_arch_is_ready())
+	if (!kasan_enabled())
 		return;
 
 	/* Check if free meta is valid. */
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 129178be5e6..e0ffc16495d 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -544,12 +544,6 @@ static inline void kasan_poison_last_granule(const void *address, size_t size) {
 
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
index d2c70cd2afb..9db8548ccb4 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -125,7 +125,7 @@ void kasan_poison(const void *addr, size_t size, u8 value, bool init)
 {
 	void *shadow_start, *shadow_end;
 
-	if (!kasan_arch_is_ready())
+	if (!kasan_enabled())
 		return;
 
 	/*
@@ -150,9 +150,6 @@ EXPORT_SYMBOL_GPL(kasan_poison);
 #ifdef CONFIG_KASAN_GENERIC
 void kasan_poison_last_granule(const void *addr, size_t size)
 {
-	if (!kasan_arch_is_ready())
-		return;
-
 	if (size & KASAN_GRANULE_MASK) {
 		u8 *shadow = (u8 *)kasan_mem_to_shadow(addr + size);
 		*shadow = size & KASAN_GRANULE_MASK;
@@ -390,7 +387,7 @@ int kasan_populate_vmalloc(unsigned long addr, unsigned long size)
 	unsigned long shadow_start, shadow_end;
 	int ret;
 
-	if (!kasan_arch_is_ready())
+	if (!kasan_enabled())
 		return 0;
 
 	if (!is_vmalloc_or_module_addr((void *)addr))
@@ -560,7 +557,7 @@ void kasan_release_vmalloc(unsigned long start, unsigned long end,
 	unsigned long region_start, region_end;
 	unsigned long size;
 
-	if (!kasan_arch_is_ready())
+	if (!kasan_enabled())
 		return;
 
 	region_start = ALIGN(start, KASAN_MEMORY_PER_SHADOW_PAGE);
@@ -611,9 +608,6 @@ void *__kasan_unpoison_vmalloc(const void *start, unsigned long size,
 	 * with setting memory tags, so the KASAN_VMALLOC_INIT flag is ignored.
 	 */
 
-	if (!kasan_arch_is_ready())
-		return (void *)start;
-
 	if (!is_vmalloc_or_module_addr(start))
 		return (void *)start;
 
@@ -636,9 +630,6 @@ void *__kasan_unpoison_vmalloc(const void *start, unsigned long size,
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


