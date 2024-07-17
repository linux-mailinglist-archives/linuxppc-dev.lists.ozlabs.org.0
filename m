Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 425B4934491
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 00:06:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X4x4G6uc;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X4x4G6uc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPVQQ1F1Cz3cZ5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 08:06:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X4x4G6uc;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X4x4G6uc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPVKr757Xz3dHm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 08:02:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721253757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cM3uv1r2lWcW+xf+zoFP/LGFvU433fJ+6ETuZi6JTtc=;
	b=X4x4G6uceckUzUEFGydtnyMyFkRjLVoqyUUMh/QrfNuBPjzC9RjvYSOEIxX7VF0qrmHG1L
	RU6fyidvyYkpp1Lt2j+kEsYvydnRlVukrOufvWQQ/KI4aMiJNOYvm9RwuSVL2eDTGweXnt
	ICK1+wdNZr4ufiu3xQP6BO7pWI//sbg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721253757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cM3uv1r2lWcW+xf+zoFP/LGFvU433fJ+6ETuZi6JTtc=;
	b=X4x4G6uceckUzUEFGydtnyMyFkRjLVoqyUUMh/QrfNuBPjzC9RjvYSOEIxX7VF0qrmHG1L
	RU6fyidvyYkpp1Lt2j+kEsYvydnRlVukrOufvWQQ/KI4aMiJNOYvm9RwuSVL2eDTGweXnt
	ICK1+wdNZr4ufiu3xQP6BO7pWI//sbg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-O-rrOkh8Phq-2imGV99Qdg-1; Wed, 17 Jul 2024 18:02:36 -0400
X-MC-Unique: O-rrOkh8Phq-2imGV99Qdg-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-447f9d993c2so176221cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2024 15:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721253755; x=1721858555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cM3uv1r2lWcW+xf+zoFP/LGFvU433fJ+6ETuZi6JTtc=;
        b=Fzr/flbVXzFUDxuj4yGLDC3jxO6LRHiCt1N9Nz3gfpnXgz8KHXjAElcaWIMVZ7TuST
         vroZtgyo3YbcHyIh+YWqo87bPezT//TlVbX5SWxqK6DMYmXpW7M7ZcI6i7cF8CEq/PZ7
         aaBFTdYEYvcsahH7mnT2+b5Hr8sohEIcx/a+nZJ8fpYAzJFw/bPs2TOR29zZlYv12h5p
         ADpgWavjq9TkGvxxM53Up4iGeJmAUOtP+kzCxh5QY4xrlQavrQApPCiEp4PAVupVO2UV
         dwCgURtSHsCh4ghYCyP0f8A0W7n2yFj6mSnXFmwvJxXf9A10IekTUS2N11iq/QlUhKlg
         7OwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw6E8gpWSdXeFcrdQUeJ6CYGneiZ710oiiazJx84IbRyH49uRKTVtltZYF3TE6guVmVWy1Q8/UVxIwjL8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy9w8CJDh83jXnbHAijaqGNhAxzNKElEdG6vzbIWimjs6tOUpit
	drbk4GR2hwcfDiWEpYzuHN4/kZy3n3PbgOb0lJum7GDIj4ONDXFkcv/8Bz0vwUpdrHMgrymvJDW
	eDL4BrA4epi601OOTrPfz9PWrIuXtwGLnuiQf6/w+A9YYMg0tDDVMdJmT0t1opJY=
X-Received: by 2002:a05:622a:19a8:b0:446:5a29:c501 with SMTP id d75a77b69052e-44f864afa6cmr22373081cf.1.1721253755335;
        Wed, 17 Jul 2024 15:02:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8QsOTDoliMPT3fo+/7Outqv1nF7W8rzQA7PybYEjXwyS1q7X3t8IYBAe2znVX4XcYe4OF/A==
X-Received: by 2002:a05:622a:19a8:b0:446:5a29:c501 with SMTP id d75a77b69052e-44f864afa6cmr22372781cf.1.1721253754848;
        Wed, 17 Jul 2024 15:02:34 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f5b83f632sm53071651cf.85.2024.07.17.15.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 15:02:34 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH RFC 6/6] mm: Convert "*_trans_huge() || *_devmap()" to use *_leaf()
Date: Wed, 17 Jul 2024 18:02:19 -0400
Message-ID: <20240717220219.3743374-7-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240717220219.3743374-1-peterx@redhat.com>
References: <20240717220219.3743374-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, Alistair Popple <apopple@nvidia.com>, Ryan Roberts <ryan.roberts@arm.com>, David Hildenbrand <david@redhat.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, peterx@redhat.com, Michal Hocko <mhocko@kernel.org>, Alex Williamson <alex.williamson@redhat.com>, linux-riscv@lists.infradead.org, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, sparclinux@vger.kernel.org, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch converted all such checks into one *_leaf() check under common
mm/, as "thp+devmap" should compose everything for a *_leaf() for now.  I
didn't yet touch arch code in other directories, as some arch may need some
special attention, so I left those separately.

It should start to save some cycles on such check and pave way for the new
leaf types.  E.g., when a new type of leaf is introduced, it'll naturally
go the same route to what we have now for thp+devmap.

Here one issue with pxx_leaf() API is that such API will be defined by arch
but it doesn't consider kernel config.  For example, below "if" branch
cannot be automatically optimized:

  if (pmd_leaf()) { ... }

Even if both THP && HUGETLB are not enabled (which means pmd_leaf() can
never return true).

To provide a chance for compilers to optimize and omit code when possible,
introduce a light wrapper for them and call them pxx_is_leaf().  That will
take kernel config into account and properly allow omitting branches when
the compiler knows it'll constantly returns false.  This tries to mimic
what we used to have with pxx_trans_huge() when !THP, so it now also
applies to pxx_leaf() API.

Cc: Alistair Popple <apopple@nvidia.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/huge_mm.h    |  6 +++---
 include/linux/pgtable.h    | 30 +++++++++++++++++++++++++++++-
 mm/hmm.c                   |  4 ++--
 mm/huge_mapping_pmd.c      |  9 +++------
 mm/huge_mapping_pud.c      |  6 +++---
 mm/mapping_dirty_helpers.c |  4 ++--
 mm/memory.c                | 14 ++++++--------
 mm/migrate_device.c        |  2 +-
 mm/mprotect.c              |  4 ++--
 mm/mremap.c                |  5 ++---
 mm/page_vma_mapped.c       |  5 ++---
 mm/pgtable-generic.c       |  7 +++----
 12 files changed, 58 insertions(+), 38 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index aea2784df8ef..a5b026d0731e 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -27,7 +27,7 @@ spinlock_t *__pud_trans_huge_lock(pud_t *pud, struct vm_area_struct *vma);
 static inline spinlock_t *
 pud_trans_huge_lock(pud_t *pud, struct vm_area_struct *vma)
 {
-	if (pud_trans_huge(*pud) || pud_devmap(*pud))
+	if (pud_is_leaf(*pud))
 		return __pud_trans_huge_lock(pud, vma);
 	else
 		return NULL;
@@ -36,7 +36,7 @@ pud_trans_huge_lock(pud_t *pud, struct vm_area_struct *vma)
 #define split_huge_pud(__vma, __pud, __address)				\
 	do {								\
 		pud_t *____pud = (__pud);				\
-		if (pud_trans_huge(*____pud) || pud_devmap(*____pud))	\
+		if (pud_is_leaf(*____pud))				\
 			__split_huge_pud(__vma, __pud, __address);	\
 	}  while (0)
 #else  /* CONFIG_PGTABLE_HAS_PUD_LEAVES */
@@ -125,7 +125,7 @@ static inline int is_swap_pmd(pmd_t pmd)
 static inline spinlock_t *
 pmd_trans_huge_lock(pmd_t *pmd, struct vm_area_struct *vma)
 {
-	if (is_swap_pmd(*pmd) || pmd_trans_huge(*pmd) || pmd_devmap(*pmd))
+	if (is_swap_pmd(*pmd) || pmd_is_leaf(*pmd))
 		return __pmd_trans_huge_lock(pmd, vma);
 	else
 		return NULL;
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 5e505373b113..af7709a132aa 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1641,7 +1641,7 @@ static inline int pud_trans_unstable(pud_t *pud)
 	defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
 	pud_t pudval = READ_ONCE(*pud);
 
-	if (pud_none(pudval) || pud_trans_huge(pudval) || pud_devmap(pudval))
+	if (pud_none(pudval) || pud_leaf(pudval))
 		return 1;
 	if (unlikely(pud_bad(pudval))) {
 		pud_clear_bad(pud);
@@ -1901,6 +1901,34 @@ typedef unsigned int pgtbl_mod_mask;
 #define pmd_leaf(x)	false
 #endif
 
+/*
+ * Wrapper of pxx_leaf() helpers.
+ *
+ * Comparing to pxx_leaf() API, the only difference is: using these macros
+ * can help code generation, so unnecessary code can be omitted when the
+ * specific level of leaf is not possible due to kernel config.  It is
+ * needed because normally pxx_leaf() can be defined in arch code without
+ * knowing the kernel config.
+ *
+ * Currently we only need pmd/pud versions, because the largest leaf Linux
+ * supports so far is pud.
+ *
+ * Defining here also means that in arch's pgtable headers these macros
+ * cannot be used, pxx_leaf()s need to be used instead, because this file
+ * will not be included in arch's pgtable headers.
+ */
+#ifdef CONFIG_PGTABLE_HAS_PMD_LEAVES
+#define pmd_is_leaf(x)  pmd_leaf(x)
+#else
+#define pmd_is_leaf(x)  false
+#endif
+
+#ifdef CONFIG_PGTABLE_HAS_PUD_LEAVES
+#define pud_is_leaf(x)  pud_leaf(x)
+#else
+#define pud_is_leaf(x)  false
+#endif
+
 #ifndef pgd_leaf_size
 #define pgd_leaf_size(x) (1ULL << PGDIR_SHIFT)
 #endif
diff --git a/mm/hmm.c b/mm/hmm.c
index 7e0229ae4a5a..8d985bbbfee9 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -351,7 +351,7 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 		return hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
 	}
 
-	if (pmd_devmap(pmd) || pmd_trans_huge(pmd)) {
+	if (pmd_is_leaf(pmd)) {
 		/*
 		 * No need to take pmd_lock here, even if some other thread
 		 * is splitting the huge pmd we will get that event through
@@ -362,7 +362,7 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 		 * values.
 		 */
 		pmd = pmdp_get_lockless(pmdp);
-		if (!pmd_devmap(pmd) && !pmd_trans_huge(pmd))
+		if (!pmd_is_leaf(pmd))
 			goto again;
 
 		return hmm_vma_handle_pmd(walk, addr, end, hmm_pfns, pmd);
diff --git a/mm/huge_mapping_pmd.c b/mm/huge_mapping_pmd.c
index 7b85e2a564d6..d30c60685f66 100644
--- a/mm/huge_mapping_pmd.c
+++ b/mm/huge_mapping_pmd.c
@@ -60,8 +60,7 @@ spinlock_t *__pmd_trans_huge_lock(pmd_t *pmd, struct vm_area_struct *vma)
 	spinlock_t *ptl;
 
 	ptl = pmd_lock(vma->vm_mm, pmd);
-	if (likely(is_swap_pmd(*pmd) || pmd_trans_huge(*pmd) ||
-		   pmd_devmap(*pmd)))
+	if (likely(is_swap_pmd(*pmd) || pmd_is_leaf(*pmd)))
 		return ptl;
 	spin_unlock(ptl);
 	return NULL;
@@ -627,8 +626,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
 	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
 	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
-	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd) &&
-		  !pmd_devmap(*pmd));
+	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_is_leaf(*pmd));
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	count_vm_event(THP_SPLIT_PMD);
@@ -845,8 +843,7 @@ void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
 	 * require a folio to check the PMD against. Otherwise, there
 	 * is a risk of replacing the wrong folio.
 	 */
-	if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) ||
-	    is_pmd_migration_entry(*pmd)) {
+	if (pmd_is_leaf(*pmd) || is_pmd_migration_entry(*pmd)) {
 		if (folio && folio != pmd_folio(*pmd))
 			return;
 		__split_huge_pmd_locked(vma, pmd, address, freeze);
diff --git a/mm/huge_mapping_pud.c b/mm/huge_mapping_pud.c
index c3a6bffe2871..58871dd74df2 100644
--- a/mm/huge_mapping_pud.c
+++ b/mm/huge_mapping_pud.c
@@ -57,7 +57,7 @@ spinlock_t *__pud_trans_huge_lock(pud_t *pud, struct vm_area_struct *vma)
 	spinlock_t *ptl;
 
 	ptl = pud_lock(vma->vm_mm, pud);
-	if (likely(pud_trans_huge(*pud) || pud_devmap(*pud)))
+	if (likely(pud_is_leaf(*pud)))
 		return ptl;
 	spin_unlock(ptl);
 	return NULL;
@@ -90,7 +90,7 @@ int copy_huge_pud(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 
 	ret = -EAGAIN;
 	pud = *src_pud;
-	if (unlikely(!pud_trans_huge(pud) && !pud_devmap(pud)))
+	if (unlikely(!pud_leaf(pud)))
 		goto out_unlock;
 
 	/*
@@ -225,7 +225,7 @@ void __split_huge_pud(struct vm_area_struct *vma, pud_t *pud,
 				(address & HPAGE_PUD_MASK) + HPAGE_PUD_SIZE);
 	mmu_notifier_invalidate_range_start(&range);
 	ptl = pud_lock(vma->vm_mm, pud);
-	if (unlikely(!pud_trans_huge(*pud) && !pud_devmap(*pud)))
+	if (unlikely(!pud_is_leaf(*pud)))
 		goto out;
 	__split_huge_pud_locked(vma, pud, range.start);
 
diff --git a/mm/mapping_dirty_helpers.c b/mm/mapping_dirty_helpers.c
index 2f8829b3541a..a9ea767d2d73 100644
--- a/mm/mapping_dirty_helpers.c
+++ b/mm/mapping_dirty_helpers.c
@@ -129,7 +129,7 @@ static int wp_clean_pmd_entry(pmd_t *pmd, unsigned long addr, unsigned long end,
 	pmd_t pmdval = pmdp_get_lockless(pmd);
 
 	/* Do not split a huge pmd, present or migrated */
-	if (pmd_trans_huge(pmdval) || pmd_devmap(pmdval)) {
+	if (pmd_is_leaf(pmdval)) {
 		WARN_ON(pmd_write(pmdval) || pmd_dirty(pmdval));
 		walk->action = ACTION_CONTINUE;
 	}
@@ -152,7 +152,7 @@ static int wp_clean_pud_entry(pud_t *pud, unsigned long addr, unsigned long end,
 	pud_t pudval = READ_ONCE(*pud);
 
 	/* Do not split a huge pud */
-	if (pud_trans_huge(pudval) || pud_devmap(pudval)) {
+	if (pud_is_leaf(pudval)) {
 		WARN_ON(pud_write(pudval) || pud_dirty(pudval));
 		walk->action = ACTION_CONTINUE;
 	}
diff --git a/mm/memory.c b/mm/memory.c
index 126ee0903c79..6dc92c514bb7 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1235,8 +1235,7 @@ copy_pmd_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	src_pmd = pmd_offset(src_pud, addr);
 	do {
 		next = pmd_addr_end(addr, end);
-		if (is_swap_pmd(*src_pmd) || pmd_trans_huge(*src_pmd)
-			|| pmd_devmap(*src_pmd)) {
+		if (is_swap_pmd(*src_pmd) || pmd_is_leaf(*src_pmd)) {
 			int err;
 			VM_BUG_ON_VMA(next-addr != HPAGE_PMD_SIZE, src_vma);
 			err = copy_huge_pmd(dst_mm, src_mm, dst_pmd, src_pmd,
@@ -1272,7 +1271,7 @@ copy_pud_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	src_pud = pud_offset(src_p4d, addr);
 	do {
 		next = pud_addr_end(addr, end);
-		if (pud_trans_huge(*src_pud) || pud_devmap(*src_pud)) {
+		if (pud_is_leaf(*src_pud)) {
 			int err;
 
 			VM_BUG_ON_VMA(next-addr != HPAGE_PUD_SIZE, src_vma);
@@ -1710,7 +1709,7 @@ static inline unsigned long zap_pmd_range(struct mmu_gather *tlb,
 	pmd = pmd_offset(pud, addr);
 	do {
 		next = pmd_addr_end(addr, end);
-		if (is_swap_pmd(*pmd) || pmd_trans_huge(*pmd) || pmd_devmap(*pmd)) {
+		if (is_swap_pmd(*pmd) || pmd_is_leaf(*pmd)) {
 			if (next - addr != HPAGE_PMD_SIZE)
 				__split_huge_pmd(vma, pmd, addr, false, NULL);
 			else if (zap_huge_pmd(tlb, vma, pmd, addr)) {
@@ -1752,7 +1751,7 @@ static inline unsigned long zap_pud_range(struct mmu_gather *tlb,
 	pud = pud_offset(p4d, addr);
 	do {
 		next = pud_addr_end(addr, end);
-		if (pud_trans_huge(*pud) || pud_devmap(*pud)) {
+		if (pud_is_leaf(*pud)) {
 			if (next - addr != HPAGE_PUD_SIZE) {
 				mmap_assert_locked(tlb->mm);
 				split_huge_pud(vma, pud, addr);
@@ -5605,8 +5604,7 @@ static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
 		pud_t orig_pud = *vmf.pud;
 
 		barrier();
-		if (pud_trans_huge(orig_pud) || pud_devmap(orig_pud)) {
-
+		if (pud_is_leaf(orig_pud)) {
 			/*
 			 * TODO once we support anonymous PUDs: NUMA case and
 			 * FAULT_FLAG_UNSHARE handling.
@@ -5646,7 +5644,7 @@ static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
 				pmd_migration_entry_wait(mm, vmf.pmd);
 			return 0;
 		}
-		if (pmd_trans_huge(vmf.orig_pmd) || pmd_devmap(vmf.orig_pmd)) {
+		if (pmd_is_leaf(vmf.orig_pmd)) {
 			if (pmd_protnone(vmf.orig_pmd) && vma_is_accessible(vma))
 				return do_huge_pmd_numa_page(&vmf);
 
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 6d66dc1c6ffa..1fbeee9619c8 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -596,7 +596,7 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 	pmdp = pmd_alloc(mm, pudp, addr);
 	if (!pmdp)
 		goto abort;
-	if (pmd_trans_huge(*pmdp) || pmd_devmap(*pmdp))
+	if (pmd_leaf(*pmdp))
 		goto abort;
 	if (pte_alloc(mm, pmdp))
 		goto abort;
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 694f13b83864..ddfee216a02b 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -381,7 +381,7 @@ static inline long change_pmd_range(struct mmu_gather *tlb,
 			goto next;
 
 		_pmd = pmdp_get_lockless(pmd);
-		if (is_swap_pmd(_pmd) || pmd_trans_huge(_pmd) || pmd_devmap(_pmd)) {
+		if (is_swap_pmd(_pmd) || pmd_is_leaf(_pmd)) {
 			if ((next - addr != HPAGE_PMD_SIZE) ||
 			    pgtable_split_needed(vma, cp_flags)) {
 				__split_huge_pmd(vma, pmd, addr, false, NULL);
@@ -452,7 +452,7 @@ static inline long change_pud_range(struct mmu_gather *tlb,
 			mmu_notifier_invalidate_range_start(&range);
 		}
 
-		if (pud_leaf(pud)) {
+		if (pud_is_leaf(pud)) {
 			if ((next - addr != PUD_SIZE) ||
 			    pgtable_split_needed(vma, cp_flags)) {
 				__split_huge_pud(vma, pudp, addr);
diff --git a/mm/mremap.c b/mm/mremap.c
index e7ae140fc640..f5c9884ea1f8 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -587,7 +587,7 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
 		new_pud = alloc_new_pud(vma->vm_mm, vma, new_addr);
 		if (!new_pud)
 			break;
-		if (pud_trans_huge(*old_pud) || pud_devmap(*old_pud)) {
+		if (pud_is_leaf(*old_pud)) {
 			if (extent == HPAGE_PUD_SIZE) {
 				move_pgt_entry(HPAGE_PUD, vma, old_addr, new_addr,
 					       old_pud, new_pud, need_rmap_locks);
@@ -609,8 +609,7 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
 		if (!new_pmd)
 			break;
 again:
-		if (is_swap_pmd(*old_pmd) || pmd_trans_huge(*old_pmd) ||
-		    pmd_devmap(*old_pmd)) {
+		if (is_swap_pmd(*old_pmd) || pmd_is_leaf(*old_pmd)) {
 			if (extent == HPAGE_PMD_SIZE &&
 			    move_pgt_entry(HPAGE_PMD, vma, old_addr, new_addr,
 					   old_pmd, new_pmd, need_rmap_locks))
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index ae5cc42aa208..891bea8062d2 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -235,8 +235,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 		 */
 		pmde = pmdp_get_lockless(pvmw->pmd);
 
-		if (pmd_trans_huge(pmde) || is_pmd_migration_entry(pmde) ||
-		    (pmd_present(pmde) && pmd_devmap(pmde))) {
+		if (pmd_is_leaf(pmde) || is_pmd_migration_entry(pmde)) {
 			pvmw->ptl = pmd_lock(mm, pvmw->pmd);
 			pmde = *pvmw->pmd;
 			if (!pmd_present(pmde)) {
@@ -251,7 +250,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 					return not_found(pvmw);
 				return true;
 			}
-			if (likely(pmd_trans_huge(pmde) || pmd_devmap(pmde))) {
+			if (likely(pmd_is_leaf(pmde))) {
 				if (pvmw->flags & PVMW_MIGRATION)
 					return not_found(pvmw);
 				if (!check_pmd(pmd_pfn(pmde), pvmw))
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index e9fc3f6774a6..c7b7a803f4ad 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -139,8 +139,7 @@ pmd_t pmdp_huge_clear_flush(struct vm_area_struct *vma, unsigned long address,
 {
 	pmd_t pmd;
 	VM_BUG_ON(address & ~HPAGE_PMD_MASK);
-	VM_BUG_ON(pmd_present(*pmdp) && !pmd_trans_huge(*pmdp) &&
-			   !pmd_devmap(*pmdp));
+	VM_BUG_ON(pmd_present(*pmdp) && !pmd_leaf(*pmdp));
 	pmd = pmdp_huge_get_and_clear(vma->vm_mm, address, pmdp);
 	flush_pmd_tlb_range(vma, address, address + HPAGE_PMD_SIZE);
 	return pmd;
@@ -247,7 +246,7 @@ pud_t pudp_huge_clear_flush(struct vm_area_struct *vma, unsigned long address,
 	pud_t pud;
 
 	VM_BUG_ON(address & ~HPAGE_PUD_MASK);
-	VM_BUG_ON(!pud_trans_huge(*pudp) && !pud_devmap(*pudp));
+	VM_BUG_ON(!pud_leaf(*pudp));
 	pud = pudp_huge_get_and_clear(vma->vm_mm, address, pudp);
 	flush_pud_tlb_range(vma, address, address + HPAGE_PUD_SIZE);
 	return pud;
@@ -293,7 +292,7 @@ pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
 		*pmdvalp = pmdval;
 	if (unlikely(pmd_none(pmdval) || is_pmd_migration_entry(pmdval)))
 		goto nomap;
-	if (unlikely(pmd_trans_huge(pmdval) || pmd_devmap(pmdval)))
+	if (unlikely(pmd_leaf(pmdval)))
 		goto nomap;
 	if (unlikely(pmd_bad(pmdval))) {
 		pmd_clear_bad(pmd);
-- 
2.45.0

