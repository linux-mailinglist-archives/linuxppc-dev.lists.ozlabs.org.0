Return-Path: <linuxppc-dev+bounces-9833-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00714AEA2AD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 17:33:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSjPw3V7xz3blv;
	Fri, 27 Jun 2025 01:33:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::129"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750952004;
	cv=none; b=UihHsGnaYf2KIM0rB4HY/uQmuARedop0nL9nGCfJ0TQUPI7RyjzWO1LTVBk393h0lB10ZGsV0OFEOOwHGF608jQ0BksqAUVwT5i3Nyqdhe34A+0vEUtF/6kbTM5Hzwh/oU4rbNTgA4h9QsLM+o3Baxgoki/yOQTrmiYYPh52iCgCOH6p8cSB2M6gvlxgBFvtT3xpoCjQtClfHIldFJF3x+0QinH1+OD+PhM0nwRpyZq8tGbMx6MHQDedyh37IcLSqConzrHufRklnJD10cZsq35MspJ979e8jU4jl1NNGL6XTwN4RKxbs4Ll/DmlHz+x0jiDoCtjcXtRM8VQ6evtVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750952004; c=relaxed/relaxed;
	bh=+pDrLO6USAZl/TGsifgnkWPVKgGBnMCumXxL7y5KwTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cdMlhhH40yj1JjGjGla7Q64EK+U1CzdHZ/cTGFG6lXMSj+9Sb/tJj3ITi6R0S7wns/Cj7PGThzp1PpRT8NO/KmlCXVW88ApMIyWQhEmwOQsyquEK9IndlTPxFs4wBtXuPhILiq84H8CHE9uU7QVriQPnpBFEawdPImsBxtytOPZC9Bhpmvxymj9k6tBYxsR2OOMHX/QyzttzXDuzWvnAACICDujtKGRH0CsfPYMk2CDXEWs8DUIb8pnDaT8ZeFlXHyX6/NxQq6p+k9ZPbgrrX6C8b6Z3yn+3ZEcOu1trVetjnJZ04XlxAxx8DU+GH57Zk9bSN4Pto3IpvGTj/2PsOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X1DNWRYz; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X1DNWRYz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSjPv3YkKz3bb2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 01:33:23 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-553b6a349ccso1266679e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 08:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750952000; x=1751556800; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pDrLO6USAZl/TGsifgnkWPVKgGBnMCumXxL7y5KwTQ=;
        b=X1DNWRYzqRZ/UGHHgkIjOT4XCd4Mwc4NvIUtIjA8BzQdeiBR+H2a64vdbac1AYhCzc
         lmZnDTLJIh7Iya/b1qulu859AZbnMT4Sv3QOpcdnL6Ml6H2/jVf2dec1JLpY+957aSrJ
         w3tw4PF7wFKkQxTeuMTwFKlh0SJEvdjOpyP1K3mVBxHP07wnVp07oqJ+45Nv35rFDuah
         Ff9z67v4QKoXAvZetgfPWZXu+9eYeceoxoDgr9CZ02L/l27OQ+fke2JxMJlv4TVmVz5f
         5Tq17+R/fVlYM1QXA/NggS95wluhpBQsc9ABIKR2klIb4Zwb+N/uhPVCqO9G1TRQy6Sm
         SH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750952000; x=1751556800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+pDrLO6USAZl/TGsifgnkWPVKgGBnMCumXxL7y5KwTQ=;
        b=lyZisYr2UBD5pAnjw1dbRLmGYqQpI55AbxfCNT18MR/l/k8IcuTxfPyGKPyX1fso5J
         UZCR33BKoFhoWcdVQ9O97iNmmFq3blCNFtx+Xn/CHQBvbsA/6Py89X7VJgqEvmPN+lc1
         99gVB8Qw+0Cj+uOwgLgIl035IYNX1oXj9AOYOhlXLZslhjY9ctwprk+N1BjUvVZviHeK
         xHnWY6uN9Goh3dku5+QEZ06eD5Xe+2A8JMWHisX16yv94viAtZeAJmlwK1HPfrcIv0Pc
         lrNsCBaxkvY1EDqDNLHknDmNWtMGYfPJajAqSLIJB8dD0INIX4n4MAWBoSOTvncfaP71
         F4yg==
X-Forwarded-Encrypted: i=1; AJvYcCVfbxkDZzagE+xgrNNgq7SGBbmk1OqlzQxIlRRdB22wKJL0dozhUXMtI9XRuFXYX850l/ruNKyf1TsTq6g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx6TPt/6lGcqV3WKBGNzeArXJqS5t/0r4gAZa/NpboDZIsXm3ci
	zXNJOUHsoSqfq+LPFAO6p8EXy7vRyfH8kL8B1o3Aa3ANWDIgtU6DRa3H
X-Gm-Gg: ASbGncs6BFZCxvoKlmhtkQ3R8fsfpA/6AMK2tONYN6lHIoD6VwVixs9VK0KtC0W/lBM
	QTok3VKtRtJpZmGzX7ETOZpe73avPfJMQdbTjIHvRFsOXzkWiCbVYJbpW2OZdZ2wryZKmxBf6bp
	ZEKNWqquzLaHaD49ux8E/zNl3sGfqOugcmgjePxAc0UEeMw5fPmgH6izlBItrdnJUxp2sMFVj0E
	6Tb8rFbb9wDd+Ua9/ENav7TQAuV5LItj9SqaWYgzl+v6tXmSfk5VeRVH3H8Tgsa3XDkHNDZ93dk
	muYehHgzKHqS/DEgTeDsRT2h+9ifv0Ir8WXbIkCx//CjEhwjxdTn+WFxbmh/O2KMKLbDa5hNoTc
	kSf1PzMFT6Ylxs7nX24WhK65QfjpFLw==
X-Google-Smtp-Source: AGHT+IGY311+Wdu3kb/XvX91pk/iQewvyeMEbYN3t0cf6Gst1F46Nt/0GHv4Ja5q8VZUcn9wuGuFjg==
X-Received: by 2002:a05:6512:12c2:b0:553:28f1:66ec with SMTP id 2adb3069b0e04-554fdd47009mr2940330e87.31.1750951999683;
        Thu, 26 Jun 2025 08:33:19 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:33:18 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
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
	akpm@linux-foundation.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: arnd@arndb.de,
	rppt@kernel.org,
	geert@linux-m68k.org,
	mcgrof@kernel.org,
	guoweikang.kernel@gmail.com,
	tiwei.btw@antgroup.com,
	kevin.brodsky@arm.com,
	benjamin.berg@intel.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	snovitoll@gmail.com
Subject: [PATCH v2 11/11] kasan: replace kasan_arch_is_ready with kasan_enabled
Date: Thu, 26 Jun 2025 20:31:47 +0500
Message-Id: <20250626153147.145312-12-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626153147.145312-1-snovitoll@gmail.com>
References: <20250626153147.145312-1-snovitoll@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
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
 include/linux/kasan-enabled.h | 20 ++++++++++++--------
 mm/kasan/common.c             |  8 ++++----
 mm/kasan/generic.c            |  6 +++---
 mm/kasan/kasan.h              |  6 ------
 mm/kasan/shadow.c             | 15 +++------------
 5 files changed, 22 insertions(+), 33 deletions(-)

diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enabled.h
index 2b1351c30c6..2436eb45cfe 100644
--- a/include/linux/kasan-enabled.h
+++ b/include/linux/kasan-enabled.h
@@ -5,32 +5,36 @@
 #include <linux/static_key.h>
 
 #ifdef CONFIG_KASAN
+
 /*
  * Global runtime flag. Starts ‘false’; switched to ‘true’ by
  * the appropriate kasan_init_*() once KASAN is fully initialized.
  */
 DECLARE_STATIC_KEY_FALSE(kasan_flag_enabled);
-#endif
-
-#ifdef CONFIG_KASAN_HW_TAGS
 
 static __always_inline bool kasan_enabled(void)
 {
 	return static_branch_likely(&kasan_flag_enabled);
 }
 
-static inline bool kasan_hw_tags_enabled(void)
+#else /* !CONFIG_KASAN */
+
+static __always_inline bool kasan_enabled(void)
 {
-	return kasan_enabled();
+	return false;
 }
 
-#else /* CONFIG_KASAN_HW_TAGS */
+#endif /* CONFIG_KASAN */
+
+#ifdef CONFIG_KASAN_HW_TAGS
 
-static inline bool kasan_enabled(void)
+static inline bool kasan_hw_tags_enabled(void)
 {
-	return IS_ENABLED(CONFIG_KASAN);
+	return kasan_enabled();
 }
 
+#else /* !CONFIG_KASAN_HW_TAGS */
+
 static inline bool kasan_hw_tags_enabled(void)
 {
 	return false;
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


