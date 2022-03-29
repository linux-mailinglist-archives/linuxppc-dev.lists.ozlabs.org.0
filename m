Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB83D4EB223
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 18:47:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSb8q4Tqtz3c4Z
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 03:47:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hmkxsnzl;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hmkxsnzl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Hmkxsnzl; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hmkxsnzl; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSb796jZVz2xfP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 03:46:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648572386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o2w/fJglRUuWKtszG5JddRy/AwNMJzuTrZhnPm9ugtA=;
 b=HmkxsnzlJbOpBFzayvYaqdIYN+XHQUZlZ6OhVzF47phChhcqzWwJUt9lCaTLrEbiX111Y9
 CQgrdD1XKBha9T1Lj3kG5jE5I1Nqa6GNGDRhRc5gqYZe+5yNYFxVBHWR1ZUBfwhOzSWsQu
 QuqR4sv0DHOhMdk7h032r5q7LUMPtfY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648572386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o2w/fJglRUuWKtszG5JddRy/AwNMJzuTrZhnPm9ugtA=;
 b=HmkxsnzlJbOpBFzayvYaqdIYN+XHQUZlZ6OhVzF47phChhcqzWwJUt9lCaTLrEbiX111Y9
 CQgrdD1XKBha9T1Lj3kG5jE5I1Nqa6GNGDRhRc5gqYZe+5yNYFxVBHWR1ZUBfwhOzSWsQu
 QuqR4sv0DHOhMdk7h032r5q7LUMPtfY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-sqKJpRupPP2WGYuGU09DYA-1; Tue, 29 Mar 2022 12:46:23 -0400
X-MC-Unique: sqKJpRupPP2WGYuGU09DYA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A27A29DD99C;
 Tue, 29 Mar 2022 16:45:28 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0C4E1121314;
 Tue, 29 Mar 2022 16:44:33 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] mm/swap: remember PG_anon_exclusive via a swp pte bit
Date: Tue, 29 Mar 2022 18:43:22 +0200
Message-Id: <20220329164329.208407-2-david@redhat.com>
In-Reply-To: <20220329164329.208407-1-david@redhat.com>
References: <20220329164329.208407-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Cc: x86@kernel.org, Jan Kara <jack@suse.cz>,
 David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Donald Dutile <ddutile@redhat.com>, Liang Zhang <zhangliang5@huawei.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Paul Mackerras <paulus@samba.org>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Jason Gunthorpe <jgg@nvidia.com>, David Rientjes <rientjes@google.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Pedro Gomes <pedrodemargomes@gmail.com>, Jann Horn <jannh@google.com>,
 John Hubbard <jhubbard@nvidia.com>, Heiko Carstens <hca@linux.ibm.com>,
 Shakeel Butt <shakeelb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Oded Gabbay <oded.gabbay@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Oleg Nesterov <oleg@redhat.com>,
 Nadav Amit <namit@vmware.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, we clear PG_anon_exclusive in try_to_unmap() and forget about
it. We do this, to keep fork() logic on swap entries easy and efficient:
for example, if we wouldn't clear it when unmapping, we'd have to lookup
the page in the swapcache for each and every swap entry during fork() and
clear PG_anon_exclusive if set.

Instead, we want to store that information directly in the swap pte,
protected by the page table lock, similarly to how we handle
SWP_MIGRATION_READ_EXCLUSIVE for migration entries. However, for actual
swap entries, we don't want to mess with the swap type (e.g., still one
bit) because it overcomplicates swap code.

In try_to_unmap(), we already reject to unmap in case the page might be
pinned, because we must not lose PG_anon_exclusive on pinned pages ever.
Checking if there are other unexpected references reliably *before*
completely unmapping a page is unfortunately not really possible: THP
heavily overcomplicate the situation. Once fully unmapped it's easier --
we, for example, make sure that there are no unexpected references
*after* unmapping a page before starting writeback on that page.

So, we currently might end up unmapping a page and clearing
PG_anon_exclusive if that page has additional references, for example,
due to a FOLL_GET.

do_swap_page() has to re-determine if a page is exclusive, which will
easily fail if there are other references on a page, most prominently
GUP references via FOLL_GET. This can currently result in memory
corruptions when taking a FOLL_GET | FOLL_WRITE reference on a page even
when fork() is never involved: try_to_unmap() will succeed, and when
refaulting the page, it cannot be marked exclusive and will get replaced
by a copy in the page tables on the next write access, resulting in writes
via the GUP reference to the page being lost.

In an ideal world, everybody that uses GUP and wants to modify page
content, such as O_DIRECT, would properly use FOLL_PIN. However, that
conversion will take a while. It's easier to fix what used to work in the
past (FOLL_GET | FOLL_WRITE) remembering PG_anon_exclusive. In addition,
by remembering PG_anon_exclusive we can further reduce unnecessary COW
in some cases, so it's the natural thing to do.

So let's transfer the PG_anon_exclusive information to the swap pte and
store it via an architecture-dependant pte bit; use that information when
restoring the swap pte in do_swap_page() and unuse_pte(). During fork(), we
simply have to clear the pte bit and are done.

Of course, there is one corner case to handle: swap backends that don't
support concurrent page modifications while the page is under writeback.
Special case these, and drop the exclusive marker. Add a comment why that
is just fine (also, reuse_swap_page() would have done the same in the
past).

In the future, we'll hopefully have all architectures support
__HAVE_ARCH_PTE_SWP_EXCLUSIVE, such that we can get rid of the empty
stubs and the define completely. Then, we can also convert
SWP_MIGRATION_READ_EXCLUSIVE. For architectures it's fairly easy to
support: either simply use a yet unused pte bit that can be used for swap
entries, steal one from the arch type bits if they exceed 5, or steal one
from the offset bits.

Note: R/O FOLL_GET references were never really reliable, especially
when taking one on a shared page and then writing to the page (e.g., GUP
after fork()). FOLL_GET, including R/W references, were never really
reliable once fork was involved (e.g., GUP before fork(),
GUP during fork()). KSM steps back in case it stumbles over unexpected
references and is, therefore, fine.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/pgtable.h | 29 ++++++++++++++++++++++
 include/linux/swapops.h |  2 ++
 mm/memory.c             | 55 ++++++++++++++++++++++++++++++++++++++---
 mm/rmap.c               | 19 ++++++++------
 mm/swapfile.c           | 13 +++++++++-
 5 files changed, 105 insertions(+), 13 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index f4f4077b97aa..53750224e176 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1003,6 +1003,35 @@ static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
 #define arch_start_context_switch(prev)	do {} while (0)
 #endif
 
+/*
+ * When replacing an anonymous page by a real (!non) swap entry, we clear
+ * PG_anon_exclusive from the page and instead remember whether the flag was
+ * set in the swp pte. During fork(), we have to mark the entry as !exclusive
+ * (possibly shared). On swapin, we use that information to restore
+ * PG_anon_exclusive, which is very helpful in cases where we might have
+ * additional (e.g., FOLL_GET) references on a page and wouldn't be able to
+ * detect exclusivity.
+ *
+ * These functions don't apply to non-swap entries (e.g., migration, hwpoison,
+ * ...).
+ */
+#ifndef __HAVE_ARCH_PTE_SWP_EXCLUSIVE
+static inline pte_t pte_swp_mkexclusive(pte_t pte)
+{
+	return pte;
+}
+
+static inline int pte_swp_exclusive(pte_t pte)
+{
+	return false;
+}
+
+static inline pte_t pte_swp_clear_exclusive(pte_t pte)
+{
+	return pte;
+}
+#endif
+
 #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
 #ifndef CONFIG_ARCH_ENABLE_THP_MIGRATION
 static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 06280fc1c99b..32d517a28969 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -26,6 +26,8 @@
 /* Clear all flags but only keep swp_entry_t related information */
 static inline pte_t pte_swp_clear_flags(pte_t pte)
 {
+	if (pte_swp_exclusive(pte))
+		pte = pte_swp_clear_exclusive(pte);
 	if (pte_swp_soft_dirty(pte))
 		pte = pte_swp_clear_soft_dirty(pte);
 	if (pte_swp_uffd_wp(pte))
diff --git a/mm/memory.c b/mm/memory.c
index 14618f446139..9060cc7f2123 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -792,6 +792,11 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 						&src_mm->mmlist);
 			spin_unlock(&mmlist_lock);
 		}
+		/* Mark the swap entry as shared. */
+		if (pte_swp_exclusive(*src_pte)) {
+			pte = pte_swp_clear_exclusive(*src_pte);
+			set_pte_at(src_mm, addr, src_pte, pte);
+		}
 		rss[MM_SWAPENTS]++;
 	} else if (is_migration_entry(entry)) {
 		page = pfn_swap_entry_to_page(entry);
@@ -3559,6 +3564,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	struct page *page = NULL, *swapcache;
 	struct swap_info_struct *si = NULL;
 	rmap_t rmap_flags = RMAP_NONE;
+	bool exclusive = false;
 	swp_entry_t entry;
 	pte_t pte;
 	int locked;
@@ -3724,6 +3730,46 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	BUG_ON(!PageAnon(page) && PageMappedToDisk(page));
 	BUG_ON(PageAnon(page) && PageAnonExclusive(page));
 
+	/*
+	 * Check under PT lock (to protect against concurrent fork() sharing
+	 * the swap entry concurrently) for certainly exclusive pages.
+	 */
+	if (!PageKsm(page)) {
+		/*
+		 * Note that pte_swp_exclusive() == false for architectures
+		 * without __HAVE_ARCH_PTE_SWP_EXCLUSIVE.
+		 */
+		exclusive = pte_swp_exclusive(vmf->orig_pte);
+		if (page != swapcache) {
+			/*
+			 * We have a fresh page that is not exposed to the
+			 * swapcache -> certainly exclusive.
+			 */
+			exclusive = true;
+		} else if (exclusive && PageWriteback(page) &&
+			   !(swp_swap_info(entry)->flags & SWP_STABLE_WRITES)) {
+			/*
+			 * This is tricky: not all swap backends support
+			 * concurrent page modifications while under writeback.
+			 *
+			 * So if we stumble over such a page in the swapcache
+			 * we must not set the page exclusive, otherwise we can
+			 * map it writable without further checks and modify it
+			 * while still under writeback.
+			 *
+			 * For these problematic swap backends, simply drop the
+			 * exclusive marker: this is perfectly fine as we start
+			 * writeback only if we fully unmapped the page and
+			 * there are no unexpected references on the page after
+			 * unmapping succeeded. After fully unmapped, no
+			 * further GUP references (FOLL_GET and FOLL_PIN) can
+			 * appear, so dropping the exclusive marker and mapping
+			 * it only R/O is fine.
+			 */
+			exclusive = false;
+		}
+	}
+
 	/*
 	 * Remove the swap entry and conditionally try to free up the swapcache.
 	 * We're already holding a reference on the page but haven't mapped it
@@ -3738,11 +3784,12 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	pte = mk_pte(page, vma->vm_page_prot);
 
 	/*
-	 * Same logic as in do_wp_page(); however, optimize for fresh pages
-	 * that are certainly not shared because we just allocated them without
-	 * exposing them to the swapcache.
+	 * Same logic as in do_wp_page(); however, optimize for pages that are
+	 * certainly not shared either because we just allocated them without
+	 * exposing them to the swapcache or because the swap entry indicates
+	 * exclusivity.
 	 */
-	if (!PageKsm(page) && (page != swapcache || page_count(page) == 1)) {
+	if (!PageKsm(page) && (exclusive || page_count(page) == 1)) {
 		if (vmf->flags & FAULT_FLAG_WRITE) {
 			pte = maybe_mkwrite(pte_mkdirty(pte), vma);
 			vmf->flags &= ~FAULT_FLAG_WRITE;
diff --git a/mm/rmap.c b/mm/rmap.c
index 4de07234cbcf..c8c257d94962 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1656,14 +1656,15 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				break;
 			}
 			/*
-			 * Note: We *don't* remember yet if the page was mapped
-			 * exclusively in the swap entry, so swapin code has
-			 * to re-determine that manually and might detect the
-			 * page as possibly shared, for example, if there are
-			 * other references on the page or if the page is under
-			 * writeback. We made sure that there are no GUP pins
-			 * on the page that would rely on it, so for GUP pins
-			 * this is fine.
+			 * Note: We *don't* remember if the page was mapped
+			 * exclusively in the swap pte if the architecture
+			 * doesn't support __HAVE_ARCH_PTE_SWP_EXCLUSIVE. In
+			 * that case, swapin code has to re-determine that
+			 * manually and might detect the page as possibly
+			 * shared, for example, if there are other references on
+			 * the page or if the page is under writeback. We made
+			 * sure that there are no GUP pins on the page that
+			 * would rely on it, so for GUP pins this is fine.
 			 */
 			if (list_empty(&mm->mmlist)) {
 				spin_lock(&mmlist_lock);
@@ -1674,6 +1675,8 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			dec_mm_counter(mm, MM_ANONPAGES);
 			inc_mm_counter(mm, MM_SWAPENTS);
 			swp_pte = swp_entry_to_pte(entry);
+			if (anon_exclusive)
+				swp_pte = pte_swp_mkexclusive(swp_pte);
 			if (pte_soft_dirty(pteval))
 				swp_pte = pte_swp_mksoft_dirty(swp_pte);
 			if (pte_uffd_wp(pteval))
diff --git a/mm/swapfile.c b/mm/swapfile.c
index a7847324d476..7279b2d2d71d 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1804,7 +1804,18 @@ static int unuse_pte(struct vm_area_struct *vma, pmd_t *pmd,
 	inc_mm_counter(vma->vm_mm, MM_ANONPAGES);
 	get_page(page);
 	if (page == swapcache) {
-		page_add_anon_rmap(page, vma, addr, RMAP_NONE);
+		rmap_t rmap_flags = RMAP_NONE;
+
+		/*
+		 * See do_swap_page(): PageWriteback() would be problematic.
+		 * However, we do a wait_on_page_writeback() just before this
+		 * call and have the page locked.
+		 */
+		VM_BUG_ON_PAGE(PageWriteback(page), page);
+		if (pte_swp_exclusive(*pte))
+			rmap_flags |= RMAP_EXCLUSIVE;
+
+		page_add_anon_rmap(page, vma, addr, rmap_flags);
 	} else { /* ksm created a completely new copy */
 		page_add_new_anon_rmap(page, vma, addr);
 		lru_cache_add_inactive_or_unevictable(page, vma);
-- 
2.35.1

