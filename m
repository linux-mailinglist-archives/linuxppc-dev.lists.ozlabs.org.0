Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EB58405D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 13:57:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SmzgwHJ1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y99v8U4Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNpGt44HRz3vwV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 23:57:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SmzgwHJ1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y99v8U4Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNp4k1G98z3cVG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jan 2024 23:48:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706532499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLdn+T1R5PiYDW19VyAaeLNlt8B1zt8mn8YsDhIt5B8=;
	b=SmzgwHJ1XT60HCh60HP2Q68+1dzGgv20haSbIjHNuN0GgCTH1FXhgvEBH0d8f7IQ+B2Tkl
	SyZHwh5TculXYfZt3cRnrGEoCixz3Y7eE1ltQ6OAK20FtuLgd4xSDHIgOA5+frLc49A3MO
	tbkgcJXkjk9rX6orJo8W/He+hI3n/18=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706532500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLdn+T1R5PiYDW19VyAaeLNlt8B1zt8mn8YsDhIt5B8=;
	b=Y99v8U4YZPpbvKWuES96EHWZXZ1P4dvK3jBafQo9guEWcEbvVvcooLtiOaUs2IHuvrXact
	tIJI1eyNJ0SZroBaOEL0TQc2vw9ApCmxN/tVeBXgrcw+crFrJy/fecbDdKh6+8MHrHKWQt
	CgMXuhbM77TRYvIfI/RFWcC3aHcRpPY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-602-1IZZ7hGdOwG8M8ciVMufmA-1; Mon,
 29 Jan 2024 07:48:16 -0500
X-MC-Unique: 1IZZ7hGdOwG8M8ciVMufmA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B83A29AA3AC;
	Mon, 29 Jan 2024 12:48:14 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.194.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 277D3111E8;
	Mon, 29 Jan 2024 12:48:09 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/15] mm/memory: optimize fork() with PTE-mapped THP
Date: Mon, 29 Jan 2024 13:46:47 +0100
Message-ID: <20240129124649.189745-14-david@redhat.com>
In-Reply-To: <20240129124649.189745-1-david@redhat.com>
References: <20240129124649.189745-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

We will optimize folio_pte_batch() separately, to ignore selected
PTE bits. This patch is based on work by Ryan Roberts.

Use __always_inline for __copy_present_ptes() and keep the handling for
single PTEs completely separate from the multi-PTE case: we really want
the compiler to optimize for the single-PTE case with small folios, to
not degrade performance.

Note that PTE batching will never exceed a single page table and will
always stay within VMA boundaries.

Further, processing PTE-mapped THP that maybe pinned and have
PageAnonExclusive set on at least one subpage should work as expected,
but there is room for improvement: We will repeatedly (1) detect a PTE
batch (2) detect that we have to copy a page (3) fall back and allocate a
single page to copy a single page. For now we won't care as pinned pages
are a corner case, and we should rather look into maintaining only a
single PageAnonExclusive bit for large folios.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/pgtable.h |  31 +++++++++++
 mm/memory.c             | 112 +++++++++++++++++++++++++++++++++-------
 2 files changed, 124 insertions(+), 19 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 351cd9dc7194..aab227e12493 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -650,6 +650,37 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addres
 }
 #endif
 
+#ifndef wrprotect_ptes
+/**
+ * wrprotect_ptes - Write-protect PTEs that map consecutive pages of the same
+ *		    folio.
+ * @mm: Address space the pages are mapped into.
+ * @addr: Address the first page is mapped at.
+ * @ptep: Page table pointer for the first entry.
+ * @nr: Number of entries to write-protect.
+ *
+ * May be overridden by the architecture; otherwise, implemented as a simple
+ * loop over ptep_set_wrprotect().
+ *
+ * Note that PTE bits in the PTE range besides the PFN can differ. For example,
+ * some PTEs might be write-protected.
+ *
+ * Context: The caller holds the page table lock.  The PTEs map consecutive
+ * pages that belong to the same folio.  The PTEs are all in the same PMD.
+ */
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
index 41b24da5be38..86f8a0021c8e 100644
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
 
@@ -950,26 +950,93 @@ static inline void __copy_present_pte(struct vm_area_struct *dst_vma,
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
+	 * sure that the common "small folio" case is as fast as possible
+	 * by keeping the batching logic separate.
+	 */
+	if (unlikely(!*prealloc && folio_test_large(folio) && max_nr != 1)) {
+		nr = folio_pte_batch(folio, addr, src_pte, pte, max_nr);
+		folio_ref_add(folio, nr);
+		if (folio_test_anon(folio)) {
+			if (unlikely(folio_try_dup_anon_rmap_ptes(folio, page,
+								  nr, src_vma))) {
+				folio_ref_sub(folio, nr);
+				return -EAGAIN;
+			}
+			rss[MM_ANONPAGES] += nr;
+			VM_WARN_ON_FOLIO(PageAnonExclusive(page), folio);
+		} else {
+			folio_dup_file_rmap_ptes(folio, page, nr);
+			rss[mm_counter_file(folio)] += nr;
+		}
+		__copy_present_ptes(dst_vma, src_vma, dst_pte, src_pte, pte,
+				    addr, nr);
+		return nr;
+	}
+
 	folio_get(folio);
 	if (folio_test_anon(folio)) {
 		/*
@@ -981,8 +1048,9 @@ copy_present_pte(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
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
@@ -992,8 +1060,8 @@ copy_present_pte(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	}
 
 copy_pte:
-	__copy_present_pte(dst_vma, src_vma, dst_pte, src_pte, pte, addr);
-	return 0;
+	__copy_present_ptes(dst_vma, src_vma, dst_pte, src_pte, pte, addr, 1);
+	return 1;
 }
 
 static inline struct folio *folio_prealloc(struct mm_struct *src_mm,
@@ -1030,10 +1098,11 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
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
@@ -1064,6 +1133,8 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	arch_enter_lazy_mmu_mode();
 
 	do {
+		nr = 1;
+
 		/*
 		 * We are holding two locks at this point - either of them
 		 * could generate latencies in another task on another CPU.
@@ -1100,9 +1171,10 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
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
@@ -1119,8 +1191,10 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
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
@@ -1141,7 +1215,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 		prealloc = folio_prealloc(src_mm, src_vma, addr, false);
 		if (!prealloc)
 			return -ENOMEM;
-	} else if (ret) {
+	} else if (ret < 0) {
 		VM_WARN_ON_ONCE(1);
 	}
 
-- 
2.43.0

