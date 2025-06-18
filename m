Return-Path: <linuxppc-dev+bounces-9464-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E06ADF43E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:41:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrcT4l2Rz3bgw;
	Thu, 19 Jun 2025 03:40:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268441;
	cv=none; b=RqvaJ/3OhDi+E5QBQz3LKo1ZksIYrfOBl0/R8DOGoEu/rs4rAPd6h71SHt16IOkqVL0dDTDUEn0GTxNr4rEyQg+k3NQ2R85AgeBJHdmurz/EIwWK2tbvnBTyapePNNk21mt27Dr7S8yg2J0Mw2fvNVZ+lugjXrwo3p/Qx8H18zXqpawdf7PuowG0QafPgKIF6Bb7KmuaOMKVoG7kW8FP6UUFJAy5h+EsIGkqnC7kTIbAjpQer3yplYv5qwb5XLTg6H4RUBEl9z96xAQHdiNmpgZQlbvRwoFPkF9FzZaLqnb/Vt5QG7hM4Z/04T5jBZ8N+f6OxZ6oZ1WePV1xXpibTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268441; c=relaxed/relaxed;
	bh=cYycAi7wypL2i/sUXw4R4ObGitZAt3xcPvEHBQISmjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Xs84axWqg66pU4dmmIUDyLfgde3blk8HTEMaU/YXCwA8EtmMsBpDGm2feWkhdMrcyJWbMMWoF7PnaAZf2CcJE3o+fmqUDN0SGFICwZ5w0KtlOgpAaU7MUipP6dUeqzoOlqXVCXICRci4bh4YL5cKH3ZkJGUUjQARwCwKiP4dUvremzUVA0F8Y/bjfw7h3EzXVWkabjdDNJBUEkZ5v58C0FbOYslHGztkxEQwJjEXL52vMMr15/ZbcoeOqOh+2bzvLnccWEYshymxfzDLN+LfXaZYfKCN7Wqx0D1iNCrqvboHMSL8lR1I38A9quX4Pc93qKPamyaALn/C4LNWfG41lQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hHIK51nr; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hHIK51nr; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hHIK51nr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hHIK51nr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrcS61cWz3bcj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:40:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cYycAi7wypL2i/sUXw4R4ObGitZAt3xcPvEHBQISmjY=;
	b=hHIK51nrN48PhQZG49G1D40X2E5/kfctRrq5w8Hb8nXf16n7M5/+27PtTt5j/GEf35mk6E
	yhOk3lWPdpH56zkpVE7M7Yxc1jAY2ZyX0kQwohXDs144oEjA72yNr4tavjcnhBCaJcG765
	WLT0C6OejVkT0L1TOZgIqgKJNEufl6I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cYycAi7wypL2i/sUXw4R4ObGitZAt3xcPvEHBQISmjY=;
	b=hHIK51nrN48PhQZG49G1D40X2E5/kfctRrq5w8Hb8nXf16n7M5/+27PtTt5j/GEf35mk6E
	yhOk3lWPdpH56zkpVE7M7Yxc1jAY2ZyX0kQwohXDs144oEjA72yNr4tavjcnhBCaJcG765
	WLT0C6OejVkT0L1TOZgIqgKJNEufl6I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-2sqiiIB7PfCvRBh1OaL1hA-1; Wed, 18 Jun 2025 13:40:37 -0400
X-MC-Unique: 2sqiiIB7PfCvRBh1OaL1hA-1
X-Mimecast-MFC-AGG-ID: 2sqiiIB7PfCvRBh1OaL1hA_1750268436
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4535ee06160so490405e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268436; x=1750873236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYycAi7wypL2i/sUXw4R4ObGitZAt3xcPvEHBQISmjY=;
        b=ihzLEeJ4pVeV3jPPltNduIE+9vbdagvOc6DluyLvrz2YjvFbziipjiGDvTvvqn/tcJ
         kQeKt1W3+m80MfzSEJr9KNXgRh0mlQODcGbJgjnqHc1cfpJIz5GeWMp7sjyr9PCD/XNi
         HLlzaoxtjCi1KNxxWhllZrQEOrshDOOTGdQnErommiXwfwIUBXSvz8H6kiTmStiYvtCA
         2GvKUD7gmo66x8JAaniH3ppbRm9ejtVk9tKhCUN0vYwME3UCG0fbVdBGZL9znPWUnI+u
         r0ciuRExLHUlc2/TlaMJAUkdQQC2q2Cs18KUmAInHAR/nkUeVg4c46yxI3QQq4F63dNn
         RwBg==
X-Forwarded-Encrypted: i=1; AJvYcCWheuuQJxQQXB3EL2xHEPd09hHShl06huSZlM/fGm9MGjHiSuI8tsYO79a3zWOCoqvWW+rSVC27OZzH8yc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwgFGpmmMB3QEbyCKbvKX2dYGtjbrv9rUtlvvFZb85+HEnCrQNK
	Kn8e57HHxuahIW3FYB7EUDkoG/EzyxWEQN027EuMoGl9eKTJD/MWbboQhZhYpH6kH+Zoy7kDyWV
	pHhZJhdOmo87JmnvzN9Pn9Be5vbTB6gB3rmHqRbLSCI+CajbkRfYUu1oGLRFmtqd4W5I=
X-Gm-Gg: ASbGncvZKejr8zchZ5n+riTthC7MntbXyLfFPYXr/AMQGDKaWeImtC4EuQuFfI8HvWo
	TbpjCDP98VPJHKMApqO0RanqntSxlQ1rL50tOlJamTgwe+QDUub5rYgAor2XC56NyUQFxHCW7h+
	bn44LAG6HAWkkG9LBFTPPEvOuwiDW9huo+zUt5jEVP7Ugrm2FN0lre58Z5pdzw4ZAWfTMEUNQYK
	OJZg/1Rpr0Dntf5sbsHkgEX3y+mLUf6IqICyZj9R7DsAcNQL8ZmPIakxWr7eNW0sPWuIxzCKsRo
	tL2Ql5kdRJ8d8zNc0XKQ+fOQDAvAAp0dCJDTdLDXMvUzRhxpPLnOreYc5UX1UlZFG7A7fv7vp/2
	S8vV72Q==
X-Received: by 2002:a05:600c:1c8d:b0:453:dbe:7574 with SMTP id 5b1f17b1804b1-4535018683amr106187395e9.12.1750268435825;
        Wed, 18 Jun 2025 10:40:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUDiWgwWbQgJVHFyRRixono5bEyE4cqQlAJV7lYOWhJt5afQ5kfI4WOQTfix7X+TWBj4ApqA==
X-Received: by 2002:a05:600c:1c8d:b0:453:dbe:7574 with SMTP id 5b1f17b1804b1-4535018683amr106187035e9.12.1750268435264;
        Wed, 18 Jun 2025 10:40:35 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535e98b4bbsm3633515e9.15.2025.06.18.10.40.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:34 -0700 (PDT)
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
Subject: [PATCH RFC 07/29] mm/migrate: rename isolate_movable_page() to isolate_movable_ops_page()
Date: Wed, 18 Jun 2025 19:39:50 +0200
Message-ID: <20250618174014.1168640-8-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: BDV3R8XKQjua8dBvo3Db03-Hu2Yhc-5lyxZBkCp-il4_1750268436
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
index ea8c74d996592..6bbb455f8b593 100644
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


