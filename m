Return-Path: <linuxppc-dev+bounces-15787-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E31DD236D2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 10:21:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsHY06VfWz3bfG;
	Thu, 15 Jan 2026 20:21:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768468884;
	cv=none; b=agrc9IjVM8OwaUSymvhMvpLGIiUceFSBRPqFYZePIQM+MzxWeKy6NpMicvSqcwwfeQLlcNRAfg89o8ViMtMr3l0eo7Q59437Z9XMbif2xBsSXRF2MbKT/mXnxATugA7oLoPep0lWUnagz+TyQNixAiMlRnlvzSKdvPJWXXMxth8i8bWPME8asmVvcaBpFz3vzmYEF90PFrLNZcd5NU7cQR7C04Iq42pTSMQlNfbP+ax0awtISthXLe4AaOXPdVYhL/Aizc7rgVv3oxEOHTkdTwLsjAJ9GG9HusNGKR9cGnYrJwPGJN6Ec3WPeKZ9JtT1TuVcGdY2n4OCtTqp6canWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768468884; c=relaxed/relaxed;
	bh=bJziUzGzHf4QWNPduhl02b2b/9RHNUokTHG7NwHEsoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jPloG5but3eTkE+4OCmjMde3is4amwxhY3MskdA0mTDPu4Ap0S2W6MIkOy4cZKd33nsEM0MY1BV8wvLUTZGYFQNlOVkHTtjTueU/s/mWA54LggiuWCHxH1hH2gnBj8xV6H+7Od01y6dr59xeUhyJI9S1gQywjXe8uoeAI3dgxAuyn8qD57v1mI09XHT2E5mcA2XOKLejRTNqJqqF7F1AEvBunRXndBisMWkr4wWo2Ud4b7LNUuGX3d7E8rl9N0/QjYSrfGSAClgxh8g8mrQE4/7TmyAa3x66JMPHTznGNadALD7jCGSYN0RS9IhXcW+TwVZv/8YGPHUi4LONFNB1OA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y80rnCdR; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y80rnCdR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsHY00B0Tz309H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 20:21:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB48C601B4;
	Thu, 15 Jan 2026 09:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38841C19424;
	Thu, 15 Jan 2026 09:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768468879;
	bh=veUhuhby/6KA1wTGAfzOWG6HhKwBm4jTGxQAtB2JN04=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y80rnCdR8i6QTBR4X0ercdmfP5fWPB/ngV2MfzPjAt7B4m60e7IbTK3/Ma6HEAuq+
	 QUt/zdaQlg8x9WbmdCyE1sH3CDUE0uvYEcknpWrgTAZozhHGsoLJPDpb7oJPVDvNYm
	 cTSTxYTkjE5k+V5e4y/uZBGp+CjbFhs2BoZrQGsyMt0JRiwN3JYXaAgGRy9AbkpsRO
	 fvOg3qiwVop/b+rEqyMGRAQwYYQxQJ0C2j4H9vtBT0KX4WqgnY1Z3UUawCkbnIEm7d
	 l6M4kuVPU6Qv2aD32llalJ8A6qICE4gMEFFcRL1cZWM2qAfD7F1hy9tMSg6ctz2fWC
	 UFh+UyNyfdFkA==
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	"David Hildenbrand (Red Hat)" <david@kernel.org>,
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
Subject: [PATCH v2 08/23] mm/balloon_compaction: remove dependency on page lock
Date: Thu, 15 Jan 2026 10:19:58 +0100
Message-ID: <20260115092015.3928975-9-david@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115092015.3928975-1-david@kernel.org>
References: <20260115092015.3928975-1-david@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
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

Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 include/linux/balloon_compaction.h | 25 ++++++++++----------
 mm/balloon_compaction.c            | 38 ++++++++++--------------------
 2 files changed, 25 insertions(+), 38 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index 9a8568fcd477d..ad594af6ed100 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -12,25 +12,27 @@
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
  *      device page list under balloon_pages_lock
  *
- * The functions provided by this interface are placed to help on coping with
- * the aforementioned balloon page corner case, as well as to ensure the simple
- * set of exposed rules are satisfied while we are dealing with balloon pages
- * compaction / migration.
- *
  * Copyright (C) 2012, Red Hat, Inc.  Rafael Aquini <aquini@redhat.com>
  */
 #ifndef _LINUX_BALLOON_COMPACTION_H
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
2.52.0


