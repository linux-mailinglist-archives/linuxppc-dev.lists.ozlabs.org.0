Return-Path: <linuxppc-dev+bounces-9473-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D027AADF457
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:42:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrcy4HRGz3bb2;
	Thu, 19 Jun 2025 03:41:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268466;
	cv=none; b=aJkUqDiLjlWlfyv7xYov3nJworObFb6pywX1VQL01V20IayruILtefoAwJHkbL4N/yaHF61Ul5/V7ZAVvK5wc0FCDKTDzWJZn1KnMvkcQhXOhuFqLJ9kDCBWZiDUMemC/LaJeJ/zjYQugWdrPBVHH7C9TX45NagYx2YpP79NQ1vqQ60aXjQD9rKNhJXj0Svpcbbs4YtvCae3rQ7QZmy3Ltbv2aAl5IRslidXg9wY5ZASkvQ1W5N5Rb+9qm6mr1Ae7UGSs8vgBTNQaD8/RteMn8GczLWTVX0iG44UEGmPeN4LQKA8bmhUv2Gl5PPUgu0PUB2riHGbRoUf1orRtJ6Big==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268466; c=relaxed/relaxed;
	bh=pn7yGSPhSFiXpI5R4Bp6dvC2hmWGRnPce0Bw+h6ULBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=UDfD1iAhv8gKGAJNFpN0V47ThSGp24Pg4dz3xiCEMiWZLiaIuHeezVGgMep9EdCdP4Xkp/PNZbGDczd5ZuY2Oe9uKCSOnbZXJMqi/z9QsUvBFf52QLosWLDhd3ztk72Ruc4JlWO74ZbMnqemNXvyu9hBp5zUzZ+YOuii00NADBr+8G3kgmiZ9wItosXZR9BGNsNK7Kv9Tyo1hCcV++Pay7cBD7X+oSinDws5WLNr7/tO17dvEKS5wp1SQNjFGWPQiyX571vwl3S/1pzcutWl4DgCP30SkZQ+jv7MpABmtqqxkmhoWZTJeQmXZMpUjqX9Fb+PvE3X2WlWO/uNYNIdMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eb98xZRQ; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eb98xZRQ; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eb98xZRQ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eb98xZRQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrcx5TK2z30Wn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:41:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pn7yGSPhSFiXpI5R4Bp6dvC2hmWGRnPce0Bw+h6ULBk=;
	b=eb98xZRQRU0ENgml0VahJGUXeZgvTij1YbpRMaMho+iCq/TDGdIFVU+jIiVLmQP8C6mvC6
	C30ZKfGMU6tzwCbvJnbokhXDLGQDUp74VKMJgPxQeCfaWrKjLJqjcQRBUKWclAXVdWaNJa
	Ht6fyBBDRql4DXhW3I4Lo1eJas0BdcQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pn7yGSPhSFiXpI5R4Bp6dvC2hmWGRnPce0Bw+h6ULBk=;
	b=eb98xZRQRU0ENgml0VahJGUXeZgvTij1YbpRMaMho+iCq/TDGdIFVU+jIiVLmQP8C6mvC6
	C30ZKfGMU6tzwCbvJnbokhXDLGQDUp74VKMJgPxQeCfaWrKjLJqjcQRBUKWclAXVdWaNJa
	Ht6fyBBDRql4DXhW3I4Lo1eJas0BdcQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-e0i6oDV6MRS9xkNSWiu1nQ-1; Wed, 18 Jun 2025 13:41:02 -0400
X-MC-Unique: e0i6oDV6MRS9xkNSWiu1nQ-1
X-Mimecast-MFC-AGG-ID: e0i6oDV6MRS9xkNSWiu1nQ_1750268461
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so41421785e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268461; x=1750873261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pn7yGSPhSFiXpI5R4Bp6dvC2hmWGRnPce0Bw+h6ULBk=;
        b=vlyXQXG6z3SscepJNYsoChFo3GbBe2OmmSLUR9nKCG4JrV5o7Ft8ZvrMvdlIuZiIEv
         kZN615kWV3nLQMomsEkpgwsye01XEjxuKMCWlSusKP8PDx+McK7t26LNtImSdwryZTzt
         Kd2eCYXDOEYoRvnz8Z/pKNLHPRab3TJbUUwBrZpifYqslFMzRb0VBgNdeESWRPEFh4jv
         NMgl+G4BcEBTxLfntAwzhZaMrcOSP8HDz+nB6njN+0WWSj6L1/xTLNkq6AM3l3xRHOwA
         cyMP0OapyzTYae+67t7HT+wTIn6IDtKGq/KEkZ8H6VF7fCn51GFeynLDDuuVodIxcnsk
         TwjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoiCnN2761k7VkUWBhqju2ogNlK8gpN/8/NiRdZbhIgnkA00YEp3K8run8GqoosDOnoIXOuHevDKY8Q8U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyqBxvQiY0I7vjcYj2ksq5jTwfW9HNe/0N+CXQuOMbLW/l0/Xso
	H9J5PT2ImIkRDo52ZyqqhnCd8G0VhTVXiaKUmZ0F9/UnRoHtW75Pdyx6gh8uZg22bVxV3J3zR09
	BrEhvBB3lFyVQkKGhIWZuiHggY+gdNtByKt4V5WE7Y4tXmpm2zUNQDVLlqxW/pdh2ZXI=
X-Gm-Gg: ASbGncuiNS/Kk30B3c62tv8N4zmcm1fSMuDq2i392FZh5Tnlfne9VZFl8L3pucWS2Xu
	T9FczuFATn61j1pV2inpCsg83XSUv9vCoaq3A2DH2wzoTebGjFORPjtQRsaScinYb2SEN1wMCo1
	iWZ3t7H54Yn2SfT24/jyD+8pEqHqF4IQ6Qkpny3mR0HE+G1K48iOZAOasinC9e92XA5kU917kwE
	zl5eIrj+NgeFHPivriIOY1mafy3jVDeXuAsVlJUdpwhfpL2vEVKEMj2DZM12MLyGCxhC1PvSUoh
	ABkviUVo0psM2qAB9e5MPA+YmbcbIn7l6TMSnz9BGKiuX0whUA2tmdtiOWc9NZS8VgARIXAloX2
	pqWAXUg==
X-Received: by 2002:a05:600c:4e13:b0:43c:fe15:41dd with SMTP id 5b1f17b1804b1-4533ca7a5b4mr172426695e9.6.1750268460544;
        Wed, 18 Jun 2025 10:41:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPI4qnomtJiihDYZHrEYfWz3Hi6xPZWIy9RNeAMNhrydAHd5Ktr+DvLvfsdyiYBEhOo2Z7gg==
X-Received: by 2002:a05:600c:4e13:b0:43c:fe15:41dd with SMTP id 5b1f17b1804b1-4533ca7a5b4mr172426335e9.6.1750268460017;
        Wed, 18 Jun 2025 10:41:00 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535e98b50csm3675535e9.22.2025.06.18.10.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:59 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: [PATCH RFC 16/29] mm: rename __PageMovable() to page_has_movable_ops()
Date: Wed, 18 Jun 2025 19:39:59 +0200
Message-ID: <20250618174014.1168640-17-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618174014.1168640-1-david@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 22nd5TvvLzbw3cqZLMlU2Wa45u8VhvCNDDfzl7S4T9Y_1750268461
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's make it clearer that we are talking about movable_ops pages.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h    |  2 +-
 include/linux/page-flags.h |  2 +-
 mm/compaction.c            |  7 ++-----
 mm/memory-failure.c        |  4 ++--
 mm/memory_hotplug.c        |  8 +++-----
 mm/migrate.c               |  8 ++++----
 mm/page_alloc.c            |  2 +-
 mm/page_isolation.c        | 10 +++++-----
 8 files changed, 19 insertions(+), 24 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 204e89eac998f..c575778456f97 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -115,7 +115,7 @@ static inline void __SetPageMovable(struct page *page,
 static inline
 const struct movable_operations *page_movable_ops(struct page *page)
 {
-	VM_BUG_ON(!__PageMovable(page));
+	VM_BUG_ON(!page_has_movable_ops(page));
 
 	return (const struct movable_operations *)
 		((unsigned long)page->mapping - PAGE_MAPPING_MOVABLE);
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 4fe5ee67535b2..c67163b73c5ec 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -750,7 +750,7 @@ static __always_inline bool __folio_test_movable(const struct folio *folio)
 			PAGE_MAPPING_MOVABLE;
 }
 
-static __always_inline bool __PageMovable(const struct page *page)
+static __always_inline bool page_has_movable_ops(const struct page *page)
 {
 	return ((unsigned long)page->mapping & PAGE_MAPPING_FLAGS) ==
 				PAGE_MAPPING_MOVABLE;
diff --git a/mm/compaction.c b/mm/compaction.c
index 5c37373017014..f8b7c09e2e48c 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1056,11 +1056,8 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		 * Skip any other type of page
 		 */
 		if (!PageLRU(page)) {
-			/*
-			 * __PageMovable can return false positive so we need
-			 * to verify it under page_lock.
-			 */
-			if (unlikely(__PageMovable(page)) &&
+			/* Isolation will grab the page lock. */
+			if (unlikely(page_has_movable_ops(page)) &&
 					!PageIsolated(page)) {
 				if (locked) {
 					unlock_page_lruvec_irqrestore(locked, flags);
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index b91a33fb6c694..9e2cff1999347 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1388,8 +1388,8 @@ static inline bool HWPoisonHandlable(struct page *page, unsigned long flags)
 	if (PageSlab(page))
 		return false;
 
-	/* Soft offline could migrate non-LRU movable pages */
-	if ((flags & MF_SOFT_OFFLINE) && __PageMovable(page))
+	/* Soft offline could migrate movable_ops pages */
+	if ((flags & MF_SOFT_OFFLINE) && page_has_movable_ops(page))
 		return true;
 
 	return PageLRU(page) || is_free_buddy_page(page);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 4d864b4fb8916..1d4d0f093af29 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1739,8 +1739,8 @@ bool mhp_range_allowed(u64 start, u64 size, bool need_mapping)
 
 #ifdef CONFIG_MEMORY_HOTREMOVE
 /*
- * Scan pfn range [start,end) to find movable/migratable pages (LRU pages,
- * non-lru movable pages and hugepages). Will skip over most unmovable
+ * Scan pfn range [start,end) to find movable/migratable pages (LRU and
+ * hugetlb folio, movable_ops pages). Will skip over most unmovable
  * pages (esp., pages that can be skipped when offlining), but bail out on
  * definitely unmovable pages.
  *
@@ -1759,9 +1759,7 @@ static int scan_movable_pages(unsigned long start, unsigned long end,
 		struct folio *folio;
 
 		page = pfn_to_page(pfn);
-		if (PageLRU(page))
-			goto found;
-		if (__PageMovable(page))
+		if (PageLRU(page) || page_has_movable_ops(page))
 			goto found;
 
 		/*
diff --git a/mm/migrate.c b/mm/migrate.c
index cf92075108f0c..5f97369eac2f9 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -94,7 +94,7 @@ bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 	 * Note that once a page has movable_ops, it will stay that way
 	 * until the page was freed.
 	 */
-	if (unlikely(!__PageMovable(page)))
+	if (unlikely(!page_has_movable_ops(page)))
 		goto out_putfolio;
 
 	/*
@@ -111,7 +111,7 @@ bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 	if (unlikely(!folio_trylock(folio)))
 		goto out_putfolio;
 
-	VM_WARN_ON_ONCE_PAGE(!__PageMovable(page), page);
+	VM_WARN_ON_ONCE_PAGE(!page_has_movable_ops(page), page);
 	if (PageIsolated(page))
 		goto out_no_isolated;
 
@@ -153,7 +153,7 @@ static void putback_movable_ops_page(struct page *page)
 	 */
 	struct folio *folio = page_folio(page);
 
-	VM_WARN_ON_ONCE_PAGE(!__PageMovable(page), page);
+	VM_WARN_ON_ONCE_PAGE(!page_has_movable_ops(page), page);
 	VM_WARN_ON_ONCE_PAGE(!PageIsolated(page), page);
 	folio_lock(folio);
 	page_movable_ops(page)->putback_page(page);
@@ -192,7 +192,7 @@ static int migrate_movable_ops_page(struct page *dst, struct page *src,
 {
 	int rc = MIGRATEPAGE_SUCCESS;
 
-	VM_WARN_ON_ONCE_PAGE(!__PageMovable(src), src);
+	VM_WARN_ON_ONCE_PAGE(!page_has_movable_ops(src), src);
 	VM_WARN_ON_ONCE_PAGE(!PageIsolated(src), src);
 	rc = page_movable_ops(src)->migrate_page(dst, src, mode);
 	if (rc == MIGRATEPAGE_SUCCESS)
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 44e56d31cfeb1..a134b9fa9520e 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -2005,7 +2005,7 @@ static bool prep_move_freepages_block(struct zone *zone, struct page *page,
 			 * migration are movable. But we don't actually try
 			 * isolating, as that would be expensive.
 			 */
-			if (PageLRU(page) || __PageMovable(page))
+			if (PageLRU(page) || page_has_movable_ops(page))
 				(*num_movable)++;
 			pfn++;
 		}
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index ece3bfc56bcd5..b97b965b3ed01 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -21,9 +21,9 @@
  * consequently belong to a single zone.
  *
  * PageLRU check without isolation or lru_lock could race so that
- * MIGRATE_MOVABLE block might include unmovable pages. And __PageMovable
- * check without lock_page also may miss some movable non-lru pages at
- * race condition. So you can't expect this function should be exact.
+ * MIGRATE_MOVABLE block might include unmovable pages. Similarly, pages
+ * with movable_ops can only be identified some time after they were
+ * allocated. So you can't expect this function should be exact.
  *
  * Returns a page without holding a reference. If the caller wants to
  * dereference that page (e.g., dumping), it has to make sure that it
@@ -133,7 +133,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 		if ((mode == PB_ISOLATE_MODE_MEM_OFFLINE) && PageOffline(page))
 			continue;
 
-		if (__PageMovable(page) || PageLRU(page))
+		if (PageLRU(page) || page_has_movable_ops(page))
 			continue;
 
 		/*
@@ -421,7 +421,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn,
 			 * proper free and split handling for them.
 			 */
 			VM_WARN_ON_ONCE_PAGE(PageLRU(page), page);
-			VM_WARN_ON_ONCE_PAGE(__PageMovable(page), page);
+			VM_WARN_ON_ONCE_PAGE(page_has_movable_ops(page), page);
 
 			goto failed;
 		}
-- 
2.49.0


