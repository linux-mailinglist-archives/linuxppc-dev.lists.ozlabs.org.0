Return-Path: <linuxppc-dev+bounces-9468-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 380B6ADF44A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:41:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrcg6FC7z3bmQ;
	Thu, 19 Jun 2025 03:40:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268451;
	cv=none; b=aHk5A7XGv+rceC+fEmfj4E2ndvEYeEi3fecLb25purGdXJsFTXG7TGZHxpZR19eikoTOQoqSmtDgBSj5rddi+kqo/Mgw3nRjMF+EKUp1OXG30McbHhCKi3uCs4IYgHwk6oDmS5lO3UXtkxghOMFF5xvygFURRIRQTXAVgEYpJUI5p6cB1eNblmEWn7tG0oJkJTl+C5bdr6n7tyBOmuAtXH889wAeom85msR0qM65Y5IZ4041dLAmycrKnNIQXyKZTKDyQRhrq13TcYV7ZHDLmWT5o1QT8J2BxzubNuobIA3U5cJK8aT2EgO1DZqPrOLLjOrbn9kAdKmnmpUdS9r6yA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268451; c=relaxed/relaxed;
	bh=fdGmEg3KxJkHEQxrZBJZz4koG+H5rtVXjjGZN1RlWcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=mF05m0tN64tJKE42tbqT6eGa6RGEnrvbWEEOTV8A8gvNE7Gw1jRYyWHaYD5lw1nAEq7gyCOAxnMyR0kWD4rSf5bueM4QSYIEt4rh/glkEWy2ExIzRtIai2DsAiyikLjQxtUmXDf6O+6uy+c688i6idXSt9SzNN5YEp6EbTOnz05hsc0xbswW1zRKW/KJVIX5Qcob7mz1+ru1fRoOzwwmODtauGJ3jOD5beG4k9eyOfZQkYwra9XtzLvjKnFSBlam+DaAkDE3QTcgBOkHtSrBNF6y/LmZSR1QI9YvZ4xLUvVHe2adrX6MtvxmR/MOf0xDRAPjoexT1d7PsVqoO7klEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UCBWO//Y; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hk8dMbJG; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UCBWO//Y;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hk8dMbJG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrcg0Zw9z30Vb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:40:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fdGmEg3KxJkHEQxrZBJZz4koG+H5rtVXjjGZN1RlWcM=;
	b=UCBWO//YBQvFTOCacgbXLmiDLZ8jFmX3FgRYHsgJ4RVQHTPyuu8+pT/Qpn2bfGW9+i8qFM
	R4Fy0FvzboRBdbGiAkTBrk+WjzsNp+rHVTMwH2Lf1GhNvDGibb9tdXYOO76JV7Vyn31H9i
	mIo/5LqTWN9/GzlKklC1kYV5Gm5mfcI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fdGmEg3KxJkHEQxrZBJZz4koG+H5rtVXjjGZN1RlWcM=;
	b=hk8dMbJGGlYwV+8FWY+Gbt00kgyjfmJS9wCG8k3yuns2kj9PXVqQLyYkqnBZNpEGHpG+lD
	Qgf9Nc40nfc0xG7ze8RcDGFIMOHYlN2d+9AxKJrU+b9FPD89zKyNOrI/OsV9DZTJniKRYV
	KscCSoCEeg9jZS/YsQaeVjoBf2M5y4w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-WUQuVcR3NOCvRNjc9e1Bcg-1; Wed, 18 Jun 2025 13:40:47 -0400
X-MC-Unique: WUQuVcR3NOCvRNjc9e1Bcg-1
X-Mimecast-MFC-AGG-ID: WUQuVcR3NOCvRNjc9e1Bcg_1750268447
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45311704d22so46552845e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268447; x=1750873247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fdGmEg3KxJkHEQxrZBJZz4koG+H5rtVXjjGZN1RlWcM=;
        b=wa/JnV0UQWZrnD2jHF3ybU0pkRjfnTwM5ZkhlrVi8RGeHnQwSjMjlHhFsY75ougqlE
         hbzMO+kIAnZ9nrWcZoE3iFxNHzUL/GdiXkNKE4hder8sTKwt0jbaubeuhnrfbSZS/u5u
         jYJ1Cyw9mC98BbYGM/w6b7JF5UYL0OUTlR7v4LLyR7q9gKuotZ3Mr8aVfzxUq1uPcL4e
         1dYPVTp4dQcLp0/YoIE6KPyt4hfFMxlHTUJkaotgVb6ozxiWSGJskBUL7q+SfUieXZ/6
         xYRxT4sJOjnv0A2K5NVUS/0yW+472RGL782ZdndE0BJFJ7l/ZDY5EkeMyo9KK/Mn89xD
         DvbA==
X-Forwarded-Encrypted: i=1; AJvYcCUw9XWZm5fLqyQEPzZxWTsZtG5QSwlaWF28DteIGgC7eeYLpAERjLfUnaRydfbrfr+pj5W4ghSmVXTZm4o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzJhz8fPvyyMNV/IYj58cqXWuIdqWZc5/JjFEkw0eLb8sMdzbb2
	8Z8piJ8UYgxzx5Pf2Rtm+Aw7auS3GP0dNfs2Hof9jjdSLPGsqExEX94+qcjl2uDsSgiR0FhB7KY
	LtLOlkTwxxxZ61sm6CWVRxMxTdZjHnFAY3S942og5teX/s0XjCkt0BCYxycRxKY7nkFg=
X-Gm-Gg: ASbGncuuqysEUPIe0HCkM+B4HtJ04FZ0jzUJJ00ZZ2d8YSfXEJ+aQ/UnkBOKiI73tzE
	NmcQO7wgJBP1mxEbpGNJuYYnqD8RMQSZs4/SG+Sbr4IRrq9akNzixHnbT5G9Wg4vq1P+6MjoRYO
	vHKyjusMu94jBJbyPsNbDCt2lbLmnm9yAa2Hfv28oREEU7EqMblDprXeuhcnNu1xxblHP7OBUp5
	RYt75HGT8fPJbyKqSaYJ8zURd7HbKP/Utn+ulDFYD0Tnh77IMHA1Q0YNFvItzHWqODrUNgeCs3z
	Jxa0Z2+Q+pnB/m6GEOU9OQ6ZJwCrF5PdZmmtSP3hahrZdv361OgwsoYhNF/Pyw6jTJxbwnz0ArJ
	cIu69vw==
X-Received: by 2002:a05:600c:5253:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-4534219a64fmr154403455e9.11.1750268446608;
        Wed, 18 Jun 2025 10:40:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXftk3ZXBXIBGlT1RpZSgQfC+IysEY/Lblmm+ealanQwQ/CfiKMmfIF1BFjPpj67LfRQmzUw==
X-Received: by 2002:a05:600c:5253:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-4534219a64fmr154402755e9.11.1750268446175;
        Wed, 18 Jun 2025 10:40:46 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535e97aa15sm3975415e9.2.2025.06.18.10.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:45 -0700 (PDT)
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
Subject: [PATCH RFC 11/29] mm/migrate: move movable_ops page handling out of move_to_new_folio()
Date: Wed, 18 Jun 2025 19:39:54 +0200
Message-ID: <20250618174014.1168640-12-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: nM2Suby_UmsTziWgLMLoyh1zeV_fdluMrDs2dkiUTRo_1750268447
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

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/migrate.c | 61 ++++++++++++++++++++++++----------------------------
 1 file changed, 28 insertions(+), 33 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 456e41dad83a2..db807f9bbf975 100644
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
 
@@ -1328,20 +1322,21 @@ static int migrate_folio_move(free_folio_t put_new_folio, unsigned long private,
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


