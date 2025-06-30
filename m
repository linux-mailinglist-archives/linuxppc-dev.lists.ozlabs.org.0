Return-Path: <linuxppc-dev+bounces-9899-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5668DAEDDF7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:03:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5rb5R3Zz3bm3;
	Mon, 30 Jun 2025 23:01:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288479;
	cv=none; b=jOJMBPnUxWKDnbQiZLovAGGiqZzvjvWWSh1OFoor7MCWq96E8Dtx+iJVB2KIUqLT7B76TttPl/Tw+Vw8AuXBmtsVZnplqhBr0gHyKcf5b0zPtH9ZR8+nhHsRfOXv5atQTp5uTSRrVaHxVEwD60Bp/c4ub3a8HAD6L6IQ6A6BPvsBEhPZUHhzIzngPiWFIHLYacohNTRps5WdrxggQI6W0VU4wYVIzcxZhCOyOlhK0milW7ROfwr07dUkwj/T7pmnN37j8bV97LuhiFc1nKAI2Rl1lpfLrdViCxNVMiUjQnL7SCbNYmV1vGJaT/mVLcmjyu4F90WyS1E9M9inx7AMTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288479; c=relaxed/relaxed;
	bh=7h0E3JSTi0/tTXxhJU2J3wMLvxjdNIbt9+WrjT2dUzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=EZiW7Bhw5joVgbbUUhsJBQEsz0vvfr3A4u/OC4ZZlAehYoRM6/o9vw4JRf7vd1549xDxj2mJnr+fcijsZhbnLKfTdKcG31UiCaYI4Dxu6giZnzwRc8EB5J6RI6ZJjHM39Z/oSOhQpOxDDbi6o1GRdAkRHu2Y7wDGopMy/bafMx/WqXgTcfDLDHDlxiIKNE4htq7uI4PMOEW1Dwkx+A8gkuogxeJRDenRpOU8PKJawUiDdGzSDh2v41Ai9LjoifpPgMGW0AR7ykLCj3MFbPefwh1NwJgJsZ7cuf8OqZQbbJenOrrIXY87ukgeqnKendzQ6U7MA40sUJoJUHv5uZYLSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qif7vJix; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qif7vJix; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qif7vJix;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qif7vJix;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5rZ4wD9z3bgX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:01:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7h0E3JSTi0/tTXxhJU2J3wMLvxjdNIbt9+WrjT2dUzo=;
	b=Qif7vJixjv9mZ5jOqATYG0qhC7SXFSThs4kJuSPZTUAyRVeCQUK6wLhzm//wx6QLxQGdyi
	zZ/Cp3pr0cnYIW2m/DYFG8Oimq81MqWvwBrPcF9fUxkZkqQk4zEiUSf21tmP9x06w9lEYH
	d0WEb1rlWFvV84hdPUhjZWUiNMqlGp4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7h0E3JSTi0/tTXxhJU2J3wMLvxjdNIbt9+WrjT2dUzo=;
	b=Qif7vJixjv9mZ5jOqATYG0qhC7SXFSThs4kJuSPZTUAyRVeCQUK6wLhzm//wx6QLxQGdyi
	zZ/Cp3pr0cnYIW2m/DYFG8Oimq81MqWvwBrPcF9fUxkZkqQk4zEiUSf21tmP9x06w9lEYH
	d0WEb1rlWFvV84hdPUhjZWUiNMqlGp4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-6YaejLiHPW6Knz8zoppFWA-1; Mon, 30 Jun 2025 09:01:14 -0400
X-MC-Unique: 6YaejLiHPW6Knz8zoppFWA-1
X-Mimecast-MFC-AGG-ID: 6YaejLiHPW6Knz8zoppFWA_1751288468
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4eec544c6so2074289f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288468; x=1751893268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7h0E3JSTi0/tTXxhJU2J3wMLvxjdNIbt9+WrjT2dUzo=;
        b=XI8hq1/uD6ygn9E+e4Owd2eSzJMxIsmU/0ZQYBoBT1U2joeLTIDCEUTc+TJFnVqk70
         yiigzw5jxWjuugI0mV7vSYglndSa8C6w9eR7OWoCScu+yC6GsYXYYeNltGDYrqAGora4
         wwWJBjklv5p6U7aMu4xQn6c3Lps70zOo0ZXdjdMy8Q5GTowbE2lb0LvcfKcrEx9FFyFZ
         77bXATlm34n6IVZZJcVdvxxrxXP0jdP3W+RC9ZDkRI/otON95ZtqkBnkvjfL1J/5O84z
         X6EesPMzSGtC4uOC7sBud6D35IMtTt9Jpl/3LeLS7eNPSGfouC6RSRKierEgRvwpem0f
         l6+g==
X-Forwarded-Encrypted: i=1; AJvYcCVuoWRqqXaqsqFq4SPtRVQb0L179McK7eW2Od5G/q4jd1Flk4CzFZVuD2etpBAMVSc6xV8Rlq1FAOC9OG4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy0F1NFxvJh12P6DMzaur12WTJpKvIIljTVQ2QqZdfA6zdj8CJ8
	eJdKZL9/I9fL1fr/+IGJT3BMsBF/ooFz6fWDExftCP/d/+MBautWKuELXjzk2NEGryDNHYWP4Y1
	7TSXQ/8ZxSR7uSJHkUuUR8gs0r9bAcQjlqqIuFmGdPHqw3ycaZIf6UQbBJDQdwjG/il4=
X-Gm-Gg: ASbGnct5IFO+4dP0vibO0KIilmMQN87p3zrXrWqTgle6hN1V1aPlmCp6L5W83JRt1Qn
	AgJvYQmKR2GtQ4rIOk6mJDx5oly2XCO0tYXXVXtagCxdbdLIJOZLX2Slzw255OLDO719Xm/fd8c
	jcEbxaeUJf5Z/IBntv5bQ8R8iIUKZ4YCDAc/rZe4l0oPRw2PNbGufqawgfnK5Tlxl7nvZnX80fO
	pHvZpdOPgcbqSZbfbdxyjUuxquD5tc+/WO2mpPnIln9K+76Fpr2k8owBdvYW2zdzvN+dwwS0GS0
	8SNadwPNGXVfIDlyDAAtuI/P6mCwXoNezNEVf1t9eNPe1q3ztQ7qrU/iVEguN/Q1sZvA6iyjY2I
	Qf2vM4Ag=
X-Received: by 2002:a05:6000:1789:b0:3a4:dbdf:7154 with SMTP id ffacd0b85a97d-3a90be88de8mr11746748f8f.54.1751288467033;
        Mon, 30 Jun 2025 06:01:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJi8Mvk9HNQG/V6DvaTdZ9vax3u5pZXK1PzboQ8KoLkq4f/Yx4ezN8OGoebh91nmBSeSp6MQ==
X-Received: by 2002:a05:6000:1789:b0:3a4:dbdf:7154 with SMTP id ffacd0b85a97d-3a90be88de8mr11746576f8f.54.1751288465725;
        Mon, 30 Jun 2025 06:01:05 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e52a26sm10500359f8f.51.2025.06.30.06.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:05 -0700 (PDT)
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
Subject: [PATCH v1 18/29] mm: remove __folio_test_movable()
Date: Mon, 30 Jun 2025 14:59:59 +0200
Message-ID: <20250630130011.330477-19-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 0YmnfSzuDx34Ug3qlCbTvRN_RS3GFxMv_rKCodcg9i0_1751288468
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Convert to page_has_movable_ops(). While at it, cleanup relevant code
a bit.

The data_race() in migrate_folio_unmap() is questionable: we already
hold a page reference, and concurrent modifications can no longer
happen (iow: __ClearPageMovable() no longer exists). Drop it for now,
we'll rework page_has_movable_ops() soon either way to no longer
rely on page->mapping.

Wherever we cast from folio to page now is a clear sign that this
code has to be decoupled.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h |  6 ------
 mm/migrate.c               | 43 ++++++++++++--------------------------
 mm/vmscan.c                |  6 ++++--
 3 files changed, 17 insertions(+), 38 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index c67163b73c5ec..4c27ebb689e3c 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -744,12 +744,6 @@ static __always_inline bool PageAnon(const struct page *page)
 	return folio_test_anon(page_folio(page));
 }
 
-static __always_inline bool __folio_test_movable(const struct folio *folio)
-{
-	return ((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS) ==
-			PAGE_MAPPING_MOVABLE;
-}
-
 static __always_inline bool page_has_movable_ops(const struct page *page)
 {
 	return ((unsigned long)page->mapping & PAGE_MAPPING_FLAGS) ==
diff --git a/mm/migrate.c b/mm/migrate.c
index 587af35b7390d..15d3c1031530c 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -219,12 +219,7 @@ void putback_movable_pages(struct list_head *l)
 			continue;
 		}
 		list_del(&folio->lru);
-		/*
-		 * We isolated non-lru movable folio so here we can use
-		 * __folio_test_movable because LRU folio's mapping cannot
-		 * have PAGE_MAPPING_MOVABLE.
-		 */
-		if (unlikely(__folio_test_movable(folio))) {
+		if (unlikely(page_has_movable_ops(&folio->page))) {
 			putback_movable_ops_page(&folio->page);
 		} else {
 			node_stat_mod_folio(folio, NR_ISOLATED_ANON +
@@ -237,26 +232,20 @@ void putback_movable_pages(struct list_head *l)
 /* Must be called with an elevated refcount on the non-hugetlb folio */
 bool isolate_folio_to_list(struct folio *folio, struct list_head *list)
 {
-	bool isolated, lru;
-
 	if (folio_test_hugetlb(folio))
 		return folio_isolate_hugetlb(folio, list);
 
-	lru = !__folio_test_movable(folio);
-	if (lru)
-		isolated = folio_isolate_lru(folio);
-	else
-		isolated = isolate_movable_ops_page(&folio->page,
-						    ISOLATE_UNEVICTABLE);
-
-	if (!isolated)
-		return false;
-
-	list_add(&folio->lru, list);
-	if (lru)
+	if (page_has_movable_ops(&folio->page)) {
+		if (!isolate_movable_ops_page(&folio->page,
+					      ISOLATE_UNEVICTABLE))
+			return false;
+	} else {
+		if (!folio_isolate_lru(folio))
+			return false;
 		node_stat_add_folio(folio, NR_ISOLATED_ANON +
 				    folio_is_file_lru(folio));
-
+	}
+	list_add(&folio->lru, list);
 	return true;
 }
 
@@ -1140,12 +1129,7 @@ static void migrate_folio_undo_dst(struct folio *dst, bool locked,
 static void migrate_folio_done(struct folio *src,
 			       enum migrate_reason reason)
 {
-	/*
-	 * Compaction can migrate also non-LRU pages which are
-	 * not accounted to NR_ISOLATED_*. They can be recognized
-	 * as __folio_test_movable
-	 */
-	if (likely(!__folio_test_movable(src)) && reason != MR_DEMOTION)
+	if (likely(!page_has_movable_ops(&src->page)) && reason != MR_DEMOTION)
 		mod_node_page_state(folio_pgdat(src), NR_ISOLATED_ANON +
 				    folio_is_file_lru(src), -folio_nr_pages(src));
 
@@ -1164,7 +1148,6 @@ static int migrate_folio_unmap(new_folio_t get_new_folio,
 	int rc = -EAGAIN;
 	int old_page_state = 0;
 	struct anon_vma *anon_vma = NULL;
-	bool is_lru = data_race(!__folio_test_movable(src));
 	bool locked = false;
 	bool dst_locked = false;
 
@@ -1265,7 +1248,7 @@ static int migrate_folio_unmap(new_folio_t get_new_folio,
 		goto out;
 	dst_locked = true;
 
-	if (unlikely(!is_lru)) {
+	if (unlikely(page_has_movable_ops(&src->page))) {
 		__migrate_folio_record(dst, old_page_state, anon_vma);
 		return MIGRATEPAGE_UNMAP;
 	}
@@ -1330,7 +1313,7 @@ static int migrate_folio_move(free_folio_t put_new_folio, unsigned long private,
 	prev = dst->lru.prev;
 	list_del(&dst->lru);
 
-	if (unlikely(__folio_test_movable(src))) {
+	if (unlikely(page_has_movable_ops(&src->page))) {
 		rc = migrate_movable_ops_page(&dst->page, &src->page, mode);
 		if (rc)
 			goto out;
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 098bcc821fc74..103dfc729a823 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1658,9 +1658,11 @@ unsigned int reclaim_clean_pages_from_list(struct zone *zone,
 	unsigned int noreclaim_flag;
 
 	list_for_each_entry_safe(folio, next, folio_list, lru) {
+		/* TODO: these pages should not even appear in this list. */
+		if (page_has_movable_ops(&folio->page))
+			continue;
 		if (!folio_test_hugetlb(folio) && folio_is_file_lru(folio) &&
-		    !folio_test_dirty(folio) && !__folio_test_movable(folio) &&
-		    !folio_test_unevictable(folio)) {
+		    !folio_test_dirty(folio) && !folio_test_unevictable(folio)) {
 			folio_clear_active(folio);
 			list_move(&folio->lru, &clean_folios);
 		}
-- 
2.49.0


