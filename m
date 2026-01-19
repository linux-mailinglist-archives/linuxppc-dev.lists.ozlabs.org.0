Return-Path: <linuxppc-dev+bounces-16032-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C50D3BB30
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 00:02:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw5ZM2vgpz30M0;
	Tue, 20 Jan 2026 10:02:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768863739;
	cv=none; b=NsceZyd5C85L/Z3HqCJLcjhXs2ZMxKs2ktVhFazRXahCIWinh4TR1hjeqnV3/X6ZcWsaiytY+I4Pt6x46AHnXZHkLVtPfUtSCZyeng8nkvhImDs9SkS55L4IDfL57IbEUHOTaZIU1uHfymWIFBTdDkILT7249JUnREE3m/3eCp8+GWNZTIqHGt934CDZ5a60T5T2dNRc3QyC84Tvv5niyddLfZTyH61JxgNyMtsU0nixO5qHdZrvFtjoCNfFiHFkbnknNFn6/PQbrFvIUcauSsM9F+fmQvlNKYPHXMVQEZjxCB4C+G7T5DR25bYFxN/kD/FEjTe7rUkh4FEtnt/UhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768863739; c=relaxed/relaxed;
	bh=b+DFFypOC/10qVO8yIib8j/MVIUtdX9QOaobCQ6+bq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nvt2tAZukB4IwT9XveN8XfKLW0sysPLZ58NLP3UKAYN5XtXTop2JSOMvQnNTzDdHHLh1olXZtB/7znzHPDDzraMiPpS8wrYUZZ+JF6D0FAINcrk+vbiOKum1Y9Ii+7mzqXYn32lL3EYzVfvN0/Jh1kAnZbSTpAlNvx2hpcI3OJWadUrwgKNJvuQPVkTvS2Rg9278tDA8IPabV6cz+HJmaWrvXhpVMLwlheg8xy6s77ppvEImKIDOnRWkON6XEDfteFgfH5eCC6o1VDalFfVjkT48Ehby6NazCAsTReXn9/1JMNf4KbR92VmRfcRSMUI3JXGZMO5hy/ON5gCUM169CQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H0Tp7C+Y; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H0Tp7C+Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw5ZL4b6tz2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 10:02:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 08BDA434EA;
	Mon, 19 Jan 2026 23:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24201C116C6;
	Mon, 19 Jan 2026 23:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768863736;
	bh=24p8pe28M/olJp8gPe2KI8fAWybhc5W/Q/2dQB8WznY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H0Tp7C+YM+A/uQI/1du9fKf6+JaulSjW6UdekTe82Na5TlGxSOuOiTKnD3PwDOous
	 PXYMwxtHubYDyt9cf3scV8t08VlIVv4mhTg26OY53GrImPwI/atZTPwpPNb0M2FHqE
	 IuoZsEJm81OCwSvJu6hllGNQ/0c4YPN+mfgdwu02cHngSQXSJgQfU+dTCZT6qxlCRa
	 lfr4QlJi9xbT4N1tf9pPnMHnK8uuorGUrTekzGXv91Erq6HSUZJqO2vPp3QIhN3tcg
	 nSDTvOQNKoJ3fOBjWmgV20r9GanLaTbHj5+iTYkNwQqHMk5H5scYu5X/7oFXfbzc10
	 rXloLqGyhC1lQ==
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
Subject: [PATCH v3 05/24] mm/balloon_compaction: centralize basic page migration handling
Date: Tue, 20 Jan 2026 00:01:13 +0100
Message-ID: <20260119230133.3551867-6-david@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119230133.3551867-1-david@kernel.org>
References: <20260119230133.3551867-1-david@kernel.org>
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

Let's update the balloon page references, the balloon page list, the
BALLOON_MIGRATE counter and the isolated-pages counter in
balloon_page_migrate(), after letting the balloon->migratepage()
callback deal with the actual inflation+deflation.

Note that we now perform the balloon list modifications outside of any
implementation-specific locks: which is fine, there is nothing special
about these page actions that the lock would be protecting.

The old page is already no longer in the list (isolated) and the new page
is not yet in the list.

Let's use -ENOENT to communicate the special "inflation of new page
failed after already deflating the old page" to balloon_page_migrate() so
it can handle it accordingly.

While at it, rename balloon->b_dev_info to make it match the other
functions. Also, drop the comment above balloon_page_migrate(), which
seems unnecessary.

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 arch/powerpc/platforms/pseries/cmm.c | 16 ---------
 drivers/misc/vmw_balloon.c           | 49 +++++-----------------------
 drivers/virtio/virtio_balloon.c      | 12 -------
 mm/balloon_compaction.c              | 31 +++++++++++++++---
 4 files changed, 35 insertions(+), 73 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
index 9a6efbc80d2ad..15f873f733a41 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -501,8 +501,6 @@ static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
 			   struct page *newpage, struct page *page,
 			   enum migrate_mode mode)
 {
-	unsigned long flags;
-
 	/*
 	 * loan/"inflate" the newpage first.
 	 *
@@ -517,9 +515,6 @@ static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
 		return -EBUSY;
 	}
 
-	/* balloon page list reference */
-	get_page(newpage);
-
 	/*
 	 * When we migrate a page to a different zone, we have to fixup the
 	 * count of both involved zones as we adjusted the managed page count
@@ -530,22 +525,11 @@ static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
 		adjust_managed_page_count(newpage, -1);
 	}
 
-	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
-	balloon_page_insert(b_dev_info, newpage);
-	__count_vm_event(BALLOON_MIGRATE);
-	b_dev_info->isolated_pages--;
-	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
-
 	/*
 	 * activate/"deflate" the old page. We ignore any errors just like the
 	 * other callers.
 	 */
 	plpar_page_set_active(page);
-
-	balloon_page_finalize(page);
-	/* balloon page list reference */
-	put_page(page);
-
 	return 0;
 }
 #else /* CONFIG_BALLOON_COMPACTION */
diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
index 07e60a4b846aa..52b8c0f1eead7 100644
--- a/drivers/misc/vmw_balloon.c
+++ b/drivers/misc/vmw_balloon.c
@@ -1724,18 +1724,17 @@ static inline void vmballoon_debugfs_exit(struct vmballoon *b)
  * @page: a ballooned page that should be migrated.
  * @mode: migration mode, ignored.
  *
- * This function is really open-coded, but that is according to the interface
- * that balloon_compaction provides.
- *
  * Return: zero on success, -EAGAIN when migration cannot be performed
- *	   momentarily, and -EBUSY if migration failed and should be retried
- *	   with that specific page.
+ *	   momentarily, -EBUSY if migration failed and should be retried
+ *	   with that specific page, and -ENOENT when deflating @page
+ *	   succeeded but inflating @newpage failed, effectively deflating
+ *	   the balloon.
  */
 static int vmballoon_migratepage(struct balloon_dev_info *b_dev_info,
 				 struct page *newpage, struct page *page,
 				 enum migrate_mode mode)
 {
-	unsigned long status, flags;
+	unsigned long status;
 	struct vmballoon *b;
 	int ret = 0;
 
@@ -1773,14 +1772,6 @@ static int vmballoon_migratepage(struct balloon_dev_info *b_dev_info,
 		goto out_unlock;
 	}
 
-	/*
-	 * The page is isolated, so it is safe to delete it without holding
-	 * @pages_lock . We keep holding @comm_lock since we will need it in a
-	 * second.
-	 */
-	balloon_page_finalize(page);
-	put_page(page);
-
 	/* Inflate */
 	vmballoon_add_page(b, 0, newpage);
 	status = vmballoon_lock_op(b, 1, VMW_BALLOON_4K_PAGE,
@@ -1799,36 +1790,12 @@ static int vmballoon_migratepage(struct balloon_dev_info *b_dev_info,
 		 * change.
 		 */
 		atomic64_dec(&b->size);
-	} else {
 		/*
-		 * Success. Take a reference for the page, and we will add it to
-		 * the list after acquiring the lock.
+		 * Tell the core that we're deflating the old page and don't
+		 * need the new page.
 		 */
-		get_page(newpage);
-	}
-
-	/* Update the balloon list under the @pages_lock */
-	spin_lock_irqsave(&b->b_dev_info.pages_lock, flags);
-
-	/*
-	 * On inflation success, we already took a reference for the @newpage.
-	 * If we succeed just insert it to the list and update the statistics
-	 * under the lock.
-	 */
-	if (status == VMW_BALLOON_SUCCESS) {
-		balloon_page_insert(&b->b_dev_info, newpage);
-		__count_vm_event(BALLOON_MIGRATE);
-	} else {
-		__count_vm_event(BALLOON_DEFLATE);
+		ret = -ENOENT;
 	}
-
-	/*
-	 * We deflated successfully, so regardless to the inflation success, we
-	 * need to reduce the number of isolated_pages.
-	 */
-	b->b_dev_info.isolated_pages--;
-	spin_unlock_irqrestore(&b->b_dev_info.pages_lock, flags);
-
 out_unlock:
 	up_read(&b->conf_sem);
 	return ret;
diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 74fe59f5a78c6..df2756c071dae 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -827,7 +827,6 @@ static int virtballoon_migratepage(struct balloon_dev_info *vb_dev_info,
 {
 	struct virtio_balloon *vb = container_of(vb_dev_info,
 			struct virtio_balloon, vb_dev_info);
-	unsigned long flags;
 
 	/*
 	 * In order to avoid lock contention while migrating pages concurrently
@@ -840,8 +839,6 @@ static int virtballoon_migratepage(struct balloon_dev_info *vb_dev_info,
 	if (!mutex_trylock(&vb->balloon_lock))
 		return -EAGAIN;
 
-	get_page(newpage); /* balloon reference */
-
 	/*
 	  * When we migrate a page to a different zone and adjusted the
 	  * managed page count when inflating, we have to fixup the count of
@@ -854,11 +851,6 @@ static int virtballoon_migratepage(struct balloon_dev_info *vb_dev_info,
 	}
 
 	/* balloon's page migration 1st step  -- inflate "newpage" */
-	spin_lock_irqsave(&vb_dev_info->pages_lock, flags);
-	balloon_page_insert(vb_dev_info, newpage);
-	vb_dev_info->isolated_pages--;
-	__count_vm_event(BALLOON_MIGRATE);
-	spin_unlock_irqrestore(&vb_dev_info->pages_lock, flags);
 	vb->num_pfns = VIRTIO_BALLOON_PAGES_PER_PAGE;
 	set_page_pfns(vb, vb->pfns, newpage);
 	tell_host(vb, vb->inflate_vq);
@@ -869,10 +861,6 @@ static int virtballoon_migratepage(struct balloon_dev_info *vb_dev_info,
 	tell_host(vb, vb->deflate_vq);
 
 	mutex_unlock(&vb->balloon_lock);
-
-	balloon_page_finalize(page);
-	put_page(page); /* balloon reference */
-
 	return 0;
 }
 #endif /* CONFIG_BALLOON_COMPACTION */
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 85eea88cea083..764fa25dc4bd1 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -236,11 +236,12 @@ static void balloon_page_putback(struct page *page)
 	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
 }
 
-/* move_to_new_page() counterpart for a ballooned page */
 static int balloon_page_migrate(struct page *newpage, struct page *page,
 		enum migrate_mode mode)
 {
-	struct balloon_dev_info *balloon = balloon_page_device(page);
+	struct balloon_dev_info *b_dev_info = balloon_page_device(page);
+	unsigned long flags;
+	int rc;
 
 	VM_BUG_ON_PAGE(!PageLocked(page), page);
 	VM_BUG_ON_PAGE(!PageLocked(newpage), newpage);
@@ -250,10 +251,32 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
 	 * device. As isolated balloon pages cannot get deflated, we still have
 	 * a balloon device here.
 	 */
-	if (WARN_ON_ONCE(!balloon))
+	if (WARN_ON_ONCE(!b_dev_info))
 		return -EAGAIN;
 
-	return balloon->migratepage(balloon, newpage, page, mode);
+	rc = b_dev_info->migratepage(b_dev_info, newpage, page, mode);
+	if (rc < 0 && rc != -ENOENT)
+		return rc;
+
+	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
+	if (!rc) {
+		/* Insert the new page into the balloon list. */
+		get_page(newpage);
+		balloon_page_insert(b_dev_info, newpage);
+		__count_vm_event(BALLOON_MIGRATE);
+	} else {
+		/* Old page was deflated but new page not inflated. */
+		__count_vm_event(BALLOON_DEFLATE);
+	}
+
+	b_dev_info->isolated_pages--;
+	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
+
+	/* Free the now-deflated page we isolated in balloon_page_isolate(). */
+	balloon_page_finalize(page);
+	put_page(page);
+
+	return 0;
 }
 
 const struct movable_operations balloon_mops = {
-- 
2.52.0


