Return-Path: <linuxppc-dev+bounces-13097-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D569BF69A9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 15:00:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crXSs1wXYz3dVD;
	Tue, 21 Oct 2025 23:59:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761051597;
	cv=none; b=fuZ9ig9RSMwZBoXDRugTAeOloqmGxLEdR6gc/ImqTlQ3GBzAJLJHNs4OLsBlvM2lE9PD4DHrT+jc2g8+e6LAIS4mrfX9sXWtkPoUaHCEikE5fg6RWzeWp0wmuFEMkqWtzPPxaEt/DOdViL0k9rofKXZlXpYdznXPsxKL7FZVx2aesLfv1RjJLD3zk+hExciHNxOmh0xdo6Kpno9NgHi6SdVmRM4ejT8G3mwjq+jwCryPgb0x4BfFMVV3OQ8sqGR76+y+JnLHtvupVXVq9cDcj4ahnLpQmS9XBiarMes4wtJuIRvWeS2VZklHPFwyy9vUh68ARdGtapioGG0Eu7lGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761051597; c=relaxed/relaxed;
	bh=Bd8gqizIzdxCBecoKAkM92GzGk5zRQnzgqcXQENTV8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=LDKXwodNN0vrGTNUm1+m66UQ956IZJEfGTzVCiffWta/r9nPR0ZFxtqiGO15E3RyVOiGjan3rNWaUCzhBXuZDs4vfWADSOYArR5MaCSsltEKSLhgI32IhMA93wfNdW2jNML7uSUqyDqbk0ecyOi9lMNEXZga+uBZP+ocWDENCTFw2S/Oxcj4agKOhRW5xrn7wq7A8mgiSok1wsuXmSR21bk7QoIpj/1tp0WfAZb7Uv8YL7a00JLXL7PcEweIAJWl9fOATjZpsjzSJId5woyIvj1UOCH4ktAM4wfinEabnXsb5GX2Agn8MTfdt5plEiweHVU9hCMqfGlDQeqa5QZrFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YnBtzOsU; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YnBtzOsU; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YnBtzOsU;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YnBtzOsU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crXSr3YF6z3dVB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 23:59:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bd8gqizIzdxCBecoKAkM92GzGk5zRQnzgqcXQENTV8k=;
	b=YnBtzOsUNL6j2V6keTKnwsGEFk+t9hLZYGKYJ5twrWkqmW30ZxY4a9LLlhtpjkcuAsa/r6
	saDvrojl81moLDcqoszIQuQ1gajL8KNGBSurE6TbQcAAG6diTkm8z3i8ySKbu/5t0+lbdn
	xYF3NcEJIBP1JmFWtCNR12KhevAm8TU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bd8gqizIzdxCBecoKAkM92GzGk5zRQnzgqcXQENTV8k=;
	b=YnBtzOsUNL6j2V6keTKnwsGEFk+t9hLZYGKYJ5twrWkqmW30ZxY4a9LLlhtpjkcuAsa/r6
	saDvrojl81moLDcqoszIQuQ1gajL8KNGBSurE6TbQcAAG6diTkm8z3i8ySKbu/5t0+lbdn
	xYF3NcEJIBP1JmFWtCNR12KhevAm8TU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-QB_lx8DNPYGKgPEe1Qd9AQ-1; Tue, 21 Oct 2025 08:59:51 -0400
X-MC-Unique: QB_lx8DNPYGKgPEe1Qd9AQ-1
X-Mimecast-MFC-AGG-ID: QB_lx8DNPYGKgPEe1Qd9AQ_1761051591
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-471001b980eso34246345e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 05:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051590; x=1761656390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bd8gqizIzdxCBecoKAkM92GzGk5zRQnzgqcXQENTV8k=;
        b=M/uNe2b7bGRFHVGbM4wFIbAvu8ojQkaJAXBpIlhjYZdWMlTtP/TPIfgO1LbzdLgI4o
         ek4Hta9v2V+yInUMSlNOsmZBXwYFV2k3Rm+5TvD/IsF4haEZrYTJrkMw5Y7Y4vf/xPxB
         BeMEZLKRuUWlu2nQYSsvZhr8uTOFx8esz2IObOaX2TP+3EonQAdlSX7iFCBKOpeYi0Oy
         1jE3EGDbUcYpoxK/ojr3ty1qelXhXAomkTc5AjbumDVNYTYw5KpxdnJw8l+617Ox07nG
         Sat4bNqBD5FFzgebBU4NtN+TBcfuDZFyPZvKDfUo+FOtKbNomR+/BO7PdVeF11rDR/GO
         V5hw==
X-Forwarded-Encrypted: i=1; AJvYcCVCFlyRs9JpxskQS6uI43yHu3dpMjT7w5NByDj/oQvzrKyGQQA9S3pvIFqumL7NpjfO1FC1Lh2R4MikB4Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzAcnLHZVm2KBgbmjJiStVoNTOa7WtNAkO7HsBt05Xm0EnU37/e
	9Wri+YrY19AvQGB1dPqWGiKAAes7Su5bZpNIyFASb6j1awyc52twN623KoBu8XRjZ5r1oh0Wuq/
	jB5ORI9B1jW+jh2u8UGOSfz67IfoCsJnzscdqVvmmTKVN0tvnfogGMyFKr1aqVYcQdX4=
X-Gm-Gg: ASbGnctfT6pw0dNXdka7ElgN6I3RNQW5Os/TSF9tgE3cTMskBs6JqGVy1G9nIzVRCnt
	MxHb8AkAwChEBNWTwyh8f1I6giLSJpWB/hOogifyqyw7rFHHvh9HdjS2S9H/3eEEdH/pZ30PU80
	uq9PvowPMYIF6El9LZpwE1CjKrRD1rQT+DlNTG04GHTmjs8nvrtD/wsKTPOoOn4YR2lFiv7jN2S
	k2ob9dr16M79sMgXcL0qFGE2DVSk0R4VfYkc0BeMBbtbXSrPCd7i5Ns81GFEuCy372/uk4SlMEe
	/6pjAsdAKmfKdhOFYiXBG2eWlJ6KbHhD+U4zcYrgHs+wRFjFnfes/6qx0d0ePIRbIIGkLbwNuS8
	jZXeCAee9jGpfX7jXNkJDLebLX7WI77OmTP9NCCQaEcAQiCvKLFeXvOdpCiNW
X-Received: by 2002:a05:600c:3e17:b0:46f:c576:189a with SMTP id 5b1f17b1804b1-4711791c3c3mr130359865e9.29.1761051590563;
        Tue, 21 Oct 2025 05:59:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdxh7ZKT7824WXcxtADh1plje6WLOr4tApQ2cZuBwyOs4GdyEk8i7jKfPxnpNj/2+0EbpvXg==
X-Received: by 2002:a05:600c:3e17:b0:46f:c576:189a with SMTP id 5b1f17b1804b1-4711791c3c3mr130359575e9.29.1761051590107;
        Tue, 21 Oct 2025 05:59:50 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47494aa0336sm18536345e9.1.2025.10.21.05.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:59:49 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH v1 08/23] mm/balloon_compaction: remove dependency on page lock
Date: Tue, 21 Oct 2025 14:59:13 +0200
Message-ID: <20251021125929.377194-9-david@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021125929.377194-1-david@redhat.com>
References: <20251021125929.377194-1-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: dOmheDNLxPpklHF7rOTXz5WXRB5aXLmX9llMByJDt9E_1761051591
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's stop using the page lock in balloon code and instead use only the
balloon_device_lock.

As soon as we set the PG_movable_ops flag, we might now get isolation
callbacks for that page as we are no longer holding the page lock. In
there, we'll simply synchronize using the balloon_device_lock.

So in balloon_page_isolate() lookup the balloon_dev_info through
page->private under balloon_device_lock.

It's crucial that we update page->private under the balloon_device_lock,
so the isolation callback can properly deal with concurrent deflation.

Consequently, make sure that balloon_page_finalize() is called under
balloon_device_lock as we remove a page from the list and clear
page->private. balloon_page_insert() is already called with the
balloon_device_lock held.

Note that the core will still lock the pages, for example in
isolate_movable_ops_page(). The lock is there still relevant for
handling the PageMovableOpsIsolated flag, but that can be later changed
to use an atomic test-and-set instead, or moved into the movable_ops
backends.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 27 +++++++++++----------
 mm/balloon_compaction.c            | 38 ++++++++++--------------------
 2 files changed, 26 insertions(+), 39 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index e2d9eb40e1fbb..ad594af6ed100 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -12,24 +12,26 @@
  * is derived from the page type (PageOffline()) combined with the
  * PG_movable_ops flag (PageMovableOps()).
  *
+ * Once the page type and the PG_movable_ops are set, migration code
+ * can initiate page isolation by invoking the
+ * movable_operations()->isolate_page() callback
+ *
+ * As long as page->private is set, the page is either on the balloon list
+ * or isolated for migration. If page->private is not set, the page is
+ * either still getting inflated, or was deflated to be freed by the balloon
+ * driver soon. Isolation is impossible in both cases.
+ *
  * As the page isolation scanning step a compaction thread does is a lockless
  * procedure (from a page standpoint), it might bring some racy situations while
  * performing balloon page compaction. In order to sort out these racy scenarios
  * and safely perform balloon's page compaction and migration we must, always,
  * ensure following these simple rules:
  *
- *   i. Setting the PG_movable_ops flag and page->private with the following
- *	lock order
- *	    +-page_lock(page);
- *	      +--spin_lock_irq(&balloon_pages_lock);
+ *   i. Inflation/deflation must set/clear page->private under the
+ *      balloon_pages_lock
  *
  *  ii. isolation or dequeueing procedure must remove the page from balloon
- *      device page list under &balloon_pages_lock
- *
- * The functions provided by this interface are placed to help on coping with
- * the aforementioned balloon page corner case, as well as to ensure the simple
- * set of exposed rules are satisfied while we are dealing with balloon pages
- * compaction / migration.
+ *      device page list under balloon_pages_lock
  *
  * Copyright (C) 2012, Red Hat, Inc.  Rafael Aquini <aquini@redhat.com>
  */
@@ -93,8 +95,7 @@ static inline struct balloon_dev_info *balloon_page_device(struct page *page)
  * @balloon : pointer to balloon device
  * @page    : page to be assigned as a 'balloon page'
  *
- * Caller must ensure the page is locked and the spin_lock protecting balloon
- * pages list is held before inserting a page into the balloon device.
+ * Caller must ensure the balloon_pages_lock is held.
  */
 static inline void balloon_page_insert(struct balloon_dev_info *balloon,
 				       struct page *page)
@@ -119,7 +120,7 @@ static inline gfp_t balloon_mapping_gfp_mask(void)
  *			   balloon list for release to the page allocator
  * @page: page to be released to the page allocator
  *
- * Caller must ensure that the page is locked.
+ * Caller must ensure the balloon_pages_lock is held.
  */
 static inline void balloon_page_finalize(struct page *page)
 {
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 97e838795354d..28ef0cb6b3bbc 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -20,15 +20,7 @@ static DEFINE_SPINLOCK(balloon_pages_lock);
 static void balloon_page_enqueue_one(struct balloon_dev_info *b_dev_info,
 				     struct page *page)
 {
-	/*
-	 * Block others from accessing the 'page' when we get around to
-	 * establishing additional references. We should be the only one
-	 * holding a reference to the 'page' at this point. If we are not, then
-	 * memory corruption is possible and we should stop execution.
-	 */
-	BUG_ON(!trylock_page(page));
 	balloon_page_insert(b_dev_info, page);
-	unlock_page(page);
 	if (b_dev_info->adjust_managed_page_count)
 		adjust_managed_page_count(page, -1);
 	__count_vm_event(BALLOON_INFLATE);
@@ -93,22 +85,12 @@ size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
 	list_for_each_entry_safe(page, tmp, &b_dev_info->pages, lru) {
 		if (n_pages == n_req_pages)
 			break;
-
-		/*
-		 * Block others from accessing the 'page' while we get around to
-		 * establishing additional references and preparing the 'page'
-		 * to be released by the balloon driver.
-		 */
-		if (!trylock_page(page))
-			continue;
-
 		list_del(&page->lru);
 		if (b_dev_info->adjust_managed_page_count)
 			adjust_managed_page_count(page, 1);
 		balloon_page_finalize(page);
 		__count_vm_event(BALLOON_DEFLATE);
 		list_add(&page->lru, pages);
-		unlock_page(page);
 		dec_node_page_state(page, NR_BALLOON_PAGES);
 		n_pages++;
 	}
@@ -213,13 +195,19 @@ EXPORT_SYMBOL_GPL(balloon_page_dequeue);
 static bool balloon_page_isolate(struct page *page, isolate_mode_t mode)
 
 {
-	struct balloon_dev_info *b_dev_info = balloon_page_device(page);
+	struct balloon_dev_info *b_dev_info;
 	unsigned long flags;
 
-	if (!b_dev_info)
-		return false;
-
 	spin_lock_irqsave(&balloon_pages_lock, flags);
+	b_dev_info = balloon_page_device(page);
+	if (!b_dev_info) {
+		/*
+		 * The page already got deflated and removed from the
+		 * balloon list.
+		 */
+		spin_unlock_irqrestore(&balloon_pages_lock, flags);
+		return false;
+	}
 	list_del(&page->lru);
 	b_dev_info->isolated_pages++;
 	spin_unlock_irqrestore(&balloon_pages_lock, flags);
@@ -249,9 +237,6 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
 	unsigned long flags;
 	int rc;
 
-	VM_BUG_ON_PAGE(!PageLocked(page), page);
-	VM_BUG_ON_PAGE(!PageLocked(newpage), newpage);
-
 	/* Isolated balloon pages cannot get deflated. */
 	if (WARN_ON_ONCE(!b_dev_info))
 		return -EAGAIN;
@@ -291,10 +276,11 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
 	}
 
 	b_dev_info->isolated_pages--;
-	spin_unlock_irqrestore(&balloon_pages_lock, flags);
 
 	/* Free the now-deflated page we isolated in balloon_page_isolate(). */
 	balloon_page_finalize(page);
+	spin_unlock_irqrestore(&balloon_pages_lock, flags);
+
 	put_page(page);
 
 	return 0;
-- 
2.51.0


