Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3295A5EAB08
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 17:29:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mbmrh03L3z3c6Q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 01:29:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fjtOhKeC;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fjtOhKeC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fjtOhKeC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fjtOhKeC;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mbmnc5Lmqz3bfC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 01:26:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664206002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aWfrIyEvhTMggIMd+HlRLdF9c6l+CFMFlKsWf3PtMFA=;
	b=fjtOhKeCf+XJOMNuRZ9l+2i38144LDvZFyIPapItIR1Wc8YJAemAhqzdvXqNhypFA6DPC1
	pqOO9aVqKJ8Ih1qOvH61bYCqHGh7Bgw8J5OzukN5BafLXLE6xCDdXMeh9oOyeQIGUTLSUD
	2TdISqpeBrV31CpJLV/f3SQQi76zP+0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664206002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aWfrIyEvhTMggIMd+HlRLdF9c6l+CFMFlKsWf3PtMFA=;
	b=fjtOhKeCf+XJOMNuRZ9l+2i38144LDvZFyIPapItIR1Wc8YJAemAhqzdvXqNhypFA6DPC1
	pqOO9aVqKJ8Ih1qOvH61bYCqHGh7Bgw8J5OzukN5BafLXLE6xCDdXMeh9oOyeQIGUTLSUD
	2TdISqpeBrV31CpJLV/f3SQQi76zP+0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-0q8JOjlhPiWES8e7lot1ig-1; Mon, 26 Sep 2022 11:26:38 -0400
X-MC-Unique: 0q8JOjlhPiWES8e7lot1ig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7805D3C6EAA2;
	Mon, 26 Sep 2022 15:26:37 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F2F33C15BA5;
	Mon, 26 Sep 2022 15:26:33 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 4/5] mm/autonuma: use can_change_(pte|pmd)_writable() to replace savedwrite
Date: Mon, 26 Sep 2022 17:26:17 +0200
Message-Id: <20220926152618.194810-5-david@redhat.com>
In-Reply-To: <20220926152618.194810-1-david@redhat.com>
References: <20220926152618.194810-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Anshuman Khandual <anshuman.khandual@arm.com>, Dave Chinner <david@fromorbit.com>, Mel Gorman <mgorman@techsingularity.net>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Hugh Dickins <hughd@google.com>, Nadav Amit <namit@vmware.com>, Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit b191f9b106ea ("mm: numa: preserve PTE write permissions across a
NUMA hinting fault") added remembering write permissions using ordinary
pte_write() for PROT_NONE mapped pages to avoid write faults when
remapping the page !PROT_NONE on NUMA hinting faults.

That commit noted:

    The patch looks hacky but the alternatives looked worse. The tidest was
    to rewalk the page tables after a hinting fault but it was more complex
    than this approach and the performance was worse. It's not generally
    safe to just mark the page writable during the fault if it's a write
    fault as it may have been read-only for COW so that approach was
    discarded.

Later, commit 288bc54949fc ("mm/autonuma: let architecture override how
the write bit should be stashed in a protnone pte.") introduced a family
of savedwrite PTE functions that didn't necessarily improve the whole
situation.

One confusing thing is that nowadays, if a page is pte_protnone()
and pte_savedwrite() then also pte_write() is true. Another source of
confusion is that there is only a single pte_mk_savedwrite() call in the
kernel. All other write-protection code seems to silently rely on
pte_wrprotect().

Ever since PageAnonExclusive was introduced and we started using it in
mprotect context via commit 64fe24a3e05e ("mm/mprotect: try avoiding write
faults for exclusive anonymous pages when changing protection"), we do
have machinery in place to avoid write faults when changing protection,
which is exactly what we want to do here.

Let's similarly do what ordinary mprotect() does nowadays when upgrading
write permissions and reuse can_change_pte_writable() and
can_change_pmd_writable() to detect if we can upgrade PTE permissions to be
writable.

For anonymous pages there should be absolutely no change: if an
anonymous page is not exclusive, it could not have been mapped writable --
because only exclusive anonymous pages can be mapped writable.

However, there *might* be a change for writable shared mappings that
require writenotify: if they are not dirty, we cannot map them writable.
While it might not matter in practice, we'd need a different way to
identify whether writenotify is actually required -- and ordinary mprotect
would benefit from that as well.

We'll remove all savedwrite leftovers next.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h |  2 ++
 mm/huge_memory.c   | 28 +++++++++++++++++-----------
 mm/ksm.c           |  9 ++++-----
 mm/memory.c        | 19 ++++++++++++++++---
 mm/mprotect.c      |  7 ++-----
 5 files changed, 41 insertions(+), 24 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 8a5ad9d050bf..20061a9f7f47 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1954,6 +1954,8 @@ extern unsigned long move_page_tables(struct vm_area_struct *vma,
 #define  MM_CP_UFFD_WP_ALL                 (MM_CP_UFFD_WP | \
 					    MM_CP_UFFD_WP_RESOLVE)
 
+bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
+			     pte_t pte);
 extern unsigned long change_protection(struct mmu_gather *tlb,
 			      struct vm_area_struct *vma, unsigned long start,
 			      unsigned long end, pgprot_t newprot,
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index e5ce3e11d4ae..f148d1295d2e 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1507,8 +1507,7 @@ vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
 	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
 	int page_nid = NUMA_NO_NODE;
 	int target_nid, last_cpupid = (-1 & LAST_CPUPID_MASK);
-	bool migrated = false;
-	bool was_writable = pmd_savedwrite(oldpmd);
+	bool try_change_writable, migrated = false;
 	int flags = 0;
 
 	vmf->ptl = pmd_lock(vma->vm_mm, vmf->pmd);
@@ -1517,13 +1516,22 @@ vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
 		goto out;
 	}
 
+	/* See mprotect_fixup(). */
+	if (vma->vm_flags & VM_SHARED)
+		try_change_writable = vma_wants_writenotify(vma, vma->vm_page_prot);
+	else
+		try_change_writable = !!(vma->vm_flags & VM_WRITE);
+
 	pmd = pmd_modify(oldpmd, vma->vm_page_prot);
 	page = vm_normal_page_pmd(vma, haddr, pmd);
 	if (!page)
 		goto out_map;
 
 	/* See similar comment in do_numa_page for explanation */
-	if (!was_writable)
+	if (try_change_writable && !pmd_write(pmd) &&
+	     can_change_pmd_writable(vma, vmf->address, pmd))
+		pmd = pmd_mkwrite(pmd);
+	if (!pmd_write(pmd))
 		flags |= TNF_NO_GROUP;
 
 	page_nid = page_to_nid(page);
@@ -1568,8 +1576,12 @@ vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
 	/* Restore the PMD */
 	pmd = pmd_modify(oldpmd, vma->vm_page_prot);
 	pmd = pmd_mkyoung(pmd);
-	if (was_writable)
+
+	/* Similar to mprotect() protection updates, avoid write faults. */
+	if (try_change_writable && !pmd_write(pmd) &&
+	     can_change_pmd_writable(vma, vmf->address, pmd))
 		pmd = pmd_mkwrite(pmd);
+
 	set_pmd_at(vma->vm_mm, haddr, vmf->pmd, pmd);
 	update_mmu_cache_pmd(vma, vmf->address, vmf->pmd);
 	spin_unlock(vmf->ptl);
@@ -1809,11 +1821,10 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	struct mm_struct *mm = vma->vm_mm;
 	spinlock_t *ptl;
 	pmd_t oldpmd, entry;
-	bool preserve_write;
-	int ret;
 	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
 	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
 	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
+	int ret = 1;
 
 	tlb_change_page_size(tlb, HPAGE_PMD_SIZE);
 
@@ -1824,9 +1835,6 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	if (!ptl)
 		return 0;
 
-	preserve_write = prot_numa && pmd_write(*pmd);
-	ret = 1;
-
 #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
 	if (is_swap_pmd(*pmd)) {
 		swp_entry_t entry = pmd_to_swp_entry(*pmd);
@@ -1906,8 +1914,6 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	oldpmd = pmdp_invalidate_ad(vma, addr, pmd);
 
 	entry = pmd_modify(oldpmd, newprot);
-	if (preserve_write)
-		entry = pmd_mk_savedwrite(entry);
 	if (uffd_wp) {
 		entry = pmd_wrprotect(entry);
 		entry = pmd_mkuffd_wp(entry);
diff --git a/mm/ksm.c b/mm/ksm.c
index fd6d03cb0463..40baecec117a 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -1065,7 +1065,6 @@ static int write_protect_page(struct vm_area_struct *vma, struct page *page,
 
 	anon_exclusive = PageAnonExclusive(page);
 	if (pte_write(*pvmw.pte) || pte_dirty(*pvmw.pte) ||
-	    (pte_protnone(*pvmw.pte) && pte_savedwrite(*pvmw.pte)) ||
 	    anon_exclusive || mm_tlb_flush_pending(mm)) {
 		pte_t entry;
 
@@ -1103,11 +1102,11 @@ static int write_protect_page(struct vm_area_struct *vma, struct page *page,
 
 		if (pte_dirty(entry))
 			set_page_dirty(page);
+		entry = pte_mkclean(entry);
+
+		if (pte_write(entry))
+			entry = pte_wrprotect(entry);
 
-		if (pte_protnone(entry))
-			entry = pte_mkclean(pte_clear_savedwrite(entry));
-		else
-			entry = pte_mkclean(pte_wrprotect(entry));
 		set_pte_at_notify(mm, pvmw.address, pvmw.pte, entry);
 	}
 	*orig_pte = *pvmw.pte;
diff --git a/mm/memory.c b/mm/memory.c
index b994784158f5..8df1b77767cb 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4676,12 +4676,12 @@ int numa_migrate_prep(struct page *page, struct vm_area_struct *vma,
 static vm_fault_t do_numa_page(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
+	bool try_change_writable;
 	struct page *page = NULL;
 	int page_nid = NUMA_NO_NODE;
 	int last_cpupid;
 	int target_nid;
 	pte_t pte, old_pte;
-	bool was_writable = pte_savedwrite(vmf->orig_pte);
 	int flags = 0;
 
 	/*
@@ -4696,6 +4696,12 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
 		goto out;
 	}
 
+	/* See mprotect_fixup(). */
+	if (vma->vm_flags & VM_SHARED)
+		try_change_writable = vma_wants_writenotify(vma, vma->vm_page_prot);
+	else
+		try_change_writable = !!(vma->vm_flags & VM_WRITE);
+
 	/* Get the normal PTE  */
 	old_pte = ptep_get(vmf->pte);
 	pte = pte_modify(old_pte, vma->vm_page_prot);
@@ -4716,7 +4722,10 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
 	 * pte_dirty has unpredictable behaviour between PTE scan updates,
 	 * background writeback, dirty balancing and application behaviour.
 	 */
-	if (!was_writable)
+	if (try_change_writable && !pte_write(pte) &&
+	     can_change_pte_writable(vma, vmf->address, pte))
+		pte = pte_mkwrite(pte);
+	if (!pte_write(pte))
 		flags |= TNF_NO_GROUP;
 
 	/*
@@ -4771,8 +4780,12 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
 	old_pte = ptep_modify_prot_start(vma, vmf->address, vmf->pte);
 	pte = pte_modify(old_pte, vma->vm_page_prot);
 	pte = pte_mkyoung(pte);
-	if (was_writable)
+
+	/* Similar to mprotect() protection updates, avoid write faults. */
+	if (try_change_writable && !pte_write(pte) &&
+	     can_change_pte_writable(vma, vmf->address, pte))
 		pte = pte_mkwrite(pte);
+
 	ptep_modify_prot_commit(vma, vmf->address, vmf->pte, old_pte, pte);
 	update_mmu_cache(vma, vmf->address, vmf->pte);
 	pte_unmap_unlock(vmf->pte, vmf->ptl);
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 95323bc9a951..1077906136ff 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -38,8 +38,8 @@
 
 #include "internal.h"
 
-static inline bool can_change_pte_writable(struct vm_area_struct *vma,
-					   unsigned long addr, pte_t pte)
+bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
+			     pte_t pte)
 {
 	struct page *page;
 
@@ -118,7 +118,6 @@ static unsigned long change_pte_range(struct mmu_gather *tlb,
 		oldpte = *pte;
 		if (pte_present(oldpte)) {
 			pte_t ptent;
-			bool preserve_write = prot_numa && pte_write(oldpte);
 
 			/*
 			 * Avoid trapping faults against the zero or KSM
@@ -174,8 +173,6 @@ static unsigned long change_pte_range(struct mmu_gather *tlb,
 
 			oldpte = ptep_modify_prot_start(vma, addr, pte);
 			ptent = pte_modify(oldpte, newprot);
-			if (preserve_write)
-				ptent = pte_mk_savedwrite(ptent);
 
 			if (uffd_wp) {
 				ptent = pte_wrprotect(ptent);
-- 
2.37.3

