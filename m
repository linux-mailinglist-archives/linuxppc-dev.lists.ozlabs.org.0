Return-Path: <linuxppc-dev+bounces-9475-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B829ADF45D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:42:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrd31zSqz3brN;
	Thu, 19 Jun 2025 03:41:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268471;
	cv=none; b=lCv3SbfmjsPrDoqmSzooJ07UpK/JcWT9uC/Qodj7vsIlOCG4eeIs9mxEYFpkmg1qkIF2+H1X/+cilhDwU3ivcoy1agSuphuYP8hOd5VPGvCep7/zVHhaJM3oPH8/C4dyAFdE+XrWZOYWjvQyy4dkhgF6uDvmiOZuQVTllreyc858RVueLEdp/jxqEnIeMPNi10sCFwrYDgEuPNvf2604MxJQDbBqtWICJ2nZM56QsMESbMo+0R75aA4uCBsKyb1kLyqmluE1KbdjeQmkTvNtpgNwQ0Uqv9Z9NQiv0H92jBeomYDcMjT2udzf4ouS384sG4qoTyL+c25y4PDDx68dRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268471; c=relaxed/relaxed;
	bh=XNETPXN7225Q+hZzTHNEAHzgtHhIrhZYYBe8I562/sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=aOr9U2gVh6ib47ywW55y8eG6WfzQSC/mAQB/d6BaE/2IxTgU2MECno943gvRVa8vpA3O5hDfhmnTkiaqaoj4H4PlUvvybani0aAQBGikbmZfurrkonYQZiG4j1cgBl+xK8CKbgSsbe641O7xDWxGW6+hNmXB+a6tJP/clrm/x69MEZQnOLoKYHuNcUBCPAQI2lD1t8Qgz9dDZQiqcFFoRVQtSHLVt5Xne1MAt0J9MzpJtyZU5+xDGkPIMBq6/bYJEABlyhlCoc47r3rup66t9SweoD18wkV4ebvk35tgXJOqkUUoR38RScQ/jvqpQkhGh83T8DAnwfImgGhlLx4Q7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NibJtOXw; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NibJtOXw; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NibJtOXw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NibJtOXw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrd23TpYz30Wn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:41:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XNETPXN7225Q+hZzTHNEAHzgtHhIrhZYYBe8I562/sc=;
	b=NibJtOXwCzRhp8Zj/ebc77NyKE7HKM9HtUenxN2QqszFaDDB01GWuVh6L5vSMWv4NEhCbQ
	u6+63qCAp99j3ybz3+fvclXh5siCFeIrX00pyqlF3JVsZVZrWQgkmSm61xlSRVgIXu84cB
	IsZDQI8zGhHf4OT0Y3riB7IW8QL8hNA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XNETPXN7225Q+hZzTHNEAHzgtHhIrhZYYBe8I562/sc=;
	b=NibJtOXwCzRhp8Zj/ebc77NyKE7HKM9HtUenxN2QqszFaDDB01GWuVh6L5vSMWv4NEhCbQ
	u6+63qCAp99j3ybz3+fvclXh5siCFeIrX00pyqlF3JVsZVZrWQgkmSm61xlSRVgIXu84cB
	IsZDQI8zGhHf4OT0Y3riB7IW8QL8hNA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-ESrc8YSLMpu5j01UcWIrtg-1; Wed, 18 Jun 2025 13:41:06 -0400
X-MC-Unique: ESrc8YSLMpu5j01UcWIrtg-1
X-Mimecast-MFC-AGG-ID: ESrc8YSLMpu5j01UcWIrtg_1750268466
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f55ea44dso2915989f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268465; x=1750873265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNETPXN7225Q+hZzTHNEAHzgtHhIrhZYYBe8I562/sc=;
        b=D2QB51JHladZO6jbdNC8pdLTe6xzAF20QYd5SvQy7LpKQGrbRSuEQ+q/5k+8dIny9e
         EZoemAQ5CFt4vUcHJh3cxDIerR4zfBrcl0oJ5uZ94A50YL97AzYfemn/5k+b9ToMq+Lg
         o0hl5Yi7FgAGthTf3gXZ0xrRpmO2zx80HiR46qHzZu9UBdM05NI55bjqERmRol283Oit
         ho1vIvrk+QstVp9CLBkM8LjcGECXn9G1fEw16ZF8is3EIzQoErQh4UvV3I5vyx8vFaw9
         iqs8mmE/l2OKk/jf7cmv1br31EcaE+u+IMC0b3ue4dMIWTXCnjrG0m7bfWZhvkr95pwb
         oI7A==
X-Forwarded-Encrypted: i=1; AJvYcCWlURM/xJpbIUvzSpiEConyLGsiny2+K+8r3DyCFcA96I2VmmdYd0Q3F9B6r5tj5TOWp8nSkZUNMPfcWpk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxOTi/xR0Q8l4Bv3hrIOCBioH4PckIUVSGk/onumEUGRYkvBtih
	AbC5ajdtb71C6EBTFZS1NNLDGpeXJjxeaZuqP6a3KWXxmht4vhCWYfhICDUGqAeQwROxj/Lnsfu
	/JOYiLUMADxVXqkBzZPVA11nnI6tgBcnPL4/kzq30Nap3TkPF0HEQjHIqUvBYWj0G/ubgYsc/aO
	T2Mg==
X-Gm-Gg: ASbGncvA0s0wkzz4/MrHb0NS0lfUKnEZ4rMD3M5u3w+qmEOkKocRgmwJAeXhAtpE9yM
	eAGuFroEBd3RNIGoGf3YulhWuFwgsXB2Pbovqq5h9hcaVGEEzfMqOiLrefxEj4MPGYmDerH8UoH
	wDXy/sstap/UVSTkjt60W95HHWU8BmVF78qXHwG8htzWk0i8x/7PxhYcIKM7AWJbtG7yH+SnHei
	927IuyblojcVsoa1sMwJxFr5llZtwsoh8Odc8Ti1DOMY89XUnuKz6Ba7itsE1ZmNBlmq3ulsicb
	8uGnwk5JV1tD+zH3PZRQfs1N3n0mQTQcZsp+6b9LL27UW44Ai+9N3FDm9yjV8EpJzY5X9nzJ5YK
	kDZOL4w==
X-Received: by 2002:a05:6000:2a84:b0:3a5:8934:b10d with SMTP id ffacd0b85a97d-3a58934b44emr4899252f8f.10.1750268465657;
        Wed, 18 Jun 2025 10:41:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGweIJH7UFdL4iF+vDHHDFBTBiRTPsGiwY+Mamaq8n4uKw+sdUC4NhASQWA8g0N93X4/5Zu1g==
X-Received: by 2002:a05:6000:2a84:b0:3a5:8934:b10d with SMTP id ffacd0b85a97d-3a58934b44emr4899213f8f.10.1750268465236;
        Wed, 18 Jun 2025 10:41:05 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b18f96sm17611143f8f.66.2025.06.18.10.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:04 -0700 (PDT)
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
Subject: [PATCH RFC 18/29] mm: remove __folio_test_movable()
Date: Wed, 18 Jun 2025 19:40:01 +0200
Message-ID: <20250618174014.1168640-19-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: g8ObmWB3wdTzNPa36QDvNpnBjr8Mvj4uUdVO7tgyZQo_1750268466
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
index 5f97369eac2f9..37e722fbfee70 100644
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
+	if (unlikely(page_has_movable_ops(&dst->page))) {
 		__migrate_folio_record(dst, old_page_state, anon_vma);
 		return MIGRATEPAGE_UNMAP;
 	}
@@ -1330,7 +1313,7 @@ static int migrate_folio_move(free_folio_t put_new_folio, unsigned long private,
 	prev = dst->lru.prev;
 	list_del(&dst->lru);
 
-	if (unlikely(__folio_test_movable(src))) {
+	if (unlikely(page_has_movable_ops(&src->page))) {
 		rc = migrate_movable_ops_page(&dst->page, &src->page, mode);
 		goto out_unlock_both;
 	}
diff --git a/mm/vmscan.c b/mm/vmscan.c
index efc818a0bbecb..e5d04c98af976 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1651,9 +1651,11 @@ unsigned int reclaim_clean_pages_from_list(struct zone *zone,
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


