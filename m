Return-Path: <linuxppc-dev+bounces-9477-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5907ADF461
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:43:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrd860r0z30TY;
	Thu, 19 Jun 2025 03:41:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268476;
	cv=none; b=GKxXf5fAgk5QuRML3pR0rhWXJrf6n5ufZPa8Cayr64KscKe04x+dkpRtq4r7nh1x+RkiaXz6/qnDXmYsfjSE+traazWZjOaTF/BoW1dy4KxV1LTyfc7OGWzBje6nZXSXgFZjqpKgDAZW3bc6RlZboConDW/seJFWpN6JGjn5b5nk8YBmU0kx468txPC8E/fZnLf5iiIAXmdS0MqWdHr8R08hR2Hw1DNZKCpju186S0jDjwyuS0wCvVoP7oTl5MYQ7GigeAFCCl2XjcHckfVEvol8VEN6Tjt4UjtZ9ycFW2C/2KWQ3IKMONB3k6YNGoy6sOaqBL9svwk6UZztU3cWMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268476; c=relaxed/relaxed;
	bh=sAf4Dh14UAIqeNeWRGXlrmZ3XJWuUden7rJ9s11c67A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=hOGc2oJSb7lbe9ZV4ugZUh8iT3YDutPpt9hPNhHH9/a3uCL3m2mhC3E4GEBAyTyohvRLur//kS287KLH4Gl7ev7brUlVae1FG0LQWGigT0B6PySlMDeJPV2aRcbv0ZTUzo/goy+6kTle0P+rj5Bz4LkxxRCdjRgQYV2bQe76nxLkpvEv0fME73Zayr/M/wkYGGTI17lMQslicAUEtX/ZDEsITeWS3OkCs5ecHAJJ5KsKyQ9nO2pBqvQvwRV6j+t4nbuZhvgue0NKTh8MF9hf3yWZ3XgeuBXw35y921B851+NgqLVdzMQcAoVxwzwHEjSZ5OwqZIGTzUwqec0trYnBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cvevACSi; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cvevACSi; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cvevACSi;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cvevACSi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrd80HyFz30DP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:41:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sAf4Dh14UAIqeNeWRGXlrmZ3XJWuUden7rJ9s11c67A=;
	b=cvevACSi4VucHNQjJ6pJQnCVYR5ScHGn56gINBx0fJhLj4S3/gpLaTbnwSKY3G7ybCW2M0
	a0MhJHo+fUvUBRJ50ZYQJlPcjiB/Uz5TmLhs1Z5O8ZSjC68ytBIr4lDeUQsy7BSG1FbJLl
	acpOfTa2Y00t7nnjBgwKUPcQjeOcFts=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sAf4Dh14UAIqeNeWRGXlrmZ3XJWuUden7rJ9s11c67A=;
	b=cvevACSi4VucHNQjJ6pJQnCVYR5ScHGn56gINBx0fJhLj4S3/gpLaTbnwSKY3G7ybCW2M0
	a0MhJHo+fUvUBRJ50ZYQJlPcjiB/Uz5TmLhs1Z5O8ZSjC68ytBIr4lDeUQsy7BSG1FbJLl
	acpOfTa2Y00t7nnjBgwKUPcQjeOcFts=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-4Ok0Nx16OCq21ruFrhJTog-1; Wed, 18 Jun 2025 13:41:12 -0400
X-MC-Unique: 4Ok0Nx16OCq21ruFrhJTog-1
X-Mimecast-MFC-AGG-ID: 4Ok0Nx16OCq21ruFrhJTog_1750268471
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f8fd1847so2656537f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268471; x=1750873271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAf4Dh14UAIqeNeWRGXlrmZ3XJWuUden7rJ9s11c67A=;
        b=ozo6L0RW7W8VY6Qd+yuYhEgbiPosXMQWaKU3Vnv1tx3v6/CJ4b0mrL8cpv9nD6B9dY
         NR8HwqT7moRwB8F4BcEzkjHqvKYUXTiH52PvGf6AmUYxAb9iGiuV9Bh8X+Cqrx7XTsEe
         yGNvOGysweiNOHccC5yTOdVq6ujvrFNi3T153+h1EOVO3UEEZsPOw/HCwDK7Q/p1QMOw
         w7kOOihea0rJULotIg2+1gdRJsQi6juYN/i/o57gCC7m80JioNmE2jdUM8TwXyc8akNx
         PGx44Ll9F9oO5g3J+gQA2N/++TMrOFvJ87QAXItoPilnbR42D+B8kFtmaP+yYAHFSzyL
         vIDw==
X-Forwarded-Encrypted: i=1; AJvYcCUns+nJbg0jPcHj+QtLCbQptHGMoq7wbJbM0HaSpY7N0Rj5+X3/ynrCR1aABmm1+6Jpv4tk+zn4yGt4h/w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyYIh7PXiIDznnks41fisFK63TzWouCtkRQudedf96puTmc+XFn
	FFMgYoWSsAFdzA0aWyJi/9YmmV5aq6jSrNSqbUWjJuITq5mu5s/mHZpR/djoW2Sf1fEg/jS9eyq
	dGyr0Ut16W4lJbsFZ6RaSSTNW+f4w/3QTCdH8yTFXbRh+fBfqKlzWXj/dxQcDMUfLfeA=
X-Gm-Gg: ASbGncsNoWeYb/pqODoRzRTKXbY+svuT+m5HxNnYftr2iN9E38RDsYsCBhk2wbrn76t
	9Cc08oHIsigQvs6qGFYiBZCKFdXJqHKDYH1G62AyH8oMCToigKR4UgUr36QCw9kfVb5VO+POWPQ
	ajlaew5oRIIJlaLrQV7dHhkL+16al8PX/ywCUJ8Nzbp7lKbM/4UDJ4HnzSMo0r/OSiXceV8NG8J
	y+v5btvBl1Buwrftj2hXNJbpJnvAwHiyk+lTj3e4eSK9IppKtAjKkeX73fsD3pd/kqK+wlrEX0U
	FIxMjor81ca/XVhA+GKjSl0Mc3XAoHsFbTKHZv//aBRTezpUhzEpqaCaOIVlSNwB1Gly6PsVOm7
	bKnd16A==
X-Received: by 2002:a05:6000:643:b0:3a5:858f:f6c4 with SMTP id ffacd0b85a97d-3a5858ff721mr7648580f8f.24.1750268471058;
        Wed, 18 Jun 2025 10:41:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+8+c12bV3QXFpelqf7ZUsWU+nueVuiLXazDhi/qX6uph+PN90J8FEbsBo/IgcCAbkgHz7uw==
X-Received: by 2002:a05:6000:643:b0:3a5:858f:f6c4 with SMTP id ffacd0b85a97d-3a5858ff721mr7648508f8f.24.1750268470566;
        Wed, 18 Jun 2025 10:41:10 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568a7ddefsm17533369f8f.39.2025.06.18.10.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:10 -0700 (PDT)
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
Subject: [PATCH RFC 20/29] mm: convert "movable" flag in page->mapping to a page flag
Date: Wed, 18 Jun 2025 19:40:03 +0200
Message-ID: <20250618174014.1168640-21-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: CNLmt-0ghC0-c4ogT2Yngd6QmGhxLEbMhvoDU3qcZWo_1750268471
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Instead, let's use a page flag. As the page flag can result in
false-positives, glue it to the page types for which we
support/implement movable_ops page migration.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h |  2 +-
 include/linux/migrate.h            |  8 -----
 include/linux/page-flags.h         | 52 ++++++++++++++++++++++++------
 mm/compaction.c                    |  6 ----
 mm/zpdesc.h                        |  2 +-
 5 files changed, 44 insertions(+), 26 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index a8a1706cc56f3..b222b0737c466 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -92,7 +92,7 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
 				       struct page *page)
 {
 	__SetPageOffline(page);
-	__SetPageMovable(page);
+	SetPageMovableOps(page);
 	set_page_private(page, (unsigned long)balloon);
 	list_add(&page->lru, &balloon->pages);
 }
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 64639dab92b91..314cbeba1bb91 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -103,14 +103,6 @@ static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
 
 #endif /* CONFIG_MIGRATION */
 
-#ifdef CONFIG_COMPACTION
-void __SetPageMovable(struct page *page);
-#else
-static inline void __SetPageMovable(struct page *page)
-{
-}
-#endif
-
 #ifdef CONFIG_NUMA_BALANCING
 int migrate_misplaced_folio_prepare(struct folio *folio,
 		struct vm_area_struct *vma, int node);
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 4c27ebb689e3c..016a6e6fa428a 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -170,6 +170,11 @@ enum pageflags {
 	/* non-lru isolated movable page */
 	PG_isolated = PG_reclaim,
 
+#ifdef CONFIG_MIGRATION
+	/* this is a movable_ops page (for selected typed pages only) */
+	PG_movable_ops = PG_uptodate,
+#endif
+
 	/* Only valid for buddy pages. Used to track pages that are reported */
 	PG_reported = PG_uptodate,
 
@@ -698,9 +703,6 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
  * bit; and then folio->mapping points, not to an anon_vma, but to a private
  * structure which KSM associates with that merged page.  See ksm.h.
  *
- * PAGE_MAPPING_KSM without PAGE_MAPPING_ANON is used for non-lru movable
- * page and then folio->mapping points to a struct movable_operations.
- *
  * Please note that, confusingly, "folio_mapping" refers to the inode
  * address_space which maps the folio from disk; whereas "folio_mapped"
  * refers to user virtual address space into which the folio is mapped.
@@ -743,13 +745,6 @@ static __always_inline bool PageAnon(const struct page *page)
 {
 	return folio_test_anon(page_folio(page));
 }
-
-static __always_inline bool page_has_movable_ops(const struct page *page)
-{
-	return ((unsigned long)page->mapping & PAGE_MAPPING_FLAGS) ==
-				PAGE_MAPPING_MOVABLE;
-}
-
 #ifdef CONFIG_KSM
 /*
  * A KSM page is one of those write-protected "shared pages" or "merged pages"
@@ -1133,6 +1128,43 @@ bool is_free_buddy_page(const struct page *page);
 
 PAGEFLAG(Isolated, isolated, PF_ANY);
 
+#ifdef CONFIG_MIGRATION
+/*
+ * This page is migratable through movable_ops (for selected typed pages
+ * only).
+ *
+ * Page migration of such pages might fail, for example, if the page is
+ * already isolated by somebody else, or if the page is about to get freed.
+ *
+ * While a subsystem might set selected typed pages that support page migration
+ * as being movable through movable_ops, it must never clear this flag.
+ *
+ * This flag is only cleared when the page is freed back to the buddy.
+ *
+ * Only selected page types support this flag (see page_movable_ops()) and
+ * the flag might be used in other context for other pages. Always use
+ * page_has_movable_ops() instead.
+ */
+PAGEFLAG(MovableOps, movable_ops, PF_NO_TAIL);
+#else
+PAGEFLAG_FALSE(MovableOps, movable_ops);
+#endif
+
+/**
+ * page_has_movable_ops - test for a movable_ops page
+ * @page The page to test.
+ *
+ * Test whether this is a movable_ops page. Such pages will stay that
+ * way until freed.
+ *
+ * Returns true if this is a movable_ops page, otherwise false.
+ */
+static inline bool page_has_movable_ops(const struct page *page)
+{
+	return PageMovableOps(page) &&
+	       (PageOffline(page) || PageZsmalloc(page));
+}
+
 static __always_inline int PageAnonExclusive(const struct page *page)
 {
 	VM_BUG_ON_PGFLAGS(!PageAnon(page), page);
diff --git a/mm/compaction.c b/mm/compaction.c
index a10f23df9396e..86d671a520e91 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -114,12 +114,6 @@ static unsigned long release_free_list(struct list_head *freepages)
 }
 
 #ifdef CONFIG_COMPACTION
-void __SetPageMovable(struct page *page)
-{
-	VM_BUG_ON_PAGE(!PageLocked(page), page);
-	page->mapping = (void *)(PAGE_MAPPING_MOVABLE);
-}
-EXPORT_SYMBOL(__SetPageMovable);
 
 /* Do not skip compaction more than 64 times */
 #define COMPACT_MAX_DEFER_SHIFT 6
diff --git a/mm/zpdesc.h b/mm/zpdesc.h
index 6855d9e2732d8..25bf5ea0beb83 100644
--- a/mm/zpdesc.h
+++ b/mm/zpdesc.h
@@ -154,7 +154,7 @@ static inline struct zpdesc *pfn_zpdesc(unsigned long pfn)
 
 static inline void __zpdesc_set_movable(struct zpdesc *zpdesc)
 {
-	__SetPageMovable(zpdesc_page(zpdesc));
+	SetPageMovableOps(zpdesc_page(zpdesc));
 }
 
 static inline void __zpdesc_set_zsmalloc(struct zpdesc *zpdesc)
-- 
2.49.0


