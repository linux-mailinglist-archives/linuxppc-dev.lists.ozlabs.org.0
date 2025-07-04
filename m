Return-Path: <linuxppc-dev+bounces-10108-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9361AF902E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:28:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVDB3V3hz3bgw;
	Fri,  4 Jul 2025 20:26:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624794;
	cv=none; b=Wl4UfRWVRHoecW/DxbBviEc9rgc/dFDXmr/EF8K8+OCYbwxTQDqlqKHxJE7Uq8pUCKI0pEknGklS7mHja4CHQkNZSZSM2oxi3EVPz7JIrxobgyaMPaJuLKCrsQLUsMbWqs5e421xCgHqxBqisAGeFaNCXXMReJ/XofpTQ1dXG/uk5ywIuqOLzw0h7dt6ckcPqRi3gcmJxA5QD7p24AA5ga2YMedOdMibimUxPcxL4Lo6yI9UpjFBI1Tu9sc0v+0KnnCgGUMvgnegc0hyxLGCZUhgfOYZJkjEHklCB18ZDm/FC2XKntNTok2c31tIMa6NPXy0r2zZAA5opKpYOMuDWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624794; c=relaxed/relaxed;
	bh=oIfhqplW92Whs4rQ5a+bzpcvmYNnoFDclaHeGz5GfJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=hRu00LrgmDri7SLAWoBjyoIjP2sjcwp/gXrQSHLcTVaQg2KkMYVyaSyQCeg9Lz0t04gs5cCEte16LgUTsz5uDnzmFacVVu+rjJBsGDXndPzQZdq0L97gk6X6Pc3QgRx7gNYzlNrI4gz2OKS+z8vY2Y4VoO5dFvhNfCLvFJQbnORzvDOEdYBTNlYj6FF3ZlFUVvDyHB9oxZt+ppHsKN7RuoaKf6KMhGEYhiPDN2q2Z9tpkFPiKV1JkJ+Q2/q1QTmbaF4MQu+VZgfFq0lnCjtot67Yz4VKS288SWC4lTbgV+dVG3PI/5nAUnptVp09c3ZftKN5HV2yfSMFpMnT2sHRBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CzJ/dXwT; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CzJ/dXwT; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CzJ/dXwT;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CzJ/dXwT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVD95Z7wz30T8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:26:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oIfhqplW92Whs4rQ5a+bzpcvmYNnoFDclaHeGz5GfJE=;
	b=CzJ/dXwTEnVQNEQyLY72vxXz5hdcFZKATZK2YV0/FU3tLO5r2T82zSbVRdLUr12j8i3a1l
	f//fG+xh8aLSkzEzNkAW+tj21OAi0K2XR4ZHo7xA0gjrSbt0i4q+gkjGcKG5llhj9sENyc
	wMHQ7vxuR1/Ckpt3Nyiq7OgoF1FJ7SQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oIfhqplW92Whs4rQ5a+bzpcvmYNnoFDclaHeGz5GfJE=;
	b=CzJ/dXwTEnVQNEQyLY72vxXz5hdcFZKATZK2YV0/FU3tLO5r2T82zSbVRdLUr12j8i3a1l
	f//fG+xh8aLSkzEzNkAW+tj21OAi0K2XR4ZHo7xA0gjrSbt0i4q+gkjGcKG5llhj9sENyc
	wMHQ7vxuR1/Ckpt3Nyiq7OgoF1FJ7SQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-PyhePYxnPpuT_yKNglZQXw-1; Fri, 04 Jul 2025 06:26:30 -0400
X-MC-Unique: PyhePYxnPpuT_yKNglZQXw-1
X-Mimecast-MFC-AGG-ID: PyhePYxnPpuT_yKNglZQXw_1751624789
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4fabcafecso380589f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624789; x=1752229589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIfhqplW92Whs4rQ5a+bzpcvmYNnoFDclaHeGz5GfJE=;
        b=cdTRg7eou4YLZ8LWYfjqflBxOjQ7Qv08mVaG+UkruKF1fwU3T4v/lQjxTXi3wTTFEt
         vHcqQteUZC/9IyabIP9vgb1DD3qq4TrcICZKOS5SNrE3PwCPSmNM4xj6Og1JXzlmGdWC
         4OZqtrMnhkopZYzxmx2Jvo0Qq0y9UjhEjRLvZrJo0WrGjUItQvGXYHqW9PXYpwrtmKVj
         fmZKuX9b+dUDvGqw7AjTqcZ87xvIeiBwvH3N8YOV6Ms70rx1H1yuvs3FDA7KeP18en1o
         xsOG9a+mRCkeLCpNuE9aJ03fCDGu7pgYCZNXme8M3FiXO7UC9FRaYHceJFGaJXXChYUX
         o7AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLdi2qxqnenAop7sxt5ZMknFY4aS5wQbgCCfiSSpDxcjbeQiXkCCwL1IqsBnd+Gof4A2be4aq3dahGvrg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzL6hP7cWn72k0TgbODih8lDVuHeZGpUlH2TAVR1yn0nRoYq8ef
	+IPZMavLSYAoE+PHod/nrky7j/P4Drs3oftBsw3NZjKo+4CJ8ejF3jrhZGLh0crYSzeEbc4RhHV
	MRD3I7eRweI/8TP78XRdkz2tIDLJwiQmFOkHdNG/4q96Y3C79okCCrS5X792EGLtTcVo=
X-Gm-Gg: ASbGncsBJ6bvJC3prGzOmLDE6ocIKECS3e0noeysPe0K7U7BKhysiJvt6MM7w8sIzyx
	18fbEBuZzXFk6am6SontjlZOdYPf6r/xV45wWL7eVY4Dyi24StL4xJHaoOl/C2kxt1/USAiRvFI
	DL6lfItflouBoD7aSxnrT4mMVFHYjM0HgdjSEx8Wy5Rrc1d+bJynyPKI2qbQJBtApw7MyyKMET0
	zD1BFcc38Yrapwa7pZ7xiO/yvjazRHvQQ2Lyh+SF8Xfpg3pDj72XMNApLcKTtu+7K/P+LVC7/NC
	JUYES1hWC+hAj5zBR4a5Ka1SJAPxNLJrXwEv2zrPvMmV+1csVndeelhr2rY8Z2NzppGOdywHzcm
	yMedBkA==
X-Received: by 2002:a05:6000:3ce:b0:3b2:ef53:5818 with SMTP id ffacd0b85a97d-3b4964eb1dfmr1524565f8f.5.1751624788879;
        Fri, 04 Jul 2025 03:26:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6/dh0H9/LpgMHN6+E5K8aCm2QgibuKB8jFRjnybENn7lard2NaLBEO46u6eT1pnDUCzj4ag==
X-Received: by 2002:a05:6000:3ce:b0:3b2:ef53:5818 with SMTP id ffacd0b85a97d-3b4964eb1dfmr1524493f8f.5.1751624788372;
        Fri, 04 Jul 2025 03:26:28 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454a9bde954sm50967885e9.33.2025.07.04.03.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:27 -0700 (PDT)
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
Subject: [PATCH v2 21/29] mm: rename PG_isolated to PG_movable_ops_isolated
Date: Fri,  4 Jul 2025 12:25:15 +0200
Message-ID: <20250704102524.326966-22-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 0np4XA4h4s5yqUxvnVLl1s-PypMi5o18pSRLkBgGikQ_1751624789
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
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 16 +++++++++++-----
 mm/compaction.c            |  2 +-
 mm/migrate.c               | 14 +++++++-------
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 5f2b570735852..8b0e5c7371e67 100644
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
@@ -1147,9 +1144,18 @@ PAGEFLAG(Isolated, isolated, PF_ANY);
  */
 TESTPAGEFLAG(MovableOps, movable_ops, PF_NO_TAIL);
 SETPAGEFLAG(MovableOps, movable_ops, PF_NO_TAIL);
+/*
+ * A movable_ops page has this flag set while it is isolated for migration.
+ * This flag primarily protects against concurrent migration attempts.
+ *
+ * Once migration ended (success or failure), the flag is cleared. The
+ * flag is managed by the migration core.
+ */
+PAGEFLAG(MovableOpsIsolated, movable_ops_isolated, PF_NO_TAIL);
 #else /* !CONFIG_MIGRATION */
 TESTPAGEFLAG_FALSE(MovableOps, movable_ops);
 SETPAGEFLAG_NOOP(MovableOps, movable_ops);
+PAGEFLAG_FALSE(MovableOpsIsolated, movable_ops_isolated);
 #endif /* CONFIG_MIGRATION */
 
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
index fde6221562399..7fd3d38410c42 100644
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


