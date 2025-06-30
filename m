Return-Path: <linuxppc-dev+bounces-9901-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E92C3AEDDFA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:03:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5rd1Hjpz3bnB;
	Mon, 30 Jun 2025 23:01:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288481;
	cv=none; b=JfE9BWpUl8E8Whl5+Xj6UGzGG9weYXzZFZrKcqj2HBe6O0tKokNUHhPkjSWgrbb8uhlp/cbtAHJURXMCNHrCmAuyxIlRLg4BApp28ju2CPue2hmgR4a6XKCtKe02LuZ1OJ6WUWTI8jbosiZ4USQOR3xkEHCeHjyWnOxWs7Cp3FFkmaLWQapx/M/ZCi70pldHtMq2dHLuyl/LaHZkiNi8QMbJIiz+7q7gnmOFjwlC15N2wOD0rn+5jr28leo89qRnE/mSq2585ILQnSTCrzrPH4c+sWZ7MP+dBoW6WELU8A2LzWjYvnjWMX41oce1ZcG0TpCM1UvxwoG4RUX8FL+7pA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288481; c=relaxed/relaxed;
	bh=5CWZGmTCKoL1hvQ/VyDOYb4tfyG8bAvHTQtdKrki7q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=IPDu21tXbLpNdUdmS88SvN5gQL6fydOVs5fC9vw9D9mHXUiNgOl1HR+nDe6AcdGFIZh2gemKrXqpGF5OemoKXivS9qY1mVbdkBFmubsVlHolujiXLH+wToK57zcsByNi7jVMeQ7UPPtdgP6R1wLTe+uovjZ+3dPDmJrR5VvjA2T3sG/zEIzjDMl4nK13PZUyUmeiddbekMv6A1oPLLD7H0ODuFBcBsLQ79Ft+hkQmgc3a5A/untOe6dDC95zhsiV0LKtHe9jnlTGB40gLRiqLuKEiixsPSeOTCQpcsGz62kiIN9I9kDsODxwq0/tDTdqtGrBfe2qhYaVkIm59vNEZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N8zTC3l+; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HMTsMpYi; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N8zTC3l+;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HMTsMpYi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5rc2Sz6z3bmS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:01:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5CWZGmTCKoL1hvQ/VyDOYb4tfyG8bAvHTQtdKrki7q8=;
	b=N8zTC3l+8QHDSP9bDRIP2LLo0VbilUKIRbY/tza19eHx9dqVufFrMx15WKa099irGN5MtF
	VuQqYQ/8FN5WR23C3/sS+TGu4B41abjwgY21quVrDBnw13edaXvMXXcpFRUZ9h8aMokImz
	785n2A6K7JOu7TniW53shHcpmd9JYtQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5CWZGmTCKoL1hvQ/VyDOYb4tfyG8bAvHTQtdKrki7q8=;
	b=HMTsMpYiNcaQueCdkm4JXPw9HrYuTxL3d6FGf6jTmugUIWhT70XofYyDyJSxn0O+Pjwa1N
	JKvauheZdK2OpWQMQZ60+5001ht9QCTC6FSzh1SBDAU9DHLEMP5ExsJMalWcqXEQKCerNF
	LhRnzK1CJ7hA83ljxT/3PsNeqruttsc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-PnhUH-aQMpW4RfmpI5nCbA-1; Mon, 30 Jun 2025 09:01:15 -0400
X-MC-Unique: PnhUH-aQMpW4RfmpI5nCbA-1
X-Mimecast-MFC-AGG-ID: PnhUH-aQMpW4RfmpI5nCbA_1751288474
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4e713e05bso954176f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288474; x=1751893274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5CWZGmTCKoL1hvQ/VyDOYb4tfyG8bAvHTQtdKrki7q8=;
        b=IF7E5M4JRaIYH/jwgMKOMxWnSS0+73j/QcDuQ+xPVDR342KXWvXYF/rnwVfW+tycHv
         NykcwRp8w/QuTxSAZHK4mjfVJblwXOoGdMSV948z8amZvQm76/aJNrinWdJ+HCY+AkfD
         bKDMN3NKRzCvqHfEyFYbNk6dZ/eLGM1ajTGBdXI9yT70DNrUlBHqpvQupeooPHni2WvH
         sH4a9k9X9spVBAKolVllnebZFjHJ0ozJjMe5w9CYKf3NEWL9z34NTJjz2iiCWVbfW047
         bnk9rm6feXSvc6WrjQ8KzEOpqEKmvNx++J1/NUnMeUIFsF+QzVrIx1nli55nSXWxCL+A
         0stg==
X-Forwarded-Encrypted: i=1; AJvYcCUcGlO7QIM+C8xyyYHcKfqJq4sf8+BDtsSfpZCZJBdlyBCIroas22pv5Ou+zE3IM1B4LmX9JvLJyOF0/5c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyMLySWKg7sJx4dp5P2DNRbZYNWl2rlbsQKnwSorx6ZhoboOeqo
	F350e1nYAHT49ocwhU25oMbfvm0opxpNLmD7t8VcnCqBb6Fj97XEtYP6YrsaeAHOY9HDnc5Ix4G
	g0AYaaCOjyHhoXy/OrrDEa8bvdvl3ec3L4GFIsGRjX4wpXZzWKQvw4tMa9b31kTY62Iw=
X-Gm-Gg: ASbGnct9ALyp37MNGUA6bq/C8P8hwFO4jYB0fOfEWNWGq7kGWgs1HzkGn7bF7FEA63a
	HUcxGgKTRNEEq9hrM5Hg4sS3XHdn37mfWwGqPQ7TByMnrJ24o/hiax0Zls37r5SyBjmuuKdl90f
	sCoo8739B+IeHpSx1Vb8xOQ4TTMx8ep+bIVsVWfi+u4kzhZHNeSJe02irAT+w+Pi+otvyC7GLuP
	4X9qIF1thkePXKJlRNS8QBqc9NRU6dsyzcG6AoNffD5gp7MH52xVQWv6swdSvImaWhiSjHZGF62
	UjlGGZ4aHW9Zl9AHuI5fLNvUbziGOWHhpJs9woQ8oXij9Yoz9jHWigeJngdlmU8gtsJk2SbaEP+
	fIJNUw8c=
X-Received: by 2002:a05:6000:2389:b0:3a4:e54c:adf2 with SMTP id ffacd0b85a97d-3a8f577fdc6mr12847911f8f.5.1751288473217;
        Mon, 30 Jun 2025 06:01:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ/9NZM6h/Hx4c51fxjBgSM5e1fSGf05yUg5gzNhGMoVHxQHOqc17Ov8/o/Ak8l4p0X+gKZQ==
X-Received: by 2002:a05:6000:2389:b0:3a4:e54c:adf2 with SMTP id ffacd0b85a97d-3a8f577fdc6mr12847789f8f.5.1751288472235;
        Mon, 30 Jun 2025 06:01:12 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4538a3fe592sm131954105e9.21.2025.06.30.06.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:11 -0700 (PDT)
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
Subject: [PATCH v1 20/29] mm: convert "movable" flag in page->mapping to a page flag
Date: Mon, 30 Jun 2025 15:00:01 +0200
Message-ID: <20250630130011.330477-21-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 2YkWafutH-hhUCsYOySKt7Tpm2wK82Z-ynUYTG1rfeY_1751288474
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

The flag reused by PageMovableOps() might be sued by other pages, so
warning in case it is set in page_has_movable_ops() might result in
false-positive warnings.

Reviewed-by: Zi Yan <ziy@nvidia.com>
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
index 6aece3f3c8be8..acadd41e0b5cf 100644
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
index 348eb754cb227..349f4ea0ec3e5 100644
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


