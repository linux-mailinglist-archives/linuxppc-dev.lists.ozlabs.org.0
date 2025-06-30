Return-Path: <linuxppc-dev+bounces-9889-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B62AEDDE0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:01:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5qw2LCLz30Tm;
	Mon, 30 Jun 2025 23:00:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288444;
	cv=none; b=eH0yVzJ/uHDpmziFldeoFNaLlMH2kj0TdS4DlvB52zfUj6jKyUpoycbeyfkhIXQP0nAXxm2IHg0opRijS9ELzSMDsv5CCPZ9hYrgq3YabOPPNPMExxcigXCNG5jV+xgWVGwb8jeHqWXESxoSvoNx+YUOW0EdpiPom9A7JFOR3WWt5wbvxzjY9O65nSDhvI8r70XC2DqFDzIzxEwGs73u5g8sZ9O+nc5lSnFzUiHOmmGJ/3XjqVOKs+Kl42FZi5ovbH47sqMoTIgW19pPB7qnthYbsUnvSXI+S+5jgXqtFKmRFwX/KoNteUkW8KmpgewEjUT67bLjTtxClwMB86ZRPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288444; c=relaxed/relaxed;
	bh=m9VQLTS9DDIxmZmB+neo2FcUhAnDYm//4qg3iAtoZVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=WWPzGp2XM4yZh/tf+QwlGsQAhjIS3cNsQGLjW1yPYsNA5niaFzJgWwtFc5Sx6To/ln/U76zvaZmt68+udtJbpE3obiNkWivuYhzhle7Q8QNgQFFP7IffJcYze+qbkC2930C1mD65Eh+CREk9JhKrxJP++iXyE1gzB2OW+O+vRGikoc7lzKjrtQ54ShpL3piW79R/kBr1UeADN4ir7X//GkODbQ6fsz7MvgfGbilnkG9Yzyb68IUiOBJR77Id6mLBGtuWxkqgmex9GFIj5hNZZWmtPD1U8UxxlBY4nJEJoC9aak1NCnUQ7+Gu5mqr6twkXitv9jbuFfdIVKy5XlacKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J3MwJPH3; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J7cB2d9p; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J3MwJPH3;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J7cB2d9p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5qv20Mtz2ym2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:00:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m9VQLTS9DDIxmZmB+neo2FcUhAnDYm//4qg3iAtoZVM=;
	b=J3MwJPH3pKsFvc1tmvALWyj4VQiu7pxMfi1Qb7/ax8OwqS2vFbcujOaajSuL+JKge8Kxjv
	T91ZUXWLTcw7Sn/U1K2ttgXgJmP/loMjbbQltKvanLRbr0ljZzEE/sCkuRPAdjNV2WcXo+
	41mMfONhWQmEfpfgnZCsWUrkaqshC04=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m9VQLTS9DDIxmZmB+neo2FcUhAnDYm//4qg3iAtoZVM=;
	b=J7cB2d9pLtIBmA+gSI/y6otJ9QUJvgXb1h1DYizHqHkH4Y2vx9RlxIYw/jaEo1TdVUxGob
	JUhcZ6bQq+Uuu6mVJaS0Fx7vcGDDq5HihuIXWkGIfx0TOxQMafwT4a6mVDx0zujxKRVCoM
	GGkfiuizxMuYOYQ/i/h61+qhMrw102g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-UHtcjqBHPhW-x5gL4B2Mww-1; Mon, 30 Jun 2025 09:00:38 -0400
X-MC-Unique: UHtcjqBHPhW-x5gL4B2Mww-1
X-Mimecast-MFC-AGG-ID: UHtcjqBHPhW-x5gL4B2Mww_1751288436
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451deff247cso25977795e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288436; x=1751893236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9VQLTS9DDIxmZmB+neo2FcUhAnDYm//4qg3iAtoZVM=;
        b=XT/T24ugFZjQ1sTfT9o3+zo9so891EBqsLNX2OO3HeneEQ/FwhF1coRDgeNmdKv9Xy
         tQqjBuQqNsQQmYTtpYiHJVPD5ZYlqoeY8P9eCe8kYXJ18qWds300ysPB2AR+kojNQPRU
         h5PZj+RQ3do7xP7gJlWHoCUfdIlmrxgkjcR49lFrt0kb4VP3UeWwQR4gIOSmcx3JCADa
         eNarUDOwu4w9B1vUJ6KrZZ4/d7N4xXDs+8TW1dqnVrum2z1Nl2jxxz54zeEHysHoepmn
         aqkgQikSTFivos35+og8dGylUz+H7J/3KTRw51JaI/Y6G+LFU2c9ugm8CBMWdQ6AUXS5
         j85g==
X-Forwarded-Encrypted: i=1; AJvYcCV3uZDDz1aDdQCcaNLzsyghVtFkmpsPUuxjZtl4Ab+qk5gIsT+e4fKbsiIJhqcV53pHtXOs+wH9wtcl/sU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzgXgzrugmQkFHUgmqhnSIKZ/yb6P3VhitLwk36wBfMyKj4KcN1
	Vpv9ZCBOTkBEujn3rPsKQdlBF0S3pxvvDuXCEtIYC/5aZC0ugSCKudtpf8y00xuC0dTvFVydAGU
	aQGQf5EjSm7lvIPBPo6+5IHv/PwUbrz7/V4JqkAFMVHEnLZdjgl62YYf+pb29v+eCfvQ=
X-Gm-Gg: ASbGnctImrW3owl6YSWqEda3Sm4ktnqLTwr2wp8fXw9vJO10GEYD6sMok7zNKBTFj2s
	tbuyx4PvqlERvn4aG5+MviDGNcJsp80Bgck6UfR2PR9zCFOlkumfWoRtMBRKcV5a+vwv0AACnw0
	+gtYqjb9pGWH8e2VKU/oLsAbkrZ9NqKo8e+3B+ORiMJbUse0O5ohBIzhyNSo0jhkO8hDNDwFBub
	eyUsXqo3iP1IyKTnQNYUoMU4kSu5XO+IlqcBix7OmZZ4JZ3thVxlP749K7W7mHRDR/m1UVfqBMF
	UxnpcS+ohXs616CDhJLmM82qfk9emQc5GJJFwEk4FffrneH+F8Jv/n24gs/+l/zs/caCeBSG1Ns
	LDC7ocds=
X-Received: by 2002:a05:600c:5251:b0:453:6c45:ce14 with SMTP id 5b1f17b1804b1-4538f2c6a5bmr116867235e9.4.1751288436019;
        Mon, 30 Jun 2025 06:00:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcKPudq4hAX3ZUQbBxj7a9OFNaExkIT0GfF2UdhGugpVpmsHfKtz6PBCtjyRSKpLMaHzgIYg==
X-Received: by 2002:a05:600c:5251:b0:453:6c45:ce14 with SMTP id 5b1f17b1804b1-4538f2c6a5bmr116864905e9.4.1751288433794;
        Mon, 30 Jun 2025 06:00:33 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4538a406489sm136741305e9.27.2025.06.30.06.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:33 -0700 (PDT)
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
Subject: [PATCH v1 07/29] mm/migrate: rename isolate_movable_page() to isolate_movable_ops_page()
Date: Mon, 30 Jun 2025 14:59:48 +0200
Message-ID: <20250630130011.330477-8-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630130011.330477-1-david@redhat.com>
References: <20250630130011.330477-1-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: byuPwUYj4qLfj065COKR1h-Lhzd9VO658YBp_GiwRws_1751288436
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

... and start moving back to per-page things that will absolutely not be
folio things in the future. Add documentation and a comment that the
remaining folio stuff (lock, refcount) will have to be reworked as well.

While at it, convert the VM_BUG_ON() into a WARN_ON_ONCE() and handle
it gracefully (relevant with further changes), and convert a
WARN_ON_ONCE() into a VM_WARN_ON_ONCE_PAGE().

Note that we will leave anything that needs a rework (lock, refcount,
->lru) to be using folios for now: that perfectly highlights the
problematic bits.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h |  4 ++--
 mm/compaction.c         |  2 +-
 mm/migrate.c            | 39 +++++++++++++++++++++++++++++----------
 3 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index aaa2114498d6d..c0ec7422837bd 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -69,7 +69,7 @@ int migrate_pages(struct list_head *l, new_folio_t new, free_folio_t free,
 		  unsigned long private, enum migrate_mode mode, int reason,
 		  unsigned int *ret_succeeded);
 struct folio *alloc_migration_target(struct folio *src, unsigned long private);
-bool isolate_movable_page(struct page *page, isolate_mode_t mode);
+bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode);
 bool isolate_folio_to_list(struct folio *folio, struct list_head *list);
 
 int migrate_huge_page_move_mapping(struct address_space *mapping,
@@ -90,7 +90,7 @@ static inline int migrate_pages(struct list_head *l, new_folio_t new,
 static inline struct folio *alloc_migration_target(struct folio *src,
 		unsigned long private)
 	{ return NULL; }
-static inline bool isolate_movable_page(struct page *page, isolate_mode_t mode)
+static inline bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 	{ return false; }
 static inline bool isolate_folio_to_list(struct folio *folio, struct list_head *list)
 	{ return false; }
diff --git a/mm/compaction.c b/mm/compaction.c
index 3925cb61dbb8f..17455c5a4be05 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1093,7 +1093,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 					locked = NULL;
 				}
 
-				if (isolate_movable_page(page, mode)) {
+				if (isolate_movable_ops_page(page, mode)) {
 					folio = page_folio(page);
 					goto isolate_success;
 				}
diff --git a/mm/migrate.c b/mm/migrate.c
index 767f503f08758..d4b4a7eefb6bd 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -51,8 +51,26 @@
 #include "internal.h"
 #include "swap.h"
 
-bool isolate_movable_page(struct page *page, isolate_mode_t mode)
+/**
+ * isolate_movable_ops_page - isolate a movable_ops page for migration
+ * @page: The page.
+ * @mode: The isolation mode.
+ *
+ * Try to isolate a movable_ops page for migration. Will fail if the page is
+ * not a movable_ops page, if the page is already isolated for migration
+ * or if the page was just was released by its owner.
+ *
+ * Once isolated, the page cannot get freed until it is either putback
+ * or migrated.
+ *
+ * Returns true if isolation succeeded, otherwise false.
+ */
+bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 {
+	/*
+	 * TODO: these pages will not be folios in the future. All
+	 * folio dependencies will have to be removed.
+	 */
 	struct folio *folio = folio_get_nontail_page(page);
 	const struct movable_operations *mops;
 
@@ -73,7 +91,7 @@ bool isolate_movable_page(struct page *page, isolate_mode_t mode)
 	 * we use non-atomic bitops on newly allocated page flags so
 	 * unconditionally grabbing the lock ruins page's owner side.
 	 */
-	if (unlikely(!__folio_test_movable(folio)))
+	if (unlikely(!__PageMovable(page)))
 		goto out_putfolio;
 
 	/*
@@ -90,18 +108,19 @@ bool isolate_movable_page(struct page *page, isolate_mode_t mode)
 	if (unlikely(!folio_trylock(folio)))
 		goto out_putfolio;
 
-	if (!folio_test_movable(folio) || folio_test_isolated(folio))
+	if (!PageMovable(page) || PageIsolated(page))
 		goto out_no_isolated;
 
-	mops = folio_movable_ops(folio);
-	VM_BUG_ON_FOLIO(!mops, folio);
+	mops = page_movable_ops(page);
+	if (WARN_ON_ONCE(!mops))
+		goto out_no_isolated;
 
-	if (!mops->isolate_page(&folio->page, mode))
+	if (!mops->isolate_page(page, mode))
 		goto out_no_isolated;
 
 	/* Driver shouldn't use the isolated flag */
-	WARN_ON_ONCE(folio_test_isolated(folio));
-	folio_set_isolated(folio);
+	VM_WARN_ON_ONCE_PAGE(PageIsolated(page), page);
+	SetPageIsolated(page);
 	folio_unlock(folio);
 
 	return true;
@@ -175,8 +194,8 @@ bool isolate_folio_to_list(struct folio *folio, struct list_head *list)
 	if (lru)
 		isolated = folio_isolate_lru(folio);
 	else
-		isolated = isolate_movable_page(&folio->page,
-						ISOLATE_UNEVICTABLE);
+		isolated = isolate_movable_ops_page(&folio->page,
+						    ISOLATE_UNEVICTABLE);
 
 	if (!isolated)
 		return false;
-- 
2.49.0


