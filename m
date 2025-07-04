Return-Path: <linuxppc-dev+bounces-10095-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E64F4AF900B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:26:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVCR6VSPz30W9;
	Fri,  4 Jul 2025 20:25:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624755;
	cv=none; b=obLPs77NV6GKcXqM1Ew3RhxFcXu0YhV/wf+vh4kjT0eyNc5C2K23jVDkGhN/EpHfy84UwQSOLucWRGfrySDISQ7ZHhS5Jqnsw2ob3rkIKf1g5CmU6GhC29dC+UGZ9Jm3TJwjLb0GZbWle6+pLCxGJavnJ9WTnSkyHHmu3ja/dTJXAsbI6F1fVUSmWqTE4toebp1XO47AD9s22QPB1382m5olWCUOkqVkRjSeg9w+tC4j27ymr5xGTBviZ7QlFk6hjQoSRQt6k3fYdEcqOrKpTK9hSoolCjclf1J/HeQE3pnDQfS5GHPOeXNfpmOUcIStBXhdsrAP+6/EKej1Bpxq9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624755; c=relaxed/relaxed;
	bh=2hFW2iBTC0y3bbUq+s26fylaJsmqdGOzvykr6tgw4lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=bZZakudxYs06br52nQl60dSurzBfaQr9AgfsrClst5K57Qq4aWL99ckIVC3cR9k1eNJIelrt3vAZxhFPCQpk6qD069619tkhwM01FamkZaZJ72qGWTrBW8ThGrcak7TucT87IWuKzF6+5hJhf4HNQIz1CsrOg0tV1hVJPvHd2g4pPqvEFg3JJ4t0n+GoC6UG4ARATznI/J16J3OdbTZ531g/8nZ5wm+tVpuUNY9CBoky1ouD0dICSXPLTJUTxlJfSNPBY6PGOv89a8hYOlS0YttB+i9x1cK0sF+mrJxzQX2Nmyx9BRs7z95zNkYzGYA/SXdB4oqoCrWoXHp9RiFINg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fn6/0ETW; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fn6/0ETW; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fn6/0ETW;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fn6/0ETW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVCR0sYVz30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:25:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2hFW2iBTC0y3bbUq+s26fylaJsmqdGOzvykr6tgw4lA=;
	b=fn6/0ETWPB2xcCnDIKCNr1dHPQKlEmYNFbCIUtnFimrnol4YKq87tMdn+BZcB7UVzwEZ6G
	1nhJqOEdze4sZCGkH77VyhrxhbabbJIZ73FDlEdUk2c2NtgoHRMm8UsirWXCylo/DTNP5C
	6Wqs02qq9eZFT4A441y0onHPM/HzbA4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2hFW2iBTC0y3bbUq+s26fylaJsmqdGOzvykr6tgw4lA=;
	b=fn6/0ETWPB2xcCnDIKCNr1dHPQKlEmYNFbCIUtnFimrnol4YKq87tMdn+BZcB7UVzwEZ6G
	1nhJqOEdze4sZCGkH77VyhrxhbabbJIZ73FDlEdUk2c2NtgoHRMm8UsirWXCylo/DTNP5C
	6Wqs02qq9eZFT4A441y0onHPM/HzbA4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-tTLICLJpOvmn0cAH5w1hjw-1; Fri, 04 Jul 2025 06:25:49 -0400
X-MC-Unique: tTLICLJpOvmn0cAH5w1hjw-1
X-Mimecast-MFC-AGG-ID: tTLICLJpOvmn0cAH5w1hjw_1751624748
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso4597485e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624748; x=1752229548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hFW2iBTC0y3bbUq+s26fylaJsmqdGOzvykr6tgw4lA=;
        b=Txx2RRhmn09hZQTju5c4uMwUOsK1OpUWF9PM40dX/dmtr00Ccn5SNUuq/RzA8Uu2sw
         92MnnjeI1vYj8pcz/CVJRPosdmXFsrd8kXDKhbYa49+DMw93pTg4k12ldaJ3dSDADquU
         knlMVdvyuPyIpN+ATm6cdBHuWzvl2tv4x2GjZIAtuwjcb5QXcdNGavuT7PpcTZb9xOXX
         CV6/Jg/GdJOKTYXHBETpySXYtBuTgT2LkDzlBw6PdE8oiRhwMUUDP5Bf3/Mg+P2eJuRF
         Kixlq5AC9jcRpwCNnoarLJFCA4c+195lO0u+OE5V0qrn9DIZQ3nHxQcFStg90JZX0GJt
         VKSg==
X-Forwarded-Encrypted: i=1; AJvYcCWvW+KxSd71f58kIfJMzrgfrfbdLpy+a6vUY9IUix5Hi4703ke4Z4ERDYMua6sxIJ8wJ5g0ZrFTlrTfook=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxLAjndcxGaGndnYDusVdjmeMpwI5jD9j6WlMQnBQjzANU7K7DI
	AdusriepM/o+H17qdj9IXcqyNK9TtCdg80CfwbWfzWnY6EWct+JnLXU+nEPLtrer/jQLDUuVDu5
	gRaDygOdWhXb26s6tQw+GzyQqqx0W4wa4T+dZjuygrN1z2DyNalf31wwwQX6EkfBYfF8=
X-Gm-Gg: ASbGncunRBqm10P+iONYKPvbAZIybBsTfMplYzEf5zy+jNicXTHxhbEqWvis0Or3B2Y
	wJFhKsliBITPYtYykoqDOyOsgCGsO7Rtw54BOc8Zd5zWmj9ME6K2SAy5xpiE3y2RXUOUv0APP80
	tbTOyeaDOv8YdZ/qyT4+Sz1+w7UwzE8vV84G5q+AKFGLvB3uuVpd01JQ1Xcw3CWXLi/a/rNDmJa
	A0wqlTrqXLEtz9rKa53vG4oUXlhHZ7LVc4SD981J8Fr8TXtfQc3eOQaqDjHc5wWq74WaIT28p7u
	15FJzTd/kKEMAJU+qoFDwO8h64I2toxj44H64/TpO8mVAaW/h47oq6AlxCVjqg0R9tTBdVtebND
	4dAtVkA==
X-Received: by 2002:a05:600c:4fc9:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-454b3ab874dmr19032595e9.3.1751624748160;
        Fri, 04 Jul 2025 03:25:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYcpd9SFcoaWfQeqRe14xBG83tSrWUHlht+bCd9eNO7YiXJuE62xvkx/e2Wc1s4dDi7NCxDg==
X-Received: by 2002:a05:600c:4fc9:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-454b3ab874dmr19032085e9.3.1751624747587;
        Fri, 04 Jul 2025 03:25:47 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454a9bcef22sm52038125e9.19.2025.07.04.03.25.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:25:46 -0700 (PDT)
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
Subject: [PATCH v2 07/29] mm/migrate: rename isolate_movable_page() to isolate_movable_ops_page()
Date: Fri,  4 Jul 2025 12:25:01 +0200
Message-ID: <20250704102524.326966-8-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: -q5jCpx9tkjo8u-WQx-KUGVmJg1X4dE9BTZC6dPUS0U_1751624748
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

Note that we will leave anything that needs a rework (lock, refcount,
->lru) to be using folios for now: that perfectly highlights the
problematic bits.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
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
index 208d2d4a2f8d4..2e648d75248e4 100644
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


