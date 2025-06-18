Return-Path: <linuxppc-dev+bounces-9478-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE98ADF464
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:43:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrdD6nD9z3bsM;
	Thu, 19 Jun 2025 03:41:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268480;
	cv=none; b=HM5PVI76kbc+ZoRtb4MOFRhIGfK1OV8F09JIxU26oBVb95DNbq5YqqKP+PxJ36O62aHvteIbGTDN87fe2t2bwl2oYv5uX3ePdW67WWIdJ1LBPhaiQcHGO7k2B7L8J4HDCd4WusU2Sw8lgDm+yshvpiR58tNZFWvhPkfd2HSJ6RNlBO3CJ+8Tlsu8ibkFdhtTJ8bWhSDBM+1vSn12lgzaksCFX9vq6VpSQGcICLjUmhu730YCwzxElsII/0yHG8Az4Nh3/n1rzC32Dreeom1bGKy+ziJ4YG11idz4pFBbPNmcBlcvF3T0C/TfWVM4Ra9VBHLVo4F3v1cN70PGCISH7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268480; c=relaxed/relaxed;
	bh=VgDxyojJlL5XcnaJgd1JoaTm/pUk71nf1V9W9yKY0aE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=b/kMlIGoJjcPsZWVlwfdxJfKNp48nXOe71FXq150GtW4beBDzp0pQN+Os3nRH+JJOf2uSP33HQbGYcdISjcrvLyQUHBzznm8Vttb5V5LbsoHSLFd4nMeHBXgwKMOUfr+LqR0qxPMeqY0T1/Uf10JT+Vw1f8TqTWPEedhLRJ059fxYGO+ByCmJFnczbCOBQZWcwT3qAzre85NHcXFtMW6Da0qJ2NTobt1vjGMi2mF41HAhg70cdoTo4LBUWrv2latNUCixBnpqOLR/X/MN7x5+nVZxmpWd2N0zzuEbVsjCprtbobKL8N1YJSM3uiDIbjYccmVEMR5367rKHIblAODqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XfZMW6r0; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XfZMW6r0; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XfZMW6r0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XfZMW6r0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrdD0nsZz30DP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:41:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VgDxyojJlL5XcnaJgd1JoaTm/pUk71nf1V9W9yKY0aE=;
	b=XfZMW6r0SZJ2dAZN7O0W3oEZ1YS6pQeajk22MHNtZ7MZ/3mAI3XDpK6fsqotNnB0AWn+xp
	+3zFGg1eDTNYRoHjtH9mxAVgrPRtOypEh9XjgTcaZ+vtCrK8nuE5elns2iMYr7k+RXhPaB
	h1vu+cs4BLfGguRGYGV0/d57bxmZi8c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VgDxyojJlL5XcnaJgd1JoaTm/pUk71nf1V9W9yKY0aE=;
	b=XfZMW6r0SZJ2dAZN7O0W3oEZ1YS6pQeajk22MHNtZ7MZ/3mAI3XDpK6fsqotNnB0AWn+xp
	+3zFGg1eDTNYRoHjtH9mxAVgrPRtOypEh9XjgTcaZ+vtCrK8nuE5elns2iMYr7k+RXhPaB
	h1vu+cs4BLfGguRGYGV0/d57bxmZi8c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-TUKux5DLPfaDOe7FNcFlFg-1; Wed, 18 Jun 2025 13:41:16 -0400
X-MC-Unique: TUKux5DLPfaDOe7FNcFlFg-1
X-Mimecast-MFC-AGG-ID: TUKux5DLPfaDOe7FNcFlFg_1750268474
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-453018b4ddeso42422825e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268474; x=1750873274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VgDxyojJlL5XcnaJgd1JoaTm/pUk71nf1V9W9yKY0aE=;
        b=VhMgWzRnKPtaQgCaSGIegwpAof2/I/YMPfZIkN4RS9stTQhDdWwg7HngOku8JnqiXH
         lnu2UfKppMZfOJK6ttsKM3kfJweTpzqc7iRXPpiCyvRPOTRQ0avRTLfc+lfn9HTr25ls
         O/065/fPT540+Vc68cUU63nvnXT/aPV36vEU6yecUuyqoAsBrqgG9nAuSugcxST4iKoZ
         9aMLfs5+N833l1kXhwA1DO7ld146PYlp5zq8ggHSRw37tagb9i8pI+10AhrHTr5EjK1C
         0nmsRyrt46L9YfB5+5ebNevKnrgozXMbCZbQ7atRbyc5NVtkFmNJsOjnmpUVtwnXJlVO
         yY7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7RrbgfdcFLKNsJ8+upoPQt3LS4rbefRcjSgvMD7R84iez1rpi7mRHrRGmsVTx5KJoRWged3D+suRZyrk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxu8lQj3vaVlhIXtcSkCHcSw14s4vrOolvFAnvIrhWAAEpDM8OG
	iJ1AoucGrC3ikjIvYFFbFL9jyyurvgqKvOIzDOxicHHN+aV+vo5p+0qbD4ae14GKjtwGPXoeaxO
	fW8GPQbzgjmuEa627HS6yPzp+ISmEZqhCFsucQHfv58Y6BOR7KCAQAzFWP0f1LTIHGrA=
X-Gm-Gg: ASbGncsFkVitvMeKxxjQ3WGkna1tNmTxxLtMKRRU7RKRlM4UJEyDapdpZqpq9SC+Edc
	Au8MvKMQg+t0LsoYoORmerMdVvdCxRK/uIjo4M4PDFvG+ImdhxPAj81slZrZ9SEhJTcQtWuNWxY
	4a8gCfLmXI9t2ySX9JV44yZkgx5TvSa272nguzYM6/oD1a0SxtXuvd8hrL6uTkcnjIgeMfWNEYH
	RC1NeEMVsLlVt9yTAijUcGWAGSaeTCRqYwqJhFdXz4JuPU+DgwZ9aGOUE6V8byHu5Ua8Vj1uzbS
	q8/rQxO/0C6VN79uIfFE84md8w24CXo8ZeBgYYg9Z3BBAeTpMX3hmx7oBSJe2RumqePweb0HdRg
	x3BxFtA==
X-Received: by 2002:a05:600c:3e19:b0:43d:2313:7b49 with SMTP id 5b1f17b1804b1-4533ca66cd0mr176797835e9.12.1750268474495;
        Wed, 18 Jun 2025 10:41:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIk5j0XUOc2qfzy9nY3G7Nge7jrVSGi6o08YDSv4Mte+xl8dtPQDJlCzuSsfiSc9/ShViabA==
X-Received: by 2002:a05:600c:3e19:b0:43d:2313:7b49 with SMTP id 5b1f17b1804b1-4533ca66cd0mr176797145e9.12.1750268473925;
        Wed, 18 Jun 2025 10:41:13 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535e993c95sm3729315e9.26.2025.06.18.10.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:13 -0700 (PDT)
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
Subject: [PATCH RFC 21/29] mm: rename PG_isolated to PG_movable_ops_isolated
Date: Wed, 18 Jun 2025 19:40:04 +0200
Message-ID: <20250618174014.1168640-22-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: RYIMILNbgXFveJMp0dAs9RtJF27ftJMwEwH4yVwmnnk_1750268474
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
index 86d671a520e91..809e4395cadfc 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1051,7 +1051,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		if (!PageLRU(page)) {
 			/* Isolation will grab the page lock. */
 			if (unlikely(page_has_movable_ops(page)) &&
-					!PageIsolated(page)) {
+			    !PageMovableOpsIsolated(page)) {
 				if (locked) {
 					unlock_page_lruvec_irqrestore(locked, flags);
 					locked = NULL;
diff --git a/mm/migrate.c b/mm/migrate.c
index a36030de94f30..f87a998b696e2 100644
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


