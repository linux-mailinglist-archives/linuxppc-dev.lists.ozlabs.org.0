Return-Path: <linuxppc-dev+bounces-9887-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD70EAEDDD9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:01:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5qr2qhtz30RK;
	Mon, 30 Jun 2025 23:00:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288440;
	cv=none; b=gi4UD0aXKjFtKtdzqIwtCBOAwDfubY4SiewZUVNpEcp2lhc23rJZGEtULgQSYOKmQmtzL+qWnvnZ7Ouy/SLOBZId4w+cnZzheLlC/fPJAPjwQZOiwNVeBBwoBlvtB5pzIkog63/PfAAS8bHdFoW9GsKSWy9ImA/t0OxeR7EumuC7gEt10+o6zH0PdmCt6EYWQzM72zeah5ISl29rUqt1tukjhVy0abv3ejo3+XIK0SkNSAcRsN+Z/RkNJcxe2Piqk0UmrSEEwFJx8FPCLUTcvBi4r/udJcx225Lq6yojdmmsWkETnrLK30xIlZug2166bwkxgzR/4q1DKdsRIYY9OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288440; c=relaxed/relaxed;
	bh=hwmXAEBDYo8DkjDdp6VkbgoCuZIqYMKAJtJSkdjCkPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=UL/0GEMg//yujTME54W+6GxcJWN2nKIC/2OZnKM8vSrd4BHgUkrNz4vXaiqCa+883i6ZdJJqL+7UdZxyn0+8qhkz1OUEJ1ld8PLv/hAxOXzc8qWCRAOpDZsZ1VkDGuge0UNDC+FDK3+NLxqQsYznbExcbQKgKZr1q6QhbKKdsXTLTgFpn40LSBisc45dwJjIereNFEjFNUfVUfB9wsd9k/R30KxNlQ59lb9vhbZuQl5j6zOgXfuB8bPtxSwcyMsc1ZUfyekexmvi8ZuhqtW4RqD2lu5H4M65Fu5shDoYEaCxpkoZXOV9zdNBtb0oR+o8MnzV3GGMOK1RCMsAdVmgAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AEdWlruV; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PtDR2LM8; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AEdWlruV;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PtDR2LM8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5qq1YkLz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:00:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hwmXAEBDYo8DkjDdp6VkbgoCuZIqYMKAJtJSkdjCkPU=;
	b=AEdWlruVKR8RhhH+CKafv+vgdh79qlejWuzmSL1As6mJ5Q8Xxj4VhIi/TAwIn4WW9B3dVN
	d30LBOIgFe/Hcb76TeI6All53WQOU5bpKQeS688++1WjNV4x/7D4emfxYtUMmZu06qYz7R
	cX6QkVZc6UjpUOdE/xUXMrUsL4X4hHw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hwmXAEBDYo8DkjDdp6VkbgoCuZIqYMKAJtJSkdjCkPU=;
	b=PtDR2LM8lZ0c/K3teGEddAO55rTyA6IyiJ8AycMthmuCMDKM1eUyBctvhFzptjiufIV6Xy
	xbv616fG7bH4bJW2xv/EdTHLHUTckRTy/mozykS7UO5lIaKMnJbIuiYxMGEb6uvBhr+GAQ
	bo62PdFA2Mb9jmZ1zeXwocqbHVDWFd8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-58fgBdUQMzuzbSk6cckKxA-1; Mon, 30 Jun 2025 09:00:22 -0400
X-MC-Unique: 58fgBdUQMzuzbSk6cckKxA-1
X-Mimecast-MFC-AGG-ID: 58fgBdUQMzuzbSk6cckKxA_1751288421
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f65a705dso1184434f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288421; x=1751893221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwmXAEBDYo8DkjDdp6VkbgoCuZIqYMKAJtJSkdjCkPU=;
        b=G6bygnkq5OIoDx17i1MR2oUsUNqFm0u+YNCc/fy4eKRqJ2pCU2dj28JHU/OKAxw31C
         3F0pm7Ck4hWlaFl5gXfBLqxj6+/KajNhwkJy3YmJPNxy7Se7QH6RDk2XGnZorbFl0A11
         mBZauJv5AyIZ82oR2CZ/lIVrQH67hWe/n5ZjoXoWizr98oq6J6j0JgLXBJJfsJk2YI+3
         OOAqbxfb85Sajf3uwauiLoDUvq7pL9l1WN9/aFtVooTaDvL93obGJZShWRSXVzMAl7ZH
         LAFkN9JwK5vCUKqwG8sWjM4VwvX63p0w0T2U/Ox056qQzJK/XaHW7TV0kmp3h6c0IMfl
         kxcA==
X-Forwarded-Encrypted: i=1; AJvYcCXZJoFK1+inA27HabPOKUAMWqq3Sjz2PD4i5W9GEr1JDZBt26cHru/IRDucKEQzTf0pciCNstaCnW9/uB0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyM0VM+jK91PD3/P4p1lNhlBjeIDbqVNrKEH19tBW1xCgu2ckFK
	CWb/XIBgHPAiEDimM7+nbM8NjIEtEUMgLfcjSZfvCkGWooTyXlLveToal8RXclpPA9g9tyGYc7X
	gKTej0t2TIcB5t/lFGCV092ztwnI1/0yti+Y+n/3DkT8iKLk/LvZ+EpTfwuQoOFAZ6rQ=
X-Gm-Gg: ASbGncu0pWfsAbJ4SMgT2jB5BQYY0IAkyO5G3owxo5sC6cjQV7n7Vpk48YkFSmD0K9j
	6EmQlcw26FN1HP5b5qSg5g01eJK0Nc2HLGQdUxGimtTD57oWVmIQrPQgWeMCTl7ZM7Nsl0Gwr+x
	fOgG/nOXPMUVpZJqhHXtghdiXTmZcyzbH0eHHTslFXg9isrMxhstnmjUA4MwYh5wHHw4CNXKbLK
	hD3wrfIS7LVXRWN/oFfVrP+3fGvmbyOIqIwPHT55dyIybdcSf/y0glYAmdy/nucN4lMP5QVMkOV
	5UYVvXxigTQNpvsfjJNXQrvnx5RplUB7gKtRzb+kSLazN0OuJBnNN8PZRKJB87qMGrBCUfhBKz0
	QnUi4J7w=
X-Received: by 2002:a05:6000:4186:b0:3a4:db49:94aa with SMTP id ffacd0b85a97d-3a8f482c7a3mr12061849f8f.21.1751288420581;
        Mon, 30 Jun 2025 06:00:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0gb3C+C+LV4oU6wKBD78SFqxqmgRCphVWjbRDEuvh0xGGV6ZK62AjmpQKGwfy92kungebyQ==
X-Received: by 2002:a05:6000:4186:b0:3a4:db49:94aa with SMTP id ffacd0b85a97d-3a8f482c7a3mr12061792f8f.21.1751288419988;
        Mon, 30 Jun 2025 06:00:19 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a88c7facf9sm10288204f8f.22.2025.06.30.06.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:19 -0700 (PDT)
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
Subject: [PATCH v1 02/29] mm/balloon_compaction: convert balloon_page_delete() to balloon_page_finalize()
Date: Mon, 30 Jun 2025 14:59:43 +0200
Message-ID: <20250630130011.330477-3-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: dM185Ef82yPqAm77R5gFXDvKnA4D92EsIDOi6Bkzf-U_1751288421
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's move the removal of the page from the balloon list into the single
caller, to remove the dependency on the PG_isolated flag and clarify
locking requirements.

We'll shuffle the operations a bit such that they logically make more sense
(e.g., remove from the list before clearing flags).

In balloon migration functions we can now move the balloon_page_finalize()
out of the balloon lock and perform the finalization just before dropping
the balloon reference.

Document that the page lock is currently required when modifying the
movability aspects of a page; hopefully we can soon decouple this from the
page lock.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/pseries/cmm.c |  2 +-
 drivers/misc/vmw_balloon.c           |  3 +-
 drivers/virtio/virtio_balloon.c      |  4 +--
 include/linux/balloon_compaction.h   | 43 +++++++++++-----------------
 mm/balloon_compaction.c              |  3 +-
 5 files changed, 21 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
index 5f4037c1d7fe8..5e0a718d1be7b 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -532,7 +532,6 @@ static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
 
 	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
 	balloon_page_insert(b_dev_info, newpage);
-	balloon_page_delete(page);
 	b_dev_info->isolated_pages--;
 	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
 
@@ -542,6 +541,7 @@ static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
 	 */
 	plpar_page_set_active(page);
 
+	balloon_page_finalize(page);
 	/* balloon page list reference */
 	put_page(page);
 
diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
index c817d8c216413..6653fc53c951c 100644
--- a/drivers/misc/vmw_balloon.c
+++ b/drivers/misc/vmw_balloon.c
@@ -1778,8 +1778,7 @@ static int vmballoon_migratepage(struct balloon_dev_info *b_dev_info,
 	 * @pages_lock . We keep holding @comm_lock since we will need it in a
 	 * second.
 	 */
-	balloon_page_delete(page);
-
+	balloon_page_finalize(page);
 	put_page(page);
 
 	/* Inflate */
diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 89da052f4f687..e299e18346a30 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -866,15 +866,13 @@ static int virtballoon_migratepage(struct balloon_dev_info *vb_dev_info,
 	tell_host(vb, vb->inflate_vq);
 
 	/* balloon's page migration 2nd step -- deflate "page" */
-	spin_lock_irqsave(&vb_dev_info->pages_lock, flags);
-	balloon_page_delete(page);
-	spin_unlock_irqrestore(&vb_dev_info->pages_lock, flags);
 	vb->num_pfns = VIRTIO_BALLOON_PAGES_PER_PAGE;
 	set_page_pfns(vb, vb->pfns, page);
 	tell_host(vb, vb->deflate_vq);
 
 	mutex_unlock(&vb->balloon_lock);
 
+	balloon_page_finalize(page);
 	put_page(page); /* balloon reference */
 
 	return MIGRATEPAGE_SUCCESS;
diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index 5ca2d56996201..b9f19da37b089 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -97,27 +97,6 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
 	list_add(&page->lru, &balloon->pages);
 }
 
-/*
- * balloon_page_delete - delete a page from balloon's page list and clear
- *			 the page->private assignement accordingly.
- * @page    : page to be released from balloon's page list
- *
- * Caller must ensure the page is locked and the spin_lock protecting balloon
- * pages list is held before deleting a page from the balloon device.
- */
-static inline void balloon_page_delete(struct page *page)
-{
-	__ClearPageOffline(page);
-	__ClearPageMovable(page);
-	set_page_private(page, 0);
-	/*
-	 * No touch page.lru field once @page has been isolated
-	 * because VM is using the field.
-	 */
-	if (!PageIsolated(page))
-		list_del(&page->lru);
-}
-
 /*
  * balloon_page_device - get the b_dev_info descriptor for the balloon device
  *			 that enqueues the given page.
@@ -141,12 +120,6 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
 	list_add(&page->lru, &balloon->pages);
 }
 
-static inline void balloon_page_delete(struct page *page)
-{
-	__ClearPageOffline(page);
-	list_del(&page->lru);
-}
-
 static inline gfp_t balloon_mapping_gfp_mask(void)
 {
 	return GFP_HIGHUSER;
@@ -154,6 +127,22 @@ static inline gfp_t balloon_mapping_gfp_mask(void)
 
 #endif /* CONFIG_BALLOON_COMPACTION */
 
+/*
+ * balloon_page_finalize - prepare a balloon page that was removed from the
+ *			   balloon list for release to the page allocator
+ * @page: page to be released to the page allocator
+ *
+ * Caller must ensure that the page is locked.
+ */
+static inline void balloon_page_finalize(struct page *page)
+{
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
+		__ClearPageMovable(page);
+		set_page_private(page, 0);
+	}
+	__ClearPageOffline(page);
+}
+
 /*
  * balloon_page_push - insert a page into a page list.
  * @head : pointer to list
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index fcb60233aa35d..ec176bdb8a78b 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -94,7 +94,8 @@ size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
 		if (!trylock_page(page))
 			continue;
 
-		balloon_page_delete(page);
+		list_del(&page->lru);
+		balloon_page_finalize(page);
 		__count_vm_event(BALLOON_DEFLATE);
 		list_add(&page->lru, pages);
 		unlock_page(page);
-- 
2.49.0


