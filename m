Return-Path: <linuxppc-dev+bounces-10103-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D594DAF9022
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:27:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVCx0dkMz3bnc;
	Fri,  4 Jul 2025 20:26:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624781;
	cv=none; b=GGeXuSA3ANxgDeeVxRIyk6pEuP4Htow5M8ywmD21Krp1WO+iKtMg1lbGahBf+Si2cTg4eF0svPVGHY83ZYxNLrdD+UY7aD9odnvgeMdJutYsuBujSwpErQJ1DLcvWAIFKMG9jv2S7JuHMhrmiosOx4CI6Jo1eNxZi1Dxo+XELuzixaBzZdUvBOGgBYlgwpWzlK0G6FFilKOFnrAWDB2W29KXTaKUAnE5pq6s7ceux8HX69Ru6kMu2Tk8LMLCEGovIesodhZFTIE2CU9pOkR8SKG0ZVZKA4dhDN6bCpa2fRkL2nhQlQoBGLv87K6zWjqhWf8JSKuPrNjeWgQMQ/ivPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624781; c=relaxed/relaxed;
	bh=0BL6qvlJKb8bmxpRl18Ncv/RX/ffBcxhvATfsQs5MSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=hE2QsLEC5YkVeqVrpc2slc+iUA7OB7Y9G7pz83D6FYpM46JmXtTsenpXBRXN6vd/eLcHiC15RmQDdOn892myeGWgiaViw5XEuF+PteXVY9oDHDjJLUJQKGi4wrJfpWdkD7BO1+nwlk3LTfKGYs+VxAbchUiNtDbjbt1GnunEC80VlZwFxKeBAObbpHhGFZ9IBN+KBxxc8aPMdauvjg7QF9A80N2aQbry8icuU2Css24jqKFGoJww6Pl2EKiAlEG8YXcWTtybXe+oBnqNUweowBUy3tMGZHdt3Czb54YUZyih3NI8VyhAQNea0l55YBF21PEOHZQiHTeZR44cj21n7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NUC8qQrr; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NUC8qQrr; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NUC8qQrr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NUC8qQrr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVCv6t2Tz30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:26:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0BL6qvlJKb8bmxpRl18Ncv/RX/ffBcxhvATfsQs5MSw=;
	b=NUC8qQrrM81EJoeis6CCfPY9S9f/ZB0c01SGqA/K8yeMHV9GwOfjCeWwnbuEmm/dC6CpAa
	anUgLOkapw2el+gXKz/xaDiMf48sLpUfKaCRewZCcpMLbGhtiMe6qW7GvauJzQcpuG75W1
	vdI5iUSR4e+AwlUE7Y62AP6my/s6ID8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0BL6qvlJKb8bmxpRl18Ncv/RX/ffBcxhvATfsQs5MSw=;
	b=NUC8qQrrM81EJoeis6CCfPY9S9f/ZB0c01SGqA/K8yeMHV9GwOfjCeWwnbuEmm/dC6CpAa
	anUgLOkapw2el+gXKz/xaDiMf48sLpUfKaCRewZCcpMLbGhtiMe6qW7GvauJzQcpuG75W1
	vdI5iUSR4e+AwlUE7Y62AP6my/s6ID8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-pVTEiEz1NWepisQMZgHK7g-1; Fri, 04 Jul 2025 06:26:16 -0400
X-MC-Unique: pVTEiEz1NWepisQMZgHK7g-1
X-Mimecast-MFC-AGG-ID: pVTEiEz1NWepisQMZgHK7g_1751624775
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so4283505e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624775; x=1752229575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0BL6qvlJKb8bmxpRl18Ncv/RX/ffBcxhvATfsQs5MSw=;
        b=nQb0I77H/ZwpXVjQCsqc1poDuyOT3gaKZUQ4pJRhdl4V8WJk0o+D6+EEdzeE8KbsjO
         59GfhqP+wDpuO7aG/jo00UAdNRRn8mioTIaVQLAa4SNC5QpvaXQCqD94aVJnGaOinvf+
         FC+SAKbbBQMEqkCTzF8dqM4rZN2l4HKvq+q4XAYQN55GjU35/20JdXPBHb7oW6kwBHlO
         /+krHZwPzPnNgSRKg1XvgDzhjlKpw5/wgeEpMG6A0Jh9o7Lue/GhXO9hMHZcAdMjEtNq
         8MeAp0QiQNUUNv5eUcIpYI/u3kygEvf8nsvlhm7TlT/9EwvEq9Djw6DbpUf9Y9MdA/fT
         lqUg==
X-Forwarded-Encrypted: i=1; AJvYcCVCxuTJ2LLX2s7m+EBXFA5wZYHXYlQWJeamimzO1ilV/g8c2AcKSjX20dBaiZ4pqysdVZpWCiF5uzA01JU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy2DBg94qxt1n8/KTvqfGOf9V2PVE9i78txJmaFZnnMfJG9WqSu
	uiuhVv5IFdDrsDeO4Upok8swcuGF1Nwn822HPem9K3n+qzHya2fTY7qsVUCPd1T8Iw4AKj7AePw
	1rbLcWPSZKS+ggvZTK2Y53ssFM7vTtT2Hp2TI8nMT7OgAU/7/WCWfQU86hrvcXCHAfIc=
X-Gm-Gg: ASbGnct2iKU/k9XHQSnBifc9ED8HVmvNTKZakUv9QdXLVXu8Pa0y8rqOZPezP1VULV4
	q8KuFcxQ0yBbGLhouRYtEp+uUO+F91zvlyeqhkPi6GVYi/ceqp8FEn3wuTGqhZfSjEreNkijncJ
	PKJxgJONSD6/4NATlPJ/pJvnzWD/twBM4y/gQjHF/pEkG8fCOdn/I6EuS0GEoiXLhj+Yzum8Qtm
	rGy8t9KPExbMA6JYTIklU8ITnSLn8CoDbOO1mCzMiM+/w6DUfZkAHfCQ7/xCMAGULr8iT7PbDtf
	hHOH9crcF56/95ozTdJ4MkfpSfua7KeInO5G2OdYl7mlGLbcvnKkvpboY0MZ+iYyV45aGaqb134
	RermIHA==
X-Received: by 2002:a5d:5f04:0:b0:3a5:7991:ff6 with SMTP id ffacd0b85a97d-3b4964bc845mr1662801f8f.1.1751624775099;
        Fri, 04 Jul 2025 03:26:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm2OJrY/VRHhz8rrdEvEy9XnpRFVoifs27nJth9wopnF7vUfEB7/wKIPCCX3g/OmgYPHMZeA==
X-Received: by 2002:a5d:5f04:0:b0:3a5:7991:ff6 with SMTP id ffacd0b85a97d-3b4964bc845mr1662735f8f.1.1751624774556;
        Fri, 04 Jul 2025 03:26:14 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b4708d0ed9sm2154538f8f.38.2025.07.04.03.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:13 -0700 (PDT)
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
Subject: [PATCH v2 16/29] mm: rename __PageMovable() to page_has_movable_ops()
Date: Fri,  4 Jul 2025 12:25:10 +0200
Message-ID: <20250704102524.326966-17-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: PLHd7RF8ApEpLrUgu_fxX6_8DCiDfXvetvNdN7KRLTk_1751624775
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
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h    |  2 +-
 include/linux/page-flags.h |  2 +-
 mm/compaction.c            |  7 ++-----
 mm/memory-failure.c        |  4 ++--
 mm/memory_hotplug.c        | 10 ++++------
 mm/migrate.c               |  8 ++++----
 mm/page_alloc.c            |  2 +-
 mm/page_isolation.c        | 10 +++++-----
 8 files changed, 20 insertions(+), 25 deletions(-)

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
index 62d45752f9f44..69a636e20f7bb 100644
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
@@ -1759,13 +1759,11 @@ static int scan_movable_pages(unsigned long start, unsigned long end,
 		struct folio *folio;
 
 		page = pfn_to_page(pfn);
-		if (PageLRU(page))
-			goto found;
-		if (__PageMovable(page))
+		if (PageLRU(page) || page_has_movable_ops(page))
 			goto found;
 
 		/*
-		 * PageOffline() pages that are not marked __PageMovable() and
+		 * PageOffline() pages that do not have movable_ops and
 		 * have a reference count > 0 (after MEM_GOING_OFFLINE) are
 		 * definitely unmovable. If their reference count would be 0,
 		 * they could at least be skipped when offlining memory.
diff --git a/mm/migrate.c b/mm/migrate.c
index 63a8c94c165e2..3be7a53c13b66 100644
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
index b825f224af01f..4aefeb2ae927f 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -2006,7 +2006,7 @@ static bool prep_move_freepages_block(struct zone *zone, struct page *page,
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


