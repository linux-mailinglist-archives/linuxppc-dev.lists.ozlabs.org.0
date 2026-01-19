Return-Path: <linuxppc-dev+bounces-16040-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C657D3BB48
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 00:03:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw5bQ6j0qz3bsC;
	Tue, 20 Jan 2026 10:03:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768863794;
	cv=none; b=NVyroI6v8mhpJwN+uZ7qJ06ovty39IeCh5kW6oeWZpyHHTP4UVPQ+2URskRF0iJwlRwH1zVsCuMoinYRBvMXmTTSolAz3qwCaWiA5gIXojF4l+jYWEpej7Su8fXe43l9HFeJpUK5cnH5c5uYV8/wh5rhl6le8SnbXoYv+4fPwfe8jyPmEMOk76K8aegUfDS0Fm58PV2x6WaD8KKzqvPl428q1l9ckOXMc+vsFSnPgKwtQrm5E3UsO7ZHXQlzipGtmcy8CpIlZRj51wu7Dfpqq+KBdDpL/5x98dFX1d7B5K2MFFkm2wXil+YGM7CKTSxZsYer4PRh8u6zhC0OC/64GA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768863794; c=relaxed/relaxed;
	bh=1HcVacPZxe1iaKXunooY4kan6L5QaBRlQ69NVSE0r+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B3MX3LRn2DArAYyWs81aOoVYsHyBRILckFCPr709gAmBeB5ApfX+lJA4Iqx0Mqop3sY4h5/acqae3792jc+Jw+pY25WOH1Xz6HSQT78ZQt44jbAP1LW43HYfs5Zvg3JCnLUBSjKUyCoPp0EhHv4iCFwvErLWbteelk585BIGJRjSdp4rJhdZx7aNB5FuXx3WpCCVl4Y3Clr9bC61G3ojWT7DuQ0YMiTdDjrhaVmmh6bR0Jvk7cxUQa6w2o7K8dEgRoXwfPmGl50xgx2G4epOEw755Biiwzzj1pVGDX+/NlFFZyUZHLbYpC8aUtsDJzWxdJA38n5YcJhEA9W09iXBtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=quVR+O3k; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=quVR+O3k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw5bQ0BqGz2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 10:03:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 27E9760152;
	Mon, 19 Jan 2026 23:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D84C19423;
	Mon, 19 Jan 2026 23:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768863791;
	bh=9+IQR5WDIB0jdvtNuLpX+r92qeOLZrM3xsnr4jLPT3c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=quVR+O3kmNVg+5kCP3gsApos7tcKXyU5nQWErVidQm/UYqerGdPB7CnDW0Yw/Rn8U
	 DNFm9sEx96tM8FUQ5/U65G9jxtuBtKC1M+1fV5fezDXwciHUZV5PvD3+3nwa6AhUWb
	 oxHQrOO+KAmpBi7iF4WVwa8A3pr+DGuK8euvz2caPK6MEFEoQWoUrJCmRuG/3twM9l
	 pybklGrw2t4pUH6JWYfh9SbO/DubCvLonb34sekUJy/nyzBjBD16a9SK2l8pIzXpwG
	 50NkwEfYodwYwicj6e69EDG5crcButKepcpVF5GgnJTg6S6XC93tL1TGe0j/kSIWpM
	 +WYXqkWI1Z1VA==
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
Subject: [PATCH v3 13/24] mm/balloon_compaction: remove balloon_page_push/pop()
Date: Tue, 20 Jan 2026 00:01:21 +0100
Message-ID: <20260119230133.3551867-14-david@kernel.org>
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

Let's remove these helpers as they are unused now.

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 include/linux/balloon_compaction.h | 30 ------------------------------
 mm/balloon_compaction.c            |  5 ++---
 2 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index 1452ea0635245..e5451cf1f6589 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -126,34 +126,4 @@ static inline void balloon_page_finalize(struct page *page)
 		set_page_private(page, 0);
 	/* PageOffline is sticky until the page is freed to the buddy. */
 }
-
-/*
- * balloon_page_push - insert a page into a page list.
- * @head : pointer to list
- * @page : page to be added
- *
- * Caller must ensure the page is private and protect the list.
- */
-static inline void balloon_page_push(struct list_head *pages, struct page *page)
-{
-	list_add(&page->lru, pages);
-}
-
-/*
- * balloon_page_pop - remove a page from a page list.
- * @head : pointer to list
- * @page : page to be added
- *
- * Caller must ensure the page is private and protect the list.
- */
-static inline struct page *balloon_page_pop(struct list_head *pages)
-{
-	struct page *page = list_first_entry_or_null(pages, struct page, lru);
-
-	if (!page)
-		return NULL;
-
-	list_del(&page->lru);
-	return page;
-}
 #endif /* _LINUX_BALLOON_COMPACTION_H */
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index cf4d931763920..5e1507a13a52f 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -128,9 +128,8 @@ EXPORT_SYMBOL_GPL(balloon_page_alloc);
  * Drivers must call this function to properly enqueue a new allocated balloon
  * page before definitively removing the page from the guest system.
  *
- * Drivers must not call balloon_page_enqueue on pages that have been pushed to
- * a list with balloon_page_push before removing them with balloon_page_pop. To
- * enqueue a list of pages, use balloon_page_list_enqueue instead.
+ * Drivers must not enqueue pages while page->lru is still in
+ * use, and must not use page->lru until a page was unqueued again.
  */
 void balloon_page_enqueue(struct balloon_dev_info *b_dev_info,
 			  struct page *page)
-- 
2.52.0


