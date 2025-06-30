Return-Path: <linuxppc-dev+bounces-9897-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A811AAEDDF3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:02:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5rP62k8z3bh6;
	Mon, 30 Jun 2025 23:01:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288469;
	cv=none; b=OE6Ko7d2t5tBJSKIZPqL2Os4cOO5nS7x/wHnLqrHaiPnYD5e8ptenXmdRJIPCt6t86RKlmoEiS3TVTdQAmB1NePnYTUvfHZOXUFf7XVHr1KQL25VkuJEIRfSeRXkk9p/PZmu4v3JCzaiJ1oFWJAW35qBPR8voJMnLFc2ww9I1y4608OxDGt/wG1P1bguWsw8T1SPYozSYdFWgN9LsErmM+ZGjDFaHbZHsjd8D+TNK8MXdNhiV3goloUg+L2b0kaRywyK2qReRqKlHmK9rxF6HcIXA9D7dYGLp5euWAhKPQkHNORpsN432HSGOPZzdIh4UB5hXywvedxLFECZ6eQ5vw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288469; c=relaxed/relaxed;
	bh=j9ZRLOTZa5PZrqGG8BB7XlQvd09DIcXAeCmmDpWukIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=MwYA7YMADqz0BtQgV8hDk0gQeXmkLUZGQQQzqGGJXThOCXdQ5LOmkj8+Qs7y8/31XujUKUTsSLax6R4Ci/Wkzvmt0IB57pGDzIuysWE9zDuTI9A+p+hgw6cAst0o73vfzyriOaOOB7OjqZs9gy/b16qK4GfblBKAnG/ADfyfqEtVIQ81zu6zK/RcdgZ/pUAUo6pKUPq9EO62eJTZyMjUkz8YLFoorTgSmbMdx+RSX4zRa/3sKB6mJXvaNmYAuq/lD1oihOmgqEqk+BMlmRNBAVbbGhYPq8TqeiB0nKFeYG3KmPMhFUSmDa/oV2doQuVZW1ShltC3yPJODjYCu+HZUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IXqYiF07; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IXqYiF07; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IXqYiF07;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IXqYiF07;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5rN51g1z3bgX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:01:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j9ZRLOTZa5PZrqGG8BB7XlQvd09DIcXAeCmmDpWukIA=;
	b=IXqYiF07tZe2lJmmKrm8zFd+NswyGhiWhfWqlBIb7gzvyVKdYF/CWnxIwCvnEuQsSVLzOR
	ttfRts73Gx65M7GJPzvujMEPWPegh57gMIQdEEwUf1jbJGFKo5uAafid+ZGZ8PZkc6rDq+
	I1tQSt6r9tWWU4oV6wJc7VSCkDRlohU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j9ZRLOTZa5PZrqGG8BB7XlQvd09DIcXAeCmmDpWukIA=;
	b=IXqYiF07tZe2lJmmKrm8zFd+NswyGhiWhfWqlBIb7gzvyVKdYF/CWnxIwCvnEuQsSVLzOR
	ttfRts73Gx65M7GJPzvujMEPWPegh57gMIQdEEwUf1jbJGFKo5uAafid+ZGZ8PZkc6rDq+
	I1tQSt6r9tWWU4oV6wJc7VSCkDRlohU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-bXfFK4a5MDuP_IweygFlPg-1; Mon, 30 Jun 2025 09:01:03 -0400
X-MC-Unique: bXfFK4a5MDuP_IweygFlPg-1
X-Mimecast-MFC-AGG-ID: bXfFK4a5MDuP_IweygFlPg_1751288462
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d290d542so28505765e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288461; x=1751893261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9ZRLOTZa5PZrqGG8BB7XlQvd09DIcXAeCmmDpWukIA=;
        b=GMl47lxYZBnj6Z8LE6i4WEQijgk2aozOk1htIRCj1sA3V1JreXO8cMaYt3Z2OZX4Lq
         tRRuX8EPvlHAbiPqDCKYRfHqxWdJnWQ5QvcD2FIlW1DVHQUHl7hQGHPIXvxngYDuw3h0
         0DWuh4bqbyANgFmCziZGKTh0qKb/ZNiC2LfME+m9cBsx74j/f60/W9atnUbodInfXTS/
         aYOiR5ZJdkmjLSAh1fX9eIVH00QcdVxgmsuA7nxOqeb1a5V7F/gMKslnI9sXWJC8gUCT
         iDWyAxeLNY1TGclT3hPI12H27Qz8KQTrxM1/BUoWlqy51TUEF/diY6xJDcRaxrZOVcAW
         Kqyw==
X-Forwarded-Encrypted: i=1; AJvYcCWEA+9Zjl3yCB+/3KC2eZMLiULwrAhhk9dIS+eIl/RKTMSxfaTOCZwMKhduRXh/X04E1ExjIBzgOYcgzzw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxaUTNIrILLGrGGYL5JQeGzPxlBAOkMLhrsIDP4YXKBrNr8tQE1
	lE2xnIWLIL10eq1oUsA9oiMFL+CqbgM3S0WedY//i7OA+hSvARtq8dhbL4gKB8yRRnW2ZuLCksD
	9Em4cfK73FbRdRIqAzPIwnxAnhEgRNC74zFbx07Tn9omay6iLBZ/Vfb9Nirdt8crPs78=
X-Gm-Gg: ASbGncs+dp0dycUVwd+O0NsAsXykUDyrI6VpV2w9HM1nNkqR6RFZm3dA/PPjUyFBO5a
	RQgh8BU6RccnlQcfvNHWRRg/Q23w7CxgxqkyXjuwLybcES4V6Xc7XcWUrDAQCf1KtyIc+kdg/w6
	gDIW33mI+aT+068tSibDocrSwfwaflBEACw85ehSYG1aVLyVk1y3jIh42+DOk0+ZgjYqA6pFFWv
	sv6cWTPqZmV+zFjlGVhikoiFOpsVMs8z5FTqfIHZUFzp+Vul2Ha+nvzVD7MU/vUD7hCueZVYIk4
	l/vBMc2xfA0MeTps4MLrz42pCObMweUupZYAe27c6UvmwSKsranHp6IXu0WuYNOWG9Cs2XVqiYc
	QaKuptFU=
X-Received: by 2002:adf:e050:0:b0:3a5:2182:bd17 with SMTP id ffacd0b85a97d-3a8fe4bc79dmr6795119f8f.19.1751288461104;
        Mon, 30 Jun 2025 06:01:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX2/qdHEQ8JHXpMdU+ERIflh/WNh5UuVnHM8RS5ZiXb7uiqYANr4p4OCvKgXi6OG7WHmrLuA==
X-Received: by 2002:adf:e050:0:b0:3a5:2182:bd17 with SMTP id ffacd0b85a97d-3a8fe4bc79dmr6795028f8f.19.1751288460150;
        Mon, 30 Jun 2025 06:01:00 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e5979dsm10337527f8f.75.2025.06.30.06.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:59 -0700 (PDT)
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
Subject: [PATCH v1 16/29] mm: rename __PageMovable() to page_has_movable_ops()
Date: Mon, 30 Jun 2025 14:59:57 +0200
Message-ID: <20250630130011.330477-17-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: JPe37JgOq-MdSMsNHrqq1cFFBA-TBFQaYOd1wdDPOXk_1751288462
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's make it clearer that we are talking about movable_ops pages.

While at it, convert a VM_BUG_ON to a VM_WARN_ON_ONCE_PAGE.

Reviewed-by: Zi Yan <ziy@nvidia.com>
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
index 25659a685e2aa..e04035f70e36f 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -115,7 +115,7 @@ static inline void __SetPageMovable(struct page *page,
 static inline
 const struct movable_operations *page_movable_ops(struct page *page)
 {
-	VM_BUG_ON(!__PageMovable(page));
+	VM_WARN_ON_ONCE_PAGE(!page_has_movable_ops(page), page);
 
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
index 5c37373017014..41fd6a1fe9a33 100644
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
+			/* Isolation code will deal with any races. */
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
index 62d45752f9f44..5fad126949d08 100644
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
index 040484230aebc..587af35b7390d 100644
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


