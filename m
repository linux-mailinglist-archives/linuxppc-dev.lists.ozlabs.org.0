Return-Path: <linuxppc-dev+bounces-10099-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B803AF9017
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:27:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVCf20LGz3blH;
	Fri,  4 Jul 2025 20:26:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624766;
	cv=none; b=Z8/QNOR7MPY8SmFG0ulHvzV4ItSg01VR4DUTcVO1N8aH8cW5K9yg7G7ERHmBRx9Do0RKsDyf4lhYDO/289305U6EdWDvtTkceQRhqZA0zg0mzyIO6HdsyRIX/MGFegyk84EGSLF7HOYuqCdTw8welA2PVwAwcVJMMIZPrROmRaBmKdReBrgV1x4NP6/t2qX71EHbQJ2QFA+ykEw+G3uq1KpJ7cdLCOaNMlsOPEFg4M3QFdR/k7NLyHTkJjpFmgnUM30dTI0nkBdMYPHGwXMg4p81PFG3++LapUjg3sQifFq93kXzpHVeUORAl5byobyXMPS5mQ4puShHukYxwuHhaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624766; c=relaxed/relaxed;
	bh=bNuyprjgbIdX6AHgfTXgzVcFKi/kDd27yjboz7bS+HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=fFIJucm+FCBSPlV0l/OMHcVb8QV42rw0AaRtbahelPo8PV2oPHaXYLoZhUr8y8joAKhme7k5RWDGuPjHupjis4mOAKtdnxrUAU7SOYwki0NGA2iIXsNRwIQ3+CEjo+OoCOcGaTGk170Sp9hu5seAvuf2hEoou9xwqHtadJq3Ikb0JOKppHizzQNfdgc8X0SrLy4+FNAxFGIzwFE3DbbRTsQI9X9xaJp7VDvD2JePSz8GIzp4Y77shA4LWM3NIKYUyGizxUwvtYKllV4rRcDsBage9avrV/4eloHBK+n+RhqQEoBCxyKcgOZWGu9jcD3JUdlCTpqRVgnlB5HuAzjmsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hvf6N3yC; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hvf6N3yC; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hvf6N3yC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hvf6N3yC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVCd3lP1z30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:26:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNuyprjgbIdX6AHgfTXgzVcFKi/kDd27yjboz7bS+HY=;
	b=Hvf6N3yC91gYoP2tUU49XiPBgzGG/L7VW6AdD2JBioeb7P2zJXcDT9Rysyh6RPXmsKf5Z6
	Pp1q3FJ/WC582x8U46Al8RZsJA+CU6pHtstqBzvYps6ErRqt2QvKNk+0mN2wf2zqgX2uyi
	5emTAxUerg3yzcg16NderkvxCz7RVZA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNuyprjgbIdX6AHgfTXgzVcFKi/kDd27yjboz7bS+HY=;
	b=Hvf6N3yC91gYoP2tUU49XiPBgzGG/L7VW6AdD2JBioeb7P2zJXcDT9Rysyh6RPXmsKf5Z6
	Pp1q3FJ/WC582x8U46Al8RZsJA+CU6pHtstqBzvYps6ErRqt2QvKNk+0mN2wf2zqgX2uyi
	5emTAxUerg3yzcg16NderkvxCz7RVZA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-B1IvmVcyMN6Xx89jD6HIEA-1; Fri, 04 Jul 2025 06:26:02 -0400
X-MC-Unique: B1IvmVcyMN6Xx89jD6HIEA-1
X-Mimecast-MFC-AGG-ID: B1IvmVcyMN6Xx89jD6HIEA_1751624761
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45311704d22so4287875e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624760; x=1752229560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNuyprjgbIdX6AHgfTXgzVcFKi/kDd27yjboz7bS+HY=;
        b=vLoAvDQvRlvErLkXCgzxNctiicgI0vv6nXbCzGv+Bh5G99MFegI/hf+4uCRLuv3ch6
         ZQ67p5vvvjxln2iNw8ZYtwRxG6DcdYJ3ZZL4qObn2iAS6V4XeIKHa9qt7tFBNnR4AQA/
         M9cMX0X/ZtQkQqlAgN+yPrb8qcEBqjVjYAGSsWw/tXQmUmuhPNUp/pDDcrcpoHU7TGON
         3x6wfJpd160LeG22Xljq0NZY67seY7mrGvvAelQaRSJLTAjM1BhTuVoP71cpZsxfiy4r
         Cs+Z56R/wLdviSaznWNysL+m6oOmFxocyKeCdb7yVl+uMKgRDDydrLiP6to3/x+tqoEj
         njNg==
X-Forwarded-Encrypted: i=1; AJvYcCXHEXkkBpSeA5b264K8KfuUnEENlfO+iPLAMuFHaHGVKhOm4O6LBtNMvaSqQ+8dmLIjSJB3fC7/j1xoStA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzqITn6SXtyP9H8yjYd5HAdcYMyfKOLn0rH+y9InU980gVvXfCU
	N+bqfJ5c28DrCUpvcyCGIG+5KI6A5WummsTaVF4CbiO23t7wBsgR7cUCSxGtA/vmWGdGEGvPhG2
	N6sGleRSwne9YMD6XA5JT6/AqDqiJPmXMNKZPN0rhqGax/vIey3Ea7NSEE7N6fNe6Lpo=
X-Gm-Gg: ASbGncu6lWwg4MaGEGGb7AQqHRNH1HWlM2b8TETZB+G1n48lIqOTQNsi0tO6rFT2NN1
	+uiNnvxyQt0g+M6FWK5FTzNMluKvCWga24XMtPq5mqkruxVLwMubPQN0MazxwcteNxxLGiPTZke
	+IzwsLPR0IYCrNXiYTVEJ1vC4FTjm3D0vCIfcQxtgY5mi0LJIBvUI5setyKGznjvBZPusDnb/ko
	v4kEpXFAUvF81A6X6MnQDyS6qtwT1Jcu74btEfF8ihQpqi3hjn2HVC1FEF2W0CphZW9NmB+bE5j
	22UQ3AkssKrHmWb0C02orPWz+0BqSUTHS3gPCQVjcbgG1b67BvmDd/puDdfyQqJqXl0VpmJMW8T
	BNEH27w==
X-Received: by 2002:a05:600c:8214:b0:450:d568:909b with SMTP id 5b1f17b1804b1-454b4e74957mr16127655e9.14.1751624760451;
        Fri, 04 Jul 2025 03:26:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8vCOgrvNVf6Wu0EKSuY1xmeHKjerawOF5tOLzHfBQzCNUvjojZFchXxtXOEn9U9CGQYVIhQ==
X-Received: by 2002:a05:600c:8214:b0:450:d568:909b with SMTP id 5b1f17b1804b1-454b4e74957mr16127045e9.14.1751624759877;
        Fri, 04 Jul 2025 03:25:59 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47030bd42sm2093511f8f.5.2025.07.04.03.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:25:59 -0700 (PDT)
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
Subject: [PATCH v2 11/29] mm/migrate: move movable_ops page handling out of move_to_new_folio()
Date: Fri,  4 Jul 2025 12:25:05 +0200
Message-ID: <20250704102524.326966-12-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704102524.326966-1-david@redhat.com>
References: <20250704102524.326966-1-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: uY60XAQXvP-Et_gJkcJcQP8FU56zwOxDObVTFP_NZzc_1751624761
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's move that handling directly into migrate_folio_move(), so we can
simplify move_to_new_folio(). While at it, fixup the documentation a
bit.

Note that unmap_and_move_huge_page() does not care, because it only
deals with actual folios. (we only support migration of
individual movable_ops pages)

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/migrate.c | 63 +++++++++++++++++++++++++---------------------------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index d66d0776036c3..9a63bd338d30b 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1024,11 +1024,12 @@ static int fallback_migrate_folio(struct address_space *mapping,
 }
 
 /*
- * Move a page to a newly allocated page
- * The page is locked and all ptes have been successfully removed.
+ * Move a src folio to a newly allocated dst folio.
  *
- * The new page will have replaced the old page if this function
- * is successful.
+ * The src and dst folios are locked and the src folios was unmapped from
+ * the page tables.
+ *
+ * On success, the src folio was replaced by the dst folio.
  *
  * Return value:
  *   < 0 - error code
@@ -1037,34 +1038,30 @@ static int fallback_migrate_folio(struct address_space *mapping,
 static int move_to_new_folio(struct folio *dst, struct folio *src,
 				enum migrate_mode mode)
 {
+	struct address_space *mapping = folio_mapping(src);
 	int rc = -EAGAIN;
-	bool is_lru = !__folio_test_movable(src);
 
 	VM_BUG_ON_FOLIO(!folio_test_locked(src), src);
 	VM_BUG_ON_FOLIO(!folio_test_locked(dst), dst);
 
-	if (likely(is_lru)) {
-		struct address_space *mapping = folio_mapping(src);
-
-		if (!mapping)
-			rc = migrate_folio(mapping, dst, src, mode);
-		else if (mapping_inaccessible(mapping))
-			rc = -EOPNOTSUPP;
-		else if (mapping->a_ops->migrate_folio)
-			/*
-			 * Most folios have a mapping and most filesystems
-			 * provide a migrate_folio callback. Anonymous folios
-			 * are part of swap space which also has its own
-			 * migrate_folio callback. This is the most common path
-			 * for page migration.
-			 */
-			rc = mapping->a_ops->migrate_folio(mapping, dst, src,
-								mode);
-		else
-			rc = fallback_migrate_folio(mapping, dst, src, mode);
+	if (!mapping)
+		rc = migrate_folio(mapping, dst, src, mode);
+	else if (mapping_inaccessible(mapping))
+		rc = -EOPNOTSUPP;
+	else if (mapping->a_ops->migrate_folio)
+		/*
+		 * Most folios have a mapping and most filesystems
+		 * provide a migrate_folio callback. Anonymous folios
+		 * are part of swap space which also has its own
+		 * migrate_folio callback. This is the most common path
+		 * for page migration.
+		 */
+		rc = mapping->a_ops->migrate_folio(mapping, dst, src,
+							mode);
+	else
+		rc = fallback_migrate_folio(mapping, dst, src, mode);
 
-		if (rc != MIGRATEPAGE_SUCCESS)
-			goto out;
+	if (rc == MIGRATEPAGE_SUCCESS) {
 		/*
 		 * For pagecache folios, src->mapping must be cleared before src
 		 * is freed. Anonymous folios must stay anonymous until freed.
@@ -1074,10 +1071,7 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 
 		if (likely(!folio_is_zone_device(dst)))
 			flush_dcache_folio(dst);
-	} else {
-		rc = migrate_movable_ops_page(&dst->page, &src->page, mode);
 	}
-out:
 	return rc;
 }
 
@@ -1328,20 +1322,23 @@ static int migrate_folio_move(free_folio_t put_new_folio, unsigned long private,
 	int rc;
 	int old_page_state = 0;
 	struct anon_vma *anon_vma = NULL;
-	bool is_lru = !__folio_test_movable(src);
 	struct list_head *prev;
 
 	__migrate_folio_extract(dst, &old_page_state, &anon_vma);
 	prev = dst->lru.prev;
 	list_del(&dst->lru);
 
+	if (unlikely(__folio_test_movable(src))) {
+		rc = migrate_movable_ops_page(&dst->page, &src->page, mode);
+		if (rc)
+			goto out;
+		goto out_unlock_both;
+	}
+
 	rc = move_to_new_folio(dst, src, mode);
 	if (rc)
 		goto out;
 
-	if (unlikely(!is_lru))
-		goto out_unlock_both;
-
 	/*
 	 * When successful, push dst to LRU immediately: so that if it
 	 * turns out to be an mlocked page, remove_migration_ptes() will
-- 
2.49.0


