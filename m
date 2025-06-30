Return-Path: <linuxppc-dev+bounces-9893-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AADAAEDDE8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:02:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5r70wnYz30WX;
	Mon, 30 Jun 2025 23:00:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288455;
	cv=none; b=eRo2xuH5olHOPCn14m4qFjdg5scBzYKCsTxBtT3/h8b9aljCLt4Kgd+WVxEhXPgww9vlXLYOZHm+xBRv7Vl0/Fpu54KqoTNilrLc2UU0AJoAwlfwgu82KiEBOrmVm4eDRxK3dQzNvvTMhtZQ7eZxPDSpnh3mcCVkP7Sb56gvfOsod0eyXaC/3e4jZfB+W7uTnaTtRD63GR5HxPsIP1pRt9Oc0oeFD4JWastHb4w/hIKZDfSbhOtt+OZvZKn0ub2Vn8ACSM1Qk99FNvHfO3En/SB85XxwOnX7u0vGuVMP4qvNy8C86xkbH/vLUK+ws5eDDlFBm2Dw7FV5LlXaaR+n3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288455; c=relaxed/relaxed;
	bh=rLSy27pHIWSaumHdHZbZB7d4Xse7WARvWeqJ4bM0kJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=YFbxDmCe1f2CUbPmF6o8BLlm8UUhvsKZ26oyxmD5h8l87I2nJMr3VfQgwBZBHc9IGI69WQqbaXjheDWzwUbw0IifbKyVqF87O+al02MKQac7Nf5w+iCZ+vzA23imLCU/3CMdLwiJIYnpw9MQJY14tctJa1LSE0SfBfcI+CPjE36QrnPJiInPBqFpgG9UbE2jN8v9Wb/Cg98JTzqMV/GK53pSLyt9LugLfMDkfvssIhN4uXk5/98V3p3aj3Kb/JkeBM6nPTs2R2bih8TKIXrPDaUKlLJskdrgIn7sqOwz4Y/ylQQsuxunVAtMrInxQdOXHHqqG+SemHWbkDMUdOEm6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ei2SEKi+; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ei2SEKi+; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ei2SEKi+;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ei2SEKi+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5r62M4Cz30W5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:00:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rLSy27pHIWSaumHdHZbZB7d4Xse7WARvWeqJ4bM0kJg=;
	b=ei2SEKi+xFgJsQJehAa28gDZmwI0c5UqBgTbm0omEoRXRTBqFi+xCXDpnaa6kRjgvHzY4a
	Onbcq2Ihq+O06omvT0dPU2Z0iNysZNJQ17ErCXL0OcW4ivclx/+XbYgsKblZCf+OgS2Cdb
	f0IIc4U78oNUDphCP731earqW+813Yk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rLSy27pHIWSaumHdHZbZB7d4Xse7WARvWeqJ4bM0kJg=;
	b=ei2SEKi+xFgJsQJehAa28gDZmwI0c5UqBgTbm0omEoRXRTBqFi+xCXDpnaa6kRjgvHzY4a
	Onbcq2Ihq+O06omvT0dPU2Z0iNysZNJQ17ErCXL0OcW4ivclx/+XbYgsKblZCf+OgS2Cdb
	f0IIc4U78oNUDphCP731earqW+813Yk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-HZr11hVXOfyNvNgQyDKmwg-1; Mon, 30 Jun 2025 09:00:47 -0400
X-MC-Unique: HZr11hVXOfyNvNgQyDKmwg-1
X-Mimecast-MFC-AGG-ID: HZr11hVXOfyNvNgQyDKmwg_1751288446
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4eb6fcd88so1588021f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288446; x=1751893246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLSy27pHIWSaumHdHZbZB7d4Xse7WARvWeqJ4bM0kJg=;
        b=wPFWvX/KtvvoofGtYiSXISdDeg7TkG58bZP0CtEMbgucuTvoNASYVFiYpHVNzIM31P
         kWBYXGccg629E6+i1vtVD4pV9Qoj3/7QgY/Hdcd/Sx7G1FiRnmdJGjWf3041r2JFMxNS
         zlZ9E6hdzPDuMZss54k2dE+wW/91WkPNPfCiMyXnwLxXZ/22QcXQ+flA0FFuAHK7fvyu
         DG8khMc2ZgwW9bMumnHgOwg/HhDuRkzO6xAuzIi+yO6HTiir8Fm/k/twlrBcERuFTP7b
         i6sqNJC/8nvrkFlEpxx891ygbg2J8Ej06bJO4ddV1rRwlV/PKGPzGPxaEmZQqfe55sap
         s2oA==
X-Forwarded-Encrypted: i=1; AJvYcCVuPfn1KgyGU+AZ5cP4DtJxZCoglM9mGpS0QYaD1U2yKfK6vMByl9xfUJlWB++tXq0KECa4byJFdLGGFC4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwPwWuXR5bHgiaE65NcqqbKy6kkuvIQNbWN2HJiDA0EZ1LyK5uS
	6HVtEo0E0uIGVx428vGiss7G6qvnikoGdcoQGdzVNexeRFxGR3R3L5J3RGlytoZ8Fmo5Qhfgcrz
	tdOlSHFq0CSpnFSG4LEPRYhV3qXH5tM6/Op9mHF6qYtsJAIbSScdZObTZ91FQ2Aip/6A=
X-Gm-Gg: ASbGncv8LGT4BP6a3NjFO5YPE4agmaoQG8ZxHaIWr/LXSM4IirFsRfMT6eyAIHv6DF0
	MapI+bf07ETJZ8+f9s02c4ck8utMrfyWdvePWM9yTa9Ldp83B78PxvHZ1SviyzhFn+OjUttEAH9
	fubWItwhkO0Lah7q6NNZZOh2gN6M4KreXqHwMUsSbPp6556cVqHrG0wGF2MDSIx85JD9BGH7k1F
	1qWQzlJAHM8u4gJa4lQSfTTobda4fZw+rcaT4YigvApSBxj5gBewUibsRUwsRiJ7PbSrY5DYNy6
	tE8naWmoNUU/t4r3PP5Y3gIE5QqS8YgiL0YhvPmo5xcmb1wFtOJOr4wlRvLIpxe1VDKZw6w6sAX
	GjoxskLc=
X-Received: by 2002:a05:6000:440b:b0:3a5:287b:da02 with SMTP id ffacd0b85a97d-3a8fe4bd16fmr7883143f8f.40.1751288445790;
        Mon, 30 Jun 2025 06:00:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZT4aB5+IKBjQnh+yncb7ZFTxj1NuN2dDZeVwVJqvRnlRrWkNRGfP/el4NU32fGgywSRoLtA==
X-Received: by 2002:a05:6000:440b:b0:3a5:287b:da02 with SMTP id ffacd0b85a97d-3a8fe4bd16fmr7883079f8f.40.1751288445063;
        Mon, 30 Jun 2025 06:00:45 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a88c7e72c1sm10293032f8f.1.2025.06.30.06.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:44 -0700 (PDT)
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
Subject: [PATCH v1 11/29] mm/migrate: move movable_ops page handling out of move_to_new_folio()
Date: Mon, 30 Jun 2025 14:59:52 +0200
Message-ID: <20250630130011.330477-12-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 1BjlKPd5Dya6lAPjwI-SoFBh3XEe479vd4VXCQX5nfs_1751288446
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

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/migrate.c | 63 +++++++++++++++++++++++++---------------------------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 0898ddd2f661f..22c115710d0e2 100644
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
 
@@ -1328,20 +1322,23 @@ static int migrate_folio_move(free_folio_t put_new_folio, unsigned long private,
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
+		if (rc)
+			goto out;
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


