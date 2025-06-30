Return-Path: <linuxppc-dev+bounces-9890-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C02AEDDE1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:01:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5r01R9qz30VZ;
	Mon, 30 Jun 2025 23:00:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288448;
	cv=none; b=g/zWKppT2b8qPeG8ZskmyuuRluJ2HV8+YFZaYKntosrAqy+PiKQPZnSrY8payupcBwxYDmNpN7YTs/+y5bmqLlhfo38OQr3S7XmKvhHtGKd0AtwFJYDBsL7Q475KDEkBS+n3drZeplmItbcGcIzGC6FKOfXT/cCYKQMReCmV1NeKjX0Wz+hn8AobA+t+3a6iMUZTh0XetcASHbA1qZeb+BN2zt1Mq1iOBeniTov0kahq+PtKav7Sex0QJwbbSdJlJvB5KtEXpW7U4vPfbiCs1Jnl5/A06s+oZgwZGisjX51MQ4rXLGAY0HBZNrN83M48zwabVr6bza3qgJWj1q2Rxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288448; c=relaxed/relaxed;
	bh=G4HyaliWLgvplqkgqKCCNJ5/P2ZKVlm1Wsjs2FxXnxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=FY9GsqbXq4XewSe1I/n4biYeaCkvvUl4Ts/ktI+oGGfQgx6CyDRRJsuG/i1tOCGTlFTmtCvD+/81EDo/mHqfx3y3JtFuix/cUnxGVn5bN/7UP0VDi3cktSfDnorPsfJsquGM30J3olf4wIaSzEc3qbCCafkJfqdDpAIObCcgtiDvk2W4JhvDnf5FVIdKx2VDVmKTiJQYvonnI+w+/HJBjsBLmgwIzhuYXHWhp1bSkPlwIjZ/5GRqGr1nAfi8LwiGcNiQm+krf8qEnfB4w/6iaqkeTFwjpRibsUtNI52X9ChVuiK6mz04i3pD2F9wKPMH4JymEFMcptLmX4jC2JwaVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nfmaz8Rz; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nfmaz8Rz; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nfmaz8Rz;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nfmaz8Rz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5qz2vgRz2ym2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:00:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G4HyaliWLgvplqkgqKCCNJ5/P2ZKVlm1Wsjs2FxXnxE=;
	b=Nfmaz8RzRu1UnebHGrZEiLRELJFv0BQIH7x83ZQDhbpRpHfCS2eWIYJWcVrPizbWpMM/d4
	07/f86TvOqKqTViDAZyxjBxsK+im5vwaFAOw3mBsbN+VXORm6a/EcM3yO8dFrI/PZhusmV
	ZABGj4cJEfIxJV6HK39QaYEerqfJ9D4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G4HyaliWLgvplqkgqKCCNJ5/P2ZKVlm1Wsjs2FxXnxE=;
	b=Nfmaz8RzRu1UnebHGrZEiLRELJFv0BQIH7x83ZQDhbpRpHfCS2eWIYJWcVrPizbWpMM/d4
	07/f86TvOqKqTViDAZyxjBxsK+im5vwaFAOw3mBsbN+VXORm6a/EcM3yO8dFrI/PZhusmV
	ZABGj4cJEfIxJV6HK39QaYEerqfJ9D4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-fnuIDCFpM1KROfAabPQnzw-1; Mon, 30 Jun 2025 09:00:42 -0400
X-MC-Unique: fnuIDCFpM1KROfAabPQnzw-1
X-Mimecast-MFC-AGG-ID: fnuIDCFpM1KROfAabPQnzw_1751288441
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4eeed54c2so1643217f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288440; x=1751893240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4HyaliWLgvplqkgqKCCNJ5/P2ZKVlm1Wsjs2FxXnxE=;
        b=OTD43gXLRdy8C3HpqlDcomQvfdV0BZYGgQfMO+X3gHassj7L83Yh6yyBtW70l9ra2C
         Y9VPesuNUnxx7UnlW1+5CKZNRfcD3NIIp+DcOqmQkWsRMx6uzrkMTXHZD+21rRsz71pr
         E4jhBWeZdeSVr9YWr2qBnZMY0FZw2eNYIRvKSs+vch2N8SSuZR9AmlengOif/4Su7pLr
         +HSPJRehDq5Vf5ldp2urzJT5ysOJTnf7e0RFF956GPvUfBd8LgO5uakuA8FNAU9sl7cU
         CowsFCsZEOAnklwzM4Eb+lioCuCclDNpN/CZamnrglVqrs/pP6t5birD46L5BuYDdbem
         Sihw==
X-Forwarded-Encrypted: i=1; AJvYcCUM+ixsb4cBkmCvMVewkwHHT3KW0E1uaVKgFgc3qT+9dj+RL1ejhEdJbRI2h+fQKBhzEfxv+VBFy/27WzQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyagiFjoi+B9tOI0LTrFD/HKxp7ACWEZD36eg5+pMEVmKfLOu9b
	6qQHq1ocCPlJDGwb9NiFFb1otK5V7GFsUqnIvlMGw03uVfOpz7D8F90zIhrljsfkpOR1PFrYtjL
	lzirHgxDAVYIPvJzJEzgfzY+kq+YE8SsyUnfZVf42+duaW8dLcK+FBuuuTvcF2mGjI7c=
X-Gm-Gg: ASbGncul8YXWIpnt5lmOcnUbC9oYscIGVDHd4da4Bs2txMzOejez1MkQ/LQQrjJML5e
	2CYxvKpdE1EHGYtK64hVWBYLYHmxFWoHd4J9Q74Wcra5fDztP0QY+VlyPl91d8+i65ysp+dHaWJ
	VYb+HTT9E6d8YRbDJau2ev+78B+Spy1wv4YeVcvIuI0gpsyzazmslzNQwoTyBQonUmVoPU4t1DU
	iqM0PI5D+YzD+oQZipR0byKJGPvH3plGMGx06M+GkKqVCUQzxSB0S+6sgMfkX6gt6nuthxZ1AG8
	7YrSPi+rOnqDWryxyxogBORHkXafUjQ4LT3RPOlYepC6GJFGU0wG+gbz9fiKSXGicmLJPzCcCsN
	3yXNqQ1g=
X-Received: by 2002:adf:b649:0:b0:3a4:cf40:ff37 with SMTP id ffacd0b85a97d-3a8f45494cdmr9831098f8f.6.1751288439986;
        Mon, 30 Jun 2025 06:00:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEehlYPXkAQhWmsU6NKWbFkXt51tuHaEnt5gEo+HlKa0FWalrdKbSodH+fk72qwn9YuXcO6g==
X-Received: by 2002:adf:b649:0:b0:3a4:cf40:ff37 with SMTP id ffacd0b85a97d-3a8f45494cdmr9830683f8f.6.1751288436787;
        Mon, 30 Jun 2025 06:00:36 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e5b2a7sm10408982f8f.69.2025.06.30.06.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:36 -0700 (PDT)
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
Subject: [PATCH v1 08/29] mm/migrate: rename putback_movable_folio() to putback_movable_ops_page()
Date: Mon, 30 Jun 2025 14:59:49 +0200
Message-ID: <20250630130011.330477-9-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: ox5VJaFvN877gPlqBrt71jo0JDTxBei91cC7pQYw6tQ_1751288441
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

... and factor the complete handling of movable_ops pages out.
Convert it similar to isolate_movable_ops_page().

While at it, convert the VM_BUG_ON_FOLIO() into a VM_WARN_ON_PAGE().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/migrate.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index d4b4a7eefb6bd..d97f7cd137e63 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -133,12 +133,30 @@ bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 	return false;
 }
 
-static void putback_movable_folio(struct folio *folio)
+/**
+ * putback_movable_ops_page - putback an isolated movable_ops page
+ * @page: The isolated page.
+ *
+ * Putback an isolated movable_ops page.
+ *
+ * After the page was putback, it might get freed instantly.
+ */
+static void putback_movable_ops_page(struct page *page)
 {
-	const struct movable_operations *mops = folio_movable_ops(folio);
-
-	mops->putback_page(&folio->page);
-	folio_clear_isolated(folio);
+	/*
+	 * TODO: these pages will not be folios in the future. All
+	 * folio dependencies will have to be removed.
+	 */
+	struct folio *folio = page_folio(page);
+
+	VM_WARN_ON_ONCE_PAGE(!PageIsolated(page), page);
+	folio_lock(folio);
+	/* If the page was released by it's owner, there is nothing to do. */
+	if (PageMovable(page))
+		page_movable_ops(page)->putback_page(page);
+	ClearPageIsolated(page);
+	folio_unlock(folio);
+	folio_put(folio);
 }
 
 /*
@@ -166,14 +184,7 @@ void putback_movable_pages(struct list_head *l)
 		 * have PAGE_MAPPING_MOVABLE.
 		 */
 		if (unlikely(__folio_test_movable(folio))) {
-			VM_BUG_ON_FOLIO(!folio_test_isolated(folio), folio);
-			folio_lock(folio);
-			if (folio_test_movable(folio))
-				putback_movable_folio(folio);
-			else
-				folio_clear_isolated(folio);
-			folio_unlock(folio);
-			folio_put(folio);
+			putback_movable_ops_page(&folio->page);
 		} else {
 			node_stat_mod_folio(folio, NR_ISOLATED_ANON +
 					folio_is_file_lru(folio), -folio_nr_pages(folio));
-- 
2.49.0


