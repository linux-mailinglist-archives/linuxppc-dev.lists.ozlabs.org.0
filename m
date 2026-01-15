Return-Path: <linuxppc-dev+bounces-15793-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FE0D23702
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 10:22:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsHYk5GxRz3cPG;
	Thu, 15 Jan 2026 20:22:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768468922;
	cv=none; b=UT+dHKzAO1GN8nUbz4eXIkWJb64bwoubH1T495nQmXS2MvWTKce26PpxGQntIqTYa75WHUFmSmaBPww9iI7F6/zRoI1vDlGMZ7KJqEnXRjaRC6kMeNoLD5eA1beubowd5YBkLp75VlXH4jJzEWo0ukGZpG5jR1touSKZeA6sk5ODuteOVhfHGTh36PV8heUxrf75yhtbskYLwg6MbCEcmTZeU9vTJ5+AJagwsmndQRgratlYi3WKk7qTnGOHJn8PNghxWeKCaDCcOw5y7dv9nCgohKt3Bnd6CsjHkHSkFnGrZFspxMG7rcwuHUScRtfhDlK3nIpP2LHuml79bAmGJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768468922; c=relaxed/relaxed;
	bh=sf+38j4R5idOxt7NidpE6VdbC4a+MWvCfPDsI7M70HI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HS4DtO2BlrGXOs7zihTeQu9VdpELRDr13BO6W97OjviN06t86LcIKwx2a2bRfh4mwcq7upBONReNxgKBY8ik0K/ocAo+XnM5nOvVI+bcq1KkNHqV/cpRLHoVivWfs7sOV8JTmiTJhUfGw39VNz+AGjIMATdbZbvwlLXJ91MBoA26FFffD+kUDlJFHKO3dh+rwsgNgruO5sCE7OKRSFXWQx6TgAPncsVp6faLOsXOWZCOP2HgskBdzyb00mBMbXkORrNLPq7wkslhvlDxObB1VGbDZvlonzUORu1O6p6exPeCiYl6JlCvIssGOX2aA4cunxe09eq3hVkzewBcn0q6Aw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mKaVkpLY; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mKaVkpLY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsHYj6s6Tz3bt7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 20:22:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 63FAC4174F;
	Thu, 15 Jan 2026 09:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B265C19421;
	Thu, 15 Jan 2026 09:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768468920;
	bh=qmPDA1ZKr0A977KNkEekwqrp6nf+Yo9xCkHHCXnhQZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mKaVkpLYZ1a3BYGxfunPbIaVDY5pndtciPfSgAB/BhePVlAEfUrr6CiA5UIpqjHcr
	 kmNI7JUUl2rx4o9yjBHv4f8JAFQL27syiZ8kWqFd6rmmPgWA3RbIWxDfgOo+IkiD5o
	 pK1OJDf4An6gvFYEhr+GGr813wDfvbUy5FT0lfYcuKh4VDnOReppbSlvfiyuDOCYGp
	 L3NMhWKaw4b8FOM7iH/zTWS3t09K1rrQEXi5LG3OaQz8/P9lLQezpgeneCARWf88bl
	 EhtgSv7g7Io1ggc38r4OVzZboge+AOmiBCrMZnFqTM3LPlv3OsAsivXiZkI1xnUGte
	 pfrHvuy9E6z5g==
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
Subject: [PATCH v2 14/23] mm/balloon_compaction: move internal helpers to balloon_compaction.c
Date: Thu, 15 Jan 2026 10:20:04 +0100
Message-ID: <20260115092015.3928975-15-david@kernel.org>
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

Let's move the helpers that are not required by drivers anymore.

While at it, drop the doc of balloon_page_device() as it is trivial.

Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 include/linux/balloon_compaction.h | 44 ------------------------------
 mm/balloon_compaction.c            | 38 ++++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 44 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index d1d4739398978..eec8994056a44 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -75,48 +75,4 @@ static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
 	balloon->migratepage = NULL;
 	balloon->adjust_managed_page_count = false;
 }
-
-#ifdef CONFIG_BALLOON_COMPACTION
-/*
- * balloon_page_device - get the b_dev_info descriptor for the balloon device
- *			 that enqueues the given page.
- */
-static inline struct balloon_dev_info *balloon_page_device(struct page *page)
-{
-	return (struct balloon_dev_info *)page_private(page);
-}
-#endif /* CONFIG_BALLOON_COMPACTION */
-
-/*
- * balloon_page_insert - insert a page into the balloon's page list and make
- *			 the page->private assignment accordingly.
- * @balloon : pointer to balloon device
- * @page    : page to be assigned as a 'balloon page'
- *
- * Caller must ensure the balloon_pages_lock is held.
- */
-static inline void balloon_page_insert(struct balloon_dev_info *balloon,
-				       struct page *page)
-{
-	__SetPageOffline(page);
-	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
-		SetPageMovableOps(page);
-		set_page_private(page, (unsigned long)balloon);
-	}
-	list_add(&page->lru, &balloon->pages);
-}
-
-/*
- * balloon_page_finalize - prepare a balloon page that was removed from the
- *			   balloon list for release to the page allocator
- * @page: page to be released to the page allocator
- *
- * Caller must ensure the balloon_pages_lock is held.
- */
-static inline void balloon_page_finalize(struct page *page)
-{
-	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
-		set_page_private(page, 0);
-	/* PageOffline is sticky until the page is freed to the buddy. */
-}
 #endif /* _LINUX_BALLOON_COMPACTION_H */
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 709c57c00b481..717bc43732d09 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -17,6 +17,44 @@
  */
 static DEFINE_SPINLOCK(balloon_pages_lock);
 
+static inline struct balloon_dev_info *balloon_page_device(struct page *page)
+{
+	return (struct balloon_dev_info *)page_private(page);
+}
+
+/*
+ * balloon_page_insert - insert a page into the balloon's page list and make
+ *			 the page->private assignment accordingly.
+ * @balloon : pointer to balloon device
+ * @page    : page to be assigned as a 'balloon page'
+ *
+ * Caller must ensure the balloon_pages_lock is held.
+ */
+static inline void balloon_page_insert(struct balloon_dev_info *balloon,
+				       struct page *page)
+{
+	__SetPageOffline(page);
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
+		SetPageMovableOps(page);
+		set_page_private(page, (unsigned long)balloon);
+	}
+	list_add(&page->lru, &balloon->pages);
+}
+
+/*
+ * balloon_page_finalize - prepare a balloon page that was removed from the
+ *			   balloon list for release to the page allocator
+ * @page: page to be released to the page allocator
+ *
+ * Caller must ensure the balloon_pages_lock is held.
+ */
+static inline void balloon_page_finalize(struct page *page)
+{
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
+		set_page_private(page, 0);
+	/* PageOffline is sticky until the page is freed to the buddy. */
+}
+
 static void balloon_page_enqueue_one(struct balloon_dev_info *b_dev_info,
 				     struct page *page)
 {
-- 
2.52.0


