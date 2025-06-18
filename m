Return-Path: <linuxppc-dev+bounces-9472-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CDEADF454
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:42:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrcv1q1qz3bqD;
	Thu, 19 Jun 2025 03:41:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268463;
	cv=none; b=GERPHhwg1itvFABZ44Cb8acjsmjfrp2en897hICw3eyWE03LZOrgwr3BtRa4C3K3Xp7wWfXq8RgG3egSUfqGvSILf7FNMAC5WnBuD141WK5YgiZbmFBShYhXTGTAgCYe5Z7sp88WbWpCBCj3nMDymKLX1QiCaTJ1vqYnvQRuv3BK6eDigs58qpbJqZtakws5w+rPMMS5RR4Gol4H1hLBFQnzWj4XrPzVGWN586+hTp4vxF4ZXVDZtnI6JfNq0/5pvxYOWnUGC645KJ+jmt8pYS4ZHJRcSEKEOfHg4wdIaBshoDBkTI741tb8YBzhX0aepwEj8qxBlWWUpaGNJhIIqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268463; c=relaxed/relaxed;
	bh=3ASXfJp4RHbfj4rINsJONSvcqE1rahDwcrPqymsVLDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=gDqyaMsTYefVXFk5YZpv3x4rEGyNN28YnJJyuQFcP6n95Y3NQCSSe0MIBGP7mQXje4GCKAGwf4Y2RjRTqIzfpsoxTiEduVJT/OeKy+wEspRPe1HQwx2oey4KFCGzf0YniePKK/KM9phvmv8tqDsV1rjAsHW+aggVjoTqYt22SAmLu/VUsGnesyQawo3d5ad35xeMSv1kNMH6sHIq+ZkMamjjOvFE2VcyKk7NrzHZCt3NgmXGNMGr7bbgFVjSRxRMLHpheS6Y+K1ODS4xk4rZ4iVZtwQvQQDbemlOXu8IO5gzJcx/i7W+jSzjz3kfhBkF//mACH3QpSKaRijBRqfQyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hhdA762o; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hhdA762o; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hhdA762o;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hhdA762o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrct37Ltz30Vb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:41:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ASXfJp4RHbfj4rINsJONSvcqE1rahDwcrPqymsVLDE=;
	b=hhdA762olOqTAbodZcPezq00TRnM1k2eIdWQQMKRCRttwj2dpeeoXldG0nOPbH7ot6bVSX
	GcQDRIi1dYRmDHQdLhnJG+tRpGgI1xwcGd4rn5q7wKE0hYXsotjKPluiDQKkzIq6Xjx/po
	anbYbJICfPQAStMqS5D8OEhwAPAgPBk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ASXfJp4RHbfj4rINsJONSvcqE1rahDwcrPqymsVLDE=;
	b=hhdA762olOqTAbodZcPezq00TRnM1k2eIdWQQMKRCRttwj2dpeeoXldG0nOPbH7ot6bVSX
	GcQDRIi1dYRmDHQdLhnJG+tRpGgI1xwcGd4rn5q7wKE0hYXsotjKPluiDQKkzIq6Xjx/po
	anbYbJICfPQAStMqS5D8OEhwAPAgPBk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-XTQrvQe8OPyBbkk6YM1Sxw-1; Wed, 18 Jun 2025 13:40:59 -0400
X-MC-Unique: XTQrvQe8OPyBbkk6YM1Sxw-1
X-Mimecast-MFC-AGG-ID: XTQrvQe8OPyBbkk6YM1Sxw_1750268458
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45311704d1fso40531285e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268458; x=1750873258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ASXfJp4RHbfj4rINsJONSvcqE1rahDwcrPqymsVLDE=;
        b=SNJ2+qHEAop+/VfFYHXnEeUPF5Lg18BJOkME9o0zp5Uwu4zTLegPpvROu1XFX/81dn
         /29uOwhIbGukZyls2zgQ4dcCUGmLEKpojGRABsAHjkZCpf7Uxdy2c6M9iwadRZtX/Zei
         mfJaeC0fnrBGI3XCRsQ6NvoGQsv9ZzqMgDgukG1wo/5/W7isG/aGggKbAntKNLlA838t
         N1AhKorKvnJq+7/7YoxM+0Nex5AV8MWbPryneO/NzhhEyq/4r217tYH7vUNbzPN7qsXl
         sQJkAQ0mP5fsXwFhSu8qnrz9DPeq4Uu4Gj3sJGLJYL190s5aAFcQpPNvDSAgeKpllUFB
         BdUg==
X-Forwarded-Encrypted: i=1; AJvYcCXtVtTvkDNVZg6u/5XDfggwlu2uff0OsFys/uGewnVSifcPh0pASe4zrZNCyl94iC7jnrhhTtZEbK5k6VY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzJYhYCNGV5tkalGa4TpUDUivbt5sKNDtQak+1VeEGu9NSRR0pn
	AkeLcXXM7+1eiZHrX85x/GrGL4tyPs0KC5qZJ7bI20b82t98pKXPXXN9Ijib61nfiS/8fgv+wnw
	9q7CWQ5WW7IoszaLAbwN3jbyCZXa6KrevVVzdf2FfBoLi6XpvTQxPCFKA32xumlsuI2I=
X-Gm-Gg: ASbGncsbxnOLVyZwEwjmyMa3sXAC7MI3A1F7YH0mYUg34QWZ/8vRm7uzGeoFIXLuK8q
	GFf5Vwt/QHVi6lLt7cvLm559ll4vk9BKevfy8jErm+O3eI/I4mu98Bv4IOghBZxxQA2LBASZwyK
	kCiC2rhv3zVv6Yg70EUtyeT7BMGWKCkL2aaxwTVayzQ4Qn+ynwOuUF0ZhO4e6kWWdx+mLpEbTPb
	wQL15FxrkL/dRKm6aOBYbiZfDQcs2YD/2GjdcSpwu6UMZwjIGEFwjWw+vX18Kp1Cdsnd+rJ36CP
	vLjQi8Y7iNu1s4ieZNaW98Hka8W0kNxJwm5aeU5/PtdoiQZX2foyLYtsjNe4FSIqrkxztWhwLFC
	OOVi6Vw==
X-Received: by 2002:a05:6000:402a:b0:3a5:2208:41e3 with SMTP id ffacd0b85a97d-3a572398dcfmr14347248f8f.4.1750268457630;
        Wed, 18 Jun 2025 10:40:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxU0kwdlscA0a/TfkuoDPVpV0SY0h1I0z821bVOupD96O2QJDPBeoneLN1ts9zfh0zY6p91g==
X-Received: by 2002:a05:6000:402a:b0:3a5:2208:41e3 with SMTP id ffacd0b85a97d-3a572398dcfmr14347224f8f.4.1750268457179;
        Wed, 18 Jun 2025 10:40:57 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b74313sm17643014f8f.96.2025.06.18.10.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:56 -0700 (PDT)
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
Subject: [PATCH RFC 15/29] mm/migration: remove PageMovable()
Date: Wed, 18 Jun 2025 19:39:58 +0200
Message-ID: <20250618174014.1168640-16-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: ig4kbSUEnLmhHLk1HmVJ-gAtqzu1DI52wYlShvaXiv0_1750268458
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

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h |  2 --
 mm/compaction.c         | 15 ---------------
 mm/migrate.c            | 18 ++++++++++--------
 3 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index fb6e9612e9f0b..204e89eac998f 100644
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
index db807f9bbf975..cf92075108f0c 100644
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


