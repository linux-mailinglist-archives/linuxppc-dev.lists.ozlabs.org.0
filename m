Return-Path: <linuxppc-dev+bounces-10105-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 732E9AF9027
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:27:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVD03Ncyz3bpP;
	Fri,  4 Jul 2025 20:26:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624784;
	cv=none; b=T8OxI01pUrc9XH3LlrDnGEWK3O57fEZV1zuQNT08h2kiRC7+8sWJLAG/6tZQC3paLUYHcfxkwl5Rl9B10f3C801X6Wlkm/Qk3xfpbjNSUt4QEjRgGSK7cUsLP1nzSPKY7Qla53nJ7u8mKgGGU0B/zBP0YJYlFrox7YL0tm3IYdRgkTkjKbP/umFNexut635vMLF/GsVXUAh/3CP7L5gUh0PXcF+KNtC4mMog/8uBYS6c7gbjpjBSeIHZFzC51oMxPghBlxo40jzXvc5B0bRq8Mf3JwkU+zunY7SeNUZ1tI4vw64+jYMhlL62ZhF7wh9+KpyCH5jZzPJV5X/mnxx2Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624784; c=relaxed/relaxed;
	bh=pR0cJEJLX/Xckea5AegahrKaeIbiLpLeDpONSEjx7tI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=MkC3MWEc6xi64zRgoiMwUEkvbT/6YXkSAOnzEfy1XeFu+IkAA7+io+C7KoW8tVwmRn7LQpTHABF2fqPKixSu759H9JEWoX2m/4j4ypuBVU4Ak81HDQdxwQO/zdEJXrTWa0dibPWcR3i2ElJFSx44bYnegDGcmRSXr9Bcv92M1/6UTMopPrUnewwAKzfHyGSVynsZhVWV6Tp/QodN9g42zu6cwpwdBxETO1GRumod0JX2VJrAVOL45Nm4S+GXQ7sRGTzYgI+wIjSm9YOyFjA7gxdsFU4wiQmr7Lk1CIsctd8H74IGDHy4hZE4N+MwEn65LEMTlk1DuWQhIj3T2WIf4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hl1oMknE; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hl1oMknE; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hl1oMknE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hl1oMknE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVCz3nTWz3bnx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:26:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pR0cJEJLX/Xckea5AegahrKaeIbiLpLeDpONSEjx7tI=;
	b=Hl1oMknExCGhyXUrlqfXk62JG+XPhQ2KiEu9hZqVf3BarLQ6UGdJ1z8CnckeJK5NobDUlt
	urNgVQLVwTFyAcsCKd/uaHhftzQwTadqX14PClJBB5Ts0AZ+Va89oJMuns8dWcxR2u9yIY
	26UYPY2dPow0rtGxl9SMPEruG4z+3xM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pR0cJEJLX/Xckea5AegahrKaeIbiLpLeDpONSEjx7tI=;
	b=Hl1oMknExCGhyXUrlqfXk62JG+XPhQ2KiEu9hZqVf3BarLQ6UGdJ1z8CnckeJK5NobDUlt
	urNgVQLVwTFyAcsCKd/uaHhftzQwTadqX14PClJBB5Ts0AZ+Va89oJMuns8dWcxR2u9yIY
	26UYPY2dPow0rtGxl9SMPEruG4z+3xM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-uunt8tRsNXi8s9V_3bEm4w-1; Fri, 04 Jul 2025 06:26:13 -0400
X-MC-Unique: uunt8tRsNXi8s9V_3bEm4w-1
X-Mimecast-MFC-AGG-ID: uunt8tRsNXi8s9V_3bEm4w_1751624772
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45311704d1fso4476845e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624772; x=1752229572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pR0cJEJLX/Xckea5AegahrKaeIbiLpLeDpONSEjx7tI=;
        b=HEyTNVWlcKQMkCRAseBkhwPVzKRE+x1EXGfaBjrSESHOW9xlkSiviu+2eKdqfTNzVc
         CfTAMFfUJgMraQmYHIgnPeG6kHB+z6xB2YV6FYg/H0XwJV6x7OVmuoVtOARv5qneJ4UK
         p1ElJpC1+kiinxIicuBXYlTzpKkvIrG1SkYBAYpOFZI+BUa1kl+y4qKOvicfocFbwmp5
         b7RMGeEA832XZiFBOljACticCHeoysX1OuvP+pWPtl93pmv4jl1gjt5pb2maXflyOTwE
         KRayM6awedRDQW48g/RuB510MXkWicCRZMRtQQqF0CqtCO3dHw0oekVioXXMT1M5diti
         i1aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrrVpJ+H4OiuUEgdk/ojQ6ZYwDNLuqJwjA5WbDnj99ABoQm6MEp5HVTJHrONmLQB+bF47PQzws9C018/4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxrpdC0+kFLKQeSOUOaxo0MxkrBprm7V7l67L5rKpLFfYSXGS3c
	3/5kgicH5dUC/V21mgTYt2lcQOjM1QuYTxM7UgLkiV6WMznW+65gCw9/17i1T/BYjFS8OviLn3g
	sQgu4C+T51j3OnoE629foQOyKVoPki0r9UVPps/9t/+GoPx/diqp0mJ87payEZtq4pCw=
X-Gm-Gg: ASbGncvUiDNPe8thbmNstkdrW3Jt6MwB6EpDKKKMB+alJJ7IiGyLMImXdt3C+Hd1oom
	pGN5n45mhOl10TFtqHEFwVutYlZZVIcZnyIvifp5IzhCHBjb4SxVc+jUucLPlMQJXu1X7DGQni6
	VaRsB+klovmL4HmMB7QnncPhC233WMPtC/InBnD/AtM2bd2XDUjfM8/6oQyA6tFlHMe6SQBz3di
	xHGiLlvhAiZGGzAhOCme06wQAF0cpgFTeJGkezRu73Ba2xVQiKMxtBc5oCNWkLwNFKIxKATD6Ii
	6MYndNESk7iC9Uqf1aO/WBqt7W0TbfGHmRZFrWjCORoQ1Q2/HUnBqCK0yHtoEYaKiuWWytyMbU3
	8hHfOAw==
X-Received: by 2002:a05:600c:502b:b0:450:ceb2:67dd with SMTP id 5b1f17b1804b1-454b3196658mr16377525e9.33.1751624771991;
        Fri, 04 Jul 2025 03:26:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp08CEDtezTqVTL+O56wTX6rAd2DO6G5SD1z9P14Ak5Y4B7FcklsRB1svcNIkfJhaHfAdZdQ==
X-Received: by 2002:a05:600c:502b:b0:450:ceb2:67dd with SMTP id 5b1f17b1804b1-454b3196658mr16377165e9.33.1751624771466;
        Fri, 04 Jul 2025 03:26:11 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454a1705ed5sm44913475e9.2.2025.07.04.03.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:10 -0700 (PDT)
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
Subject: [PATCH v2 15/29] mm/migration: remove PageMovable()
Date: Fri,  4 Jul 2025 12:25:09 +0200
Message-ID: <20250704102524.326966-16-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 9XS6N_sjB0rvNY9XdNYK57rRJd6XZVL9TDQSVh3pzrs_1751624772
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Previously, if __ClearPageMovable() were invoked on a page, this would
cause __PageMovable() to return false, but due to the continued
existence of page movable ops, PageMovable() would have returned true.

With __ClearPageMovable() gone, the two are exactly equivalent.

So we can replace PageMovable() checks by __PageMovable(). In fact,
__PageMovable() cannot change until a page is freed, so we can turn
some PageMovable() into sanity checks for __PageMovable().

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h |  2 --
 mm/compaction.c         | 15 ---------------
 mm/migrate.c            | 18 ++++++++++--------
 3 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 6eeda8eb1e0d8..25659a685e2aa 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -104,10 +104,8 @@ static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
 #endif /* CONFIG_MIGRATION */
 
 #ifdef CONFIG_COMPACTION
-bool PageMovable(struct page *page);
 void __SetPageMovable(struct page *page, const struct movable_operations *ops);
 #else
-static inline bool PageMovable(struct page *page) { return false; }
 static inline void __SetPageMovable(struct page *page,
 		const struct movable_operations *ops)
 {
diff --git a/mm/compaction.c b/mm/compaction.c
index 889ec696ba96a..5c37373017014 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -114,21 +114,6 @@ static unsigned long release_free_list(struct list_head *freepages)
 }
 
 #ifdef CONFIG_COMPACTION
-bool PageMovable(struct page *page)
-{
-	const struct movable_operations *mops;
-
-	VM_BUG_ON_PAGE(!PageLocked(page), page);
-	if (!__PageMovable(page))
-		return false;
-
-	mops = page_movable_ops(page);
-	if (mops)
-		return true;
-
-	return false;
-}
-
 void __SetPageMovable(struct page *page, const struct movable_operations *mops)
 {
 	VM_BUG_ON_PAGE(!PageLocked(page), page);
diff --git a/mm/migrate.c b/mm/migrate.c
index 9a63bd338d30b..63a8c94c165e2 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -87,9 +87,12 @@ bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 		goto out;
 
 	/*
-	 * Check movable flag before taking the page lock because
+	 * Check for movable_ops pages before taking the page lock because
 	 * we use non-atomic bitops on newly allocated page flags so
 	 * unconditionally grabbing the lock ruins page's owner side.
+	 *
+	 * Note that once a page has movable_ops, it will stay that way
+	 * until the page was freed.
 	 */
 	if (unlikely(!__PageMovable(page)))
 		goto out_putfolio;
@@ -108,7 +111,8 @@ bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 	if (unlikely(!folio_trylock(folio)))
 		goto out_putfolio;
 
-	if (!PageMovable(page) || PageIsolated(page))
+	VM_WARN_ON_ONCE_PAGE(!__PageMovable(page), page);
+	if (PageIsolated(page))
 		goto out_no_isolated;
 
 	mops = page_movable_ops(page);
@@ -149,11 +153,10 @@ static void putback_movable_ops_page(struct page *page)
 	 */
 	struct folio *folio = page_folio(page);
 
+	VM_WARN_ON_ONCE_PAGE(!__PageMovable(page), page);
 	VM_WARN_ON_ONCE_PAGE(!PageIsolated(page), page);
 	folio_lock(folio);
-	/* If the page was released by it's owner, there is nothing to do. */
-	if (PageMovable(page))
-		page_movable_ops(page)->putback_page(page);
+	page_movable_ops(page)->putback_page(page);
 	ClearPageIsolated(page);
 	folio_unlock(folio);
 	folio_put(folio);
@@ -189,10 +192,9 @@ static int migrate_movable_ops_page(struct page *dst, struct page *src,
 {
 	int rc = MIGRATEPAGE_SUCCESS;
 
+	VM_WARN_ON_ONCE_PAGE(!__PageMovable(src), src);
 	VM_WARN_ON_ONCE_PAGE(!PageIsolated(src), src);
-	/* If the page was released by it's owner, there is nothing to do. */
-	if (PageMovable(src))
-		rc = page_movable_ops(src)->migrate_page(dst, src, mode);
+	rc = page_movable_ops(src)->migrate_page(dst, src, mode);
 	if (rc == MIGRATEPAGE_SUCCESS)
 		ClearPageIsolated(src);
 	return rc;
-- 
2.49.0


