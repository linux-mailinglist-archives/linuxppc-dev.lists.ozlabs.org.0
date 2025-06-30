Return-Path: <linuxppc-dev+bounces-9896-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C35AEDDF1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:02:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5rM5QbWz30hF;
	Mon, 30 Jun 2025 23:01:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288467;
	cv=none; b=LaINLxw/p1fLn/Se7305b+9+3pbHllDmPrMy7BxTA1Ot6SXTWGYoK0BRIgjqXioLK/VO/J7febxn8qAev3hHofpiwvU0Xj8q7WvkGj9/nICF/gnZiWJ5qvzZ1VMTjEf2kWRT1uZ2S4oLLjAVCi0rVEdWrJIMviRMUSpyxxY2KDs5cjc0YhKeaqmcpTUgz4EkIb+IcAu/aCvuWvkKkLqn3RntSMvaAoz0jk6quc4op68w9mdwiBoccR17HGzQwNMZlR/sAoWepSvEOQFhWnwW7jLOIQcwI2wPT6r25EDZc5AK7djC3KD9lWA4z+w0adUe2/PXTdAfkmSpEValjFkvOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288467; c=relaxed/relaxed;
	bh=02uSef5lp6Y5cEfWyIGZlJA9ZbaH5mB3gdVPjlakXLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=aELlN20a0j0nuzUVpAly8wxLNt4UTAD6jwl0cbtd6nlg+pyKMw6owYCWogWne4uLWEEY/AP8VDEamocOSUtURHx96OUsWn6bXMvGr8uPcRiAHAFl7YH0dpuy4M2dBncFDgfLiLKE+7/HjllYsLwnRvgGoy/KwjkeOK9zAIIBecGIOvbRFqm3gOCjXtRxnTsBRhYDe5gx8Xzu15DM9wqJ1pL7EoZmiEXqmYPi/RV1oJTaZh/eOitQFS9fJlIGOG8v0mflNRFBBr105n2ocJClcPnmVUrJLA7m0Rr3Eb5DcwAX+uZDdGzX3dc3PEsPc+/q5wJcPeuZwNSTEqFl4RgafQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KtHfRd7V; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KtHfRd7V; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KtHfRd7V;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KtHfRd7V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5rM0RrZz3bgX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:01:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=02uSef5lp6Y5cEfWyIGZlJA9ZbaH5mB3gdVPjlakXLo=;
	b=KtHfRd7VtBXfa4Kri7Q9eMPqkRaSBKLeQAsMFfsd/NR/prjkV46FanlQRoEOi13Qjqi+Lm
	EVuxaJu0ug8fChLdwZJAOH95F0WiJhWkzBg/4MVD0j7+LSUdRgnudQ/woT9Uk8Me03b3gK
	271ze04Wmbf+Q3d/ucED5qgU/r3fwJE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=02uSef5lp6Y5cEfWyIGZlJA9ZbaH5mB3gdVPjlakXLo=;
	b=KtHfRd7VtBXfa4Kri7Q9eMPqkRaSBKLeQAsMFfsd/NR/prjkV46FanlQRoEOi13Qjqi+Lm
	EVuxaJu0ug8fChLdwZJAOH95F0WiJhWkzBg/4MVD0j7+LSUdRgnudQ/woT9Uk8Me03b3gK
	271ze04Wmbf+Q3d/ucED5qgU/r3fwJE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-JvrTXZlPN9azpOJQmeHfjw-1; Mon, 30 Jun 2025 09:01:02 -0400
X-MC-Unique: JvrTXZlPN9azpOJQmeHfjw-1
X-Mimecast-MFC-AGG-ID: JvrTXZlPN9azpOJQmeHfjw_1751288459
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4535ee06160so16096675e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288459; x=1751893259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=02uSef5lp6Y5cEfWyIGZlJA9ZbaH5mB3gdVPjlakXLo=;
        b=mpFzCYVFa8w0GC5b+i7dyUwDNOq7AObQ2lLleAsRjHfW3sUslbcnfubWdd4vUv04Bw
         xDQ3fxuqbMVSgmRNwOeGbK4RQyvD+Tvqqa/ljK2k3VV6eVXStuRAnnvh3iwwuzUzdKFV
         HFImR0V1hfoz/cVI7eKDnFjCveTsPwmHoytdVwxrHCCe8VanhL3reOGBuEtyDKQq9eog
         jjRTzYjtab6qsSnWjVnHr77jF6aV6aQ2mqWENoOx+QIqIw8T4J+YsjJ0yHu7y0JtcggO
         WlA7hysonTKUr+2TSjIDzxH3gset1OC4d3PENnbf8Q63bvXkHaSnZO5anUE3YSfdMSsJ
         zZrw==
X-Forwarded-Encrypted: i=1; AJvYcCUo3mBVX8/LEbu8/ToZC8CdYizzlwOUijHy60WbKt5AdVj6A/rfbfidOLzOQYxTd1gmOFqRlaPI3mZRZnU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwQzYRiOjmeVBWeDiWvd30qJpf41CmoshHQ/OvyHzMqRtUbATw+
	X4S8ApJnK0XqUrhiKtpdfCOfjVyIgOvO3p6eJcHLKNZ23YzIDMCb3D++CngD4zmyMpSgz9oxoxQ
	dMLOoOoNYu44xbwu0jmIlckPcPi6VOYkBpKUeGD/PL4ahtfb3Ad+JrPws508A1uFrmiw=
X-Gm-Gg: ASbGncuz0B3j3pkPUj3rdw52VqGmQdHq0CUZBbB0dZ7rdRDAjPDHV9mQs5+d1c3dmNl
	mETPS82yJjenapjzKt0kxtCpwRAGtxaRLsdRBfLW5Ux4V3zuQg35rqF7fOB/HOOvg5ll4pTnvhK
	G8awRfjrkAaZQSZaTG0eNGiaLi2NcJhMDQysYqIkn0O6p1AltWYR3ciBHlk6nf5ghcI87TOOidc
	7n8Mv9JI9x0J/uFXQRi4/7NC69pL9VA6CHNRm72oL8+c51pTAs4iCKu9hJqeIKdm0ksJebYtwbW
	fjQy4Wfr9lUxSh0GBgrsDp+/lNP3GWd6EK7BrjIT+EIkGBtaHIqoeUlWziA/rLhil8Aqt0Sb6H+
	07zLyo28=
X-Received: by 2002:a05:600c:a46:b0:44d:a244:4983 with SMTP id 5b1f17b1804b1-4539726acc1mr92868235e9.3.1751288457887;
        Mon, 30 Jun 2025 06:00:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCs0m13Yqq4GukWpM+4uHJmOOd6amI/nvHYcsB4z72aw1swyUlytQ8Ivx43yHYvtcBEII8eg==
X-Received: by 2002:a05:600c:a46:b0:44d:a244:4983 with SMTP id 5b1f17b1804b1-4539726acc1mr92865605e9.3.1751288455974;
        Mon, 30 Jun 2025 06:00:55 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e5f8absm10554612f8f.95.2025.06.30.06.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:55 -0700 (PDT)
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
Subject: [PATCH v1 15/29] mm/migration: remove PageMovable()
Date: Mon, 30 Jun 2025 14:59:56 +0200
Message-ID: <20250630130011.330477-16-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 0n81qboylK8fKofQ2FTkreGRW7dJp4BFHnT9EUTVHAs_1751288459
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

As __ClearPageMovable() is gone that would have only made
PageMovable()==false but still __PageMovable()==true, now
PageMovable() == __PageMovable().

So we can replace PageMovable() checks by __PageMovable(). In fact,
__PageMovable() cannot change until a page is freed, so we can turn
some PageMovable() into sanity checks for __PageMovable().

Reviewed-by: Zi Yan <ziy@nvidia.com>
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
index 22c115710d0e2..040484230aebc 100644
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


