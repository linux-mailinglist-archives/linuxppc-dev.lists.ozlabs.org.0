Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CFD855454
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 21:50:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PS/mJjOW;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PS/mJjOW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZr1x5WCDz3vlW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 07:50:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PS/mJjOW;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PS/mJjOW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZqvm3TwWz3vX0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 07:45:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707943521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Urk7YDR9ebLiDb1P6kmx7XPXJlWdS6zrYIBQssjJoDA=;
	b=PS/mJjOWQVkRNy+n18bRMlI8YMTZ5tcQD0EBUcv68jdJp9ZY4zbK+DCHBiBS7mtdQgcthP
	xVMNwB7hd9YkDWgQzcVvXzfxH96txbG+qT0JOeaqlF9TqvWqpio0wTDKWAa8b0SwKAsgkf
	Xi0eGxJzZSZ9iMNYkvlLmB097s5UyAs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707943521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Urk7YDR9ebLiDb1P6kmx7XPXJlWdS6zrYIBQssjJoDA=;
	b=PS/mJjOWQVkRNy+n18bRMlI8YMTZ5tcQD0EBUcv68jdJp9ZY4zbK+DCHBiBS7mtdQgcthP
	xVMNwB7hd9YkDWgQzcVvXzfxH96txbG+qT0JOeaqlF9TqvWqpio0wTDKWAa8b0SwKAsgkf
	Xi0eGxJzZSZ9iMNYkvlLmB097s5UyAs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-495-aCdWli_yP2W_uoiOTDRjgQ-1; Wed,
 14 Feb 2024 15:45:14 -0500
X-MC-Unique: aCdWli_yP2W_uoiOTDRjgQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5326C28B6A1D;
	Wed, 14 Feb 2024 20:45:13 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.194.174])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A53741C03428;
	Wed, 14 Feb 2024 20:45:09 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/10] mm/mmu_gather: add __tlb_remove_folio_pages()
Date: Wed, 14 Feb 2024 21:44:33 +0100
Message-ID: <20240214204435.167852-9-david@redhat.com>
In-Reply-To: <20240214204435.167852-1-david@redhat.com>
References: <20240214204435.167852-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Matthew Wilcox <willy@infradead.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Ryan Roberts <ryan.roberts@arm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, Nick Piggin <npiggin@gmail.com>, Yin Fengwei <fengwei.yin@intel.com>, Sven Schnelle <svens@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add __tlb_remove_folio_pages(), which will remove multiple consecutive
pages that belong to the same large folio, instead of only a single
page. We'll be using this function when optimizing unmapping/zapping of
large folios that are mapped by PTEs.

We're using the remaining spare bit in an encoded_page to indicate that
the next enoced page in an array contains actually shifted "nr_pages".
Teach swap/freeing code about putting multiple folio references, and
delayed rmap handling to remove page ranges of a folio.

This extension allows for still gathering almost as many small folios
as we used to (-1, because we have to prepare for a possibly bigger next
entry), but still allows for gathering consecutive pages that belong to the
same large folio.

Note that we don't pass the folio pointer, because it is not required for
now. Further, we don't support page_size != PAGE_SIZE, it won't be
required for simple PTE batching.

We have to provide a separate s390 implementation, but it's fairly
straight forward.

Another, more invasive and likely more expensive, approach would be to
use folio+range or a PFN range instead of page+nr_pages. But, we should
do that consistently for the whole mmu_gather. For now, let's keep it
simple and add "nr_pages" only.

Note that it is now possible to gather significantly more pages: In the
past, we were able to gather ~10000 pages, now we can also gather ~5000
folio fragments that span multiple pages. A folio fragment on x86-64 can
span up to 512 pages (2 MiB THP) and on arm64 with 64k in theory 8192 pages
(512 MiB THP). Gathering more memory is not considered something we should
worry about, especially because these are already corner cases.

While we can gather more total memory, we won't free more folio
fragments. As long as page freeing time primarily only depends on the
number of involved folios, there is no effective change for !preempt
configurations. However, we'll adjust tlb_batch_pages_flush() separately to
handle corner cases where page freeing time grows proportionally with the
actual memory size.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/s390/include/asm/tlb.h | 17 +++++++++++
 include/asm-generic/tlb.h   |  8 +++++
 include/linux/mm_types.h    | 20 ++++++++++++
 mm/mmu_gather.c             | 61 +++++++++++++++++++++++++++++++------
 mm/swap.c                   | 12 ++++++--
 mm/swap_state.c             | 15 +++++++--
 6 files changed, 119 insertions(+), 14 deletions(-)

diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
index 48df896d5b79..e95b2c8081eb 100644
--- a/arch/s390/include/asm/tlb.h
+++ b/arch/s390/include/asm/tlb.h
@@ -26,6 +26,8 @@ void __tlb_remove_table(void *_table);
 static inline void tlb_flush(struct mmu_gather *tlb);
 static inline bool __tlb_remove_page_size(struct mmu_gather *tlb,
 		struct page *page, bool delay_rmap, int page_size);
+static inline bool __tlb_remove_folio_pages(struct mmu_gather *tlb,
+		struct page *page, unsigned int nr_pages, bool delay_rmap);
 
 #define tlb_flush tlb_flush
 #define pte_free_tlb pte_free_tlb
@@ -52,6 +54,21 @@ static inline bool __tlb_remove_page_size(struct mmu_gather *tlb,
 	return false;
 }
 
+static inline bool __tlb_remove_folio_pages(struct mmu_gather *tlb,
+		struct page *page, unsigned int nr_pages, bool delay_rmap)
+{
+	struct encoded_page *encoded_pages[] = {
+		encode_page(page, ENCODED_PAGE_BIT_NR_PAGES_NEXT),
+		encode_nr_pages(nr_pages),
+	};
+
+	VM_WARN_ON_ONCE(delay_rmap);
+	VM_WARN_ON_ONCE(page_folio(page) != page_folio(page + nr_pages - 1));
+
+	free_pages_and_swap_cache(encoded_pages, ARRAY_SIZE(encoded_pages));
+	return false;
+}
+
 static inline void tlb_flush(struct mmu_gather *tlb)
 {
 	__tlb_flush_mm_lazy(tlb->mm);
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 95d60a4f468a..bd00dd238b79 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -69,6 +69,7 @@
  *
  *  - tlb_remove_page() / __tlb_remove_page()
  *  - tlb_remove_page_size() / __tlb_remove_page_size()
+ *  - __tlb_remove_folio_pages()
  *
  *    __tlb_remove_page_size() is the basic primitive that queues a page for
  *    freeing. __tlb_remove_page() assumes PAGE_SIZE. Both will return a
@@ -78,6 +79,11 @@
  *    tlb_remove_page() and tlb_remove_page_size() imply the call to
  *    tlb_flush_mmu() when required and has no return value.
  *
+ *    __tlb_remove_folio_pages() is similar to __tlb_remove_page(), however,
+ *    instead of removing a single page, remove the given number of consecutive
+ *    pages that are all part of the same (large) folio: just like calling
+ *    __tlb_remove_page() on each page individually.
+ *
  *  - tlb_change_page_size()
  *
  *    call before __tlb_remove_page*() to set the current page-size; implies a
@@ -262,6 +268,8 @@ struct mmu_gather_batch {
 
 extern bool __tlb_remove_page_size(struct mmu_gather *tlb, struct page *page,
 		bool delay_rmap, int page_size);
+bool __tlb_remove_folio_pages(struct mmu_gather *tlb, struct page *page,
+		unsigned int nr_pages, bool delay_rmap);
 
 #ifdef CONFIG_SMP
 /*
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 1b89eec0d6df..a7223ba3ea1e 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -226,6 +226,15 @@ struct encoded_page;
 /* Perform rmap removal after we have flushed the TLB. */
 #define ENCODED_PAGE_BIT_DELAY_RMAP		1ul
 
+/*
+ * The next item in an encoded_page array is the "nr_pages" argument, specifying
+ * the number of consecutive pages starting from this page, that all belong to
+ * the same folio. For example, "nr_pages" corresponds to the number of folio
+ * references that must be dropped. If this bit is not set, "nr_pages" is
+ * implicitly 1.
+ */
+#define ENCODED_PAGE_BIT_NR_PAGES_NEXT		2ul
+
 static __always_inline struct encoded_page *encode_page(struct page *page, unsigned long flags)
 {
 	BUILD_BUG_ON(flags > ENCODED_PAGE_BITS);
@@ -242,6 +251,17 @@ static inline struct page *encoded_page_ptr(struct encoded_page *page)
 	return (struct page *)(~ENCODED_PAGE_BITS & (unsigned long)page);
 }
 
+static __always_inline struct encoded_page *encode_nr_pages(unsigned long nr)
+{
+	VM_WARN_ON_ONCE((nr << 2) >> 2 != nr);
+	return (struct encoded_page *)(nr << 2);
+}
+
+static __always_inline unsigned long encoded_nr_pages(struct encoded_page *page)
+{
+	return ((unsigned long)page) >> 2;
+}
+
 /*
  * A swap entry has to fit into a "unsigned long", as the entry is hidden
  * in the "index" field of the swapper address space.
diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
index 6540c99c6758..d175c0f1e2c8 100644
--- a/mm/mmu_gather.c
+++ b/mm/mmu_gather.c
@@ -50,12 +50,21 @@ static bool tlb_next_batch(struct mmu_gather *tlb)
 #ifdef CONFIG_SMP
 static void tlb_flush_rmap_batch(struct mmu_gather_batch *batch, struct vm_area_struct *vma)
 {
+	struct encoded_page **pages = batch->encoded_pages;
+
 	for (int i = 0; i < batch->nr; i++) {
-		struct encoded_page *enc = batch->encoded_pages[i];
+		struct encoded_page *enc = pages[i];
 
 		if (encoded_page_flags(enc) & ENCODED_PAGE_BIT_DELAY_RMAP) {
 			struct page *page = encoded_page_ptr(enc);
-			folio_remove_rmap_pte(page_folio(page), page, vma);
+			unsigned int nr_pages = 1;
+
+			if (unlikely(encoded_page_flags(enc) &
+				     ENCODED_PAGE_BIT_NR_PAGES_NEXT))
+				nr_pages = encoded_nr_pages(pages[++i]);
+
+			folio_remove_rmap_ptes(page_folio(page), page, nr_pages,
+					       vma);
 		}
 	}
 }
@@ -89,18 +98,26 @@ static void tlb_batch_pages_flush(struct mmu_gather *tlb)
 	for (batch = &tlb->local; batch && batch->nr; batch = batch->next) {
 		struct encoded_page **pages = batch->encoded_pages;
 
-		do {
+		while (batch->nr) {
 			/*
 			 * limit free batch count when PAGE_SIZE > 4K
 			 */
 			unsigned int nr = min(512U, batch->nr);
 
+			/*
+			 * Make sure we cover page + nr_pages, and don't leave
+			 * nr_pages behind when capping the number of entries.
+			 */
+			if (unlikely(encoded_page_flags(pages[nr - 1]) &
+				     ENCODED_PAGE_BIT_NR_PAGES_NEXT))
+				nr++;
+
 			free_pages_and_swap_cache(pages, nr);
 			pages += nr;
 			batch->nr -= nr;
 
 			cond_resched();
-		} while (batch->nr);
+		}
 	}
 	tlb->active = &tlb->local;
 }
@@ -116,8 +133,9 @@ static void tlb_batch_list_free(struct mmu_gather *tlb)
 	tlb->local.next = NULL;
 }
 
-bool __tlb_remove_page_size(struct mmu_gather *tlb, struct page *page,
-		bool delay_rmap, int page_size)
+static bool __tlb_remove_folio_pages_size(struct mmu_gather *tlb,
+		struct page *page, unsigned int nr_pages, bool delay_rmap,
+		int page_size)
 {
 	int flags = delay_rmap ? ENCODED_PAGE_BIT_DELAY_RMAP : 0;
 	struct mmu_gather_batch *batch;
@@ -126,6 +144,8 @@ bool __tlb_remove_page_size(struct mmu_gather *tlb, struct page *page,
 
 #ifdef CONFIG_MMU_GATHER_PAGE_SIZE
 	VM_WARN_ON(tlb->page_size != page_size);
+	VM_WARN_ON_ONCE(nr_pages != 1 && page_size != PAGE_SIZE);
+	VM_WARN_ON_ONCE(page_folio(page) != page_folio(page + nr_pages - 1));
 #endif
 
 	batch = tlb->active;
@@ -133,17 +153,40 @@ bool __tlb_remove_page_size(struct mmu_gather *tlb, struct page *page,
 	 * Add the page and check if we are full. If so
 	 * force a flush.
 	 */
-	batch->encoded_pages[batch->nr++] = encode_page(page, flags);
-	if (batch->nr == batch->max) {
+	if (likely(nr_pages == 1)) {
+		batch->encoded_pages[batch->nr++] = encode_page(page, flags);
+	} else {
+		flags |= ENCODED_PAGE_BIT_NR_PAGES_NEXT;
+		batch->encoded_pages[batch->nr++] = encode_page(page, flags);
+		batch->encoded_pages[batch->nr++] = encode_nr_pages(nr_pages);
+	}
+	/*
+	 * Make sure that we can always add another "page" + "nr_pages",
+	 * requiring two entries instead of only a single one.
+	 */
+	if (batch->nr >= batch->max - 1) {
 		if (!tlb_next_batch(tlb))
 			return true;
 		batch = tlb->active;
 	}
-	VM_BUG_ON_PAGE(batch->nr > batch->max, page);
+	VM_BUG_ON_PAGE(batch->nr > batch->max - 1, page);
 
 	return false;
 }
 
+bool __tlb_remove_folio_pages(struct mmu_gather *tlb, struct page *page,
+		unsigned int nr_pages, bool delay_rmap)
+{
+	return __tlb_remove_folio_pages_size(tlb, page, nr_pages, delay_rmap,
+					     PAGE_SIZE);
+}
+
+bool __tlb_remove_page_size(struct mmu_gather *tlb, struct page *page,
+		bool delay_rmap, int page_size)
+{
+	return __tlb_remove_folio_pages_size(tlb, page, 1, delay_rmap, page_size);
+}
+
 #endif /* MMU_GATHER_NO_GATHER */
 
 #ifdef CONFIG_MMU_GATHER_TABLE_FREE
diff --git a/mm/swap.c b/mm/swap.c
index cd8f0150ba3a..e5380d732c0d 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -967,11 +967,17 @@ void release_pages(release_pages_arg arg, int nr)
 	unsigned int lock_batch;
 
 	for (i = 0; i < nr; i++) {
+		unsigned int nr_refs = 1;
 		struct folio *folio;
 
 		/* Turn any of the argument types into a folio */
 		folio = page_folio(encoded_page_ptr(encoded[i]));
 
+		/* Is our next entry actually "nr_pages" -> "nr_refs" ? */
+		if (unlikely(encoded_page_flags(encoded[i]) &
+			     ENCODED_PAGE_BIT_NR_PAGES_NEXT))
+			nr_refs = encoded_nr_pages(encoded[++i]);
+
 		/*
 		 * Make sure the IRQ-safe lock-holding time does not get
 		 * excessive with a continuous string of pages from the
@@ -990,14 +996,14 @@ void release_pages(release_pages_arg arg, int nr)
 				unlock_page_lruvec_irqrestore(lruvec, flags);
 				lruvec = NULL;
 			}
-			if (put_devmap_managed_page(&folio->page))
+			if (put_devmap_managed_page_refs(&folio->page, nr_refs))
 				continue;
-			if (folio_put_testzero(folio))
+			if (folio_ref_sub_and_test(folio, nr_refs))
 				free_zone_device_page(&folio->page);
 			continue;
 		}
 
-		if (!folio_put_testzero(folio))
+		if (!folio_ref_sub_and_test(folio, nr_refs))
 			continue;
 
 		if (folio_test_large(folio)) {
diff --git a/mm/swap_state.c b/mm/swap_state.c
index 7255c01a1e4e..2f540748f7c0 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -311,8 +311,19 @@ void free_page_and_swap_cache(struct page *page)
 void free_pages_and_swap_cache(struct encoded_page **pages, int nr)
 {
 	lru_add_drain();
-	for (int i = 0; i < nr; i++)
-		free_swap_cache(encoded_page_ptr(pages[i]));
+	for (int i = 0; i < nr; i++) {
+		struct page *page = encoded_page_ptr(pages[i]);
+
+		/*
+		 * Skip over the "nr_pages" entry. It's sufficient to call
+		 * free_swap_cache() only once per folio.
+		 */
+		if (unlikely(encoded_page_flags(pages[i]) &
+			     ENCODED_PAGE_BIT_NR_PAGES_NEXT))
+			i++;
+
+		free_swap_cache(page);
+	}
 	release_pages(pages, nr);
 }
 
-- 
2.43.0

