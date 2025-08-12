Return-Path: <linuxppc-dev+bounces-10865-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5451DB227DF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 15:10:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1X1Z1sRGz3dTr;
	Tue, 12 Aug 2025 23:10:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755004242;
	cv=none; b=aXtTyZIA0C75CTM+IUGW0ZtQX8N7V1/QWZG/bbMXLzW2AVSVFOtDDvP4VeYRyFTe1nYkO3wUNlQbN5feInE6LwHhEYOmTuZF3fVDY66vtI8O5IqSQjmiVkpwlgEtKq9MyZIk/Ov0cdVGS7PNtsfp815IOWholu2la+dxRX6zDLx9eQc7PY4VI15rAw8I463qHPP8idB0F5drMj79uihuWst/XuAJZlMPq+Ri1tpBqv8xBWKGHXidSQPGYiU0ypfRPZsN4IcLWNvRYD2MKzJqki4v7GiL2ErmGt/NxG6SA4CsM+MBml3f/+xT9SnDNbFbfaIzUf+FWVQ3ASbAVcYUgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755004242; c=relaxed/relaxed;
	bh=90kjOoDlgJxvROpKhCBaV42MFQEOcPlCS7aVoYrLf2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=Zn3ANmviqXjg2b4cH1hfsT4JydPl6d8jJioaXtOygBL1C+H8+4U8xcyoQE734B4DBMS2qzjOei7b0J+06keW1gbhMLmIVJ+bs5/AwwmEwsRTgiSj1GEwi+uYYrYYd8TDjhWU57Y/24yNL8HvUJ8CkpNBj8+D1OjNET9fnsVwk9whE06cC4HvUzdbrdNd5NpXnuRV8X2z6RqAIDnoC8JwVFzfnuTmMH5NoPTNyeTV4VK4C1u1Lh9Edh6Z21fRK/Z6Yfe5DQscpkjV5cqx3DyHiOlFYJKonje15wYdLVeWpPpCktX60hvcyk3iyujvLDX0uWWm6GrbP6ACUC67IFC/1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ypd1uW9u; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ypd1uW9u; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ypd1uW9u;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ypd1uW9u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1X1Y32hzz3dTg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 23:10:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755004239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=90kjOoDlgJxvROpKhCBaV42MFQEOcPlCS7aVoYrLf2Q=;
	b=Ypd1uW9uObqb8OCACmL+/au/dzrp+3R1QY74sldKK8/mcG8Zc2HAg2SkATkgK9gNfERFnR
	9cT2dr8qN75M2kJ8KGKDrEK1tXIpRVjM9+Hm9UgcNu60OS2d/rzQ21Y/uEZwS1dioJ9+vA
	K0lDKG+muuDKZd7pCKatsTXJBK7yOb8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755004239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=90kjOoDlgJxvROpKhCBaV42MFQEOcPlCS7aVoYrLf2Q=;
	b=Ypd1uW9uObqb8OCACmL+/au/dzrp+3R1QY74sldKK8/mcG8Zc2HAg2SkATkgK9gNfERFnR
	9cT2dr8qN75M2kJ8KGKDrEK1tXIpRVjM9+Hm9UgcNu60OS2d/rzQ21Y/uEZwS1dioJ9+vA
	K0lDKG+muuDKZd7pCKatsTXJBK7yOb8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-675-TQnxb7SJOn-5DJ0f1i7kgA-1; Tue,
 12 Aug 2025 09:10:33 -0400
X-MC-Unique: TQnxb7SJOn-5DJ0f1i7kgA-1
X-Mimecast-MFC-AGG-ID: TQnxb7SJOn-5DJ0f1i7kgA_1755004227
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5A40B1800291;
	Tue, 12 Aug 2025 13:10:27 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.156])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7D1B71955F16;
	Tue, 12 Aug 2025 13:10:18 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: snovitoll@gmail.com,
	ryabinin.a.a@gmail.com,
	christophe.leroy@csgroup.eu,
	hca@linux.ibm.com,
	andreyknvl@gmail.com,
	akpm@linux-foundation.org,
	chenhuacai@loongson.cn,
	davidgow@google.com,
	glider@google.com,
	dvyukov@google.com,
	alexghiti@rivosinc.com,
	kasan-dev@googlegroups.com,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	agordeev@linux.ibm.com,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 4/4] mm/kasan: remove kasan_arch_is_ready()
Date: Tue, 12 Aug 2025 21:09:33 +0800
Message-ID: <20250812130933.71593-5-bhe@redhat.com>
In-Reply-To: <20250812130933.71593-1-bhe@redhat.com>
References: <20250812130933.71593-1-bhe@redhat.com>
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
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Now there's no any place where kasan_arch_is_ready() is needed, remove
all its invocations.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/kasan/common.c  |  9 +++------
 mm/kasan/generic.c |  9 ---------
 mm/kasan/kasan.h   |  6 ------
 mm/kasan/shadow.c  | 18 ------------------
 4 files changed, 3 insertions(+), 39 deletions(-)

diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 69a848f2a8aa..e48c1fd60edf 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -271,7 +271,7 @@ static inline void poison_slab_object(struct kmem_cache *cache, void *object,
 bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
 				unsigned long ip)
 {
-	if (!kasan_arch_is_ready() || is_kfence_address(object))
+	if (is_kfence_address(object))
 		return false;
 	return check_slab_allocation(cache, object, ip);
 }
@@ -279,7 +279,7 @@ bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
 bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool init,
 		       bool still_accessible)
 {
-	if (!kasan_arch_is_ready() || is_kfence_address(object))
+	if (is_kfence_address(object))
 		return false;
 
 	/*
@@ -318,9 +318,6 @@ bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool init,
 
 static inline bool check_page_allocation(void *ptr, unsigned long ip)
 {
-	if (!kasan_arch_is_ready())
-		return false;
-
 	if (ptr != page_address(virt_to_head_page(ptr))) {
 		kasan_report_invalid_free(ptr, ip, KASAN_REPORT_INVALID_FREE);
 		return true;
@@ -547,7 +544,7 @@ bool __kasan_mempool_poison_object(void *ptr, unsigned long ip)
 		return true;
 	}
 
-	if (is_kfence_address(ptr) || !kasan_arch_is_ready())
+	if (is_kfence_address(ptr))
 		return true;
 
 	slab = folio_slab(folio);
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index 8daea5892754..d513e3e2e136 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -168,9 +168,6 @@ static __always_inline bool check_region_inline(const void *addr,
 	if (!kasan_enabled())
 		return true;
 
-	if (!kasan_arch_is_ready())
-		return true;
-
 	if (unlikely(size == 0))
 		return true;
 
@@ -196,9 +193,6 @@ bool kasan_byte_accessible(const void *addr)
 {
 	s8 shadow_byte;
 
-	if (!kasan_arch_is_ready())
-		return true;
-
 	shadow_byte = READ_ONCE(*(s8 *)kasan_mem_to_shadow(addr));
 
 	return shadow_byte >= 0 && shadow_byte < KASAN_GRANULE_SIZE;
@@ -505,9 +499,6 @@ static void release_alloc_meta(struct kasan_alloc_meta *meta)
 
 static void release_free_meta(const void *object, struct kasan_free_meta *meta)
 {
-	if (!kasan_arch_is_ready())
-		return;
-
 	/* Check if free meta is valid. */
 	if (*(u8 *)kasan_mem_to_shadow(object) != KASAN_SLAB_FREE_META)
 		return;
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 129178be5e64..e0ffc16495d7 100644
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
index 637f2d02d2a3..d8b975282b22 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -128,9 +128,6 @@ void kasan_poison(const void *addr, size_t size, u8 value, bool init)
 	if (!kasan_enabled())
 		return;
 
-	if (!kasan_arch_is_ready())
-		return;
-
 	/*
 	 * Perform shadow offset calculation based on untagged address, as
 	 * some of the callers (e.g. kasan_poison_new_object) pass tagged
@@ -156,9 +153,6 @@ void kasan_poison_last_granule(const void *addr, size_t size)
 	if (!kasan_enabled())
 		return;
 
-	if (!kasan_arch_is_ready())
-		return;
-
 	if (size & KASAN_GRANULE_MASK) {
 		u8 *shadow = (u8 *)kasan_mem_to_shadow(addr + size);
 		*shadow = size & KASAN_GRANULE_MASK;
@@ -402,9 +396,6 @@ int kasan_populate_vmalloc(unsigned long addr, unsigned long size)
 	if (!kasan_enabled())
 		return 0;
 
-	if (!kasan_arch_is_ready())
-		return 0;
-
 	if (!is_vmalloc_or_module_addr((void *)addr))
 		return 0;
 
@@ -575,9 +566,6 @@ void kasan_release_vmalloc(unsigned long start, unsigned long end,
 	if (!kasan_enabled())
 		return;
 
-	if (!kasan_arch_is_ready())
-		return;
-
 	region_start = ALIGN(start, KASAN_MEMORY_PER_SHADOW_PAGE);
 	region_end = ALIGN_DOWN(end, KASAN_MEMORY_PER_SHADOW_PAGE);
 
@@ -626,9 +614,6 @@ void *__kasan_unpoison_vmalloc(const void *start, unsigned long size,
 	 * with setting memory tags, so the KASAN_VMALLOC_INIT flag is ignored.
 	 */
 
-	if (!kasan_arch_is_ready())
-		return (void *)start;
-
 	if (!is_vmalloc_or_module_addr(start))
 		return (void *)start;
 
@@ -651,9 +636,6 @@ void *__kasan_unpoison_vmalloc(const void *start, unsigned long size,
  */
 void __kasan_poison_vmalloc(const void *start, unsigned long size)
 {
-	if (!kasan_arch_is_ready())
-		return;
-
 	if (!is_vmalloc_or_module_addr(start))
 		return;
 
-- 
2.41.0


