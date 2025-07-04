Return-Path: <linuxppc-dev+bounces-10117-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5555AF904D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:29:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVHB18ZRz3c01;
	Fri,  4 Jul 2025 20:29:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624950;
	cv=none; b=RdLFkAXmH5g1mZ2orkXTArJVxpDqZHDqRyPyw0c4nfd3q1pO+J3hOc2pr3fTB2/JMRhgnJq0U14CWyXGE6g/hXPuAji1KrsQwfwoZTjlW9msov53pUIBrerizwh99w8Wu9nDV+8Dtldp88ca5lO5FNybfTdeOWqvE6BsatMOCF3obrBMYpWYZlGB9kjadlYetIkalvWaNOrs63Bu4ti0TRBB3PpjWmnf251D+XJtVp1CTkCs1Q7ASIgh4KbVUGOGyCdbqqhvb5aKiJqWdfDlirYjUNIC0JfODO40ybY6fP1mE6xmR/BUqYtZ3j5FRQhBvQWE/lgWHQKr87+eabbMjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624950; c=relaxed/relaxed;
	bh=yV5TxHJVxkcIeudKWCbk5OXSzT/72+A13Qm9FGClEWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=gG+D6PIPUUQl4j+ZcVTKyFM/l2D4fgrafv6SIEAcUsKLZTBGAow5/blQzHCodAReeatXs2o39EO7emrC5NgJqTz4XR2rRLB7wG0V1HO17La8KEZysaOAnFqokm/TOg/3z4U8fH6DO97ZB0rTxu7BjGX4a0kLLuwSeS+6Atnmp+kIkoVF6R7vimkDCHgeHSJCUFk7Q7k1y1JV+a3rar7Ta0zUGr7w1/OQ2SJsYLCD6AX4NyVKFZ5IL88136/MP4dXO2N49ivfwNOnWeW+0+20O8kzzjsSIqu2WqvMFyM8yEoqYvEKzQDSFSz6m1AvofM8fLVm054g9re4SNmkttplLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hHdMWqNP; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FyRyFt3x; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hHdMWqNP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FyRyFt3x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVH91YGDz3c00
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:29:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yV5TxHJVxkcIeudKWCbk5OXSzT/72+A13Qm9FGClEWo=;
	b=hHdMWqNPR2tJaxoA9/iaq3IK/bEmCuYazmqKNHkpbzsd7u7IttqoEG4yzmtU9pD4xy6dZO
	CC+vtUFlh67aJ+mbVdEsQF9lqDWuufN1O0SQuQ6457O5aUaAU0kUmcXVlmOlFcgzDev+OK
	ZtEWLdE2/nUcAAPtvlBhZmKTUYYOqh4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yV5TxHJVxkcIeudKWCbk5OXSzT/72+A13Qm9FGClEWo=;
	b=FyRyFt3xKFOmXKZdX8gqDagNQGO7gjQfdmj+ttPL17SvHEZks4DAQYXlhxA5yT7oUeiVmF
	qtW7j0dR2KLqDALH0EsMm5LK6PuzcAcZ4+ngjzQRAKLzf11KNArq70F/MvOAq0sWK26dNs
	O8OaX2XHTJeByGJ/gcNYZE2FmMC1eO0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-yldj-5rxN_aDTbRJ6ZPPyw-1; Fri, 04 Jul 2025 06:26:27 -0400
X-MC-Unique: yldj-5rxN_aDTbRJ6ZPPyw-1
X-Mimecast-MFC-AGG-ID: yldj-5rxN_aDTbRJ6ZPPyw_1751624786
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4532514dee8so5054115e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624786; x=1752229586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yV5TxHJVxkcIeudKWCbk5OXSzT/72+A13Qm9FGClEWo=;
        b=gBw8fT5bqh8oZRmuSXwjYpLqnR26jI0WZsVKZyeoah7h3eV1yueCng27nwzO36TzjY
         3EBNN509z08Myr0p0uG5n/bPVnqc4KFrp3x82WNeYz1f9EqMcN2l+C+TCfO/ylTTvO22
         zMQIt8DXnBR0mh1gf15QhgapUOZl8/Kql2t3lsQVE2gWaQhA+bhmiC63ujrPcRracNuH
         3jpdZtpPkA2xIApK5yzEzypsbKv+degSvjw5TM7i46QYP6ZvpkaHZjRZHb0US6aFBifd
         mDghmznGuTR6rkMLZ0KmYgUtu91HmSE02jx+/gjKvfA70DtlgPGun8yEcDAyYD8fMOpy
         HZfw==
X-Forwarded-Encrypted: i=1; AJvYcCVJaYMKmVgtmrx01UasicJjSQtVTPVYSVhh+htSrwNv7XRM161zfD+VCFMvg0tTGOgWp/qmeWRkbvZ+iB0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzkvooqdAsVxlzvNAMemKfUy1bMzoaALm/d/tg5JSQ5bA3wChz3
	SAiVECypm0dBOBk13J7KMI0RW0M97jUIp1/tHSlmvJUsuGJTcIlOMe7PgIgOD7KDzu+avkZzreS
	W0SrUcQ0gTO6gia1fnGy7zRhpCixUje3rQnzP1DrG+0IO3/NP20B1j2fi514mWm9TyLA=
X-Gm-Gg: ASbGncv89hFnZcSOMIMgFWtGt8NzVX/NQFN2AFk+mOGxcytRkfM4BhxOtcreQHVCwOg
	wjDNLWuR8pfwoKg9/yLDvwJNg1sv26Efgl65AWfb/C8uX+zViX4ed8bFZmNrJrqJGOHr6fB2OjP
	043ywh5jQrDYi/DeiIBh1sWGmkO2276eWQfAIpeVaYFqzZ4vPom0bi30pQVI+0z/thDPmwWfpsb
	efwqGamUH6AiQQStzaqVRWPvImeIZMBAhtloYwH0ynPTkDtvX/HhL5NHivJIvU7MOLv0H5tRXog
	WcZeZDnv/a3kivYuYTOsYAq8N3yeynMEZ5JKqUTS1WpL8aTiDr3NCiLcHmyiI7/v+xbsKXkA1Yj
	0dYP+5w==
X-Received: by 2002:a05:6000:250f:b0:3a4:ebc2:d6ec with SMTP id ffacd0b85a97d-3b4964f8b3cmr1912150f8f.14.1751624786306;
        Fri, 04 Jul 2025 03:26:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYzN00fFm73NixytzJyssEXPIKOjCSlRb2NM6DBPHsu+yzHnAEmiJul0LvFdC9y1xbNexZhg==
X-Received: by 2002:a05:6000:250f:b0:3a4:ebc2:d6ec with SMTP id ffacd0b85a97d-3b4964f8b3cmr1912120f8f.14.1751624785787;
        Fri, 04 Jul 2025 03:26:25 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b4708d0aebsm2166371f8f.37.2025.07.04.03.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:25 -0700 (PDT)
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
Subject: [PATCH v2 20/29] mm: convert "movable" flag in page->mapping to a page flag
Date: Fri,  4 Jul 2025 12:25:14 +0200
Message-ID: <20250704102524.326966-21-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: EeN5Ridozjz5Ef5VU1H5qi0fRNQtO8StXMAf39-OsFc_1751624786
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

We are reusing PG_uptodate, that is for example used to track file
system state and does not apply to movable_ops pages. So
warning in case it is set in page_has_movable_ops() on other page types
could result in false-positive warnings.

Likely we could set the bit using a non-atomic update: in contrast to
page->mapping, we could have others trying to update the flags
concurrently when trying to lock the folio. In
isolate_movable_ops_page(), we already take care of that by checking if
the page has movable_ops before locking it. Let's start with the atomic
variant, we could later switch to the non-atomic variant once we are
sure other cases are similarly fine. Once we perform the switch, we'll
have to introduce __SETPAGEFLAG_NOOP().

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h |  2 +-
 include/linux/migrate.h            |  8 -----
 include/linux/page-flags.h         | 54 ++++++++++++++++++++++++------
 mm/compaction.c                    |  6 ----
 mm/zpdesc.h                        |  2 +-
 5 files changed, 46 insertions(+), 26 deletions(-)

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
index 4c27ebb689e3c..5f2b570735852 100644
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
@@ -1133,6 +1128,45 @@ bool is_free_buddy_page(const struct page *page);
 
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
+TESTPAGEFLAG(MovableOps, movable_ops, PF_NO_TAIL);
+SETPAGEFLAG(MovableOps, movable_ops, PF_NO_TAIL);
+#else /* !CONFIG_MIGRATION */
+TESTPAGEFLAG_FALSE(MovableOps, movable_ops);
+SETPAGEFLAG_NOOP(MovableOps, movable_ops);
+#endif /* CONFIG_MIGRATION */
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


