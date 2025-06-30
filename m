Return-Path: <linuxppc-dev+bounces-9902-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE1FAEDDFC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:03:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5rj09gGz3bnr;
	Mon, 30 Jun 2025 23:01:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288484;
	cv=none; b=ZuQbvVYQ/KKcib4v5FPOdTXbgb7EzeZSX+jnFdAc0CF8AHTshLU6V+MLKbhFqUqGkZc7sDoOQUaCLqT9jye+on3Ehd0+DJG0oYhDNLcgdzRQgNLmCeA0QlzgrXOOjOnV+f24fOn8+flU5BwVlf4TX7RkRVoWIFFlI46KgIkuYORMheItI4WcKd3rlztYYLEnHtdZ0cw+jIgAV75nT+HJvFckRn5vniNRxBC89mh9vSYwSbipkP5gFyHvVv68Hejf7YkJfGGtW4l++grqk7GM678LzhROMNjhwlFNp3wBiIzG3EyXUgYOShAQI6zOxTbD0adk72mU1WK0RdZE5CjLbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288484; c=relaxed/relaxed;
	bh=Uh556eqkqkK5IlF5dOoZ8tKW5iYbjU9GjHiIRIfOQPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=GYb0fF0105e7fjVF4z/0P91ZtMYoYlfyzCEaRc5DoavipwA0yt76sekc6s9YT6TBzd9gZnj/ukmPGDEia3aPD1IWPkREPXu2pXCXGFmHgD/IJIbj0c0QV27XUnvSqtOMg6tpBG5SSnD8aA8CrpraWVTEbEAgorVl1AZukH3xCoLmPr4QKGAoYf4/UHKcMc3vvNc2U2HY1P74Hl9x91xcCkTL7jVhmCSIg+rlTc1UyWJS48AAbtBebMQQPw5GGpQpNwDeE8+DPrTAW98KTqs1IXTnzzB++KQvqik+ZN0RWj4jnM6bqrAJmlDqNcV3u9MonBbBd5S0qJJ/kFh3nAaGrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GS+4p21g; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GS+4p21g; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GS+4p21g;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GS+4p21g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5rh1yF1z30Pg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:01:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uh556eqkqkK5IlF5dOoZ8tKW5iYbjU9GjHiIRIfOQPo=;
	b=GS+4p21gSjzKLjVGo9l37mqVgh8fokgtiC9hcjuI10JpFGEARGNq7nFHlvwAYQIeszZyZO
	l/KaIVQiPzg9mj/pmX+Eo+avibLpHUyP8GmbolJRx7RrjjaV9lmgcLFPLahy4LNE34372j
	vzL073nWUKrXfb3BgI11rCKohmDIGLU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uh556eqkqkK5IlF5dOoZ8tKW5iYbjU9GjHiIRIfOQPo=;
	b=GS+4p21gSjzKLjVGo9l37mqVgh8fokgtiC9hcjuI10JpFGEARGNq7nFHlvwAYQIeszZyZO
	l/KaIVQiPzg9mj/pmX+Eo+avibLpHUyP8GmbolJRx7RrjjaV9lmgcLFPLahy4LNE34372j
	vzL073nWUKrXfb3BgI11rCKohmDIGLU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-Aelm3eSON9qg-7BXjh2oNQ-1; Mon, 30 Jun 2025 09:01:18 -0400
X-MC-Unique: Aelm3eSON9qg-7BXjh2oNQ-1
X-Mimecast-MFC-AGG-ID: Aelm3eSON9qg-7BXjh2oNQ_1751288478
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4e9252ba0so1385957f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288478; x=1751893278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uh556eqkqkK5IlF5dOoZ8tKW5iYbjU9GjHiIRIfOQPo=;
        b=KxInmz5tqdBoaKcbwBF6fZGo2H/Q4b30SiYotD2F2Gls/faN405d+OGyn/LTk14c1y
         pryuMThSvNESDSRrbm1ZUsZxSPqsPYWj3Efm1ZHCWo190Y3Ajb7RfYhohQ0y1+qoK3hw
         glEc1lMquDGLVA8ox9lIceEbfFbagBBZwu2JSi3i/o/SW6sAJ2yo0/+4GIs2N8jTlJOi
         H0k9HN6e5OwuTLnNywAqKGj4eZSqgMx6mi7VRFvYPuJfcDnENP6Ofyz57O/MVeoQfMnO
         cvdnovFHaEnXERt0N/h14A+MY9969pUkVIPkZSSZ8PLUEixi+gdn5tY6fH1gZKIpXCMy
         Mm+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPri6ZwRCWtOvrUesNcuKUGnERcIHwbhk5r2bQa30yNH5eSqX6Y0eO3waB7uXXE/SZpZBgyVzAfxA7seY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxNH8eFoTC2fA4Z9PRi2KOhbQoGUmNW4eO6w+Ahxds/++ejVRbz
	GNzVA9wW0LQdOyXLXaXkHIX63hBri3UdgpHFwDrwEbZHpBuf5g5F733j9ek8jADKDstz7jwb0s8
	lR5XbgftsM91QswAnJ+sdDeiORUzIglMAZ5aW3hp3dRWna8AyoPMrPgpFMVpiRefcly4=
X-Gm-Gg: ASbGnctK3gX1YVRc3k7AAnDT6WSz/SsX5JmF9tkIWjU2GdvRwkTMhjP1Vf2nlA+aHDk
	WeuvjX3aZtexPvt8EpjpJ9Lvnkv+osuD6wO/f4/qULhkwBFY5/HrBbBA2fPH9UNTsXch3oI+LUz
	NfEfiox5NzIYr/t58TbXGDLn6VWVUXm2rzFVJK4sUuY2iBIZVvAJ/t0xYTK1wnFV+I6VS5AoTMc
	0pTEIdRcnr6LaTu63531I2ukNqZ1TRFcyszN7DjVIaKWejwxtcqjV8UclIpymkoFvv3BqbNLKyQ
	DDy9HsyKNmIBeMU0EkXFsrtsFjMzgmprONbxCgQeR86z2/uuz8gsdvO5ziI8aEcIfVtIHwWm+fS
	ZhRrHDZA=
X-Received: by 2002:a05:6000:2112:b0:3a5:298a:3207 with SMTP id ffacd0b85a97d-3a8ffadfademr8628939f8f.48.1751288477101;
        Mon, 30 Jun 2025 06:01:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY9r1p0u/0kcCjG+nghTpHrdk2mNLfE9z/HI6liANtRmtIL3dMCa2Pbf5hTgLV/B0o5eULaw==
X-Received: by 2002:a05:6000:2112:b0:3a5:298a:3207 with SMTP id ffacd0b85a97d-3a8ffadfademr8628767f8f.48.1751288474943;
        Mon, 30 Jun 2025 06:01:14 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e52a35sm10528754f8f.57.2025.06.30.06.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:14 -0700 (PDT)
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
Subject: [PATCH v1 21/29] mm: rename PG_isolated to PG_movable_ops_isolated
Date: Mon, 30 Jun 2025 15:00:02 +0200
Message-ID: <20250630130011.330477-22-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: N94brl97Uvytdf88Lc71pCYpufSFwHjZDs4P8zKzFAk_1751288478
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's rename the flag to make it clearer where it applies (not folios
...).

While at it, define the flag only with CONFIG_MIGRATION.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 16 +++++++++++-----
 mm/compaction.c            |  2 +-
 mm/migrate.c               | 14 +++++++-------
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 016a6e6fa428a..aa48b05536bca 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -167,10 +167,9 @@ enum pageflags {
 	/* Remapped by swiotlb-xen. */
 	PG_xen_remapped = PG_owner_priv_1,
 
-	/* non-lru isolated movable page */
-	PG_isolated = PG_reclaim,
-
 #ifdef CONFIG_MIGRATION
+	/* movable_ops page that is isolated for migration */
+	PG_movable_ops_isolated = PG_reclaim,
 	/* this is a movable_ops page (for selected typed pages only) */
 	PG_movable_ops = PG_uptodate,
 #endif
@@ -1126,8 +1125,6 @@ static inline bool folio_contain_hwpoisoned_page(struct folio *folio)
 
 bool is_free_buddy_page(const struct page *page);
 
-PAGEFLAG(Isolated, isolated, PF_ANY);
-
 #ifdef CONFIG_MIGRATION
 /*
  * This page is migratable through movable_ops (for selected typed pages
@@ -1146,8 +1143,17 @@ PAGEFLAG(Isolated, isolated, PF_ANY);
  * page_has_movable_ops() instead.
  */
 PAGEFLAG(MovableOps, movable_ops, PF_NO_TAIL);
+/*
+ * A movable_ops page has this flag set while it is isolated for migration.
+ * This flag primarily protects against concurrent migration attempts.
+ *
+ * Once migration ended (success or failure), the flag is cleared. The
+ * flag is managed by the migration core.
+ */
+PAGEFLAG(MovableOpsIsolated, movable_ops_isolated, PF_NO_TAIL);
 #else
 PAGEFLAG_FALSE(MovableOps, movable_ops);
+PAGEFLAG_FALSE(MovableOpsIsolated, movable_ops_isolated);
 #endif
 
 /**
diff --git a/mm/compaction.c b/mm/compaction.c
index 349f4ea0ec3e5..bf021b31c7ece 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1051,7 +1051,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		if (!PageLRU(page)) {
 			/* Isolation code will deal with any races. */
 			if (unlikely(page_has_movable_ops(page)) &&
-					!PageIsolated(page)) {
+			    !PageMovableOpsIsolated(page)) {
 				if (locked) {
 					unlock_page_lruvec_irqrestore(locked, flags);
 					locked = NULL;
diff --git a/mm/migrate.c b/mm/migrate.c
index c6c9998014ec8..62a3ee590b245 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -135,7 +135,7 @@ bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 		goto out_putfolio;
 
 	VM_WARN_ON_ONCE_PAGE(!page_has_movable_ops(page), page);
-	if (PageIsolated(page))
+	if (PageMovableOpsIsolated(page))
 		goto out_no_isolated;
 
 	mops = page_movable_ops(page);
@@ -146,8 +146,8 @@ bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 		goto out_no_isolated;
 
 	/* Driver shouldn't use the isolated flag */
-	VM_WARN_ON_ONCE_PAGE(PageIsolated(page), page);
-	SetPageIsolated(page);
+	VM_WARN_ON_ONCE_PAGE(PageMovableOpsIsolated(page), page);
+	SetPageMovableOpsIsolated(page);
 	folio_unlock(folio);
 
 	return true;
@@ -177,10 +177,10 @@ static void putback_movable_ops_page(struct page *page)
 	struct folio *folio = page_folio(page);
 
 	VM_WARN_ON_ONCE_PAGE(!page_has_movable_ops(page), page);
-	VM_WARN_ON_ONCE_PAGE(!PageIsolated(page), page);
+	VM_WARN_ON_ONCE_PAGE(!PageMovableOpsIsolated(page), page);
 	folio_lock(folio);
 	page_movable_ops(page)->putback_page(page);
-	ClearPageIsolated(page);
+	ClearPageMovableOpsIsolated(page);
 	folio_unlock(folio);
 	folio_put(folio);
 }
@@ -216,10 +216,10 @@ static int migrate_movable_ops_page(struct page *dst, struct page *src,
 	int rc = MIGRATEPAGE_SUCCESS;
 
 	VM_WARN_ON_ONCE_PAGE(!page_has_movable_ops(src), src);
-	VM_WARN_ON_ONCE_PAGE(!PageIsolated(src), src);
+	VM_WARN_ON_ONCE_PAGE(!PageMovableOpsIsolated(src), src);
 	rc = page_movable_ops(src)->migrate_page(dst, src, mode);
 	if (rc == MIGRATEPAGE_SUCCESS)
-		ClearPageIsolated(src);
+		ClearPageMovableOpsIsolated(src);
 	return rc;
 }
 
-- 
2.49.0


