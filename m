Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB9B83731E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 20:49:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AY/UMjOU;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AY/UMjOU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJgmL0nYQz3cW2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 06:49:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AY/UMjOU;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AY/UMjOU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJgcZ0MLwz3cTb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 06:43:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705952587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zE4dQFotU52w5fdTyhT0mbQikQr5RVENH6sHZzse5Ds=;
	b=AY/UMjOUlMyqhjqj+oR0Mt38Q70nsm6kEGVp1Fveo6SPWHH/qZRKPXybbDhmiUYA9/PPPJ
	sILruPoa+qO2eNfXxuKb3aekkQ8mRmyrKWd+IcIi3iTzBkOplSpy5gpVKA3ehYSrmROGwt
	DlOYG0QE/ueavwYzac9jdrNtNMPfvao=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705952587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zE4dQFotU52w5fdTyhT0mbQikQr5RVENH6sHZzse5Ds=;
	b=AY/UMjOUlMyqhjqj+oR0Mt38Q70nsm6kEGVp1Fveo6SPWHH/qZRKPXybbDhmiUYA9/PPPJ
	sILruPoa+qO2eNfXxuKb3aekkQ8mRmyrKWd+IcIi3iTzBkOplSpy5gpVKA3ehYSrmROGwt
	DlOYG0QE/ueavwYzac9jdrNtNMPfvao=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-qUji4n2QNQWDdxOalZIvKw-1; Mon, 22 Jan 2024 14:42:59 -0500
X-MC-Unique: qUji4n2QNQWDdxOalZIvKw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24D858871C8;
	Mon, 22 Jan 2024 19:42:58 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.195.114])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 492083C2E;
	Mon, 22 Jan 2024 19:42:52 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 09/11] mm/memory: optimize fork() with PTE-mapped THP
Date: Mon, 22 Jan 2024 20:41:58 +0100
Message-ID: <20240122194200.381241-10-david@redhat.com>
In-Reply-To: <20240122194200.381241-1-david@redhat.com>
References: <20240122194200.381241-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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
Cc: David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" 
 <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's implement PTE batching when consecutive (present) PTEs map
consecutive pages of the same large folio, and all other PTE bits besides
the PFNs are equal.

We will optimize folio_pte_batch() separately, to ignore some other
PTE bits. This patch is based on work by Ryan Roberts.

Use __always_inline for __copy_present_ptes() and keep the handling for
single PTEs completely separate from the multi-PTE case: we really want
the compiler to optimize for the single-PTE case with small folios, to
not degrade performance.

Note that PTE batching will never exceed a single page table and will
always stay within VMA boundaries.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/pgtable.h |  17 +++++-
 mm/memory.c             | 113 +++++++++++++++++++++++++++++++++-------
 2 files changed, 109 insertions(+), 21 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index f6d0e3513948a..d32cedf6936ba 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -212,8 +212,6 @@ static inline int pmd_dirty(pmd_t pmd)
 #define arch_flush_lazy_mmu_mode()	do {} while (0)
 #endif
 
-#ifndef set_ptes
-
 #ifndef pte_next_pfn
 static inline pte_t pte_next_pfn(pte_t pte)
 {
@@ -221,6 +219,7 @@ static inline pte_t pte_next_pfn(pte_t pte)
 }
 #endif
 
+#ifndef set_ptes
 /**
  * set_ptes - Map consecutive pages to a contiguous range of addresses.
  * @mm: Address space to map the pages into.
@@ -650,6 +649,20 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addres
 }
 #endif
 
+#ifndef wrprotect_ptes
+static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
+		pte_t *ptep, unsigned int nr)
+{
+	for (;;) {
+		ptep_set_wrprotect(mm, addr, ptep);
+		if (--nr == 0)
+			break;
+		ptep++;
+		addr += PAGE_SIZE;
+	}
+}
+#endif
+
 /*
  * On some architectures hardware does not set page access bit when accessing
  * memory page, it is responsibility of software setting this bit. It brings
diff --git a/mm/memory.c b/mm/memory.c
index 185b4aff13d62..f563aec85b2a8 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -930,15 +930,15 @@ copy_present_page(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
 	return 0;
 }
 
-static inline void __copy_present_pte(struct vm_area_struct *dst_vma,
+static __always_inline void __copy_present_ptes(struct vm_area_struct *dst_vma,
 		struct vm_area_struct *src_vma, pte_t *dst_pte, pte_t *src_pte,
-		pte_t pte, unsigned long addr)
+		pte_t pte, unsigned long addr, int nr)
 {
 	struct mm_struct *src_mm = src_vma->vm_mm;
 
 	/* If it's a COW mapping, write protect it both processes. */
 	if (is_cow_mapping(src_vma->vm_flags) && pte_write(pte)) {
-		ptep_set_wrprotect(src_mm, addr, src_pte);
+		wrprotect_ptes(src_mm, addr, src_pte, nr);
 		pte = pte_wrprotect(pte);
 	}
 
@@ -950,26 +950,94 @@ static inline void __copy_present_pte(struct vm_area_struct *dst_vma,
 	if (!userfaultfd_wp(dst_vma))
 		pte = pte_clear_uffd_wp(pte);
 
-	set_pte_at(dst_vma->vm_mm, addr, dst_pte, pte);
+	set_ptes(dst_vma->vm_mm, addr, dst_pte, pte, nr);
+}
+
+/*
+ * Detect a PTE batch: consecutive (present) PTEs that map consecutive
+ * pages of the same folio.
+ *
+ * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN.
+ */
+static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
+		pte_t *start_ptep, pte_t pte, int max_nr)
+{
+	unsigned long folio_end_pfn = folio_pfn(folio) + folio_nr_pages(folio);
+	const pte_t *end_ptep = start_ptep + max_nr;
+	pte_t expected_pte = pte_next_pfn(pte);
+	pte_t *ptep = start_ptep + 1;
+
+	VM_WARN_ON_FOLIO(!pte_present(pte), folio);
+
+	while (ptep != end_ptep) {
+		pte = ptep_get(ptep);
+
+		if (!pte_same(pte, expected_pte))
+			break;
+
+		/*
+		 * Stop immediately once we reached the end of the folio. In
+		 * corner cases the next PFN might fall into a different
+		 * folio.
+		 */
+		if (pte_pfn(pte) == folio_end_pfn)
+			break;
+
+		expected_pte = pte_next_pfn(expected_pte);
+		ptep++;
+	}
+
+	return ptep - start_ptep;
 }
 
 /*
- * Copy one pte.  Returns 0 if succeeded, or -EAGAIN if one preallocated page
- * is required to copy this pte.
+ * Copy one present PTE, trying to batch-process subsequent PTEs that map
+ * consecutive pages of the same folio by copying them as well.
+ *
+ * Returns -EAGAIN if one preallocated page is required to copy the next PTE.
+ * Otherwise, returns the number of copied PTEs (at least 1).
  */
 static inline int
-copy_present_pte(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
+copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 		 pte_t *dst_pte, pte_t *src_pte, pte_t pte, unsigned long addr,
-		 int *rss, struct folio **prealloc)
+		 int max_nr, int *rss, struct folio **prealloc)
 {
 	struct page *page;
 	struct folio *folio;
+	int err, nr;
 
 	page = vm_normal_page(src_vma, addr, pte);
 	if (unlikely(!page))
 		goto copy_pte;
 
 	folio = page_folio(page);
+
+	/*
+	 * If we likely have to copy, just don't bother with batching. Make
+	 * sure that the common "small folio" case stays as fast as possible
+	 * by keeping the batching logic separate.
+	 */
+	if (unlikely(!*prealloc && folio_test_large(folio) && max_nr != 1)) {
+		nr = folio_pte_batch(folio, addr, src_pte, pte, max_nr);
+		if (folio_test_anon(folio)) {
+			folio_ref_add(folio, nr);
+			if (unlikely(folio_try_dup_anon_rmap_ptes(folio, page,
+								  nr, src_vma))) {
+				folio_ref_sub(folio, nr);
+				return -EAGAIN;
+			}
+			rss[MM_ANONPAGES] += nr;
+			VM_WARN_ON_FOLIO(PageAnonExclusive(page), folio);
+		} else {
+			folio_ref_add(folio, nr);
+			folio_dup_file_rmap_ptes(folio, page, nr);
+			rss[mm_counter_file(page)] += nr;
+		}
+		__copy_present_ptes(dst_vma, src_vma, dst_pte, src_pte, pte,
+				    addr, nr);
+		return nr;
+	}
+
 	if (folio_test_anon(folio)) {
 		/*
 		 * If this page may have been pinned by the parent process,
@@ -981,8 +1049,9 @@ copy_present_pte(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 		if (unlikely(folio_try_dup_anon_rmap_pte(folio, page, src_vma))) {
 			/* Page may be pinned, we have to copy. */
 			folio_put(folio);
-			return copy_present_page(dst_vma, src_vma, dst_pte, src_pte,
-						 addr, rss, prealloc, page);
+			err = copy_present_page(dst_vma, src_vma, dst_pte, src_pte,
+						addr, rss, prealloc, page);
+			return err ? err : 1;
 		}
 		rss[MM_ANONPAGES]++;
 		VM_WARN_ON_FOLIO(PageAnonExclusive(page), folio);
@@ -993,8 +1062,8 @@ copy_present_pte(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	}
 
 copy_pte:
-	__copy_present_pte(dst_vma, src_vma, dst_pte, src_pte, pte, addr);
-	return 0;
+	__copy_present_ptes(dst_vma, src_vma, dst_pte, src_pte, pte, addr, 1);
+	return 1;
 }
 
 static inline struct folio *folio_prealloc(struct mm_struct *src_mm,
@@ -1031,10 +1100,11 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	pte_t *src_pte, *dst_pte;
 	pte_t ptent;
 	spinlock_t *src_ptl, *dst_ptl;
-	int progress, ret = 0;
+	int progress, max_nr, ret = 0;
 	int rss[NR_MM_COUNTERS];
 	swp_entry_t entry = (swp_entry_t){0};
 	struct folio *prealloc = NULL;
+	int nr;
 
 again:
 	progress = 0;
@@ -1065,6 +1135,8 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	arch_enter_lazy_mmu_mode();
 
 	do {
+		nr = 1;
+
 		/*
 		 * We are holding two locks at this point - either of them
 		 * could generate latencies in another task on another CPU.
@@ -1101,9 +1173,10 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 			 */
 			WARN_ON_ONCE(ret != -ENOENT);
 		}
-		/* copy_present_pte() will clear `*prealloc' if consumed */
-		ret = copy_present_pte(dst_vma, src_vma, dst_pte, src_pte,
-				       ptent, addr, rss, &prealloc);
+		/* copy_present_ptes() will clear `*prealloc' if consumed */
+		max_nr = (end - addr) / PAGE_SIZE;
+		ret = copy_present_ptes(dst_vma, src_vma, dst_pte, src_pte,
+					ptent, addr, max_nr, rss, &prealloc);
 		/*
 		 * If we need a pre-allocated page for this pte, drop the
 		 * locks, allocate, and try again.
@@ -1120,8 +1193,10 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 			folio_put(prealloc);
 			prealloc = NULL;
 		}
-		progress += 8;
-	} while (dst_pte++, src_pte++, addr += PAGE_SIZE, addr != end);
+		nr = ret;
+		progress += 8 * nr;
+	} while (dst_pte += nr, src_pte += nr, addr += PAGE_SIZE * nr,
+		 addr != end);
 
 	arch_leave_lazy_mmu_mode();
 	pte_unmap_unlock(orig_src_pte, src_ptl);
@@ -1142,7 +1217,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 		prealloc = folio_prealloc(src_mm, src_vma, addr, false);
 		if (!prealloc)
 			return -ENOMEM;
-	} else if (ret) {
+	} else if (ret < 0) {
 		VM_WARN_ON_ONCE(1);
 	}
 
-- 
2.43.0

