Return-Path: <linuxppc-dev+bounces-10106-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3988AF9028
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:27:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVD26Ltfz3bqQ;
	Fri,  4 Jul 2025 20:26:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624786;
	cv=none; b=VuFxOGMk6Fc3ATgbPQgLMnf0qdQmit3DviYl3h/BxZFgrWhq88xSVbjDBv+lbfL5GIEvfvARUV6lWYC0gCnLo7VPu/bTKHupBXP3JXQ/kCT2VVnwgar9YuEWO0SNnTqhPhaoBbwjWrFWVWNqHOI7YzXMWdYTFC/0oay1guUbRfwXq/lewa7p9Jg9m8tN9KMH2KlDzhjPi1ycEwQDk0wALzSco9oPYzIX53FdyCYLHIFKKDXw3beUs137Fl+1jxhX7nv2TyQlCHJcE9yu+XfeaWPkou9qOAbIrHQH/yr/1UmAXZUX/wl4zZ2FosSuaNMpipfIKekf63mEYjUQWzLMUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624786; c=relaxed/relaxed;
	bh=oECXrV5Dx+HlyT4DmzhVSvU+dpZiU/Jf4ByqsPae79M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=EsxRibEnRIqdUL8ci83lyY2+qxVyFCftzH0+AdImfUgYKaKsiqjF0S2F4hzofQMS7ViYB8AFYDY9nnCtFGiuNDEMc1TQ9Jc/1z515Q8AN8ADzED/9f7u1VP+hEH4cMqkEPq1AeJLHqM/Bz9fbti45LFMKwXRhWx4bOrJ8DJyatAVZP5K/8/WdC4qiUHS64J2yJgO8RMziMHxiQ8otfmRa4O+56L57KpGyKfxv8JQmxx1xmgyG7blmSGJ+O6nTVq/FEXM8W9hihI0cRTzNg8DlqnOYOBkrf7nkSQqqkc9OqlMS/ooaRouaXvoYmNZPqj8Hg4UZRdwYywdIwyTUx+diw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Oa6NsqoE; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KbBi6lrR; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Oa6NsqoE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KbBi6lrR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVD21Chcz3bnx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:26:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oECXrV5Dx+HlyT4DmzhVSvU+dpZiU/Jf4ByqsPae79M=;
	b=Oa6NsqoEwoY2fFOWeMzDQmDCw5xPJ3WQr89ILSJ7CZ9CkSQXrTUnrHwhU5fv70qaKtLCQb
	i0gQJYGuNlhZsACiy2nULuPArkEI/4uDM8tmSnlS69JfGS+RBBy27kGV9q5GVViUCPawF2
	J618Ky8CTDIC5h+FE+owXlsXlTDA9fA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oECXrV5Dx+HlyT4DmzhVSvU+dpZiU/Jf4ByqsPae79M=;
	b=KbBi6lrR1tURuvwANvFJt9qaoDlVBBLzrls7S+jCNAOcqPgSJKKRsqJz41EsmfTL53gtp4
	hgsqUXiRgY59flb93LxgJHg3YJheWkfhJNSCSf1UVJTfwSAzE8nxoU/R+vxLg7SN3SneLo
	B1o+tA6E0uQQ4MxIK3HVbJ1hGv0yGR0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-CXm8LjopMwaa-k4gfWx9mg-1; Fri, 04 Jul 2025 06:26:22 -0400
X-MC-Unique: CXm8LjopMwaa-k4gfWx9mg-1
X-Mimecast-MFC-AGG-ID: CXm8LjopMwaa-k4gfWx9mg_1751624781
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-454acc74f22so5105415e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624781; x=1752229581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oECXrV5Dx+HlyT4DmzhVSvU+dpZiU/Jf4ByqsPae79M=;
        b=ElFAIsR9FVy8n1Si6XX74qT1W8u8WkOPWR6iwzDyoRm18Se8CWp+yzpXjmwi/4oRbk
         fkoNMFrm4FufWY1t076dOROrkJYY2wtJD4WGcQkJzELfF4IWOxcQsVOYYhNGxxiunUsK
         FAZ036TrfyifLPkjyDtZ301BLX/RdZ/oUu0WZ+k6Irp3BKM6BnudfT5fn1qefhEFjeWU
         tzwhAZb8zpc/ipZIl9YHXuM7nnHSS+iojkbweQcn2tg6H8S5jaHy81Rt9W5H9CLV4uAo
         4PdPxnubJ4qf/l+aXiK3S5qYlQCu4JisnMoXkMr+geAwtmKwg57BYbCUEnZ+QSECNeBm
         J5Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVa5N4/vBOXYXrfk9qKhkTiHdUflWcy1PRq3IIRmR6J9ZKHid+s0wRweH4xVEKRC3mAsnhR7QqzjdssIN4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YznSlnxZGC/KNAltUNRLNLuKqjkjYfkYnt2JHlv5hhpLEs+/pmx
	K2PShW8+basPZvUjKOeRO7We30TKgrKdqt5I1OmYKOjhMnkGBd13/ZSUVYfAo2Vtb2bpPaU9SEm
	qT8cpAmmZbrl5YCQ28+LgV/cizJzLquEf+AVTyEY4hoi08yUUEhthPNUundJWCd/Mris=
X-Gm-Gg: ASbGncucPj+JGKQn2RNh7a1Vs1wdK2U21MaKDZRXaEWZHEx3zEc6oLoSgSzxr8/HlKL
	BmAwwcRks86gqxH3QetIMtTSfk3o6KSn885WnBf8PyRnazzyFQ5+YOelTAh8GVpF6mLJDqL8dL2
	5YYLQvBKyFe0lnfZ1Nr1ShLQcXCOZ5WyQ4V9Mmp1lrDrErJFSFL/hG/iakwypGzjKRW7cnO2sNd
	Cqg+H+Xvn7THDXRii6BrhAOpGxIybQGYvDo3IkMQNYJX0/xGqxpVGvIOtW+amfFcAQarppQGgTr
	ynZn5+wVtPZF0fLnDlj4Pc8bBMH1UNswsr37gfSwoSr19WOtxZezcW2+PGn3wf3kdqeE8eDCHt8
	NN1pU0Q==
X-Received: by 2002:a05:6000:18a3:b0:3a4:cf10:28f with SMTP id ffacd0b85a97d-3b4965fa4b0mr1306260f8f.31.1751624780820;
        Fri, 04 Jul 2025 03:26:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbtvCxrQrQrYrJp00fZP6RxGB4BHMLsK8k2E+KsEE1fK7HT/hfJLD1aXJjlmgOs0fjfm/CXw==
X-Received: by 2002:a05:6000:18a3:b0:3a4:cf10:28f with SMTP id ffacd0b85a97d-3b4965fa4b0mr1306179f8f.31.1751624780162;
        Fri, 04 Jul 2025 03:26:20 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b4708d0ae0sm2166343f8f.33.2025.07.04.03.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:19 -0700 (PDT)
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
Subject: [PATCH v2 18/29] mm: remove __folio_test_movable()
Date: Fri,  4 Jul 2025 12:25:12 +0200
Message-ID: <20250704102524.326966-19-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 5siJW3hzKR4OryuNOSSu0PTJVe_93wwfJ-hXr64w-fY_1751624781
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Convert to page_has_movable_ops(). While at it, cleanup relevant code
a bit.

The data_race() in migrate_folio_unmap() is questionable: we already
hold a page reference, and concurrent modifications can no longer
happen (iow: __ClearPageMovable() no longer exists). Drop it for now,
we'll rework page_has_movable_ops() soon either way to no longer
rely on page->mapping.

Wherever we cast from folio to page now is a clear sign that this
code has to be decoupled.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h |  6 ------
 mm/migrate.c               | 43 ++++++++++++--------------------------
 mm/vmscan.c                |  6 ++++--
 3 files changed, 17 insertions(+), 38 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index c67163b73c5ec..4c27ebb689e3c 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -744,12 +744,6 @@ static __always_inline bool PageAnon(const struct page *page)
 	return folio_test_anon(page_folio(page));
 }
 
-static __always_inline bool __folio_test_movable(const struct folio *folio)
-{
-	return ((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS) ==
-			PAGE_MAPPING_MOVABLE;
-}
-
 static __always_inline bool page_has_movable_ops(const struct page *page)
 {
 	return ((unsigned long)page->mapping & PAGE_MAPPING_FLAGS) ==
diff --git a/mm/migrate.c b/mm/migrate.c
index 3be7a53c13b66..e307b142ab41a 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -219,12 +219,7 @@ void putback_movable_pages(struct list_head *l)
 			continue;
 		}
 		list_del(&folio->lru);
-		/*
-		 * We isolated non-lru movable folio so here we can use
-		 * __folio_test_movable because LRU folio's mapping cannot
-		 * have PAGE_MAPPING_MOVABLE.
-		 */
-		if (unlikely(__folio_test_movable(folio))) {
+		if (unlikely(page_has_movable_ops(&folio->page))) {
 			putback_movable_ops_page(&folio->page);
 		} else {
 			node_stat_mod_folio(folio, NR_ISOLATED_ANON +
@@ -237,26 +232,20 @@ void putback_movable_pages(struct list_head *l)
 /* Must be called with an elevated refcount on the non-hugetlb folio */
 bool isolate_folio_to_list(struct folio *folio, struct list_head *list)
 {
-	bool isolated, lru;
-
 	if (folio_test_hugetlb(folio))
 		return folio_isolate_hugetlb(folio, list);
 
-	lru = !__folio_test_movable(folio);
-	if (lru)
-		isolated = folio_isolate_lru(folio);
-	else
-		isolated = isolate_movable_ops_page(&folio->page,
-						    ISOLATE_UNEVICTABLE);
-
-	if (!isolated)
-		return false;
-
-	list_add(&folio->lru, list);
-	if (lru)
+	if (page_has_movable_ops(&folio->page)) {
+		if (!isolate_movable_ops_page(&folio->page,
+					      ISOLATE_UNEVICTABLE))
+			return false;
+	} else {
+		if (!folio_isolate_lru(folio))
+			return false;
 		node_stat_add_folio(folio, NR_ISOLATED_ANON +
 				    folio_is_file_lru(folio));
-
+	}
+	list_add(&folio->lru, list);
 	return true;
 }
 
@@ -1140,12 +1129,7 @@ static void migrate_folio_undo_dst(struct folio *dst, bool locked,
 static void migrate_folio_done(struct folio *src,
 			       enum migrate_reason reason)
 {
-	/*
-	 * Compaction can migrate also non-LRU pages which are
-	 * not accounted to NR_ISOLATED_*. They can be recognized
-	 * as __folio_test_movable
-	 */
-	if (likely(!__folio_test_movable(src)) && reason != MR_DEMOTION)
+	if (likely(!page_has_movable_ops(&src->page)) && reason != MR_DEMOTION)
 		mod_node_page_state(folio_pgdat(src), NR_ISOLATED_ANON +
 				    folio_is_file_lru(src), -folio_nr_pages(src));
 
@@ -1164,7 +1148,6 @@ static int migrate_folio_unmap(new_folio_t get_new_folio,
 	int rc = -EAGAIN;
 	int old_page_state = 0;
 	struct anon_vma *anon_vma = NULL;
-	bool is_lru = data_race(!__folio_test_movable(src));
 	bool locked = false;
 	bool dst_locked = false;
 
@@ -1265,7 +1248,7 @@ static int migrate_folio_unmap(new_folio_t get_new_folio,
 		goto out;
 	dst_locked = true;
 
-	if (unlikely(!is_lru)) {
+	if (unlikely(page_has_movable_ops(&src->page))) {
 		__migrate_folio_record(dst, old_page_state, anon_vma);
 		return MIGRATEPAGE_UNMAP;
 	}
@@ -1330,7 +1313,7 @@ static int migrate_folio_move(free_folio_t put_new_folio, unsigned long private,
 	prev = dst->lru.prev;
 	list_del(&dst->lru);
 
-	if (unlikely(__folio_test_movable(src))) {
+	if (unlikely(page_has_movable_ops(&src->page))) {
 		rc = migrate_movable_ops_page(&dst->page, &src->page, mode);
 		if (rc)
 			goto out;
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 331f157a6c62a..935013f73fff6 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1658,9 +1658,11 @@ unsigned int reclaim_clean_pages_from_list(struct zone *zone,
 	unsigned int noreclaim_flag;
 
 	list_for_each_entry_safe(folio, next, folio_list, lru) {
+		/* TODO: these pages should not even appear in this list. */
+		if (page_has_movable_ops(&folio->page))
+			continue;
 		if (!folio_test_hugetlb(folio) && folio_is_file_lru(folio) &&
-		    !folio_test_dirty(folio) && !__folio_test_movable(folio) &&
-		    !folio_test_unevictable(folio)) {
+		    !folio_test_dirty(folio) && !folio_test_unevictable(folio)) {
 			folio_clear_active(folio);
 			list_move(&folio->lru, &clean_folios);
 		}
-- 
2.49.0


